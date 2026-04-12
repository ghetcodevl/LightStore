<%-- 
    Document   : index
    Created on : Apr 7, 2026, 10:43:58 AM
    Author     : lttru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4">THẾ GIỚI ĐÈN TRANG TRÍ CASANI</h1>
        <div class="row">
            <c:forEach items="${listP}" var="o">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="${o.image}" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">${o.name}</h5>
                            <p class="text-danger fw-bold">${o.price} VNĐ</p>
                            <a href="#" class="btn btn-warning">Mua ngay</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>