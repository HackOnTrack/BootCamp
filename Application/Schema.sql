-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);

CREATE TABLE admins (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);

CREATE TABLE rooms (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL
);
CREATE TABLE messages (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    room_id UUID NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    user_name TEXT NOT NULL
);
CREATE TABLE events (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
ALTER TABLE messages
CREATE TABLE clubs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    nom_entier TEXT NOT NULL
);
CREATE TABLE tournois (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    tournoi_date DATE NOT NULL,
    niveau TEXT NOT NULL,
    tournoi_type TEXT NOT NULL,
    nb_equipes INT NOT NULL,
    club_id UUID NOT NULL,
    nb_terrains INT NOT NULL,
    nb_gymnases INT NOT NULL
);
CREATE TABLE personnes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    identifiant TEXT NOT NULL,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    mail TEXT NOT NULL
);
CREATE TABLE equipes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    niveau TEXT NOT NULL,
    tournoi_id UUID NOT NULL
);
CREATE TABLE tournoi_phases (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    numero INT NOT NULL,
    libelle TEXT NOT NULL,
    tournoi_id UUID NOT NULL
);
CREATE TABLE tournoi_branches (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    numero INT NOT NULL,
    libelle TEXT NOT NULL,
    tournoi_id UUID NOT NULL
);
CREATE TABLE tournoi_poules (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    numero INT NOT NULL,
    libelle TEXT NOT NULL,
    nb_equipes INT NOT NULL,
    tournoi_phase_id UUID NOT NULL,
    tournoi_branche_id UUID NOT NULL
);
CREATE TABLE poule_equipes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    numero INT NOT NULL,
    tournoi_poule_id UUID NOT NULL,
    equipe_id UUID NOT NULL,
    nb_matchs_joues INT NOT NULL,
    nb_matchs_gagnes INT NOT NULL,
    nb_matchs_nuls INT NOT NULL,
    classement INT NOT NULL
);
CREATE TABLE gymnases (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    adresse TEXT NOT NULL,
    nb_terrains INT NOT NULL
);
CREATE TABLE poule_matchs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    equipe_1_id UUID DEFAULT uuid_generate_v4() NOT NULL,
    equipe_2_id UUID DEFAULT uuid_generate_v4() NOT NULL,
    match_id UUID NOT NULL
);
CREATE TABLE terrains (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    numero INT NOT NULL,
    nom TEXT NOT NULL,
    gymnase_id UUID NOT NULL
);
CREATE TABLE matchs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    equipe_1_id UUID NOT NULL,
    equipe_2_id UUID NOT NULL,
    equipe_arbitre_id UUID NOT NULL,
    nb_sets_1 INT NOT NULL,
    nb_sets_2 INT NOT NULL,
    nb_points_1 INT NOT NULL,
    nb_points_2 INT NOT NULL,
    b_commence BOOLEAN DEFAULT false NOT NULL,
    b_termine BOOLEAN DEFAULT false NOT NULL
);
CREATE TABLE match_sets (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    match_id UUID NOT NULL,
    numero INT NOT NULL,
    nb_points_max INT DEFAULT 25 NOT NULL,
    nb_points_1 INT NOT NULL,
    nb_points_2 INT NOT NULL,
    bl_commence BOOLEAN DEFAULT false NOT NULL,
    bl_termine BOOLEAN DEFAULT false NOT NULL,
    deroulement TEXT NOT NULL
);
ALTER TABLE equipes ADD CONSTRAINT equipes_ref_tournoi_id FOREIGN KEY (tournoi_id) REFERENCES tournois (id) ON DELETE NO ACTION;
ALTER TABLE match_sets ADD CONSTRAINT match_sets_ref_match_id FOREIGN KEY (match_id) REFERENCES matchs (id) ON DELETE NO ACTION;
ALTER TABLE matchs ADD CONSTRAINT matchs_ref_equipe_1_id FOREIGN KEY (equipe_1_id) REFERENCES equipes (id) ON DELETE NO ACTION;
ALTER TABLE matchs ADD CONSTRAINT matchs_ref_equipe_2_id FOREIGN KEY (equipe_2_id) REFERENCES equipes (id) ON DELETE NO ACTION;
ALTER TABLE poule_equipes ADD CONSTRAINT poule_equipes_ref_equipe_id FOREIGN KEY (equipe_id) REFERENCES equipes (id) ON DELETE NO ACTION;
ALTER TABLE poule_equipes ADD CONSTRAINT poule_equipes_ref_tournoi_poule_id FOREIGN KEY (tournoi_poule_id) REFERENCES tournoi_poules (id) ON DELETE NO ACTION;
ALTER TABLE poule_matchs ADD CONSTRAINT poule_matchs_ref_match_id FOREIGN KEY (match_id) REFERENCES matchs (id) ON DELETE NO ACTION;
ALTER TABLE terrains ADD CONSTRAINT terrains_ref_gymnase_id FOREIGN KEY (gymnase_id) REFERENCES gymnases (id) ON DELETE NO ACTION;
ALTER TABLE tournoi_branches ADD CONSTRAINT tournoi_branches_ref_tournoi_id FOREIGN KEY (tournoi_id) REFERENCES tournois (id) ON DELETE NO ACTION;
ALTER TABLE tournoi_phases ADD CONSTRAINT tournoi_phase_ref_tournoi_id FOREIGN KEY (tournoi_id) REFERENCES tournois (id) ON DELETE NO ACTION;
ALTER TABLE tournoi_poules ADD CONSTRAINT tournoi_poules_ref_tournoi_branche_id FOREIGN KEY (tournoi_branche_id) REFERENCES tournoi_branches (id) ON DELETE NO ACTION;
ALTER TABLE tournoi_poules ADD CONSTRAINT tournoi_poules_ref_tournoi_phase_id FOREIGN KEY (tournoi_phase_id) REFERENCES tournoi_phases (id) ON DELETE NO ACTION;
ALTER TABLE tournois ADD CONSTRAINT tournois_ref_club_id FOREIGN KEY (club_id) REFERENCES clubs (id) ON DELETE NO ACTION;
ADD CONSTRAINT messages_ref_room_id FOREIGN KEY (room_id) REFERENCES rooms (id) ON DELETE NO ACTION;
