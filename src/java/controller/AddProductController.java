/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import model.Category;
import model.Product;

/**
 *
 * @author KinNhun
 */
@MultipartConfig
public class AddProductController extends HttpServlet {

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
            out.println("<title>Servlet AddProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("add_product.jsp").forward(request, response);

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

    String product_name = request.getParameter("product_name");
    String list_price_str = request.getParameter("list_price");
    String category_id_str = request.getParameter("category_id");
    Part img = request.getPart("img");
    String description = request.getParameter("description");
    String message = null;

    if (product_name == null || product_name.isEmpty()
            || list_price_str == null || list_price_str.isEmpty()
            || category_id_str == null || category_id_str.isEmpty()) {
        message = "Please fill in the product information.";
        request.setAttribute("mess", message);
        request.getRequestDispatcher("add_product.jsp").forward(request, response);
    } else {
        try {
            int list_price = Integer.parseInt(list_price_str);
            int category_id = Integer.parseInt(category_id_str);

            // Specify the upload directory
            String uploadDirectory = "D:\\PRJ301_3\\project\\projectPRJ301\\web\\img";

            // Get the submitted file name
            String fileName = Paths.get(img.getSubmittedFileName()).getFileName().toString();

            // Set the file path
            String filePath = uploadDirectory + fileName;

            // Save the file to the specified directory
            try (InputStream fileContent = img.getInputStream();
                 OutputStream outputStream = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            // Add the product with only the image name, not the full path
            ProductDAO pd = new ProductDAO();
            pd.addNewProduct(product_name, list_price, category_id, fileName, description);

            response.sendRedirect("manager-product");
        } catch (NumberFormatException | IOException e) {
            message = "Error processing the request. Please try again.";
            request.setAttribute("mess", message);
            request.getRequestDispatcher("add_product.jsp").forward(request, response);
        }
    }
}



        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
