<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous" />
        <title>Buscar produto</title>
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
                    <ul>
                        <li><a href="#">Notebook Lenovo</a></li>
                        <li><a href="#">Celulares Samsung</a></li>
                        <li><a href="#">Iphones</a></li>
                    </ul>
                </li>         
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
        <ol>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="Resources/bg.png" alt="miniatura1">
                        <figcaption>Galaxy S10 Plus por R$ 2849,90</figcaption>
                    </figure>
                </a>    
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="Resources/bg.png" alt="miniatura1">
                        <figcaption>Notebook Lenovo IdeaPad por R$ 2999,90</figcaption>
                    </figure>
                </a>
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="Resources/bg.png" alt="miniatura1">
                        <figcaption>Iphone 13 Pro Max por R$ 6449,90</figcaption>
                    </figure>
                </a>
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="Resources/bg.png" alt="miniatura1">
                        <figcaption>Iphone 13 Mini por R$ 3749,90</figcaption>
                    </figure>
                </a>
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="Resources/bg.png" alt="miniatura1">
                        <figcaption>Iphone 11 Pro por R$ 3149,90</figcaption>
                    </figure>
                </a>
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="Resources/bg.png" alt="miniatura1">
                        <figcaption>Galaxy S10 por R$ 2549,90</figcaption>
                    </figure>
                </a>
            </li>
        </ol>
    </section>
    <section class="painel Mais-Pesquisados">
        <h2>Mais Pesquisados</h2>
        <ol>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="img/produtos/miniatura7.png" alt="miniatura7">
                        <figcaption>Iphone 11 Pro por R$ 3149,90</figcaption>
                    </figure>
                </a>    
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="img/produtos/miniatura8.png" alt="miniatura8">
                        <figcaption>Iphone 12 Mini por R$ 4149,90</figcaption>
                    </figure>
                </a>    
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="img/produtos/miniatura9.png" alt="miniatura9">
                        <figcaption>Samsung S22 Plus por R$ 4349,90</figcaption>
                    </figure>
                </a>    
            </li>
            <li>
                <a href="produto.html">
                    <figure>
                        <img src="img/produtos/miniatura10.png" alt="miniatura10">
                        <figcaption>Notebook Lenovo IdeaPad por R$ 2999,90</figcaption>
                    </figure>
                </a>    
            </li>
        </ol>
    </section>
</div>

</body>
</html>