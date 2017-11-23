--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customer (
    id bigint NOT NULL,
    firstname character varying(20),
    lastname character varying(20)
);


ALTER TABLE customer OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product (
    pid integer NOT NULL,
    pname character varying,
    catalog character varying,
    price numeric(10,2),
    photo character varying,
    description character varying,
    detail character varying
);


ALTER TABLE product OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    uid integer NOT NULL,
    email character varying(255),
    passwd character varying(255),
    uname character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (id, firstname, lastname) FROM stdin;
1	Jack	Smith
2	Adam	Johnson
3	Kim	Smith
4	David	Williams
5	Peter	Davis
6	Jack	Smith
7	Adam	Johnson
8	Kim	Smith
9	David	Williams
10	Peter	Davis
11	Jack	Smith
12	Adam	Johnson
13	Kim	Smith
15	Peter	Davis
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 15, true);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (pid, pname, catalog, price, photo, description, detail) FROM stdin;
1	product1	catalog1	1.50	\N	description1	detail1
2	product2	catalog2	2.50	\N	description2	detail2
3	product3	catalog1	3.50	\N	description3	detail3
4	Apple iPhone 8 64 Go	phone	809.00	Apple-iPhone8-64Go.jpg	Gris sidéral	Capacité de stockage: 64Go
5	Samsung Galaxy Note 8 64 Go	phone	1009.00	SamsungGalaxyNote864Go.jpg	Noir Carbone	Capacité de stockage: 64Go
6	What Happened	book	35.48	whathappened.jpg	By (author)  Hillary Rodham Clinton	Hillary Rodham Clinton, from the introduction of What Happened For the first time, Hillary Rodham Clinton reveals what she was thinking and feeling during one of the most controversial and unpredictable presidential elections in history. 
7	Harry Potter and the Philosopher's Stone	book	16.99	Harry Potter and the Philosopher's Stone.jpg	By (author)  J. K. Rowling	Celebrate 20 years of Harry Potter magic with four special editions of Harry Potter and the Philosopher's Stone. 
8	NIKE MERCURIAL SUPERFLY V FG	sport	290.00	NIKE MERCURIAL SUPERFLY V FG.jpg	Orange laser/Blanc/Volt/Noir	La chaussure de football à crampons pour terrain sec Nike Mercurial Superfly V associe une tenue idéale, un toucher de balle exceptionnel et une adhérence explosive pour vous offrir une vitesse incomparable sur les terrains en herbe rase.
9	NIKE AIR ZOOM STRUCTURE 21	sport	120.00	NIKE AIR ZOOM STRUCTURE 21.jpg	Bleu royal profond/Noir/Harmonie/Argent	Plus légère et plus résistante que la version précédente, la chaussure de running Nike Air Zoom Structure 21 pour Homme offre la stabilité et le maintien qui ont fait de ce modèle un incontournable.
11	PC Portable HP 17-bs015nf	computer	749.99	PC Portable HP 17-bs015nf.jpg	intel_3rdgen_corei5	Ecran\t17,3 "\nPoids net\t2,6 Kg\nProcesseur\tIntel Core i5\nSystème d'exploitation\tMicrosoft Windows 10
12	Apple MacBook Pro" 	computer	1349.99	Apple MacBook Pro.jpg	128 Go SSD 8 Go RAM Intel Core i5	Ecran\t13,3 "\nPoids net\t1,37 Kg\nProcesseur\tIntel Core i5\nSystème d'exploitation\tMac OS
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (uid, email, passwd, uname) FROM stdin;
1	jack@gmail.com	123	jack
2	jack2@gmail.com	234	jack2
\.


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (pid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- PostgreSQL database dump complete
--

