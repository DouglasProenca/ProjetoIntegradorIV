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
}
