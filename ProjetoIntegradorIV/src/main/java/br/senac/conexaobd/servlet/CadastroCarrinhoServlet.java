package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.entidades.Produto;
import java.io.IOException;
import java.sql.SQLException;
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

    private List<Produto> produtoList;
    double total = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean jaTem = false;
        
        try {
            if (produtoList == null) {
                produtoList = new ArrayList<>();
            }
            Produto produto = CarrinhoDAO.ProdutosCarrinhosemid(request.getParameter("id_produto"));
            for (int i = 0; i < produtoList.toArray().length; i++) {
                if (produtoList.get(i).getCodigo() == Integer.parseInt(request.getParameter("id_produto"))) {
                    produtoList.get(i).setQuantidade(produtoList.get(i).getQuantidade() + 1);
                    produtoList.get(i).setValor(produtoList.get(i).getValor() * produtoList.get(i).getQuantidade());
                    jaTem = true;
                }
            }
            if (!jaTem) {
                produtoList.add(produto);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect(request.getContextPath() + "/Principal.jsp");
    }


@Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ope = req.getParameter("ope");
        String id_produto = null;
        id_produto = req.getParameter("id_produto");
        total = 0;
        for (int i = 0; i < produtoList.toArray().length; i++) {
            total = total + produtoList.get(i).getValor();
        }

        if ("1".equals(ope)) {
            req.setAttribute("listaCarrinho", produtoList);
            req.setAttribute("total", total);
            req.getRequestDispatcher("/Carrinho.jsp").forward(req, resp);
        } else if ("2".equals(ope)) {
            for (int i = 0; i < produtoList.toArray().length; i++) {
                if (produtoList.get(i).getCodigo() == Integer.parseInt(id_produto)) {
                    produtoList.remove(i);
                }
            }
        } 
        resp.sendRedirect(req.getContextPath() + "/Principal.jsp");
    }
}
