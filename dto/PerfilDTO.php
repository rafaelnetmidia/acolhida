<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of PerfilDTO
 *
 * @author Rafael Araujo!
 */
class PerfilDTO {
    
    private $idPerfil;
    private $nome;
    
    public function getIdPerfil() {
        return $this->idPerfil;
    }

    public function getNome() {
        return $this->nome;
    }

    public function setIdPerfil($idPerfil): void {
        $this->idPerfil = $idPerfil;
    }

    public function setNome($nome): void {
        $this->nome = $nome;
    }


}
