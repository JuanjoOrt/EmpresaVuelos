<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Noticia"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Oregano" rel="stylesheet">
        
    </head>
    <body>
    <%
    ArrayList<Noticia> listaNoticias = (ArrayList<Noticia>)session.getAttribute("listaNoticias");
    
    %>
    
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><div style="font-family: 'Oregano', cursive; font-size: 20pt;">Panel de administración</div></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="./menuAdmin.jsp">Home</a></li>
            <li class="active"><a href="#Noticias">Noticias</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerEmpleados">Ver empleados</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerUsuarios">Gestion usuarios</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionAsignarNuevoTrayecto">Asignar nuevo trayecto</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerEstadistica">Ver trayectos más vendidos</a></li>
          </ul>
          
          <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="<%=request.getContextPath()%>/controlador" method="GET">
            <input type="hidden" name="accion" value="salirPanelAdmin"/>
            <input type="submit" name="Salir" value="Salir" class="btn btn-danger">
          </form>
          </div><!--/.navbar-collapse -->         
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <br><br><br><br><br><br>
    
    <div class="col-sm-2"></div>
    <div class="col-sm-8"><br>
    <table class="table">
                <tr>
                    <td>
                        <b>Noticia</b>
                    </td>
                    <td>
                        <b></b>
                    </td>
                    <td>
                        <b></b>
                    </td>
                </tr>
                <tr>
                <%
                for(int i=0;i<listaNoticias.size(); i++){
                    Noticia noticia = listaNoticias.get(i);
                    %><td><%=noticia.getTitulo()%></td><%
                    %><td><form action="<%=request.getContextPath()%>/controlador" method="GET">
                                <input type="hidden" name="accion" value="editarNoticia"/>
                                <input type="hidden" name="idNoticia" value="<%=noticia.getIdNoticia()%>"/>
                                <input type="submit" name="editar" value="Editar" class="btn btn-warning"/>
                            </form>
                    </td><%
                    %><td><form action="<%=request.getContextPath()%>/controlador" method="GET">
                                <input type="hidden" name="accion" value="eliminarNoticia"/>
                                <input type="hidden" name="idNoticia" value="<%=noticia.getIdNoticia()%>"/>
                                <input type="submit" name="eliminar" value="Eliminar" class="btn btn-danger"/>
                            </form>
                    </td></tr><%
                    }
                %>
                </tr>
        </table>
        <br>
        
        <a href="crearNoticia.jsp"><button type="button" class="btn btn-info">Crear noticia</button></a>
    </div>
    <div class="col-sm-2"></div>



    
    
    </body>
</html>