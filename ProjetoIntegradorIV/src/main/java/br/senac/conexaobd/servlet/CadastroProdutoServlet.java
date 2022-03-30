package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Douglas
 */
@WebServlet(name = "CadastroProdutoServlet", urlPatterns = {"/protegido/produto/CadastroProdutoServlet"})
public class CadastroProdutoServlet extends HttpServlet {

    Produto produto = new Produto();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imagem = request.getParameter("nomeProduto");
        System.out.println(imagem);
        try {
            String ope = request.getParameter("ope");
            if (request.getParameter("nomeProduto") != null) {
                produto.setNome(request.getParameter("nomeProduto"));
            }
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidadeProduto")));
            if (request.getParameter("valorProduto") != null) {
                produto.setValor(Double.parseDouble(request.getParameter("valorProduto")));
                produto.setAvaliacao(Float.parseFloat(request.getParameter("avaliacaoProduto")));
            }
            // ope = 1 => Update
            if ("1".equals(ope)) {
                try {
                    produto.setCodigo(Integer.parseInt(request.getParameter("codigoProduto")));
                    ProdutoDAO.updateProduto(produto);
                } catch (ClassNotFoundException ex) {
                    response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                    Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("2".equals(ope)) {

            } else {
                ProdutoDAO.inserirProduto(produto);
            }
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/sucesso.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int codigo = Integer.parseInt(req.getParameter("codigoProduto"));
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        try {
            if ("1".equals(ope)) {
                produto = ProdutoDAO.getProdutoPorCodigo(codigo);
                req.setAttribute("produtoAtualizacao", produto);
                req.getRequestDispatcher("/protegido/produto/cadastro.jsp").forward(req, resp);
            } else if (("2".equals(ope))) {
                ProdutoDAO.statusProduto(codigo);
                resp.sendRedirect(req.getContextPath() + "/protegido/produto/ListarProdutoServlet?ope=0");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
