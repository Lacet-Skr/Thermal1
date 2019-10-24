package Datos;
// un free ;) para recoger paletones
import java.sql.*;
import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

public class BD {
  private static String JDBC_DRIVER;// = "com.mysql.jdbc.Driver";
  private static String JDBC_URL;// = // "jdbc:mysql://localhost/puntomedico";
  private static String JDBC_USER;// = "root";
  private static String JDBC_PASS;// = "12345678";
  private static Driver driver = null;
  private static String JDBC_FILE_NAME = "conexion";//debe ser el mismo nombre del archivo de propiedades
  
  public static Properties loadProperties(String file) {
    Properties prop = new Properties();
    ResourceBundle bundle = ResourceBundle.getBundle(file);
    Enumeration e = bundle.getKeys();
    String key = null;
    while (e.hasMoreElements()) {
      key = (String) e.nextElement();
      prop.put(key, bundle.getObject(key));
    }
    // Asignamos los valores del archivo de propiedades
    // a las variables de la clase
    JDBC_DRIVER = prop.getProperty("driver");
    JDBC_URL = prop.getProperty("url");
    JDBC_USER = prop.getProperty("user");
    JDBC_PASS = prop.getProperty("pass");
    // Regresamos el objeto properties con los valores
    // de la conexion a la BD
    return prop;
  }

public static DataSource getDataSource(){
    // Cargamos los valores del archivo de propiedades
    loadProperties(JDBC_FILE_NAME);
    BasicDataSource ds = new BasicDataSource();
    ds.setDriverClassName(JDBC_DRIVER);
    ds.setUrl(JDBC_URL);
    ds.setUsername(JDBC_USER);
    ds.setPassword(JDBC_PASS);
    // antes de cerrar la conexion
    return ds;
 }

public static synchronized Connection getConnection()
          throws SQLException {
    return getDataSource().getConnection();
  }

  public static void close(Connection conn) {
    try {
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
  }

  public static void close(PreparedStatement stmt) {
    try {
      if (stmt != null) {
        stmt.close();
      }
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
  }
  
  public static void close(Statement stmt) {
    try {
      if (stmt != null) {
        stmt.close();
      }
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
  }

  public static void close(ResultSet rs) {
    try {
      if (rs != null) {
        rs.close();
      }
    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }

  }

}