--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter numeric(10,2) NOT NULL,
    nbofstars integer,
    nbofplanets integer,
    observation text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric(10,2) NOT NULL,
    age_in_millions_of_years integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type_id integer NOT NULL,
    star_id integer,
    mass numeric(10,2) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(240)
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass numeric(10,2) NOT NULL,
    age_in_millions_of_years integer,
    surfacetemp numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Zummuruda', 100.00, 1545, 4566, 'Cool galaxy');
INSERT INTO public.galaxy VALUES (2, 'A', 100.00, 1000, 1000, 'test');
INSERT INTO public.galaxy VALUES (3, 'B', 100.00, 1000, 1000, 'test');
INSERT INTO public.galaxy VALUES (4, 'C', 100.00, 1000, 1000, 'test');
INSERT INTO public.galaxy VALUES (5, 'D', 100.00, 1000, 1000, 'test');
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 105.00, 1899, 94566, 'Another Cool galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'AA', 10000.00, 1000, 1);
INSERT INTO public.moon VALUES (2, 'AB', 10000.00, 1000, 1);
INSERT INTO public.moon VALUES (3, 'AC', 10000.00, 1000, 1);
INSERT INTO public.moon VALUES (4, 'AD', 10000.00, 1000, 1);
INSERT INTO public.moon VALUES (5, 'BA', 10000.00, 1000, 2);
INSERT INTO public.moon VALUES (6, 'BB', 10000.00, 1000, 2);
INSERT INTO public.moon VALUES (7, 'BC', 10000.00, 1000, 2);
INSERT INTO public.moon VALUES (8, 'BD', 10000.00, 1000, 2);
INSERT INTO public.moon VALUES (9, 'CA', 10000.00, 1000, 3);
INSERT INTO public.moon VALUES (10, 'CB', 10000.00, 1000, 4);
INSERT INTO public.moon VALUES (11, 'CC', 10000.00, 1000, 4);
INSERT INTO public.moon VALUES (12, 'CD', 10000.00, 1000, 4);
INSERT INTO public.moon VALUES (13, 'DA', 10000.00, 1000, 12);
INSERT INTO public.moon VALUES (14, 'DB', 10000.00, 1000, 12);
INSERT INTO public.moon VALUES (15, 'DC', 10000.00, 1000, 12);
INSERT INTO public.moon VALUES (16, 'DD', 10000.00, 1000, 3);
INSERT INTO public.moon VALUES (17, 'EA', 10000.00, 1000, 15);
INSERT INTO public.moon VALUES (18, 'EB', 10000.00, 1000, 15);
INSERT INTO public.moon VALUES (19, 'EC', 10000.00, 1000, 15);
INSERT INTO public.moon VALUES (20, 'ED', 10000.00, 1000, 19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'AA', 1, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (2, 'AB', 1, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (3, 'AC', 1, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (4, 'AD', 1, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (5, 'BA', 1, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (6, 'BB', 2, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (7, 'BC', 2, 4, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (8, 'BD', 2, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (9, 'CA', 2, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (10, 'CB', 2, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (11, 'CC', 3, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (12, 'CD', 3, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (13, 'DA', 3, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (14, 'DB', 3, 1, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (15, 'DC', 3, 3, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (16, 'DD', 3, 3, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (17, 'EA', 3, 3, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (18, 'EB', 3, 3, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (19, 'EC', 3, 3, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (20, 'ED', 3, 3, 100000.00, 50, true, true);
INSERT INTO public.planet VALUES (21, 'EE', 3, 3, 100000.00, 50, true, true);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial planets', 'These are small, rocky planets that are similar in size and composition to Earth.');
INSERT INTO public.planet_type VALUES (2, 'Gas giants', 'These are large, Jupiter-like planets that are made up mostly of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (3, 'Exoplanets', 'These are planets that orbit stars outside of our solar system. They can be any of the types listed above, and may have characteristics that differ from those of planets in our solar system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Orphinax', 1, 154545.00, 15454, 3000.00);
INSERT INTO public.star VALUES (2, 'BA', 2, 1000.00, 1000, 1000.00);
INSERT INTO public.star VALUES (3, 'CA', 3, 1000.00, 1000, 1000.00);
INSERT INTO public.star VALUES (4, 'CB', 3, 1000.00, 1000, 1000.00);
INSERT INTO public.star VALUES (5, 'CC', 3, 1000.00, 1000, 1000.00);
INSERT INTO public.star VALUES (7, 'Sun', 1, 150000.00, 15000, 6000.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

