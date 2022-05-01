package br.senac.conexaobd.entidades;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Douglas
 */
@Getter
@Setter
public class EnderecoCliente extends Cliente {

    private String CEP;
    private String rua;
    private String bairro;
    private String cidade;
    private String uf;
    private String complemento;
    private int numero;

    public EnderecoCliente() {

    }

}
