<%@ page import="java.util.*" %>
<%@ page session="true" %>
<jsp:include page="header.jsp" />

<%
    List<String[]> availableActivities = (List<String[]>) request.getAttribute("availableActivities");
    List<String[]> inProgressActivities = (List<String[]>) request.getAttribute("inProgressActivities");
    List<String[]> completedActivities = (List<String[]>) request.getAttribute("completedActivities");
%>

<div class="container mt-5">

    <h2 class="text-center mb-4" style="color:#BF932A;">? Available Divine Activities ?</h2>
    <div class="row">
        <% if (availableActivities != null && !availableActivities.isEmpty()) {
            for (String[] a : availableActivities) { %>
                <div class="col-md-4">
                    <div class="card shadow-sm mb-4" style="border-radius:12px;">
                        <div class="card-body">
                            <h5 class="card-title" style="color:#BF932A;"><%= a[1] %></h5>
                            <p class="card-text"><%= a[2] %></p>
                            <p><strong>Points:</strong> <%= a[3] %></p>
                            <p><strong>Duration:</strong> <%= a[4] %> day(s)</p>
                            <form method="post" action="ActivityServlet">
                                <input type="hidden" name="activityId" value="<%= a[0] %>">
                                <input type="hidden" name="action" value="start">
                                <button class="btn btn-dark w-100">Start Activity ?</button>
                            </form>
                        </div>
                    </div>
                </div>
        <%  } 
        } else { %>
            <div class="alert alert-warning text-center">No new activities available.</div>
        <% } %>
    </div>

    <h2 class="text-center mb-4 mt-5" style="color:#BF932A;">? In Progress Activities ?</h2>
    <div class="row">
        <% if (inProgressActivities != null && !inProgressActivities.isEmpty()) {
            for (String[] a : inProgressActivities) { %>
                <div class="col-md-4">
                    <div class="card shadow-sm mb-4" style="border-radius:12px;">
                        <div class="card-body">
                            <h5 class="card-title" style="color:#BF932A;"><%= a[1] %></h5>
                            <p class="card-text"><%= a[2] %></p>
                            <p><strong>Points:</strong> <%= a[3] %></p>
                            <p><strong>Progress:</strong> <%= a[7] %> %</p>
                            <form method="post" action="ActivityServlet">
                                <input type="hidden" name="activityId" value="<%= a[0] %>">
                                <input type="hidden" name="action" value="saveNotes">
                                <textarea name="notes" class="form-control mb-2" placeholder="Your Notes/Reflections..."><%= a[10] %></textarea>
                                <button class="btn btn-warning w-100 mb-2">Save Notes ??</button>
                            </form>
                            <form method="post" action="ActivityServlet">
                                <input type="hidden" name="activityId" value="<%= a[0] %>">
                                <input type="hidden" name="action" value="complete">
                                <button class="btn btn-success w-100">Mark as Completed ?</button>
                            </form>
                        </div>
                    </div>
                </div>
        <%  } 
        } else { %>
            <div class="alert alert-info text-center">No ongoing activities. Start a new activity!</div>
        <% } %>
    </div>

    <h2 class="text-center mb-4 mt-5" style="color:#BF932A;">? Completed Activities ?</h2>
    <div class="row">
        <% if (completedActivities != null && !completedActivities.isEmpty()) {
            for (String[] a : completedActivities) { %>
                <div class="col-md-4">
                    <div class="card shadow-sm mb-4" style="border-radius:12px; background-color:#f9f9f9;">
                        <div class="card-body">
                            <h5 class="card-title" style="color:#BF932A;"><%= a[1] %></h5>
                            <p class="card-text"><%= a[2] %></p>
                            <p><strong>Points Earned:</strong> <%= a[3] %></p>
                            <p><strong>Progress:</strong> 100%</p>
                            <% if (a[10] != null && !a[10].isEmpty()) { %>
                                <p><strong>Notes:</strong> <%= a[10] %></p>
                            <% } %>
                        </div>
                    </div>
                </div>
        <%  } 
        } else { %>
            <div class="alert alert-info text-center">You haven't completed any activities yet.</div>
        <% } %>
    </div>

</div>

<jsp:include page="footer.jsp" />
