<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<a href="../index.html">Inicio</a>
<br>
<h1>Multas Obtenidas</h1>
<% 
    String multa = request.getParameter("placas");
    ArrayList<String> Multas = new ArrayList<String>();
    Persona p = new Persona();
    p.conecta();
    Multas = p.getMultas2(multa);
    p.desconecta();
    if(Multas.size() > 0){
        for(String a: Multas)
            out.write(a + "<br>");
    }else{
        out.write("FELICIDADES!!!  no tienes  ninguna multa");
    } 
%>