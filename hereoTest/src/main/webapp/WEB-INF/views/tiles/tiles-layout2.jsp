<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>">
	<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/common/style.css'></c:url>" />
	
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
