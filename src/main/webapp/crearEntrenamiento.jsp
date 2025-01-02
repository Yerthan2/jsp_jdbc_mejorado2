<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 01/01/2025
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Entrenamiento</title>
</head>
<body>

<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int idEntranamiento = -1;
    String tipoEntrenamiento = null;
    String ubicacion = null;
    String fechaRealizacion = null;
    String socioID = null;


    boolean flagValidaEntrenamiento = false;
    boolean flagValidatipoEntrenamiento = false;
    boolean flagValidaUbicacion = false;
    boolean flagValidaFecha = false;
    boolean flagValidaIdEntrenamiento = false;
    boolean flagValidaIdUsuario = false;

    try {

        tipoEntrenamiento = request.getParameter("tipoEntrenamiento");
        if(tipoEntrenamiento != null || tipoEntrenamiento.equalsIgnoreCase("tecnico") || tipoEntrenamiento.equalsIgnoreCase("fisico")){
            flagValidatipoEntrenamiento = true;
        }
        ubicacion = request.getParameter("ubicacion");
        if(ubicacion != null){
            flagValidatipoEntrenamiento = true;
        }
        fechaRealizacion =request.getParameter("fecha");
        if(fechaRealizacion != null || !fechaRealizacion.isEmpty()){
            flagValidaFecha = true;
        }
        socioID = request.getParameter("idUsuario");
        if(socioID != null){
            flagValidaIdUsuario = true;
        }

    } catch (Exception e) {
        e.printStackTrace();

        if (!flagValidatipoEntrenamiento) {
            session.setAttribute("error", "Error en el tipo.");
        } else if (!flagValidaFecha) {
            session.setAttribute("error", "Error en la fecha.");
        } else if(!flagValidaUbicacion){
            session.setAttribute("error", "Error en la ubicacion");
        }

        valida = false;

    }

    if(valida){
        try{
            Connection conn = null;
            PreparedStatement ps = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/baloncesto", "root", "secret");


            String sql = "INSERT INTO entrenamiento VALUES ( " +
                    "?, " +
                    "?, " +
                    "?, " +
                    "?)";

                ps = conn.prepareStatement(sql);

            int idx = 1;
            ps.setString(idx++, tipoEntrenamiento);
            ps.setString(idx++, ubicacion);
            ps.setString(idx++, fechaRealizacion);
            ps.setInt(idx++, Integer.parseInt(socioID));

           out.println("<h2> se ha introducido el usuario </h2>");

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
%>

<a href="index.jsp">Volver al principio</a>
<a href="listarEntrenamientos.jsp">Listamos los entrenamientos</a>
</body>
</html>
