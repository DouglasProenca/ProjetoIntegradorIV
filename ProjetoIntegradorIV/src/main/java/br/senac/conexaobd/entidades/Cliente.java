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
public class Cliente {

    private int id;
    private String nome;
    private String email;
    private Date nascimento;
    private String genero;
    private String cpf;
    private String senha;
}
