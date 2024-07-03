    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;//

/**
 *
 * @author KinNhun
 */
public class Customers {

    private int account_id;
    private String account_name;
    private String password;
    private String customer_name;
    private String phone;
    private String address;
    private String email;
    private int role_id;

    public Customers() {
    }

    public Customers(int account_id, String account_name, String password, String customer_name, String phone, String address, String email, int role_id) {
        this.account_id = account_id;
        this.account_name = account_name;
        this.password = password;
        this.customer_name = customer_name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.role_id = role_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Customers{");
        sb.append("account_id=").append(account_id);
        sb.append(", account_name=").append(account_name);
        sb.append(", password=").append(password);
        sb.append(", customer_name=").append(customer_name);
        sb.append(", phone=").append(phone);
        sb.append(", address=").append(address);
        sb.append(", email=").append(email);
        sb.append(", role_id=").append(role_id);
        sb.append('}');
        return sb.toString();
    }
    
    
    
}
