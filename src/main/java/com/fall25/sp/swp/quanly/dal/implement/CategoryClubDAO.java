/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.CategoryClub;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Dell
 */
public class CategoryClubDAO extends DBContext implements I_DAO<CategoryClub> {

  @Override
  public List<CategoryClub> findAll() {
    List<CategoryClub> account = new ArrayList<>();
    try {
      connection = getConnection();
      String sql = "SELECT * FROM categoryclub";
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
  public Map<Integer, CategoryClub> findAllMap() {
    Map<Integer, CategoryClub> categoryMap = new HashMap<>();
    try {
      connection = getConnection();
      String sql = "SELECT * FROM categoryclub";
      statement = connection.prepareStatement(sql);
      resultSet = statement.executeQuery();
      while (resultSet.next()) {
        CategoryClub category = getFromResultSet(resultSet);
        categoryMap.put(category.getId(), category);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return categoryMap;
  }

  @Override
  public boolean update(CategoryClub category) {
    boolean success = false;
    try {
      connection = getConnection();
      String sql = "UPDATE categoryclub SET name = ?, description = ? WHERE id = ?";
      statement = connection.prepareStatement(sql);
      statement.setString(1, category.getName());
      statement.setString(2, category.getDescription());
      statement.setInt(3, category.getId());

      int rowsAffected = statement.executeUpdate();
      success = rowsAffected > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return success;
  }

  @Override
  public boolean delete(CategoryClub category) {
    boolean success = false;
    try {
      connection = getConnection();
      String sql = "DELETE FROM categoryclub WHERE id = ?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, category.getId());

      int rowsAffected = statement.executeUpdate();
      success = rowsAffected > 0;
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return success;
  }

  @Override
  public int insert(CategoryClub category) {
    int generatedId = -1;
    try {
      connection = getConnection();
      String sql = "INSERT INTO categoryclub (name, description) VALUES (?, ?)";
      statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
      statement.setString(1, category.getName());
      statement.setString(2, category.getDescription());

      int rowsAffected = statement.executeUpdate();
      if (rowsAffected > 0) {
        ResultSet generatedKeys = statement.getGeneratedKeys();
        if (generatedKeys.next()) {
          generatedId = generatedKeys.getInt(1);
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
  public CategoryClub getFromResultSet(ResultSet resultSet) throws SQLException {
    CategoryClub category = new CategoryClub();
    category.setId(resultSet.getInt("id"));
    category.setName(resultSet.getString("name"));
    category.setDescription(resultSet.getString("description"));
    return category;
  }

  @Override
  public CategoryClub findById(Integer id) {
    CategoryClub category = null;
    try {
      connection = getConnection();
      String sql = "SELECT * FROM categoryclub WHERE id = ?";
      statement = connection.prepareStatement(sql);
      statement.setInt(1, id);
      resultSet = statement.executeQuery();
      if (resultSet.next()) {
        category = getFromResultSet(resultSet);
      }
    } catch (SQLException ex) {
      ex.printStackTrace();
    } finally {
      closeResources();
    }
    return category;
  }
}
