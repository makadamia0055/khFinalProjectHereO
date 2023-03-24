<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/hereoTest/resources/css/common/bootstrap.min.css">
	<script type="text/javascript" src="/hereoTest/resources/js/common/jquery.js"></script>
	<script type="text/javascript" src="/hereoTest/resources/js/common/popper.min.js"></script>
	<script type="text/javascript" src="/hereoTest/resources/js/common/bootstrap.bundle.min.js"></script>
	<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet" />
	
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
