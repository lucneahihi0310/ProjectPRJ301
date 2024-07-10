<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Add Product</title>
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
                    <h2 class="section-title px-5"><span class="px-2">Add new product</span></h2>
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

                        <form action="add-product" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="control-group">
                                Name Product:
                                <input type="text" class="form-control" id="name" placeholder="Name Product" name="product_name" />
                                <p class="help-block text-danger" id="nameError"></p>
                            </div>
                            <div class="control-group">
                                Price Product:
                                <input type="number" class="form-control" id="price" placeholder="Price Product" name="list_price" />
                                <p class="help-block text-danger" id="priceError"></p>
                            </div>
                            <div class="control-group">
                                Category Product:
                                <select class="form-control" id="category_id" name="category_id">
                                    <option value="0">Select Category</option>
                                    <c:forEach items="${category}" var="cat">
                                        <option value="${cat.category_id}">${cat.category_name}</option>
                                    </c:forEach>
                                </select>
                                <p class="help-block text-danger" id="categoryError"></p>
                            </div>
                            <div class="control-group">
                                Image Product:
                                <input type="file" class="form-control" id="img" placeholder="Image Product" name="img" />
                                <p class="help-block text-danger" id="imgError"></p>
                            </div>
                            <div class="control-group">
                                Description Product:
                                <input type="text" class="form-control" id="description" placeholder="Description Product" name="description" />
                                <p class="help-block text-danger" id="descriptionError"></p>
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

        <!-- Validation Script -->
        <script>
                            function validateForm() {
                                let isValid = true;

                                // Clear previous error messages
                                document.getElementById('nameError').textContent = '';
                                document.getElementById('priceError').textContent = '';
                                document.getElementById('categoryError').textContent = '';
                                document.getElementById('imgError').textContent = '';
                                document.getElementById('descriptionError').textContent = '';

                                // Validate Name Product
                                const name = document.getElementById('name').value.trim();
                                if (name === "" || name.length < 3 || name.length > 100) {
                                    document.getElementById('nameError').textContent = "Name Product must be between 3 and 100 characters and cannot be empty.";
                                    isValid = false;
                                }

                                // Validate Price Product
                                const price = document.getElementById('price').value.trim();
                                if (price === "" || price.length < 4 || price.length > 999) {
                                    document.getElementById('priceError').textContent = "Price Product must be between 4 and 999 characters and cannot be empty.";
                                    isValid = false;
                                }

                                // Validate Category Product
                                const category = document.getElementById('category_id').value;
                                if (category === "0") {
                                    document.getElementById('categoryError').textContent = "Category Product is required.";
                                    isValid = false;
                                }

                                // Image Product validation
                                const img = document.getElementById('img').files[0];
                                if (!img) {
                                    document.getElementById('imgError').textContent = "Image Product is required.";
                                    isValid = false;
                                } else if (img.size > 10485760) { // 10MB in bytes
                                    document.getElementById('imgError').textContent = "Image Product must be less than 10MB.";
                                    isValid = false;
                                } else if (!/\.(jpg)$/i.test(img.name)) {
                                    document.getElementById('imgError').textContent = "Image Product must be in JPG format.";
                                    isValid = false;
                                }

                                // Validate Description Product
                                const description = document.getElementById('description').value.trim();
                                if (description === "" || description.length < 5 || description.length > 500) {
                                    document.getElementById('descriptionError').textContent = "Description Product must be between 5 and 500 characters and cannot be empty.";
                                    isValid = false;
                                }

                                return isValid;
                            }
        </script>
    </body>

</html>
