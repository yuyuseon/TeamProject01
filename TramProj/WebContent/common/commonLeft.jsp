<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
  <li class="nav-item active">
    <a class="nav-link" href="#">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>목록</span>
    </a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fas fa-fw fa-folder"></i>
      <span>페이지</span>
    </a>
    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
      <h6 class="dropdown-header">Login Screens:</h6>
      <a class="dropdown-item" href="login.html">Login</a>
      <a class="dropdown-item" href="register.html">Register</a>
      <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
      <div class="dropdown-divider"></div>
      <h6 class="dropdown-header">Other Pages:</h6>
      <a class="dropdown-item" href="404.html">404 Page</a>
      <a class="dropdown-item" href="blank.html">Blank Page</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./ListCtrl.do">
      <i class="fas fa-fw fa-table"></i>
      <span>회원 리스트</span></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./SanatoriumListCtrl.do">
      <i class="fas fa-fw fa-table"></i>
      <span>시설 리스트</span></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./PatientListCtrl.do">
      <i class="fas fa-fw fa-table"></i>
      <span>환자 리스트</span></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./ListCtrl.do">
      <i class="fas fa-bell fa-fw"></i>
      <span>푸시 발송</span></a>
  </li>
</ul>