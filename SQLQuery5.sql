select venda_01.idcliente, venda_01.idvenda, cliente_01.nome, venda_01.valortotal from venda_01
inner join cliente_01 
on cliente_01.idcliente = venda_01.idcliente