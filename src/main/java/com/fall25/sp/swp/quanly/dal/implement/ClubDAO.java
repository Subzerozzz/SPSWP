/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fall25.sp.swp.quanly.dal.implement;

import com.fall25.sp.swp.quanly.dal.DBContext;
import com.fall25.sp.swp.quanly.dal.I_DAO;
import com.fall25.sp.swp.quanly.entity.Club;
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
public class ClubDAO extends DBContext implements I_DAO<Club> {

    @Override
    public List<Club> findAll() {
        List<Club> listClub = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM club";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                listClub.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return listClub;
    }

    @Override
    public Map<Integer, Club> findAllMap() {
        Map<Integer, Club> clubMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM club";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Club club = getFromResultSet(resultSet);
                clubMap.put(club.getId(), club);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return clubMap;
    }

    @Override
    public boolean update(Club club) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "UPDATE club SET name = ?, description = ?, updated_at = ?, "
                    + "president_id = ?, category_id = ?, status = ?, logo_img = ? "
                    + "WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, club.getName());
            statement.setString(2, club.getDescription());
            statement.setDate(3, club.getUpdated_at());
            statement.setInt(4, club.getPresident_id());
            statement.setInt(5, club.getCategory_id());
            statement.setString(6, club.getStatus());
            statement.setString(7, club.getLogo_img());
            statement.setInt(8, club.getId());

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
    public boolean delete(Club club) {
        boolean success = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM club WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, club.getId());

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
    public int insert(Club club) {
        int generatedId = -1;
        try {
            connection = getConnection();
            String sql = "INSERT INTO club (name, description, created_at, updated_at, "
                    + "president_id, category_id, status, logo_img) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, club.getName());
            statement.setString(2, club.getDescription());
            statement.setDate(3, club.getCreated_at());
            statement.setDate(4, club.getUpdated_at());
            statement.setInt(5, club.getPresident_id());
            statement.setInt(6, club.getCategory_id());
            statement.setString(7, club.getStatus());
            statement.setString(8, club.getLogo_img());

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
    public Club getFromResultSet(ResultSet resultSet) throws SQLException {
        Club club = new Club();
        club.setId(resultSet.getInt("id"));
        club.setName(resultSet.getString("name"));
        club.setDescription(resultSet.getString("description"));
        club.setCreated_at(resultSet.getDate("created_at"));
        club.setUpdated_at(resultSet.getDate("updated_at"));
        club.setPresident_id(resultSet.getInt("president_id"));
        club.setCategory_id(resultSet.getInt("category_id"));
        club.setStatus(resultSet.getString("status"));
        club.setLogo_img(resultSet.getString("logo_img"));
        return club;
    }

    @Override
    public Club findById(Integer id) {
        Club club = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM club WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                club = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return club;
    }

    public Club findByPresidentId(Integer id) {
        Club club = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM club WHERE president_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                club = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return club;
    }

    public List<Club> findRecordPerPage(int i, Integer limit) {
        List<Club> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM club\n"
                + "ORDER BY id DESC\n"
                + "LIMIT ? OFFSET ?;";
        // Tính số bản ghi cần bỏ qua
        Integer recordOffset = (i - 1) * limit;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, limit);
            statement.setInt(2, recordOffset);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(getFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Club> filter(String name, String status, Integer categoryId, Integer i, Integer limit) {
        List<Club> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT c.*\n"
                + "FROM club c\n"
                + "WHERE 1 = 1");

        if (name != null && !name.isEmpty()) {
            sql.append(" AND c.name LIKE ?");
        }
        if (status != null && !status.isEmpty()) {
            sql.append(" AND c.status LIKE ?");
        }
        if (categoryId != null && categoryId > 0) {
            sql.append(" AND c.category_id = ?");
        }

        //  Thêm sắp xếp mới nhất lên đầu
        sql.append(" ORDER BY c.id DESC");

        // Thêm phân trang
        sql.append(" LIMIT ? OFFSET ?");
        // Tính số bản ghi cần bỏ qua 
        Integer recordOffset = (i - 1) * limit;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql.toString());
            //Khởi tạo 1 bien index de chay theo cac bien
            int index = 1;
            if (name != null && !name.isEmpty()) {
                statement.setString(index++, "%" + name + "%");
            }
            if (status != null && !status.isEmpty()) {
                statement.setString(index++, "%" + status + "%");
            }
            if (categoryId != null && categoryId > 0) {
                statement.setInt(index++, categoryId);
            }
            statement.setInt(index++, limit);
            statement.setInt(index, recordOffset);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(getFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            closeResources();
        }
        return list;
    }

    public List<Club> filterAll(String name, String status, Integer categoryId) {
        List<Club> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT c.*\n"
                + "FROM club c\n"
                + "WHERE 1 = 1");

        if (name != null && !name.isEmpty()) {
            sql.append(" AND c.name LIKE ?");
        }
        if (status != null && !status.isEmpty()) {
            sql.append(" AND c.status LIKE ?");
        }
        if (categoryId != null && categoryId > 0) {
            sql.append(" AND c.category_id = ?");
        }
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql.toString());
            //Khởi tạo 1 bien index de chay theo cac bien
            int index = 1;
            if (name != null && !name.isEmpty()) {
                statement.setString(index++, "%" + name + "%");
            }
            if (status != null && !status.isEmpty()) {
                statement.setString(index++, "%" + status + "%");
            }
            if (categoryId != null && categoryId > 0) {
                statement.setInt(index++, categoryId);
            }

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(getFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            closeResources();
        }
        return list;
    }

    public static void main(String[] args) {
        ClubDAO clubDAO = new ClubDAO();
        System.out.println(clubDAO.filter("", "active", 1, 1, 10).size());
    }

}
