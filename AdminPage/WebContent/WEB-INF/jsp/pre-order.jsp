<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bookshop online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="<c:url value="/resources/themes/bootshop/bootstrap.min.css"/>"
	media="screen" />
<link href="<c:url value="/resources/themes/css/base.css"/>"
	rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link
	href="<c:url value="/resources/themes/css/bootstrap-responsive.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/resources/themes/css/font-awesome.css"/>"
	rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link
	href="<c:url value="/resources/themes/js/google-code-prettify/prettify.css"/>"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon"
	href="<c:url value="/resources/themes/images/ico/favicon.ico"/>">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<c:url value="/resources/themes/images/ico/apple-touch-icon-144-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<c:url value="/resources/themes/ages/ico/apple-touch-icon-114-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<c:url value="/resources/themes/images/ico/apple-touch-icon-72-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value="/resources/themes/images/ico/apple-touch-icon-57-precomposed.png"/>">
<style type="text/css" id="enject"></style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/headerClient.jsp" flush="false"></jsp:include>
	<div id="mainBody">
		<div class="container">
			<div class="row">

				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<c:forEach items="${listc}" var="d">
						<ul id="sideManu" class="nav nav-tabs nav-stacked">

							<li><a class="active" href="productByCate?id=${d.id}"><i
									class="icon-chevron-right"></i>${d.name}</a></li>

						</ul>
					</c:forEach>
					<br />

					<div class="thumbnail">
						<img
							src="<c:url value="/resources/themes/images/payment_methods.png"/>"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Ph????ng th???c thanh to??n</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="homeClient">Trang ch???</a> <span class="divider">/</span></li>
						<li class="active">?????t h??ng</li>
					</ul>
					<h3>?????t h??ng</h3>
					<div class="well">
						<tr>
							<h4>TH??NG TIN GI??? H??NG</h4>
						</tr>

						<table class="table table-bordered">
							<thead>
								<tr>
									<th>M?? s??ch</th>
									<th>T??n s??ch</th>
									<th>S??? l?????ng</th>
									<th>Gi??</th>
									<td><strong>T???ng gi??</strong></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.cart}" var="entry">
									<tr>
										<td>${entry.value.book.id}</td>
										<td>${entry.value.book.name}</td>
										<td>
											<div class="input-append">
												<input class="span1" style="max-width: 34px"
													placeholder="${entry.value.quantity}"
													id="appendedInputButtons" size="16" type="text"
													readonly="true">
											</div>
										</td>
										<td>${entry.value.price}</td>
										<td><strong> ${entry.value.quantity * entry.value.price}</strong></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<form:form class="form-horizontal" action="pre-order"
							modelAttribute="order" method="post">
							<h4>Th??ng tin ????n h??ng</h4>

							<div class="control-group">
								<label class="control-label">M?? kh??c h??ng <sup>*</sup>
								</label>
								<div class="controls">
									<form:input path="customer.id" readonly="true"
										value="${sessionScope.cusid}" />
									<span>* l??u ?? kh??ng ???????c ????? l??? m?? kh??ch h??ng c???a b???n cho
										ng?????i kh??c bi???t</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">T??n kh??ch h??ng <sup
									style="color: #ff0700;">* ${sessionScope.errName} </sup>
								</label>
								<div class="controls">
									<form:input name="name" path="name"
										placeholder="T??n kh??ch h??ng" value="${sessionScope.client.name}" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">?????a ch??? <sup
									style="color: #ff0700;">* ${sessionScope.errAddress}</sup>
								</label>
								<div class="controls">
									<form:input name="address" path="address" placeholder="?????a ch???" value="${sessionScope.client.address}" />
									<span>* S??? nh??, t??n ???????ng, ph?????ng/x??, qu???n/huy???n,
										t???nh/th??nh ph???</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">??i???n tho???i <sup
									style="color: #ff0700;">* ${sessionScope.errPhonenumbers}</sup>
								</label>
								<div class="controls">
									<form:input name="phonenumbers" path="phonenumbers"
										placeholder="??i???n tho???i" value="${sessionScope.client.phonenumbers}"/>
									<span>* g???m 10 ch??? s???</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">T???ng ti???n <sup>*</sup>
								</label>
								<div class="controls">
									<form:input path="totalprice" readonly="true"
										value="${sessionScope.customerCartTotalPrice}" />
									<span>* ????y l?? s??? ti???n m?? b???n ph???i thanh to??n</span>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<form:button type="submit" class="btn">?????t h??ng</form:button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<jsp:include page="/WEB-INF/jsp/footerClient.jsp" flush="false"></jsp:include>
</body>
</html>