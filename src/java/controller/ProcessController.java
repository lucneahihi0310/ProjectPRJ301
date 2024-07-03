/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author KinNhun
 */
public class ProcessController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        // khởi tạo cart 
        Cart cart = null;
        Object c = session.getAttribute("cart");

        // xét xem user đó có cart chưa 
        if (c != null) {
            cart = (Cart) c;
        } else {
            cart = new Cart();

        }
        String tnumber = request.getParameter("num");
        String tproduct_id = request.getParameter("productID");
        int id, num;
        try {
            id = Integer.parseInt(tproduct_id);
            num = Integer.parseInt(tnumber);
            if (num == -1 && (cart.getQuantityById(id) <= 1)) {
                cart.removeItem(id);
               

            } else {
                ProductDAO pd = new ProductDAO();
                Product p = pd.getProductById(id);
                int price = p.getList_price();
                Item t = new Item(p, num, price);
                cart.addItem(t);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
        List<Item> listItem = cart.getItem();
         float sumPrice = 0;
            for(Item i : listItem){
                sumPrice = sumPrice + i.getPrice()*i.getQuantity();
            }
        session.setAttribute("cart", cart);
        session.setAttribute("size", listItem.size());
        session.setAttribute("sumPrice", sumPrice);


        request.getRequestDispatcher("cart.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        // khởi tạo cart 
        Cart cart = null;
        Object o = session.getAttribute("cart");

        // xét xem user đó có cart chưa 
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();

        }
        
        int product_id = Integer.parseInt(request.getParameter("productID"));
        cart.removeItem(product_id);
        
        List<Item> listItem = cart.getItem();
        session.setAttribute("cart", cart);
        session.setAttribute("size", listItem.size());

        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
