package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.dao.ProdutoDAO;
import br.senac.conexaobd.entidades.Pedido;
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
@WebServlet(name = "pedidosServlet", urlPatterns = {"/pedidosServlet"})
public class pedidosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        try {
            List<Pedido> pedidos = CarrinhoDAO.getPedido(Integer.parseInt(id));
            req.setAttribute("ListaPedidos", pedidos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/cliente/Pedidos.jsp";
            req.getRequestDispatcher(url).forward(req, resp);
        } catch (ClassNotFoundException | SQLException ex) {
            resp.sendRedirect(req.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
