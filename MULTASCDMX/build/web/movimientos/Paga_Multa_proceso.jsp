<%@page import="java.util.ArrayList"%>
<%@page import="control.Persona"%>
<a href="../index.html">Inicio</a>
<br>
<h1>Multa</h1>
<% 
    String foto = request.getParameter("id");
    ArrayList<String> Registra = new ArrayList<String>();
    Persona p = new Persona();
    p.conecta();
    Registra = p.pagaMulta(foto);
    p.desconecta();
    if(Registra.size() > 0){
        for(String a: Registra)
            out.write(a + "<br>");
    }else{
        out.write("No se pudo realizar el pago");
    } 
%>