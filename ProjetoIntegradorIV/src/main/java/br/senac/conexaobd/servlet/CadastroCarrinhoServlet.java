package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.entidades.Carrinho;
import br.senac.conexaobd.entidades.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
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

    private List<Produto> produtoList;
    int contador = 0;
    boolean jaTem = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ope = request.getParameter("ope");
        Carrinho carrinho = new Carrinho();
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
                if (produtoList == null) {
                    produtoList = new ArrayList<>();
                }
                Produto produto = CarrinhoDAO.ProdutosCarrinhosemid(request.getParameter("id_produto"));
                contador = 0;
                for (Produto p : produtoList) {
                    if (p.getCodigo() == Integer.parseInt(request.getParameter("id_produto"))) {
                        p.setQuantidade(p.getQuantidade() + 1);
                        produtoList.set(contador, p);
                        jaTem = true;
                    }
                    contador++;
                }
                if(!jaTem){
                produtoList.add(produto);
                }
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(CadastroCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect(request.getContextPath() + "/Principal.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ope = req.getParameter("ope");
        String id_produto = null;
        id_produto = req.getParameter("id_produto");
        //OPE = 1 => Atualização
        if ("1".equals(ope)) {
            double total = 0;
            for (Produto p : produtoList) {
                total = total+(p.getValor()*p.getQuantidade());
            }
            req.setAttribute("listaCarrinho", produtoList);
            req.setAttribute("total", total);
            req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);
        } else if ("2".equals(ope)) {
            try {
                contador = 0;
                for (Produto p : produtoList) {
                    if (p.getCodigo() == Integer.parseInt(id_produto)) {
                        produtoList.remove(contador);
                    }
                    contador++;
                }
            } catch (ConcurrentModificationException e) {
                req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);
            }
            resp.sendRedirect(req.getContextPath() + "/Principal.jsp");
        }
    }
}
