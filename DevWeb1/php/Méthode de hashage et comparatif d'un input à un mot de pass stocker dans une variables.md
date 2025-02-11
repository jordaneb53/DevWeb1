`// Activer les erreurs PHP pour le développement`

`ini_set('display_errors', 1);`

`ini_set('display_startup_errors', 1);`

`error_reporting(E_ALL);`

  

`// Vérifier la méthode POST`

`if ($_SERVER['REQUEST_METHOD'] === 'POST') {`

    `// Récupérer le mot de passe`

    `$password = $_POST['password'] ?? '';`

  

    `// Hachage du mot de passe attendu`

    `$expectedHash = password_hash('PAS QUATTRE', PASSWORD_DEFAULT);`

  

    `// Vérification du mot de passe`

    `if (password_verify($password, $expectedHash)) {`

        `// Retourner une réponse JSON pour mot de passe correct`

        `echo json_encode(['success' => true, 'message' => 'Mot de passe correct !']);`

    `} else {`

        `// Retourner une réponse JSON pour mot de passe incorrect`

        `echo json_encode(['success' => false, 'message' => 'Mot de passe incorrect.']);`

    `}`

    `exit;`

`}`

  

`// Si la méthode est incorrecte`

`http_response_code(405);`

`echo json_encode(['success' => false, 'message' => 'Méthode non autorisée']);`

`exit;`



méthode de récupération de hashage sur base de donné

// vérification du password hashé

  

<?php

header('Content-Type: application/json');

  

// Connexion à la base de données

$host = "localhost";

$username = "root";

$password = "";

$dbname = "hackathon";

  

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {

    die(json_encode(['success' => false, 'message' => 'Erreur de connexion à la base de données.']));

}

  

// Récupérer l'entrée utilisateur

$userInput = $_POST['password'] ?? '';

  

if (empty($userInput)) {

    echo json_encode(['success' => false, 'message' => 'Mot de passe requis.']);

    exit;

}

  

// Récupérer le hash depuis la base de données

$sql = "SELECT password FROM userpassword LIMIT 1";

$result = $conn->query($sql);

  

if ($result->num_rows > 0) {

    $row = $result->fetch_assoc();

    $hashedPassword = $row['password'];

  

    // Vérifier le mot de passe

    if (password_verify($userInput, $hashedPassword)) {

        echo json_encode(['success' => true, 'message' => '✅ Correct ! Bien joué.']);

    } else {

        echo json_encode(['success' => false, 'message' => '❌ Incorrect, essayez encore.']);

    }

} else {

    echo json_encode(['success' => false, 'message' => 'Mot de passe introuvable.']);

}

  

$conn->close();

?>