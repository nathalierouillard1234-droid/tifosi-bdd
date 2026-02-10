-- =========================================
-- TESTS BASE DE DONNÉES TIFOSI
-- =========================================


-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom
FROM focaccia
ORDER BY nom ASC;



-- 2. Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients
FROM ingredient;



-- 3. Afficher le prix moyen des focaccias
SELECT AVG(prix) AS prix_moyen
FROM focaccia;



-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;



-- 5. Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom
FROM ingredient i
JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
WHERE f.nom = 'Raclaccia';



-- 6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia
SELECT f.nom, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.nom;



-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.nom
ORDER BY COUNT(fi.id_ingredient) DESC
LIMIT 1;



-- 8. Afficher la liste des focaccias qui contiennent de l'ail
SELECT DISTINCT f.nom
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE i.nom = 'Ail';



-- 9. Afficher la liste des ingrédients inutilisés
SELECT i.nom
FROM ingredient i
LEFT JOIN focaccia_ingredient fi
ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL;



-- 10. Afficher la liste des focaccias qui n'ont pas de champignons
SELECT f.nom
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT fi.id_focaccia
    FROM focaccia_ingredient fi
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
    WHERE i.nom = 'Champignon'
);
