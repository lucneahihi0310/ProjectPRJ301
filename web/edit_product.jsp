<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Edit Product</title>
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



            <!-- Contact Start -->
            <div class="container-fluid pt-5">
                <div class="text-center mb-4">
                    <h2 class="section-title px-5"><span class="px-2">Edit new product</span></h2>
                </div>
                <div class="row px-xl-5">
                    <div class="col-lg-8 mx-auto mb-lg-5">
                        <div class="contact-form">
                        <c:if test="${not empty mess}">
                            <div class="alert alert-danger">${mess}</div>
                        </c:if>
                        <c:if test="${not empty messs}">
                            <div class="alert alert-success">${messs}</div>
                        </c:if>


                        <form  action="edit-product" method="post" enctype="multipart/form-data">
                            <input hidden value="${product.getProduct_id()}" name="product_id">
                            <div class="control-group">
                                Name Product:
                                <input type="text" class="form-control" id="name" value="${product.getProduct_name()}" name="product_name"/>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                Price Product:
                                <input type="number" class="form-control" id="password" value="${product.getList_price()}" name="list_price"/>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                Category Product:
                                <select class="form-control" id="category_id" name="category_id">
                                    <c:forEach items="${category}" var="cat">
                                        <option value="${cat.category_id}">${cat.category_name}</option>
                                    </c:forEach>
                                </select>

                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                Image Product:
                                <input type="file" class="form-control" id="img"  name="img"/>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                Description Product:
                                <input type="text" class="form-control" id="description" value="${product.getDescription()}" name="description"/>
                                <p class="help-block text-danger"></p>
                            </div>

                            <div>
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Add</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <!-- Contact End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer End -->


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
