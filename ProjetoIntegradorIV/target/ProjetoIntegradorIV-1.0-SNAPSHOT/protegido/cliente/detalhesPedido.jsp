<%-- 
    Document   : detalhesPedido
    Created on : 26/05/2022, 18:06:38
    Author     : Gabriel Lima
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous" />
        <script src="${pageContext.request.contextPath}/lib/jquery-3.6.0.min.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/lib/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <title>Detalhes</title>
    </head>
    <body style="background-color: #006C75">
        <header class="fixed-top bg-dark pb-3">
            <div class="container">
                <div class="d-flex justify-content-center mt-3">
                    <a class="btn text-white px-4" href="${pageContext.request.contextPath}/Principal.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                    </a>
                </div>
            </div>
        </header>
        <div class="container-fluid bg-dark shadow" style="height: 250px"></div>
        <div class="container shadow border bg-light p-5 mb-sm-5" style="top: -50px; position: relative; border-radius: 15px;">
            <h1 class="display-4 text-center mb-5">Detalhes do pedido</h1>
            <div class="container p-sm-5 border-bottom border-top mt-sm-3">
                <br>
                <h3>Produtos:</h3>
                <c:forEach var="produto" items="${listaCarrinho}">
                    <div class="d-flex px-5">
                        <h5 class="flex-fill">${produto.nome}</h5>
                        <h6 class="align-self-end">${produto.valor}</h6>
                    </div>
                </c:forEach>
                <br>
                <h3>Endereço de entrega:</h3>
                <br>
                <div class="pl-5">
                    <h5>Rua Santo Alberto, 325</h5>
                    <h5>Campo Grande - São Paulo, SP</h5>
                    <h5>04676-041</h5>
                </div>
                <br>
                <h3>Frete</h3>
                <div class="d-flex px-5">
                    <h5 class="flex-fill">Normal</h5>
                    <h6 class="align-self-end">R$${frete}</h6>
                </div>                
                <br>
                <h3>Método de pagamento:</h3>
                <h5 class="pl-5">${forma_pagamento}</h5>
                <br>
                <h3>Total:</h3>
                <h4 class="pl-5">R$${total}</h4>
            </div>
            <div class="d-flex align-self-sm-end align-self-center">
                <div class="mt-sm-3 mt-4">
                    <form Action="CadastroPedidoServlet" method="POST">
                        <input type="text" name="id_cliente" id="id_cliente" hidden value="${sessionScope.cliente.id}">
                        <input type="text" name="forma_pg" id="forma_pg" hidden value="${forma_pagamento}">
                        <button class="btn btn-lg bg-primary text-white" type="submit">Continuar</a>  
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>