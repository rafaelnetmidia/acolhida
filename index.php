<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        require_once './dao/PerfilDAO.php';
        
        $perfilDAO = new PerfilDAO();
        $listarTodosPerfis = $perfilDAO->ListarPerfil();
        
        foreach ($listarTodosPerfis as $perfil) {
            echo $perfil['idperfil'];
            echo ' - ';
            echo $perfil['nome'];
            echo '<br>';
        }
        ?>
    </body>
</html>