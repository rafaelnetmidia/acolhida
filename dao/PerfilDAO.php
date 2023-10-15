<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of PerfilDAO
 *
 * @author rafae
 */

require_once 'conexao/Conexao.php';
require_once 'IPerfil.php';

class PerfilDAO implements IPerfil{
    
    public function ListarPerfil() {
        $pdo = Conexao::conectar();
        $sql = "SELECT * FROM PERFIL";
        
        $execucao = $pdo->prepare($sql);
        $execucao ->execute();

        return $execucao ->fetchAll(PDO::FETCH_ASSOC);
        
    }
}
