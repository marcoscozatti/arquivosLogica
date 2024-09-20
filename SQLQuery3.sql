use bdTemp
go

select v.idVenda, v.idCliente, c.nome, v.valortotal
from venda as v
inner join cliente as c
  on c.idCliente = v.idCliente

  select * from venda



