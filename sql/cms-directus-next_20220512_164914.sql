--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
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
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    introtext character varying(255),
    content text,
    tags json,
    leading_image integer,
    readmore_text character varying(255)
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_id_seq OWNER TO postgres;

--
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
-- Name: article_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_image (
    id integer NOT NULL,
    article_id integer,
    image_id integer
);


ALTER TABLE public.article_image OWNER TO postgres;

--
-- Name: article_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_image_id_seq OWNER TO postgres;

--
-- Name: article_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_image_id_seq OWNED BY public.article_image.id;


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
-- Name: header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.header (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    content text,
    header_level integer
);


ALTER TABLE public.header OWNER TO postgres;

--
-- Name: header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_id_seq OWNER TO postgres;

--
-- Name: header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.header_id_seq OWNED BY public.header.id;


--
-- Name: header_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.header_level (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255),
    slug character varying(255)
);


ALTER TABLE public.header_level OWNER TO postgres;

--
-- Name: header_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.header_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_level_id_seq OWNER TO postgres;

--
-- Name: header_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.header_level_id_seq OWNED BY public.header_level.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    alt character varying(255),
    file uuid
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- Name: link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255),
    title character varying(255),
    slug character varying(255)
);


ALTER TABLE public.link OWNER TO postgres;

--
-- Name: link_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_id_seq OWNER TO postgres;

--
-- Name: link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_id_seq OWNED BY public.link.id;


--
-- Name: paragraph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paragraph (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    content text,
    name character varying(255),
    slug character varying(255)
);


ALTER TABLE public.paragraph OWNER TO postgres;

--
-- Name: paragraph_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paragraph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paragraph_id_seq OWNER TO postgres;

--
-- Name: paragraph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paragraph_id_seq OWNED BY public.paragraph.id;


--
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- Name: article_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_image ALTER COLUMN id SET DEFAULT nextval('public.article_image_id_seq'::regclass);


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
-- Name: header id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header ALTER COLUMN id SET DEFAULT nextval('public.header_id_seq'::regclass);


--
-- Name: header_level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_level ALTER COLUMN id SET DEFAULT nextval('public.header_level_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- Name: link id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link ALTER COLUMN id SET DEFAULT nextval('public.link_id_seq'::regclass);


--
-- Name: paragraph id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paragraph ALTER COLUMN id SET DEFAULT nextval('public.paragraph_id_seq'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: article_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.article_image VALUES
	(1, NULL, NULL);


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
	(27, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-11 19:54:34.632578+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'directus_settings', '1', NULL),
	(28, 'login', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:40:51.958211+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_users', '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL),
	(29, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:50:43.552665+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '24', NULL),
	(30, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:50:48.22138+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '24', NULL),
	(31, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:32.927656+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '25', NULL),
	(32, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.29794+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_roles', '380a30db-dca1-40f7-a811-47415624b797', NULL),
	(33, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '26', NULL),
	(34, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '27', NULL),
	(35, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '28', NULL),
	(36, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '29', NULL),
	(37, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '30', NULL),
	(38, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '31', NULL),
	(39, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '32', NULL),
	(40, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '33', NULL),
	(41, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '34', NULL),
	(42, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '35', NULL),
	(43, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '36', NULL),
	(44, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '37', NULL),
	(45, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '38', NULL),
	(46, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '39', NULL),
	(47, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '40', NULL),
	(48, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '41', NULL),
	(49, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '42', NULL),
	(50, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '43', NULL),
	(51, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '44', NULL),
	(52, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '45', NULL),
	(53, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '46', NULL),
	(54, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '47', NULL),
	(55, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:51:59.317569+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_permissions', '48', NULL),
	(56, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 10:53:09.963227+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_roles', '380a30db-dca1-40f7-a811-47415624b797', NULL),
	(57, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '1', NULL),
	(58, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '2', NULL),
	(59, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '3', NULL),
	(60, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '4', NULL),
	(61, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '5', NULL),
	(62, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '6', NULL),
	(63, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '7', NULL),
	(64, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:02.007321+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'paragraph', NULL),
	(65, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:05:43.572285+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '8', NULL),
	(66, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:21.008487+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '9', NULL),
	(67, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:26.176225+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '9', NULL),
	(68, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:28.135621+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '8', NULL),
	(69, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.018777+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '1', NULL),
	(70, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.028683+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '2', NULL),
	(71, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.039223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '3', NULL),
	(72, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.047481+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '4', NULL),
	(73, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.05803+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '5', NULL),
	(74, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.067033+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '6', NULL),
	(75, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.075452+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '7', NULL),
	(76, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.083975+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '9', NULL),
	(77, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:08:31.091564+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '8', NULL),
	(79, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:30:53.257532+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '10', NULL),
	(81, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:00.29944+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '10', NULL),
	(92, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:39.073443+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '10', NULL),
	(103, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:33:24.07507+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '18', NULL),
	(105, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '20', NULL),
	(106, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '21', NULL),
	(107, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '22', NULL),
	(108, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '23', NULL),
	(109, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '24', NULL),
	(110, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '25', NULL),
	(111, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '26', NULL),
	(112, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:34:01.246052+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'header', NULL),
	(78, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 11:09:22.144595+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '8', NULL),
	(80, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:30:57.385028+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '8', NULL),
	(82, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.126344+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '1', NULL),
	(83, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.138317+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '2', NULL),
	(84, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.147793+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '3', NULL),
	(85, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.157021+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '4', NULL),
	(86, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.16617+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '5', NULL),
	(87, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.174737+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '6', NULL),
	(88, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.18368+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '7', NULL),
	(89, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.192464+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '9', NULL),
	(90, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.200095+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '10', NULL),
	(91, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:31:02.217461+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '8', NULL),
	(93, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '11', NULL),
	(94, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '12', NULL),
	(95, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '13', NULL),
	(96, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '14', NULL),
	(97, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '15', NULL),
	(98, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '16', NULL),
	(99, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '17', NULL),
	(100, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:32:37.175055+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'header_level', NULL),
	(101, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:33:09.36056+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '18', NULL),
	(102, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:33:21.451634+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '19', NULL),
	(104, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:33:25.727921+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '19', NULL),
	(113, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:35:04.202102+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '27', NULL),
	(114, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:37:24.561146+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '28', NULL),
	(115, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:12.689075+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'header_level', '1', NULL),
	(116, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:22.888751+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'header_level', '2', NULL),
	(117, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:30.613928+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'header_level', '3', NULL),
	(118, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:36.31126+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'header_level', '4', NULL),
	(119, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:43.118029+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'header_level', '5', NULL),
	(120, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:49.019308+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'header_level', '6', NULL),
	(121, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:41:22.697975+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '29', NULL),
	(122, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:13.623779+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '29', NULL),
	(123, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:16.143223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '29', NULL),
	(124, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:18.144678+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '27', NULL),
	(125, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:43.809943+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '21', NULL),
	(126, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:47.805655+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '29', NULL),
	(136, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:57.973573+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '27', NULL),
	(146, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:26.669491+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '38', NULL),
	(150, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:38.42804+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '41', NULL),
	(152, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:52.044047+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '43', NULL),
	(153, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:52.044047+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'test_files_1', NULL),
	(154, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:52.099279+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '44', NULL),
	(127, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.915667+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '20', NULL),
	(128, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.924464+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '21', NULL),
	(129, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.932328+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '29', NULL),
	(130, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.940058+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '22', NULL),
	(131, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.948481+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '23', NULL),
	(132, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.95665+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '24', NULL),
	(133, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.964749+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '25', NULL),
	(134, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.972422+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '26', NULL),
	(135, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:42:49.981177+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '27', NULL),
	(137, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '30', NULL),
	(138, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '31', NULL),
	(139, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '32', NULL),
	(140, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '33', NULL),
	(141, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '34', NULL),
	(142, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '35', NULL),
	(143, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '36', NULL),
	(144, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:06.258969+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'test', NULL),
	(145, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:17.088599+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '37', NULL),
	(147, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:38.319282+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '39', NULL),
	(148, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:38.319282+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'test_files', NULL),
	(149, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:38.369305+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '40', NULL),
	(151, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:51.983586+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '42', NULL),
	(155, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:45:52.160698+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '45', NULL),
	(156, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:20.828645+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'test_files', NULL),
	(157, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:23.118282+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'test_files_1', NULL),
	(158, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:26.93307+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'test', NULL),
	(159, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '46', NULL),
	(160, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '47', NULL),
	(161, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '48', NULL),
	(162, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '49', NULL),
	(163, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '50', NULL),
	(164, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '51', NULL),
	(165, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '52', NULL),
	(166, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:46:35.123371+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'image', NULL),
	(167, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:47:32.585624+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '53', NULL),
	(168, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:48:11.174641+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '54', NULL),
	(170, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:48:18.224437+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '54', NULL),
	(169, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:48:15.96308+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '53', NULL),
	(171, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:48:49.127825+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '55', NULL),
	(172, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:18.196354+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '55', NULL),
	(173, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(174, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(175, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(176, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(177, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(178, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(179, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(180, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:49:57.453223+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'article', NULL),
	(181, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:51:21.272735+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '63', NULL),
	(182, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:52:56.629154+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '63', NULL),
	(183, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:54:43.875625+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '64', NULL),
	(184, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:56:13.454358+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(185, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:56:13.51613+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '66', NULL),
	(186, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:56:13.51613+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'article_image', NULL),
	(187, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:56:13.568915+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '67', NULL),
	(188, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:56:13.627061+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '68', NULL),
	(189, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:58:08.89693+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(190, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:58:45.168572+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_files', '8b6d83d4-3c4c-4e12-bcf0-266fa49e6826', NULL),
	(191, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:59:09.516822+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'image', '1', NULL),
	(192, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:59:09.516822+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'article_image', '1', NULL),
	(193, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:59:09.516822+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'article', '1', NULL),
	(194, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:00:15.273901+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(195, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:03:13.68711+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'image', '1', NULL),
	(196, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:03:31.929778+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_files', '8b6d83d4-3c4c-4e12-bcf0-266fa49e6826', NULL),
	(197, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:03:58.043269+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'article', '1', NULL),
	(198, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:04:40.619343+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(199, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:18.775225+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(200, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:31.36141+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(201, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:36.207915+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(202, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:38.520991+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(203, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.38512+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(204, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.396762+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(205, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.408948+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(206, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.426887+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(207, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.434157+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(208, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.441539+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(209, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.448305+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(210, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.459523+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(211, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.468218+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(212, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.475895+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(213, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:06:43.482784+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(214, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:23.850619+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(215, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.21981+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(216, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.229614+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(217, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.239168+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(218, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.247137+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(219, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.254654+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(220, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.261851+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(221, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.269167+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(222, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.2794+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(223, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.293683+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(224, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.301302+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(225, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.309043+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(226, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:30.316524+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(227, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.896794+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(228, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.90369+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(229, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.911088+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(230, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.91783+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(231, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.926121+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(232, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.933536+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(233, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.943801+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(234, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.951263+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(235, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.958404+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(236, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.964423+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(237, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.970955+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(238, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:09:44.978106+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(239, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:25.162332+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(240, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:28.682399+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(242, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.865712+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(243, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.874203+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(244, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.883616+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(245, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.891861+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(246, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.903923+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(247, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.911934+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(248, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.919715+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(249, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.929162+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(250, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.93599+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(251, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.942973+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL);
INSERT INTO public.directus_activity VALUES
	(252, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.949695+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(253, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.957496+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(254, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:32.964115+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(241, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:12:30.272143+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(255, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:13:03.006359+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_files', 'd24490ce-4109-45c6-a9d0-38b8fb40e179', NULL),
	(256, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:14:02.057695+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'image', '2', NULL),
	(257, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:14:02.057695+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'article', '2', NULL),
	(258, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:14:50.178808+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(259, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:17:17.486958+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'article', '2', NULL),
	(260, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:17:22.023802+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_files', 'd24490ce-4109-45c6-a9d0-38b8fb40e179', NULL),
	(261, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:17:50.069255+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '74', NULL),
	(262, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:24.717659+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '75', NULL),
	(263, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.771246+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(264, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.782725+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(265, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.789913+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(266, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.797903+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(267, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.806017+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(268, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.81306+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(269, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.818956+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(270, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.826131+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(271, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.832281+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(272, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.83859+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(273, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.845489+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(274, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.856999+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '75', NULL),
	(275, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.86438+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(276, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:19:44.87068+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(277, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:21:41.059385+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '76', NULL),
	(278, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.087011+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(279, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.098778+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(280, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.106636+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(281, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.11442+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(282, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.123572+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(283, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.133749+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(284, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.141628+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(285, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.149311+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(286, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.158443+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(287, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.165719+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(288, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.172883+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(289, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.18173+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '75', NULL),
	(290, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.189988+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(291, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.196859+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(292, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:04.204655+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '76', NULL),
	(293, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.938801+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(294, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.948128+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(295, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.96198+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(296, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.970362+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(297, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.979127+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(298, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.988245+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(299, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:14.996589+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(300, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.004886+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '76', NULL),
	(301, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.012704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(302, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.021499+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(303, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.028719+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(304, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.036521+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(305, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.043085+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '75', NULL),
	(306, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.051306+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(307, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:22:15.060361+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(308, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:23:41.594342+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '77', NULL),
	(309, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:36.210819+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '78', NULL),
	(310, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:44.728578+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(311, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:47.763383+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '78', NULL),
	(312, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.738447+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '56', NULL),
	(313, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.747818+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '58', NULL),
	(314, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.756579+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '59', NULL),
	(315, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.76547+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '60', NULL),
	(316, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.774495+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '61', NULL),
	(317, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.781416+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '62', NULL),
	(318, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.788461+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '57', NULL),
	(319, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.795669+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '78', NULL),
	(320, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.805992+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '76', NULL),
	(321, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.820163+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '69', NULL),
	(322, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.827899+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '70', NULL),
	(323, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.834323+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '72', NULL),
	(324, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.843094+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '71', NULL),
	(325, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.851706+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '75', NULL),
	(326, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.858292+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '73', NULL),
	(327, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:26:49.865264+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '65', NULL),
	(328, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:27:18.013502+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '78', NULL),
	(329, 'delete', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:28:59.780289+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'image', '2', NULL),
	(330, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:31:57.128487+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(331, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:32:31.406655+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '79', NULL),
	(332, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:34:53.958581+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(333, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:34:59.695465+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '80', NULL),
	(334, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:37:48.954409+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(335, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:38:51.293315+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(336, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:39:06.124405+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(337, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:39:12.563106+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(338, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:39:18.353136+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(339, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:39:33.573808+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(340, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:40:54.129684+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(341, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:40:57.891738+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '78', NULL),
	(342, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:42:37.666651+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_settings', '1', NULL),
	(343, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:42:39.063998+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '76', NULL),
	(344, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '81', NULL),
	(345, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '82', NULL),
	(346, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '83', NULL),
	(347, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '84', NULL),
	(348, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '85', NULL),
	(349, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '86', NULL),
	(350, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '87', NULL),
	(351, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:45:56.372704+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_collections', 'link', NULL),
	(352, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:46:24.284225+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '88', NULL),
	(353, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:46:32.216673+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '89', NULL),
	(354, 'create', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:32.214804+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '90', NULL),
	(355, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:37.276558+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '89', NULL),
	(356, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:44.021284+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '88', NULL),
	(357, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:48.786647+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '90', NULL),
	(358, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:52.636363+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '82', NULL),
	(359, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.503992+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '81', NULL),
	(360, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.512421+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '83', NULL),
	(361, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.520794+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '84', NULL),
	(362, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.527434+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '85', NULL),
	(363, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.533677+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '86', NULL),
	(364, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.540009+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '87', NULL),
	(365, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.546595+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '82', NULL),
	(366, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.55416+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '88', NULL),
	(367, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.559471+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '89', NULL),
	(368, 'update', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 16:47:55.566402+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'directus_fields', '90', NULL);


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_collections VALUES
	('paragraph', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open'),
	('header_level', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open'),
	('header', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open'),
	('image', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open'),
	('article', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open'),
	('article_image', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
	('link', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open');


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_fields VALUES
	(20, 'header', 'id', NULL, 'input', NULL, NULL, NULL, true, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(21, 'header', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, 2, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(22, 'header', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, 4, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(1, 'paragraph', 'id', NULL, 'input', NULL, NULL, NULL, true, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(2, 'paragraph', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, 2, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(3, 'paragraph', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, 3, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(4, 'paragraph', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 4, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(5, 'paragraph', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(6, 'paragraph', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(7, 'paragraph', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 7, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(9, 'paragraph', 'name', NULL, 'input', '{"iconLeft":null,"placeholder":"Name for the paragraph","iconRight":"drive_file_rename_outline"}', NULL, NULL, false, false, 8, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(8, 'paragraph', 'content', NULL, 'input-rich-text-html', NULL, NULL, NULL, false, true, 10, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(10, 'paragraph', 'slug', NULL, 'input', '{"iconRight":"insert_link","trim":true,"slug":true}', NULL, NULL, false, false, 9, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(11, 'header_level', 'id', NULL, 'input', NULL, NULL, NULL, true, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(12, 'header_level', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(13, 'header_level', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(14, 'header_level', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(15, 'header_level', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(16, 'header_level', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(17, 'header_level', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(18, 'header_level', 'name', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(19, 'header_level', 'slug', NULL, 'input', '{"trim":true,"slug":true}', NULL, NULL, false, false, NULL, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(29, 'header', 'header_level', 'm2o', 'select-dropdown-m2o', '{"template":"{{name}}"}', NULL, NULL, false, false, 3, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(23, 'header', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(24, 'header', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(25, 'header', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 7, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(26, 'header', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 8, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(66, 'article_image', 'id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(27, 'header', 'content', NULL, 'input-rich-text-html', NULL, NULL, '{}', false, false, 9, 'full', NULL, NULL, NULL, true, NULL, '{"_and":[{"content":{"_lte":"50"}}]}', NULL),
	(46, 'image', 'id', NULL, 'input', NULL, NULL, NULL, true, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(47, 'image', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(48, 'image', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(49, 'image', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(50, 'image', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(51, 'image', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(52, 'image', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(53, 'image', 'title', NULL, 'input', '{"iconRight":"title","placeholder":"Enter a title"}', NULL, NULL, false, false, NULL, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(54, 'image', 'alt', NULL, 'input', '{"iconRight":"list_alt","placeholder":"Enter an alternative  text"}', NULL, NULL, false, false, NULL, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(55, 'image', 'file', 'file', 'file-image', '{}', 'image', '{"circle":true}', false, false, NULL, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(67, 'article_image', 'article_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(68, 'article_image', 'image_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(73, 'article', 'leading_image', 'm2o', 'select-dropdown-m2o', '{"template":"{{file.$thumbnail}}"}', 'related-values', '{"template":"{{file.$thumbnail}}"}', false, false, 15, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(69, 'article', 'title', NULL, 'input', '{"placeholder":"Chose a title","iconRight":"title"}', NULL, NULL, false, false, 10, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(56, 'article', 'id', NULL, 'input', NULL, NULL, NULL, true, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(58, 'article', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, 2, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(59, 'article', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 3, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(60, 'article', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 4, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(61, 'article', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(70, 'article', 'introtext', NULL, 'input', '{"iconRight":"short_text","placeholder":"Enter a introduction"}', NULL, NULL, false, false, 11, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(72, 'article', 'tags', 'cast-json', 'tags', '{"capitalization":"auto-format","iconRight":"tag"}', NULL, NULL, false, false, 12, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(71, 'article', 'content', NULL, 'input-rich-text-html', NULL, NULL, NULL, false, false, 13, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(65, 'article', 'content_images', 'm2m', 'list-m2m', '{"filter":null,"template":"{{image_id.file.$thumbnail}}"}', 'related-values', '{"template":"{{image_id.file.$thumbnail}}"}', false, false, 16, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(79, 'article', 'additional_informations', 'alias,no-data', 'presentation-divider', '{"title":"$t:additional_informations","color":"#A2B5CD","icon":"playlist_add","inlineTitle":true}', NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(62, 'article', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(75, 'article', 'images_management', 'alias,no-data', 'presentation-divider', '{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true}', NULL, NULL, false, false, 14, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(80, 'article', 'readmore_text', NULL, 'input', '{"placeholder":"$t:enter_a_readmore_text","iconRight":"link"}', NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(78, 'article', 'preview_button', 'alias,no-data', 'presentation-links', '{"links":[{"label":"$t:preview_article","icon":"remove_red_eye","type":"primary","url":"https://frontendurl.com"}]}', NULL, NULL, false, false, 8, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(76, 'article', 'general_informations', 'alias,no-data', 'presentation-divider', '{"title":"$t:general_informations","color":"#A2B5CD","icon":"article","inlineTitle":true}', NULL, NULL, false, false, 9, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(57, 'article', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, 7, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(90, 'link', 'slug', NULL, 'input', '{"iconRight":"minimize","trim":true,"slug":true}', NULL, NULL, false, false, 10, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(81, 'link', 'id', NULL, 'input', NULL, NULL, NULL, true, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(83, 'link', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, 2, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(84, 'link', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 3, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(85, 'link', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 4, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(86, 'link', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(87, 'link', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL),
	(88, 'link', 'name', NULL, 'input', '{"iconRight":"drive_file_rename_outline"}', NULL, NULL, false, false, 8, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(89, 'link', 'title', NULL, 'input', '{"iconRight":"title"}', NULL, NULL, false, false, 9, 'half', NULL, NULL, NULL, true, NULL, NULL, NULL),
	(82, 'link', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, 7, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);


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
	(23, '815980ab-66c8-4b97-8019-57c65e1f70a4', 'directus_shares', 'delete', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*'),
	(25, NULL, 'directus_files', 'read', '{}', '{}', NULL, '*'),
	(26, '380a30db-dca1-40f7-a811-47415624b797', 'directus_files', 'create', '{}', NULL, NULL, '*'),
	(27, '380a30db-dca1-40f7-a811-47415624b797', 'directus_files', 'read', '{}', NULL, NULL, '*'),
	(28, '380a30db-dca1-40f7-a811-47415624b797', 'directus_files', 'update', '{}', NULL, NULL, '*'),
	(29, '380a30db-dca1-40f7-a811-47415624b797', 'directus_files', 'delete', '{}', NULL, NULL, '*'),
	(30, '380a30db-dca1-40f7-a811-47415624b797', 'directus_dashboards', 'create', '{}', NULL, NULL, '*'),
	(31, '380a30db-dca1-40f7-a811-47415624b797', 'directus_dashboards', 'read', '{}', NULL, NULL, '*'),
	(32, '380a30db-dca1-40f7-a811-47415624b797', 'directus_dashboards', 'update', '{}', NULL, NULL, '*'),
	(33, '380a30db-dca1-40f7-a811-47415624b797', 'directus_dashboards', 'delete', '{}', NULL, NULL, '*'),
	(34, '380a30db-dca1-40f7-a811-47415624b797', 'directus_panels', 'create', '{}', NULL, NULL, '*'),
	(35, '380a30db-dca1-40f7-a811-47415624b797', 'directus_panels', 'read', '{}', NULL, NULL, '*'),
	(36, '380a30db-dca1-40f7-a811-47415624b797', 'directus_panels', 'update', '{}', NULL, NULL, '*'),
	(37, '380a30db-dca1-40f7-a811-47415624b797', 'directus_panels', 'delete', '{}', NULL, NULL, '*'),
	(38, '380a30db-dca1-40f7-a811-47415624b797', 'directus_folders', 'create', '{}', NULL, NULL, '*'),
	(39, '380a30db-dca1-40f7-a811-47415624b797', 'directus_folders', 'read', '{}', NULL, NULL, '*'),
	(40, '380a30db-dca1-40f7-a811-47415624b797', 'directus_folders', 'update', '{}', NULL, NULL, '*'),
	(41, '380a30db-dca1-40f7-a811-47415624b797', 'directus_folders', 'delete', '{}', NULL, NULL, NULL),
	(42, '380a30db-dca1-40f7-a811-47415624b797', 'directus_users', 'read', '{}', NULL, NULL, '*'),
	(43, '380a30db-dca1-40f7-a811-47415624b797', 'directus_users', 'update', '{"id":{"_eq":"$CURRENT_USER"}}', NULL, NULL, 'first_name,last_name,email,password,location,title,description,avatar,language,theme'),
	(44, '380a30db-dca1-40f7-a811-47415624b797', 'directus_roles', 'read', '{}', NULL, NULL, '*'),
	(45, '380a30db-dca1-40f7-a811-47415624b797', 'directus_shares', 'read', '{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}', NULL, NULL, '*'),
	(46, '380a30db-dca1-40f7-a811-47415624b797', 'directus_shares', 'create', '{}', NULL, NULL, '*'),
	(47, '380a30db-dca1-40f7-a811-47415624b797', 'directus_shares', 'update', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*'),
	(48, '380a30db-dca1-40f7-a811-47415624b797', 'directus_shares', 'delete', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*');


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_presets VALUES
	(5, NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL, 'article', NULL, 'tabular', '{"tabular":{"fields":["leading_image","title","status"]}}', '{"tabular":{"widths":{"leading_image":152.7547607421875,"title":286.79248046875,"status":93.88671875},"spacing":"comfortable"}}', NULL, NULL, 'bookmark_outline', NULL),
	(2, NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL, 'header_level', NULL, 'tabular', '{"tabular":{"fields":["name"]}}', '{"cards":{"title":"{{name}}","subtitle":null,"icon":null},"calendar":{"viewInfo":{"type":"dayGridMonth","startDateStr":"2022-05-01T00:00:00+02:00"}},"tabular":{"widths":{"name":91.1697998046875}}}', NULL, NULL, 'bookmark_outline', NULL),
	(1, NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL, 'header', NULL, 'tabular', NULL, NULL, NULL, NULL, 'bookmark_outline', NULL),
	(3, NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL, 'image', NULL, 'cards', NULL, '{"cards":{"title":"{{title}}","subtitle":"{{file.filesize}}"}}', NULL, NULL, 'bookmark_outline', NULL),
	(4, NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', NULL, 'directus_files', NULL, 'cards', '{"cards":{"sort":["-uploaded_on"],"page":1}}', '{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}', NULL, NULL, 'bookmark_outline', NULL);


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_relations VALUES
	(1, 'paragraph', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(2, 'paragraph', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(3, 'header_level', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(4, 'header_level', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(5, 'header', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(6, 'header', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(7, 'header', 'header_level', 'header_level', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(16, 'image', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(17, 'image', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(18, 'image', 'file', 'directus_files', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(19, 'article', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(20, 'article', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(21, 'article_image', 'image_id', 'image', NULL, NULL, NULL, 'article_id', NULL, 'nullify'),
	(22, 'article_image', 'article_id', 'article', 'content_images', NULL, NULL, 'image_id', NULL, 'nullify'),
	(23, 'article', 'leading_image', 'image', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(24, 'link', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
	(25, 'link', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');


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
	(26, 27, 'directus_settings', '1', '{"project_name":"CMS","project_descriptor":"CMS with directus and PostgreSQL","project_color":"#285680","module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"storage_asset_transform":"presets"}', '{"project_name":"CMS","project_descriptor":"CMS with directus and PostgreSQL","project_color":"#285680","module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"storage_asset_transform":"presets"}', NULL),
	(27, 29, 'directus_permissions', '24', '{"role":null,"collection":"directus_files","action":"read"}', '{"role":null,"collection":"directus_files","action":"read"}', NULL),
	(28, 31, 'directus_permissions', '25', '{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(29, 32, 'directus_roles', '380a30db-dca1-40f7-a811-47415624b797', '{"name":"Client","admin_access":false,"app_access":true}', '{"name":"Client","admin_access":false,"app_access":true}', NULL),
	(30, 33, 'directus_permissions', '26', '{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(31, 34, 'directus_permissions', '27', '{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(32, 35, 'directus_permissions', '28', '{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(33, 36, 'directus_permissions', '29', '{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(34, 37, 'directus_permissions', '30', '{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(35, 38, 'directus_permissions', '31', '{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(36, 39, 'directus_permissions', '32', '{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(37, 40, 'directus_permissions', '33', '{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(38, 41, 'directus_permissions', '34', '{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(39, 42, 'directus_permissions', '35', '{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(40, 43, 'directus_permissions', '36', '{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(41, 44, 'directus_permissions', '37', '{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(42, 45, 'directus_permissions', '38', '{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(43, 46, 'directus_permissions', '39', '{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(44, 47, 'directus_permissions', '40', '{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(45, 48, 'directus_permissions', '41', '{"collection":"directus_folders","action":"delete","permissions":{},"role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_folders","action":"delete","permissions":{},"role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(46, 49, 'directus_permissions', '42', '{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(47, 50, 'directus_permissions', '43', '{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(92, 95, 'directus_fields', '13', '{"interface":"input","hidden":true,"field":"sort","collection":"header_level"}', '{"interface":"input","hidden":true,"field":"sort","collection":"header_level"}', NULL),
	(48, 51, 'directus_permissions', '44', '{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(49, 52, 'directus_permissions', '45', '{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(50, 53, 'directus_permissions', '46', '{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(51, 54, 'directus_permissions', '47', '{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(52, 55, 'directus_permissions', '48', '{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', '{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"380a30db-dca1-40f7-a811-47415624b797"}', NULL),
	(53, 56, 'directus_roles', '380a30db-dca1-40f7-a811-47415624b797', '{"id":"380a30db-dca1-40f7-a811-47415624b797","name":"Client","icon":"person","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"users":[]}', '{"icon":"person"}', NULL),
	(54, 57, 'directus_fields', '1', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"paragraph"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"paragraph"}', NULL),
	(55, 58, 'directus_fields', '2', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"paragraph"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"paragraph"}', NULL),
	(56, 59, 'directus_fields', '3', '{"interface":"input","hidden":true,"field":"sort","collection":"paragraph"}', '{"interface":"input","hidden":true,"field":"sort","collection":"paragraph"}', NULL),
	(57, 60, 'directus_fields', '4', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"paragraph"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"paragraph"}', NULL),
	(58, 61, 'directus_fields', '5', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"paragraph"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"paragraph"}', NULL),
	(59, 62, 'directus_fields', '6', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"paragraph"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"paragraph"}', NULL),
	(60, 63, 'directus_fields', '7', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"paragraph"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"paragraph"}', NULL),
	(61, 64, 'directus_collections', 'paragraph', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"paragraph"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"paragraph"}', NULL),
	(62, 65, 'directus_fields', '8', '{"interface":"input-rich-text-html","special":null,"required":true,"collection":"paragraph","field":"content"}', '{"interface":"input-rich-text-html","special":null,"required":true,"collection":"paragraph","field":"content"}', NULL),
	(63, 66, 'directus_fields', '9', '{"interface":"input","special":null,"required":true,"options":{"iconLeft":null,"placeholder":"Name for the paragraph","iconRight":"drive_file_rename_outline"},"collection":"paragraph","field":"name"}', '{"interface":"input","special":null,"required":true,"options":{"iconLeft":null,"placeholder":"Name for the paragraph","iconRight":"drive_file_rename_outline"},"collection":"paragraph","field":"name"}', NULL),
	(64, 67, 'directus_fields', '9', '{"id":9,"collection":"paragraph","field":"name","special":null,"interface":"input","options":{"iconLeft":null,"placeholder":"Name for the paragraph","iconRight":"drive_file_rename_outline"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"name","width":"half"}', NULL),
	(65, 68, 'directus_fields', '8', '{"id":8,"collection":"paragraph","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"content","width":"half"}', NULL),
	(66, 69, 'directus_fields', '1', '{"id":1,"collection":"paragraph","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"id","sort":1,"group":null}', NULL),
	(67, 70, 'directus_fields', '2', '{"id":2,"collection":"paragraph","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"status","sort":2,"group":null}', NULL),
	(68, 71, 'directus_fields', '3', '{"id":3,"collection":"paragraph","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"sort","sort":3,"group":null}', NULL),
	(69, 72, 'directus_fields', '4', '{"id":4,"collection":"paragraph","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"user_created","sort":4,"group":null}', NULL),
	(70, 73, 'directus_fields', '5', '{"id":5,"collection":"paragraph","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"date_created","sort":5,"group":null}', NULL),
	(71, 74, 'directus_fields', '6', '{"id":6,"collection":"paragraph","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"user_updated","sort":6,"group":null}', NULL),
	(72, 75, 'directus_fields', '7', '{"id":7,"collection":"paragraph","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"date_updated","sort":7,"group":null}', NULL),
	(73, 76, 'directus_fields', '9', '{"id":9,"collection":"paragraph","field":"name","special":null,"interface":"input","options":{"iconLeft":null,"placeholder":"Name for the paragraph","iconRight":"drive_file_rename_outline"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"name","sort":8,"group":null}', NULL),
	(74, 77, 'directus_fields', '8', '{"id":8,"collection":"paragraph","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"content","sort":9,"group":null}', NULL),
	(76, 79, 'directus_fields', '10', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"insert_link"},"collection":"paragraph","field":"slug"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"insert_link"},"collection":"paragraph","field":"slug"}', NULL),
	(78, 81, 'directus_fields', '10', '{"id":10,"collection":"paragraph","field":"slug","special":null,"interface":"input","options":{"iconRight":"insert_link"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"slug","width":"half"}', NULL),
	(89, 92, 'directus_fields', '10', '{"id":10,"collection":"paragraph","field":"slug","special":null,"interface":"input","options":{"iconRight":"insert_link","trim":true,"slug":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"slug","special":null,"interface":"input","options":{"iconRight":"insert_link","trim":true,"slug":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', NULL),
	(100, 103, 'directus_fields', '18', '{"id":18,"collection":"header_level","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"header_level","field":"name","width":"half"}', NULL),
	(102, 105, 'directus_fields', '20', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"header"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"header"}', NULL),
	(122, 125, 'directus_fields', '21', '{"id":21,"collection":"header","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"status","width":"half"}', NULL),
	(75, 78, 'directus_fields', '8', '{"id":8,"collection":"paragraph","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', NULL),
	(77, 80, 'directus_fields', '8', '{"id":8,"collection":"paragraph","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"content","width":"full"}', NULL),
	(79, 82, 'directus_fields', '1', '{"id":1,"collection":"paragraph","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"id","sort":1,"group":null}', NULL),
	(80, 83, 'directus_fields', '2', '{"id":2,"collection":"paragraph","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"status","sort":2,"group":null}', NULL),
	(81, 84, 'directus_fields', '3', '{"id":3,"collection":"paragraph","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"sort","sort":3,"group":null}', NULL),
	(82, 85, 'directus_fields', '4', '{"id":4,"collection":"paragraph","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"user_created","sort":4,"group":null}', NULL),
	(83, 86, 'directus_fields', '5', '{"id":5,"collection":"paragraph","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"date_created","sort":5,"group":null}', NULL),
	(84, 87, 'directus_fields', '6', '{"id":6,"collection":"paragraph","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"user_updated","sort":6,"group":null}', NULL),
	(85, 88, 'directus_fields', '7', '{"id":7,"collection":"paragraph","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"date_updated","sort":7,"group":null}', NULL),
	(86, 89, 'directus_fields', '9', '{"id":9,"collection":"paragraph","field":"name","special":null,"interface":"input","options":{"iconLeft":null,"placeholder":"Name for the paragraph","iconRight":"drive_file_rename_outline"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"name","sort":8,"group":null}', NULL),
	(87, 90, 'directus_fields', '10', '{"id":10,"collection":"paragraph","field":"slug","special":null,"interface":"input","options":{"iconRight":"insert_link"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"slug","sort":9,"group":null}', NULL),
	(88, 91, 'directus_fields', '8', '{"id":8,"collection":"paragraph","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"paragraph","field":"content","sort":10,"group":null}', NULL),
	(90, 93, 'directus_fields', '11', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"header_level"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"header_level"}', NULL),
	(91, 94, 'directus_fields', '12', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"header_level"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"header_level"}', NULL),
	(93, 96, 'directus_fields', '14', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"header_level"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"header_level"}', NULL),
	(94, 97, 'directus_fields', '15', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"header_level"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"header_level"}', NULL),
	(95, 98, 'directus_fields', '16', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"header_level"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"header_level"}', NULL),
	(96, 99, 'directus_fields', '17', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"header_level"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"header_level"}', NULL),
	(97, 100, 'directus_collections', 'header_level', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"header_level"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"header_level"}', NULL),
	(98, 101, 'directus_fields', '18', '{"interface":"input","special":null,"required":true,"collection":"header_level","field":"name"}', '{"interface":"input","special":null,"required":true,"collection":"header_level","field":"name"}', NULL),
	(99, 102, 'directus_fields', '19', '{"interface":"input","special":null,"required":true,"options":{"trim":true,"slug":true},"collection":"header_level","field":"slug"}', '{"interface":"input","special":null,"required":true,"options":{"trim":true,"slug":true},"collection":"header_level","field":"slug"}', NULL),
	(101, 104, 'directus_fields', '19', '{"id":19,"collection":"header_level","field":"slug","special":null,"interface":"input","options":{"trim":true,"slug":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"header_level","field":"slug","width":"half"}', NULL),
	(103, 106, 'directus_fields', '21', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"header"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"header"}', NULL),
	(104, 107, 'directus_fields', '22', '{"interface":"input","hidden":true,"field":"sort","collection":"header"}', '{"interface":"input","hidden":true,"field":"sort","collection":"header"}', NULL),
	(105, 108, 'directus_fields', '23', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"header"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"header"}', NULL),
	(106, 109, 'directus_fields', '24', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"header"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"header"}', NULL),
	(107, 110, 'directus_fields', '25', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"header"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"header"}', NULL),
	(108, 111, 'directus_fields', '26', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"header"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"header"}', NULL),
	(109, 112, 'directus_collections', 'header', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"header"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"header"}', NULL),
	(110, 113, 'directus_fields', '27', '{"interface":"input-rich-text-html","special":null,"required":true,"display":null,"display_options":{},"validation":{"_and":[{"content":{"_lte":"50"}}]},"collection":"header","field":"content"}', '{"interface":"input-rich-text-html","special":null,"required":true,"display":null,"display_options":{},"validation":{"_and":[{"content":{"_lte":"50"}}]},"collection":"header","field":"content"}', NULL),
	(111, 114, 'directus_fields', '28', '{"special":"o2m","required":true,"interface":"list-o2m","options":{"template":"{{name}}","enableCreate":false},"collection":"header","field":"header_level"}', '{"special":"o2m","required":true,"interface":"list-o2m","options":{"template":"{{name}}","enableCreate":false},"collection":"header","field":"header_level"}', NULL),
	(112, 115, 'header_level', '1', '{"status":"published","name":"h1","slug":"h1"}', '{"status":"published","name":"h1","slug":"h1"}', NULL),
	(113, 116, 'header_level', '2', '{"name":"h2","slug":"h2","status":"published"}', '{"name":"h2","slug":"h2","status":"published"}', NULL),
	(114, 117, 'header_level', '3', '{"name":"h3","slug":"h3","status":"published"}', '{"name":"h3","slug":"h3","status":"published"}', NULL),
	(115, 118, 'header_level', '4', '{"name":"h4","slug":"h4","status":"published"}', '{"name":"h4","slug":"h4","status":"published"}', NULL),
	(116, 119, 'header_level', '5', '{"name":"h5","slug":"h5","status":"published"}', '{"name":"h5","slug":"h5","status":"published"}', NULL),
	(117, 120, 'header_level', '6', '{"status":"published","name":"h6","slug":"h6"}', '{"status":"published","name":"h6","slug":"h6"}', NULL),
	(118, 121, 'directus_fields', '29', '{"interface":"select-dropdown-m2o","special":"m2o","required":true,"options":{"template":"{{name}}"},"collection":"header","field":"header_level"}', '{"interface":"select-dropdown-m2o","special":"m2o","required":true,"options":{"template":"{{name}}"},"collection":"header","field":"header_level"}', NULL),
	(119, 122, 'directus_fields', '29', '{"id":29,"collection":"header","field":"header_level","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"fill","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"header_level","width":"fill"}', NULL),
	(120, 123, 'directus_fields', '29', '{"id":29,"collection":"header","field":"header_level","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"header_level","width":"full"}', NULL),
	(121, 124, 'directus_fields', '27', '{"id":27,"collection":"header","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":{},"readonly":false,"hidden":false,"sort":null,"width":"fill","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":{"_and":[{"content":{"_lte":"50"}}]},"validation_message":null}', '{"collection":"header","field":"content","width":"fill"}', NULL),
	(123, 126, 'directus_fields', '29', '{"id":29,"collection":"header","field":"header_level","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"header_level","width":"half"}', NULL),
	(191, 200, 'directus_fields', '71', '{"interface":"input-rich-text-html","special":null,"required":true,"collection":"article","field":"content"}', '{"interface":"input-rich-text-html","special":null,"required":true,"collection":"article","field":"content"}', NULL),
	(124, 127, 'directus_fields', '20', '{"id":20,"collection":"header","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"id","sort":1,"group":null}', NULL),
	(125, 128, 'directus_fields', '21', '{"id":21,"collection":"header","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"status","sort":2,"group":null}', NULL),
	(126, 129, 'directus_fields', '29', '{"id":29,"collection":"header","field":"header_level","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"header_level","sort":3,"group":null}', NULL),
	(127, 130, 'directus_fields', '22', '{"id":22,"collection":"header","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"sort","sort":4,"group":null}', NULL),
	(128, 131, 'directus_fields', '23', '{"id":23,"collection":"header","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"user_created","sort":5,"group":null}', NULL),
	(129, 132, 'directus_fields', '24', '{"id":24,"collection":"header","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"date_created","sort":6,"group":null}', NULL),
	(130, 133, 'directus_fields', '25', '{"id":25,"collection":"header","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"user_updated","sort":7,"group":null}', NULL),
	(131, 134, 'directus_fields', '26', '{"id":26,"collection":"header","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"header","field":"date_updated","sort":8,"group":null}', NULL),
	(132, 135, 'directus_fields', '27', '{"id":27,"collection":"header","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":{},"readonly":false,"hidden":false,"sort":9,"width":"fill","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":{"_and":[{"content":{"_lte":"50"}}]},"validation_message":null}', '{"collection":"header","field":"content","sort":9,"group":null}', NULL),
	(133, 136, 'directus_fields', '27', '{"id":27,"collection":"header","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":{},"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":{"_and":[{"content":{"_lte":"50"}}]},"validation_message":null}', '{"collection":"header","field":"content","width":"full"}', NULL),
	(134, 137, 'directus_fields', '30', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}', NULL),
	(135, 138, 'directus_fields', '31', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"test"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"test"}', NULL),
	(136, 139, 'directus_fields', '32', '{"interface":"input","hidden":true,"field":"sort","collection":"test"}', '{"interface":"input","hidden":true,"field":"sort","collection":"test"}', NULL),
	(137, 140, 'directus_fields', '33', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test"}', NULL),
	(138, 141, 'directus_fields', '34', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test"}', NULL),
	(139, 142, 'directus_fields', '35', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test"}', NULL),
	(140, 143, 'directus_fields', '36', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test"}', NULL),
	(141, 144, 'directus_collections', 'test', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test"}', NULL),
	(142, 145, 'directus_fields', '37', '{"interface":"file","special":"file","required":true,"collection":"test","field":"files"}', '{"interface":"file","special":"file","required":true,"collection":"test","field":"files"}', NULL),
	(143, 146, 'directus_fields', '38', '{"interface":"file-image","special":"file","required":true,"collection":"test","field":"image"}', '{"interface":"file-image","special":"file","required":true,"collection":"test","field":"image"}', NULL),
	(144, 147, 'directus_fields', '39', '{"hidden":true,"field":"id","collection":"test_files"}', '{"hidden":true,"field":"id","collection":"test_files"}', NULL),
	(145, 148, 'directus_collections', 'test_files', '{"hidden":true,"icon":"import_export","collection":"test_files"}', '{"hidden":true,"icon":"import_export","collection":"test_files"}', NULL),
	(146, 149, 'directus_fields', '40', '{"hidden":true,"collection":"test_files","field":"test_id"}', '{"hidden":true,"collection":"test_files","field":"test_id"}', NULL),
	(147, 150, 'directus_fields', '41', '{"hidden":true,"collection":"test_files","field":"directus_files_id"}', '{"hidden":true,"collection":"test_files","field":"directus_files_id"}', NULL),
	(148, 151, 'directus_fields', '42', '{"interface":"files","special":"files","required":true,"collection":"test","field":"zsdtghujhtdgsef"}', '{"interface":"files","special":"files","required":true,"collection":"test","field":"zsdtghujhtdgsef"}', NULL),
	(149, 152, 'directus_fields', '43', '{"hidden":true,"field":"id","collection":"test_files_1"}', '{"hidden":true,"field":"id","collection":"test_files_1"}', NULL),
	(150, 153, 'directus_collections', 'test_files_1', '{"hidden":true,"icon":"import_export","collection":"test_files_1"}', '{"hidden":true,"icon":"import_export","collection":"test_files_1"}', NULL),
	(151, 154, 'directus_fields', '44', '{"hidden":true,"collection":"test_files_1","field":"test_id"}', '{"hidden":true,"collection":"test_files_1","field":"test_id"}', NULL),
	(152, 155, 'directus_fields', '45', '{"hidden":true,"collection":"test_files_1","field":"directus_files_id"}', '{"hidden":true,"collection":"test_files_1","field":"directus_files_id"}', NULL),
	(153, 159, 'directus_fields', '46', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"image"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"image"}', NULL),
	(169, 175, 'directus_fields', '58', '{"interface":"input","hidden":true,"field":"sort","collection":"article"}', '{"interface":"input","hidden":true,"field":"sort","collection":"article"}', NULL),
	(170, 176, 'directus_fields', '59', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"article"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"article"}', NULL),
	(340, 352, 'directus_fields', '88', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"drive_file_rename_outline"},"collection":"link","field":"name"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"drive_file_rename_outline"},"collection":"link","field":"name"}', NULL),
	(154, 160, 'directus_fields', '47', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"image"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"image"}', NULL),
	(155, 161, 'directus_fields', '48', '{"interface":"input","hidden":true,"field":"sort","collection":"image"}', '{"interface":"input","hidden":true,"field":"sort","collection":"image"}', NULL),
	(156, 162, 'directus_fields', '49', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"image"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"image"}', NULL),
	(157, 163, 'directus_fields', '50', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"image"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"image"}', NULL),
	(158, 164, 'directus_fields', '51', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"image"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"image"}', NULL),
	(159, 165, 'directus_fields', '52', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"image"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"image"}', NULL),
	(160, 166, 'directus_collections', 'image', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"image"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"image"}', NULL),
	(161, 167, 'directus_fields', '53', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"title","placeholder":"Enter a title"},"collection":"image","field":"title"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"title","placeholder":"Enter a title"},"collection":"image","field":"title"}', NULL),
	(162, 168, 'directus_fields', '54', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"list_alt","placeholder":"Enter an alternative  text"},"collection":"image","field":"alt"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"list_alt","placeholder":"Enter an alternative  text"},"collection":"image","field":"alt"}', NULL),
	(163, 169, 'directus_fields', '53', '{"id":53,"collection":"image","field":"title","special":null,"interface":"input","options":{"iconRight":"title","placeholder":"Enter a title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"image","field":"title","width":"half"}', NULL),
	(164, 170, 'directus_fields', '54', '{"id":54,"collection":"image","field":"alt","special":null,"interface":"input","options":{"iconRight":"list_alt","placeholder":"Enter an alternative  text"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"image","field":"alt","width":"half"}', NULL),
	(165, 171, 'directus_fields', '55', '{"interface":"file-image","special":"file","required":true,"options":{},"collection":"image","field":"file"}', '{"interface":"file-image","special":"file","required":true,"options":{},"collection":"image","field":"file"}', NULL),
	(166, 172, 'directus_fields', '55', '{"id":55,"collection":"image","field":"file","special":["file"],"interface":"file-image","options":{},"display":"image","display_options":{"circle":true},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"image","field":"file","special":["file"],"interface":"file-image","options":{},"display":"image","display_options":{"circle":true},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', NULL),
	(167, 173, 'directus_fields', '56', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"article"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"article"}', NULL),
	(168, 174, 'directus_fields', '57', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"article"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"article"}', NULL),
	(171, 177, 'directus_fields', '60', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"article"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"article"}', NULL),
	(172, 178, 'directus_fields', '61', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"article"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"article"}', NULL),
	(173, 179, 'directus_fields', '62', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"article"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"article"}', NULL),
	(174, 180, 'directus_collections', 'article', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"article"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"article"}', NULL),
	(175, 181, 'directus_fields', '63', '{"interface":"list","special":"cast-json","required":false,"options":{"addLabel":"Add an image"},"collection":"article","field":"content_images"}', '{"interface":"list","special":"cast-json","required":false,"options":{"addLabel":"Add an image"},"collection":"article","field":"content_images"}', NULL),
	(176, 182, 'directus_fields', '63', '{"id":63,"collection":"article","field":"content_images","special":["cast-json"],"interface":"list","options":{"addLabel":"Add an image","fields":[{"field":"test","name":"test","type":"text","meta":{"field":"test","width":"half","type":"text","interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","special":["cast-json"],"interface":"list","options":{"addLabel":"Add an image","fields":[{"field":"test","name":"test","type":"text","meta":{"field":"test","width":"half","type":"text","interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL),
	(177, 183, 'directus_fields', '64', '{"special":"alias,no-data,group","required":false,"interface":"group-detail","collection":"article","field":"test"}', '{"special":"alias,no-data,group","required":false,"interface":"group-detail","collection":"article","field":"test"}', NULL),
	(178, 184, 'directus_fields', '65', '{"interface":"list-m2m","special":"m2m","required":false,"options":{"filter":{"_and":[{"title":{"_contains":null}}]}},"collection":"article","field":"content_images"}', '{"interface":"list-m2m","special":"m2m","required":false,"options":{"filter":{"_and":[{"title":{"_contains":null}}]}},"collection":"article","field":"content_images"}', NULL),
	(179, 185, 'directus_fields', '66', '{"hidden":true,"field":"id","collection":"article_image"}', '{"hidden":true,"field":"id","collection":"article_image"}', NULL),
	(180, 186, 'directus_collections', 'article_image', '{"hidden":true,"icon":"import_export","collection":"article_image"}', '{"hidden":true,"icon":"import_export","collection":"article_image"}', NULL),
	(181, 187, 'directus_fields', '67', '{"hidden":true,"collection":"article_image","field":"article_id"}', '{"hidden":true,"collection":"article_image","field":"article_id"}', NULL),
	(182, 188, 'directus_fields', '68', '{"hidden":true,"collection":"article_image","field":"image_id"}', '{"hidden":true,"collection":"article_image","field":"image_id"}', NULL),
	(183, 189, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL),
	(184, 190, 'directus_files', '8b6d83d4-3c4c-4e12-bcf0-266fa49e6826', '{"title":"Content","filename_download":"content.png","type":"image/png","storage":"local"}', '{"title":"Content","filename_download":"content.png","type":"image/png","storage":"local"}', NULL),
	(185, 191, 'image', '1', '{"status":"published","title":"test","alt":"test2","file":"8b6d83d4-3c4c-4e12-bcf0-266fa49e6826"}', '{"status":"published","title":"test","alt":"test2","file":"8b6d83d4-3c4c-4e12-bcf0-266fa49e6826"}', 186),
	(187, 193, 'article', '1', '{"content_images":{"create":[{"image_id":{"status":"published","title":"test","alt":"test2","file":"8b6d83d4-3c4c-4e12-bcf0-266fa49e6826"}}],"update":[],"delete":[]},"status":"published"}', '{"content_images":{"create":[{"image_id":{"status":"published","title":"test","alt":"test2","file":"8b6d83d4-3c4c-4e12-bcf0-266fa49e6826"}}],"update":[],"delete":[]},"status":"published"}', NULL),
	(186, 192, 'article_image', '1', '{"image_id":{"status":"published","title":"test","alt":"test2","file":"8b6d83d4-3c4c-4e12-bcf0-266fa49e6826"},"article_id":1}', '{"image_id":{"status":"published","title":"test","alt":"test2","file":"8b6d83d4-3c4c-4e12-bcf0-266fa49e6826"},"article_id":1}', 187),
	(188, 194, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL),
	(189, 198, 'directus_fields', '69', '{"interface":"input","special":null,"required":true,"options":{"placeholder":"Chose a title","iconRight":"title"},"collection":"article","field":"title"}', '{"interface":"input","special":null,"required":true,"options":{"placeholder":"Chose a title","iconRight":"title"},"collection":"article","field":"title"}', NULL),
	(190, 199, 'directus_fields', '70', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"collection":"article","field":"introtext"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"collection":"article","field":"introtext"}', NULL),
	(193, 202, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","width":"half"}', NULL),
	(192, 201, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","width":"half"}', NULL),
	(194, 203, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(195, 204, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":2,"group":null}', NULL),
	(196, 205, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":3,"group":null}', NULL),
	(197, 206, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":4,"group":null}', NULL),
	(198, 207, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":5,"group":null}', NULL),
	(199, 208, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":6,"group":null}', NULL),
	(200, 209, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":7,"group":null}', NULL),
	(201, 210, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":8,"group":null}', NULL),
	(202, 211, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":9,"group":null}', NULL),
	(203, 212, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":10,"group":null}', NULL),
	(204, 213, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":11,"group":null}', NULL),
	(205, 214, 'directus_fields', '72', '{"interface":"tags","special":"cast-json","required":true,"options":{"capitalization":"auto-format","iconRight":"tag"},"collection":"article","field":"tags"}', '{"interface":"tags","special":"cast-json","required":true,"options":{"capitalization":"auto-format","iconRight":"tag"},"collection":"article","field":"tags"}', NULL),
	(206, 215, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(207, 216, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":2,"group":null}', NULL),
	(208, 217, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":3,"group":null}', NULL),
	(209, 218, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":4,"group":null}', NULL),
	(210, 219, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":5,"group":null}', NULL),
	(211, 220, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":6,"group":null}', NULL),
	(212, 221, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":7,"group":null}', NULL),
	(213, 222, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":8,"group":null}', NULL),
	(214, 223, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":9,"group":null}', NULL),
	(215, 224, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":10,"group":null}', NULL),
	(216, 225, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":11,"group":null}', NULL),
	(217, 226, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":12,"group":null}', NULL),
	(218, 227, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(219, 228, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":2,"group":null}', NULL),
	(220, 229, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":3,"group":null}', NULL),
	(221, 230, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":4,"group":null}', NULL),
	(222, 231, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":5,"group":null}', NULL),
	(223, 232, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":6,"group":null}', NULL),
	(224, 233, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":7,"group":null}', NULL),
	(225, 234, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":8,"group":null}', NULL),
	(226, 235, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":9,"group":null}', NULL),
	(227, 236, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":10,"group":null}', NULL),
	(228, 237, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":11,"group":null}', NULL),
	(229, 238, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":12,"group":null}', NULL),
	(230, 239, 'directus_fields', '73', '{"special":"m2o","required":false,"interface":"select-dropdown-m2o","display":null,"options":{"template":"{{file.$thumbnail}}"},"collection":"article","field":"leading_image"}', '{"special":"m2o","required":false,"interface":"select-dropdown-m2o","display":null,"options":{"template":"{{file.$thumbnail}}"},"collection":"article","field":"leading_image"}', NULL),
	(231, 240, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":12,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","width":"half"}', NULL),
	(232, 241, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","width":"half"}', NULL),
	(233, 242, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(234, 243, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":2,"group":null}', NULL),
	(235, 244, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":3,"group":null}', NULL),
	(236, 245, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":4,"group":null}', NULL),
	(237, 246, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":5,"group":null}', NULL),
	(238, 247, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":6,"group":null}', NULL),
	(239, 248, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":7,"group":null}', NULL),
	(240, 249, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":8,"group":null}', NULL),
	(241, 250, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":9,"group":null}', NULL),
	(242, 251, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":10,"group":null}', NULL),
	(243, 252, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":11,"group":null}', NULL),
	(244, 253, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","sort":12,"group":null}', NULL),
	(245, 254, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":13,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":13,"group":null}', NULL),
	(246, 255, 'directus_files', 'd24490ce-4109-45c6-a9d0-38b8fb40e179', '{"title":"C15","filename_download":"c15.jpg","type":"image/jpeg","storage":"local"}', '{"title":"C15","filename_download":"c15.jpg","type":"image/jpeg","storage":"local"}', NULL),
	(248, 257, 'article', '2', '{"leading_image":{"file":{"id":"d24490ce-4109-45c6-a9d0-38b8fb40e179"},"status":"published","title":"test","alt":"test2"},"status":"published","title":"rtest","introtext":"etazsedrftgggggggggggggggggg","content":"<p>etazsedrftgggggggg<strong>ggggggggg</strong>getazsedrftggggggggggggggggggetazsedrftggggggggggggggggggetazsedrftggggggggggggggggggetazsedrftgggggggg<em>ggggggggggetazsedr</em>ftggggggggggggggggggetazsedrftgggggg<span style=\"text-decoration: underline;\">gggggggg</span>gggg</p>","tags":["Azerty"]}', '{"leading_image":{"file":{"id":"d24490ce-4109-45c6-a9d0-38b8fb40e179"},"status":"published","title":"test","alt":"test2"},"status":"published","title":"rtest","introtext":"etazsedrftgggggggggggggggggg","content":"<p>etazsedrftgggggggg<strong>ggggggggg</strong>getazsedrftggggggggggggggggggetazsedrftggggggggggggggggggetazsedrftggggggggggggggggggetazsedrftgggggggg<em>ggggggggggetazsedr</em>ftggggggggggggggggggetazsedrftgggggg<span style=\"text-decoration: underline;\">gggggggg</span>gggg</p>","tags":["Azerty"]}', NULL),
	(247, 256, 'image', '2', '{"file":{"id":"d24490ce-4109-45c6-a9d0-38b8fb40e179"},"status":"published","title":"test","alt":"test2"}', '{"file":{"id":"d24490ce-4109-45c6-a9d0-38b8fb40e179"},"status":"published","title":"test","alt":"test2"}', 248),
	(249, 258, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":12,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":12,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL);
INSERT INTO public.directus_revisions VALUES
	(250, 261, 'directus_fields', '74', '{"special":"alias,no-data","required":true,"interface":"presentation-notice","options":{"color":"info","icon":"account_box","text":"testsdtrdgdrg"},"conditions":null,"collection":"article","field":"test"}', '{"special":"alias,no-data","required":true,"interface":"presentation-notice","options":{"color":"info","icon":"account_box","text":"testsdtrdgdrg"},"conditions":null,"collection":"article","field":"test"}', NULL),
	(251, 262, 'directus_fields', '75', '{"special":"alias,no-data","interface":"presentation-divider","options":{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true},"collection":"article","field":"images_management"}', '{"special":"alias,no-data","interface":"presentation-divider","options":{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true},"collection":"article","field":"images_management"}', NULL),
	(252, 263, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(253, 264, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":2,"group":null}', NULL),
	(254, 265, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":3,"group":null}', NULL),
	(255, 266, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":4,"group":null}', NULL),
	(256, 267, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":5,"group":null}', NULL),
	(257, 268, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":6,"group":null}', NULL),
	(258, 269, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":7,"group":null}', NULL),
	(259, 270, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":8,"group":null}', NULL),
	(260, 271, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":9,"group":null}', NULL),
	(261, 272, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":10,"group":null}', NULL),
	(262, 273, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":11,"group":null}', NULL),
	(263, 274, 'directus_fields', '75', '{"id":75,"collection":"article","field":"images_management","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"images_management","sort":12,"group":null}', NULL),
	(264, 275, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":13,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","sort":13,"group":null}', NULL),
	(265, 276, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":14,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":14,"group":null}', NULL),
	(266, 277, 'directus_fields', '76', '{"special":"alias,no-data","required":false,"interface":"presentation-divider","options":{"title":"General informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"collection":"article","field":"general_informations"}', '{"special":"alias,no-data","required":false,"interface":"presentation-divider","options":{"title":"General informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"collection":"article","field":"general_informations"}', NULL),
	(267, 278, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(268, 279, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":2,"group":null}', NULL),
	(269, 280, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":3,"group":null}', NULL),
	(270, 281, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":4,"group":null}', NULL),
	(271, 282, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":5,"group":null}', NULL),
	(272, 283, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":6,"group":null}', NULL),
	(273, 284, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":7,"group":null}', NULL),
	(274, 285, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":8,"group":null}', NULL),
	(275, 286, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":9,"group":null}', NULL),
	(276, 287, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":10,"group":null}', NULL),
	(277, 288, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":11,"group":null}', NULL),
	(278, 289, 'directus_fields', '75', '{"id":75,"collection":"article","field":"images_management","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"images_management","sort":12,"group":null}', NULL),
	(279, 290, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":13,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","sort":13,"group":null}', NULL),
	(280, 291, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":14,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":14,"group":null}', NULL),
	(281, 292, 'directus_fields', '76', '{"id":76,"collection":"article","field":"general_informations","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"General informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"general_informations","sort":15,"group":null}', NULL),
	(282, 293, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(283, 294, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":2,"group":null}', NULL),
	(284, 295, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":3,"group":null}', NULL),
	(285, 296, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":4,"group":null}', NULL),
	(286, 297, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":5,"group":null}', NULL),
	(287, 298, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":6,"group":null}', NULL),
	(288, 299, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":7,"group":null}', NULL),
	(289, 300, 'directus_fields', '76', '{"id":76,"collection":"article","field":"general_informations","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"General informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"general_informations","sort":8,"group":null}', NULL),
	(290, 301, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":9,"group":null}', NULL),
	(291, 302, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":10,"group":null}', NULL),
	(292, 303, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":11,"group":null}', NULL),
	(293, 304, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":12,"group":null}', NULL),
	(294, 305, 'directus_fields', '75', '{"id":75,"collection":"article","field":"images_management","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"images_management","sort":13,"group":null}', NULL),
	(295, 306, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":14,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","sort":14,"group":null}', NULL),
	(296, 307, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":15,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":15,"group":null}', NULL),
	(297, 308, 'directus_fields', '77', '{"interface":"presentation-links","special":"alias,no-data","options":{"links":[{"label":"test","icon":"account_balance","type":"info","url":"https://google.fr"}]},"collection":"article","field":"links-sic_nm"}', '{"interface":"presentation-links","special":"alias,no-data","options":{"links":[{"label":"test","icon":"account_balance","type":"info","url":"https://google.fr"}]},"collection":"article","field":"links-sic_nm"}', NULL),
	(298, 309, 'directus_fields', '78', '{"interface":"presentation-links","special":"alias,no-data","required":false,"options":{"links":[{"label":"Preview article","icon":"preview","type":"primary","url":"https://frontendurl.com"}]},"collection":"article","field":"preview_button"}', '{"interface":"presentation-links","special":"alias,no-data","required":false,"options":{"links":[{"label":"Preview article","icon":"preview","type":"primary","url":"https://frontendurl.com"}]},"collection":"article","field":"preview_button"}', NULL),
	(299, 310, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","width":"half"}', NULL),
	(300, 311, 'directus_fields', '78', '{"id":78,"collection":"article","field":"preview_button","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"Preview article","icon":"preview","type":"primary","url":"https://frontendurl.com"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"preview_button","width":"half"}', NULL),
	(301, 312, 'directus_fields', '56', '{"id":56,"collection":"article","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"id","sort":1,"group":null}', NULL),
	(302, 313, 'directus_fields', '58', '{"id":58,"collection":"article","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"sort","sort":2,"group":null}', NULL),
	(303, 314, 'directus_fields', '59', '{"id":59,"collection":"article","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_created","sort":3,"group":null}', NULL),
	(304, 315, 'directus_fields', '60', '{"id":60,"collection":"article","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_created","sort":4,"group":null}', NULL),
	(305, 316, 'directus_fields', '61', '{"id":61,"collection":"article","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"user_updated","sort":5,"group":null}', NULL),
	(306, 317, 'directus_fields', '62', '{"id":62,"collection":"article","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"date_updated","sort":6,"group":null}', NULL),
	(307, 318, 'directus_fields', '57', '{"id":57,"collection":"article","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"status","sort":7,"group":null}', NULL),
	(308, 319, 'directus_fields', '78', '{"id":78,"collection":"article","field":"preview_button","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"Preview article","icon":"preview","type":"primary","url":"https://frontendurl.com"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"preview_button","sort":8,"group":null}', NULL),
	(309, 320, 'directus_fields', '76', '{"id":76,"collection":"article","field":"general_informations","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"General informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"general_informations","sort":9,"group":null}', NULL),
	(310, 321, 'directus_fields', '69', '{"id":69,"collection":"article","field":"title","special":null,"interface":"input","options":{"placeholder":"Chose a title","iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"title","sort":10,"group":null}', NULL),
	(311, 322, 'directus_fields', '70', '{"id":70,"collection":"article","field":"introtext","special":null,"interface":"input","options":{"iconRight":"short_text","placeholder":"Enter a introduction"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"introtext","sort":11,"group":null}', NULL),
	(312, 323, 'directus_fields', '72', '{"id":72,"collection":"article","field":"tags","special":["cast-json"],"interface":"tags","options":{"capitalization":"auto-format","iconRight":"tag"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"tags","sort":12,"group":null}', NULL),
	(313, 324, 'directus_fields', '71', '{"id":71,"collection":"article","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content","sort":13,"group":null}', NULL),
	(314, 325, 'directus_fields', '75', '{"id":75,"collection":"article","field":"images_management","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"Images management","color":"#A2B5CD","icon":"image","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"images_management","sort":14,"group":null}', NULL),
	(315, 326, 'directus_fields', '73', '{"id":73,"collection":"article","field":"leading_image","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":15,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"leading_image","sort":15,"group":null}', NULL),
	(316, 327, 'directus_fields', '65', '{"id":65,"collection":"article","field":"content_images","special":["m2m"],"interface":"list-m2m","options":{"filter":null,"template":"{{image_id.file.$thumbnail}}"},"display":"related-values","display_options":{"template":"{{image_id.file.$thumbnail}}"},"readonly":false,"hidden":false,"sort":16,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"content_images","sort":16,"group":null}', NULL),
	(317, 328, 'directus_fields', '78', '{"id":78,"collection":"article","field":"preview_button","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"Preview article","icon":"remove_red_eye","type":"primary","url":"https://frontendurl.com"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"preview_button","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"Preview article","icon":"remove_red_eye","type":"primary","url":"https://frontendurl.com"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL),
	(318, 330, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires"}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires"}}]}', NULL),
	(319, 331, 'directus_fields', '79', '{"special":"alias,no-data","required":false,"interface":"presentation-divider","options":{"title":"$t:additional_informations","color":"#A2B5CD","icon":"playlist_add","inlineTitle":true},"collection":"article","field":"additional_informations"}', '{"special":"alias,no-data","required":false,"interface":"presentation-divider","options":{"title":"$t:additional_informations","color":"#A2B5CD","icon":"playlist_add","inlineTitle":true},"collection":"article","field":"additional_informations"}', NULL),
	(320, 332, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\""}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\""}}]}', NULL),
	(321, 333, 'directus_fields', '80', '{"interface":"input","special":null,"required":false,"options":{"placeholder":"$t:enter_a_readmore_text","iconRight":"link"},"collection":"article","field":"readmore_text"}', '{"interface":"input","special":null,"required":false,"options":{"placeholder":"$t:enter_a_readmore_text","iconRight":"link"},"collection":"article","field":"readmore_text"}', NULL),
	(338, 350, 'directus_fields', '87', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"link"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"link"}', NULL),
	(322, 334, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\""}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\""}}]}', NULL),
	(323, 335, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\""}},{"key":"enter_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\""}},{"key":"enter_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}]}', NULL),
	(324, 336, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}]}', NULL),
	(325, 337, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}]}', NULL),
	(326, 338, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}],"default_language":"en-US"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}]}', NULL),
	(327, 339, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}}],"default_language":"fr-FR"}', '{"default_language":"fr-FR"}', NULL),
	(339, 351, 'directus_collections', 'link', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"link"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"link"}', NULL),
	(341, 353, 'directus_fields', '89', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"title"},"collection":"link","field":"title"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"title"},"collection":"link","field":"title"}', NULL),
	(342, 354, 'directus_fields', '90', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"minimize","trim":true,"slug":true},"collection":"link","field":"slug"}', '{"interface":"input","special":null,"required":true,"options":{"iconRight":"minimize","trim":true,"slug":true},"collection":"link","field":"slug"}', NULL),
	(328, 340, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"preview_article","translations":{"en-US":"Preview article","fr-FR":"Prévisualiser l''article"}}],"default_language":"fr-FR"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"preview_article","translations":{"en-US":"Preview article","fr-FR":"Prévisualiser l''article"}}]}', NULL),
	(329, 341, 'directus_fields', '78', '{"id":78,"collection":"article","field":"preview_button","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"$t:preview_article","icon":"remove_red_eye","type":"primary","url":"https://frontendurl.com"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"preview_button","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"$t:preview_article","icon":"remove_red_eye","type":"primary","url":"https://frontendurl.com"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL),
	(330, 342, 'directus_settings', '1', '{"id":1,"project_name":"CMS","project_url":null,"project_color":"#285680","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"presets","storage_asset_presets":[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}],"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":"CMS with directus and PostgreSQL","translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"preview_article","translations":{"en-US":"Preview article","fr-FR":"Prévisualiser l''article"}},{"key":"general_informations","translations":{"en-US":"General informations","fr-FR":"Informations générales"}}],"default_language":"fr-FR"}', '{"translation_strings":[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"preview_article","translations":{"en-US":"Preview article","fr-FR":"Prévisualiser l''article"}},{"key":"general_informations","translations":{"en-US":"General informations","fr-FR":"Informations générales"}}]}', NULL),
	(331, 343, 'directus_fields', '76', '{"id":76,"collection":"article","field":"general_informations","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"$t:general_informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"article","field":"general_informations","special":["alias","no-data"],"interface":"presentation-divider","options":{"title":"$t:general_informations","color":"#A2B5CD","icon":"article","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', NULL),
	(332, 344, 'directus_fields', '81', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"link"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"link"}', NULL),
	(333, 345, 'directus_fields', '82', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"link"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"link"}', NULL),
	(334, 346, 'directus_fields', '83', '{"interface":"input","hidden":true,"field":"sort","collection":"link"}', '{"interface":"input","hidden":true,"field":"sort","collection":"link"}', NULL),
	(335, 347, 'directus_fields', '84', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"link"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"link"}', NULL),
	(336, 348, 'directus_fields', '85', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"link"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"link"}', NULL),
	(337, 349, 'directus_fields', '86', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"link"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"link"}', NULL),
	(343, 355, 'directus_fields', '89', '{"id":89,"collection":"link","field":"title","special":null,"interface":"input","options":{"iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"title","width":"half"}', NULL),
	(345, 357, 'directus_fields', '90', '{"id":90,"collection":"link","field":"slug","special":null,"interface":"input","options":{"iconRight":"minimize","trim":true,"slug":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"slug","width":"half"}', NULL),
	(344, 356, 'directus_fields', '88', '{"id":88,"collection":"link","field":"name","special":null,"interface":"input","options":{"iconRight":"drive_file_rename_outline"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"name","width":"half"}', NULL),
	(346, 358, 'directus_fields', '82', '{"id":82,"collection":"link","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"status","width":"half"}', NULL),
	(347, 359, 'directus_fields', '81', '{"id":81,"collection":"link","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"id","sort":1,"group":null}', NULL),
	(348, 360, 'directus_fields', '83', '{"id":83,"collection":"link","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"sort","sort":2,"group":null}', NULL),
	(349, 361, 'directus_fields', '84', '{"id":84,"collection":"link","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"user_created","sort":3,"group":null}', NULL),
	(350, 362, 'directus_fields', '85', '{"id":85,"collection":"link","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"date_created","sort":4,"group":null}', NULL),
	(351, 363, 'directus_fields', '86', '{"id":86,"collection":"link","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"user_updated","sort":5,"group":null}', NULL),
	(352, 364, 'directus_fields', '87', '{"id":87,"collection":"link","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"date_updated","sort":6,"group":null}', NULL),
	(353, 365, 'directus_fields', '82', '{"id":82,"collection":"link","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"status","sort":7,"group":null}', NULL),
	(354, 366, 'directus_fields', '88', '{"id":88,"collection":"link","field":"name","special":null,"interface":"input","options":{"iconRight":"drive_file_rename_outline"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"name","sort":8,"group":null}', NULL),
	(355, 367, 'directus_fields', '89', '{"id":89,"collection":"link","field":"title","special":null,"interface":"input","options":{"iconRight":"title"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"title","sort":9,"group":null}', NULL),
	(356, 368, 'directus_fields', '90', '{"id":90,"collection":"link","field":"slug","special":null,"interface":"input","options":{"iconRight":"minimize","trim":true,"slug":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"link","field":"slug","sort":10,"group":null}', NULL);


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_roles VALUES
	('2ac821b8-b88d-472c-b90d-d62c349f3a51', 'Administrator', 'verified', '$t:admin_description', NULL, false, true, true),
	('815980ab-66c8-4b97-8019-57c65e1f70a4', 'Manager', 'lock_open', NULL, NULL, false, false, true),
	('380a30db-dca1-40f7-a811-47415624b797', 'Client', 'person', NULL, NULL, false, false, true);


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_sessions VALUES
	('Xz7Va36IB_588ODAvpYZ6JoXTXudeRy-9BcsTxGMu3gzho3Ufn6dcIruDf_UU7qw', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-18 22:46:32.682+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', NULL),
	('wRHZKsvL4xXKkTZF6iI5POaIgoD1Q8wLGQ0fnECqNKf5op2jVyqH4WdAvmDI5nft', '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-19 16:42:44.582+02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', NULL);


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_settings VALUES
	(1, 'CMS', NULL, '#285680', NULL, NULL, NULL, NULL, 25, NULL, 'presets', '[{"key":"150","fit":"contain","width":150,"height":150,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"300","fit":"contain","width":300,"height":300,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"500","fit":"contain","width":500,"height":500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"750","fit":"contain","width":750,"height":750,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1000","fit":"contain","width":1000,"height":1000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1250","fit":"contain","width":1250,"height":1250,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"1500","fit":"contain","width":1500,"height":1500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2000","fit":"contain","width":2000,"height":2000,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]},{"key":"2500","fit":"contain","width":2500,"height":2500,"quality":80,"withoutEnlargement":false,"format":"webp","transforms":[]}]', NULL, NULL, NULL, NULL, '[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":false},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}]', 'CMS with directus and PostgreSQL', '[{"key":"additional_informations","translations":{"fr-FR":"Informations complémentaires","en-US":"Additional informations"}},{"key":"enter_a_readmore_text","translations":{"fr-FR":"Entrer le texte du lien \"lire plus\"","en-US":"Enter a readmore text"}},{"key":"preview_article","translations":{"en-US":"Preview article","fr-FR":"Prévisualiser l''article"}},{"key":"general_informations","translations":{"en-US":"General informations","fr-FR":"Informations générales"}}]', 'fr-FR');


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_users VALUES
	('5e259711-9283-4bc8-a781-bf1ce39017f4', 'Admin', 'User', 'a@a.fr', '$argon2i$v=19$m=4096,t=3,p=1$rzfPwuCdbWqopbjHQ0qkqQ$cSTizbdbkpe2IL7lQwiu7oLVtYFdtYQPHcs7ca4oXX0', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '2ac821b8-b88d-472c-b90d-d62c349f3a51', NULL, '2022-05-12 16:42:44.583+02', '/settings/data-model', 'default', NULL, NULL, true);


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: header_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.header_level VALUES
	(1, 'published', NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:12.69+02', NULL, NULL, 'h1', 'h1'),
	(2, 'published', NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:22.889+02', NULL, NULL, 'h2', 'h2'),
	(3, 'published', NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:30.614+02', NULL, NULL, 'h3', 'h3'),
	(4, 'published', NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:36.311+02', NULL, NULL, 'h4', 'h4'),
	(5, 'published', NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:43.118+02', NULL, NULL, 'h5', 'h5'),
	(6, 'published', NULL, '5e259711-9283-4bc8-a781-bf1ce39017f4', '2022-05-12 15:38:49.019+02', NULL, NULL, 'h6', 'h6');


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: link; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: paragraph; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 2, true);


--
-- Name: article_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_image_id_seq', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 368, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 90, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 48, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 5, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 25, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 356, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.header_id_seq', 1, false);


--
-- Name: header_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.header_level_id_seq', 6, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 2, true);


--
-- Name: link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.link_id_seq', 1, false);


--
-- Name: paragraph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paragraph_id_seq', 1, false);


--
-- Name: article_image article_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_image
    ADD CONSTRAINT article_image_pkey PRIMARY KEY (id);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


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
-- Name: header_level header_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_level
    ADD CONSTRAINT header_level_pkey PRIMARY KEY (id);


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id);


--
-- Name: paragraph paragraph_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paragraph
    ADD CONSTRAINT paragraph_pkey PRIMARY KEY (id);


--
-- Name: article_image article_image_article_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_image
    ADD CONSTRAINT article_image_article_id_foreign FOREIGN KEY (article_id) REFERENCES public.article(id) ON DELETE SET NULL;


--
-- Name: article_image article_image_image_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_image
    ADD CONSTRAINT article_image_image_id_foreign FOREIGN KEY (image_id) REFERENCES public.image(id) ON DELETE SET NULL;


--
-- Name: article article_leading_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_leading_image_foreign FOREIGN KEY (leading_image) REFERENCES public.image(id) ON DELETE SET NULL;


--
-- Name: article article_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: article article_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


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
-- Name: header header_header_level_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_header_level_foreign FOREIGN KEY (header_level) REFERENCES public.header_level(id) ON DELETE SET NULL;


--
-- Name: header_level header_level_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_level
    ADD CONSTRAINT header_level_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: header_level header_level_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_level
    ADD CONSTRAINT header_level_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: header header_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: header header_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: image image_file_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_file_foreign FOREIGN KEY (file) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: image image_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: image image_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: link link_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: link link_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: paragraph paragraph_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paragraph
    ADD CONSTRAINT paragraph_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: paragraph paragraph_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paragraph
    ADD CONSTRAINT paragraph_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

