
<%@page import="java.util.List" %>
<%@page import="model.Product" %> 


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- panner -->

        <jsp:include page="panner.jsp"></jsp:include>

            <!-- panner -->






            <!-- Checkout Start -->
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <div class="col-lg-12">
                        <div class="mb-5">
                            <h4 class="font-weight-semi-bold mb-4">Your Profile: </h4>
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>
                        <c:if test="${not empty message}">
                            <div class="alert alert-success">${message}</div>
                        </c:if>
                        <div class="row">

                            <div class="col-md-6 form-group">
                                <label>Full Name:</label>
                                <input readonly class="form-control" type="text" placeholder="${sessionScope.username.getCustomer_name()}">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Phone:</label>
                                <input readonly class="form-control" type="text" placeholder="${sessionScope.username.getPhone()}">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address:</label>
                                <input readonly class="form-control" type="text" placeholder="${sessionScope.username.getAddress()}">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Email</label>
                                <input readonly class="form-control" type="text" placeholder="${sessionScope.username.getEmail()}">
                            </div>





                            <div class="col-md-12 form-group">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="shipto">
                                    <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Change Profile</label>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="collapse mb-5" id="shipping-address">
                        <h4 class="font-weight-semi-bold mb-4">Your Profile:</h4>

                        <form class="row" action="edit-profile" method="post" onsubmit="return validateForm()">
                            <div class="col-md-6 form-group">
                                <label>Full Name:</label>
                                <input name="customer_name" class="form-control" type="text" value="${sessionScope.username.getCustomer_name()}">
                                <div class="error-message text-danger" id="fullNameError"></div>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Phone:</label>
                                <input name="phone" class="form-control" type="text" value="${sessionScope.username.getPhone()}">
                                <div class="error-message text-danger" id="phoneError"></div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address:</label>
                                <input name="address" class="form-control" type="text" value="${sessionScope.username.getAddress()}">
                                <div class="error-message text-danger" id="addressError"></div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Email</label>
                                <input name="email" class="form-control" type="text" value="${sessionScope.username.getEmail()}">
                                <div class="error-message text-danger" id="emailError"></div>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Password</label>
                                <input name="pass" class="form-control" type="password" placeholder="Enter password" value="${sessionScope.username.getPassword()}">
                                <div class="error-message text-danger" id="passwordError"></div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>RE_Password:</label>
                                <input name="repass" class="form-control" type="password" placeholder="Enter Re-password" value="${sessionScope.username.getPassword()}">
                                <div class="error-message text-danger" id="repassError"></div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">Submit</button>
                                </div>
                            </div>
                        </form>




                    </div>
                </div>

            </div>
        </div>
        <!-- Checkout End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                        by
                        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
                        Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
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

        <script>
                              function validateForm() {
                                  // Clear previous error messages
                                  document.getElementById('fullNameError').textContent = '';
                                  document.getElementById('phoneError').textContent = '';
                                  document.getElementById('addressError').textContent = '';
                                  document.getElementById('emailError').textContent = '';
                                  document.getElementById('passwordError').textContent = '';
                                  document.getElementById('repassError').textContent = '';

                                  // Get form elements
                                  const fullName = document.querySelector('input[name="customer_name"]');
                                  const phone = document.querySelector('input[name="phone"]');
                                  const address = document.querySelector('input[name="address"]');
                                  const email = document.querySelector('input[name="email"]');
                                  const password = document.querySelector('input[name="pass"]');
                                  const repass = document.querySelector('input[name="repass"]');

                                  // Regular expressions for validation
                                  const emailRegex = /^[^\s@]+@gmail\.com$/;
                                  const passwordRegex = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,100}$/;

                                  let isValid = true;

                                  // Full Name validation
                                  if (fullName.value.trim() === "" || fullName.value.length < 3 || fullName.value.length > 100) {
                                      document.getElementById('fullNameError').textContent = "Full Name must be between 3 and 100 characters and cannot be empty.";
                                      isValid = false;
                                  }

                                  // Phone validation
                                  if (phone.value.trim() === "" || phone.value.length > 10 || !/^\d{10}$/.test(phone.value)) {
                                      document.getElementById('phoneError').textContent = "Phone must be 10 digits and cannot be empty.";
                                      isValid = false;
                                  }

                                  // Address validation
                                  if (address.value.trim() === "" || address.value.length < 8 || address.value.length > 200) {
                                      document.getElementById('addressError').textContent = "Address must be between 8 and 200 characters and cannot be empty.";
                                      isValid = false;
                                  }

                                  // Email validation
                                  if (email.value.trim() === "" || !emailRegex.test(email.value)) {
                                      document.getElementById('emailError').textContent = "Email must be in the format '...@gmail.com' and cannot be empty.";
                                      isValid = false;
                                  }

                                  // Password validation
                                  if (password.value.trim() === "" || !passwordRegex.test(password.value)) {
                                      document.getElementById('passwordError').textContent = "Password must be between 8 and 100 characters, must contain at least one uppercase letter and one number, and cannot be empty.";
                                      isValid = false;
                                  }

                                  // Confirm Password validation
                                  if (repass.value !== password.value) {
                                      document.getElementById('repassError').textContent = "Passwords do not match.";
                                      isValid = false;
                                  }

                                  // If any validation fails
                                  return isValid;
                              }
        </script>



    </body>

</html>