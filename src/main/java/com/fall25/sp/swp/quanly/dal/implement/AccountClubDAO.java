/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.dal.implement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.AccountClub;

/**
 *
 * @author Dell
 */
public class AccountClubDAO extends DBContext implements I_DAO<AccountClub> {

  @Override
  public List<AccountClub> findAll() {
    List<AccountClub> accountClub = new ArrayList<>();
    try {
      connection = getConnection();
      String sql = "SELECT * FROM account_club";
      statement = connection.prepareStatement(sql);
      resultSet = statement.executeQuery();
      while (resultSet.next()) {
        accountClub.add(getFromResultSet(resultSet));
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return accountClub;
  }

  @Override
  public Map<Integer, AccountClub> findAllMap() {
    Map<Integer, AccountClub> accountClubMap = new HashMap<>();
    try {
      connection = getConnection();
      String sql = "SELECT * FROM account_club";
      statement = connection.prepareStatement(sql);
      resultSet = statement.executeQuery();
      while (resultSet.next()) {
        AccountClub accountClub = getFromResultSet(resultSet);
        accountClubMap.put(accountClub.getId(), accountClub);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return accountClubMap;
  }

  @Override
  public boolean update(AccountClub t) {
    boolean result = false;
    try {
      connection = getConnection();
      String sql = "UPDATE account_club SET account_id = ?, club_id = ?, role = ? WHERE id = ?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, t.getAccount_id());
      statement.setInt(2, t.getClub_id());
      statement.setString(3, t.getRole());
      statement.setInt(4, t.getId());
      result = statement.executeUpdate() > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return result;
  }

  @Override
  public boolean delete(AccountClub t) {
    boolean result = false;
    try {
      connection = getConnection();
      String sql = "DELETE FROM account_club WHERE id = ?";
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
  public int insert(AccountClub t) {
    int generatedId = -1;
    try {
      connection = getConnection();
      String sql = "INSERT INTO account_club (account_id, club_id, role) VALUES (?, ?, ?)";
      statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
      statement.setInt(1, t.getAccount_id());
      statement.setInt(2, t.getClub_id());
      statement.setString(3, t.getRole());
      statement.executeUpdate();

      resultSet = statement.getGeneratedKeys();
      if (resultSet.next()) {
        generatedId = resultSet.getInt(1);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return generatedId;
  }

  @Override
  public AccountClub getFromResultSet(ResultSet resultSet) throws SQLException {
    AccountClub accountClub = new AccountClub();
    accountClub.setId(resultSet.getInt("id"));
    accountClub.setAccount_id(resultSet.getInt("account_id"));
    accountClub.setClub_id(resultSet.getInt("club_id"));
    accountClub.setRole(resultSet.getString("role"));
    return accountClub;
  }

  @Override
  public AccountClub findById(Integer id) {
    AccountClub accountClub = null;
    try {
      connection = getConnection();
      String sql = "SELECT * FROM account_club WHERE id = ?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, id);
      resultSet = statement.executeQuery();
      if (resultSet.next()) {
        accountClub = getFromResultSet(resultSet);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return accountClub;
  }

  public List<AccountClub> findByAccountId(Integer accountId) {
    List<AccountClub> accountClubs = new ArrayList<>();
    try {
      connection = getConnection();
      String sql = "SELECT * FROM account_club WHERE account_id = ?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, accountId);
      resultSet = statement.executeQuery();
      while (resultSet.next()) {
        accountClubs.add(getFromResultSet(resultSet));
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return accountClubs;
  }

  public List<AccountClub> findByClubId(Integer clubId) {
        List<AccountClub> accountClubs = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_club WHERE club_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, clubId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                accountClubs.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountClubs;
    }

  public AccountClub findByAccountIdAndClubId(Integer accountId, Integer clubId) {
       AccountClub accountClub = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_club WHERE account_id =? AND club_id =?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            statement.setInt(2, clubId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                accountClub = getFromResultSet(resultSet);
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountClub;
    }
}
