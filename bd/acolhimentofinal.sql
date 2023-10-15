-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/10/2023 às 04:23
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `acolhimentofinal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acolhida`
--

CREATE TABLE `acolhida` (
  `idMulher` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `funcionario_idfuncionario` int(11) NOT NULL,
  `Mulher_idMulher` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idatendimento` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `observacoes` varchar(45) NOT NULL,
  `funcionario_idfuncionario` int(11) NOT NULL,
  `Mulher_idMulher` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `encaminhamento`
--

CREATE TABLE `encaminhamento` (
  `idencaminhamento` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `observacoes` varchar(45) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `atendimento_idatendimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `perfil_idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `perfil_idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mulher`
--

CREATE TABLE `mulher` (
  `idMulher` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `motivo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`idperfil`, `nome`) VALUES
(1, 'administrador'),
(2, 'assistente social');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acolhida`
--
ALTER TABLE `acolhida`
  ADD PRIMARY KEY (`idMulher`,`funcionario_idfuncionario`,`Mulher_idMulher`),
  ADD KEY `fk_Acolhida_funcionario1_idx` (`funcionario_idfuncionario`),
  ADD KEY `fk_Acolhida_Mulher1_idx` (`Mulher_idMulher`);

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idatendimento`,`funcionario_idfuncionario`,`Mulher_idMulher`),
  ADD KEY `fk_atendimento_funcionario1_idx` (`funcionario_idfuncionario`),
  ADD KEY `fk_atendimento_Mulher1_idx` (`Mulher_idMulher`);

--
-- Índices de tabela `encaminhamento`
--
ALTER TABLE `encaminhamento`
  ADD PRIMARY KEY (`idencaminhamento`,`atendimento_idatendimento`),
  ADD KEY `fk_encaminhamento_atendimento1_idx` (`atendimento_idatendimento`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idfuncionario`,`perfil_idperfil`),
  ADD KEY `fk_funcionario_perfil1_idx` (`perfil_idperfil`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idlogin`,`perfil_idperfil`),
  ADD KEY `fk_login_perfil1_idx` (`perfil_idperfil`);

--
-- Índices de tabela `mulher`
--
ALTER TABLE `mulher`
  ADD PRIMARY KEY (`idMulher`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acolhida`
--
ALTER TABLE `acolhida`
  MODIFY `idMulher` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idatendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `encaminhamento`
--
ALTER TABLE `encaminhamento`
  MODIFY `idencaminhamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idfuncionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `idlogin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mulher`
--
ALTER TABLE `mulher`
  MODIFY `idMulher` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `acolhida`
--
ALTER TABLE `acolhida`
  ADD CONSTRAINT `fk_Acolhida_Mulher1` FOREIGN KEY (`Mulher_idMulher`) REFERENCES `mulher` (`idMulher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Acolhida_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_atendimento_Mulher1` FOREIGN KEY (`Mulher_idMulher`) REFERENCES `acolhida` (`idMulher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atendimento_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `encaminhamento`
--
ALTER TABLE `encaminhamento`
  ADD CONSTRAINT `fk_encaminhamento_atendimento1` FOREIGN KEY (`atendimento_idatendimento`) REFERENCES `atendimento` (`idatendimento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_perfil1` FOREIGN KEY (`perfil_idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_perfil1` FOREIGN KEY (`perfil_idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
