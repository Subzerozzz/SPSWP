package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import java.sql.*;
import java.util.*;

public class TaskDAO extends DBContext implements I_DAO<Map<String, Object>> {

    @Override
    public List<Map<String, Object>> findAll() {
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM task";
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
    public Map<Integer, Map<String, Object>> findAllMap() {
        Map<Integer, Map<String, Object>> map = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM task";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Map<String, Object> task = getFromResultSet(resultSet);
                map.put((Integer) task.get("id"), task);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return map;
    }

    @Override
    public boolean update(Map<String, Object> task) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE task SET name = ?, description = ?, account_id = ?, updated_at = NOW() WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, (String) task.get("name"));
            statement.setString(2, (String) task.get("description"));
            statement.setInt(3, (Integer) task.get("account_id"));
            statement.setInt(4, (Integer) task.get("id"));

            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    // Trong TaskDAO
    public boolean updateTaskWithEventCheck(Integer taskId, Integer eventId, String name, String description) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE task SET name = ?, description = ?, updated_at = NOW() WHERE id = ? AND event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setInt(3, taskId);
            statement.setInt(4, eventId); // Kiểm tra event_id

            int rowsAffected = statement.executeUpdate();
            success = rowsAffected > 0;

            if (!success) {
                System.out.println("No task found with id: " + taskId + " in event: " + eventId);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    @Override
    public boolean delete(Map<String, Object> task) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM task WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, (Integer) task.get("id"));
            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    @Override
    public int insert(Map<String, Object> task) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO task (event_id, name, description, account_id, created_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())";
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, (Integer) task.get("event_id"));
            statement.setString(2, (String) task.get("name"));
            statement.setString(3, (String) task.get("description"));
            statement.setInt(4, (Integer) task.get("account_id"));

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
    public Map<String, Object> getFromResultSet(ResultSet rs) throws SQLException {
        Map<String, Object> task = new HashMap<>();
        task.put("id", rs.getInt("id"));
        task.put("event_id", rs.getInt("event_id"));
        task.put("name", rs.getString("name"));
        task.put("description", rs.getString("description"));
        task.put("account_id", rs.getInt("account_id"));
        task.put("created_at", rs.getTimestamp("created_at"));
        task.put("updated_at", rs.getTimestamp("updated_at"));
        return task;
    }

    @Override
    public Map<String, Object> findById(Integer id) {
        Map<String, Object> task = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM task WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                task = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return task;
    }

    // Các method đặc biệt cho Task
    public List<Map<String, Object>> findByEventId(Integer eventId) {
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT t.*, a.fullname as account_name " +
                    "FROM task t " +
                    "INNER JOIN account a ON t.account_id = a.id " +
                    "WHERE t.event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Map<String, Object> task = getFromResultSet(resultSet);
                task.put("account_name", resultSet.getString("account_name"));
                list.add(task);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Map<String, Object>> findByAccountId(Integer accountId) {
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM task WHERE account_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
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

    // Method insert trực tiếp không cần Map object
    public boolean insertTaskDirect(String name, Integer eventId, String description, Integer accountId) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "INSERT INTO task (event_id, name, description, account_id, created_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            statement.setString(2, name);
            statement.setString(3, description);
            statement.setInt(4, accountId);

            int rowsAffected = statement.executeUpdate();
            success = rowsAffected > 0;

            System.out.println("Insert task - Rows affected: " + rowsAffected);

        } catch (SQLException ex) {
            System.out.println("SQL Error inserting task: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    // Cập nhật task name và description
    public boolean updateTaskInfo(Integer taskId, String name, String description) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE task SET name = ?, description = ?, updated_at = NOW() WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setInt(3, taskId);

            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    // Kiểm tra xem account đã có task trong event chưa
    public boolean isAccountHasTaskInEvent(Integer accountId, Integer eventId) {
        boolean exists = false;
        try {
            connection = getConnection();
            String sql = "SELECT COUNT(*) FROM task WHERE account_id = ? AND event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            statement.setInt(2, eventId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                exists = resultSet.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return exists;
    }

    // Xóa task theo id
    public boolean deleteTaskById(Integer taskId) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM task WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, taskId);
            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    // test nhanh
    public static void main(String[] args) {
        TaskDAO taskDAO = new TaskDAO();

        // Test insert trực tiếp
        boolean success = taskDAO.insertTaskDirect("Test Task", 1, "Test Description", 1);
        System.out.println("Insert test: " + success);

        // Test find by event
        List<Map<String, Object>> tasks = taskDAO.findByEventId(1);
        System.out.println("Tasks for event 1: " + tasks.size());

        for (Map<String, Object> task : tasks) {
            System.out.println("Task: " + task.get("name") + " - " + task.get("description"));
        }
    }
}