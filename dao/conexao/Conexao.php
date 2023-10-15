<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of Conexao
 *
 * @author rafae
 */
abstract class Conexao {
    
    public static function conectar(){
        
        try {
            $pdo = new PDO("mysql: host=localhost; dbname=acolhimentofinal", 'root', '');
            $pdo ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $pdo;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
}
