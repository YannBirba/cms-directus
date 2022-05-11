--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 13.1

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
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50) NOT NULL,
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid NOT NULL,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark_outline'::character varying NOT NULL,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    translation_strings json,
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64),
    item character varying(255),
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_activity VALUES
	(1, 'login', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:17:00.527834+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_users', '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL),
	(2, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.831967+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_roles', '815980ab-66c8-4b97-8019-57c65e1f70a4', NULL),
	(3, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '1', NULL),
	(4, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '2', NULL),
	(5, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '3', NULL),
	(6, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '4', NULL),
	(7, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '5', NULL),
	(8, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '6', NULL),
	(9, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '7', NULL),
	(10, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '8', NULL),
	(11, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '9', NULL),
	(12, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '10', NULL),
	(13, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '11', NULL),
	(14, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '12', NULL),
	(15, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '13', NULL),
	(16, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '14', NULL),
	(17, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '15', NULL),
	(18, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '16', NULL),
	(19, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '17', NULL),
	(20, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '18', NULL),
	(21, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '19', NULL),
	(22, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '20', NULL),
	(23, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '21', NULL),
	(24, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '22', NULL),
	(25, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:28:52.85693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_permissions', '23', NULL),
	(26, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:30:17.58764+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_roles', '815980ab-66c8-4b97-8019-57c65e1f70a4', NULL),
	(27, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:54:34.632578+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_settings', '1', NULL);


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_migrations VALUES
	('20201028A', 'Remove Collection Foreign Keys', '2022-05-11 19:07:06.555277+02'),
	('20201029A', 'Remove System Relations', '2022-05-11 19:07:06.557579+02'),
	('20201029B', 'Remove System Collections', '2022-05-11 19:07:06.559359+02'),
	('20201029C', 'Remove System Fields', '2022-05-11 19:07:06.563832+02'),
	('20201105A', 'Add Cascade System Relations', '2022-05-11 19:07:06.581285+02'),
	('20201105B', 'Change Webhook URL Type', '2022-05-11 19:07:06.58377+02'),
	('20210225A', 'Add Relations Sort Field', '2022-05-11 19:07:06.585429+02'),
	('20210304A', 'Remove Locked Fields', '2022-05-11 19:07:06.58743+02'),
	('20210312A', 'Webhooks Collections Text', '2022-05-11 19:07:06.589312+02'),
	('20210331A', 'Add Refresh Interval', '2022-05-11 19:07:06.590405+02'),
	('20210415A', 'Make Filesize Nullable', '2022-05-11 19:07:06.592269+02'),
	('20210416A', 'Add Collections Accountability', '2022-05-11 19:07:06.594563+02'),
	('20210422A', 'Remove Files Interface', '2022-05-11 19:07:06.595775+02'),
	('20210506A', 'Rename Interfaces', '2022-05-11 19:07:06.609188+02'),
	('20210510A', 'Restructure Relations', '2022-05-11 19:07:06.619743+02'),
	('20210518A', 'Add Foreign Key Constraints', '2022-05-11 19:07:06.626252+02'),
	('20210519A', 'Add System Fk Triggers', '2022-05-11 19:07:06.642369+02'),
	('20210521A', 'Add Collections Icon Color', '2022-05-11 19:07:06.644017+02'),
	('20210525A', 'Add Insights', '2022-05-11 19:07:06.656949+02'),
	('20210608A', 'Add Deep Clone Config', '2022-05-11 19:07:06.658216+02'),
	('20210626A', 'Change Filesize Bigint', '2022-05-11 19:07:06.664791+02'),
	('20210716A', 'Add Conditions to Fields', '2022-05-11 19:07:06.666013+02'),
	('20210721A', 'Add Default Folder', '2022-05-11 19:07:06.667879+02'),
	('20210802A', 'Replace Groups', '2022-05-11 19:07:06.669568+02'),
	('20210803A', 'Add Required to Fields', '2022-05-11 19:07:06.670754+02'),
	('20210805A', 'Update Groups', '2022-05-11 19:07:06.672023+02'),
	('20210805B', 'Change Image Metadata Structure', '2022-05-11 19:07:06.673653+02'),
	('20210811A', 'Add Geometry Config', '2022-05-11 19:07:06.674866+02'),
	('20210831A', 'Remove Limit Column', '2022-05-11 19:07:06.675955+02'),
	('20210903A', 'Add Auth Provider', '2022-05-11 19:07:06.683329+02'),
	('20210907A', 'Webhooks Collections Not Null', '2022-05-11 19:07:06.68538+02'),
	('20210910A', 'Move Module Setup', '2022-05-11 19:07:06.687241+02'),
	('20210920A', 'Webhooks URL Not Null', '2022-05-11 19:07:06.689189+02'),
	('20210924A', 'Add Collection Organization', '2022-05-11 19:07:06.691286+02'),
	('20210927A', 'Replace Fields Group', '2022-05-11 19:07:06.693989+02'),
	('20210927B', 'Replace M2M Interface', '2022-05-11 19:07:06.694996+02'),
	('20210929A', 'Rename Login Action', '2022-05-11 19:07:06.696117+02'),
	('20211007A', 'Update Presets', '2022-05-11 19:07:06.698628+02'),
	('20211009A', 'Add Auth Data', '2022-05-11 19:07:06.699814+02'),
	('20211016A', 'Add Webhook Headers', '2022-05-11 19:07:06.700787+02'),
	('20211103A', 'Set Unique to User Token', '2022-05-11 19:07:06.703234+02'),
	('20211103B', 'Update Special Geometry', '2022-05-11 19:07:06.704684+02'),
	('20211104A', 'Remove Collections Listing', '2022-05-11 19:07:06.706085+02'),
	('20211118A', 'Add Notifications', '2022-05-11 19:07:06.715225+02'),
	('20211211A', 'Add Shares', '2022-05-11 19:07:06.725529+02'),
	('20211230A', 'Add Project Descriptor', '2022-05-11 19:07:06.726741+02'),
	('20220303A', 'Remove Default Project Color', '2022-05-11 19:07:06.729505+02'),
	('20220308A', 'Add Bookmark Icon and Color', '2022-05-11 19:07:06.730753+02'),
	('20220314A', 'Add Translation Strings', '2022-05-11 19:07:06.731865+02'),
	('20220322A', 'Rename Field Typecast Flags', '2022-05-11 19:07:06.7335+02'),
	('20220323A', 'Add Field Validation', '2022-05-11 19:07:06.734807+02'),
	('20220325A', 'Fix Typecast Flags', '2022-05-11 19:07:06.736552+02'),
	('20220325B', 'Add Default Language', '2022-05-11 19:07:06.73895+02'),
	('20220402A', 'Remove Default Value Panel Icon', '2022-05-11 19:07:06.740741+02');


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_permissions VALUES
	(1, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_files', 'create', '{}', NULL, NULL, '*'),
	(2, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_files', 'read', '{}', NULL, NULL, '*'),
	(3, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_files', 'update', '{}', NULL, NULL, '*'),
	(4, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_files', 'delete', '{}', NULL, NULL, '*'),
	(5, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_dashboards', 'create', '{}', NULL, NULL, '*'),
	(6, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_dashboards', 'read', '{}', NULL, NULL, '*'),
	(7, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_dashboards', 'update', '{}', NULL, NULL, '*'),
	(8, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_dashboards', 'delete', '{}', NULL, NULL, '*'),
	(9, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_panels', 'create', '{}', NULL, NULL, '*'),
	(10, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_panels', 'read', '{}', NULL, NULL, '*'),
	(11, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_panels', 'update', '{}', NULL, NULL, '*'),
	(12, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_panels', 'delete', '{}', NULL, NULL, '*'),
	(13, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_folders', 'create', '{}', NULL, NULL, '*'),
	(14, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_folders', 'read', '{}', NULL, NULL, '*'),
	(15, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_folders', 'update', '{}', NULL, NULL, '*'),
	(16, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_folders', 'delete', '{}', NULL, NULL, NULL),
	(17, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_users', 'read', '{}', NULL, NULL, '*'),
	(18, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_users', 'update', '{"id":{"_eq":"$CURRENT_USER"}}', NULL, NULL, 'first_name,last_name,email,password,location,title,description,avatar,language,theme'),
	(19, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_roles', 'read', '{}', NULL, NULL, '*'),
	(20, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_shares', 'read', '{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}', NULL, NULL, '*'),
	(21, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_shares', 'create', '{}', NULL, NULL, '*'),
	(22, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_shares', 'update', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*'),
	(23, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_shares', 'delete', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*');


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_revisions VALUES
	(1, 2, 'directus_roles', '815980ab-66c8-4b97-8019-57c65e1f70a4', '{"name":"Manager","admin_access":false,"app_access":true}', '{"name":"Manager","admin_access":false,"app_access":true}', NULL),
	(2, 3, 'directus_permissions', '1', '{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(3, 4, 'directus_permissions', '2', '{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(4, 5, 'directus_permissions', '3', '{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(5, 6, 'directus_permissions', '4', '{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(6, 7, 'directus_permissions', '5', '{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(7, 8, 'directus_permissions', '6', '{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(8, 9, 'directus_permissions', '7', '{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(9, 10, 'directus_permissions', '8', '{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(10, 11, 'directus_permissions', '9', '{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(11, 12, 'directus_permissions', '10', '{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(12, 13, 'directus_permissions', '11', '{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(13, 14, 'directus_permissions', '12', '{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(14, 15, 'directus_permissions', '13', '{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(15, 16, 'directus_permissions', '14', '{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(16, 17, 'directus_permissions', '15', '{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(17, 18, 'directus_permissions', '16', '{"collection":"directus_folders","action":"delete","permissions":{},"role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_folders","action":"delete","permissions":{},"role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(18, 19, 'directus_permissions', '17', '{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(19, 20, 'directus_permissions', '18', '{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(20, 21, 'directus_permissions', '19', '{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(21, 22, 'directus_permissions', '20', '{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(22, 23, 'directus_permissions', '21', '{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(23, 24, 'directus_permissions', '22', '{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(24, 25, 'directus_permissions', '23', '{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', '{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"815980ab-66c8-4b97-8019-57c65e1f70a4"}', NULL),
	(25, 26, 'directus_roles', '815980ab-66c8-4b97-8019-57c65e1f70a4', '{"id":"815980ab-66c8-4b97-8019-57c65e1f70a4","name":"Manager","icon":"lock_open","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"users":[]}', '{"icon":"lock_open"}', NULL),
	(26, 27, 'directus_settings', '1', '{"project_name":"CMS","project_descriptor":"CMS with directus and PostgreSQL","project_color":"#285680","module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"storage_asset_transform":"presets"}', '{"project_name":"CMS","project_descriptor":"CMS with directus and PostgreSQL","project_color":"#285680","module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"storage_asset_transform":"presets"}', NULL);


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_roles VALUES
	('2ac821b8-b88d-472c-b90d-d62c349f3a51', 'Administrator', 'verified', '$t:admin_description', NULL, false, true, true),
	('815980ab-66c8-4b97-8019-57c65e1f70a4', 'Manager', 'lock_open', NULL, NULL, false, false, true);


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_sessions VALUES
	('Xz7Va36IB_588ODAvpYZ6JoXTXudeRy-9BcsTxGMu3gzho3Ufn6dcIruDf_UU7qw', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-18 22:46:32.682+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', NULL);


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_settings VALUES
	(1, 'CMS', NULL, '#285680', NULL, NULL, NULL, NULL, 25, NULL, 'presets', '[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}]', NULL, NULL, NULL, NULL, '[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}]', 'CMS with directus and PostgreSQL', NULL, 'en-US');


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_users VALUES
	('5e259711-9283-4bc8-a781-bf1ce39017f4', 'Admin', 'User', 'a@a.fr', '$argon2i$v=19$m=4096,t=3,p=1$rzfPwuCdbWqopbjHQ0qkqQ$cSTizbdbkpe2IL7lQwiu7oLVtYFdtYQPHcs7ca4oXX0', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '2ac821b8-b88d-472c-b90d-d62c349f3a51', NULL, '2022-05-11 22:46:32.683+02', '/content', 'default', NULL, NULL, true);


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 27, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 1, false);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 23, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 1, false);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 26, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

