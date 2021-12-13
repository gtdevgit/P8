-- ingredients des recettes
select recette.nom,  produit.nom, recette_produit.quantite
from recette_produit 
inner join recette on recette_produit.recette_id = recette.id
inner join produit on recette_produit.produit_id = produit.id
order by recette.nom, produit.nom;

-- Liste des employés et de leur rôle par point de vente
select point_de_vente.nom, employe.nom, role.libelle
from employe
left join point_de_vente on employe.point_de_vente_id = point_de_vente.id
inner join role on employe.role_id = role.id
order by point_de_vente.nom, employe.nom;

-- liste des clients avec leur type et leur point de vente
SELECT point_de_vente.id, point_de_vente.nom, client_type.id, client_type.libelle, client.id, client.nom, client.telephone, client.adresse, client.password 
FROM public.client
inner join point_de_vente on client.point_de_vente_id = point_de_vente.id
inner join client_type on client.client_type_id=client_type.id
order by point_de_vente.id, client_type.id;

-- liste des paniers avec détail des pizza et des produits avec les quantite
SELECT point_de_vente.id, point_de_vente.nom, 
client_type.id, client_type.libelle, 
client.id, client.nom, client.telephone, client.adresse, client.password,
panier.id,
panier_pizza.pizza_id, panier_pizza.quantite,
pizza.nom,
panier_produit.produit_id, panier_produit.quantite,
produit.nom
FROM public.client
inner join point_de_vente on client.point_de_vente_id = point_de_vente.id
inner join client_type on client.client_type_id=client_type.id
left join panier on client.id = panier.client_id
left join panier_pizza on panier.id = panier_pizza.panier_id
left join pizza on panier_pizza.pizza_id = pizza.id
left join panier_produit on panier.id = panier_produit.produit_id
left join produit on panier_produit.produit_id = produit.id
order by point_de_vente.id, client_type.id, client.id;

-- Détail des paniers pizzas, produits et quantite
select panier.id, pizza.nom as nom, panier_pizza.quantite as quantite
from panier 
inner join panier_pizza on panier.id = panier_pizza.panier_id
left join pizza on panier_pizza.pizza_id = pizza.id
union 
select panier.id, produit.nom as nom, panier_produit.quantite as quantite
from panier 
inner join panier_produit on panier.id = panier_produit.panier_id
left join produit on panier_produit.produit_id = produit.id
order by id;

-- Etat du stock par point de vente
SELECT produit.nom, point_de_vente.nom, quantite, unite.symbole
FROM public.produit_point_de_vente
inner join produit on produit.id = produit_point_de_vente.produit_id
inner join unite on unite.id = produit.unite_id
inner join point_de_vente on point_de_vente.id = produit_point_de_vente.point_de_vente_id
order by produit.nom, point_de_vente.nom;

-- Etat des commandes
SELECT commande.id, point_de_vente.nom as point, client.nom as client, statut_commande.libelle as statut, mt_ttc 
FROM public.commande
inner join statut_commande on statut_commande.id = statut_commande_id
inner join panier on panier.id = commande.panier_id
inner join client on client.id = panier.client_id
inner join point_de_vente on point_de_vente.id = client.point_de_vente_id;
	




