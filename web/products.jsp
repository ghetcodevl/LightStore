<%-- 
    Document   : products
    Created on : Apr 13, 2026, 10:17:38 PM
    Author     : Anh Tuan
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Website Đèn Trang Trí</title>

<!-- ================= CSS ================= -->
<style>
/* RESET */
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:Arial;background:#f5f5f5}

/* ================= HEADER ================= */
header{
    background:#fff;
    border-bottom:1px solid #ddd;
    position:relative; /* QUAN TRỌNG */
}

.top-menu{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 30px;
}

.logo{
    font-size:22px;
    font-weight:bold;
}

/* MENU */
nav a{
    margin:0 10px;
    text-decoration:none;
    color:#333;
    position:relative;
}
nav a:hover{color:#d4a017}

nav a::after{
    content:"";
    position:absolute;
    width:0;
    height:2px;
    background:#d4a017;
    bottom:-5px;
    left:0;
    transition:.3s;
}
nav a:hover::after{width:100%}

/* ICONS */
.icons{
    display:flex;
    align-items:center;
    gap:15px;
}

.icon{
    cursor:pointer;
    font-size:18px;
}

/* USER MENU */
.user-menu{
    position:relative;
}

/* DROPDOWN */
.dropdown{
    position:absolute;
    top:35px;
    right:0;
    background:#fff;
    border:1px solid #ddd;
    border-radius:5px;
    width:160px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    z-index:999; /* QUAN TRỌNG */
}

.dropdown a{
    display:block;
    padding:10px;
    text-decoration:none;
    color:#333;
}

.dropdown a:hover{
    background:#f0f0f0;
    color:#d4a017;
}

/* HIDE */
.hidden{
    display:none;
}
/* ================= BANNER ================= */
.banner{
    height:200px;
    background:url('https://via.placeholder.com/1200x200') center/cover;
}

/* ================= LAYOUT ================= */
.container{
    display:flex;
    padding:20px;
}

/* LEFT MENU */
.sidebar{
    width:250px;
    background:#fff;
    padding:15px;
    border-radius:8px;
}
.sidebar ul{list-style:none}
.sidebar li{
    padding:10px;
    border-bottom:1px solid #eee;
    cursor:pointer;
    transition:.3s;
}
.sidebar li:hover{
    background:#f0f0f0;
    color:#d4a017;
}
.sidebar li a {
    text-decoration: none;
    
}

/* ================= CONTENT ================= */
.content{flex:1;margin-left:20px}
.section-title{font-weight:bold;margin:15px 0}

.products{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:15px;
}

.product{
    background:#fff;
    padding:10px;
    border-radius:10px;
    text-align:center;
    transition:.3s;
}
.product:hover{
    transform:translateY(-5px);
    box-shadow:0 4px 10px rgba(0,0,0,.1);
}
.product img{
    width:100%;
    height:150px;
    object-fit:cover;
}
.price{color:#d4a017;font-weight:bold}

/* ================= FOOTER ================= */
footer{
    background:#222;
    color:#fff;
    text-align:center;
    padding:20px;
    margin-top:20px;
}

/* ================= UTIL ================= */
.hidden{display:none}
</style>
</head>

<body>

<!-- ================= HEADER ================= -->
<header>
    <div class="top-menu">
        <div class="logo">LIGHTSTORE</div>
        <nav>
            <a href="ProductsHome?tag=new">Hàng mới</a>
            <a href="ProductsHome?tag=bestseller">Bán chạy</a>
            <a href="ProductsHome?tag=sale">Giảm giá</a>
            <a href="ProductsHome">Trang chủ</a>
        </nav>
        <div class="icons">

            <!-- GIỎ HÀNG -->
            <a href="cart.jsp" class="icon">🛒</a>

            <!-- USER -->
           <%
//                String user = (String) session.getAttribute("user");
//                if(user != null){
            %> 

                <div class="user-menu">
                    <span class="icon" onclick="toggleUserMenu()">👤</span>
                    <div id="dropdown" class="dropdown hidden">
                        <a href="change-password.jsp">Đổi mật khẩu</a>
                        <a href="logout">Đăng xuất</a>
                    </div>
                </div>

                <%
//                }
               %>

        </div>
    </div>
    <div class="banner"></div>
</header>

<!-- ================= MAIN ================= -->
<div class="container">

    <!-- LEFT MENU -->
    <aside class="sidebar">
        <ul>
            <li><a href="ProductsHome?tag=new">Hàng mới</a></li>
            <li><a href="ProductsHome?tag=bestseller">Bán chạy</a></li>
            <li><a href="ProductsHome?tag=sale">Giảm giá</a></li>
            <li><a href="ProductsHome">Trang chủ</a></li>
        </ul>
    </aside>

    <!-- CONTENT -->
    <main class="content">

        <!-- HOME -->
        <section id="home" class="page">
            <div class="section-title">Sản phẩm</div>
            <div class="products">
                <%
                    List<Product> list = (List<Product>) request.getAttribute("products");

                    if(list != null){
                        for(Product p : list){
                %>

                    <div class="product">
                        <img src="<%= p.getImage() %>" alt="">
                        <p><%= p.getName() %></p>
                        <div class="price"><%= p.getPrice() %> đ</div>
                    </div>

                <%
                        }
                    }
                %>
                </div>
        </section>

    </main>
</div>

<!-- ================= FOOTER ================= -->
<footer>
    Lại Thế Trường - Đặng Minh Quốc - Lê Anh Tuấn
</footer>

<!-- ================= JS ================= -->
<script>
//function showPage(pageId){
//    const pages=document.querySelectorAll('.page');
//    pages.forEach(p=>p.classList.add('hidden'));
//    document.getElementById(pageId).classList.remove('hidden');
//}
function toggleUserMenu(){
    document.getElementById("dropdown").classList.toggle("hidden");
}

document.addEventListener("click", function(e){
    const menu = document.querySelector(".user-menu");
    if(!menu.contains(e.target)){
        document.getElementById("dropdown").classList.add("hidden");
    }
});
</script>

</body>
</html>
