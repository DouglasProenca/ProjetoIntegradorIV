package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Cliente;
import br.senac.conexaobd.entidades.EnderecoCliente;
import br.senac.uteis.CryptoUtils;
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
    
    public static void inserirCliente(Cliente cliente,EnderecoCliente enderecoCliente) throws SQLException, ClassNotFoundException {
        String query = "call sp_inserirCliente(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setString(1, cliente.getEmail());
        ps.setString(2, cliente.getNome());
        ps.setString(3, cliente.getCpf());
        ps.setDate(4, new java.sql.Date(cliente.getNascimento().getTime()));
        ps.setString(5, cliente.getGenero());
        ps.setString(6, CryptoUtils.gerarhashSenha(cliente.getSenha()));
        ps.setString(7, enderecoCliente.getCEP());
        ps.setString(8, enderecoCliente.getRua());
        ps.setInt(9, enderecoCliente.getNumero());
        ps.setString(10, enderecoCliente.getComplemento());
        ps.setString(11, enderecoCliente.getBairro());
        ps.setString(12, enderecoCliente.getCidade());
        ps.setString(13, enderecoCliente.getUf());

        ps.execute();
    }
    
    public static boolean updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update usuario set nome=?,telefone=?,nascimento=?,id_categoria=?,senha=?"
                + " where cpf=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getTelefone());
            ps.setDate(3, new java.sql.Date(usuario.getNascimento().getTime()));
            if (usuario.getCategoria().equals("administrador")) {
                ps.setInt(4, 1);
            } else {
                ps.setInt(4, 2);
            }
            ps.setString(5, usuario.getSenha());
            ps.setString(6, usuario.getCpf());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static Cliente getClientePorCPF(String cpf) throws ClassNotFoundException, SQLException {
        Usuario usuario = null;
        String query = "select u.id\n"
                + "       ,u.nome\n"
                + "       ,u.telefone\n"
                + "       ,u.nascimento\n"
                + "       ,u.email\n"
                + "       ,c.categoria\n"
                + "       ,u.cpf\n"
                + "       ,u.senha\n"
                + "       ,case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo\n"
                + "from usuario u\n"
                + "inner join categoria c\n"
                + "on c.id = u.id_categoria\n"
                + "where u.cpf = ?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNascimento(rs.getDate("nascimento"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCategoria(rs.getString("categoria"));
                usuario.setAtivo(rs.getString("ativo"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
    }
}
