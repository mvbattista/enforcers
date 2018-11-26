--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.4

-- Started on 2018-09-08 20:48:23 EDT
BEGIN;

--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 198 (class 1259 OID 16390)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16393)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16398)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 202 (class 1259 OID 16400)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16403)
-- Name: chronocard_checkin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_checkin (
    id integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone,
    event_user_id integer NOT NULL
);


ALTER TABLE public.chronocard_checkin OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16406)
-- Name: chronocard_checkin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_checkin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_checkin_id_seq OWNER TO postgres;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 204
-- Name: chronocard_checkin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_checkin_id_seq OWNED BY public.chronocard_checkin.id;


--
-- TOC entry 205 (class 1259 OID 16408)
-- Name: chronocard_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_event (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    work_start_date date NOT NULL,
    work_end_date date NOT NULL,
    time_zone character varying(63) NOT NULL
);


ALTER TABLE public.chronocard_event OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16411)
-- Name: chronocard_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_event_id_seq OWNER TO postgres;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 206
-- Name: chronocard_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_event_id_seq OWNED BY public.chronocard_event.id;


--
-- TOC entry 207 (class 1259 OID 16413)
-- Name: chronocard_eventshift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_eventshift (
    id integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    event_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.chronocard_eventshift OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16416)
-- Name: chronocard_eventshift_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_eventshift_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_eventshift_id_seq OWNER TO postgres;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 208
-- Name: chronocard_eventshift_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_eventshift_id_seq OWNED BY public.chronocard_eventshift.id;


--
-- TOC entry 209 (class 1259 OID 16418)
-- Name: chronocard_eventuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_eventuser (
    id integer NOT NULL,
    badge_id character varying(16),
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.chronocard_eventuser OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16421)
-- Name: chronocard_eventuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_eventuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_eventuser_id_seq OWNER TO postgres;

--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 210
-- Name: chronocard_eventuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_eventuser_id_seq OWNED BY public.chronocard_eventuser.id;


--
-- TOC entry 211 (class 1259 OID 16423)
-- Name: chronocard_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_location (
    id integer NOT NULL,
    description character varying(64) NOT NULL,
    location character varying(64) NOT NULL,
    instruction text NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.chronocard_location OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16429)
-- Name: chronocard_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_location_id_seq OWNER TO postgres;

--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 212
-- Name: chronocard_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_location_id_seq OWNED BY public.chronocard_location.id;


--
-- TOC entry 213 (class 1259 OID 16431)
-- Name: chronocard_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    handle character varying(30) NOT NULL
);


ALTER TABLE public.chronocard_user OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16437)
-- Name: chronocard_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.chronocard_user_groups OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16440)
-- Name: chronocard_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 215
-- Name: chronocard_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_user_groups_id_seq OWNED BY public.chronocard_user_groups.id;


--
-- TOC entry 216 (class 1259 OID 16442)
-- Name: chronocard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_user_id_seq OWNER TO postgres;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 216
-- Name: chronocard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_user_id_seq OWNED BY public.chronocard_user.id;


--
-- TOC entry 217 (class 1259 OID 16444)
-- Name: chronocard_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chronocard_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.chronocard_user_user_permissions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16447)
-- Name: chronocard_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chronocard_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chronocard_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 218
-- Name: chronocard_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chronocard_user_user_permissions_id_seq OWNED BY public.chronocard_user_user_permissions.id;


--
-- TOC entry 219 (class 1259 OID 16449)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16456)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 221 (class 1259 OID 16458)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16461)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 223 (class 1259 OID 16463)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16469)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 225 (class 1259 OID 16471)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2816 (class 2604 OID 16477)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2817 (class 2604 OID 16478)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 16479)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2819 (class 2604 OID 16480)
-- Name: chronocard_checkin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_checkin ALTER COLUMN id SET DEFAULT nextval('public.chronocard_checkin_id_seq'::regclass);


--
-- TOC entry 2820 (class 2604 OID 16481)
-- Name: chronocard_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_event ALTER COLUMN id SET DEFAULT nextval('public.chronocard_event_id_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 16482)
-- Name: chronocard_eventshift id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventshift ALTER COLUMN id SET DEFAULT nextval('public.chronocard_eventshift_id_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 16483)
-- Name: chronocard_eventuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventuser ALTER COLUMN id SET DEFAULT nextval('public.chronocard_eventuser_id_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 16484)
-- Name: chronocard_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_location ALTER COLUMN id SET DEFAULT nextval('public.chronocard_location_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 16485)
-- Name: chronocard_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user ALTER COLUMN id SET DEFAULT nextval('public.chronocard_user_id_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 16486)
-- Name: chronocard_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_groups ALTER COLUMN id SET DEFAULT nextval('public.chronocard_user_groups_id_seq'::regclass);


--
-- TOC entry 2826 (class 2604 OID 16487)
-- Name: chronocard_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.chronocard_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 16488)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2829 (class 2604 OID 16489)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 16490)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3038 (class 0 OID 16385)
-- Dependencies: 196
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	deputies
\.


--
-- TOC entry 3040 (class 0 OID 16390)
-- Dependencies: 198
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	42
2	1	44
3	1	32
4	1	29
5	1	30
6	1	31
\.


--
-- TOC entry 3042 (class 0 OID 16395)
-- Dependencies: 200
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add checkin	8	add_checkin
30	Can change checkin	8	change_checkin
31	Can delete checkin	8	delete_checkin
32	Can view checkin	8	view_checkin
33	Can add event	9	add_event
34	Can change event	9	change_event
35	Can delete event	9	delete_event
36	Can view event	9	view_event
37	Can add event shift	10	add_eventshift
38	Can change event shift	10	change_eventshift
39	Can delete event shift	10	delete_eventshift
40	Can view event shift	10	view_eventshift
41	Can add event user	11	add_eventuser
42	Can change event user	11	change_eventuser
43	Can delete event user	11	delete_eventuser
44	Can view event user	11	view_eventuser
45	Can add location	12	add_location
46	Can change location	12	change_location
47	Can delete location	12	delete_location
48	Can view location	12	view_location
\.


--
-- TOC entry 3044 (class 0 OID 16400)
-- Dependencies: 202
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
a1cb2d7ed16af0ea946484160426fe89f88a81e3	2018-08-16 18:48:29.590702+00	1
\.


--
-- TOC entry 3045 (class 0 OID 16403)
-- Dependencies: 203
-- Data for Name: chronocard_checkin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_checkin (id, start_date, end_date, event_user_id) FROM stdin;
1	2018-08-30 21:38:39+00	2018-08-31 02:45:11+00	55
2	2018-08-31 14:45:34+00	2018-08-31 20:52:49+00	55
3	2018-09-01 14:46:51+00	2018-09-01 21:05:05+00	55
6	2018-09-01 15:00:38+00	2018-09-01 20:30:00+00	27
5	2018-08-31 14:45:38+00	2018-08-31 20:40:00+00	27
7	2018-08-31 14:15:51+00	2018-08-31 19:45:00+00	8
8	2018-09-01 14:30:00+00	2018-09-01 20:30:00+00	8
9	2018-08-31 15:00:00+00	2018-08-31 20:30:00+00	6
10	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	6
11	2018-08-31 14:30:00+00	2018-08-31 20:10:00+00	9
12	2018-09-01 15:10:00+00	2018-09-01 20:30:00+00	9
13	2018-08-31 14:15:00+00	2018-08-31 20:10:00+00	10
14	2018-09-01 15:00:00+00	2018-09-01 20:30:00+00	10
15	2018-08-31 19:55:00+00	2018-09-01 01:30:00+00	14
16	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	14
17	2018-09-01 00:45:00+00	2018-09-01 05:30:00+00	15
18	2018-09-02 00:45:00+00	2018-09-02 05:30:00+00	15
19	2018-09-01 01:00:00+00	2018-09-01 05:30:00+00	17
20	2018-08-31 19:50:00+00	2018-09-01 01:30:00+00	18
21	2018-09-01 19:30:00+00	2018-09-02 01:30:00+00	18
22	2018-08-31 19:57:00+00	2018-09-01 01:30:00+00	19
23	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	19
24	2018-08-31 15:10:00+00	2018-08-31 20:40:00+00	34
25	2018-09-01 15:00:00+00	2018-09-01 20:30:00+00	34
26	2018-08-31 14:45:00+00	2018-08-31 20:10:00+00	35
27	2018-08-31 14:50:00+00	2018-08-31 20:10:00+00	36
28	2018-09-01 15:00:00+00	2018-09-01 20:30:00+00	36
29	2018-08-31 22:20:00+00	2018-09-01 05:30:00+00	39
30	2018-09-02 00:10:00+00	2018-09-02 05:30:00+00	39
31	2018-09-02 00:55:00+00	2018-09-02 05:30:00+00	44
32	2018-09-01 00:30:00+00	2018-09-01 05:30:00+00	45
33	2018-09-02 00:45:00+00	2018-09-02 05:30:00+00	45
34	2018-09-01 01:07:00+00	2018-09-01 05:30:00+00	50
35	2018-09-02 00:50:00+00	2018-09-02 05:30:00+00	50
36	2018-08-31 14:00:00+00	2018-08-31 20:30:00+00	47
37	2018-09-02 14:30:00+00	2018-09-02 21:00:00+00	55
38	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	38
39	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	11
40	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	28
41	2018-08-31 15:00:00+00	2018-08-31 20:30:00+00	31
42	2018-08-31 15:00:00+00	2018-08-31 20:30:00+00	25
43	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	37
44	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	1
45	2018-08-31 14:30:00+00	2018-08-31 20:45:00+00	54
46	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	2
47	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	43
48	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	40
49	2018-08-31 14:30:00+00	2018-08-31 20:30:00+00	4
50	2018-08-31 15:00:00+00	2018-08-31 20:30:00+00	32
51	2018-08-31 15:00:00+00	2018-08-31 20:00:00+00	20
52	2018-08-31 19:30:00+00	2018-09-01 01:45:00+00	3
53	2018-08-31 20:00:00+00	2018-09-01 02:15:00+00	51
54	2018-08-31 20:00:00+00	2018-09-01 02:15:00+00	5
55	2018-08-31 20:45:00+00	2018-09-01 04:00:00+00	12
56	2018-08-31 20:00:00+00	2018-09-01 01:30:00+00	41
57	2018-08-31 19:50:00+00	2018-09-01 01:30:00+00	48
58	2018-08-31 19:50:00+00	2018-09-01 02:00:00+00	13
59	2018-08-31 19:50:00+00	2018-09-01 02:00:00+00	33
60	2018-08-31 19:50:00+00	2018-09-01 01:30:00+00	7
61	2018-08-31 19:45:00+00	2018-09-01 04:30:00+00	30
62	2018-08-31 22:00:00+00	2018-09-01 04:30:00+00	42
63	2018-08-31 22:00:00+00	2018-09-01 04:30:00+00	23
64	2018-08-31 23:00:00+00	2018-09-01 04:30:00+00	29
65	2018-08-31 23:00:00+00	2018-09-01 04:30:00+00	24
66	2018-08-31 23:00:00+00	2018-09-01 04:30:00+00	44
67	2018-09-01 15:30:00+00	2018-09-01 20:30:00+00	38
68	2018-09-01 15:00:00+00	2018-09-01 20:30:00+00	11
69	2018-09-01 16:30:00+00	2018-09-01 20:50:00+00	54
70	2018-09-01 16:00:00+00	2018-09-01 20:30:00+00	28
71	2018-09-01 15:30:00+00	2018-09-01 20:30:00+00	31
72	2018-09-01 16:00:00+00	2018-09-01 20:30:00+00	25
73	2018-09-01 15:30:00+00	2018-09-01 20:30:00+00	37
74	2018-09-01 15:30:00+00	2018-09-01 20:30:00+00	1
75	2018-09-01 15:00:00+00	2018-09-01 20:30:00+00	2
76	2018-09-01 15:30:00+00	2018-09-01 20:30:00+00	43
77	2018-09-01 15:30:00+00	2018-09-01 20:30:00+00	40
78	2018-09-01 16:00:00+00	2018-09-01 20:30:00+00	4
79	2018-09-01 16:00:00+00	2018-09-01 20:30:00+00	32
80	2018-09-01 16:00:00+00	2018-09-01 20:30:00+00	20
81	2018-09-01 19:40:00+00	2018-09-02 01:30:00+00	3
82	2018-09-01 20:10:00+00	2018-09-02 02:45:00+00	51
83	2018-09-01 20:10:00+00	2018-09-02 02:45:00+00	5
84	2018-09-01 20:00:00+00	2018-09-02 04:15:00+00	12
85	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	41
86	2018-09-01 20:10:00+00	2018-09-02 01:30:00+00	16
87	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	48
88	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	13
89	2018-09-01 20:10:00+00	2018-09-02 04:00:00+00	53
90	2018-09-01 20:00:00+00	2018-09-02 01:30:00+00	33
91	2018-09-01 19:40:00+00	2018-09-02 01:30:00+00	7
92	2018-09-01 20:00:00+00	2018-09-02 02:30:00+00	30
93	2018-09-01 22:45:00+00	2018-09-02 04:30:00+00	42
94	2018-09-01 22:55:00+00	2018-09-02 04:30:00+00	24
95	2018-09-01 22:55:00+00	2018-09-02 04:30:00+00	23
96	2018-09-01 22:50:00+00	2018-09-02 04:30:00+00	29
97	2018-09-02 14:30:00+00	2018-09-02 20:30:00+00	38
98	2018-09-02 15:00:00+00	2018-09-02 20:00:00+00	11
99	2018-09-02 16:30:00+00	2018-09-02 20:30:00+00	31
100	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	25
101	2018-09-02 15:30:00+00	2018-09-02 20:30:00+00	37
102	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	54
103	2018-09-02 15:30:00+00	2018-09-02 20:30:00+00	2
104	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	43
105	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	40
106	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	4
107	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	32
108	2018-09-02 16:00:00+00	2018-09-02 20:30:00+00	20
109	2018-09-03 14:27:33+00	2018-09-03 20:51:35+00	55
110	2018-09-02 19:53:00+00	2018-09-03 01:30:00+00	3
111	2018-09-02 19:15:00+00	2018-09-03 02:00:00+00	51
112	2018-09-02 19:15:00+00	2018-09-03 02:00:00+00	5
113	2018-09-02 20:00:00+00	2018-09-03 01:30:00+00	12
114	2018-09-02 20:00:00+00	2018-09-03 01:30:00+00	41
115	2018-09-02 20:10:00+00	2018-09-03 01:30:00+00	16
116	2018-09-02 20:20:00+00	2018-09-03 01:30:00+00	28
117	2018-09-02 19:45:00+00	2018-09-03 01:30:00+00	13
118	2018-09-02 19:53:00+00	2018-09-03 01:30:00+00	33
119	2018-09-02 19:40:00+00	2018-09-03 01:30:00+00	7
120	2018-09-02 20:00:00+00	2018-09-03 04:00:00+00	30
121	2018-09-02 22:55:00+00	2018-09-03 04:30:00+00	42
122	2018-09-02 22:55:00+00	2018-09-03 04:30:00+00	24
123	2018-09-02 21:45:00+00	2018-09-03 04:30:00+00	23
124	2018-09-02 23:00:00+00	2018-09-03 04:30:00+00	29
125	2018-09-02 23:00:00+00	2018-09-03 04:30:00+00	44
126	2018-09-03 15:30:00+00	2018-09-03 20:30:00+00	38
127	2018-09-03 15:30:00+00	2018-09-03 20:30:00+00	11
128	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	28
129	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	31
130	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	25
131	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	37
132	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	1
133	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	54
134	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	2
135	2018-09-03 16:10:00+00	2018-09-03 20:30:00+00	43
136	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	40
137	2018-09-03 16:00:00+00	2018-09-03 20:30:00+00	4
139	2018-09-03 16:15:00+00	2018-09-03 20:30:00+00	20
138	2018-09-03 16:15:00+00	2018-09-03 20:30:00+00	32
141	2018-09-02 14:30:00+00	2018-09-02 17:30:00+00	8
142	2018-09-02 14:45:00+00	2018-09-02 20:30:00+00	36
143	2018-09-02 14:30:00+00	2018-09-02 20:30:00+00	47
144	2018-09-02 14:45:00+00	2018-09-02 20:30:00+00	10
145	2018-09-02 14:45:00+00	2018-09-02 20:30:00+00	34
146	2018-09-02 15:00:00+00	2018-09-02 20:30:00+00	27
147	2018-09-02 15:30:00+00	2018-09-02 20:30:00+00	6
148	2018-09-02 15:15:00+00	2018-09-02 20:30:00+00	9
149	2018-09-02 19:50:00+00	2018-09-03 01:30:00+00	19
150	2018-09-02 19:50:00+00	2018-09-03 01:30:00+00	18
151	2018-09-02 19:50:00+00	2018-09-03 01:30:00+00	46
152	2018-09-02 20:10:00+00	2018-09-03 01:30:00+00	53
153	2018-09-02 19:55:00+00	2018-09-03 01:30:00+00	39
154	2018-09-03 00:53:00+00	2018-09-03 05:30:00+00	15
155	2018-09-03 00:50:00+00	2018-09-03 05:30:00+00	17
156	2018-09-03 00:57:00+00	2018-09-03 05:30:00+00	50
157	2018-09-03 14:30:00+00	2018-09-03 20:30:00+00	8
158	2018-09-03 15:00:00+00	2018-09-03 20:30:00+00	36
159	2018-09-03 14:30:00+00	2018-09-03 20:30:00+00	47
160	2018-09-03 14:30:00+00	2018-09-03 20:30:00+00	10
161	2018-09-03 14:30:00+00	2018-09-03 20:30:00+00	34
162	2018-09-03 15:00:00+00	2018-09-03 20:30:00+00	27
163	2018-09-03 15:00:00+00	2018-09-03 20:30:00+00	6
164	2018-09-03 15:00:00+00	2018-09-03 20:30:00+00	9
166	2018-09-03 19:30:00+00	2018-09-04 04:33:54+00	51
167	2018-08-30 17:00:00+00	2018-08-30 20:00:00+00	51
168	2018-08-30 21:00:00+00	2018-08-31 03:30:00+00	51
169	2018-08-31 05:00:00+00	2018-08-31 06:00:00+00	51
170	2018-08-30 17:00:00+00	2018-08-30 20:00:00+00	5
171	2018-08-30 21:00:00+00	2018-08-31 03:30:00+00	5
172	2018-08-31 05:00:00+00	2018-08-31 06:00:00+00	5
173	2018-09-03 19:30:00+00	2018-09-04 04:38:22+00	5
140	2018-09-03 22:15:00+00	2018-09-04 04:42:54+00	23
165	2018-09-04 01:00:00+00	2018-09-04 04:44:27+00	55
\.


--
-- TOC entry 3047 (class 0 OID 16408)
-- Dependencies: 205
-- Data for Name: chronocard_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_event (id, name, start_date, end_date, work_start_date, work_end_date, time_zone) FROM stdin;
1	PAX West 2018	2018-08-31	2018-09-03	2018-08-28	2018-09-04	America/Los_Angeles
\.


--
-- TOC entry 3049 (class 0 OID 16413)
-- Dependencies: 207
-- Data for Name: chronocard_eventshift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_eventshift (id, start_date, end_date, event_id, location_id) FROM stdin;
1	2018-08-31 15:00:00+00	2018-08-31 20:30:00+00	1	1
2	2018-08-31 20:00:00+00	2018-09-01 01:30:00+00	1	1
3	2018-09-01 01:00:00+00	2018-09-01 05:30:00+00	1	1
\.


--
-- TOC entry 3051 (class 0 OID 16418)
-- Dependencies: 209
-- Data for Name: chronocard_eventuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_eventuser (id, badge_id, event_id, user_id) FROM stdin;
1	\N	1	4
2	\N	1	5
3	\N	1	6
4	\N	1	7
7	\N	1	10
11	\N	1	14
12	\N	1	15
13	\N	1	16
16	\N	1	19
20	\N	1	23
21	\N	1	24
22	\N	1	25
24	\N	1	27
25	\N	1	28
26	\N	1	29
28	\N	1	31
29	\N	1	32
30	\N	1	33
31	\N	1	34
32	\N	1	35
33	\N	1	36
37	\N	1	40
38	\N	1	41
40	\N	1	43
41	\N	1	44
42	\N	1	45
43	\N	1	46
46	\N	1	49
48	\N	1	51
49	\N	1	52
52	\N	1	55
53	\N	1	56
54	\N	1	57
27	\N	1	30
8	\N	1	11
6	\N	1	9
9	\N	1	12
10	\N	1	13
14	\N	1	17
15	\N	1	18
17	\N	1	20
18	\N	1	21
19	\N	1	22
34	\N	1	37
35	\N	1	38
36	\N	1	39
39	\N	1	42
44	\N	1	47
45	\N	1	48
50	\N	1	53
47	\N	1	50
51	\N	1	54
5	\N	1	8
23	\N	1	26
55	\N	1	1
\.


--
-- TOC entry 3053 (class 0 OID 16423)
-- Dependencies: 211
-- Data for Name: chronocard_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_location (id, description, location, instruction, event_id) FROM stdin;
1	Merch Lite	Sheraton	Run the Merch Store	1
2	Merch Booth	WSCC	Run the Merch Booth	1
\.


--
-- TOC entry 3055 (class 0 OID 16431)
-- Dependencies: 213
-- Data for Name: chronocard_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, handle) FROM stdin;
29	pbkdf2_sha256$120000$ZjaesRP4HH1o$pLPuIThiDLoXqPmOKJkNbdd8Jkxd03Q3GIKgAjcjCys=	\N	f	LightShadow	Evan	Gee		t	t	2018-08-26 02:00:58.438276+00	LightShadow
55	pbkdf2_sha256$120000$XeNpJnInoMpu$VHckzjP37lBEKGzLbjnu2RFKTMu/NLSB55sLx3ieff8=	\N	f	VeryBlueTardis	Heather	Sewell		t	t	2018-08-26 02:01:05.534453+00	VeryBlueTardis
58	pbkdf2_sha256$120000$fDulWbtqHWSk$kQYXFi4KFApBrHo0khgvGqEt60jd6wQw71utEZKWc88=	\N	f	Leggs				f	t	2018-09-02 19:02:34.052664+00	Leggs
2	pbkdf2_sha256$120000$oCCIkADFwq9g$xEXKH1ht9tfBmGrQkVSmmc9Z80yzVtyAY6MJq1Ld/WU=	2018-08-16 20:38:14.099252+00	t	lids	Lidija	Piper	merch@penny-arcade.com	t	t	2018-08-16 18:08:54.61484+00	Lids
3	pbkdf2_sha256$120000$iHxuFiW2lAXl$4ErlOoNPWg0TaTXgAwfAk3FTbgBC61/JceCG7pFd89c=	\N	f	Enforcer				f	t	2018-08-17 23:42:36.178635+00	Enforcer
4		\N	f	Admiral_Frijoles	Jason	Gagner		f	t	2018-08-26 02:00:49.83542+00	Admiral Frijoles
5		\N	f	Belphegorite				f	t	2018-08-26 02:00:50.367766+00	Belphegorite
6		\N	f	Blue_Shell	Riley	Brunett		f	t	2018-08-26 02:00:50.659509+00	Blue Shell
7		\N	f	Brucifer6				f	t	2018-08-26 02:00:50.984535+00	Brucifer6
8		\N	f	CaptainNorska	Kendra	Swafford		f	t	2018-08-26 02:00:51.26921+00	CaptainNorska
9		\N	f	chikapu	Alisha	Morris		f	t	2018-08-26 02:00:51.549043+00	chikapu
10		\N	f	christyannalou				f	t	2018-08-26 02:00:51.87647+00	christyannalou
11		\N	f	Coldie	Hadden	Hoppert		f	t	2018-08-26 02:00:52.124348+00	Coldie
12		\N	f	Cybit	Krupal	Desai		f	t	2018-08-26 02:00:52.426173+00	Cybit
13		\N	f	Cyordon	Riley	C		f	t	2018-08-26 02:00:52.800631+00	Cyordon
14		\N	f	D0rk	Donnie			f	t	2018-08-26 02:00:53.11351+00	D0rk
15		\N	f	d20specialist				f	t	2018-08-26 02:00:53.473316+00	d20specialist
16		\N	f	DoctorWho	William	Ho		f	t	2018-08-26 02:00:53.821637+00	DoctorWho
17		\N	f	Dog_Welder	Geoff			f	t	2018-08-26 02:00:54.41978+00	Dog Welder
18		\N	f	DrGrumblesPhD	Zachary	Logsdon		f	t	2018-08-26 02:00:54.894074+00	DrGrumblesPhD
19		\N	f	EveningAngel	Steven	Angel		f	t	2018-08-26 02:00:55.217358+00	EveningAngel
21		\N	f	FinnFishFinn				f	t	2018-08-26 02:00:55.847269+00	FinnFishFinn
22		\N	f	Gagamba				f	t	2018-08-26 02:00:56.23081+00	Gagamba
23		\N	f	GreGor2424				f	t	2018-08-26 02:00:56.586549+00	GreGor2424
26		\N	f	JDFowler	Andrew	Fowler		f	t	2018-08-26 02:00:57.454263+00	JDFowler
27		\N	f	KOKO				f	t	2018-08-26 02:00:57.833475+00	KOKO
28		\N	f	ldottxt	L			f	t	2018-08-26 02:00:58.132997+00	ldottxt
30		\N	f	Marbles	Debbie	Terman		f	t	2018-08-26 02:00:58.718003+00	Marbles
31		\N	f	MayWest	May	Westerback		f	t	2018-08-26 02:00:58.976532+00	MayWest
32		\N	f	MegaMit				f	t	2018-08-26 02:00:59.23898+00	MegaMit
33		\N	f	MicrowaveKane	Dave	Kane		f	t	2018-08-26 02:00:59.494896+00	MicrowaveKane
34		\N	f	MissKerrigan	Eli	Moroney		f	t	2018-08-26 02:00:59.765513+00	MissKerrigan
35		\N	f	MooseLord				f	t	2018-08-26 02:01:00.015393+00	MooseLord
36		\N	f	Mooz	Marie	Umetsu		f	t	2018-08-26 02:01:00.304894+00	Mooz
37		\N	f	NomadRaven	Melodie	Hardwick		f	t	2018-08-26 02:01:00.570631+00	NomadRaven
38		\N	f	Nyankokimi	Kim	Kaboodle		f	t	2018-08-26 02:01:00.877376+00	Nyankokimi
39		\N	f	OtakuSociety_US				f	t	2018-08-26 02:01:01.133832+00	OtakuSociety_US
40		\N	f	Pennychaser	Heather			f	t	2018-08-26 02:01:01.410411+00	Pennychaser
41		\N	f	Pilotte	Kristin			f	t	2018-08-26 02:01:01.666497+00	Pilotte
42		\N	f	Punzie				f	t	2018-08-26 02:01:01.917298+00	Punzie
43		\N	f	PyratQueen	Tamie	Kahler		f	t	2018-08-26 02:01:02.16688+00	PyratQueen
44		\N	f	Rayze	Rebecca	Burday		f	t	2018-08-26 02:01:02.430814+00	Rayze
45		\N	f	Redders				f	t	2018-08-26 02:01:02.695059+00	Redders
46		\N	f	RGB	Gail	Terman		f	t	2018-08-26 02:01:02.987763+00	RGB
47		\N	f	ROYGBIV				f	t	2018-08-26 02:01:03.265802+00	ROYGBIV
48		\N	f	Shumway				f	t	2018-08-26 02:01:03.533541+00	Shumway
49		\N	f	Sin	Sin	Sam		f	t	2018-08-26 02:01:03.815853+00	Sin
50		\N	f	Siouxzn	Susan	Welland		f	t	2018-08-26 02:01:04.069169+00	Siouxzn
51		\N	f	Smashley	Ashley			f	t	2018-08-26 02:01:04.374505+00	Smashley
53		\N	f	TheRagingWill				f	t	2018-08-26 02:01:04.989273+00	TheRagingWill
54		\N	f	Valoo	Sean	Moore		f	t	2018-08-26 02:01:05.265918+00	Valoo
56		\N	f	Wakibara				f	t	2018-08-26 02:01:05.847012+00	Wakibara
57		\N	f	Xierroh				f	t	2018-08-26 02:01:06.150343+00	Xierroh
52	pbkdf2_sha256$120000$9VNliVfUT6jS$dR5l5nX/ka90eqOmaOMvJwIl+nePrcnyIuFac+Xr2Z8=	2018-08-27 17:40:49.94549+00	f	Sparkles	Meredith	Morehouse		t	t	2018-08-26 02:01:04.701508+00	Sparkles
1	pbkdf2_sha256$120000$fP3Bfw5uEmFX$z3CCCRxoQa499BfOxkT5j6SCDvsE14nAYE4pWb1Af50=	2018-08-31 14:44:08.68576+00	t	admin	Michael	Battista	michael.v.battista@gmail.com	t	t	2018-08-16 18:01:44.418002+00	Batt-Man
20	pbkdf2_sha256$120000$2Xrc1hI6OQAS$JvHOpFtqrr1dHJ5lQEuXiEnYNVpb0bjah9OWwxqBQQ8=	\N	f	Evenstar				t	t	2018-08-26 02:00:55.523124+00	Evenstar
24	pbkdf2_sha256$120000$6f9cTZlbBFDM$86f/A+3wvG9nVT1KhmneHoXXgTMh0bT8gnCW11JrLNI=	\N	f	Gresh	Richard	Gresh		t	t	2018-08-26 02:00:56.873616+00	Gresh
25	pbkdf2_sha256$120000$ue6ulF0OBgN5$BCg7c5uSfMRasc12j8GVlAjYrB9JqLGqKeYny8tX5Eo=	\N	f	Happendy	Johnny	Le		t	t	2018-08-26 02:00:57.168535+00	Happendy
\.


--
-- TOC entry 3056 (class 0 OID 16437)
-- Dependencies: 214
-- Data for Name: chronocard_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_user_groups (id, user_id, group_id) FROM stdin;
2	52	1
3	25	1
4	24	1
5	29	1
6	20	1
7	55	1
\.


--
-- TOC entry 3059 (class 0 OID 16444)
-- Dependencies: 217
-- Data for Name: chronocard_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chronocard_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 16449)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-08-16 18:10:58.711656+00	1	PAX West 2018 (2018-08-31 - 2018-09-03)	1	[{"added": {}}]	9	1
2	2018-08-16 18:11:22.795704+00	1	admin	2	[{"changed": {"fields": ["first_name", "last_name", "handle"]}}]	7	1
3	2018-08-16 18:11:45.412594+00	2	lids	2	[{"changed": {"fields": ["first_name", "last_name", "handle"]}}]	7	1
4	2018-08-16 18:12:50.384214+00	1	Location object (1)	1	[{"added": {}}]	12	1
5	2018-08-16 18:13:10.152773+00	2	Location object (2)	1	[{"added": {}}]	12	1
6	2018-08-16 18:48:29.592601+00	a1cb2d7ed16af0ea946484160426fe89f88a81e3	a1cb2d7ed16af0ea946484160426fe89f88a81e3	1	[{"added": {}}]	6	1
7	2018-08-17 23:34:09.650975+00	1	EventShift object (1)	1	[{"added": {}}]	10	2
8	2018-08-17 23:35:15.971372+00	2	EventShift object (2)	1	[{"added": {}}]	10	2
9	2018-08-17 23:36:01.930866+00	3	EventShift object (3)	1	[{"added": {}}]	10	2
10	2018-08-17 23:42:36.663837+00	3	Enforcer	1	[{"added": {}}]	7	2
11	2018-08-17 23:43:00.704235+00	3	Enforcer	2	[]	7	2
12	2018-08-17 23:43:20.344124+00	3	Enforcer	2	[{"changed": {"fields": ["handle"]}}]	7	2
13	2018-08-26 02:02:33.10889+00	55	EventUser object (55)	1	[{"added": {}}]	11	1
14	2018-08-26 02:11:30.345893+00	20	Evenstar	2	[{"changed": {"fields": ["groups"]}}]	7	1
15	2018-08-26 02:13:21.494848+00	52	Sparkles	2	[{"changed": {"fields": ["groups"]}}]	7	1
16	2018-08-26 02:13:46.184721+00	25	Happendy	2	[{"changed": {"fields": ["groups"]}}]	7	1
17	2018-08-26 02:15:55.00377+00	24	Gresh	2	[{"changed": {"fields": ["groups"]}}]	7	1
18	2018-08-26 02:18:47.536227+00	20	Evenstar	2	[{"changed": {"fields": ["groups"]}}]	7	1
19	2018-08-26 02:19:12.758094+00	29	LightShadow	2	[{"changed": {"fields": ["groups"]}}]	7	1
20	2018-08-26 02:19:43.172405+00	20	Evenstar	2	[{"changed": {"fields": ["groups"]}}]	7	1
21	2018-08-26 02:20:20.79777+00	55	VeryBlueTardis	2	[{"changed": {"fields": ["groups"]}}]	7	1
22	2018-08-27 17:06:42.553885+00	52	Sparkles	2	[{"changed": {"fields": ["is_staff"]}}]	7	1
23	2018-08-27 17:07:28.987255+00	20	Evenstar	2	[{"changed": {"fields": ["is_staff"]}}]	7	1
24	2018-08-27 17:07:39.708493+00	24	Gresh	2	[{"changed": {"fields": ["is_staff"]}}]	7	1
25	2018-08-27 17:07:44.215265+00	25	Happendy	2	[{"changed": {"fields": ["is_staff"]}}]	7	1
26	2018-08-27 17:07:50.162298+00	29	LightShadow	2	[{"changed": {"fields": ["is_staff"]}}]	7	1
27	2018-08-27 17:07:58.121617+00	55	VeryBlueTardis	2	[{"changed": {"fields": ["is_staff"]}}]	7	1
28	2018-08-27 17:08:13.971289+00	55	VeryBlueTardis	2	[{"changed": {"fields": ["first_name"]}}]	7	1
29	2018-08-27 17:15:52.175402+00	52	Sparkles	2	[{"changed": {"fields": ["email"]}}]	7	1
30	2018-08-27 17:16:03.626953+00	52	Sparkles	2	[{"changed": {"fields": ["email"]}}]	7	1
31	2018-08-27 17:19:35.336779+00	52	Sparkles	2	[{"changed": {"fields": ["password"]}}]	7	1
32	2018-08-27 17:23:04.411033+00	20	Evenstar	2	[{"changed": {"fields": ["password"]}}]	7	1
33	2018-08-27 17:23:30.829464+00	24	Gresh	2	[{"changed": {"fields": ["password"]}}]	7	1
34	2018-08-27 17:23:41.434568+00	25	Happendy	2	[{"changed": {"fields": ["password"]}}]	7	1
35	2018-08-27 17:23:51.789476+00	29	LightShadow	2	[{"changed": {"fields": ["password"]}}]	7	1
36	2018-08-27 17:24:09.971645+00	55	VeryBlueTardis	2	[{"changed": {"fields": ["password"]}}]	7	1
37	2018-08-27 17:26:17.647239+00	1	deputies	2	[{"changed": {"fields": ["permissions"]}}]	3	1
38	2018-08-27 17:27:31.856358+00	1	deputies	2	[{"changed": {"fields": ["permissions"]}}]	3	1
39	2018-08-30 21:33:59.935805+00	55	EventUser object (55)	2	[]	11	1
40	2018-08-30 21:35:14.134743+00	55	EventUser object (55)	2	[]	11	1
41	2018-08-31 10:05:35.269933+00	55	EventUser object (55)	2	[{"changed": {"name": "checkin", "object": "Checkin object (1)", "fields": ["end_date"]}}]	11	1
42	2018-08-31 15:38:09.180398+00	55	EventUser object (55)	2	[{"added": {"name": "checkin", "object": "Checkin object (2)"}}]	11	1
43	2018-08-31 20:53:04.064907+00	55	EventUser object (55)	2	[{"changed": {"name": "checkin", "object": "Checkin object (2)", "fields": ["end_date"]}}]	11	1
44	2018-09-01 14:57:19.235669+00	55	EventUser object (55)	2	[{"added": {"name": "checkin", "object": "Checkin object (3)"}}]	11	1
45	2018-09-02 01:25:25.414346+00	55	EventUser object (55)	2	[{"changed": {"name": "checkin", "object": "Checkin object (3)", "fields": ["end_date"]}}]	11	1
46	2018-09-02 14:45:36.134807+00	55	EventUser object (55)	2	[{"added": {"name": "checkin", "object": "Checkin object (4)"}}]	11	1
47	2018-09-02 18:11:05.417689+00	27	EventUser object (27)	2	[{"added": {"name": "checkin", "object": "Checkin object (5)"}}, {"added": {"name": "checkin", "object": "Checkin object (6)"}}]	11	1
48	2018-09-02 18:11:34.222252+00	27	EventUser object (27)	2	[{"changed": {"name": "checkin", "object": "Checkin object (5)", "fields": ["end_date"]}}]	11	1
49	2018-09-02 18:12:49.6641+00	8	EventUser object (8)	2	[{"added": {"name": "checkin", "object": "Checkin object (7)"}}, {"added": {"name": "checkin", "object": "Checkin object (8)"}}]	11	1
50	2018-09-02 18:18:08.080265+00	6	EventUser object (6)	2	[{"added": {"name": "checkin", "object": "Checkin object (9)"}}, {"added": {"name": "checkin", "object": "Checkin object (10)"}}]	11	1
51	2018-09-02 18:19:53.93965+00	9	EventUser object (9)	2	[{"added": {"name": "checkin", "object": "Checkin object (11)"}}, {"added": {"name": "checkin", "object": "Checkin object (12)"}}]	11	1
52	2018-09-02 18:21:15.504974+00	10	EventUser object (10)	2	[{"added": {"name": "checkin", "object": "Checkin object (13)"}}, {"added": {"name": "checkin", "object": "Checkin object (14)"}}]	11	1
53	2018-09-02 18:31:36.480792+00	14	EventUser object (14)	2	[{"added": {"name": "checkin", "object": "Checkin object (15)"}}, {"added": {"name": "checkin", "object": "Checkin object (16)"}}]	11	1
54	2018-09-02 18:32:56.709671+00	15	EventUser object (15)	2	[{"added": {"name": "checkin", "object": "Checkin object (17)"}}, {"added": {"name": "checkin", "object": "Checkin object (18)"}}]	11	1
55	2018-09-02 18:34:10.773408+00	17	EventUser object (17)	2	[{"added": {"name": "checkin", "object": "Checkin object (19)"}}]	11	1
56	2018-09-02 18:35:49.231166+00	18	EventUser object (18)	2	[{"added": {"name": "checkin", "object": "Checkin object (20)"}}, {"added": {"name": "checkin", "object": "Checkin object (21)"}}]	11	1
57	2018-09-02 18:38:38.604023+00	19	EventUser object (19)	2	[{"added": {"name": "checkin", "object": "Checkin object (22)"}}, {"added": {"name": "checkin", "object": "Checkin object (23)"}}]	11	1
58	2018-09-02 18:47:11.113029+00	34	EventUser object (34)	2	[{"added": {"name": "checkin", "object": "Checkin object (24)"}}, {"added": {"name": "checkin", "object": "Checkin object (25)"}}]	11	1
59	2018-09-02 18:47:46.245355+00	35	EventUser object (35)	2	[{"added": {"name": "checkin", "object": "Checkin object (26)"}}]	11	1
60	2018-09-02 18:49:13.131558+00	36	EventUser object (36)	2	[{"added": {"name": "checkin", "object": "Checkin object (27)"}}, {"added": {"name": "checkin", "object": "Checkin object (28)"}}]	11	1
61	2018-09-02 18:50:47.617182+00	39	EventUser object (39)	2	[{"added": {"name": "checkin", "object": "Checkin object (29)"}}, {"added": {"name": "checkin", "object": "Checkin object (30)"}}]	11	1
62	2018-09-02 18:52:09.694046+00	44	EventUser object (44)	2	[{"added": {"name": "checkin", "object": "Checkin object (31)"}}]	11	1
63	2018-09-02 18:53:03.589099+00	45	EventUser object (45)	2	[{"added": {"name": "checkin", "object": "Checkin object (32)"}}, {"added": {"name": "checkin", "object": "Checkin object (33)"}}]	11	1
64	2018-09-02 18:54:02.199405+00	50	EventUser object (50)	2	[{"added": {"name": "checkin", "object": "Checkin object (34)"}}, {"added": {"name": "checkin", "object": "Checkin object (35)"}}]	11	1
65	2018-09-02 18:54:56.293844+00	47	EventUser object (47)	2	[{"added": {"name": "checkin", "object": "Checkin object (36)"}}]	11	1
66	2018-09-02 19:02:34.274264+00	58	Leggs	1	[{"added": {}}]	7	1
67	2018-09-02 19:09:26.217958+00	55	EventUser object (55)	2	[{"deleted": {"name": "checkin", "object": "Checkin object (None)"}}]	11	1
68	2018-09-02 19:09:37.741511+00	55	EventUser object (55)	2	[{"added": {"name": "checkin", "object": "Checkin object (37)"}}]	11	1
69	2018-09-03 05:55:51.100751+00	55	EventUser object (55)	2	[{"changed": {"name": "checkin", "object": "Checkin object (37)", "fields": ["end_date"]}}]	11	1
70	2018-09-03 20:38:10.217985+00	55	EventUser object (55)	2	[{"added": {"name": "checkin", "object": "Checkin object (109)"}}]	11	1
71	2018-09-03 20:51:45.726211+00	55	EventUser object (55)	2	[{"changed": {"name": "checkin", "object": "Checkin object (109)", "fields": ["end_date"]}}]	11	1
72	2018-09-04 03:22:58.895481+00	23	EventUser object (23)	2	[{"added": {"name": "checkin", "object": "Checkin object (140)"}}]	11	1
73	2018-09-04 03:46:41.924305+00	55	EventUser object (55)	2	[{"added": {"name": "checkin", "object": "Checkin object (165)"}}]	11	1
74	2018-09-04 04:33:57.300982+00	51	EventUser object (51)	2	[{"added": {"name": "checkin", "object": "Checkin object (166)"}}]	11	1
75	2018-09-04 04:35:53.313261+00	51	EventUser object (51)	2	[{"added": {"name": "checkin", "object": "Checkin object (167)"}}, {"added": {"name": "checkin", "object": "Checkin object (168)"}}, {"added": {"name": "checkin", "object": "Checkin object (169)"}}]	11	1
76	2018-09-04 04:38:03.585839+00	5	EventUser object (5)	2	[{"added": {"name": "checkin", "object": "Checkin object (170)"}}, {"added": {"name": "checkin", "object": "Checkin object (171)"}}, {"added": {"name": "checkin", "object": "Checkin object (172)"}}]	11	1
77	2018-09-04 04:38:24.355686+00	5	EventUser object (5)	2	[{"added": {"name": "checkin", "object": "Checkin object (173)"}}]	11	1
78	2018-09-04 04:42:57.699681+00	23	EventUser object (23)	2	[{"changed": {"name": "checkin", "object": "Checkin object (140)", "fields": ["end_date"]}}]	11	1
79	2018-09-04 04:43:02.429711+00	23	EventUser object (23)	2	[]	11	1
80	2018-09-04 04:44:38.2821+00	55	EventUser object (55)	2	[{"changed": {"name": "checkin", "object": "Checkin object (165)", "fields": ["end_date"]}}]	11	1
\.


--
-- TOC entry 3063 (class 0 OID 16458)
-- Dependencies: 221
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	chronocard	user
8	chronocard	checkin
9	chronocard	event
10	chronocard	eventshift
11	chronocard	eventuser
12	chronocard	location
\.


--
-- TOC entry 3065 (class 0 OID 16463)
-- Dependencies: 223
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-08-16 17:52:11.482889+00
2	contenttypes	0002_remove_content_type_name	2018-08-16 17:52:11.556289+00
3	auth	0001_initial	2018-08-16 17:52:11.758271+00
4	auth	0002_alter_permission_name_max_length	2018-08-16 17:52:11.805614+00
5	auth	0003_alter_user_email_max_length	2018-08-16 17:52:11.894368+00
6	auth	0004_alter_user_username_opts	2018-08-16 17:52:11.939995+00
7	auth	0005_alter_user_last_login_null	2018-08-16 17:52:12.016491+00
8	auth	0006_require_contenttypes_0002	2018-08-16 17:52:12.030477+00
9	auth	0007_alter_validators_add_error_messages	2018-08-16 17:52:12.115059+00
10	auth	0008_alter_user_username_max_length	2018-08-16 17:52:12.272268+00
11	auth	0009_alter_user_last_name_max_length	2018-08-16 17:52:12.387507+00
12	chronocard	0001_initial	2018-08-16 17:52:12.66087+00
13	admin	0001_initial	2018-08-16 17:52:12.864801+00
14	admin	0002_logentry_remove_auto_add	2018-08-16 17:52:12.994111+00
15	admin	0003_logentry_add_action_flag_choices	2018-08-16 17:52:13.108368+00
16	authtoken	0001_initial	2018-08-16 17:52:13.260341+00
17	authtoken	0002_auto_20160226_1747	2018-08-16 17:52:13.526112+00
18	chronocard	0002_auto_20180424_1938	2018-08-16 17:52:14.014088+00
19	chronocard	0003_auto_20180529_1838	2018-08-16 17:52:14.192329+00
20	chronocard	0004_auto_20180625_2029	2018-08-16 17:52:14.707492+00
21	chronocard	0005_auto_20180705_1553	2018-08-16 17:52:14.833927+00
22	chronocard	0006_event_time_zone	2018-08-16 17:52:14.910651+00
23	sessions	0001_initial	2018-08-16 17:52:14.984217+00
24	chronocard	0007_auto_20180819_2145	2018-08-20 04:50:37.733946+00
25	chronocard	0008_auto_20180819_2147	2018-08-20 04:50:37.820394+00
26	chronocard	0009_auto_20180825_1736	2018-08-26 01:59:40.786616+00
\.


--
-- TOC entry 3067 (class 0 OID 16471)
-- Dependencies: 225
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
g9k32uzn7961w0ihkwjm592471fg8hnb	NjUxYzUwOTEwOTU3MDlmYzg2OTcyNzJiNmQyMDI5ZjAwZGNjNjJkMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMmJhZTIwY2NkMjIyY2FjNDViY2RkMzY3MWIyNWQ3MjA2NDUwZmVmIn0=	2018-08-30 20:38:14.117504+00
cx836oyjqn3ufm3no0a3ir3bbxtwuy54	ODgxNWM2YjE4NTQ2MjFmMmUzZmM3YTQ2YjFiZmE3NWJkMmFkNzA5Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkN2MxNWYyMDdiZDg4MjM0ZTNjZDVlNzlkZjBkMWUyODNiYWUxN2YxIn0=	2018-09-07 00:08:30.098256+00
w7h7soj0czoob3vn3fvaql4mrrakg944	ODgxNWM2YjE4NTQ2MjFmMmUzZmM3YTQ2YjFiZmE3NWJkMmFkNzA5Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkN2MxNWYyMDdiZDg4MjM0ZTNjZDVlNzlkZjBkMWUyODNiYWUxN2YxIn0=	2018-09-10 17:27:04.935345+00
hurwoq73pljqt75xpy7c1dsqnhcp29rj	NWU1YWI1NTgxZGM5NTA0NDQzNGRhZmY0MTZiMTgzZTEwYjUyNzJjNTp7Il9hdXRoX3VzZXJfaWQiOiI1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjFlZTI4ZDRhN2RlOTQxZWRmYmMzZTU1OTZhYWQ4YWVmNWFiZWU0MiJ9	2018-09-10 17:40:49.953799+00
aqk5a6puo77ywlx8unrak7sqaomu9ynq	ODgxNWM2YjE4NTQ2MjFmMmUzZmM3YTQ2YjFiZmE3NWJkMmFkNzA5Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkN2MxNWYyMDdiZDg4MjM0ZTNjZDVlNzlkZjBkMWUyODNiYWUxN2YxIn0=	2018-09-14 14:44:08.692117+00
\.


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 204
-- Name: chronocard_checkin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 206
-- Name: chronocard_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 208
-- Name: chronocard_eventshift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 210
-- Name: chronocard_eventuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 212
-- Name: chronocard_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 215
-- Name: chronocard_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 216
-- Name: chronocard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 218
-- Name: chronocard_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--




--
-- TOC entry 2833 (class 2606 OID 16492)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2838 (class 2606 OID 16494)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2841 (class 2606 OID 16496)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 16498)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 16500)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2846 (class 2606 OID 16502)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 16504)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2851 (class 2606 OID 16506)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2854 (class 2606 OID 16508)
-- Name: chronocard_checkin chronocard_checkin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_checkin
    ADD CONSTRAINT chronocard_checkin_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 16510)
-- Name: chronocard_event chronocard_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_event
    ADD CONSTRAINT chronocard_event_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 16512)
-- Name: chronocard_eventshift chronocard_eventshift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventshift
    ADD CONSTRAINT chronocard_eventshift_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 16514)
-- Name: chronocard_eventuser chronocard_eventuser_event_id_user_id_ad4bc62f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventuser
    ADD CONSTRAINT chronocard_eventuser_event_id_user_id_ad4bc62f_uniq UNIQUE (event_id, user_id);


--
-- TOC entry 2865 (class 2606 OID 16516)
-- Name: chronocard_eventuser chronocard_eventuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventuser
    ADD CONSTRAINT chronocard_eventuser_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 16518)
-- Name: chronocard_location chronocard_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_location
    ADD CONSTRAINT chronocard_location_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 16520)
-- Name: chronocard_user_groups chronocard_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_groups
    ADD CONSTRAINT chronocard_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 16522)
-- Name: chronocard_user_groups chronocard_user_groups_user_id_group_id_5262b45a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_groups
    ADD CONSTRAINT chronocard_user_groups_user_id_group_id_5262b45a_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2871 (class 2606 OID 16524)
-- Name: chronocard_user chronocard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user
    ADD CONSTRAINT chronocard_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 16526)
-- Name: chronocard_user_user_permissions chronocard_user_user_per_user_id_permission_id_3b3fe233_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_user_permissions
    ADD CONSTRAINT chronocard_user_user_per_user_id_permission_id_3b3fe233_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2885 (class 2606 OID 16528)
-- Name: chronocard_user_user_permissions chronocard_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_user_permissions
    ADD CONSTRAINT chronocard_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 16530)
-- Name: chronocard_user chronocard_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user
    ADD CONSTRAINT chronocard_user_username_key UNIQUE (username);


--
-- TOC entry 2889 (class 2606 OID 16532)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 16534)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2894 (class 2606 OID 16536)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 16538)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 16540)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2831 (class 1259 OID 16541)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2836 (class 1259 OID 16542)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2839 (class 1259 OID 16543)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2842 (class 1259 OID 16544)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2847 (class 1259 OID 16545)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2852 (class 1259 OID 16546)
-- Name: chronocard_checkin_event_user_id_a54ca531; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_checkin_event_user_id_a54ca531 ON public.chronocard_checkin USING btree (event_user_id);


--
-- TOC entry 2857 (class 1259 OID 16547)
-- Name: chronocard_eventshift_event_id_10ac0a72; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_eventshift_event_id_10ac0a72 ON public.chronocard_eventshift USING btree (event_id);


--
-- TOC entry 2858 (class 1259 OID 16548)
-- Name: chronocard_eventshift_location_id_2a2d3a41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_eventshift_location_id_2a2d3a41 ON public.chronocard_eventshift USING btree (location_id);


--
-- TOC entry 2861 (class 1259 OID 16549)
-- Name: chronocard_eventuser_event_id_7e4ecf6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_eventuser_event_id_7e4ecf6f ON public.chronocard_eventuser USING btree (event_id);


--
-- TOC entry 2866 (class 1259 OID 16550)
-- Name: chronocard_eventuser_user_id_d8aa5c4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_eventuser_user_id_d8aa5c4e ON public.chronocard_eventuser USING btree (user_id);


--
-- TOC entry 2867 (class 1259 OID 16551)
-- Name: chronocard_location_event_id_d985dc63; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_location_event_id_d985dc63 ON public.chronocard_location USING btree (event_id);


--
-- TOC entry 2875 (class 1259 OID 16552)
-- Name: chronocard_user_groups_group_id_fbd5473b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_user_groups_group_id_fbd5473b ON public.chronocard_user_groups USING btree (group_id);


--
-- TOC entry 2878 (class 1259 OID 16553)
-- Name: chronocard_user_groups_user_id_ba091cab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_user_groups_user_id_ba091cab ON public.chronocard_user_groups USING btree (user_id);


--
-- TOC entry 2883 (class 1259 OID 16554)
-- Name: chronocard_user_user_permissions_permission_id_6351610a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_user_user_permissions_permission_id_6351610a ON public.chronocard_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2886 (class 1259 OID 16555)
-- Name: chronocard_user_user_permissions_user_id_7b4fee4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_user_user_permissions_user_id_7b4fee4b ON public.chronocard_user_user_permissions USING btree (user_id);


--
-- TOC entry 2872 (class 1259 OID 16556)
-- Name: chronocard_user_username_112986a6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chronocard_user_username_112986a6_like ON public.chronocard_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2887 (class 1259 OID 16557)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2890 (class 1259 OID 16558)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2897 (class 1259 OID 16559)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2900 (class 1259 OID 16560)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2901 (class 2606 OID 16561)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2902 (class 2606 OID 16566)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2903 (class 2606 OID 16571)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2904 (class 2606 OID 16576)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_chronocard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_chronocard_user_id FOREIGN KEY (user_id) REFERENCES public.chronocard_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2905 (class 2606 OID 16581)
-- Name: chronocard_checkin chronocard_checkin_event_user_id_a54ca531_fk_chronocar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_checkin
    ADD CONSTRAINT chronocard_checkin_event_user_id_a54ca531_fk_chronocar FOREIGN KEY (event_user_id) REFERENCES public.chronocard_eventuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2906 (class 2606 OID 16586)
-- Name: chronocard_eventshift chronocard_eventshif_location_id_2a2d3a41_fk_chronocar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventshift
    ADD CONSTRAINT chronocard_eventshif_location_id_2a2d3a41_fk_chronocar FOREIGN KEY (location_id) REFERENCES public.chronocard_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2907 (class 2606 OID 16591)
-- Name: chronocard_eventshift chronocard_eventshift_event_id_10ac0a72_fk_chronocard_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventshift
    ADD CONSTRAINT chronocard_eventshift_event_id_10ac0a72_fk_chronocard_event_id FOREIGN KEY (event_id) REFERENCES public.chronocard_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2908 (class 2606 OID 16596)
-- Name: chronocard_eventuser chronocard_eventuser_event_id_7e4ecf6f_fk_chronocard_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventuser
    ADD CONSTRAINT chronocard_eventuser_event_id_7e4ecf6f_fk_chronocard_event_id FOREIGN KEY (event_id) REFERENCES public.chronocard_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2909 (class 2606 OID 16601)
-- Name: chronocard_eventuser chronocard_eventuser_user_id_d8aa5c4e_fk_chronocard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_eventuser
    ADD CONSTRAINT chronocard_eventuser_user_id_d8aa5c4e_fk_chronocard_user_id FOREIGN KEY (user_id) REFERENCES public.chronocard_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2910 (class 2606 OID 16606)
-- Name: chronocard_location chronocard_location_event_id_d985dc63_fk_chronocard_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_location
    ADD CONSTRAINT chronocard_location_event_id_d985dc63_fk_chronocard_event_id FOREIGN KEY (event_id) REFERENCES public.chronocard_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2911 (class 2606 OID 16611)
-- Name: chronocard_user_groups chronocard_user_groups_group_id_fbd5473b_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_groups
    ADD CONSTRAINT chronocard_user_groups_group_id_fbd5473b_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2912 (class 2606 OID 16616)
-- Name: chronocard_user_groups chronocard_user_groups_user_id_ba091cab_fk_chronocard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_groups
    ADD CONSTRAINT chronocard_user_groups_user_id_ba091cab_fk_chronocard_user_id FOREIGN KEY (user_id) REFERENCES public.chronocard_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2913 (class 2606 OID 16621)
-- Name: chronocard_user_user_permissions chronocard_user_user_permission_id_6351610a_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_user_permissions
    ADD CONSTRAINT chronocard_user_user_permission_id_6351610a_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2914 (class 2606 OID 16626)
-- Name: chronocard_user_user_permissions chronocard_user_user_user_id_7b4fee4b_fk_chronocar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chronocard_user_user_permissions
    ADD CONSTRAINT chronocard_user_user_user_id_7b4fee4b_fk_chronocar FOREIGN KEY (user_id) REFERENCES public.chronocard_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2915 (class 2606 OID 16631)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2916 (class 2606 OID 16636)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_chronocard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_chronocard_user_id FOREIGN KEY (user_id) REFERENCES public.chronocard_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-09-08 20:48:24 EDT

--
-- PostgreSQL database dump complete
--
END;
