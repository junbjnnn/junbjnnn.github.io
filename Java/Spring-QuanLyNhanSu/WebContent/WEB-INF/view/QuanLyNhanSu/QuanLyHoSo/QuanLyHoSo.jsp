<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/view/templates/header.jsp" /> 

   <div class="app-content content container-fluid">
      <div class="content-wrapper">
         <div class="content-header row">
            <div class="content-header-left col-md-9 col-xs-12 mb-2">
               <h3 class="content-header-title mb-0"><spring:message code="label.danhSachHoSo" /></h3>
               <div class="row breadcrumbs-top">
                  <div class="breadcrumb-wrapper col-xs-12">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.trangChu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyNhanSu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyHoSo" /></a>
                        </li>
                        <li class="breadcrumb-item active"><spring:message code="label.danhSachHoSo" />
                        </li>
                     </ol>
                  </div>
               </div>
            </div>
            <sec:authorize access="hasRole('ROLE_PNS')">
            <div class="content-header-right col-md-3 col-xs-12">
               <div role="group" aria-label="Button group with nested dropdown" class="btn-group float-md-right" id="add-new">
                  <a href="<c:url value = "/qlns/ho_so/add"/>" class="btn btn-primary"><span class="fa fa-plus"></span> <spring:message code="label.themHoSo" /></a>
               </div>
            </div>
            </sec:authorize>
         </div>
         <div class="content-body">
            <!-- Zero configuration table -->
            <section id="configuration">
               <div class="row">
                  <div class="col-xs-12">
                     <div class="card">
                        <div class="card-header">
                           <h4 class="card-title">Datatable</h4>
                           <c:if test="${!empty SUCCESS}">
							<div class="html_success mt-1">
							   <div style="margin: 0 auto!important;?>" class="alert alert-icon-left alert-success alert-dismissible mb-2" role="alert">
							   <button style="margin-top: 2px" type="button" class="close" data-dismiss="alert" aria-label="Close">
							   		<span aria-hidden="true">×</span>
							   </button>
							   <c:if test="${!empty DELETE_SUCCESS_ID}">
							   	<span><spring:message code="message.deleteSuccess" /> #${DELETE_SUCCESS_ID}!</span>
							   </c:if>
							   <c:if test="${!empty ADD_SUCCESS_ID}">
							   	<span><spring:message code="message.addSuccess" /> #${ADD_SUCCESS_ID}!</span>
							   </c:if>
							 </div>
							</div>
						   </c:if>
                           <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                           <div class="heading-elements">
                              <ul class="list-inline mb-0">
                                 <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                 <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                              </ul>
                           </div>
                        </div>
                        <style type="text/css">
                        	#datatable td {
                        		vertical-align: baseline;
			                }
			                #datatable th, td {
						    	padding-left: 1rem!important;
						    	padding-right: 1rem!important;
							}
							#datatable tr td:nth-child(1), th {
								text-align: center !important;
							}
							#datatable tr td:last-child {
								letter-spacing: 15px;
								min-width: 100px;
								text-align: center !important;
							}
						</style>
                        <div class="card-body collapse in">
                           <div class="card-block card-dashboard">
                              <table id="datatable" class="table table-striped table-bordered dataex-res-constructor">
                                 <thead>
                                    <tr>
                                       <th><spring:message code="label.maNV" /></th>
                                       <%-- <th><spring:message code="label.anhDaiDien" /></th> --%>
                                       <th><spring:message code="label.hoDem" /></th>
                                       <th><spring:message code="label.ten" /></th>
                                       <th><spring:message code="label.gioiTinh" /></th>
                                       <th><spring:message code="label.phongBan" /></th>
                                       <th><spring:message code="label.chucDanh" /></th>
                                       <th><spring:message code="label.trangThai" /></th>
                                       <th></th>
                                    </tr>
                                 </thead>
                                 <tbody>
		                     		<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									   <div class="modal-dialog">
									      <div class="modal-content">
									
									         <div class="modal-header">
									            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									            <h4 class="modal-title" id="myModalLabel"><spring:message code="label.xacNhanXoa" /></h4>
                                             </div>
      
                                             <div class="modal-body">
                                                <p><spring:message code="label.xacNhanXoaThongTin" /></p>
                                                <p><spring:message code="label.xacNhanXoaThongTinConfirm" /></p>
                                                <p class="debug-url"></p>
                                             </div>
      
                                             <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="label.quaylai" /></button>
                                                <a class="btn btn-danger btn-ok"><spring:message code="label.xoa" /></a>
                                             </div>
									      </div>
									   </div>
									</div>
									<script>
									   window.onload = function () {
									      $('#confirm-delete')
									         .on('show.bs.modal', function (e) {
									            $(this)
									               .find('.btn-ok')
									               .attr('href', $(e.relatedTarget)
									                  .data('href'));
									         });
									      $("#datatable").dataTable().fnDestroy();
									      $("#datatable").dataTable({
									    	  responsive: true,
									    	  "order": [[6 , "asc" ], [0, "desc"]],
									          "bServerSide" : true,
									          "sAjaxSource" : "/ffse-fbms/qlns/${maPhongBan}/view/getListHoSo",
									      });
									   };				   
									</script>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
            
            <!--/ Zero configuration table -->
         </div>
      </div>
   </div>
   <!-- ////////////////////////////////////////////////////////////////////////////-->

<jsp:include page="/WEB-INF/view/templates/footer.jsp" /> 