/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.util.ArrayList;

/**
 *
 * 
 */
public class Persona extends Control{

    int id;
    String app;
    String nombre;
    String fecha_nac;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(String fecha_nac) {
        this.fecha_nac = fecha_nac;
    }
          
    
    
    public ArrayList getAgentes() throws Exception {
        ArrayList<String> Sucursales = new ArrayList<String> ();
        try{
            Sucursales = conexionBD.getAgentes();
        } catch(Exception ex){
            System.out.println("No se pudieron recuperan clientes " + ex.getMessage());
        }
        return Sucursales;
    }
    
    public ArrayList getMultas(String a) throws Exception {
        ArrayList<String> Menu = new ArrayList<String>();
        try{
            Menu = conexionBD.getMultas(a);
        } catch(Exception ex){
            System.out.println("No se pudo recuperar lsa multas. "+ ex.getMessage());
        }
        return Menu;
    }
    
    public ArrayList getMultas2(String a) throws Exception {
        ArrayList<String> Menu = new ArrayList<String>();
        try{
            Menu = conexionBD.getMultas2(a);
        } catch(Exception ex){
            System.out.println("No se pudo recuperar lsa multas. "+ ex.getMessage());
        }
        return Menu;
    }
    
     public ArrayList getLevantadas() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getLevantadas();
        } catch(Exception ex){
            System.out.println("No se pudieron recuperan clientes " + ex.getMessage());
        }
        return Multas;
    }
    
      public ArrayList getGenero() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getGenero();
        } catch(Exception ex){
            System.out.println("No se pudieron las multas por genero " + ex.getMessage());
        }
        return Multas;
    }
      
      public ArrayList getMultasE() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getMultasE();
        } catch(Exception ex){
            System.out.println("No se pudieron encontrar las multas por edad " + ex.getMessage());
        }
        return Multas;
    }
      
    
    public ArrayList getMultasHoras() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getMultasHoras();
        } catch(Exception ex){
            System.out.println("No se pudieron encontrar las multas por Modelos " + ex.getMessage());
        }
        return Multas;
    }
    
    public ArrayList getMultasMes() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getMultasMes();
        } catch(Exception ex){
            System.out.println("No se pudieron encontrar las multas por Mes " + ex.getMessage());
        }
        return Multas;
    }
    public ArrayList getMultasTaxistas() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getMultasTaxistas();
        } catch(Exception ex){
            System.out.println("No se pudieron encontrar las multas por Mes " + ex.getMessage());
        }
        return Multas;
    }
    
    public ArrayList getMultasEstado() throws Exception {
        ArrayList<String> Multas = new ArrayList<String> ();
        try{
            Multas = conexionBD.getMultasEstado();
        } catch(Exception ex){
            System.out.println("No se pudieron encontrar las multas por Estado " + ex.getMessage());
        }
        return Multas;
    }
    
    public ArrayList getMultasModelo() throws Exception {
        ArrayList<String> Multas = new ArrayList<String>();
        try{
            Multas = conexionBD.getMultasModelo();
        }catch(Exception ex){
            System.out.println("No se puedieron encontrar las multas por Modelo " + ex.getMessage());
        }
        return Multas;
    }
    
    public ArrayList pagarMulta(String id) throws Exception {
        ArrayList<String> Multa = new ArrayList<String>();
        try{
            Multa = conexionBD.pagarMulta(id);
        } catch (Exception ex){
            System.out.println("No se pudo completar el pago de la multa " + ex.getMessage());
        }
        return Multa;
    }
    /*
    public ArrayList generaMulta(String nrp,String ubicacion,String articulo,String municipio, 
            String penalizacion, String importe,String idlicencia,String placas) throws Exception{
        ArrayList<String> Multa  = new ArrayList<String>();
        try{
            Multa = conexionBD.generaMulta(nrp,ubicacion,articulo,municipio,penalizacion,importe,idlicencia,placas);
        }catch(Exception ex){
            System.out.println("No se pudo recuperar la informacion " + ex.getMessage());
        }
        return Multa;
    }
    */
            
    public ArrayList generaMulta(String nrp,String ubicacion,String articulo,String municipio,String idlicencia,String placas) throws Exception{
        ArrayList<String> Multa  = new ArrayList<String>();
        try{
            Multa = conexionBD.generaMulta(nrp,ubicacion,articulo,municipio,idlicencia,placas);
        }catch(Exception ex){
            System.out.println("No se pudo recuperar la informacion " + ex.getMessage());
        }
        return Multa;
    }
    
        public ArrayList generaFoto(String Idc, String placas, String velocidad) throws Exception{
        ArrayList<String> multa = new ArrayList();
        try{
            multa = conexionBD.generaFoto(Idc, placas, velocidad);
        }catch(Exception ex){
            System.out.println("No se pudo recuperar la informacion " + ex.getMessage());
        }
        return multa;
    }
    
    public ArrayList actualizaTarjeta(String nut) throws Exception{
        ArrayList<String> multa = new ArrayList();
        try{
            multa = conexionBD.actualizaTajeta(nut);
        }catch(Exception ex){
            System.out.println("No se pudo recuperar la informacion " + ex.getMessage());
        }
        return multa;
    }
    
    public ArrayList regitroTarjeta(String placas) throws Exception{
        ArrayList<String> tarjeta = new ArrayList();
        try{
            tarjeta = conexionBD.registroTarjeta(placas);
        }catch(Exception ex){
            System.out.println("No se pudo registrar " + ex.getMessage());
        }
        return tarjeta;
    }
    
    public ArrayList cambioPropietario(String rfcPa,String rfcNp,String placasAct,String edo) throws Exception{
        ArrayList<String> prop = new ArrayList();
        try{
            prop = conexionBD.cambioPropietario(rfcPa, rfcNp, placasAct, edo);
        }catch(Exception ex){
            System.out.println("No se pudo registrar " + ex.getMessage());
        }
        return prop;
    }
    
    public ArrayList multaAgente(String id) throws Exception{
        ArrayList<String> Multa  = new ArrayList<String>();
        try{
            Multa = conexionBD.multaAgente(id);
        }catch(Exception ex){
            System.out.println("No se pudo recuperar la informacion " + ex.getMessage());
        }
        return Multa;
    }
    
    public ArrayList registraConductor(String rfc, String tipo) throws Exception{
        ArrayList<String> Conductor = new ArrayList<String>();
        try{
            Conductor = conexionBD.registraConductor(rfc,tipo);
        }catch (Exception ex){
            System.out.println("No se pudo completar el registro: " + ex.getMessage());
        }
        return Conductor;
    }
        
    public ArrayList verFoto(String id) throws Exception{
        ArrayList<String> foto = new ArrayList<String>();
        try{
            foto = conexionBD.verFoto(id);
        }catch (Exception ex){
            System.out.println("No se pudo ver informacion: " + ex.getMessage());
        }
        return foto;
    }
    
    
    public ArrayList registrarPersona(String rfc, String nombre, String app, String apm, String genero, String fecha_n, String telefono,
                                        String email, String calle, String numero, String colonia, String delegacion, String codigo_postal,
                                        String estado) throws Exception{
        ArrayList<String> Multa = new ArrayList<String>();
        try{
            Multa = conexionBD.registrarPersona(rfc, nombre, app, apm, genero, fecha_n, telefono, email, calle, numero, colonia, delegacion, codigo_postal, estado);
        }catch(Exception ex){
            System.out.println("No se pudo completar el registro " + ex.getMessage());
        }
        return Multa;
        }
    
    public ArrayList registrarAgente(String rfc, String sector) throws Exception{
        ArrayList<String> Agente = new ArrayList<String>();
        try{
            Agente = conexionBD.registrarAgente(rfc,sector);
        }catch (Exception ex){
            System.out.println("No se pudo completar el registro: " + ex.getMessage());
        }
        return Agente;
    }
 
        public ArrayList registrarNConductor(String rfc, String nombre, String app, String apm, String genero, String fecha_n, String telefono,
                                        String email, String calle, String numero, String colonia, String delegacion, String codigo_postal,
                                        String estado, String tipo) throws Exception{
            ArrayList<String> Conductor = new ArrayList<String>();
            try{
                Conductor = conexionBD.registrarNConductor(rfc, nombre, app, apm, genero, fecha_n, telefono, email, calle, numero, colonia, delegacion, codigo_postal, estado, tipo);
            }catch(Exception ex){
                System.out.println("No se pudo completar el registro " + ex.getMessage());
            }
            return Conductor;
        }
    
        public ArrayList modelosDisponibles(){
            ArrayList<String> Modelos = new ArrayList<String>();
           try{
            Modelos = conexionBD.modelosDisponibles();
           }catch(Exception ex){
                System.out.println("No se pudo completar la busqueda " + ex.getMessage());            
           }
           return Modelos;
        }
        
        public ArrayList registrarVehiculo(String rfc, String numserie, String litros, String color, String capacidad, String pasajeros, String modelo){
            ArrayList<String> Vehiculo = new ArrayList<String>();
            try{
                Vehiculo = conexionBD.registrarVehiculo(rfc,numserie,litros,color,capacidad,pasajeros,modelo);
            }catch(Exception ex){
                System.out.println("No se pudo completar el registro " + ex.getMessage()); 
            }
            return Vehiculo;
        }

        
        
        
        
  
        
}