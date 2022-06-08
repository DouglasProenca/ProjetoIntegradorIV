/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.dao.UsuarioDAO;
import br.senac.conexaobd.entidades.Pedido;
import br.senac.conexaobd.entidades.Usuario;
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
@WebServlet(name = "StatusPedidoServlet", urlPatterns = {"/protegido/produto/StatusPedidoServlet"})
public class StatusPedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido pedido = new Pedido();
        pedido.setId(Integer.parseInt(request.getParameter("nomeUsuario")));
        pedido.setStatus(request.getParameter("emailUsuario"));
        
        try {
            CarrinhoDAO.updateStatusPedido(pedido);
            List<Pedido> pedidos = CarrinhoDAO.getAllPedidos(0);
            request.setAttribute("listaPedidos", pedidos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/statusPedido.jsp";
        } catch (SQLException | ClassNotFoundException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int ope = Integer.parseInt(request.getParameter("ope"));
            List<Pedido> pedidos = CarrinhoDAO.getAllPedidos(ope);
            request.setAttribute("listaPedidos", pedidos);
            // RequestDispatcher reaproveita os objetos Request e Response
            String url = "/protegido/statusPedido.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
            Logger.getLogger(ListarUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
