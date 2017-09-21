<%-- 
    Document   : entries
    Created on : 10/09/2017, 12:35:45 PM
    Author     : Max
--%>

<%@page import="controllers.EntryController"%>
<%@page import="controllers.JournalController"%>
<%@page import="controllers.LoginController"%>
<%@page import="models.Entries"%>
<%@page import="java.util.Date"%>
<%@page import="models.Entry"%>
<%@page import="models.Journal"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- <link href="template.css" rel="stylesheet" type="text/css"/> -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entries</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <script type="text/javascript" language="javascript" src="entries.js"></script>
    </head>
    <body>
        <%  if(session.getAttribute("entryApp") == null){
            String filePath = application.getRealPath("WEB-INF/entries.xml"); %>
                <jsp:useBean id="entryApp" class="controllers.EntryController" scope="session">
                    <jsp:setProperty name="entryApp" property="filePath" value="<%=filePath%>"/>
                </jsp:useBean>
        <% }
            EntryController entryApp = (EntryController) session.getAttribute("entryApp");
        
           LoginController userApp = (LoginController) application.getAttribute("userApp");
           JournalController journalApp = (JournalController) session.getAttribute("journalApp");
           User user = (User) session.getAttribute("user");
           journalApp.setUser(user);
           String parameter = request.getParameter("id");
           if(parameter != null){
               Journal journal = journalApp.getJournalFromID(Integer.parseInt(parameter));
               session.setAttribute("journal", journal);
               entryApp.setEntries(journal.getEntries());
           }
           Journal journal = (Journal) session.getAttribute("journal");
        %>
        
        <nav role="side">
            <ul>
                <p></p>
                <li><a href="entries.jsp"> Dashboard </a></li>
                <li><a href="journals.jsp"> Journals </a></li>
                <li><a href="createEntry.jsp"> Add Journal Entry </a></li>
            </ul>
        </nav> 
        
        <nav role="main">
            <div id= "topNav">
            <ul>
                <li><a href="index.html"> Logout </a></li>
                <li><img src="userIcon.png" class="icon"></li>
                <li><div id="usersName"> <%= user.getName() %> </div></li>
                <a href="index.html">
                    <img src="RedLogo.png" class="logo" alt="Logo">
                </a>
            </ul>
            </div>
        </nav>
        
        <h1><%= journal.getTitle()%></h1>
        <h2><%= journal.getDescription()%></h2>
        <p>Created: <%= journal.getDateCreated()%>   Modified: <%= journal.getLastModified() %></p>
        <h3>Entries</h3>
        <button type="button" onClick="makeRequest()">Hide</button>
        <%
            if(request.getParameter("title") != null){
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                int userID = user.getUserID();
                int journalID = journal.getJournalID();
                int entryID = entryApp.getNewEntryID();
                Date dateCreated = new Date();
                Date dateModified = new Date();
                Entry entry = new Entry(userID, journalID, entryID, title, content, "visible", dateModified);
                journal.addEntry(entry);
                entryApp.saveEntries();
            }
            if(entryApp.getNonHiddenEntries().getEntries().size() > 0)
            { %>
                <table>
                    <% for(Entry e : entryApp.getNonHiddenEntries().getEntries()){ %>
                    <tr>
                        <td><input type="checkbox" class="entryCheck" name="<%= e.getEntryID()%>" value="<%= e.getEntryID() %>"></td>
                        <td onClick="entryClick(this, <%=e.getEntryID()%>)"><%= e.getTitle() %></td>
                        <td onClick="entryClick(this, <%=e.getEntryID()%>)"><%= e.getContentSnippet()%></td>
                        <td><%= e.getFlag() %></td>
                        <td><input type="hidden" value="<%= e.getEntryID()%>" name="entryID" id="entryID"></td>
                    </tr>
                    <% } %>
                </table>              
            <% }
            else{
                %><p>You have no entries</p><%
            }
            %>
            <a href="createEntry.jsp">Create new entry</a>
            <a href="journals.jsp">Return to Journals</a>
    </body>
</html>

<script type="text/javascript">
    function entryClick(elmnt, entryID){
       elmnt.style.color = 'red';
       var currentURL = window.location.href;
        if(currentURL.indexOf('entries') > 0){
            currentURL = currentURL.substring(0, currentURL.indexOf('entries'));
            currentURL = currentURL + "viewEntry.jsp";
        }
       window.location = currentURL + "?id=" + entryID;
   }
</script>
