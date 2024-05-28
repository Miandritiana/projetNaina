--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-05-27 09:32:44 EAT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';
SET default_table_access_method = heap;

--
-- Schema: public
--

CREATE TABLE public.adherant (
    id bigint NOT NULL,
    designation character varying(255),
    sanction integer,
    quotient integer,
    niveaux_lecture character varying(255)
);

ALTER TABLE public.adherant OWNER TO "postgres";

CREATE SEQUENCE public.adherent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.adherent_id_seq OWNER TO "postgres";

ALTER SEQUENCE public.adherent_id_seq OWNED BY public.adherant.id;

CREATE TABLE public.categorie (
    id integer NOT NULL,
    designation character varying(100)
);

ALTER TABLE public.categorie OWNER TO postgres;

CREATE SEQUENCE public.categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.categorie_id_seq OWNER TO postgres;

ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;

CREATE TABLE public.emprunt (
    id bigint NOT NULL,
    id_livre integer NOT NULL,
    id_membre integer,
    date_debut timestamp(6) without time zone,
    date_fin timestamp(6) without time zone,
    nom character varying(255)
);

ALTER TABLE public.emprunt OWNER TO "postgres";

CREATE SEQUENCE public.emprunt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.emprunt_id_seq OWNER TO "postgres";

ALTER SEQUENCE public.emprunt_id_seq OWNED BY public.emprunt.id;

CREATE TABLE public.livre (
    id bigint NOT NULL,
    titre character varying(255),
    auteur character varying(255),
    collection character varying(255),
    resume character varying(255),
    id_categorie integer,
    tome character varying(255),
    motcle character varying(255),
    langue character varying(255),
    num_code character varying(255),
    isbn character varying(255),
    edition character varying(255),
    date_edition timestamp(6) without time zone,
    nb_page integer,
    couverture character varying(255),
    age_requis integer,
    type_utilisation integer,
    emporter character varying(5)
);

ALTER TABLE public.livre OWNER TO "postgres";

CREATE SEQUENCE public.livre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.livre_id_seq OWNER TO "postgres";

ALTER SEQUENCE public.livre_id_seq OWNED BY public.livre.id;

CREATE TABLE public.membre (
    id bigint NOT NULL,
    referencemembre character varying(255),
    nom character varying(255),
    idadherant integer,
    telephone character varying(255),
    date_naissance timestamp(6) without time zone,
    date_inscription timestamp(6) without time zone,
    reference_membre character varying(255)
);

ALTER TABLE public.membre OWNER TO "postgres";

CREATE SEQUENCE public.membre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.membre_id_seq OWNER TO "postgres";

ALTER SEQUENCE public.membre_id_seq OWNED BY public.membre.id;

CREATE TABLE public.stock (
    id integer NOT NULL,
    quantite integer,
    id_livre integer NOT NULL
);

ALTER TABLE public.stock OWNER TO "postgres";

CREATE SEQUENCE public.stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.stock_id_seq OWNER TO "postgres";

ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;

CREATE TABLE public.utilisateur (
    id bigint NOT NULL,
    email character varying(255),
    mdp character varying(255)
);

ALTER TABLE public.utilisateur OWNER TO "postgres";

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.user_id_seq OWNER TO "postgres";

ALTER SEQUENCE public.user_id_seq OWNED BY public.utilisateur.id;

ALTER TABLE ONLY public.adherant ALTER COLUMN id SET DEFAULT nextval('public.adherent_id_seq'::regclass);

ALTER TABLE ONLY public.categorie ALTER COLUMN id SET DEFAULT nextval('public.categorie_id_seq'::regclass);

ALTER TABLE ONLY public.emprunt ALTER COLUMN id SET DEFAULT nextval('public.emprunt_id_seq'::regclass);

ALTER TABLE ONLY public.livre ALTER COLUMN id SET DEFAULT nextval('public.livre_id_seq'::regclass);

ALTER TABLE ONLY public.membre ALTER COLUMN id SET DEFAULT nextval('public.membre_id_seq'::regclass);

ALTER TABLE ONLY public.stock ALTER COLUMN id SET DEFAULT nextval('public.stock_id_seq'::regclass);

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);

INSERT INTO public.adherant (id, designation, sanction, quotient, niveaux_lecture) VALUES
(1, 'eleve', 4, 168, 2),
(3, 'Professionnel', 3, 336, 3),
(4, 'simple', 5, 120, 1),
(2, 'proffesseur', 2, 504, 4);


INSERT INTO public.categorie (id, designation) VALUES
(1, 'Fiction'),
(2, 'Science-fiction'),
(3, 'Fantasy'),
(4, 'Biographie'),
(5, 'Histoire'),
(6, 'Sciences'),
(7, 'Livres pour enfants'),
(8, 'Livres d''images'),
(9, 'Livres éducatifs'),
(10, 'Dictionnaire'),
(11, 'Encyclopédie'),
(12, 'Atlas');



-- COPY public.emprunt (id, id_livre, id_membre, date_debut, date_fin, nom) FROM stdin;


INSERT INTO public.livre (id, titre, auteur, collection, resume, id_categorie, tome, motcle, langue, num_code, isbn, edition, date_edition, nb_page, couverture, age_requis, type_utilisation, emporter) VALUES
(1, 'Le Comte de Monte-Cristo', 'Alexandre Dumas', 'Le Livre de Poche', 'Un jeune marin injustement emprisonné cherche vengeance.', 1, 1, 'Aventure, Drame', 'Français', 100000, '978-2253003487', '1ère édition', '1844-08-28 00:00:00', 1488, 'https://img-4.linternaute.com/vuq5DaIE0vv65ilF1C6oXoX_K7I=/1240x/70b720ccc1d54a8d8e54275450251fda/ccmcms-linternaute/225443.jpeg', 14, 1, 1),
(2, 'Les Misérables', 'Victor Hugo', 'Le Livre de Poche', 'La vie de Jean Valjean dans la France du 19ème siècle.', 1, 1, 'Drame, Historique', 'Français', 100001, '978-2253003708', '1ère édition', '1862-03-15 00:00:00', 1984, 'https://cdn.kobo.com/book-images/9cd6ff8c-ae73-4c8b-b161-326c1887d48c/1200/1200/False/les-miserables-291.jpg', 16, 2, 1),
(3, 'Orgueil et Préjugés', 'Jane Austen', 'Le Livre de Poche', 'Une histoire d''amour et de classe dans l''Angleterre du début du 19ème siècle.', 1, 1, 'Romance, Classique', 'Français', 100002, '978-2253004231', '1ère édition', '1813-01-28 00:00:00', 480, 'https://img-4.linternaute.com/bdXFifgcZrFRqXStn1nYu04lm4I=/1500x/smart/39578a52c5bf4c6faa7db99cac4e041f/ccmcms-linternaute/11300868.jpg', 12, 3, 0),
(4, 'Crime et Châtiment', 'Fiodor Dostoïevski', 'Folio', 'Un étudiant russe commet un meurtre et fait face aux conséquences.', 1, 1, 'Drame, Psychologique', 'Français', 100003, '978-2070374523', '1ère édition', '1866-01-01 00:00:00', 672, 'https://media.senscritique.com/media/000020002515/0/crime_et_chatiment.jpg', 18, 1, 1),
(5, '1984', 'George Orwell', 'Folio', 'Une dystopie sur un régime totalitaire qui surveille tous les aspects de la vie.', 2, 1, 'Dystopie, Politique', 'Français', 100004, '978-2070368225', '1ère édition', '1949-06-08 00:00:00', 336, 'https://prod-bb-images.akamaized.net/book/96e8e9c4-4175-4be1-90a6-4c6a0e837216.jpg', 16, 1, 0),
(6, 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', 'HarperCollins', 'Une épopée fantastique dans la Terre du Milieu.', 3, 1, 'Fantasy, Aventure', 'Français', 100005, '978-0261103573', '1ère édition', '1954-07-29 00:00:00', 1216, 'https://m.media-amazon.com/images/I/41ewg5-x32L.jpg', 14, 2, 0),
(7, 'L''origine des espèces', 'Charles Darwin', 'Penguin Classics', 'Un ouvrage scientifique fondateur sur l''évolution des espèces.', 6, 1, 'Science, Biologie', 'Français', 100006, '978-0140439120', '1ère édition', '1859-11-24 00:00:00', 720, 'https://m.media-amazon.com/images/I/51pECs-K+3L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', 18, 1, 1),
(8, 'Une Brève Histoire du Temps', 'Stephen Hawking', 'Bantam', 'Un livre accessible sur la cosmologie et les mystères de l''univers.', 6, 1, 'Science, Astronomie', 'Français', 100007, '978-0553380163', '1ère édition', '1988-04-01 00:00:00', 256, 'https://images-na.ssl-images-amazon.com/images/I/41rIzWZkADL._SX331_BO1,204,203,200_.jpg', 16, 2, 1),
(9, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 'Gallimard', 'Un conte poétique et philosophique sur un petit prince venant d''une autre planète.', 7, 1, 'Conte, Philosophique', 'Français', 100008, '978-2070612755', '1ère édition', '1943-04-06 00:00:00', 96, 'https://static.fnac-static.com/multimedia/Images/FR/NR/3c/80/53/6258236/1540-1/tsp20221205090651/Le-Petit-Prince.jpg', 10, 1, 1),
(10, 'Harry Potter à l''école des sorciers', 'J.K. Rowling', 'Gallimard Jeunesse', 'Le début des aventures de Harry Potter à Poudlard.', 3, 1, 'Fantasy, Jeunesse', 'Français', 100009, '978-2070643025', '1ère édition', '1997-06-26 00:00:00', 320, 'https://images-na.ssl-images-amazon.com/images/I/81YOuOGFCJL.jpg', 12, 1, 0),
(11, 'L''Art de la guerre', 'Sun Tzu', 'Flammarion', 'Un traité militaire chinois sur la stratégie et la tactique.', 12, 1, 'Stratégie, Philosophie', 'Français', 100010, '978-2081213573', '1ère édition', '0500-01-01 00:00:00', 224, 'https://images-na.ssl-images-amazon.com/images/I/91yGhtp+3BL.jpg', 14, 2, 0),
(12, 'Le Livre des Merveilles', 'Marco Polo', 'Penguin Classics', 'Les voyages de Marco Polo à travers l''Asie au 13ème siècle.', 4, 1, 'Biographie, Voyage', 'Français', 100011, '978-0140440577', '1ère édition', '1298-01-01 00:00:00', 368, 'https://m.media-amazon.com/images/I/91SzBh1I5oL._SX311_BO1,204,203,200_.jpg', 16, 1, 1);


INSERT INTO public.membre (id, referencemembre, nom, idadherant, telephone, date_naissance, date_inscription, reference_membre) VALUES
(1, 'E001', 'Jean Dupont', 2, '0600000001', '1980-01-01 00:00:00', '2023-01-01 00:00:00', 'E001'),
(2, 'E002', 'Marie Curie', 4, '0600000002', '1867-11-07 00:00:00', '2023-02-01 00:00:00', 'E002'),
(3, 'E003', 'Albert Einstein', 3, '0600000003', '1879-03-14 00:00:00', '2023-03-01 00:00:00', 'E003'),
(4, 'E004', 'Isaac Newton', 1, '0600000004', '1643-01-04 00:00:00', '2023-04-01 00:00:00', 'E004');


INSERT INTO public.stock (id, quantite, id_livre) VALUES
(1, 10, 1),
(2, 8, 2),
(3, 5, 3),
(4, 7, 4),
(5, 6, 5),
(6, 12, 6),
(7, 3, 7),
(8, 4, 8),
(9, 9, 9),
(10, 11, 10),
(11, 2, 11),
(12, 1, 12);

INSERT INTO public.utilisateur (id, email, mdp) VALUES
(1, 'user1@example.com', 'password1'),
(2, 'user2@example.com', 'password2'),
(3, 'user3@example.com', 'password3');

ALTER TABLE ONLY public.adherant
    ADD CONSTRAINT adherant_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.emprunt
    ADD CONSTRAINT emprunt_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.livre
    ADD CONSTRAINT livre_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.membre
    ADD CONSTRAINT membre_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.emprunt
    ADD CONSTRAINT fk9jfs9yw0d79xhye2bgr5j1hlv FOREIGN KEY (id_livre) REFERENCES public.livre(id);

ALTER TABLE ONLY public.emprunt
    ADD CONSTRAINT fk8thv3gq39fkn5grv4r0umkoxp FOREIGN KEY (id_membre) REFERENCES public.membre(id);

ALTER TABLE ONLY public.livre
    ADD CONSTRAINT fkplst5vbdywsq8wyay0e7tn2l0 FOREIGN KEY (id_categorie) REFERENCES public.categorie(id);

ALTER TABLE ONLY public.membre
    ADD CONSTRAINT fkldu27wgwadwhr2vy3puwytggf FOREIGN KEY (idadherant) REFERENCES public.adherant(id);

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT fkj4mcd1aiflhfsf3u6ffybr11 FOREIGN KEY (id_livre) REFERENCES public.livre(id);

-- Completed on 2024-05-27 09:32:44 EAT

