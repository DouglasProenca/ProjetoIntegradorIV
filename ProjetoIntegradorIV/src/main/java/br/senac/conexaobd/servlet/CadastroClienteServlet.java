/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.conexaobd.servlet;

import br.senac.conexaobd.dao.ClienteDAO;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.conexaobd.entidades.EnderecoCliente;
import br.senac.conexaobd.entidades.Usuario;
import br.senac.uteis.CryptoUtils;
import br.senac.uteis.ValidaCPF;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CadastroClienteServlet", urlPatterns = {"/CadastroClienteServlet"})
public class CadastroClienteServlet extends HttpServlet {

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String ope = request.getParameter("ope");
            Cliente cliente = new Cliente();
            cliente.setNome(request.getParameter("prnome")+" "+request.getParameter("sgnome"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setGenero(request.getParameter("optradio"));
            cliente.setNascimento(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("datemax")));
            if (!request.getParameter("senha").equals("")){
                 cliente.setSenha(CryptoUtils.gerarhashSenha(request.getParameter("senha")));
            }
            
            EnderecoCliente endereco = new EnderecoCliente();
            endereco.setCEP(request.getParameter("cep"));
            endereco.setRua(request.getParameter("rua"));
            endereco.setBairro(request.getParameter("bairro"));
            endereco.setCidade(request.getParameter("cidade"));
            endereco.setCidade(request.getParameter("uf"));
            endereco.setComplemento(request.getParameter("complemento"));
            endereco.setNumero(Integer.parseInt(request.getParameter("num")));
            
            // ope = 1 => Update
            if ("1".equals(ope)) {
               /* try {
                    ClienteDAO.updateUsuario(cliente);
                } catch (ClassNotFoundException ex) {
                    response.sendRedirect(request.getContextPath() + "/protegido/uteis/erro.jsp");
                    Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
                }*/
            } else {
                if (ValidaCPF.isCPF((request.getParameter("cpf")).replace(".","").replace("-","")) == true) {
                    //UsuarioDAO.inserirUsuario(usuario);
                } else {
                    response.sendRedirect(request.getContextPath() + "/cadastroCliente.jsp?cpfInvalido=true");
                }
            }
           //response.sendRedirect(request.getContextPath() + "/loginCliente.jsp");
        } catch (ParseException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cpf = req.getParameter("CPFUsuario");
        String ope = req.getParameter("ope");
        //OPE = 1 => Atualização
        /*try {
            if ("1".equals(ope)) {
                Usuario usuario = UsuarioDAO.getUsuarioPorCPF(cpf);
                req.setAttribute("clienteAtualizacao", usuario);
                req.getRequestDispatcher("/protegido/usuario/cadastro.jsp").forward(req, resp);
            } else if (("2".equals(ope))) {
                UsuarioDAO.statusUsuario(cpf);
                resp.sendRedirect(req.getContextPath() + "/protegido/usuario/ListarUsuarioServlet?ope=0");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CadastroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }*/
    }
}
