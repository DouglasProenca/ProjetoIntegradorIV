package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter

public class Produto {

    private int codigo;
    private String nome;
    private int quantidade;
    private float avaliacao;
    private double valor;
    private int ativo;

}
