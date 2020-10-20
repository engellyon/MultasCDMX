<%-- 
    Document   : Registrar_persona
    Created on : 19-dic-2016, 20:01:40
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
        <title>Registro de Persona</title>
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
                <h1 align="center">Registro de Persona</h1>
            </div>
        </div>

        <img class="img-responsive center-block" src="../img/conmulta.jpg" alt="First slide" style="width:300px;height:200px">

        <div class="container col-md-11 col-md-offset-4">
            <form class="form-signin" action="Registrar_persona_proceso.jsp" method="post" >
                <div class="col-xs-4">
                    <h3 class="form-signin-heading">Registro </h3>
                    <label for="RFC" class="sr-only">RFC</label>
                    <input type="text" name="rfc" id="RFC" class="form-control" placeholder="RFC" required autofocus>
                    <label for="Nombre(s)" class="sr-only">Nombre(s)</label>
                    <input type="text" name="nombre" id="Nombre" class="form-control" placeholder="Nombre(s)" required autofocus>                                                          
                    <label for="app" class="sr-only">Apellido Paterno</label>
                    <input type="text" name="app" id="app" class="form-control" placeholder="Apellido Paterno" required autofocus>            
                    <label for="apm" class="sr-only">Apellido Materno</label>
                    <input type="text" name="apm" id="apm" class="form-control" placeholder="Apellido Materno" required autofocus>
                    <label for="genero" class="sr-only">Genero</label>
                    <input type="text" name="genero" id="genero" class="form-control" placeholder="Genero(F,M)" required autofocus>                                        
                    <label for="fn" class="sr-only">Fecha Nacimiento</label>
                    <input type="text" name="fn" id="fn" class="form-control" placeholder="DD/MM/AAAAA" required autofocus>
                    <label for="telefono" class="sr-only">Telefono</label>
                    <input type="text" name="telefono" id="telefono" class="form-control" placeholder="55-55-55-55-55" required autofocus>                    
                    <label for="email" class="sr-only">Correo Electronico</label>
                    <input type="text" name="email" id="email" class="form-control" placeholder="juanL@ciencias.unam.mx" required autofocus>
                    <label for="calle" class="sr-only">Calle</label>
                    <input type="text" name="calle" id="calle" class="form-control" placeholder="Norris" required autofocus>
                    <label for="numero" class="sr-only">Numero</label>
                    <input type="text" name="numero" id="numero" class="form-control" placeholder="12 - S/N" required autofocus>
                    <label for="colonia" class="sr-only">Colonia</label>
                    <input type="text" name="colonia" id="colonia" class="form-control" placeholder="Edo.Mexico" required autofocus>
                    <label for="delegacion" class="sr-only">Delegacion</label>
                    <input type="text" name="delegacion" id="delegacion" class="form-control" placeholder="Venustiano Carranza" required autofocus>
                    <label for="cp" class="sr-only">Codigo Postal</label>
                    <input type="text" name="cp" id="cp" class="form-control" placeholder="57210" required autofocus>
                    <label for="estado" class="sr-only">Estado</label>
                    <input type="text" name="estado" id="estado" class="form-control" placeholder="Puebla" required autofocus>                    
                    <button class="btn btn-md btn-primary btn-block" type="submit">Registrar</button>
                </div>                                        
            </form>
        </div>
               
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>        
        
    </body>
</html>
