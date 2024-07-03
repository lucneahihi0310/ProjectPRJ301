
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
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


        <jsp:include page="panner.jsp"></jsp:include>






            <!-- Shop Detail Start -->
            <div class="container-fluid py-5">
                <div class="row px-xl-5">
                    <div class="col-lg-5 pb-5">
                        <div id="product-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner border">



                                <img class="w-100 h-100" src="img/${product.getImg()}" alt="Image">

                        </div>


                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold">${product.getProduct_name()}</h3>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                        </div>
                        <small class="pt-1">(50 Reviews)</small>
                    </div>
                    <h3 class="font-weight-semi-bold mb-4">$ ${product.getList_price()}</h3>
                    <p class="mb-4">${product.getDescription()}</p>




                    <form action="add-cart" method="post">
                        <div class="d-flex align-items-center mb-4 pt-2">
                            <div class="input-group quantity mr-3" style="width: 130px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary btn-minus" type="button" onclick="decrementQuantity()">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control bg-secondary text-center" id="quantity" name="quantity" value="1">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary btn-plus" type="button" onclick="incrementQuantity()">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-primary px-3">
                                    <i class="fa fa-shopping-cart mr-1"></i> Add To Cart
                                    <input hidden value="${product.getProduct_id()}" name="product_id">
                                </button>
                            </div>
                        </div>
                    </form>


                    <script>
                        
function incrementQuantity() {
                                var quantityField = document.getElementById("quantity");
                        var currentValue = parseInt(quantityField.value, 10);
                        quantityField.value = currentValue + 1;
        }
        
        function decrementQuantity() {
                                var quantityField = document.getElementById("quantity");
                        var currentValue = parseInt(quantityField.value, 10);
                        if (currentValue > 1) {
                        quantityField.value = currentValue - 1;
                        }
        }
</script>

                   




                </div>
            </div>

        </div>
        <!-- Shop Detail End -->


        <!-- Products Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel related-carousel">


                        <c:forEach items="${productList}" var="productList">
                            <div class="card product-item border-0">
                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img class="img-fluid w-100" src="img/${productList.getImg()}" alt="">
                                </div>
                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                    <h6 class="text-truncate mb-3">${productList.getProduct_name()}</h6>
                                    <div class="d-flex justify-content-center">
                                        <h6>$ ${productList.getList_price()}</h6><h6 class="text-muted ml-2"><del></del></h6>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-between bg-light border">
                                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>


                                </div>
                            </div>
                        </c:forEach>






                    </div>
                </div>
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










