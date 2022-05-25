package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Carrinho;
import br.senac.conexaobd.entidades.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "CadastroCarrinhoServlet", urlPatterns = {"/protegido/produto/CadastroCarrinhoServlet"})
public class CadastroCarrinhoServlet extends HttpServlet {

    private List<Produto> ProdutosCarrinho;
    private List<Produto> produtoList = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ope = request.getParameter("ope");
        Carrinho carrinho = new Carrinho();
        if (!request.getParameter("id_cliente").equals("")) {
            carrinho.setId(Integer.parseInt(request.getParameter("id_cliente")));
        }
        carrinho.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
        if ("1".equals(ope)) {
            carrinho.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
        }
        // ope = 1 => Update

        if ("1".equals(ope)) {
            try {
                CarrinhoDAO.updateProduto(carrinho);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                if (!request.getParameter("id_cliente").equals("")) {
                    CarrinhoDAO.inserirProduto(carrinho);
                } else {
                    Produto produto = CarrinhoDAO.ProdutosCarrinhosemid(request.getParameter("id_produto"));
                    produtoList.add(produto);
                    ProdutosCarrinho = produtoList;
                }
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(CadastroCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect(request.getContextPath() + "/Principal.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id_cliente");
        String ope = req.getParameter("ope");
        String id_produto = null;
        if ("2".equals(ope)) {
            id_produto = req.getParameter("id_produto");
        }
        //OPE = 1 => Atualização
        try {
            if ("1".equals(ope)) {
                if (!req.getParameter("id_cliente").equals("")) {
                    ProdutosCarrinho = CarrinhoDAO.ProdutosCarrinho(id);
                }
                double total = 0;
                for (Produto p : ProdutosCarrinho) {
                    total = total + p.getValor();
                }
                req.setAttribute("listaCarrinho", ProdutosCarrinho);
                req.setAttribute("total", total);
                req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);

            } else if ("2".equals(ope)) {
                CarrinhoDAO.excluir(id_produto);
                resp.sendRedirect(req.getContextPath() + "/Principal.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
}
