package br.senac.conexaobd.entidades;

import java.util.Date;

/**
 *
 * @author Douglas
 */
@lombok.Getter
@lombok.Setter
public class Pedido {

    private int id;
    private int id_cliente;
    private Date data;
    private double frete;
    private double valor;
    private String status;

    public Pedido(){
        
    }
}
