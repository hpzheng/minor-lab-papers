--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO matt_d;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO matt_d;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO matt_d;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO matt_d;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 10, true);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO matt_d;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO matt_d;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO matt_d;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO matt_d;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_permission_id_seq', 66, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO matt_d;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO matt_d;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO matt_d;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO matt_d;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO matt_d;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO matt_d;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 179, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO matt_d;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO matt_d;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 264, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO matt_d;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO matt_d;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('django_content_type_id_seq', 22, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO matt_d;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO matt_d;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO matt_d;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: papers_absence; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_absence (
    id integer NOT NULL,
    person_id integer NOT NULL,
    notification boolean NOT NULL,
    absence_type_id integer NOT NULL,
    begin_date date NOT NULL,
    end_date date,
    contact_type_id integer NOT NULL,
    response_frequency_id integer NOT NULL
);


ALTER TABLE public.papers_absence OWNER TO matt_d;

--
-- Name: papers_absence_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_absence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_absence_id_seq OWNER TO matt_d;

--
-- Name: papers_absence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_absence_id_seq OWNED BY papers_absence.id;


--
-- Name: papers_absence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_absence_id_seq', 10, true);


--
-- Name: papers_absence_type; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_absence_type (
    id integer NOT NULL,
    absence_type character varying(50) NOT NULL
);


ALTER TABLE public.papers_absence_type OWNER TO matt_d;

--
-- Name: papers_absence_type_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_absence_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_absence_type_id_seq OWNER TO matt_d;

--
-- Name: papers_absence_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_absence_type_id_seq OWNED BY papers_absence_type.id;


--
-- Name: papers_absence_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_absence_type_id_seq', 8, true);


--
-- Name: papers_attachment; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_attachment (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    file character varying(100) NOT NULL,
    author_id integer NOT NULL,
    version integer,
    entry_date timestamp with time zone NOT NULL
);


ALTER TABLE public.papers_attachment OWNER TO matt_d;

--
-- Name: papers_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_attachment_id_seq OWNER TO matt_d;

--
-- Name: papers_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_attachment_id_seq OWNED BY papers_attachment.id;


--
-- Name: papers_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_attachment_id_seq', 3, true);


--
-- Name: papers_author; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_author (
    id integer NOT NULL,
    firstname character varying(15) NOT NULL,
    lastname character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(30),
    skype character varying(30)
);


ALTER TABLE public.papers_author OWNER TO matt_d;

--
-- Name: papers_author_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_author_id_seq OWNER TO matt_d;

--
-- Name: papers_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_author_id_seq OWNED BY papers_author.id;


--
-- Name: papers_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_author_id_seq', 43, true);


--
-- Name: papers_contact_type; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_contact_type (
    id integer NOT NULL,
    contact_type character varying(5) NOT NULL
);


ALTER TABLE public.papers_contact_type OWNER TO matt_d;

--
-- Name: papers_contact_type_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_contact_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_contact_type_id_seq OWNER TO matt_d;

--
-- Name: papers_contact_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_contact_type_id_seq OWNED BY papers_contact_type.id;


--
-- Name: papers_contact_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_contact_type_id_seq', 3, true);


--
-- Name: papers_frequency; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_frequency (
    id integer NOT NULL,
    description character varying(50) NOT NULL,
    days integer NOT NULL
);


ALTER TABLE public.papers_frequency OWNER TO matt_d;

--
-- Name: papers_frequency_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_frequency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_frequency_id_seq OWNER TO matt_d;

--
-- Name: papers_frequency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_frequency_id_seq OWNED BY papers_frequency.id;


--
-- Name: papers_frequency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_frequency_id_seq', 14, true);


--
-- Name: papers_journal; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_journal (
    id integer NOT NULL,
    journal_name character varying(200) NOT NULL,
    journal_abbr character varying(50) NOT NULL,
    url character varying(200) NOT NULL
);


ALTER TABLE public.papers_journal OWNER TO matt_d;

--
-- Name: papers_journal_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_journal_id_seq OWNER TO matt_d;

--
-- Name: papers_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_journal_id_seq OWNED BY papers_journal.id;


--
-- Name: papers_journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_journal_id_seq', 15, true);


--
-- Name: papers_notification; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_notification (
    id integer NOT NULL,
    person_id integer NOT NULL,
    notification boolean NOT NULL,
    begin_date date NOT NULL,
    report_frequency_id integer NOT NULL,
    pastdue_frequency_id integer NOT NULL
);


ALTER TABLE public.papers_notification OWNER TO matt_d;

--
-- Name: papers_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_notification_id_seq OWNER TO matt_d;

--
-- Name: papers_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_notification_id_seq OWNED BY papers_notification.id;


--
-- Name: papers_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_notification_id_seq', 28, true);


--
-- Name: papers_publication; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_publication (
    id integer NOT NULL,
    first_author_id integer NOT NULL,
    second_author_id integer,
    third_author_id integer,
    target_journal_id integer,
    topic character varying(200) NOT NULL,
    entry_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL,
    deadline date,
    active boolean NOT NULL
);


ALTER TABLE public.papers_publication OWNER TO matt_d;

--
-- Name: papers_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_publication_id_seq OWNER TO matt_d;

--
-- Name: papers_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_publication_id_seq OWNED BY papers_publication.id;


--
-- Name: papers_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_publication_id_seq', 43, true);


--
-- Name: papers_publication_referee_jcn; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_publication_referee_jcn (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    referee_id integer NOT NULL,
    entry_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public.papers_publication_referee_jcn OWNER TO matt_d;

--
-- Name: papers_publication_referee_jcn_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_publication_referee_jcn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_publication_referee_jcn_id_seq OWNER TO matt_d;

--
-- Name: papers_publication_referee_jcn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_publication_referee_jcn_id_seq OWNED BY papers_publication_referee_jcn.id;


--
-- Name: papers_publication_referee_jcn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_publication_referee_jcn_id_seq', 15, true);


--
-- Name: papers_publication_status_jcn; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_publication_status_jcn (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    status_id integer NOT NULL,
    person_responsible_id integer,
    description character varying(200),
    due_date date,
    entry_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public.papers_publication_status_jcn OWNER TO matt_d;

--
-- Name: papers_publication_status_jcn_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_publication_status_jcn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_publication_status_jcn_id_seq OWNER TO matt_d;

--
-- Name: papers_publication_status_jcn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_publication_status_jcn_id_seq OWNED BY papers_publication_status_jcn.id;


--
-- Name: papers_publication_status_jcn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_publication_status_jcn_id_seq', 47, true);


--
-- Name: papers_referee; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_referee (
    id integer NOT NULL,
    firstname character varying(15) NOT NULL,
    lastname character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    department character varying(100),
    organization character varying(100) NOT NULL
);


ALTER TABLE public.papers_referee OWNER TO matt_d;

--
-- Name: papers_referee_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_referee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_referee_id_seq OWNER TO matt_d;

--
-- Name: papers_referee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_referee_id_seq OWNED BY papers_referee.id;


--
-- Name: papers_referee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_referee_id_seq', 18, true);


--
-- Name: papers_status; Type: TABLE; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE TABLE papers_status (
    id integer NOT NULL,
    priority integer NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.papers_status OWNER TO matt_d;

--
-- Name: papers_status_id_seq; Type: SEQUENCE; Schema: public; Owner: matt_d
--

CREATE SEQUENCE papers_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_status_id_seq OWNER TO matt_d;

--
-- Name: papers_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt_d
--

ALTER SEQUENCE papers_status_id_seq OWNED BY papers_status.id;


--
-- Name: papers_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt_d
--

SELECT pg_catalog.setval('papers_status_id_seq', 11, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_absence ALTER COLUMN id SET DEFAULT nextval('papers_absence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_absence_type ALTER COLUMN id SET DEFAULT nextval('papers_absence_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_attachment ALTER COLUMN id SET DEFAULT nextval('papers_attachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_author ALTER COLUMN id SET DEFAULT nextval('papers_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_contact_type ALTER COLUMN id SET DEFAULT nextval('papers_contact_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_frequency ALTER COLUMN id SET DEFAULT nextval('papers_frequency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_journal ALTER COLUMN id SET DEFAULT nextval('papers_journal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_notification ALTER COLUMN id SET DEFAULT nextval('papers_notification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication ALTER COLUMN id SET DEFAULT nextval('papers_publication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_referee_jcn ALTER COLUMN id SET DEFAULT nextval('papers_publication_referee_jcn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_status_jcn ALTER COLUMN id SET DEFAULT nextval('papers_publication_status_jcn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_referee ALTER COLUMN id SET DEFAULT nextval('papers_referee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_status ALTER COLUMN id SET DEFAULT nextval('papers_status_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_group (id, name) FROM stdin;
1	minor
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	32
2	1	34
3	1	35
4	1	36
5	1	22
6	1	23
7	1	25
8	1	26
9	1	28
10	1	31
\.


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add author	8	add_author
23	Can change author	8	change_author
24	Can delete author	8	delete_author
25	Can add journal	9	add_journal
26	Can change journal	9	change_journal
27	Can delete journal	9	delete_journal
28	Can add status	10	add_status
29	Can change status	10	change_status
30	Can delete status	10	delete_status
31	Can add publication	11	add_publication
32	Can change publication	11	change_publication
33	Can delete publication	11	delete_publication
34	Can add publication_status_jcn	12	add_publication_status_jcn
35	Can change publication_status_jcn	12	change_publication_status_jcn
36	Can delete publication_status_jcn	12	delete_publication_status_jcn
37	Can add log entry	13	add_logentry
38	Can change log entry	13	change_logentry
39	Can delete log entry	13	delete_logentry
40	Can add attachment	14	add_attachment
41	Can change attachment	14	change_attachment
42	Can delete attachment	14	delete_attachment
43	Can add frequency	15	add_frequency
44	Can change frequency	15	change_frequency
45	Can delete frequency	15	delete_frequency
49	Can add notification	17	add_notification
50	Can change notification	17	change_notification
51	Can delete notification	17	delete_notification
52	Can add contact_type	18	add_contact_type
53	Can change contact_type	18	change_contact_type
54	Can delete contact_type	18	delete_contact_type
55	Can add absence_type	19	add_absence_type
56	Can change absence_type	19	change_absence_type
57	Can delete absence_type	19	delete_absence_type
58	Can add absence	20	add_absence
59	Can change absence	20	change_absence
60	Can delete absence	20	delete_absence
61	Can add referee	21	add_referee
62	Can change referee	21	change_referee
63	Can delete referee	21	delete_referee
64	Can add publication_referee_jcn	22	add_publication_referee_jcn
65	Can change publication_referee_jcn	22	change_publication_referee_jcn
66	Can delete publication_referee_jcn	22	delete_publication_referee_jcn
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
3	wladek	Wladek	Minor	wladek@iwonka.med.virginia.edu	sha1$411c6$73b6188e4cd75b53c46b4948b73f146ee623ddeb	t	t	t	2012-01-20 14:43:07.23413-05	2011-12-12 20:14:50-05
1	matt_d	Matt	Demas	matt_d@iwonka.med.virginia.edu	sha1$d1712$9891e9399b50dc736623df8cfc91c2e090953fd6	t	t	t	2012-01-23 16:20:31.675229-05	2011-12-12 14:47:03-05
4	user				sha1$a133c$0b3088966bfa84fe63822920e11f524631f7fa59	t	t	f	2012-02-17 16:47:12.630419-05	2011-12-14 10:42:36-05
2	heping	Heping	Zheng	dust@iwonka.med.virginia.edu	sha1$d6567$67d779dcebb463c68c9292488a2d26933b6c4e5e	t	t	t	2011-12-21 17:58:49.886706-05	2011-12-12 20:12:06-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	1
2	2	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
21	2	21
22	2	22
23	2	23
24	2	24
25	2	25
26	2	26
27	2	27
28	2	28
29	2	29
30	2	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	2	38
39	2	39
40	1	1
41	1	2
42	1	3
43	1	4
44	1	5
45	1	6
46	1	7
47	1	8
48	1	9
49	1	10
50	1	11
51	1	12
52	1	13
53	1	14
54	1	15
55	1	16
56	1	17
57	1	18
58	1	19
59	1	20
60	1	21
61	1	22
62	1	23
63	1	24
64	1	25
65	1	26
66	1	27
67	1	28
68	1	29
69	1	30
70	1	31
71	1	32
72	1	33
73	1	34
74	1	35
75	1	36
76	1	37
77	1	38
78	1	39
79	3	1
80	3	2
81	3	3
82	3	4
83	3	5
84	3	6
85	3	7
86	3	8
87	3	9
88	3	10
89	3	11
90	3	12
91	3	13
92	3	14
93	3	15
94	3	16
95	3	17
96	3	18
97	3	19
98	3	20
99	3	21
100	3	22
101	3	23
102	3	24
103	3	25
104	3	26
105	3	27
106	3	28
107	3	29
108	3	30
109	3	31
110	3	32
111	3	33
112	3	34
113	3	35
114	3	36
115	3	37
116	3	38
117	3	39
162	4	32
163	4	34
164	4	35
165	4	36
166	4	40
167	4	41
168	4	42
169	4	26
170	4	49
171	4	50
172	4	22
173	4	23
174	4	25
175	4	58
176	4	59
177	4	28
178	4	29
179	4	31
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2011-12-12 16:11:48.498612-05	1	8	1	Heping Zheng	1	
2	2011-12-12 16:49:17.017452-05	1	8	2	Ekaterina Filippova	1	
3	2011-12-12 16:50:13.687612-05	1	8	3	Karolina Tkaczuk	1	
4	2011-12-12 17:13:43.946389-05	1	9	1	Journal of Structural and Functional Genomics	1	
5	2011-12-12 17:18:07.140654-05	1	11	1	IDP90717 and IDP04624	1	
6	2011-12-12 17:48:00.719996-05	1	11	1	IDP90717 and IDP04624	1	
7	2011-12-12 17:49:49.883612-05	1	11	1	IDP90717 and IDP04624	2	Changed description for publication_status_jcn "publication_status_jcn object".
8	2011-12-12 17:56:19.091778-05	1	11	1	IDP90717 and IDP04624	1	
9	2011-12-12 17:56:41.292119-05	1	11	1	IDP90717 and IDP04624	2	Changed description for publication_status_jcn "publication_status_jcn object".
10	2011-12-12 20:11:06.02788-05	1	2	1	minor	1	
11	2011-12-12 20:12:06.808604-05	1	3	2	heping	1	
12	2011-12-12 20:13:04.831658-05	1	3	2	heping	2	Changed first_name, last_name, email, is_staff, is_superuser and user_permissions.
13	2011-12-12 20:13:29.555637-05	1	3	1	matt_d	2	Changed first_name, last_name and user_permissions.
14	2011-12-12 20:14:50.8432-05	1	3	3	wladek	1	
15	2011-12-12 20:15:30.452994-05	1	3	3	wladek	2	Changed first_name, last_name, email, is_staff, is_superuser and user_permissions.
16	2011-12-13 10:35:38.814944-05	1	8	4	Robert Solberg	1	
17	2011-12-13 13:49:08.410186-05	1	9	1	JSFG	1	
18	2011-12-13 13:49:31.434668-05	1	11	1	IDP90717 and IDP04624	1	
19	2011-12-13 14:16:14.269108-05	1	8	5	Matt Demas	1	
20	2011-12-13 14:19:17.720935-05	1	11	2	test paper	1	
21	2011-12-13 14:22:53.007886-05	1	11	2	test paper	2	Added attachment "attachment object".
22	2011-12-13 14:28:45.666638-05	1	11	2	test paper	2	Changed file and version for attachment "attachment object".
23	2011-12-13 14:29:09.785246-05	1	11	2	test paper	2	Deleted attachment "attachment object".
24	2011-12-13 14:29:29.964524-05	1	11	2	test paper	2	Added publication_status_jcn "publication_status_jcn object".
25	2011-12-13 14:29:37.225306-05	1	11	2	test paper	2	Deleted publication_status_jcn "publication_status_jcn object".
26	2011-12-13 14:29:44.33237-05	1	11	2	test paper	2	Added publication_status_jcn "publication_status_jcn object".
27	2011-12-13 15:41:11.659468-05	1	11	3	test paper 2	1	
28	2011-12-13 16:45:57.456543-05	1	9	2	Acta Cryst. F	1	
29	2011-12-13 16:46:26.971846-05	1	11	4	IDP00203	1	
30	2011-12-13 16:47:34.544726-05	1	9	3	Proteins	1	
31	2011-12-13 16:47:58.37537-05	1	11	5	RutD	1	
32	2011-12-13 16:48:17.712382-05	1	11	6	IDP02573	1	
33	2011-12-13 16:49:36.64168-05	1	11	7	IDP90828	1	
34	2011-12-13 16:50:24.980135-05	1	11	8	Anthrax proteins	1	
35	2011-12-13 16:51:00.265238-05	1	8	33	Rashin Rashin	1	
36	2011-12-13 16:51:13.755657-05	1	11	9	Rashin's Paper	1	
37	2011-12-13 16:51:56.866483-05	1	9	4	JSB	1	
38	2011-12-13 16:52:27.932738-05	1	11	10	APC7623	1	
39	2011-12-13 16:52:50.803509-05	1	8	34	Olga  	1	
40	2011-12-13 16:53:03.715026-05	1	11	11	Olga's Paper	1	
41	2011-12-13 16:54:08.906202-05	1	9	5	PLOS	1	
42	2011-12-13 16:54:21.850458-05	1	8	35	Dominik  	1	
43	2011-12-13 16:54:38.501453-05	1	11	12	modelling	1	
44	2011-12-13 16:55:21.250971-05	1	8	36	Pawel  	1	
45	2011-12-13 16:55:36.153993-05	1	11	13	Small Molecules (Hepes, ...)	1	
46	2011-12-13 16:57:26.848379-05	1	9	6	NAT METHODS	1	
47	2011-12-13 16:57:54.010479-05	1	11	14	CMM	1	
48	2011-12-13 16:59:22.382276-05	1	9	7	FEBS J	1	
49	2011-12-13 17:00:25.363247-05	1	11	15	Dethiobiotin	1	
50	2011-12-13 17:00:43.653458-05	1	8	37	Ania G	1	
51	2011-12-13 17:01:05.778136-05	1	11	16	APC40079	1	
52	2011-12-13 17:03:52.831153-05	1	11	17	APC41385.0	1	
53	2011-12-13 17:04:14.718219-05	1	8	38	Majka  	1	
54	2011-12-13 17:04:47.545631-05	1	11	18	IDP00044	1	
55	2011-12-13 17:06:10.16065-05	1	11	19	APC65312.2	1	
56	2011-12-13 17:06:50.471709-05	1	11	20	IDP01205	1	
57	2011-12-13 17:07:54.250562-05	1	9	8	J. Immunol	1	
58	2011-12-13 17:08:24.119886-05	1	8	39	Martin Chapman	1	
59	2011-12-13 17:08:56.992051-05	1	8	40	Anna  	1	
60	2011-12-13 17:09:22.399598-05	1	11	21	Alt a 1	1	
61	2011-12-13 17:10:17.744929-05	1	9	9	MOL IMMUNOL	1	
62	2011-12-13 17:10:53.452456-05	1	11	22	Albumins	1	
63	2011-12-13 17:11:42.54399-05	1	11	23	"cocktails"	1	
64	2011-12-13 17:12:21.562594-05	1	11	24	Universal stress proteins	1	
65	2011-12-13 17:13:00.789001-05	1	11	25	IDP04323	1	
66	2011-12-13 17:13:19.114136-05	1	11	26	RutC	1	
67	2011-12-13 17:14:16.834082-05	1	9	10	Protein Sci	1	
68	2011-12-13 17:15:00.197835-05	1	11	27	IDP00698	1	
69	2011-12-13 17:15:43.522723-05	1	9	11	JBC	1	
70	2011-12-13 17:15:56.961023-05	1	11	28	Der f 1 /Der p 1	1	
71	2011-12-13 17:17:03.979453-05	1	9	12	MOL BIOL CELL	1	
72	2011-12-13 17:17:18.818116-05	1	11	29	Survivin	1	
73	2011-12-13 17:18:08.26504-05	1	8	33	Rashin  	2	Changed lastname and email.
74	2011-12-13 17:24:03.900323-05	1	11	3	test paper 2	3	
75	2011-12-13 17:24:04.027875-05	1	11	2	test paper	3	
76	2011-12-13 23:21:04.707617-05	2	8	37	Anna Goral	2	Changed firstname and lastname.
77	2011-12-13 23:27:41.13564-05	2	11	1	IDP90717 and IDP04624	2	Added publication_status_jcn "publication_status_jcn object".
78	2011-12-13 23:28:12.604383-05	2	11	16	APC40079	2	Added publication_status_jcn "publication_status_jcn object".
79	2011-12-14 09:49:09.699093-05	1	9	10	PROTEIN SCI	2	Changed journal_abbr.
80	2011-12-14 09:49:22.426423-05	1	9	8	J IMMUNOL	2	Changed journal_abbr.
81	2011-12-14 09:50:17.137178-05	1	9	3	PROTEINS	2	Changed journal_abbr.
82	2011-12-14 09:50:49.779028-05	1	9	2	ACTA CRYST F	2	Changed journal_abbr.
83	2011-12-14 09:51:24.914695-05	1	9	7	FEBS J	2	Changed journal_name.
84	2011-12-14 09:51:35.730356-05	1	9	6	NAT METHODS	2	Changed journal_name.
85	2011-12-14 09:53:11.301459-05	1	8	4	Robert Solberg	3	
86	2011-12-14 10:16:28.877937-05	1	11	9	Alexander Rashin's Paper	2	Changed topic.
87	2011-12-14 10:42:36.872385-05	1	3	4	user	1	
88	2011-12-14 10:44:07.4543-05	1	3	4	user	2	Changed user_permissions.
89	2011-12-14 11:34:51.372892-05	1	11	15	Dethiobiotin	2	Changed deadline.
90	2011-12-14 11:35:23.145421-05	1	11	29	Survivin	2	Added publication_status_jcn "publication_status_jcn object". Changed status for publication_status_jcn "publication_status_jcn object".
91	2011-12-14 11:40:53.826707-05	1	11	34	test paper	1	
92	2011-12-14 13:26:03.027546-05	2	3	4	user	2	Changed is_staff.
93	2011-12-14 13:36:21.817488-05	4	11	6	IDP02573	2	Changed status for publication_status_jcn "publication_status_jcn object".
94	2011-12-14 13:38:47.443227-05	4	12	6	publication_status_jcn object	2	No fields changed.
95	2011-12-14 15:38:00.673323-05	4	11	34	test paper	2	Added attachment "attachment object".
96	2011-12-14 15:50:33.140792-05	4	11	34	test paper	2	Added attachment "attachment object".
97	2011-12-14 15:56:46.831815-05	2	11	34	test paper	3	
98	2011-12-14 16:24:05.115735-05	4	11	7	IDP90828	2	Changed status and person_responsible for publication_status_jcn "publication_status_jcn object".
99	2011-12-14 16:48:28.420158-05	4	12	5	publication_status_jcn object	2	Changed status and person_responsible.
100	2011-12-14 16:48:33.049214-05	4	12	5	publication_status_jcn object	2	No fields changed.
101	2011-12-14 16:48:48.258174-05	4	12	33	publication_status_jcn object	1	
102	2011-12-14 16:48:49.872187-05	4	12	33	publication_status_jcn object	2	No fields changed.
103	2011-12-14 16:57:19.138827-05	4	12	34	publication_status_jcn object	1	
104	2011-12-14 16:57:41.077199-05	4	12	26	publication_status_jcn object	3	
105	2011-12-14 16:58:04.860455-05	4	12	27	publication_status_jcn object	2	No fields changed.
106	2011-12-14 16:58:38.032553-05	4	12	27	publication_status_jcn object	3	
107	2011-12-14 22:10:39.387301-05	2	12	13	publication_status_jcn object	2	Changed status and description.
108	2011-12-14 22:12:09.597694-05	2	11	14	CMM	2	Changed second_author and third_author. Added publication_status_jcn "publication_status_jcn object".
109	2011-12-14 22:15:53.018731-05	2	9	13	Acta Cryst. D	1	
110	2011-12-14 22:16:58.293189-05	2	11	35	glycoprotein	1	
111	2011-12-14 22:26:59.322571-05	2	8	41	Haibin Luo	1	
112	2011-12-14 22:27:09.313914-05	2	11	27	IDP00698	2	Added publication_status_jcn "publication_status_jcn object". Added publication_status_jcn "publication_status_jcn object". Changed status and description for publication_status_jcn "publication_status_jcn object".
113	2011-12-14 22:30:22.618027-05	2	12	5	publication_status_jcn object	2	Changed person_responsible.
114	2011-12-14 22:30:32.687142-05	2	12	33	publication_status_jcn object	2	Changed person_responsible.
115	2011-12-14 23:28:31.610267-05	2	11	26	RutC	2	Changed active.
116	2011-12-14 23:28:49.275133-05	2	11	26	RutC	2	Changed active.
117	2011-12-14 23:38:10.925933-05	2	12	24	publication_status_jcn object	2	Changed person_responsible.
118	2011-12-14 23:38:45.518517-05	2	12	16	publication_status_jcn object	2	Changed person_responsible.
119	2011-12-15 10:23:30.171345-05	4	11	1	PGKs- IDP90717 and IDP04624	2	Changed topic. Changed status and description for publication_status_jcn "publication_status_jcn object".
120	2011-12-15 10:26:14.52138-05	4	11	17	APC41385.0	2	Changed status and person_responsible for publication_status_jcn "publication_status_jcn object".
121	2011-12-15 10:29:09.824304-05	4	11	1	PGKs- IDP90717 and IDP04624	2	Changed description for publication_status_jcn "publication_status_jcn object".
122	2011-12-15 10:32:44.197536-05	4	11	8	Anthrax proteins	2	Changed target_journal.
123	2011-12-15 10:35:44.30418-05	4	9	14	JMB	1	
124	2011-12-15 10:35:48.507447-05	4	11	24	Universal stress proteins	2	Changed target_journal.
125	2011-12-16 10:20:10.504311-05	2	11	1	PGKs- IDP90717 and IDP04624	2	Changed status and description for publication_status_jcn "publication_status_jcn object".
126	2011-12-16 13:41:10.20544-05	4	11	19	APC65312.2	2	Changed person_responsible for publication_status_jcn "publication_status_jcn object".
127	2011-12-16 15:11:57.008681-05	4	11	17	APC41385.0	2	Changed person_responsible for publication_status_jcn "publication_status_jcn object".
128	2011-12-19 16:19:44.545591-05	2	17	1	notification object	1	
129	2011-12-19 16:20:49.504235-05	2	3	4	user	2	Changed user_permissions.
130	2011-12-19 19:41:25.267937-05	4	17	1	notification object	1	
131	2011-12-19 22:09:20.219608-05	2	17	1	notification object	1	
132	2011-12-19 22:10:14.558159-05	2	8	1	Heping Zheng	2	Changed email.
133	2011-12-19 23:23:32.46997-05	2	17	1	notification object	2	Changed begin_date.
134	2011-12-20 01:26:17.435269-05	2	8	42	Wladek Minor	1	
135	2011-12-20 01:26:57.730367-05	2	17	2	notification object	1	
136	2011-12-20 14:42:47.512225-05	4	12	1	publication_status_jcn object	1	
137	2011-12-20 16:01:16.161978-05	4	9	15	Biomet	1	
138	2011-12-20 16:01:38.619847-05	4	11	36	Ferro	1	
139	2011-12-21 16:17:08.785401-05	4	12	7	publication_status_jcn object	2	Changed status and person_responsible.
140	2011-12-21 18:06:47.120542-05	2	3	4	user	2	Changed user_permissions.
141	2011-12-21 19:18:13.489453-05	2	20	1	absence object	1	
142	2011-12-22 05:52:54.6426-05	2	20	2	absence object	1	
143	2011-12-22 05:54:01.220015-05	2	20	3	absence object	1	
144	2011-12-22 05:56:48.829829-05	2	20	4	absence object	1	
145	2011-12-22 05:59:46.471316-05	2	20	5	absence object	1	
146	2011-12-22 06:07:31.231784-05	2	12	36	publication_status_jcn object	2	Changed person_responsible and due_date.
147	2011-12-22 06:07:51.137874-05	2	12	36	publication_status_jcn object	2	Changed due_date.
148	2011-12-22 06:08:35.187046-05	2	12	37	publication_status_jcn object	2	Changed due_date.
149	2011-12-22 06:08:51.256944-05	2	12	36	publication_status_jcn object	2	Changed due_date.
150	2011-12-22 06:09:38.474379-05	2	12	2	publication_status_jcn object	2	Changed due_date.
151	2011-12-22 06:12:22.553308-05	2	9	14	JMB	2	Changed journal_name.
152	2011-12-22 06:12:48.594038-05	2	9	14	JMB	2	Changed journal_name.
153	2011-12-22 06:58:19.084521-05	2	17	3	notification object	1	
154	2011-12-22 11:09:31.465004-05	2	8	1	Heping Zheng	2	Changed email.
155	2011-12-22 13:41:05.923147-05	4	20	6	absence object	1	
156	2011-12-22 13:42:41.926887-05	2	17	1	notification object	2	Changed begin_date.
157	2011-12-22 13:42:42.263804-05	2	17	1	notification object	2	No fields changed.
158	2011-12-22 14:24:33.555542-05	2	8	7	Mahendra D. Chordia	2	Changed firstname.
159	2011-12-22 14:24:57.120644-05	2	8	27	Igor A. Shumilin	2	Changed firstname.
160	2011-12-22 14:25:14.2147-05	2	8	26	Ivan G. Shabalin	2	Changed firstname.
161	2011-12-22 14:25:38.094561-05	2	8	17	Aleksandra A. Knapik	2	Changed firstname.
162	2011-12-22 14:27:00.153628-05	2	8	42	Wladek Minor	2	Changed phone.
163	2011-12-22 14:27:56.988877-05	2	8	1	Heping Zheng	2	Changed phone.
164	2011-12-22 14:34:11.746941-05	2	17	1	notification object	2	Changed begin_date.
165	2011-12-22 14:35:47.655874-05	2	17	1	notification object	2	Changed begin_date.
166	2011-12-22 15:08:18.98025-05	4	8	40	Anna G. Chruszcz	2	Changed firstname, lastname, email and phone.
167	2011-12-22 15:11:09.315227-05	4	8	32	Matthew D. Zimmerman	2	Changed phone.
168	2011-12-22 16:42:52.799641-05	4	20	1	absence object	2	Changed notification.
169	2011-12-22 16:43:31.385639-05	4	17	1	notification object	2	Changed begin_date.
170	2011-12-22 18:13:07.973177-05	4	11	37	metal-benchmark	1	
171	2011-12-22 18:14:39.76615-05	4	8	43	Arabinda Mandal	1	
172	2011-12-22 18:16:25.076477-05	4	11	39	SLLP1	1	
173	2011-12-22 18:54:35.546494-05	4	11	39	SLLP1	2	Added publication_status_jcn "publication_status_jcn object".
174	2011-12-22 19:01:15.311748-05	4	12	12	publication_status_jcn object	2	Changed description.
175	2011-12-23 15:42:15.379428-05	4	8	12	Marcin Domagalski	2	Changed phone.
176	2011-12-27 10:54:14.872324-05	4	20	7	absence object	1	
177	2011-12-27 20:43:28.00996-05	4	11	22	Albumins	2	Changed second_author.
178	2011-12-29 12:04:39.03268-05	4	12	30	publication_status_jcn object	2	Changed status.
179	2011-12-29 12:05:10.657247-05	4	11	22	Albumins	2	Added publication_status_jcn "publication_status_jcn object". Changed description for publication_status_jcn "publication_status_jcn object".
180	2011-12-29 12:19:22.779846-05	4	17	1	notification object	2	Changed report_frequency.
181	2012-01-02 10:41:38.392059-05	4	20	8	absence object	1	
182	2012-01-02 10:42:41.763187-05	4	20	9	absence object	1	
183	2012-01-03 11:50:01.353909-05	4	12	15	publication_status_jcn object	2	Changed status, person_responsible and description.
184	2012-01-03 11:51:10.728745-05	4	12	10	publication_status_jcn object	2	Changed person_responsible.
185	2012-01-03 13:54:00.876234-05	4	11	17	APC41385.0	2	Changed status, person_responsible, description and due_date for publication_status_jcn "publication_status_jcn object".
186	2012-01-03 13:54:22.653469-05	4	20	10	absence object	1	
187	2012-01-03 13:54:35.498592-05	4	11	17	APC41385.0	2	Changed description for publication_status_jcn "publication_status_jcn object".
188	2012-01-03 15:41:27.61963-05	4	11	17	APC41385.0	2	Added publication_status_jcn "publication_status_jcn object". Changed status and description for publication_status_jcn "publication_status_jcn object".
189	2012-01-03 15:42:25.773863-05	4	11	17	APC41385.0	2	Changed status for publication_status_jcn "publication_status_jcn object". Changed status for publication_status_jcn "publication_status_jcn object".
190	2012-01-03 15:43:48.825798-05	4	11	17	APC41385.0	2	No fields changed.
191	2012-01-04 15:51:38.119179-05	4	12	31	publication_status_jcn object	3	
192	2012-01-04 16:11:17.663296-05	4	12	35	publication_status_jcn object	3	
193	2012-01-04 16:11:55.287653-05	4	11	19	APC65312.2	2	No fields changed.
194	2012-01-04 16:12:05.236323-05	4	11	16	APC40079	2	No fields changed.
195	2012-01-04 16:12:15.021627-05	4	11	6	IDP02573	2	No fields changed.
196	2012-01-04 16:12:24.236663-05	4	11	5	RutD	2	No fields changed.
197	2012-01-04 16:12:33.732163-05	4	11	26	RutC	2	No fields changed.
198	2012-01-04 16:12:44.708191-05	4	11	16	APC40079	2	No fields changed.
199	2012-01-11 17:05:28.883923-05	1	11	28	Der f 1 /Der p 1	2	Changed status and description for publication_status_jcn "publication_status_jcn object".
200	2012-01-13 12:49:35.599424-05	4	12	16	publication_status_jcn object	2	Changed status.
201	2012-01-18 15:19:55.728559-05	4	12	21	publication_status_jcn object	2	Changed person_responsible, description and due_date.
202	2012-01-19 16:54:16.771708-05	1	21	1	Steve Almo	1	
203	2012-01-19 16:54:45.30067-05	1	21	2	Gaya Amarasinghe	1	
204	2012-01-19 16:55:03.056914-05	1	21	3	Wayne Anderson	1	
205	2012-01-19 16:58:19.178453-05	1	21	4	Heimo Breiteneder	1	
206	2012-01-19 16:58:44.061963-05	1	21	5	Tomasz Cierpicki	1	
207	2012-01-19 16:59:02.121155-05	1	21	6	Mirek Cygler	1	
208	2012-01-19 16:59:43.306038-05	1	21	7	Jolanta Grembecka	1	
209	2012-01-19 17:01:41.521052-05	1	21	8	Pawel Grochulski	1	
210	2012-01-19 17:02:02.144954-05	1	21	9	Jack Johnson	1	
211	2012-01-19 17:02:29.46498-05	1	21	10	Adam Godzik	1	
212	2012-01-19 17:02:54.814656-05	1	21	11	Lukasz Lebioda	1	
213	2012-01-19 17:03:16.482195-05	1	21	12	Arun Malhotra	1	
214	2012-01-19 17:03:39.775194-05	1	21	13	Mischa Machius	1	
215	2012-01-19 17:04:19.512481-05	1	21	14	Jim Spencer	1	
216	2012-01-19 17:04:43.999176-05	1	21	15	Thomas Terwilliger	1	
217	2012-01-19 17:04:58.91702-05	1	21	16	Diana Tomchick	1	
218	2012-01-19 17:05:22.58491-05	1	21	17	Brian Sutton	1	
219	2012-01-19 17:05:39.707302-05	1	21	18	Wayne Thomas	1	
220	2012-01-19 17:06:29.982872-05	1	11	40	test paper	1	
221	2012-01-19 17:20:24.817209-05	1	11	40	test paper	2	Added publication_referee_jcn "publication_referee_jcn object". Added publication_referee_jcn "publication_referee_jcn object".
222	2012-01-19 17:23:12.77798-05	1	11	41	test paper 2	1	
223	2012-01-19 17:24:04.860512-05	1	11	41	test paper 2	3	
224	2012-01-19 17:24:05.0746-05	1	11	40	test paper	3	
225	2012-01-19 18:21:19.43981-05	4	11	14	CMM	2	Changed status, person_responsible, description and due_date for publication_status_jcn "publication_status_jcn object".
226	2012-01-20 09:52:57.379662-05	1	11	42	test paper	1	
227	2012-01-20 10:33:18.945183-05	1	11	42	test paper	3	
228	2012-01-20 13:50:57.365328-05	1	12	16	publication_status_jcn object	2	Changed status.
229	2012-01-20 13:52:00.93086-05	1	12	5	publication_status_jcn object	2	Changed status.
230	2012-01-20 13:52:33.294797-05	1	12	5	publication_status_jcn object	2	No fields changed.
231	2012-01-20 13:53:34.15569-05	1	11	5	RutD	2	Changed status for publication_status_jcn "publication_status_jcn object".
232	2012-01-20 13:58:49.666599-05	1	11	5	RutD	2	Added publication_referee_jcn "publication_referee_jcn object". Added publication_referee_jcn "publication_referee_jcn object". Added publication_referee_jcn "publication_referee_jcn object".
233	2012-01-23 16:18:07.712282-05	4	11	14	CMM	2	Changed person_responsible and description for publication_status_jcn "publication_status_jcn object".
234	2012-01-26 13:53:36.064694-05	4	12	21	publication_status_jcn object	2	Changed person_responsible.
235	2012-01-26 16:01:36.379157-05	4	11	4	IDP00203	2	No fields changed.
236	2012-01-26 16:02:41.299646-05	4	11	4	IDP00203	2	Added publication_status_jcn "publication_status_jcn object".
237	2012-01-28 18:00:28.054572-05	4	12	21	publication_status_jcn object	2	Changed status, person_responsible and due_date.
238	2012-01-28 18:32:42.124573-05	4	12	37	publication_status_jcn object	2	Changed due_date.
239	2012-01-28 18:34:08.175688-05	4	12	32	publication_status_jcn object	2	Changed person_responsible, description and due_date.
240	2012-01-30 13:59:31.056529-05	4	12	21	publication_status_jcn object	2	Changed person_responsible and description.
241	2012-01-30 13:59:48.023994-05	4	12	21	publication_status_jcn object	2	No fields changed.
242	2012-02-01 13:18:54.434827-05	4	11	22	Albumins	2	Changed status, person_responsible and due_date for publication_status_jcn "publication_status_jcn object". Changed status and person_responsible for publication_status_jcn "publication_status_jcn object".
243	2012-02-01 13:20:39.752918-05	4	11	22	Albumins	2	Deleted publication_status_jcn "publication_status_jcn object".
244	2012-02-02 12:30:20.399417-05	4	11	4	IDP00203	2	Deleted publication_status_jcn "publication_status_jcn object".
245	2012-02-02 14:38:38.185485-05	4	11	4	IDP00203	2	Added publication_status_jcn "publication_status_jcn object". Deleted publication_status_jcn "publication_status_jcn object". Added attachment "attachment object".
246	2012-02-02 14:39:51.035565-05	4	11	4	IDP00203	2	No fields changed.
247	2012-02-02 15:21:28.138845-05	4	11	15	Dethiobiotin	2	Changed deadline. Changed status, person_responsible and description for publication_status_jcn "publication_status_jcn object".
248	2012-02-02 15:22:46.283024-05	4	11	29	Survivin	2	Changed status for publication_status_jcn "publication_status_jcn object".
249	2012-02-07 16:06:41.751699-05	4	17	18	notification object	2	No fields changed.
250	2012-02-07 16:06:54.113801-05	4	17	18	notification object	2	No fields changed.
251	2012-02-07 16:07:14.959212-05	4	17	28	notification object	1	
252	2012-02-07 16:09:19.952904-05	4	12	19	publication_status_jcn object	2	Changed person_responsible and description.
253	2012-02-07 16:12:25.391369-05	4	11	43	IDP90557	1	
254	2012-02-07 17:38:13.683988-05	4	12	21	publication_status_jcn object	2	Changed status, description and due_date.
255	2012-02-07 17:38:31.208684-05	4	12	21	publication_status_jcn object	2	Changed person_responsible.
256	2012-02-07 17:46:32.745172-05	4	11	14	CMM	2	Changed status for publication_status_jcn "publication_status_jcn object".
257	2012-02-13 12:14:07.233882-05	4	11	7	IDP90828	2	Changed status for publication_status_jcn "publication_status_jcn object".
258	2012-02-15 12:20:00.378303-05	4	11	21	Alt a 1	2	Changed status and person_responsible for publication_status_jcn "publication_status_jcn object". Deleted publication_status_jcn "publication_status_jcn object". Deleted publication_status_jcn "publication_status_jcn object".
259	2012-02-15 12:23:21.762275-05	4	11	29	Survivin	2	Changed status for publication_status_jcn "publication_status_jcn object". Deleted publication_status_jcn "publication_status_jcn object".
260	2012-02-15 15:27:16.074164-05	4	11	35	glycoprotein	2	Deleted publication_status_jcn "publication_status_jcn object".
261	2012-02-15 15:28:10.868439-05	4	11	35	glycoprotein	2	Changed status, description and due_date for publication_status_jcn "publication_status_jcn object".
262	2012-02-15 15:31:56.200749-05	4	12	2	publication_status_jcn object	2	Changed description and due_date.
263	2012-02-15 15:33:13.636838-05	4	11	24	Universal stress proteins	2	Changed person_responsible, description and due_date for publication_status_jcn "publication_status_jcn object".
264	2012-02-17 16:48:04.004838-05	4	11	14	CMM	2	Added attachment "attachment object".
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	author	papers	author
9	journal	papers	journal
10	status	papers	status
11	publication	papers	publication
12	publication_status_jcn	papers	publication_status_jcn
13	log entry	admin	logentry
14	attachment	papers	attachment
15	frequency	papers	frequency
17	notification	papers	notification
18	contact_type	papers	contact_type
19	absence_type	papers	absence_type
20	absence	papers	absence
21	referee	papers	referee
22	publication_referee_jcn	papers	publication_referee_jcn
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
46341a17933e5c9a592b30aac7cf1c42	ZTY4NDZjYmEwMWRmZjA2YWI5Yjk3MzcyNGU4ZTUxMmFmNDBmZTk0ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-26 16:00:34.488396-05
be80d6ebd9811e5663252eac8cd094f7	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 16:37:50.49275-05
897e39f7178771c028a160a7d6a15c87	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-02 16:21:01.871031-05
a30b3bf922786b9c55eb9b4f09283f09	NTQyOWYwYjBhNTc5MjQzYjkyMmM5ZjMxMTlmYzRmMTg3M2NlMzU0YzqAAn1xAS4=\n	2012-01-05 19:01:59.280876-05
a1290fda0e6cc660b671ab66b2a81911	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 17:06:09.377949-05
3159980724c9273f9289be23ec4a6ed9	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-06 10:16:30.174056-05
802fb6a25206c7e4eaf28093b3e89b6b	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 17:14:19.736615-05
ae000a44a1724d5c1d5d41597ed3358a	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-06 12:01:27.745098-05
7b9467520ed37a586829e8c7ea04445a	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 17:32:24.697724-05
6a6f876914c6be030159bfbc4f18f141	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-10 20:42:17.120019-05
ad0c22658614679bf085d2f54a16c7ad	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 18:05:08.855582-05
e243cfdb566c617c2e4108c3f9e11242	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 18:33:46.665693-05
0976baa4d99f783ced620a8345e451b3	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 13:35:27.783986-05
5028da55d02d846e1f35d76bc70688b5	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 21:19:45.552002-05
b605ba0734e836cb743d5e64cb4ce459	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-29 10:20:26.732463-05
e8a7343e8a8a6708e1ee92379a8d7b22	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-29 10:20:38.142767-05
6a7fec5739e37c06ba2b506099a5d4d4	NTQyOWYwYjBhNTc5MjQzYjkyMmM5ZjMxMTlmYzRmMTg3M2NlMzU0YzqAAn1xAS4=\n	2012-01-04 14:49:54.862723-05
a531f82fdc77984b37f5bb942116107d	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-12 11:10:06.871085-05
3fcb58b470f78451ccf5b08ba5048675	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-04 16:16:30.50251-05
dbbc556e76757c63da2be432cd73b2c1	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-12 12:03:44.478288-05
741dbb8d3a490ff7c54a10eef3de78c2	NTQyOWYwYjBhNTc5MjQzYjkyMmM5ZjMxMTlmYzRmMTg3M2NlMzU0YzqAAn1xAS4=\n	2011-12-29 10:28:28.059083-05
14e5fd5303642768495074a9f9ac6980	ZTY4NDZjYmEwMWRmZjA2YWI5Yjk3MzcyNGU4ZTUxMmFmNDBmZTk0ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-28 16:00:32.252006-05
11307a0eafe5e4829f86d31698347022	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-29 10:41:32.446154-05
a472d6fd2f31ff95c322befc419cfa20	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 16:08:33.442079-05
8ab06e84137c286dc176826a41953efc	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 16:09:57.681338-05
be0e0583ded6584cb27d899a081c7f0b	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 16:10:42.068055-05
11e69953f1722ec761834146ac06b75d	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 16:14:02.155933-05
e0563ee5b36d8f76fdae8a9306b57e78	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-28 16:15:10.498064-05
faedf27b76e225896c61151e9a801ecb	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-12-28 16:22:56.829576-05
7dba02cbbdb46cb457b5ee79985bc3b8	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-04 18:06:59.614575-05
482ec17efbcc7f358638420eddebe6de	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-12 12:05:07.495204-05
cb4109d036f440203b83b3d0da8abd3e	NTQyOWYwYjBhNTc5MjQzYjkyMmM5ZjMxMTlmYzRmMTg3M2NlMzU0YzqAAn1xAS4=\n	2012-01-12 12:10:36.364818-05
bf4e13bb6d62ea3d0ff93471c9ff2498	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-05 08:23:00.124942-05
182b98870eccc6657c9f13c42d967f73	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-05 13:39:55.2034-05
f664264540bbf72401149d545fc43e5b	NTQyOWYwYjBhNTc5MjQzYjkyMmM5ZjMxMTlmYzRmMTg3M2NlMzU0YzqAAn1xAS4=\n	2012-01-17 11:52:24.75958-05
2084fda3b097ad6db948158f656e1b6a	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-13 13:58:32.462437-05
f723ca2c23a712c6ddbe95fa0d0c9a6f	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-17 13:53:22.989063-05
dddbf097fd4631e24795ca53e7ad2cd6	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-17 15:40:16.692474-05
35428ea147f1f263fa1c2fccfabea7ed	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-02-14 13:35:31.48427-05
6cc5cb42bc5af3d050f04ed4c52985a4	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-15 13:17:20.769867-05
89574ae87b2a25b9d6cf48ae44b513c3	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-16 10:38:24.929408-05
2397c3e6854a5d1ed745c2dcca0b1238	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-16 15:20:54.992431-05
c1c1bc250eb2c510c2e6bec6602b1a04	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-01-26 10:18:32.677051-05
2476ad5a0d9b444ec5b26b7d28918f82	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-02-16 14:59:27.008133-05
bfcce2f94bcde72ff49edba96418c020	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-27 12:49:20.561349-05
6e045996ec7c8db213db2c0f28db4be7	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-01-29 21:45:27.009575-05
228de9801b7921f5f877af367d9f7d6e	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-16 15:20:13.864287-05
da508a6d78521c71580b2377111cd8e5	NTBjNmRiYzMyYjFlYjdkNzVlZTJmN2U2YjlhYzdjYWM1MDBhOGQ3YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-02-16 15:39:00.133014-05
cc04abbc3e97c7124f9fbdbebf4f18da	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-01 15:19:29.955066-05
4b89e74cbca97231e0981e86d64bab56	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-02 18:19:51.815896-05
9f46306035195aa257fe4000ff2de29f	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-16 15:43:16.935749-05
77615d7032dace77c2422cb2d1410c98	ZTY4NDZjYmEwMWRmZjA2YWI5Yjk3MzcyNGU4ZTUxMmFmNDBmZTk0ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-02-02 22:49:55.301054-05
0d78d9688408c11cd1dcd5678c5a6b32	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-21 16:05:58.217311-05
6367a76860be6f355e05c77035569847	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-21 17:37:49.435677-05
4f888ad0bc523173b7b836644e8653e9	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-27 12:11:43.204574-05
a77bdf5b5f92f3f84fdb4277dd5a79b6	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-29 12:19:09.919715-05
9c51cbac1cc9b8c82ca979d2aea87a83	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-03-02 16:47:12.643257-05
f4c4be9c0aa7140791cbefae192e83d1	NzQ0MGMwNmIxMjJhMDA2MDQzNzZlZGM3MDQyNjg2MTc0N2NhNjkxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2012-02-09 16:00:55.712408-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: papers_absence; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_absence (id, person_id, notification, absence_type_id, begin_date, end_date, contact_type_id, response_frequency_id) FROM stdin;
2	17	t	8	2011-12-20	\N	1	5
3	5	t	1	2011-12-22	2012-01-02	1	1
4	7	t	1	2011-12-24	2011-12-30	1	1
5	42	t	1	2011-12-15	2012-01-04	1	2
6	32	t	7	2011-12-22	2011-12-29	2	1
1	1	f	7	2011-12-22	2011-12-26	1	1
7	1	f	7	2011-12-30	2012-01-02	1	1
8	28	f	6	2012-01-12	2012-01-13	1	11
9	28	f	6	2012-01-19	2012-01-20	1	11
10	1	t	6	2012-01-09	2012-01-10	1	1
\.


--
-- Data for Name: papers_absence_type; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_absence_type (id, absence_type) FROM stdin;
1	unspecified
2	business trip
3	vacation
4	staycation
5	sick
6	personal issues
7	official holiday
8	leave for good
\.


--
-- Data for Name: papers_attachment; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_attachment (id, publication_id, file, author_id, version, entry_date) FROM stdin;
2	4	attachment/structure-note_Solberg-Demas_v6_mwd.doc	5	6	2012-02-02 14:38:37.894003-05
3	14	attachment/CMM-version-54.doc	9	\N	2012-02-17 16:48:03.090664-05
\.


--
-- Data for Name: papers_author; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_author (id, firstname, lastname, email, phone, skype) FROM stdin;
2	Ekaterina	Filippova	katya@structure.northwestern.edu	\N	\N
3	Karolina	Tkaczuk	karolina@iwonka.med.virginia.edu	\N	\N
5	Matt	Demas	matt_d@iwonka.med.virginia.edu	\N	\N
6	Jacek	Bajor	jacek_b@iwonka.med.virginia.edu	\N	\N
8	Maksymilian	Chruszcz	maks@iwonka.med.virginia.edu	\N	\N
10	Marcin	Cymborowski	marcel@iwonka.med.virginia.edu	\N	\N
13	Jose	Font	font@iwonka.med.virginia.edu	\N	\N
14	Zbigniew	Fratczak	zbigniew_f@iwonka.med.virginia.edu	\N	\N
15	Marek	Grabowski	marek@iwonka.med.virginia.edu	\N	\N
16	Jing	Hou	houjing@iwonka.med.virginia.edu	\N	\N
18	Elizabeth	MacLean	beth_m@iwonka.med.virginia.edu	\N	\N
19	Karolina	Majorek	karolina_m@iwonka.med.virginia.edu	\N	\N
20	Katarzyna	Mikolajczak	kasia_m@iwonka.med.virginia.edu	\N	\N
21	Ania	Milaczewska	ania_m@iwonka.med.virginia.edu	\N	\N
22	Ewa	Niedzialkowska	ewa_n@iwonka.med.virginia.edu	\N	\N
23	Tomasz	Osinski	tomek_o@iwonka.med.virginia.edu	\N	\N
24	Janusz	Petkowski	janusz@iwonka.med.virginia.edu	\N	\N
25	Przemek	Porebski	przemek@iwonka.med.virginia.edu	\N	\N
28	Rob	Solberg	rob_s@iwonka.med.virginia.edu	\N	\N
30	Rachel	Vigour	rachel_v@iwonka.med.virginia.edu	\N	\N
38	Majka	 	 	\N	\N
39	Martin	Chapman	 	\N	\N
34	Olga	Kirillova	 	\N	\N
36	Pawel	Sledz	 	\N	\N
35	Dominik	Gront	 	\N	\N
33	Alexander	Rashin	 	\N	\N
37	Anna	Goral	 	\N	\N
9	David R.	Cooper	dcoop@iwonka.med.virginia.edu	\N	\N
41	Haibin	Luo	hbluo2005@yahoo.com.cn	\N	\N
7	Mahendra D.	Chordia	mahendra@iwonka.med.virginia.edu		
27	Igor A.	Shumilin	igor@iwonka.med.virginia.edu		
26	Ivan G.	Shabalin	ivan_s@iwonka.med.virginia.edu		
17	Aleksandra A.	Knapik	aleksandra@iwonka.med.virginia.edu		
42	Wladek	Minor	wladek@iwonka.med.virginia.edu	434-825-1813	
1	Heping	Zheng	dust@iwonka.med.virginia.edu	434-242-7850	
40	Anna G.	Chruszcz	anna@hkl-xray.com	434-979-6382	
32	Matthew D.	Zimmerman	matt@iwonka.med.virginia.edu	434-243-0033	
43	Arabinda	Mandal	am7v@virginia.edu		
12	Marcin	Domagalski	marcin_d@iwonka.med.virginia.edu	434-227-1144	
\.


--
-- Data for Name: papers_contact_type; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_contact_type (id, contact_type) FROM stdin;
1	email
2	phone
3	skype
\.


--
-- Data for Name: papers_frequency; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_frequency (id, description, days) FROM stdin;
1	everyday	1
2	every_other_day	2
3	once_every_three_days	3
4	once_every_five_days	5
5	once_a_week	7
6	bi-weekly	14
7	monthly	30
8	once_every_two_months	60
9	once_every_three_months	90
10	never	3650
11	twice_a_day	1
12	several_times_a_day	1
13	within_the_next_hour	1
14	immediately	1
\.


--
-- Data for Name: papers_journal; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_journal (id, journal_name, journal_abbr, url) FROM stdin;
1	Journal of Structural and Functional Genomics	JSFG	http://www.editorialmanager.com/jsfg/default.asp
4	Journal of Structural Biology	JSB	http://www.elsevier.com/wps/find/journaldescription.cws_home/622900/authorinstructions
11	Journal of Biological Chemistry	JBC	http://www.jbc.org/site/misc/itoa.xhtml
7	Federation of European Biochemical Societies Journal	FEBS J	http://onlinelibrary.wiley.com/journal/10.1111/%28ISSN%291742-4658/homepage/febs_author_guidelines.htm
9	Molecular Immunology	Mol. Immunol.	http://www.elsevier.com/wps/find/journaldescription.cws_home/253/authorinstructions
5	Public Library of Science	PLoS	http://www.plos.org/publications/journals/
12	Molecular Biology of the Cell	Mol. Biol. Cell	http://www.molbiolcell.org/site/misc/ifora.xhtml
10	Protein Science	Protein Sci.	http://www.proteinscience.org/view/0/authorInformation.html
8	The Journal of Immunology	J. Immunol.	http://www.jimmunol.org/site/misc/authorinstructions.xhtml
3	Proteins: Structure, Function, and Bioinformatics	Proteins	http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1097-0134/homepage/ForAuthors.html
2	Acta Crystallographica Section F: Structural Biology and Crystallization Communications	Acta Cryst. F	http://journals.iucr.org/f/services/authorservices.html
6	Nature Methods	Nat. Methods	http://www.nature.com/nmeth/authors/index.html
13	Acta Crystallographica Section D: Biological Crystallography	Acta Cryst. D	http://submission.iucr.org/submit/d
15	Biometals Journal	Biomet	http://www.springer.com/life+sciences/biochemistry+%26+biophysics/journal/10534
14	Journal of Molecular Biology	JMB	http://www.journals.elsevier.com/journal-of-molecular-biology/
\.


--
-- Data for Name: papers_notification; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_notification (id, person_id, notification, begin_date, report_frequency_id, pastdue_frequency_id) FROM stdin;
5	30	t	2011-12-14	5	2
10	24	t	2011-12-14	5	2
13	21	t	2011-12-14	5	2
16	18	t	2011-12-14	5	2
19	15	t	2011-12-14	5	2
20	14	t	2011-12-14	5	2
23	10	t	2011-12-14	5	2
25	7	t	2012-01-26	5	2
18	16	t	2012-01-05	5	2
28	16	t	2012-02-07	5	2
1	1	t	2012-02-08	4	2
2	42	t	2012-02-09	5	2
3	3	t	2012-02-16	5	2
7	27	t	2012-02-16	5	2
6	28	t	2012-02-16	5	2
4	32	t	2011-12-29	5	2
8	26	t	2012-01-05	5	2
9	25	t	2012-01-05	5	2
11	23	t	2012-01-05	5	2
12	22	t	2012-01-05	5	2
14	20	t	2012-01-05	5	2
15	19	t	2012-01-05	5	2
17	17	t	2012-01-05	5	2
21	12	t	2012-01-05	5	2
22	5	t	2012-01-05	5	2
24	8	t	2012-01-05	5	2
26	9	t	2012-01-05	5	2
27	6	t	2012-01-05	5	2
\.


--
-- Data for Name: papers_publication; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_publication (id, first_author_id, second_author_id, third_author_id, target_journal_id, topic, entry_date, modify_date, deadline, active) FROM stdin;
29	22	\N	\N	12	Survivin	2011-12-13 17:17:18.805601-05	2012-02-15 12:23:21.719082-05	\N	t
35	1	3	\N	13	glycoprotein	2011-12-14 22:16:58.277957-05	2012-02-15 15:28:10.844637-05	\N	t
24	3	27	\N	14	Universal stress proteins	2011-12-13 17:12:21.549907-05	2012-02-15 15:33:13.613356-05	\N	t
14	1	7	9	6	CMM	2011-12-13 16:57:53.997934-05	2012-02-17 16:48:02.972069-05	\N	t
8	3	9	\N	10	Anthrax proteins	2011-12-13 16:50:24.967607-05	2011-12-15 10:32:44.178687-05	\N	t
1	1	2	3	1	PGKs- IDP90717 and IDP04624	2011-12-13 13:49:31.424404-05	2011-12-16 10:20:10.485086-05	\N	t
13	35	36	\N	\N	Small Molecules (Hepes, ...)	2011-12-13 16:55:36.143241-05	2011-12-13 16:55:36.143297-05	\N	t
18	38	25	\N	1	IDP00044	2011-12-13 17:04:47.533086-05	2011-12-13 17:04:47.533141-05	\N	t
20	12	3	\N	2	IDP01205	2011-12-13 17:06:50.459224-05	2011-12-13 17:06:50.45928-05	\N	t
23	27	\N	\N	6	"cocktails"	2011-12-13 17:11:42.531519-05	2011-12-13 17:11:42.531575-05	\N	t
25	22	25	\N	2	IDP04323	2011-12-13 17:13:00.776527-05	2011-12-13 17:13:00.776584-05	\N	t
36	3	8	\N	15	Ferro	2011-12-20 16:01:38.600437-05	2011-12-20 16:01:38.600497-05	\N	t
11	34	\N	\N	\N	Olga's Paper	2011-12-13 16:53:03.702513-05	2011-12-14 09:43:54.983261-05	\N	t
10	3	2	\N	4	APC7623	2011-12-13 16:52:27.920258-05	2011-12-14 09:43:54.983261-05	\N	t
12	35	15	\N	5	modelling	2011-12-13 16:54:38.488913-05	2011-12-14 09:43:54.983261-05	\N	t
39	1	27	7	\N	SLLP1	2011-12-01 00:00:00-05	2011-12-01 00:00:00-05	\N	t
9	33	\N	\N	\N	Alexander Rashin's Paper	2011-12-13 16:51:13.743163-05	2011-12-14 10:16:28.861184-05	\N	t
37	1	5	26	3	metal-benchmark	2011-12-16 00:00:00-05	2011-12-16 00:00:00-05	\N	t
17	6	3	\N	2	APC41385.0	2011-12-13 17:03:52.818562-05	2012-01-03 15:43:48.809702-05	\N	t
19	20	14	\N	2	APC65312.2	2011-12-13 17:06:10.148093-05	2012-01-04 16:11:55.274476-05	\N	t
6	16	\N	\N	2	IDP02573	2011-12-13 16:48:17.699878-05	2012-01-04 16:12:15.008589-05	\N	t
26	17	\N	\N	2	RutC	2011-12-13 17:13:19.101521-05	2012-01-04 16:12:33.719194-05	\N	t
16	37	3	\N	1	APC40079	2011-12-13 17:01:05.767317-05	2012-01-04 16:12:44.695007-05	2011-12-21	t
28	8	\N	\N	11	Der f 1 /Der p 1	2011-12-13 17:15:56.948555-05	2012-01-11 17:05:28.860169-05	\N	t
27	17	\N	\N	10	IDP00698	2011-12-13 17:15:00.185282-05	2011-12-14 22:27:09.29061-05	\N	t
5	17	\N	\N	3	RutD	2011-12-13 16:47:58.362184-05	2012-01-20 13:58:49.643736-05	\N	t
22	19	25	\N	9	Albumins	2011-12-13 17:10:53.439955-05	2012-02-01 13:20:39.706061-05	\N	t
4	28	5	\N	2	IDP00203	2011-12-13 16:46:26.958962-05	2012-02-02 14:39:50.996178-05	\N	t
15	25	\N	\N	7	Dethiobiotin	2011-12-13 17:00:25.350688-05	2012-02-02 15:21:28.104185-05	\N	t
43	16	8	1	\N	IDP90557	2012-02-07 16:12:25.271094-05	2012-02-07 16:12:25.271159-05	\N	t
7	26	25	\N	2	IDP90828	2011-12-13 16:49:36.629079-05	2012-02-13 12:14:07.172189-05	\N	t
21	8	\N	\N	8	Alt a 1	2011-12-13 17:09:22.383945-05	2012-02-15 12:20:00.26115-05	\N	t
\.


--
-- Data for Name: papers_publication_referee_jcn; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_publication_referee_jcn (id, publication_id, referee_id, entry_date, modify_date) FROM stdin;
13	5	16	2012-01-20 13:58:49.656378-05	2012-01-20 13:58:49.656438-05
14	5	11	2012-01-20 13:58:49.658892-05	2012-01-20 13:58:49.658949-05
15	5	12	2012-01-20 13:58:49.660531-05	2012-01-20 13:58:49.660587-05
\.


--
-- Data for Name: papers_publication_status_jcn; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_publication_status_jcn (id, publication_id, status_id, person_responsible_id, description, due_date, entry_date, modify_date) FROM stdin;
3	9	1	\N		\N	2011-12-13 16:51:13.750436-05	2011-12-13 16:51:13.750436-05
4	10	1	\N		\N	2011-12-13 16:52:27.92754-05	2011-12-13 16:52:27.92754-05
6	12	1	\N		\N	2011-12-13 16:54:38.496231-05	2011-12-13 16:54:38.496231-05
8	20	3	12		2012-01-10	2011-12-13 17:06:50.466521-05	2011-12-13 17:06:50.466521-05
13	23	5	\N	The status was given as RED, but no deadline was given	\N	2011-12-13 17:11:42.53879-05	2011-12-13 17:11:42.53879-05
14	25	5	\N	needs more work	\N	2011-12-13 17:13:00.783802-05	2011-12-13 17:13:00.783802-05
20	14	1	\N	Send Email about re-refinement to coteg@queensu.ca (3lkm) and xjulia@iqfr.csic.es (3lrk)	\N	2011-12-13 16:57:54.00525-05	2011-12-13 16:57:54.00525-05
22	27	3	17		2012-01-10	2011-12-14 16:57:19.135634-05	2011-12-14 16:57:19.135634-05
23	27	2	5		2012-01-10	2011-12-14 22:27:09.305275-05	2011-12-14 22:27:09.305275-05
24	27	2	41		2012-01-10	2011-12-14 22:27:09.307757-05	2011-12-14 22:27:09.307757-05
26	26	9	\N		\N	2011-12-14 16:48:48.25506-05	2011-12-14 16:48:48.25506-05
28	18	2	25	ITC	2012-01-10	2011-12-13 17:04:47.540397-05	2011-12-13 17:04:47.540397-05
29	1	10	\N		\N	2011-12-13 23:27:41.123417-05	2011-12-13 23:27:41.123417-05
36	36	2	3		2012-01-31	2011-12-20 16:01:38.610761-05	2011-12-22 06:09:38.470656-05
38	39	2	43	SLLP1-SAS1B refolded complex	2012-01-27	2011-12-22 18:54:35.539935-05	2011-12-22 18:54:35.539984-05
30	19	9	8		2012-01-10	2011-12-13 17:06:10.155413-05	2011-12-29 12:04:39.028277-05
40	17	9	\N		\N	2012-01-03 15:41:27.612625-05	2012-01-03 15:42:25.765259-05
15	28	11	8		\N	2011-12-13 17:15:56.955852-05	2012-01-11 17:05:28.870834-05
16	16	11	\N		\N	2011-12-13 23:28:12.597874-05	2012-01-20 13:50:57.361059-05
5	11	8	\N		\N	2011-12-13 16:53:03.70984-05	2012-01-20 13:52:33.290778-05
25	5	8	\N		\N	2011-12-13 16:47:58.369834-05	2012-01-20 13:53:34.143202-05
37	37	2	5	interactive p-value plots	2012-02-29	2011-12-22 18:13:07.96775-05	2012-01-28 18:32:42.117455-05
12	22	1	\N		2012-01-20	2011-12-13 17:10:53.447264-05	2012-02-01 13:18:54.367654-05
46	4	1	\N		\N	2012-02-02 14:38:37.690356-05	2012-02-02 14:38:37.690441-05
7	15	11	25		\N	2011-12-13 17:00:25.358007-05	2012-02-02 15:21:28.119974-05
19	6	9	16	latest version has been sent to Wladek on Jan 16, 2012	\N	2011-12-13 16:48:17.707167-05	2012-02-07 16:09:19.91133-05
47	43	3	16		\N	2012-02-07 16:12:25.359675-05	2012-02-07 16:12:25.359739-05
21	14	9	\N		2012-02-07	2011-12-14 22:12:09.584711-05	2012-02-07 17:46:32.732532-05
33	7	9	26		2012-01-10	2011-12-13 16:49:36.636473-05	2012-02-13 12:14:07.183013-05
9	21	10	8		2012-01-10	2011-12-13 17:09:22.391297-05	2012-02-15 12:20:00.278591-05
17	29	11	\N		\N	2011-12-13 17:17:18.812891-05	2012-02-15 12:23:21.735996-05
32	35	5	3	expression systems data is being prepared	2012-02-22	2011-12-20 14:42:47.508944-05	2012-02-15 15:28:10.855458-05
2	8	2	9		2012-02-17	2011-12-13 16:50:24.97492-05	2012-02-15 15:31:56.196377-05
27	24	2	3	phylogenetic analysis	2012-02-25	2011-12-13 17:12:21.557272-05	2012-02-15 15:33:13.624111-05
\.


--
-- Data for Name: papers_referee; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_referee (id, firstname, lastname, email, department, organization) FROM stdin;
1	Steve	Almo	almo@aecom.yu.edu	Department of Biochemistry, Department of Physiology & Biophysics	Albert Einstein College of Medicine
2	Gaya	Amarasinghe	amarasin@iastate.edu	Dept. of Biochemistry, Biophysics & Molecular Biology	Iowa State University
3	Wayne	Anderson	wf-anderson@northwestern.edu	Dept of Molecular Pharmacology and Biological Chemistry	Northwestern University
4	Heimo	Breiteneder	Heimo.Breiteneder@meduniwien.ac.at	Department of Pathophysiology and Allergy Research, Center for Pathophysiology, Infectiology & Immun	Medical University of Vienna 
5	Tomasz	Cierpicki	tamaszc@med.umich.edu	Department of Pathology	University of Michigan Health Science System
6	Mirek	Cygler	mirek@bri.nrc.ca		National Research Council, Canada
7	Jolanta	Grembecka	jolantag@umich.edu	Department of Pathology	University of Michigan Health Science System
8	Pawel	Grochulski	Pawel.Grochulski@lightsource.ca	College of Pharmacy and Nutrition	Canadian Macromolecular Crystallography Facility and Canadian Light Source
9	Jack	Johnson	jackj@scripps.edu	Department of Molecular Biology	Scripps Research Institute
10	Adam	Godzik	adam@burnham.org	Bioinformatics and System Biology	Burncham Institute
11	Lukasz	Lebioda	lebioda@psc.sc.edu	Department of Chemistry and Biochemistry	University of South Carolina
12	Arun	Malhotra	malhotra@miami.edu	Department of Biochemistry & Molecular Biology	University of Miami School of Medicine
13	Mischa	Machius	machius@med.unc.edu	Center for Structural Biology	University of North Carolina
14	Jim	Spencer	Jim.Spencer@bristol.ac.uk	School of Cellular & Molecular Medicine	University of Bristol
15	Thomas	Terwilliger	terwilliger@lanl.gov		Los Alamos National Laboratory
16	Diana	Tomchick	diana.tomchick@utsouthwestern.edu	Department of Biochemistry	Southwestern Medical Center in Dallas
17	Brian	Sutton	brian.sutton@kcl.ac.uk	Randall Division of Cell and Molecular Biophysics	King's College London
18	Wayne	Thomas	wayne@ichr.uwa.edu.au	The Telethon Institute for Child Health Research	University of Western Australia
\.


--
-- Data for Name: papers_status; Type: TABLE DATA; Schema: public; Owner: matt_d
--

COPY papers_status (id, priority, status) FROM stdin;
2	2	data_being_prepared_by
3	2	text_being_updated_by
4	2	text_being_proofread_by
5	3	see_description
6	4	major_revision
7	4	minor_revision
8	4	waiting_for_review
1	1	waiting_for_wladek
9	0	waiting_for_wladek_to_submit
10	4	re-submitted_after_revisions
11	5	accepted
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: papers_absence_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_absence
    ADD CONSTRAINT papers_absence_pkey PRIMARY KEY (id);


--
-- Name: papers_absence_type_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_absence_type
    ADD CONSTRAINT papers_absence_type_pkey PRIMARY KEY (id);


--
-- Name: papers_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_attachment
    ADD CONSTRAINT papers_attachment_pkey PRIMARY KEY (id);


--
-- Name: papers_author_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_author
    ADD CONSTRAINT papers_author_pkey PRIMARY KEY (id);


--
-- Name: papers_contact_type_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_contact_type
    ADD CONSTRAINT papers_contact_type_pkey PRIMARY KEY (id);


--
-- Name: papers_frequency_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_frequency
    ADD CONSTRAINT papers_frequency_pkey PRIMARY KEY (id);


--
-- Name: papers_journal_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_journal
    ADD CONSTRAINT papers_journal_pkey PRIMARY KEY (id);


--
-- Name: papers_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_notification
    ADD CONSTRAINT papers_notification_pkey PRIMARY KEY (id);


--
-- Name: papers_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_publication
    ADD CONSTRAINT papers_publication_pkey PRIMARY KEY (id);


--
-- Name: papers_publication_referee_jcn_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_publication_referee_jcn
    ADD CONSTRAINT papers_publication_referee_jcn_pkey PRIMARY KEY (id);


--
-- Name: papers_publication_status_jcn_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_publication_status_jcn
    ADD CONSTRAINT papers_publication_status_jcn_pkey PRIMARY KEY (id);


--
-- Name: papers_referee_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_referee
    ADD CONSTRAINT papers_referee_pkey PRIMARY KEY (id);


--
-- Name: papers_status_pkey; Type: CONSTRAINT; Schema: public; Owner: matt_d; Tablespace: 
--

ALTER TABLE ONLY papers_status
    ADD CONSTRAINT papers_status_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: papers_absence_absence_type_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_absence_absence_type_id ON papers_absence USING btree (absence_type_id);


--
-- Name: papers_absence_contact_type_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_absence_contact_type_id ON papers_absence USING btree (contact_type_id);


--
-- Name: papers_absence_person_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_absence_person_id ON papers_absence USING btree (person_id);


--
-- Name: papers_absence_response_frequency_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_absence_response_frequency_id ON papers_absence USING btree (response_frequency_id);


--
-- Name: papers_attachment_author_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_attachment_author_id ON papers_attachment USING btree (author_id);


--
-- Name: papers_attachment_publication_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_attachment_publication_id ON papers_attachment USING btree (publication_id);


--
-- Name: papers_notification_pastdue_frequency_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_notification_pastdue_frequency_id ON papers_notification USING btree (pastdue_frequency_id);


--
-- Name: papers_notification_person_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_notification_person_id ON papers_notification USING btree (person_id);


--
-- Name: papers_notification_report_frequency_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_notification_report_frequency_id ON papers_notification USING btree (report_frequency_id);


--
-- Name: papers_publication_first_author_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_first_author_id ON papers_publication USING btree (first_author_id);


--
-- Name: papers_publication_referee_jcn_publication_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_referee_jcn_publication_id ON papers_publication_referee_jcn USING btree (publication_id);


--
-- Name: papers_publication_referee_jcn_referee_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_referee_jcn_referee_id ON papers_publication_referee_jcn USING btree (referee_id);


--
-- Name: papers_publication_second_author_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_second_author_id ON papers_publication USING btree (second_author_id);


--
-- Name: papers_publication_status_jcn_person_responsible_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_status_jcn_person_responsible_id ON papers_publication_status_jcn USING btree (person_responsible_id);


--
-- Name: papers_publication_status_jcn_publication_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_status_jcn_publication_id ON papers_publication_status_jcn USING btree (publication_id);


--
-- Name: papers_publication_status_jcn_status_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_status_jcn_status_id ON papers_publication_status_jcn USING btree (status_id);


--
-- Name: papers_publication_target_journal_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_target_journal_id ON papers_publication USING btree (target_journal_id);


--
-- Name: papers_publication_third_author_id; Type: INDEX; Schema: public; Owner: matt_d; Tablespace: 
--

CREATE INDEX papers_publication_third_author_id ON papers_publication USING btree (third_author_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_absence_absence_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_absence
    ADD CONSTRAINT papers_absence_absence_type_id_fkey FOREIGN KEY (absence_type_id) REFERENCES papers_absence_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_absence_contact_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_absence
    ADD CONSTRAINT papers_absence_contact_type_id_fkey FOREIGN KEY (contact_type_id) REFERENCES papers_contact_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_absence_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_absence
    ADD CONSTRAINT papers_absence_person_id_fkey FOREIGN KEY (person_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_absence_response_frequency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_absence
    ADD CONSTRAINT papers_absence_response_frequency_id_fkey FOREIGN KEY (response_frequency_id) REFERENCES papers_frequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_attachment_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_attachment
    ADD CONSTRAINT papers_attachment_author_id_fkey FOREIGN KEY (author_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_attachment_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_attachment
    ADD CONSTRAINT papers_attachment_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES papers_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_notification_pastdue_frequency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_notification
    ADD CONSTRAINT papers_notification_pastdue_frequency_id_fkey FOREIGN KEY (pastdue_frequency_id) REFERENCES papers_frequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_notification_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_notification
    ADD CONSTRAINT papers_notification_person_id_fkey FOREIGN KEY (person_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_notification_report_frequency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_notification
    ADD CONSTRAINT papers_notification_report_frequency_id_fkey FOREIGN KEY (report_frequency_id) REFERENCES papers_frequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_first_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication
    ADD CONSTRAINT papers_publication_first_author_id_fkey FOREIGN KEY (first_author_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_referee_jcn_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_referee_jcn
    ADD CONSTRAINT papers_publication_referee_jcn_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES papers_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_referee_jcn_referee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_referee_jcn
    ADD CONSTRAINT papers_publication_referee_jcn_referee_id_fkey FOREIGN KEY (referee_id) REFERENCES papers_referee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_second_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication
    ADD CONSTRAINT papers_publication_second_author_id_fkey FOREIGN KEY (second_author_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_status_jcn_person_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_status_jcn
    ADD CONSTRAINT papers_publication_status_jcn_person_responsible_id_fkey FOREIGN KEY (person_responsible_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_status_jcn_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_status_jcn
    ADD CONSTRAINT papers_publication_status_jcn_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES papers_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_status_jcn_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication_status_jcn
    ADD CONSTRAINT papers_publication_status_jcn_status_id_fkey FOREIGN KEY (status_id) REFERENCES papers_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_target_journal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication
    ADD CONSTRAINT papers_publication_target_journal_id_fkey FOREIGN KEY (target_journal_id) REFERENCES papers_journal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: papers_publication_third_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY papers_publication
    ADD CONSTRAINT papers_publication_third_author_id_fkey FOREIGN KEY (third_author_id) REFERENCES papers_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7ceef80f; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_7ceef80f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_dfbab7d; Type: FK CONSTRAINT; Schema: public; Owner: matt_d
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_dfbab7d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

