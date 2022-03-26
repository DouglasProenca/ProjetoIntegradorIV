<%-- 
    Document   : visualizar
    Created on : 26/03/2022, 17:25:19
    Author     : Camil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Visualizar produtos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
    </head>
    <body>
        <div class="container">
            <c:import url="../uteis/header.jsp"/>
            <br><br><br>
            <h1><center>Visualizar produtos</center></h1>
            <br><br>
            <form class="col-md-6 offset-md-3 jumbotron">
                <h1><img src="Resources/notebook_lenovo" alt="Notebook Lenovo IdeaPad"></h1>
                <p class="sacola">

                    <button type="submit" class="btn btn-primary">Comprar</button>
            </form>
        </div>
    </body>