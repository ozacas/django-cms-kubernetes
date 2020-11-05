--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

-- DROP DATABASE mezzanine;




--
-- Drop roles
--

--DROP ROLE cmsuser;


--
-- Roles
--

-- CREATE ROLE cmsuser;
-- ALTER ROLE cmsuser WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md580412551caae002784d3df4209599791';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: cmsuser
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO cmsuser;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: cmsuser
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: cmsuser
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: cmsuser
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "mezzanine" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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
-- Name: mezzanine; Type: DATABASE; Schema: -; Owner: cmsuser
--

-- CREATE DATABASE mezzanine WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE mezzanine OWNER TO cmsuser;

\connect mezzanine

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cmsuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cmsuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cmsuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cmsuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cmsuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cmsuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO cmsuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO cmsuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO cmsuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO cmsuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO cmsuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO cmsuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_blogcategory; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.blog_blogcategory (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.blog_blogcategory OWNER TO cmsuser;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.blog_blogcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogcategory_id_seq OWNER TO cmsuser;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.blog_blogcategory_id_seq OWNED BY public.blog_blogcategory.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.blog_blogpost (
    id integer NOT NULL,
    comments_count integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000) NOT NULL,
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    content text NOT NULL,
    allow_comments boolean NOT NULL,
    featured_image character varying(255),
    site_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.blog_blogpost OWNER TO cmsuser;

--
-- Name: blog_blogpost_categories; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.blog_blogpost_categories (
    id integer NOT NULL,
    blogpost_id integer NOT NULL,
    blogcategory_id integer NOT NULL
);


ALTER TABLE public.blog_blogpost_categories OWNER TO cmsuser;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.blog_blogpost_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogpost_categories_id_seq OWNER TO cmsuser;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.blog_blogpost_categories_id_seq OWNED BY public.blog_blogpost_categories.id;


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.blog_blogpost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogpost_id_seq OWNER TO cmsuser;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.blog_blogpost_id_seq OWNED BY public.blog_blogpost.id;


--
-- Name: blog_blogpost_related_posts; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.blog_blogpost_related_posts (
    id integer NOT NULL,
    from_blogpost_id integer NOT NULL,
    to_blogpost_id integer NOT NULL
);


ALTER TABLE public.blog_blogpost_related_posts OWNER TO cmsuser;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.blog_blogpost_related_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogpost_related_posts_id_seq OWNER TO cmsuser;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.blog_blogpost_related_posts_id_seq OWNED BY public.blog_blogpost_related_posts.id;


--
-- Name: conf_setting; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.conf_setting (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(2000) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.conf_setting OWNER TO cmsuser;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.conf_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_setting_id_seq OWNER TO cmsuser;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.conf_setting_id_seq OWNED BY public.conf_setting.id;


--
-- Name: core_sitepermission; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.core_sitepermission (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_sitepermission OWNER TO cmsuser;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.core_sitepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_sitepermission_id_seq OWNER TO cmsuser;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.core_sitepermission_id_seq OWNED BY public.core_sitepermission.id;


--
-- Name: core_sitepermission_sites; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.core_sitepermission_sites (
    id integer NOT NULL,
    sitepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.core_sitepermission_sites OWNER TO cmsuser;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.core_sitepermission_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_sitepermission_sites_id_seq OWNER TO cmsuser;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.core_sitepermission_sites_id_seq OWNED BY public.core_sitepermission_sites.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cmsuser
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


ALTER TABLE public.django_admin_log OWNER TO cmsuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cmsuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO cmsuser;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_comment_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO cmsuser;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_comment_flags_id_seq OWNED BY public.django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.django_comments OWNER TO cmsuser;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO cmsuser;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_comments_id_seq OWNED BY public.django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cmsuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cmsuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cmsuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cmsuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE public.django_redirect OWNER TO cmsuser;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_redirect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_redirect_id_seq OWNER TO cmsuser;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_redirect_id_seq OWNED BY public.django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cmsuser;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO cmsuser;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO cmsuser;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: forms_field; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.forms_field (
    id integer NOT NULL,
    _order integer,
    label text NOT NULL,
    field_type integer NOT NULL,
    required boolean NOT NULL,
    visible boolean NOT NULL,
    choices character varying(1000) NOT NULL,
    "default" character varying(2000) NOT NULL,
    placeholder_text character varying(100) NOT NULL,
    help_text text NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE public.forms_field OWNER TO cmsuser;

--
-- Name: forms_field_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.forms_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_field_id_seq OWNER TO cmsuser;

--
-- Name: forms_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.forms_field_id_seq OWNED BY public.forms_field.id;


--
-- Name: forms_fieldentry; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.forms_fieldentry (
    id integer NOT NULL,
    field_id integer NOT NULL,
    value character varying(2000),
    entry_id integer NOT NULL
);


ALTER TABLE public.forms_fieldentry OWNER TO cmsuser;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.forms_fieldentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_fieldentry_id_seq OWNER TO cmsuser;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.forms_fieldentry_id_seq OWNED BY public.forms_fieldentry.id;


--
-- Name: forms_form; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.forms_form (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    button_text character varying(50) NOT NULL,
    response text NOT NULL,
    send_email boolean NOT NULL,
    email_from character varying(254) NOT NULL,
    email_copies character varying(200) NOT NULL,
    email_subject character varying(200) NOT NULL,
    email_message text NOT NULL
);


ALTER TABLE public.forms_form OWNER TO cmsuser;

--
-- Name: forms_formentry; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.forms_formentry (
    id integer NOT NULL,
    entry_time timestamp with time zone NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE public.forms_formentry OWNER TO cmsuser;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.forms_formentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_formentry_id_seq OWNER TO cmsuser;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.forms_formentry_id_seq OWNED BY public.forms_formentry.id;


--
-- Name: galleries_gallery; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.galleries_gallery (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    zip_import character varying(100) NOT NULL
);


ALTER TABLE public.galleries_gallery OWNER TO cmsuser;

--
-- Name: galleries_galleryimage; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.galleries_galleryimage (
    id integer NOT NULL,
    _order integer,
    file character varying(200) NOT NULL,
    description character varying(1000) NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE public.galleries_galleryimage OWNER TO cmsuser;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.galleries_galleryimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galleries_galleryimage_id_seq OWNER TO cmsuser;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.galleries_galleryimage_id_seq OWNED BY public.galleries_galleryimage.id;


--
-- Name: generic_assignedkeyword; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.generic_assignedkeyword (
    id integer NOT NULL,
    _order integer,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE public.generic_assignedkeyword OWNER TO cmsuser;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.generic_assignedkeyword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_assignedkeyword_id_seq OWNER TO cmsuser;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.generic_assignedkeyword_id_seq OWNED BY public.generic_assignedkeyword.id;


--
-- Name: generic_keyword; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.generic_keyword (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.generic_keyword OWNER TO cmsuser;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.generic_keyword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_keyword_id_seq OWNER TO cmsuser;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.generic_keyword_id_seq OWNED BY public.generic_keyword.id;


--
-- Name: generic_rating; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.generic_rating (
    id integer NOT NULL,
    value integer NOT NULL,
    rating_date timestamp with time zone,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.generic_rating OWNER TO cmsuser;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.generic_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_rating_id_seq OWNER TO cmsuser;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.generic_rating_id_seq OWNED BY public.generic_rating.id;


--
-- Name: generic_threadedcomment; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.generic_threadedcomment (
    comment_ptr_id integer NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    by_author boolean NOT NULL,
    replied_to_id integer
);


ALTER TABLE public.generic_threadedcomment OWNER TO cmsuser;

--
-- Name: pages_link; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.pages_link (
    page_ptr_id integer NOT NULL
);


ALTER TABLE public.pages_link OWNER TO cmsuser;

--
-- Name: pages_page; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.pages_page (
    id integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000) NOT NULL,
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    _order integer,
    in_menus character varying(100),
    titles character varying(1000),
    content_model character varying(50),
    login_required boolean NOT NULL,
    parent_id integer,
    site_id integer NOT NULL
);


ALTER TABLE public.pages_page OWNER TO cmsuser;

--
-- Name: pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.pages_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_page_id_seq OWNER TO cmsuser;

--
-- Name: pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.pages_page_id_seq OWNED BY public.pages_page.id;


--
-- Name: pages_richtextpage; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.pages_richtextpage (
    page_ptr_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.pages_richtextpage OWNER TO cmsuser;

--
-- Name: twitter_query; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.twitter_query (
    id integer NOT NULL,
    type character varying(10) NOT NULL,
    value character varying(140) NOT NULL,
    interested boolean NOT NULL
);


ALTER TABLE public.twitter_query OWNER TO cmsuser;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.twitter_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.twitter_query_id_seq OWNER TO cmsuser;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.twitter_query_id_seq OWNED BY public.twitter_query.id;


--
-- Name: twitter_tweet; Type: TABLE; Schema: public; Owner: cmsuser
--

CREATE TABLE public.twitter_tweet (
    id integer NOT NULL,
    remote_id character varying(50) NOT NULL,
    created_at timestamp with time zone,
    text text,
    profile_image_url character varying(200),
    user_name character varying(100),
    full_name character varying(100),
    retweeter_profile_image_url character varying(200),
    retweeter_user_name character varying(100),
    retweeter_full_name character varying(100),
    query_id integer NOT NULL
);


ALTER TABLE public.twitter_tweet OWNER TO cmsuser;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE; Schema: public; Owner: cmsuser
--

CREATE SEQUENCE public.twitter_tweet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.twitter_tweet_id_seq OWNER TO cmsuser;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cmsuser
--

ALTER SEQUENCE public.twitter_tweet_id_seq OWNED BY public.twitter_tweet.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_blogcategory id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogcategory ALTER COLUMN id SET DEFAULT nextval('public.blog_blogcategory_id_seq'::regclass);


--
-- Name: blog_blogpost id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpost_id_seq'::regclass);


--
-- Name: blog_blogpost_categories id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_categories ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpost_categories_id_seq'::regclass);


--
-- Name: blog_blogpost_related_posts id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_related_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpost_related_posts_id_seq'::regclass);


--
-- Name: conf_setting id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.conf_setting ALTER COLUMN id SET DEFAULT nextval('public.conf_setting_id_seq'::regclass);


--
-- Name: core_sitepermission id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission ALTER COLUMN id SET DEFAULT nextval('public.core_sitepermission_id_seq'::regclass);


--
-- Name: core_sitepermission_sites id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission_sites ALTER COLUMN id SET DEFAULT nextval('public.core_sitepermission_sites_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_comment_flags id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comment_flags ALTER COLUMN id SET DEFAULT nextval('public.django_comment_flags_id_seq'::regclass);


--
-- Name: django_comments id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comments ALTER COLUMN id SET DEFAULT nextval('public.django_comments_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_redirect id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_redirect ALTER COLUMN id SET DEFAULT nextval('public.django_redirect_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: forms_field id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_field ALTER COLUMN id SET DEFAULT nextval('public.forms_field_id_seq'::regclass);


--
-- Name: forms_fieldentry id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_fieldentry ALTER COLUMN id SET DEFAULT nextval('public.forms_fieldentry_id_seq'::regclass);


--
-- Name: forms_formentry id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_formentry ALTER COLUMN id SET DEFAULT nextval('public.forms_formentry_id_seq'::regclass);


--
-- Name: galleries_galleryimage id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.galleries_galleryimage ALTER COLUMN id SET DEFAULT nextval('public.galleries_galleryimage_id_seq'::regclass);


--
-- Name: generic_assignedkeyword id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_assignedkeyword ALTER COLUMN id SET DEFAULT nextval('public.generic_assignedkeyword_id_seq'::regclass);


--
-- Name: generic_keyword id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_keyword ALTER COLUMN id SET DEFAULT nextval('public.generic_keyword_id_seq'::regclass);


--
-- Name: generic_rating id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_rating ALTER COLUMN id SET DEFAULT nextval('public.generic_rating_id_seq'::regclass);


--
-- Name: pages_page id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_page ALTER COLUMN id SET DEFAULT nextval('public.pages_page_id_seq'::regclass);


--
-- Name: twitter_query id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.twitter_query ALTER COLUMN id SET DEFAULT nextval('public.twitter_query_id_seq'::regclass);


--
-- Name: twitter_tweet id; Type: DEFAULT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.twitter_tweet ALTER COLUMN id SET DEFAULT nextval('public.twitter_tweet_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add redirect	5	add_redirect
14	Can change redirect	5	change_redirect
15	Can delete redirect	5	delete_redirect
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add Setting	8	add_setting
23	Can change Setting	8	change_setting
24	Can delete Setting	8	delete_setting
25	Can add Site permission	9	add_sitepermission
26	Can change Site permission	9	change_sitepermission
27	Can delete Site permission	9	delete_sitepermission
28	Can add assigned keyword	10	add_assignedkeyword
29	Can change assigned keyword	10	change_assignedkeyword
30	Can delete assigned keyword	10	delete_assignedkeyword
31	Can add Keyword	11	add_keyword
32	Can change Keyword	11	change_keyword
33	Can delete Keyword	11	delete_keyword
34	Can add Rating	12	add_rating
35	Can change Rating	12	change_rating
36	Can delete Rating	12	delete_rating
37	Can add Comment	13	add_threadedcomment
38	Can change Comment	13	change_threadedcomment
39	Can delete Comment	13	delete_threadedcomment
40	Can add Page	14	add_page
41	Can change Page	14	change_page
42	Can delete Page	14	delete_page
43	Can add Link	15	add_link
44	Can change Link	15	change_link
45	Can delete Link	15	delete_link
46	Can add Rich text page	16	add_richtextpage
47	Can change Rich text page	16	change_richtextpage
48	Can delete Rich text page	16	delete_richtextpage
49	Can add Blog Category	17	add_blogcategory
50	Can change Blog Category	17	change_blogcategory
51	Can delete Blog Category	17	delete_blogcategory
52	Can add Blog post	18	add_blogpost
53	Can change Blog post	18	change_blogpost
54	Can delete Blog post	18	delete_blogpost
55	Can add Field	19	add_field
56	Can change Field	19	change_field
57	Can delete Field	19	delete_field
58	Can add Form field entry	20	add_fieldentry
59	Can change Form field entry	20	change_fieldentry
60	Can delete Form field entry	20	delete_fieldentry
61	Can add Form	21	add_form
62	Can change Form	21	change_form
63	Can delete Form	21	delete_form
64	Can add Form entry	22	add_formentry
65	Can change Form entry	22	change_formentry
66	Can delete Form entry	22	delete_formentry
67	Can add Gallery	23	add_gallery
68	Can change Gallery	23	change_gallery
69	Can delete Gallery	23	delete_gallery
70	Can add Image	24	add_galleryimage
71	Can change Image	24	change_galleryimage
72	Can delete Image	24	delete_galleryimage
73	Can add Twitter query	25	add_query
74	Can change Twitter query	25	change_query
75	Can delete Twitter query	25	delete_query
76	Can add Tweet	26	add_tweet
77	Can change Tweet	26	change_tweet
78	Can delete Tweet	26	delete_tweet
79	Can add log entry	27	add_logentry
80	Can change log entry	27	change_logentry
81	Can delete log entry	27	delete_logentry
82	Can add comment	28	add_comment
83	Can change comment	28	change_comment
84	Can delete comment	28	delete_comment
85	Can moderate comments	28	can_moderate
86	Can add comment flag	29	add_commentflag
87	Can change comment flag	29	change_commentflag
88	Can delete comment flag	29	delete_commentflag
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$JGznWaD9bBzQ$qSuvD5ak/TnEF2TteUPqhoIv0aCmNon9SU0zsSr1dmk=	\N	t	admin			example@example.com	t	t	2020-11-05 01:45:49.618172+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.blog_blogcategory (id, title, slug, site_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.blog_blogpost (id, comments_count, keywords_string, rating_count, rating_sum, rating_average, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, content, allow_comments, featured_image, site_id, user_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpost_categories; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.blog_blogpost_categories (id, blogpost_id, blogcategory_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpost_related_posts; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.blog_blogpost_related_posts (id, from_blogpost_id, to_blogpost_id) FROM stdin;
\.


--
-- Data for Name: conf_setting; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.conf_setting (id, name, value, site_id) FROM stdin;
\.


--
-- Data for Name: core_sitepermission; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.core_sitepermission (id, user_id) FROM stdin;
\.


--
-- Data for Name: core_sitepermission_sites; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.core_sitepermission_sites (id, sitepermission_id, site_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	redirects	redirect
6	sessions	session
7	sites	site
8	conf	setting
9	core	sitepermission
10	generic	assignedkeyword
11	generic	keyword
12	generic	rating
13	generic	threadedcomment
14	pages	page
15	pages	link
16	pages	richtextpage
17	blog	blogcategory
18	blog	blogpost
19	forms	field
20	forms	fieldentry
21	forms	form
22	forms	formentry
23	galleries	gallery
24	galleries	galleryimage
25	twitter	query
26	twitter	tweet
27	admin	logentry
28	django_comments	comment
29	django_comments	commentflag
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-11-05 01:45:42.897239+00
2	auth	0001_initial	2020-11-05 01:45:43.732571+00
3	admin	0001_initial	2020-11-05 01:45:43.932163+00
4	admin	0002_logentry_remove_auto_add	2020-11-05 01:45:43.974998+00
5	contenttypes	0002_remove_content_type_name	2020-11-05 01:45:44.019399+00
6	auth	0002_alter_permission_name_max_length	2020-11-05 01:45:44.053065+00
7	auth	0003_alter_user_email_max_length	2020-11-05 01:45:44.086123+00
8	auth	0004_alter_user_username_opts	2020-11-05 01:45:44.10777+00
9	auth	0005_alter_user_last_login_null	2020-11-05 01:45:44.141952+00
10	auth	0006_require_contenttypes_0002	2020-11-05 01:45:44.155203+00
11	auth	0007_alter_validators_add_error_messages	2020-11-05 01:45:44.181267+00
12	auth	0008_alter_user_username_max_length	2020-11-05 01:45:44.254424+00
13	sites	0001_initial	2020-11-05 01:45:44.332351+00
14	blog	0001_initial	2020-11-05 01:45:44.947501+00
15	blog	0002_auto_20150527_1555	2020-11-05 01:45:45.023678+00
16	blog	0003_auto_20170411_0504	2020-11-05 01:45:45.078667+00
17	conf	0001_initial	2020-11-05 01:45:45.236177+00
18	core	0001_initial	2020-11-05 01:45:45.514636+00
19	core	0002_auto_20150414_2140	2020-11-05 01:45:45.567481+00
20	django_comments	0001_initial	2020-11-05 01:45:46.093599+00
21	django_comments	0002_update_user_email_field_length	2020-11-05 01:45:46.12414+00
22	django_comments	0003_add_submit_date_index	2020-11-05 01:45:46.204324+00
23	pages	0001_initial	2020-11-05 01:45:46.538146+00
24	forms	0001_initial	2020-11-05 01:45:47.128239+00
25	forms	0002_auto_20141227_0224	2020-11-05 01:45:47.15017+00
26	forms	0003_emailfield	2020-11-05 01:45:47.170924+00
27	forms	0004_auto_20150517_0510	2020-11-05 01:45:47.204509+00
28	forms	0005_auto_20151026_1600	2020-11-05 01:45:47.230594+00
29	forms	0006_auto_20170425_2225	2020-11-05 01:45:47.259558+00
30	galleries	0001_initial	2020-11-05 01:45:47.517818+00
31	galleries	0002_auto_20141227_0224	2020-11-05 01:45:47.54336+00
32	generic	0001_initial	2020-11-05 01:45:48.129092+00
33	generic	0002_auto_20141227_0224	2020-11-05 01:45:48.15666+00
34	generic	0003_auto_20170411_0504	2020-11-05 01:45:48.194918+00
35	pages	0002_auto_20141227_0224	2020-11-05 01:45:48.232594+00
36	pages	0003_auto_20150527_1555	2020-11-05 01:45:48.284257+00
37	pages	0004_auto_20170411_0504	2020-11-05 01:45:48.328541+00
38	redirects	0001_initial	2020-11-05 01:45:48.552084+00
39	sessions	0001_initial	2020-11-05 01:45:48.741577+00
40	sites	0002_alter_domain_unique	2020-11-05 01:45:48.851655+00
41	twitter	0001_initial	2020-11-05 01:45:49.052733+00
\.


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.django_site (id, domain, name) FROM stdin;
1	127.0.0.1:8000	Default
\.


--
-- Data for Name: forms_field; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.forms_field (id, _order, label, field_type, required, visible, choices, "default", placeholder_text, help_text, form_id) FROM stdin;
1	0	Name	1	t	t					3
2	1	Email	3	t	t					3
3	2	Subject	6	t	t	Billing, Sales, Support				3
4	3	Message	2	t	t					3
\.


--
-- Data for Name: forms_fieldentry; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.forms_fieldentry (id, field_id, value, entry_id) FROM stdin;
\.


--
-- Data for Name: forms_form; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.forms_form (page_ptr_id, content, button_text, response, send_email, email_from, email_copies, email_subject, email_message) FROM stdin;
3	<p>Fill in the form below to get in touch with us.</p>		<p>Thanks for getting in touch with us. We'll get back to you as soon as possible.</p>	t				
\.


--
-- Data for Name: forms_formentry; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.forms_formentry (id, entry_time, form_id) FROM stdin;
\.


--
-- Data for Name: galleries_gallery; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.galleries_gallery (page_ptr_id, content, zip_import) FROM stdin;
8	<p>A demo gallery of cities from around the world.</p>	
\.


--
-- Data for Name: galleries_galleryimage; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.galleries_galleryimage (id, _order, file, description, gallery_id) FROM stdin;
1	0	uploads/gallery/Amsterdam, Holland.jpg	Amsterdam  Holland	8
2	1	uploads/gallery/Asturias, Brazil.jpg	Asturias  Brazil	8
3	2	uploads/gallery/Athens, Greece.jpg	Athens  Greece	8
4	3	uploads/gallery/Austin, USA.jpg	Austin  USA	8
5	4	uploads/gallery/Ávila, Spain.jpg	Ávila  Spain	8
6	5	uploads/gallery/Bangkok, Thailand.jpg	Bangkok  Thailand	8
7	6	uploads/gallery/Berlin, Germany.jpg	Berlin  Germany	8
8	7	uploads/gallery/Boston, USA.jpg	Boston  USA	8
9	8	uploads/gallery/Brisbane, Australia.jpg	Brisbane  Australia	8
10	9	uploads/gallery/Bruxelles, Belgium.jpg	Bruxelles  Belgium	8
11	10	uploads/gallery/Buenos Aires, Argentina.jpg	Buenos Aires  Argentina	8
12	11	uploads/gallery/Cairo, Egypt.jpg	Cairo  Egypt	8
13	12	uploads/gallery/Chicage, USA.jpg	Chicage  USA	8
14	13	uploads/gallery/City of Singapore, Singapore.jpg	City Of Singapore  Singapore	8
15	14	uploads/gallery/Dallas, USA.jpg	Dallas  USA	8
16	15	uploads/gallery/Denver, USA.jpg	Denver  USA	8
17	16	uploads/gallery/Dublin, Ireland.jpg	Dublin  Ireland	8
18	17	uploads/gallery/Düsseldorf, Germany.jpg	Düsseldorf  Germany	8
19	18	uploads/gallery/Frankfurt, Germany.jpg	Frankfurt  Germany	8
20	19	uploads/gallery/Geneva, Switzerland.jpg	Geneva  Switzerland	8
21	20	uploads/gallery/Inverness, Scotland.jpg	Inverness  Scotland	8
22	21	uploads/gallery/Lisbon, Portugal.jpg	Lisbon  Portugal	8
23	22	uploads/gallery/Liverpool, England.jpg	Liverpool  England	8
24	23	uploads/gallery/London, England.jpg	London  England	8
25	24	uploads/gallery/Long Beach, USA.jpg	Long Beach  USA	8
26	25	uploads/gallery/Louisville, USA.jpg	Louisville  USA	8
27	26	uploads/gallery/Marrakech, Morocco.jpg	Marrakech  Morocco	8
28	27	uploads/gallery/Miami, USA.jpg	Miami  USA	8
29	28	uploads/gallery/Monaco, Monaco.jpg	Monaco  Monaco	8
30	29	uploads/gallery/Moscow, Russia.jpg	Moscow  Russia	8
31	30	uploads/gallery/Naples, Italy.jpg	Naples  Italy	8
32	31	uploads/gallery/Palermo, Italy.jpg	Palermo  Italy	8
33	32	uploads/gallery/Paris, France.jpg	Paris  France	8
34	33	uploads/gallery/Reykjavik, Iceland.jpg	Reykjavik  Iceland	8
35	34	uploads/gallery/Rome, Italy.jpg	Rome  Italy	8
36	35	uploads/gallery/San Francisco, USA.jpg	San Francisco  USA	8
37	36	uploads/gallery/Santiago, Chile.jpg	Santiago  Chile	8
38	37	uploads/gallery/Seattle, USA.jpg	Seattle  USA	8
39	38	uploads/gallery/Stockholm, Sweden.jpg	Stockholm  Sweden	8
40	39	uploads/gallery/Sydney, Australia.jpg	Sydney  Australia	8
41	40	uploads/gallery/Tempe Town Lake, USA.jpg	Tempe Town Lake  USA	8
42	41	uploads/gallery/Tokyo, Japan.jpg	Tokyo  Japan	8
43	42	uploads/gallery/Toronto, Canada.jpg	Toronto  Canada	8
44	43	uploads/gallery/Vancouver, Canada.jpg	Vancouver  Canada	8
45	44	uploads/gallery/Venice, Italy.jpg	Venice  Italy	8
46	45	uploads/gallery/Vienna, Austria.jpg	Vienna  Austria	8
47	46	uploads/gallery/Warsaw, Poland.jpg	Warsaw  Poland	8
48	47	uploads/gallery/Yokohama, Japan.jpg	Yokohama  Japan	8
49	48	uploads/gallery/York, England.jpg	York  England	8
\.


--
-- Data for Name: generic_assignedkeyword; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.generic_assignedkeyword (id, _order, object_pk, content_type_id, keyword_id) FROM stdin;
\.


--
-- Data for Name: generic_keyword; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.generic_keyword (id, title, slug, site_id) FROM stdin;
\.


--
-- Data for Name: generic_rating; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.generic_rating (id, value, rating_date, object_pk, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: generic_threadedcomment; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.generic_threadedcomment (comment_ptr_id, rating_count, rating_sum, rating_average, by_author, replied_to_id) FROM stdin;
\.


--
-- Data for Name: pages_link; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.pages_link (page_ptr_id) FROM stdin;
\.


--
-- Data for Name: pages_page; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.pages_page (id, keywords_string, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, _order, in_menus, titles, content_model, login_required, parent_id, site_id) FROM stdin;
1		Blog	blog	\N	Blog	t	\N	\N	2	\N	\N	\N	t	1	1,2,3	Blog	richtextpage	f	\N	1
2		About	about	\N	About us	t	\N	\N	2	\N	\N	\N	t	0	1,2,3	About	richtextpage	f	\N	1
3		Contact	contact	\N	Fill in the form below to get in touch with us.	t	\N	\N	2	\N	\N	\N	t	3	1,2,3	Contact	form	f	\N	1
4		Team	about/team	\N	Team	t	\N	\N	2	\N	\N	\N	t	0	1,2,3	About / Team	richtextpage	f	2	1
5		History	about/history	\N	History	t	\N	\N	2	\N	\N	\N	t	1	1,2,3	About / History	richtextpage	f	2	1
6		Legals	contact/legals	\N	Legals	t	\N	\N	2	\N	\N	\N	t	0	1,2,3	Contact / Legals	richtextpage	f	3	1
8		Gallery	gallery	\N	A demo gallery of cities from around the world.	t	\N	2020-11-05 01:45:50.69535+00	2	2020-11-05 01:45:49.800335+00	\N	\N	t	2	1,2,3	Gallery	gallery	f	\N	1
\.


--
-- Data for Name: pages_richtextpage; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.pages_richtextpage (page_ptr_id, content) FROM stdin;
1	<p>Blog</p>
2	<p>About us</p>
4	<p>Team</p>
5	<p>History</p>
6	<p>Legals</p>
\.


--
-- Data for Name: twitter_query; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.twitter_query (id, type, value, interested) FROM stdin;
\.


--
-- Data for Name: twitter_tweet; Type: TABLE DATA; Schema: public; Owner: cmsuser
--

COPY public.twitter_tweet (id, remote_id, created_at, text, profile_image_url, user_name, full_name, retweeter_profile_image_url, retweeter_user_name, retweeter_full_name, query_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.blog_blogcategory_id_seq', 1, false);


--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.blog_blogpost_categories_id_seq', 1, false);


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.blog_blogpost_id_seq', 1, false);


--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.blog_blogpost_related_posts_id_seq', 1, false);


--
-- Name: conf_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.conf_setting_id_seq', 1, false);


--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.core_sitepermission_id_seq', 1, false);


--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.core_sitepermission_sites_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_comment_flags_id_seq', 1, false);


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_comments_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 29, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_redirect_id_seq', 1, false);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: forms_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.forms_field_id_seq', 4, true);


--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.forms_fieldentry_id_seq', 1, false);


--
-- Name: forms_formentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.forms_formentry_id_seq', 1, false);


--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.galleries_galleryimage_id_seq', 49, true);


--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.generic_assignedkeyword_id_seq', 1, false);


--
-- Name: generic_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.generic_keyword_id_seq', 1, false);


--
-- Name: generic_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.generic_rating_id_seq', 1, false);


--
-- Name: pages_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.pages_page_id_seq', 8, true);


--
-- Name: twitter_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.twitter_query_id_seq', 1, false);


--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cmsuser
--

SELECT pg_catalog.setval('public.twitter_tweet_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogcategory blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_categories blog_blogpost_categories_blogpost_id_blogcategory_a64d32c5_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_blogpost_id_blogcategory_a64d32c5_uniq UNIQUE (blogpost_id, blogcategory_id);


--
-- Name: blog_blogpost_categories blog_blogpost_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_related_posts blog_blogpost_related_po_from_blogpost_id_to_blog_3bd0f49f_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_po_from_blogpost_id_to_blog_3bd0f49f_uniq UNIQUE (from_blogpost_id, to_blogpost_id);


--
-- Name: blog_blogpost_related_posts blog_blogpost_related_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_pkey PRIMARY KEY (id);


--
-- Name: conf_setting conf_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.conf_setting
    ADD CONSTRAINT conf_setting_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission core_sitepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission
    ADD CONSTRAINT core_sitepermission_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites core_sitepermission_site_sitepermission_id_site_i_e3e7353a_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_site_sitepermission_id_site_i_e3e7353a_uniq UNIQUE (sitepermission_id, site_id);


--
-- Name: core_sitepermission_sites core_sitepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission core_sitepermission_user_id_key; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags django_comment_flags_user_id_comment_id_flag_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_comment_id_flag_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect django_redirect_site_id_old_path_ac5dd16b_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_redirect
    ADD CONSTRAINT django_redirect_site_id_old_path_ac5dd16b_uniq UNIQUE (site_id, old_path);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: forms_field forms_field_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_field
    ADD CONSTRAINT forms_field_pkey PRIMARY KEY (id);


--
-- Name: forms_fieldentry forms_fieldentry_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_pkey PRIMARY KEY (id);


--
-- Name: forms_form forms_form_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_form
    ADD CONSTRAINT forms_form_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: forms_formentry forms_formentry_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_formentry
    ADD CONSTRAINT forms_formentry_pkey PRIMARY KEY (id);


--
-- Name: galleries_gallery galleries_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.galleries_gallery
    ADD CONSTRAINT galleries_gallery_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: galleries_galleryimage galleries_galleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.galleries_galleryimage
    ADD CONSTRAINT galleries_galleryimage_pkey PRIMARY KEY (id);


--
-- Name: generic_assignedkeyword generic_assignedkeyword_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeyword_pkey PRIMARY KEY (id);


--
-- Name: generic_keyword generic_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_keyword
    ADD CONSTRAINT generic_keyword_pkey PRIMARY KEY (id);


--
-- Name: generic_rating generic_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_rating
    ADD CONSTRAINT generic_rating_pkey PRIMARY KEY (id);


--
-- Name: generic_threadedcomment generic_threadedcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_threadedcomment
    ADD CONSTRAINT generic_threadedcomment_pkey PRIMARY KEY (comment_ptr_id);


--
-- Name: pages_link pages_link_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_link
    ADD CONSTRAINT pages_link_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_page pages_page_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_page
    ADD CONSTRAINT pages_page_pkey PRIMARY KEY (id);


--
-- Name: pages_richtextpage pages_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: twitter_query twitter_query_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.twitter_query
    ADD CONSTRAINT twitter_query_pkey PRIMARY KEY (id);


--
-- Name: twitter_tweet twitter_tweet_pkey; Type: CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.twitter_tweet
    ADD CONSTRAINT twitter_tweet_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogcategory_site_id_42b9c96d; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogcategory_site_id_42b9c96d ON public.blog_blogcategory USING btree (site_id);


--
-- Name: blog_blogpost_categories_blogcategory_id_f6695246; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_categories_blogcategory_id_f6695246 ON public.blog_blogpost_categories USING btree (blogcategory_id);


--
-- Name: blog_blogpost_categories_blogpost_id_daeea608; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_categories_blogpost_id_daeea608 ON public.blog_blogpost_categories USING btree (blogpost_id);


--
-- Name: blog_blogpost_publish_date_703abc16; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_publish_date_703abc16 ON public.blog_blogpost USING btree (publish_date);


--
-- Name: blog_blogpost_related_posts_from_blogpost_id_27ea4c18; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_related_posts_from_blogpost_id_27ea4c18 ON public.blog_blogpost_related_posts USING btree (from_blogpost_id);


--
-- Name: blog_blogpost_related_posts_to_blogpost_id_35f7acdd; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_related_posts_to_blogpost_id_35f7acdd ON public.blog_blogpost_related_posts USING btree (to_blogpost_id);


--
-- Name: blog_blogpost_site_id_7995688f; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_site_id_7995688f ON public.blog_blogpost USING btree (site_id);


--
-- Name: blog_blogpost_user_id_12ed6b16; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX blog_blogpost_user_id_12ed6b16 ON public.blog_blogpost USING btree (user_id);


--
-- Name: conf_setting_site_id_b235f7ed; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX conf_setting_site_id_b235f7ed ON public.conf_setting USING btree (site_id);


--
-- Name: core_sitepermission_sites_site_id_38038b76; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX core_sitepermission_sites_site_id_38038b76 ON public.core_sitepermission_sites USING btree (site_id);


--
-- Name: core_sitepermission_sites_sitepermission_id_d33bc79e; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX core_sitepermission_sites_sitepermission_id_d33bc79e ON public.core_sitepermission_sites USING btree (sitepermission_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_comment_id_d8054933; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comment_flags_comment_id_d8054933 ON public.django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_flag_8b141fcb; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comment_flags_flag_8b141fcb ON public.django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON public.django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comment_flags_user_id_f3f81f0a; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comment_flags_user_id_f3f81f0a ON public.django_comment_flags USING btree (user_id);


--
-- Name: django_comments_content_type_id_c4afe962; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comments_content_type_id_c4afe962 ON public.django_comments USING btree (content_type_id);


--
-- Name: django_comments_site_id_9dcf666e; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comments_site_id_9dcf666e ON public.django_comments USING btree (site_id);


--
-- Name: django_comments_submit_date_514ed2d9; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comments_submit_date_514ed2d9 ON public.django_comments USING btree (submit_date);


--
-- Name: django_comments_user_id_a0a440a1; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_comments_user_id_a0a440a1 ON public.django_comments USING btree (user_id);


--
-- Name: django_redirect_old_path_c6cc94d3; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_redirect_old_path_c6cc94d3 ON public.django_redirect USING btree (old_path);


--
-- Name: django_redirect_old_path_c6cc94d3_like; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_redirect_old_path_c6cc94d3_like ON public.django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_redirect_site_id_c3e37341; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_redirect_site_id_c3e37341 ON public.django_redirect USING btree (site_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: forms_field_form_id_9ca5dc7e; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX forms_field_form_id_9ca5dc7e ON public.forms_field USING btree (form_id);


--
-- Name: forms_fieldentry_entry_id_c4fdc570; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX forms_fieldentry_entry_id_c4fdc570 ON public.forms_fieldentry USING btree (entry_id);


--
-- Name: forms_formentry_form_id_d0f23912; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX forms_formentry_form_id_d0f23912 ON public.forms_formentry USING btree (form_id);


--
-- Name: galleries_galleryimage_gallery_id_af12d3f5; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX galleries_galleryimage_gallery_id_af12d3f5 ON public.galleries_galleryimage USING btree (gallery_id);


--
-- Name: generic_assignedkeyword_content_type_id_3dd89a7f; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX generic_assignedkeyword_content_type_id_3dd89a7f ON public.generic_assignedkeyword USING btree (content_type_id);


--
-- Name: generic_assignedkeyword_keyword_id_44c17f9d; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX generic_assignedkeyword_keyword_id_44c17f9d ON public.generic_assignedkeyword USING btree (keyword_id);


--
-- Name: generic_keyword_site_id_c5be0acc; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX generic_keyword_site_id_c5be0acc ON public.generic_keyword USING btree (site_id);


--
-- Name: generic_rating_content_type_id_eaf475fa; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX generic_rating_content_type_id_eaf475fa ON public.generic_rating USING btree (content_type_id);


--
-- Name: generic_rating_user_id_60020469; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX generic_rating_user_id_60020469 ON public.generic_rating USING btree (user_id);


--
-- Name: generic_threadedcomment_replied_to_id_d0a08d73; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX generic_threadedcomment_replied_to_id_d0a08d73 ON public.generic_threadedcomment USING btree (replied_to_id);


--
-- Name: pages_page_parent_id_133fa4d3; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX pages_page_parent_id_133fa4d3 ON public.pages_page USING btree (parent_id);


--
-- Name: pages_page_publish_date_eb7c8d46; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX pages_page_publish_date_eb7c8d46 ON public.pages_page USING btree (publish_date);


--
-- Name: pages_page_site_id_47a43e5b; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX pages_page_site_id_47a43e5b ON public.pages_page USING btree (site_id);


--
-- Name: twitter_tweet_query_id_bd42b699; Type: INDEX; Schema: public; Owner: cmsuser
--

CREATE INDEX twitter_tweet_query_id_bd42b699 ON public.twitter_tweet USING btree (query_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogcategory blog_blogcategory_site_id_42b9c96d_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_site_id_42b9c96d_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_categories blog_blogpost_catego_blogcategory_id_f6695246_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_catego_blogcategory_id_f6695246_fk_blog_blog FOREIGN KEY (blogcategory_id) REFERENCES public.blog_blogcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_categories blog_blogpost_catego_blogpost_id_daeea608_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_catego_blogpost_id_daeea608_fk_blog_blog FOREIGN KEY (blogpost_id) REFERENCES public.blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_related_posts blog_blogpost_relate_from_blogpost_id_27ea4c18_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_relate_from_blogpost_id_27ea4c18_fk_blog_blog FOREIGN KEY (from_blogpost_id) REFERENCES public.blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_related_posts blog_blogpost_relate_to_blogpost_id_35f7acdd_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_relate_to_blogpost_id_35f7acdd_fk_blog_blog FOREIGN KEY (to_blogpost_id) REFERENCES public.blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost blog_blogpost_site_id_7995688f_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost
    ADD CONSTRAINT blog_blogpost_site_id_7995688f_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost blog_blogpost_user_id_12ed6b16_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.blog_blogpost
    ADD CONSTRAINT blog_blogpost_user_id_12ed6b16_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conf_setting conf_setting_site_id_b235f7ed_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.conf_setting
    ADD CONSTRAINT conf_setting_site_id_b235f7ed_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_sites core_sitepermission__sitepermission_id_d33bc79e_fk_core_site; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission__sitepermission_id_d33bc79e_fk_core_site FOREIGN KEY (sitepermission_id) REFERENCES public.core_sitepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_sites core_sitepermission_sites_site_id_38038b76_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_site_id_38038b76_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission core_sitepermission_user_id_0a3cbb11_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_0a3cbb11_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags django_comment_flags_user_id_f3f81f0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_content_type_id_c4afe962_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_content_type_id_c4afe962_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_user_id_a0a440a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect django_redirect_site_id_c3e37341_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.django_redirect
    ADD CONSTRAINT django_redirect_site_id_c3e37341_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_field forms_field_form_id_9ca5dc7e_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_field
    ADD CONSTRAINT forms_field_form_id_9ca5dc7e_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES public.forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_fieldentry forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id FOREIGN KEY (entry_id) REFERENCES public.forms_formentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_form forms_form_page_ptr_id_d3bcbf3a_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_form
    ADD CONSTRAINT forms_form_page_ptr_id_d3bcbf3a_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_formentry forms_formentry_form_id_d0f23912_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.forms_formentry
    ADD CONSTRAINT forms_formentry_form_id_d0f23912_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES public.forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries_gallery galleries_gallery_page_ptr_id_8562ba87_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.galleries_gallery
    ADD CONSTRAINT galleries_gallery_page_ptr_id_8562ba87_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries_galleryimage galleries_galleryima_gallery_id_af12d3f5_fk_galleries; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.galleries_galleryimage
    ADD CONSTRAINT galleries_galleryima_gallery_id_af12d3f5_fk_galleries FOREIGN KEY (gallery_id) REFERENCES public.galleries_gallery(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assignedkeyword generic_assignedkeyw_content_type_id_3dd89a7f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeyw_content_type_id_3dd89a7f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assignedkeyword generic_assignedkeyw_keyword_id_44c17f9d_fk_generic_k; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeyw_keyword_id_44c17f9d_fk_generic_k FOREIGN KEY (keyword_id) REFERENCES public.generic_keyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_keyword generic_keyword_site_id_c5be0acc_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_keyword
    ADD CONSTRAINT generic_keyword_site_id_c5be0acc_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rating generic_rating_content_type_id_eaf475fa_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_rating
    ADD CONSTRAINT generic_rating_content_type_id_eaf475fa_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rating generic_rating_user_id_60020469_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_rating
    ADD CONSTRAINT generic_rating_user_id_60020469_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_threadedcomment generic_threadedcomm_comment_ptr_id_e208ed60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_threadedcomment
    ADD CONSTRAINT generic_threadedcomm_comment_ptr_id_e208ed60_fk_django_co FOREIGN KEY (comment_ptr_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_threadedcomment generic_threadedcomm_replied_to_id_d0a08d73_fk_generic_t; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.generic_threadedcomment
    ADD CONSTRAINT generic_threadedcomm_replied_to_id_d0a08d73_fk_generic_t FOREIGN KEY (replied_to_id) REFERENCES public.generic_threadedcomment(comment_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_link pages_link_page_ptr_id_37d469f7_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_link
    ADD CONSTRAINT pages_link_page_ptr_id_37d469f7_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page pages_page_parent_id_133fa4d3_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_page
    ADD CONSTRAINT pages_page_parent_id_133fa4d3_fk_pages_page_id FOREIGN KEY (parent_id) REFERENCES public.pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page pages_page_site_id_47a43e5b_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_page
    ADD CONSTRAINT pages_page_site_id_47a43e5b_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_richtextpage pages_richtextpage_page_ptr_id_8ca99b83_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_page_ptr_id_8ca99b83_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twitter_tweet twitter_tweet_query_id_bd42b699_fk_twitter_query_id; Type: FK CONSTRAINT; Schema: public; Owner: cmsuser
--

ALTER TABLE ONLY public.twitter_tweet
    ADD CONSTRAINT twitter_tweet_query_id_bd42b699_fk_twitter_query_id FOREIGN KEY (query_id) REFERENCES public.twitter_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: cmsuser
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO cmsuser;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: cmsuser
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

