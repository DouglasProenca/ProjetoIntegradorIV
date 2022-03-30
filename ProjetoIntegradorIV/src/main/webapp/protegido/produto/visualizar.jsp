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
            <body>
                <br>
                <br>
                <header class = "container">
                    <nav class="site-header sticky-top py-1">
                        <div class="container d-flex flex-column flex-md-row justify-content-between">
                            <a class="py-2" href="#">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                            </a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Tour</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Produto</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Features</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Premium</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Suporte</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Preços</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Carrinho</a>
                        </div>
                    </nav>
                </header>
                <div class="position-relative overflow-hidden p-4 p-md-5 m-md-3 text-center bg-light" style="width: 93%; height: 600px">
                    <div class="col-md-4 p-lg-4 mx-auto my-5">
                        <h1 class="display-4 font-weight-normal">${Produto.nome}</h1>
                        <p class="lead font-weight-normal">${Produto.descricao}</p>
                        <button class="btn btn-outline-secondary" href="#" disabled>comprar</button>
                    </div>
                    <div class="product-device shadow-sm d-none d-md-block"></div>
                    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
                </div>
                <div class="d-md-flex flex-md-equal w-100 my-md-5 pl-md-5">
                    <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                        <div class="my-3 p-3">
                            <h2 class="display-5">Preço único de Mercado</h2>
                            <p class="lead">${Produto.valor}</p>
                        </div>
                        <div class="bg-dark shadow-sm mx-auto" style="width: 90%; height: 0; border-radius: 21px 21px 0 0;"></div>
                        <img src="${Produto.imgReferencia}" width="350">
                    </div>
                    <div class="bg-primary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                        <div class="my-3 py-3">
                            <h2 class="display-5">Avaliação Geral do Produto</h2>
                            <p class="lead">${Produto.avaliacao}</p>
                        </div>
                        <div class="bg-light shadow-sm mx-auto"></div>
                        <img src="${Produto.imgReferencia}" width="350">
                    </div>
                </div>
                <footer class="container py-5">
                    <div class="row">
                        <div class="col-12 col-md">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mb-2"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                            <small class="d-block mb-3 text-muted">© 2022-2022</small>
                        </div>
                        <div class="col-6 col-md">
                            <h5>Sobre</h5>
                            <ul class="list-unstyled text-small">
                                <li><a class="text-muted" href="#">Equipe</a></li>
                                <li><a class="text-muted" href="#">Locais</a></li>
                                <li><a class="text-muted" href="#">Privacidade</a></li>
                                <li><a class="text-muted" href="#">Termos</a></li>
                            </ul>
                        </div>
                    </div>
                </footer>
            </body>
    </body>