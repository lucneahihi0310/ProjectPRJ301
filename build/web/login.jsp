<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Login</title>
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
                    <h2 class="section-title px-5"><span class="px-2">Login</span></h2>
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


                        <form  action="login" method="post">
                            <div class="control-group">
                                Your Account:
                                <input type="text" class="form-control" id="name" placeholder="Your Name" name="account_name"/>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                Your Password:
                                <input type="password" class="form-control" id="password" placeholder="Your Password" name="password"/>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">


                            </div>

                            <div>
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Login</button>
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
