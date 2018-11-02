<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${empty role_nv}">
	<c:url var="linkhs" value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/ho_so/${hoSoNhanVien.maNhanVien}"/>
	<c:url var="linkbc" value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/bang_cap/${hoSoNhanVien.maNhanVien}"/>
	<c:url var="linkgd" value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/gia_dinh/${hoSoNhanVien.maNhanVien}"/>
	<c:url var="linkkn" value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/kinh_nghiem/${hoSoNhanVien.maNhanVien}"/>
	<c:url var="linkhd" value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/hop_dong/${hoSoNhanVien.maNhanVien}"/>
	<c:url var="linkall" value = "/qlns/${hoSoNhanVien.phongBan.maPhongBan}/view/ho_so_tong_hop/${hoSoNhanVien.maNhanVien}"/>
</c:if>
<c:if test="${!empty role_nv}">
	<c:url var="linkhs" value = "/qlns/nv/ho_so"/>
	<c:url var="linkbc" value = "/qlns/nv/bang_cap"/>
	<c:url var="linkgd" value = "/qlns/nv/gia_dinh"/>
	<c:url var="linkkn" value = "/qlns/nv/kinh_nghiem"/>
	<c:url var="linkhd" value = "/qlns/nv/hop_dong"/>
	<c:url var="linkall" value = "/qlns/nv/ho_so_tong_hop"/>
</c:if>

<jsp:include page="/WEB-INF/view/templates/header.jsp" />

<div class="app-content content container-fluid">
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-xs-12 mb-2">
				<h3 class="content-header-title mb-0">Thông tin hợp đồng</h3>
				<div class="row breadcrumbs-top">
					<div class="breadcrumb-wrapper col-xs-12">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<c:url value = "/"/>"><spring:message code="label.trangChu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyNhanSu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyHopDong" /></a>
                        </li>
							<li class="breadcrumb-item active"><spring:message code="label.thongTinHopDong" /></li>
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
	                  	<a href="${linkhs}" class="dropdown-item"><i class="fa fa-id-card-o"></i> <spring:message code="label.thongTinHoSo" /></a>
	                  	<a href="${linkbc}" class="dropdown-item"><i class="fa fa-graduation-cap"></i> <spring:message code="label.thongTinBangCap" /></a>
	                  	<a href="${linkgd}" class="dropdown-item"><i class="fa fa-users"></i> <spring:message code="label.thongTinGiaDinh" /></a>
	                  	<a href="${linkkn}" class="dropdown-item"><i class="fa fa-file-code-o"></i> <spring:message code="label.thongTinKinhNghiem" /></a>
	                  	<a href="${linkhd}" class="dropdown-item"><i class="fa fa-handshake-o"></i> <spring:message code="label.thongTinHopDong" /></a>
	                  	<div class="dropdown-divider"></div>
	                  	<a href="${linkall}" class="dropdown-item text-xs-center"><spring:message code="label.xemTatCa" /></a>
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
									<form:form class="form form-horizontal" modelAttribute="hopDong">
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
																<div style="word-wrap: break-word;" class="form-control well">${maNhanVienFormat}</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.trangThai" /></label>
												               <div style="word-wrap: break-word;" class="form-control well">
												               		<c:if test="${hoSoNhanVien.trangThai == 1 }"><spring:message code="label.dangLamViec" /></c:if>
												               		<c:if test="${hoSoNhanVien.trangThai == 2 }"><spring:message code="label.daNghiViec" /></c:if>
												               </div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.phongBan" /></label>
													   	  		<div style="word-wrap: break-word;" class="form-control well">${hoSoNhanVien.phongBan.tenPhongBan}</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label><spring:message code="label.chucDanh" /></label>
													   	  		<div style="word-wrap: break-word;" class="form-control well">${hoSoNhanVien.chucDanh.tenChucDanh}</div>
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
											<c:forEach items="${hoSoNhanVien.hopDongs }" var="hopDong" varStatus="stt">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label><spring:message code="label.maHopDong" /></label>
														<div style="word-wrap: break-word;" class="form-control well">${hopDong.maHopDong }</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label><spring:message code="label.tenHopDong" /></label>
														<div style="word-wrap: break-word;" class="form-control well">${hopDong.loaiHopDong.tenHopDong }</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label><spring:message code="label.trangThai" /></label>
										               	<div style="word-wrap: break-word;" class="form-control well">
										               		<c:if test="${hopDong.trangThai == 1}"><spring:message code="label.conHopDong" /></c:if>
										               		<c:if test="${hopDong.trangThai == 2}"><spring:message code="label.hetHopDong" /></c:if>
										               </div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.luongThang13" /></label>
										               	<div style="word-wrap: break-word;" class="form-control well">
										               		<c:if test="${hopDong.luongThang13 == 1}"><spring:message code="label.co" /></c:if>
										               		<c:if test="${hopDong.luongThang13 == 2}"><spring:message code="label.khong" /></c:if>
										               </div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.soNgayPhep" /></label>
														<div style="word-wrap: break-word;" class="form-control well">${hopDong.soNgayPhep }</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.ngayKyHopDong" /></label>
														<div style="word-wrap: break-word;" class="form-control well">${hopDong.ngayKyKet }</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label><spring:message code="label.ngayKetThucHopDong" /></label>
														<div style="word-wrap: break-word;" class="form-control well">${hopDong.ngayKetThuc }</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div><sec:authorize access="hasRole('ROLE_PNS')">
	            						   <div class="form-actions center">
										   	<a href="<c:url value = "/qlns/hop_dong/edit/${hoSoNhanVien.maNhanVien}"/>">
										      <button type="button" class="btn btn-warning mr-1">
										         <spring:message code="label.chinhSua" />
										      </button>
										    </a>
										   </div>
	            						</sec:authorize>
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
