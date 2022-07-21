select par.data_vencimento,
substr(rpad(p.nome, 8, 'X'), 2, 10) || ' EMPRESA - SA',
td.sigla,
cast(par.valor_parcela as numeric(15,2)) valor,
cast(b.valor_parcela as numeric(15,2)) valor_pago


from pessoa p
join contribuinte c on c.id_pessoa = p.id_pessoa
join cmmempresa e on e.id_empresa = c.id_contribuinte
join armlancto_debito d on d.id_cadastro = e.id_empresa and d.tipo_cadastro = 2
join armtipo_debito td on td.id_tipo_debito = d.id_tipo_debito
join armlancto_debito_parcela par on par.id_lancto = d.id_lancto
left join armbaixa_debito b on b.id_lancto = par.id_lancto and b.parcela = par.parcela
left join armtipo_baixa tb on tb.id_tipo_baixa = b.id_tipo_baixa

where d.exercicio = 2021