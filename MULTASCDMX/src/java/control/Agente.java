/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.util.ArrayList;


public class Agente extends Control{
    String numRegistro;
    String rfc;
    String sector;
    
    public Agente(){}
    
    public String getRegistro(){
        return numRegistro;
    }
    public String getRFC(){
        return rfc;
    }
    public String getSector(){
        return sector;
    }
    
    public void setRegistro(String nuevo){
        this.numRegistro = nuevo;
    }
    public void setRFC(String nuevo){
        this.rfc = nuevo;
    }
    public void setSector(String nuevo){
        this.sector = nuevo;
    }
  
    
}
