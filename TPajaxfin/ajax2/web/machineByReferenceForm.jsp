<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Filtrage par Référence</title>
    <style>
        body {
            background-color: #e6f7ff; /* Bleu clair pour le fond */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #000080; /* Bleu foncé pour le titre */
            text-align: center;
        }
        .filter-form {
            text-align: center;
            margin: 20px auto;
            width: 50%;
            background-color: #ffffff; /* Fond blanc pour le formulaire */
            padding: 20px;
            border-radius: 5px; /* Coins arrondis */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Ombre légère */
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #000080; /* Bleu foncé pour les étiquettes */
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            background-color: #000080; /* Bleu foncé pour le bouton */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0000A0; /* Bleu plus foncé au survol */
        }
        h2 {
            color: #000080; /* Bleu foncé pour les titres de section */
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff; /* Fond blanc pour le tableau */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #000080; /* Bordures bleues */
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #000080; /* Bleu foncé pour l'en-tête du tableau */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Gris clair pour les lignes paires du tableau */
        }
    </style>
</head>
<body>
    <h1>Filtrage des Machines par Référence</h1>
    <form method="GET" action="MachineByReferenceController" class="filter-form">
        <label for="reference">Référence :</label>
        <input type="text" id="reference" name="reference">
        <input type="submit" value="Filtrer">
    </form>
    
    <!-- Affichez les machines filtrées -->
    <c:if test="${not empty filteredMachines}">
        <h2>Résultats du filtrage :</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Référence</th>
                <th>Prix</th>
                <th>Marque</th>
                <th>Date d'achat</th>
            </tr>
            <c:forEach items="${filteredMachines}" var="machine">
                <tr>
                    <td>${machine.id}</td>
                    <td>${machine.reference}</td>
                    <td>${machine.prix}</td>
                    <td>${machine.marque.libelle}</td>
                    <td>${machine.dateAchat}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</body>
</html>
