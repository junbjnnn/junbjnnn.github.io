<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
               <h3 class="content-header-title mb-0"><spring:message code="label.thongTinKinhNghiem" /></h3>
               <div class="row breadcrumbs-top">
                  <div class="breadcrumb-wrapper col-xs-12">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value = "/"/>"><spring:message code="label.trangChu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyNhanSu" /></a>
                        </li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyHoSo" /></a>
                        </li>
                        <li class="breadcrumb-item active"><spring:message code="label.thongTinKinhNghiem" />
                        </li>
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
	                        <h4 class="card-title" id="horz-layout-basic"><spring:message code="label.thongTinHoSo" /></h4>
	                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
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
								<form:form class="form form-horizontal" modelAttribute="thongTinKinhNghiem">
								   <div class="form-body">
								      <div class="row">
								         <div class="col-md-8">
								         	<div class="row">
								         		<div class="col-md-6">
									         		<div class="form-group">
										               <label><spring:message code="label.maNhanVien" /></label>
										               <fmt:formatNumber type="number" var="maNhanVienFormat" minIntegerDigits="5" groupingUsed="false" value="${hoSoNhanVien.maNhanVien}" />
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
									        <img width="175px" height="175px" src="/ffse-fbms/resources/images/nhan-vien/${hoSoNhanVien.anhDaiDien}">
								         </div>
								      </div>
								      <h4 class="form-section"><i class="ft-user"></i> <spring:message code="label.thongTinKinhNghiem" /></h4>
								      	<div class="thong-tin-kinh-nghiem">
									      	<div class="repeater-list">
									      		<div class="row">
									      			<div class="col-md-6">
									      				<div class="form-group">
											               <label><spring:message code="label.hoDem" /></label>
											               <div class="form-control well">${hoSoNhanVien.hoDem}</div>
										            	</div>
									      			</div>
									      			<div class="col-md-6">
									      				<div class="form-group">
											               <label><spring:message code="label.ten" /></label>
											               <div class="form-control well">${hoSoNhanVien.ten}</div>
										            	</div>
									      			</div>
									      		</div>
									      		<c:forEach items="${hoSoNhanVien.duAnDTO}" var="duAn" varStatus="status">
									      			<div class="row form-section">
									      				<div class="col-md-4">
										      				<div class="form-group">
												               <label><spring:message code="label.maDuAn" /></label>
												               <div class="form-control well">DA${duAn.maDuAn}</div>
											            	</div>
										      			</div>
										      			<div class="col-md-4">
										      				<div class="form-group">
												               <label><spring:message code="label.tenDuAn" /></label>
												               <div style="word-wrap: break-word;" class="form-control well">${duAn.tenDuAn}</div>
											            	</div>
										      			</div>
										      			<div class="col-md-4">
										      				<div class="form-group">
												               <label><spring:message code="label.vaiTroDuAn" /></label>
												               <div style="word-wrap: break-word;" class="form-control well">
												               		<c:forEach items="${duAn.vaiTro }" var="vaiTro" varStatus="stt">
												               			<span class="tag tag-default tag-info">${vaiTro }</span>   			
												               		</c:forEach>
												               </div>
											            	</div>
										      			</div>
										      			<div class="col-md-12">
										      				<div class="form-group">
												               <label><spring:message code="label.moTaDuAn" /></label>
												               <div style="word-wrap: break-word;" class="form-control well">${duAn.moTaDuAn}</div>
											            	</div>
										      			</div>
										      			<div class="col-md-4">
										      				<div class="form-group">
												               <label><spring:message code="label.ngonNguDuAn" /></label>
												               <div style="word-wrap: break-word;" class="form-control well"><c:forEach items="${duAn.ngonNgu}" var="ngonNgu" varStatus="stt">
												               		<span class="tag tag-default tag-info">${ngonNgu.tenNgonNgu }</span>		   			
											               		</c:forEach></div>
											            	</div>
										      			</div>
										      			<div class="col-md-4">
										      				<div class="form-group">
												               <label><spring:message code="label.framework" /></label>
												               <div style="word-wrap: break-word;" class="form-control">
												               <c:forEach items="${duAn.framework}" var="framework" varStatus="stt">
												               		<span class="tag tag-default tag-info">${framework.tenFramework }</span>	
												               	</c:forEach></div>
											            	</div>
										      			</div>
										      			<div class="col-md-4">
										      				<div class="form-group">
												               <label><spring:message code="label.database" /></label>
												               <div style="word-wrap: break-word;" class="form-control">
												               <c:forEach items="${duAn.database}" var="database" varStatus="stt">
												               		<span class="tag tag-default tag-info">${database.tenDatabase }</span>	
												               	</c:forEach></div>
											            	</div>
										      			</div>
										      		</div>
									      		</c:forEach>
									  		</div>
								   		</div>
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