package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        }
        return usuario;
    }
}
