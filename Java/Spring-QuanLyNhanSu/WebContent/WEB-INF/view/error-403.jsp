<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
   <meta name="description" content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
   <meta name="keywords" content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
   <meta name="author" content="JunBjn">
   <title>FastTrackSE - The Business Management System - Login</title>
   <link rel="apple-touch-icon" href="<c:url value="/resources/images/ico/apple-icon-120.png"/>"> <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/images/ico/favicon.ico"/>"> <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet" />
   <!-- BEGIN VENDOR CSS-->
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/feather/style.min.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/font-awesome/css/font-awesome.min.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/flag-icon-css/css/flag-icon.min.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/css/extensions/pace.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/css/tables/datatable/dataTables.bootstrap4.min.css"/>"> <!-- END VENDOR CSS-->
   <!-- BEGIN STACK CSS-->
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-extended.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/app.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/colors.css"/>"> <!-- END STACK CSS-->
   <!-- BEGIN Page Level CSS-->
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/core/menu/menu-types/vertical-menu.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/core/menu/menu-types/vertical-overlay-menu.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/core/colors/palette-gradient.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/core/colors/palette-callout.min.css"/>"> <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/plugins/forms/extended/form-extended.min.css"/>"> <!-- END Page Level CSS-->
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/pages/error.css"/>">
</head>

<body data-open="click" data-menu="vertical-menu" data-col="1-column" class="vertical-layout vertical-menu 1-column   menu-expanded blank-page blank-page">
   <!-- ////////////////////////////////////////////////////////////////////////////-->
   <div class="app-content content container-fluid">
      <div class="content-wrapper">
         <div class="content-header row">
         </div>
         <div class="content-body">
            <section class="flexbox-container">
               <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1">
                  <div class="card-header bg-transparent no-border pb-0">
                     <h2 class="error-code text-xs-center mb-2">403</h2>
        			 <h3 class="text-uppercase text-xs-center">Access Denied/Forbidden !</h3>
                  </div>
                  <div class="card-body collapse in">
                     <fieldset class="row py-2">
                     </fieldset>
                     <div class="row py-2">
                        <div class="col-md-12">
                           <a href="/ffse-fbms" class="btn btn-primary btn-block font-small-3"><i class="ft-home"></i> Back to Home</a>
                        </div>
                     </div>
                  </div>
                  <div class="card-footer bg-transparent pb-0">
                     <div class="row">
                        <p class="text-muted text-xs-center col-xs-12 py-1">© 2018 <a href="#">Team 404 </a> with <i class="ft-heart pink"> </i></p>
                        <div class="text-xs-center">
                           <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-facebook"><span class="fa fa-facebook"></span></a>
                           <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-twitter"><span class="fa fa-twitter"></span></a>
                           <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-linkedin"><span class="fa fa-linkedin font-medium-4"></span></a>
                           <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-github"><span class="fa fa-github font-medium-4"></span></a>
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
   <script type="text/javascript" src="<c:url value="/resources/vendors/js/vendors.min.js"/> ">
   </script>
   <!-- BEGIN VENDOR JS-->
   <!-- BEGIN PAGE VENDOR JS-->
   <script src=" <c:url value="/resources/vendors/js/tables/jquery.dataTables.min.js" />" type="text/javascript"></script>
   <script src="<c:url value="/resources/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"/>" type="text/javascript"></script>
   <script src="<c:url value="/resources/vendors/js/forms/repeater/jquery.repeater.min.js"/>" type="text/javascript"></script>
   <!-- END PAGE VENDOR JS-->
   <!-- BEGIN STACK JS-->
   <script type="text/javascript" src="<c:url value="/resources/js/core/app-menu.js"/> "></script>
   <script type=" text/javascript" src="<c:url value="/resources/js/core/app.js"/> "></script>
   <!-- END STACK JS-->
   <!-- BEGIN PAGE LEVEL JS-->
   <script src=" <c:url value="/resources/js/scripts/tables/datatables/datatable-basic.js" />" type="text/javascript"></script>
   <script src="<c:url value="/resources/js/scripts/forms/form-repeater.min.js"/>" type="text/javascript"></script>
   <!-- END PAGE LEVEL JS-->
</body>

</html>