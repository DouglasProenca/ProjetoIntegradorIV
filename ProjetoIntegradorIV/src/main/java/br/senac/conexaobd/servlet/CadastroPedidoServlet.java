package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CadastroPedidoServlet", urlPatterns = {"/CadastroPedidoServlet"})
public class CadastroPedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_cliente = request.getParameter("id_cliente");
        String forma_pg = request.getParameter("forma_pg");
        try {
            CarrinhoDAO.inserirPedido(Integer.parseInt(id_cliente),
                    CadastroCarrinhoServlet.frete, CadastroCarrinhoServlet.total, forma_pg); 
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect(request.getContextPath() + "/Principal.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String forma_pagamento = req.getParameter("forma_pagemento");

        req.setAttribute("listaCarrinho", CadastroCarrinhoServlet.produtoList);
        req.setAttribute("total", CadastroCarrinhoServlet.total);
        req.setAttribute("frete", CadastroCarrinhoServlet.frete);
        req.setAttribute("forma_pagamento", forma_pagamento);
        req.getRequestDispatcher("/protegido/cliente/detalhesPedido.jsp").forward(req, resp);
    }

}
