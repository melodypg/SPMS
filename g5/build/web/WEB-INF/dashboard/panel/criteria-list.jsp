<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Criteria List</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                List of Criteria
            </div>
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-auto mx-1">
                        <select class="form-select" onchange="location = this.value">
                            <c:forEach items="${subjects}" var="sub">
                                <option value="${pageContext.request.contextPath}/dashboard/criterias/list?filterSubject=${sub.getId()}" ${sub.getId() == filterSubjectId? "selected" : ""}>${sub.getSubject_name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-auto mx-1">
                        <select class="form-select" onchange="location = this.value">
                            <c:forEach items="${iterations}" var="iter">
                                <option value="${pageContext.request.contextPath}/dashboard/criterias/list?filterSubject=${filterSubjectId}&filterIteration=${iter.getId()}" ${iter.getId() == filterIterationId? "selected" : ""}>${iter.getIteration_name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-auto mx-1">
                        <select class="form-select" onchange="location = this.value">
                            <option value="${pageContext.request.contextPath}/dashboard/criterias/list">Filter by Status</option>
                            <option value="${pageContext.request.contextPath}/dashboard/criterias/list?filterSubject=${filterSubjectId}&filterIteration=${filterIterationId}&filterStatus=active" ${status == true? "selected" : ""}>Active</option>
                            <option value="${pageContext.request.contextPath}/dashboard/criterias/list?filterSubject=${filterSubjectId}&filterIteration=${filterIterationId}&filterStatus=inactive" ${status == false? "selected" : ""}>Inactive</option>
                        </select>
                    </div>
                    <div class="col-auto mx-1">
                        <form action="${pageContext.request.contextPath}/dashboard/criterias/list" method="GET">
                            <div class="input-group mb-3">
                                <input type="hidden" name="filterSubject" value="${filterSubjectId}"/>
                                <input type="hidden" name="filterIteration" value="${filterIterationId}"/>
                                <input type="text" class="form-control" name="searchName" id="searchName" value="${searchName}" placeholder="Criteria Name">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-auto mx-1">
                        <select class="form-select" onchange="location = this.value">
                            <option value="${pageContext.request.contextPath}/dashboard/criterias/list">Order by Evaluation Weight</option>
                            <option value="${pageContext.request.contextPath}/dashboard/criterias/list?filterSubject=${filterSubjectId}&filterIteration=${filterIterationId}&order=asc" ${order == "asc"? "selected" : ""}>Ascending</option>
                            <option value="${pageContext.request.contextPath}/dashboard/criterias/list?filterSubject=${filterSubjectId}&filterIteration=${filterIterationId}&order=desc" ${order == "desc"? "selected" : ""}>Descending</option>
                        </select>
                    </div>
                    <c:if test="${user.getRole_id() == 2 || user.getRole_id() == 3}">
                        <div class="col-auto mx-1">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/dashboard/criterias/add?subject=${filterSubjectId}">Add new Criteria</a>
                        </div>
                    </c:if>
                </div>
                <table class="table">
                    <thead>
                        <tr class="table-dark">
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Evaluation Weight</th>
                            <th scope="col">Team Eval</th>
                            <th scope="col">Max LOC</th>
                            <th scope="col">Status</th>
                                <c:if test="${user.getRole_id() == 2 || user.getRole_id() == 3}">
                                <th scope="col" class="text-center">Actions</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${criterias}" var = "criter">
                            <tr>
                                <th scope="row">${criter.getId()}</td>
                                <td>${criter.getCriteriaName()}</td>
                                <td>${criter.getEvalWeight()}</td>
                                <td>${criter.isIsTeamEval()}</td>
                                <td>${criter.getMaxLoc()}</td>
                                <td>${criter.isStatus() ? "Active" : "Inactive"}</td>
                                <c:if test="${user.getRole_id() == 2 || user.getRole_id() == 3}">
                                    <td>
                                        <div class="d-flex p-2 justify-content-between">
                                            <a class="btn ${!criter.isStatus() ? "btn-success" : "btn-danger"}" onclick="return confirm('Are you sure you want to ${!criter.isStatus() ? "activate" : "deactivate"} this criteria?')"
                                               href="${pageContext.request.contextPath}/dashboard/criterias/update?id=${criter.getId()}&status=${!criter.isStatus()}">${!criter.isStatus() ? "Activate" : "Deactivate"}
                                            </a>
                                            <a class="btn btn-primary" 
                                               href="${pageContext.request.contextPath}/dashboard/criterias/detail?id=${criter.getId()}">Detail</a>
                                        </div>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav>
                    <ul class="pagination">
                        <%
                            int maxPage = (Integer) request.getAttribute("max-page");
                            int currentPage = (Integer) request.getAttribute("current-page");
                            String query = (String) request.getAttribute("query");
                            for (int i = 1; i < maxPage; i++) {
                        %>
                        <li class="page-item <%= currentPage == i ? "active" : ""%>"><a class="page-link" href="${pageContext.request.contextPath}/dashboard/criterias/list?<%=query%>page=<%=i%>"><%=i%></a></li>
                            <%}%>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</main>

