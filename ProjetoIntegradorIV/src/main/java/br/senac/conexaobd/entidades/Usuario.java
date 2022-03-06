package br.senac.conexaobd.entidades;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
/**
 *
 * @author Douglas
 */
public class Usuario {

    private int id;
    private String nome;
    private String telefone;
    private String email;
    private Date nascimento;
    private String categoria;
    private String senha;
    private int ativo;
    private String cpf;

    public boolean isADM() {
        return "administrador".equalsIgnoreCase(this.getCategoria());
    }

    public boolean isEST() {
        return "estoquista".equalsIgnoreCase(this.getCategoria());
    }
    
    public boolean isAtivo() {
        return "1".equalsIgnoreCase(String.valueOf(this.getAtivo()));
    }

    public boolean isNotAtivo() {
        return "0".equalsIgnoreCase(String.valueOf(this.getAtivo()));
    }
}
