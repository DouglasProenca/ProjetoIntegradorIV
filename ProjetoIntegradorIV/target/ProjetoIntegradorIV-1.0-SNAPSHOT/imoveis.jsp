<%-- 
    Document   : imoveis
    Created on : 18/02/2022, 19:55:43
    Author     : Douglas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

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
            <div class="album py-5 bg-light">
                <div class="container">

                    <div class="row">

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104601</h4>
                                </div>
                                <img src="Resources/casa_1.jpeg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Avenida Adolfo Pinheiro<br>Santo Amaro - 215<br>Bairro Alto da Boa Vista - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104601);" id="anuncio-104601">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104602</h4>
                                </div>
                                <img src="Resources/casa_2.jpg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Rua Oscar freire<br>Alameda Casa Branca - 200<br>São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104602);" id="anuncio-104602">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104603</h4>
                                </div>
                                <img src="Resources/casa_3.png" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Avenida Brigadeiro Faria Lima - 12<br>Pinheiros - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104603);" id="anuncio-104603">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104604</h4>
                                </div>
                                <img src="Resources/casa_4.jpeg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Avenida Radial Leste - 3458<br>Rua da Figueira - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104604);" id="anuncio-104604">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104605</h4>
                                </div>
                                <img src="Resources/casa_5.jpg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Rua Cerro Corá - 430<br>Vila Romana - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104605);" id="anuncio-104605">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104606</h4>
                                </div>
                                <img src="Resources/casa_6.jpg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Avenida Doutor Arnaldo - 320<br>Pinheiros - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104606);" id="anuncio-104606">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104607</h4>
                                </div>
                                <img src="Resources/casa_7.jpg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Avenida Ermano Marchetti - 1440<br>Lapa - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104607);" id="anuncio-104607">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header">
                                    <h4>#104608</h4>
                                </div>
                                <img src="Resources/casa_8.jpg" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <div class="card-body">
                                    <p class="card-text">Rua Voluntários da Pátria - 1871<br>Santana - São Paulo</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group ml-auto">
                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="return selecionarImovel(104608);" id="anuncio-104608">Reservar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <script>

                let selecionarImovel = (anuncio) => {

                    const botao = $(`#anuncio-${anuncio}`)
                    if (botao.hasClass('btn-outline-success')) {
                        botao.removeClass('btn-outline-success')
                        botao.addClass('btn-outline-info')
                        botao.html('Reservado!')
                    } else {
                        botao.addClass('btn-outline-success')
                        botao.removeClass('btn-outline-info')
                        botao.html('Reservar')
                    }
                    return false
                }

            </script>
        </main>
    </body>
</html>
