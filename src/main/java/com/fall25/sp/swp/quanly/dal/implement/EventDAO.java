/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.Event;
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
public class EventDAO extends DBContext implements I_DAO<Event> {

    @Override
    public List<Event> findAll() {
        List<Event> events = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM event";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                events.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return events;
    }

    @Override
    public Map<Integer, Event> findAllMap() {
        Map<Integer, Event> eventMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM event";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Event event = getFromResultSet(resultSet);
                eventMap.put(event.getId(), event);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return eventMap;
    }

    @Override
    public boolean update(Event event) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE event SET area = ?, club_id = ?, status = ?, "
                    + "description = ?, start = ?, end = ?, updated_at = ? "
                    + "WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, event.getArea());
            statement.setInt(2, event.getClub_id());
            statement.setString(3, event.getStatus());
            statement.setString(4, event.getDescription());
            statement.setDate(5, event.getStart());
            statement.setDate(6, event.getEnd());
            statement.setDate(7, event.getUpdated_at());
            statement.setInt(8, event.getId());

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
    public boolean delete(Event event) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM event WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, event.getId());

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
    public int insert(Event event) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO event (area, club_id, status, description, "
                    + "start, end, created_at, updated_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, event.getArea());
            statement.setInt(2, event.getClub_id());
            statement.setString(3, event.getStatus());
            statement.setString(4, event.getDescription());
            statement.setDate(5, event.getStart());
            statement.setDate(6, event.getEnd());
            statement.setDate(7, event.getCreated_at());
            statement.setDate(8, event.getUpdated_at());

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
    public Event getFromResultSet(ResultSet resultSet) throws SQLException {
        Event event = new Event();
        event.setId(resultSet.getInt("id"));
        event.setArea(resultSet.getString("area"));
        event.setClub_id(resultSet.getInt("club_id"));
        event.setStatus(resultSet.getString("status"));
        event.setDescription(resultSet.getString("description"));
        event.setStart(resultSet.getDate("start"));
        event.setEnd(resultSet.getDate("end"));
        event.setCreated_at(resultSet.getDate("created_at"));
        event.setUpdated_at(resultSet.getDate("updated_at"));
        return event;
    }

    @Override
    public Event findById(Integer id) {
        Event event = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM event WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                event = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return event;
    }

    public List<Event> findByClubId(Integer clubId) {
        List<Event> events = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM event WHERE club_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, clubId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                events.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return events;
    }

    public static void main(String[] args) {
        for (Event event : new EventDAO().findByClubId(25)) {
            System.out.println(event.toString());
        }
    }
}
