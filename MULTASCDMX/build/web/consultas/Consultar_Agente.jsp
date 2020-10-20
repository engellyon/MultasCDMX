<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="Estilojsp.css" rel="stylesheet" type="text/css" >
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagar Multas</title>
    </head>
    <body>
        <% Date myDate = new Date();
        String fecha = (new SimpleDateFormat("MM-dd-yyyy").format(myDate));
        %>
        Fecha: <%= fecha%>
            <ul>
                <li> <a href="../index.html">Inicio</a> </li>
            </ul> 
        <div align="center" class="">
            <img src="http://imageshack.com/a/img922/7377/tdTSq5.png" class="margen">
            <h1 class="droid-font grande"> MULTAS </h1>
            <form action="Agente_proceso.jsp" method="post"> 
                    Ingresa el numero de el Agente  <input type="text" required="true" name="multa">
                    <input type="submit" value="Buscar">
        </form>
        </div>
        
    </body>
</html>