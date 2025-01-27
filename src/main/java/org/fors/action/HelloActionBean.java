package org.fors.action;

import com.ibatis.sqlmap.client.SqlMapClient;
import net.sourceforge.stripes.action.*;
import org.fors.IBatisUtil;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

@UrlBinding("/hello.action")
public class HelloActionBean implements ActionBean {
    private ActionBeanContext context;
    private String javaVersion;
    private String serverVersion;
    private String sqlVersion;
    private List<String> schemas;
    private List<Map<String, String>> tablesAndColumns;

    public String getServerVersion() {
        return serverVersion;
    }

    public void setServerVersion(String serverVersion) {
        this.serverVersion = serverVersion;
    }

    public String getJavaVersion() {
        return javaVersion;
    }

    public void setJavaVersion(String javaVersion) {
        this.javaVersion = javaVersion;
    }

    public String getSqlVersion() {
        return sqlVersion;
    }

    public void setSqlVersion(String sqlVersion) {
        this.sqlVersion = sqlVersion;
    }

    public List<String> getSchemas() {
        return schemas;
    }

    public void setSchemas(List<String> schemas) {
        this.schemas = schemas;
    }

    public List<Map<String, String>> getTablesAndColumns() {
        return tablesAndColumns;
    }

    public void setTablesAndColumns(List<Map<String, String>> tablesAndColumns) {
        this.tablesAndColumns = tablesAndColumns;
    }

    @Override
    public ActionBeanContext getContext() {
        return context;
    }

    @Override
    public void setContext(ActionBeanContext context) {
        this.context = context;
    }

    @DefaultHandler
    public Resolution hello() {
        try {
            SqlMapClient sqlMapClient = IBatisUtil.getSqlMapClient();
            sqlVersion = (String) sqlMapClient.queryForObject("ExampleMapper.selectVersion");
            javaVersion = System.getProperty("java.version");
            serverVersion = getServletContext().getServerInfo();
            schemas = sqlMapClient.queryForList("ExampleMapper.selectSchemas");
            tablesAndColumns = sqlMapClient.queryForList("ExampleMapper.selectTablesAndColumns");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ForwardResolution("/WEB-INF/jsp/hello.jsp");
    }

    private ServletContext getServletContext() {
        return context.getServletContext();
    }
}