package bd;

import java.sql.*;

public class AccesoBD {
    public Connection conn;

    public Connection getConn() {
        return conn;
    }

    public AccesoBD(String User, String Pass) throws Exception{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        conn = DriverManager.getConnection(url, User, Pass);
        
    }
    
    /**
     *Metodo en el cual recibe dos parametros String para usarlos como usuario y contraseña
     * @param User usuario de la base de datos
     * @param Pass contraseña del usuario de la base de datos
     * @throws Exception
     */
    public void conectar(String User, String Pass) throws Exception{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        conn = DriverManager.getConnection(url, User, Pass);
        
    }
    
    /**
     *Metodo que dandole una String como ejecutable la ejecuta
     * @param sql String que contiene la sentencia para ejecutar la Query
     * @return devuelve un ResultSet
     * @throws SQLException
     */
    public ResultSet select(String sql)throws SQLException{
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        
        return rs;
    }
    
    /**
     *Metodo que dandole una String como ejecutable la ejecuta con el fín de insertarla en la base de datos
     * @param sql String que contiene la sentencia para ejecutar la Query
     * @return devuelve un entero
     * @throws Exception
     */
    public int insert(String sql)throws Exception{
        Statement stm = conn.createStatement();
        return stm.executeUpdate(sql);
    }
    
    /**
     *Metodo que dandole una String como ejecutable la ejecuta con el fín de borrar una linea de la base de datos
     * @param sql String que contiene la sentencia para ejecutar la Query
     * @return devuelve un entero
     * @throws Exception
     */
    public int delete(String sql)throws Exception{
        Statement stm = conn.createStatement();
        return stm.executeUpdate(sql);
    }
    
    /**
     *Metodo que dandole una String como ejecutable la ejecuta con el fín de actualizar una linea en la base de datos
     * @param sql String que contiene la sentencia para ejecutar la Query
     * @return devuelve un entero
     * @throws Exception
     */
    public int update(String sql)throws Exception{
        Statement stm = conn.createStatement();
        return stm.executeUpdate(sql);
    }
}
