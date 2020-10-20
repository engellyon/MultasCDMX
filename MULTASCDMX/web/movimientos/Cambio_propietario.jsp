<%-- 
    Document   : Cambio_propietario
    Created on : 20-dic-2016, 20:25:02
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio de Propietario</title>
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
                <h1 align="center">Cambio de Propietario</h1>
            </div>
        </div>

        <img class="img-responsive center-block" src="../img/conmulta.jpg" alt="First slide" style="width:300px;height:200px">
              

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Cambio_propietario_proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Informacion de Cambio de Propietario</h3>
                    <label for="RFCa" class="sr-only">RFCa</label>
                    <input type="text" name="rfna" id="RFCa" class="form-control" placeholder="RFC del Propietario Actual" required autofocus>
                    <label for="RFCn" class="sr-only">RFna</label>
                    <input type="text" name="rfn" id="RFn" class="form-control" placeholder="RFC del Nuevo Propietario" required autofocus>                                                                            
                    <label for="Placas" class="sr-only">Placas</label>
                    <input type="text" name="pla" id="pla" class="form-control" placeholder="Placas actuales del Vehiculo" required autofocus>
                    <label for="Estado" class="sr-only">Estado</label>
                    <input type="text" name="est" id="est" class="form-control" placeholder="Estado de cambio de Propiedad" required autofocus>                      
                    <button class="btn btn-md btn-primary btn-block" type="submit">Registrar</button>
                </div>                                        
            </form>
        </div>
               
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>        
        
    </body>
</html>
