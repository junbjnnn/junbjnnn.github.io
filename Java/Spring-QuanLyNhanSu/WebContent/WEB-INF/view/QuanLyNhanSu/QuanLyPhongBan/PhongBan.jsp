<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="/WEB-INF/view/templates/header.jsp" />

<div class="app-content content container-fluid">
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-6 col-xs-12 mb-2">
				<h3 class="content-header-title mb-0"><spring:message code="label.quanLyPhongBan" /></h3>
				<div class="row breadcrumbs-top">
					<div class="breadcrumb-wrapper col-xs-12">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<c:url value='/'></c:url>"><spring:message code="label.trangChu" /></a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyNhanSu" /></a>
							</li>
							<li class="breadcrumb-item"><a href="<c:url value='/qlns/phong_ban'></c:url>"><spring:message code="label.quanLyPhongBan" /></a></li>
							<li class="breadcrumb-item active"><spring:message code="label.danhSachPhongBan" /></li>
						</ol>
					</div>
				</div>
			</div>
			<div class="content-header-right col-md-6 col-xs-12">
				<div role="group" aria-label="Button group with nested dropdown"
					class="btn-group float-md-right" id="add-new">
					<a  href="<c:url value="/qlns/phong_ban/add" />" class="btn btn-primary"><span class="fa fa-plus"></span>
						<spring:message code="label.themMoi" /></a>
				</div>
			</div>
		</div>
		<div class="content-body">
			<!-- Zero configuration table -->
			<section id="configuration">
				<div class="row">
					<div class="col-xs-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title"><spring:message code="label.danhSachPhongBan" /></h4>

								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
								<div class="heading-elements">
									<ul class="list-inline mb-0">
										<li><a data-action="collapse"><i class="ft-minus"></i></a></li>
										<li><a data-action="expand"><i class="ft-maximize"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="card-body collapse in">
								<div class="card-block card-dashboard">
									<table
										class="table table-striped table-bordered zero-configuration">
										<thead>
											<tr>
												<th>#</th>
												<th><spring:message code="label.maPhongBan" /></th>
												<th><spring:message code="label.tenPhongBan" /></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listPhongBan}" var="phongban" varStatus="stt">
												<tr>
													<td>${stt.count }</td>
													<td>${phongban.maPhongBan}</td>
													<td>${phongban.tenPhongBan}</td>
													<td style="letter-spacing: 5px; min-width: 75px;">
													<a href="<c:url value='/qlns/phong_ban/edit/${phongban.maPhongBan}' />"><i class="fa fa-pencil"></i></a> 
													<a href="javascript:void(0);" data-toggle="modal" data-target="#confirm-delete" data-href="<c:url value='/qlns/phong_ban/remove/${phongban.maPhongBan}' />"><i class="fa fa-trash"></i></a> </td>
												
												</tr>
											</c:forEach>
									
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
											 window.onload = function(){
			                                		$('#confirm-delete').on('show.bs.modal', function(e) {
				                                        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
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
