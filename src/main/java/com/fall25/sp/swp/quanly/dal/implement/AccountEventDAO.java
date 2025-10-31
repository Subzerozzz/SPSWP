/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.AccountEvent;
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
public class AccountEventDAO extends DBContext implements I_DAO<AccountEvent> {

    @Override
    public List<AccountEvent> findAll() {
        List<AccountEvent> accountEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_event";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                accountEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountEvents;
    }

    @Override
    public Map<Integer, AccountEvent> findAllMap() {
        Map<Integer, AccountEvent> accountEventMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_event";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                AccountEvent accountEvent = getFromResultSet(resultSet);
                accountEventMap.put(accountEvent.getId(), accountEvent);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountEventMap;
    }

    @Override
    public boolean update(AccountEvent accountEvent) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE account_event SET account_id = ?, event_id = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountEvent.getAccount_id());
            statement.setInt(2, accountEvent.getEvent_id());
            statement.setInt(3, accountEvent.getId());

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
    public boolean delete(AccountEvent accountEvent) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM account_event WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountEvent.getId());

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
    public int insert(AccountEvent accountEvent) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO account_event (account_id, event_id) VALUES (?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, accountEvent.getAccount_id());
            statement.setInt(2, accountEvent.getEvent_id());

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
    public AccountEvent getFromResultSet(ResultSet resultSet) throws SQLException {
        AccountEvent accountEvent = new AccountEvent();
        accountEvent.setId(resultSet.getInt("id"));
        accountEvent.setAccount_id(resultSet.getInt("account_id"));
        accountEvent.setEvent_id(resultSet.getInt("event_id"));
        return accountEvent;
    }

    @Override
    public AccountEvent findById(Integer id) {
        AccountEvent accountEvent = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_event WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                accountEvent = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountEvent;
    }

    public List<AccountEvent> findByAccountId(Integer accountId) {
        List<AccountEvent> accountEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_event WHERE account_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                accountEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountEvents;
    }

    public List<AccountEvent> findByEventId(Integer eventId) {
        List<AccountEvent> accountEvents = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM account_event WHERE event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                accountEvents.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return accountEvents;
    }

    public boolean deleteAccountEventByEventId(Integer eventId) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM account_event WHERE event_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            int rowsAffected = statement.executeUpdate();
            success = rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return success;
    }

    public static void main(String[] args) {
        for (AccountEvent accountEvent : new AccountEventDAO().findAll()) {
            System.out.println(accountEvent.toString());
        }
    }
}
