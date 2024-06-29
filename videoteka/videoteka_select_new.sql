-- Dohvati kolicinu svih filmova na DVD-u

SELECT f.naslov, concat (m.tip, ' ', count(f.id)) AS 'Broj kopija'
FROM kopija k
JOIN filmovi f ON k.film_id = f.id
JOIN mediji m ON k.medij_id = k.id
WHERE f.id = 1 AND k.dostupan = 1
GROUP BY m.id;

-- Dohvati kolicinu filmova po svakom mediju za film ID=1

SELECT f.naslov, concat (m.tip, ' ', count(f.id)) AS 'Broj kopija'
FROM kopija k
JOIN filmovi f ON k.film_id = f.id
JOIN mediji m ON k.medij_id = k.id
WHERE f.id = 1 AND k.dostupan = 1
GROUP BY m.id

-- Dohvati kolicinu filmova
SELECT f.naslov, m.tip, COUNT(*) AS 'kolicina'
    FROM kopija k
    JOIN filmovi f ON k.film_id = f.id
    JOIN mediji m ON k.medij_id = m.id
    WHERE k.dostupan = 1
    GROUP BY f.naslov, m.tip;

-- Dohvati prosjecnu cijenu filmova s obzirom na ukupnu zalihu filmova, to ste zadnje predavanje rekli pokazat
SELECT f.naslov, COUNT(k.id) AS 'Broj kopija', ROUND(AVG(c.cijena * m.koeficijent), 2) AS prosjecna_cijena
JOIN filmovi f ON k.film_id = f.id
JOIN cjenik c ON c.id = f.cjenik_id
JOIN mediji m ON k.medij_id = m.id
WHERE k.dostupan = 1
GROUP BY f.id;

-- Izlistaj posudbe sa clan.ime i film_naziv
SELECT * FROM posudba p
JOIN clanovi c ON c.id = p.clan_id
JOIN posudba_kopija pk ON p.id = pk.posudba_id
JOIN kopija k ON pk.kopija_id = k.id
JOIN filmovi f ON k.film_id = f.id;