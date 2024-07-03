/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Item;
import model.Order;

/**
 *
 * @author KinNhun
 */
public class ManagerOrderController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerOrderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String orderID = request.getParameter("orderID");
        if (request.getParameter("orderID") == null) {
            OrderDAO orderDAO = new OrderDAO();
            List<Order> listOrder = orderDAO.getAllOrder1();

            request.setAttribute("listOrder", listOrder);
            request.getRequestDispatcher("manager_order.jsp").forward(request, response);

        } else {
            OrderDAO orderDAO = new OrderDAO();
            List<Item> listItem = orderDAO.getAllOrderItem(Integer.parseInt(orderID));
            Order oder = orderDAO.getOrderByID(Integer.parseInt(orderID));
            request.setAttribute("order", oder);

            request.setAttribute("listItem", listItem);
            request.getRequestDispatcher("manager_order_detail.jsp").forward(request, response);
        }

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
        String status = request.getParameter("status");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int orderID = Integer.parseInt(request.getParameter("id"));

        ProductDAO pdao = new ProductDAO();
        int total = Integer.parseInt(request.getParameter("totalOrder"));
        int tmp = 1;
        if (discount == 1) {
            tmp = total;
        } else if (discount == 2) {
            tmp = total - total * 20 / 100;
        } else if (discount == 3) {
            tmp = total - total * 30 / 100;
        }

        OrderDAO odao = new OrderDAO();
        odao.updateOrder(status, tmp, orderID);

        response.sendRedirect("manager-order");

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
