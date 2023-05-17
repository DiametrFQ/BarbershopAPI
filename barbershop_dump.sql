--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB NOLOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE analyst;
ALTER ROLE analyst WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE controller;
ALTER ROLE controller WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE manager;
ALTER ROLE manager WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:JkZd/U/NI15SHgdjfYOTzw==$q63BDUrS+s566MISuO1olytl43VZTiRkASuTfOoL7PM=:FJ2xRkPssaaEwoibeC9ecdTdctZ6EftDVPxbxq5I2sM=';
CREATE ROLE test;
ALTER ROLE test WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:WNji5gpH24RLJeDhxml2Bg==$wfNxZipMuI+2GuHLgYZs16cfrZGSuX0mmpLaISuB+fc=:gyjEZA6ZftS1rkblGjKEPoT2fo9FjhLPVTj6WTLofVo=';
CREATE ROLE test2;
ALTER ROLE test2 WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:idbnIhPL4CvcK0VnqpgYPA==$B7IgwqJOfyjFj+LMBKSbRpizoHgcH+Wrv2DdbhL3WrE=:TyyiIswXkqN0On22As3Hb1ouXiAWr3xzvADmBx7/fts=';
CREATE ROLE testadmin;
ALTER ROLE testadmin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:1ZBihsFzIvYuacnp2bB4ZA==$Ml/FJ9R/qL4bGQrUr4qB9apZHzWtaqcB3u0dok1826s=:+uaJheM8bUwL8JzD7rTtkKfQrs5oURQhDWVExQ08TFk=';
CREATE ROLE testanalyst;
ALTER ROLE testanalyst WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:sThN7JhT4k7sCU6Aw6HH3g==$awD2+5AzYY3Iw7b7oL5oInSOY264mOfo8jgkhGBm0pM=:xbYjNWwBc0aAvK3sKNRQYlrqq95ThSWD4VezRdYfv8Y=';
CREATE ROLE testmanager;
ALTER ROLE testmanager WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:E+9GfBzbGdCNmJVu7ZSf2w==$N24o3gRq5HwJW/QIlRYaQmgLRUQWoVFOwH14whq4zzs=:6DYgEu/hLBmBdBdkFV/COlYR0dovr+v1oTotK2mEvEo=';
CREATE ROLE testworker;
ALTER ROLE testworker WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:1fjXkWdyXnzvD0gYbHBRMA==$IrJp9S6Wlj8pL70CLG4fjmr3THm92R1ZGvlz1uTPfo4=:RNTHomUnSGI2LsdBFBC8Q00dqCQcIjqoGRTzMROp9Rs=';
CREATE ROLE worker;
ALTER ROLE worker WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;

--
-- User Configurations
--


--
-- Role memberships
--

GRANT admin TO test GRANTED BY postgres;
GRANT admin TO test2 GRANTED BY admin;
GRANT admin TO testadmin GRANTED BY postgres;
GRANT analyst TO testanalyst GRANTED BY postgres;
GRANT manager TO testmanager GRANTED BY postgres;
GRANT worker TO testworker GRANTED BY postgres;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- PostgreSQL database dump complete
--

--
-- Database "barbershop" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: barbershop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE barbershop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE barbershop OWNER TO postgres;

\connect barbershop

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
-- Name: copy_check(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_check(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE
    copy_sql text;
    full_path text;
BEGIN
    full_path := 'D:\reports\revenue' || '_' || to_char(now(),'YYYY_MM_DD_HH24_MI_SS') || '.csv';
    copy_sql := 'COPY ' || '(SELECT order_id, service_id AS Услуга,price, SUM(price) AS Сумма FROM "order" INNER JOIN order_info USING(order_id) INNER JOIN service USING(service_id) WHERE order_id = '||$1||' GROUP BY order_id,Услуга,price ORDER BY price DESC
' ||') TO ' || quote_literal(full_path) || ' WITH DELIMITER ' || quote_literal(',') || ' CSV HEADER';
    EXECUTE copy_sql;
END
$_$;


ALTER FUNCTION public.copy_check(integer) OWNER TO postgres;

--
-- Name: copy_to_csv(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_to_csv(table_name text, file_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    copy_sql text;
    full_path text;
BEGIN
    full_path := 'D:\reports\' || file_name || '_' || to_char(now(),'YYYY_MM_DD_HH24_MI_SS') || '.csv';
    copy_sql := 'COPY ' || '(SELECT * FROM ' || table_name || ') TO ' || quote_literal(full_path) || ' WITH DELIMITER ' || quote_literal(',') || ' CSV HEADER';
    EXECUTE copy_sql;
END;
$$;


ALTER FUNCTION public.copy_to_csv(table_name text, file_name text) OWNER TO postgres;

--
-- Name: copy_to_csv_service_rating(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_to_csv_service_rating() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    copy_sql text;
    full_path text;
BEGIN
    full_path := 'D:\reports\revenue' || '_' || to_char(now(),'YYYY_MM_DD_HH24_MI_SS') || '.csv';
    copy_sql := 'COPY ' || '(SELECT service_name, SUM(price) AS Сумма FROM "order" INNER JOIN order_info USING(order_id) INNER JOIN service USING(service_id) GROUP BY service_name ORDER BY Сумма DESC
' ||') TO ' || quote_literal(full_path) || ' WITH DELIMITER ' || quote_literal(',') || ' CSV HEADER';
    EXECUTE copy_sql;
END;
$$;


ALTER FUNCTION public.copy_to_csv_service_rating() OWNER TO postgres;

--
-- Name: copy_to_csv_workers_rating(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_to_csv_workers_rating() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    copy_sql text;
    full_path text;
BEGIN
    full_path := 'D:\reports\revenue' || '_' || to_char(now(),'YYYY_MM_DD_HH24_MI_SS') || '.csv';
    copy_sql := 'COPY ' || '(SELECT "fullName" ФИО,rating рейтинг FROM worker ORDER BY рейтинг DESC' ||') TO ' || quote_literal(full_path) || ' WITH DELIMITER ' || quote_literal(',') || ' CSV HEADER';
    EXECUTE copy_sql;
END;
$$;


ALTER FUNCTION public.copy_to_csv_workers_rating() OWNER TO postgres;

--
-- Name: get_revenue(date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_revenue(date_from date, date_to date) RETURNS TABLE(order_id integer, money money)
    LANGUAGE sql
    AS $$
    SELECT "order".order_id, sum_price AS money
    FROM worker
        JOIN service USING(worker_id)
        JOIN order_info USING(service_id)
        JOIN "order" USING(order_id)
        JOIN client USING(client_id)
    WHERE "order".order_date BETWEEN date_from AND date_to
    GROUP BY "order".order_id;
$$;


ALTER FUNCTION public.get_revenue(date_from date, date_to date) OWNER TO postgres;

--
-- Name: report_revenue(date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.report_revenue(date, date) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
    CREATE TEMP TABLE tmp_revenue AS
    SELECT * FROM get_revenue($1, $2);
    PERFORM copy_to_csv('tmp_revenue', 'revenue');
    DROP TABLE tmp_revenue;
END
$_$;


ALTER FUNCTION public.report_revenue(date, date) OWNER TO postgres;

--
-- Name: update_avg_price(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_avg_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF tg_op = 'INSERT' AND EXISTS (SELECT 1 FROM pg_trigger_depth() WHERE pg_trigger_depth() > 1) THEN
        RETURN NEW;
    ELSIF tg_op = 'UPDATE' AND EXISTS (SELECT 1 FROM pg_trigger_depth() WHERE pg_trigger_depth() > 1) THEN
        RETURN NEW;
    ELSIF tg_op = 'DELETE' AND EXISTS (SELECT 1 FROM pg_trigger_depth() WHERE pg_trigger_depth() > 1) THEN
        RETURN OLD;
    END IF;

    UPDATE "order"
    SET sum_price = subquery.sum_price
    FROM (
        SELECT order_id, SUM(price) AS sum_price
        FROM order_info
        INNER JOIN service USING(service_id)
        GROUP BY order_id
    ) AS subquery
    WHERE "order".order_id = subquery.order_id;

    RETURN null;
END
$$;


ALTER FUNCTION public.update_avg_price() OWNER TO postgres;

--
-- Name: update_rating(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_rating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE worker
SET rating = subquery.avg_grade
FROM (
    SELECT worker_id, SUM(grade)/COUNT(grade) AS avg_grade
    FROM service
    INNER JOIN order_info USING(service_id)
    INNER JOIN "order" USING(order_id)
    GROUP BY worker_id
) AS subquery
WHERE worker.worker_id = subquery.worker_id;
    RETURN null;
END
$$;


ALTER FUNCTION public.update_rating() OWNER TO postgres;

--
-- Name: update_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE client
SET status_id = CASE
                    WHEN subquery.order_count > 5 THEN (SELECT status_id FROM status WHERE status_name LIKE 'Премиум')
                    WHEN subquery.order_count > 2 THEN (SELECT status_id FROM status WHERE status_name LIKE 'Постоянный')
                    ELSE (SELECT status_id FROM status WHERE status_name LIKE 'Обычный')
                END
FROM (
    SELECT client_id, COUNT(*) AS order_count
    FROM status
    INNER JOIN client USING(status_id)
    INNER JOIN "order" USING(client_id)
    GROUP BY client_id
) AS subquery
WHERE client.client_id = subquery.client_id;
    RETURN null;
END
$$;


ALTER FUNCTION public.update_status() OWNER TO postgres;

--
-- Name: update_workers_count(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_workers_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE organization
SET workers_count = (SELECT COUNT(*) AS worker_count FROM worker)
WHERE organization_id = 1;
RETURN null;
END;
$$;


ALTER FUNCTION public.update_workers_count() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    status_id integer,
    client_name character varying[]
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_client_id_seq OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- Name: client_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_contacts (
    client_contacts_id integer NOT NULL,
    phone_number character varying(100),
    home_address character varying(100),
    client_id integer
);


ALTER TABLE public.client_contacts OWNER TO postgres;

--
-- Name: client_contacts_client_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_contacts_client_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_contacts_client_contacts_id_seq OWNER TO postgres;

--
-- Name: client_contacts_client_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_contacts_client_contacts_id_seq OWNED BY public.client_contacts.client_contacts_id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_id integer NOT NULL,
    order_date date NOT NULL,
    client_id integer,
    grade integer,
    sum_price integer
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: grade_min_max_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_min_max_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 5
    CACHE 1;


ALTER TABLE public.grade_min_max_seq OWNER TO postgres;

--
-- Name: grade_min_max_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_min_max_seq OWNED BY public."order".grade;


--
-- Name: order_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_info (
    order_info_id integer NOT NULL,
    order_id integer,
    service_id integer
);


ALTER TABLE public.order_info OWNER TO postgres;

--
-- Name: order_info_order_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_info_order_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_info_order_info_id_seq OWNER TO postgres;

--
-- Name: order_info_order_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_info_order_info_id_seq OWNED BY public.order_info.order_info_id;


--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;


--
-- Name: organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization (
    organization_id integer NOT NULL,
    org_address character varying(100) NOT NULL,
    post_index character varying(6) NOT NULL,
    phone_number bigint NOT NULL,
    workers_count bigint NOT NULL
);


ALTER TABLE public.organization OWNER TO postgres;

--
-- Name: organization_workers_count_min_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organization_workers_count_min_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_workers_count_min_seq OWNER TO postgres;

--
-- Name: organization_workers_count_min_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organization_workers_count_min_seq OWNED BY public.organization.workers_count;


--
-- Name: organozation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organozation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organozation_id_seq OWNER TO postgres;

--
-- Name: organozation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organozation_id_seq OWNED BY public.organization.organization_id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    service_id integer NOT NULL,
    service_name character varying(50),
    price integer,
    worker_id integer
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: price_min_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_min_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_min_seq OWNER TO postgres;

--
-- Name: price_min_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_min_seq OWNED BY public.service.price;


--
-- Name: service_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_service_id_seq OWNER TO postgres;

--
-- Name: service_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_service_id_seq OWNED BY public.service.service_id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    status_id integer NOT NULL,
    status_name character varying(30)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_status_id_seq OWNER TO postgres;

--
-- Name: status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_status_id_seq OWNED BY public.status.status_id;


--
-- Name: temp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.temp AS
 SELECT (sum("order".grade) / count("order".grade)) AS rate,
    service.worker_id
   FROM ((public."order"
     JOIN public.order_info USING (order_id))
     JOIN public.service USING (service_id))
  GROUP BY service.worker_id;


ALTER TABLE public.temp OWNER TO postgres;

--
-- Name: worker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker (
    "fullName" character varying(100) NOT NULL,
    function character varying(25) NOT NULL,
    experience integer,
    salary integer NOT NULL,
    age integer NOT NULL,
    rating integer,
    worker_id integer NOT NULL,
    contacts_id integer,
    login character varying
);


ALTER TABLE public.worker OWNER TO postgres;

--
-- Name: worker_age_min_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_age_min_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_age_min_seq OWNER TO postgres;

--
-- Name: worker_age_min_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_age_min_seq OWNED BY public.worker.age;


--
-- Name: worker_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_contacts (
    contacts_id integer NOT NULL,
    phone_number bigint NOT NULL,
    home_address character varying(100) NOT NULL
);


ALTER TABLE public.worker_contacts OWNER TO postgres;

--
-- Name: worker_contacts_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_contacts_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_contacts_contacts_id_seq OWNER TO postgres;

--
-- Name: worker_contacts_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_contacts_contacts_id_seq OWNED BY public.worker_contacts.contacts_id;


--
-- Name: worker_worker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_worker_id_seq OWNER TO postgres;

--
-- Name: worker_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_worker_id_seq OWNED BY public.worker.worker_id;


--
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- Name: client_contacts client_contacts_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_contacts ALTER COLUMN client_contacts_id SET DEFAULT nextval('public.client_contacts_client_contacts_id_seq'::regclass);


--
-- Name: order order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_info order_info_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_info ALTER COLUMN order_info_id SET DEFAULT nextval('public.order_info_order_info_id_seq'::regclass);


--
-- Name: organization organization_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization ALTER COLUMN organization_id SET DEFAULT nextval('public.organozation_id_seq'::regclass);


--
-- Name: service service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN service_id SET DEFAULT nextval('public.service_service_id_seq'::regclass);


--
-- Name: status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN status_id SET DEFAULT nextval('public.status_status_id_seq'::regclass);


--
-- Name: worker worker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker ALTER COLUMN worker_id SET DEFAULT nextval('public.worker_worker_id_seq'::regclass);


--
-- Name: worker_contacts contacts_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_contacts ALTER COLUMN contacts_id SET DEFAULT nextval('public.worker_contacts_contacts_id_seq'::regclass);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (client_id, status_id, client_name) FROM stdin;
6	1	\N
4	1	\N
5	1	\N
1	2	\N
2	1	\N
3	1	\N
22	1	\N
\.


--
-- Data for Name: client_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_contacts (client_contacts_id, phone_number, home_address, client_id) FROM stdin;
2	81948883921	ул. Краснофлотская 19	2
3	89403838392	ул. Преображенская площадь 20	3
1	89348394856	ул.Тропинкина 126	1
5	89238590483	\N	4
6	89438594839	ул. Покрышкина 124	5
7	84939589304	Ул.Автоматная 4	6
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (order_id, order_date, client_id, grade, sum_price) FROM stdin;
6	2023-05-23	1	5	1234
8	2023-05-23	1	4	32455
10	2023-05-23	1	3	123454
9	2023-04-05	1	1	6000
3	2023-04-14	2	5	1600
5	2022-08-11	3	1	6000
2	2022-11-30	4	1	9000
7	2023-04-04	5	2	1500
1	2023-12-08	1	5	3100
20	2023-05-11	\N	5	\N
\.


--
-- Data for Name: order_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_info (order_info_id, order_id, service_id) FROM stdin;
1	1	2
2	2	3
3	3	4
5	5	3
7	7	2
9	9	3
4	1	4
8	2	2
10	2	2
11	\N	3
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organization (organization_id, org_address, post_index, phone_number, workers_count) FROM stdin;
1	ул.Стромынка 25	107076	89143822102	6
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (service_id, service_name, price, worker_id) FROM stdin;
3	hair coloring	6000	27
4	shaving	1600	27
2	haircuts	1500	3
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (status_id, status_name) FROM stdin;
1	Обычный
2	Постоянный
3	Премиум
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker ("fullName", function, experience, salary, age, rating, worker_id, contacts_id, login) FROM stdin;
Орангутанг Аска Синдзивна	worker	1	31000	19	2	3	3	test2
Бычков Алексей Андреевич	worker	0	35000	18	2	27	7	testworker
Константинов Константин Контантинович	manager	0	30000	21	3	1	1	testmanager
Астраханов Сергей Юрьевич	admin	7	30000	29	1	2	2	testadmin
Артемов Артем Артемович	controller	2	45000	24	1	25	5	testcontroller
Король Анастасия Николаевна	analyst	1	50000	21	\N	26	6	testanalyst
\.


--
-- Data for Name: worker_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_contacts (contacts_id, phone_number, home_address) FROM stdin;
1	89123212322	ул.Сталеваров 123
2	89122452494	ул.Криворукова 19
3	89124849305	ул.Руконогово 134
5	89149149203	ул.Какаято 12
6	89149403920	ул.Мобильная 1
7	89111116661	ул.Десктопная 2
\.


--
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_client_id_seq', 22, true);


--
-- Name: client_contacts_client_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_contacts_client_contacts_id_seq', 7, true);


--
-- Name: grade_min_max_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grade_min_max_seq', 0, false);


--
-- Name: order_info_order_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_info_order_info_id_seq', 11, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_id_seq', 20, true);


--
-- Name: organization_workers_count_min_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organization_workers_count_min_seq', 0, false);


--
-- Name: organozation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organozation_id_seq', 2, true);


--
-- Name: price_min_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_min_seq', 0, false);


--
-- Name: service_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_service_id_seq', 4, true);


--
-- Name: status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_status_id_seq', 2, true);


--
-- Name: worker_age_min_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_age_min_seq', 0, false);


--
-- Name: worker_contacts_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_contacts_contacts_id_seq', 7, true);


--
-- Name: worker_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_worker_id_seq', 27, true);


--
-- Name: client_contacts client_contacts_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_contacts
    ADD CONSTRAINT client_contacts_client_id_key UNIQUE (client_id);


--
-- Name: client_contacts client_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_contacts
    ADD CONSTRAINT client_contacts_pkey PRIMARY KEY (client_contacts_id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- Name: order_info order_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_info
    ADD CONSTRAINT order_info_pkey PRIMARY KEY (order_info_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- Name: organization organozation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organozation_pkey PRIMARY KEY (organization_id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (service_id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);


--
-- Name: worker uk_worker_contacts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT uk_worker_contacts_id UNIQUE (contacts_id);


--
-- Name: worker_contacts worker_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_contacts
    ADD CONSTRAINT worker_contacts_pkey PRIMARY KEY (contacts_id);


--
-- Name: worker worker_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_login_key UNIQUE (login);


--
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (worker_id);


--
-- Name: client_contacts_home_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_contacts_home_address_idx ON public.client_contacts USING btree (home_address);


--
-- Name: client_contacts_phone_number_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_contacts_phone_number_idx ON public.client_contacts USING btree (phone_number);


--
-- Name: order_grade_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_grade_idx ON public."order" USING btree (grade);


--
-- Name: order_order_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_date_idx ON public."order" USING btree (order_date);


--
-- Name: order_sum_price_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_sum_price_idx ON public."order" USING btree (sum_price);


--
-- Name: service_price_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_price_idx ON public.service USING btree (price);


--
-- Name: service_service_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX service_service_name_idx ON public.service USING btree (service_name);


--
-- Name: status_status_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX status_status_name_idx ON public.status USING btree (status_name);


--
-- Name: worker_contacts_home_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX worker_contacts_home_address_idx ON public.worker_contacts USING btree (home_address);


--
-- Name: worker_contacts_phone_number_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX worker_contacts_phone_number_idx ON public.worker_contacts USING btree (phone_number);


--
-- Name: worker_fullnam_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX worker_fullnam_idx ON public.worker USING btree ("fullName");


--
-- Name: worker_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX worker_login_idx ON public.worker USING btree (login);


--
-- Name: worker_rating_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX worker_rating_idx ON public.worker USING btree (rating);


--
-- Name: order rating; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER rating AFTER INSERT OR DELETE OR UPDATE ON public."order" FOR EACH STATEMENT EXECUTE FUNCTION public.update_rating();


--
-- Name: order set_avg_price; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_avg_price AFTER INSERT OR DELETE OR UPDATE ON public."order" FOR EACH STATEMENT EXECUTE FUNCTION public.update_avg_price();


--
-- Name: order_info set_avg_price; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_avg_price AFTER INSERT OR DELETE OR UPDATE ON public.order_info FOR EACH STATEMENT EXECUTE FUNCTION public.update_avg_price();


--
-- Name: order status; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER status AFTER INSERT OR DELETE OR UPDATE ON public."order" FOR EACH STATEMENT EXECUTE FUNCTION public.update_status();


--
-- Name: worker update_workers_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_workers_trigger AFTER INSERT OR DELETE OR UPDATE ON public.worker FOR EACH STATEMENT EXECUTE FUNCTION public.update_workers_count();


--
-- Name: client_contacts client_contacts_client_client_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_contacts
    ADD CONSTRAINT client_contacts_client_client_id_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;


--
-- Name: client client_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(status_id);


--
-- Name: order order_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- Name: order_info order_info_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_info
    ADD CONSTRAINT order_info_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);


--
-- Name: order_info order_info_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_info
    ADD CONSTRAINT order_info_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(service_id);


--
-- Name: service service_worker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.worker(worker_id);


--
-- Name: worker worker_contacts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_contacts_id_fkey FOREIGN KEY (contacts_id) REFERENCES public.worker_contacts(contacts_id) ON DELETE CASCADE;


--
-- Name: client; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.client ENABLE ROW LEVEL SECURITY;

--
-- Name: client_contacts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.client_contacts ENABLE ROW LEVEL SECURITY;

--
-- Name: client_contacts notworker_client_contacts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY notworker_client_contacts ON public.client_contacts TO analyst, manager, controller, admin USING (true) WITH CHECK (true);


--
-- Name: client notworker_clients; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY notworker_clients ON public.client TO analyst, manager, controller, admin USING (true) WITH CHECK (true);


--
-- Name: order notworker_order; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY notworker_order ON public."order" TO analyst, manager, controller, admin USING (true) WITH CHECK (true);


--
-- Name: order_info notworker_orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY notworker_orders ON public.order_info TO analyst, manager, controller, admin USING (true) WITH CHECK (true);


--
-- Name: service notworker_service; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY notworker_service ON public.service TO analyst, manager, controller, admin USING (true) WITH CHECK (true);


--
-- Name: worker notworker_worker; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY notworker_worker ON public.worker TO analyst, manager, controller, admin USING (true) WITH CHECK (true);


--
-- Name: order; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."order" ENABLE ROW LEVEL SECURITY;

--
-- Name: order_info; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.order_info ENABLE ROW LEVEL SECURITY;

--
-- Name: service; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.service ENABLE ROW LEVEL SECURITY;

--
-- Name: worker; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.worker ENABLE ROW LEVEL SECURITY;

--
-- Name: client_contacts worker_client_contacts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY worker_client_contacts ON public.client_contacts TO worker USING ((client_id IN ( SELECT "order".client_id
   FROM public."order"
  WHERE ("order".order_id IN ( SELECT order_info.order_id
           FROM ((public.order_info
             JOIN public.service USING (service_id))
             JOIN public.worker USING (worker_id))
          WHERE ((worker.login)::text = CURRENT_USER)))))) WITH CHECK (true);


--
-- Name: client worker_clients; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY worker_clients ON public.client TO worker USING ((client_id IN ( SELECT "order".client_id
   FROM public."order"
  WHERE ("order".order_id IN ( SELECT order_info.order_id
           FROM ((public.order_info
             JOIN public.service USING (service_id))
             JOIN public.worker USING (worker_id))
          WHERE ((worker.login)::text = CURRENT_USER)))))) WITH CHECK (true);


--
-- Name: order worker_order; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY worker_order ON public."order" TO worker USING ((order_id IN ( SELECT order_info.order_id
   FROM ((public.order_info
     JOIN public.service USING (service_id))
     JOIN public.worker USING (worker_id))
  WHERE ((worker.login)::text = CURRENT_USER)))) WITH CHECK (true);


--
-- Name: order_info worker_orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY worker_orders ON public.order_info TO worker USING ((service_id IN ( SELECT service.service_id
   FROM public.service
  WHERE (service.worker_id IN ( SELECT worker.worker_id
           FROM public.worker
          WHERE ((worker.login)::text = CURRENT_USER)))))) WITH CHECK (true);


--
-- Name: service workers_service; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY workers_service ON public.service TO worker USING ((worker_id = ( SELECT worker.worker_id
   FROM public.worker
  WHERE ((worker.login)::text = CURRENT_USER)))) WITH CHECK (true);


--
-- Name: worker workers_worker; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY workers_worker ON public.worker TO worker USING (((login)::text = CURRENT_USER));


--
-- Name: DATABASE barbershop; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE barbershop TO test;
GRANT ALL ON DATABASE barbershop TO admin;


--
-- Name: FUNCTION copy_to_csv(table_name text, file_name text); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION public.copy_to_csv(table_name text, file_name text) FROM PUBLIC;
GRANT ALL ON FUNCTION public.copy_to_csv(table_name text, file_name text) TO admin;
GRANT ALL ON FUNCTION public.copy_to_csv(table_name text, file_name text) TO analyst;
GRANT ALL ON FUNCTION public.copy_to_csv(table_name text, file_name text) TO manager;
GRANT ALL ON FUNCTION public.copy_to_csv(table_name text, file_name text) TO controller;


--
-- Name: FUNCTION copy_to_csv_service_rating(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.copy_to_csv_service_rating() TO admin;
GRANT ALL ON FUNCTION public.copy_to_csv_service_rating() TO analyst;
GRANT ALL ON FUNCTION public.copy_to_csv_service_rating() TO manager;
GRANT ALL ON FUNCTION public.copy_to_csv_service_rating() TO controller;


--
-- Name: FUNCTION copy_to_csv_workers_rating(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.copy_to_csv_workers_rating() TO admin;
GRANT ALL ON FUNCTION public.copy_to_csv_workers_rating() TO analyst;
GRANT ALL ON FUNCTION public.copy_to_csv_workers_rating() TO manager;
GRANT ALL ON FUNCTION public.copy_to_csv_workers_rating() TO controller;


--
-- Name: FUNCTION get_revenue(date_from date, date_to date); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_revenue(date_from date, date_to date) TO controller;
GRANT ALL ON FUNCTION public.get_revenue(date_from date, date_to date) TO admin;
GRANT ALL ON FUNCTION public.get_revenue(date_from date, date_to date) TO analyst;
GRANT ALL ON FUNCTION public.get_revenue(date_from date, date_to date) TO manager;


--
-- Name: FUNCTION report_revenue(date, date); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION public.report_revenue(date, date) FROM PUBLIC;
GRANT ALL ON FUNCTION public.report_revenue(date, date) TO admin;
GRANT ALL ON FUNCTION public.report_revenue(date, date) TO analyst;
GRANT ALL ON FUNCTION public.report_revenue(date, date) TO controller;
GRANT ALL ON FUNCTION public.report_revenue(date, date) TO manager;


--
-- Name: FUNCTION update_avg_price(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_avg_price() TO worker;
GRANT ALL ON FUNCTION public.update_avg_price() TO manager;
GRANT ALL ON FUNCTION public.update_avg_price() TO controller;
GRANT ALL ON FUNCTION public.update_avg_price() TO analyst;


--
-- Name: FUNCTION update_rating(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_rating() TO worker;
GRANT ALL ON FUNCTION public.update_rating() TO manager;
GRANT ALL ON FUNCTION public.update_rating() TO controller;
GRANT ALL ON FUNCTION public.update_rating() TO analyst;


--
-- Name: FUNCTION update_status(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_status() TO worker;
GRANT ALL ON FUNCTION public.update_status() TO manager;
GRANT ALL ON FUNCTION public.update_status() TO controller;
GRANT ALL ON FUNCTION public.update_status() TO analyst;


--
-- Name: FUNCTION update_workers_count(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_workers_count() TO worker;
GRANT ALL ON FUNCTION public.update_workers_count() TO manager;
GRANT ALL ON FUNCTION public.update_workers_count() TO controller;
GRANT ALL ON FUNCTION public.update_workers_count() TO analyst;


--
-- Name: TABLE pg_aggregate; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_aggregate TO admin;


--
-- Name: TABLE pg_am; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_am TO admin;


--
-- Name: TABLE pg_amop; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_amop TO admin;


--
-- Name: TABLE pg_amproc; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_amproc TO admin;


--
-- Name: TABLE pg_attrdef; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_attrdef TO admin;


--
-- Name: TABLE pg_attribute; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_attribute TO admin;


--
-- Name: TABLE pg_auth_members; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_auth_members TO admin;


--
-- Name: TABLE pg_authid; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_authid TO admin;


--
-- Name: TABLE pg_available_extension_versions; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_available_extension_versions TO admin;


--
-- Name: TABLE pg_available_extensions; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_available_extensions TO admin;


--
-- Name: TABLE pg_backend_memory_contexts; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_backend_memory_contexts TO admin;


--
-- Name: TABLE pg_cast; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_cast TO admin;


--
-- Name: TABLE pg_class; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_class TO admin;


--
-- Name: TABLE pg_collation; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_collation TO admin;


--
-- Name: TABLE pg_config; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_config TO admin;


--
-- Name: TABLE pg_constraint; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_constraint TO admin;


--
-- Name: TABLE pg_conversion; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_conversion TO admin;


--
-- Name: TABLE pg_cursors; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_cursors TO admin;


--
-- Name: TABLE pg_database; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_database TO admin;


--
-- Name: TABLE pg_db_role_setting; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_db_role_setting TO admin;


--
-- Name: TABLE pg_default_acl; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_default_acl TO admin;


--
-- Name: TABLE pg_depend; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_depend TO admin;


--
-- Name: TABLE pg_description; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_description TO admin;


--
-- Name: TABLE pg_enum; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_enum TO admin;


--
-- Name: TABLE pg_event_trigger; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_event_trigger TO admin;


--
-- Name: TABLE pg_extension; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_extension TO admin;


--
-- Name: TABLE pg_file_settings; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_file_settings TO admin;


--
-- Name: TABLE pg_foreign_data_wrapper; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_foreign_data_wrapper TO admin;


--
-- Name: TABLE pg_foreign_server; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_foreign_server TO admin;


--
-- Name: TABLE pg_foreign_table; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_foreign_table TO admin;


--
-- Name: TABLE pg_group; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_group TO admin;


--
-- Name: TABLE pg_hba_file_rules; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_hba_file_rules TO admin;


--
-- Name: TABLE pg_ident_file_mappings; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_ident_file_mappings TO admin;


--
-- Name: TABLE pg_index; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_index TO admin;


--
-- Name: TABLE pg_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_indexes TO admin;


--
-- Name: TABLE pg_inherits; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_inherits TO admin;


--
-- Name: TABLE pg_init_privs; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_init_privs TO admin;


--
-- Name: TABLE pg_language; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_language TO admin;


--
-- Name: TABLE pg_largeobject; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_largeobject TO admin;


--
-- Name: TABLE pg_largeobject_metadata; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_largeobject_metadata TO admin;


--
-- Name: TABLE pg_locks; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_locks TO admin;


--
-- Name: TABLE pg_matviews; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_matviews TO admin;


--
-- Name: TABLE pg_namespace; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_namespace TO admin;


--
-- Name: TABLE pg_opclass; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_opclass TO admin;


--
-- Name: TABLE pg_operator; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_operator TO admin;


--
-- Name: TABLE pg_opfamily; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_opfamily TO admin;


--
-- Name: TABLE pg_parameter_acl; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_parameter_acl TO admin;


--
-- Name: TABLE pg_partitioned_table; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_partitioned_table TO admin;


--
-- Name: TABLE pg_policies; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_policies TO admin;


--
-- Name: TABLE pg_policy; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_policy TO admin;


--
-- Name: TABLE pg_prepared_statements; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_prepared_statements TO admin;


--
-- Name: TABLE pg_prepared_xacts; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_prepared_xacts TO admin;


--
-- Name: TABLE pg_proc; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_proc TO admin;


--
-- Name: TABLE pg_publication; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_publication TO admin;


--
-- Name: TABLE pg_publication_namespace; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_publication_namespace TO admin;


--
-- Name: TABLE pg_publication_rel; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_publication_rel TO admin;


--
-- Name: TABLE pg_publication_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_publication_tables TO admin;


--
-- Name: TABLE pg_range; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_range TO admin;


--
-- Name: TABLE pg_replication_origin; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_replication_origin TO admin;


--
-- Name: TABLE pg_replication_origin_status; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_replication_origin_status TO admin;


--
-- Name: TABLE pg_replication_slots; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_replication_slots TO admin;


--
-- Name: TABLE pg_rewrite; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_rewrite TO admin;


--
-- Name: TABLE pg_roles; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_roles TO admin;


--
-- Name: TABLE pg_rules; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_rules TO admin;


--
-- Name: TABLE pg_seclabel; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_seclabel TO admin;


--
-- Name: TABLE pg_seclabels; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_seclabels TO admin;


--
-- Name: TABLE pg_sequence; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_sequence TO admin;


--
-- Name: TABLE pg_sequences; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_sequences TO admin;


--
-- Name: TABLE pg_settings; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_settings TO admin;


--
-- Name: TABLE pg_shadow; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_shadow TO admin;


--
-- Name: TABLE pg_shdepend; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_shdepend TO admin;


--
-- Name: TABLE pg_shdescription; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_shdescription TO admin;


--
-- Name: TABLE pg_shmem_allocations; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_shmem_allocations TO admin;


--
-- Name: TABLE pg_shseclabel; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_shseclabel TO admin;


--
-- Name: TABLE pg_stat_activity; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_activity TO admin;


--
-- Name: TABLE pg_stat_all_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_all_indexes TO admin;


--
-- Name: TABLE pg_stat_all_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_all_tables TO admin;


--
-- Name: TABLE pg_stat_archiver; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_archiver TO admin;


--
-- Name: TABLE pg_stat_bgwriter; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_bgwriter TO admin;


--
-- Name: TABLE pg_stat_database; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_database TO admin;


--
-- Name: TABLE pg_stat_database_conflicts; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_database_conflicts TO admin;


--
-- Name: TABLE pg_stat_gssapi; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_gssapi TO admin;


--
-- Name: TABLE pg_stat_progress_analyze; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_progress_analyze TO admin;


--
-- Name: TABLE pg_stat_progress_basebackup; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_progress_basebackup TO admin;


--
-- Name: TABLE pg_stat_progress_cluster; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_progress_cluster TO admin;


--
-- Name: TABLE pg_stat_progress_copy; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_progress_copy TO admin;


--
-- Name: TABLE pg_stat_progress_create_index; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_progress_create_index TO admin;


--
-- Name: TABLE pg_stat_progress_vacuum; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_progress_vacuum TO admin;


--
-- Name: TABLE pg_stat_recovery_prefetch; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_recovery_prefetch TO admin;


--
-- Name: TABLE pg_stat_replication; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_replication TO admin;


--
-- Name: TABLE pg_stat_replication_slots; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_replication_slots TO admin;


--
-- Name: TABLE pg_stat_slru; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_slru TO admin;


--
-- Name: TABLE pg_stat_ssl; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_ssl TO admin;


--
-- Name: TABLE pg_stat_subscription; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_subscription TO admin;


--
-- Name: TABLE pg_stat_subscription_stats; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_subscription_stats TO admin;


--
-- Name: TABLE pg_stat_sys_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_sys_indexes TO admin;


--
-- Name: TABLE pg_stat_sys_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_sys_tables TO admin;


--
-- Name: TABLE pg_stat_user_functions; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_user_functions TO admin;


--
-- Name: TABLE pg_stat_user_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_user_indexes TO admin;


--
-- Name: TABLE pg_stat_user_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_user_tables TO admin;


--
-- Name: TABLE pg_stat_wal; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_wal TO admin;


--
-- Name: TABLE pg_stat_wal_receiver; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_wal_receiver TO admin;


--
-- Name: TABLE pg_stat_xact_all_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_xact_all_tables TO admin;


--
-- Name: TABLE pg_stat_xact_sys_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_xact_sys_tables TO admin;


--
-- Name: TABLE pg_stat_xact_user_functions; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_xact_user_functions TO admin;


--
-- Name: TABLE pg_stat_xact_user_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stat_xact_user_tables TO admin;


--
-- Name: TABLE pg_statio_all_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_all_indexes TO admin;


--
-- Name: TABLE pg_statio_all_sequences; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_all_sequences TO admin;


--
-- Name: TABLE pg_statio_all_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_all_tables TO admin;


--
-- Name: TABLE pg_statio_sys_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_sys_indexes TO admin;


--
-- Name: TABLE pg_statio_sys_sequences; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_sys_sequences TO admin;


--
-- Name: TABLE pg_statio_sys_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_sys_tables TO admin;


--
-- Name: TABLE pg_statio_user_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_user_indexes TO admin;


--
-- Name: TABLE pg_statio_user_sequences; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_user_sequences TO admin;


--
-- Name: TABLE pg_statio_user_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statio_user_tables TO admin;


--
-- Name: TABLE pg_statistic; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statistic TO admin;


--
-- Name: TABLE pg_statistic_ext; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statistic_ext TO admin;


--
-- Name: TABLE pg_statistic_ext_data; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_statistic_ext_data TO admin;


--
-- Name: TABLE pg_stats; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stats TO admin;


--
-- Name: TABLE pg_stats_ext; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stats_ext TO admin;


--
-- Name: TABLE pg_stats_ext_exprs; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_stats_ext_exprs TO admin;


--
-- Name: TABLE pg_subscription; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_subscription TO admin;


--
-- Name: TABLE pg_subscription_rel; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_subscription_rel TO admin;


--
-- Name: TABLE pg_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_tables TO admin;


--
-- Name: TABLE pg_tablespace; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_tablespace TO admin;


--
-- Name: TABLE pg_timezone_abbrevs; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_timezone_abbrevs TO admin;


--
-- Name: TABLE pg_timezone_names; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_timezone_names TO admin;


--
-- Name: TABLE pg_transform; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_transform TO admin;


--
-- Name: TABLE pg_trigger; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_trigger TO admin;


--
-- Name: TABLE pg_ts_config; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_ts_config TO admin;


--
-- Name: TABLE pg_ts_config_map; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_ts_config_map TO admin;


--
-- Name: TABLE pg_ts_dict; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_ts_dict TO admin;


--
-- Name: TABLE pg_ts_parser; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_ts_parser TO admin;


--
-- Name: TABLE pg_ts_template; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_ts_template TO admin;


--
-- Name: TABLE pg_type; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_type TO admin;


--
-- Name: TABLE pg_user; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_user TO admin;


--
-- Name: TABLE pg_user_mapping; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_user_mapping TO admin;


--
-- Name: TABLE pg_user_mappings; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_user_mappings TO admin;


--
-- Name: TABLE pg_views; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON TABLE pg_catalog.pg_views TO admin;


--
-- Name: TABLE client; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.client TO worker;
GRANT ALL ON TABLE public.client TO manager;
GRANT SELECT ON TABLE public.client TO analyst;
GRANT ALL ON TABLE public.client TO controller;
GRANT ALL ON TABLE public.client TO admin;


--
-- Name: SEQUENCE client_client_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.client_client_id_seq TO worker;


--
-- Name: TABLE client_contacts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.client_contacts TO worker;
GRANT SELECT ON TABLE public.client_contacts TO analyst;
GRANT ALL ON TABLE public.client_contacts TO controller;
GRANT ALL ON TABLE public.client_contacts TO manager;
GRANT ALL ON TABLE public.client_contacts TO admin;


--
-- Name: TABLE "order"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."order" TO manager;
GRANT SELECT ON TABLE public."order" TO analyst;
GRANT ALL ON TABLE public."order" TO controller;
GRANT ALL ON TABLE public."order" TO worker;
GRANT ALL ON TABLE public."order" TO admin;


--
-- Name: TABLE order_info; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.order_info TO worker;
GRANT ALL ON TABLE public.order_info TO manager;
GRANT SELECT ON TABLE public.order_info TO analyst;
GRANT ALL ON TABLE public.order_info TO controller;
GRANT ALL ON TABLE public.order_info TO admin;


--
-- Name: SEQUENCE order_info_order_info_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.order_info_order_info_id_seq TO worker;
GRANT SELECT,USAGE ON SEQUENCE public.order_info_order_info_id_seq TO manager;
GRANT SELECT,USAGE ON SEQUENCE public.order_info_order_info_id_seq TO controller;


--
-- Name: SEQUENCE order_order_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.order_order_id_seq TO worker;


--
-- Name: TABLE organization; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.organization TO analyst;
GRANT ALL ON TABLE public.organization TO controller;
GRANT SELECT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.organization TO worker;
GRANT ALL ON TABLE public.organization TO manager;
GRANT ALL ON TABLE public.organization TO admin;


--
-- Name: TABLE service; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,REFERENCES,DELETE,TRIGGER,TRUNCATE ON TABLE public.service TO worker;
GRANT SELECT ON TABLE public.service TO analyst;
GRANT ALL ON TABLE public.service TO controller;
GRANT ALL ON TABLE public.service TO manager;
GRANT ALL ON TABLE public.service TO admin;


--
-- Name: TABLE status; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.status TO analyst;
GRANT ALL ON TABLE public.status TO controller;
GRANT SELECT,REFERENCES,DELETE,TRIGGER,TRUNCATE ON TABLE public.status TO worker;
GRANT ALL ON TABLE public.status TO manager;
GRANT ALL ON TABLE public.status TO admin;


--
-- Name: TABLE temp; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.temp TO analyst;
GRANT ALL ON TABLE public.temp TO controller;
GRANT ALL ON TABLE public.temp TO worker;
GRANT ALL ON TABLE public.temp TO manager;
GRANT ALL ON TABLE public.temp TO admin;


--
-- Name: TABLE worker; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.worker TO worker;
GRANT SELECT ON TABLE public.worker TO analyst;
GRANT ALL ON TABLE public.worker TO controller;
GRANT ALL ON TABLE public.worker TO manager;
GRANT ALL ON TABLE public.worker TO admin;


--
-- Name: TABLE worker_contacts; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.worker_contacts TO analyst;
GRANT ALL ON TABLE public.worker_contacts TO controller;
GRANT SELECT,REFERENCES,DELETE,TRIGGER,TRUNCATE ON TABLE public.worker_contacts TO worker;
GRANT ALL ON TABLE public.worker_contacts TO manager;
GRANT ALL ON TABLE public.worker_contacts TO admin;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

