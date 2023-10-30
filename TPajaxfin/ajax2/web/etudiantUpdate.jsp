<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mise à jour de l'Étudiant</title>
    <style>
        body {
            background-color: #3498db;
            font-family: Arial, sans-serif;
            color: #fff;
        }

        h1 {
            background-color: #2980b9;
            padding: 10px;
            text-align: center;
        }

        form {
            background-color: #3498db;
            padding: 20px;
            margin: 0 auto;
            width: 50%;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="date"],
        input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: none;
            background-color: #fff;
            color: #3498db;
            border-radius: 5px;
        }

        input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }

        input[type="submit"] {
            background-color: #2980b9;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Mise à jour de l'Étudiant</h1>
    <form method="POST" action="EtudiantController">
        <input type="hidden" name="op" value="update">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <label for="newNom">Nom:</label>
        <input type="text" id="newNom" name="newNom" value="">
        <label for="newPrenom">Prénom:</label>
        <input type="text" id="newPrenom" name="newPrenom" value="">
        <label for="newVille">Ville:</label>
        <input type="text" id="newVille" name="newVille" value="">
        <label for="newDateNaissance">Date de naissance:</label>
        <input type="date" id="newDateNaissance" name="newDateNaissance" value="">
        <label>Sexe:</label>
        <input type="radio" id="newSexeHomme" name="newSexe" value="homme">
        <label for="newSexeHomme">Homme</label>
        <input type="radio" id="newSexeFemme" name="newSexe" value="femme">
        <label for="newSexeFemme">Femme</label>
        <input type="submit" value="Mettre à jour">
    </form>
</body>
</html>
