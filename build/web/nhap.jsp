
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.CustomersDAO" %>
<%@ page import="model.Customers" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Manager Product</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- panner -->

        <jsp:include page="panner.jsp"></jsp:include>

            <!-- panner -->




            <!-- Cart Start -->
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">

                    <div class="col-lg-12 table-responsive mb-5">



                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Customers</th>
                                    <th>Order Date</th>
                                    <th>Total Quantity</th>
                                    <th>Amount</th>                                  
                                    <th>Status</th>                                  
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">

                            <c:forEach items="${listOrder}" var="list">
                                <tr>
                                    <td  class="align-middle">

                                        ${list.getOrder_id()} 
                                    </td>
                                   <td class="align-middle">
    <img src="" alt="" style="width: 50px;">
    <%
        CustomersDAO customersDAO = new CustomersDAO();
        Customers customer = customersDAO.getAccountByID(list.getAccount_id());
        String accountName = customer.getAccount_name();
    %>
    
    <%= accountName %>
</td>


                                    <td class="align-middle">${list.getDate()}</td>

                                    <td class="align-middle"> ${list.getTolatlQuantity()}                                    
                                    </td>


                                    <td class="align-middle">$${list.getTotal()}</td>
                                    <td></td>
                                    <td class="align-middle" style="width: 120px;">
                                        <a href="">
                                            <button class="btn btn-sm btn-primary"><i class="fa fa-plus"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>



                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <!-- Cart End -->





        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>