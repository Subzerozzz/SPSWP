package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.Event;

import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

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
            String sql = "UPDATE event SET area_id = ?, club_id = ?, status = ?, "
                    + "description = ?, start = ?, end = ?, updated_at = ?, title = ? "
                    + "WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, event.getArea_id());
            statement.setInt(2, event.getClub_id());
            statement.setString(3, event.getStatus());
            statement.setString(4, event.getDescription());
            statement.setDate(5, event.getStart());
            statement.setDate(6, event.getEnd());
            statement.setDate(7, event.getUpdated_at());
            statement.setString(8, event.getTitle());
            statement.setInt(9, event.getId());

            int rowsAffected = statement.executeUpdate();
            success = rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    public boolean updateStart(Integer eventId, Date startDate) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE event SET start = ?, updated_at = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setDate(1, startDate);
            statement.setDate(2, new java.sql.Date(System.currentTimeMillis())); // updated_at = now
            statement.setInt(3, eventId);

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
            String sql = "INSERT INTO event (area_id, club_id, status, description, "
                    + "start, end, created_at, updated_at, title) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, event.getArea_id());
            statement.setInt(2, event.getClub_id());
            statement.setString(3, event.getStatus());
            statement.setString(4, event.getDescription());
            statement.setDate(5, event.getStart());
            statement.setDate(6, event.getEnd());
            statement.setDate(7, event.getCreated_at());
            statement.setDate(8, event.getUpdated_at());
            statement.setString(9, event.getTitle());

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
        event.setTitle(resultSet.getString("title"));
        event.setArea_id(resultSet.getInt("area_id"));
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

    // Lấy danh sách event đã duyệt (approved)
    public List<Event> getApprovedEvents() {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT area_id, start, end FROM event WHERE status = ? AND end >= CURRENT_DATE()";
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "approved");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Event e = new Event();
                e.setArea_id(rs.getInt("area_id"));
                e.setStart(rs.getDate("start"));
                e.setEnd(rs.getDate("end"));
                list.add(e);
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Event> getActiveOrPendingEvents() {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT area_id, start, end FROM event WHERE status IN ('pending', 'active') AND end >= CURRENT_DATE()";
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Event e = new Event();
                e.setArea_id(rs.getInt("area_id"));
                e.setStart(rs.getDate("start"));
                e.setEnd(rs.getDate("end"));
                list.add(e);
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }


    public static void main(String[] args) {
        EventDAO eventDAO = new EventDAO();
        Event event = new Event();
        event.setTitle("Test Event");
        event.setArea_id(1);
        event.setClub_id(16);
        event.setStatus("pending");
        event.setDescription("Description test");
        event.setStart(Date.valueOf(LocalDate.now()));
        event.setEnd(Date.valueOf(LocalDate.now().plusDays(1)));
        event.setCreated_at(Date.valueOf(LocalDate.now()));
        event.setUpdated_at(Date.valueOf(LocalDate.now()));
        System.out.println("Inserted ID: " + eventDAO.insert(event));
    }
}
