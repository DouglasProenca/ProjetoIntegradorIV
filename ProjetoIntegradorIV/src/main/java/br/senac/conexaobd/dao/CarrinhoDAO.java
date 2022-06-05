package br.senac.conexaobd.dao;

import br.senac.conexaobd.Conexao;
import br.senac.conexaobd.entidades.Lista;
import br.senac.conexaobd.entidades.Pedido;
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

    public static void inserirPedido(int idCliente, double frete, double total, String forma_pagamento)
            throws SQLException, ClassNotFoundException {
        String query = "insert into pedido values(null,?,?,?,?,?,(select date(now())),?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setInt(1, idCliente);
        ps.setInt(2, 1);
        ps.setString(3, forma_pagamento);
        ps.setDouble(4, frete);
        ps.setDouble(5, total);
        ps.setString(6, "Aguardando Envio");
        ps.execute();
    }

    public static void inserirCarrinho(int id_produto, int quantidade, double valor)
            throws SQLException, ClassNotFoundException {
        String query = "insert into lista values((select max(id) from pedido),?,?,?)";
        Connection con = Conexao.abrirConexao();
        PreparedStatement ps;
        ps = con.prepareStatement(query);
        ps.setInt(1, id_produto);
        ps.setInt(2, quantidade);
        ps.setDouble(3, valor);
        ps.execute();
    }

    public static List<Pedido> getPedido(int id) throws ClassNotFoundException, SQLException {

        List<Pedido> pedidos = new ArrayList<>();
        String query = "select * from pedido where id_cliente = ?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pedido endereco = new Pedido();
                endereco.setId_cliente(rs.getInt("id_cliente"));
                endereco.setStatus(rs.getString("status"));
                endereco.setData(rs.getDate("data"));
                endereco.setValor(rs.getDouble("valor"));
                endereco.setId(rs.getInt("id"));
                pedidos.add(endereco);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return pedidos;
    }

    public static List<Lista> getPedidoDetalhe(int id) throws ClassNotFoundException, SQLException {

        List<Lista> pedidos = new ArrayList<>();
        String query = "select l.id_pedido\n"
                + "	 , l.quantidade\n"
                + "     , p.nome\n"
                + "     , l.valor\n"
                + "     , ped.forma_pagamento\n"
                + "     , ped.frete\n"
                + "from lista l\n"
                + "inner join produto p\n"
                + "	on p.código = l.id_produto\n"
                + "inner join pedido ped\n"
                + "    on ped.id = l.id_pedido\n"
                + "where l.id_pedido = ?";
        Connection con = Conexao.abrirConexao();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lista endereco = new Lista();
                endereco.setId_pedido(rs.getInt("id_pedido"));
                endereco.setQuantidade(rs.getInt("quantidade"));
                endereco.setNome(rs.getString("nome"));
                endereco.setValor(rs.getDouble("valor"));
                endereco.setForma_pagamento(rs.getString("forma_pagamento"));
                endereco.setFrete(rs.getInt("frete"));
                pedidos.add(endereco);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return pedidos;
    }
}
