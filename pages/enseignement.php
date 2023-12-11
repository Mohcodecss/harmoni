<header>
    <h1 class="titre-paragraphe">Page d'accueil enseignant</h1>
</header>
 
<div id="lipsum">
    <p>
        Voici la liste des enseignants :
    </p>
 
</div>
<style>
    /* css du tableau des enseignants */
    .tableauenseignants {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: rgba(52, 152, 219, 0.5);
        color: white; 
    }

    .tableauenseignants th, .tableauenseignants td {
        border: 1px solid #fff;
        padding: 8px;
        text-align: left;
    }

    .tableauenseignants th {
        background-color: #2980b9; 
    }

    .tableauenseignants img {
        max-width: 100px;
        height: auto;
    }
</style>

 
<?php
 
/*On écrit dans un premier temps la requête en langage SQL*/
 
$SQL = "SELECT ecole_enseignants.nom, ecole_enseignants.prenom, ecole_enseignants.photo,instruments_types.libelle FROM ecole_enseignants JOIN instruments_types ON ecole_enseignants.id = instruments_types.id;";
$stmt = $connexion->prepare($SQL);/*On prépare la requête*/
$stmt->execute();/*on éxecute la requête*/
$lesenseignants = $stmt->fetchAll(PDO::FETCH_ASSOC);/*permet d'établire un tableau associatif dans la variable lesCours de la requête SQL*/
$stmt->closeCursor();/*fermeture du cursor pour éviter des erreures*/
 
/*var_dump($lesenseignants);*//*Permet de voir le tableau, si la requête fonctionne bien*/
echo "<table class='tableauenseignants'>";
echo "<tr><th>Nom</th><th>Prénom</th><th>Instrument</th><th>Photo</th></tr>";
foreach ($lesenseignants as $instruments) {
    echo "<tr>";
    echo "<td>" . $instruments["nom"] . "</td>";
    echo "<td>" . $instruments["prenom"] . "</td>";
    echo "<td>" . $instruments["libelle"] . "</td>";
    echo "<td><img src='/messahli-AP-S1-M4-squelette-site/template-css/enseignants/" . $instruments["photo"] . "'alt='photo du professeur' width='100px'></td>";
    echo "</tr>";
}
echo "</table>";
 
?>