/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;


import control.Persona;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.math.*;
/**
 *
 * 
 */
public class Conexion {
    
    //Creamos nuestros objetos para la comunicacion y ejecucion de codigo SQL
    private Connection con;
    private Statement stmt;
    private ResultSet rs;
    private CallableStatement cs;
    //Constructor    
    public Conexion() {
        stmt = null;
        con = null;
        rs = null;
    }

    /*
     * Metodo que nos permite abrir la conexion con una base de datos 
     * especificada en el parametro de entrada del metodo que ha sido
     * invocado en la capa de Control
     * @author  Erick Matla
     * @version 1.0
     * @param   nombrebase - nombre de la base de datos a la cual nos 
     *          conectaremos
     */
    public void conectar()
            throws Exception {
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost;" +
                                    "database=MULTAS_CDMX;" +
                                    "user=sa;" +
                                    "password=oraculo"; 
            con = DriverManager.getConnection(connectionUrl);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("SQLException: " + e.getMessage() + " conectar =(");
        }
    }

    /*
     * Metodo que nos permite cerrar la conexion con una base de datos 
     * el metodo debe ser invocado en la capa de Control
     * @author  Erick Matla
     * @version 1.0
     * @param   sin parametros     
     */
    public void desconectar()
            throws SQLException {
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage() + " desconectar =(");
        }
    }
    
    public ArrayList getAgentes() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("Select N_Registro_Personal, RFC, Sector From Agente;");
           while(rs.next()){
               p = "<td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>" + rs.getString(3) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
    
    public ArrayList getMultas(String rfc) throws Exception{
        ArrayList<String> Multas = new ArrayList<String>();
        String p = "";
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select  distinct(l.IdLicencia),l.Puntos_Acumulados,l.Vigencia,l.Fecha_Vencimiento,m.Estatus,m.Importe,m.Num_Tarjeta,i.penalizacion,i.Fecha,i.Hora,vo.Placas "
                    + "from Licencia as l, Multa as m,Persona as p,Con_Licencia as c,Infraccion as i,Involucra as vo where  c.RFC= '" + rfc +
                    "' and c.IdLicencia =l.IdLicencia and l.IdLicencia = m.IdLicencia and m.IdExpediente = i.IdExpediente and vo.IdExpediente = i.IdExpediente;"            
            );
            while(rs.next()){
                p ="<td>"+ rs.getString(1) + "</td><td>"+ rs.getInt(2)+ "</td><td>"+rs.getString(3)+"</td><td>"+rs.getDate(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getInt(7)+"</td><td>"+rs.getInt(8)+"</td><td>"+rs.getDate(9)+"</td><td>"+rs.getString(10) + "</td>";
                Multas.add(p);
            }
            rs.close();
            stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getMultas");
        }
        return Multas;
    }
    
    private static int penalizacion(){
        int numeros[] = {0,1,3,6};
        int x = (int)(Math.random()*numeros.length+0);
        return numeros[x];
    }
    
    private static double importe(){
        double uc = 71.68;
        Random rnd = new Random();
        int vuc = (int)(rnd.nextDouble() * 16 + 1);
        return ((vuc*5)*uc);
    }
    
    public ArrayList getMultas2(String placas) throws Exception{
        ArrayList<String> Multas = new ArrayList<String>();
        String p = "";
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select  distinct(l.IdLicencia),l.Puntos_Acumulados,l.Vigencia,l.Fecha_Vencimiento,m.Estatus,m.Importe,m.Num_Tarjeta,i.penalizacion,i.Fecha,i.Hora" + " from Licencia as l, Multa as m,Persona as p,Con_Licencia as c,Infraccion as i," +
"Vehiculo as v,Pertenece as pe,Involucra as vo where vo.Placas= '" + placas + "' and i.IdExpediente=vo.IdExpediente and i.IdExpediente=m.IdExpediente and m.IdLicencia = l.IdLicencia;"
            );
            while(rs.next()){
                p ="IdLicencia  : "+ rs.getString(1) + "<br> Puntos Acumulados: "+ rs.getInt(2)+ "<br> Vigencia: "+rs.getString(3)+"<br> Fecha Vencimiento: "+rs.getDate(4)+"<br> Estatus: "+rs.getString(5)+"<br> Importe: "+rs.getString(6)+"<br> Numero de Tarjeta: "+rs.getInt(7)+"<br> Penalizacion: "+rs.getInt(8)+"<br> Fecha de Multa: "+rs.getDate(9)+"<br> Hora: "+rs.getString(10) + "<br>";
                Multas.add(p);                
            }
            rs.close();
            stmt.close();
        }catch (Exception ex){
            System.err.println("SQLException: " + ex.getMessage() + " getMultas2");
        }
        return Multas;
    }
    
        
    
     public ArrayList getLevantadas() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("select distinct(Agente.N_Registro_Personal) as numAgente , Sector,Articulo," +
"Municipio,Estatus,Infraccion.Hora" +
" from Agente,Impone,Multa,Infraccion" +
" where Agente.N_Registro_Personal=Impone.N_Registro_Personal and Impone.IdExpediente=" +
" Infraccion.IdExpediente and Infraccion.IdExpediente = Multa.IdExpediente" +
" group by Sector ,Agente.N_Registro_Personal,Ubicacion,Articulo," +
"Municipio,Estatus,Infraccion.Hora;");
           while(rs.next()){
               p = "<td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>" + rs.getString(3)+ "</td><td>" + rs.getString(4)+ "</td><td>" + rs.getString(5)+ "</td><td>" + rs.getString(6) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
    
         public ArrayList getGenero() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("select ISNULL(Genero,\n" +
"	CASE WHEN GROUPING(Genero) =0 then 'Desconocido' else 'Total' end) as Genero,\n" +
"	count(*) as Infractor\n" +
"from Persona,Comete,Infraccion\n" +
"where Persona.RFC = Comete.RFC and Comete.IdExpediente = Infraccion.IdExpediente\n" +
"group by rollup (Genero);");
           while(rs.next()){
               p = "<td>" + rs.getString(1) + "</td><td>" + rs.getInt(2) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
         
    public ArrayList getMultasE() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("select (DATEPART(yyyy,Fecha_Nacimiento)-1995) as Edad,count(*) as PersonasInfractoras\n" +
"from Persona,Comete,Infraccion\n" +
"where Persona.RFC = Comete.RFC and Comete.IdExpediente = Infraccion.IdExpediente\n" +
"group by DATEPART(yyyy,Fecha_Nacimiento)-1995;");
           while(rs.next()){
               p = "<td>" + rs.getInt(1) + "</td><td>" + rs.getInt(2) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
    
    public ArrayList getMultasModelo() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("select Tipo,Vehiculo.Modelo_Nombre,count(*)as Infracciones\n" +
"from Modelo,Vehiculo,Involucra,Infraccion\n" +
"WHERE Modelo.Modelo_Nombre = Vehiculo.Modelo_Nombre and\n" +
"Vehiculo.Placas = Involucra.Placas and Involucra.IdExpediente =\n" +
"Infraccion.IdExpediente\n" +
"group by Tipo,Vehiculo.Modelo_Nombre\n" +
"order by count(*) desc ;");
           while(rs.next()){
               p = "<td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>"+rs.getInt(3) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }

    
    public ArrayList getMultasHoras() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("select COUNT(IdExpediente) as Promedio ,DATEPART(hh, Hora) as Horas from Infraccion group by  DATEPART(hh, Hora)order by Promedio desc;");
           while(rs.next()){
               p = "<td>" + rs.getInt(1) + "</td><td>" + rs.getInt(2) + ":00 hrs</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
    
    public ArrayList getMultasMes() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           /*
           rs = stmt.executeQuery("select sum(IdExpediente) as Num , DATEPART(MM,Fecha) as Mes\n" +
                                    "from Infraccion\n" +
                                    "group by DATEPART(MM,Fecha)\n" +
                                    "ORDER BY Num desc;");*/
           rs = stmt.executeQuery("select COUNT(IdExpediente) as Num , DATEPART(MM,Fecha) as Mes from Infraccion group by DATEPART(MM,Fecha) ORDER BY Num desc;");
           while(rs.next()){
               p = "<td>" + rs.getInt(1) + "</td><td>" + getMes(rs.getInt(2)) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
    
    public String getMes(int mes){
        String nombreMes = "";
        
        switch(mes){
            case 1:
                nombreMes = "Enero";
                break;
                
            case 2:
                nombreMes = "Febrero";
                break;
            
            case 3:
                nombreMes = "Marzo";
                break;
                
            case 4:
                nombreMes = "Abril";
                break;
                
            case 5:
                nombreMes = "Mayo";
                break;
            
            case 6:
                nombreMes = "Junio";
                break;
                
            case 7:
                nombreMes = "Julio";
                break;
                
            case 8:
                nombreMes = "Agosto";
                break;
            
            case 9:
                nombreMes = "Septiembre";
                break;
                
            case 10:
                nombreMes = "Octubre";
                break;
                
            case 11:
                nombreMes = "Noviembre";
                break;
            
            case 12:
                nombreMes = "Diciembre";
                break;
                
            default:
                break;
        }
        
        return nombreMes;
    }
    
    public ArrayList getMultasTaxistas() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("SELECT count(IdExpediente) AS Infracciones,\n" +
                                    "Tipo FROM (SELECT IdExpediente,IdLicencia\n" +
                                    " FROM (SELECT I.IdExpediente,RFC\n" +
                                    " FROM Infraccion I JOIN Comete C ON I.IdExpediente = C.IdExpediente) A JOIN Con_Licencia CL ON A.RFC = CL.RFC) B JOIN Licencia L on B.IdLicencia = L.IdLicencia\n" +
                                    "GROUP BY Tipo;");
           while(rs.next()){
               p = "<td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getPersonas");
        }
        return Agente;
    }
    
    public ArrayList getMultasEstado() throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        String p = "";
        try{
           stmt = con.createStatement();
           rs = stmt.executeQuery("select ISNULL(Estado,\n" +
"	case when grouping(Estado) = 0 then 'Desconocido' else 'Total' end) as Estado,\n" +
"	count(*) as Infractores\n" +
"from Persona,Infraccion,Comete\n" +
"where Persona.RFC= Comete.RFC and Comete.IdExpediente = Infraccion.IdExpediente\n" +
"group by rollup (Estado)\n" +
"order by Infractores asc;");
           while(rs.next()){
               p = "<td>" + rs.getString(1) + "</td><td>" + rs.getInt(2) + "</td>";
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " getMultasEstado");
        }
        return Agente;
    }
    
    public ArrayList setArmadora(String arm) throws Exception{
        ArrayList<String> Armadora = new ArrayList<String>();
        String p = "";
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("");
            while(rs.next()){
                p = "";
                Armadora.add(p);
            }
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " setArmadora");
        }
        return Armadora;
    }
    
    public ArrayList pagarMulta(String idMulta) throws Exception{
        ArrayList<String> Multa = new ArrayList<String>();
        String p = "";
        try{
            cs = con.prepareCall("{call Pagar_Multa(?)}");         
            cs.setInt(1,Integer.parseInt(idMulta));
            cs.execute();
            p = "Multa pagada";
            Multa.add(p);
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " pagarMulta");
           }
        return Multa;
    }
    
    public ArrayList registraConductor(String rfc, String tipo) throws Exception{
        ArrayList<String> Conductor = new ArrayList<String>();
        String p = "";
        try{
            cs = con.prepareCall("{call Registrar_Conductor(?,?)}");
            cs.setString(1,rfc);
            cs.setString(2,tipo);
            cs.execute();
            p = "RFC: " + rfc + "<br> Tipo: " + tipo;
            Conductor.add(p);
        }catch(Exception ex){   
            System.out.println("SQLException: " + ex.getMessage() + " registrarConductor");
        }
        return Conductor;
    }
    
    public ArrayList multaAgente(String id) throws Exception{
        ArrayList<String> Multa = new ArrayList<String>();
        String p = "";
        try{
            cs = con.prepareCall("{call Ver_Multa_Agente(?)}");
            cs.setInt(1,Integer.parseInt(id));
            cs.execute();
            final ResultSet rs = cs.getResultSet();
            while(rs.next()){
                p = "IdMulta: " + rs.getString(1) + "<br>IdExpediente: " + rs.getString(2)
                        + "<br>NRP: " + rs.getString(3)+ "<br>Penalizacion: " + rs.getString(4)
                        + "<br>Importe: " + rs.getString(5)+ "<br>Estatus: " + rs.getString(6)
                        + "<br>Calle: " + rs.getString(7)+ "<br>Calle1: " + rs.getString(8)
                        + "<br>Calle2: " + rs.getString(9)+ "<br>Calle3: " + rs.getString(10)
                        + "<br>Articulo: " + rs.getString(11)+ "<br>Municipio: " + rs.getString(12)
                        + "<br>Hora: " + rs.getString(13)+ "<br>Placas: " + rs.getString(14)
                        + "<br>Modelo: " + rs.getString(15)+ "<br>Marca: " + rs.getString(16)
                        + "<br>Numero de Tarjeta: " + rs.getString(17)+ "<br>Vigencia: " + rs.getString(18)
                        + "<br>FVTC: " + rs.getString(19)+ "<br>IdLicencia: " + rs.getString(20)
                        + "<br>Tipo Licencia: " + rs.getString(21)+ "<br>Vigencia: " + rs.getString(22)
                        + "<br>Fecha Vencimiento: " + rs.getString(23)+ "<br>TFC: " + rs.getString(24)
                        + "<br>Nombre: " + rs.getString(25) + "<br>Apellido Paterno: " + rs.getString(26)
                        + "<br>Apellido Materno: " +rs.getString(27);
            }
            Multa.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " multaAgente");
        }
        return Multa;
    }
    
    
    public ArrayList verFoto(String id) throws Exception{
        ArrayList<String> foto = new ArrayList();
        String p = "";
        try{
            cs = con.prepareCall("{call Ver_FotoMulta(?)}");
            cs.setInt(1,Integer.parseInt(id));
            cs.execute();
            final ResultSet rs = cs.getResultSet();
            while(rs.next()){
                p = "<td>"+ rs.getString(1) + "</td><td>" +rs.getString(2) 
                        + "</td><td>" + rs.getString(3)+ "</td><td>"+ rs.getString(4)+ "</td><td>"+ rs.getString(5)+ "</td><td>"
                        + rs.getString(6)+ "</td><td>"+ rs.getString(7)+ "</td><td>"
                        + rs.getString(8)+ "</td><td>"+ rs.getString(9)+ "</td><td>"+ rs.getString(10)+ "</td><td>"+ rs.getString(11)+ "</td><td>"+ rs.getString(12)
                        + "</td><td>"+ rs.getString(13)+ "</td>";
            }
            foto.add(p);
        }catch (Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " verFoto");
        }
        return foto;
    }
    
    public ArrayList<String> pagaMulta(String id) throws Exception{
        ArrayList<String> multa = new ArrayList();
        String p = "";
        try{
            cs = con.prepareCall("{call Pagar_Multa(?)}");
            cs.setInt(1,Integer.parseInt(id));
            cs.execute();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT A.IdMulta,A.IdExpediente,A.Estatus,A.IdLicencia,A.Num_Tarjeta,A.Importe FROM Multa A WHERE A.IdMulta = '" + id + "';");
            while(rs.next()){
                p = "IdMulta: " + rs.getString(1) + "<br> IdExpediente: " + rs.getString(2)+ "<br> Estatus: " + rs.getString(3)+ "<br> IdLicencia: " + rs.getString(4)+ "<br> Numero de Tarjeta: " 
                        + rs.getString(5)+ "<br> Importe: " + rs.getString(6);
            }
            multa.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage());
        }
        return multa;
    }
    
    public ArrayList actualizaTajeta(String nut) throws Exception{
        ArrayList<String> multa = new ArrayList();
        String p = "";
        try{
            cs = con.prepareCall("{call Actualiza_Tarjeta_Circulacion(?)}");
            cs.setString(1, nut);
            cs.execute();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT A.Num_Tarjeta,A.Placas,A.Vigencia,A.Fecha_vencimiento FROM Tarjeta_Circulacion A WHERE A.Num_Tarjeta ='" + nut +  "';");
            while(rs.next()){
                p = "Numero de Tarjeta Anterior: " + rs.getString(1) + "<br>Placas: " + rs.getString(2) + "<br>Vigencia: " + rs.getString(3) +
                        "<br>Fecha Vencimiento: " + rs.getString(4);
            }
            multa.add(p);
            multa.add("<br>");
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT A.Num_Tarjeta,A.Placas,A.Vigencia,A.Fecha_vencimiento FROM Tarjeta_Circulacion A WHERE A.Num_Tarjeta = (SELECT MAX(Num_Tarjeta) FROM Tarjeta_Circulacion)");
            while(rs.next()){
                p = "Numero Tarjeta Nueva: " + rs.getString(1) + "<br>Placas: " + rs.getString(2) + "<br>Vigencia: " + rs.getString(3) +
                        "<br>Fecha Vencimiento: " + rs.getString(4);
            }
            multa.add(p);
            rs.close();
            stmt.close();
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage());
        }
        return multa;
    }
    
    public ArrayList registroTarjeta(String placas) throws Exception{
        ArrayList<String> multa = new ArrayList();
        String p = "";
        try{
            cs = con.prepareCall("{call Registro_Tarjeta_Circulacion(?)}");
            cs.setString(1,placas);
            cs.execute();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT A.Num_Tarjeta,A.Placas,A.Vigencia,A.Fecha_vencimiento FROM Tarjeta_Circulacion A WHERE A.Placas ='" + placas + "';");
            while(rs.next()){
                p = "Numero Tarjeta: " + rs.getString(1) + "<br>Placas: " + rs.getString(2) + "<br>Vigencia: " + rs.getString(3) +
                        "<br>Fecha Vencimiento: " + rs.getString(4);
            }
            multa.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage());
        }
        return multa;
    }
    
    public ArrayList cambioPropietario(String rfcPa,String rfcNp,String placasAct,String edo){
        ArrayList<String> propietario = new ArrayList();
        String p = "";
        try{
            cs = con.prepareCall("{call Cambio_Propietario(?,?,?,?)}");
            cs.setString(1,rfcPa);
            cs.setString(2,rfcNp);
            cs.setString(3,placasAct);
            cs.setString(4,edo);
            cs.execute();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT Placas FROM Fue_propiedad WHERE Placas_ant = '"+ placasAct +"'");
            rs.next();
            p = "Cambio de propietario: <br> RFC Propietario anterior: " + rfcPa + "<br>RFC nuevo Propietario: " + rfcNp +
                    "<br> Placas Anteriores: " + placasAct + "<br> Estado: " + edo + "<br> Nuevas Placas: " + rs.getString(1);
            rs.close();
            stmt.close();
            propietario.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " cambioPropietario");
        }
        return propietario;
    }
    

        public ArrayList generaFoto(String Idc, String placas, String velocidad) throws Exception{
        ArrayList<String> multa = new ArrayList();
        String p = "";
        String penalizacion = String.valueOf(penalizacion());
        String importe = String.valueOf(importe());
        try{
            cs = con.prepareCall("{call Genera_Fotomulta(?,?,?,?,?)}");
            cs.setString(1, Idc);
            cs.setString(2, placas);
            cs.setString(3, velocidad);
            cs.setString(4, penalizacion);
            cs.setString(5, importe);
            cs.execute();
            p = "Fotomulta generada <br> IdCamara: " + Idc + "<br> Placas: " + placas + "<br> Velocidad: " + velocidad  + 
                    "<br> Penalizacion: " + penalizacion + "<br> Importe: " + importe ;
            multa.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " generaFoto");
        }
        return multa;
    }
    /*
    public ArrayList generaMulta(String nrp,String ubicacion,String articulo,String municipio, 
            String penalizacion, String importe,String idlicencia,String placas) throws Exception {
        ArrayList<String> multa = new ArrayList();
        String p = "";
        try{
            cs = con.prepareCall("{call Genera_Multa(?,?,?,?,?,?,?,?)}");
            cs.setString(1,nrp);
            cs.setString(2 ,ubicacion );
            cs.setString(3 ,articulo );
            cs.setString(4 ,municipio );
            cs.setString(5 ,penalizacion );
            cs.setString(6 ,importe );
            cs.setString(7 ,idlicencia );
            cs.setString(8 ,placas );
            cs.execute();
            p = "Multa registrada correctamente <br> nrp: " + nrp + "<br>Ubicacion: " + ubicacion + "<br>Articulo " + articulo+
                    "<br>Municipio: " + municipio + "<br>Penalizacion: " + penalizacion + "<br>Importe: " + importe +
                    "<br>IdLicecia: " + idlicencia + "<br>Placas: " + placas;
            multa.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + "generaMulta");
        }
        return multa;
    }
    */
           public ArrayList generaMulta(String nrp,String ubicacion,String articulo,String municipio, String idlicencia,String placas) throws Exception {
        ArrayList<String> multa = new ArrayList();
        String p = "";
        String penalizacion = String.valueOf(penalizacion());
        String importe = String.valueOf(importe());
        try{
            cs = con.prepareCall("{call Genera_Multa(?,?,?,?,?,?,?,?)}");
            cs.setString(1,nrp);
            cs.setString(2 ,ubicacion );
            cs.setString(3 ,articulo );
            cs.setString(4 ,municipio );
            cs.setString(5 ,penalizacion );
            cs.setString(6 ,importe );
            cs.setString(7 ,idlicencia );
            cs.setString(8 ,placas );
            cs.execute();
            p = "Multa registrada correctamente <br> nrp: " + nrp + "<br>Ubicacion: " + ubicacion + "<br>Articulo " + articulo+
                    "<br>Municipio: " + municipio + "<br>Penalizacion: " + penalizacion + "<br>Importe: " + importe +
                    "<br>IdLicecia: " + idlicencia + "<br>Placas: " + placas;
            multa.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + "generaMulta");
        }
        return multa;
    }
    
    public ArrayList registrarPersona(String rfc, String nombre, String app, String apm, String genero, String fecha_n, String telefono,
                                        String email, String calle, String numero, String colonia, String delegacion, String codigo_postal,
                                        String estado) throws Exception{
        ArrayList<String> Registro = new ArrayList<String>();
        String p = "";
        try{
            cs = con.prepareCall("{call Registrar_Persona(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, rfc);
            cs.setString(2 , nombre );
            cs.setString(3 , app);
            cs.setString(4 , apm);
            cs.setString(5 , genero);
            cs.setString(6 , fecha_n);
            cs.setString(7 , telefono);
            cs.setString(8 , email);
            cs.setString(9 , calle);
            cs.setString(10 , numero);
            cs.setString(11 , colonia);
            cs.setString(12 , delegacion);
            cs.setString(13 , codigo_postal);
            cs.setString(14 , estado);
            cs.execute();
            p = "Persona Registrada correctamente <br> RFC: " + rfc + " nombre: " + nombre + " " + app + " " + apm + "<br> Genero: " +genero
                    +"<br> Fecha de Nacimiento: " + fecha_n + "<br> Telefono: " + telefono + "<br> Email: " + email + "<br> Calle:" + calle
                    +"<br> Numero: " + numero + "<br> Colonia: " + colonia + "<br> Delegacion: " + delegacion + "<br> Codigo Postal: " + codigo_postal
                    +"<br> Estado: " + estado;
            Registro.add(p);
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " registrarPersona");
        }
        return Registro;
    }
    
    public ArrayList registrarAgente(String rfc, String sector){
        ArrayList<String> Agente = new ArrayList<String>();
        String p;
        try{
            cs = con.prepareCall("{call Registrar_Agente(?,?)}");         
            cs.setString(1,rfc);
            cs.setString(2,sector);
            cs.execute();
            p = "Agente registrado con exito";
            Agente.add(p);
            p = "";
            Agente.add(p);
           stmt = con.createStatement();
           rs = stmt.executeQuery("SELECT N_Registro_Personal FROM Agente WHERE RFC = '" + rfc + "'");
           while(rs.next()){
               p = "Su Numero de Registro Personal es: " + rs.getString(1);
               Agente.add(p);
           }
           rs.close();
           stmt.close();
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " Registrar Agente");
        }
        return Agente;
    }
    
    public ArrayList registrarNConductor(String rfc, String nombre, String app, String apm, String genero, String fecha_n, String telefono,
                                        String email, String calle, String numero, String colonia, String delegacion, String codigo_postal,
                                        String estado, String tipo) throws Exception{
        ArrayList<String> Registro = new ArrayList<String>();
        String p = "";
        try{
            cs = con.prepareCall("{call Registrar_Nuevo_Conductor(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, rfc);
            cs.setString(2 , nombre );
            cs.setString(3 , app);
            cs.setString(4 , apm);
            cs.setString(5 , genero);
            cs.setString(6 , fecha_n);
            cs.setString(7 , telefono);
            cs.setString(8 , email);
            cs.setString(9 , calle);
            cs.setString(10 , numero);
            cs.setString(11 , colonia);
            cs.setString(12 , delegacion);
            cs.setString(13 , codigo_postal);
            cs.setString(14 , estado);
            cs.setString(15, tipo);
            cs.execute();
            p = "Persona Registrada correctamente <br> RFC: " + rfc + " nombre: " + nombre + " " + app + " " + apm + "<br> Genero: " +genero
                    +"<br> Fecha de Nacimiento: " + fecha_n + "<br> Telefono: " + telefono + "<br> Email: " + email + "<br> Calle:" + calle
                    +"<br> Numero: " + numero + "<br> Colonia: " + colonia + "<br> Delegacion: " + delegacion + "<br> Codigo Postal: " + codigo_postal
                    +"<br> Estado: " + estado;
            Registro.add(p);
            p = "";
            Registro.add(p);
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT L.IdLicencia FROM (SELECT IdLicencia FROM Con_Licencia WHERE RFC = '" + rfc + "') A JOIN Licencia L ON A.IdLicencia = L.IdLicencia ORDER BY Fecha_Vencimiento DESC");
            rs.next();
            p = "Su Identificador de licencia es: " + rs.getString(1) + " Tipo: " + tipo;
            Registro.add(p);           
            rs.close();
            stmt.close();
        }catch(Exception ex){
            System.out.println("SQLException: " + ex.getMessage() + " registrarPersona");
        }
        return Registro;
    }
    
    public ArrayList modelosDisponibles(){
            ArrayList<String> Modelos = new ArrayList<String>();
            String p;
           try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT DISTINCT(Modelo_Nombre) FROM Modelo");
            while(rs.next()){
                p = rs.getString(1);
                Modelos.add(p);
           }
            rs.close();
            stmt.close();
           }catch(Exception ex){
                System.out.println("SQLException: No se pudo completar la busqueda " + ex.getMessage());            
           }
           return Modelos;
        }
    
    
    public ArrayList registrarVehiculo(String rfc, String numserie, String litros, String color, String capacidad, String pasajeros, String modelo){
            ArrayList<String> Vehiculo = new ArrayList<String>();
            String p;
            try{
                cs = con.prepareCall("{call Registrar_Vehiculo(?,?,?,?,?,?,?)}");
                cs.setString(1, rfc);
                cs.setString(2, numserie);
                cs.setString(3, litros);
                cs.setString(4, color);
                cs.setString(5, capacidad);
                cs.setString(6,pasajeros);
                cs.setString(7, modelo);
                cs.execute();
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT Placas FROM Vehiculo WHERE NumSerie = '" + numserie + "'");
                rs.next();
                java.util.Date fecha = new Date();
                    p = "Vehiculo registrado correctamente <br> Placas: " + 
                        rs.getString(1) +
                         "<br> Numero de serie: " + numserie + "<br> Litros del motor: " + litros
                    +"L <br> Color: " + color + "<br> Capacidad de Combustible: " + capacidad + " L <br> Numero de pasajeros: " + pasajeros + "<br> Fecha de Asignacion: " 
                      + fecha 
                       + " <br> Modelo del vehiculo:" + modelo;
                Vehiculo.add(p);                
               rs.close();
               stmt.close();
            }catch(SQLException ex){
                System.out.println("No se pudo completar el registro " + ex.getMessage()); 
            }
            return Vehiculo;
        }
    
    
    
    
    
    
}