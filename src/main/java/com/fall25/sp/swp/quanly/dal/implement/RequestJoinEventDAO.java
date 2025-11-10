package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.RequestJoinEvent;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.sql.Date;

public class RequestJoinEventDAO extends DBContext implements I_DAO<RequestJoinEvent> {

    @Override
    public List<RequestJoinEvent> findAll() {
        List<RequestJoinEvent> requestJoinEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvents;
    }

    @Override
    public Map<Integer, RequestJoinEvent> findAllMap() {
        Map<Integer, RequestJoinEvent> requestJoinEventMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RequestJoinEvent requestJoinEvent = getFromResultSet(resultSet);
                requestJoinEventMap.put(requestJoinEvent.getId(), requestJoinEvent);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEventMap;
    }

    @Override
    public boolean update(RequestJoinEvent t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE request_join_event SET account_id = ?, event_id = ?, status = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getAccountId());
            statement.setInt(2, t.getEventId());
            statement.setString(3, t.getStatus());
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
    public boolean delete(RequestJoinEvent t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM request_join_event WHERE id = ?";
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
    public int insert(RequestJoinEvent t) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO request_join_event (account_id, event_id, status, created_at) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, t.getAccountId());
            statement.setInt(2, t.getEventId());
            statement.setString(3, t.getStatus());

            // Set created_at
            Date today = new Date(System.currentTimeMillis());
            t.setCreated_at(today);
            statement.setDate(4, t.getCreated_at());

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
    public RequestJoinEvent getFromResultSet(ResultSet resultSet) throws SQLException {
        return RequestJoinEvent.builder()
                .id(resultSet.getInt("id"))
                .accountId(resultSet.getInt("account_id"))
                .eventId(resultSet.getInt("event_id"))
                .status(resultSet.getString("status"))
                .created_at(resultSet.getDate("created_at"))
                .build();
    }

    @Override
    public RequestJoinEvent findById(Integer id) {
        RequestJoinEvent requestJoinEvent = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                requestJoinEvent = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvent;
    }

    // Các phương thức tìm kiếm bổ sung
    public List<RequestJoinEvent> findByEventId(Integer eventId) {
        List<RequestJoinEvent> requestJoinEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event WHERE event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvents;
    }

    public List<RequestJoinEvent> findByAccountId(Integer accountId) {
        List<RequestJoinEvent> requestJoinEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event WHERE account_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvents;
    }

    public List<RequestJoinEvent> findByStatus(String status) {
        List<RequestJoinEvent> requestJoinEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event WHERE status = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvents;
    }

    public RequestJoinEvent findByAccountAndEvent(Integer accountId, Integer eventId) {
        RequestJoinEvent requestJoinEvent = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event WHERE account_id = ? AND event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            statement.setInt(2, eventId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                requestJoinEvent = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvent;
    }

    public boolean updateStatus(Integer id, String status) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE request_join_event SET status = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setInt(2, id);
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    public boolean deleteById(Integer id) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM request_join_event WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    public boolean existsByAccountAndEvent(Integer accountId, Integer eventId) {
        boolean exists = false;
        try {
            connection = getConnection();
            String sql = "SELECT COUNT(*) FROM request_join_event WHERE account_id = ? AND event_id = ?";
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

    // Lấy danh sách request theo eventId và status
    public List<RequestJoinEvent> findByEventIdAndStatus(Integer eventId, String status) {
        List<RequestJoinEvent> requestJoinEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_event WHERE event_id = ? AND status = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            statement.setString(2, status);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinEvents;
    }

    // Đếm số lượng request theo eventId và status
    public int countByEventIdAndStatus(Integer eventId, String status) {
        int count = 0;
        try {
            connection = getConnection();
            String sql = "SELECT COUNT(*) FROM request_join_event WHERE event_id = ? AND status = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            statement.setString(2, status);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return count;
    }


    public static void main(String[] args) {
        // Test method
        RequestJoinEvent request = new RequestJoinEvent();
        request.setAccountId(46);
        request.setEventId(1);
        request.setStatus("pending");

        RequestJoinEventDAO dao = new RequestJoinEventDAO();
        int insertedId = dao.insert(request);
        System.out.println("Inserted ID: " + insertedId);

        // Test find by eventId
        List<RequestJoinEvent> requests = dao.findByEventId(1);
        System.out.println("Requests for event 1: " + requests.size());
    }
}