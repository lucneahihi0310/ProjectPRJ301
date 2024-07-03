/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customers;
import model.Product;

/**
 *
 * @author KinNhun
 */
public class CustomersDAO extends DBContext {

    public boolean checkUser(String accountName, String password) {
        String sql = "SELECT * FROM Customers WHERE account_name = ? AND password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accountName);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            // Kiểm tra xem có dòng kết quả nào không
            if (rs.next()) {
                // Có người dùng với tên tài khoản và mật khẩu tương ứng
                return true;
            } else {
                // Không có người dùng tương ứng
                return false;
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        }

        return false; // Trả về false nếu có lỗi xảy ra
    }

    public Customers login(String account_name, String password) {
        String sql = "SELECT * FROM Customers WHERE account_name = ? AND password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account_name);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customers(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8));
            }

        } catch (SQLException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        }
        return null;

    }

    public Customers getAccount(String account_name, String password) {
        String sql = "SELECT * FROM Customers WHERE account_name = ? AND password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account_name);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customers(rs.getInt("account_id"), // Điều chỉnh index cột dựa trên tên cột hoặc sử dụng alias nếu cần thiết
                        rs.getString("account_name"),
                        rs.getString("password"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getInt("role_id"));
            }

        } catch (SQLException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        }
        return null;

    }

    public Customers insertCustomers(String account_name, String password, String customer_name, String phone, String address, String email) {
        String sql = "INSERT INTO Customers (account_name, password, customer_name, phone, address, email) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, account_name);
            ps.setString(2, password);
            ps.setString(3, customer_name);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, email);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int customerId = generatedKeys.getInt(1);
                    // Retrieve and return the newly inserted customer
                    return new Customers(customerId, account_name, customer_name, phone, address, email, password, 0);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Customers checkCustomersExit(String account_name) {
        String sql = "SELECT * FROM Customers WHERE account_name = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account_name);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Khách hàng tồn tại, trả về thông tin của khách hàng
                return new Customers(rs.getInt("account_id"),
                        rs.getString("account_name"),
                        rs.getString("password"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getInt("role_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu khách hàng không tồn tại
    }

    public void updateProfile(int customerId, String fullName, String phone, String address, String email, String password) {
        String sql = "  UPDATE Customers SET [customer_name] = ?, [phone] = ?, [address] = ?, [email] = ?, [password] = ? WHERE [account_id] = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setInt(6, customerId);
            int rs = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions or log errors here
        }
    }

    public Customers getAccountByID(int id) {
        String sql = "SELECT * FROM Customers WHERE account_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Customers(rs.getInt("account_id"),
                        rs.getString("account_name"),
                        rs.getString("password"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getInt("role_id"));
            }

        } catch (SQLException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        CustomersDAO customersDAO = new CustomersDAO();
        //  Customers newCustomer = customersDAO.insertCustomers("new_account", "new_password", "New Customer", "123456789", "123 Main St", "new@email.com");

        //   customersDAO.updateProfile(1, "Updated Customer", "9876543210", "456 Elm St", "updatedcustomer@example.com", "new_password");
        Customers cc = customersDAO.getAccountByID(12);
        System.out.println(cc.getCustomer_name());
    }

}
