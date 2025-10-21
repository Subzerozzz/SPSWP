package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.Area;

import java.sql.*;
import java.util.*;

public class AreaDAO extends DBContext implements I_DAO<Area> {

    @Override
    public List<Area> findAll() {
        List<Area> list = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM area";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    @Override
    public Map<Integer, Area> findAllMap() {
        Map<Integer, Area> map = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM area";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Area area = getFromResultSet(resultSet);
                // Chuyển id String sang Integer nếu id là dạng số
                try {
                    map.put(Integer.parseInt(area.getId()), area);
                } catch (NumberFormatException e) {
                    // Nếu id không phải số thì có thể dùng hash
                    map.put(area.getId().hashCode(), area);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return map;
    }

    @Override
    public boolean update(Area area) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE area SET name = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, area.getName());
            statement.setString(2, area.getId());

            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    @Override
    public boolean delete(Area area) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM area WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, area.getId());
            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    @Override
    public int insert(Area area) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO area (id, name) VALUES (?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, area.getId());
            statement.setString(2, area.getName());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return generatedId;
    }

    @Override
    public Area getFromResultSet(ResultSet rs) throws SQLException {
        Area area = new Area();
        area.setId(rs.getString("id"));
        area.setName(rs.getString("name"));
        return area;
    }

    @Override
    public Area findById(Integer id) {
        Area area = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM area WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(id));
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                area = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return area;
    }

    // test nhanh
    public static void main(String[] args) {
    }
}
