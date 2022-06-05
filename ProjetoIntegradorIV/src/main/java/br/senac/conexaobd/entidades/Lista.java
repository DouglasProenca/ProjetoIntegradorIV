package br.senac.conexaobd.entidades;

/**
 *
 * @author Douglas
 */
@lombok.Getter
@lombok.Setter
public class Lista {

    private int id_pedido;
    private int quantidade;
    private String nome;
    private double valor;
    private String forma_pagamento;
    private int frete;

    public Lista() {

    }
}
