<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
        <title>Buscar produto</title>
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
        <br><br><br>
        <input type="text" id="nomeUsuario" class="form-control"/><br/>
        <button onclick="buscar()" class="btn btn-primary">Buscar</button>
        <div id="msgAlerta" class="alert alert-warning" role="alert" style="display:none">
            <span id="txtAlerta"></span>
        </div>
    </header>
        <div class="container destaque">
            <section class="busca">
                <h2>Busca</h2>
                <form>
                    <input type="search">
                    <button>Buscar</button>
                </form>
            </section>
            <section class="menu-departamentos">
                <h2>Sessões</h2>
                <nav>
                    <ul>
                        <li><a href="#">Smartphones e Notebooks</a>   
                        <li><a href="#">Notebook Lenovo</a></li>
                        <li><a href="#">Celulares Samsung</a></li>
                        <li><a href="#">Iphones</a></li>         
                        <li><a href="#">Televisões</a></li> 
                        <li><a href="#">Tablets</a></li> 
                        <li><a href="#">Fones de ouvido</a></li> 
                    </ul>
                </nav>
            </section>
        </div>
        <div class="container paineis" >
            <section class="Painel Destaques">
                <h2>Destaques</h2>
                <ul>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/samsung/smartphones/s21-branco.jpg" alt="miniatura1" width="300px" height="300px">
                                <figcaption>Galaxy S21 - Branco por R$ 2849,90</figcaption>
                            </figure>
                        </a>    
                    </li>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/samsung/smartphones/s22-preto.jpg" alt="miniatura2" width="300px" height="300px">
                                <figcaption>Galaxy S22 - Preto por R$ 2999,90</figcaption>
                            </figure>
                        </a>
                    </li>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/samsung/smartphones/s22-ultra-vinho.jpg" alt="miniatura3" width="300px" height="300px">
                                <figcaption>Galaxy S22 Ultra - Vinho por R$ 2549,90</figcaption>
                            </figure>
                        </a>
                    </li>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/apple/iphones/iphone11-green-select-2019.png" alt="miniatura4" width= auto height= "350px">
                                <figcaption>Iphone 11 - Verde por R$ 3149,90</figcaption>
                            </figure>
                        </a>
                    </li>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/apple/iphones/iphone-12-purple-select-2021.png" alt="miniatura5" width=auto height="400px">
                                <figcaption>Iphone 12 - Roxo por R$ 3149,90</figcaption>
                            </figure>
                        </a>
                    </li>
                    <li>
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
                <h2>Mais Pesquisados</h2>
                <ul>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/apple/iphones/iphone-12-blue-select-2020.png" alt="miniatura7" width=auto height="400px">
                                <figcaption>Iphone 12 - Azul por R$ 3149,90</figcaption>
                            </figure>
                        </a>    
                    </li>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/apple/iphones/iphone-13-product-red-select-2021.png" alt="miniatura8" width=auto height="450px">
                                <figcaption>Iphone 13 Mini - Vermelho por R$ 6449,90</figcaption>
                            </figure>
                        </a>    
                    </li>
                    <li>
                        <a href="produto.html">
                            <figure>
                                <img src="Resources/samsung/smartphones/s22-ultra-verde.jpg" alt="miniatura3" width="300px" height="300px">
                                <figcaption>Galaxy S22 Ultra - Verde por R$ 2549,90</figcaption>
                            </figure>
                        </a>    
                    </li>
                    <li>
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