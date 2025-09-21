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
import java.util.ArrayList;

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
    public Account getFromResultSet(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setId(rs.getInt("id"));
        account.setEmail(rs.getString("email"));
        account.setPassword(rs.getString("password"));
        account.setFullname(rs.getString("fullname"));
        account.setRole(rs.getString("role"));
        account.setPhone(rs.getString("phone"));
        account.setGender(rs.getString("gender"));
        account.setBod(rs.getDate("bod"));
        account.setCreated_at(rs.getDate("created_at"));
        account.setUpdated_at(rs.getDate("updated_at"));
        account.setStatus(rs.getString("status"));
        account.setAddress(rs.getString("address"));
        account.setStudent_id(rs.getString("student_id"));
        return account;
    }


    @Override
    public Account findById(Integer id) {
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        List<Account> list = dao.findAll();
        for (Account account : list) {
            System.out.println(account.toString());
        }
    }
    
    public static void main(String[] args) {
        for(Account a : new AccountDAO().findAll()){
            System.out.println(a.toString());
        }
    }
