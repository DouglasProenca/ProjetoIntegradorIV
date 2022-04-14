<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                  crossorigin="anonymous" />
            <title>CR7 Tecnology</title>
            <script src="${pageContext.request.contextPath}/lib/jquery-3.6.0.min.js" type="text/javascript"></script>
            <link href="${pageContext.request.contextPath}/lib/bootstrap-4.1.3-dist/css/bootstrap.min.css"
                  rel="stylesheet" type="text/css"/>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                <style>            
                    body{
                        margin: auto;
                    }
                    ul{
                        display: inline;

                    }
                    li{
                        list-style-type: none;
                    }
                </style>
                </head>
                <body class="container">
                    <nav class="site-header sticky-top py-1">
                        <div class="container d-flex flex-column flex-md-row justify-content-between">
                            <a class="py-2" href="#">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                            </a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Login</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Produto</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Suporte</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Preços</a>
                            <a class="py-2 d-none d-md-inline-block" href="#">Carrinho</a>
                        </div>
                    </nav>
                    <div class="container destaque">
                        <br>
                            <section class="busca">
                                <form>
                                    <input type="search" class="form-control" placeholder="Pesquise um produto">
                                        <br>
                                            <button class="btn-primary">Buscar</button>
                                            </form>
                                            </section>
                                            <section class="menu-departamentos">
                                                <nav>
                                                    <ul class="list-group">
                                                        <li class="list-group-item active">Sessões</li>
                                                        <li class="list-group-item"><a href="#">Notebook Lenovo</a></li>
                                                        <li class="list-group-item"><a href="#">Celulares Samsung</a></li>
                                                        <li class="list-group-item"><a href="#">Iphones</a></li>         
                                                        <li class="list-group-item"><a href="#">Televisões</a></li> 
                                                        <li class="list-group-item"><a href="#">Tablets</a></li> 
                                                        <li class="list-group-item"><a href="#">Fones de ouvido</a></li> 
                                                    </ul>
                                                </nav>
                                            </section>
                                            </div>
                                            <br>
                                                <div class="container paineis" >
                                                    <section class="Painel Destaques">
                                                        <h2>Destaques</h2>
                                                        <a href="protegido/produto/VisualizarServlet?id=7">
                                                            <div id="carousel" class="carousel slide carousel-fade" data-ride="carousel" style="margin-bottom: 40px;">
                                                                <ol class="carousel-indicators">
                                                                    <li data-target="#carousel" data-slide-to="0" class=""></li>
                                                                    <li data-target="#carousel" data-slide-to="1" class=""></li>
                                                                    <li data-target="#carousel" data-slide-to="2" class="active"></li>
                                                                </ol>
                                                                <div class="carousel-inner">
                                                                    <div class="carousel-item">
                                                                        <img src="Resources/s21-branco.jpg" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false" width="100%" height="100%">
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <img src="Resources/s21-violeta.jpg" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false" width="100%" height="100%">
                                                                    </div>
                                                                    <div class="carousel-item active">
                                                                        <img src="Resources/s21-cinza.jpg" role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false" width="100%" height="100%">
                                                                    </div>
                                                                </div>
                                                                <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                    <span class="sr-only">Anterior</span>
                                                                </a>
                                                                <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                    <span class="sr-only">Pr&oacute;xima</span>
                                                                </a>
                                                            </div>
                                                        </a> 
                                                        <ul class="list-group list-group-horizontal">
                                                            <li class="list-group-item">
                                                                <a href="produto.html">
                                                                    <figure>
                                                                        <img src="Resources/samsung/smartphones/s21-branco.jpg" alt="miniatura1" width="300px" height="300px">
                                                                            <figcaption>Galaxy S21 - Branco por R$ 2849,90</figcaption>
                                                                    </figure>
                                                                </a>    
                                                            </li>
                                                            <li class="list-group-item">
                                                                <a href="produto.html">
                                                                    <figure>
                                                                        <img src="Resources/samsung/smartphones/s22-preto.jpg" alt="miniatura2" width="300px" height="300px">
                                                                            <figcaption>Galaxy S22 - Preto por R$ 2999,90</figcaption>
                                                                    </figure>
                                                                </a>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <a href="produto.html">
                                                                    <figure>
                                                                        <img src="Resources/samsung/smartphones/s22-ultra-vinho.jpg" alt="miniatura3" width="300px" height="300px">
                                                                            <figcaption>Galaxy S22 Ultra - Vinho por R$ 2549,90</figcaption>
                                                                    </figure>
                                                                </a>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <a href="produto.html">
                                                                    <figure>
                                                                        <img src="Resources/apple/iphones/iphone11-green-select-2019.png" alt="miniatura4" width= auto height= "350px">
                                                                            <figcaption>Iphone 11 - Verde por R$ 3149,90</figcaption>
                                                                    </figure>
                                                                </a>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <a href="produto.html">
                                                                    <figure>
                                                                        <img src="Resources/apple/iphones/iphone-12-purple-select-2021.png" alt="miniatura5" width=auto height="400px">
                                                                            <figcaption>Iphone 12 - Roxo por R$ 3149,90</figcaption>
                                                                    </figure>
                                                                </a>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <a href="produto.html">
                                                                    <figure>
                                                                        <img src="Resources/apple/iphones/iphone-13-pro-green-select.png" alt="miniatura6" width=auto height="450px" >
                                                                            <figcaption>Iphone 13 Pro - Verde por R$ 6449,90</figcaption>
                                                                    </figure>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </section>
                                                    <section class="painel Mais-Pesquisados">
                                                        <br>
                                                            <h2>Mais Pesquisados</h2>
                                                            <ul class="list-group list-group-horizontal">
                                                                <li class="list-group-item">
                                                                    <a href="produto.html">
                                                                        <figure>
                                                                            <img src="Resources/apple/iphones/iphone-12-blue-select-2020.png" alt="miniatura7" width=auto height="400px">
                                                                                <figcaption>Iphone 12 - Azul por R$ 3149,90</figcaption>
                                                                        </figure>
                                                                    </a>    
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <a href="produto.html">
                                                                        <figure>
                                                                            <img src="Resources/apple/iphones/iphone-13-product-red-select-2021.png" alt="miniatura8" width=auto height="450px">
                                                                                <figcaption>Iphone 13 Mini - Vermelho por R$ 6449,90</figcaption>
                                                                        </figure>
                                                                    </a>    
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <a href="produto.html">
                                                                        <figure>
                                                                            <img src="Resources/samsung/smartphones/s22-ultra-verde.jpg" alt="miniatura3" width="300px" height="300px">
                                                                                <figcaption>Galaxy S22 Ultra - Verde por R$ 2549,90</figcaption>
                                                                        </figure>
                                                                    </a>    
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <a href="produto.html">
                                                                        <figure>
                                                                            <img src="Resources/samsung/smartphones/s21-cinza.jpg" alt="miniatura1" width="300px" height="300px">
                                                                                <figcaption>Galaxy S21 - Cinza  por R$ 2849,90</figcaption>
                                                                        </figure>
                                                                    </a>    
                                                                </li>
                                                            </ul>
                                                    </section>
                                                </div>
                                                </body>
                                                </html>