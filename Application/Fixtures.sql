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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.admins DISABLE TRIGGER ALL;

ALTER TABLE public.admins ENABLE TRIGGER ALL;

ALTER TABLE public.users DISABLE TRIGGER ALL;

ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.events DISABLE TRIGGER ALL;

INSERT INTO public.events (id, body, created_at) VALUES ('feca0c51-4245-4774-a717-b5bbae93e431', 'CustomUser created room IHP', '2021-02-24 14:29:43.650706-05');
INSERT INTO public.events (id, body, created_at) VALUES ('692fd285-68c8-41fe-b85e-cb6a6dd83fdd', 'CustomUser messaged in IHP', '2021-02-24 14:29:50.802668-05');


ALTER TABLE public.events ENABLE TRIGGER ALL;


ALTER TABLE public.rooms DISABLE TRIGGER ALL;

INSERT INTO public.rooms (id, title) VALUES ('a1051d2c-20b3-4703-8c56-b1fc77434860', 'IHP');


ALTER TABLE public.rooms ENABLE TRIGGER ALL;


ALTER TABLE public.messages DISABLE TRIGGER ALL;

INSERT INTO public.messages (id, room_id, body, created_at, user_name) VALUES ('7b06221a-ee96-44b7-bf48-10cda6caca46', 'a1051d2c-20b3-4703-8c56-b1fc77434860', 'Hello There!', '2021-02-24 14:29:50.790191-05', 'CustomUser');

ALTER TABLE public.messages ENABLE TRIGGER ALL;

ALTER TABLE public.clubs DISABLE TRIGGER ALL;

ALTER TABLE public.clubs ENABLE TRIGGER ALL;

ALTER TABLE public.tournois DISABLE TRIGGER ALL;

ALTER TABLE public.tournois ENABLE TRIGGER ALL;

ALTER TABLE public.equipes DISABLE TRIGGER ALL;

ALTER TABLE public.equipes ENABLE TRIGGER ALL;

ALTER TABLE public.gymnases DISABLE TRIGGER ALL;

ALTER TABLE public.gymnases ENABLE TRIGGER ALL;

ALTER TABLE public.matchs DISABLE TRIGGER ALL;

ALTER TABLE public.matchs ENABLE TRIGGER ALL;

ALTER TABLE public.match_sets DISABLE TRIGGER ALL;

ALTER TABLE public.match_sets ENABLE TRIGGER ALL;

ALTER TABLE public.personnes DISABLE TRIGGER ALL;

ALTER TABLE public.personnes ENABLE TRIGGER ALL;

ALTER TABLE public.tournoi_branches DISABLE TRIGGER ALL;

ALTER TABLE public.tournoi_branches ENABLE TRIGGER ALL;

ALTER TABLE public.tournoi_phases DISABLE TRIGGER ALL;

ALTER TABLE public.tournoi_phases ENABLE TRIGGER ALL;

ALTER TABLE public.tournoi_poules DISABLE TRIGGER ALL;

ALTER TABLE public.tournoi_poules ENABLE TRIGGER ALL;

ALTER TABLE public.poule_equipes DISABLE TRIGGER ALL;

ALTER TABLE public.poule_equipes ENABLE TRIGGER ALL;

ALTER TABLE public.poule_matchs DISABLE TRIGGER ALL;

ALTER TABLE public.poule_matchs ENABLE TRIGGER ALL;

ALTER TABLE public.terrains DISABLE TRIGGER ALL;

ALTER TABLE public.terrains ENABLE TRIGGER ALL;
