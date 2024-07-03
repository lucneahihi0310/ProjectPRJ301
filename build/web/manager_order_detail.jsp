
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
                                    <th>NO</th>
                                    <th>Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>                                  

                                </tr>
                            </thead>
                            <tbody class="align-middle">

                            <c:forEach items="${listItem}" var="list" varStatus="loop">
    <tr>
        <td class="align-middle">${loop.index + 1}</td>
        <td class="align-middle">
            <img src="" alt="" style="width: 50px;">
            ${list.getProduct().getProduct_name()} 
        </td>
        <td class="align-middle">${list.getPrice()}</td>
        <td class="align-middle">${list.getQuantity()}</td>
        <td class="align-middle">$${list.getPrice() * list.getQuantity()}</td>
    </tr>
</c:forEach>





                        </tbody>
                    </table>

                    -----------------------------------------------------------------------------------------------------------------------------------------------
                    <form  action="manager-order" method="post">
                        
                        <input hidden name="id" value="${order.getOrder_id()}">
                        <input hidden name="totalOrder" value="${order.getTotal()}">
                        <div class="control-group">
                            <h4> Status</h4>
                            <select class="form-control" id="status" name="status">

                                <option value="Shipping">Shipping</option>
                                <option value="Failing">Failing</option>
                                <option value="Received the goods">Received the goods</option>


                            </select>                           
                            <p class="help-block text-danger"></p>
                        </div>

                        <div class="control-group">
                            <h4> Discount Product:</h4>
                            <select class="form-control" id="discount" name="discount">

                                <option value="1">0%</option>
                                <option value="2">20%</option>
                                <option value="3">30%</option>

                            </select>

                            <p class="help-block text-danger"></p>
                        </div>

                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Add</button>
                        </div>
                    </form>

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