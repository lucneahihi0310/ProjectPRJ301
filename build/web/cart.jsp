    <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Cart</title>
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



            <!-- Page Header Start -->
            <div class="container-fluid bg-secondary mb-5">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                    <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
                    <div class="d-inline-flex">
                        <p class="m-0"><a href="">Home</a></p>
                        <p class="m-0 px-2">-</p>
                        <p class="m-0">Shopping Cart</p>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->


            <!-- Cart Start -->
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <div class="col-lg-8 table-responsive mb-5">
                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark">
                                <tr>
                                    <th>No</th>
                                    <th>Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>

                            <tbody class="align-middle">
                            <c:set var="o" value="${sessionScope.cart}"/>
                            <c:set var="t" value="0"/>
                            <c:forEach items="${o.item}" var="listItem">
                                <c:set var="t" value="${t+1}"/>  

                                <tr>       
                                    <td>
                                        ${t}
                                    </td>
                                    <td class="align-middle"><img src="${listItem.getProduct().getImg()}" alt="" style="width: 50px;">${listItem.getProduct().getProduct_name()}</td>
                                    <td class="align-middle">$ ${listItem.getPrice()}</td>
                                    <td class="align-middle">

                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-minus" >
                                                    <a href="process?num=-1&productID=${listItem.getProduct().getProduct_id()}">
                                                        <i class="fa fa-minus"></i>
                                                    </a>

                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${listItem.getQuantity()}">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-plus">
                                                    <a href="process?num=1&productID=${listItem.getProduct().getProduct_id()}">
                                                        <i class="fa fa-plus"></i>
                                                    </a>

                                                </button>
                                            </div>
                                        </div>

                                    </td>
                                    <td class="align-middle">$${listItem.getQuantity()* listItem.getPrice()}</td>


                                    <td class="align-middle">
                                        <form action="process" method="post">
                                            <button class="btn btn-sm btn-primary" type="submit">
                                                <i class="fa fa-times"></i></button>
                                                <input name="productID" hidden value="${listItem.getProduct().getProduct_id()}">
                                        </form>

                                    </td>





                                </tr>


                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <form class="mb-5" action="check-out" method="post">
                        <div class="input-group">

                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">Check out</button>
                            </div>
                        </div>
                    </form>
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <h6 class="font-weight-medium">$ ${sessionScope.sumPrice}</h6>
                            </div>
                           
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$ ${sessionScope.sumPrice}</h5>
                            </div>
                            <a href="check-out">
                                 <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                            </a>
                           
                        </div>
                    </div>
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