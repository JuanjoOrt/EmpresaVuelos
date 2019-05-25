<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="modelo.TrayectoFijado"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body><br><br><br><br>
       </div>
    <div class="col-sm-1"></div>
    <div class="col-sm-5" style="background-color: #D6D6D6">
        <form class="form-signin" action="<%=request.getContextPath()%>/controlador" method="GET">
        <h1 class="form-signin-heading">Para comprar un billete necesitas logearte o registrarte</h1><br>
        Usuario: 
        <input type="text" name="user" class="form-control" placeholder="Usuario">
        Contraseña:
        <input type="password" name="pass" class="form-control" placeholder="Contraseña">
        <input type="hidden" name="accion" value="logearteParaComprar"/><br>
        <div class="col-sm-6"><input type="submit" name="Entrar" value="Entrar" class="btn btn-primary btn-lg"></div></form>
        
        <div class="col-sm-6"><a href="./usuarios/registrar.jsp"><button type="button" class="btn-lg btn-warning">Registrate</button></a></div>
       <br><br><br>
    </div>
    </body>
</html>