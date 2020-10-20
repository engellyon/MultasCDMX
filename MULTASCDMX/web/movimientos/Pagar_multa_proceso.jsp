<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Pagar Multa</title>
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
                <h1 align="center">Multa Pagada</h1>
            </div>
        </div>

        
        <% 
    String multa = request.getParameter("multa");
    ArrayList<String> Pagada = new ArrayList<String>();
    Persona p = new Persona();
    p.conecta();
    Pagada = p.pagarMulta(multa);
    p.desconecta();
    if(Pagada.size() > 0){
        for(String a: Pagada)
            out.write(a + "<br>");
    }else{
        out.write("No hay multa que pagar");
    } 
        %>
                      
        <script src="../js/jquery-3.1.1.min.js"></script>        
        <script src="../js/bootstrap.min.js"></script>
                
    </body>
</html>