<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Multas por Agentes</title>
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
                <h1 align="center">Multas Levantadas</h1>
            </div>
        </div>
  
<%   
    ArrayList<String> Multas = new ArrayList<String>();
    Persona p = new Persona();
    p.conecta();
    Multas = p.getLevantadas();
    p.desconecta();
    if(Multas.size() > 0){
%>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>IdAgente</th>
                        <th>Sector</th>
                        <th>Artículo</th>
                        <th>Municipio</th>
                        <th>Estatus</th>
                        <th>Hora</th>
                    </tr>
                </thead>
                
                <tbody>
<%
        for(String a: Multas){
%>
            <tr>
                <% out.write(a); %>
            </tr>
<%
        }
%>
                </tbody>
            </table>
        </div
<%
    }else{
%>
        <div class="container">
            <h3 class="form-signin-heading bg-success" align="center">No se han levantado Multas.</h3>
            <br>
            <img class="img-responsive center-block" src="../img/success.png" alt="Sin Registros" style="width:400px;height:300px">
        </div>
<%
    } 
%>

        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
                
    </body>
</html>
