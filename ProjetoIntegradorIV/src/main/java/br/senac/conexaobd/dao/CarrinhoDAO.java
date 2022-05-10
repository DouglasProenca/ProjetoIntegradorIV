package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Carrinho;
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
    
    public static List<Produto> ProdutosCarrinho(String id) throws ClassNotFoundException, SQLException {
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
            ps.setString(1, id);
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
    
}
