<%-- 
    Document   : statusPedido
    Created on : 06/06/2022, 01:28:25
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
        <title>Status dos Pedidos</title>
    </head>
    <body class="container">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/protegido/index.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
                </svg>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Ligar navegacao">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <br><br><br><br>
        <!-- <div class="col-lg-12" style="text-align: right;">
            <a class="btn btn-primary" href="../produto/cadastro.jsp" role="button">+</a>
        </div> -->
        <br><br>
        <div id="alerta" class="alert alert-success" role="alert" style="display:none">
            Produto alterado com sucesso!
        </div>
        <br><br><br><br>
    <fildset>
        <table class="table" id="tabelaProdutos" aling="center">
            <thead>
            <th>Pedido</th><th>Data</th><th>Valor total</th><th>Status</th>
            </thead>
            <tbody>
                <c:forEach var="pedido" items="${listaPedidos}">
                <tr>
                    <td>${pedido.id}</td>
                    <td>${pedido.data}</td>
                    <td>${pedido.valor}</td>
                    <td>${pedido.status}</td>
                    <td><button class="btn text-primary bg-transparent" data-toggle="modal" data-target="#editar">Editar pedido</button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </fildset>
    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="../produto/StatusPedidoServlet?ope=0">1</a></li>
            <li class="page-item"><a class="page-link" href="../produto/StatusPedidoServlet?ope=1">2</a></li>
            <li class="page-item"><a class="page-link" href="../produto/StatusPedidoServlet?ope=2">3</a></li>
        </ul>
    </nav>
</body>
<a href="${pageContext.request.contextPath}/protegido/index.jsp">Voltar</a>
<form class="modal" id="editar">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Alterar status</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <select class="form-control my-3" id="sel1" name="sellist1">
                    <option>Aguardando pagamento</option>
                    <option>Pagamento rejeitado</option>
                    <option>Pagamento aprovado</option>
                    <option>Aguardando retirada</option>
                    <option>Em trânsito</option>
                    <option>Entregue</option>
                </select>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-lg bg-primary text-white">Salvar</button>
            </div>
        </div>
    </div>
</form>
</html>
