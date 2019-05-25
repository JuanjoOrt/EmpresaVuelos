package gestion;


import bd.AccesoBD;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public abstract class Accion {
    public HttpServletRequest request;
    public HttpServletResponse response;
    public HttpSession session;
    public ServletContext context;
    public AccesoBD acceso;
    
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    public void setReponse(HttpServletResponse response) {
        this.response = response;
    }
    
    public void setContext(ServletContext context) {
        this.context = context;
    }
    
    public void setSession(HttpSession session) {
        this.session = session;
    }
    
    public void setAcceso(AccesoBD acceso) {
        this.acceso = acceso;
    }
    
    public abstract void inicio() throws ServletException,IOException, java.lang.Exception;
    
    public void irAPagina(String pagina, HttpServletResponse response,
                          HttpServletRequest request) throws ServletException, IOException {
        RequestDispatcher enviaPeticion = context.getRequestDispatcher(pagina);
        enviaPeticion.forward(request, response);
    }
}
