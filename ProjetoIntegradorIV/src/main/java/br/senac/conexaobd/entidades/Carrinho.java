package br.senac.conexaobd.entidades;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter
public class Carrinho extends Cliente {

    private int id_produto;
    private int quantidade;
    private Date data_carrinho;

    public Carrinho() {
        super();
    }
}
