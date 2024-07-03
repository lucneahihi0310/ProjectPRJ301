/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KinNhun
 */
public class Cart {
    private int account_id,product_id,ammount;
    private List<Item> item;

   

    public Cart(int account_id, int product_id, int ammount, List<Item> item) {
        this.account_id = account_id;
        this.product_id = product_id;
        this.ammount = ammount;
        this.item = item;
    }

    public Cart(List<Item> item) {
        this.item = item;
    }
    public Cart(){
        item= new ArrayList<>();
    }
    private Item getItembyId(int id){// muốn thêm hoặc xóa trong giỏ hàng 
        for(Item i : item){
            if(i.getProduct().getProduct_id()==id){
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(int id){  // trả về số lượng 
        return getItembyId(id).getQuantity();
    }
    public void addItem(Item t){
        // có trong giỏ hàng 
        if(getItembyId(t.getProduct().getProduct_id()) !=null){
            Item i = getItembyId(t.getProduct().getProduct_id());
            i.setQuantity(i.getQuantity()+t.getQuantity());
        }else{
            //chưa có
            item.add(t);
        }
    }
    public void removeItem(int id){   // xóa giỏ hàng 
        if(getItembyId(id) != null){
            item.remove(getItembyId(id));
        }
    }
    public int getTotalMoney(){
        int t = 0;
        for(Item i:item){
            t+=i.getQuantity()*i.getPrice();
        }
        return t;
    }

    public List<Item> getItem() {
        return item;
    }

    public void setItem(List<Item> item) {
        this.item = item;
    }
    
    

    public Cart(int account_id, int product_id, int ammount) {
        this.account_id = account_id;
        this.product_id = product_id;
        this.ammount = ammount;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getAmmount() {
        return ammount;
    }

    public void setAmmount(int ammount) {
        this.ammount = ammount;
    }

    @Override
    public String toString() {
        return "Cart{" + "account_id=" + account_id + ", product_id=" + product_id + ", ammount=" + ammount + '}';
    }
    
    
    
}
