<%-- 
    Document   : contato
    Created on : 18/02/2022, 20:54:19
    Author     : Douglas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>ADIMO</title>
</head>

<body style="
      background-image: url('img/bg.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      ">
    <c:import url="Uteis/header.jsp"/>
    <div class="modal" tabindex="-1" id="modalFormulario">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Formul&aacute;rio de Reserva</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <fieldset class="col-lg-6">
                            <div class="form-group">
                                <label for="nome">Nome completo:</label>
                                <input type="text" class="form-control" id="nome" name="nome" autofocus="">
                            </div>
                        </fieldset>
                        <fieldset class="col-lg-6">
                            <div class="form-group">
                                <label for="email">E-mail:</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="email@exemplo.com" required="">                                
                            </div>
                        </fieldset>
                    </div>

                    <div class="row">
                        <fieldset class="col-lg-6">


                            <div class="form-group">
                                <label for="cpf">CPF:</label>
                                <input type="text" class="form-control" id="cpf" name="cpf" placeholder="000.000.000-00" required="">
                            </div>
                            <div class="form-group custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="newsletter" value="sim" checked="">
                                <label class="custom-control-label" for="newsletter">
                                    Quero Receber newsletter dos Imóveis da Adimo
                                </label>    
                            </div>
                        </fieldset>
                        <fieldset class="col-lg-6">
                            <div class="form-group">
                                <label for="validade-cartao">Data de Nascimento:</label>
                                <input type="month" class="form-control">
                            </div>

                        </fieldset>
                    </div>
                </div>
                <div class="mdal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="alert('Cadastro feito com sucesso!')">Enviar</button>
                </div>

            </div>
        </div>
    </div>
    <main role="main" class="container" style="margin-top: 64px" id="conteudo">

        <br><h1 style= "padding: 100px 0;">
            <center>FALE CONOSCO:</center>
        </h1>
        <h2>
            <center><ul style="list-style: none">
                    <li>WHATSAPP: <a href="http://wa.me/5511984142577">(11) 98414-2577</a></li>
                    <li>SAC: 0800 0560 9246</li>
                    <li>E-MAIL: <a href="http://adimoimobiliariasp.com.br">adimo@imobiliariasp.com.br</a></li>
                </ul></center>
        </h2>
    </div>
</main>
</body>
</html>