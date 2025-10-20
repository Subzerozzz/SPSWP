<%-- Document : sider Created on : Sep 22, 2025, 10:05:16 AM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
</head>

<body>
  <div class="sidebar-main sidebar-menu-one sidebar-expand-md sidebar-color">
    <div class="mobile-sidebar-header d-md-none">
      <div class="header-logo">
          <a href="${pageContext.request.contextPath}/home">
              <img src="${pageContext.request.contextPath}/admin/img/logo1.png" alt="logo">
          </a>
      </div>
    </div>
    <div class="sidebar-menu-content">
      <ul class="nav nav-sidebar-menu sidebar-toggle-view">
        <li class="nav-item sidebar-nav-item">
          <a href="${pageContext.request.contextPath}/account" class="nav-link"><i
              class="flaticon-dashboard"></i><span>My Account</span></a>
        </li>
        <li class="nav-item sidebar-nav-item">
          <a href="${pageContext.request.contextPath}/change-password" class="nav-link"><i
              class="flaticon-classmates"></i><span>Change Password</span></a>
        </li>

        <c:choose>
          <c:when test="${sessionScope.account_club.role == 'admin'}">
            <li class="nav-item sidebar-nav-item">
              <a href="${pageContext.request.contextPath}/manager-account?action=list-account" class="nav-link"><i
                  class="flaticon-multiple-users-silhouette"></i><span>View Accounts</span></a>
            </li>
            <li class="nav-item sidebar-nav-item">
              <a href="${pageContext.request.contextPath}/manager-account?action=account-add" class="nav-link"><i
                  class="flaticon-technological"></i><span>Add Account</span></a>
            </li>
          </c:when>
          <c:when test="${sessionScope.account_club.role == 'manager'}">
            <li class="nav-item sidebar-nav-item">
              <a href="${pageContext.request.contextPath}/club?action=list-club" class="nav-link"><i
                  class="flaticon-technological"></i><span>View All Club</span></a>
            </li>
            <li class="nav-item sidebar-nav-item">
              <a href="${pageContext.request.contextPath}/club?action=list-club" class="nav-link"><i
                  class="flaticon-bed"></i><span>View Event Request</span></a>
            </li>
          </c:when>
          <c:when test="${sessionScope.account_club.role == 'president'}">
            <li class="nav-item sidebar-nav-item">
              <a href="${pageContext.request.contextPath}/managerMember" class="nav-link"><i
                  class="flaticon-technological"></i><span>View All Member</span></a>
            </li>
          </c:when>
        </c:choose>


        <!--            <li class="nav-item sidebar-nav-item">
              <a href="#" class="nav-link"><i class="flaticon-books"></i><span>Library</span></a>
              <ul class="nav sub-group-menu">
                <li class="nav-item">
                  <a href="all-book.html" class="nav-link"><i class="fas fa-angle-right"></i>All
                    Book</a>
                </li>
                <li class="nav-item">
                  <a href="add-book.html" class="nav-link"><i class="fas fa-angle-right"></i>Add New
                    Book</a>
                </li>
              </ul>
            </li>
            <li class="nav-item sidebar-nav-item">
              <a href="#" class="nav-link"><i class="flaticon-technological"></i><span>Acconunt</span></a>
              <ul class="nav sub-group-menu">
                <li class="nav-item">
                  <a href="all-fees.html" class="nav-link"><i class="fas fa-angle-right"></i>All Fees
                    Collection</a>
                </li>
                <li class="nav-item">
                  <a href="all-expense.html" class="nav-link"><i class="fas fa-angle-right"></i>Expenses</a>
                </li>
                <li class="nav-item">
                  <a href="add-expense.html" class="nav-link"><i class="fas fa-angle-right"></i>Add
                    Expenses</a>
                </li>
              </ul>
            </li>
            <li class="nav-item sidebar-nav-item">
              <a href="#" class="nav-link"><i
                  class="flaticon-maths-class-materials-cross-of-a-pencil-and-a-ruler"></i><span>Class</span></a>
              <ul class="nav sub-group-menu">
                <li class="nav-item">
                  <a href="all-class.html" class="nav-link"><i class="fas fa-angle-right"></i>All
                    Classes</a>
                </li>
                <li class="nav-item">
                  <a href="add-class.html" class="nav-link"><i class="fas fa-angle-right"></i>Add New
                    Class</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="all-subject.html" class="nav-link"><i class="flaticon-open-book"></i><span>Subject</span></a>
            </li>
            <li class="nav-item">
              <a href="class-routine.html" class="nav-link"><i class="flaticon-calendar"></i><span>Class
                  Routine</span></a>
            </li>
            <li class="nav-item">
              <a href="student-attendence.html" class="nav-link"><i
                  class="flaticon-checklist"></i><span>Attendence</span></a>
            </li>
            <li class="nav-item sidebar-nav-item">
              <a href="#" class="nav-link"><i class="flaticon-shopping-list"></i><span>Exam</span></a>
              <ul class="nav sub-group-menu">
                <li class="nav-item">
                  <a href="exam-schedule.html" class="nav-link"><i class="fas fa-angle-right"></i>Exam
                    Schedule</a>
                </li>
                <li class="nav-item">
                  <a href="exam-grade.html" class="nav-link"><i class="fas fa-angle-right"></i>Exam
                    Grades</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="transport.html" class="nav-link"><i class="flaticon-bus-side-view"></i><span>Transport</span></a>
            </li>
            <li class="nav-item">
              <a href="hostel.html" class="nav-link"><i class="flaticon-bed"></i><span>Hostel</span></a>
            </li>
            <li class="nav-item">
              <a href="notice-board.html" class="nav-link"><i class="flaticon-script"></i><span>Notice</span></a>
            </li>
            <li class="nav-item">
              <a href="messaging.html" class="nav-link"><i class="flaticon-chat"></i><span>Messeage</span></a>
            </li>
            <li class="nav-item sidebar-nav-item">
              <a href="#" class="nav-link"><i class="flaticon-menu-1"></i><span>UI Elements</span></a>
              <ul class="nav sub-group-menu">
                <li class="nav-item">
                  <a href="notification-alart.html" class="nav-link"><i class="fas fa-angle-right"></i>Alart</a>
                </li>
                <li class="nav-item">
                  <a href="button.html" class="nav-link"><i class="fas fa-angle-right"></i>Button</a>
                </li>
                <li class="nav-item">
                  <a href="grid.html" class="nav-link"><i class="fas fa-angle-right"></i>Grid</a>
                </li>
                <li class="nav-item">
                  <a href="modal.html" class="nav-link"><i class="fas fa-angle-right"></i>Modal</a>
                </li>
                <li class="nav-item">
                  <a href="progress-bar.html" class="nav-link"><i class="fas fa-angle-right"></i>Progress Bar</a>
                </li>
                <li class="nav-item">
                  <a href="ui-tab.html" class="nav-link"><i class="fas fa-angle-right"></i>Tab</a>
                </li>
                <li class="nav-item">
                  <a href="ui-widget.html" class="nav-link"><i class="fas fa-angle-right"></i>Widget</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="map.html" class="nav-link"><i class="flaticon-planet-earth"></i><span>Map</span></a>
            </li>
            <li class="nav-item">
              <a href="account-settings.html" class="nav-link"><i class="flaticon-settings"></i><span>Account</span></a>
            </li>-->
      </ul>
    </div>
  </div>
</body>

</html>