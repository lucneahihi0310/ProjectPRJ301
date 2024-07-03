/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import model.Category;

/**
 *
 * @author KinNhun
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> sellectallProduct() {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            // String sql = "SELECT * FROM Product ORDER BY product_id DESC"; // Order by product_id in descending order
            String sql = "SELECT P.*, C.category_name FROM Product P INNER JOIN Category C ON P.category_id = C.category_id ORDER BY P.product_id DESC"; // Order by product_id in descending order
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                int categoryId = rs.getInt("category_id");
                String img = rs.getString("img");
                String description = rs.getString("description");

                Product product = new Product(productId, productName, listPrice, categoryId, img, description);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public ArrayList<Product> sellectByCategory(int categoryId) {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            // Sử dụng một SQL query để chọn các sản phẩm thuộc danh mục cụ thể (category_id)
            String sql = "SELECT * FROM Product WHERE category_id = ? ORDER BY product_id DESC";
            PreparedStatement st = connection.prepareStatement(sql);

            // Gán giá trị của category_id cho tham số trong truy vấn
            st.setInt(1, categoryId);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                String img = rs.getString("img");
                String description = rs.getString("description");

                Product product = new Product(productId, productName, listPrice, categoryId, img, description);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public ArrayList<Product> searchByName(String search) {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            // Use a SQL query with a WHERE clause to search for products by name
            String sql = "SELECT * FROM Product WHERE product_name LIKE ? ORDER BY product_id DESC";
            PreparedStatement st = connection.prepareStatement(sql);

            // Use the '%' wildcard to search for products containing the provided search term
            st.setString(1, "%" + search + "%");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                int categoryId = rs.getInt("category_id");
                String img = rs.getString("img");
                String description = rs.getString("description");

                Product product = new Product(productId, productName, listPrice, categoryId, img, description);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public Product getProductById(int product_id) {
        Product product = null;

        try {
            String sql = "SELECT * FROM Product WHERE product_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                int categoryId = rs.getInt("category_id");
                String img = rs.getString("img");
                String description = rs.getString("description");

                product = new Product(productId, productName, listPrice, categoryId, img, description);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    public ArrayList<Product> selectTop4Products() {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            String sql = "SELECT TOP 4 * FROM Product ORDER BY product_id DESC"; // Truy vấn 4 sản phẩm đầu tiên
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                int categoryId = rs.getInt("category_id");
                String img = rs.getString("img");
                String description = rs.getString("description");

                Product product = new Product(productId, productName, listPrice, categoryId, img, description);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public void addNewProduct(String product_name, int list_price, int category_id, String img, String description) {
        try {
            // SQL INSERT query
            String sql = "INSERT INTO Product (product_name, list_price, category_id, img, description) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_name);
            st.setInt(2, list_price);
            st.setInt(3, category_id);
            st.setString(4, img);
            st.setString(5, description);

            // Thực hiện truy vấn INSERT
            int rowsAffected = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editNewProduct(int product_id, String product_name, int list_price, int category_id, String img, String description) {
        try {
            // SQL UPDATE query
            String sql = "UPDATE Product SET product_name = ?, list_price = ?, category_id = ?, img = ?, description = ? WHERE product_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_name);
            st.setInt(2, list_price);
            st.setInt(3, category_id);
            st.setString(4, img);
            st.setString(5, description);
            st.setInt(6, product_id);

            // Thực hiện truy vấn UPDATE
            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Chỉnh sửa sản phẩm thành công.");
            } else {
                System.out.println("Chỉnh sửa sản phẩm thất bại.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProductById(int product_id) {
        try {
            // SQL DELETE query
            String sql = "DELETE FROM Product WHERE product_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);

            // Thực hiện truy vấn DELETE
            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Xóa sản phẩm thành công.");
            } else {
                System.out.println("Xóa sản phẩm thất bại. Sản phẩm không tồn tại.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Product> getProductByPriceACS() {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            String sql = "  select  * from [Product] order by [list_price] asc "; // Truy vấn 4 sản phẩm đầu tiên
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                int categoryId = rs.getInt("category_id");
                String img = rs.getString("img");
                String description = rs.getString("description");

                Product product = new Product(productId, productName, listPrice, categoryId, img, description);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;

    }
    
     public ArrayList<Product> getProductByPriceDEC() {
          ArrayList<Product> productList = new ArrayList<>();

        try {
            String sql = "  select  * from [Product] order by [list_price] desc "; // Truy vấn 4 sản phẩm đầu tiên
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int listPrice = rs.getInt("list_price");
                int categoryId = rs.getInt("category_id");
                String img = rs.getString("img");
                String description = rs.getString("description");

                Product product = new Product(productId, productName, listPrice, categoryId, img, description);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }


    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
//        Product p = pd.getProductById(8);
////      //  pd.editNewProduct(1, "Tên Sản Phẩm Đã Chỉnh Sửa", 150.0f, 2, "hinh-anh-moi.jpg", "Mô tả sản phẩm đã chỉnh sửa");
////
////       // for(Product pp :p){
//        System.out.println("name " + p.getProduct_name());
////       // }
////        
////       // pd.deleteProductById(2);
//        ProductDAO productDAO = new ProductDAO();
//
//        // Thử thêm một sản phẩm mới bằng cách gọi hàm addNewProduct.
//        String productName = "New Product";
//        int listPrice = 10;
//        int categoryId = 1;
//        String img = "product.jpg";
//        String description = "A new product";
//
//        productDAO.editNewProduct(37, productName, listPrice, categoryId, img, description);
//
//        System.out.println("Sản phẩm mới đã được thêm thành công.");
        ArrayList<Product> listProductByPrice = pd.getProductByPriceACS();
        for(Product pp :listProductByPrice){
            System.out.println(pp.getProduct_name());
            System.out.println(pp.getList_price());
        }
        

    }

 

   
}
