--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-31 09:04:19 UTC

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
-- TOC entry 229 (class 1259 OID 16566)
-- Name: book_purchases; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.book_purchases (
    book_id integer NOT NULL,
    purchase_id integer NOT NULL
);


ALTER TABLE public.book_purchases OWNER TO docker;

--
-- TOC entry 228 (class 1259 OID 16551)
-- Name: book_subscriptions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.book_subscriptions (
    book_id integer NOT NULL,
    subscription_id integer NOT NULL
);


ALTER TABLE public.book_subscriptions OWNER TO docker;

--
-- TOC entry 217 (class 1259 OID 16405)
-- Name: books; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying NOT NULL,
    author character varying NOT NULL,
    isbn bigint NOT NULL,
    date date NOT NULL,
    language character varying NOT NULL,
    image character varying NOT NULL,
    description character varying(2000),
    last_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books OWNER TO docker;

--
-- TOC entry 219 (class 1259 OID 16431)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

ALTER TABLE public.books ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16469)
-- Name: platforms; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.platforms (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    link character varying(255) NOT NULL
);


ALTER TABLE public.platforms OWNER TO docker;

--
-- TOC entry 227 (class 1259 OID 16550)
-- Name: platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

ALTER TABLE public.platforms ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16489)
-- Name: purchases; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.purchases (
    id integer NOT NULL,
    platform_id integer,
    digital_version character varying(50)
);


ALTER TABLE public.purchases OWNER TO docker;

--
-- TOC entry 225 (class 1259 OID 16488)
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchases_id_seq OWNER TO docker;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 225
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- TOC entry 224 (class 1259 OID 16477)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    platform_id integer,
    digital_version character varying(50)
);


ALTER TABLE public.subscriptions OWNER TO docker;

--
-- TOC entry 223 (class 1259 OID 16476)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO docker;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 223
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: to_read; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.to_read (
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.to_read OWNER TO docker;

--
-- TOC entry 216 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    name character varying NOT NULL,
    id_user_details integer DEFAULT 0 NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO docker;

--
-- TOC entry 220 (class 1259 OID 16438)
-- Name: users_details; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.users_details (
    id integer NOT NULL,
    phone bigint NOT NULL
);


ALTER TABLE public.users_details OWNER TO docker;

--
-- TOC entry 221 (class 1259 OID 16460)
-- Name: users_details_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

ALTER TABLE public.users_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3237 (class 2604 OID 16492)
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16480)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- TOC entry 3422 (class 0 OID 16566)
-- Dependencies: 229
-- Data for Name: book_purchases; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.book_purchases VALUES (132, 2);
INSERT INTO public.book_purchases VALUES (132, 5);
INSERT INTO public.book_purchases VALUES (132, 7);
INSERT INTO public.book_purchases VALUES (132, 8);
INSERT INTO public.book_purchases VALUES (132, 9);
INSERT INTO public.book_purchases VALUES (132, 3);
INSERT INTO public.book_purchases VALUES (133, 2);
INSERT INTO public.book_purchases VALUES (133, 5);
INSERT INTO public.book_purchases VALUES (133, 7);
INSERT INTO public.book_purchases VALUES (134, 2);
INSERT INTO public.book_purchases VALUES (134, 5);
INSERT INTO public.book_purchases VALUES (134, 7);
INSERT INTO public.book_purchases VALUES (135, 2);
INSERT INTO public.book_purchases VALUES (135, 5);
INSERT INTO public.book_purchases VALUES (135, 7);
INSERT INTO public.book_purchases VALUES (135, 8);
INSERT INTO public.book_purchases VALUES (135, 9);
INSERT INTO public.book_purchases VALUES (136, 5);
INSERT INTO public.book_purchases VALUES (136, 7);
INSERT INTO public.book_purchases VALUES (136, 8);
INSERT INTO public.book_purchases VALUES (136, 9);
INSERT INTO public.book_purchases VALUES (137, 2);
INSERT INTO public.book_purchases VALUES (137, 5);
INSERT INTO public.book_purchases VALUES (137, 7);
INSERT INTO public.book_purchases VALUES (137, 8);
INSERT INTO public.book_purchases VALUES (137, 9);
INSERT INTO public.book_purchases VALUES (138, 2);
INSERT INTO public.book_purchases VALUES (138, 5);
INSERT INTO public.book_purchases VALUES (138, 7);
INSERT INTO public.book_purchases VALUES (140, 5);
INSERT INTO public.book_purchases VALUES (140, 7);
INSERT INTO public.book_purchases VALUES (140, 8);
INSERT INTO public.book_purchases VALUES (141, 2);
INSERT INTO public.book_purchases VALUES (141, 5);
INSERT INTO public.book_purchases VALUES (141, 7);
INSERT INTO public.book_purchases VALUES (141, 8);
INSERT INTO public.book_purchases VALUES (141, 9);
INSERT INTO public.book_purchases VALUES (141, 3);
INSERT INTO public.book_purchases VALUES (142, 2);
INSERT INTO public.book_purchases VALUES (142, 5);
INSERT INTO public.book_purchases VALUES (142, 7);
INSERT INTO public.book_purchases VALUES (142, 8);
INSERT INTO public.book_purchases VALUES (142, 3);
INSERT INTO public.book_purchases VALUES (143, 2);
INSERT INTO public.book_purchases VALUES (143, 5);
INSERT INTO public.book_purchases VALUES (143, 7);
INSERT INTO public.book_purchases VALUES (143, 8);
INSERT INTO public.book_purchases VALUES (143, 9);
INSERT INTO public.book_purchases VALUES (143, 3);
INSERT INTO public.book_purchases VALUES (145, 2);
INSERT INTO public.book_purchases VALUES (145, 5);
INSERT INTO public.book_purchases VALUES (145, 7);
INSERT INTO public.book_purchases VALUES (145, 3);
INSERT INTO public.book_purchases VALUES (131, 2);
INSERT INTO public.book_purchases VALUES (131, 5);
INSERT INTO public.book_purchases VALUES (131, 7);
INSERT INTO public.book_purchases VALUES (131, 8);
INSERT INTO public.book_purchases VALUES (131, 9);
INSERT INTO public.book_purchases VALUES (131, 3);
INSERT INTO public.book_purchases VALUES (146, 2);
INSERT INTO public.book_purchases VALUES (147, 2);
INSERT INTO public.book_purchases VALUES (147, 5);
INSERT INTO public.book_purchases VALUES (147, 7);
INSERT INTO public.book_purchases VALUES (147, 8);
INSERT INTO public.book_purchases VALUES (147, 9);
INSERT INTO public.book_purchases VALUES (147, 3);
INSERT INTO public.book_purchases VALUES (148, 2);
INSERT INTO public.book_purchases VALUES (148, 5);
INSERT INTO public.book_purchases VALUES (148, 7);
INSERT INTO public.book_purchases VALUES (148, 8);
INSERT INTO public.book_purchases VALUES (148, 9);
INSERT INTO public.book_purchases VALUES (148, 3);
INSERT INTO public.book_purchases VALUES (149, 2);
INSERT INTO public.book_purchases VALUES (149, 7);
INSERT INTO public.book_purchases VALUES (150, 7);
INSERT INTO public.book_purchases VALUES (150, 8);
INSERT INTO public.book_purchases VALUES (150, 9);
INSERT INTO public.book_purchases VALUES (150, 3);
INSERT INTO public.book_purchases VALUES (151, 2);
INSERT INTO public.book_purchases VALUES (151, 5);
INSERT INTO public.book_purchases VALUES (151, 7);
INSERT INTO public.book_purchases VALUES (151, 8);
INSERT INTO public.book_purchases VALUES (151, 3);
INSERT INTO public.book_purchases VALUES (152, 2);
INSERT INTO public.book_purchases VALUES (152, 7);
INSERT INTO public.book_purchases VALUES (153, 2);
INSERT INTO public.book_purchases VALUES (153, 3);
INSERT INTO public.book_purchases VALUES (153, 5);
INSERT INTO public.book_purchases VALUES (153, 7);


--
-- TOC entry 3421 (class 0 OID 16551)
-- Dependencies: 228
-- Data for Name: book_subscriptions; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.book_subscriptions VALUES (131, 4);
INSERT INTO public.book_subscriptions VALUES (131, 3);
INSERT INTO public.book_subscriptions VALUES (131, 2);
INSERT INTO public.book_subscriptions VALUES (131, 6);
INSERT INTO public.book_subscriptions VALUES (132, 4);
INSERT INTO public.book_subscriptions VALUES (132, 3);
INSERT INTO public.book_subscriptions VALUES (132, 2);
INSERT INTO public.book_subscriptions VALUES (132, 6);
INSERT INTO public.book_subscriptions VALUES (133, 3);
INSERT INTO public.book_subscriptions VALUES (133, 2);
INSERT INTO public.book_subscriptions VALUES (134, 4);
INSERT INTO public.book_subscriptions VALUES (134, 3);
INSERT INTO public.book_subscriptions VALUES (134, 2);
INSERT INTO public.book_subscriptions VALUES (134, 6);
INSERT INTO public.book_subscriptions VALUES (135, 3);
INSERT INTO public.book_subscriptions VALUES (135, 2);
INSERT INTO public.book_subscriptions VALUES (135, 6);
INSERT INTO public.book_subscriptions VALUES (136, 4);
INSERT INTO public.book_subscriptions VALUES (137, 4);
INSERT INTO public.book_subscriptions VALUES (137, 3);
INSERT INTO public.book_subscriptions VALUES (137, 2);
INSERT INTO public.book_subscriptions VALUES (137, 6);
INSERT INTO public.book_subscriptions VALUES (138, 2);
INSERT INTO public.book_subscriptions VALUES (140, 6);
INSERT INTO public.book_subscriptions VALUES (141, 4);
INSERT INTO public.book_subscriptions VALUES (141, 3);
INSERT INTO public.book_subscriptions VALUES (141, 2);
INSERT INTO public.book_subscriptions VALUES (141, 6);
INSERT INTO public.book_subscriptions VALUES (142, 4);
INSERT INTO public.book_subscriptions VALUES (142, 3);
INSERT INTO public.book_subscriptions VALUES (142, 2);
INSERT INTO public.book_subscriptions VALUES (142, 6);
INSERT INTO public.book_subscriptions VALUES (143, 4);
INSERT INTO public.book_subscriptions VALUES (143, 3);
INSERT INTO public.book_subscriptions VALUES (143, 2);
INSERT INTO public.book_subscriptions VALUES (143, 6);
INSERT INTO public.book_subscriptions VALUES (145, 4);
INSERT INTO public.book_subscriptions VALUES (145, 3);
INSERT INTO public.book_subscriptions VALUES (145, 2);
INSERT INTO public.book_subscriptions VALUES (145, 6);
INSERT INTO public.book_subscriptions VALUES (146, 2);
INSERT INTO public.book_subscriptions VALUES (147, 4);
INSERT INTO public.book_subscriptions VALUES (147, 3);
INSERT INTO public.book_subscriptions VALUES (147, 2);
INSERT INTO public.book_subscriptions VALUES (147, 6);
INSERT INTO public.book_subscriptions VALUES (148, 4);
INSERT INTO public.book_subscriptions VALUES (148, 3);
INSERT INTO public.book_subscriptions VALUES (148, 2);
INSERT INTO public.book_subscriptions VALUES (148, 6);
INSERT INTO public.book_subscriptions VALUES (149, 2);
INSERT INTO public.book_subscriptions VALUES (149, 6);
INSERT INTO public.book_subscriptions VALUES (150, 4);
INSERT INTO public.book_subscriptions VALUES (150, 3);
INSERT INTO public.book_subscriptions VALUES (151, 4);
INSERT INTO public.book_subscriptions VALUES (151, 3);
INSERT INTO public.book_subscriptions VALUES (151, 2);
INSERT INTO public.book_subscriptions VALUES (151, 6);
INSERT INTO public.book_subscriptions VALUES (152, 2);
INSERT INTO public.book_subscriptions VALUES (152, 6);
INSERT INTO public.book_subscriptions VALUES (153, 2);
INSERT INTO public.book_subscriptions VALUES (153, 3);
INSERT INTO public.book_subscriptions VALUES (153, 4);
INSERT INTO public.book_subscriptions VALUES (153, 6);


--
-- TOC entry 3410 (class 0 OID 16405)
-- Dependencies: 217
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (132, 'Małe życie', 'Hanya Yanagihara', 9788328037342, '2018-10-17', 'polski', 'male-zycie-b-iext125146776.jpg', 'Zachwycająca powieść o przyjaźni poddanej ogromnej próbie. Oto historia życia czterech przyjaciół – o ich niełatwym dojrzewaniu, ogromnych sukcesach, bolesnych wyborach i tyranii pamięci, od której nie sposób czasem się uwolnić… To również opowieść o jednym z najbardziej fascynujących miast świata – Nowym Jorku – który jest piątym, równorzędnym bohaterem tej olśniewającej książki.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (146, 'Iron Flame. Żelazny płomień', 'Rebecca Yarros', 9780349437026, '2024-03-13', 'polski', '91JsmiyAReL._SY466_.jpg', 'Ta książka nie posiada jeszcze opisu.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (150, 'Krwawy wierch', 'Arkady Saulski', 9788367755702, '2024-02-29', 'polski', '1116434-352x500.jpg', '(Wydanie I, Wydawnictwo Fabryka Słów, Lublin-Warszawa, 2024) "Krwawy wierch" - kontynuacja "Czarnych mieczy", czyli drugi tom "Drogi Samotnego Psa", z uniwersum Nipponu. Zapowiedź autorsko-wydawnicza na luty 2024.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (133, 'Operacja Mir', 'Remigiusz Mroz', 9788383572413, '2024-01-24', 'polski', 'remigiusz-mroz-operacja-mir-cover-okladka.jpg', 'Kontynuacja bestsellerowego "Projektu Riese"! Parker budzi się w innym, nieznanym mu świecie, nie mając pojęcia, jak się do niego dostał. Tutejsza Natalia nie przypomina jego Nataszy, on sam zaś zostaje wrzucony w życie innej wersji siebie – życie, którego nie zna, i z którym nie chce mieć nic wspólnego. Zaczyna poszukiwać drogi powrotnej do znanej mu rzeczywistości, podczas gdy Natasza robi wszystko, by go odnaleźć. Napotyka jednak w tunelach Kompleksu Riese osoby, które nie powinny się tam znajdować. A zaraz potem cały świat obraca się w entropiczny chaos…', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (135, 'Ostatnie życzenie', 'Andrzej Sapkowski', 9788375780635, '2014-09-25', 'polski', '1114358-352x500.jpg', 'Później mówiono, że człowiek ów nadszedł od północy, od Bramy Powroźniczej. Nie był stary, ale włosy miał zupełnie białe. Kiedy ściągnął płaszcz, okazało się, że na pasie za plecami ma miecz. Białowłosego przywiodło do miasta królewskie orędzie: trzy tysiące orenów nagrody za odczarowanie nękającej mieszkańców Wyzimy strzygi. Takie czasy nastały. Dawniej po lasach jeno wilki wyły, teraz namnożyło się rozmaitego paskudztwa – gdzie spojrzysz, tam upiory, bazyliszki, diaboły, żywiołaki, wiły i utopce plugawe. A i niebacznie uwolniony z amfory dżinn, potrafiący zamienić życie spokojnego miasta w koszmar, się trafi. Tu nie wystarczą zwykłe czary ani osinowe kołki. Tu trzeba zawodowca. WIEDŹMINA. Mistrza magii i miecza. Tajemną sztuką wyuczonego, by strzec na świecie moralnej i biologicznej równowagi.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (137, 'Gnijące miasteczko', 'Skyla Arndt', 9788383622033, '2024-01-30', 'polski', '1120545-352x500.jpg', 'Mama Wil Greene zaginęła ponad rok temu. Policja jest gotowa uznać sprawę za zamkniętą – twierdzą, że kobieta wyjechała z miasta, i nie można szukać kogoś, kto chciał przepaść bez śladu. Ale Wil wie, że jej mama tak po prostu by nie odeszła… i że rodzina jej byłego najlepszego przyjaciela, Elwooda Clarke’a, ma coś wspólnego z jej zniknięciem. Elwood z przerażeniem odliczał dni do swoich osiemnastych urodzin. Osiągnięcie pełnoletności było równoznaczne z porzuceniem szkoły i dołączeniem do ojca pastora, który zmusza go, aby poświęcił swoje życie wspólnocie kościoła – Ogrodowi Adama. Pewnej nocy Elwood odkrywa, że nie jest następcą swojego ojca, lecz jego ofiarą. Okazuje się, że lasy otaczające ich miasteczko, są spragnione krwi. Elwood ucieka przed rodziną i zwraca się o pomoc do jedynej osoby, która może mu uwierzyć: Wil. Pomimo przeszłych zranień, zawierają umowę: Wil pomoże mu się ukryć, a Elwood wesprze ją w szukaniu dowodów, że jego rodzina zabiła jej matkę. Ostatecznie odkrywają mroczną działalność sekty, na czele której stoi rodzina Clarke’ów. Jest pewien powód, dlaczego sekta potrzebuje krwi Elwooda. W jego ciele rośnie coś nieludzkiego. Gdziekolwiek się pojawi, rośliny odżywają, zaś las go nawołuje.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (141, 'Nie mówię żegnaj', 'Han Kang', 9788383194493, '2024-01-24', 'polski', '1117457-352x500.jpg', 'Zdobywczyni nagrody Man Booker Prize 2016, Han Kang, powraca po 5 latach z nową, pełnowymiarową powieścią. „Nie mówię żegnaj” opowiada o ludobójstwie w 1948 roku na wyspie Czedżu. Opisuje nie tylko wydarzenia historyczne, ale także przedstawia w przejmujący portret trzech kobiet oraz wpływ, jaki na nie miała doznana przemoc i strata. Przede wszystkim jednak stawia ważne pytania dotyczące pamięci zbiorowej czy odpowiedzialności historycznej. Han Kang snuje opowieść o desperackiej walce i godności ludzi, którzy wbrew otaczającym ich ciemnościom starają się odnaleźć promień światła. Ta zaczerpnięta z niedawnej tragicznej historii Korei opowieść o płynącej z głębi serca, bezgranicznej miłości – która sprawia, że człowiek staje się w końcu człowiekiem – obezwładnia pięknem zawartym w eleganckich, poetyckich zdaniach i olśniewająco żywych obrazach.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (145, 'Powerless', 'Lauren Roberts', 9781665954884, '2024-03-01', 'polski', '91iRSL6ELDL._SY466_.jpg', 'On – ścigał takie jak ona przez całe swoje życie. Ona – całe życie udawała takiego jak on. Egzekutor i ścigana. Ich drogi nieoczekiwanie się przetną. W świecie podzielonym na Elitarnych, którzy obdarzeni są różnymi mocami i wyłącznym prawem mieszkania w mieście, i Zwyczajnych, skazanych na banicję, toczy się ciągła walka. Kai, brat następcy tronu, od dziecka szkolony na Egzekutora, ściga niedobitki skrywających się w mieście Zwyczajnych. W czasie jednej z takich akcji z nieoczekiwanej opresji ratuje go dziewczyna – Paedyn, mieszkanka slumsów. W ten sposób ze środowiska ulicznych złodziejaszków i bezdomnych trafia ona na organizowany przez króla turniej, w których biorą udział wybitni Elitarni. Tyle tylko, że jest kompletnie Zwyczajna. Okazuje się, że stanie przed wyzwaniem nie tylko, jak przeżyć, ale także – jak odnaleźć się w relacji z księciem i jego bratem… Opowieść o prawdziwej sile i uczuciu, rodzącym się w najbardziej niespodziewanych okolicznościach.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (147, 'Przecinaczka', 'Kika Hatzopoulou', 9788383194509, '2024-01-24', 'polski', '1122654-352x500.jpg', 'W świecie, w którym dzieci bogów dziedziczą ich moce, potomkini greckich Mojr pracuje nad sprawą serii dziwacznych zabójstw, a jednocześnie musi ocalić swoje siostry, całe miasto, a także chłopaka, który jest jej bratnią duszą. W rodzie bogiń losu zawsze przychodzi na świat troje dzieci opiekujących się nićmi, które łączą ludzi z ukochanymi osobami, ulubionymi rzeczami, a także samym życiem. Jedno je tka, drugie wzmacnia lub osłabia, a trzecie – przecina. Najmłodsza z sióstr Ora, Io, wykorzystuje swoje zdolności w prywatnej agencji detektywistycznej w na wpół zatopionym mieście Alante. Jej życie się zmienia, gdy dostaje niecodzienne zlecenie. Ktoś uprowadza kobiety, okalecza ich nici życia i ożywia w ten sposób przerażające zmory, które następnie krążą po mieści jako bezwzględne zabójczynie. Io robi wszystko, aby odszukać winowajcę. Musi współpracować z Edeiem Rhuną – prawą ręką niesławnej królowej gangów, chłopakiem, z którym łączy ją rzadka, powstała jeszcze zanim się poznali, nić przeznaczenia.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (148, 'Czyste serce', 'Kate Chenli', 9788383622125, '2024-02-13', 'polski', '1125884-352x500.jpg', 'Błyskotliwa młoda dziewczyna dostaje szansę na drugie życie. Mingshin przechytrzyła trzech książąt, ponieważ chciała pomóc ukochanemu Renowi w zdobyciu korony. Jednak on ją zdradził. Przekonała się o tym, gdy leżała w kałuży własnej krwi u stóp schodów królewskiego pałacu. Umierając, dziewczyna błagała bogów, aby cofnęli czas i dali jej okazję wszystko naprawić. Jej modły zostały wysłuchane. Mingshin budzi się dwa lata wcześniej. Wówczas przyrzeka, że Ren nigdy nie zostanie królem, a ona już nigdy się nie zakocha. Jednak obdarzony czarną magią dygnitarz zagraża pokojowi w jej królestwie, a żądny władzy Ren okazuje się bardziej zachłanny niż sobie wyobrażała. Zrządzaniem losu Mingshin sprzymierza się z innym kandydatem do tronu, księciem Jiehem. Dziewczyna doskonale wie, że nie warto oddawać mu serca, lecz w gnieździe żmij, jakim jest królewski dwór, okazuje się, że tworzą świetny zespół. Czy uda jej się odwrócić katastrofę mającą miejsce w przeszłości? Czy będzie zdolna zaufać księciu, a może nawet go pokochać? Niesamowita historia inspirowana chińską kulturą.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (134, 'Sklepik z marzeniami', 'Stephen King', 9788367759823, '2024-02-21', 'polski', '1122626-352x500.jpg', 'Bestsellerowa powieść, w której król horroru zabiera czytelnika do Castle Rock. Książka, na podstawie której nakręcono film w gwiazdorskiej obsadzie, m.in. z Maxem Von Sydowem I Edem Harrisem. Tajemniczy przybysz z Europy, czarujący starszy pan, Leland Gaunt, otwiera w Castle Rock sklep, w którym można kupić wszystko, o czym się zamarzy. Każdy znajdzie tu przedmiot, za który byłby gotowy zapłacić dowolną cenę. A tymczasem za zrealizowanie pragnień płaci się tu tylko częściowo pieniędzmi. Drugą część zapłaty uiszcza się w zupełnie inny sposób: płatając pozornie niewinne figle mieszkańcom miasteczka. Wkrótce okazuje się, że spełniając fantazje klientów, Gaunt niewoli ich dusze. Żadnemu z nich nie udaje się wyzwolić od ich mocy, nie są bowiem w stanie znieść myśli, że mogliby utracić to, co udało im się zdobyć za sprawą jakiegoś niezrozumiałego cudu. Tylko Pangborn, miejscowy szeryf, spróbuje przeciwstawić się właścicielowi sklepu. Pytanie tylko, czy bez pomocy sił nadprzyrodzonych uda mu się odnieść zwycięstwo w walce z czarną magią? I jaką cenę przyjdzie mu zapłacić? Zwłaszcza że on również ma obsesyjne pragnienie: chciałby poznać sekret tajemniczej śmierci żony i dziecka…', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (131, 'Wstrząsy wtórne. ', 'Dixon Chuck Grant Alan Buckingham Mark', 9788328165335, '2024-02-28', 'polski', '1117680-352x500.jpg', 'Drugi tom siedmiotomowej sagi o upadku Gotham. „Batman: Ziemia Niczyja” to jedno z kluczowych dzieł w historii komiksów o Mrocznym Rycerzu. Crossover rozegrał się na łamach różnych tytułów związanych z Batmanem pod koniec lat 90., a jego pomysłodawcą był Jordan B. Gorfinkel. Gotham legło w gruzach po jednym z największych trzęsień ziemi, jakie kiedykolwiek nawiedziło Wschodnie Wybrzeże. Kataklizm doprowadził do niezliczonej liczby ofiar i zniszczeń, których koszty szacowane są na miliardy dolarów. Batman, Robin i Nightwing wyruszają szukać ocalałych wśród gruzów, walcząc jednocześnie ze starymi wrogami, takimi jak Clayface, Mister Freeze, Szalony Kapelusznik i inni złoczyńcy grasujący po zniszczonym Gotham. Może się jednak okazać, że Mroczny Rycerz i jego partnerzy to za mało, gdy normy społeczne zaczynają się chwiać, a mieszkańcy Gotham uciekają ze zniszczonego miasta.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (136, 'Smolarz', 'Przemyslaw Piotrowski', 9788382529791, '2024-03-13', 'polski', '1126974-352x500.jpg', 'POWRACA PRZERAŻAJĄCA BIESZCZADZKA LEGENDA W Bieszczadach dochodzi do zaginięcia dwóch turystek. Z powodu tragedii ożywa legenda o ponurym smolarzu. Dręczony wyrzutami sumienia Igor Brudny, który w górach próbował odzyskać spokój, wbrew sobie angażuje się w sprawę. Gdy podejrzenie pada na jego sąsiada, zajmującego się wypałem drewna Samuela, komisarz jako jedyny kwestionuje jego winę. Przeciwko sobie ma nie tylko tajemniczego mordercę, lecz także miejscowy układ sił, na którego czele stoi polityk będący dla mieszkańców niemal bogiem. Szukając sprawcy, Brudny odkryje tajemnicę, przy której straszna legenda okaże się jedynie bajeczką dla dzieci…', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (138, 'Foxglove', 'Adalyn Grace', 9788383194479, '2024-02-14', 'polski', '1125863-352x500.jpg', 'Kontynuacja bestsellerowej Belladonny. Intrygująca, magiczna, gotycka opowieść, rozgrywająca się wśród szelestu jedwabi, lśniących posadzek sal balowych i ogrodów rodzących śmiercionośne rośliny. Właściciel Thorn Grove, Elijah Hawthorne zostaje oskarżony o zabójstwo. Los, perfidny brat Śmierci, zamieszkał w pobliskiej posiadłości. W przeszłości boleśnie skrzywdzony, za wszelką cenę pragnie zemsty i zadośćuczynienia, którym ma być... Signa Farrow. Zaangażowane w ratowanie Hawthorne’a dziewczyna i jej kuzynka Blythe podejmują ryzykowną grę. Odkrywają nowe, nieznane wcześniej moce, które zmieniają bieg wydarzeń w Thorn Grove. Szukając mordercy, wikłają się w sieć dworskich intryg i złowrogich tajemnic, przez co ich przyjaźń zawiśnie na włosku.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (140, 'Piaski Diuny', 'Kevin J. Anderson', 9788383380483, '2024-02-13', 'polski', '1119039-352x500.jpg', 'Kontynuacja dzieła Franka Herberta. Brian Herbert i Kevin J. Anderson raz jeszcze zabierają czytelników do wszechświata Diuny i rzucają światło na jego mniej znane, ciemne zakątki. Zbiór siedmiu opowiadań ze świata Diuny przygotowany specjalnie dla polskich czytelników. Wielka gratka dla fanów kultowej serii, która od wydania Diuny w roku 1965 opanowała wyobraźnię kolejnych pokoleń czytających science fiction i przyczyniając się do rozwoju tego obszaru literatury.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (142, 'Dom po drugiej stronie jeziora', 'Riley Sager', 9788383211701, '2023-02-08', 'polski', '1035382-352x500.jpg', 'Riley Sager, autor bestsellerowych powieści „Tylko przetrwaj noc” i „Zamknij wszystkie drzwi”, wraca ze swoim najbardziej zaskakującym jak dotąd thrillerem. Casey Fletcher, niedawno owdowiała aktorka, aby uciec przed dziennikarzami, wyjeżdża do domu rodzinnego nad jeziorem w stanie Vermont, licząc na odrobinę świętego spokoju. Uzbrojona w lornetkę oraz spory zapas alkoholu spędza czas na podglądaniu Toma i Katherine Royce’ów, pary mieszkającej w domu po drugiej stronie jeziora. Wszystko w Royce’ach wydaje się idealne. Ich małżeństwo. Ich dom. Sielankowe jezioro, nad którym stoi. Ona jest eksmodelką, a on docenianym innowatorem technologicznym. Kiedy Katherine nagle znika, Casey za wszelką cenę chce się dowiedzieć, co się stało z sąsiadką. Po kolei odkrywa coraz mroczniejsze tajemnice kryjące się tuż pod powierzchnią pozornie perfekcyjnego małżeństwa Royce’ów. Zapewne podobnie jak Casey myślisz, że wiesz, dokąd zmierza ta historia. Pomyśl jeszcze raz. Ponieważ kiedy otworzysz drzwi do tajemnic i obsesji, po drugiej ich stronie znajdziesz nie to, czego się spodziewasz.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (151, 'Pociągnięcie pióra. Zagubione opowieści', 'Terry Pratchett', 9788383521992, '2024-02-27', 'polski', '1119138-352x500.jpg', '„We wszystkich tych opowiadaniach widzimy młodego Terry’ego Pratchetta stającego się Terrym Pratchettem” – z przedmowy Neila Gaimana. Dawno, dawno temu nastolatek Chris Lawrence zakochał się w jednym z opowiadań pisarza imieniem Terry Pratchett, wyrwał je z lokalnej gazety i powiesił na ścianie. Minęło trzydzieści pięć lat, Lawrence kilkakrotnie się przeprowadzał, ale tekst zawsze miał przy sobie. Pewnego dnia postanowił dowiedzieć się o jego historii czegoś więcej. Nie sądził, że swoimi działaniami doprowadzi do odkrycia dwudziestu (sic!) nieznanych historii z lat 70. i 80., które pisarz wydał pod pseudonimem Patrick Kearns. Dawny asystent, a obecnie opiekun dziedzictwa Pratchetta, Rob Wilkins, był w szoku. Przyzwyczaił się do myśli, że twórczość jego pracodawcy jest już dziełem zamkniętym. W 2015 roku, po śmierci pisarza, zgodnie z jego ostatnią wolą, Rob zniszczył twardy dysk z kilkunastoma pomysłami na nowe opowieści. Historie przepadły, a on nie sądził, że kiedykolwiek jeszcze przeczyta coś nowego Pratchetta. Do dzisiaj. Zebrane w tomie „Pociągnięcie pióra” opowiadania to efekt pierwszych lat pisarskiej aktywności pisarza. Żadne z nich nie jest połączone z uniwersum Świata Dysku, ale nie oznacza to, że tom ten jest mniej fantastyczny od pozostałych dzieł pisarza. ', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (143, 'Witajcie w księgarni Hyunam-Dong', 'Hwang Bo reum', 9788367759557, '2024-01-24', 'polski', '1117507-352x500.jpg', 'Koreański bestseller, który w ciągu zaledwie pięciu miesięcy sprzedał się w ponad 110 tysiącach egzemplarzy, a teraz podbija serca zachodnich czytelników! Ujmująca i pełna wdzięku opowieść o szukaniu pocieszenia i akceptacji w życiu oraz o uzdrawiającej mocy książek. Myślała tylko o jednym: "Muszę założyć księgarnię”. Yeong-ju była wypalona – fizycznie i emocjonalnie. Choć spełniała się w życiu prywatnym i zawodowym i powinna być szczęśliwa, czuła jedynie wyczerpanie. Pewnego dnia, w przypływie odwagi, postanowiła zrealizować dawne marzenie. Przeprowadziła się do małej dzielnicy na obrzeżach Seulu i otworzyła kameralną księgarnię, Hyunam-dong. Przez pierwszych kilka miesięcy łzy Yeong-ju tylko odstraszają odwiedzających. Ale długie godziny spędzane w księgarni dają jej czas na zastanowienie się, co powinno należeć do jej nowych obowiązków. Gdy zatrudnia Min-juna, sympatycznego baristę, również szukającego życiowej drogi, a potem zaczyna organizować spotkania autorskie, kółko czytelnicze i powoli opracowuje własną filozofię sprzedaży książek, zaczyna wreszcie czuć się swobodnie – nareszcie jest u siebie. Otoczona przyjaciółmi, pisarzami i książkami, które łączą ich wszystkich, odnajduje swoją nową ścieżkę, a księgarnia Hyunam-dong staje się bezpieczną przystanią dla zagubionych dusz. Można tu odpocząć, znaleźć ukojenie i przypomnieć sobie, że nigdy nie jest za późno, aby porzucić niedającą nadziei fabułę i zacząć wszystko od nowa. ', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (149, 'Wyspa bijących serc', 'Laura Imai Messina', 9788367817912, '2024-02-15', 'polski', '1124915-352x500.jpg', 'Na przedmieściach Tokio stoi rodzinny dom Shūichiego. Shūichi ma czterdzieści lat, bliznę na klatce piersiowej i obsesję na punkcie własnego serca. Jego zmarła właśnie matka manipulowała wspomnieniami z dzieciństwa, zawsze przedstawiając łagodniejszą wersję dziecięcych dramatów. Skąd Shūichi ma zatem czerpać odwagę do życia, skoro nie wie, czy kiedykolwiek udało mu się przezwyciężyć trudności? To wtedy mężczyzna zauważa tajemnicze dziecko, które kręci się wokół jego domu. Ta dziwna obecność wywołuje u Shūichiego wiele pytań: kim jest to dziecko i dlaczego wybrało jego dom? Spotkanie dorosłego i ośmiolatka zmienia na zawsze ich życie. Doprowadza ich do miejsca, które bije rytmem serca, wypowiadanym we wszystkich językach świata. Do Archiwum Bijących Serc.', '2024-01-28 16:17:23.275066');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (152, 'Divine Rivals. Pojedynek bogów', 'Rebecca Ross', 9788328729865, '2024-01-10', 'polski', '1120774-352x500.jpg', 'Po stuleciach uśpienia bogowie znów toczą bitwy, a krucha równowaga między światami wydaje się zagrożona. Trwa wojna, od której zależą losy ludzkości, a w niej najlepszym orężem może okazać się… miłość. Dla osiemnastoletniej Iris Winnow liczy się tylko rodzina, zrobi więc wszystko, by ją chronić. Ukochany brat niedawno zaginął na froncie – na wojnie toczącej się między dwojgiem bogów - a bezrobotna matka topi smutki w butelce. Teraz to na Iris spoczął ciężar utrzymania domu, dlatego dziewczyna stara się o pracę felietonistki w „Oath Gazette”, najpoczytniejszej gazecie w mieście. Poznaje tam Romana Kitta, ambitnego, przystojnego i aroganckiego młodego mężczyznę, który również pragnie tej posady. Są jak ogień i woda: ona, uboga dziewczyna, która walczy o przetrwanie; on, wykształcony syn bogatych rodziców, któremu niczego nie brakuje. Sytuacja w domu Iris jest coraz trudniejsza – z tęsknoty i rozpaczy dziewczyna zaczyna pisać do brata listy. Nie wie jednak, dokąd je wysłać, dlatego wkłada je do szafy. A one - w magiczny sposób - trafiają w ręce redakcyjnego rywala nastolatki. Między dwojgiem dziennikarzy rodzi się nieoczekiwana więź. Czy sprawi ona, że ich wzajemne antagonizmy zejdą na drugi plan?', '2024-01-28 16:55:28.968487');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (153, 'Córka Bogini Księżyca', 'Sue Lynn Tan', 9788383210193, '2022-10-12', 'polski', '1113833-352x500.jpg', 'Urzekające fantasy inspirowane legendą o Chang’e, chińskiej bogini księżyca. Dorastająca na Księżycu Xingyin przywykła do samotności. Nie wie, że jest ukrywana przed Niebiańskim Cesarzem, który skazał jej matkę za kradzież eliksiru nieśmiertelności. Kiedy jednak magia Xingyin zostaje wykryta, dziewczyna jest zmuszona uciekać z domu. Trafia do Niebiańskiego Królestwa, krainy cudów i tajemnic. Ukrywając swoją tożsamość, korzysta z okazji, by uczyć się u boku syna cesarza oraz opanowywać łucznictwo i magię. Między nią a księciem rozkwita uczucie. Aby ocalić matkę, Xingyin wyrusza na niebezpieczną wyprawę, stawiając czoła legendarnym stworzeniom i okrutnym wrogom. Ale kiedy dochodzi do zdrady, a zakazana magia zagraża królestwu, Xingyin musi rzucić wyzwanie samemu Niebiańskiemu Cesarzowi.', '2024-01-30 16:33:33.870023');


--
-- TOC entry 3415 (class 0 OID 16469)
-- Dependencies: 222
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (5, 'Tania Ksiazka', '5557583066930.jpg', 'https://www.taniaksiazka.pl/?utm_source=google&utm_medium=cpc&utm_campaign=K_|_Search_|_Brand_|_tROAS&utm_adgroup=brand&gad_source=1&gclid=CjwKCAiAzc2tBhA6EiwArv-i6QWJ-419Fu4uC6nAIOQ8KvLh8J6rArcviZzxIMWlr5B7PtH_TEXYtRoCOc0QAvD_BwE');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (2, 'Legimi', 'unnamed.jpg', 'https://www.legimi.pl');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (3, 'Bookbeat', 'pobrany plik.png', 'https://www.bookbeat.com/pl/audiobooki');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (4, 'Storytell', 'storytel logo new.jpg', 'https://www.storytel.com/pl?gad_source=1&gclid=CjwKCAiAzc2tBhA6EiwArv-i6dSlYIhP_o0XTNZ4v7gCLFvgzNRgUn92VivkL1nNnaZ0hlDeZ-mvtRoCJXIQAvD_BwE&gclsrc=aw.ds');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (6, 'EmpikGo', 'Kopia-www_Przemoc-2.png', 'https://www.empik.com/go?gad_source=1&gclid=CjwKCAiAzc2tBhA6EiwArv-i6c3vabSOtogqA9puYWZMax6JJ75KSuCF21xpkjQrNwbhShbRaYq6SBoCXZ4QAvD_BwE');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (7, 'Empik', 'Poland_tenant_Empik_logo_500x500.jpg', 'https://www.empik.com');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (8, 'Publio', 'publiopl-20200731141320-logo.png', 'https://www.publio.pl/e-booki.html?gad_source=1&gclid=CjwKCAiAzc2tBhA6EiwArv-i6Uka0ssueA8kH-5onLK4UHWSeeng4-escD5MkqeySZTuqq7X_WK5xxoC3qQQAvD_BwE');
INSERT INTO public.platforms OVERRIDING SYSTEM VALUE VALUES (9, 'Woblink', 'woblink-logo.jpg', 'https://woblink.com');


--
-- TOC entry 3419 (class 0 OID 16489)
-- Dependencies: 226
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.purchases VALUES (2, 2, 'ebook');
INSERT INTO public.purchases VALUES (3, 3, 'ebook');
INSERT INTO public.purchases VALUES (5, 5, 'ebook');
INSERT INTO public.purchases VALUES (7, 7, 'ebook');
INSERT INTO public.purchases VALUES (8, 8, 'ebook');
INSERT INTO public.purchases VALUES (9, 9, 'ebook');


--
-- TOC entry 3417 (class 0 OID 16477)
-- Dependencies: 224
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.subscriptions VALUES (2, 2, 'ebook');
INSERT INTO public.subscriptions VALUES (3, 3, 'ebook');
INSERT INTO public.subscriptions VALUES (4, 4, 'ebook');
INSERT INTO public.subscriptions VALUES (6, 6, 'ebook');


--
-- TOC entry 3411 (class 0 OID 16412)
-- Dependencies: 218
-- Data for Name: to_read; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.to_read VALUES (16, 150, '2024-01-30 20:26:16.278514');
INSERT INTO public.to_read VALUES (16, 153, '2024-01-30 20:26:23.797357');
INSERT INTO public.to_read VALUES (16, 147, '2024-01-30 20:26:33.224812');
INSERT INTO public.to_read VALUES (21, 152, '2024-01-30 23:42:19.574856');
INSERT INTO public.to_read VALUES (21, 143, '2024-01-30 23:42:29.462855');
INSERT INTO public.to_read VALUES (21, 136, '2024-01-30 23:42:36.703479');


--
-- TOC entry 3409 (class 0 OID 16390)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (16, 'admin@gmail.com', '$2y$10$D3oNoD2nGSP.nVyjsTW9jO52IzDyrwcACqCZ/u9KrF3WXfjCzEFJy', 'admin', 5, 'admin');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (18, 'dominika@gmail.com', '$2y$10$THXAVBFU5dAGranNm0Q5DeKkdYJXEUCMjqPcwYwcCeL/JaUiL/PRa', 'dominika', 7, 'user');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (21, 'filip@gmail.com', '$2y$10$9NJh9LGusoGqlmeuSeCyU.M/2T2mANKaTeLxeg7Usngun4CIGgm6i', 'filip', 10, 'user');


--
-- TOC entry 3413 (class 0 OID 16438)
-- Dependencies: 220
-- Data for Name: users_details; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.users_details OVERRIDING SYSTEM VALUE VALUES (5, 692774166);
INSERT INTO public.users_details OVERRIDING SYSTEM VALUE VALUES (7, 123456789);
INSERT INTO public.users_details OVERRIDING SYSTEM VALUE VALUES (10, 572865857);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.books_id_seq', 153, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 227
-- Name: platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.platforms_id_seq', 9, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 225
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.purchases_id_seq', 3, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 223
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 3, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.users_details_id_seq', 10, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- TOC entry 3253 (class 2606 OID 16570)
-- Name: book_purchases book_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.book_purchases
    ADD CONSTRAINT book_purchases_pkey PRIMARY KEY (book_id, purchase_id);


--
-- TOC entry 3251 (class 2606 OID 16555)
-- Name: book_subscriptions book_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.book_subscriptions
    ADD CONSTRAINT book_subscription_pkey PRIMARY KEY (book_id, subscription_id);


--
-- TOC entry 3241 (class 2606 OID 16411)
-- Name: books id; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 16442)
-- Name: users_details id_details; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.users_details
    ADD CONSTRAINT id_details PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 16475)
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16494)
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 16482)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16396)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2620 OID 16595)
-- Name: book_purchases trigger_book_purchases; Type: TRIGGER; Schema: public; Owner: docker
--

CREATE TRIGGER trigger_book_purchases AFTER INSERT ON public.book_purchases FOR EACH ROW EXECUTE FUNCTION public.update_book_last_modified();


--
-- TOC entry 3263 (class 2620 OID 16594)
-- Name: book_subscriptions trigger_book_subscriptions; Type: TRIGGER; Schema: public; Owner: docker
--

CREATE TRIGGER trigger_book_subscriptions AFTER INSERT ON public.book_subscriptions FOR EACH ROW EXECUTE FUNCTION public.update_book_last_modified();


--
-- TOC entry 3261 (class 2606 OID 16571)
-- Name: book_purchases fk_book_purchases_book_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.book_purchases
    ADD CONSTRAINT fk_book_purchases_book_id FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- TOC entry 3262 (class 2606 OID 16576)
-- Name: book_purchases fk_book_purchases_purchase_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.book_purchases
    ADD CONSTRAINT fk_book_purchases_purchase_id FOREIGN KEY (purchase_id) REFERENCES public.purchases(id) ON DELETE CASCADE;


--
-- TOC entry 3259 (class 2606 OID 16556)
-- Name: book_subscriptions fk_book_subscription_book_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.book_subscriptions
    ADD CONSTRAINT fk_book_subscription_book_id FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- TOC entry 3260 (class 2606 OID 16561)
-- Name: book_subscriptions fk_book_subscription_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.book_subscriptions
    ADD CONSTRAINT fk_book_subscription_subscription_id FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id) ON DELETE CASCADE;


--
-- TOC entry 3255 (class 2606 OID 16420)
-- Name: to_read id_books_fk; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.to_read
    ADD CONSTRAINT id_books_fk FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 3256 (class 2606 OID 16415)
-- Name: to_read id_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.to_read
    ADD CONSTRAINT id_user_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3258 (class 2606 OID 16495)
-- Name: purchases purchases_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- TOC entry 3257 (class 2606 OID 16483)
-- Name: subscriptions subscriptions_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- TOC entry 3254 (class 2606 OID 16444)
-- Name: users users_details_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_details_id FOREIGN KEY (id_user_details) REFERENCES public.users_details(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;

-- FUNCTION: public.update_book_last_modified()

-- DROP FUNCTION IF EXISTS public.update_book_last_modified();

CREATE OR REPLACE FUNCTION public.update_book_last_modified()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
UPDATE books
SET last_modified = CURRENT_TIMESTAMP
WHERE id = NEW.book_id;

RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.update_book_last_modified()
    OWNER TO docker;

-- View: public.latest_releases

-- DROP VIEW public.latest_releases;

CREATE OR REPLACE VIEW public.latest_releases
 AS
SELECT title,
       author,
    date
FROM books
WHERE date >= CURRENT_DATE
ORDER BY date;

ALTER TABLE public.latest_releases
    OWNER TO docker;

-- Completed on 2024-01-31 09:04:19 UTC

--
-- PostgreSQL database dump complete
--

