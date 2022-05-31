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
                + "	 , p.nome\n"
                + "     , p.descricao\n"
                + "     , p.valor\n"
                + "     , i.caminho\n"
                + "     , c.id_cliente\n"
                + "     , c.quantidade\n"
                + "from carrinho c \n"
                + "inner join produto p \n"
                + "on p.código = c.id_produto \n"
                + "inner join imagem i \n"
                + "on i.codigo_produto = p.código \n"
                + "where c.id_cliente = ? \n"
                + "group by p.nome";

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
                produto.setValor(rs.getDouble("valor"));
                produto.setCaminho(rs.getString("caminho"));
                Produtos.add(produto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Produtos;
    }
    
    public static Produto ProdutosCarrinhosemid(String id) throws ClassNotFoundException, SQLException {
        Produto produto = null;
        String query = "select p.código\n"
                + "                	 , p.nome\n"
                + "                     , p.descricao\n"
                + "                     , p.valor\n"
                + "                     , i.caminho\n"
                + "		        , p.quantidade\n"
                + "                 from produto p \n"
                + "                 inner join imagem i \n"
                + "                  on i.codigo_produto = p.código \n"
                + "                where p.código = ? \n"
                + "                group by p.nome";

        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                produto = new Produto();
                produto.setCodigo(rs.getInt("código"));
                produto.setNome(rs.getString("nome"));
                produto.setQuantidade(1);
                produto.setValor(rs.getDouble("valor"));
                produto.setCaminho(rs.getString("caminho"));
   
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produto;
    }

    public static boolean excluir(String id) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {

            conexao = Conexao.abrirConexao();

            instrucaoSQL = conexao.prepareStatement("DELETE FROM carRinho WHERE id_produto = ?");

            //Adiciono os parâmetros ao meu comando SQL
            instrucaoSQL.setString(1, id);

            //Mando executar a instrução SQL
            int linhasAfetadas = instrucaoSQL.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            } else {
                retorno = false;
            }

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
            retorno = false;
        } finally {

            //Libero os recursos da memória
            try {
                if (instrucaoSQL != null) {
                    instrucaoSQL.close();
                }
                conexao.close();

            } catch (SQLException ex) {
            }
        }

        return retorno;
    }
}
