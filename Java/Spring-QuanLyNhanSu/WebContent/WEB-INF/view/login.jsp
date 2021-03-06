<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" data-textdirection="ltr" class="loading">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Login Page - Admin</title>
    <link rel="apple-touch-icon" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/fonts/feather/style.min.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/fonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/vendors/css/extensions/pace.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/vendors/css/forms/icheck/custom.css">
    <!-- END VENDOR CSS-->
    <!-- BEGIN STACK CSS-->
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/app.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/colors.css">
    <!-- END STACK CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/core/menu/menu-types/vertical-overlay-menu.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/css/pages/login-register.css">
    <!-- END Page Level CSS-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <style type="text/css">
        body {
            background: url(http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/images/backgrounds/bg-2.jpg) no-repeat center center fixed;
        }
    </style>
    <!-- END Custom CSS-->
</head>

<body data-open="click" data-menu="vertical-menu-modern" data-col="1-column" class="vertical-layout vertical-menu-modern 1-column   menu-expanded blank-page blank-page">
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    <div class="app-content content container-fluid">
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="flexbox-container">
                    <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1  box-shadow-2 p-0">
                        <div class="card border-grey border-lighten-3 m-0">
                            <div class="card-header no-border">
                                <div class="card-title text-xs-center">
                                    <div class="p-1"><img src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/images/logo/rog-logo.png" alt="branding logo" style="max-height: 50px;"></div>
                                </div>
                                <h6 class="card-subtitle line-on-side text-muted text-xs-center font-small-3 pt-2"><span>Login to System</span></h6>
                            </div>
                            <div class="card-body collapse in">
                                <div class="card-block">
                                    <form class="form-horizontal form-simple" name='loginForm' action="<c:url value='j_spring_security_login' />" method='POST'>
                                        <style type="text/css">
                                            .alert-dismissible p {
                                                margin-bottom: 5px !important;
                                            }
                                        </style>
                                        <c:if test="${!empty message}">
                                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                            <span id="error-msg">${message}</span>
                                            <button type="button" class="close"><span aria-hidden="true">&times;</span></button>
                                        </div>
                                        </c:if>
                                        <fieldset class="form-group position-relative has-icon-left mb-0">
                                            <input type="text" class="form-control form-control-lg input-lg" name="username" id="username" placeholder="Your Username" required>
                                            <div class="form-control-position">
                                                <i class="ft-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group position-relative has-icon-left">
                                            <input type="password" class="form-control form-control-lg input-lg" name="password" id="password" placeholder="Enter Password" required>
                                            <div class="form-control-position">
                                                <i class="fa fa-key"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group row">
                                            <div class="col-md-6 col-xs-12 text-xs-center text-md-left">
                                                <fieldset>
                                                    <input type="checkbox" id="remember-me" class="chk-remember">
                                                    <label for="remember-me"> Remember Me</label>
                                                </fieldset>
                                            </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="ft-unlock"></i> Login</button>
				                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="center">
                                    <p>Welcome to TEAM 404!!!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

    <!-- BEGIN VENDOR JS-->
    <script src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
    <script src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/vendors/js/forms/validation/jqBootstrapValidation.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN STACK JS-->
    <script src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/js/core/app-menu.js" type="text/javascript"></script>
    <script src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/js/core/app.js" type="text/javascript"></script>
    <!-- END STACK JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="http://ffse1703.fasttrack.edu.vn/FFSE1703006/ad-assets/js/scripts/forms/form-login-register.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS-->
</body>

</html>