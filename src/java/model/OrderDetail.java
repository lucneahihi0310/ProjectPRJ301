/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author KinNhun
 */
public class OrderDetail {
    private int order_id,quantity;
    private int price;
    private Product product_id;

    public OrderDetail() {
    }

    public OrderDetail(int order_id, int quantity, int price, Product product_id) {
        this.order_id = order_id;
        this.quantity = quantity;
        this.price = price;
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Product getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Product product_id) {
        this.product_id = product_id;
    }

   

    @Override
    public String toString() {
        return "OrderDetail{" + "order_id=" + order_id + ", product_id=" + product_id + ", quantity=" + quantity + ", price=" + price + '}';
    }

  
    
    
}
