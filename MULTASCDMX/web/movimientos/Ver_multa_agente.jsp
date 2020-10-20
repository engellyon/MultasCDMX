<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <title>Ver Multa Agente</title>
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
                <h1 align="center">Ver Multa Agente</h1>
            </div>
        </div>

        <img class="img-responsive center-block" src="../img/conmulta.jpg" alt="First slide" style="width:300px;height:200px">

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Ver_multa_agente_proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Ver Multa por ID </h3>
                    <label for="id" class="sr-only">Multa</label>
                    <input type="id" name="id" id="id" class="form-control" placeholder="Id de la Multa" required autofocus>
                    <button class="btn btn-md btn-primary btn-block" type="submit">Siguiente</button>
                </div>
            </form>
        </div>
               
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

    </body>
</html>