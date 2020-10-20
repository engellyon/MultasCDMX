<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagar Multa</title>
    </head>
    <body>
       <a href="../index.html">Inicio</a>
        <h1>Pagar Multa</h1>
        <form action="Paga_Multa_proceso.jsp" method="post"> 
                    Ingresa el Id de la multa  <input type="text" required="true" name="id">
                    <br>
                    <input type="submit" value="Pagar">
        </form>
    </body>
</html>
