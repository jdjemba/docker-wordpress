<?php
// Initialisation des variables de connexion
$servername = 'data';
$username = 'test';
$password = 'test';
$dbname = 'mydatabase';

// Créer la connexion avec MySQLi
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Créer la table si elle n'existe pas
$conn->query("CREATE TABLE IF NOT EXISTS users (
    some_name VARCHAR(100)
)");

// Requête d'insertion
$sql_insert = "INSERT INTO users (some_name) VALUES ('Test')";
if ($conn->query($sql_insert) === TRUE) {
    echo "Nouvel enregistrement inséré avec succès.<br>";
} else {
    echo "Erreur lors de l'insertion : " . $conn->error . "<br>";
}

// Sélectionner toutes les lignes de la table users
$sql_select = "SELECT * FROM users";
$result = $conn->query($sql_select);

if ($result->num_rows > 0) {
    // Afficher les lignes récupérées
    while ($row = $result->fetch_assoc()) {
        echo "New Name: " . $row["some_name"] . "<br>";
    }
} else {
    echo "Aucun résultat trouvé.<br>";
}

// Fermer la connexion
$conn->close();
?>

