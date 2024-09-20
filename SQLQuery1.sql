
use bdTemp
go

create table Cliente(
idCliente int identity primary key,
Nome varchar(50),
Telefone varchar(15)
)

create table Venda(
idVenda int identity primary key,
idCliente int, 
ValorTotal real 
CONSTRAINT FK_Venda FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
)

drop table venda

ALTER TABLE Venda
ADD CONSTRAINT FK_Venda
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);