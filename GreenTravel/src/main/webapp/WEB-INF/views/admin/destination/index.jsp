<%-- 
    Author     : kyqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Home /</span> Area</h4>
    <c:if test="${param.success=='true'}">                                                      
        <div id="alertSuccess" style="position: absolute; top: 12px; right: 16px;" class="bs-toast toast fade show bg-success toast-placement-ex" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <i class="bx bx-bell me-2"></i>
                <div class="me-auto fw-semibold">Notification</div>
                <small>just second ago...</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                This is success process...
            </div>
        </div>
    </c:if>
    <!-- Hoverable Table rows -->
    <div class="card">
        <div style="padding-bottom: 0px" class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0"></h5>
            <small class="text-muted float-end"><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/employee/manage-destination/create-destination">Create</a></small>
        </div>
        <div class="table-responsive text-nowrap">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Destination Name</th>
                        <th>Area</th>             
                        <th>Image</th>                     
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listDestination}" var="itemDestination">
                        <tr>
                            <td>${itemDestination.name}</td>
                            <td>${itemDestination.areaID.name}</td>                          
                            <td>

                                <img  src="<c:url value="${itemDestination.image}"/>" alt="${itemDestination.image}" height="75px" width="100px" style="border-radius: 10%">

                            </td>                           
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu">                                        
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/employee/manage-destination/edit-destination/${itemDestination.destinationID}"
                                           ><i class="bx bx-edit-alt me-2"></i> Edit</a>
                                        <a class="dropdown-item destination__button__deleteDestination" href="#"  data-id="${itemDestination.destinationID}"
                                           ><i class="bx bx-trash me-2"></i> Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
              

        <script src="<c:url value="/resources/admin/jscustom/js-controller-destination.js"/>"></script>
