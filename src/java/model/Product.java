/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author KinNhun
 */
public class Product {
    private int product_id;
    private String product_name;
    private int list_price;
    private int category_id;
    private String img;
    private String description;

    public Product() {
    }

    public Product(int product_id, String product_name, int list_price, int category_id, String img, String description) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.list_price = list_price;
        this.category_id = category_id;
        this.img = img;
        this.description = description;
    }

   

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getList_price() {
        return list_price;
    }

    public void setList_price(int list_price) {
        this.list_price = list_price;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", product_name=" + product_name + ", list_price=" + list_price + ", category_id=" + category_id + ", img=" + img + ", description=" + description + '}';
    }
    
    
}
