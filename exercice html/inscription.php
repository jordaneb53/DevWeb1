<?php
// Connexion à la base de données
$host = 'localhost'; // Nom d'hôte
$dbname = 'interface_app'; // Nom de la base de données
$username = 'root'; // Nom d'utilisateur MySQL
$password = ''; // Mot de passe MySQL

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

// Traitement du formulaire d'inscription
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user = $_POST['username'] ?? '';
    $pass = $_POST['password'] ?? '';
    
    if (!empty($user) && !empty($pass)) {
        // Vérification si l'utilisateur existe déjà
        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username");
        $stmt->execute(['username' => $user]);

        if ($stmt->rowCount() > 0) {
            echo "<p>Nom d'utilisateur déjà pris. Veuillez en choisir un autre.</p>";
        } else {
            // Insertion de l'utilisateur dans la base de données
            $stmt = $pdo->prepare("INSERT INTO users (username, password) VALUES (:username, :password)");
            $hashedPassword = hash('sha256', $pass); // Hashage du mot de passe
            $stmt->execute(['username' => $user, 'password' => $hashedPassword]);
            echo "<p>Inscription réussie. Vous pouvez maintenant vous connecter.</p>";
        }
    } else {
        echo "<p>Veuillez remplir tous les champs.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }
        .register-form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .register-form h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .register-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .register-form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .register-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form class="register-form" method="POST">
        <h2>Inscription</h2>
        <input type="text" name="username" placeholder="Nom d'utilisateur" required>
        <input type="password" name="password" placeholder="Mot de passe" required>
        <button type="submit">S'inscrire</button>
        
    </form>
    <p>Vous avez deja un compte ? <a href="connexion.php">Connectez-vous ici</a></p>
</body>
</html>
