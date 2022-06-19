package System;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Conexion {
    public String driver= "com.mysql.cj.jdbc.Driver";
    public String database= "peliculas"; //cambiar nombre de la base de datos
    public String hostname= "localhost";
    public String port = "33065"; //cambiar el puerto por el original 3306
    public String username= "root";
    public String password= "";
    Connection conn = null;
    
public Conexion(){
        String url = "jdbc:mysql://"+hostname+":"+port+"/"+database+"?useSSL=false";
        try{
            Class.forName(driver);
            conn= DriverManager.getConnection(url, username, password);
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }

} 
 public void query(String sSQL){
    try{
    
        PreparedStatement st = conn.prepareStatement(sSQL);
        st.execute();
    }catch(SQLException e){
    
    }
    
    }
 public ResultSet queryResult(String sSQL){ // resultado de una base de datos RESULT SET
    
        ResultSet rs1= null; // RESULT SET es un tipo de dato para los resultados de un query de la base de datos
        try{
            PreparedStatement st = conn.prepareStatement(sSQL);
            rs1 = st.executeQuery();
            }catch(SQLException e){
            
            }
            return rs1;
    }
 public int validaUser(String user, String pass){
        int result=0; 
        String sSQL;
        
        try{
            sSQL = "SELECT * FROM users WHERE estadousers='A' AND name='"+user+"' AND password='"+pass+"'";
            PreparedStatement st = conn.prepareStatement(sSQL);
            ResultSet rs1 = st.executeQuery();
            while(rs1.next()){
        
            result=rs1.getInt("idrol");
        
        }
    }catch(SQLException e){
    
    
    }
        return result;
    }
    
    
    
}
