package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Carrinho;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Douglas
 */
public class CarrinhoDAO {
    
    public static void inserirProduto(Carrinho carrinho) throws SQLException, ClassNotFoundException {
        String query = "insert into carrinho values (null,?,?,1,(select date(now())))";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setInt(1, carrinho.getId());
        ps.setInt(2, carrinho.getId_produto());

        ps.execute();
    }

    public static boolean updateProduto(Carrinho carrinho) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        /*String query = "update cliente set nome=?,nascimento=?,usuario=?,cpf=?,senha=?"
                + " where id=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setDate(2, new java.sql.Date(cliente.getNascimento().getTime()));
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getCpf());
            ps.setString(5, cliente.getSenha());
            ps.setInt(6, cliente.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }*/
        return ok;
    }
    
}
