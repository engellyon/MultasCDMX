<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Multas</title>
        -->
        <title>Consultar Multas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
        <!--
        <a href="../index.html">Inicio</a>
        <h1>MULTAS</h1>
        -->  

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.html">Regresar al Inicio</a>
                </div>
            </div>
        </nav>
        
        <div class="jumbotron">
            <div class="container" style="height:50px">
                <h1 align="center">Consultar Multas</h1>
            </div>
        </div>

        <img class="img-responsive center-block" src="../img/conmulta.jpg" alt="First slide" style="width:300px;height:200px">
 
        <!--
        <form action="Multas_proceso.jsp" method="post"> 
                    Ingresa el RFC para consultar las multas  <input type="text" required="true" name="rfc">
                    <input type="submit" value="Buscar">
        </form>
        -->
        
        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Multas_proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Consultar Multas por RFC</h3>
                    <label for="rfc" name="rfc" class="sr-only">RFC</label>
                    <input type="text" id="rfc" class="form-control" placeholder="RFC" required autofocus>
                    <button class="btn btn-md btn-primary btn-block" type="submit">Consultar</button>
                </div>
            </form>
        </div>
        
        <!--
        <form action="Multas_proceso2.jsp" method="post"> 
                    Ingresa las Placas para consultar las multas  <input type="text" required="true" name="placas">
                    <input type="submit" value="Buscar">
        </form>
        -->

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Multas_proceso2.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Consultar Multas por Placas</h3>
                    <label for="placas" class="sr-only">Placas</label>
                    <input type="text" name="placas" id="placas" class="form-control" placeholder="Placas" required autofocus>
                    <button class="btn btn-md btn-primary btn-block" type="submit">Consultar</button>
                </div>
            </form>
        </div>        
        
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
                
    </body>
</html>