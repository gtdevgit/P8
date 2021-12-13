CREATE TABLE public.employe (
    id SERIAL NOT NULL,
    nom text NOT NULL,
    role_id integer NOT NULL,
    prenom text,
    email text NOT NULL,
    password text NOT NULL,
    point_de_vente_id integer,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.employe
    (role_id);
CREATE INDEX ON public.employe
    (point_de_vente_id);


CREATE TABLE public.role (
    id SERIAL NOT NULL,
    libelle text NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.version (
    numero integer NOT NULL,
    PRIMARY KEY (numero)
);


CREATE TABLE public.point_de_vente (
    id SERIAL NOT NULL,
    nom text NOT NULL,
    addresse text,
    telephone text,
    email text,
    PRIMARY KEY (id)
);


CREATE TABLE public.produit (
    id SERIAL NOT NULL,
    nom text NOT NULL,
    photos text,
    description text,
    prix_vente MONEY,
    tva_id integer,
    unite_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.produit
    (tva_id);
CREATE INDEX ON public.produit
    (unite_id);


CREATE TABLE public.tva (
    id SERIAL NOT NULL,
    libelle text NOT NULL,
    taux numeric NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.pizza (
    id SERIAL NOT NULL,
    nom text NOT NULL,
    photos text,
    description text,
    prix_vente MONEY,
    tva_id integer,
    recette_id integer,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.pizza
    (tva_id);
CREATE INDEX ON public.pizza
    (recette_id);


CREATE TABLE public.recette (
    id SERIAL NOT NULL,
    nom text NOT NULL,
    mode_preparatoire text,
    photos text,
    PRIMARY KEY (id)
);


CREATE TABLE public.unite (
    id SERIAL NOT NULL,
    libelle text NOT NULL,
    symbole text NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.recette_produit (
    recette_id integer NOT NULL,
    produit_id integer NOT NULL,
    quantite numeric NOT NULL,
    PRIMARY KEY (recette_id, produit_id)
);


CREATE TABLE public.client (
    id SERIAL NOT NULL,
    email text,
    password text,
    nom text,
    prenom text,
    telephone text,
    adresse text,
    client_type_id integer NOT NULL,
    point_de_vente_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.client
    (client_type_id);
CREATE INDEX ON public.client
    (point_de_vente_id);


CREATE TABLE public.client_type (
    id SERIAL NOT NULL,
    libelle text NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.panier (
    id SERIAL NOT NULL,
    client_id integer NOT NULL,
    date_creation timestamp with time zone,
    total_ttc numeric,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.panier
    (client_id);


CREATE TABLE public.panier_pizza (
    panier_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantite integer NOT NULL,
    PRIMARY KEY (panier_id, pizza_id)
);


CREATE TABLE public.panier_produit (
    panier_id integer NOT NULL,
    produit_id integer NOT NULL,
    quantite integer NOT NULL,
    PRIMARY KEY (panier_id, produit_id)
);


CREATE TABLE public.statut_commande (
    id integer NOT NULL,
    libelle text NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.commande (
    id SERIAL NOT NULL,
    panier_id integer NOT NULL,
    date_creation timestamp with time zone,
    payement_effectue boolean NOT NULL,
    livraison_effectue boolean NOT NULL,
    date_payement timestamp with time zone,
    livreur_id integer,
    statut_commande_id integer NOT NULL,
    livraison_domicile boolean NOT NULL,
    payement_livraison boolean NOT NULL,
    mt_ttc numeric,
    mt_tva numeric,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.commande
    (panier_id);
CREATE INDEX ON public.commande
    (livreur_id);
CREATE INDEX ON public.commande
    (statut_commande_id);


CREATE TABLE public.produit_point_de_vente (
    produit_id integer NOT NULL,
    point_de_vente_id integer NOT NULL,
    quantite numeric NOT NULL,
    PRIMARY KEY (produit_id, point_de_vente_id)
);


ALTER TABLE public.employe ADD CONSTRAINT FK_employe__role_id FOREIGN KEY (role_id) REFERENCES public.role(id);
ALTER TABLE public.employe ADD CONSTRAINT FK_employe__point_de_vente_id FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
ALTER TABLE public.produit ADD CONSTRAINT FK_produit__tva_id FOREIGN KEY (tva_id) REFERENCES public.tva(id);
ALTER TABLE public.produit ADD CONSTRAINT FK_produit__unite_id FOREIGN KEY (unite_id) REFERENCES public.unite(id);
ALTER TABLE public.pizza ADD CONSTRAINT FK_pizza__tva_id FOREIGN KEY (tva_id) REFERENCES public.tva(id);
ALTER TABLE public.pizza ADD CONSTRAINT FK_pizza__recette_id FOREIGN KEY (recette_id) REFERENCES public.recette(id);
ALTER TABLE public.recette_produit ADD CONSTRAINT FK_recette_produit__recette_id FOREIGN KEY (recette_id) REFERENCES public.recette(id);
ALTER TABLE public.recette_produit ADD CONSTRAINT FK_recette_produit__produit_id FOREIGN KEY (produit_id) REFERENCES public.produit(id);
ALTER TABLE public.client ADD CONSTRAINT FK_client__client_type_id FOREIGN KEY (client_type_id) REFERENCES public.client_type(id);
ALTER TABLE public.client ADD CONSTRAINT FK_client__point_de_vente_id FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
ALTER TABLE public.panier ADD CONSTRAINT FK_panier__client_id FOREIGN KEY (client_id) REFERENCES public.client(id);
ALTER TABLE public.panier_pizza ADD CONSTRAINT FK_panier_pizza__panier_id FOREIGN KEY (panier_id) REFERENCES public.panier(id);
ALTER TABLE public.panier_pizza ADD CONSTRAINT FK_panier_pizza__pizza_id FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);
ALTER TABLE public.panier_produit ADD CONSTRAINT FK_panier_produit__panier_id FOREIGN KEY (panier_id) REFERENCES public.panier(id);
ALTER TABLE public.panier_produit ADD CONSTRAINT FK_panier_produit__produit_id FOREIGN KEY (produit_id) REFERENCES public.produit(id);
ALTER TABLE public.commande ADD CONSTRAINT FK_commande__panier_id FOREIGN KEY (panier_id) REFERENCES public.panier(id);
ALTER TABLE public.commande ADD CONSTRAINT FK_commande__livreur_id FOREIGN KEY (livreur_id) REFERENCES public.employe(id);
ALTER TABLE public.commande ADD CONSTRAINT FK_commande__statut_commande_id FOREIGN KEY (statut_commande_id) REFERENCES public.statut_commande(id);
ALTER TABLE public.produit_point_de_vente ADD CONSTRAINT FK_produit_point_de_vente__produit_id FOREIGN KEY (produit_id) REFERENCES public.produit(id);
ALTER TABLE public.produit_point_de_vente ADD CONSTRAINT FK_produit_point_de_vente__point_de_vente_id FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);