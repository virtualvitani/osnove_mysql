INSERT INTO grad (ime, zip) VALUES ('Zagreb', '10000');
INSERT INTO grad (ime, zip) VALUES ('Split', '21000');
INSERT INTO grad (ime, zip) VALUES ('Pula', '52000');

INSERT INTO poslovnice (ime, adresa, grad_id) VALUES ('Ivo Ivic', 'Ulica Grada Gospica 12', 1, 1);

INSERT INTO poslovnice (ime, adresa, poslovnica_id, grad_id) 
VALUES ('Ivo Ivic', 'Ulica Grada Gospica 12', 1, 1);

DELETE FROM poslovnice WHERE id = 2;
DELETE FROM poslovnice WHERE ime = 'Zagreb';

UPDATE poslovnice SET ime = 'Trgovina Split' , zip = '21000' WHERE id = 6;