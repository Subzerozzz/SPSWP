/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.Account;
import static java.sql.DriverManager.getConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Dell
 */
public class AccountDAO extends DBContext implements I_DAO<Account> {

    @Override
    public List<Account> findAll() {
        List<Account> account = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM Account";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                account.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return account;
    }

    @Override
    public Map<Integer, Account> findAllMap() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account getFromResultSet(ResultSet resultSet) throws SQLException {
        Account account = new Account();
        account.setId(resultSet.getInt("id"));
        account.setEmail(resultSet.getString("email"));
        account.setUsername(resultSet.getString("username"));
        return account;
    }

    @Override
    public Account findById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        for(Account a : new AccountDAO().findAll()){
            System.out.println(a.toString());
        }
    }
}
