<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Fijo"%>
<%@ page import="modelo.Becario"%>
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
    String usuario = (String)session.getAttribute("usuarioAdmin");
    ArrayList<Fijo> listaFijos = (ArrayList<Fijo>)session.getAttribute("listaFijos");
    
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
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionNoticias">Noticias</a></li>
            <li class="active"><a href="<%=request.getContextPath()%>/controlador?accion=accionVerEmpleados">Ver empleados</a></li>
            <li><a href="<%=request.getContextPath()%>/controlador?accion=accionVerUsuarios">Gestion usuarios</a></li>
            <li><a href="#AsignarTrayecto">Asignar trayecto nuevo</a></li>
            <li><a href="#verTrayectosVendidos">Ver trayectos más vendidos</a></li>
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
    
    <div class="col-sm-1"></div>
    <div class="col-sm-10">
    
    
        <a href="./crearTrabajadorFijo.jsp"><button type="button" class="btn btn-info">Contratar nuevo trabajador Fijo</button></a>
        <a href="./crearTrabajadorBecario.jsp"><button type="button" class="btn btn-info">Contratar nuevo becario</button></a><br><br>
        
        
      <%
            for(int i=0;i<listaFijos.size(); i++){
             %>
                <table  class="table">
                        <tr>
                         <td><b>DNI</b></td> <td><b>NOMBRE</b></td> <td><b>FECHA DE NACIMIENTO</b></td>  <td><b>EMAIL</b></td>  <td><b>SALARIO</b></td>
                        </tr>
             <%
                Fijo fijo = listaFijos.get(i);
                ArrayList<Becario> listaBecarios = fijo.getListaBecarios();
                %>
                <%= "<tr> <td>"+fijo.getDni()+ 
                "</td><td>"+fijo.getNombre()+
                "</td><td>"+fijo.getFechaNacimiento()+
                "</td><td>"+fijo.getEMail()+
                "</td><td>"+fijo.getSalario()+" € "+
                "</td></tr>"
                        %><%
                                if (listaBecarios.size()>= 1){
                        %><%=
                            "<tr><td></td><td colspan='5'><h4>Lista de trabajadores becarios a cargo de "+fijo.getNombre()+"</h4>"+
                        "<table   class='table'>"+
                        "<tr>"+
                         "<td><b>DNI</b></td> <td><b>NOMBRE</b></td> <td><b>FECHA DE NACIMIENTO</b></td>  "+
                        "<td><b>EMAIL</b></td>  <td><b>UNIVERSIDAD</b></td> <td><b>F INICIO</b></td><td><b>F FIN</b></td>"
                        
                        %><%
                            
                                for(int j=0;j<listaBecarios.size(); j++){
                                    Becario becario = listaBecarios.get(j);
                                    %><%=
                                        "<tr> <td>"+becario.getDni()+ 
                                        "</td><td>"+becario.getNombre()+
                                        "</td><td>"+becario.getFechaNacimiento()+
                                        "</td><td>"+becario.getEMail()+
                                        "</td><td>"+becario.getUniversidad()+
                                        "</td><td>"+becario.getFInicio()+
                                        "</td><td>"+becario.getFFin()+
                                        " </td></tr>"
                                %><%
                                
                                }
                            }
                        %><%=
                        "</tr>"+
                        "</table>"+
                "</td></tr>"
                %>
                </table><br><br>
                
                <%
                
            }
   
        %>
        
    <div class="col-sm-1"></div>

    

    
    
    </body>
</html>