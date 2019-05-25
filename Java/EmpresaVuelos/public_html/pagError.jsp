<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.io.*"%>
<%@ page isErrorPage="true"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color:#80ABFF;">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
        <br><br><div class="panel panel-default">
        <div class="panel-body"><h1>PAGINA DE ERRORES : <%out.println(exception.getMessage());%></h1></div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">
                
                        <% PrintWriter pw =new PrintWriter(out);
                         exception.printStackTrace(pw);%>

            </div>
    </div>
        
        
        
        
        </div>
        <div class="col-sm-2"></div>
    </body>
</html>