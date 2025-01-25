package org.fors;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.ibatis.sqlmap.engine.builder.xml.SqlMapConfigParser;
import io.github.cdimascio.dotenv.Dotenv;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

public class IBatisUtil {
    private static SqlMapClient sqlMapClient;

    static {
        try {
            // Load environment variables
            Dotenv dotenv = Dotenv.load();

            // Retrieve environment variables
            String jdbcDriver = "com.mysql.cj.jdbc.Driver";
            String jdbcConnectionURL = dotenv.get("MYSQL_CONNECTION_URL");
            String jdbcUsername = dotenv.get("MYSQL_USER");
            String jdbcPassword = dotenv.get("MYSQL_PASSWORD");

            // Log the values to check if they are loaded correctly
            System.out.println("JDBC Connection URL: " + jdbcConnectionURL);
            System.out.println("JDBC Username: " + jdbcUsername);
            System.out.println("JDBC Password: " + jdbcPassword);

            // Set properties from environment variables
            Properties props = new Properties();
            props.setProperty("JDBC.Driver", jdbcDriver);
            props.setProperty("JDBC.ConnectionURL", jdbcConnectionURL);
            props.setProperty("JDBC.Username", jdbcUsername);
            props.setProperty("JDBC.Password", jdbcPassword);

            // Load the SQL Map configuration
            SqlMapConfigParser configParser = new SqlMapConfigParser();
            Reader reader = Resources.getResourceAsReader("sql-map-config.xml");
            sqlMapClient = configParser.parse(reader, props);
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static SqlMapClient getSqlMapClient() {
        return sqlMapClient;
    }
}