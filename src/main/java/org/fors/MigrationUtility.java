package org.fors;

import org.apache.log4j.Logger;
import io.github.cdimascio.dotenv.Dotenv;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MigrationUtility {

    private static final Logger logger = Logger.getLogger(MigrationUtility.class);
    private static final String MIGRATION_DIR = "migrations";

    public static void runMigrations() throws ClassNotFoundException {
        Dotenv dotenv = Dotenv.load();
        String jdbcUrl = dotenv.get("MYSQL_CONNECTION_URL");
        String jdbcUser = dotenv.get("MYSQL_USER");
        String jdbcPassword = dotenv.get("MYSQL_PASSWORD");

        URL migrationDirUrl = MigrationUtility.class.getClassLoader().getResource(MIGRATION_DIR);

        if (migrationDirUrl != null) {
            File migrationDir = new File(migrationDirUrl.getFile());
            if (migrationDir.exists() && migrationDir.isDirectory()) {
                logger.debug(String.format("Migration directory found: %s", migrationDir.getAbsolutePath()));
                File[] sqlFiles = migrationDir.listFiles((dir, name) -> name.endsWith(".sql"));

                if (sqlFiles != null) {
                    logger.debug(String.format("Number of SQL files found: %d", sqlFiles.length));
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword)) {
                        createMigrationLogTable(connection);
                        for (File sqlFile : sqlFiles) {
                            String fileName = sqlFile.getName();
                            if (!isMigrationExecuted(connection, fileName)) {
                                try {
                                    logger.info(String.format("event=\"Migration Start\", file=\"%s\"", fileName));
                                    String sql = new String(Files.readAllBytes(sqlFile.toPath()));
                                    String[] sqlStatements = sql.split(";");
                                    for (String statement : sqlStatements) {
                                        if (!statement.trim().isEmpty()) {
                                            try (Statement stmt = connection.createStatement()) {
                                                logger.debug(String.format("Executing SQL: %s", statement));
                                                stmt.execute(statement.trim());
                                            }
                                        }
                                    }
                                    insertLog(connection, fileName);
                                    logger.info(String.format("event=\"Migration Success\", file=\"%s\"", fileName));
                                } catch (IOException | SQLException e) {
                                    logger.error(String.format("event=\"Migration Error\", file=\"%s\"", fileName), e);
                                }
                            } else {
                                logger.info(String.format("event=\"Migration Skipped\", file=\"%s\"", fileName));
                            }
                        }
                    } catch (SQLException e) {
                        logger.error("event=\"Database Connection Error\"", e);
                    }
                } else {
                    logger.debug("No SQL files found in the migration directory.");
                }
            } else {
                logger.debug(String.format("Migration directory not found: %s", migrationDir.getAbsolutePath()));
            }
        } else {
            logger.debug("Migration directory URL is null.");
        }
    }

    private static void createMigrationLogTable(Connection connection) throws SQLException {
        String createTableSQL = "CREATE TABLE IF NOT EXISTS migration_log (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "file_name VARCHAR(255) NOT NULL, " +
                "executed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)";
        try (Statement stmt = connection.createStatement()) {
            stmt.execute(createTableSQL);
        }
    }

    private static void insertLog(Connection connection, String fileName) throws SQLException {
        String insertLogSQL = "INSERT INTO migration_log (file_name) VALUES (?)";
        try (PreparedStatement pstmt = connection.prepareStatement(insertLogSQL)) {
            pstmt.setString(1, fileName);
            pstmt.executeUpdate();
        }
    }

    private static boolean isMigrationExecuted(Connection connection, String fileName) throws SQLException {
        String checkLogSQL = "SELECT COUNT(*) FROM migration_log WHERE file_name = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(checkLogSQL)) {
            pstmt.setString(1, fileName);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}