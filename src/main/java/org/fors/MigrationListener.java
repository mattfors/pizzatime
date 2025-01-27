package org.fors;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MigrationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            MigrationUtility.runMigrations();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // No action needed on context destruction
    }
}