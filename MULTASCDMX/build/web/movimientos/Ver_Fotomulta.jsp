<%-- 
    Document   : Ver_Fotomulta
    Created on : 19-dic-2016, 21:30:09
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Multas</title>
        -->
        <title>Consultar Fotomultas</title>
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
                <h1 align="center">Consultar Fotomultas</h1>
            </div>
        </div>

        <img class="img-responsive center-block" src="../img/fotomultas.jpg" alt="Fotomulta" style="width:380px;height:250px">

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Ver_Fotomulta_proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Ingresar ID de Fotomulta</h3>
                    <label for="fotomulta" class="sr-only">ID Fotomulta</label>
                    <input type="text" name="fotomulta" id="fotomulta" class="form-control" placeholder="ID Fotomulta" required autofocus>
                    <button class="btn btn-md btn-primary btn-block" type="submit">Consultar</button>
                </div>
            </form>
        </div>
        
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        
    </body>
</html>
