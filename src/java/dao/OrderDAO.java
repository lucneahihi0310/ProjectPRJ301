/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DBContext.connection;
import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Customers;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author KinNhun
 */
public class OrderDAO extends DBContext {

    public void addOrder(Customers u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào 
            String sql = "INSERT INTO [Order] ([order_date], [account_id], [total])\n"
                    + "VALUES (?, ?, ?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, u.getAccount_id());
            st.setInt(3, cart.getTotalMoney());
            st.executeUpdate();

            // lấy ra vừa add
            String sql1 = "SELECT TOP 1 [order_id] FROM [order] ORDER BY [order_id] DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            // add vào bảng orderDetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItem()) {
                    String sql2 = "  INSERT INTO [OrderDetail] ([order_id], [product_id], [quantity], [price])\n"
                            + "VALUES (?, ?, ?, ?);";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getProduct_id());
                    st2.setInt(3, i.getQuantity());
                    st2.setInt(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//   public Cart getCartByUserId(int userId) {
//    Cart cart = new Cart();
//    try {
//        // Truy vấn cơ sở dữ liệu để lấy danh sách sản phẩm trong giỏ hàng của người dùng dựa trên user_id
//        String sql = "SELECT p.product_id, p.product_name, p.list_price, p.category_id, p.img, p.description, od.quantity "
//                + "FROM OrderDetail od "
//                + "JOIN Product p ON od.product_id = p.product_id "
//                + "WHERE od.order_id = (SELECT MAX(order_id) FROM [Order] WHERE account_id = ?)";
//
//        PreparedStatement st = connection.prepareStatement(sql);
//        st.setInt(1, userId);
//        ResultSet rs = st.executeQuery();
//
//        while (rs.next()) {
//            int product_id = rs.getInt("product_id");
//            String product_name = rs.getString("product_name");
//            int list_price = rs.getInt("list_price");
//            int category_id = rs.getInt("category_id");
//            String img = rs.getString("img");
//            String description = rs.getString("description");
//            int quantity = rs.getInt("quantity");
//
//            // Tạo đối tượng Product và Item, sau đó thêm vào giỏ hàng
//            Product product = new Product(product_id, product_name, list_price, category_id, img, description);
//            Item item = new Item(product, quantity, list_price);
//            cart.addItem(item);
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//
//    return cart;
//}
    public List<Order> getAllOrder() {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.[order_id], o.[order_date], o.[account_id], o.[total], SUM(od.[quantity]) AS [total_quantity]"
                    + " FROM [Order] AS o"
                    + " LEFT JOIN [OrderDetail] AS od ON o.[order_id] = od.[order_id]"
                    + " GROUP BY o.[order_id], o.[order_date], o.[account_id], o.[total]"
                    + " ORDER BY o.[order_id]";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setDate(rs.getString("order_date"));
                CustomersDAO cdao = new CustomersDAO();
                order.setAccount_id(cdao.getAccountByID(rs.getInt("account_id")));
                order.setTotal(rs.getInt("total"));
                order.setTolatlQuantity(rs.getInt("total_quantity"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getAllOrder1() {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.[order_id], o.[order_date], o.[account_id], o.[total], SUM(od.[quantity]) AS [total_quantity], o.[status]"
                    + " FROM [Order] AS o"
                    + " LEFT JOIN [OrderDetail] AS od ON o.[order_id] = od.[order_id]"
                    + " GROUP BY o.[order_id], o.[order_date], o.[account_id], o.[total], o.[status]"
                    + " ORDER BY o.[order_id]";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setDate(rs.getString("order_date"));
                CustomersDAO cdao = new CustomersDAO();
                order.setAccount_id(cdao.getAccountByID(rs.getInt("account_id")));
                order.setTotal(rs.getInt("total"));
                order.setTolatlQuantity(rs.getInt("total_quantity"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Item> getAllOrderItem(int orderID) {
        List<Item> items = new ArrayList<>();
        try {
            String sql = "select * from [OrderDetail] where [order_id] =?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                int price = rs.getInt("price");

                ProductDAO pdao = new ProductDAO();
                Product product = pdao.getProductById(product_id);
                Item item = new Item(product, quantity, price);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public Order getOrderByID(int orderID) {
        Order order = null;
        try {
            String sql = "SELECT [order_id], [order_date], [account_id], [total], [status]"
                    + " FROM [Order]"
                    + " WHERE [order_id] = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setDate(rs.getString("order_date"));
                CustomersDAO cdao = new CustomersDAO();
                order.setAccount_id(cdao.getAccountByID(rs.getInt("account_id")));
                order.setTotal(rs.getInt("total"));
                order.setStatus(rs.getString("status"));  // Đọc trạng thái từ cơ sở dữ liệu
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public void updateOrder(String status, int total, int orderID) {
        try {
            String sql = "UPDATE [Order] SET [status] = ?, [total] = ? WHERE [order_id] = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, total);
            st.setInt(3, orderID);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public List<Order> getAllOrdersByUserID(int idUser) {
    List<Order> orders = new ArrayList<>();
    try {
        // Assuming you have a way to get the orders associated with a user ID,
        // replace "yourUserOrdersQuery" with the actual SQL query or logic.
        String userOrdersQuery = "SELECT o.[order_id], o.[order_date], o.[account_id], o.[total], SUM(od.[quantity]) AS [total_quantity], o.[status]"
                + " FROM [Order] AS o"
                + " LEFT JOIN [OrderDetail] AS od ON o.[order_id] = od.[order_id]"
                + " WHERE o.[account_id] = ?"
                + " GROUP BY o.[order_id], o.[order_date], o.[account_id], o.[total], o.[status]"
                + " ORDER BY o.[order_id]";

        PreparedStatement st = connection.prepareStatement(userOrdersQuery);
        st.setInt(1, idUser);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Order order = new Order();
            order.setOrder_id(rs.getInt("order_id"));
            order.setDate(rs.getString("order_date"));
            CustomersDAO cdao = new CustomersDAO();
            order.setAccount_id(cdao.getAccountByID(rs.getInt("account_id")));
            order.setTotal(rs.getInt("total"));
            order.setTolatlQuantity(rs.getInt("total_quantity"));
            order.setStatus(rs.getString("status"));

            orders.add(order);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return orders;
}


    public static void main(String[] args) {
        OrderDAO odao = new OrderDAO();
        List<Order> item = odao.getAllOrdersByUserID(12);
        for(Order items : item){
            System.out.println("name"  + items.getDate());
        }

    }

}
