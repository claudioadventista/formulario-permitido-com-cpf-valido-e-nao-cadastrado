-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jan-2022 às 17:48
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `inner_join_mysqli_tres_tabelas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aparelho`
--

CREATE TABLE `aparelho` (
  `id` int(11) NOT NULL,
  `nome_aparelho` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aparelho`
--

INSERT INTO `aparelho` (`id`, `nome_aparelho`) VALUES
(1, 'TV TUBO'),
(2, 'TV LED'),
(3, 'FORNO MICROONDAS'),
(4, 'RADIO'),
(5, 'CELULAR'),
(6, 'IMPRESSORA'),
(7, 'CPU'),
(8, 'NOTEBOOK'),
(9, 'MICROSYSTEM'),
(10, 'RADIO GRAVADOR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id` int(11) NOT NULL,
  `ordem_servico` varchar(5) NOT NULL,
  `id_cliente` varchar(5) NOT NULL,
  `id_aparelho` varchar(5) NOT NULL,
  `id_marca` varchar(5) NOT NULL,
  `id_modelo` varchar(5) NOT NULL,
  `id_estado` varchar(5) NOT NULL,
  `defeitoReclamado` varchar(200) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataPronto` date NOT NULL,
  `dataSaida` date NOT NULL,
  `orcamento` float NOT NULL,
  `material` varchar(254) NOT NULL,
  `acessorio` varchar(200) NOT NULL,
  `obs` varchar(254) NOT NULL,
  `foto` varchar(40) NOT NULL,
  `barra` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cadastro`
--

INSERT INTO `cadastro` (`id`, `ordem_servico`, `id_cliente`, `id_aparelho`, `id_marca`, `id_modelo`, `id_estado`, `defeitoReclamado`, `dataEntrada`, `dataPronto`, `dataSaida`, `orcamento`, `material`, `acessorio`, `obs`, `foto`, `barra`) VALUES
(1, '22', '1', '2', '2', '3', '2', 'sem funcionar', '2021-08-09', '0000-00-00', '0000-00-00', 0, 'fuzivel', 'com suporte', '', '', '234444444'),
(2, '88', '3', '5', '1', '1', '5', 'sem imagem', '2021-08-09', '2021-08-09', '2021-08-09', 100, 'tela', 'com remoto', 'nenhuma', 'asd123', '23234343'),
(3, '555', '34', '5', '1', '', '8', '', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', '', '', '', '7343180596'),
(4, '333', '35', '7', '1', '', '8', '', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', '', '', '', '1312762878'),
(5, '234', '36', '5', '5', '', '6', '', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', '', '', '', '1547446180');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `telefone2` varchar(15) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `dataNascimento` date NOT NULL,
  `dataCadastro` date NOT NULL,
  `foto` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `barra` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `endereco`, `telefone`, `telefone2`, `cpf`, `dataNascimento`, `dataCadastro`, `foto`, `email`, `barra`) VALUES
(1, 'MARIA DE FÁTIMA DA SILVA', 'RUA DA PRAIA 123', '(81)99876-7655', '', '58843919350', '1980-09-06', '2000-10-05', '', 'maria@bol.com', '1234567890'),
(2, 'amanda da silva', 'rua do principe 333', '(81)99876-7333', '', '58843917865', '2000-06-07', '0000-00-00', '', 'amanda@hotmail.com', '3452345566'),
(3, 'ariel da silva', 'avenida sao sebastiao', '(81)99876-7655', '', '58843919351', '0000-00-00', '2000-10-05', '', 'ariel@bol.com', '3423123452'),
(4, 'zilda alves de lima', 'rua nova 345', '(81)99876-7345', '', '34566919350', '0000-00-00', '0000-00-00', '', 'zilda@bol.com', ''),
(36, 'mariana da gloria', '', '(57)88489-4949', '', '12345678909', '0000-00-00', '0000-00-00', '', '', '4972165319');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nome_estado` varchar(50) NOT NULL,
  `sigla_estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `nome_estado`, `sigla_estado`) VALUES
(1, 'PARA ORÇAMENTO', 'PO'),
(2, 'SERVIÇO PRONTO', 'SP'),
(3, 'APARELHO SAIU', 'AS'),
(4, 'RETORNOU', 'RT'),
(5, 'DEVOLVEU', 'DV'),
(6, 'COMPROU', 'CO'),
(7, 'DOOU', 'DO'),
(8, 'AGUARDANDO', 'AG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nome_marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`id`, `nome_marca`) VALUES
(1, 'CCE'),
(2, 'SANYO'),
(3, 'SONY'),
(4, 'TOSHIBA'),
(5, 'GRADIENTE');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aparelho`
--
ALTER TABLE `aparelho`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aparelho`
--
ALTER TABLE `aparelho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
