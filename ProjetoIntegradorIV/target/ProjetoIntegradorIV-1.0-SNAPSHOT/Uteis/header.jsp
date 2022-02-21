<%-- 
    Document   : header
    Created on : 18/02/2022, 20:02:04
    Author     : Douglas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="${pageContext.request.contextPath}/lib/jquery-3.6.0.min.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/lib/bootstrap-4.1.3-dist/css/bootstrap.min.css"
              rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/uteis.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="index.jsp">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
            <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
            </svg>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Ligar navegacao">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="imoveis.jsp">
                        Im&oacute;veis
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sobre.jsp">
                        Sobre
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contato.jsp">
                        Contato
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reserva</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <button type="button" class="dropdown-item" data-toggle="modal" data-target="#modalFormulario">
                            Preencher formul&aacute;rio
                        </button>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
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
                                    <input type="date" class="form-control">
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
</html>
