package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Usuario;
import br.senac.uteis.CryptoUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Douglas
 */
public class UsuarioDAO {

    public static Usuario getUsuario(String login) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.abrirConexao();
        Usuario usuario = null;
        String query = "select u.id\n"
                + "       ,u.nome\n"
                + "       ,u.telefone\n"
                + "       ,u.nascimento\n"
                + "       ,u.email\n"
                + "       ,c.categoria\n"
                + "       ,u.cpf\n"
                + "       ,u.senha\n"
                + "       ,u.ativo\n"
                + "from usuario u\n"
                + "inner join categoria c\n"
                + "on c.id = u.id_categoria\n"
                + "where u.email = ?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            usuario = new Usuario();
            usuario.setId(rs.getInt("id"));
            usuario.setNome(rs.getString("nome"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setCategoria(rs.getString("categoria"));
            usuario.setAtivo(rs.getInt("ativo"));
        }
        return usuario;
    }

    public static void inserirUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        String query = "insert into usuario values (null,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setString(1, usuario.getNome());
        ps.setString(2, usuario.getTelefone());
        ps.setString(3, usuario.getEmail());
        ps.setDate(4, new java.sql.Date(usuario.getNascimento().getTime()));
        if (usuario.getCategoria().equals("administrador")) {
            ps.setInt(5, 1);
        } else {
            ps.setInt(5, 2);
        }
        ps.setString(6, usuario.getCpf());
        ps.setString(7, CryptoUtils.gerarhashSenha(usuario.getSenha()));
        ps.setInt(8, 1);

        ps.execute();
    }
    
    public static boolean atualizarUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update rc_aluno set nome=?,email=?,celular=?,tel_residencial=?"
                + "where cpf=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
           /* ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getEmail());
            ps.setString(3, cliente.getCelular());
            ps.setString(4, cliente.getTelResidencial());
            ps.setString(5, cliente.getCPF());*/
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
}
