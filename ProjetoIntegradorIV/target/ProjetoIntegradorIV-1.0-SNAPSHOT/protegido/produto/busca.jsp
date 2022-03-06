<%-- 
    Document   : Buscar Usuario
    Created on : 06/03/2022, 21:00:14
    Author     : Douglas Proença
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Usuário</title>
    </head>
    <body class="container">
        <c:import url="../uteis/header.jsp"/>
        <br><br><br>
        <input type="text" id="nomeCliente" class="form-control"/><br/>
        <button onclick="buscar()" class="btn btn-primary">Buscar</button>
        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
        <br><br>
        <table id="tabelaClientes" class="table">
            <thead>
            <th>Nome</th>
            <th>Categoria</th>
            <th>CPF</th>
            <th>Ativo</th>
        </thead>
        <tbody></tbody>
    </table>
</body>
</html>