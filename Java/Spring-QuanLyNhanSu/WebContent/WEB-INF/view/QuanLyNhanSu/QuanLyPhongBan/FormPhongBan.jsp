<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<jsp:include page="/WEB-INF/view/templates/header.jsp" />

<div class="app-content content container-fluid">
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-xs-12 mb-2">
				<h3 class="content-header-title mb-0">
					<c:if test="${empty add}">
                         <spring:message code="label.suaPhongBan" />
                    </c:if>
					<c:if test="${!empty add}">
                         <spring:message code="label.themPhongBan" />
                    </c:if>
				</h3>
				<div class="row breadcrumbs-top">
					<div class="breadcrumb-wrapper col-xs-12">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<c:url value='/'></c:url>"><spring:message code="label.trangChu" /></a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)"><spring:message code="label.quanLyNhanSu" /></a>
							</li>
							<li class="breadcrumb-item"><a href="<c:url value='/ns/phong_ban'></c:url>"><spring:message code="label.quanLyPhongBan" /></a></li>
							<li class="breadcrumb-item active"><c:if
									test="${empty add}">
                         <spring:message code="label.suaPhongBan" />
                         </c:if> <c:if test="${!empty add}">
                         <spring:message code="label.themPhongBan" />
                         </c:if></li>
						</ol>
					</div>
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
								<h4 class="card-title center" id="basic-layout-form-center">
									<i class="ft-user"></i>
									<c:if test="${empty add }">
                         <spring:message code="label.suaPhongBan" />
                         </c:if>
									<c:if test="${!empty add }">
                         <spring:message code="label.themPhongBan" />
                         </c:if>
								</h4>
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
								<div class="card-block">
									<div class="card-text"></div>
									<c:url var="addAction" value="/qlns/phong_ban/save"></c:url>
									<form:form action="${addAction}" modelAttribute="phongBan">
										<div class="row">
											<div class="col-md-6 offset-md-3">
												<div class="form-body" style="margin-top: 1rem;">
													<div class="form-group">
														<label><spring:message code="label.maPhongBan" /></label>
														<c:if test="${empty add }">
															<form:input path="maPhongBan" type="text"
																class="form-control" readonly="true" id="id_edit"
																placeholder="..." />
															
														</c:if>
														<c:if test="${!empty add}">
															<form:input path="maPhongBan" type="text"
																class="form-control" id="id_edit"
																placeholder="..." />
															<form:errors path="maPhongBan"
																cssClass="invalid-feedback d-block" />
															<input name="add" type="hidden" value="TRUE" />
														</c:if>

														<c:if test="${checkMaPhongBan == 'false'}">
															<span class="invalid-feedback d-block"><spring:message code="checkMaPhongBan" /></span>
														</c:if>
													</div>
													<div class="form-group">
														<label><spring:message code="label.tenPhongBan" /></label>
														<form:input path="tenPhongBan" type="text" id="name_edit"
															class="form-control" placeholder="..." />
														<form:errors path="tenPhongBan"
															cssClass="invalid-feedback d-block" />
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions center">
											<a href="/ffse-fbms/qlns/phong_ban"><button type="button"
													class="btn btn-warning mr-1">
													<i class="ft-x"></i> <spring:message code="label.quaylai" />
												</button></a>
											<c:if test="${empty add }">
												<button type="submit" class="btn btn-primary">
													<i class="fa fa-check-square-o"></i> <spring:message code="label.chinhSua" />
												</button>
											</c:if>
											<c:if test="${!empty add}">
												<button type="submit" class="btn btn-primary">
													<i class="fa fa-check-square-o"></i> <spring:message code="label.them" />
												</button>
											</c:if>


										</div>
									</form:form>
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
