<%-- 
    Document   : cadastroCliente
    Created on : 20/04/2022, 20:00:05
    Author     : Gabriel Lima
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
        <title>Cadastro</title>

        <script>
            function mascaraCPF(i) {

                var v = i.value;

                if (isNaN(v[v.length - 1])) {
                    i.value = v.substring(0, v.length - 1);
                    return;
                }

                i.setAttribute("maxlength", "14");
                if (v.length == 3 || v.length == 7)
                    i.value += ".";
                if (v.length == 11)
                    i.value += "-";

            }
        </script>
    </head>
    <body class="">
        <header class="fixed-top bg-dark pb-3">
            <div class="container">
                <div class="d-flex justify-content-center mt-3">
                    <a class="btn text-white px-4" href="Principal.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                    </a>
                </div>
            </div>
        </header>
        <div class="container-fluid bg-dark shadow" style="height: 250px"></div>
        <div class="container shadow border bg-light p-5 mb-sm-5" style="max-width: 600px; top: -50px; position: relative; border-radius: 15px">
            <h2 class="display-4 mb-5" style="text-align: center">Cadastro</h2>
            <form action="CadastroClienteServlet" method="POST">
                <c:if test="${not empty clienteAtualizacao}">
                    <input type="hidden" name="ope" value="1"/>
                </c:if>
                <c:if test="${param.cpfInvalido != null}">
                    <div class="alert alert-danger" role="alert">
                        CPF Inválido!
                    </div>  
                </c:if>
                <p class="mb-0">Seu nome</p>
                <div class="input-group mb-3 px-auto justify-content-sm-between">
                    <div class="d-sm-inline flex-fill mr-sm-1">
                        <input class="form-control" type="text" name="prnome" required placeholder="Primeiro nome"></div>
                    <div class="d-sm-inline flex-fill">
                        <input class="form-control" type="text" name="sgnome" required placeholder="Segundo nome"></div>
                </div>
                <p class="mb-0">Sua data de nascimento</p>
                <div class="input-group mb-3">
                    <input class="form-control" type="date" id="datemax" required name="datemax" max="2022-12-31">
                </div>
                <p class="mb-0">Seu gênero</p>
                <div class="mb-3">
                    <div class="form-check-inline">
                        <label class="form-check-label" for="feminino">
                            <input type="radio" class="form-check-input" id="feminino" name="optradio" value="option1">Feminino
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="masculino">
                            <input type="radio" class="form-check-input" id="masculino" name="optradio" value="option2">Masculino
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="outro">
                            <input type="radio" class="form-check-input" id="outro" name="optradio" value="option3">Outros
                        </label>
                    </div>
                </div>            
                <p class="mb-0">Seu CPF</p>
                <div class="form-group">
                    <input class="form-control" required placeholder="___ . ___ . ___ - __" name="cpf" oninput="mascaraCPF(this)" type="text">
                </div>
                <p class="mb-0">Seu e-mail</p>
                <div class="form-group">
                    <input class="form-control" required type="email" name="email" placeholder="exemplo@mail.com">
                </div>
                <p class="mb-0">Seu CEP</p>
                <div class="form-group">
                    <input class="form-control" type="text" id="cep" name="cep" placeholder="_____ - ___">
                </div>
                <p class="mb-0">Seu endereço</p>
                <div class="form-group">
                    <div class="d-sm-inline flex-grow-1 mr-sm-1">
                        <input class="form-control" type="text" id="rua" name="rua" placeholder="Rua">
                    </div>
                    <input class="form-control" type="number" id="numero" min="0" name="num" placeholder="Nº">
                </div>             
                <div class="input-group mb-3">
                    <input class="form-control" type="text" id="complemento" name="complemento" placeholder="Complemento">
                </div>
                <div class="input-group mb-3">
                    <div class="d-sm-inline flex-fill mr-sm-1">
                        <input class="form-control" type="text" id="bairro" name="bairro" placeholder="Bairro">
                    </div>
                    <div class="d-sm-inline flex-fill mr-sm-1">
                        <input class="form-control" type="text" id="cidade" name="cidade" placeholder="Cidade">
                    </div>
                    <input class="form-control" type="text" id="uf" name="uf" placeholder="UF">
                </div>
                <p class="mb-0">Defina uma senha</p>
                <div class="input-group mb-3">
                    <div class="d-sm-inline flex-fill mr-sm-1">
                        <input class="form-control" type="password" required name="senhaConfir" placeholder="Crie uma senha"></div>
                    <div class="d-sm-inline flex-fill">
                        <input class="form-control" type="password" required name="senha" placeholder="Confirme a senha"></div>
                </div>
                <div class=" d-flex justify-content-sm-between mt-5">
                    <div class="order-2">
                        <button type="submit" class="btn bg-primary text-white px-4">Cadastrar</button>
                    </div>
                    <div class="order-1 align-self-end">
                        <a class="btn p-0" href="loginCliente.jsp">
                            Já tem cadastro? Entre aqui
                        </a>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            //máscara do cep
            $("#cep").inputmask({"mask": "99999-999"});

            $("#cep").focusout(function () {
                //Início do Comando AJAX
                $.ajax({
                    //O campo URL diz o caminho de onde virá os dados
                    //É importante concatenar o valor digitado no CEP
                    url: 'https://viacep.com.br/ws/' + $(this).val() + '/json/',
                    //Aqui você deve preencher o tipo de dados que será lido,
                    //no caso, estamos lendo JSON.
                    dataType: 'json',
                    //SUCESS é referente a função que será executada caso
                    //ele consiga ler a fonte de dados com sucesso.
                    //O parâmetro dentro da função se refere ao nome da variável
                    //que você vai dar para ler esse objeto.
                    success: function (resposta) {
                        //Agora basta definir os valores que você deseja preencher
                        //automaticamente nos campos acima.
                        if (!("erro" in resposta)) {
                            $("#rua").val(resposta.logradouro);
                            $("#complemento").val(resposta.complemento);
                            $("#bairro").val(resposta.bairro);
                            $("#cidade").val(resposta.localidade);
                            $("#uf").val(resposta.uf);
                            //Vamos incluir para que o Número seja focado automaticamente
                            //melhorando a experiência do usuário
                            $("#numero").focus();
                        } else {
                            //CEP não Encontrado.
                            alert("CEP não encontrado.");
                        }
                    }
                });
            });
        </script>
    </body>
</html>

