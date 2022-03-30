package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Douglas
 */
public class ProdutoDAO {

    public static List<Produto> getAllProdutos(int ope) throws ClassNotFoundException, SQLException {

        List<Produto> produtos = new ArrayList<>();
        String query = "call sp_getProdutos(?)";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ope);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setCodigo(rs.getInt("codigo"));
                produto.setNome(rs.getString("nome"));
                produto.setQuantidade(rs.getInt("quantidade"));
                produto.setAvaliacao(rs.getFloat("avaliacao"));
                produto.setValor(rs.getDouble("valor"));
                produto.setAtivo(rs.getString("ativo"));
                produtos.add(produto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }

    public static boolean updateProduto(Produto produto) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "update produto set nome=?,quantidade=?,avaliacao=?,valor=?"
                + " where código=?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, produto.getNome());
            ps.setInt(2, produto.getQuantidade());
            ps.setFloat(3, produto.getAvaliacao());
            ps.setFloat(4, produto.getAvaliacao());
            ps.setInt(5, produto.getCodigo());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static void inserirProduto(Produto produto) throws SQLException, ClassNotFoundException {
        String query = "insert into produto values (null,?,?,?,?,?,?,?,?)";
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

    public static Produto getProdutoPorCodigo(int codigo) throws ClassNotFoundException, SQLException {
        Produto produto = null;
        String query = "select p.código\n"
                + "       ,p.nome\n"
                + "       ,p.quantidade\n"
                + "       ,p.avaliacao\n"
                + "       ,p.valor\n"
                + "       ,p.descricao\n"
                + "       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo\n"
                + "from produto p\n"
                + "where código = ?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codigo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                produto = new Produto();
                produto.setCodigo(rs.getInt("código"));
                produto.setNome(rs.getString("nome"));
                produto.setQuantidade(rs.getInt("quantidade"));
                produto.setAvaliacao(rs.getFloat("avaliacao"));
                produto.setValor(rs.getDouble("valor"));
                produto.setAtivo(rs.getString("ativo"));
                produto.setDescricao(rs.getString("descricao"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produto;
    }

    public static List<Produto> buscarProduto(String nomeParam) throws ClassNotFoundException, SQLException {
        nomeParam = nomeParam.toUpperCase();
        List<Produto> Produtos = new ArrayList<>();
        String query = "select p.código\n"
                + "       ,p.nome\n"
                + "       ,p.quantidade\n"
                + "       ,p.avaliacao\n"
                + "       ,p.valor\n"
                + "       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo\n"
                + "from produto p\n"
                + "where p.nome like ?";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nomeParam + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setCodigo(rs.getInt("código"));
                produto.setNome(rs.getString("nome"));
                produto.setQuantidade(rs.getInt("quantidade"));
                produto.setAvaliacao(rs.getFloat("avaliacao"));
                produto.setValor(rs.getDouble("valor"));
                produto.setAtivo(rs.getString("ativo"));
                Produtos.add(produto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Produtos;
    }

    public static boolean statusProduto(int codigo) throws ClassNotFoundException, SQLException {
        boolean ok = true;
        String query = "call sp_altStatusProduto(?)";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codigo);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
}
