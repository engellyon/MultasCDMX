<%-- 
    Document   : Registrar_Vehiculo
    Created on : 20-dic-2016, 23:10:10
    Author     : Spark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Vehiculo</title>
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
                <h1 align="center">Registro de Conductor</h1>
            </div>
        </div>
        
        <div class="jumbotron">
            <div class="container" style="height:50px">
                <h2 align="center">Modelos Disponibles</h2>
            </div>
        </div>
        
          <%            
            ArrayList<String> Modelos = new ArrayList<String>();
            Persona p = new Persona();
            p.conecta();
            Modelos = p.modelosDisponibles();
            p.desconecta();
            if(Modelos.size() > 0){
                for(String a: Modelos)
                    out.write(a + "<br>");
            }else{
                out.write("No hay modelos disponibles");
                out.write("<br>");
            }
        %>
        
               <img class="img-responsive center-block" src="../img/conmulta.jpg" alt="First slide" style="width:300px;height:200px">

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Registrar_Vehiculo_Proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Informacion de Registro</h3>
                    <label for="RFC" class="sr-only">RFC</label>
                    <input type="text" name="rfc" id="RFC" class="form-control" placeholder="RFC" required autofocus>
                    <label for="numserie" class="sr-only">Numero de Serie</label>
                    <input type="text" name="numserie" id="numserie" class="form-control" placeholder="Numero de Serie" required autofocus>                                                                            
                    <label for="litros_motor" class="sr-only">Litros del Motor</label>
                    <input type="text" name="litros_motor" id="litros_motor" class="form-control" placeholder="Litros del Motor" required autofocus>  
                    <label for="color" class="sr-only">Color</label>
                    <input type="text" name="color" id="color" class="form-control" placeholder="Color" required autofocus>  
                    <label for="capacidad" class="sr-only">Capacidad del Tanque</label>
                    <input type="text" name="capacidad" id="capacidad" class="form-control" placeholder="capacidad de Combustible" required autofocus>  
                    <label for="pasajeros" class="sr-only">Pasajeros</label>
                    <input type="text" name="pasajeros" id="pasajeros" class="form-control" placeholder="Numero de Pasajeros" required autofocus>  
                    <label for="modelo" class="sr-only">Modelo</label>
                    <input type="text" name="modelo" id="modelo" class="form-control" placeholder="Modelo de Vehiculo" required autofocus>  
                    <button class="btn btn-md btn-primary btn-block" type="submit">Registrar</button>
                </div>                                        
            </form>
        </div>
                                      
               <script src="../js/jquery-3.1.1.min.js"></script>
               <script src="../js/bootstrap.min.js"></script>  
               
    </body>
</html>
