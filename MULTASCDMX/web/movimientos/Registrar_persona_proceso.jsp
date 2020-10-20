<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Persona</title>
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
                <h1 align="center">Registro</h1>
            </div>
        </div>

<% 
    String rfc = request.getParameter("rfc");
    String nombre = request.getParameter("nombre");
    String app = request.getParameter("app");
    String apm = request.getParameter("apm");
    String genero = request.getParameter("genero");
    String fn = request.getParameter("fn");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String calle = request.getParameter("calle");
    String numero = request.getParameter("numero");
    String colonia = request.getParameter("colonia");
    String delegacion = request.getParameter("delegacion");
    String cp = request.getParameter("cp");
    String estado = request.getParameter("estado");
    ArrayList<String> Pagada = new ArrayList<String>();
    Persona p = new Persona();
    p.conecta();
    Pagada = p.registrarPersona(rfc,nombre,app,apm,genero,fn,telefono,email,calle,numero,colonia,delegacion,cp,estado);
    p.desconecta();
    if(Pagada.size() > 0){
        for(String a: Pagada)
            out.write(a + "<br>");
    }else{
        out.write("No se registro");
    } 
%>

        <script src="../js/jquery-3.1.1.min.js"></script>        
        <script src="../js/bootstrap.min.js"></script>
                
    </body>
</html>