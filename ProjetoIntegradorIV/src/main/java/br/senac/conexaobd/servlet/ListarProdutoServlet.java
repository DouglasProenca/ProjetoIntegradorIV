package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "ListarProdutoServlet", urlPatterns = {"/protegido/produto/ListarProdutoServlet"})
public class ListarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ope = Integer.parseInt(request.getParameter("ope"));
        try {
            List<Produto> produtos = ProdutoDAO.getAllProdutos(ope);
            request.setAttribute("listaProdutos", produtos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/produto/listar.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
