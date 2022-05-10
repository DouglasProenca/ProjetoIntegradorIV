package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.CarrinhoDAO;
import br.senac.conexaobd.entidades.Carrinho;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ope = request.getParameter("ope");
        Carrinho carrinho = new Carrinho();
        carrinho.setId(Integer.parseInt(request.getParameter("id_cliente")));
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
                CarrinhoDAO.inserirProduto(carrinho);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(CadastroCarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect(request.getContextPath() + "/Principal.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* String cpf = req.getParameter("CPFCliente");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        try {
            if ("1".equals(ope)) {
                Cliente cliente = ClienteDAO.getClientePorCPF(cpf);
                List<EnderecoCliente> enderecos = ClienteDAO.getEnderecoCliente(cpf);
                req.setAttribute("listaEnderecos", enderecos);
                req.setAttribute("clienteAtualizacao", cliente);
                req.getRequestDispatcher("/protegido/cliente/perfilCliente.jsp").forward(req, resp);
            

} else if (("2".equals(ope))) {
                //ClienteDAO.statusUsuario(cpf);
                //resp.sendRedirect(req.getContextPath() + "/protegido/usuario/ListarUsuarioServlet?ope=0");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class
.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
    }
}
