<%-- 
    Document   : createEntry
    Created on : 13/09/2017, 8:07:44 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="template.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Entry</title>
    </head>
    <body>
<<<<<<< HEAD
        <nav role="main">
            <div id= "topNav">
            <ul>
                <li><a href="index.html"> Logout </a></li>
                <li><img src="userIcon.png" class="icon"></li>
                <li><div id="usersName"> insert users name here </div></li>
                <a href="index.html">
                    <img src="RedLogo.png" class="logo" alt="Logo">
                </a>
            </ul>
            </div>
        </nav>
        
        <nav role="side">
            <ul>
                <li><a href="entries.jsp"> Dashboard </a></li>
                <li><a href="journals.jsp"> Journals </a></li>
                <li><a href="createEntry.jsp"> Add Journal Entry </a></li>
            </ul>
        </nav>        
        <h1></h1>  
        
        <p>
            <a href="entries.jsp">
                <img src="backArrow.png" class="backButton" alt="Go Back">
            <a/>        
        </p>

        <form action="newEntry.jsp" method="post">
=======
        <h1>Create Entry</h1>
        <form action="entries.jsp" method="post">
>>>>>>> EntryInit
            <table>
                <tr>
                    <td> Insert date here </td>
                <tr></tr>
                <td><h2> Entry Title: </h2></td>
                <tr></tr>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
<<<<<<< HEAD
                    <td><input type="text" name="content" placeholder="Begin typing here..." id="entryContent"></td>
=======
                    <td>Content </td>
                    <td><textarea name="content" rows="5"></textarea></td>
>>>>>>> EntryInit
                </tr>
                <tr>
                    <td><input type="submit" value="Create Entry"></td>
                </tr>
            </table>
        </form>
        <a href="entries.jsp">Return to Entries</a>
    </body>
</html>
