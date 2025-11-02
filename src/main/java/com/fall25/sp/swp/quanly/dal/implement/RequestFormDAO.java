package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.RequestForm;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RequestFormDAO extends DBContext implements I_DAO<RequestForm> {

    @Override
    public List<RequestForm> findAll() {
        List<RequestForm> requestForms = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_form";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestForms.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestForms;
    }

    @Override
    public Map<Integer, RequestForm> findAllMap() {
        Map<Integer, RequestForm> requestFormMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_form";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                RequestForm requestForm = getFromResultSet(resultSet);
                requestFormMap.put(requestForm.getId(), requestForm);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestFormMap;
    }

    @Override
    public boolean update(RequestForm t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE request_form SET club_id = ?, account_id_request = ?, account_id_president_new = ?, type_reason = ?, description = ?, status = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getClubID());
            statement.setInt(2, t.getAccountIdReq());

            if (t.getPresidentIdNew() != null) {
                statement.setInt(3, t.getPresidentIdNew());
            } else {
                statement.setNull(3, java.sql.Types.INTEGER);
            }

            statement.setString(4, t.getTypeReason().name()); // Sử dụng name() của enum
            statement.setString(5, t.getDescription());
            statement.setString(6, t.getStatus());
            statement.setInt(7, t.getId());

            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public boolean delete(RequestForm t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM request_form WHERE id = ?";
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
    public int insert(RequestForm t) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO request_form (club_id, account_id_request, account_id_president_new, type_reason, description, status) VALUES (?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, t.getClubID());
            statement.setInt(2, t.getAccountIdReq());

            if (t.getPresidentIdNew() != null) {
                statement.setInt(3, t.getPresidentIdNew());
            } else {
                statement.setNull(3, java.sql.Types.INTEGER);
            }

            statement.setString(4, t.getTypeReason().name()); // Sử dụng name() của enum
            statement.setString(5, t.getDescription());
            statement.setString(6, t.getStatus());
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
    public RequestForm getFromResultSet(ResultSet resultSet) throws SQLException {
        RequestForm requestForm = RequestForm.builder()
                .id(resultSet.getInt("id"))
                .clubID(resultSet.getInt("club_id"))
                .accountIdReq(resultSet.getInt("account_id_request"))
                .typeReason(RequestForm.ReasonType.fromString(resultSet.getString("type_reason"))) // Chuyển từ string sang enum
                .description(resultSet.getString("description"))
                .status(resultSet.getString("status"))
                .build();

        // Xử lý trường có thể null
        int presidentIdNew = resultSet.getInt("account_id_president_new");
        if (!resultSet.wasNull()) {
            requestForm.setPresidentIdNew(presidentIdNew);
        }

        return requestForm;
    }

    @Override
    public RequestForm findById(Integer id) {
        RequestForm requestForm = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_form WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                requestForm = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestForm;
    }

    // Các phương thức tìm kiếm bổ sung
    public List<RequestForm> findByClubId(Integer clubId) {
        List<RequestForm> requestForms = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_form WHERE club_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, clubId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestForms.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestForms;
    }

    public List<RequestForm> findByAccountIdRequest(Integer accountId) {
        List<RequestForm> requestForms = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_form WHERE account_id_request = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestForms.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestForms;
    }

    public List<RequestForm> findByTypeReason(RequestForm.ReasonType typeReason) {
        List<RequestForm> requestForms = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM request_form WHERE type_reason = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, typeReason.name());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                requestForms.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return requestForms;
    }

    public boolean deleteById(Integer id) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM request_form WHERE id = ?";
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
}