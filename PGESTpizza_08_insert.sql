
DELETE FROM public.commande;
DELETE FROM public.statut_commande;
DELETE FROM public.panier_pizza;
DELETE FROM public.panier_produit;
DELETE FROM public.panier;
DELETE FROM public.client;
DELETE FROM public.client_type;
DELETE FROM public.recette_produit;
DELETE FROM public.recette;
DELETE FROM public.pizza;
DELETE FROM public.produit;
DELETE FROM public.tva;
DELETE FROM public.unite;
DELETE FROM public.employe;
DELETE FROM public.role;
DELETE FROM public.point_de_vente;
DELETE FROM public.version;

INSERT INTO public.version(numero) VALUES (1);

INSERT INTO public.point_de_vente(
	id, nom, addresse, telephone, email)
	VALUES (1, 'Tours Grammont', '31 Av. de Grammont 37000 Tours', '02.47.01.02.03', 'grammont.tours@ocpizza.com'), 
	    (2, 'Joué', '70, Bd Jean Jaurès 37300 Joué-lès-Tours', '02.47.01.02.04', 'jaurès.joue@ocpizza.com'),
	    (3, 'Blois', '50, Rue Michel Ange 41000 Blois', '02.54.01.02.04', 'ange.blois@ocpizza.com'),
	    (4, 'Au Petit Paris', '109 Av. du Maréchal Maunoury 41000 Blois', '02.54.01.02.04', 'paris.blois@ocpizza.com'),
	    (5, 'Pizza Bilange', '22 place de la Bilange 49400 Saumur', '02.41.01.02.04', 'bilange.saumur@ocpizza.com');	
INSERT INTO public.role(
	id, libelle)
	VALUES (1, 'LIVREUR'), (2, 'PIZZAIOLO'), (3, 'MANAGER'), (4, 'DIRIGEANT');
INSERT INTO public.client_type(
	id, libelle)
	VALUES (1, 'CLIENT_INTERNET'), (2, 'CLIENT_TELEPHONE'), (3, 'CLIENT_COMPTOIR');	
INSERT INTO public.statut_commande(
	id, libelle)
	VALUES (1, 'A_VERIFIER'), (2, 'IMPOSSIBLE'), (3, 'A_PREPARER'), (4, 'EN_PREPARATION'), (5, 'PREPARER'), (6, 'EN_ATTENTE_DE_LIVRAISON'), (7, 'EN_COURS_DE_LIVRAISON'), (8, 'ANNULEE'), (9, 'TERMINEE');		
INSERT INTO public.tva(
	id, libelle, taux)
	VALUES (1, 'Taux normal', 20), (2, 'Taux intermédiaire', 10), (3, 'Taux réduit', 5.5);
INSERT INTO public.unite(
	id, libelle, symbole)
	VALUES (1, 'Gramme', 'g'), (2, 'Kilogramme', 'Kg'), (3, 'Centilitre', 'cl'), (4, 'Décilitre', 'dl'), (5, 'Litre', 'l'), (6, 'Unité', 'U');

-- ingredients, sans prix
INSERT INTO public.produit(
	id, nom, description, unite_id, prix_vente, tva_id)
	VALUES 
	-- ingredients, sans prix
	(1, 'Farine', 'Ingrédient de base pour fabriquer la pâte à pizza', 2, NULL, NULL), 
	(2, 'Levure de boulanger', 'Ingrédient de base pour fabriquer la pâte à pizza', 1, NULL, NULL),
	(3, 'Sel', 'Ingrédient de base pour fabriquer la pâte à pizza', 2, NULL, NULL),
	(4, 'Huile d''olive', 'Ingrédient de base pour fabriquer la pâte à pizza', 5, NULL, NULL),
	(5, 'Sucre', NULL, 1, NULL, NULL),
	(6, 'Pâte à pizza', NULL, 1, NULL, NULL), 
	(7, 'Sauce tomate', NULL, 1, NULL, NULL),
	(8, 'Bouquet garni', 'Mélange thym, romarin et laurier', 1, NULL, NULL),
	(9, 'Origan', 'Origan en poudre', 1, NULL, NULL),
	(10, 'Poivre', 'Poivre en poudre', 1, NULL, NULL),
	(11, 'Mozzarella', 'Boule de mozzarella', 1, NULL, NULL),
	(12, 'Basilic', 'Feuille de Basilic', 1, NULL, NULL),
	(13, 'Crème fraiche', NULL, 1, NULL, NULL),
	(14, 'Jambon blanc', 'Jambon blanc en tranches', 1, NULL, NULL),
	(15, 'Roquette', 'Salade de roquette', 1, NULL, NULL),
	(16, 'Emmental râpé', 'Fromage râpé', 1, NULL, NULL),
	(17, 'Champignons de Paris', 'Champignons émincé', 1, NULL, NULL),
	(18, 'Olives noires', 'Olives noires dénoyautées', 1, NULL, NULL),
	(19, 'Olives verts', 'Olives vertes dénoyautées', 1, NULL, NULL),
	(20, 'Ail haché', 'Ail pré-haché prêt à utiliser', 1, NULL, NULL),
	(21, 'Piment de Cayenne', 'Piment en poudre', 1, NULL, NULL),
	(22, 'Jambon sec', 'Jambon sec en tranches', 1, NULL, NULL),
	(23, 'Chorizo', 'Chorizo tranché', 1, NULL, NULL),
	(24, 'Poivron', 'Poivron découpé', 1, NULL, NULL),
	(25, 'Tomate', 'Tomate découpé', 1, NULL, NULL),
	(26, 'Courgette', 'Courgette découpé', 1, NULL, NULL),
	(27, 'Oignon', 'Oignon découpé', 1, NULL, NULL),
	(28, 'Huile pimentée', 'Dosette 3ml', 6, NULL, NULL),
	-- produits à la vente, avec prix et tva
	(100, 'Lambrusco rosso', 'Vin rosé', 5, 7.00, 1), 
	(101, 'Chianti Romio', 'Vin rouge', 5, 8.50, 1),
	(102, 'Montepulciano d''Abruzzo', 'Vin rouge', 5, 9.50, 1),
	(103, 'Le grand clos 2019', 'Bourgueil, domaine Ménard. Vin rouge', 5, 11.90, 1),
	(104, 'Coca cola', '33cl', 5, 3.00, 1),
	(105, 'Bière', '33cl', 5, 4.50, 1),
	(200, 'Glace vanille', 'Petit pot 80g', 1, 3.00, 2),
	(201, 'Glace chocolat', 'Petit pot 80g', 1, 3.00, 2),
	(202, 'Glace caramel', 'Petit pot 80g', 1, 3.00, 2);	

-- stock point de vente 1 et 2
INSERT INTO public.produit_point_de_vente(
	produit_id, point_de_vente_id, quantite)
	VALUES (1, 1, 50), (2, 1, 500), (3, 1, 4), (4, 1, 7), (5, 1, 5000), (6, 1, 8000), (7, 1, 5000), (8, 1, 250), (9, 1, 300), (10, 1, 200), 
	(11, 1, 5000), (12, 1, 0), (13, 1, 2000), (14, 1, 4500), (15, 1, 500), (16, 1, 2500), (17, 1, 1400), (18, 1, 600), (19, 1, 800),
	(20, 1, 1100), (21, 1, 400), (22, 1, 3000), (23, 1, 3300), (24, 1, 1500), (25, 1, 1500), (26, 1, 0), (27, 1, 5000), (28, 1, 120),
	(100, 1, 10), (101, 1, 12), (102, 1, 5), (103, 1 , 6), (104, 1 , 20), (105, 1 , 25), (200, 1 , 15), (201, 1 , 11), (202, 1 , 14);

	UPDATE public.produit_point_de_vente
	SET point_de_vente_id=2;

INSERT INTO public.recette(
	id, nom, mode_preparatoire, photos)
	VALUES (1, 'Margherita', 'Etaler la pâte. Etaler la sauce tomate. Saupoudrer de dés de mozzarella. Enfourner 5 minutes. Garnir de feuille de basilic', NULL),
	(2, 'Régina', 'Etaler la pâte. Replier légèrement les bords. Etaler la sauce tomate. Ajouter les oignons. Ajoute de l’ail. Saupoudrer de fromage râpé. Ajouter des tranches de mozzarella. Ajouter le jambon. Ajouter les champignons. Ajouter les olives. Saupoudrer d’origan. Enfourner 5 minutes. Garnir de feuille de roquette.', NULL),
	(3, 'Végétarienne', 'Etaler la sauce tomate, Saupoudrer de dés de mozzarella, Ajouter le mélange de légumes cuisinés (aubergines et courgettes grillées, concassé de tomates et oignons), carpaccio de courgette, tomates cerise marinées, olives noires', NULL);;

INSERT INTO public.recette_produit(
	recette_id, produit_id, quantite)
	VALUES (1, 7, 50), (1, 11, 100), (1, 12, 10),
	(2, 7, 50), (2, 27, 50), (2, 20, 10), (2, 16, 50), (2, 11, 50), (2, 14, 50), (2, 17, 50), (2, 18, 10), (2, 9, 10), (2, 15, 10),
	(3, 7, 50), (3, 11, 50), (3, 24, 50), (3, 25, 50), (3, 27, 50), (3, 26, 25);

INSERT INTO public.pizza(
	id, nom, photos, description, prix_vente, tva_id, recette_id)
	VALUES (1, 'Margherita', NULL, 'Pizza napoletana garnie de tomates, de mozzarella, de basilic frais, de sel et d''huile d''olive', 10.00, 1, 1),
	(2, 'Régina', NULL, 'Un grand classique des pizzas', 12.00, 1, 2),
	(3, 'Végétarienne', NULL, 'Sauce tomate, mozzarella, mélange de légumes cuisinés', 12.50, 1, 3);

INSERT INTO public.employe(
	id, nom, role_id, prenom, email, password, point_de_vente_id)
	VALUES (1, 'Lola', 4, NULL, 'lola@ocpizza.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', NULL),
	(2, 'Franck', 4, NULL, 'franck@ocpizza.com', 'f8638b979b2f4f793ddb6dbd197e0ee25a7a6ea32b0ae22f5e3c5d119d839e75', NULL),
	
	(3, 'Habram', 1, NULL, 'habram@ocpizza.com', '80a2a51ee74edfff890258857d78e36e4fc0cf0ee9d568268b3def7f9b710415', 1),
	(4, 'Marion', 2, NULL, 'marion@ocpizza.com', '8bfeff79372bc0f7d9ffb1eead40fabe1b77f7e2b05380b023c9d4e8740ae457', 1),
	(5, 'Carol', 3, NULL, 'carol@ocpizza.com', 'f8bfa242663392ac09db21a24bad205e2a877fdb70803cc4fd09be3b040f5d36', 1),
	
	(6, 'Alexandre', 1, NULL, 'alexandre@ocpizza.com', 'fef59c07049d76b6281a928fc1bd94e19f21e1e323683d44e7ffe260320d9603', 2),
	(7, 'Luciano', 2, NULL, 'luciano@ocpizza.com', '0931f448c62aa67aea94ea1155b9b099fdf7641c2ab6f737c729e3ebcb8c33fc', 2),
	(8, 'Simon', 3, NULL, 'simon@ocpizza.com', '62b24c1e36bf69dae8dc435207e3cf6a3a88762a17bcd43096e75e588f1b4380', 2),

	(9, 'James', 1, NULL, 'james@ocpizza.com', 'fef59c07049d76b6281a928fc1bd94e19f21e1e323683d44e7ffe260320d9603', 3),
	(10, 'Thomas', 2, NULL, 'thomas@ocpizza.com', '0931f448c62aa67aea94ea1155b9b099fdf7641c2ab6f737c729e3ebcb8c33fc', 3),
	(11, 'Claire', 3, NULL, 'claire@ocpizza.com', '62b24c1e36bf69dae8dc435207e3cf6a3a88762a17bcd43096e75e588f1b4380', 3);

INSERT INTO public.client(
	id, email, password, nom, prenom, telephone, adresse, client_type_id, point_de_vente_id)
	VALUES (1, 'jean.dupont@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Dupont', 'Jean', '0647124578', '2 rue du Plat d''Etain 37000 Tours', 1, 1),
	(2, 'alain.bernard@gmail.com', 'f8638b979b2f4f793ddb6dbd197e0ee25a7a6ea32b0ae22f5e3c5d119d839e75', 'Bernard', 'Alain', '0621568757', '154 rue du Colonel Picot 37300 Joué-lès-Tours', 1, 2),
	(3, 'gabriel.thomas@orange.fr', '80a2a51ee74edfff890258857d78e36e4fc0cf0ee9d568268b3def7f9b710415', 'Gabriel', 'Thomas', '0621788754', '5 rue Forest 37300 Joué-lès-Tours', 1, 2),
	(4, 'leo.petit@hotmail.com', 'f8638b979b2f4f793ddb6dbd197e0ee25a7a6ea32b0ae22f5e3c5d119d839e75', 'Léo', 'Petit', '0254156875', '70 rue du Père Brottier 41000 Blois', 1, 3),
	(5, 'alice.robert@orange.fr', '80a2a51ee74edfff890258857d78e36e4fc0cf0ee9d568268b3def7f9b710415', 'Alice', 'Robert', '0687788765', '202 rue du Bourg Saint-Jean 41000 Blois', 1, 3),
	(6, NULL, NULL, 'Chloé', 'Richard', '0247558874', '5 rue de la Préfecture 37000 Tours', 2, 1),
	(7, NULL, NULL, 'Ethan', 'Durant', '0247558874', '8 bis rue de Luce 37000 Tours', 2, 1),
	(8, NULL, NULL, 'Claire', 'Dubois', '0247788874', '70 rue Ampère 37300 Joué-lès-Tours', 2, 2),
	(9, NULL, NULL, 'Julia', 'Spears', '0247625184', '25 rue Augustin Thierry 41000 Blois', 2, 3),
	(10, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
	(11, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
	(12, NULL, NULL, NULL, NULL, NULL, NULL, 3, 2),
	(13, NULL, NULL, NULL, NULL, NULL, NULL, 3, 2),
	(14, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3);
	
-- Ajout d'un panier sur tous les clients par telephone et au comptoire et sur certain clients internet
INSERT INTO public.panier(
	id, client_id, date_creation, total_ttc)
	VALUES (1, 1, NULL, NULL),
	(2, 2, NULL, NULL),
	(3, 5, NULL, NULL),
	(4, 6, NULL, NULL),
	(5, 7, NULL, NULL),
	(6, 8, NULL, NULL),
	(7, 9, NULL, NULL),
	(8, 10, NULL, NULL),
	(9, 11, NULL, NULL),
	(10, 12, NULL, NULL),
	(11, 13, NULL, NULL),
	(12, 14, NULL, NULL);	
	
INSERT INTO public.panier_pizza(
	panier_id, pizza_id, quantite)
	VALUES (1, 1, 2), (1, 2, 5),
		(2, 2, 2),
		(3, 2, 1),
		(4, 3, 4),
		(5, 3, 1), (5, 2, 1),
		(6, 1, 1),
		(7, 1, 1), (7, 2, 1), (7, 3, 1),
		(8, 1, 1), (8, 2, 1),
		(9, 1, 1),
		(10, 1, 1),
		(11, 1, 4), (11, 2, 3), (11, 3, 1),
		(12, 1, 1);	
	
INSERT INTO public.panier_produit(
	panier_id, produit_id, quantite)
	VALUES (1, 100, 1),
	(4, 101, 1),
	(8, 200, 1), (8, 202, 1),
	(9, 105, 4),
	(11, 102, 4),
	(7, 104, 2), (7, 201, 2);

INSERT INTO public.commande(
	id, panier_id, date_creation, payement_effectue, livraison_effectue, date_payement, livreur_id,
	statut_commande_id, livraison_domicile, payement_livraison, mt_ttc, mt_tva)
	VALUES (1, 1, current_timestamp, true, false, current_timestamp, NULL, 3, true, false, 111.00, 18.50),
	(2, 2, current_timestamp, true, false, current_timestamp, NULL, 3, true, false, 12.00, 1.09),
	(3, 3, current_timestamp, false, false, NULL, 9, 7, true, true, 12.00, 1.09),
	(4, 4, current_timestamp, false, false, NULL, NULL, 6, true, true, 58.50, 9.75),
	(5, 5, current_timestamp, false, false, NULL, 9, 7, true, true, 24.50, 2.23),
	(6, 6, current_timestamp, false, false, NULL, 6, 7, true, true, 12.00, 1.09),
	(7, 7, current_timestamp, false, false, NULL, NULL, 6, true, true, 46.50, 7.75),
	(8, 8, current_timestamp, true, false, current_timestamp, NULL, 3, false, false, 28.00, 4.67),
	(9, 9, current_timestamp, true, false, current_timestamp, NULL, 4, false, false, 28.00, 4.67),
	(10, 10, current_timestamp, true, false, current_timestamp, NULL, 4, false, false, 10.00, 0.91),
	(11, 11, current_timestamp, true, false, current_timestamp, NULL, 4, false, false, 126.50, 11.50),
	(12, 12, current_timestamp, true, false, current_timestamp, NULL, 4, false, false, 10.00, 0.91);


	
	
		
