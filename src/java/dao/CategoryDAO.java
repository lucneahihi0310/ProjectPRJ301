/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author KinNhun
 */
public class CategoryDAO extends DBContext {

    public ArrayList sellectAllCategory() {
        ArrayList<Category> listCategory = new ArrayList<Category>();

        try {
            String sql = "  SELECT * FROM [Category]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roleId = rs.getInt("category_id");
                String roleName = rs.getString("category_name");
                Category category = new Category(roleId, roleName);
                listCategory.add(category);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return listCategory;

    }

    public String getCategoryNameById(int categoryId) {
        ArrayList<Category> listCategory = sellectAllCategory();

        for (Category category : listCategory) {
            if (category.getCategory_id() == categoryId) {
                return category.getCategory_name();
            }
        }

        // Nếu không tìm thấy ID tương ứng, bạn có thể trả về một giá trị mặc định hoặc null tùy theo nhu cầu.
        return null; // hoặc "Không tìm thấy thể loại"
    }

    public static void main(String[] args) {
        CategoryDAO cd = new CategoryDAO();
//        ArrayList<Category> c = cd.sellectAllCategory();
//        for(Category ca : c){
//            System.out.println("name" +ca.getCategory_name());
//        }

       
        System.out.println(cd.getCategoryNameById(3));

    }

}
