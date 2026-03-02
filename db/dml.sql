INSERT INTO pilotos (nome, pais, data_nascimento) VALUES
('Michael Schumacher', 'Alemanha', '1969-01-03'),
('Lewis Hamilton', 'Reino Unido', '1985-01-07'),
('Sebastian Vettel', 'Alemanha', '1987-07-03'),
('Max Verstappen', 'Países Baixos', '1997-09-30'),
('Ayrton Senna', 'Brasil', '1960-03-21');

INSERT INTO equipes (nome, pais) VALUES
('Ferrari', 'Itália'),
('Mercedes', 'Alemanha'),
('Red Bull Racing', 'Áustria'),
('McLaren', 'Reino Unido'),
('Williams', 'Reino Unido');

INSERT INTO temporadas (ano) VALUES
(1991),
(1994),
(2002),
(2019),
(2023);

INSERT INTO campeonatos (pilotos_id_piloto, equipes_id_equipe, temporadas_id_temporada)
SELECT p.id_piloto, e.id_equipe, t.id_temporada
FROM pilotos p
JOIN equipes e
JOIN temporadas t
WHERE p.nome = 'Ayrton Senna'
  AND e.nome = 'McLaren'
  AND t.ano = 1991

UNION ALL

SELECT p.id_piloto, e.id_equipe, t.id_temporada
FROM pilotos p
JOIN equipes e
JOIN temporadas t
WHERE p.nome = 'Ayrton Senna'
  AND e.nome = 'McLaren'
  AND t.ano = 1994

UNION ALL

SELECT p.id_piloto, e.id_equipe, t.id_temporada
FROM pilotos p
JOIN equipes e
JOIN temporadas t
WHERE p.nome = 'Michael Schumacher'
  AND e.nome = 'Ferrari'
  AND t.ano = 2002

UNION ALL

SELECT p.id_piloto, e.id_equipe, t.id_temporada
FROM pilotos p
JOIN equipes e
JOIN temporadas t
WHERE p.nome = 'Lewis Hamilton'
  AND e.nome = 'Mercedes'
  AND t.ano = 2019

UNION ALL

SELECT p.id_piloto, e.id_equipe, t.id_temporada
FROM pilotos p
JOIN equipes e
JOIN temporadas t
WHERE p.nome = 'Max Verstappen'
  AND e.nome = 'Red Bull Racing'
  AND t.ano = 2023;