<%-- 
    Document   : Registrar_Vehiculo_Proceso
    Created on : 21-dic-2016, 0:01:59
    Author     : Spark
--%>
        
<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Vehiculo</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
        
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.html">Regresar al Inicio</a>
                </div>
            </div>
        </nav>
        
        <div class="jumbotron">
            <div class="container" style="height:50px">
                <h1 align="center">Registro de Vehiculo</h1>
            </div>
        </div>
        
        
        <%
            String rfc = request.getParameter("rfc");
            String numserie = request.getParameter("numserie");
            String litros = request.getParameter("litros_motor");
            String color = request.getParameter("color");
            String capacidad = request.getParameter("capacidad");
            String pasajeros = request.getParameter("pasajeros");
            String modelo = request.getParameter("modelo");
            ArrayList<String> Vehiculo = new ArrayList<String>();
            Persona p = new Persona();
            p.conecta();
            Vehiculo = p.registrarVehiculo(rfc,numserie,litros,color,capacidad,pasajeros,modelo);
            p.desconecta();
            if(Vehiculo.size() > 0){
                for(String a: Vehiculo)
                    out.write(a + "<br>");
            }else{
                out.write("No se pudo registrar el Vehiculo");                
            }
        %>

         <script src="../js/jquery-3.1.1.min.js"></script>        
        <script src="../js/bootstrap.min.js"></script>
                
    </body>
</html>