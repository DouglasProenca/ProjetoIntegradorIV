package br.senac.conexaobd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
        String cpf = req.getParameter("CPFCliente");

        //req.setAttribute("listaCarrinho", ProdutosCarrinho);
        //req.setAttribute("total", total);
        req.getRequestDispatcher("/protegido/cliente/Pedidos.jsp").forward(req, resp);

    }
}
