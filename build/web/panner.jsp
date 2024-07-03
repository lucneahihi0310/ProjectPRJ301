
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <c:if test="${sessionScope.username != null}">
                        <a class="text-dark" href="">Hello ${username.getCustomer_name()}</a>
                    </c:if>

                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <c:if test="${sessionScope.username != null}">                    
                        <a class="text-dark" href="">Account: ${username. getAccount_name()}</a>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                  <form action="home" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                <a href="" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge">0</span>
                </a>
                <c:set var="size" value="${sessionScope.size}"/>
                <c:if test="${sessionScope.username != null}">
                      <a href="cart" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    
                    <span class="badge">${size}</span>
                </a>
                </c:if>
              
            </div>
        </div>
    </div>
    <!-- Topbar End -->
    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100 overflow-hidden" style="max-height: 410px; overflow-y: auto;">
                        
                        <form action="listPByC" method="post">
                            <c:forEach items="${sessionScope.category}" var="category">

                                <a href="listPByC?category_id=${category.getCategory_id()}" class="nav-item nav-link">${category.getCategory_name()}</a>

                            </c:forEach>

                        </form>

                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="home" class="nav-item nav-link">Home</a>                            
                            
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="cart" class="dropdown-item">Shopping Cart</a>
                                    <a href="check-out" class="dropdown-item">Checkout</a>
                                </div>
                            </div>
                           
                        </div>
                        <c:if test="${sessionScope.username == null}">
                            <div class="navbar-nav ml-auto py-0">
                                <a href="login" class="nav-item nav-link">Login</a>
                                <a href="register" class="nav-item nav-link">Register</a>
                            </div>
                        </c:if>
                       
                        <c:if test="${sessionScope.username != null}">
                            <div class="navbar-nav ml-auto py-0">

                                <c:if test="${sessionScope.username.getRole_id()== 1}">

                                    <a href="manager-product" class="nav-item nav-link">Manager Product</a>
                                    <a href="manager-order" class="nav-item nav-link">Manager Order</a>


                                </c:if>
                                    <a href="order-user" class="nav-item nav-link">Order List</a>
                                       <a href="profile.jsp" class="nav-item nav-link">Profile</a>
                                <a href="logout" class="nav-item nav-link">Logout</a>
                            </div>
                        </c:if>


                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->
</html>
