<%-- 
    Document   : Genera_multa
    Created on : 20-dic-2016, 13:11:44
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <title>Genera Multa</title>
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
                <h1 align="center">Genera Multa</h1>
            </div>
        </div>

        <img class="img-responsive center-block" src="../img/conmulta.jpg" alt="First slide" style="width:300px;height:200px">

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Genera_multa_proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Generar Muta</h3>
                    <label for="nrp" class="sr-only">nrp</label>
                    <input type="text" name="nrp" id="nrp" class="form-control" placeholder="Numero de Placas" required autofocus>
                    <label for="ub" class="sr-only">ub</label>
                    <input type="text" name="ub" id="ub" class="form-control" placeholder="Identificador de Ubicacion" required autofocus>
                    <label for="ar" class="sr-only">ar</label>
                    <input type="text" name="ar" id="ar" class="form-control" placeholder="Articulo Infringido" required autofocus>
                    <label for="mun" class="sr-only">mun</label>
                    <input type="text" name="mun" id="multa" class="form-control" placeholder="Municipio" required autofocus>
                    <label for="idL" class="sr-only">idL</label>
                    <input type="text" name="idL" id="multa" class="form-control" placeholder="IdLicencia" required autofocus>
                    <label for="placas" class="sr-only">placas</label>
                    <input type="text" name="placas" id="placas" class="form-control" placeholder="Placas" required autofocus>
                    <button class="btn btn-md btn-primary btn-block" type="submit">Generar</button>
                </div>
            </form>
        </div>
               
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

    </body>
</html>