<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="/WEB-INF/view/templates/header.jsp" />

<div class="app-content content container-fluid">
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-xs-12 mb-2">
				<h3 class="content-header-title mb-0"><spring:message code="label.thongTinHopDong" /></h3>
               <div class="row breadcrumbs-top">
                  <div class="breadcrumb-wrapper col-xs-12">
                     <ol class="breadcrumb">
                       	<li class="breadcrumb-item"><a href="<c:url value = "/"/>"><spring:message code="label.trangChu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyNhanSu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyHopDong" /></a>
                        </li>
                        <li class="breadcrumb-item active"><spring:message code="label.thongTinHopDong" />
						</ol>
					</div>
				</div>
			</div>
			<div class="content-header-right col-md-3 col-xs-12">
				<div role="group" aria-label="Button group with nested dropdown" class="dropdown nav-item float-md-right">
	               <div role="group" class="btn-group">
	                  <button id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-outline-primary dropdown-toggle">
	                  	<i class="ft-settings icon-left"></i> <spring:message code="label.thongTinKhac" />
	                  </button>
	                  <div aria-labelledby="btnGroupDrop1" class="dropdown-menu dropdown-menu-right">
	                  	<a href="<c:url value = "/qlns/ho_so/edit/${hoSoNhanVien.maNhanVien}"/>" class="dropdown-item"><i class="fa fa-id-card-o"></i> <spring:message code="label.thongTinHoSo" /></a>
	                  	<a href="<c:url value = "/qlns/bang_cap/edit/${hoSoNhanVien.maNhanVien}"/>" class="dropdown-item"><i class="fa fa-graduation-cap"></i> <spring:message code="label.thongTinBangCap" /></a>
	                  	<a href="<c:url value = "/qlns/gia_dinh/edit/${hoSoNhanVien.maNhanVien}"/>" class="dropdown-item"><i class="fa fa-users"></i> <spring:message code="label.thongTinGiaDinh" /></a>
	                  	<a href="<c:url value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/kinh_nghiem/${hoSoNhanVien.maNhanVien}"/>" class="dropdown-item"><i class="fa fa-file-code-o"></i> <spring:message code="label.thongTinKinhNghiem" /></a>
	                  	<a href="<c:url value = "/qlns/hop_dong/edit/${hoSoNhanVien.maNhanVien}"/>" class="dropdown-item"><i class="fa fa-handshake-o"></i> <spring:message code="label.thongTinHopDong" /></a>
	                  	<div class="dropdown-divider"></div>
	                  	<a href="<c:url value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/ho_so_tong_hop/${hoSoNhanVien.maNhanVien}"/>" class="dropdown-item text-xs-center"><spring:message code="label.xemTatCa" /></a>
	                  </div>
	               </div>
				</div>
			</div>
		</div>
		<div class="content-body">
			<!-- Basic form layout section start -->
			<section id="horizontal-form-layouts">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" id="horz-layout-basic"><spring:message code="label.thongTinHopDong" /></h4>
								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
								<div class="heading-elements">
									<ul class="list-inline mb-0">
										<li><a data-action="collapse"><i class="ft-minus"></i></a></li>
										<li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
										<li><a data-action="expand"><i class="ft-maximize"></i></a></li>
										<li><a data-action="close"><i class="ft-x"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
									<form:form class="form form-horizontal" method="POST"
										action="/ffse-fbms/qlns/hop_dong/save" modelAttribute="hopDong">
										<div class="form-body">
											<div class="row">
												<div class="col-md-8">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.maNhanVien" /></label>
																<fmt:formatNumber type="number" var="maNhanVienFormat"
																	minIntegerDigits="5" groupingUsed="false"
																	value="${hoSoNhanVien.maNhanVien}" />
																<input placeholder="Mã nhân viên" class="form-control"
																	value="${maNhanVienFormat}" disabled type="text">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.trangThai" /></label> <select
																	class="form-control" disabled>
																	<option>${hoSoNhanVien.trangThai == 1 ? "Đang làm việc" : "Nghỉ việc"}</option>
																</select>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.phongBan" /></label> <select class="form-control"
																	disabled>
																	<option>${hoSoNhanVien.phongBan.tenPhongBan}</option>
																</select>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.chucDanh" /></label> <select class="form-control"
																	disabled>
																	<option>${hoSoNhanVien.chucDanh.tenChucDanh}</option>
																</select>
															</div>
														</div>
													</div>
												</div>
												<div class="col-md-4" style="text-align: center !important;">
													<img width="175px" height="175px"
														src="/ffse-fbms/resources/images/nhan-vien/${hoSoNhanVien.anhDaiDien}">
												</div>
											</div>
											<h4 class="form-section">
												<i class="ft-user"></i> <spring:message code="label.thongTinHopDong" />
											</h4>
											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label><spring:message code="label.maHopDong" /></label>
														<form:input class="form-control" path="maHopDong" value="${maHopDongFormat}"  readonly="true" disabled="true"/>
															<fmt:formatNumber type="number" var="maHopDongFormat" minIntegerDigits="5" groupingUsed="false" value="${quanLyHopDong.maHopDong}" />
										              
														<c:if test="${!empty edit}">
															<form:hidden path="maHopDong" />
														</c:if>
										      			<form:hidden path="hoSoNhanVien.maNhanVien" value="${hoSoNhanVien.maNhanVien}" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label><spring:message code="label.tenHopDong" /></label>
														<form:select multiple="single" path="loaiHopDong.maLoaiHopDong" class="form-control">
															<form:option selected="true" disabled="true" value="0" ><spring:message code="label.chonHopDong" /></form:option>
															<form:options items="${listLoaiHopDong}" itemValue="maLoaiHopDong" itemLabel="tenHopDong" />
														</form:select>
														<form:errors path="loaiHopDong" cssClass="invalid-feedback d-block" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label><spring:message code="label.trangThai" /></label>
														<form:select multiple="single" path="trangThai"
															class="form-control">
															<form:option selected="true" disabled="true" value="0"><spring:message code="label.chonTrangThai" /></form:option>
															<form:option value="1"><spring:message code="label.conHopDong" /></form:option>
															<form:option value="2"><spring:message code="label.hetHopDong" /></form:option>
														</form:select>
														<form:errors path="trangThai" cssClass="invalid-feedback d-block" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.luongThang13" /></label>
														 <form:select multiple="single" path="luongThang13" class="form-control">
													   		  <form:option selected = "true" disabled = "true" value=""><spring:message code="label.chonLuongThang13" /></form:option>
													   		  <form:option value="1"><spring:message code="label.co" /></form:option>
													   		  <form:option value="2" ><spring:message code="label.khong" /></form:option>
											  			 </form:select>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.soNgayPhep" /></label>
														<form:input class="form-control" path="soNgayPhep"
															placeholder="..." />
														<form:errors path="soNgayPhep" cssClass="invalid-feedback d-block" />
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.ngayKyHopDong" /></label>
														<form:input type="date" class="form-control" 
															path="ngayKyKet" placeholder="Ngày ký kết"
															data-toggle="tooltip" data-trigger="hover"
															data-placement="top" data-title="Date Opened" />
														<form:errors path="ngayKyKet" cssClass="invalid-feedback d-block" />
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.ngayKetThucHopDong" /></label>
														<form:input type="date" class="form-control"
															path="ngayKetThuc" placeholder="Ngày kết thúc"
															data-toggle="tooltip" data-trigger="hover"
															data-placement="top" data-title="Date Opened" />
														<form:errors path="ngayKetThuc" cssClass="invalid-feedback d-block" />
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions center">
										<a href="/ffse-fbms/qlns/ns/view/hop_dong">
											<button type="button" class="btn btn-warning mr-1">
												<i class="ft-x"></i> <spring:message code="label.huy" />
											</button>
											</a>
											<button type="submit" class="btn btn-primary">
												<i class="fa fa-check-square-o"></i> <spring:message code="label.luu" />
											</button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- // Basic form layout section end -->
		</div>
	</div>
</div>
<!-- ////////////////////////////////////////////////////////////////////////////-->

<jsp:include page="/WEB-INF/view/templates/footer.jsp" />
