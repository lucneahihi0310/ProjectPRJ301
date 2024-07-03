/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author KinNhun
 */
public class Order {
    private int order_id;
    private String date;
    private Customers account_id;
    private int total;
    private int tolatlQuantity;
    private String status;
           

    public Order() {
    }

    public Order(int order_id, String date, Customers account_id, int total, int tolatlQuantity, String status) {
        this.order_id = order_id;
        this.date = date;
        this.account_id = account_id;
        this.total = total;
        this.tolatlQuantity = tolatlQuantity;
        this.status = status;
    }

    public Order(int order_id, String date, Customers account_id, int total, int tolatlQuantity) {
        this.order_id = order_id;
        this.date = date;
        this.account_id = account_id;
        this.total = total;
        this.tolatlQuantity = tolatlQuantity;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Customers getAccount_id() {
        return account_id;
    }

    public void setAccount_id(Customers account_id) {
        this.account_id = account_id;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getTolatlQuantity() {
        return tolatlQuantity;
    }

    public void setTolatlQuantity(int tolatlQuantity) {
        this.tolatlQuantity = tolatlQuantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", date=" + date + ", account_id=" + account_id + ", total=" + total + ", tolatlQuantity=" + tolatlQuantity + '}';
    }

    
  
    
}
