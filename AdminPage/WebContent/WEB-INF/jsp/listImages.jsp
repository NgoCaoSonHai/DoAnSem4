<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
<!-- DataTables -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/resources/dist/css/adminlte.min.css" />">
<title>AdminLTE 3 | Ảnh</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/preload.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/jsp/navbar.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/jsp/sidebar.jsp" flush="false"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1302.4px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Sách</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="home">Quản lý</a></li>
								<li class="breadcrumb-item active">Ảnh</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Danh sách</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Mã ảnh</th>
									<th>Tên sách</th>
									<th>Chú thích</th>
									<th>Ảnh đại diện</th>
									<th>Ngày tạo</th>
									<th>Ảnh</th>
									<th>Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="i">
									<tr>
										<td>${i.id}</td>
										<td>${i.book.name}</td>
										<td>${i.caption}</td>
										<td>${i.isdefault ? 'Đúng' : 'Không'}</td>
										<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
												value="${i.datecreated}" /></td>
										<td>${i.path}</td>
										<td>
											<div class="tools">
												<a href="initUpdateImage?id=${i.id}"><i
													class="fas fa-edit"></i></a> <a href="deleteImage?id=${i.id}"><i
													class="fas fa-trash"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>Mã ảnh</th>
									<th>Tên sách</th>
									<th>Chú thích</th>
									<th>Ảnh đại diện</th>
									<th>Ngày tạo</th>
									<th>Ảnh</th>
									<th>Hành động</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.card-body -->
					<div class="card-footer clearfix">
						
					</div>
				</div>
				<!-- /.card -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="/WEB-INF/jsp/footer.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/jsp/controlsidebar.jsp" flush="false"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/jsp/script.jsp" flush="true"></jsp:include>
	<!-- DataTables  & Plugins -->
	<script
		src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-responsive/js/dataTables.responsive.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-buttons/js/dataTables.buttons.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/jszip/jszip.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/pdfmake/pdfmake.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/pdfmake/vfs_fonts.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.html5.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.print.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.colVis.min.js" />"></script>
	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
		});
	</script>
</body>
</html>