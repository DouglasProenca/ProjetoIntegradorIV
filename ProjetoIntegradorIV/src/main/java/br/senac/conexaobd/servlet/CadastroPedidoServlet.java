/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(name = "CadastroPedidoServlet", urlPatterns = {"/CadastroPedidoServlet"})
public class CadastroPedidoServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                    response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                
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
