package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.AccountClub;

import java.sql.*;
import java.util.*;

public class AccountClubDAO extends DBContext implements I_DAO<AccountClub> {

    @Override
    public List<AccountClub> findAll() {
        List<AccountClub> list = new ArrayList<>();
        String sql = "SELECT id, accountId, clubId FROM account_club";
        try {
            connection = getConnection();
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
    public Map<Integer, AccountClub> findAllMap() {
        Map<Integer, AccountClub> map = new HashMap<>();
        String sql = "SELECT id, accountId, clubId FROM account_club";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                AccountClub ac = getFromResultSet(resultSet);
                map.put(ac.getId(), ac);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return map;
    }

    @Override
    public boolean update(AccountClub ac) {
        boolean success = false;
        String sql = "UPDATE account_club SET accountId = ?, clubId = ? WHERE id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, ac.getAccountId());
            statement.setInt(2, ac.getClubId());
            statement.setInt(3, ac.getId());
            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    @Override
    public boolean delete(AccountClub ac) {
        boolean success = false;
        String sql = "DELETE FROM account_club WHERE id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, ac.getId());
            success = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    @Override
    public int insert(AccountClub ac) {
        int generatedId = -1;
        String sql = "INSERT INTO account_club (accountId, clubId) VALUES (?, ?)";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, ac.getAccountId());
            statement.setInt(2, ac.getClubId());
            int rows = statement.executeUpdate();
            if (rows > 0) {
                resultSet = statement.getGeneratedKeys();
                if (resultSet.next()) {
                    generatedId = resultSet.getInt(1);
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
    public AccountClub getFromResultSet(ResultSet rs) throws SQLException {
        AccountClub ac = new AccountClub();
        ac.setId(rs.getInt("id"));
        ac.setAccountId(rs.getInt("accountId"));
        ac.setClubId(rs.getInt("clubId"));
        return ac;
    }

    @Override
    public AccountClub findById(Integer id) {
        AccountClub ac = null;
        String sql = "SELECT id, accountId, clubId FROM account_club WHERE id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                ac = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return ac;
    }

    // Lấy tất cả Account trong 1 Club
    public List<AccountClub> findByClubId(Integer clubId) {
        List<AccountClub> list = new ArrayList<>();
        String sql = "SELECT id, accountId, clubId FROM account_club WHERE clubId = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, clubId);
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
}
