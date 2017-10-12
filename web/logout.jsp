<%-- 
    Document   : logout
    Created on : 10/10/2016, 12:01:34 AM
    Author     : Celine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- CSS Stylesheet setup -->
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
        <link href="template.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <!-- When a user wishes to log out, they must have their web session invalidated to end it -->
        <%
            session.invalidate();
        %>
    </head>
    <body>      
        <a href="index.html">
            <img src="WhtLogo.png" class="logoutLogo" alt="Logo">
        </a>
        <div id="journalAddTable">
            <table>
                <tr>
                    <td> You have successfully logged out. </td>
                </tr>
                <tr>
                    <td>Redirecting you to the home page now...</td>
                    <!-- Redirect user to the landing page, index -->
                    <%  String redirectURL = "index.html";
                        response.sendRedirect(redirectURL);
                    %> 
                </tr>
                <p></p>
            </table>
        </div>
                
        <!-- Setting the background image to fit different web browser and screen sizes by stretching -->
        <div id="background">
            <img src="DBackground.png" class="stretch" alt="background" />
        </div>  
    </body>
</html>
