USE [IndustriaWesley]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[Numero] [int] NOT NULL,
	[Setor] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito](
	[Numero] [int] NOT NULL,
	[Endereco] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[Numero] [int] NOT NULL,
	[Endereco] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[Numero] [int] NOT NULL,
	[Salario] [decimal](10, 2) NULL,
	[Telefone] [varchar](20) NULL,
	[DepartamentoNumero] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peca]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peca](
	[Numero] [int] NOT NULL,
	[Peso] [decimal](10, 2) NULL,
	[idDeposito] [int] NULL,
	[Cor] [varchar](50) NULL,
 CONSTRAINT [PK__Peca__7E532BC7A3D659B1] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PecaFornecedor]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PecaFornecedor](
	[PecaNumero] [int] NOT NULL,
	[FornecedorNumero] [int] NOT NULL,
	[Preco] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PecaNumero] ASC,
	[FornecedorNumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projeto]    Script Date: 04/04/2024 21:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projeto](
	[Numero] [int] NOT NULL,
	[Orcamento] [decimal](15, 2) NULL,
	[DataInicio] [date] NULL,
	[idFuncionario] [int] NULL,
	[idPeca] [int] NULL,
	[idFonecedor] [int] NULL,
	[HorasTrabalhadas] [int] NULL,
 CONSTRAINT [PK__Projeto__7E532BC71160CB89] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD FOREIGN KEY([DepartamentoNumero])
REFERENCES [dbo].[Departamento] ([Numero])
GO
ALTER TABLE [dbo].[Peca]  WITH CHECK ADD  CONSTRAINT [FK_Peca_Deposito] FOREIGN KEY([idDeposito])
REFERENCES [dbo].[Deposito] ([Numero])
GO
ALTER TABLE [dbo].[Peca] CHECK CONSTRAINT [FK_Peca_Deposito]
GO
ALTER TABLE [dbo].[PecaFornecedor]  WITH CHECK ADD FOREIGN KEY([FornecedorNumero])
REFERENCES [dbo].[Fornecedor] ([Numero])
GO
ALTER TABLE [dbo].[PecaFornecedor]  WITH CHECK ADD  CONSTRAINT [FK__PecaForne__PecaN__37A5467C] FOREIGN KEY([PecaNumero])
REFERENCES [dbo].[Peca] ([Numero])
GO
ALTER TABLE [dbo].[PecaFornecedor] CHECK CONSTRAINT [FK__PecaForne__PecaN__37A5467C]
GO
ALTER TABLE [dbo].[Projeto]  WITH CHECK ADD  CONSTRAINT [FK_Projeto_Fornecedor] FOREIGN KEY([idFonecedor])
REFERENCES [dbo].[Fornecedor] ([Numero])
GO
ALTER TABLE [dbo].[Projeto] CHECK CONSTRAINT [FK_Projeto_Fornecedor]
GO
ALTER TABLE [dbo].[Projeto]  WITH CHECK ADD  CONSTRAINT [FK_Projeto_Funcionario] FOREIGN KEY([idFuncionario])
REFERENCES [dbo].[Funcionario] ([Numero])
GO
ALTER TABLE [dbo].[Projeto] CHECK CONSTRAINT [FK_Projeto_Funcionario]
GO
ALTER TABLE [dbo].[Projeto]  WITH CHECK ADD  CONSTRAINT [FK_Projeto_Peca] FOREIGN KEY([idPeca])
REFERENCES [dbo].[Peca] ([Numero])
GO
ALTER TABLE [dbo].[Projeto] CHECK CONSTRAINT [FK_Projeto_Peca]
GO




***teste***
