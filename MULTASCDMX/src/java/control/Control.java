/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import datos.Conexion;


public class Control {
    
    // Creamos un objeto de tipo Conexion para abrir la comunicacion con la base 
    // de datos
    Conexion conexionBD = new Conexion();

    /*
     * Metodo que permite realizar la conexion a una base de datos especifica.
     * @author     Erick Matla
     * @version    1.0         
     */
    public void conecta() throws Exception{
        try {
            conexionBD.conectar();
        } catch (Exception e) {
            System.out.println("Conexión fallida" + e.getMessage());
        }
    }

    /*
     * Metodo que permite realizar la desconexion de una base de datos.
     * @author     Erick Matla
     * @version    1.0    
     */
    public void desconecta() throws Exception{
        try {
            conexionBD.desconectar();
        } catch (Exception e) {
            System.out.println("Desconexión fallida" + e.getMessage());
        }
    }    
    
}
