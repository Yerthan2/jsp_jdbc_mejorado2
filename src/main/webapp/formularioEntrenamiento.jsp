<%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 30/12/2024
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulario Entrenamiento</title>
</head>
<body>
<h1>Esto sirve para crear los entrenamientos</h1>
<form action="crearEntrenamiento.jsp">
    <label>Dime el tipo de entranamiento que quieres tecnico o físico</label>
    <select name="tipoEntrenamiento">
        <option>Tecnico</option>
        <option>Fisico</option>
    </select>
    <label>Ubicacion del entrenamiento</label>
    <input type="text" name="ubicacion">
    <label>Fecha de realizacion</label>
    <input type="date" name="fecha">
    <label>Id del usuario</label>
    <input type="text" name="idUsuario">
    <button type="submit" value="Enviar">Enviar</button>
</form>

</body>
</html>
