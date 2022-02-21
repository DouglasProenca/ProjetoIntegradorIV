<%-- 
    Document   : sobre
    Created on : 18/02/2022, 20:15:26
    Author     : Douglas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="newcss.css" media="screen" />
        <title>ADIMO</title>
    </head>

    <body class="myBackground">
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

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="alert('Cadastro feito com sucesso!')">Enviar</button>
                    </div>

                </div>
            </div>
        </div>
        <main role="main" class="container" style="margin-top: 64px" id="conteudo">

            <h2 style= "padding: 100px 0;">
                <br><br>
                A ADIMO é uma empresa fundada em 2001 que atua no mercado imobiliário ajudando as pessoas a fazer os melhores investimentos 
                em imóveis com as melhores oportunidades e sem burocracia. Nós contamos com especilistas qualificados para te ajudar e orientar
                da melhor forma na hora de escolher seu imóvel de acordo com suas necessidades.<br><br> 
                Nossa missão é atender seus clientes com excelência, transparência e segurança para atingir e superar expectativas.</p>
            </h2>
        </main>
    </body>
</html>
