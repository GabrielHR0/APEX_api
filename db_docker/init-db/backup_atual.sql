--
-- PostgreSQL database dump
--

\restrict YT6jeX8qc75YfHrGsGAp3U9fgklmQdp0kb2L9Gqox2CKBXbZ0epZFXq9HfuPNdf

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.active_storage_attachments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    blob_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying NOT NULL,
    record_id uuid NOT NULL,
    record_type character varying NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO vmuser114;

--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.active_storage_blobs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    content_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    filename character varying NOT NULL,
    key character varying NOT NULL,
    metadata text,
    service_name character varying NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO vmuser114;

--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.active_storage_variant_records (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    blob_id uuid NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO vmuser114;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.addresses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    city character varying,
    complement character varying,
    country character varying,
    created_at timestamp(6) without time zone NOT NULL,
    enderecavel_id bigint NOT NULL,
    enderecavel_type character varying NOT NULL,
    neighborhood character varying,
    number character varying,
    state character varying,
    street character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    zip_code character varying
);


ALTER TABLE public.addresses OWNER TO vmuser114;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vmuser114;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.cards (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean DEFAULT true,
    carousel_frame_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    image character varying,
    "position" integer,
    title character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cards OWNER TO vmuser114;

--
-- Name: carousel_frames; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.carousel_frames (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    image character varying,
    "position" integer,
    title character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.carousel_frames OWNER TO vmuser114;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.companies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    email character varying,
    name character varying,
    phone character varying,
    tagline text,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO vmuser114;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.contacts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    email character varying,
    ip_address character varying,
    message text,
    message_id character varying,
    name character varying,
    sent_at timestamp(6) without time zone,
    status character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO vmuser114;

--
-- Name: events; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.events (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    image character varying,
    "position" integer,
    subtitle character varying,
    title character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO vmuser114;

--
-- Name: extension_cores; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.extension_cores (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    acronym character varying,
    created_at timestamp(6) without time zone NOT NULL,
    description character varying,
    icon character varying,
    images json,
    member_id uuid NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.extension_cores OWNER TO vmuser114;

--
-- Name: hero_banners; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.hero_banners (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    image character varying,
    title character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.hero_banners OWNER TO vmuser114;

--
-- Name: hero_cards; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.hero_cards (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean,
    created_at timestamp(6) without time zone NOT NULL,
    description character varying,
    "position" integer,
    title character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.hero_cards OWNER TO vmuser114;

--
-- Name: members; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    email character varying,
    featured boolean DEFAULT false,
    full_name character varying,
    image character varying,
    phone character varying,
    role character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.members OWNER TO vmuser114;

--
-- Name: page_views; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.page_views (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    ip character varying,
    page character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    user_agent character varying
);


ALTER TABLE public.page_views OWNER TO vmuser114;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.permissions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    action character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    resource character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO vmuser114;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.projects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description character varying,
    details character varying,
    extension_core_id uuid NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO vmuser114;

--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.role_permissions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    permission_id uuid NOT NULL,
    role_id uuid NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO vmuser114;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    name character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO vmuser114;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vmuser114;

--
-- Name: social_media_profiles; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.social_media_profiles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    active boolean,
    company_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    platform character varying,
    "position" integer,
    updated_at timestamp(6) without time zone NOT NULL,
    url character varying,
    username character varying
);


ALTER TABLE public.social_media_profiles OWNER TO vmuser114;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    role_id uuid NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.user_roles OWNER TO vmuser114;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    jti character varying NOT NULL,
    remember_created_at timestamp(6) without time zone,
    reset_password_sent_at timestamp(6) without time zone,
    reset_password_token character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO vmuser114;

--
-- Name: versions; Type: TABLE; Schema: public; Owner: vmuser114
--

CREATE TABLE public.versions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    event character varying NOT NULL,
    item_id character varying NOT NULL,
    item_type character varying NOT NULL,
    object text,
    object_changes jsonb,
    whodunnit character varying
);


ALTER TABLE public.versions OWNER TO vmuser114;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: vmuser114
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.versions_id_seq OWNER TO vmuser114;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vmuser114
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.active_storage_attachments (id, blob_id, created_at, name, record_id, record_type) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.active_storage_blobs (id, byte_size, checksum, content_type, created_at, filename, key, metadata, service_name) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.addresses (id, city, complement, country, created_at, enderecavel_id, enderecavel_type, neighborhood, number, state, street, updated_at, zip_code) FROM stdin;
eff2f731-b0a8-4d61-adb6-e297fcb45b2a	Mossoró		\N	2026-03-06 00:42:25.796826	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-06 00:42:25.796826	59600230
682c540d-82a3-4577-a201-ea3674ae6066	Mossoró	Sala 01	\N	2026-03-06 00:42:59.382697	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-06 00:42:59.382697	59600230
30091d87-024f-4a7d-bb17-653e83c1e21c	Mossoró	Sala 01	\N	2026-03-06 00:43:06.309777	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-06 00:43:06.309777	59600230
a27aee8b-0d9f-44b5-a560-55e8501e4084	Mossoró	Sala 01	\N	2026-03-11 20:20:34.790832	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-11 20:20:34.790832	59600230
236a6b23-aaeb-40bd-9b7d-7cdf61230ded	Mossoró	Complemento	\N	2026-03-11 20:41:49.457747	0	Company	Centro	653	RN	Av. Rio Branco	2026-03-11 20:41:49.457747	59600-230
5c5c8d03-e719-4236-b199-5f0c06bb147c	Mossoró	Complemento	\N	2026-03-11 20:43:04.043266	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-11 20:43:04.043266	59600-230
b8fe8261-9817-4a4c-bef6-cfee86fad932	Mossoró	Complemento	\N	2026-03-11 20:46:41.177319	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-11 20:46:41.177319	59600-230
adc5d7c9-6173-4cf2-9b94-7143fbd117c5	Mossoró	Complemento	\N	2026-03-11 20:57:54.906721	0	Company	Centro	s/n	RN	Av. Rio Branco	2026-03-11 20:57:54.906721	59600-230
c0233ce8-2367-4e2a-8006-88de6a0e43af	Mossoró	Complemento	\N	2026-03-11 21:02:58.712788	0	Company	Centro	653	RN	Av. Rio Branco	2026-03-11 21:02:58.712788	59600-230
efecd3f8-a3a7-41dc-827c-428720b256ca	Mossoró	Complemento	\N	2026-03-11 21:07:46.868819	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-11 21:07:46.868819	59600-230
0cc0a8f1-dc96-46c3-8592-880b81af7d5b	Mossoró	Complemento	\N	2026-03-11 21:23:34.134266	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-11 21:23:34.134266	59600-230
834f0643-f183-4672-844f-378b17e5d3ba	MOSSORO		\N	2026-03-11 21:26:40.536667	0	Company	Centro	653	RN	Av. Rio Branco	2026-03-11 21:26:40.536667	59600-230
4756d8ff-a1fe-4308-875a-31b24b8417d0	Mossoró	Complemento	\N	2026-03-11 21:32:16.457634	0	Company	SANTO ANTONIO	653	RN	Av. Rio Branco	2026-03-11 21:32:16.457634	59600-230
c511e8c9-89ec-4a5a-9824-9913620c5166	Mossoró	Sala 01	\N	2026-03-11 21:42:58.505119	0	Company	Centro	1234	RN	Av. Rio Branco	2026-03-11 21:42:58.505119	59600230
ca014e90-4cb0-4eb3-9928-f482d9eaf0e6	Mossoró	Sala 501	\N	2026-03-11 21:45:09.321739	0	Company	Centro	478	RN	R. Dr. Almino Afonso	2026-03-11 21:45:09.321739	59600210
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2026-03-01 12:34:54.335644	2026-03-01 12:34:54.335646
schema_sha1	9bf996f0b5050a09853ff71af187ae3e67ce4ed4	2026-03-01 12:34:54.337547	2026-03-01 12:34:54.337548
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.cards (id, active, carousel_frame_id, created_at, description, image, "position", title, updated_at) FROM stdin;
7867c05c-79ae-4d0b-a30c-d54c992613e2	t	85d31abc-8c88-4ba4-829d-882e61fc8061	2026-03-06 00:36:38.7772	Projetos realizados	\N	1	50+	2026-03-06 00:36:38.7772
525b9c02-6ca6-4bd1-881e-319c6658ede3	t	85d31abc-8c88-4ba4-829d-882e61fc8061	2026-03-06 00:36:51.085204	Clientes satisfeitos	\N	2	30+	2026-03-06 00:36:51.085204
fcdb08b1-a785-4091-ae72-ab42b62187fe	t	85d31abc-8c88-4ba4-829d-882e61fc8061	2026-03-06 00:37:00.344691	Membros ativos	\N	3	10+	2026-03-06 00:37:00.344691
80d0d807-24f9-4e2c-9e0d-a8263998417d	t	85d31abc-8c88-4ba4-829d-882e61fc8061	2026-03-06 00:37:09.928651	Anos de experiência	\N	4	3+	2026-03-06 00:37:09.928651
15c5467a-7b2d-40ea-bfcc-3bc813da2c9c	t	f09ea66a-b8f8-4062-9cda-2725bc7b5c3c	2026-03-11 20:37:28.250739	Atendimentos realizados	\N	1	50+	2026-03-11 20:37:28.250739
1100dff6-ad77-4903-9aee-9cfae2da13a3	t	f09ea66a-b8f8-4062-9cda-2725bc7b5c3c	2026-03-11 20:37:47.473783	Consultorias Jurídicas 	\N	2	20+	2026-03-11 20:37:47.473783
c0558c97-8bcf-4fd2-a731-07eb7ddcb482	t	4a2fe427-471f-4633-8e1e-cb2bf861d7b1	2026-03-11 20:38:48.298962	Estudantes impactados com o Movimento Empresa Júnior	\N	1	50+	2026-03-11 20:38:48.298962
36fa2a65-7ae5-434f-b7c5-be70a1ab70a2	t	4a2fe427-471f-4633-8e1e-cb2bf861d7b1	2026-03-11 20:39:21.505166	Eventos realizados	\N	2	10	2026-03-11 20:39:21.505166
\.


--
-- Data for Name: carousel_frames; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.carousel_frames (id, active, created_at, description, image, "position", title, updated_at) FROM stdin;
f09ea66a-b8f8-4062-9cda-2725bc7b5c3c	t	2026-03-06 00:38:06.365403	If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.  	c0ff361e-42d2-4a8d-85be-0c472dbec9d4.png	1	Inovação e empreendedorismo	2026-03-06 00:38:06.365403
85d31abc-8c88-4ba4-829d-882e61fc8061	t	2026-03-06 00:36:20.443846	If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.  	5f79417e-b417-407f-ace2-d8177a563175.jpeg	2	Criação da empresa	2026-03-11 20:35:37.906456
4a2fe427-471f-4633-8e1e-cb2bf861d7b1	t	2026-03-11 20:35:10.458225	If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.  	661018db-fdcd-4c42-81e2-1ac0b3254262.jpeg	3	Conquistas	2026-03-11 20:35:10.458225
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.companies (id, created_at, email, name, phone, tagline, updated_at) FROM stdin;
c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	2026-03-05 13:32:50.504791	apex@example.com	APEX	84999999944	Empreendedorismo e Soluções Jurídicas	2026-03-17 13:46:24.997629
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.contacts (id, created_at, email, ip_address, message, message_id, name, sent_at, status, updated_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.events (id, active, created_at, image, "position", subtitle, title, updated_at) FROM stdin;
bd3d21b1-59bf-4105-9b72-9840956a5274	t	2026-03-06 00:32:28.850772	2b6e5b74-1a35-498d-87ed-aa64ea7accb0.png	1	Empreendedorismo de sucesso	Apex Inova #1	2026-03-06 00:32:28.850772
39010c93-7427-4d48-8103-5ed28033d9fa	t	2026-03-11 20:32:17.408822	287a7fbe-1eec-4a37-b0b5-7470678da9be.jpeg	2	Comunicação com sucesso	Apex Inova #2	2026-03-11 20:41:39.074228
\.


--
-- Data for Name: extension_cores; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.extension_cores (id, acronym, created_at, description, icon, images, member_id, name, updated_at) FROM stdin;
d453df83-0440-449c-b9f6-b26aa49b941c	NACOM	2026-03-06 00:31:02.516373	Gestão da comunicação institucional, marketing digital e relacionamento com stakeholders.	ce1610f2-4924-46ac-96e2-c4a3cb2ba49f.png	["58124494-d21b-4b79-a061-fa55ba56313a.jpeg","58124494-d21b-4b79-a061-fa55ba56313a.jpg"]	81f72c8d-f53a-4553-bba5-475be4e76bbd	Núcleo Apex de Comunicação	2026-03-06 00:31:02.516373
4419d32a-0923-4502-b8cb-12b1eaee1030	NAEM	2026-03-06 00:15:32.153429	Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo e inovação no ecossistema empresarial.	d674e711-4a0a-40fd-9dd0-f2a778955416.png	["797ddee7-50f2-495f-95e7-9ede9ba83ca9.jpeg"]	4b3eec5a-91a7-4b70-8898-52c89cdcec65	Núcleo Apex de Empreendedorismo	2026-03-06 00:44:53.466684
b9060c29-723a-4cb2-8465-1a5e7105dfeb	NAEDU	2026-03-11 21:32:27.903783	O núcleo organiza palestras, oficinas, projetos educativos e capacitações, buscando aproximar o direito da comunidade e contribuir para a formação crítica e profissional dos estudantes.	6e1686e2-8df2-44d7-aacb-60d0d4b27778.png	["12963fd4-1c3c-48b1-b714-1813aa28fd70.jpg","12963fd4-1c3c-48b1-b714-1813aa28fd70.jpeg"]	4491919c-cd37-436d-a541-78faa393e422	Núcleo Apex de Educação	2026-03-11 21:33:18.932761
\.


--
-- Data for Name: hero_banners; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.hero_banners (id, active, created_at, description, image, title, updated_at) FROM stdin;
05dac0d6-6372-449b-8240-8ae944b0c81a	t	2026-03-05 13:38:51.118052	A APEX é uma empresa júnior que atua nas áreas de empreendedorismo e direito, oferecendo soluções inovadoras e acessíveis para empresas e empreendedores. Nossa missão é contribuir para o desenvolvimento do ecossistema empreendedor através de serviços jurídicos de qualidade e consultoria empresarial especializada.	a28e16f6-f5a6-4c3e-ab4e-c3369a8a9bc8.png	CONHEÇA UM POUCO SOBRE A NOSSA EMPRESA	2026-03-05 13:40:25.856347
\.


--
-- Data for Name: hero_cards; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.hero_cards (id, active, created_at, description, "position", title, updated_at) FROM stdin;
bf8a10f9-9d93-438c-ab54-55f0728718bf	t	2026-03-05 13:35:49.572677	Oferecemos o registro da sua marca dentro da legalidade	2	Registro de Marca	2026-03-05 13:35:49.572677
63e295ec-9ac8-4511-b27f-a944abb9fcdc	t	2026-03-05 13:36:17.149319	Mantenha sua empresa segura\n	3	Assessoria Jurídica	2026-03-05 13:36:17.149319
ed57e782-7107-4e91-b3fd-6dfde307d630	t	2026-03-05 13:35:22.863058	Consultoria Jurídica avançada para sua empresa	1	Consultoria Jurídica	2026-03-11 20:54:51.796456
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.members (id, active, created_at, email, featured, full_name, image, phone, role, updated_at) FROM stdin;
2d79e29f-21d3-4368-8b97-c771bf7197df	t	2026-03-06 00:06:23.969803	apex2@example.com	f	Maria Vitória 	fea09cdf-7e33-4aa1-a359-05d11945d248.webp	849999999999	Vice-presidente	2026-03-06 00:06:23.969803
4b3eec5a-91a7-4b70-8898-52c89cdcec65	t	2026-03-06 00:07:41.510037	apex4@example.com	f	Ricardo	7e1bbd1a-af76-4a3a-8e16-1eaecd00e6d6.webp	849999999	Financeiro	2026-03-06 00:07:41.510037
bf2163ad-44e8-49f3-b5bb-39f9f6e32a10	t	2026-03-06 00:10:53.4398	apex6@example.com	f	Pedro	13c78177-374e-4579-9236-2dd9d635d1cf.webp	84999999	Consultor Financeiro	2026-03-06 00:10:53.4398
76184473-dd19-4afd-a188-b5c25a72fef5	t	2026-03-06 00:09:27.554575	apex5@example.com	t	Alice	d5e768ed-4e93-45dc-b56c-d4269067926d.webp	8499999999	Consultora de Projetos	2026-03-11 20:05:46.49294
49f78d51-d302-4356-853e-363acd82eabe	t	2026-03-06 00:07:03.653303	apex3@example.com	t	Luiz	a4193994-7db5-4c62-b69f-2178cb291e77.webp	84999999999	Diretor financeiro	2026-03-11 20:05:48.567895
81f72c8d-f53a-4553-bba5-475be4e76bbd	f	2026-03-05 13:53:16.374421	apex@example.com	f	João Felipe Augusto	75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp	849999999	Diretor	2026-03-11 20:46:24.611071
4491919c-cd37-436d-a541-78faa393e422	t	2026-03-11 20:48:30.030088	apex8@example.com	f	Beatriz	077b61c4-23fd-406a-a8d2-b71d3780c010.webp	8499999-9999	Diretora de Projetos	2026-03-11 20:48:30.030088
17a5dd12-e41b-42ca-8fab-2513f16a4cd9	t	2026-03-11 20:49:39.167225	apex9@example.com	f	Gabriel	f8bcfbbc-2248-4416-8f38-c3d618b80f08.webp	8499999-9999	Marketing	2026-03-11 20:49:39.167225
e06d6bd8-f154-45d8-89a8-bc4aae7ea153	t	2026-03-11 20:47:38.828173	apex7@example.com	f	Antônio Marcos	54d99686-44a2-420f-b666-070ad2a0c56a.webp	8499999-999999	Diretor de Marketing	2026-03-13 14:27:26.936572
\.


--
-- Data for Name: page_views; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.page_views (id, created_at, ip, page, updated_at, user_agent) FROM stdin;
0768d93b-b66d-44e3-b7c9-eb1722dbc9ac	2026-03-03 20:39:24.592606	177.37.251.212	landing_page	2026-03-03 20:39:24.592606	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
fee660df-3928-4e02-8c7b-e1576c9bff93	2026-03-03 20:39:40.204584	177.37.251.212	landing_page	2026-03-03 20:39:40.204584	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
3df2c8ca-f0cf-4f2f-8d10-08a91b063e56	2026-03-03 20:40:33.283424	177.37.251.212	landing_page	2026-03-03 20:40:33.283424	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
7bed8b6b-4e3b-4b4f-bf5c-085dbbd3db0f	2026-03-03 20:45:50.807037	177.37.251.212	landing_page	2026-03-03 20:45:50.807037	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
6e4544a3-24d7-444b-a1c1-571422a0b2e6	2026-03-03 20:48:14.744735	177.37.251.212	landing_page	2026-03-03 20:48:14.744735	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
c8dc9f78-7ba4-436b-8e3d-c03f7e16eb9a	2026-03-03 20:50:24.963102	177.37.251.212	landing_page	2026-03-03 20:50:24.963102	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
6ec3d26a-f729-4878-8c1c-4dea0482cce6	2026-03-03 20:51:12.283381	177.37.251.212	landing_page	2026-03-03 20:51:12.283381	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
bc69b993-3d41-4868-a326-05f095298fc7	2026-03-03 20:57:10.932879	177.37.251.212	landing_page	2026-03-03 20:57:10.932879	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
e8489029-f601-45e2-bdd7-804ec620b727	2026-03-03 20:57:29.386526	177.37.250.72	landing_page	2026-03-03 20:57:29.386526	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36
cc3fc8bb-2a55-4b4c-b846-05af80d0b44a	2026-03-03 21:20:33.584807	177.37.251.212	landing_page	2026-03-03 21:20:33.584807	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d9cc3c11-ac10-4da0-b2b3-a65bd084c679	2026-03-05 13:30:37.6323	138.94.108.128	landing_page	2026-03-05 13:30:37.6323	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
8a368ace-0b11-4bba-a095-63ef065a33c5	2026-03-05 13:32:58.274109	138.94.108.128	landing_page	2026-03-05 13:32:58.274109	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
fe53e0d5-8b7b-46ab-b59e-bb3174cc951f	2026-03-05 13:33:22.154746	138.94.108.128	landing_page	2026-03-05 13:33:22.154746	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
4f09b98a-ca39-455c-8515-f703ca045036	2026-03-05 13:34:16.724738	138.94.108.128	landing_page	2026-03-05 13:34:16.724738	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
6ef8c183-a69e-4f8c-9776-010879374bdf	2026-03-05 13:36:26.3017	138.94.108.128	landing_page	2026-03-05 13:36:26.3017	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
0fe2baf0-82ed-4cde-bab6-1aee5ca4fcfd	2026-03-05 13:39:05.598127	138.94.108.128	landing_page	2026-03-05 13:39:05.598127	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
f357b437-fff7-4159-869b-cd1f9f649835	2026-03-05 13:41:48.696154	138.94.108.128	landing_page	2026-03-05 13:41:48.696154	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
29b6d2a9-9e4e-401d-811e-c437ad022e2e	2026-03-05 13:53:24.902579	138.94.108.128	landing_page	2026-03-05 13:53:24.902579	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
5a23d1db-bac9-46be-b166-5b85cbd36e4c	2026-03-05 13:53:50.489334	138.94.108.128	landing_page	2026-03-05 13:53:50.489334	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
00f78ee8-45f8-41e3-8be6-6dd5d13336b7	2026-03-05 23:47:49.352182	177.37.251.212	landing_page	2026-03-05 23:47:49.352182	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
85d15ba1-45e3-48ae-9629-58df385df8f4	2026-03-05 23:48:14.942751	177.37.251.212	landing_page	2026-03-05 23:48:14.942751	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
c5cf552b-8d70-46be-be6b-1aa816bb7a36	2026-03-05 23:52:26.286396	177.37.251.212	landing_page	2026-03-05 23:52:26.286396	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
3ee4f21a-986f-413e-b331-23f8f772483b	2026-03-05 23:52:41.920995	177.37.251.212	landing_page	2026-03-05 23:52:41.920995	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36
96813dee-4c35-44b8-b248-81ef91adb376	2026-03-05 23:57:01.381707	177.37.251.212	landing_page	2026-03-05 23:57:01.381707	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
b1d8bd70-18fd-43c4-815f-f3e9eedaa096	2026-03-06 00:02:13.896512	179.107.251.15	landing_page	2026-03-06 00:02:13.896512	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
916e8c6a-83ad-4162-9d73-15c0335d9c08	2026-03-06 00:02:51.974038	179.107.251.15	landing_page	2026-03-06 00:02:51.974038	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
02c40770-af92-4fdb-8164-741de37c198b	2026-03-06 00:04:32.877157	179.107.251.15	landing_page	2026-03-06 00:04:32.877157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
c7911e58-5dad-456f-9dff-5e9d74bcaa40	2026-03-06 00:05:07.259954	179.107.251.15	landing_page	2026-03-06 00:05:07.259954	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
a89e9801-d26e-46c0-9255-f19b04cf2de9	2026-03-06 00:06:31.078527	179.107.251.15	landing_page	2026-03-06 00:06:31.078527	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
e0c60713-847e-418b-87dd-111832d596e8	2026-03-06 00:07:48.061319	179.107.251.15	landing_page	2026-03-06 00:07:48.061319	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
082535b2-b81e-4dbd-b639-158c6fa3eef0	2026-03-06 00:10:59.12014	179.107.251.15	landing_page	2026-03-06 00:10:59.12014	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
55fd3a8e-50c5-452c-93fd-bb3010cea788	2026-03-06 00:15:51.177394	179.107.251.15	landing_page	2026-03-06 00:15:51.177394	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
f34b6be2-3d2f-45b5-b9e4-1c095781534b	2026-03-06 00:17:39.776217	179.107.251.15	landing_page	2026-03-06 00:17:39.776217	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
df6053cf-4038-471c-bf7a-a83f5addf13a	2026-03-06 00:18:39.91857	179.107.251.15	landing_page	2026-03-06 00:18:39.91857	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
131b01fd-8bf2-4182-b795-baad3b1f2488	2026-03-06 00:19:04.448806	177.37.251.212	landing_page	2026-03-06 00:19:04.448806	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
31d4351c-c51f-4d59-ba21-693ff070e33d	2026-03-06 00:19:28.802583	179.107.251.15	landing_page	2026-03-06 00:19:28.802583	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
b8c76a2d-db40-4b81-9556-c1fa237f790e	2026-03-06 00:20:16.294263	179.107.251.15	landing_page	2026-03-06 00:20:16.294263	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
c44da6d7-846a-41a0-a143-f7e6fe160c4a	2026-03-06 00:20:21.890535	179.107.251.15	landing_page	2026-03-06 00:20:21.890535	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
5fbed1b2-f95d-4b2b-86de-ee23199e71e3	2026-03-06 00:20:27.835561	179.107.251.15	landing_page	2026-03-06 00:20:27.835561	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
9b3b27eb-be05-4dfe-a8c6-e4814aa43771	2026-03-06 00:20:35.747239	177.37.251.212	landing_page	2026-03-06 00:20:35.747239	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
3fd9aadd-274e-4e82-96d0-0afc66c57fe1	2026-03-06 00:21:24.609137	177.37.251.212	landing_page	2026-03-06 00:21:24.609137	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36
9aec4d08-4786-489a-a9f9-669b8e7bc475	2026-03-06 00:21:39.733825	179.107.251.15	landing_page	2026-03-06 00:21:39.733825	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
e84bb4af-6656-4403-ae6b-e5b825f8ffdb	2026-03-06 00:25:15.634213	179.107.251.15	landing_page	2026-03-06 00:25:15.634213	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
b371047e-276c-4d6b-ad28-2562fd78a36b	2026-03-06 00:30:00.56001	177.37.251.212	landing_page	2026-03-06 00:30:00.56001	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
52ff1aa5-afd9-4cc6-b323-161edcffd4e9	2026-03-06 00:27:59.265844	179.107.251.15	landing_page	2026-03-06 00:27:59.265844	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
9237e01f-abbd-438a-a9ab-b0f2f640c87b	2026-03-06 00:29:12.413898	179.107.251.15	landing_page	2026-03-06 00:29:12.413898	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
1845e72b-133b-46fd-8436-2d3335e5874e	2026-03-06 00:31:07.71709	179.107.251.15	landing_page	2026-03-06 00:31:07.71709	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
d22972a0-7f88-4205-a567-48f86d96a577	2026-03-06 00:32:46.304192	179.107.251.15	landing_page	2026-03-06 00:32:46.304192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
6f00573c-1536-48cc-995e-cff594419037	2026-03-06 00:33:34.807171	179.107.251.15	landing_page	2026-03-06 00:33:34.807171	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
c566491f-547f-44da-bc50-dacbeb3a3a7f	2026-03-06 00:33:52.932683	179.107.251.15	landing_page	2026-03-06 00:33:52.932683	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
9199af49-6c46-4633-8179-72ca7a559b76	2026-03-06 00:37:17.664024	179.107.251.15	landing_page	2026-03-06 00:37:17.664024	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
ba2f4e28-0ee8-44a9-86e3-1c799ca139d4	2026-03-06 00:38:12.212863	179.107.251.15	landing_page	2026-03-06 00:38:12.212863	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
47e2ddda-4c28-4609-8e15-bdc74f19f84d	2026-03-06 00:42:38.882871	179.107.251.15	landing_page	2026-03-06 00:42:38.882871	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
08050c6c-fff0-4ac3-8b4e-4e3b12ba75a2	2026-03-06 00:43:11.0462	179.107.251.15	landing_page	2026-03-06 00:43:11.0462	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
1391ac63-5633-4452-95f0-02feffdb8e6f	2026-03-06 00:44:23.689022	179.107.251.15	landing_page	2026-03-06 00:44:23.689022	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
815010f7-0f0d-416f-b6f7-c1dd78309a11	2026-03-06 00:44:57.620359	179.107.251.15	landing_page	2026-03-06 00:44:57.620359	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
1a70ffb7-fc60-475c-9aed-2677c2d15090	2026-03-06 10:19:46.065915	138.94.108.128	landing_page	2026-03-06 10:19:46.065915	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
769d6515-43fe-41e2-a155-502939874876	2026-03-06 11:38:50.617278	138.94.108.128	landing_page	2026-03-06 11:38:50.617278	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
36b76427-13fc-4c57-a05a-cb83b33af9ef	2026-03-07 01:27:31.182977	138.94.95.53	landing_page	2026-03-07 01:27:31.182977	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 OPR/127.0.0.0 (Edition std-2)
41d6407e-addc-4770-94b3-f59374fd2a69	2026-03-10 12:51:37.881507	138.94.108.128	landing_page	2026-03-10 12:51:37.881507	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
25c9dd13-24c8-4d8f-8464-8074fcefffae	2026-03-10 12:51:56.311335	138.94.108.128	landing_page	2026-03-10 12:51:56.311335	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d98bec2c-fd25-4a29-b9e4-23f5add54aee	2026-03-10 12:56:58.561701	138.94.108.128	landing_page	2026-03-10 12:56:58.561701	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
cb5cb9e3-28a9-44bf-9305-1e01cb1c879a	2026-03-10 13:19:46.080439	138.94.108.128	landing_page	2026-03-10 13:19:46.080439	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
35556d7d-8dbb-4334-b998-cfdb58464b59	2026-03-10 13:23:10.148404	138.94.108.128	landing_page	2026-03-10 13:23:10.148404	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
0b3d4308-a5c1-46da-a57c-7d9e418db2c8	2026-03-10 13:28:44.673175	138.94.108.128	landing_page	2026-03-10 13:28:44.673175	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
fc2c0b54-a6a6-422b-9af0-1d35af4e7c4c	2026-03-10 13:28:54.674129	138.94.108.128	landing_page	2026-03-10 13:28:54.674129	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
6cca9763-5c61-4487-828d-fc4e86b1e65f	2026-03-10 13:29:24.333428	138.94.108.128	landing_page	2026-03-10 13:29:24.333428	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
bd7e064b-e967-4a42-a49b-a7d00229ccf3	2026-03-10 13:29:29.647223	138.94.108.128	landing_page	2026-03-10 13:29:29.647223	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
e7fed3bc-99fd-4ff1-ad81-b46c4152d7de	2026-03-10 13:29:45.023254	138.94.108.128	landing_page	2026-03-10 13:29:45.023254	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
20cc71af-044c-482d-85e6-a9cff4a323a4	2026-03-10 13:37:29.772272	138.94.108.128	landing_page	2026-03-10 13:37:29.772272	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
5c6179f7-a66b-4cb9-9f82-cfcf4a45e7fb	2026-03-10 16:53:00.522694	138.94.108.128	landing_page	2026-03-10 16:53:00.522694	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 OPR/127.0.0.0 (Edition std-2)
cf6f2f70-471c-44b8-8f6f-0661e11796ef	2026-03-10 16:54:55.165895	138.94.108.128	landing_page	2026-03-10 16:54:55.165895	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
55e8c48d-b771-4df1-8612-5468ceae8ccc	2026-03-10 16:54:59.435222	138.94.108.128	landing_page	2026-03-10 16:54:59.435222	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36
339d2d81-8d7f-49ba-adb1-cd691fdb9be7	2026-03-10 16:57:28.392025	138.94.108.128	landing_page	2026-03-10 16:57:28.392025	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
4f7462f4-2d1c-40a4-983f-3a3c28ebd2dd	2026-03-10 18:10:33.034071	138.94.108.128	landing_page	2026-03-10 18:10:33.034071	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 OPR/127.0.0.0 (Edition std-2)
9f740fcc-c075-4b49-bf97-7da875a03eb0	2026-03-11 19:55:47.329401	177.37.251.212	landing_page	2026-03-11 19:55:47.329401	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
a66d8c28-d672-47b1-a1f1-5a639a40628d	2026-03-11 19:55:56.462559	147.182.238.100	landing_page	2026-03-11 19:55:56.462559	vercel-screenshot/1.0
1bfd6f66-0722-435d-8b97-95cf6db85897	2026-03-11 19:56:32.009267	177.37.251.212	landing_page	2026-03-11 19:56:32.009267	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
9cb09bb2-bb17-4a1a-9d03-41b65419edd3	2026-03-11 19:58:19.873741	177.37.251.212	landing_page	2026-03-11 19:58:19.873741	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
1f7416ba-87d8-4b9d-b27a-e5cbb56bdf90	2026-03-11 19:58:39.043982	177.37.251.212	landing_page	2026-03-11 19:58:39.043982	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
67cb3420-bf75-4da0-8ed1-900859b14bb4	2026-03-11 20:03:43.688358	177.37.251.212	landing_page	2026-03-11 20:03:43.688358	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d200571c-b8ec-4037-b521-54ff8af142f3	2026-03-11 20:12:35.641671	179.107.251.15	landing_page	2026-03-11 20:12:35.641671	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
8d2dc67f-b350-4abd-b3cc-2d5193a190c4	2026-03-11 20:16:08.511905	179.107.251.15	landing_page	2026-03-11 20:16:08.511905	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
bd71008d-f1b5-47ac-94ee-d9749231c19e	2026-03-11 20:16:56.865169	179.107.251.15	landing_page	2026-03-11 20:16:56.865169	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
4dac0c7d-bfbe-4cc6-9d46-35065d41a2b0	2026-03-11 20:18:21.879701	179.107.251.15	landing_page	2026-03-11 20:18:21.879701	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
1af96d82-e295-44c2-a309-0a109445d32a	2026-03-11 20:19:23.353324	179.107.251.15	landing_page	2026-03-11 20:19:23.353324	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
bf2d96fd-c318-4e43-9302-78d3c304db86	2026-03-11 20:20:45.867247	179.107.251.15	landing_page	2026-03-11 20:20:45.867247	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
72d5d3b8-32f2-4d94-b5b4-86b883a22b62	2026-03-11 20:24:25.867052	179.107.251.15	landing_page	2026-03-11 20:24:25.867052	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
059546fe-d602-475c-8d43-0b515a4c4dc3	2026-03-11 20:29:00.335983	179.107.251.15	landing_page	2026-03-11 20:29:00.335983	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
3b807659-e297-4854-9651-831319cdb3e2	2026-03-11 20:29:55.751552	179.107.251.15	landing_page	2026-03-11 20:29:55.751552	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
70b7ff51-05ec-4261-8efd-7377a8689461	2026-03-11 20:30:59.341438	179.107.251.15	landing_page	2026-03-11 20:30:59.341438	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
757d1961-d866-4d2b-8832-f4823f0fea1d	2026-03-11 20:32:25.541676	179.107.251.15	landing_page	2026-03-11 20:32:25.541676	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
99c6876f-abb0-41a9-9f3d-5fa3f58d0ece	2026-03-11 20:35:16.186504	179.107.251.15	landing_page	2026-03-11 20:35:16.186504	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
3336d6d5-ea07-4a39-b4a2-af63f8c5df88	2026-03-11 20:35:43.308562	179.107.251.15	landing_page	2026-03-11 20:35:43.308562	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
d50ddc0a-555b-4cbc-b94f-a4478c14f035	2026-03-11 20:35:43.733358	177.37.251.212	landing_page	2026-03-11 20:35:43.733358	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d58e356d-149b-4e47-8780-6563deed5fbf	2026-03-11 20:38:52.799358	179.107.251.15	landing_page	2026-03-11 20:38:52.799358	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
e8bf715c-d758-4afb-a780-b60ebf6f6c4a	2026-03-11 20:39:28.748813	179.107.251.15	landing_page	2026-03-11 20:39:28.748813	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
dfc7fd90-023f-4be6-8d72-b889aef73fc2	2026-03-11 20:39:40.486505	179.107.251.15	landing_page	2026-03-11 20:39:40.486505	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
cde96508-bb3e-489f-b20a-b9550454ff58	2026-03-11 20:41:43.807976	179.107.251.15	landing_page	2026-03-11 20:41:43.807976	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
cd8a0e3c-b8fb-4be0-ad54-fffd0295beb4	2026-03-11 20:49:48.827916	179.107.251.15	landing_page	2026-03-11 20:49:48.827916	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
8c6f228a-cbf6-4836-9f0c-003e38c56f6d	2026-03-11 20:54:07.068594	179.107.251.15	landing_page	2026-03-11 20:54:07.068594	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
6ffa9660-b909-4e13-a8a8-392f980ed719	2026-03-11 20:54:57.853362	179.107.251.15	landing_page	2026-03-11 20:54:57.853362	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
8bab2b21-de03-429e-884f-7465fe78f183	2026-03-11 20:55:46.998237	177.37.251.212	landing_page	2026-03-11 20:55:46.998237	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
230dc3b6-e86a-4501-b836-d5bc111e1171	2026-03-11 20:56:05.210648	177.37.251.212	landing_page	2026-03-11 20:56:05.210648	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36
9c70bc8e-6f06-4c23-9314-241530c77897	2026-03-11 21:01:27.259728	177.37.251.212	landing_page	2026-03-11 21:01:27.259728	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
735a11bf-7d27-45d8-b33d-87a894b8e4f1	2026-03-11 21:01:36.075134	179.107.251.15	landing_page	2026-03-11 21:01:36.075134	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
1c1a222a-aea0-4702-838c-ae91699d031c	2026-03-11 21:01:44.429179	179.107.251.15	landing_page	2026-03-11 21:01:44.429179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
04be54ef-0ded-4b7a-8c2e-b6039834da98	2026-03-11 21:04:02.584037	177.37.251.212	landing_page	2026-03-11 21:04:02.584037	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d592f79f-e8d7-433d-8536-ffaf97efd05b	2026-03-11 21:05:19.833865	177.37.251.212	landing_page	2026-03-11 21:05:19.833865	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
ffab03c3-a042-4ab7-b12a-adb6f06d93ba	2026-03-11 21:08:07.337338	179.107.251.15	landing_page	2026-03-11 21:08:07.337338	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
505955ef-62b5-42bb-ba03-8a2cd0a9a7dd	2026-03-11 21:10:09.966713	179.107.251.15	landing_page	2026-03-11 21:10:09.966713	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
bc92b8bd-8d9c-4853-84ab-4094075d2d0d	2026-03-11 21:10:28.432742	177.37.251.212	landing_page	2026-03-11 21:10:28.432742	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
86446d07-c175-4e99-879e-9c4b33643bb6	2026-03-11 21:10:47.106666	177.37.251.212	landing_page	2026-03-11 21:10:47.106666	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
b616b46c-9f65-4812-831b-682e18ac9598	2026-03-11 21:11:16.412684	177.37.251.212	landing_page	2026-03-11 21:11:16.412684	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
ed4c91cd-1d37-4c93-b972-496f3e8bd821	2026-03-11 21:12:36.598933	179.107.251.15	landing_page	2026-03-11 21:12:36.598933	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
bd3197c2-65d9-4ac1-9b18-32896a20a2c4	2026-03-11 21:13:32.99308	177.37.251.212	landing_page	2026-03-11 21:13:32.99308	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
71700bd9-2d0b-4c05-b491-b7e3e33f91b5	2026-03-11 21:14:59.307673	177.37.251.212	landing_page	2026-03-11 21:14:59.307673	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
f97e887d-a374-4079-99ef-3df733402ef7	2026-03-11 21:32:46.065237	179.107.251.15	landing_page	2026-03-11 21:32:46.065237	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
f561df01-86e7-41fd-9120-e5843ee63d1a	2026-03-11 21:32:59.865616	179.107.251.15	landing_page	2026-03-11 21:32:59.865616	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
9559d2f2-b85e-462d-9323-6fa766eaf0d1	2026-03-11 21:36:37.494329	179.107.251.15	landing_page	2026-03-11 21:36:37.494329	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
4ecea379-e6a3-46a3-8b81-e697e127d41f	2026-03-11 21:40:25.286238	179.107.251.15	landing_page	2026-03-11 21:40:25.286238	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
c2f20adb-3806-4aef-8185-cbe7c65b0c85	2026-03-11 21:42:08.75511	179.107.251.15	landing_page	2026-03-11 21:42:08.75511	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
190e8f82-b734-44a5-ad92-cc9a399b2598	2026-03-11 21:42:22.448821	177.37.251.212	landing_page	2026-03-11 21:42:22.448821	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
4fb665f9-4b51-4999-a105-e38c63b39443	2026-03-11 21:44:53.588032	177.37.251.212	landing_page	2026-03-11 21:44:53.588032	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
75e08c05-e910-4f5a-8b3e-4d1d6ec2c262	2026-03-11 21:45:11.257453	177.37.251.212	landing_page	2026-03-11 21:45:11.257453	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
bed90e1d-f59e-4a07-9550-ef3da6008083	2026-03-11 21:45:18.027949	177.37.251.212	landing_page	2026-03-11 21:45:18.027949	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d7dc9142-a484-42ef-8c3a-fc84f6277fe2	2026-03-11 21:45:20.401047	179.107.251.15	landing_page	2026-03-11 21:45:20.401047	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
c2d002f0-32a8-46a2-971a-7a4a0301bc0f	2026-03-11 21:49:31.486785	179.107.251.15	landing_page	2026-03-11 21:49:31.486785	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
2a11b6e6-666a-4e3e-8b95-08639be5a6c9	2026-03-11 21:55:27.916611	177.37.251.212	landing_page	2026-03-11 21:55:27.916611	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
ff9e6f25-a2ef-4786-afd0-3a7ec198f0f9	2026-03-11 21:48:00.143552	177.37.251.212	landing_page	2026-03-11 21:48:00.143552	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
57dec5b2-1bd0-4d8d-a314-591272acf59a	2026-03-11 21:51:25.568865	177.37.251.212	landing_page	2026-03-11 21:51:25.568865	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
3583e139-3f14-425d-8376-fd3cd5bc558f	2026-03-11 21:52:20.464324	179.107.251.15	landing_page	2026-03-11 21:52:20.464324	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
0c893604-6a57-43e1-944a-cde2ea095b46	2026-03-11 21:53:55.012822	179.107.251.15	landing_page	2026-03-11 21:53:55.012822	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
5d2172d1-170b-4a36-a2f8-d813f302e111	2026-03-11 21:52:07.562568	179.107.251.15	landing_page	2026-03-11 21:52:07.562568	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
053c63e5-ff0e-4ba8-99d4-d174f8bedcec	2026-03-11 21:52:30.281965	179.107.251.15	landing_page	2026-03-11 21:52:30.281965	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
f861354a-fc73-49f8-86ed-c330ac06bddf	2026-03-11 22:01:21.10514	177.37.251.212	landing_page	2026-03-11 22:01:21.10514	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
3eb263c1-4fe4-430f-bfd4-6989ca831a4c	2026-03-11 22:11:32.257445	177.37.251.212	landing_page	2026-03-11 22:11:32.257445	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
b3969cb7-3934-4a52-af40-16f61885e920	2026-03-11 22:11:47.66854	177.37.251.29	landing_page	2026-03-11 22:11:47.66854	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0
ff95b4f7-1c7a-43da-9c62-fcebd44a8f33	2026-03-11 22:12:01.706713	177.37.250.72	landing_page	2026-03-11 22:12:01.706713	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
ca215d62-30ee-40c5-87e9-163bb79e3e66	2026-03-11 22:12:17.140519	179.107.247.182	landing_page	2026-03-11 22:12:17.140519	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
9605c2ad-8d24-4da9-816f-211c969666e8	2026-03-11 22:16:12.529934	179.107.246.159	landing_page	2026-03-11 22:16:12.529934	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1
97813046-bb80-4e88-88c1-6ba8fa5270b7	2026-03-11 22:17:37.493008	179.107.246.159	landing_page	2026-03-11 22:17:37.493008	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
44e2322a-8f4b-4f51-95d0-a38ed66ee263	2026-03-11 22:17:57.905768	179.107.247.182	landing_page	2026-03-11 22:17:57.905768	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
622e0187-703c-4fb1-9f5b-d3a63b24b347	2026-03-11 22:24:16.309714	179.107.247.182	landing_page	2026-03-11 22:24:16.309714	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
181c75e6-4095-422f-a51d-aa07c51332d3	2026-03-11 22:24:19.325419	179.107.247.182	landing_page	2026-03-11 22:24:19.325419	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
84e55831-652a-4c17-b923-19b72bcec59e	2026-03-11 22:27:27.228008	177.25.115.180	landing_page	2026-03-11 22:27:27.228008	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36
0dd755fe-3a39-4dd8-92d7-c958be243147	2026-03-12 00:11:37.723076	191.58.91.83	landing_page	2026-03-12 00:11:37.723076	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
10a1b42c-1333-4f5f-ab6a-2dcab9d67f0d	2026-03-12 01:18:38.848911	177.37.251.11	landing_page	2026-03-12 01:18:38.848911	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
fc8d3656-6dd8-451e-afb4-aa67ec57bf1c	2026-03-12 01:18:51.11066	179.107.247.182	landing_page	2026-03-12 01:18:51.11066	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
f21bdd63-c573-4176-90d8-3f45b70691f0	2026-03-12 01:20:02.688958	131.0.163.77	landing_page	2026-03-12 01:20:02.688958	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36
15703b97-f559-4dec-9a59-b91112b92e97	2026-03-12 01:26:27.170282	177.37.251.48	landing_page	2026-03-12 01:26:27.170282	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Mobile/15E148 Safari/604.1
51debf0a-0aa9-4376-8cee-b3ac2926a015	2026-03-12 01:27:29.535195	179.107.250.225	landing_page	2026-03-12 01:27:29.535195	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
9e7727ee-924c-4986-9d60-045e05409a02	2026-03-12 01:27:39.159554	191.31.52.167	landing_page	2026-03-12 01:27:39.159554	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
535b7fc5-326e-4adf-938b-c2dbd2fffb4d	2026-03-12 01:41:07.390254	191.58.93.146	landing_page	2026-03-12 01:41:07.390254	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
fbd72ca0-a16b-4782-ba91-fdcdda357d7e	2026-03-12 12:10:54.51756	191.58.91.83	landing_page	2026-03-12 12:10:54.51756	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1
ad270293-2b1c-4b17-b27f-6cb2ca468d17	2026-03-12 12:39:18.442103	138.94.108.128	landing_page	2026-03-12 12:39:18.442103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
7c2b0e1f-3e26-44af-833d-864c552a1466	2026-03-12 12:39:47.480363	138.94.108.128	landing_page	2026-03-12 12:39:47.480363	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
e3341bee-eb87-4b2b-afc4-b72a0f9e1575	2026-03-12 12:39:47.833765	138.94.108.128	landing_page	2026-03-12 12:39:47.833765	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
968088bf-adb5-4ccd-85eb-2bbe54f63c07	2026-03-12 12:40:13.512211	138.94.108.128	landing_page	2026-03-12 12:40:13.512211	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36
21ad9d81-7694-4170-ac19-4aebc07c23e9	2026-03-12 12:41:16.759983	138.94.108.128	landing_page	2026-03-12 12:41:16.759983	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36
89924cd3-7076-4d78-af80-bace5e1cdab7	2026-03-12 13:14:00.593995	138.94.108.128	landing_page	2026-03-12 13:14:00.593995	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 OPR/127.0.0.0 (Edition std-2)
627436c6-2893-4aea-9b65-cbf2b003dd9b	2026-03-12 13:14:42.178543	138.94.108.128	landing_page	2026-03-12 13:14:42.178543	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 OPR/127.0.0.0 (Edition std-2)
e757c3f1-75fc-4c13-8df3-d49c6043d6bb	2026-03-12 23:29:11.564691	138.94.95.0	landing_page	2026-03-12 23:29:11.564691	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 OPR/127.0.0.0 (Edition std-2)
116cdc45-3f08-4463-b17c-b0ce98cb0e97	2026-03-13 13:30:01.320421	177.37.251.212	landing_page	2026-03-13 13:30:01.320421	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
c8ca870a-445b-4e93-951c-238b8f3f5412	2026-03-17 11:56:22.190981	138.94.108.128	landing_page	2026-03-17 11:56:22.190981	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
23c86dd0-4638-41c4-a25c-c3326ab761f6	2026-03-17 13:33:25.776059	138.94.108.128	landing_page	2026-03-17 13:33:25.776059	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
78cd73aa-f9e6-464f-b706-30a9de123d70	2026-03-17 15:27:41.812755	179.107.248.57	landing_page	2026-03-17 15:27:41.812755	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36
565af5ae-84e0-4985-b959-c23d157e8a67	2026-03-18 12:43:27.019966	138.94.108.128	landing_page	2026-03-18 12:43:27.019966	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
4f3e3025-7cb5-46ab-876b-39ff88a345db	2026-03-18 21:01:26.486796	179.107.248.57	landing_page	2026-03-18 21:01:26.486796	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36
1453542b-d542-4ca5-a7b8-a2ff2850dd45	2026-03-19 12:23:32.465462	138.94.108.128	landing_page	2026-03-19 12:23:32.465462	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
c6f18921-f041-4256-aa3d-9aacc8edd456	2026-03-19 12:26:10.084669	138.94.108.128	landing_page	2026-03-19 12:26:10.084669	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
d87d0e21-99f7-4984-a771-2c3d0d1e5f48	2026-03-19 12:56:24.507146	138.94.108.128	landing_page	2026-03-19 12:56:24.507146	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
e57ce427-b670-4985-978c-43435af7ea9b	2026-03-19 13:02:10.832941	138.94.108.128	landing_page	2026-03-19 13:02:10.832941	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.permissions (id, action, created_at, description, resource, updated_at) FROM stdin;
d5753ab0-a45b-454c-bb13-5366e5e8d55d	read	2026-03-01 12:46:37.911584	Permite visualizar users	user	2026-03-01 12:46:37.911584
60852a8a-7bfa-437e-bcb7-f4d8e73243d4	create	2026-03-01 12:46:37.914641	Permite criar users	user	2026-03-01 12:46:37.914641
9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7	update	2026-03-01 12:46:37.916996	Permite editar users	user	2026-03-01 12:46:37.916996
b72caae2-5a08-4aea-8656-9e6b63a99290	destroy	2026-03-01 12:46:37.919217	Permite remover users	user	2026-03-01 12:46:37.919217
24d52e89-247c-4690-a018-46e836fd8f23	read	2026-03-01 12:46:37.921599	Permite visualizar roles	role	2026-03-01 12:46:37.921599
3fd7a6f9-f101-4722-ba86-b0062a36211b	create	2026-03-01 12:46:37.923811	Permite criar roles	role	2026-03-01 12:46:37.923811
7370875d-48b3-45ad-8329-09653f09cc60	update	2026-03-01 12:46:37.925969	Permite editar roles	role	2026-03-01 12:46:37.925969
c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3	destroy	2026-03-01 12:46:37.928226	Permite remover roles	role	2026-03-01 12:46:37.928226
e4fac83a-14eb-43f2-adcd-ea882235b348	read	2026-03-01 12:46:37.930426	Permite visualizar permissions	permission	2026-03-01 12:46:37.930426
925fb8dc-72ea-493d-8839-2279f2e136a2	create	2026-03-01 12:46:37.932732	Permite criar permissions	permission	2026-03-01 12:46:37.932732
66ec275c-a758-401a-8859-24d4ad357f5d	update	2026-03-01 12:46:37.934961	Permite editar permissions	permission	2026-03-01 12:46:37.934961
1742a59d-df61-48fe-ac25-94d470289c65	destroy	2026-03-01 12:46:37.937124	Permite remover permissions	permission	2026-03-01 12:46:37.937124
51227b6a-0d78-4fda-af51-cb4c75c8c509	read	2026-03-01 12:46:37.939375	Permite visualizar members	member	2026-03-01 12:46:37.939375
eac020e5-db47-4614-92cf-ed2139438067	create	2026-03-01 12:46:37.941559	Permite criar members	member	2026-03-01 12:46:37.941559
28d7a980-2052-45f7-a569-5f952ea3d30f	update	2026-03-01 12:46:37.943817	Permite editar members	member	2026-03-01 12:46:37.943817
c931414f-5870-4272-925d-5302000509ca	destroy	2026-03-01 12:46:37.946048	Permite remover members	member	2026-03-01 12:46:37.946048
cdd59f12-ff36-4575-b060-bd74b7528e23	read	2026-03-01 12:46:37.948311	Permite visualizar dashboards	dashboard	2026-03-01 12:46:37.948311
d052e09b-1d24-41c7-862f-5a92096d4d46	create	2026-03-01 12:46:37.950981	Permite criar dashboards	dashboard	2026-03-01 12:46:37.950981
d84441b4-0714-4e79-a58c-6de2bd39ad72	update	2026-03-01 12:46:37.953422	Permite editar dashboards	dashboard	2026-03-01 12:46:37.953422
f8924245-16d2-48b5-9662-ef094173696a	destroy	2026-03-01 12:46:37.955793	Permite remover dashboards	dashboard	2026-03-01 12:46:37.955793
a2565feb-a158-443d-be75-f1fc393dae40	read	2026-03-01 12:46:37.957983	Permite visualizar hero_banners	hero_banner	2026-03-01 12:46:37.957983
42767b8e-d2b3-43f6-915c-f4efc0e8a9be	create	2026-03-01 12:46:37.960246	Permite criar hero_banners	hero_banner	2026-03-01 12:46:37.960246
97b06223-5a39-4916-aa80-b634cd690ed4	update	2026-03-01 12:46:37.96269	Permite editar hero_banners	hero_banner	2026-03-01 12:46:37.96269
c9b0d998-b3b9-4e2c-be37-bfb513e1de33	destroy	2026-03-01 12:46:37.964869	Permite remover hero_banners	hero_banner	2026-03-01 12:46:37.964869
de1cd953-433a-43a7-b597-7d7b72dffbe7	read	2026-03-01 12:46:37.96708	Permite visualizar hero_cards	hero_card	2026-03-01 12:46:37.96708
edd07c92-118f-4551-80ba-00cf9890f358	create	2026-03-01 12:46:37.969245	Permite criar hero_cards	hero_card	2026-03-01 12:46:37.969245
d5484571-a46f-4262-a6ab-26e945ff762e	update	2026-03-01 12:46:37.971501	Permite editar hero_cards	hero_card	2026-03-01 12:46:37.971501
24b00169-fc7c-456e-b1a0-c03942a48519	destroy	2026-03-01 12:46:37.973764	Permite remover hero_cards	hero_card	2026-03-01 12:46:37.973764
4d8af205-ad2c-4edd-80a7-0a2e4294f54a	read	2026-03-01 12:46:37.975977	Permite visualizar events	event	2026-03-01 12:46:37.975977
2afdfcc1-46bf-4501-b111-932e3c1692ed	create	2026-03-01 12:46:37.97819	Permite criar events	event	2026-03-01 12:46:37.97819
641209c4-4f6e-4ff3-b638-c9043ad8bdd6	update	2026-03-01 12:46:37.980434	Permite editar events	event	2026-03-01 12:46:37.980434
66eebba6-26d7-43d1-99ec-bc1a6c6e0290	destroy	2026-03-01 12:46:37.982642	Permite remover events	event	2026-03-01 12:46:37.982642
8d3249ea-e22f-4a72-9ef5-bdd364356b0f	read	2026-03-01 12:46:37.984934	Permite visualizar projects	project	2026-03-01 12:46:37.984934
47aae2de-f0fb-479c-9a1c-ed146db1103f	create	2026-03-01 12:46:37.987155	Permite criar projects	project	2026-03-01 12:46:37.987155
1fd15150-7e9f-405e-b8fc-75e8799a384b	update	2026-03-01 12:46:37.989294	Permite editar projects	project	2026-03-01 12:46:37.989294
4cbe598d-ca89-4e97-a956-49c7c4844db8	destroy	2026-03-01 12:46:37.991622	Permite remover projects	project	2026-03-01 12:46:37.991622
8bd401b5-9395-4b03-a437-5b1eebb1ab0e	read	2026-03-01 12:46:37.993854	Permite visualizar extension_cores	extension_core	2026-03-01 12:46:37.993854
c9f56b56-6523-491a-9d49-0622cd7c45de	create	2026-03-01 12:46:37.996082	Permite criar extension_cores	extension_core	2026-03-01 12:46:37.996082
21b7da72-980a-45ab-a47b-fe29125cbf6f	update	2026-03-01 12:46:37.998242	Permite editar extension_cores	extension_core	2026-03-01 12:46:37.998242
89add6b8-0bc8-4e12-8f87-d226280c8e93	destroy	2026-03-01 12:46:38.000505	Permite remover extension_cores	extension_core	2026-03-01 12:46:38.000505
75c0939f-a0d3-46f2-86d1-ad9368c6ebe9	read	2026-03-01 12:46:38.002798	Permite visualizar contacts	contact	2026-03-01 12:46:38.002798
49ca6da7-2fe4-445c-9f21-37ab9fe6b536	create	2026-03-01 12:46:38.004974	Permite criar contacts	contact	2026-03-01 12:46:38.004974
ecfdeda6-893d-4111-ac84-6c92aee0580a	update	2026-03-01 12:46:38.007282	Permite editar contacts	contact	2026-03-01 12:46:38.007282
f95b6010-d615-4a0a-8039-1f079d2e42ca	destroy	2026-03-01 12:46:38.009608	Permite remover contacts	contact	2026-03-01 12:46:38.009608
98f89768-492b-47fd-8ac1-b7f494dfaa63	read	2026-03-01 12:46:38.01185	Permite visualizar companies	company	2026-03-01 12:46:38.01185
280f5d8f-1d64-4686-8ece-926277373dbd	create	2026-03-01 12:46:38.014113	Permite criar companies	company	2026-03-01 12:46:38.014113
f59fd897-ba79-4529-834b-dca80b828968	update	2026-03-01 12:46:38.016314	Permite editar companies	company	2026-03-01 12:46:38.016314
9da96cc4-f4d8-4f4b-8d50-70ee74d79974	destroy	2026-03-01 12:46:38.018656	Permite remover companies	company	2026-03-01 12:46:38.018656
84f859d8-43c7-4087-9bc2-78429b994169	read	2026-03-01 12:46:38.02087	Permite visualizar carousel_frames	carousel_frame	2026-03-01 12:46:38.02087
7715e0db-728a-4c91-86ef-bfe4d0cce57f	create	2026-03-01 12:46:38.023212	Permite criar carousel_frames	carousel_frame	2026-03-01 12:46:38.023212
baa3d8a8-76f2-49ca-b5f9-37e02666a634	update	2026-03-01 12:46:38.025498	Permite editar carousel_frames	carousel_frame	2026-03-01 12:46:38.025498
c18f4384-160b-426f-903b-5b629c2b9803	destroy	2026-03-01 12:46:38.027731	Permite remover carousel_frames	carousel_frame	2026-03-01 12:46:38.027731
ca4b6383-5b72-4a80-91b0-596b8bb89c06	read	2026-03-01 12:46:38.030039	Permite visualizar cards	card	2026-03-01 12:46:38.030039
3bede7fd-1fe3-489e-a558-976704c6bcaa	create	2026-03-01 12:46:38.032269	Permite criar cards	card	2026-03-01 12:46:38.032269
7b4e4888-40aa-469c-ac48-647b788b62b0	update	2026-03-01 12:46:38.034547	Permite editar cards	card	2026-03-01 12:46:38.034547
15e636b1-bc2e-43d4-85af-c018e601c077	destroy	2026-03-01 12:46:38.036826	Permite remover cards	card	2026-03-01 12:46:38.036826
ba1a3e09-6491-4d55-872c-4bd7a42286f6	read	2026-03-01 12:46:38.039073	Permite visualizar addresses	address	2026-03-01 12:46:38.039073
3a5934b9-bc65-4a2b-bdaf-5c091e54713b	create	2026-03-01 12:46:38.041418	Permite criar addresses	address	2026-03-01 12:46:38.041418
7bee675d-4e47-4d84-9b02-b64f348329b8	update	2026-03-01 12:46:38.04361	Permite editar addresses	address	2026-03-01 12:46:38.04361
9875cdca-e925-4bdc-b885-d79487dd16c5	destroy	2026-03-01 12:46:38.045854	Permite remover addresses	address	2026-03-01 12:46:38.045854
4b549141-8dea-4c53-aa29-061a0ff94c8c	read	2026-03-01 12:46:38.048227	Permite visualizar social_media_profiles	social_media_profile	2026-03-01 12:46:38.048227
c5fbcd5b-d03e-40f9-85e4-8f29be27bf75	create	2026-03-01 12:46:38.050452	Permite criar social_media_profiles	social_media_profile	2026-03-01 12:46:38.050452
ce576331-15d7-4a00-99ba-be22aae71255	update	2026-03-01 12:46:38.052806	Permite editar social_media_profiles	social_media_profile	2026-03-01 12:46:38.052806
d26e6037-aa53-4ee0-b28f-fbde20b8c469	destroy	2026-03-01 12:46:38.055075	Permite remover social_media_profiles	social_media_profile	2026-03-01 12:46:38.055075
ad5ee08a-f6df-4e08-a1cc-a747d795e6b6	read	2026-03-01 12:46:38.057293	Permite visualizar page_views	page_view	2026-03-01 12:46:38.057293
b552171c-4ee2-4745-8bad-7e1bd900789d	create	2026-03-01 12:46:38.059604	Permite criar page_views	page_view	2026-03-01 12:46:38.059604
b9d5a322-2578-4c6f-9233-b07c260e0c82	update	2026-03-01 12:46:38.061824	Permite editar page_views	page_view	2026-03-01 12:46:38.061824
c359feee-7bda-439f-b570-5810f85818ce	destroy	2026-03-01 12:46:38.064015	Permite remover page_views	page_view	2026-03-01 12:46:38.064015
008818b5-9962-4687-835e-97736b90f841	manage	2026-03-01 12:46:38.06633	Permite alterar a ordem dos registros	ordering	2026-03-01 12:46:38.06633
65348af8-19f0-440c-a77b-0656daf88029	manage	2026-03-01 12:46:38.068615	Permite limpar o cache do sistema	cache	2026-03-01 12:46:38.068615
6f0c995c-1725-4ca0-b068-4097b78a16e7	read	2026-03-01 12:46:38.070956	Permite visualizar logs de auditoria e histórico de alterações	audit	2026-03-01 12:46:38.070956
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.projects (id, active, created_at, description, details, extension_core_id, featured, name, updated_at) FROM stdin;
d1baee51-07b6-4b0d-9840-cf132a9bd0cb	t	2026-03-10 13:49:19.348558	Projeto de comunicação que produz conteúdos informativos sobre temas jurídicos atuais para redes sociais e plataformas digitais da empresa júnior	Divulgação de informação jurídica nas redes sociais.	d453df83-0440-449c-b9f6-b26aa49b941c	t	Direito em foco 	2026-03-11 20:28:54.582705
a0ba2621-4109-4a4c-9895-352c48708a08	t	2026-03-11 20:29:45.3426	Projeto responsável pela divulgação de projetos, eventos e atividades da empresa júnior.	Fortalecimento da presença institucional e digital.	d453df83-0440-449c-b9f6-b26aa49b941c	f	Comunicação Institucional EJ	2026-03-11 20:29:45.3426
b925d10f-abe3-4839-97a2-e0fa0ccca6ed	t	2026-03-11 20:30:37.870443	Projeto que orienta microempreendedores sobre formalização de negócios, elaboração de contratos básicos e aspectos jurídicos da atividade empresarial.	Orientação jurídica a empreendedores e apoio na formalização de novos negócios.	4419d32a-0923-4502-b8cb-12b1eaee1030	t	Formaliza Direito	2026-03-11 20:30:52.442086
1fac11a8-5998-4c98-bad1-3d8a3e367896	t	2026-03-11 21:34:08.19032	Projeto que leva noções básicas de direito e cidadania para estudantes do ensino médio.	Promoção da educação jurídica e conscientização sobre direitos.	b9060c29-723a-4cb2-8465-1a5e7105dfeb	t	Direito na Escola	2026-03-11 21:34:08.19032
2b451289-2d97-48bb-a2a6-b9d60328f11a	t	2026-03-11 21:34:41.67599	Projeto que realiza oficinas e palestras sobre direitos do consumidor, trabalho e cidadania.	Ampliação do acesso da comunidade à informação jurídica.	b9060c29-723a-4cb2-8465-1a5e7105dfeb	f	Educação Jurídica para a Comunidade	2026-03-11 21:34:41.67599
0d26c63f-1406-4a79-b5a7-93bd54f2253e	t	2026-03-06 00:18:34.859576	Projeto que fornece orientação jurídica preventiva para empreendedores sobre contratos, direitos do consumidor e responsabilidades legais.	Apoio jurídico consultivo e disseminação de boas práticas empresariais.	4419d32a-0923-4502-b8cb-12b1eaee1030	f	Empreendedor Legal	2026-03-11 21:37:40.259488
cd86ccff-377a-4dc4-970d-369f973b9973	f	2026-03-11 21:36:27.251443	Projeto que promove palestras, grupos de estudo e capacitações para estudantes de direito.	Fortalecimento da formação acadêmica e profissional dos estudantes.	b9060c29-723a-4cb2-8465-1a5e7105dfeb	f	Preparação Acadêmica em Direito	2026-03-11 21:49:23.455816
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.role_permissions (id, created_at, permission_id, role_id, updated_at) FROM stdin;
b8c487d5-db1d-4dfd-81d6-070dc8bfb608	2026-03-01 12:46:38.083911	d5753ab0-a45b-454c-bb13-5366e5e8d55d	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.083911
25f1a173-7933-4caa-af37-a923444ba164	2026-03-01 12:46:38.086708	24d52e89-247c-4690-a018-46e836fd8f23	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.086708
a7e8c1b7-89c3-40dd-b136-7eb03ab9fa97	2026-03-01 12:46:38.088932	e4fac83a-14eb-43f2-adcd-ea882235b348	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.088932
ff2d0eb1-ae2d-4840-a411-118bc25b68ad	2026-03-01 12:46:38.091331	51227b6a-0d78-4fda-af51-cb4c75c8c509	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.091331
70eb57d3-8123-47e4-8d23-8c0b2feb9cd0	2026-03-01 12:46:38.0935	cdd59f12-ff36-4575-b060-bd74b7528e23	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.0935
7be91477-4547-45c2-b9d1-0122160ab482	2026-03-01 12:46:38.095605	a2565feb-a158-443d-be75-f1fc393dae40	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.095605
43122444-5a77-499c-b475-483f8cfe7e3a	2026-03-01 12:46:38.126256	de1cd953-433a-43a7-b597-7d7b72dffbe7	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.126256
107f0b3b-0d9f-4b73-9cb1-f0a3a60efed3	2026-03-01 12:46:38.129783	4d8af205-ad2c-4edd-80a7-0a2e4294f54a	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.129783
542b4209-4367-4565-8e5d-0b09677e0fb0	2026-03-01 12:46:38.132148	8d3249ea-e22f-4a72-9ef5-bdd364356b0f	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.132148
788e50de-da33-4105-bb6f-6c125ba05307	2026-03-01 12:46:38.134392	8bd401b5-9395-4b03-a437-5b1eebb1ab0e	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.134392
85a7d624-f24c-47b3-b5c7-7b9c363c830a	2026-03-01 12:46:38.137872	75c0939f-a0d3-46f2-86d1-ad9368c6ebe9	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.137872
e201b331-4880-424c-938e-138b4d98dbfc	2026-03-01 12:46:38.139851	98f89768-492b-47fd-8ac1-b7f494dfaa63	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.139851
effb2b18-dd7f-485b-96a2-3d92e6ff7b23	2026-03-01 12:46:38.141801	84f859d8-43c7-4087-9bc2-78429b994169	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.141801
d6b47cea-fa32-4600-9a12-dbfdee9ba3fa	2026-03-01 12:46:38.14458	ca4b6383-5b72-4a80-91b0-596b8bb89c06	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.14458
302d0205-842e-4a6a-9caa-0d55d0a580fd	2026-03-01 12:46:38.146589	ba1a3e09-6491-4d55-872c-4bd7a42286f6	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.146589
c12ccc74-48f0-406f-b2ed-1eb9bd4ea711	2026-03-01 12:46:38.148456	4b549141-8dea-4c53-aa29-061a0ff94c8c	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.148456
cb79cd47-4ea3-41ab-809f-6962da3f96c8	2026-03-01 12:46:38.15037	ad5ee08a-f6df-4e08-a1cc-a747d795e6b6	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.15037
c0bf08fc-abce-4036-86cf-6877c27ee2ff	2026-03-01 12:46:38.153073	6f0c995c-1725-4ca0-b068-4097b78a16e7	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.153073
f2ad2215-9c68-4444-8c10-65c8a4981941	2026-03-01 12:46:38.157244	d5753ab0-a45b-454c-bb13-5366e5e8d55d	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.157244
15145e86-9d39-4826-8660-d90b2622a0eb	2026-03-01 12:46:38.159215	60852a8a-7bfa-437e-bcb7-f4d8e73243d4	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.159215
a6379fef-3562-4b9f-8ef3-6fd0585914f1	2026-03-01 12:46:38.16221	9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.16221
02466f03-e5d7-4677-9d69-3968bca53832	2026-03-01 12:46:38.164244	b72caae2-5a08-4aea-8656-9e6b63a99290	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.164244
0d158c9e-8f28-4038-8e61-da1ff2d762cb	2026-03-01 12:46:38.166207	24d52e89-247c-4690-a018-46e836fd8f23	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.166207
ff2fbdf4-41a9-4f7c-a685-d191dc1a8c51	2026-03-01 12:46:38.168949	3fd7a6f9-f101-4722-ba86-b0062a36211b	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.168949
ed5bd27d-a498-47b1-bf25-343f316d7eb6	2026-03-01 12:46:38.171078	7370875d-48b3-45ad-8329-09653f09cc60	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.171078
4d168a56-351e-4042-8879-29d4e0027893	2026-03-01 12:46:38.173006	c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.173006
a013dd9a-950a-442a-9267-9c4dc76558e5	2026-03-01 12:46:38.174957	e4fac83a-14eb-43f2-adcd-ea882235b348	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.174957
02fd3293-5059-49fb-9597-055b81810160	2026-03-01 12:46:38.177685	925fb8dc-72ea-493d-8839-2279f2e136a2	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.177685
52065def-8b6b-4bdd-924c-2af5a95b868b	2026-03-01 12:46:38.179816	66ec275c-a758-401a-8859-24d4ad357f5d	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.179816
0c902d8d-1235-42a0-8eee-bba9623bc506	2026-03-01 12:46:38.181707	1742a59d-df61-48fe-ac25-94d470289c65	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.181707
0cccf3b6-d371-4526-879c-7b6efdbb38cf	2026-03-01 12:46:38.183598	51227b6a-0d78-4fda-af51-cb4c75c8c509	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.183598
3e387d41-87d8-4034-8c70-bc41996ecf98	2026-03-01 12:46:38.186454	eac020e5-db47-4614-92cf-ed2139438067	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.186454
eed071a0-e90f-4460-94f6-e23248f39a42	2026-03-01 12:46:38.18834	28d7a980-2052-45f7-a569-5f952ea3d30f	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.18834
a587b688-ea3e-454d-a1a0-7069045f60cb	2026-03-01 12:46:38.190248	c931414f-5870-4272-925d-5302000509ca	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.190248
c3bbc1ef-165d-41a5-9609-4a7b187a654d	2026-03-01 12:46:38.192389	cdd59f12-ff36-4575-b060-bd74b7528e23	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.192389
eeecf731-b4b4-4fcd-b058-14ed8763c82e	2026-03-01 12:46:38.19483	d052e09b-1d24-41c7-862f-5a92096d4d46	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.19483
e3941e19-f69f-40ca-82de-433df270cdb1	2026-03-01 12:46:38.196786	d84441b4-0714-4e79-a58c-6de2bd39ad72	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.196786
80137a12-b62c-4e49-b12f-c9406c421326	2026-03-01 12:46:38.198687	f8924245-16d2-48b5-9662-ef094173696a	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.198687
9ef9191d-e9b1-44b0-85e8-8dad6ff28f48	2026-03-01 12:46:38.200684	a2565feb-a158-443d-be75-f1fc393dae40	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.200684
df2b061f-122a-46d3-9baa-617d4155211b	2026-03-01 12:46:38.202958	42767b8e-d2b3-43f6-915c-f4efc0e8a9be	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.202958
5ba7921c-41a2-4c05-ba76-508e2346030d	2026-03-01 12:46:38.204952	97b06223-5a39-4916-aa80-b634cd690ed4	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.204952
bcc427e6-d15b-4923-9049-77011abddb46	2026-03-01 12:46:38.206933	c9b0d998-b3b9-4e2c-be37-bfb513e1de33	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.206933
67e6ad82-7fdc-4bfe-b9f3-4d6b09d347d2	2026-03-01 12:46:38.208837	de1cd953-433a-43a7-b597-7d7b72dffbe7	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.208837
093b150f-9d9e-4cc8-8e3a-327d29a08bea	2026-03-01 12:46:38.211037	edd07c92-118f-4551-80ba-00cf9890f358	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.211037
253ab7d7-0601-45b5-8457-5cf6ea5c1126	2026-03-01 12:46:38.212924	d5484571-a46f-4262-a6ab-26e945ff762e	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.212924
78448cdc-1a57-46d0-ba3f-4bd23c91860d	2026-03-01 12:46:38.214819	24b00169-fc7c-456e-b1a0-c03942a48519	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.214819
0d9d70b3-96f5-4447-b777-dd7455c282ce	2026-03-01 12:46:38.216726	4d8af205-ad2c-4edd-80a7-0a2e4294f54a	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.216726
35baaeb1-407c-4b9d-a146-986c823989e8	2026-03-01 12:46:38.218754	2afdfcc1-46bf-4501-b111-932e3c1692ed	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.218754
a5024796-2199-4ebe-8b94-aad1224fa093	2026-03-01 12:46:38.220634	641209c4-4f6e-4ff3-b638-c9043ad8bdd6	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.220634
1fd40841-1075-4b54-a811-d60ec3fded3f	2026-03-01 12:46:38.222548	66eebba6-26d7-43d1-99ec-bc1a6c6e0290	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.222548
05c822c2-7bad-4412-ac4c-48b7572f0d08	2026-03-01 12:46:38.224436	8d3249ea-e22f-4a72-9ef5-bdd364356b0f	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.224436
8bbad62e-bd08-4b15-94ab-5a3151a769c0	2026-03-01 12:46:38.226552	47aae2de-f0fb-479c-9a1c-ed146db1103f	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.226552
c97a342f-cab8-45ab-adc4-24d502f76d3e	2026-03-01 12:46:38.228437	1fd15150-7e9f-405e-b8fc-75e8799a384b	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.228437
b7357251-9356-44fe-aef8-a476431cb48b	2026-03-01 12:46:38.230356	4cbe598d-ca89-4e97-a956-49c7c4844db8	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.230356
06112eb5-efcb-484e-8154-1be4d2a22b89	2026-03-01 12:46:38.232313	8bd401b5-9395-4b03-a437-5b1eebb1ab0e	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.232313
e1383fb6-22e0-4c64-b3a2-0049bb7c3eb5	2026-03-01 12:46:38.234613	c9f56b56-6523-491a-9d49-0622cd7c45de	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.234613
4e5b80c1-7efa-4cba-98aa-7d5fb0d562ee	2026-03-01 12:46:38.236542	21b7da72-980a-45ab-a47b-fe29125cbf6f	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.236542
ef86aea7-b62e-4fd5-958b-36483faa7f8b	2026-03-01 12:46:38.238473	89add6b8-0bc8-4e12-8f87-d226280c8e93	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.238473
adc77384-c927-49fc-ac23-8effe37cfe2e	2026-03-01 12:46:38.240388	75c0939f-a0d3-46f2-86d1-ad9368c6ebe9	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.240388
8878aefc-9b2a-474f-a3d7-5b47c9701885	2026-03-01 12:46:38.242603	49ca6da7-2fe4-445c-9f21-37ab9fe6b536	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.242603
14e632dd-1a64-44be-995e-96f9347a0ab8	2026-03-01 12:46:38.244532	ecfdeda6-893d-4111-ac84-6c92aee0580a	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.244532
9e8ad444-45f2-4c58-87c7-1454a4d46304	2026-03-01 12:46:38.246439	f95b6010-d615-4a0a-8039-1f079d2e42ca	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.246439
18bb9b76-5acd-43ac-94b4-45d2fd9741f8	2026-03-01 12:46:38.24856	98f89768-492b-47fd-8ac1-b7f494dfaa63	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.24856
b44de54d-8543-45c9-b03b-ebc69dfae701	2026-03-01 12:46:38.250476	280f5d8f-1d64-4686-8ece-926277373dbd	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.250476
c9663c55-6777-4467-97bc-c4d41d1794bf	2026-03-01 12:46:38.252399	f59fd897-ba79-4529-834b-dca80b828968	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.252399
2b50cf0b-dab2-465a-ad7e-a99ec7472ee6	2026-03-01 12:46:38.254317	9da96cc4-f4d8-4f4b-8d50-70ee74d79974	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.254317
a94379e0-8070-46d1-b68c-26dccd974dcb	2026-03-01 12:46:38.256291	84f859d8-43c7-4087-9bc2-78429b994169	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.256291
02131ccb-79d5-46cf-b27d-94b67f31ded4	2026-03-01 12:46:38.258207	7715e0db-728a-4c91-86ef-bfe4d0cce57f	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.258207
fd909a5d-d7ec-40d1-88fc-0c5520aa390b	2026-03-01 12:46:38.260285	baa3d8a8-76f2-49ca-b5f9-37e02666a634	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.260285
b9d85149-cf7b-4c68-b796-a2ca5d7dda04	2026-03-01 12:46:38.26222	c18f4384-160b-426f-903b-5b629c2b9803	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.26222
6f86cb64-c36c-4dfd-b540-c590b4448bdb	2026-03-01 12:46:38.264244	ca4b6383-5b72-4a80-91b0-596b8bb89c06	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.264244
53967388-181b-4337-81b6-1ef8cbb452cd	2026-03-01 12:46:38.266155	3bede7fd-1fe3-489e-a558-976704c6bcaa	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.266155
f63bdcb2-9ca9-40de-ac83-da81fbd5b2da	2026-03-01 12:46:38.268069	7b4e4888-40aa-469c-ac48-647b788b62b0	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.268069
3787d99b-80c5-4b37-ae6c-8de838a88f2c	2026-03-01 12:46:38.270162	15e636b1-bc2e-43d4-85af-c018e601c077	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.270162
3eb5596d-7a68-45a7-a434-db2b39b732c8	2026-03-01 12:46:38.272088	ba1a3e09-6491-4d55-872c-4bd7a42286f6	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.272088
9be8fbfd-9883-4ef6-9058-a4c5a9771544	2026-03-01 12:46:38.27403	3a5934b9-bc65-4a2b-bdaf-5c091e54713b	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.27403
7e5c51ff-c1fd-47b1-819e-7714037f0ebc	2026-03-01 12:46:38.275944	7bee675d-4e47-4d84-9b02-b64f348329b8	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.275944
e67e4bd3-4130-4e05-9c95-627f804d2a50	2026-03-01 12:46:38.278073	9875cdca-e925-4bdc-b885-d79487dd16c5	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.278073
038abc6c-3fa8-40e4-b157-8c0b81ca5760	2026-03-01 12:46:38.279947	4b549141-8dea-4c53-aa29-061a0ff94c8c	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.279947
1217d2f5-20bf-4859-9da5-380011569858	2026-03-01 12:46:38.282105	c5fbcd5b-d03e-40f9-85e4-8f29be27bf75	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.282105
598404e1-9ec9-45a8-be43-1b979e770b6b	2026-03-01 12:46:38.284552	ce576331-15d7-4a00-99ba-be22aae71255	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.284552
de5cc257-bef6-4e61-bdba-2cb2c6177591	2026-03-01 12:46:38.286659	d26e6037-aa53-4ee0-b28f-fbde20b8c469	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.286659
ec4f6334-beb5-41f3-a8cf-bf61bfc01843	2026-03-01 12:46:38.28884	ad5ee08a-f6df-4e08-a1cc-a747d795e6b6	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.28884
beb7dff9-e731-4504-9533-d93c9b5ffdcb	2026-03-01 12:46:38.290848	b552171c-4ee2-4745-8bad-7e1bd900789d	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.290848
6ef0700f-7840-42bb-869a-c04d27876deb	2026-03-01 12:46:38.293771	b9d5a322-2578-4c6f-9233-b07c260e0c82	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.293771
f3a733bb-2380-4103-b023-194c6af639d8	2026-03-01 12:46:38.29594	c359feee-7bda-439f-b570-5810f85818ce	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.29594
882f2a77-81ea-4dfd-8224-23426a76da13	2026-03-01 12:46:38.297987	6f0c995c-1725-4ca0-b068-4097b78a16e7	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:38.297987
b8c18a06-cd6b-4aba-8af9-1495a0ed9db3	2026-03-01 12:46:38.302024	d5753ab0-a45b-454c-bb13-5366e5e8d55d	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.302024
4e62f8eb-01e7-4cce-8de0-ce152d3ef683	2026-03-01 12:46:38.304168	60852a8a-7bfa-437e-bcb7-f4d8e73243d4	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.304168
7b917b20-e1f6-4ea3-ac2b-33dc32074c0c	2026-03-01 12:46:38.306291	9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.306291
fe814e67-34b9-4905-95d2-911b26ad9ea9	2026-03-01 12:46:38.308253	b72caae2-5a08-4aea-8656-9e6b63a99290	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.308253
2eb1eafc-1913-470d-81a1-c50fb8cdb531	2026-03-01 12:46:38.31026	24d52e89-247c-4690-a018-46e836fd8f23	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.31026
42d3fa1f-5fe5-4810-b859-47297ea94b77	2026-03-01 12:46:38.312383	3fd7a6f9-f101-4722-ba86-b0062a36211b	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.312383
17d492a1-2658-4ff5-b1f3-6d7c2e9a3e35	2026-03-01 12:46:38.314644	7370875d-48b3-45ad-8329-09653f09cc60	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.314644
32deeef2-e5ac-4ab0-8f17-f532725c5073	2026-03-01 12:46:38.316654	c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.316654
2c20cbe4-5b97-46e1-bed3-58944f67bc0a	2026-03-01 12:46:38.318627	e4fac83a-14eb-43f2-adcd-ea882235b348	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.318627
87047464-11d1-47d0-8788-0201d54a27d2	2026-03-01 12:46:38.320626	925fb8dc-72ea-493d-8839-2279f2e136a2	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.320626
562d3756-790d-432a-884d-f2a832548e99	2026-03-01 12:46:38.322528	66ec275c-a758-401a-8859-24d4ad357f5d	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.322528
9c787b01-29ef-4689-b31c-a50ca37ff457	2026-03-01 12:46:38.324665	1742a59d-df61-48fe-ac25-94d470289c65	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.324665
9266e853-eb2a-4917-bc8c-d257fd55695a	2026-03-01 12:46:38.326562	51227b6a-0d78-4fda-af51-cb4c75c8c509	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.326562
3c0307a0-0114-4318-b37e-2f91a8bc95b7	2026-03-01 12:46:38.328482	eac020e5-db47-4614-92cf-ed2139438067	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.328482
d0d221a6-161e-4d5d-b32e-9a045c88361b	2026-03-01 12:46:38.330675	28d7a980-2052-45f7-a569-5f952ea3d30f	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.330675
a992d6e6-2b31-4ead-acd0-01314a4abe62	2026-03-01 12:46:38.332629	c931414f-5870-4272-925d-5302000509ca	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.332629
ff207c52-ce59-46bf-9a87-638af4509619	2026-03-01 12:46:38.334685	cdd59f12-ff36-4575-b060-bd74b7528e23	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.334685
e7e87c8d-8bc8-485e-b120-5ceef0dac912	2026-03-01 12:46:38.336575	d052e09b-1d24-41c7-862f-5a92096d4d46	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.336575
dd6196b1-b819-4002-bf79-13d1c18dc5ec	2026-03-01 12:46:38.338454	d84441b4-0714-4e79-a58c-6de2bd39ad72	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.338454
22e10f24-abdc-4af0-a020-8ef87192eb72	2026-03-01 12:46:38.340351	f8924245-16d2-48b5-9662-ef094173696a	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.340351
e77dfb12-5333-4df9-acb9-3350b6ef3d01	2026-03-01 12:46:38.342233	a2565feb-a158-443d-be75-f1fc393dae40	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.342233
216c5404-4d86-409b-a33a-9bb9419bdde5	2026-03-01 12:46:38.344285	42767b8e-d2b3-43f6-915c-f4efc0e8a9be	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.344285
bbc2631e-609c-405a-bb0c-c9346cd2b25e	2026-03-01 12:46:38.346218	97b06223-5a39-4916-aa80-b634cd690ed4	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.346218
dbf69009-b33e-4787-895c-fd87083d88a2	2026-03-01 12:46:38.348125	c9b0d998-b3b9-4e2c-be37-bfb513e1de33	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.348125
2357a78b-1e40-4b6d-9974-8c39722a1286	2026-03-01 12:46:38.350081	de1cd953-433a-43a7-b597-7d7b72dffbe7	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.350081
9df3836c-8f7a-4204-83ae-e4ec44c3cb51	2026-03-01 12:46:38.352086	edd07c92-118f-4551-80ba-00cf9890f358	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.352086
39b3b5ba-3d19-4e17-b5ec-bdea287f1f89	2026-03-01 12:46:38.354206	d5484571-a46f-4262-a6ab-26e945ff762e	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.354206
45ecf818-a1ef-4359-883b-df95a2a00bba	2026-03-01 12:46:38.356102	24b00169-fc7c-456e-b1a0-c03942a48519	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.356102
a9dab2e9-58ed-43d4-8aca-524d98c50a8d	2026-03-01 12:46:38.357991	4d8af205-ad2c-4edd-80a7-0a2e4294f54a	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.357991
c9639d10-9a52-4f39-869c-d479474d9db5	2026-03-01 12:46:38.359884	2afdfcc1-46bf-4501-b111-932e3c1692ed	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.359884
ca463bd5-3b83-4c81-b60c-27f34bb04dd5	2026-03-01 12:46:38.361838	641209c4-4f6e-4ff3-b638-c9043ad8bdd6	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.361838
33eb6759-e4dc-429c-8aff-e6ecd9f8c086	2026-03-01 12:46:38.363901	66eebba6-26d7-43d1-99ec-bc1a6c6e0290	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.363901
c0406262-392f-47de-90a3-33d3d14bebf2	2026-03-01 12:46:38.365783	8d3249ea-e22f-4a72-9ef5-bdd364356b0f	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.365783
523d2bcc-3512-4a1a-bbb0-8ccddcd30c82	2026-03-01 12:46:38.367815	47aae2de-f0fb-479c-9a1c-ed146db1103f	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.367815
0f5db6e0-06cb-4207-83f3-fdfe0213aaca	2026-03-01 12:46:38.36994	1fd15150-7e9f-405e-b8fc-75e8799a384b	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.36994
e9f58266-3ad3-4c97-a000-c878820534e7	2026-03-01 12:46:38.372119	4cbe598d-ca89-4e97-a956-49c7c4844db8	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.372119
d42a2701-5435-4137-b2ea-da038224832b	2026-03-01 12:46:38.374553	8bd401b5-9395-4b03-a437-5b1eebb1ab0e	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.374553
87f92f6c-a6be-488c-96c1-3130b5c3faab	2026-03-01 12:46:38.377009	c9f56b56-6523-491a-9d49-0622cd7c45de	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.377009
44cfd30f-e648-4b1c-aff0-5ff420e23eb3	2026-03-01 12:46:38.37938	21b7da72-980a-45ab-a47b-fe29125cbf6f	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.37938
c6c2af62-231f-4277-ada9-3d79ce6af6d7	2026-03-01 12:46:38.381768	89add6b8-0bc8-4e12-8f87-d226280c8e93	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.381768
8e19a589-7c54-4eef-9d3a-c1c515a75b11	2026-03-01 12:46:38.384128	75c0939f-a0d3-46f2-86d1-ad9368c6ebe9	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.384128
9969014d-d732-4f71-ad94-0a10c0965316	2026-03-01 12:46:38.387058	49ca6da7-2fe4-445c-9f21-37ab9fe6b536	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.387058
fa5d0a91-c970-4df6-b1aa-90eca641fcc9	2026-03-01 12:46:38.38983	ecfdeda6-893d-4111-ac84-6c92aee0580a	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.38983
6b44ec99-f004-4831-82fb-1af0a6dd4e35	2026-03-01 12:46:38.392334	f95b6010-d615-4a0a-8039-1f079d2e42ca	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.392334
0407ddf9-349c-4b56-bbc6-d7e0c19baa07	2026-03-01 12:46:38.395018	98f89768-492b-47fd-8ac1-b7f494dfaa63	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.395018
1cf2275c-0c1e-4e79-8401-e27ab98f6192	2026-03-01 12:46:38.397553	280f5d8f-1d64-4686-8ece-926277373dbd	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.397553
b38e06db-9bc9-450e-82c3-1e3a917e071b	2026-03-01 12:46:38.400139	f59fd897-ba79-4529-834b-dca80b828968	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.400139
0328dc49-dc92-4e53-bcea-6e24a1edf6f1	2026-03-01 12:46:38.402715	9da96cc4-f4d8-4f4b-8d50-70ee74d79974	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.402715
c727f3d1-5e70-4d39-9ed6-a0b32662f042	2026-03-01 12:46:38.405261	84f859d8-43c7-4087-9bc2-78429b994169	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.405261
874980e3-4578-4676-af7f-151cc4926f56	2026-03-01 12:46:38.407868	7715e0db-728a-4c91-86ef-bfe4d0cce57f	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.407868
cb58ebde-dac9-4537-a058-6fc3d5a3b3eb	2026-03-01 12:46:38.410335	baa3d8a8-76f2-49ca-b5f9-37e02666a634	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.410335
68d3dca1-b807-4c8e-a65c-7a4dc5225b48	2026-03-01 12:46:38.412954	c18f4384-160b-426f-903b-5b629c2b9803	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.412954
083872d7-e573-41d0-959e-dbea43317858	2026-03-01 12:46:38.415474	ca4b6383-5b72-4a80-91b0-596b8bb89c06	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.415474
d009a254-1714-4c3a-af38-1db4ae8e23b0	2026-03-01 12:46:38.418018	3bede7fd-1fe3-489e-a558-976704c6bcaa	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.418018
55a248de-f733-4708-8875-5f5fa67ff65e	2026-03-01 12:46:38.420549	7b4e4888-40aa-469c-ac48-647b788b62b0	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.420549
00d47b94-1891-48ce-9740-0979f7a4f45b	2026-03-01 12:46:38.422875	15e636b1-bc2e-43d4-85af-c018e601c077	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.422875
c72b3464-b362-4f72-9818-731e29d82a70	2026-03-01 12:46:38.425145	ba1a3e09-6491-4d55-872c-4bd7a42286f6	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.425145
15d4a380-83bb-4f34-85b1-18bf05c4aa76	2026-03-01 12:46:38.427323	3a5934b9-bc65-4a2b-bdaf-5c091e54713b	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.427323
58c54450-83e5-464f-a328-2f11378bb8aa	2026-03-01 12:46:38.429598	7bee675d-4e47-4d84-9b02-b64f348329b8	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.429598
a146a9b1-6f55-412f-b951-fca855ec151b	2026-03-01 12:46:38.431908	9875cdca-e925-4bdc-b885-d79487dd16c5	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.431908
b441a89e-d9e7-46bc-b60a-ea090cccaf53	2026-03-01 12:46:38.43425	4b549141-8dea-4c53-aa29-061a0ff94c8c	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.43425
f9d42a6c-c9c6-4df8-8fe1-1ae80ca773b0	2026-03-01 12:46:38.436588	c5fbcd5b-d03e-40f9-85e4-8f29be27bf75	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.436588
ba497c0d-d2b4-4b84-bdf0-0ee15a1b5174	2026-03-01 12:46:38.438838	ce576331-15d7-4a00-99ba-be22aae71255	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.438838
0f083938-fc5e-422b-972a-7f783a5d56c2	2026-03-01 12:46:38.441105	d26e6037-aa53-4ee0-b28f-fbde20b8c469	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.441105
6bbecc01-319e-40d8-afae-e7d77f420ff3	2026-03-01 12:46:38.443416	ad5ee08a-f6df-4e08-a1cc-a747d795e6b6	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.443416
724997b6-9fb7-4e57-94e4-4c6d19bc0b57	2026-03-01 12:46:38.445902	b552171c-4ee2-4745-8bad-7e1bd900789d	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.445902
25415852-a233-4a93-9c2f-abac790f9898	2026-03-01 12:46:38.448332	b9d5a322-2578-4c6f-9233-b07c260e0c82	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.448332
29906bb8-9606-4b5b-8b99-8e0ed81372ff	2026-03-01 12:46:38.45067	c359feee-7bda-439f-b570-5810f85818ce	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.45067
4f1308d0-c24d-436a-8a5e-d2e4379a74c4	2026-03-01 12:46:38.453099	008818b5-9962-4687-835e-97736b90f841	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.453099
9e7ac072-9cf9-4500-bf2b-d2c0bc318e6b	2026-03-01 12:46:38.455404	65348af8-19f0-440c-a77b-0656daf88029	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.455404
b0670a9c-a338-4667-9e30-f9cc43c4fdac	2026-03-01 12:46:38.457729	6f0c995c-1725-4ca0-b068-4097b78a16e7	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:38.457729
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.roles (id, created_at, description, name, updated_at) FROM stdin;
4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:37.885328	Administrador do sistema com acesso total	admin	2026-03-01 12:46:37.885328
dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:37.898509	Pode criar e editar conteúdos	editor	2026-03-01 12:46:37.898509
0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:37.901889	Pode apenas visualizar	viewer	2026-03-01 12:46:37.901889
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.schema_migrations (version) FROM stdin;
20260226000001
20260226000000
20260212121453
20260212115631
20260207173701
20260201215723
20260201190952
20260201185105
20260201184816
20260131210515
20260125221251
20260125215500
20260125172104
20260124185130
20260124184306
20260123190313
20260121195223
20260115222526
20260115222512
20260115222447
20260115222405
20260113134542
20260113124945
20260108222210
20260108221801
20251212165725
20251212165706
20251211175819
20251211175228
20251211175024
20251211174539
20251209023210
20251209023035
20251209022827
20251209014014
20251115220347
20250205234447
\.


--
-- Data for Name: social_media_profiles; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.social_media_profiles (id, active, company_id, created_at, platform, "position", updated_at, url, username) FROM stdin;
17c27d8c-e0fb-441a-991c-883381d85346	t	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	2026-03-11 20:18:12.580478	Instagram	1	2026-03-11 20:18:12.580478	https://www.instagram.com/apex.ej/	@apex.ej
be511fd9-1157-4076-bed3-b303d61a718a	t	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	2026-03-11 20:24:17.593684	LinkedIn	2	2026-03-11 20:24:17.593684	https://www.linkedin.com/company/apexuern/	apexuern
b8c53dc1-0ccf-434f-b1a5-dceba34af5e2	t	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	2026-03-11 20:21:20.889087	Facebook	3	2026-03-11 20:21:20.889087	https://www.facebook.com/apex.uern/	apex.uern
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.user_roles (id, created_at, role_id, updated_at, user_id) FROM stdin;
435601cf-1669-4eb6-ad86-f9e98b928062	2026-03-01 12:46:38.706267	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.706267	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
df1c54cc-a065-4d83-9a03-680f81c875be	2026-03-01 12:46:38.935914	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:38.935914	d9b32143-6d50-4136-bf17-63411f93133f
76050fc0-0f56-429f-954d-7a2744f65d1a	2026-03-01 12:46:39.158046	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	2026-03-01 12:46:39.158046	4492cecd-c7d1-43ab-9158-fcd936bca661
97a80655-9007-44bd-b40f-4766f938a061	2026-03-01 12:46:39.161174	4c0c190b-4011-4800-8b7f-62ad7355e11e	2026-03-01 12:46:39.161174	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
cf163ae9-01b2-4f7f-9621-db15eddc7509	2026-03-01 12:46:39.165201	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	2026-03-01 12:46:39.165201	d9b32143-6d50-4136-bf17-63411f93133f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.users (id, created_at, email, encrypted_password, jti, remember_created_at, reset_password_sent_at, reset_password_token, updated_at) FROM stdin;
d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02	2026-03-01 12:46:38.695329	apex@example.com	$2a$12$e/DkyWbDpFmtK9786qWMoeDfST5c/NYsYNVM4ehESb/u43N1MeB4u	a9ae8618-484c-4aaf-b4c6-e4aa33f98399	\N	\N	\N	2026-03-01 12:46:38.695329
d9b32143-6d50-4136-bf17-63411f93133f	2026-03-01 12:46:38.932121	editor@example.com	$2a$12$duWiURzKPDyCOkhA.kTMiOyfVS6RaG6dYJoOZsseD7lRmD1ovRGdq	e1c20abf-cdbb-4693-8b4f-eaeed207a91b	\N	\N	\N	2026-03-01 12:46:38.932121
4492cecd-c7d1-43ab-9158-fcd936bca661	2026-03-01 12:46:39.154266	viewer@example.com	$2a$12$3781Z1napavLI4Q8pUMNPe9hRCfMehJeVvWtm8DG3g4TQ3shXelOa	2e2d047e-7246-45fc-8dd1-c8edbc157dc6	\N	\N	\N	2026-03-01 12:46:39.154266
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: vmuser114
--

COPY public.versions (id, created_at, event, item_id, item_type, object, object_changes, whodunnit) FROM stdin;
1	2026-03-01 12:46:37.885328	create	4c0c190b-4011-4800-8b7f-62ad7355e11e	Role	\N	{"id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "name": [null, "admin"], "created_at": [null, "2026-03-01T09:46:37.885-03:00"], "updated_at": [null, "2026-03-01T09:46:37.885-03:00"], "description": [null, "Administrador do sistema com acesso total"]}	\N
2	2026-03-01 12:46:37.898509	create	dc71c4e3-03b6-4594-8fd2-9cccf7d26181	Role	\N	{"id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "name": [null, "editor"], "created_at": [null, "2026-03-01T09:46:37.898-03:00"], "updated_at": [null, "2026-03-01T09:46:37.898-03:00"], "description": [null, "Pode criar e editar conteúdos"]}	\N
3	2026-03-01 12:46:37.901889	create	0c8ae692-cf4e-4c9e-9275-151f1ab2c80e	Role	\N	{"id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "name": [null, "viewer"], "created_at": [null, "2026-03-01T09:46:37.901-03:00"], "updated_at": [null, "2026-03-01T09:46:37.901-03:00"], "description": [null, "Pode apenas visualizar"]}	\N
4	2026-03-01 12:46:37.911584	create	d5753ab0-a45b-454c-bb13-5366e5e8d55d	Permission	\N	{"id": [null, "d5753ab0-a45b-454c-bb13-5366e5e8d55d"], "action": [null, "read"], "resource": [null, "user"], "created_at": [null, "2026-03-01T09:46:37.911-03:00"], "updated_at": [null, "2026-03-01T09:46:37.911-03:00"], "description": [null, "Permite visualizar users"]}	\N
5	2026-03-01 12:46:37.914641	create	60852a8a-7bfa-437e-bcb7-f4d8e73243d4	Permission	\N	{"id": [null, "60852a8a-7bfa-437e-bcb7-f4d8e73243d4"], "action": [null, "create"], "resource": [null, "user"], "created_at": [null, "2026-03-01T09:46:37.914-03:00"], "updated_at": [null, "2026-03-01T09:46:37.914-03:00"], "description": [null, "Permite criar users"]}	\N
6	2026-03-01 12:46:37.916996	create	9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7	Permission	\N	{"id": [null, "9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7"], "action": [null, "update"], "resource": [null, "user"], "created_at": [null, "2026-03-01T09:46:37.916-03:00"], "updated_at": [null, "2026-03-01T09:46:37.916-03:00"], "description": [null, "Permite editar users"]}	\N
7	2026-03-01 12:46:37.919217	create	b72caae2-5a08-4aea-8656-9e6b63a99290	Permission	\N	{"id": [null, "b72caae2-5a08-4aea-8656-9e6b63a99290"], "action": [null, "destroy"], "resource": [null, "user"], "created_at": [null, "2026-03-01T09:46:37.919-03:00"], "updated_at": [null, "2026-03-01T09:46:37.919-03:00"], "description": [null, "Permite remover users"]}	\N
8	2026-03-01 12:46:37.921599	create	24d52e89-247c-4690-a018-46e836fd8f23	Permission	\N	{"id": [null, "24d52e89-247c-4690-a018-46e836fd8f23"], "action": [null, "read"], "resource": [null, "role"], "created_at": [null, "2026-03-01T09:46:37.921-03:00"], "updated_at": [null, "2026-03-01T09:46:37.921-03:00"], "description": [null, "Permite visualizar roles"]}	\N
9	2026-03-01 12:46:37.923811	create	3fd7a6f9-f101-4722-ba86-b0062a36211b	Permission	\N	{"id": [null, "3fd7a6f9-f101-4722-ba86-b0062a36211b"], "action": [null, "create"], "resource": [null, "role"], "created_at": [null, "2026-03-01T09:46:37.923-03:00"], "updated_at": [null, "2026-03-01T09:46:37.923-03:00"], "description": [null, "Permite criar roles"]}	\N
10	2026-03-01 12:46:37.925969	create	7370875d-48b3-45ad-8329-09653f09cc60	Permission	\N	{"id": [null, "7370875d-48b3-45ad-8329-09653f09cc60"], "action": [null, "update"], "resource": [null, "role"], "created_at": [null, "2026-03-01T09:46:37.925-03:00"], "updated_at": [null, "2026-03-01T09:46:37.925-03:00"], "description": [null, "Permite editar roles"]}	\N
11	2026-03-01 12:46:37.928226	create	c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3	Permission	\N	{"id": [null, "c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3"], "action": [null, "destroy"], "resource": [null, "role"], "created_at": [null, "2026-03-01T09:46:37.928-03:00"], "updated_at": [null, "2026-03-01T09:46:37.928-03:00"], "description": [null, "Permite remover roles"]}	\N
12	2026-03-01 12:46:37.930426	create	e4fac83a-14eb-43f2-adcd-ea882235b348	Permission	\N	{"id": [null, "e4fac83a-14eb-43f2-adcd-ea882235b348"], "action": [null, "read"], "resource": [null, "permission"], "created_at": [null, "2026-03-01T09:46:37.930-03:00"], "updated_at": [null, "2026-03-01T09:46:37.930-03:00"], "description": [null, "Permite visualizar permissions"]}	\N
13	2026-03-01 12:46:37.932732	create	925fb8dc-72ea-493d-8839-2279f2e136a2	Permission	\N	{"id": [null, "925fb8dc-72ea-493d-8839-2279f2e136a2"], "action": [null, "create"], "resource": [null, "permission"], "created_at": [null, "2026-03-01T09:46:37.932-03:00"], "updated_at": [null, "2026-03-01T09:46:37.932-03:00"], "description": [null, "Permite criar permissions"]}	\N
14	2026-03-01 12:46:37.934961	create	66ec275c-a758-401a-8859-24d4ad357f5d	Permission	\N	{"id": [null, "66ec275c-a758-401a-8859-24d4ad357f5d"], "action": [null, "update"], "resource": [null, "permission"], "created_at": [null, "2026-03-01T09:46:37.934-03:00"], "updated_at": [null, "2026-03-01T09:46:37.934-03:00"], "description": [null, "Permite editar permissions"]}	\N
15	2026-03-01 12:46:37.937124	create	1742a59d-df61-48fe-ac25-94d470289c65	Permission	\N	{"id": [null, "1742a59d-df61-48fe-ac25-94d470289c65"], "action": [null, "destroy"], "resource": [null, "permission"], "created_at": [null, "2026-03-01T09:46:37.937-03:00"], "updated_at": [null, "2026-03-01T09:46:37.937-03:00"], "description": [null, "Permite remover permissions"]}	\N
16	2026-03-01 12:46:37.939375	create	51227b6a-0d78-4fda-af51-cb4c75c8c509	Permission	\N	{"id": [null, "51227b6a-0d78-4fda-af51-cb4c75c8c509"], "action": [null, "read"], "resource": [null, "member"], "created_at": [null, "2026-03-01T09:46:37.939-03:00"], "updated_at": [null, "2026-03-01T09:46:37.939-03:00"], "description": [null, "Permite visualizar members"]}	\N
17	2026-03-01 12:46:37.941559	create	eac020e5-db47-4614-92cf-ed2139438067	Permission	\N	{"id": [null, "eac020e5-db47-4614-92cf-ed2139438067"], "action": [null, "create"], "resource": [null, "member"], "created_at": [null, "2026-03-01T09:46:37.941-03:00"], "updated_at": [null, "2026-03-01T09:46:37.941-03:00"], "description": [null, "Permite criar members"]}	\N
18	2026-03-01 12:46:37.943817	create	28d7a980-2052-45f7-a569-5f952ea3d30f	Permission	\N	{"id": [null, "28d7a980-2052-45f7-a569-5f952ea3d30f"], "action": [null, "update"], "resource": [null, "member"], "created_at": [null, "2026-03-01T09:46:37.943-03:00"], "updated_at": [null, "2026-03-01T09:46:37.943-03:00"], "description": [null, "Permite editar members"]}	\N
19	2026-03-01 12:46:37.946048	create	c931414f-5870-4272-925d-5302000509ca	Permission	\N	{"id": [null, "c931414f-5870-4272-925d-5302000509ca"], "action": [null, "destroy"], "resource": [null, "member"], "created_at": [null, "2026-03-01T09:46:37.946-03:00"], "updated_at": [null, "2026-03-01T09:46:37.946-03:00"], "description": [null, "Permite remover members"]}	\N
20	2026-03-01 12:46:37.948311	create	cdd59f12-ff36-4575-b060-bd74b7528e23	Permission	\N	{"id": [null, "cdd59f12-ff36-4575-b060-bd74b7528e23"], "action": [null, "read"], "resource": [null, "dashboard"], "created_at": [null, "2026-03-01T09:46:37.948-03:00"], "updated_at": [null, "2026-03-01T09:46:37.948-03:00"], "description": [null, "Permite visualizar dashboards"]}	\N
21	2026-03-01 12:46:37.950981	create	d052e09b-1d24-41c7-862f-5a92096d4d46	Permission	\N	{"id": [null, "d052e09b-1d24-41c7-862f-5a92096d4d46"], "action": [null, "create"], "resource": [null, "dashboard"], "created_at": [null, "2026-03-01T09:46:37.950-03:00"], "updated_at": [null, "2026-03-01T09:46:37.950-03:00"], "description": [null, "Permite criar dashboards"]}	\N
22	2026-03-01 12:46:37.953422	create	d84441b4-0714-4e79-a58c-6de2bd39ad72	Permission	\N	{"id": [null, "d84441b4-0714-4e79-a58c-6de2bd39ad72"], "action": [null, "update"], "resource": [null, "dashboard"], "created_at": [null, "2026-03-01T09:46:37.953-03:00"], "updated_at": [null, "2026-03-01T09:46:37.953-03:00"], "description": [null, "Permite editar dashboards"]}	\N
23	2026-03-01 12:46:37.955793	create	f8924245-16d2-48b5-9662-ef094173696a	Permission	\N	{"id": [null, "f8924245-16d2-48b5-9662-ef094173696a"], "action": [null, "destroy"], "resource": [null, "dashboard"], "created_at": [null, "2026-03-01T09:46:37.955-03:00"], "updated_at": [null, "2026-03-01T09:46:37.955-03:00"], "description": [null, "Permite remover dashboards"]}	\N
24	2026-03-01 12:46:37.957983	create	a2565feb-a158-443d-be75-f1fc393dae40	Permission	\N	{"id": [null, "a2565feb-a158-443d-be75-f1fc393dae40"], "action": [null, "read"], "resource": [null, "hero_banner"], "created_at": [null, "2026-03-01T09:46:37.957-03:00"], "updated_at": [null, "2026-03-01T09:46:37.957-03:00"], "description": [null, "Permite visualizar hero_banners"]}	\N
25	2026-03-01 12:46:37.960246	create	42767b8e-d2b3-43f6-915c-f4efc0e8a9be	Permission	\N	{"id": [null, "42767b8e-d2b3-43f6-915c-f4efc0e8a9be"], "action": [null, "create"], "resource": [null, "hero_banner"], "created_at": [null, "2026-03-01T09:46:37.960-03:00"], "updated_at": [null, "2026-03-01T09:46:37.960-03:00"], "description": [null, "Permite criar hero_banners"]}	\N
26	2026-03-01 12:46:37.96269	create	97b06223-5a39-4916-aa80-b634cd690ed4	Permission	\N	{"id": [null, "97b06223-5a39-4916-aa80-b634cd690ed4"], "action": [null, "update"], "resource": [null, "hero_banner"], "created_at": [null, "2026-03-01T09:46:37.962-03:00"], "updated_at": [null, "2026-03-01T09:46:37.962-03:00"], "description": [null, "Permite editar hero_banners"]}	\N
27	2026-03-01 12:46:37.964869	create	c9b0d998-b3b9-4e2c-be37-bfb513e1de33	Permission	\N	{"id": [null, "c9b0d998-b3b9-4e2c-be37-bfb513e1de33"], "action": [null, "destroy"], "resource": [null, "hero_banner"], "created_at": [null, "2026-03-01T09:46:37.964-03:00"], "updated_at": [null, "2026-03-01T09:46:37.964-03:00"], "description": [null, "Permite remover hero_banners"]}	\N
28	2026-03-01 12:46:37.96708	create	de1cd953-433a-43a7-b597-7d7b72dffbe7	Permission	\N	{"id": [null, "de1cd953-433a-43a7-b597-7d7b72dffbe7"], "action": [null, "read"], "resource": [null, "hero_card"], "created_at": [null, "2026-03-01T09:46:37.967-03:00"], "updated_at": [null, "2026-03-01T09:46:37.967-03:00"], "description": [null, "Permite visualizar hero_cards"]}	\N
29	2026-03-01 12:46:37.969245	create	edd07c92-118f-4551-80ba-00cf9890f358	Permission	\N	{"id": [null, "edd07c92-118f-4551-80ba-00cf9890f358"], "action": [null, "create"], "resource": [null, "hero_card"], "created_at": [null, "2026-03-01T09:46:37.969-03:00"], "updated_at": [null, "2026-03-01T09:46:37.969-03:00"], "description": [null, "Permite criar hero_cards"]}	\N
30	2026-03-01 12:46:37.971501	create	d5484571-a46f-4262-a6ab-26e945ff762e	Permission	\N	{"id": [null, "d5484571-a46f-4262-a6ab-26e945ff762e"], "action": [null, "update"], "resource": [null, "hero_card"], "created_at": [null, "2026-03-01T09:46:37.971-03:00"], "updated_at": [null, "2026-03-01T09:46:37.971-03:00"], "description": [null, "Permite editar hero_cards"]}	\N
31	2026-03-01 12:46:37.973764	create	24b00169-fc7c-456e-b1a0-c03942a48519	Permission	\N	{"id": [null, "24b00169-fc7c-456e-b1a0-c03942a48519"], "action": [null, "destroy"], "resource": [null, "hero_card"], "created_at": [null, "2026-03-01T09:46:37.973-03:00"], "updated_at": [null, "2026-03-01T09:46:37.973-03:00"], "description": [null, "Permite remover hero_cards"]}	\N
32	2026-03-01 12:46:37.975977	create	4d8af205-ad2c-4edd-80a7-0a2e4294f54a	Permission	\N	{"id": [null, "4d8af205-ad2c-4edd-80a7-0a2e4294f54a"], "action": [null, "read"], "resource": [null, "event"], "created_at": [null, "2026-03-01T09:46:37.975-03:00"], "updated_at": [null, "2026-03-01T09:46:37.975-03:00"], "description": [null, "Permite visualizar events"]}	\N
33	2026-03-01 12:46:37.97819	create	2afdfcc1-46bf-4501-b111-932e3c1692ed	Permission	\N	{"id": [null, "2afdfcc1-46bf-4501-b111-932e3c1692ed"], "action": [null, "create"], "resource": [null, "event"], "created_at": [null, "2026-03-01T09:46:37.978-03:00"], "updated_at": [null, "2026-03-01T09:46:37.978-03:00"], "description": [null, "Permite criar events"]}	\N
34	2026-03-01 12:46:37.980434	create	641209c4-4f6e-4ff3-b638-c9043ad8bdd6	Permission	\N	{"id": [null, "641209c4-4f6e-4ff3-b638-c9043ad8bdd6"], "action": [null, "update"], "resource": [null, "event"], "created_at": [null, "2026-03-01T09:46:37.980-03:00"], "updated_at": [null, "2026-03-01T09:46:37.980-03:00"], "description": [null, "Permite editar events"]}	\N
35	2026-03-01 12:46:37.982642	create	66eebba6-26d7-43d1-99ec-bc1a6c6e0290	Permission	\N	{"id": [null, "66eebba6-26d7-43d1-99ec-bc1a6c6e0290"], "action": [null, "destroy"], "resource": [null, "event"], "created_at": [null, "2026-03-01T09:46:37.982-03:00"], "updated_at": [null, "2026-03-01T09:46:37.982-03:00"], "description": [null, "Permite remover events"]}	\N
36	2026-03-01 12:46:37.984934	create	8d3249ea-e22f-4a72-9ef5-bdd364356b0f	Permission	\N	{"id": [null, "8d3249ea-e22f-4a72-9ef5-bdd364356b0f"], "action": [null, "read"], "resource": [null, "project"], "created_at": [null, "2026-03-01T09:46:37.984-03:00"], "updated_at": [null, "2026-03-01T09:46:37.984-03:00"], "description": [null, "Permite visualizar projects"]}	\N
37	2026-03-01 12:46:37.987155	create	47aae2de-f0fb-479c-9a1c-ed146db1103f	Permission	\N	{"id": [null, "47aae2de-f0fb-479c-9a1c-ed146db1103f"], "action": [null, "create"], "resource": [null, "project"], "created_at": [null, "2026-03-01T09:46:37.987-03:00"], "updated_at": [null, "2026-03-01T09:46:37.987-03:00"], "description": [null, "Permite criar projects"]}	\N
38	2026-03-01 12:46:37.989294	create	1fd15150-7e9f-405e-b8fc-75e8799a384b	Permission	\N	{"id": [null, "1fd15150-7e9f-405e-b8fc-75e8799a384b"], "action": [null, "update"], "resource": [null, "project"], "created_at": [null, "2026-03-01T09:46:37.989-03:00"], "updated_at": [null, "2026-03-01T09:46:37.989-03:00"], "description": [null, "Permite editar projects"]}	\N
39	2026-03-01 12:46:37.991622	create	4cbe598d-ca89-4e97-a956-49c7c4844db8	Permission	\N	{"id": [null, "4cbe598d-ca89-4e97-a956-49c7c4844db8"], "action": [null, "destroy"], "resource": [null, "project"], "created_at": [null, "2026-03-01T09:46:37.991-03:00"], "updated_at": [null, "2026-03-01T09:46:37.991-03:00"], "description": [null, "Permite remover projects"]}	\N
40	2026-03-01 12:46:37.993854	create	8bd401b5-9395-4b03-a437-5b1eebb1ab0e	Permission	\N	{"id": [null, "8bd401b5-9395-4b03-a437-5b1eebb1ab0e"], "action": [null, "read"], "resource": [null, "extension_core"], "created_at": [null, "2026-03-01T09:46:37.993-03:00"], "updated_at": [null, "2026-03-01T09:46:37.993-03:00"], "description": [null, "Permite visualizar extension_cores"]}	\N
41	2026-03-01 12:46:37.996082	create	c9f56b56-6523-491a-9d49-0622cd7c45de	Permission	\N	{"id": [null, "c9f56b56-6523-491a-9d49-0622cd7c45de"], "action": [null, "create"], "resource": [null, "extension_core"], "created_at": [null, "2026-03-01T09:46:37.996-03:00"], "updated_at": [null, "2026-03-01T09:46:37.996-03:00"], "description": [null, "Permite criar extension_cores"]}	\N
42	2026-03-01 12:46:37.998242	create	21b7da72-980a-45ab-a47b-fe29125cbf6f	Permission	\N	{"id": [null, "21b7da72-980a-45ab-a47b-fe29125cbf6f"], "action": [null, "update"], "resource": [null, "extension_core"], "created_at": [null, "2026-03-01T09:46:37.998-03:00"], "updated_at": [null, "2026-03-01T09:46:37.998-03:00"], "description": [null, "Permite editar extension_cores"]}	\N
43	2026-03-01 12:46:38.000505	create	89add6b8-0bc8-4e12-8f87-d226280c8e93	Permission	\N	{"id": [null, "89add6b8-0bc8-4e12-8f87-d226280c8e93"], "action": [null, "destroy"], "resource": [null, "extension_core"], "created_at": [null, "2026-03-01T09:46:38.000-03:00"], "updated_at": [null, "2026-03-01T09:46:38.000-03:00"], "description": [null, "Permite remover extension_cores"]}	\N
44	2026-03-01 12:46:38.002798	create	75c0939f-a0d3-46f2-86d1-ad9368c6ebe9	Permission	\N	{"id": [null, "75c0939f-a0d3-46f2-86d1-ad9368c6ebe9"], "action": [null, "read"], "resource": [null, "contact"], "created_at": [null, "2026-03-01T09:46:38.002-03:00"], "updated_at": [null, "2026-03-01T09:46:38.002-03:00"], "description": [null, "Permite visualizar contacts"]}	\N
45	2026-03-01 12:46:38.004974	create	49ca6da7-2fe4-445c-9f21-37ab9fe6b536	Permission	\N	{"id": [null, "49ca6da7-2fe4-445c-9f21-37ab9fe6b536"], "action": [null, "create"], "resource": [null, "contact"], "created_at": [null, "2026-03-01T09:46:38.004-03:00"], "updated_at": [null, "2026-03-01T09:46:38.004-03:00"], "description": [null, "Permite criar contacts"]}	\N
46	2026-03-01 12:46:38.007282	create	ecfdeda6-893d-4111-ac84-6c92aee0580a	Permission	\N	{"id": [null, "ecfdeda6-893d-4111-ac84-6c92aee0580a"], "action": [null, "update"], "resource": [null, "contact"], "created_at": [null, "2026-03-01T09:46:38.007-03:00"], "updated_at": [null, "2026-03-01T09:46:38.007-03:00"], "description": [null, "Permite editar contacts"]}	\N
47	2026-03-01 12:46:38.009608	create	f95b6010-d615-4a0a-8039-1f079d2e42ca	Permission	\N	{"id": [null, "f95b6010-d615-4a0a-8039-1f079d2e42ca"], "action": [null, "destroy"], "resource": [null, "contact"], "created_at": [null, "2026-03-01T09:46:38.009-03:00"], "updated_at": [null, "2026-03-01T09:46:38.009-03:00"], "description": [null, "Permite remover contacts"]}	\N
48	2026-03-01 12:46:38.01185	create	98f89768-492b-47fd-8ac1-b7f494dfaa63	Permission	\N	{"id": [null, "98f89768-492b-47fd-8ac1-b7f494dfaa63"], "action": [null, "read"], "resource": [null, "company"], "created_at": [null, "2026-03-01T09:46:38.011-03:00"], "updated_at": [null, "2026-03-01T09:46:38.011-03:00"], "description": [null, "Permite visualizar companies"]}	\N
49	2026-03-01 12:46:38.014113	create	280f5d8f-1d64-4686-8ece-926277373dbd	Permission	\N	{"id": [null, "280f5d8f-1d64-4686-8ece-926277373dbd"], "action": [null, "create"], "resource": [null, "company"], "created_at": [null, "2026-03-01T09:46:38.014-03:00"], "updated_at": [null, "2026-03-01T09:46:38.014-03:00"], "description": [null, "Permite criar companies"]}	\N
50	2026-03-01 12:46:38.016314	create	f59fd897-ba79-4529-834b-dca80b828968	Permission	\N	{"id": [null, "f59fd897-ba79-4529-834b-dca80b828968"], "action": [null, "update"], "resource": [null, "company"], "created_at": [null, "2026-03-01T09:46:38.016-03:00"], "updated_at": [null, "2026-03-01T09:46:38.016-03:00"], "description": [null, "Permite editar companies"]}	\N
51	2026-03-01 12:46:38.018656	create	9da96cc4-f4d8-4f4b-8d50-70ee74d79974	Permission	\N	{"id": [null, "9da96cc4-f4d8-4f4b-8d50-70ee74d79974"], "action": [null, "destroy"], "resource": [null, "company"], "created_at": [null, "2026-03-01T09:46:38.018-03:00"], "updated_at": [null, "2026-03-01T09:46:38.018-03:00"], "description": [null, "Permite remover companies"]}	\N
52	2026-03-01 12:46:38.02087	create	84f859d8-43c7-4087-9bc2-78429b994169	Permission	\N	{"id": [null, "84f859d8-43c7-4087-9bc2-78429b994169"], "action": [null, "read"], "resource": [null, "carousel_frame"], "created_at": [null, "2026-03-01T09:46:38.020-03:00"], "updated_at": [null, "2026-03-01T09:46:38.020-03:00"], "description": [null, "Permite visualizar carousel_frames"]}	\N
53	2026-03-01 12:46:38.023212	create	7715e0db-728a-4c91-86ef-bfe4d0cce57f	Permission	\N	{"id": [null, "7715e0db-728a-4c91-86ef-bfe4d0cce57f"], "action": [null, "create"], "resource": [null, "carousel_frame"], "created_at": [null, "2026-03-01T09:46:38.023-03:00"], "updated_at": [null, "2026-03-01T09:46:38.023-03:00"], "description": [null, "Permite criar carousel_frames"]}	\N
54	2026-03-01 12:46:38.025498	create	baa3d8a8-76f2-49ca-b5f9-37e02666a634	Permission	\N	{"id": [null, "baa3d8a8-76f2-49ca-b5f9-37e02666a634"], "action": [null, "update"], "resource": [null, "carousel_frame"], "created_at": [null, "2026-03-01T09:46:38.025-03:00"], "updated_at": [null, "2026-03-01T09:46:38.025-03:00"], "description": [null, "Permite editar carousel_frames"]}	\N
55	2026-03-01 12:46:38.027731	create	c18f4384-160b-426f-903b-5b629c2b9803	Permission	\N	{"id": [null, "c18f4384-160b-426f-903b-5b629c2b9803"], "action": [null, "destroy"], "resource": [null, "carousel_frame"], "created_at": [null, "2026-03-01T09:46:38.027-03:00"], "updated_at": [null, "2026-03-01T09:46:38.027-03:00"], "description": [null, "Permite remover carousel_frames"]}	\N
56	2026-03-01 12:46:38.030039	create	ca4b6383-5b72-4a80-91b0-596b8bb89c06	Permission	\N	{"id": [null, "ca4b6383-5b72-4a80-91b0-596b8bb89c06"], "action": [null, "read"], "resource": [null, "card"], "created_at": [null, "2026-03-01T09:46:38.030-03:00"], "updated_at": [null, "2026-03-01T09:46:38.030-03:00"], "description": [null, "Permite visualizar cards"]}	\N
57	2026-03-01 12:46:38.032269	create	3bede7fd-1fe3-489e-a558-976704c6bcaa	Permission	\N	{"id": [null, "3bede7fd-1fe3-489e-a558-976704c6bcaa"], "action": [null, "create"], "resource": [null, "card"], "created_at": [null, "2026-03-01T09:46:38.032-03:00"], "updated_at": [null, "2026-03-01T09:46:38.032-03:00"], "description": [null, "Permite criar cards"]}	\N
58	2026-03-01 12:46:38.034547	create	7b4e4888-40aa-469c-ac48-647b788b62b0	Permission	\N	{"id": [null, "7b4e4888-40aa-469c-ac48-647b788b62b0"], "action": [null, "update"], "resource": [null, "card"], "created_at": [null, "2026-03-01T09:46:38.034-03:00"], "updated_at": [null, "2026-03-01T09:46:38.034-03:00"], "description": [null, "Permite editar cards"]}	\N
59	2026-03-01 12:46:38.036826	create	15e636b1-bc2e-43d4-85af-c018e601c077	Permission	\N	{"id": [null, "15e636b1-bc2e-43d4-85af-c018e601c077"], "action": [null, "destroy"], "resource": [null, "card"], "created_at": [null, "2026-03-01T09:46:38.036-03:00"], "updated_at": [null, "2026-03-01T09:46:38.036-03:00"], "description": [null, "Permite remover cards"]}	\N
60	2026-03-01 12:46:38.039073	create	ba1a3e09-6491-4d55-872c-4bd7a42286f6	Permission	\N	{"id": [null, "ba1a3e09-6491-4d55-872c-4bd7a42286f6"], "action": [null, "read"], "resource": [null, "address"], "created_at": [null, "2026-03-01T09:46:38.039-03:00"], "updated_at": [null, "2026-03-01T09:46:38.039-03:00"], "description": [null, "Permite visualizar addresses"]}	\N
61	2026-03-01 12:46:38.041418	create	3a5934b9-bc65-4a2b-bdaf-5c091e54713b	Permission	\N	{"id": [null, "3a5934b9-bc65-4a2b-bdaf-5c091e54713b"], "action": [null, "create"], "resource": [null, "address"], "created_at": [null, "2026-03-01T09:46:38.041-03:00"], "updated_at": [null, "2026-03-01T09:46:38.041-03:00"], "description": [null, "Permite criar addresses"]}	\N
62	2026-03-01 12:46:38.04361	create	7bee675d-4e47-4d84-9b02-b64f348329b8	Permission	\N	{"id": [null, "7bee675d-4e47-4d84-9b02-b64f348329b8"], "action": [null, "update"], "resource": [null, "address"], "created_at": [null, "2026-03-01T09:46:38.043-03:00"], "updated_at": [null, "2026-03-01T09:46:38.043-03:00"], "description": [null, "Permite editar addresses"]}	\N
63	2026-03-01 12:46:38.045854	create	9875cdca-e925-4bdc-b885-d79487dd16c5	Permission	\N	{"id": [null, "9875cdca-e925-4bdc-b885-d79487dd16c5"], "action": [null, "destroy"], "resource": [null, "address"], "created_at": [null, "2026-03-01T09:46:38.045-03:00"], "updated_at": [null, "2026-03-01T09:46:38.045-03:00"], "description": [null, "Permite remover addresses"]}	\N
64	2026-03-01 12:46:38.048227	create	4b549141-8dea-4c53-aa29-061a0ff94c8c	Permission	\N	{"id": [null, "4b549141-8dea-4c53-aa29-061a0ff94c8c"], "action": [null, "read"], "resource": [null, "social_media_profile"], "created_at": [null, "2026-03-01T09:46:38.048-03:00"], "updated_at": [null, "2026-03-01T09:46:38.048-03:00"], "description": [null, "Permite visualizar social_media_profiles"]}	\N
65	2026-03-01 12:46:38.050452	create	c5fbcd5b-d03e-40f9-85e4-8f29be27bf75	Permission	\N	{"id": [null, "c5fbcd5b-d03e-40f9-85e4-8f29be27bf75"], "action": [null, "create"], "resource": [null, "social_media_profile"], "created_at": [null, "2026-03-01T09:46:38.050-03:00"], "updated_at": [null, "2026-03-01T09:46:38.050-03:00"], "description": [null, "Permite criar social_media_profiles"]}	\N
66	2026-03-01 12:46:38.052806	create	ce576331-15d7-4a00-99ba-be22aae71255	Permission	\N	{"id": [null, "ce576331-15d7-4a00-99ba-be22aae71255"], "action": [null, "update"], "resource": [null, "social_media_profile"], "created_at": [null, "2026-03-01T09:46:38.052-03:00"], "updated_at": [null, "2026-03-01T09:46:38.052-03:00"], "description": [null, "Permite editar social_media_profiles"]}	\N
67	2026-03-01 12:46:38.055075	create	d26e6037-aa53-4ee0-b28f-fbde20b8c469	Permission	\N	{"id": [null, "d26e6037-aa53-4ee0-b28f-fbde20b8c469"], "action": [null, "destroy"], "resource": [null, "social_media_profile"], "created_at": [null, "2026-03-01T09:46:38.055-03:00"], "updated_at": [null, "2026-03-01T09:46:38.055-03:00"], "description": [null, "Permite remover social_media_profiles"]}	\N
68	2026-03-01 12:46:38.057293	create	ad5ee08a-f6df-4e08-a1cc-a747d795e6b6	Permission	\N	{"id": [null, "ad5ee08a-f6df-4e08-a1cc-a747d795e6b6"], "action": [null, "read"], "resource": [null, "page_view"], "created_at": [null, "2026-03-01T09:46:38.057-03:00"], "updated_at": [null, "2026-03-01T09:46:38.057-03:00"], "description": [null, "Permite visualizar page_views"]}	\N
69	2026-03-01 12:46:38.059604	create	b552171c-4ee2-4745-8bad-7e1bd900789d	Permission	\N	{"id": [null, "b552171c-4ee2-4745-8bad-7e1bd900789d"], "action": [null, "create"], "resource": [null, "page_view"], "created_at": [null, "2026-03-01T09:46:38.059-03:00"], "updated_at": [null, "2026-03-01T09:46:38.059-03:00"], "description": [null, "Permite criar page_views"]}	\N
70	2026-03-01 12:46:38.061824	create	b9d5a322-2578-4c6f-9233-b07c260e0c82	Permission	\N	{"id": [null, "b9d5a322-2578-4c6f-9233-b07c260e0c82"], "action": [null, "update"], "resource": [null, "page_view"], "created_at": [null, "2026-03-01T09:46:38.061-03:00"], "updated_at": [null, "2026-03-01T09:46:38.061-03:00"], "description": [null, "Permite editar page_views"]}	\N
71	2026-03-01 12:46:38.064015	create	c359feee-7bda-439f-b570-5810f85818ce	Permission	\N	{"id": [null, "c359feee-7bda-439f-b570-5810f85818ce"], "action": [null, "destroy"], "resource": [null, "page_view"], "created_at": [null, "2026-03-01T09:46:38.064-03:00"], "updated_at": [null, "2026-03-01T09:46:38.064-03:00"], "description": [null, "Permite remover page_views"]}	\N
72	2026-03-01 12:46:38.06633	create	008818b5-9962-4687-835e-97736b90f841	Permission	\N	{"id": [null, "008818b5-9962-4687-835e-97736b90f841"], "action": [null, "manage"], "resource": [null, "ordering"], "created_at": [null, "2026-03-01T09:46:38.066-03:00"], "updated_at": [null, "2026-03-01T09:46:38.066-03:00"], "description": [null, "Permite alterar a ordem dos registros"]}	\N
73	2026-03-01 12:46:38.068615	create	65348af8-19f0-440c-a77b-0656daf88029	Permission	\N	{"id": [null, "65348af8-19f0-440c-a77b-0656daf88029"], "action": [null, "manage"], "resource": [null, "cache"], "created_at": [null, "2026-03-01T09:46:38.068-03:00"], "updated_at": [null, "2026-03-01T09:46:38.068-03:00"], "description": [null, "Permite limpar o cache do sistema"]}	\N
74	2026-03-01 12:46:38.070956	create	6f0c995c-1725-4ca0-b068-4097b78a16e7	Permission	\N	{"id": [null, "6f0c995c-1725-4ca0-b068-4097b78a16e7"], "action": [null, "read"], "resource": [null, "audit"], "created_at": [null, "2026-03-01T09:46:38.070-03:00"], "updated_at": [null, "2026-03-01T09:46:38.070-03:00"], "description": [null, "Permite visualizar logs de auditoria e histórico de alterações"]}	\N
75	2026-03-01 12:46:38.083911	create	b8c487d5-db1d-4dfd-81d6-070dc8bfb608	RolePermission	\N	{"id": [null, "b8c487d5-db1d-4dfd-81d6-070dc8bfb608"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.083-03:00"], "updated_at": [null, "2026-03-01T09:46:38.083-03:00"], "permission_id": [null, "d5753ab0-a45b-454c-bb13-5366e5e8d55d"]}	\N
76	2026-03-01 12:46:38.086708	create	25f1a173-7933-4caa-af37-a923444ba164	RolePermission	\N	{"id": [null, "25f1a173-7933-4caa-af37-a923444ba164"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.086-03:00"], "updated_at": [null, "2026-03-01T09:46:38.086-03:00"], "permission_id": [null, "24d52e89-247c-4690-a018-46e836fd8f23"]}	\N
77	2026-03-01 12:46:38.088932	create	a7e8c1b7-89c3-40dd-b136-7eb03ab9fa97	RolePermission	\N	{"id": [null, "a7e8c1b7-89c3-40dd-b136-7eb03ab9fa97"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.088-03:00"], "updated_at": [null, "2026-03-01T09:46:38.088-03:00"], "permission_id": [null, "e4fac83a-14eb-43f2-adcd-ea882235b348"]}	\N
78	2026-03-01 12:46:38.091331	create	ff2d0eb1-ae2d-4840-a411-118bc25b68ad	RolePermission	\N	{"id": [null, "ff2d0eb1-ae2d-4840-a411-118bc25b68ad"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.091-03:00"], "updated_at": [null, "2026-03-01T09:46:38.091-03:00"], "permission_id": [null, "51227b6a-0d78-4fda-af51-cb4c75c8c509"]}	\N
79	2026-03-01 12:46:38.0935	create	70eb57d3-8123-47e4-8d23-8c0b2feb9cd0	RolePermission	\N	{"id": [null, "70eb57d3-8123-47e4-8d23-8c0b2feb9cd0"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.093-03:00"], "updated_at": [null, "2026-03-01T09:46:38.093-03:00"], "permission_id": [null, "cdd59f12-ff36-4575-b060-bd74b7528e23"]}	\N
80	2026-03-01 12:46:38.095605	create	7be91477-4547-45c2-b9d1-0122160ab482	RolePermission	\N	{"id": [null, "7be91477-4547-45c2-b9d1-0122160ab482"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.095-03:00"], "updated_at": [null, "2026-03-01T09:46:38.095-03:00"], "permission_id": [null, "a2565feb-a158-443d-be75-f1fc393dae40"]}	\N
81	2026-03-01 12:46:38.126256	create	43122444-5a77-499c-b475-483f8cfe7e3a	RolePermission	\N	{"id": [null, "43122444-5a77-499c-b475-483f8cfe7e3a"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.126-03:00"], "updated_at": [null, "2026-03-01T09:46:38.126-03:00"], "permission_id": [null, "de1cd953-433a-43a7-b597-7d7b72dffbe7"]}	\N
82	2026-03-01 12:46:38.129783	create	107f0b3b-0d9f-4b73-9cb1-f0a3a60efed3	RolePermission	\N	{"id": [null, "107f0b3b-0d9f-4b73-9cb1-f0a3a60efed3"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.129-03:00"], "updated_at": [null, "2026-03-01T09:46:38.129-03:00"], "permission_id": [null, "4d8af205-ad2c-4edd-80a7-0a2e4294f54a"]}	\N
83	2026-03-01 12:46:38.132148	create	542b4209-4367-4565-8e5d-0b09677e0fb0	RolePermission	\N	{"id": [null, "542b4209-4367-4565-8e5d-0b09677e0fb0"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.132-03:00"], "updated_at": [null, "2026-03-01T09:46:38.132-03:00"], "permission_id": [null, "8d3249ea-e22f-4a72-9ef5-bdd364356b0f"]}	\N
84	2026-03-01 12:46:38.134392	create	788e50de-da33-4105-bb6f-6c125ba05307	RolePermission	\N	{"id": [null, "788e50de-da33-4105-bb6f-6c125ba05307"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.134-03:00"], "updated_at": [null, "2026-03-01T09:46:38.134-03:00"], "permission_id": [null, "8bd401b5-9395-4b03-a437-5b1eebb1ab0e"]}	\N
85	2026-03-01 12:46:38.137872	create	85a7d624-f24c-47b3-b5c7-7b9c363c830a	RolePermission	\N	{"id": [null, "85a7d624-f24c-47b3-b5c7-7b9c363c830a"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.137-03:00"], "updated_at": [null, "2026-03-01T09:46:38.137-03:00"], "permission_id": [null, "75c0939f-a0d3-46f2-86d1-ad9368c6ebe9"]}	\N
86	2026-03-01 12:46:38.139851	create	e201b331-4880-424c-938e-138b4d98dbfc	RolePermission	\N	{"id": [null, "e201b331-4880-424c-938e-138b4d98dbfc"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.139-03:00"], "updated_at": [null, "2026-03-01T09:46:38.139-03:00"], "permission_id": [null, "98f89768-492b-47fd-8ac1-b7f494dfaa63"]}	\N
87	2026-03-01 12:46:38.141801	create	effb2b18-dd7f-485b-96a2-3d92e6ff7b23	RolePermission	\N	{"id": [null, "effb2b18-dd7f-485b-96a2-3d92e6ff7b23"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.141-03:00"], "updated_at": [null, "2026-03-01T09:46:38.141-03:00"], "permission_id": [null, "84f859d8-43c7-4087-9bc2-78429b994169"]}	\N
88	2026-03-01 12:46:38.14458	create	d6b47cea-fa32-4600-9a12-dbfdee9ba3fa	RolePermission	\N	{"id": [null, "d6b47cea-fa32-4600-9a12-dbfdee9ba3fa"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.144-03:00"], "updated_at": [null, "2026-03-01T09:46:38.144-03:00"], "permission_id": [null, "ca4b6383-5b72-4a80-91b0-596b8bb89c06"]}	\N
89	2026-03-01 12:46:38.146589	create	302d0205-842e-4a6a-9caa-0d55d0a580fd	RolePermission	\N	{"id": [null, "302d0205-842e-4a6a-9caa-0d55d0a580fd"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.146-03:00"], "updated_at": [null, "2026-03-01T09:46:38.146-03:00"], "permission_id": [null, "ba1a3e09-6491-4d55-872c-4bd7a42286f6"]}	\N
90	2026-03-01 12:46:38.148456	create	c12ccc74-48f0-406f-b2ed-1eb9bd4ea711	RolePermission	\N	{"id": [null, "c12ccc74-48f0-406f-b2ed-1eb9bd4ea711"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.148-03:00"], "updated_at": [null, "2026-03-01T09:46:38.148-03:00"], "permission_id": [null, "4b549141-8dea-4c53-aa29-061a0ff94c8c"]}	\N
91	2026-03-01 12:46:38.15037	create	cb79cd47-4ea3-41ab-809f-6962da3f96c8	RolePermission	\N	{"id": [null, "cb79cd47-4ea3-41ab-809f-6962da3f96c8"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.150-03:00"], "updated_at": [null, "2026-03-01T09:46:38.150-03:00"], "permission_id": [null, "ad5ee08a-f6df-4e08-a1cc-a747d795e6b6"]}	\N
92	2026-03-01 12:46:38.153073	create	c0bf08fc-abce-4036-86cf-6877c27ee2ff	RolePermission	\N	{"id": [null, "c0bf08fc-abce-4036-86cf-6877c27ee2ff"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "created_at": [null, "2026-03-01T09:46:38.153-03:00"], "updated_at": [null, "2026-03-01T09:46:38.153-03:00"], "permission_id": [null, "6f0c995c-1725-4ca0-b068-4097b78a16e7"]}	\N
93	2026-03-01 12:46:38.157244	create	f2ad2215-9c68-4444-8c10-65c8a4981941	RolePermission	\N	{"id": [null, "f2ad2215-9c68-4444-8c10-65c8a4981941"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.157-03:00"], "updated_at": [null, "2026-03-01T09:46:38.157-03:00"], "permission_id": [null, "d5753ab0-a45b-454c-bb13-5366e5e8d55d"]}	\N
94	2026-03-01 12:46:38.159215	create	15145e86-9d39-4826-8660-d90b2622a0eb	RolePermission	\N	{"id": [null, "15145e86-9d39-4826-8660-d90b2622a0eb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.159-03:00"], "updated_at": [null, "2026-03-01T09:46:38.159-03:00"], "permission_id": [null, "60852a8a-7bfa-437e-bcb7-f4d8e73243d4"]}	\N
95	2026-03-01 12:46:38.16221	create	a6379fef-3562-4b9f-8ef3-6fd0585914f1	RolePermission	\N	{"id": [null, "a6379fef-3562-4b9f-8ef3-6fd0585914f1"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.162-03:00"], "updated_at": [null, "2026-03-01T09:46:38.162-03:00"], "permission_id": [null, "9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7"]}	\N
96	2026-03-01 12:46:38.164244	create	02466f03-e5d7-4677-9d69-3968bca53832	RolePermission	\N	{"id": [null, "02466f03-e5d7-4677-9d69-3968bca53832"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.164-03:00"], "updated_at": [null, "2026-03-01T09:46:38.164-03:00"], "permission_id": [null, "b72caae2-5a08-4aea-8656-9e6b63a99290"]}	\N
97	2026-03-01 12:46:38.166207	create	0d158c9e-8f28-4038-8e61-da1ff2d762cb	RolePermission	\N	{"id": [null, "0d158c9e-8f28-4038-8e61-da1ff2d762cb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.166-03:00"], "updated_at": [null, "2026-03-01T09:46:38.166-03:00"], "permission_id": [null, "24d52e89-247c-4690-a018-46e836fd8f23"]}	\N
98	2026-03-01 12:46:38.168949	create	ff2fbdf4-41a9-4f7c-a685-d191dc1a8c51	RolePermission	\N	{"id": [null, "ff2fbdf4-41a9-4f7c-a685-d191dc1a8c51"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.168-03:00"], "updated_at": [null, "2026-03-01T09:46:38.168-03:00"], "permission_id": [null, "3fd7a6f9-f101-4722-ba86-b0062a36211b"]}	\N
99	2026-03-01 12:46:38.171078	create	ed5bd27d-a498-47b1-bf25-343f316d7eb6	RolePermission	\N	{"id": [null, "ed5bd27d-a498-47b1-bf25-343f316d7eb6"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.171-03:00"], "updated_at": [null, "2026-03-01T09:46:38.171-03:00"], "permission_id": [null, "7370875d-48b3-45ad-8329-09653f09cc60"]}	\N
100	2026-03-01 12:46:38.173006	create	4d168a56-351e-4042-8879-29d4e0027893	RolePermission	\N	{"id": [null, "4d168a56-351e-4042-8879-29d4e0027893"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.173-03:00"], "updated_at": [null, "2026-03-01T09:46:38.173-03:00"], "permission_id": [null, "c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3"]}	\N
101	2026-03-01 12:46:38.174957	create	a013dd9a-950a-442a-9267-9c4dc76558e5	RolePermission	\N	{"id": [null, "a013dd9a-950a-442a-9267-9c4dc76558e5"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.174-03:00"], "updated_at": [null, "2026-03-01T09:46:38.174-03:00"], "permission_id": [null, "e4fac83a-14eb-43f2-adcd-ea882235b348"]}	\N
102	2026-03-01 12:46:38.177685	create	02fd3293-5059-49fb-9597-055b81810160	RolePermission	\N	{"id": [null, "02fd3293-5059-49fb-9597-055b81810160"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.177-03:00"], "updated_at": [null, "2026-03-01T09:46:38.177-03:00"], "permission_id": [null, "925fb8dc-72ea-493d-8839-2279f2e136a2"]}	\N
103	2026-03-01 12:46:38.179816	create	52065def-8b6b-4bdd-924c-2af5a95b868b	RolePermission	\N	{"id": [null, "52065def-8b6b-4bdd-924c-2af5a95b868b"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.179-03:00"], "updated_at": [null, "2026-03-01T09:46:38.179-03:00"], "permission_id": [null, "66ec275c-a758-401a-8859-24d4ad357f5d"]}	\N
104	2026-03-01 12:46:38.181707	create	0c902d8d-1235-42a0-8eee-bba9623bc506	RolePermission	\N	{"id": [null, "0c902d8d-1235-42a0-8eee-bba9623bc506"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.181-03:00"], "updated_at": [null, "2026-03-01T09:46:38.181-03:00"], "permission_id": [null, "1742a59d-df61-48fe-ac25-94d470289c65"]}	\N
105	2026-03-01 12:46:38.183598	create	0cccf3b6-d371-4526-879c-7b6efdbb38cf	RolePermission	\N	{"id": [null, "0cccf3b6-d371-4526-879c-7b6efdbb38cf"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.183-03:00"], "updated_at": [null, "2026-03-01T09:46:38.183-03:00"], "permission_id": [null, "51227b6a-0d78-4fda-af51-cb4c75c8c509"]}	\N
106	2026-03-01 12:46:38.186454	create	3e387d41-87d8-4034-8c70-bc41996ecf98	RolePermission	\N	{"id": [null, "3e387d41-87d8-4034-8c70-bc41996ecf98"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.186-03:00"], "updated_at": [null, "2026-03-01T09:46:38.186-03:00"], "permission_id": [null, "eac020e5-db47-4614-92cf-ed2139438067"]}	\N
107	2026-03-01 12:46:38.18834	create	eed071a0-e90f-4460-94f6-e23248f39a42	RolePermission	\N	{"id": [null, "eed071a0-e90f-4460-94f6-e23248f39a42"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.188-03:00"], "updated_at": [null, "2026-03-01T09:46:38.188-03:00"], "permission_id": [null, "28d7a980-2052-45f7-a569-5f952ea3d30f"]}	\N
108	2026-03-01 12:46:38.190248	create	a587b688-ea3e-454d-a1a0-7069045f60cb	RolePermission	\N	{"id": [null, "a587b688-ea3e-454d-a1a0-7069045f60cb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.190-03:00"], "updated_at": [null, "2026-03-01T09:46:38.190-03:00"], "permission_id": [null, "c931414f-5870-4272-925d-5302000509ca"]}	\N
109	2026-03-01 12:46:38.192389	create	c3bbc1ef-165d-41a5-9609-4a7b187a654d	RolePermission	\N	{"id": [null, "c3bbc1ef-165d-41a5-9609-4a7b187a654d"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.192-03:00"], "updated_at": [null, "2026-03-01T09:46:38.192-03:00"], "permission_id": [null, "cdd59f12-ff36-4575-b060-bd74b7528e23"]}	\N
110	2026-03-01 12:46:38.19483	create	eeecf731-b4b4-4fcd-b058-14ed8763c82e	RolePermission	\N	{"id": [null, "eeecf731-b4b4-4fcd-b058-14ed8763c82e"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.194-03:00"], "updated_at": [null, "2026-03-01T09:46:38.194-03:00"], "permission_id": [null, "d052e09b-1d24-41c7-862f-5a92096d4d46"]}	\N
111	2026-03-01 12:46:38.196786	create	e3941e19-f69f-40ca-82de-433df270cdb1	RolePermission	\N	{"id": [null, "e3941e19-f69f-40ca-82de-433df270cdb1"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.196-03:00"], "updated_at": [null, "2026-03-01T09:46:38.196-03:00"], "permission_id": [null, "d84441b4-0714-4e79-a58c-6de2bd39ad72"]}	\N
112	2026-03-01 12:46:38.198687	create	80137a12-b62c-4e49-b12f-c9406c421326	RolePermission	\N	{"id": [null, "80137a12-b62c-4e49-b12f-c9406c421326"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.198-03:00"], "updated_at": [null, "2026-03-01T09:46:38.198-03:00"], "permission_id": [null, "f8924245-16d2-48b5-9662-ef094173696a"]}	\N
113	2026-03-01 12:46:38.200684	create	9ef9191d-e9b1-44b0-85e8-8dad6ff28f48	RolePermission	\N	{"id": [null, "9ef9191d-e9b1-44b0-85e8-8dad6ff28f48"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.200-03:00"], "updated_at": [null, "2026-03-01T09:46:38.200-03:00"], "permission_id": [null, "a2565feb-a158-443d-be75-f1fc393dae40"]}	\N
114	2026-03-01 12:46:38.202958	create	df2b061f-122a-46d3-9baa-617d4155211b	RolePermission	\N	{"id": [null, "df2b061f-122a-46d3-9baa-617d4155211b"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.202-03:00"], "updated_at": [null, "2026-03-01T09:46:38.202-03:00"], "permission_id": [null, "42767b8e-d2b3-43f6-915c-f4efc0e8a9be"]}	\N
115	2026-03-01 12:46:38.204952	create	5ba7921c-41a2-4c05-ba76-508e2346030d	RolePermission	\N	{"id": [null, "5ba7921c-41a2-4c05-ba76-508e2346030d"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.204-03:00"], "updated_at": [null, "2026-03-01T09:46:38.204-03:00"], "permission_id": [null, "97b06223-5a39-4916-aa80-b634cd690ed4"]}	\N
116	2026-03-01 12:46:38.206933	create	bcc427e6-d15b-4923-9049-77011abddb46	RolePermission	\N	{"id": [null, "bcc427e6-d15b-4923-9049-77011abddb46"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.206-03:00"], "updated_at": [null, "2026-03-01T09:46:38.206-03:00"], "permission_id": [null, "c9b0d998-b3b9-4e2c-be37-bfb513e1de33"]}	\N
117	2026-03-01 12:46:38.208837	create	67e6ad82-7fdc-4bfe-b9f3-4d6b09d347d2	RolePermission	\N	{"id": [null, "67e6ad82-7fdc-4bfe-b9f3-4d6b09d347d2"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.208-03:00"], "updated_at": [null, "2026-03-01T09:46:38.208-03:00"], "permission_id": [null, "de1cd953-433a-43a7-b597-7d7b72dffbe7"]}	\N
118	2026-03-01 12:46:38.211037	create	093b150f-9d9e-4cc8-8e3a-327d29a08bea	RolePermission	\N	{"id": [null, "093b150f-9d9e-4cc8-8e3a-327d29a08bea"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.211-03:00"], "updated_at": [null, "2026-03-01T09:46:38.211-03:00"], "permission_id": [null, "edd07c92-118f-4551-80ba-00cf9890f358"]}	\N
119	2026-03-01 12:46:38.212924	create	253ab7d7-0601-45b5-8457-5cf6ea5c1126	RolePermission	\N	{"id": [null, "253ab7d7-0601-45b5-8457-5cf6ea5c1126"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.212-03:00"], "updated_at": [null, "2026-03-01T09:46:38.212-03:00"], "permission_id": [null, "d5484571-a46f-4262-a6ab-26e945ff762e"]}	\N
120	2026-03-01 12:46:38.214819	create	78448cdc-1a57-46d0-ba3f-4bd23c91860d	RolePermission	\N	{"id": [null, "78448cdc-1a57-46d0-ba3f-4bd23c91860d"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.214-03:00"], "updated_at": [null, "2026-03-01T09:46:38.214-03:00"], "permission_id": [null, "24b00169-fc7c-456e-b1a0-c03942a48519"]}	\N
121	2026-03-01 12:46:38.216726	create	0d9d70b3-96f5-4447-b777-dd7455c282ce	RolePermission	\N	{"id": [null, "0d9d70b3-96f5-4447-b777-dd7455c282ce"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.216-03:00"], "updated_at": [null, "2026-03-01T09:46:38.216-03:00"], "permission_id": [null, "4d8af205-ad2c-4edd-80a7-0a2e4294f54a"]}	\N
122	2026-03-01 12:46:38.218754	create	35baaeb1-407c-4b9d-a146-986c823989e8	RolePermission	\N	{"id": [null, "35baaeb1-407c-4b9d-a146-986c823989e8"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.218-03:00"], "updated_at": [null, "2026-03-01T09:46:38.218-03:00"], "permission_id": [null, "2afdfcc1-46bf-4501-b111-932e3c1692ed"]}	\N
123	2026-03-01 12:46:38.220634	create	a5024796-2199-4ebe-8b94-aad1224fa093	RolePermission	\N	{"id": [null, "a5024796-2199-4ebe-8b94-aad1224fa093"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.220-03:00"], "updated_at": [null, "2026-03-01T09:46:38.220-03:00"], "permission_id": [null, "641209c4-4f6e-4ff3-b638-c9043ad8bdd6"]}	\N
124	2026-03-01 12:46:38.222548	create	1fd40841-1075-4b54-a811-d60ec3fded3f	RolePermission	\N	{"id": [null, "1fd40841-1075-4b54-a811-d60ec3fded3f"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.222-03:00"], "updated_at": [null, "2026-03-01T09:46:38.222-03:00"], "permission_id": [null, "66eebba6-26d7-43d1-99ec-bc1a6c6e0290"]}	\N
125	2026-03-01 12:46:38.224436	create	05c822c2-7bad-4412-ac4c-48b7572f0d08	RolePermission	\N	{"id": [null, "05c822c2-7bad-4412-ac4c-48b7572f0d08"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.224-03:00"], "updated_at": [null, "2026-03-01T09:46:38.224-03:00"], "permission_id": [null, "8d3249ea-e22f-4a72-9ef5-bdd364356b0f"]}	\N
126	2026-03-01 12:46:38.226552	create	8bbad62e-bd08-4b15-94ab-5a3151a769c0	RolePermission	\N	{"id": [null, "8bbad62e-bd08-4b15-94ab-5a3151a769c0"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.226-03:00"], "updated_at": [null, "2026-03-01T09:46:38.226-03:00"], "permission_id": [null, "47aae2de-f0fb-479c-9a1c-ed146db1103f"]}	\N
127	2026-03-01 12:46:38.228437	create	c97a342f-cab8-45ab-adc4-24d502f76d3e	RolePermission	\N	{"id": [null, "c97a342f-cab8-45ab-adc4-24d502f76d3e"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.228-03:00"], "updated_at": [null, "2026-03-01T09:46:38.228-03:00"], "permission_id": [null, "1fd15150-7e9f-405e-b8fc-75e8799a384b"]}	\N
128	2026-03-01 12:46:38.230356	create	b7357251-9356-44fe-aef8-a476431cb48b	RolePermission	\N	{"id": [null, "b7357251-9356-44fe-aef8-a476431cb48b"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.230-03:00"], "updated_at": [null, "2026-03-01T09:46:38.230-03:00"], "permission_id": [null, "4cbe598d-ca89-4e97-a956-49c7c4844db8"]}	\N
129	2026-03-01 12:46:38.232313	create	06112eb5-efcb-484e-8154-1be4d2a22b89	RolePermission	\N	{"id": [null, "06112eb5-efcb-484e-8154-1be4d2a22b89"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.232-03:00"], "updated_at": [null, "2026-03-01T09:46:38.232-03:00"], "permission_id": [null, "8bd401b5-9395-4b03-a437-5b1eebb1ab0e"]}	\N
130	2026-03-01 12:46:38.234613	create	e1383fb6-22e0-4c64-b3a2-0049bb7c3eb5	RolePermission	\N	{"id": [null, "e1383fb6-22e0-4c64-b3a2-0049bb7c3eb5"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.234-03:00"], "updated_at": [null, "2026-03-01T09:46:38.234-03:00"], "permission_id": [null, "c9f56b56-6523-491a-9d49-0622cd7c45de"]}	\N
131	2026-03-01 12:46:38.236542	create	4e5b80c1-7efa-4cba-98aa-7d5fb0d562ee	RolePermission	\N	{"id": [null, "4e5b80c1-7efa-4cba-98aa-7d5fb0d562ee"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.236-03:00"], "updated_at": [null, "2026-03-01T09:46:38.236-03:00"], "permission_id": [null, "21b7da72-980a-45ab-a47b-fe29125cbf6f"]}	\N
132	2026-03-01 12:46:38.238473	create	ef86aea7-b62e-4fd5-958b-36483faa7f8b	RolePermission	\N	{"id": [null, "ef86aea7-b62e-4fd5-958b-36483faa7f8b"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.238-03:00"], "updated_at": [null, "2026-03-01T09:46:38.238-03:00"], "permission_id": [null, "89add6b8-0bc8-4e12-8f87-d226280c8e93"]}	\N
133	2026-03-01 12:46:38.240388	create	adc77384-c927-49fc-ac23-8effe37cfe2e	RolePermission	\N	{"id": [null, "adc77384-c927-49fc-ac23-8effe37cfe2e"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.240-03:00"], "updated_at": [null, "2026-03-01T09:46:38.240-03:00"], "permission_id": [null, "75c0939f-a0d3-46f2-86d1-ad9368c6ebe9"]}	\N
134	2026-03-01 12:46:38.242603	create	8878aefc-9b2a-474f-a3d7-5b47c9701885	RolePermission	\N	{"id": [null, "8878aefc-9b2a-474f-a3d7-5b47c9701885"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.242-03:00"], "updated_at": [null, "2026-03-01T09:46:38.242-03:00"], "permission_id": [null, "49ca6da7-2fe4-445c-9f21-37ab9fe6b536"]}	\N
135	2026-03-01 12:46:38.244532	create	14e632dd-1a64-44be-995e-96f9347a0ab8	RolePermission	\N	{"id": [null, "14e632dd-1a64-44be-995e-96f9347a0ab8"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.244-03:00"], "updated_at": [null, "2026-03-01T09:46:38.244-03:00"], "permission_id": [null, "ecfdeda6-893d-4111-ac84-6c92aee0580a"]}	\N
136	2026-03-01 12:46:38.246439	create	9e8ad444-45f2-4c58-87c7-1454a4d46304	RolePermission	\N	{"id": [null, "9e8ad444-45f2-4c58-87c7-1454a4d46304"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.246-03:00"], "updated_at": [null, "2026-03-01T09:46:38.246-03:00"], "permission_id": [null, "f95b6010-d615-4a0a-8039-1f079d2e42ca"]}	\N
137	2026-03-01 12:46:38.24856	create	18bb9b76-5acd-43ac-94b4-45d2fd9741f8	RolePermission	\N	{"id": [null, "18bb9b76-5acd-43ac-94b4-45d2fd9741f8"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.248-03:00"], "updated_at": [null, "2026-03-01T09:46:38.248-03:00"], "permission_id": [null, "98f89768-492b-47fd-8ac1-b7f494dfaa63"]}	\N
138	2026-03-01 12:46:38.250476	create	b44de54d-8543-45c9-b03b-ebc69dfae701	RolePermission	\N	{"id": [null, "b44de54d-8543-45c9-b03b-ebc69dfae701"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.250-03:00"], "updated_at": [null, "2026-03-01T09:46:38.250-03:00"], "permission_id": [null, "280f5d8f-1d64-4686-8ece-926277373dbd"]}	\N
139	2026-03-01 12:46:38.252399	create	c9663c55-6777-4467-97bc-c4d41d1794bf	RolePermission	\N	{"id": [null, "c9663c55-6777-4467-97bc-c4d41d1794bf"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.252-03:00"], "updated_at": [null, "2026-03-01T09:46:38.252-03:00"], "permission_id": [null, "f59fd897-ba79-4529-834b-dca80b828968"]}	\N
140	2026-03-01 12:46:38.254317	create	2b50cf0b-dab2-465a-ad7e-a99ec7472ee6	RolePermission	\N	{"id": [null, "2b50cf0b-dab2-465a-ad7e-a99ec7472ee6"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.254-03:00"], "updated_at": [null, "2026-03-01T09:46:38.254-03:00"], "permission_id": [null, "9da96cc4-f4d8-4f4b-8d50-70ee74d79974"]}	\N
141	2026-03-01 12:46:38.256291	create	a94379e0-8070-46d1-b68c-26dccd974dcb	RolePermission	\N	{"id": [null, "a94379e0-8070-46d1-b68c-26dccd974dcb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.256-03:00"], "updated_at": [null, "2026-03-01T09:46:38.256-03:00"], "permission_id": [null, "84f859d8-43c7-4087-9bc2-78429b994169"]}	\N
142	2026-03-01 12:46:38.258207	create	02131ccb-79d5-46cf-b27d-94b67f31ded4	RolePermission	\N	{"id": [null, "02131ccb-79d5-46cf-b27d-94b67f31ded4"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.258-03:00"], "updated_at": [null, "2026-03-01T09:46:38.258-03:00"], "permission_id": [null, "7715e0db-728a-4c91-86ef-bfe4d0cce57f"]}	\N
143	2026-03-01 12:46:38.260285	create	fd909a5d-d7ec-40d1-88fc-0c5520aa390b	RolePermission	\N	{"id": [null, "fd909a5d-d7ec-40d1-88fc-0c5520aa390b"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.260-03:00"], "updated_at": [null, "2026-03-01T09:46:38.260-03:00"], "permission_id": [null, "baa3d8a8-76f2-49ca-b5f9-37e02666a634"]}	\N
144	2026-03-01 12:46:38.26222	create	b9d85149-cf7b-4c68-b796-a2ca5d7dda04	RolePermission	\N	{"id": [null, "b9d85149-cf7b-4c68-b796-a2ca5d7dda04"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.262-03:00"], "updated_at": [null, "2026-03-01T09:46:38.262-03:00"], "permission_id": [null, "c18f4384-160b-426f-903b-5b629c2b9803"]}	\N
145	2026-03-01 12:46:38.264244	create	6f86cb64-c36c-4dfd-b540-c590b4448bdb	RolePermission	\N	{"id": [null, "6f86cb64-c36c-4dfd-b540-c590b4448bdb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.264-03:00"], "updated_at": [null, "2026-03-01T09:46:38.264-03:00"], "permission_id": [null, "ca4b6383-5b72-4a80-91b0-596b8bb89c06"]}	\N
146	2026-03-01 12:46:38.266155	create	53967388-181b-4337-81b6-1ef8cbb452cd	RolePermission	\N	{"id": [null, "53967388-181b-4337-81b6-1ef8cbb452cd"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.266-03:00"], "updated_at": [null, "2026-03-01T09:46:38.266-03:00"], "permission_id": [null, "3bede7fd-1fe3-489e-a558-976704c6bcaa"]}	\N
147	2026-03-01 12:46:38.268069	create	f63bdcb2-9ca9-40de-ac83-da81fbd5b2da	RolePermission	\N	{"id": [null, "f63bdcb2-9ca9-40de-ac83-da81fbd5b2da"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.268-03:00"], "updated_at": [null, "2026-03-01T09:46:38.268-03:00"], "permission_id": [null, "7b4e4888-40aa-469c-ac48-647b788b62b0"]}	\N
148	2026-03-01 12:46:38.270162	create	3787d99b-80c5-4b37-ae6c-8de838a88f2c	RolePermission	\N	{"id": [null, "3787d99b-80c5-4b37-ae6c-8de838a88f2c"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.270-03:00"], "updated_at": [null, "2026-03-01T09:46:38.270-03:00"], "permission_id": [null, "15e636b1-bc2e-43d4-85af-c018e601c077"]}	\N
149	2026-03-01 12:46:38.272088	create	3eb5596d-7a68-45a7-a434-db2b39b732c8	RolePermission	\N	{"id": [null, "3eb5596d-7a68-45a7-a434-db2b39b732c8"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.272-03:00"], "updated_at": [null, "2026-03-01T09:46:38.272-03:00"], "permission_id": [null, "ba1a3e09-6491-4d55-872c-4bd7a42286f6"]}	\N
150	2026-03-01 12:46:38.27403	create	9be8fbfd-9883-4ef6-9058-a4c5a9771544	RolePermission	\N	{"id": [null, "9be8fbfd-9883-4ef6-9058-a4c5a9771544"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.274-03:00"], "updated_at": [null, "2026-03-01T09:46:38.274-03:00"], "permission_id": [null, "3a5934b9-bc65-4a2b-bdaf-5c091e54713b"]}	\N
151	2026-03-01 12:46:38.275944	create	7e5c51ff-c1fd-47b1-819e-7714037f0ebc	RolePermission	\N	{"id": [null, "7e5c51ff-c1fd-47b1-819e-7714037f0ebc"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.275-03:00"], "updated_at": [null, "2026-03-01T09:46:38.275-03:00"], "permission_id": [null, "7bee675d-4e47-4d84-9b02-b64f348329b8"]}	\N
152	2026-03-01 12:46:38.278073	create	e67e4bd3-4130-4e05-9c95-627f804d2a50	RolePermission	\N	{"id": [null, "e67e4bd3-4130-4e05-9c95-627f804d2a50"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.278-03:00"], "updated_at": [null, "2026-03-01T09:46:38.278-03:00"], "permission_id": [null, "9875cdca-e925-4bdc-b885-d79487dd16c5"]}	\N
153	2026-03-01 12:46:38.279947	create	038abc6c-3fa8-40e4-b157-8c0b81ca5760	RolePermission	\N	{"id": [null, "038abc6c-3fa8-40e4-b157-8c0b81ca5760"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.279-03:00"], "updated_at": [null, "2026-03-01T09:46:38.279-03:00"], "permission_id": [null, "4b549141-8dea-4c53-aa29-061a0ff94c8c"]}	\N
154	2026-03-01 12:46:38.282105	create	1217d2f5-20bf-4859-9da5-380011569858	RolePermission	\N	{"id": [null, "1217d2f5-20bf-4859-9da5-380011569858"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.282-03:00"], "updated_at": [null, "2026-03-01T09:46:38.282-03:00"], "permission_id": [null, "c5fbcd5b-d03e-40f9-85e4-8f29be27bf75"]}	\N
155	2026-03-01 12:46:38.284552	create	598404e1-9ec9-45a8-be43-1b979e770b6b	RolePermission	\N	{"id": [null, "598404e1-9ec9-45a8-be43-1b979e770b6b"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.284-03:00"], "updated_at": [null, "2026-03-01T09:46:38.284-03:00"], "permission_id": [null, "ce576331-15d7-4a00-99ba-be22aae71255"]}	\N
156	2026-03-01 12:46:38.286659	create	de5cc257-bef6-4e61-bdba-2cb2c6177591	RolePermission	\N	{"id": [null, "de5cc257-bef6-4e61-bdba-2cb2c6177591"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.286-03:00"], "updated_at": [null, "2026-03-01T09:46:38.286-03:00"], "permission_id": [null, "d26e6037-aa53-4ee0-b28f-fbde20b8c469"]}	\N
157	2026-03-01 12:46:38.28884	create	ec4f6334-beb5-41f3-a8cf-bf61bfc01843	RolePermission	\N	{"id": [null, "ec4f6334-beb5-41f3-a8cf-bf61bfc01843"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.288-03:00"], "updated_at": [null, "2026-03-01T09:46:38.288-03:00"], "permission_id": [null, "ad5ee08a-f6df-4e08-a1cc-a747d795e6b6"]}	\N
158	2026-03-01 12:46:38.290848	create	beb7dff9-e731-4504-9533-d93c9b5ffdcb	RolePermission	\N	{"id": [null, "beb7dff9-e731-4504-9533-d93c9b5ffdcb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.290-03:00"], "updated_at": [null, "2026-03-01T09:46:38.290-03:00"], "permission_id": [null, "b552171c-4ee2-4745-8bad-7e1bd900789d"]}	\N
159	2026-03-01 12:46:38.293771	create	6ef0700f-7840-42bb-869a-c04d27876deb	RolePermission	\N	{"id": [null, "6ef0700f-7840-42bb-869a-c04d27876deb"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.293-03:00"], "updated_at": [null, "2026-03-01T09:46:38.293-03:00"], "permission_id": [null, "b9d5a322-2578-4c6f-9233-b07c260e0c82"]}	\N
160	2026-03-01 12:46:38.29594	create	f3a733bb-2380-4103-b023-194c6af639d8	RolePermission	\N	{"id": [null, "f3a733bb-2380-4103-b023-194c6af639d8"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.295-03:00"], "updated_at": [null, "2026-03-01T09:46:38.295-03:00"], "permission_id": [null, "c359feee-7bda-439f-b570-5810f85818ce"]}	\N
161	2026-03-01 12:46:38.297987	create	882f2a77-81ea-4dfd-8224-23426a76da13	RolePermission	\N	{"id": [null, "882f2a77-81ea-4dfd-8224-23426a76da13"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "created_at": [null, "2026-03-01T09:46:38.297-03:00"], "updated_at": [null, "2026-03-01T09:46:38.297-03:00"], "permission_id": [null, "6f0c995c-1725-4ca0-b068-4097b78a16e7"]}	\N
162	2026-03-01 12:46:38.302024	create	b8c18a06-cd6b-4aba-8af9-1495a0ed9db3	RolePermission	\N	{"id": [null, "b8c18a06-cd6b-4aba-8af9-1495a0ed9db3"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.302-03:00"], "updated_at": [null, "2026-03-01T09:46:38.302-03:00"], "permission_id": [null, "d5753ab0-a45b-454c-bb13-5366e5e8d55d"]}	\N
163	2026-03-01 12:46:38.304168	create	4e62f8eb-01e7-4cce-8de0-ce152d3ef683	RolePermission	\N	{"id": [null, "4e62f8eb-01e7-4cce-8de0-ce152d3ef683"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.304-03:00"], "updated_at": [null, "2026-03-01T09:46:38.304-03:00"], "permission_id": [null, "60852a8a-7bfa-437e-bcb7-f4d8e73243d4"]}	\N
164	2026-03-01 12:46:38.306291	create	7b917b20-e1f6-4ea3-ac2b-33dc32074c0c	RolePermission	\N	{"id": [null, "7b917b20-e1f6-4ea3-ac2b-33dc32074c0c"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.306-03:00"], "updated_at": [null, "2026-03-01T09:46:38.306-03:00"], "permission_id": [null, "9da7e7c0-60d5-4f19-8af0-4fa07c9ab8d7"]}	\N
165	2026-03-01 12:46:38.308253	create	fe814e67-34b9-4905-95d2-911b26ad9ea9	RolePermission	\N	{"id": [null, "fe814e67-34b9-4905-95d2-911b26ad9ea9"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.308-03:00"], "updated_at": [null, "2026-03-01T09:46:38.308-03:00"], "permission_id": [null, "b72caae2-5a08-4aea-8656-9e6b63a99290"]}	\N
166	2026-03-01 12:46:38.31026	create	2eb1eafc-1913-470d-81a1-c50fb8cdb531	RolePermission	\N	{"id": [null, "2eb1eafc-1913-470d-81a1-c50fb8cdb531"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.310-03:00"], "updated_at": [null, "2026-03-01T09:46:38.310-03:00"], "permission_id": [null, "24d52e89-247c-4690-a018-46e836fd8f23"]}	\N
167	2026-03-01 12:46:38.312383	create	42d3fa1f-5fe5-4810-b859-47297ea94b77	RolePermission	\N	{"id": [null, "42d3fa1f-5fe5-4810-b859-47297ea94b77"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.312-03:00"], "updated_at": [null, "2026-03-01T09:46:38.312-03:00"], "permission_id": [null, "3fd7a6f9-f101-4722-ba86-b0062a36211b"]}	\N
168	2026-03-01 12:46:38.314644	create	17d492a1-2658-4ff5-b1f3-6d7c2e9a3e35	RolePermission	\N	{"id": [null, "17d492a1-2658-4ff5-b1f3-6d7c2e9a3e35"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.314-03:00"], "updated_at": [null, "2026-03-01T09:46:38.314-03:00"], "permission_id": [null, "7370875d-48b3-45ad-8329-09653f09cc60"]}	\N
169	2026-03-01 12:46:38.316654	create	32deeef2-e5ac-4ab0-8f17-f532725c5073	RolePermission	\N	{"id": [null, "32deeef2-e5ac-4ab0-8f17-f532725c5073"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.316-03:00"], "updated_at": [null, "2026-03-01T09:46:38.316-03:00"], "permission_id": [null, "c6a3c7c5-fc53-4c84-a2d7-9e0ac9b55dd3"]}	\N
170	2026-03-01 12:46:38.318627	create	2c20cbe4-5b97-46e1-bed3-58944f67bc0a	RolePermission	\N	{"id": [null, "2c20cbe4-5b97-46e1-bed3-58944f67bc0a"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.318-03:00"], "updated_at": [null, "2026-03-01T09:46:38.318-03:00"], "permission_id": [null, "e4fac83a-14eb-43f2-adcd-ea882235b348"]}	\N
171	2026-03-01 12:46:38.320626	create	87047464-11d1-47d0-8788-0201d54a27d2	RolePermission	\N	{"id": [null, "87047464-11d1-47d0-8788-0201d54a27d2"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.320-03:00"], "updated_at": [null, "2026-03-01T09:46:38.320-03:00"], "permission_id": [null, "925fb8dc-72ea-493d-8839-2279f2e136a2"]}	\N
172	2026-03-01 12:46:38.322528	create	562d3756-790d-432a-884d-f2a832548e99	RolePermission	\N	{"id": [null, "562d3756-790d-432a-884d-f2a832548e99"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.322-03:00"], "updated_at": [null, "2026-03-01T09:46:38.322-03:00"], "permission_id": [null, "66ec275c-a758-401a-8859-24d4ad357f5d"]}	\N
173	2026-03-01 12:46:38.324665	create	9c787b01-29ef-4689-b31c-a50ca37ff457	RolePermission	\N	{"id": [null, "9c787b01-29ef-4689-b31c-a50ca37ff457"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.324-03:00"], "updated_at": [null, "2026-03-01T09:46:38.324-03:00"], "permission_id": [null, "1742a59d-df61-48fe-ac25-94d470289c65"]}	\N
174	2026-03-01 12:46:38.326562	create	9266e853-eb2a-4917-bc8c-d257fd55695a	RolePermission	\N	{"id": [null, "9266e853-eb2a-4917-bc8c-d257fd55695a"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.326-03:00"], "updated_at": [null, "2026-03-01T09:46:38.326-03:00"], "permission_id": [null, "51227b6a-0d78-4fda-af51-cb4c75c8c509"]}	\N
175	2026-03-01 12:46:38.328482	create	3c0307a0-0114-4318-b37e-2f91a8bc95b7	RolePermission	\N	{"id": [null, "3c0307a0-0114-4318-b37e-2f91a8bc95b7"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.328-03:00"], "updated_at": [null, "2026-03-01T09:46:38.328-03:00"], "permission_id": [null, "eac020e5-db47-4614-92cf-ed2139438067"]}	\N
176	2026-03-01 12:46:38.330675	create	d0d221a6-161e-4d5d-b32e-9a045c88361b	RolePermission	\N	{"id": [null, "d0d221a6-161e-4d5d-b32e-9a045c88361b"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.330-03:00"], "updated_at": [null, "2026-03-01T09:46:38.330-03:00"], "permission_id": [null, "28d7a980-2052-45f7-a569-5f952ea3d30f"]}	\N
177	2026-03-01 12:46:38.332629	create	a992d6e6-2b31-4ead-acd0-01314a4abe62	RolePermission	\N	{"id": [null, "a992d6e6-2b31-4ead-acd0-01314a4abe62"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.332-03:00"], "updated_at": [null, "2026-03-01T09:46:38.332-03:00"], "permission_id": [null, "c931414f-5870-4272-925d-5302000509ca"]}	\N
178	2026-03-01 12:46:38.334685	create	ff207c52-ce59-46bf-9a87-638af4509619	RolePermission	\N	{"id": [null, "ff207c52-ce59-46bf-9a87-638af4509619"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.334-03:00"], "updated_at": [null, "2026-03-01T09:46:38.334-03:00"], "permission_id": [null, "cdd59f12-ff36-4575-b060-bd74b7528e23"]}	\N
179	2026-03-01 12:46:38.336575	create	e7e87c8d-8bc8-485e-b120-5ceef0dac912	RolePermission	\N	{"id": [null, "e7e87c8d-8bc8-485e-b120-5ceef0dac912"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.336-03:00"], "updated_at": [null, "2026-03-01T09:46:38.336-03:00"], "permission_id": [null, "d052e09b-1d24-41c7-862f-5a92096d4d46"]}	\N
180	2026-03-01 12:46:38.338454	create	dd6196b1-b819-4002-bf79-13d1c18dc5ec	RolePermission	\N	{"id": [null, "dd6196b1-b819-4002-bf79-13d1c18dc5ec"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.338-03:00"], "updated_at": [null, "2026-03-01T09:46:38.338-03:00"], "permission_id": [null, "d84441b4-0714-4e79-a58c-6de2bd39ad72"]}	\N
181	2026-03-01 12:46:38.340351	create	22e10f24-abdc-4af0-a020-8ef87192eb72	RolePermission	\N	{"id": [null, "22e10f24-abdc-4af0-a020-8ef87192eb72"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.340-03:00"], "updated_at": [null, "2026-03-01T09:46:38.340-03:00"], "permission_id": [null, "f8924245-16d2-48b5-9662-ef094173696a"]}	\N
182	2026-03-01 12:46:38.342233	create	e77dfb12-5333-4df9-acb9-3350b6ef3d01	RolePermission	\N	{"id": [null, "e77dfb12-5333-4df9-acb9-3350b6ef3d01"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.342-03:00"], "updated_at": [null, "2026-03-01T09:46:38.342-03:00"], "permission_id": [null, "a2565feb-a158-443d-be75-f1fc393dae40"]}	\N
183	2026-03-01 12:46:38.344285	create	216c5404-4d86-409b-a33a-9bb9419bdde5	RolePermission	\N	{"id": [null, "216c5404-4d86-409b-a33a-9bb9419bdde5"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.344-03:00"], "updated_at": [null, "2026-03-01T09:46:38.344-03:00"], "permission_id": [null, "42767b8e-d2b3-43f6-915c-f4efc0e8a9be"]}	\N
184	2026-03-01 12:46:38.346218	create	bbc2631e-609c-405a-bb0c-c9346cd2b25e	RolePermission	\N	{"id": [null, "bbc2631e-609c-405a-bb0c-c9346cd2b25e"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.346-03:00"], "updated_at": [null, "2026-03-01T09:46:38.346-03:00"], "permission_id": [null, "97b06223-5a39-4916-aa80-b634cd690ed4"]}	\N
185	2026-03-01 12:46:38.348125	create	dbf69009-b33e-4787-895c-fd87083d88a2	RolePermission	\N	{"id": [null, "dbf69009-b33e-4787-895c-fd87083d88a2"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.348-03:00"], "updated_at": [null, "2026-03-01T09:46:38.348-03:00"], "permission_id": [null, "c9b0d998-b3b9-4e2c-be37-bfb513e1de33"]}	\N
186	2026-03-01 12:46:38.350081	create	2357a78b-1e40-4b6d-9974-8c39722a1286	RolePermission	\N	{"id": [null, "2357a78b-1e40-4b6d-9974-8c39722a1286"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.350-03:00"], "updated_at": [null, "2026-03-01T09:46:38.350-03:00"], "permission_id": [null, "de1cd953-433a-43a7-b597-7d7b72dffbe7"]}	\N
187	2026-03-01 12:46:38.352086	create	9df3836c-8f7a-4204-83ae-e4ec44c3cb51	RolePermission	\N	{"id": [null, "9df3836c-8f7a-4204-83ae-e4ec44c3cb51"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.352-03:00"], "updated_at": [null, "2026-03-01T09:46:38.352-03:00"], "permission_id": [null, "edd07c92-118f-4551-80ba-00cf9890f358"]}	\N
188	2026-03-01 12:46:38.354206	create	39b3b5ba-3d19-4e17-b5ec-bdea287f1f89	RolePermission	\N	{"id": [null, "39b3b5ba-3d19-4e17-b5ec-bdea287f1f89"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.354-03:00"], "updated_at": [null, "2026-03-01T09:46:38.354-03:00"], "permission_id": [null, "d5484571-a46f-4262-a6ab-26e945ff762e"]}	\N
189	2026-03-01 12:46:38.356102	create	45ecf818-a1ef-4359-883b-df95a2a00bba	RolePermission	\N	{"id": [null, "45ecf818-a1ef-4359-883b-df95a2a00bba"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.356-03:00"], "updated_at": [null, "2026-03-01T09:46:38.356-03:00"], "permission_id": [null, "24b00169-fc7c-456e-b1a0-c03942a48519"]}	\N
190	2026-03-01 12:46:38.357991	create	a9dab2e9-58ed-43d4-8aca-524d98c50a8d	RolePermission	\N	{"id": [null, "a9dab2e9-58ed-43d4-8aca-524d98c50a8d"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.357-03:00"], "updated_at": [null, "2026-03-01T09:46:38.357-03:00"], "permission_id": [null, "4d8af205-ad2c-4edd-80a7-0a2e4294f54a"]}	\N
191	2026-03-01 12:46:38.359884	create	c9639d10-9a52-4f39-869c-d479474d9db5	RolePermission	\N	{"id": [null, "c9639d10-9a52-4f39-869c-d479474d9db5"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.359-03:00"], "updated_at": [null, "2026-03-01T09:46:38.359-03:00"], "permission_id": [null, "2afdfcc1-46bf-4501-b111-932e3c1692ed"]}	\N
192	2026-03-01 12:46:38.361838	create	ca463bd5-3b83-4c81-b60c-27f34bb04dd5	RolePermission	\N	{"id": [null, "ca463bd5-3b83-4c81-b60c-27f34bb04dd5"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.361-03:00"], "updated_at": [null, "2026-03-01T09:46:38.361-03:00"], "permission_id": [null, "641209c4-4f6e-4ff3-b638-c9043ad8bdd6"]}	\N
193	2026-03-01 12:46:38.363901	create	33eb6759-e4dc-429c-8aff-e6ecd9f8c086	RolePermission	\N	{"id": [null, "33eb6759-e4dc-429c-8aff-e6ecd9f8c086"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.363-03:00"], "updated_at": [null, "2026-03-01T09:46:38.363-03:00"], "permission_id": [null, "66eebba6-26d7-43d1-99ec-bc1a6c6e0290"]}	\N
194	2026-03-01 12:46:38.365783	create	c0406262-392f-47de-90a3-33d3d14bebf2	RolePermission	\N	{"id": [null, "c0406262-392f-47de-90a3-33d3d14bebf2"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.365-03:00"], "updated_at": [null, "2026-03-01T09:46:38.365-03:00"], "permission_id": [null, "8d3249ea-e22f-4a72-9ef5-bdd364356b0f"]}	\N
195	2026-03-01 12:46:38.367815	create	523d2bcc-3512-4a1a-bbb0-8ccddcd30c82	RolePermission	\N	{"id": [null, "523d2bcc-3512-4a1a-bbb0-8ccddcd30c82"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.367-03:00"], "updated_at": [null, "2026-03-01T09:46:38.367-03:00"], "permission_id": [null, "47aae2de-f0fb-479c-9a1c-ed146db1103f"]}	\N
196	2026-03-01 12:46:38.36994	create	0f5db6e0-06cb-4207-83f3-fdfe0213aaca	RolePermission	\N	{"id": [null, "0f5db6e0-06cb-4207-83f3-fdfe0213aaca"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.369-03:00"], "updated_at": [null, "2026-03-01T09:46:38.369-03:00"], "permission_id": [null, "1fd15150-7e9f-405e-b8fc-75e8799a384b"]}	\N
197	2026-03-01 12:46:38.372119	create	e9f58266-3ad3-4c97-a000-c878820534e7	RolePermission	\N	{"id": [null, "e9f58266-3ad3-4c97-a000-c878820534e7"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.372-03:00"], "updated_at": [null, "2026-03-01T09:46:38.372-03:00"], "permission_id": [null, "4cbe598d-ca89-4e97-a956-49c7c4844db8"]}	\N
198	2026-03-01 12:46:38.374553	create	d42a2701-5435-4137-b2ea-da038224832b	RolePermission	\N	{"id": [null, "d42a2701-5435-4137-b2ea-da038224832b"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.374-03:00"], "updated_at": [null, "2026-03-01T09:46:38.374-03:00"], "permission_id": [null, "8bd401b5-9395-4b03-a437-5b1eebb1ab0e"]}	\N
199	2026-03-01 12:46:38.377009	create	87f92f6c-a6be-488c-96c1-3130b5c3faab	RolePermission	\N	{"id": [null, "87f92f6c-a6be-488c-96c1-3130b5c3faab"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.377-03:00"], "updated_at": [null, "2026-03-01T09:46:38.377-03:00"], "permission_id": [null, "c9f56b56-6523-491a-9d49-0622cd7c45de"]}	\N
200	2026-03-01 12:46:38.37938	create	44cfd30f-e648-4b1c-aff0-5ff420e23eb3	RolePermission	\N	{"id": [null, "44cfd30f-e648-4b1c-aff0-5ff420e23eb3"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.379-03:00"], "updated_at": [null, "2026-03-01T09:46:38.379-03:00"], "permission_id": [null, "21b7da72-980a-45ab-a47b-fe29125cbf6f"]}	\N
201	2026-03-01 12:46:38.381768	create	c6c2af62-231f-4277-ada9-3d79ce6af6d7	RolePermission	\N	{"id": [null, "c6c2af62-231f-4277-ada9-3d79ce6af6d7"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.381-03:00"], "updated_at": [null, "2026-03-01T09:46:38.381-03:00"], "permission_id": [null, "89add6b8-0bc8-4e12-8f87-d226280c8e93"]}	\N
202	2026-03-01 12:46:38.384128	create	8e19a589-7c54-4eef-9d3a-c1c515a75b11	RolePermission	\N	{"id": [null, "8e19a589-7c54-4eef-9d3a-c1c515a75b11"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.384-03:00"], "updated_at": [null, "2026-03-01T09:46:38.384-03:00"], "permission_id": [null, "75c0939f-a0d3-46f2-86d1-ad9368c6ebe9"]}	\N
203	2026-03-01 12:46:38.387058	create	9969014d-d732-4f71-ad94-0a10c0965316	RolePermission	\N	{"id": [null, "9969014d-d732-4f71-ad94-0a10c0965316"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.387-03:00"], "updated_at": [null, "2026-03-01T09:46:38.387-03:00"], "permission_id": [null, "49ca6da7-2fe4-445c-9f21-37ab9fe6b536"]}	\N
204	2026-03-01 12:46:38.38983	create	fa5d0a91-c970-4df6-b1aa-90eca641fcc9	RolePermission	\N	{"id": [null, "fa5d0a91-c970-4df6-b1aa-90eca641fcc9"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.389-03:00"], "updated_at": [null, "2026-03-01T09:46:38.389-03:00"], "permission_id": [null, "ecfdeda6-893d-4111-ac84-6c92aee0580a"]}	\N
205	2026-03-01 12:46:38.392334	create	6b44ec99-f004-4831-82fb-1af0a6dd4e35	RolePermission	\N	{"id": [null, "6b44ec99-f004-4831-82fb-1af0a6dd4e35"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.392-03:00"], "updated_at": [null, "2026-03-01T09:46:38.392-03:00"], "permission_id": [null, "f95b6010-d615-4a0a-8039-1f079d2e42ca"]}	\N
206	2026-03-01 12:46:38.395018	create	0407ddf9-349c-4b56-bbc6-d7e0c19baa07	RolePermission	\N	{"id": [null, "0407ddf9-349c-4b56-bbc6-d7e0c19baa07"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.395-03:00"], "updated_at": [null, "2026-03-01T09:46:38.395-03:00"], "permission_id": [null, "98f89768-492b-47fd-8ac1-b7f494dfaa63"]}	\N
207	2026-03-01 12:46:38.397553	create	1cf2275c-0c1e-4e79-8401-e27ab98f6192	RolePermission	\N	{"id": [null, "1cf2275c-0c1e-4e79-8401-e27ab98f6192"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.397-03:00"], "updated_at": [null, "2026-03-01T09:46:38.397-03:00"], "permission_id": [null, "280f5d8f-1d64-4686-8ece-926277373dbd"]}	\N
208	2026-03-01 12:46:38.400139	create	b38e06db-9bc9-450e-82c3-1e3a917e071b	RolePermission	\N	{"id": [null, "b38e06db-9bc9-450e-82c3-1e3a917e071b"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.400-03:00"], "updated_at": [null, "2026-03-01T09:46:38.400-03:00"], "permission_id": [null, "f59fd897-ba79-4529-834b-dca80b828968"]}	\N
209	2026-03-01 12:46:38.402715	create	0328dc49-dc92-4e53-bcea-6e24a1edf6f1	RolePermission	\N	{"id": [null, "0328dc49-dc92-4e53-bcea-6e24a1edf6f1"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.402-03:00"], "updated_at": [null, "2026-03-01T09:46:38.402-03:00"], "permission_id": [null, "9da96cc4-f4d8-4f4b-8d50-70ee74d79974"]}	\N
210	2026-03-01 12:46:38.405261	create	c727f3d1-5e70-4d39-9ed6-a0b32662f042	RolePermission	\N	{"id": [null, "c727f3d1-5e70-4d39-9ed6-a0b32662f042"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.405-03:00"], "updated_at": [null, "2026-03-01T09:46:38.405-03:00"], "permission_id": [null, "84f859d8-43c7-4087-9bc2-78429b994169"]}	\N
211	2026-03-01 12:46:38.407868	create	874980e3-4578-4676-af7f-151cc4926f56	RolePermission	\N	{"id": [null, "874980e3-4578-4676-af7f-151cc4926f56"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.407-03:00"], "updated_at": [null, "2026-03-01T09:46:38.407-03:00"], "permission_id": [null, "7715e0db-728a-4c91-86ef-bfe4d0cce57f"]}	\N
212	2026-03-01 12:46:38.410335	create	cb58ebde-dac9-4537-a058-6fc3d5a3b3eb	RolePermission	\N	{"id": [null, "cb58ebde-dac9-4537-a058-6fc3d5a3b3eb"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.410-03:00"], "updated_at": [null, "2026-03-01T09:46:38.410-03:00"], "permission_id": [null, "baa3d8a8-76f2-49ca-b5f9-37e02666a634"]}	\N
213	2026-03-01 12:46:38.412954	create	68d3dca1-b807-4c8e-a65c-7a4dc5225b48	RolePermission	\N	{"id": [null, "68d3dca1-b807-4c8e-a65c-7a4dc5225b48"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.412-03:00"], "updated_at": [null, "2026-03-01T09:46:38.412-03:00"], "permission_id": [null, "c18f4384-160b-426f-903b-5b629c2b9803"]}	\N
214	2026-03-01 12:46:38.415474	create	083872d7-e573-41d0-959e-dbea43317858	RolePermission	\N	{"id": [null, "083872d7-e573-41d0-959e-dbea43317858"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.415-03:00"], "updated_at": [null, "2026-03-01T09:46:38.415-03:00"], "permission_id": [null, "ca4b6383-5b72-4a80-91b0-596b8bb89c06"]}	\N
215	2026-03-01 12:46:38.418018	create	d009a254-1714-4c3a-af38-1db4ae8e23b0	RolePermission	\N	{"id": [null, "d009a254-1714-4c3a-af38-1db4ae8e23b0"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.418-03:00"], "updated_at": [null, "2026-03-01T09:46:38.418-03:00"], "permission_id": [null, "3bede7fd-1fe3-489e-a558-976704c6bcaa"]}	\N
216	2026-03-01 12:46:38.420549	create	55a248de-f733-4708-8875-5f5fa67ff65e	RolePermission	\N	{"id": [null, "55a248de-f733-4708-8875-5f5fa67ff65e"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.420-03:00"], "updated_at": [null, "2026-03-01T09:46:38.420-03:00"], "permission_id": [null, "7b4e4888-40aa-469c-ac48-647b788b62b0"]}	\N
217	2026-03-01 12:46:38.422875	create	00d47b94-1891-48ce-9740-0979f7a4f45b	RolePermission	\N	{"id": [null, "00d47b94-1891-48ce-9740-0979f7a4f45b"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.422-03:00"], "updated_at": [null, "2026-03-01T09:46:38.422-03:00"], "permission_id": [null, "15e636b1-bc2e-43d4-85af-c018e601c077"]}	\N
218	2026-03-01 12:46:38.425145	create	c72b3464-b362-4f72-9818-731e29d82a70	RolePermission	\N	{"id": [null, "c72b3464-b362-4f72-9818-731e29d82a70"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.425-03:00"], "updated_at": [null, "2026-03-01T09:46:38.425-03:00"], "permission_id": [null, "ba1a3e09-6491-4d55-872c-4bd7a42286f6"]}	\N
219	2026-03-01 12:46:38.427323	create	15d4a380-83bb-4f34-85b1-18bf05c4aa76	RolePermission	\N	{"id": [null, "15d4a380-83bb-4f34-85b1-18bf05c4aa76"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.427-03:00"], "updated_at": [null, "2026-03-01T09:46:38.427-03:00"], "permission_id": [null, "3a5934b9-bc65-4a2b-bdaf-5c091e54713b"]}	\N
220	2026-03-01 12:46:38.429598	create	58c54450-83e5-464f-a328-2f11378bb8aa	RolePermission	\N	{"id": [null, "58c54450-83e5-464f-a328-2f11378bb8aa"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.429-03:00"], "updated_at": [null, "2026-03-01T09:46:38.429-03:00"], "permission_id": [null, "7bee675d-4e47-4d84-9b02-b64f348329b8"]}	\N
221	2026-03-01 12:46:38.431908	create	a146a9b1-6f55-412f-b951-fca855ec151b	RolePermission	\N	{"id": [null, "a146a9b1-6f55-412f-b951-fca855ec151b"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.431-03:00"], "updated_at": [null, "2026-03-01T09:46:38.431-03:00"], "permission_id": [null, "9875cdca-e925-4bdc-b885-d79487dd16c5"]}	\N
222	2026-03-01 12:46:38.43425	create	b441a89e-d9e7-46bc-b60a-ea090cccaf53	RolePermission	\N	{"id": [null, "b441a89e-d9e7-46bc-b60a-ea090cccaf53"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.434-03:00"], "updated_at": [null, "2026-03-01T09:46:38.434-03:00"], "permission_id": [null, "4b549141-8dea-4c53-aa29-061a0ff94c8c"]}	\N
223	2026-03-01 12:46:38.436588	create	f9d42a6c-c9c6-4df8-8fe1-1ae80ca773b0	RolePermission	\N	{"id": [null, "f9d42a6c-c9c6-4df8-8fe1-1ae80ca773b0"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.436-03:00"], "updated_at": [null, "2026-03-01T09:46:38.436-03:00"], "permission_id": [null, "c5fbcd5b-d03e-40f9-85e4-8f29be27bf75"]}	\N
224	2026-03-01 12:46:38.438838	create	ba497c0d-d2b4-4b84-bdf0-0ee15a1b5174	RolePermission	\N	{"id": [null, "ba497c0d-d2b4-4b84-bdf0-0ee15a1b5174"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.438-03:00"], "updated_at": [null, "2026-03-01T09:46:38.438-03:00"], "permission_id": [null, "ce576331-15d7-4a00-99ba-be22aae71255"]}	\N
225	2026-03-01 12:46:38.441105	create	0f083938-fc5e-422b-972a-7f783a5d56c2	RolePermission	\N	{"id": [null, "0f083938-fc5e-422b-972a-7f783a5d56c2"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.441-03:00"], "updated_at": [null, "2026-03-01T09:46:38.441-03:00"], "permission_id": [null, "d26e6037-aa53-4ee0-b28f-fbde20b8c469"]}	\N
226	2026-03-01 12:46:38.443416	create	6bbecc01-319e-40d8-afae-e7d77f420ff3	RolePermission	\N	{"id": [null, "6bbecc01-319e-40d8-afae-e7d77f420ff3"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.443-03:00"], "updated_at": [null, "2026-03-01T09:46:38.443-03:00"], "permission_id": [null, "ad5ee08a-f6df-4e08-a1cc-a747d795e6b6"]}	\N
227	2026-03-01 12:46:38.445902	create	724997b6-9fb7-4e57-94e4-4c6d19bc0b57	RolePermission	\N	{"id": [null, "724997b6-9fb7-4e57-94e4-4c6d19bc0b57"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.445-03:00"], "updated_at": [null, "2026-03-01T09:46:38.445-03:00"], "permission_id": [null, "b552171c-4ee2-4745-8bad-7e1bd900789d"]}	\N
228	2026-03-01 12:46:38.448332	create	25415852-a233-4a93-9c2f-abac790f9898	RolePermission	\N	{"id": [null, "25415852-a233-4a93-9c2f-abac790f9898"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.448-03:00"], "updated_at": [null, "2026-03-01T09:46:38.448-03:00"], "permission_id": [null, "b9d5a322-2578-4c6f-9233-b07c260e0c82"]}	\N
229	2026-03-01 12:46:38.45067	create	29906bb8-9606-4b5b-8b99-8e0ed81372ff	RolePermission	\N	{"id": [null, "29906bb8-9606-4b5b-8b99-8e0ed81372ff"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.450-03:00"], "updated_at": [null, "2026-03-01T09:46:38.450-03:00"], "permission_id": [null, "c359feee-7bda-439f-b570-5810f85818ce"]}	\N
230	2026-03-01 12:46:38.453099	create	4f1308d0-c24d-436a-8a5e-d2e4379a74c4	RolePermission	\N	{"id": [null, "4f1308d0-c24d-436a-8a5e-d2e4379a74c4"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.453-03:00"], "updated_at": [null, "2026-03-01T09:46:38.453-03:00"], "permission_id": [null, "008818b5-9962-4687-835e-97736b90f841"]}	\N
231	2026-03-01 12:46:38.455404	create	9e7ac072-9cf9-4500-bf2b-d2c0bc318e6b	RolePermission	\N	{"id": [null, "9e7ac072-9cf9-4500-bf2b-d2c0bc318e6b"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.455-03:00"], "updated_at": [null, "2026-03-01T09:46:38.455-03:00"], "permission_id": [null, "65348af8-19f0-440c-a77b-0656daf88029"]}	\N
232	2026-03-01 12:46:38.457729	create	b0670a9c-a338-4667-9e30-f9cc43c4fdac	RolePermission	\N	{"id": [null, "b0670a9c-a338-4667-9e30-f9cc43c4fdac"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "created_at": [null, "2026-03-01T09:46:38.457-03:00"], "updated_at": [null, "2026-03-01T09:46:38.457-03:00"], "permission_id": [null, "6f0c995c-1725-4ca0-b068-4097b78a16e7"]}	\N
233	2026-03-01 12:46:38.695329	create	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02	User	\N	{"id": [null, "d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02"], "jti": [null, "a9ae8618-484c-4aaf-b4c6-e4aa33f98399"], "email": ["", "apex@example.com"], "created_at": [null, "2026-03-01T09:46:38.695-03:00"], "updated_at": [null, "2026-03-01T09:46:38.695-03:00"], "encrypted_password": ["", "$2a$12$e/DkyWbDpFmtK9786qWMoeDfST5c/NYsYNVM4ehESb/u43N1MeB4u"]}	\N
234	2026-03-01 12:46:38.706267	create	435601cf-1669-4eb6-ad86-f9e98b928062	UserRole	\N	{"id": [null, "435601cf-1669-4eb6-ad86-f9e98b928062"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "user_id": [null, "d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02"], "created_at": [null, "2026-03-01T09:46:38.706-03:00"], "updated_at": [null, "2026-03-01T09:46:38.706-03:00"]}	\N
235	2026-03-01 12:46:38.932121	create	d9b32143-6d50-4136-bf17-63411f93133f	User	\N	{"id": [null, "d9b32143-6d50-4136-bf17-63411f93133f"], "jti": [null, "e1c20abf-cdbb-4693-8b4f-eaeed207a91b"], "email": ["", "editor@example.com"], "created_at": [null, "2026-03-01T09:46:38.932-03:00"], "updated_at": [null, "2026-03-01T09:46:38.932-03:00"], "encrypted_password": ["", "$2a$12$duWiURzKPDyCOkhA.kTMiOyfVS6RaG6dYJoOZsseD7lRmD1ovRGdq"]}	\N
236	2026-03-01 12:46:38.935914	create	df1c54cc-a065-4d83-9a03-680f81c875be	UserRole	\N	{"id": [null, "df1c54cc-a065-4d83-9a03-680f81c875be"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "user_id": [null, "d9b32143-6d50-4136-bf17-63411f93133f"], "created_at": [null, "2026-03-01T09:46:38.935-03:00"], "updated_at": [null, "2026-03-01T09:46:38.935-03:00"]}	\N
237	2026-03-01 12:46:39.154266	create	4492cecd-c7d1-43ab-9158-fcd936bca661	User	\N	{"id": [null, "4492cecd-c7d1-43ab-9158-fcd936bca661"], "jti": [null, "2e2d047e-7246-45fc-8dd1-c8edbc157dc6"], "email": ["", "viewer@example.com"], "created_at": [null, "2026-03-01T09:46:39.154-03:00"], "updated_at": [null, "2026-03-01T09:46:39.154-03:00"], "encrypted_password": ["", "$2a$12$3781Z1napavLI4Q8pUMNPe9hRCfMehJeVvWtm8DG3g4TQ3shXelOa"]}	\N
238	2026-03-01 12:46:39.158046	create	76050fc0-0f56-429f-954d-7a2744f65d1a	UserRole	\N	{"id": [null, "76050fc0-0f56-429f-954d-7a2744f65d1a"], "role_id": [null, "0c8ae692-cf4e-4c9e-9275-151f1ab2c80e"], "user_id": [null, "4492cecd-c7d1-43ab-9158-fcd936bca661"], "created_at": [null, "2026-03-01T09:46:39.158-03:00"], "updated_at": [null, "2026-03-01T09:46:39.158-03:00"]}	\N
239	2026-03-01 12:46:39.161174	create	97a80655-9007-44bd-b40f-4766f938a061	UserRole	\N	{"id": [null, "97a80655-9007-44bd-b40f-4766f938a061"], "role_id": [null, "4c0c190b-4011-4800-8b7f-62ad7355e11e"], "user_id": [null, "d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02"], "created_at": [null, "2026-03-01T09:46:39.161-03:00"], "updated_at": [null, "2026-03-01T09:46:39.161-03:00"]}	\N
240	2026-03-01 12:46:39.165201	create	cf163ae9-01b2-4f7f-9621-db15eddc7509	UserRole	\N	{"id": [null, "cf163ae9-01b2-4f7f-9621-db15eddc7509"], "role_id": [null, "dc71c4e3-03b6-4594-8fd2-9cccf7d26181"], "user_id": [null, "d9b32143-6d50-4136-bf17-63411f93133f"], "created_at": [null, "2026-03-01T09:46:39.165-03:00"], "updated_at": [null, "2026-03-01T09:46:39.165-03:00"]}	\N
241	2026-03-05 13:32:50.504791	create	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	Company	\N	{"id": [null, "c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8"], "name": [null, "APEX"], "email": [null, "apex@example.com"], "phone": [null, "84987859647"], "tagline": [null, "Soluções Jurídicas e Empreededorismo"], "created_at": [null, "2026-03-05T10:32:50.504-03:00"], "updated_at": [null, "2026-03-05T10:32:50.504-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
242	2026-03-05 13:34:10.220818	update	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	Company	---\nname: APEX\ntagline: Soluções Jurídicas e Empreededorismo\nemail: apex@example.com\nphone: '84987859647'\nid: c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8\ncreated_at: 2026-03-05 13:32:50.504791000 +00:00\nupdated_at: 2026-03-05 13:32:50.504791000 +00:00\n	{"tagline": ["Soluções Jurídicas e Empreededorismo", "Empreendedorismo e Soluções Jurídicas"], "updated_at": ["2026-03-05T10:32:50.504-03:00", "2026-03-05T10:34:10.220-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
243	2026-03-05 13:35:22.863058	create	ed57e782-7107-4e91-b3fd-6dfde307d630	HeroCard	\N	{"title": [null, "Consultoria"], "active": [null, true], "position": [null, 1], "description": [null, "Consultoria Jurídica avançada para sua empresa"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
244	2026-03-05 13:35:49.572677	create	bf8a10f9-9d93-438c-ab54-55f0728718bf	HeroCard	\N	{"title": [null, "Registro de Marca"], "active": [null, true], "position": [null, 2], "description": [null, "Oferecemos o registro da sua marca dentro da legalidade"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
245	2026-03-05 13:36:17.149319	create	63e295ec-9ac8-4511-b27f-a944abb9fcdc	HeroCard	\N	{"title": [null, "Assessoria Jurídica"], "active": [null, true], "position": [null, 3], "description": [null, "Mantenha sua empresa segura\\n"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
257	2026-03-06 00:09:27.554575	create	76184473-dd19-4afd-a188-b5c25a72fef5	Member	\N	{"id": [null, "76184473-dd19-4afd-a188-b5c25a72fef5"], "role": [null, "Consultora de Projetos"], "email": [null, "apex5@example.com"], "image": [null, "d5e768ed-4e93-45dc-b56c-d4269067926d.webp"], "phone": [null, "8499999999"], "full_name": [null, "Alice"], "created_at": [null, "2026-03-05T21:09:27.554-03:00"], "updated_at": [null, "2026-03-05T21:09:27.554-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
246	2026-03-05 13:38:51.118052	create	05dac0d6-6372-449b-8240-8ae944b0c81a	HeroBanner	\N	{"id": [null, "05dac0d6-6372-449b-8240-8ae944b0c81a"], "image": [null, "589cb10e-40b7-49ae-aa70-0a4a1d19beee.png"], "title": [null, "CONHEÇA UM POUCO SOBRE A NOSSA EMPRESA"], "created_at": [null, "2026-03-05T10:38:51.118-03:00"], "updated_at": [null, "2026-03-05T10:38:51.118-03:00"], "description": [null, "A APEX é uma empresa júnior que atua nas áreas de empreendedorismo e direito, oferecendo soluções inovadoras e acessíveis para empresas e empreendedores. Nossa missão é contribuir para o desenvolvimento do ecossistema empreendedor através de serviços jurídicos de qualidade e consultoria empresarial especializada."]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
247	2026-03-05 13:39:41.154438	update	05dac0d6-6372-449b-8240-8ae944b0c81a	HeroBanner	---\ntitle: CONHEÇA UM POUCO SOBRE A NOSSA EMPRESA\ndescription: A APEX é uma empresa júnior que atua nas áreas de empreendedorismo e\n  direito, oferecendo soluções inovadoras e acessíveis para empresas e empreendedores.\n  Nossa missão é contribuir para o desenvolvimento do ecossistema empreendedor através\n  de serviços jurídicos de qualidade e consultoria empresarial especializada.\nactive: true\nimage: 589cb10e-40b7-49ae-aa70-0a4a1d19beee.png\nid: 05dac0d6-6372-449b-8240-8ae944b0c81a\ncreated_at: 2026-03-05 13:38:51.118052000 +00:00\nupdated_at: 2026-03-05 13:38:51.118052000 +00:00\n	{"image": ["589cb10e-40b7-49ae-aa70-0a4a1d19beee.png", "2de1ad89-91be-45a4-a33c-4fd5d36d4e1a.png"], "updated_at": ["2026-03-05T10:38:51.118-03:00", "2026-03-05T10:39:41.154-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
248	2026-03-05 13:40:03.255543	update	05dac0d6-6372-449b-8240-8ae944b0c81a	HeroBanner	---\ntitle: CONHEÇA UM POUCO SOBRE A NOSSA EMPRESA\ndescription: A APEX é uma empresa júnior que atua nas áreas de empreendedorismo e\n  direito, oferecendo soluções inovadoras e acessíveis para empresas e empreendedores.\n  Nossa missão é contribuir para o desenvolvimento do ecossistema empreendedor através\n  de serviços jurídicos de qualidade e consultoria empresarial especializada.\nactive: true\nimage: 2de1ad89-91be-45a4-a33c-4fd5d36d4e1a.png\nid: 05dac0d6-6372-449b-8240-8ae944b0c81a\ncreated_at: 2026-03-05 13:38:51.118052000 +00:00\nupdated_at: 2026-03-05 13:39:41.154438000 +00:00\n	{"image": ["2de1ad89-91be-45a4-a33c-4fd5d36d4e1a.png", "f42901cb-322a-4970-aa29-ac3b9773d12c.png"], "updated_at": ["2026-03-05T10:39:41.154-03:00", "2026-03-05T10:40:03.255-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
249	2026-03-05 13:40:25.856347	update	05dac0d6-6372-449b-8240-8ae944b0c81a	HeroBanner	---\ntitle: CONHEÇA UM POUCO SOBRE A NOSSA EMPRESA\ndescription: A APEX é uma empresa júnior que atua nas áreas de empreendedorismo e\n  direito, oferecendo soluções inovadoras e acessíveis para empresas e empreendedores.\n  Nossa missão é contribuir para o desenvolvimento do ecossistema empreendedor através\n  de serviços jurídicos de qualidade e consultoria empresarial especializada.\nactive: true\nimage: f42901cb-322a-4970-aa29-ac3b9773d12c.png\nid: 05dac0d6-6372-449b-8240-8ae944b0c81a\ncreated_at: 2026-03-05 13:38:51.118052000 +00:00\nupdated_at: 2026-03-05 13:40:03.255543000 +00:00\n	{"image": ["f42901cb-322a-4970-aa29-ac3b9773d12c.png", "a28e16f6-f5a6-4c3e-ab4e-c3369a8a9bc8.png"], "updated_at": ["2026-03-05T10:40:03.255-03:00", "2026-03-05T10:40:25.856-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
250	2026-03-05 13:53:16.374421	create	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	\N	{"id": [null, "81f72c8d-f53a-4553-bba5-475be4e76bbd"], "role": [null, "Presidente"], "email": [null, "apex@example.com"], "image": [null, "c35a7cf7-7935-4d0e-9226-23254e287d92.jpg"], "phone": [null, "84987859647"], "full_name": [null, "João Felipe"], "created_at": [null, "2026-03-05T10:53:16.374-03:00"], "updated_at": [null, "2026-03-05T10:53:16.374-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
251	2026-03-06 00:02:40.259095	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe\nemail: apex@example.com\nrole: Presidente\nphone: '84987859647'\nactive: true\nimage: c35a7cf7-7935-4d0e-9226-23254e287d92.jpg\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfeatured: false\nupdated_at: 2026-03-05 13:53:16.374421000 +00:00\n	{"image": ["c35a7cf7-7935-4d0e-9226-23254e287d92.jpg", "4f3bcb36-48d2-449a-8a16-6cc2ffe657a3.jpg"], "updated_at": ["2026-03-05T10:53:16.374-03:00", "2026-03-05T21:02:40.259-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
252	2026-03-06 00:04:57.490336	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe\nemail: apex@example.com\nrole: Presidente\nphone: '84987859647'\nactive: true\nimage: 4f3bcb36-48d2-449a-8a16-6cc2ffe657a3.jpg\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfeatured: false\nupdated_at: 2026-03-06 00:02:40.259095000 +00:00\n	{"image": ["4f3bcb36-48d2-449a-8a16-6cc2ffe657a3.jpg", "75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp"], "updated_at": ["2026-03-05T21:02:40.259-03:00", "2026-03-05T21:04:57.490-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
253	2026-03-06 00:05:18.24103	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe\nemail: apex@example.com\nrole: Presidente\nphone: '84987859647'\nactive: true\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfeatured: false\nupdated_at: 2026-03-06 00:04:57.490336000 +00:00\n	{"phone": ["84987859647", "849999999"], "updated_at": ["2026-03-05T21:04:57.490-03:00", "2026-03-05T21:05:18.241-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
254	2026-03-06 00:06:23.969803	create	2d79e29f-21d3-4368-8b97-c771bf7197df	Member	\N	{"id": [null, "2d79e29f-21d3-4368-8b97-c771bf7197df"], "role": [null, "Vice-presidente"], "email": [null, "apex2@example.com"], "image": [null, "fea09cdf-7e33-4aa1-a359-05d11945d248.webp"], "phone": [null, "849999999999"], "full_name": [null, "Maria Vitória "], "created_at": [null, "2026-03-05T21:06:23.969-03:00"], "updated_at": [null, "2026-03-05T21:06:23.969-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
255	2026-03-06 00:07:03.653303	create	49f78d51-d302-4356-853e-363acd82eabe	Member	\N	{"id": [null, "49f78d51-d302-4356-853e-363acd82eabe"], "role": [null, "Diretor financeiro"], "email": [null, "apex3@example.com"], "image": [null, "a4193994-7db5-4c62-b69f-2178cb291e77.webp"], "phone": [null, "84999999999"], "full_name": [null, "Luiz"], "created_at": [null, "2026-03-05T21:07:03.653-03:00"], "updated_at": [null, "2026-03-05T21:07:03.653-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
256	2026-03-06 00:07:41.510037	create	4b3eec5a-91a7-4b70-8898-52c89cdcec65	Member	\N	{"id": [null, "4b3eec5a-91a7-4b70-8898-52c89cdcec65"], "role": [null, "Financeiro"], "email": [null, "apex4@example.com"], "image": [null, "7e1bbd1a-af76-4a3a-8e16-1eaecd00e6d6.webp"], "phone": [null, "849999999"], "full_name": [null, "Ricardo"], "created_at": [null, "2026-03-05T21:07:41.510-03:00"], "updated_at": [null, "2026-03-05T21:07:41.510-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
258	2026-03-06 00:10:53.4398	create	bf2163ad-44e8-49f3-b5bb-39f9f6e32a10	Member	\N	{"id": [null, "bf2163ad-44e8-49f3-b5bb-39f9f6e32a10"], "role": [null, "Consultor Financeiro"], "email": [null, "apex6@example.com"], "image": [null, "13c78177-374e-4579-9236-2dd9d635d1cf.webp"], "phone": [null, "84999999"], "full_name": [null, "Pedro"], "created_at": [null, "2026-03-05T21:10:53.439-03:00"], "updated_at": [null, "2026-03-05T21:10:53.439-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
259	2026-03-06 00:15:32.153429	create	4419d32a-0923-4502-b8cb-12b1eaee1030	ExtensionCore	\N	{"id": [null, "4419d32a-0923-4502-b8cb-12b1eaee1030"], "icon": [null, "6a964179-812f-482d-b181-1cf7f589fef8.png"], "name": [null, "Núcleo Apex de Empreendedorismo"], "images": [null, ["797ddee7-50f2-495f-95e7-9ede9ba83ca9.jpeg"]], "acronym": [null, "NAEM"], "member_id": [null, "bf2163ad-44e8-49f3-b5bb-39f9f6e32a10"], "created_at": [null, "2026-03-05T21:15:32.153-03:00"], "updated_at": [null, "2026-03-05T21:15:32.153-03:00"], "description": [null, "Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo e inovação no ecossistema empresarial."]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
260	2026-03-06 00:16:57.29711	create	63d66160-cf1b-4867-8113-45ea3efc6977	Project	\N	{"id": [null, "63d66160-cf1b-4867-8113-45ea3efc6977"], "name": [null, "Projeto empreendedor nas escolas"], "details": [null, ""], "created_at": [null, "2026-03-05T21:16:57.297-03:00"], "updated_at": [null, "2026-03-05T21:16:57.297-03:00"], "description": [null, "Disseminação do empreendedorismo nas escolas "], "extension_core_id": [null, "4419d32a-0923-4502-b8cb-12b1eaee1030"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
261	2026-03-06 00:17:19.082141	update	4419d32a-0923-4502-b8cb-12b1eaee1030	ExtensionCore	---\nacronym: NAEM\nname: Núcleo Apex de Empreendedorismo\ndescription: Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo\n  e inovação no ecossistema empresarial.\nmember_id: bf2163ad-44e8-49f3-b5bb-39f9f6e32a10\nicon: 6a964179-812f-482d-b181-1cf7f589fef8.png\nimages: '["797ddee7-50f2-495f-95e7-9ede9ba83ca9.jpeg"]'\nid: 4419d32a-0923-4502-b8cb-12b1eaee1030\ncreated_at: 2026-03-06 00:15:32.153429000 +00:00\nupdated_at: 2026-03-06 00:15:32.153429000 +00:00\n	{"icon": ["6a964179-812f-482d-b181-1cf7f589fef8.png", "d674e711-4a0a-40fd-9dd0-f2a778955416.png"], "updated_at": ["2026-03-05T21:15:32.153-03:00", "2026-03-05T21:17:19.082-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
262	2026-03-06 00:18:34.859576	create	0d26c63f-1406-4a79-b5a7-93bd54f2253e	Project	\N	{"id": [null, "0d26c63f-1406-4a79-b5a7-93bd54f2253e"], "name": [null, "Projeto empreendedor nas Universidades"], "details": [null, ""], "created_at": [null, "2026-03-05T21:18:34.859-03:00"], "updated_at": [null, "2026-03-05T21:18:34.859-03:00"], "description": [null, "Disseminação do empreendedorismo nas universidades"], "extension_core_id": [null, "4419d32a-0923-4502-b8cb-12b1eaee1030"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
263	2026-03-06 00:19:17.811944	update	63d66160-cf1b-4867-8113-45ea3efc6977	Project	---\nname: Projeto empreendedor nas escolas\ndescription: 'Disseminação do empreendedorismo nas escolas '\ndetails: ''\nfeatured: false\nactive: true\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nid: 63d66160-cf1b-4867-8113-45ea3efc6977\ncreated_at: 2026-03-06 00:16:57.297110000 +00:00\nupdated_at: 2026-03-06 00:16:57.297110000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-05T21:16:57.297-03:00", "2026-03-05T21:19:17.811-03:00"], "description": ["Disseminação do empreendedorismo nas escolas ", "Espirito empreendedor nas escolas"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
264	2026-03-06 00:20:07.70162	update	63d66160-cf1b-4867-8113-45ea3efc6977	Project	---\nname: Projeto empreendedor nas escolas\ndescription: Espirito empreendedor nas escolas\ndetails: ''\nfeatured: true\nactive: true\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nid: 63d66160-cf1b-4867-8113-45ea3efc6977\ncreated_at: 2026-03-06 00:16:57.297110000 +00:00\nupdated_at: 2026-03-06 00:19:17.811944000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-05T21:19:17.811-03:00", "2026-03-05T21:20:07.701-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
265	2026-03-06 00:20:12.588904	update	0d26c63f-1406-4a79-b5a7-93bd54f2253e	Project	---\nname: Projeto empreendedor nas Universidades\ndescription: Disseminação do empreendedorismo nas universidades\ndetails: ''\nfeatured: false\nactive: true\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nid: 0d26c63f-1406-4a79-b5a7-93bd54f2253e\ncreated_at: 2026-03-06 00:18:34.859576000 +00:00\nupdated_at: 2026-03-06 00:18:34.859576000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-05T21:18:34.859-03:00", "2026-03-05T21:20:12.588-03:00"], "description": ["Disseminação do empreendedorismo nas universidades", "Espírito empreendedor nas universidades"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
266	2026-03-06 00:21:32.769771	create	876763ba-522c-4b84-ad1a-4cf380265822	ExtensionCore	\N	{"id": [null, "876763ba-522c-4b84-ad1a-4cf380265822"], "icon": [null, "570c69c2-af35-438c-807b-b9fdd75b7ba6.png"], "name": [null, "Núcleo Apex de Educação"], "images": [null, ["ecfdd6f2-f55a-4217-8d30-dd71fcd72aa8.jpeg"]], "acronym": [null, "NAEDU"], "member_id": [null, "81f72c8d-f53a-4553-bba5-475be4e76bbd"], "created_at": [null, "2026-03-05T21:21:32.769-03:00"], "updated_at": [null, "2026-03-05T21:21:32.769-03:00"], "description": [null, "Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo e inovação no ecossistema empresarial."]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
267	2026-03-06 00:27:49.369168	create	5c65c020-95e3-451b-b1a0-5c6e032a6178	Project	\N	{"id": [null, "5c65c020-95e3-451b-b1a0-5c6e032a6178"], "name": [null, "Projeto educativo nas escolas"], "details": [null, "Bons resultados e adesão por parte dos estudante e corpo docente"], "created_at": [null, "2026-03-05T21:27:49.369-03:00"], "updated_at": [null, "2026-03-05T21:27:49.369-03:00"], "description": [null, "Projetos lúdicos e educativos sobre o direito nas Escolas de Mossoró"], "extension_core_id": [null, "876763ba-522c-4b84-ad1a-4cf380265822"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
268	2026-03-06 00:29:06.959296	update	5c65c020-95e3-451b-b1a0-5c6e032a6178	Project	---\nname: Projeto educativo nas escolas\ndescription: Projetos lúdicos e educativos sobre o direito nas Escolas de Mossoró\ndetails: Bons resultados e adesão por parte dos estudante e corpo docente\nfeatured: false\nactive: true\nextension_core_id: 876763ba-522c-4b84-ad1a-4cf380265822\nid: 5c65c020-95e3-451b-b1a0-5c6e032a6178\ncreated_at: 2026-03-06 00:27:49.369168000 +00:00\nupdated_at: 2026-03-06 00:27:49.369168000 +00:00\n	{"details": ["Bons resultados e adesão por parte dos estudante e corpo docente", "Excelente participação dos estudantes"], "updated_at": ["2026-03-05T21:27:49.369-03:00", "2026-03-05T21:29:06.959-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
269	2026-03-06 00:31:02.516373	create	d453df83-0440-449c-b9f6-b26aa49b941c	ExtensionCore	\N	{"id": [null, "d453df83-0440-449c-b9f6-b26aa49b941c"], "icon": [null, "ce1610f2-4924-46ac-96e2-c4a3cb2ba49f.png"], "name": [null, "Núcleo Apex de Comunicação"], "images": [null, ["58124494-d21b-4b79-a061-fa55ba56313a.jpeg", "58124494-d21b-4b79-a061-fa55ba56313a.jpg"]], "acronym": [null, "NACOM"], "member_id": [null, "81f72c8d-f53a-4553-bba5-475be4e76bbd"], "created_at": [null, "2026-03-05T21:31:02.516-03:00"], "updated_at": [null, "2026-03-05T21:31:02.516-03:00"], "description": [null, "Gestão da comunicação institucional, marketing digital e relacionamento com stakeholders."]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
270	2026-03-06 00:32:28.850772	create	bd3d21b1-59bf-4105-9b72-9840956a5274	Event	\N	{"id": [null, "bd3d21b1-59bf-4105-9b72-9840956a5274"], "image": [null, "2b6e5b74-1a35-498d-87ed-aa64ea7accb0.png"], "title": [null, "Apex Inova #1"], "position": [null, 1], "subtitle": [null, "Empreendedorismo de sucesso"], "created_at": [null, "2026-03-05T21:32:28.850-03:00"], "updated_at": [null, "2026-03-05T21:32:28.850-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
271	2026-03-06 00:36:20.443846	create	85d31abc-8c88-4ba4-829d-882e61fc8061	CarouselFrame	\N	{"id": [null, "85d31abc-8c88-4ba4-829d-882e61fc8061"], "image": [null, "11de939b-e94b-42e6-9b50-0c576acec1aa.png"], "title": [null, "Criação da empresa"], "position": [null, 1], "created_at": [null, "2026-03-05T21:36:20.443-03:00"], "updated_at": [null, "2026-03-05T21:36:20.443-03:00"], "description": [null, "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.  "]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
278	2026-03-06 00:42:59.382697	create	682c540d-82a3-4577-a201-ea3674ae6066	Address	\N	{"id": [null, "682c540d-82a3-4577-a201-ea3674ae6066"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600230"], "complement": [null, "Sala 01"], "created_at": [null, "2026-03-05T21:42:59.382-03:00"], "updated_at": [null, "2026-03-05T21:42:59.382-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
279	2026-03-06 00:43:06.309777	create	30091d87-024f-4a7d-bb17-653e83c1e21c	Address	\N	{"id": [null, "30091d87-024f-4a7d-bb17-653e83c1e21c"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600230"], "complement": [null, "Sala 01"], "created_at": [null, "2026-03-05T21:43:06.309-03:00"], "updated_at": [null, "2026-03-05T21:43:06.309-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
272	2026-03-06 00:36:38.7772	create	7867c05c-79ae-4d0b-a30c-d54c992613e2	Card	\N	{"id": [null, "7867c05c-79ae-4d0b-a30c-d54c992613e2"], "title": [null, "50+"], "position": [null, 1], "created_at": [null, "2026-03-05T21:36:38.777-03:00"], "updated_at": [null, "2026-03-05T21:36:38.777-03:00"], "description": [null, "Projetos realizados"], "carousel_frame_id": [null, "85d31abc-8c88-4ba4-829d-882e61fc8061"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
273	2026-03-06 00:36:51.085204	create	525b9c02-6ca6-4bd1-881e-319c6658ede3	Card	\N	{"id": [null, "525b9c02-6ca6-4bd1-881e-319c6658ede3"], "title": [null, "30+"], "position": [null, 2], "created_at": [null, "2026-03-05T21:36:51.085-03:00"], "updated_at": [null, "2026-03-05T21:36:51.085-03:00"], "description": [null, "Clientes satisfeitos"], "carousel_frame_id": [null, "85d31abc-8c88-4ba4-829d-882e61fc8061"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
274	2026-03-06 00:37:00.344691	create	fcdb08b1-a785-4091-ae72-ab42b62187fe	Card	\N	{"id": [null, "fcdb08b1-a785-4091-ae72-ab42b62187fe"], "title": [null, "10+"], "position": [null, 3], "created_at": [null, "2026-03-05T21:37:00.344-03:00"], "updated_at": [null, "2026-03-05T21:37:00.344-03:00"], "description": [null, "Membros ativos"], "carousel_frame_id": [null, "85d31abc-8c88-4ba4-829d-882e61fc8061"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
275	2026-03-06 00:37:09.928651	create	80d0d807-24f9-4e2c-9e0d-a8263998417d	Card	\N	{"id": [null, "80d0d807-24f9-4e2c-9e0d-a8263998417d"], "title": [null, "3+"], "position": [null, 4], "created_at": [null, "2026-03-05T21:37:09.928-03:00"], "updated_at": [null, "2026-03-05T21:37:09.928-03:00"], "description": [null, "Anos de experiência"], "carousel_frame_id": [null, "85d31abc-8c88-4ba4-829d-882e61fc8061"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
276	2026-03-06 00:38:06.365403	create	f09ea66a-b8f8-4062-9cda-2725bc7b5c3c	CarouselFrame	\N	{"id": [null, "f09ea66a-b8f8-4062-9cda-2725bc7b5c3c"], "image": [null, "c0ff361e-42d2-4a8d-85be-0c472dbec9d4.png"], "title": [null, "Inovação e empreendedorismo"], "position": [null, 2], "created_at": [null, "2026-03-05T21:38:06.365-03:00"], "updated_at": [null, "2026-03-05T21:38:06.365-03:00"], "description": [null, "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.  "]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
277	2026-03-06 00:42:25.796826	create	eff2f731-b0a8-4d61-adb6-e297fcb45b2a	Address	\N	{"id": [null, "eff2f731-b0a8-4d61-adb6-e297fcb45b2a"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600230"], "complement": [null, ""], "created_at": [null, "2026-03-05T21:42:25.796-03:00"], "updated_at": [null, "2026-03-05T21:42:25.796-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
280	2026-03-06 00:44:16.524882	update	876763ba-522c-4b84-ad1a-4cf380265822	ExtensionCore	---\nacronym: NAEDU\nname: Núcleo Apex de Educação\ndescription: Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo\n  e inovação no ecossistema empresarial.\nmember_id: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nicon: 570c69c2-af35-438c-807b-b9fdd75b7ba6.png\nimages: '["ecfdd6f2-f55a-4217-8d30-dd71fcd72aa8.jpeg"]'\nid: 876763ba-522c-4b84-ad1a-4cf380265822\ncreated_at: 2026-03-06 00:21:32.769771000 +00:00\nupdated_at: 2026-03-06 00:21:32.769771000 +00:00\n	{"member_id": ["81f72c8d-f53a-4553-bba5-475be4e76bbd", "49f78d51-d302-4356-853e-363acd82eabe"], "updated_at": ["2026-03-05T21:21:32.769-03:00", "2026-03-05T21:44:16.524-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
281	2026-03-06 00:44:53.466684	update	4419d32a-0923-4502-b8cb-12b1eaee1030	ExtensionCore	---\nacronym: NAEM\nname: Núcleo Apex de Empreendedorismo\ndescription: Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo\n  e inovação no ecossistema empresarial.\nmember_id: bf2163ad-44e8-49f3-b5bb-39f9f6e32a10\nicon: d674e711-4a0a-40fd-9dd0-f2a778955416.png\nimages: '["797ddee7-50f2-495f-95e7-9ede9ba83ca9.jpeg"]'\nid: 4419d32a-0923-4502-b8cb-12b1eaee1030\ncreated_at: 2026-03-06 00:15:32.153429000 +00:00\nupdated_at: 2026-03-06 00:17:19.082141000 +00:00\n	{"member_id": ["bf2163ad-44e8-49f3-b5bb-39f9f6e32a10", "4b3eec5a-91a7-4b70-8898-52c89cdcec65"], "updated_at": ["2026-03-05T21:17:19.082-03:00", "2026-03-05T21:44:53.466-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
282	2026-03-06 10:46:15.191341	update	76184473-dd19-4afd-a188-b5c25a72fef5	Member	---\nfeatured: false\nemail: apex5@example.com\nid: 76184473-dd19-4afd-a188-b5c25a72fef5\nimage: d5e768ed-4e93-45dc-b56c-d4269067926d.webp\nactive: true\ncreated_at: 2026-03-06 00:09:27.554575000 +00:00\nfull_name: Alice\nphone: '8499999999'\nrole: Consultora de Projetos\nupdated_at: 2026-03-06 00:09:27.554575000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-05T21:09:27.554-03:00", "2026-03-06T07:46:15.191-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
283	2026-03-06 10:46:22.939302	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: false\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: true\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe\nphone: '849999999'\nrole: Presidente\nupdated_at: 2026-03-06 00:05:18.241030000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-05T21:05:18.241-03:00", "2026-03-06T07:46:22.939-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
284	2026-03-06 10:47:05.95512	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe\nemail: apex@example.com\nrole: Presidente\nphone: '849999999'\nactive: true\nfeatured: true\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nupdated_at: 2026-03-06 10:46:22.939302000 +00:00\n	{"role": ["Presidente", "Faxineiro"], "full_name": ["João Felipe", "João Felipe Augusto"], "updated_at": ["2026-03-06T07:46:22.939-03:00", "2026-03-06T07:47:05.955-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
285	2026-03-06 10:47:45.435181	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe Augusto\nemail: apex@example.com\nrole: Faxineiro\nphone: '849999999'\nactive: true\nfeatured: true\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nupdated_at: 2026-03-06 10:47:05.955120000 +00:00\n	{"active": [true, false], "updated_at": ["2026-03-06T07:47:05.955-03:00", "2026-03-06T07:47:45.435-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
286	2026-03-06 10:47:49.156607	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe Augusto\nemail: apex@example.com\nrole: Faxineiro\nphone: '849999999'\nactive: false\nfeatured: true\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nupdated_at: 2026-03-06 10:47:45.435181000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-06T07:47:45.435-03:00", "2026-03-06T07:47:49.156-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
287	2026-03-06 10:49:07.116132	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: false\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: false\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe Augusto\nphone: '849999999'\nrole: Faxineiro\nupdated_at: 2026-03-06 10:47:49.156607000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-06T07:47:49.156-03:00", "2026-03-06T07:49:07.116-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
288	2026-03-06 10:49:13.740733	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: true\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: false\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe Augusto\nphone: '849999999'\nrole: Faxineiro\nupdated_at: 2026-03-06 10:49:07.116132000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-06T07:49:07.116-03:00", "2026-03-06T07:49:13.740-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
289	2026-03-06 10:49:14.908733	update	76184473-dd19-4afd-a188-b5c25a72fef5	Member	---\nfeatured: true\nemail: apex5@example.com\nid: 76184473-dd19-4afd-a188-b5c25a72fef5\nimage: d5e768ed-4e93-45dc-b56c-d4269067926d.webp\nactive: true\ncreated_at: 2026-03-06 00:09:27.554575000 +00:00\nfull_name: Alice\nphone: '8499999999'\nrole: Consultora de Projetos\nupdated_at: 2026-03-06 10:46:15.191341000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-06T07:46:15.191-03:00", "2026-03-06T07:49:14.908-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
290	2026-03-06 10:56:16.484324	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: false\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: false\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe Augusto\nphone: '849999999'\nrole: Faxineiro\nupdated_at: 2026-03-06 10:49:13.740733000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-06T07:49:13.740-03:00", "2026-03-06T07:56:16.484-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
291	2026-03-06 10:56:21.630107	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: true\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: false\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe Augusto\nphone: '849999999'\nrole: Faxineiro\nupdated_at: 2026-03-06 10:56:16.484324000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-06T07:56:16.484-03:00", "2026-03-06T07:56:21.630-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
292	2026-03-10 12:59:04.956088	update	76184473-dd19-4afd-a188-b5c25a72fef5	Member	---\nfeatured: false\nemail: apex5@example.com\nid: 76184473-dd19-4afd-a188-b5c25a72fef5\nimage: d5e768ed-4e93-45dc-b56c-d4269067926d.webp\nactive: true\ncreated_at: 2026-03-06 00:09:27.554575000 +00:00\nfull_name: Alice\nphone: '8499999999'\nrole: Consultora de Projetos\nupdated_at: 2026-03-06 10:49:14.908733000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-06T07:49:14.908-03:00", "2026-03-10T09:59:04.956-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
293	2026-03-10 12:59:06.774071	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: false\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: false\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe Augusto\nphone: '849999999'\nrole: Faxineiro\nupdated_at: 2026-03-06 10:56:21.630107000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-06T07:56:21.630-03:00", "2026-03-10T09:59:06.774-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
294	2026-03-10 12:59:08.403485	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfeatured: true\nemail: apex@example.com\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\nactive: false\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nfull_name: João Felipe Augusto\nphone: '849999999'\nrole: Faxineiro\nupdated_at: 2026-03-10 12:59:06.774071000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-10T09:59:06.774-03:00", "2026-03-10T09:59:08.403-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
295	2026-03-10 12:59:10.886829	update	76184473-dd19-4afd-a188-b5c25a72fef5	Member	---\nfeatured: true\nemail: apex5@example.com\nid: 76184473-dd19-4afd-a188-b5c25a72fef5\nimage: d5e768ed-4e93-45dc-b56c-d4269067926d.webp\nactive: true\ncreated_at: 2026-03-06 00:09:27.554575000 +00:00\nfull_name: Alice\nphone: '8499999999'\nrole: Consultora de Projetos\nupdated_at: 2026-03-10 12:59:04.956088000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-10T09:59:04.956-03:00", "2026-03-10T09:59:10.886-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
296	2026-03-10 13:13:08.623784	update	85d31abc-8c88-4ba4-829d-882e61fc8061	CarouselFrame	---\ntitle: Criação da empresa\ndescription: "If you are going to use a passage of Lorem Ipsum, you need to be sure\n  there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum\n  generators on the Internet tend to repeat predefined chunks as necessary, making\n  this the first true generator on the Internet. It uses a dictionary of over 200\n  Latin words, combined with a handful of model sentence structures, to generate Lorem\n  Ipsum which looks reasonable. \\L"\nactive: true\nposition: 1\nimage: 11de939b-e94b-42e6-9b50-0c576acec1aa.png\nid: 85d31abc-8c88-4ba4-829d-882e61fc8061\ncreated_at: 2026-03-06 00:36:20.443846000 +00:00\nupdated_at: 2026-03-06 00:36:20.443846000 +00:00\n	{"active": [true, false], "updated_at": ["2026-03-05T21:36:20.443-03:00", "2026-03-10T10:13:08.623-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
297	2026-03-10 13:13:18.338845	update	85d31abc-8c88-4ba4-829d-882e61fc8061	CarouselFrame	---\ntitle: Criação da empresa\ndescription: "If you are going to use a passage of Lorem Ipsum, you need to be sure\n  there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum\n  generators on the Internet tend to repeat predefined chunks as necessary, making\n  this the first true generator on the Internet. It uses a dictionary of over 200\n  Latin words, combined with a handful of model sentence structures, to generate Lorem\n  Ipsum which looks reasonable. \\L"\nactive: false\nposition: 1\nimage: 11de939b-e94b-42e6-9b50-0c576acec1aa.png\nid: 85d31abc-8c88-4ba4-829d-882e61fc8061\ncreated_at: 2026-03-06 00:36:20.443846000 +00:00\nupdated_at: 2026-03-10 13:13:08.623784000 +00:00\n	{"active": [false, true], "updated_at": ["2026-03-10T10:13:08.623-03:00", "2026-03-10T10:13:18.338-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
298	2026-03-10 13:19:05.471379	destroy	63d66160-cf1b-4867-8113-45ea3efc6977	Project	---\nid: 63d66160-cf1b-4867-8113-45ea3efc6977\nactive: true\ncreated_at: 2026-03-06 00:16:57.297110000 +00:00\ndescription: Espirito empreendedor nas escolas\ndetails: ''\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nfeatured: false\nname: Projeto empreendedor nas escolas\nupdated_at: 2026-03-06 00:20:07.701620000 +00:00\n	{"id": ["63d66160-cf1b-4867-8113-45ea3efc6977", null], "name": ["Projeto empreendedor nas escolas", null], "active": [true, null], "details": ["", null], "featured": [false, null], "created_at": ["2026-03-05T21:16:57.297-03:00", null], "updated_at": ["2026-03-05T21:20:07.701-03:00", null], "description": ["Espirito empreendedor nas escolas", null], "extension_core_id": ["4419d32a-0923-4502-b8cb-12b1eaee1030", null]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
299	2026-03-10 13:37:54.362228	destroy	5c65c020-95e3-451b-b1a0-5c6e032a6178	Project	---\nid: 5c65c020-95e3-451b-b1a0-5c6e032a6178\nactive: true\ncreated_at: 2026-03-06 00:27:49.369168000 +00:00\ndescription: Projetos lúdicos e educativos sobre o direito nas Escolas de Mossoró\ndetails: Excelente participação dos estudantes\nextension_core_id: 876763ba-522c-4b84-ad1a-4cf380265822\nfeatured: false\nname: Projeto educativo nas escolas\nupdated_at: 2026-03-06 00:29:06.959296000 +00:00\n	{"id": ["5c65c020-95e3-451b-b1a0-5c6e032a6178", null], "name": ["Projeto educativo nas escolas", null], "active": [true, null], "details": ["Excelente participação dos estudantes", null], "featured": [false, null], "created_at": ["2026-03-05T21:27:49.369-03:00", null], "updated_at": ["2026-03-05T21:29:06.959-03:00", null], "description": ["Projetos lúdicos e educativos sobre o direito nas Escolas de Mossoró", null], "extension_core_id": ["876763ba-522c-4b84-ad1a-4cf380265822", null]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
311	2026-03-11 20:30:46.282934	update	0d26c63f-1406-4a79-b5a7-93bd54f2253e	Project	---\nname: Projeto empreendedor nas Universidades\ndescription: Espírito empreendedor nas universidades\ndetails: ''\nfeatured: true\nactive: true\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nid: 0d26c63f-1406-4a79-b5a7-93bd54f2253e\ncreated_at: 2026-03-06 00:18:34.859576000 +00:00\nupdated_at: 2026-03-06 00:20:12.588904000 +00:00\n	{"featured": [true, false], "updated_at": ["2026-03-05T21:20:12.588-03:00", "2026-03-11T17:30:46.282-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
300	2026-03-10 13:41:40.05052	destroy	876763ba-522c-4b84-ad1a-4cf380265822	ExtensionCore	---\nid: 876763ba-522c-4b84-ad1a-4cf380265822\nacronym: NAEDU\ncreated_at: 2026-03-06 00:21:32.769771000 +00:00\ndescription: Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo\n  e inovação no ecossistema empresarial.\nicon: 570c69c2-af35-438c-807b-b9fdd75b7ba6.png\nimages: '["ecfdd6f2-f55a-4217-8d30-dd71fcd72aa8.jpeg"]'\nmember_id: 49f78d51-d302-4356-853e-363acd82eabe\nname: Núcleo Apex de Educação\nupdated_at: 2026-03-06 00:44:16.524882000 +00:00\n	{"id": ["876763ba-522c-4b84-ad1a-4cf380265822", null], "icon": ["570c69c2-af35-438c-807b-b9fdd75b7ba6.png", null], "name": ["Núcleo Apex de Educação", null], "images": [["ecfdd6f2-f55a-4217-8d30-dd71fcd72aa8.jpeg"], null], "acronym": ["NAEDU", null], "member_id": ["49f78d51-d302-4356-853e-363acd82eabe", null], "created_at": ["2026-03-05T21:21:32.769-03:00", null], "updated_at": ["2026-03-05T21:44:16.524-03:00", null], "description": ["Desenvolvimento de projetos e iniciativas que fomentam o empreendedorismo e inovação no ecossistema empresarial.", null]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
301	2026-03-10 13:49:19.348558	create	d1baee51-07b6-4b0d-9840-cf132a9bd0cb	Project	\N	{"id": [null, "d1baee51-07b6-4b0d-9840-cf132a9bd0cb"], "name": [null, "Comunicação nas escolas"], "details": [null, "Ajuda com oratória no ensino fundamental"], "featured": [false, true], "created_at": [null, "2026-03-10T10:49:19.348-03:00"], "updated_at": [null, "2026-03-10T10:49:19.348-03:00"], "description": [null, "Aulas de oratória"], "extension_core_id": [null, "d453df83-0440-449c-b9f6-b26aa49b941c"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
302	2026-03-11 20:05:46.49294	update	76184473-dd19-4afd-a188-b5c25a72fef5	Member	---\nfeatured: false\nemail: apex5@example.com\nid: 76184473-dd19-4afd-a188-b5c25a72fef5\nimage: d5e768ed-4e93-45dc-b56c-d4269067926d.webp\nactive: true\ncreated_at: 2026-03-06 00:09:27.554575000 +00:00\nfull_name: Alice\nphone: '8499999999'\nrole: Consultora de Projetos\nupdated_at: 2026-03-10 12:59:10.886829000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-10T09:59:10.886-03:00", "2026-03-11T17:05:46.492-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
303	2026-03-11 20:05:48.567895	update	49f78d51-d302-4356-853e-363acd82eabe	Member	---\nfeatured: false\nemail: apex3@example.com\nid: 49f78d51-d302-4356-853e-363acd82eabe\nimage: a4193994-7db5-4c62-b69f-2178cb291e77.webp\nactive: true\ncreated_at: 2026-03-06 00:07:03.653303000 +00:00\nfull_name: Luiz\nphone: '84999999999'\nrole: Diretor financeiro\nupdated_at: 2026-03-06 00:07:03.653303000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-05T21:07:03.653-03:00", "2026-03-11T17:05:48.567-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
304	2026-03-11 20:18:12.580478	create	17c27d8c-e0fb-441a-991c-883381d85346	SocialMediaProfile	\N	{"id": [null, "17c27d8c-e0fb-441a-991c-883381d85346"], "url": [null, "https://www.instagram.com/apex.ej/"], "active": [null, true], "platform": [null, "Instagram"], "position": [null, 1], "username": [null, "@apex.ej"], "company_id": [null, "c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8"], "created_at": [null, "2026-03-11T17:18:12.580-03:00"], "updated_at": [null, "2026-03-11T17:18:12.580-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
305	2026-03-11 20:20:34.790832	create	a27aee8b-0d9f-44b5-a560-55e8501e4084	Address	\N	{"id": [null, "a27aee8b-0d9f-44b5-a560-55e8501e4084"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600230"], "complement": [null, "Sala 01"], "created_at": [null, "2026-03-11T17:20:34.790-03:00"], "updated_at": [null, "2026-03-11T17:20:34.790-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
306	2026-03-11 20:21:20.889087	create	b8c53dc1-0ccf-434f-b1a5-dceba34af5e2	SocialMediaProfile	\N	{"id": [null, "b8c53dc1-0ccf-434f-b1a5-dceba34af5e2"], "url": [null, "https://www.facebook.com/apex.uern/"], "active": [null, true], "platform": [null, "Facebook"], "position": [null, 2], "username": [null, "apex.uern"], "company_id": [null, "c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8"], "created_at": [null, "2026-03-11T17:21:20.889-03:00"], "updated_at": [null, "2026-03-11T17:21:20.889-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
307	2026-03-11 20:24:17.593684	create	be511fd9-1157-4076-bed3-b303d61a718a	SocialMediaProfile	\N	{"id": [null, "be511fd9-1157-4076-bed3-b303d61a718a"], "url": [null, "https://www.linkedin.com/company/apexuern/"], "active": [null, true], "platform": [null, "LinkedIn"], "position": [null, 3], "username": [null, "apexuern"], "company_id": [null, "c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8"], "created_at": [null, "2026-03-11T17:24:17.593-03:00"], "updated_at": [null, "2026-03-11T17:24:17.593-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
308	2026-03-11 20:28:54.582705	update	d1baee51-07b6-4b0d-9840-cf132a9bd0cb	Project	---\nname: Comunicação nas escolas\ndescription: Aulas de oratória\ndetails: Ajuda com oratória no ensino fundamental\nfeatured: true\nactive: true\nextension_core_id: d453df83-0440-449c-b9f6-b26aa49b941c\nid: d1baee51-07b6-4b0d-9840-cf132a9bd0cb\ncreated_at: 2026-03-10 13:49:19.348558000 +00:00\nupdated_at: 2026-03-10 13:49:19.348558000 +00:00\n	{"name": ["Comunicação nas escolas", "Direito em foco "], "details": ["Ajuda com oratória no ensino fundamental", "Divulgação de informação jurídica nas redes sociais."], "updated_at": ["2026-03-10T10:49:19.348-03:00", "2026-03-11T17:28:54.582-03:00"], "description": ["Aulas de oratória", "Projeto de comunicação que produz conteúdos informativos sobre temas jurídicos atuais para redes sociais e plataformas digitais da empresa júnior"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
309	2026-03-11 20:29:45.3426	create	a0ba2621-4109-4a4c-9895-352c48708a08	Project	\N	{"id": [null, "a0ba2621-4109-4a4c-9895-352c48708a08"], "name": [null, "Comunicação Institucional EJ"], "details": [null, "Fortalecimento da presença institucional e digital."], "created_at": [null, "2026-03-11T17:29:45.342-03:00"], "updated_at": [null, "2026-03-11T17:29:45.342-03:00"], "description": [null, "Projeto responsável pela divulgação de projetos, eventos e atividades da empresa júnior."], "extension_core_id": [null, "d453df83-0440-449c-b9f6-b26aa49b941c"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
310	2026-03-11 20:30:37.870443	create	b925d10f-abe3-4839-97a2-e0fa0ccca6ed	Project	\N	{"id": [null, "b925d10f-abe3-4839-97a2-e0fa0ccca6ed"], "name": [null, "Formaliza Direito"], "details": [null, "Orientação jurídica a empreendedores e apoio na formalização de novos negócios."], "created_at": [null, "2026-03-11T17:30:37.870-03:00"], "updated_at": [null, "2026-03-11T17:30:37.870-03:00"], "description": [null, "Projeto que orienta microempreendedores sobre formalização de negócios, elaboração de contratos básicos e aspectos jurídicos da atividade empresarial."], "extension_core_id": [null, "4419d32a-0923-4502-b8cb-12b1eaee1030"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
312	2026-03-11 20:30:52.442086	update	b925d10f-abe3-4839-97a2-e0fa0ccca6ed	Project	---\nname: Formaliza Direito\ndescription: Projeto que orienta microempreendedores sobre formalização de negócios,\n  elaboração de contratos básicos e aspectos jurídicos da atividade empresarial.\ndetails: Orientação jurídica a empreendedores e apoio na formalização de novos negócios.\nfeatured: false\nactive: true\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nid: b925d10f-abe3-4839-97a2-e0fa0ccca6ed\ncreated_at: 2026-03-11 20:30:37.870443000 +00:00\nupdated_at: 2026-03-11 20:30:37.870443000 +00:00\n	{"featured": [false, true], "updated_at": ["2026-03-11T17:30:37.870-03:00", "2026-03-11T17:30:52.442-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
314	2026-03-11 20:35:10.458225	create	4a2fe427-471f-4633-8e1e-cb2bf861d7b1	CarouselFrame	\N	{"id": [null, "4a2fe427-471f-4633-8e1e-cb2bf861d7b1"], "image": [null, "661018db-fdcd-4c42-81e2-1ac0b3254262.jpeg"], "title": [null, "Conquistas"], "position": [null, 3], "created_at": [null, "2026-03-11T17:35:10.458-03:00"], "updated_at": [null, "2026-03-11T17:35:10.458-03:00"], "description": [null, "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.  "]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
315	2026-03-11 20:35:37.906456	update	85d31abc-8c88-4ba4-829d-882e61fc8061	CarouselFrame	---\ntitle: Criação da empresa\ndescription: "If you are going to use a passage of Lorem Ipsum, you need to be sure\n  there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum\n  generators on the Internet tend to repeat predefined chunks as necessary, making\n  this the first true generator on the Internet. It uses a dictionary of over 200\n  Latin words, combined with a handful of model sentence structures, to generate Lorem\n  Ipsum which looks reasonable. \\L"\nactive: true\nimage: 11de939b-e94b-42e6-9b50-0c576acec1aa.png\nposition: 1\nid: 85d31abc-8c88-4ba4-829d-882e61fc8061\ncreated_at: 2026-03-06 00:36:20.443846000 +00:00\nupdated_at: 2026-03-10 13:13:18.338845000 +00:00\n	{"image": ["11de939b-e94b-42e6-9b50-0c576acec1aa.png", "5f79417e-b417-407f-ace2-d8177a563175.jpeg"], "updated_at": ["2026-03-10T10:13:18.338-03:00", "2026-03-11T17:35:37.906-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
316	2026-03-11 20:37:28.250739	create	15c5467a-7b2d-40ea-bfcc-3bc813da2c9c	Card	\N	{"id": [null, "15c5467a-7b2d-40ea-bfcc-3bc813da2c9c"], "title": [null, "50+"], "position": [null, 1], "created_at": [null, "2026-03-11T17:37:28.250-03:00"], "updated_at": [null, "2026-03-11T17:37:28.250-03:00"], "description": [null, "Atendimentos realizados"], "carousel_frame_id": [null, "f09ea66a-b8f8-4062-9cda-2725bc7b5c3c"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
319	2026-03-11 20:39:21.505166	create	36fa2a65-7ae5-434f-b7c5-be70a1ab70a2	Card	\N	{"id": [null, "36fa2a65-7ae5-434f-b7c5-be70a1ab70a2"], "title": [null, "10"], "position": [null, 2], "created_at": [null, "2026-03-11T17:39:21.505-03:00"], "updated_at": [null, "2026-03-11T17:39:21.505-03:00"], "description": [null, "Eventos realizados"], "carousel_frame_id": [null, "4a2fe427-471f-4633-8e1e-cb2bf861d7b1"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
313	2026-03-11 20:32:17.408822	create	39010c93-7427-4d48-8103-5ed28033d9fa	Event	\N	{"id": [null, "39010c93-7427-4d48-8103-5ed28033d9fa"], "image": [null, "547c5f9e-4ab4-45ec-92ff-a111082e81a0.png"], "title": [null, "Apex Inova #2"], "position": [null, 2], "subtitle": [null, "Comunicação com sucesso"], "created_at": [null, "2026-03-11T17:32:17.408-03:00"], "updated_at": [null, "2026-03-11T17:32:17.408-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
317	2026-03-11 20:37:47.473783	create	1100dff6-ad77-4903-9aee-9cfae2da13a3	Card	\N	{"id": [null, "1100dff6-ad77-4903-9aee-9cfae2da13a3"], "title": [null, "20+"], "position": [null, 2], "created_at": [null, "2026-03-11T17:37:47.473-03:00"], "updated_at": [null, "2026-03-11T17:37:47.473-03:00"], "description": [null, "Consultorias Jurídicas "], "carousel_frame_id": [null, "f09ea66a-b8f8-4062-9cda-2725bc7b5c3c"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
318	2026-03-11 20:38:48.298962	create	c0558c97-8bcf-4fd2-a731-07eb7ddcb482	Card	\N	{"id": [null, "c0558c97-8bcf-4fd2-a731-07eb7ddcb482"], "title": [null, "50+"], "position": [null, 1], "created_at": [null, "2026-03-11T17:38:48.298-03:00"], "updated_at": [null, "2026-03-11T17:38:48.298-03:00"], "description": [null, "Estudantes impactados com o Movimento Empresa Júnior"], "carousel_frame_id": [null, "4a2fe427-471f-4633-8e1e-cb2bf861d7b1"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
320	2026-03-11 20:41:39.074228	update	39010c93-7427-4d48-8103-5ed28033d9fa	Event	---\ntitle: 'Apex Inova #2'\nsubtitle: Comunicação com sucesso\nimage: 547c5f9e-4ab4-45ec-92ff-a111082e81a0.png\nactive: true\nposition: 2\nid: 39010c93-7427-4d48-8103-5ed28033d9fa\ncreated_at: 2026-03-11 20:32:17.408822000 +00:00\nupdated_at: 2026-03-11 20:32:17.408822000 +00:00\n	{"image": ["547c5f9e-4ab4-45ec-92ff-a111082e81a0.png", "287a7fbe-1eec-4a37-b0b5-7470678da9be.jpeg"], "updated_at": ["2026-03-11T17:32:17.408-03:00", "2026-03-11T17:41:39.074-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
321	2026-03-11 20:41:49.457747	create	236a6b23-aaeb-40bd-9b7d-7cdf61230ded	Address	\N	{"id": [null, "236a6b23-aaeb-40bd-9b7d-7cdf61230ded"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "653"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T17:41:49.457-03:00"], "updated_at": [null, "2026-03-11T17:41:49.457-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
322	2026-03-11 20:43:04.043266	create	5c5c8d03-e719-4236-b199-5f0c06bb147c	Address	\N	{"id": [null, "5c5c8d03-e719-4236-b199-5f0c06bb147c"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T17:43:04.043-03:00"], "updated_at": [null, "2026-03-11T17:43:04.043-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
323	2026-03-11 20:46:24.611071	update	81f72c8d-f53a-4553-bba5-475be4e76bbd	Member	---\nfull_name: João Felipe Augusto\nemail: apex@example.com\nrole: Faxineiro\nphone: '849999999'\nactive: false\nfeatured: false\nid: 81f72c8d-f53a-4553-bba5-475be4e76bbd\nimage: 75a1ce03-48a2-43c3-978e-8e4d87b5f33e.webp\ncreated_at: 2026-03-05 13:53:16.374421000 +00:00\nupdated_at: 2026-03-10 12:59:08.403485000 +00:00\n	{"role": ["Faxineiro", "Diretor"], "updated_at": ["2026-03-10T09:59:08.403-03:00", "2026-03-11T17:46:24.611-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
324	2026-03-11 20:46:41.177319	create	b8fe8261-9817-4a4c-bef6-cfee86fad932	Address	\N	{"id": [null, "b8fe8261-9817-4a4c-bef6-cfee86fad932"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T17:46:41.177-03:00"], "updated_at": [null, "2026-03-11T17:46:41.177-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
325	2026-03-11 20:47:38.828173	create	e06d6bd8-f154-45d8-89a8-bc4aae7ea153	Member	\N	{"id": [null, "e06d6bd8-f154-45d8-89a8-bc4aae7ea153"], "role": [null, "Diretor de Marketing"], "email": [null, "apex7@example.com"], "image": [null, "54d99686-44a2-420f-b666-070ad2a0c56a.webp"], "phone": [null, "8499999-9999"], "full_name": [null, "Antônio Marcos"], "created_at": [null, "2026-03-11T17:47:38.828-03:00"], "updated_at": [null, "2026-03-11T17:47:38.828-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
326	2026-03-11 20:48:30.030088	create	4491919c-cd37-436d-a541-78faa393e422	Member	\N	{"id": [null, "4491919c-cd37-436d-a541-78faa393e422"], "role": [null, "Diretora de Projetos"], "email": [null, "apex8@example.com"], "image": [null, "077b61c4-23fd-406a-a8d2-b71d3780c010.webp"], "phone": [null, "8499999-9999"], "full_name": [null, "Beatriz"], "created_at": [null, "2026-03-11T17:48:30.030-03:00"], "updated_at": [null, "2026-03-11T17:48:30.030-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
327	2026-03-11 20:49:39.167225	create	17a5dd12-e41b-42ca-8fab-2513f16a4cd9	Member	\N	{"id": [null, "17a5dd12-e41b-42ca-8fab-2513f16a4cd9"], "role": [null, "Marketing"], "email": [null, "apex9@example.com"], "image": [null, "f8bcfbbc-2248-4416-8f38-c3d618b80f08.webp"], "phone": [null, "8499999-9999"], "full_name": [null, "Gabriel"], "created_at": [null, "2026-03-11T17:49:39.167-03:00"], "updated_at": [null, "2026-03-11T17:49:39.167-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
328	2026-03-11 20:54:51.796456	update	ed57e782-7107-4e91-b3fd-6dfde307d630	HeroCard	---\ntitle: Consultoria\ndescription: Consultoria Jurídica avançada para sua empresa\nactive: true\nposition: 1\nid: ed57e782-7107-4e91-b3fd-6dfde307d630\ncreated_at: 2026-03-05 13:35:22.863058000 +00:00\nupdated_at: 2026-03-05 13:35:22.863058000 +00:00\n	{"title": ["Consultoria", "Consultoria Jurídica"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
329	2026-03-11 20:57:54.906721	create	adc5d7c9-6173-4cf2-9b94-7143fbd117c5	Address	\N	{"id": [null, "adc5d7c9-6173-4cf2-9b94-7143fbd117c5"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "s/n"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T17:57:54.906-03:00"], "updated_at": [null, "2026-03-11T17:57:54.906-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
330	2026-03-11 21:02:58.712788	create	c0233ce8-2367-4e2a-8006-88de6a0e43af	Address	\N	{"id": [null, "c0233ce8-2367-4e2a-8006-88de6a0e43af"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "653"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T18:02:58.712-03:00"], "updated_at": [null, "2026-03-11T18:02:58.712-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
331	2026-03-11 21:07:46.868819	create	efecd3f8-a3a7-41dc-827c-428720b256ca	Address	\N	{"id": [null, "efecd3f8-a3a7-41dc-827c-428720b256ca"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T18:07:46.868-03:00"], "updated_at": [null, "2026-03-11T18:07:46.868-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
332	2026-03-11 21:23:34.134266	create	0cc0a8f1-dc96-46c3-8592-880b81af7d5b	Address	\N	{"id": [null, "0cc0a8f1-dc96-46c3-8592-880b81af7d5b"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T18:23:34.134-03:00"], "updated_at": [null, "2026-03-11T18:23:34.134-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
333	2026-03-11 21:26:40.536667	create	834f0643-f183-4672-844f-378b17e5d3ba	Address	\N	{"id": [null, "834f0643-f183-4672-844f-378b17e5d3ba"], "city": [null, "MOSSORO"], "state": [null, "RN"], "number": [null, "653"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, ""], "created_at": [null, "2026-03-11T18:26:40.536-03:00"], "updated_at": [null, "2026-03-11T18:26:40.536-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
334	2026-03-11 21:32:16.457634	create	4756d8ff-a1fe-4308-875a-31b24b8417d0	Address	\N	{"id": [null, "4756d8ff-a1fe-4308-875a-31b24b8417d0"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "653"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600-230"], "complement": [null, "Complemento"], "created_at": [null, "2026-03-11T18:32:16.457-03:00"], "updated_at": [null, "2026-03-11T18:32:16.457-03:00"], "neighborhood": [null, "SANTO ANTONIO"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
335	2026-03-11 21:32:27.903783	create	b9060c29-723a-4cb2-8465-1a5e7105dfeb	ExtensionCore	\N	{"id": [null, "b9060c29-723a-4cb2-8465-1a5e7105dfeb"], "icon": [null, "6e1686e2-8df2-44d7-aacb-60d0d4b27778.png"], "name": [null, "Núcleo Apex de Educação'"], "images": [null, ["12963fd4-1c3c-48b1-b714-1813aa28fd70.jpg", "12963fd4-1c3c-48b1-b714-1813aa28fd70.jpeg"]], "acronym": [null, "NAEDU"], "member_id": [null, "4491919c-cd37-436d-a541-78faa393e422"], "created_at": [null, "2026-03-11T18:32:27.903-03:00"], "updated_at": [null, "2026-03-11T18:32:27.903-03:00"], "description": [null, "O núcleo organiza palestras, oficinas, projetos educativos e capacitações, buscando aproximar o direito da comunidade e contribuir para a formação crítica e profissional dos estudantes."]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
336	2026-03-11 21:33:18.932761	update	b9060c29-723a-4cb2-8465-1a5e7105dfeb	ExtensionCore	---\nacronym: NAEDU\nname: Núcleo Apex de Educação'\ndescription: O núcleo organiza palestras, oficinas, projetos educativos e capacitações,\n  buscando aproximar o direito da comunidade e contribuir para a formação crítica\n  e profissional dos estudantes.\nmember_id: 4491919c-cd37-436d-a541-78faa393e422\nicon: 6e1686e2-8df2-44d7-aacb-60d0d4b27778.png\nimages: '["12963fd4-1c3c-48b1-b714-1813aa28fd70.jpg","12963fd4-1c3c-48b1-b714-1813aa28fd70.jpeg"]'\nid: b9060c29-723a-4cb2-8465-1a5e7105dfeb\ncreated_at: 2026-03-11 21:32:27.903783000 +00:00\nupdated_at: 2026-03-11 21:32:27.903783000 +00:00\n	{"name": ["Núcleo Apex de Educação'", "Núcleo Apex de Educação"], "updated_at": ["2026-03-11T18:32:27.903-03:00", "2026-03-11T18:33:18.932-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
337	2026-03-11 21:34:08.19032	create	1fac11a8-5998-4c98-bad1-3d8a3e367896	Project	\N	{"id": [null, "1fac11a8-5998-4c98-bad1-3d8a3e367896"], "name": [null, "Direito na Escola"], "details": [null, "Promoção da educação jurídica e conscientização sobre direitos."], "featured": [false, true], "created_at": [null, "2026-03-11T18:34:08.190-03:00"], "updated_at": [null, "2026-03-11T18:34:08.190-03:00"], "description": [null, "Projeto que leva noções básicas de direito e cidadania para estudantes do ensino médio."], "extension_core_id": [null, "b9060c29-723a-4cb2-8465-1a5e7105dfeb"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
338	2026-03-11 21:34:41.67599	create	2b451289-2d97-48bb-a2a6-b9d60328f11a	Project	\N	{"id": [null, "2b451289-2d97-48bb-a2a6-b9d60328f11a"], "name": [null, "Educação Jurídica para a Comunidade"], "details": [null, "Ampliação do acesso da comunidade à informação jurídica."], "created_at": [null, "2026-03-11T18:34:41.675-03:00"], "updated_at": [null, "2026-03-11T18:34:41.675-03:00"], "description": [null, "Projeto que realiza oficinas e palestras sobre direitos do consumidor, trabalho e cidadania."], "extension_core_id": [null, "b9060c29-723a-4cb2-8465-1a5e7105dfeb"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
339	2026-03-11 21:36:27.251443	create	cd86ccff-377a-4dc4-970d-369f973b9973	Project	\N	{"id": [null, "cd86ccff-377a-4dc4-970d-369f973b9973"], "name": [null, "Preparação Acadêmica em Direito"], "details": [null, "Fortalecimento da formação acadêmica e profissional dos estudantes."], "created_at": [null, "2026-03-11T18:36:27.251-03:00"], "updated_at": [null, "2026-03-11T18:36:27.251-03:00"], "description": [null, "Projeto que promove palestras, grupos de estudo e capacitações para estudantes de direito."], "extension_core_id": [null, "b9060c29-723a-4cb2-8465-1a5e7105dfeb"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
341	2026-03-11 21:38:45.951598	update	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	Company	---\nname: APEX\ntagline: Empreendedorismo e Soluções Jurídicas\nemail: apex@example.com\nphone: '84987859647'\nid: c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8\ncreated_at: 2026-03-05 13:32:50.504791000 +00:00\nupdated_at: 2026-03-05 13:34:10.220818000 +00:00\n	{"phone": ["84987859647", "84999999999"], "updated_at": ["2026-03-05T10:34:10.220-03:00", "2026-03-11T18:38:45.951-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
340	2026-03-11 21:37:40.259488	update	0d26c63f-1406-4a79-b5a7-93bd54f2253e	Project	---\nname: Projeto empreendedor nas Universidades\ndescription: Espírito empreendedor nas universidades\ndetails: ''\nfeatured: false\nactive: true\nextension_core_id: 4419d32a-0923-4502-b8cb-12b1eaee1030\nid: 0d26c63f-1406-4a79-b5a7-93bd54f2253e\ncreated_at: 2026-03-06 00:18:34.859576000 +00:00\nupdated_at: 2026-03-11 20:30:46.282934000 +00:00\n	{"name": ["Projeto empreendedor nas Universidades", "Empreendedor Legal"], "details": ["", "Apoio jurídico consultivo e disseminação de boas práticas empresariais."], "updated_at": ["2026-03-11T17:30:46.282-03:00", "2026-03-11T18:37:40.259-03:00"], "description": ["Espírito empreendedor nas universidades", "Projeto que fornece orientação jurídica preventiva para empreendedores sobre contratos, direitos do consumidor e responsabilidades legais."]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
342	2026-03-11 21:40:50.973457	update	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	Company	---\nname: APEX\ntagline: Empreendedorismo e Soluções Jurídicas\nemail: apex@example.com\nphone: '84999999999'\nid: c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8\ncreated_at: 2026-03-05 13:32:50.504791000 +00:00\nupdated_at: 2026-03-11 21:38:45.951598000 +00:00\n	{"phone": ["84999999999", "84999999944"], "updated_at": ["2026-03-11T18:38:45.951-03:00", "2026-03-11T18:40:50.973-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
343	2026-03-11 21:42:58.505119	create	c511e8c9-89ec-4a5a-9824-9913620c5166	Address	\N	{"id": [null, "c511e8c9-89ec-4a5a-9824-9913620c5166"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "1234"], "street": [null, "Av. Rio Branco"], "zip_code": [null, "59600230"], "complement": [null, "Sala 01"], "created_at": [null, "2026-03-11T18:42:58.505-03:00"], "updated_at": [null, "2026-03-11T18:42:58.505-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
344	2026-03-11 21:45:09.321739	create	ca014e90-4cb0-4eb3-9928-f482d9eaf0e6	Address	\N	{"id": [null, "ca014e90-4cb0-4eb3-9928-f482d9eaf0e6"], "city": [null, "Mossoró"], "state": [null, "RN"], "number": [null, "478"], "street": [null, "R. Dr. Almino Afonso"], "zip_code": [null, "59600210"], "complement": [null, "Sala 501"], "created_at": [null, "2026-03-11T18:45:09.321-03:00"], "updated_at": [null, "2026-03-11T18:45:09.321-03:00"], "neighborhood": [null, "Centro"], "enderecavel_id": [null, 0], "enderecavel_type": [null, "Company"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
345	2026-03-11 21:49:23.455816	update	cd86ccff-377a-4dc4-970d-369f973b9973	Project	---\nname: Preparação Acadêmica em Direito\ndescription: Projeto que promove palestras, grupos de estudo e capacitações para estudantes\n  de direito.\ndetails: Fortalecimento da formação acadêmica e profissional dos estudantes.\nfeatured: false\nactive: true\nextension_core_id: b9060c29-723a-4cb2-8465-1a5e7105dfeb\nid: cd86ccff-377a-4dc4-970d-369f973b9973\ncreated_at: 2026-03-11 21:36:27.251443000 +00:00\nupdated_at: 2026-03-11 21:36:27.251443000 +00:00\n	{"active": [true, false], "updated_at": ["2026-03-11T18:36:27.251-03:00", "2026-03-11T18:49:23.455-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
346	2026-03-11 22:07:17.501351	create	bfc963de-772c-440f-a11f-0e5089c5db84	Role	\N	{"id": [null, "bfc963de-772c-440f-a11f-0e5089c5db84"], "name": [null, "dash"], "created_at": [null, "2026-03-11T19:07:17.501-03:00"], "updated_at": [null, "2026-03-11T19:07:17.501-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
347	2026-03-11 22:15:42.417276	destroy	bfc963de-772c-440f-a11f-0e5089c5db84	Role	---\nid: bfc963de-772c-440f-a11f-0e5089c5db84\ncreated_at: 2026-03-11 22:07:17.501351000 +00:00\ndescription:\nname: dash\nupdated_at: 2026-03-11 22:07:17.501351000 +00:00\n	{"id": ["bfc963de-772c-440f-a11f-0e5089c5db84", null], "name": ["dash", null], "created_at": ["2026-03-11T19:07:17.501-03:00", null], "updated_at": ["2026-03-11T19:07:17.501-03:00", null], "description": [null, null]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
348	2026-03-13 14:27:22.252984	update	e06d6bd8-f154-45d8-89a8-bc4aae7ea153	Member	---\nfull_name: Antônio Marcos\nemail: apex7@example.com\nrole: Diretor de Marketing\nphone: 8499999-9999\nactive: true\nfeatured: false\nid: e06d6bd8-f154-45d8-89a8-bc4aae7ea153\nimage: 54d99686-44a2-420f-b666-070ad2a0c56a.webp\ncreated_at: 2026-03-11 20:47:38.828173000 +00:00\nupdated_at: 2026-03-11 20:47:38.828173000 +00:00\n	{"phone": ["8499999-9999", "8499999-999"], "updated_at": ["2026-03-11T17:47:38.828-03:00", "2026-03-13T11:27:22.252-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
349	2026-03-13 14:27:26.936572	update	e06d6bd8-f154-45d8-89a8-bc4aae7ea153	Member	---\nfull_name: Antônio Marcos\nemail: apex7@example.com\nrole: Diretor de Marketing\nphone: 8499999-999\nactive: true\nfeatured: false\nid: e06d6bd8-f154-45d8-89a8-bc4aae7ea153\nimage: 54d99686-44a2-420f-b666-070ad2a0c56a.webp\ncreated_at: 2026-03-11 20:47:38.828173000 +00:00\nupdated_at: 2026-03-13 14:27:22.252984000 +00:00\n	{"phone": ["8499999-999", "8499999-999999"], "updated_at": ["2026-03-13T11:27:22.252-03:00", "2026-03-13T11:27:26.936-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
350	2026-03-17 13:46:21.548142	update	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	Company	---\nname: APEX\ntagline: Empreendedorismo e Soluções Jurídicas\nemail: apex@example.com\nphone: '84999999944'\nid: c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8\ncreated_at: 2026-03-05 13:32:50.504791000 +00:00\nupdated_at: 2026-03-11 21:40:50.973457000 +00:00\n	{"phone": ["84999999944", "849999999"], "updated_at": ["2026-03-11T18:40:50.973-03:00", "2026-03-17T10:46:21.548-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
351	2026-03-17 13:46:24.997629	update	c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8	Company	---\nname: APEX\ntagline: Empreendedorismo e Soluções Jurídicas\nemail: apex@example.com\nphone: '849999999'\nid: c9a7766a-0f2d-49f4-9d9a-ab9b4a6fe6a8\ncreated_at: 2026-03-05 13:32:50.504791000 +00:00\nupdated_at: 2026-03-17 13:46:21.548142000 +00:00\n	{"phone": ["849999999", "84999999944"], "updated_at": ["2026-03-17T10:46:21.548-03:00", "2026-03-17T10:46:24.997-03:00"]}	d1140bd1-0abf-4e2b-a9bd-a5cac16b6e02
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vmuser114
--

SELECT pg_catalog.setval('public.versions_id_seq', 351, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: carousel_frames carousel_frames_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.carousel_frames
    ADD CONSTRAINT carousel_frames_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: extension_cores extension_cores_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.extension_cores
    ADD CONSTRAINT extension_cores_pkey PRIMARY KEY (id);


--
-- Name: hero_banners hero_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.hero_banners
    ADD CONSTRAINT hero_banners_pkey PRIMARY KEY (id);


--
-- Name: hero_cards hero_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.hero_cards
    ADD CONSTRAINT hero_cards_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: page_views page_views_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.page_views
    ADD CONSTRAINT page_views_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: social_media_profiles social_media_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.social_media_profiles
    ADD CONSTRAINT social_media_profiles_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_addresses_on_enderecavel; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_addresses_on_enderecavel ON public.addresses USING btree (enderecavel_type, enderecavel_id);


--
-- Name: index_cards_on_carousel_frame_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_cards_on_carousel_frame_id ON public.cards USING btree (carousel_frame_id);


--
-- Name: index_cards_on_position; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_cards_on_position ON public.cards USING btree ("position");


--
-- Name: index_carousel_frames_on_active; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_carousel_frames_on_active ON public.carousel_frames USING btree (active);


--
-- Name: index_carousel_frames_on_position; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_carousel_frames_on_position ON public.carousel_frames USING btree ("position");


--
-- Name: index_events_on_position; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_events_on_position ON public.events USING btree ("position");


--
-- Name: index_extension_cores_on_member_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_extension_cores_on_member_id ON public.extension_cores USING btree (member_id);


--
-- Name: index_hero_banners_on_active; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_hero_banners_on_active ON public.hero_banners USING btree (active) WHERE (active = true);


--
-- Name: index_permissions_on_resource_and_action; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_permissions_on_resource_and_action ON public.permissions USING btree (resource, action);


--
-- Name: index_projects_on_extension_core_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_projects_on_extension_core_id ON public.projects USING btree (extension_core_id);


--
-- Name: index_projects_on_featured; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_projects_on_featured ON public.projects USING btree (featured);


--
-- Name: index_role_permissions_on_permission_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_role_permissions_on_permission_id ON public.role_permissions USING btree (permission_id);


--
-- Name: index_role_permissions_on_role_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_role_permissions_on_role_id ON public.role_permissions USING btree (role_id);


--
-- Name: index_role_permissions_on_role_id_and_permission_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_role_permissions_on_role_id_and_permission_id ON public.role_permissions USING btree (role_id, permission_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_roles_on_name ON public.roles USING btree (name);


--
-- Name: index_social_media_profiles_on_active; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_social_media_profiles_on_active ON public.social_media_profiles USING btree (active);


--
-- Name: index_social_media_profiles_on_company_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_social_media_profiles_on_company_id ON public.social_media_profiles USING btree (company_id);


--
-- Name: index_social_media_profiles_on_position; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_social_media_profiles_on_position ON public.social_media_profiles USING btree ("position");


--
-- Name: index_user_roles_on_role_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_user_roles_on_role_id ON public.user_roles USING btree (role_id);


--
-- Name: index_user_roles_on_user_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_user_roles_on_user_id ON public.user_roles USING btree (user_id);


--
-- Name: index_user_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_user_roles_on_user_id_and_role_id ON public.user_roles USING btree (user_id, role_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: vmuser114
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: user_roles fk_rails_318345354e; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_rails_318345354e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_roles fk_rails_3369e0d5fc; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_rails_3369e0d5fc FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: role_permissions fk_rails_439e640a3f; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_rails_439e640a3f FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: role_permissions fk_rails_60126080bd; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_rails_60126080bd FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: cards fk_rails_7117ebd4d4; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_rails_7117ebd4d4 FOREIGN KEY (carousel_frame_id) REFERENCES public.carousel_frames(id);


--
-- Name: extension_cores fk_rails_7c65dc5264; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.extension_cores
    ADD CONSTRAINT fk_rails_7c65dc5264 FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: social_media_profiles fk_rails_d2ddad68a6; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.social_media_profiles
    ADD CONSTRAINT fk_rails_d2ddad68a6 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: projects fk_rails_e606157aa2; Type: FK CONSTRAINT; Schema: public; Owner: vmuser114
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_e606157aa2 FOREIGN KEY (extension_core_id) REFERENCES public.extension_cores(id);


--
-- PostgreSQL database dump complete
--

\unrestrict YT6jeX8qc75YfHrGsGAp3U9fgklmQdp0kb2L9Gqox2CKBXbZ0epZFXq9HfuPNdf

