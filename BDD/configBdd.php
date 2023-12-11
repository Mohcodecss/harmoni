<?php
/**
 * Fichier de configuration de la base de données
 */
    $_ENV["username"] = "harmonia-web"; // mettre à jour avec l'utilisateur de la base de données
    $_ENV["password"] = "p@ssw0rd"; // mettre à jour avec le mot de passe de l'utilisateur de la base de données
    $_ENV["dsn"] = "mysql:host=localhost;dbname=harmonia;port=3306"; // data source name à mettre à jour avec l'adresse du serveur (localhost), le nom de la base de données interrogée (nom_base_donnees) et eventuellement modifier le port du serveur BDD (3306)
    $_ENV["options"] = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'') // option pour le driver PDO : UTF8 pour gérer les accents
?>