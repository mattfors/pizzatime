package org.fors;

import com.ibatis.sqlmap.client.SqlMapClient;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        try {
            SqlMapClient sqlMapClient = org.fors.IBatisUtil.getSqlMapClient();
            String result =  (String) sqlMapClient.queryForObject("ExampleMapper.selectVersion");
            System.out.println("Result: " + result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}