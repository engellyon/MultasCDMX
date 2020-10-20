
<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Actualizacion Tarjeta</title>
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
                <h1 align="center">Tarjeta Actualizada</h1>
            </div>
        </div>
        
        <% 
    String numero = request.getParameter("nut");
    ArrayList<String> Registra = new ArrayList<String>();
    Persona p = new Persona();
    p.conecta();
    Registra = p.actualizaTarjeta(numero);
    p.desconecta();
    if(Registra.size() > 0){
        for(String a: Registra)
            out.write(a + "<br>");
    }else{
        out.write("No se pudo generar la informacion");
    } 
        %>

        <script src="../js/jquery-3.1.1.min.js"></script>        
        <script src="../js/bootstrap.min.js"></script>
                
    </body>
</html>