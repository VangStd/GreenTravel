<%-- 
    Author     : kyqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
    #filterLt{
        display: flex;
        margin: 0 10%;
        margin-bottom:  20px;
        text-align: center;
    }
    #filterLt .search-input{
        width: 30%;
        height: 40px;
        padding: 0 10px;
        margin: 0 1%;
    }

</style>
<!-- start banner Area -->
<section class="about-banner relative">
    <div class="overlay overlay-bg"></div>
    <div class="container">				
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    Local Travels				
                </h1>	
                <p class="text-white link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="${pageContext.request.contextPath}/localtravel/page/1"> Local Travels</a></p>
            </div>	
        </div>
    </div>
</section>
<!-- End banner Area -->	


<!-- Start popular-destination Area -->
<section class="popular-destination-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">Popular Local Travels</h1>
                    <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, day.</p>
                </div>
            </div>
        </div>
        <form:form action="${pageContext.request.contextPath}/filter-localtravel" method="post" modelAttribute="filterLt"> 
            <form:select cssClass="search-input" id="basic-default-username" path="destinationID">
                <form:option label="--Destination--" value="0"/>
                <form:options cssClass="form-control" items="${listDestination}" itemLabel="name" itemValue="destinationID" />
            </form:select>
            <form:input cssClass="search-input" path="keyword" placeholder="Local Travel name to search..." />
            <button class="search-input genric-btn primary" type="submit" >Search...</button>
        </form:form>
        <div class="row">
            <c:forEach items="${listLt}" var="itemLt">
                <div style="padding-bottom: 40px" class="col-lg-4">
                    <div class="single-destination relative">
                        <div class="thumb relative">
                            <div class="overlay overlay-bg"></div>
                            <img height="200px" src="<c:url value="${itemLt.image}"/>" alt="${itemLt.name}">                     
                        </div>
                        <div class="desc">	                   		
                            <h4>${itemLt.name}</h4>
                            <p>${itemLt.destinationID.name}</p>	
                        </div>
                    </div>
                    <div>
                        ${itemLt.description}
                    </div> 
                </div>
            </c:forEach>      											
        </div>
        <c:if test="${pagination=='pagination'}">
            <c:if test="${totalPage>1}">
                <ul  class="store-pagination">
                    <c:if test="${pageIndex >1}">
                        <li>
                            <a class="" href="${pageContext.request.contextPath}/localtravel/page/1" title="First"><i class="fa fa-angle-double-left"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/localtravel/page/${pageIndex-1}" title="Previous"><i class="fa fa-angle-left"></i></a>
                        </li>
                    </c:if>             
                    <c:forEach begin="${startPage}" end="${endPage}" step="1" var="currentPage">
                        <li 
                            <c:if test="${currentPage==pageIndex}">
                                class="active"
                            </c:if>
                            >
                            <a href="${pageContext.request.contextPath}/localtravel/page/${currentPage}" title="Page ${currentPage}">${currentPage}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageIndex < totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/localtravel/page/${pageIndex+1}" title="Next"><i class="fa fa-angle-right"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/localtravel/page/${totalPage}" title="Last"><i class="fa fa-angle-double-right"></i></a>
                        </li>
                    </c:if>
                </ul>
            </c:if>
        </c:if>
    </div>	
</section>
<!-- End popular-destination Area -->



