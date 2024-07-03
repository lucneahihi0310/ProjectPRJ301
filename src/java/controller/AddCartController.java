/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Customers;
import model.Item;
import model.Product;

/**
 *
 * @author KinNhun
 */
public class AddCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = null;
        Object c = session.getAttribute("cart");

        Customers customer = (Customers) session.getAttribute("username");
        if (customer == null) {
            request.setAttribute("mess", "You need to login before buying!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            
            if (c != null) {
                cart = (Cart) c;
            } else {
                cart = new Cart();

            }
            String tnumber = request.getParameter("quantity");
            String tproduct_id = request.getParameter("product_id");
            int num, id;
            try {
                num = Integer.parseInt(tnumber);
                id = Integer.parseInt(tproduct_id);

                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductById(id);
                int price = product.getList_price();

                Item item = new Item(product, num, price);
                cart.addItem(item);

            } catch (NumberFormatException e) {
                num = 1;
            }
            List<Item> listItem = cart.getItem();
            int sumPrice = 0;
            for(Item i : listItem){
                sumPrice = sumPrice + i.getPrice()*i.getQuantity();
            }
            session.setAttribute("cart", cart);
            session.setAttribute("size", listItem.size());
            session.setAttribute("sumPrice", sumPrice);

            request.getRequestDispatcher("home.jsp").forward(request, response);

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
