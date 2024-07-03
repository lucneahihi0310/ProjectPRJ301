<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Shop</title>
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
        <style>

        </style>

    </head>

    <body>


        <!-- panner -->

        <jsp:include page="panner.jsp"></jsp:include>

            <!-- panner -->



            <!-- Products Start -->
            <div class="container-fluid pt-5">
                <div class="text-center mb-4">
                    <h2 class="section-title px-5"><span class="px-2">List Product</span></h2>
                </div>
                <div class="row px-xl-5 pb-3">

                    <!-- Shop Start -->
                    <div class="container-fluid pt-5">
                        <div class="row px-xl-5">



                            <!-- Shop Product Start -->
                            <div class="col-lg-12 col-md-12">
                                <div class="row pb-3">
                                    <div class="col-12 pb-1">
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <div class="dropdown ml-4">
                                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                    Sort by
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                                    <a class="dropdown-item" href="sort-by-price?sort=1">Tăng dần</a>
                                                    <a class="dropdown-item" href="sort-by-price?sort=2">Giảm dần</a>
                                                    
                                                </div>
                                            </div>
                                            


                                            <form action="home" method="post">
                                                <div class="input-group">

                                                    <input type="text" class="form-control" name="search" placeholder="Search by name">

                                                    <div class="input-group-append">
                                                        <span class="input-group-text bg-transparent text-primary">
                                                            <i class="fa fa-search"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>

                                <c:if test="${not empty mess}">
                                    <div class="alert alert-danger">${mess}</div>
                                </c:if>






                                <c:forEach items="${listProduct}" var="listP">


                                    <!--                                    <form class="form-control-plaintext" name="f" method="post" action="">
                                                                            <input type="number" name="number" value="1" hidden>-->



                                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1" >
                                        <div class="card product-item border-0 mb-4" style="height: 500px">
                                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0"  style="height: 80%;">
                                                <img class="img-fluid h-150" src="img/${listP.getImg()}" alt="" >
                                            </div>
                                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                                <h6 class="text-truncate mb-3">${listP.getProduct_name()}</h6>
                                                <div class="d-flex justify-content-center">
                                                    <h6>$ ${listP.getList_price()}</h6><h6 class="text-muted ml-2"><del></del></h6>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex justify-content-between bg-light border">
                                                <a href="detail?product_id=${listP.getProduct_id()}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                                <form action="add-cart" method="post">
                                                    <button type="submit" class="btn btn-sm text-dark p-0">
                                                        <i class="fas fa-shopping-cart text-primary mr-1"></i> Add To Cart
                                                        <input hidden value="${listP.getProduct_id()}" name="product_id">                                                      
                                                        <input hidden value="1" name="quantity">                                                      
                                                    </button>
                                                </form>


                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>


                                <div class="col-12 pb-1">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-center mb-3">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- Shop Product End -->

                    </div>
                </div>
                <!-- Shop End -->



            </div>
        </div>
        <!-- Products End -->



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