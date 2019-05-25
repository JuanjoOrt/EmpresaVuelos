<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page errorPage="pagError.jsp"%>
<%@ page import="bd.AccesoBD"%>
<%@ page import="modelo.Aeropuerto"%>
<%@ page import="modelo.Noticia"%>
<%@ page import="modelo.Trayecto"%>
<%@ page import="modelo.Usuario"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Oregano" rel="stylesheet">
    </head>
    <body style="background-color: #F5F5F5">
    <%
    AccesoBD conexion = new AccesoBD("EV_INVITADO","1234");
    session.setAttribute("conexionInv", conexion);
    Usuario usuarioPagina = (Usuario)session.getAttribute("usuarioPagina"); 
    
    
    String sql = Aeropuerto.listaAeropuertosSql();
    ResultSet rs = conexion.select(sql); 
    ArrayList<Aeropuerto> listaAeropuertos = new ArrayList<Aeropuerto>();
    String nombreAeropuerto, ciudad, codigo, pais;
    int idAeropuerto;
    Date fechaConstruccion;
        while(rs.next()){ 
            idAeropuerto = rs.getInt("ID_AEROPUERTO");
            nombreAeropuerto = rs.getString("NOMBREAEROPUERTO");
            ciudad = rs.getString("CIUDAD");
            codigo = rs.getString("CODIGO");
            pais = rs.getString("PAIS");
            fechaConstruccion = rs.getDate("FECHACONSTRUCCION");
            
            Aeropuerto aeropuerto = new Aeropuerto(idAeropuerto, nombreAeropuerto, codigo, pais, ciudad, fechaConstruccion);
            listaAeropuertos.add(aeropuerto);
            }
            
    Aeropuerto aeropuertoOrigenF = (Aeropuerto)session.getAttribute("aeropuertoOrigen"); 
            
    String sqlNoticias = Noticia.listaNoticiasSql();
    ResultSet rsNoticias = conexion.select(sqlNoticias); 
    ArrayList<Noticia> listaNoticias = new ArrayList<Noticia>();
    String titulo, descripcion;
    int idNoticia;
    Date fechaNoticia;
        while(rsNoticias.next()){ 
            idNoticia = rsNoticias.getInt(1);
            titulo = rsNoticias.getString(2);
            descripcion = rsNoticias.getString(3);
            fechaNoticia = rsNoticias.getDate(4);
            
            Noticia noticia = new Noticia(idNoticia, titulo, descripcion, fechaNoticia);
            listaNoticias.add(noticia);
            }
    %>
    <br>
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
    
    <div class="col-sm-12">
    <br><br>
    <center><img src="Imagenes//banner3.jpg" alt="banner"></center><br><br></div>
    
    
    
    <div class="col-sm-6" style="background-color: #D6D6D6">

            <!-- PRIMER PASO -->
            <%
                 if (aeropuertoOrigenF == null ){
                    %>
                    <center><div style="font-family: 'Cabin', sans-serif;color:#2E85FF;"><h1>¿Quieres viajar?</h1></div> </center>
                    <div style="font-family: 'Oregano', cursive;"><h3>1º Paso - Elige una ciudad de origen</h3></div>
                    <form action="<%=request.getContextPath()%>/controlador" method="GET">
                        <select name="aeropuerto" class="form-control">
                         <%
                            for(int i=0;i<listaAeropuertos.size(); i++){
                                Aeropuerto aeropuerto = listaAeropuertos.get(i);
                                %><%=
                                    "<option value="+aeropuerto.getIdAeropuerto()+">"+aeropuerto.getCiudad()+"</option>"
                                %><%
                             }
                        
                        %> 
                        </select>
                        <input type="hidden" name="accion" value="aeropuertoOrigen"/><br>
                        <center><input type="submit" name="Entrar" value="Siguiente paso" class="btn btn-success"></center><br><br>
                    </form>
                    <%
                }else if(aeropuertoOrigenF != null ){
                    ArrayList<Trayecto> listaTrayectos = (ArrayList<Trayecto>)session.getAttribute("listaTrayectos"); 
                    %><br>
                        <div style="font-family: 'Oregano', cursive;"><h3>2º Paso - Elige una ciudad de destino y una fecha</h3></div>
                        <form action="<%=request.getContextPath()%>/controlador" method="GET">
                            <select name="trayecto" class="form-control">
                             <%
                                for(int x=0;x<listaTrayectos.size(); x++){
                                    Trayecto trayectoL = listaTrayectos.get(x);
                                    Aeropuerto aeropuertoDestinoL = trayectoL.getAeropuertoDestino();
                                    %><%=
                                        "<option value="+trayectoL.getidTrayecto()+">"+aeropuertoDestinoL.getCiudad()+"</option>"
                                    %><%
                                 }
                            
                            %> 
                            </select>
                            
                            <div style="font-family: 'Oregano', cursive;"><h3> Fecha del viaje: </h3></div>
                                <input type="date"  name="fecha">
                            <input type="hidden" name="accion" value="trayectoMarcado"/><br>
                            <center><input type="submit" name="Entrar" value="Siguiente paso" class="btn btn-success"></center><br><br>
                        </form>
                    
                    <%
                
                }
            %>

    
    <!-- MENU DE LOGIN -->
    <%
        if (usuarioPagina == null ){
    %>
    </div>
    <div class="col-sm-1"></div>
    <div class="col-sm-5" style="background-color: #D6D6D6">
        <form class="form-signin" action="<%=request.getContextPath()%>/controlador" method="GET">
        <h2 class="form-signin-heading">Inicia sesión o registrate</h2>
        Usuario: 
        <input type="text" name="user" class="form-control" placeholder="Usuario">
        Contraseña:
        <input type="password" name="pass" class="form-control" placeholder="Contraseña">
        <input type="hidden" name="accion" value="index"/><br>
        <div class="col-sm-6"><input type="submit" name="Entrar" value="Entrar" class="btn btn-primary btn-lg"></div></form>
        
        <div class="col-sm-6"><a href="./usuarios/registrar.jsp"><button type="button" class="btn-lg btn-warning">Registrate</button></a></div>
       <br><br><br>
    </div>
    
    <%
        }else{
        %>
        
            </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-5" style="background-color: #D6D6D6">
                    <form class="form-signin" action="<%=request.getContextPath()%>/controlador" method="GET">
                    <center><h2 class="form-signin-heading">Bienvenido</h2></center>
                    <center><h2 class="form-signin-heading"><%=usuarioPagina.getNombre()%></h2></center>
                    <br><br>
                    <input type="hidden" name="accion" value="salirPanelUser"/><br>
                    <center><div class="col-sm-6"><a href="menuUsuario.jsp"><button type="button" class="btn-lg btn-info">Panel</button></a></div>
                     <div class="col-sm-6"><input type="submit" name="Salir" value="Salir" class="btn-lg btn-danger"></form></div></center><br>
                   <br><br><br>
                </div>
        
        <%
        }
    
    %>
    <div class="col-sm-12">
    <br><br><br><br>
    <center><img src="Imagenes//NewsBanner.png" alt="NewsBanner"></center><br><br>
    <!-- Zona para las noticias de la compañía -->
    <table>
    
    <%
        for(int e=0;e<listaNoticias.size(); e++){
            Noticia noticia = listaNoticias.get(e);
            %><%=
                 "<tr>"+
                 "<td><h2><b>"+noticia.getTitulo()+"</b></h2></td>"+
                 "<td style='text-align: right;' ><h2><b>"+noticia.getFechaNoticia()+"</h2></b></td>"+
                 "</tr>"+
                 
                 "<tr>"+
                    "<td colspan='2'><h4>"+noticia.getDescripcion()+"</h4><br><br><br><br></td>"+
                 "</tr>"
                %><%
         }
    
    %> 
    </table>
    <br><br><br></div>
    </div>
    
    </div>
    <div class="col-sm-2"></div>
    </body>
</html>