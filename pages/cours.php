<header>
    <h1 class="titre-paragraphe">cours</h1>
</header>
<style>
    .tableaucours {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: rgba(52, 152, 219, 0.5); 
        color: white; 
    }

    .tableaucours th, .tableaucours td {
        border: 1px solid #fff; 
        padding: 8px;
        text-align: left;
    }

    .tableaucours th {
        background-color: rgba(41, 128, 185, 0.7); 
    }
</style>

<div id="filtr">
    <label for="instrument">Filtrer par instrument:</label>
    <select id="instrument">
        <option value="piano">Piano</option>
        <option value="guitar">Guitare</option>
       
    </select>

    <label for="age">Filtrer par âge:</label>
    <select id="age">
        <option value="enfant">Enfant</option>
        <option value="adolescent">Adolescent</option>
        <option value="adulte">Adulte</option>
    </select>
</div>

<div id="lipsum">
    <p>
        Voici la liste des cours :
    </p>
</div>

<?php

$SQL = "SELECT cours.libelleCours, cours_types.libelle as 'typesdecours',cours_niveaux.libelle as 'niveaudecours', ecole_enseignants.nom, instruments_types.photo, cours_types_tarifs.montant
FROM cours
JOIN cours_types ON cours_types.id = cours.idTypeCours
JOIN ecole_enseignants ON ecole_enseignants.id = cours.idEnseignant
JOIN cours_types_tarifs ON cours_types.id = cours_types_tarifs.idTypeCours
JOIN cours_niveaux ON cours.idNiveauCours = cours_niveaux.id AND cours_types_tarifs.idNiveauCours = cours_niveaux.id
JOIN instruments_types ON cours.idInstrument = instruments_types.id;";

$stmt = $connexion->prepare($SQL); 
$stmt->execute(); 
$lescours = $stmt->fetchAll(PDO::FETCH_ASSOC); 
$stmt->closeCursor(); 

echo "<table class='tableaucours'>";
echo "<tr><th>type de cour</th><th>montant</th></tr>";
foreach ($lescours as $cours) {
    echo "<tr>";
    echo "<td>" . $cours["libelleCours"] . "</td>";
    echo "<td>" . $cours["montant"] . "</td>";
    echo "</tr>";
}
echo "</table>";

?>

 