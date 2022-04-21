package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Douglas
 */
public class ClienteDAO {

    public static Cliente getUsuario(String login) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.abrirConexao();
        Cliente cliente = null;
        String query = "select id\n"
                + "	  , usuario\n"
                + "      , nome\n"
                + "      , senha\n"
                + "from cliente \n"
                + "where usuario = ?";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, login);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cliente = new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setEmail(rs.getString("usuario"));
            cliente.setNome(rs.getString("nome"));
            cliente.setSenha(rs.getString("senha"));
        }
        return cliente;
    }
}
