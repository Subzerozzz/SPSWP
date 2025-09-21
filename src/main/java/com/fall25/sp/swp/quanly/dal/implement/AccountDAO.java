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
import java.util.HashMap;

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
      String sql = "SELECT * FROM account";
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
    Map<Integer, Account> accountMap = new HashMap<>();
    try {
      connection = getConnection();
      String sql = "SELECT * FROM account";
      statement = connection.prepareStatement(sql);
      resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Account account = getFromResultSet(resultSet);
        accountMap.put(account.getId(), account);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return accountMap;
  }

  @Override
  public boolean update(Account t) {
    boolean result = false;
    try {
      connection = getConnection();
      String sql = "UPDATE account SET email=?, password=?, fullname=?, role=?, phone=?, gender=?, bod=?, updated_at=?, status=?, address=?, student_id=? WHERE id=?";
      statement = connection.prepareStatement(sql);
      statement.setString(1, t.getEmail());
      statement.setString(2, t.getPassword());
      statement.setString(3, t.getFullname());
      statement.setString(4, t.getRole());
      statement.setString(5, t.getPhone());
      statement.setString(6, t.getGender());
      statement.setDate(7, new java.sql.Date(t.getBod().getTime()));
      statement.setDate(8, new java.sql.Date(new java.util.Date().getTime())); // current date for updated_at
      statement.setString(9, t.getStatus());
      statement.setString(10, t.getAddress());
      statement.setString(11, t.getStudent_id());
      statement.setInt(12, t.getId());
      result = statement.executeUpdate() > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return result;
  }

  @Override
  public boolean delete(Account t) {
    boolean result = false;
    try {
      connection = getConnection();
      String sql = "DELETE FROM account WHERE id=?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, t.getId());
      result = statement.executeUpdate() > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return result;
  }

  @Override
  public int insert(Account t) {
    int generatedId = -1;
    try {
      connection = getConnection();
      String sql = "INSERT INTO account (email, password, fullname, role, phone, gender, bod, created_at, updated_at, status, address, student_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
      statement.setString(1, t.getEmail());
      statement.setString(2, t.getPassword());
      statement.setString(3, t.getFullname());
      statement.setString(4, t.getRole());
      statement.setString(5, t.getPhone());
      statement.setString(6, t.getGender());
      statement.setDate(7, t.getBod() != null ? new java.sql.Date(t.getBod().getTime()) : null);
      java.util.Date currentDate = new java.util.Date();
      java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
      statement.setDate(8, sqlDate); // created_at
      statement.setDate(9, sqlDate); // updated_at
      statement.setString(10, t.getStatus());
      statement.setString(11, t.getAddress());
      statement.setString(12, t.getStudent_id());

      int affectedRows = statement.executeUpdate();
      if (affectedRows > 0) {
        ResultSet rs = statement.getGeneratedKeys();
        if (rs.next()) {
          generatedId = rs.getInt(1);
        }
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return generatedId;
  }

  @Override
  public Account findById(Integer id) {
    Account account = null;
    try {
      connection = getConnection();
      String sql = "SELECT * FROM account WHERE id=?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, id);
      resultSet = statement.executeQuery();
      if (resultSet.next()) {
        account = getFromResultSet(resultSet);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return account;
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

  public static void main(String[] args) {
    AccountDAO dao = new AccountDAO();
    List<Account> list = dao.findAll();
    for (Account account : list) {
      System.out.println(account.toString());
    }
  }
}