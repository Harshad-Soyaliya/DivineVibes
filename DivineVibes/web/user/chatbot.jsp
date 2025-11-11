<%@ page session="true" %>
<jsp:include page="header.jsp" />

<div class="container mt-5">

    <h2 class="text-center mb-4" style="color:#BF932A;">?? Divine Chatbot</h2>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <form method="post" action="ChatbotServlet">
                <div class="mb-3">
                    <textarea class="form-control" name="message" rows="3" placeholder="Type your message..."><%= request.getAttribute("userMessage") != null ? request.getAttribute("userMessage") : "" %></textarea>
                </div>
                <button type="submit" class="btn btn-dark w-100">Send</button>
            </form>

            <% if (request.getAttribute("botResponse") != null) { %>
                <div class="mt-4 p-3 shadow-sm" style="border-radius:12px; background-color:#FCFCF7;">
                    <h5>Bot Response:</h5>
                    <p style="color:#BF932A;"><%= request.getAttribute("botResponse") %></p>
                </div>
            <% } %>

        </div>
    </div>

</div>

<jsp:include page="footer.jsp" />