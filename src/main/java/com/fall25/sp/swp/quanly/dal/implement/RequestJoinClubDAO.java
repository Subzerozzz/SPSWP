package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.RequestJoinClub;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.sql.Date;

public class RequestJoinClubDAO extends DBContext implements I_DAO<RequestJoinClub> {

    @Override
    public List<RequestJoinClub> findAll() {
        List<RequestJoinClub> requestJoinClubs = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinClubs.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClubs;
    }

    @Override
    public Map<Integer, RequestJoinClub> findAllMap() {
        Map<Integer, RequestJoinClub> requestJoinClubMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RequestJoinClub requestJoinClub = getFromResultSet(resultSet);
                requestJoinClubMap.put(requestJoinClub.getId(), requestJoinClub);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClubMap;
    }

    @Override
    public boolean update(RequestJoinClub t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE request_join_club SET account_id = ?, club_id = ?, self = ?, reason = ?, status = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getAccountId());
            statement.setInt(2, t.getClubId());
            statement.setString(3, t.getSelf());
            statement.setString(4, t.getReason());
            statement.setString(5, t.getStatus());
            statement.setInt(6, t.getId());

            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public boolean delete(RequestJoinClub t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM request_join_club WHERE id = ?";
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
    public int insert(RequestJoinClub t) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO request_join_club (account_id, club_id, self, reason, status, created_at) VALUES (?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, t.getAccountId());
            statement.setInt(2, t.getClubId());
            statement.setString(3, t.getSelf());
            statement.setString(4, t.getReason());
            statement.setString(5, t.getStatus());
            Date today = new Date(System.currentTimeMillis());
            t.setCreated_at(today);
            statement.setDate(6,t.getCreated_at());
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
    public RequestJoinClub getFromResultSet(ResultSet resultSet) throws SQLException {
        return RequestJoinClub.builder()
                .id(resultSet.getInt("id"))
                .accountId(resultSet.getInt("account_id"))
                .clubId(resultSet.getInt("club_id"))
                .self(resultSet.getString("self"))
                .reason(resultSet.getString("reason"))
                .status(resultSet.getString("status"))
                .created_at(resultSet.getDate("created_at"))
                .build();
    }

    @Override
    public RequestJoinClub findById(Integer id) {
        RequestJoinClub requestJoinClub = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                requestJoinClub = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClub;
    }

    // Các phương thức tìm kiếm bổ sung
    public List<RequestJoinClub> findByClubId(Integer clubId) {
        List<RequestJoinClub> requestJoinClubs = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club WHERE club_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, clubId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinClubs.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClubs;
    }

    public List<RequestJoinClub> findByAccountId(Integer accountId) {
        List<RequestJoinClub> requestJoinClubs = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club WHERE account_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinClubs.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClubs;
    }

    public List<RequestJoinClub> findByStatus(String status) {
        List<RequestJoinClub> requestJoinClubs = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club WHERE status = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestJoinClubs.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClubs;
    }

    public RequestJoinClub findByAccountAndClub(Integer accountId, Integer clubId) {
        RequestJoinClub requestJoinClub = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_join_club WHERE account_id = ? AND club_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            statement.setInt(2, clubId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                requestJoinClub = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestJoinClub;
    }

    public boolean updateStatus(Integer id, String status) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE request_join_club SET status = ? WHERE id = ?";
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
            String sql = "DELETE FROM request_join_club WHERE id = ?";
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

    public boolean existsByAccountAndClub(Integer accountId, Integer clubId) {
        boolean exists = false;
        try {
            connection = getConnection();
            String sql = "SELECT COUNT(*) FROM request_join_club WHERE account_id = ? AND club_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            statement.setInt(2, clubId);
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

    public static void main(String[] args) {
        RequestJoinClub re = new RequestJoinClub();
        re.setAccountId(46);
        re.setClubId(16);
        re.setSelf("shdgfusdgfsdf");
        re.setReason("sjsjgfghsdfshfds");
        re.setStatus("pending");
        System.out.println(new RequestJoinClubDAO().insert(re));
    }
}
