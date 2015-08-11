--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-11 16:06:01 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 240 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 12818114)
-- Name: abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonma (
    id uuid NOT NULL,
    stpredstav integer,
    stkuponov integer,
    ime character varying(40) DEFAULT NULL::character varying,
    opis text,
    kapaciteta integer
);


--
-- TOC entry 222 (class 1259 OID 12818617)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    zaposlitev_id uuid,
    oseba_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 221 (class 1259 OID 12818600)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
    dogodek_id uuid,
    uprizoritev_id uuid,
    oznakadatuma character varying(255) DEFAULT NULL::character varying,
    datum date,
    fizicnaoblika character varying(255) DEFAULT NULL::character varying,
    izvordigitalizata character varying(255) DEFAULT NULL::character varying,
    povzetek text,
    opombe text,
    lokacijaoriginala character varying(255) DEFAULT NULL::character varying,
    objavljeno character varying(255) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtorstvo character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 12818512)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 12818861)
-- Name: datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datoteka (
    id uuid NOT NULL,
    owner_id uuid,
    filename character varying(255) DEFAULT NULL::character varying,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    uploadedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    title character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 191 (class 1259 OID 12818293)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_izven_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 12818327)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 12818763)
-- Name: drugivir; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drugivir (
    id uuid NOT NULL,
    znesek numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opis character varying(255) NOT NULL,
    mednarodni boolean,
    enotaprograma_id uuid
);


--
-- TOC entry 186 (class 1259 OID 12818236)
-- Name: drza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drza (
    id uuid NOT NULL,
    sifra character varying(2) DEFAULT NULL::character varying,
    sifradolg character varying(3) DEFAULT NULL::character varying,
    isonum character varying(3) DEFAULT NULL::character varying,
    isonaziv character varying(50) DEFAULT NULL::character varying,
    naziv character varying(50) DEFAULT NULL::character varying,
    opomba text
);


--
-- TOC entry 223 (class 1259 OID 12818630)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    nasdelez numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostmat numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostgostovsz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarjisamoz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskepravice numeric(15,2) DEFAULT 0::numeric NOT NULL,
    materialni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    imakoprodukcije boolean,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stokroglihmiz integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    stprodukcij integer,
    caspriprave character varying(255) DEFAULT NULL::character varying,
    casizvedbe character varying(255) DEFAULT NULL::character varying,
    prizorisca text,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    sttujihselektorjev integer
);


--
-- TOC entry 210 (class 1259 OID 12818457)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    vodjaekipe boolean,
    naziv character varying(255) DEFAULT NULL::character varying,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekrivanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 189 (class 1259 OID 12818273)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean,
    kraj character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 12818321)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 12818253)
-- Name: kontaktnaoseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kontaktnaoseba (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    status character varying(20) DEFAULT NULL::character varying,
    funkcija character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 199 (class 1259 OID 12818374)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 12818842)
-- Name: mapa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa (
    id uuid NOT NULL,
    lastnik_id uuid,
    parent_id uuid,
    ime character varying(200) NOT NULL,
    komentar text,
    caskreiranja timestamp(0) without time zone NOT NULL,
    casspremembe timestamp(0) without time zone NOT NULL,
    javnidostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 237 (class 1259 OID 12818854)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 12818877)
-- Name: mapaacl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapaacl (
    id uuid NOT NULL,
    mapa_id uuid,
    perm_id uuid,
    dostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 203 (class 1259 OID 12818399)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 12818210)
-- Name: option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE option (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(20) DEFAULT NULL::character varying,
    defaultvalue text,
    peruser boolean DEFAULT true,
    readonly boolean,
    public boolean,
    role character varying(255) DEFAULT NULL::character varying,
    description text
);


--
-- TOC entry 178 (class 1259 OID 12818123)
-- Name: optionvalue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE optionvalue (
    id uuid NOT NULL,
    option_id uuid,
    user_id uuid,
    value text,
    global boolean DEFAULT false
);


--
-- TOC entry 179 (class 1259 OID 12818134)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    sifra character varying(4) NOT NULL,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    srednjeime character varying(255) DEFAULT NULL::character varying,
    polnoime character varying(255) DEFAULT NULL::character varying,
    psevdonim character varying(255) DEFAULT NULL::character varying,
    email character varying(40) DEFAULT NULL::character varying,
    datumrojstva date,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 174 (class 1259 OID 12818088)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 12818107)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 12818406)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 12818437)
-- Name: podrocjesedenja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE podrocjesedenja (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    kapaciteta integer,
    templateplaceholder character varying(20) DEFAULT NULL::character varying,
    barva character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 12818551)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    zacetek date,
    konec date,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 181 (class 1259 OID 12818167)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) DEFAULT NULL::character varying,
    stakli character varying(2) DEFAULT NULL::character varying,
    naziv character varying(60) NOT NULL,
    naziv1 character varying(60) DEFAULT NULL::character varying,
    panoga character varying(60) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    url character varying(100) DEFAULT NULL::character varying,
    opomba text,
    idddv character varying(18) DEFAULT NULL::character varying,
    maticna character varying(20) DEFAULT NULL::character varying,
    zavezanec character varying(1) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    datzav date,
    datnzav date,
    zamejstvo boolean,
    nvo boolean
);


--
-- TOC entry 183 (class 1259 OID 12818202)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 12818380)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 12818187)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    klient_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    nazivdva character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean,
    privzeti boolean
);


--
-- TOC entry 188 (class 1259 OID 12818265)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 12818392)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12818724)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 226 (class 1259 OID 12818734)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 12818680)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    zakljuceno boolean NOT NULL,
    potrjenprogram boolean NOT NULL,
    stpremier integer,
    stint integer,
    stfest integer,
    strazno integer,
    stizjem integer,
    stponprem integer,
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    stgostujo integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stizvnekomerc integer,
    stizvprem integer,
    stizvponprem integer,
    stizvponprej integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stizvgostovanjslo integer,
    stizvgostovanjzam integer,
    stizvgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    avgobiskprired numeric(12,2) DEFAULT NULL::numeric,
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stkoprodukcij integer,
    stkoprodukcijint integer,
    stkoprodukcijnvo integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenogostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoint numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenofest numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenorazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 227 (class 1259 OID 12818742)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 206 (class 1259 OID 12818421)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 198 (class 1259 OID 12818365)
-- Name: racun; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE racun (
    id uuid NOT NULL,
    kupec_id uuid,
    prodaja_predstave_id uuid,
    nacin_placina_id uuid NOT NULL,
    placilni_instrument_id uuid
);


--
-- TOC entry 197 (class 1259 OID 12818355)
-- Name: razpisansedez; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE razpisansedez (
    id uuid NOT NULL,
    postavka_racuna_id uuid NOT NULL,
    sedez_id uuid,
    prodaja_predstave_id uuid,
    rezervacija_id uuid,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 12818540)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 12818489)
-- Name: rekviziterstvo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekviziterstvo (
    id uuid NOT NULL,
    rekvizit_id uuid,
    uprizoritev_id uuid,
    namenuporabe boolean,
    opispostavitve text
);


--
-- TOC entry 171 (class 1259 OID 12818059)
-- Name: revizije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE revizije (
    id integer NOT NULL,
    razred character varying(100) NOT NULL,
    objectid uuid,
    upor uuid,
    datum timestamp(0) without time zone NOT NULL,
    tip character varying(3) NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 12818057)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 12818431)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 12818097)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 12818081)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 12818445)
-- Name: sedez; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedez (
    id uuid NOT NULL,
    vrsta_id uuid NOT NULL,
    sedezni_red_id uuid,
    podrocja_sedenja_id uuid,
    stevilka character varying(3) DEFAULT NULL::character varying,
    oznaka character varying(60) DEFAULT NULL::character varying,
    kakovost character varying(20) DEFAULT NULL::character varying,
    koordinatax integer,
    koordinatay integer,
    barva character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12818386)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 12818332)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date,
    aktivna boolean
);


--
-- TOC entry 232 (class 1259 OID 12818783)
-- Name: stevilcenje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenje (
    id uuid NOT NULL,
    sifra character varying(8) DEFAULT NULL::character varying,
    naziv character varying(100) DEFAULT NULL::character varying,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer,
    dolzina integer,
    format character varying(20) DEFAULT NULL::character varying,
    globalno boolean,
    poletih boolean
);


--
-- TOC entry 231 (class 1259 OID 12818775)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12818770)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 12818499)
-- Name: strosekuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE strosekuprizoritve (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    popa_id uuid,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrednostdo numeric(15,2) DEFAULT NULL::numeric,
    vrednostna numeric(15,2) DEFAULT NULL::numeric,
    opis text,
    tipstroska character varying(10) NOT NULL,
    sort integer
);


--
-- TOC entry 180 (class 1259 OID 12818159)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) DEFAULT NULL::character varying,
    privzeta boolean
);


--
-- TOC entry 196 (class 1259 OID 12818342)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planiranotraja numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 216 (class 1259 OID 12818529)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 12818752)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(15,2) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(15,2) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 12818222)
-- Name: trr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trr (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    stevilka character varying(255) DEFAULT NULL::character varying,
    swift character varying(255) DEFAULT NULL::character varying,
    bic character varying(255) DEFAULT NULL::character varying,
    banka character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 12818068)
-- Name: uporabniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uporabniki (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(90) DEFAULT NULL::character varying,
    enabled boolean,
    expires date,
    defaultroute character varying(255) DEFAULT NULL::character varying,
    defaultrouteparams character varying(255) DEFAULT NULL::character varying,
    email character varying(255) NOT NULL,
    lastlogon date,
    passresttoken character varying(255) DEFAULT NULL::character varying,
    tokenexpires timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 220 (class 1259 OID 12818577)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    producent_id uuid,
    sifra character varying(255) NOT NULL,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
    stevilovaj integer,
    planiranostevilovaj integer,
    datumpremiere date,
    stodmorov integer,
    avtor character varying(255) DEFAULT NULL::character varying,
    gostujoca boolean,
    trajanje integer,
    opis text,
    arhident character varying(255) DEFAULT NULL::character varying,
    arhopomba character varying(255) DEFAULT NULL::character varying,
    datumzakljucka date,
    sloavtor boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 190 (class 1259 OID 12818284)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 12818413)
-- Name: vrstasedezev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstasedezev (
    id uuid NOT NULL,
    podrocja_sedenja_id uuid NOT NULL,
    kapaciteta integer,
    poravnava character varying(255) DEFAULT NULL::character varying,
    oblika character varying(2) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 12818822)
-- Name: vrstazapisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstazapisa (
    id uuid NOT NULL,
    oznaka character varying(10) NOT NULL,
    naziv character varying(255) NOT NULL,
    aktiven boolean,
    znacka boolean,
    ikona character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 233 (class 1259 OID 12818794)
-- Name: zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zapis (
    id uuid NOT NULL,
    vrsta_id uuid,
    datoteka_id uuid,
    mapa_id uuid,
    avtor_id uuid,
    zaklenil_id uuid,
    tip character varying(20) NOT NULL,
    zaklenjen boolean,
    datumzaklepanja timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    identifier character varying(20) DEFAULT NULL::character varying,
    subject character varying(255) DEFAULT NULL::character varying,
    title character varying(255) NOT NULL,
    description text,
    coverage character varying(255) DEFAULT NULL::character varying,
    creator character varying(255) DEFAULT NULL::character varying,
    language character varying(20) DEFAULT NULL::character varying,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    publisher character varying(255) DEFAULT NULL::character varying,
    relation character varying(255) DEFAULT NULL::character varying,
    rigths character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 12818834)
-- Name: zapislastnik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zapislastnik (
    id uuid NOT NULL,
    zapis_id uuid,
    lastnik uuid NOT NULL,
    classlastnika character varying(200) NOT NULL,
    datum timestamp(0) without time zone NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 212 (class 1259 OID 12818482)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    zacetek date,
    konec date,
    tip integer,
    delovnaobveza integer,
    malica character varying(255) DEFAULT NULL::character varying,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean
);


--
-- TOC entry 192 (class 1259 OID 12818316)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 12818567)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 12818472)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 12818062)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 12818114)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 12818617)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ca-0148-1b02-1f912f431678	000d0000-55ca-0148-b2ff-92b91997db7e	\N	00090000-55ca-0148-7715-d866d1fc39fa	000b0000-55ca-0148-ccd5-24d3d977a23f	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55ca-0148-dbb8-a1fac674b7f4	000d0000-55ca-0148-e2b3-8f35e0791529	00100000-55ca-0148-636b-26c8f7482a2e	00090000-55ca-0148-1770-760e677ec160	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55ca-0148-b2ab-bc019508446f	000d0000-55ca-0148-d0de-a08b9ee4c528	00100000-55ca-0148-8ef1-7a1c2a0ca494	00090000-55ca-0148-95db-15b7fe287cf5	\N	0003	t	\N	2015-08-11	\N	2	\N	\N	f	f
000c0000-55ca-0148-39dc-181085452e1d	000d0000-55ca-0148-3a9f-01d9699fd3db	\N	00090000-55ca-0148-7113-75d67ace6f49	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55ca-0148-411f-22c8efe3b8f9	000d0000-55ca-0148-666e-9de29db9bb58	\N	00090000-55ca-0148-5e37-8dd3f13f5275	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55ca-0148-6ee8-16d185acaeb1	000d0000-55ca-0148-08f6-b6bd6418065e	\N	00090000-55ca-0148-98df-fc92b4664914	000b0000-55ca-0148-ecc3-b08a14eaf6f9	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55ca-0148-e269-b779a2b3bba9	000d0000-55ca-0148-0347-141ef70d563c	00100000-55ca-0148-07b2-aa8c0fd74485	00090000-55ca-0148-7d38-3d4180af6314	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55ca-0148-b73f-4e959f81e03d	000d0000-55ca-0148-16df-deac170d8ca7	\N	00090000-55ca-0148-23d2-a305ac0e27ce	000b0000-55ca-0148-3aaa-95a4438e8c43	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55ca-0148-341f-3317547afffd	000d0000-55ca-0148-0347-141ef70d563c	00100000-55ca-0148-c55f-5a6728163c9c	00090000-55ca-0148-abce-167a11d45be0	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55ca-0148-31a9-3206854a5f43	000d0000-55ca-0148-0347-141ef70d563c	00100000-55ca-0148-de74-e109b508ec7b	00090000-55ca-0148-90e1-21a930d35a59	\N	0010	t	\N	2015-08-11	\N	16	\N	\N	f	t
000c0000-55ca-0148-5b0d-cde2a2b4fc75	000d0000-55ca-0148-0347-141ef70d563c	00100000-55ca-0148-458b-136a9fa567c7	00090000-55ca-0148-2974-036e09960c25	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 12818600)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 12818512)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ca-0147-fc33-928b3593e091	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ca-0147-eae6-2bce5892ba29	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ca-0147-cab4-addd48942483	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 12818861)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 12818293)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55ca-0148-7f7d-488fb66125a0	\N	\N	00200000-55ca-0148-6f08-eb84f809de6b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ca-0148-db82-49afd51884ae	\N	\N	00200000-55ca-0148-6a04-4216dfa7afc7	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ca-0148-7553-428e0f7d4a9b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ca-0148-2df6-06864fed032c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ca-0148-d954-056e2b49d2ad	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 12818327)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 12818763)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 12818236)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ca-0146-31d9-fad2b6a13625	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ca-0146-3460-d5e26aaffed9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ca-0146-2ebc-748c0707791b	AL	ALB	008	Albania 	Albanija	\N
00040000-55ca-0146-052e-0631517c106e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ca-0146-6745-3f9447ac36f7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ca-0146-e752-9ccbbdaf3fdb	AD	AND	020	Andorra 	Andora	\N
00040000-55ca-0146-bd7c-5c64fa992019	AO	AGO	024	Angola 	Angola	\N
00040000-55ca-0146-ee8e-cb67c705c995	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ca-0146-fb2e-f1ba9b1d8a4c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ca-0146-b8f8-d0e33dec7c04	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ca-0146-decf-d92009b8067d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ca-0146-b6bb-6447cb79e151	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ca-0146-97e4-af2c5c20e706	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ca-0146-cede-9aff11ce246f	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ca-0146-071b-2503a362f97c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ca-0146-4e53-54e981b486d2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ca-0146-cad8-cfec5abf0158	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ca-0146-fbdf-c9111e0c5c5e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ca-0146-9774-94de5deea143	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ca-0146-3ce7-2e6f0038105c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ca-0146-9cdc-57034a2c39af	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ca-0146-78f6-d275acec118d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ca-0146-d8b0-7d46bf2ef356	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ca-0146-3146-95344e5999e7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ca-0146-33f4-879c57062f59	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ca-0146-cab5-f5c3f0816fee	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ca-0146-502c-625e42b3eb4b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ca-0146-0853-540529af4655	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ca-0146-2caa-7ac8eeca4131	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ca-0146-d16d-827dfeabd863	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ca-0146-7151-e92a28106c00	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ca-0146-3702-bbca5c38267d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ca-0146-1ff8-0c12788615eb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ca-0146-3e41-0c17ebc4ac91	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ca-0146-74f9-fdd9cce18c52	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ca-0146-7563-e9ba465b1625	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ca-0146-72c9-9eabf8f33cf0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ca-0146-243a-0435728ce423	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ca-0146-560c-406c0056271e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ca-0146-c8cc-f399fd2e73e7	CA	CAN	124	Canada 	Kanada	\N
00040000-55ca-0146-4cdd-2d809a9fe472	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ca-0146-8326-19bb5d073c42	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ca-0146-ed0e-ed5088dc266e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ca-0146-f0d5-fc38dae965f7	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ca-0146-45bb-c961aa938cf2	CL	CHL	152	Chile 	Čile	\N
00040000-55ca-0146-eb4e-7de0e51d5ff7	CN	CHN	156	China 	Kitajska	\N
00040000-55ca-0146-5169-ef6e67ec76cf	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ca-0146-4d03-75bd160ee251	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ca-0146-1183-315f1f77311e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ca-0146-92af-90f20cdee595	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ca-0146-6d49-f56c879459a7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ca-0146-15f6-716974f4b245	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ca-0146-e351-7ca9a191361c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ca-0146-cee0-b055557f5227	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ca-0146-9df7-9eada45b6da1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ca-0146-807b-a2d84c928218	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ca-0146-fbd4-c3b7d94154b4	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ca-0146-98e4-e1fd3fb9c112	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ca-0146-c717-e5827fbe02bc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ca-0146-9f6f-473efcb0487c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ca-0146-3741-51fba85b3f64	DK	DNK	208	Denmark 	Danska	\N
00040000-55ca-0146-d465-14f0ffb69f69	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ca-0146-c8db-22c2b7e320dc	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ca-0146-4b1c-fc03a58b656b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ca-0146-5863-77e9b12d7b40	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ca-0146-c030-c59876954a61	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ca-0146-f4c5-2b1fa6e152bf	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ca-0146-22ea-e49ffbf2bade	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ca-0146-d064-0ec6fe73ea60	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ca-0146-cd9c-7570bd9a3686	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ca-0146-0183-79baf3cc9497	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ca-0146-c83c-d5d230c90fa1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ca-0146-3fd8-767437a18ece	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ca-0146-6620-a4921ea9e439	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ca-0146-d714-834357230f8b	FI	FIN	246	Finland 	Finska	\N
00040000-55ca-0146-d412-9ad94a82df5c	FR	FRA	250	France 	Francija	\N
00040000-55ca-0146-3ff3-46f556dad356	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ca-0146-ab9b-59d0353ad069	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ca-0146-f120-a067780836e9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ca-0146-1926-2250a6c1a712	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ca-0146-3beb-d1c5c5973634	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ca-0146-9e83-f71d2efe01aa	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ca-0146-28b3-0925ab8c2624	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ca-0146-96b7-88a43bb2cb42	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ca-0146-37ee-814a5550215d	GH	GHA	288	Ghana 	Gana	\N
00040000-55ca-0146-c83d-c0b15322773a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ca-0146-4063-b5a160492c37	GR	GRC	300	Greece 	Grčija	\N
00040000-55ca-0146-e126-1317334b225b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ca-0146-1601-6eae40da26fd	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ca-0146-7474-1ad16a8d4010	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ca-0146-bbb2-a19bc034d956	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ca-0146-f180-4552a370f755	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ca-0146-e65d-ec0f38c9acd5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ca-0146-672b-0b8be2abcb16	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ca-0146-1f41-ba52c09613b2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ca-0146-6679-ea8734504d93	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ca-0146-9ef3-f2f22674fe0f	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ca-0146-ce82-ed733afeee50	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ca-0146-3a1d-5bc5ec4733cc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ca-0146-dd53-9f64228abc84	HN	HND	340	Honduras 	Honduras	\N
00040000-55ca-0146-8f57-33f32c7eb9cf	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ca-0146-e88a-ebb76b4c7a0e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ca-0146-f4da-9894871f8613	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ca-0146-1d6e-45f4cfe09aad	IN	IND	356	India 	Indija	\N
00040000-55ca-0146-c514-e5c48a53eb9e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ca-0146-db39-7e83f5040701	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ca-0146-2901-341934947073	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ca-0146-60c5-a08b3adc4867	IE	IRL	372	Ireland 	Irska	\N
00040000-55ca-0146-8e8c-3a8354dc495e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ca-0146-13e4-7f2f04da8c4e	IL	ISR	376	Israel 	Izrael	\N
00040000-55ca-0146-e0fb-637032263dd2	IT	ITA	380	Italy 	Italija	\N
00040000-55ca-0146-da23-191a4911e987	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ca-0146-061c-1e902d8b1940	JP	JPN	392	Japan 	Japonska	\N
00040000-55ca-0146-2a5c-24956eae5001	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ca-0146-0ee9-048fe2c6e28f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ca-0146-37ac-7dfc5b3f8d95	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ca-0146-75d5-b56fc77233c1	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ca-0146-0af8-633602e386c0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ca-0146-6c6f-f9f46bd9845f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ca-0146-a957-545e791a5cf2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ca-0146-cb6f-d162bf62b2a5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ca-0146-869e-0de071d6c67f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ca-0146-ad76-12b7a457453c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ca-0146-c84a-3901b979889e	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ca-0146-246b-3371d3a7da40	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ca-0146-c63c-b0e12a0052f8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ca-0146-cb14-23a8a02d4d28	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ca-0146-9fab-76056c8b9083	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ca-0146-a607-5728340f1db3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ca-0146-d6a0-b2ff97e776cd	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ca-0146-a81a-a3b791962e45	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ca-0146-9056-0e4de739206c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ca-0146-7fc0-9c6dd9d76e8f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ca-0146-2795-f3969d4cbfd7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ca-0146-68e8-d4340a507121	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ca-0146-6cc5-b9ca8adab7f9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ca-0146-3918-7a27bb9e3f69	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ca-0146-6831-897013880d96	ML	MLI	466	Mali 	Mali	\N
00040000-55ca-0146-2219-04b99199872c	MT	MLT	470	Malta 	Malta	\N
00040000-55ca-0146-23e8-69f66b72e73b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ca-0146-4fb0-af178937f643	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ca-0146-0963-0d9a6c3f19a1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ca-0146-9e45-a437d7ba286e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ca-0146-fa19-e57ca553c8b1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ca-0146-ce5a-1255d8f84169	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ca-0146-4dbb-4bf4ec48422c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ca-0146-7337-5809519c925d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ca-0146-b2d4-3801986149d1	MC	MCO	492	Monaco 	Monako	\N
00040000-55ca-0146-c0cd-995187491b3a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ca-0146-5d56-817a17dae2d5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ca-0146-992a-7222aad31899	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ca-0146-294f-223fd0021798	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ca-0146-bd3b-dd5d7ef40e6c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ca-0146-8825-833571cc2ea6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ca-0146-cf30-b02415646031	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ca-0146-7bc2-91944589873a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ca-0146-08a5-b4b5ce990fb3	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ca-0146-00b2-6cf6213745d0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ca-0146-a42a-9bcb8c292bd2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ca-0146-5ec3-8149bd6eb00b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ca-0146-7b98-c084a84c2029	NE	NER	562	Niger 	Niger 	\N
00040000-55ca-0146-9191-e4a40c5a6720	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ca-0146-8d3e-be6e7fe7cee1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ca-0146-8cac-1cfb0c3cfdb3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ca-0146-2357-16111d3ac1b2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ca-0146-1e08-b9c647abfc77	NO	NOR	578	Norway 	Norveška	\N
00040000-55ca-0146-f6ce-cb754e94105e	OM	OMN	512	Oman 	Oman	\N
00040000-55ca-0146-4e88-0711799c2747	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ca-0146-b957-da979106398c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ca-0146-fcc2-73051f90a5f0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ca-0146-5865-259df4e05b7a	PA	PAN	591	Panama 	Panama	\N
00040000-55ca-0146-cf73-a3f579f0e18f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ca-0146-60bb-8fc7c5cb0bd6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ca-0146-0d5f-ea14411aa88d	PE	PER	604	Peru 	Peru	\N
00040000-55ca-0146-587b-f6c71a919377	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ca-0146-60ad-1e0af7c719b0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ca-0146-5b53-6e3ee6991958	PL	POL	616	Poland 	Poljska	\N
00040000-55ca-0146-381a-59484c72cc89	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ca-0146-67fd-4ac2dd1cb60f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ca-0146-1878-3943c5989c32	QA	QAT	634	Qatar 	Katar	\N
00040000-55ca-0146-e464-57fe19d36e1a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ca-0146-b364-d87ab766146a	RO	ROU	642	Romania 	Romunija	\N
00040000-55ca-0146-cd20-0d20cfab3f1c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ca-0146-3fdb-242a2987d89c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ca-0146-4190-6d5b0f10a990	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ca-0146-17fd-1aaca01c914b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ca-0146-a247-f7d34749a843	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ca-0146-d472-77fc3abef438	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ca-0146-71d4-d674e9479ccb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ca-0146-7081-75f976846d19	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ca-0146-f4c5-8d11cc463d7c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ca-0146-55d7-cf4e2d19b7f6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ca-0146-9925-337b31f2c0f3	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ca-0146-9313-f7933f52ddcb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ca-0146-e7b0-bfdc515e81e8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ca-0146-f1aa-41cfd9f7e48c	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ca-0146-64c4-a4297d67c3ad	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ca-0146-a743-1960b49ec3a9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ca-0146-a819-3b24adc6aa68	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ca-0146-9824-58036bacfd7e	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ca-0146-1269-c7a1cf629b4d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ca-0146-cd7e-d6a285e4497f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ca-0146-8d6d-0a672382f1e4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ca-0146-5b7b-64699e76dd02	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ca-0146-8bcf-919e92594e70	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ca-0146-39e8-9faba5bdfca8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ca-0146-7a50-64b87c64d7f0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ca-0146-dc19-6435036cf944	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ca-0146-3acb-b797076ed8b6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ca-0146-37a1-0ba52aead3ab	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ca-0146-c1a5-d9aad3c047ff	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ca-0146-0b01-d2184b8e393b	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ca-0146-d379-e92ce88c6897	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ca-0146-e034-c1cb91712462	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ca-0146-343d-47c6db1da413	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ca-0146-475a-3dde64d1057d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ca-0146-4e1f-319b000c8d76	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ca-0146-49a2-277afeef15ee	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ca-0146-721f-534c1fa07216	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ca-0146-c86d-ce58cd5bf031	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ca-0146-cc52-fc4a588a09fc	TH	THA	764	Thailand 	Tajska	\N
00040000-55ca-0146-825c-b850ae4f0e45	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ca-0146-8bf9-0fe43ccca1dc	TG	TGO	768	Togo 	Togo	\N
00040000-55ca-0146-cd5d-62adf3f0cda8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ca-0146-b8c3-15962bfc4ee1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ca-0146-8ae2-0221d9cb8afa	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ca-0146-fc5a-08f1906d39ec	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ca-0146-0981-4c2ea8134627	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ca-0146-1f51-be90808296ce	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ca-0146-f5b5-cd6d37db84dd	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ca-0146-9f99-8f2e8155ba2b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ca-0146-408b-6482a6ec94f6	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ca-0146-21a1-20f211997e0d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ca-0146-3437-2c651de18489	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ca-0146-c8ac-a476521302bb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ca-0146-257e-73113fe55174	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ca-0146-72a4-73a3f1724b60	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ca-0146-6527-62e8b47e8cbc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ca-0146-698c-7179ba3a71d6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ca-0146-371c-550bda70b03e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ca-0146-b844-c657fbcb3a89	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ca-0146-3198-74479217447d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ca-0146-fbf5-3b8a69ed1186	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ca-0146-0e8e-dc3f432f5067	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ca-0146-465e-46abad6a5813	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ca-0146-6c39-88a35cd4ae7e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ca-0146-69e9-53a245d3b9d4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ca-0146-3821-0efdea84cef6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ca-0146-dea2-b5e152a4c39f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 12818630)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ca-0148-aeac-695e2ce337f0	000e0000-55ca-0148-9589-8087e2fc4e08	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55ca-0147-eb29-21e852cdb2ad	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ca-0148-5427-229eda086ecf	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55ca-0147-c9a1-7f363596e8c7	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ca-0148-7e4f-9c744b63ff38	000e0000-55ca-0148-3667-0ece6c94b7ec	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55ca-0147-eb29-21e852cdb2ad	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ca-0148-8fef-4240438b3f4a	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ca-0148-d724-8b56e281e564	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 12818457)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ca-0148-0347-141ef70d563c	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ca-0147-e02d-5ace4e7e872c
000d0000-55ca-0148-b2ff-92b91997db7e	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ca-0147-e02d-5ace4e7e872c
000d0000-55ca-0148-e2b3-8f35e0791529	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ca-0147-cc92-9cc9e235a0cc
000d0000-55ca-0148-d0de-a08b9ee4c528	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ca-0147-f1e3-740f032c16b0
000d0000-55ca-0148-3a9f-01d9699fd3db	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ca-0147-e70c-304ccce25dc4
000d0000-55ca-0148-666e-9de29db9bb58	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55ca-0147-6b1b-0384650b77de
000d0000-55ca-0148-08f6-b6bd6418065e	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ca-0147-e02d-5ace4e7e872c
000d0000-55ca-0148-16df-deac170d8ca7	000e0000-55ca-0148-03f4-c4f56d0a108b	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ca-0147-cd5a-5254240382d4
\.


--
-- TOC entry 2903 (class 0 OID 12818273)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 12818321)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 12818253)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ca-0148-cbd8-26b96e8f1ba4	00080000-55ca-0147-1374-5e71c05a4b43	00090000-55ca-0148-90e1-21a930d35a59	AK		
\.


--
-- TOC entry 2913 (class 0 OID 12818374)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 12818842)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 12818854)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 12818877)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 12818399)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 12818210)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ca-0146-38bb-cdb970b073da	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55ca-0146-29a1-1e36662781af	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ca-0146-c323-f84dc778b785	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ca-0146-adae-12d93439f340	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ca-0146-a2ea-9e5839a272df	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ca-0146-a2d8-91b83b8a2856	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55ca-0146-9a4e-c868b4824f21	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ca-0146-0b8d-5272bdca8180	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55ca-0146-f18b-8dba6f3f7f7e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55ca-0146-97dd-9b80f89d9e34	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ca-0146-f61c-e9dddb9f358e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ca-0146-d0c7-bae7c32d9937	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ca-0146-12ca-75b94add3384	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ca-0146-2269-0b8871d31dda	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ca-0147-ed0b-d8c4e44d8294	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55ca-0147-eaf9-29d3680774a5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ca-0147-838a-e368a11f7cc7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ca-0147-cba0-b65d8540f5bd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ca-0147-e67b-61c6ac62ec08	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ca-0147-998a-901d26649380	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 12818123)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ca-0147-ed8d-0094cde6aab2	00000000-55ca-0147-eaf9-29d3680774a5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ca-0147-9242-dd059c45d188	00000000-55ca-0147-eaf9-29d3680774a5	00010000-55ca-0146-9146-647af772f869	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ca-0147-2746-68d5cc75b3e8	00000000-55ca-0147-838a-e368a11f7cc7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 12818134)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ca-0148-7715-d866d1fc39fa	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ca-0148-7113-75d67ace6f49	00010000-55ca-0148-e063-0c38f3a513be	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ca-0148-95db-15b7fe287cf5	00010000-55ca-0148-60b0-3998e447bc62	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ca-0148-abce-167a11d45be0	00010000-55ca-0148-cc9e-884b24166b8e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ca-0148-5a68-e2010cc88e9f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ca-0148-98df-fc92b4664914	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ca-0148-2974-036e09960c25	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ca-0148-7d38-3d4180af6314	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ca-0148-90e1-21a930d35a59	00010000-55ca-0148-9dad-db5fab735da6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ca-0148-1770-760e677ec160	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ca-0148-9db2-03892c60295f	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ca-0148-5e37-8dd3f13f5275	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ca-0148-23d2-a305ac0e27ce	00010000-55ca-0148-26e1-cbf8477a0258	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 12818088)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ca-0146-39d7-0331ddc5058f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ca-0146-bad7-05f4a3b2a597	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ca-0146-87e6-fd849ddfec80	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ca-0146-769c-0f6d32259558	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ca-0146-82c1-a22153a4bc3e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ca-0146-c166-eb0639e444dd	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ca-0146-9e4e-871b9aeafc3e	Abonma-read	Abonma - branje	f
00030000-55ca-0146-7609-8388e0a55c3f	Abonma-write	Abonma - spreminjanje	f
00030000-55ca-0146-8261-43399fc85913	Alternacija-read	Alternacija - branje	f
00030000-55ca-0146-3085-b0624155b17c	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ca-0146-ce2b-e3ad6a3464d5	Arhivalija-read	Arhivalija - branje	f
00030000-55ca-0146-6607-e5a9ecd2bbfc	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ca-0146-1031-a89579ef1722	Besedilo-read	Besedilo - branje	f
00030000-55ca-0146-5ba0-d19fdcf6d377	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ca-0146-3e3b-9d626216cdcf	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ca-0146-653b-39520bd5dd1e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ca-0146-3d62-a1c904974861	Dogodek-read	Dogodek - branje	f
00030000-55ca-0146-4f5c-8f848dc19141	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ca-0146-5a1f-5dc65426c2f4	DrugiVir-read	DrugiVir - branje	f
00030000-55ca-0146-cd51-2e416b70c089	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ca-0146-42ba-447017c83f94	Drzava-read	Drzava - branje	f
00030000-55ca-0146-2f65-83b99448dea6	Drzava-write	Drzava - spreminjanje	f
00030000-55ca-0146-66dc-e02ab9152e7a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ca-0146-bf6e-db8a1a321fa6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ca-0146-4e72-2820eb46b7d2	Funkcija-read	Funkcija - branje	f
00030000-55ca-0146-f1a6-9994dbdb01b8	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ca-0146-f9f6-367d4486b1cc	Gostovanje-read	Gostovanje - branje	f
00030000-55ca-0146-4173-24dd331c447a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ca-0146-b377-840c81c19745	Gostujoca-read	Gostujoca - branje	f
00030000-55ca-0146-1f61-71f2272e25b7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ca-0146-f79e-e79c2b5a0739	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ca-0146-21fa-72a76223646d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ca-0146-9c12-6a41ff2eb77a	Kupec-read	Kupec - branje	f
00030000-55ca-0146-8657-de2a7af98646	Kupec-write	Kupec - spreminjanje	f
00030000-55ca-0146-b183-258e736c92d2	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ca-0146-9846-5f35421586a4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ca-0146-fe83-981424c9766a	Option-read	Option - branje	f
00030000-55ca-0146-db5f-6ab6a6945c2f	Option-write	Option - spreminjanje	f
00030000-55ca-0146-e47b-4b40f8447fa8	OptionValue-read	OptionValue - branje	f
00030000-55ca-0146-a6aa-583e2e1c1553	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ca-0146-ea3e-bef048608e15	Oseba-read	Oseba - branje	f
00030000-55ca-0146-cf7a-b8e753d0eb15	Oseba-write	Oseba - spreminjanje	f
00030000-55ca-0146-5866-a5ee10ad55fd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ca-0146-7462-4cf68d68cd62	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ca-0146-413d-4c5e1a5769e1	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ca-0146-e4e0-46f25f87665a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ca-0146-5eba-9d85abb55599	Pogodba-read	Pogodba - branje	f
00030000-55ca-0146-f2aa-4df6a299ec9a	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ca-0146-85b9-49e1d4c64bbf	Popa-read	Popa - branje	f
00030000-55ca-0146-b503-a393663dcfa3	Popa-write	Popa - spreminjanje	f
00030000-55ca-0146-3223-cce062f4f3db	Posta-read	Posta - branje	f
00030000-55ca-0146-f094-a87806bfebe1	Posta-write	Posta - spreminjanje	f
00030000-55ca-0146-4f95-c5ed8e615d3e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ca-0146-273f-87308b01806c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ca-0146-6b29-ae874dd46260	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ca-0146-401e-8fe98f91b0e7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ca-0146-ecd1-09caad7312b7	Predstava-read	Predstava - branje	f
00030000-55ca-0146-1649-8a6dd7ccc7d1	Predstava-write	Predstava - spreminjanje	f
00030000-55ca-0146-fa85-3238eb828029	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ca-0146-01fe-c0cb64d6b6b7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ca-0146-f1de-9cd2fb37175e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ca-0146-e7bc-c254305aa4a4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ca-0146-c90f-a519de41bf30	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ca-0146-e5e5-f899ff540635	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ca-0146-8601-919e40f0f212	ProgramDela-read	ProgramDela - branje	f
00030000-55ca-0146-3f0c-bc10c00344c2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ca-0146-b04d-80049fdd7a1f	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ca-0146-3207-907f023c4e59	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ca-0146-a637-8789a54593d9	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ca-0146-b7ef-ce49eed47a89	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ca-0146-af8e-0696cc42f260	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ca-0146-3ecc-0376fca747fe	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ca-0146-a63d-312faf67c27d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ca-0146-ea76-2fb2b27a5abc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ca-0146-6537-71360e359c19	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ca-0146-83ce-899ba39112d0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ca-0146-62b6-29ca81fd9a5c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ca-0146-c08e-9828109f5281	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ca-0146-1536-7a30e5b4e818	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ca-0146-bb70-23f03722c9f9	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ca-0146-d33f-e550f9d4eecc	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ca-0146-75c4-ce06f810ef3e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ca-0146-b3d3-d70d4d695a55	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ca-0146-439b-1edd97e1dc71	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ca-0146-6c4f-32bd49320701	Prostor-read	Prostor - branje	f
00030000-55ca-0146-afb6-5391b9fdeffa	Prostor-write	Prostor - spreminjanje	f
00030000-55ca-0146-b847-05182f620c4d	Racun-read	Racun - branje	f
00030000-55ca-0146-c770-976bdcd4688e	Racun-write	Racun - spreminjanje	f
00030000-55ca-0146-976e-eed7f4f00a91	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ca-0146-3eb6-abf8ab2e0a33	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ca-0146-c6ca-c04012964960	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ca-0146-e3f2-0b6e1c6b7da9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ca-0146-1cef-22e22f662fe7	Rekvizit-read	Rekvizit - branje	f
00030000-55ca-0146-81f8-b4599582d959	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ca-0146-42b4-5e793dfaac4a	Revizija-read	Revizija - branje	f
00030000-55ca-0146-ef16-06f344104a71	Revizija-write	Revizija - spreminjanje	f
00030000-55ca-0146-e352-1726475f5a7b	Rezervacija-read	Rezervacija - branje	f
00030000-55ca-0146-7a60-b27bb9b53c55	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ca-0146-dce0-e722d6816e47	SedezniRed-read	SedezniRed - branje	f
00030000-55ca-0146-21e0-95c163c85a6e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ca-0146-8893-6d584ab19cf3	Sedez-read	Sedez - branje	f
00030000-55ca-0146-f096-adb920862e0b	Sedez-write	Sedez - spreminjanje	f
00030000-55ca-0146-51e8-0b695a8250cf	Sezona-read	Sezona - branje	f
00030000-55ca-0146-6c98-8766decea2ab	Sezona-write	Sezona - spreminjanje	f
00030000-55ca-0146-0edc-90cf112db6a8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ca-0146-69c5-420b197b6ccc	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ca-0146-119b-e8772ebf5a40	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ca-0146-d932-2873787087ff	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ca-0146-af4c-970d0739a159	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ca-0146-d976-1551a56fe468	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ca-0146-6269-213112728949	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ca-0146-c967-a6dd4aa9ec79	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ca-0146-7860-2d0e04cde39d	Telefonska-read	Telefonska - branje	f
00030000-55ca-0146-9f9b-061d1f565fd6	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ca-0146-4323-94bb355b2067	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ca-0146-7b3d-950a02ab928d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ca-0146-07eb-a31b8d8ce71d	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ca-0146-c19b-2c560a1fb45b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ca-0146-7a7d-e4a9ca8dbe4e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ca-0146-44d8-92b44b62a5c6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ca-0146-c6c5-8448affc3213	Trr-read	Trr - branje	f
00030000-55ca-0146-3612-24cef6c14f80	Trr-write	Trr - spreminjanje	f
00030000-55ca-0146-33aa-02e390f1f89e	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ca-0146-1d35-dfd6601d3d9e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ca-0146-5a6c-fb2cb6e6abc5	Vaja-read	Vaja - branje	f
00030000-55ca-0146-b619-5a6e3f6961fb	Vaja-write	Vaja - spreminjanje	f
00030000-55ca-0146-50c5-a1f512537b33	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ca-0146-c03b-0b7908f864fa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ca-0146-391c-9a24a7c24dc5	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ca-0146-098d-5c746ade9963	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ca-0146-6621-f0671d700880	Zasedenost-read	Zasedenost - branje	f
00030000-55ca-0146-806b-4536c9f5497e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ca-0146-f90b-40a51d3bce5a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ca-0146-aee3-98f145f1be0a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ca-0146-ab6d-62a65a9ebb3c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ca-0146-498d-8fea281aefaf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ca-0146-d683-2d0c8018021b	ClSkupina-write	Checkliste - urejanje skupin	f
00030000-55ca-0146-d267-915153ec8a8c	ClSkupina-read	Checkliste - branje skupin	f
00030000-55ca-0146-19a0-c15b5a8ebc5e	ClSekcija-write	Checkliste - urejanje sekcij	f
00030000-55ca-0146-6c12-0f818e2d120a	ClSekcija-read	Checkliste - branje sekcij	f
00030000-55ca-0146-743e-898ea55135c3	ClVzorec-write	Checkliste - urejanje glave chekcliste	f
00030000-55ca-0146-6323-3d3d7917574c	ClVzorec-read	Checkliste - branje checkliste	f
00030000-55ca-0146-63c1-66d9e5facafe	ClVzorecPostavka-write	Checkliste - urejanje postavke chekcliste	f
00030000-55ca-0146-3171-bae17624171d	ClVzorecPostavka-read	Checkliste - branje postavke checkliste	f
00030000-55ca-0146-bece-5b383e4251af	ClPregled-write	Checkliste - Razpis checklist  - generično dovoljenje	f
00030000-55ca-0146-a117-6a3a35dc923f	ClPregled-read	Checkliste - branje izpolnjenih checklist - generično dovoljenje	f
00030000-55ca-0146-8ecd-4f3de4129d8e	ClVrednost-write	Checkliste - izpolnjevanje checklist - generični permission	f
00030000-55ca-0146-18b5-a552e97d429f	ClVrednost-read	Checkliste - branje vrednosti checkliste - generični permission	f
\.


--
-- TOC entry 2890 (class 0 OID 12818107)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ca-0146-971b-b40c38b8d5a9	00030000-55ca-0146-bad7-05f4a3b2a597
00020000-55ca-0146-5e72-f43d23561fe7	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-9e4e-871b9aeafc3e
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-7609-8388e0a55c3f
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-8261-43399fc85913
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-3085-b0624155b17c
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-ce2b-e3ad6a3464d5
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-3d62-a1c904974861
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-769c-0f6d32259558
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-4f5c-8f848dc19141
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-2f65-83b99448dea6
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-4e72-2820eb46b7d2
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-f1a6-9994dbdb01b8
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-f9f6-367d4486b1cc
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-4173-24dd331c447a
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-b377-840c81c19745
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-1f61-71f2272e25b7
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-f79e-e79c2b5a0739
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-21fa-72a76223646d
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-fe83-981424c9766a
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-e47b-4b40f8447fa8
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-ea3e-bef048608e15
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-cf7a-b8e753d0eb15
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-85b9-49e1d4c64bbf
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-b503-a393663dcfa3
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-3223-cce062f4f3db
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-f094-a87806bfebe1
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-6b29-ae874dd46260
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-401e-8fe98f91b0e7
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-ecd1-09caad7312b7
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-1649-8a6dd7ccc7d1
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-c90f-a519de41bf30
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-e5e5-f899ff540635
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-6c4f-32bd49320701
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-afb6-5391b9fdeffa
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-c6ca-c04012964960
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-e3f2-0b6e1c6b7da9
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-1cef-22e22f662fe7
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-81f8-b4599582d959
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-51e8-0b695a8250cf
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-6c98-8766decea2ab
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-07eb-a31b8d8ce71d
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-33aa-02e390f1f89e
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-1d35-dfd6601d3d9e
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-5a6c-fb2cb6e6abc5
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-b619-5a6e3f6961fb
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-6621-f0671d700880
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-806b-4536c9f5497e
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-f90b-40a51d3bce5a
00020000-55ca-0146-73dc-de004b2c7b5c	00030000-55ca-0146-ab6d-62a65a9ebb3c
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-9e4e-871b9aeafc3e
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-ce2b-e3ad6a3464d5
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-3d62-a1c904974861
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-f9f6-367d4486b1cc
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-b377-840c81c19745
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-f79e-e79c2b5a0739
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-21fa-72a76223646d
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-fe83-981424c9766a
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-e47b-4b40f8447fa8
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-ea3e-bef048608e15
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-cf7a-b8e753d0eb15
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-85b9-49e1d4c64bbf
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-3223-cce062f4f3db
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-6b29-ae874dd46260
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-401e-8fe98f91b0e7
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-ecd1-09caad7312b7
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-6c4f-32bd49320701
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-c6ca-c04012964960
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-1cef-22e22f662fe7
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-51e8-0b695a8250cf
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-7860-2d0e04cde39d
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-9f9b-061d1f565fd6
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-c6c5-8448affc3213
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-3612-24cef6c14f80
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-391c-9a24a7c24dc5
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-098d-5c746ade9963
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-f90b-40a51d3bce5a
00020000-55ca-0146-2965-eab89ce80052	00030000-55ca-0146-ab6d-62a65a9ebb3c
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-9e4e-871b9aeafc3e
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-8261-43399fc85913
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-ce2b-e3ad6a3464d5
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-6607-e5a9ecd2bbfc
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-1031-a89579ef1722
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-3e3b-9d626216cdcf
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-3d62-a1c904974861
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-4e72-2820eb46b7d2
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-f9f6-367d4486b1cc
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-b377-840c81c19745
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-f79e-e79c2b5a0739
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-fe83-981424c9766a
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-e47b-4b40f8447fa8
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-ea3e-bef048608e15
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-85b9-49e1d4c64bbf
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-3223-cce062f4f3db
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-ecd1-09caad7312b7
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-c90f-a519de41bf30
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-6c4f-32bd49320701
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-c6ca-c04012964960
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-1cef-22e22f662fe7
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-51e8-0b695a8250cf
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-07eb-a31b8d8ce71d
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-5a6c-fb2cb6e6abc5
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-6621-f0671d700880
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-f90b-40a51d3bce5a
00020000-55ca-0146-2938-8d0a096974b1	00030000-55ca-0146-ab6d-62a65a9ebb3c
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-9e4e-871b9aeafc3e
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-7609-8388e0a55c3f
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-3085-b0624155b17c
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-ce2b-e3ad6a3464d5
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-3d62-a1c904974861
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-f9f6-367d4486b1cc
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-b377-840c81c19745
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-fe83-981424c9766a
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-e47b-4b40f8447fa8
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-85b9-49e1d4c64bbf
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-3223-cce062f4f3db
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-ecd1-09caad7312b7
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-6c4f-32bd49320701
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-c6ca-c04012964960
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-1cef-22e22f662fe7
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-51e8-0b695a8250cf
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-07eb-a31b8d8ce71d
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-f90b-40a51d3bce5a
00020000-55ca-0146-1af5-e341151038ed	00030000-55ca-0146-ab6d-62a65a9ebb3c
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-9e4e-871b9aeafc3e
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-ce2b-e3ad6a3464d5
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-3d62-a1c904974861
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-f9f6-367d4486b1cc
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-b377-840c81c19745
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-fe83-981424c9766a
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-e47b-4b40f8447fa8
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-85b9-49e1d4c64bbf
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-3223-cce062f4f3db
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-ecd1-09caad7312b7
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-6c4f-32bd49320701
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-c6ca-c04012964960
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-1cef-22e22f662fe7
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-51e8-0b695a8250cf
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-4323-94bb355b2067
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-87e6-fd849ddfec80
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-07eb-a31b8d8ce71d
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-f90b-40a51d3bce5a
00020000-55ca-0146-ce5f-4e81aded035b	00030000-55ca-0146-ab6d-62a65a9ebb3c
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-39d7-0331ddc5058f
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-bad7-05f4a3b2a597
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-87e6-fd849ddfec80
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-769c-0f6d32259558
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-82c1-a22153a4bc3e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c166-eb0639e444dd
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-9e4e-871b9aeafc3e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-7609-8388e0a55c3f
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-8261-43399fc85913
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3085-b0624155b17c
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-ce2b-e3ad6a3464d5
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6607-e5a9ecd2bbfc
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-1031-a89579ef1722
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-5ba0-d19fdcf6d377
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3e3b-9d626216cdcf
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-653b-39520bd5dd1e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3d62-a1c904974861
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-4f5c-8f848dc19141
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-42ba-447017c83f94
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-2f65-83b99448dea6
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-5a1f-5dc65426c2f4
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-cd51-2e416b70c089
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-66dc-e02ab9152e7a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-bf6e-db8a1a321fa6
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-4e72-2820eb46b7d2
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f1a6-9994dbdb01b8
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f9f6-367d4486b1cc
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-4173-24dd331c447a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b377-840c81c19745
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-1f61-71f2272e25b7
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f79e-e79c2b5a0739
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-21fa-72a76223646d
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-9c12-6a41ff2eb77a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-8657-de2a7af98646
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b183-258e736c92d2
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-9846-5f35421586a4
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-fe83-981424c9766a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-db5f-6ab6a6945c2f
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-e47b-4b40f8447fa8
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-a6aa-583e2e1c1553
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-ea3e-bef048608e15
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-cf7a-b8e753d0eb15
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-5866-a5ee10ad55fd
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-7462-4cf68d68cd62
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-413d-4c5e1a5769e1
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-e4e0-46f25f87665a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-5eba-9d85abb55599
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f2aa-4df6a299ec9a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-85b9-49e1d4c64bbf
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b503-a393663dcfa3
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3223-cce062f4f3db
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f094-a87806bfebe1
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-4f95-c5ed8e615d3e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-273f-87308b01806c
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6b29-ae874dd46260
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-401e-8fe98f91b0e7
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-ecd1-09caad7312b7
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-1649-8a6dd7ccc7d1
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-fa85-3238eb828029
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-01fe-c0cb64d6b6b7
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f1de-9cd2fb37175e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-e7bc-c254305aa4a4
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c90f-a519de41bf30
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-e5e5-f899ff540635
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-8601-919e40f0f212
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3f0c-bc10c00344c2
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b04d-80049fdd7a1f
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3207-907f023c4e59
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-a637-8789a54593d9
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b7ef-ce49eed47a89
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-af8e-0696cc42f260
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3ecc-0376fca747fe
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-a63d-312faf67c27d
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-ea76-2fb2b27a5abc
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6537-71360e359c19
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-83ce-899ba39112d0
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-62b6-29ca81fd9a5c
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c08e-9828109f5281
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-1536-7a30e5b4e818
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-bb70-23f03722c9f9
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-d33f-e550f9d4eecc
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-75c4-ce06f810ef3e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b3d3-d70d4d695a55
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-439b-1edd97e1dc71
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6c4f-32bd49320701
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-afb6-5391b9fdeffa
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b847-05182f620c4d
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c770-976bdcd4688e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-976e-eed7f4f00a91
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3eb6-abf8ab2e0a33
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c6ca-c04012964960
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-e3f2-0b6e1c6b7da9
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-1cef-22e22f662fe7
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-81f8-b4599582d959
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-42b4-5e793dfaac4a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-ef16-06f344104a71
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-e352-1726475f5a7b
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-7a60-b27bb9b53c55
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-dce0-e722d6816e47
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-21e0-95c163c85a6e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-8893-6d584ab19cf3
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f096-adb920862e0b
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-51e8-0b695a8250cf
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6c98-8766decea2ab
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-0edc-90cf112db6a8
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-69c5-420b197b6ccc
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-119b-e8772ebf5a40
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-d932-2873787087ff
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-af4c-970d0739a159
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-d976-1551a56fe468
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6269-213112728949
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c967-a6dd4aa9ec79
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-7860-2d0e04cde39d
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-9f9b-061d1f565fd6
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-4323-94bb355b2067
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-7b3d-950a02ab928d
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-07eb-a31b8d8ce71d
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c19b-2c560a1fb45b
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-7a7d-e4a9ca8dbe4e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-44d8-92b44b62a5c6
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c6c5-8448affc3213
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-3612-24cef6c14f80
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-33aa-02e390f1f89e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-1d35-dfd6601d3d9e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-5a6c-fb2cb6e6abc5
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-b619-5a6e3f6961fb
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-50c5-a1f512537b33
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-c03b-0b7908f864fa
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-391c-9a24a7c24dc5
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-098d-5c746ade9963
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-6621-f0671d700880
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-806b-4536c9f5497e
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-f90b-40a51d3bce5a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-aee3-98f145f1be0a
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-ab6d-62a65a9ebb3c
00020000-55ca-0148-4467-72be48a3eab7	00030000-55ca-0146-498d-8fea281aefaf
\.


--
-- TOC entry 2918 (class 0 OID 12818406)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 12818437)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 12818551)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ca-0148-ccd5-24d3d977a23f	00090000-55ca-0148-7715-d866d1fc39fa	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ca-0148-ecc3-b08a14eaf6f9	00090000-55ca-0148-98df-fc92b4664914	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ca-0148-3aaa-95a4438e8c43	00090000-55ca-0148-23d2-a305ac0e27ce	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 12818167)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ca-0147-1374-5e71c05a4b43	00040000-55ca-0146-8d6d-0a672382f1e4	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0147-b5b7-ebe5ffad0af0	00040000-55ca-0146-8d6d-0a672382f1e4	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ca-0147-7a45-8d6b7f26a703	00040000-55ca-0146-8d6d-0a672382f1e4	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0147-005b-fe86fb7aada2	00040000-55ca-0146-8d6d-0a672382f1e4	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0147-9f76-23586571e61e	00040000-55ca-0146-8d6d-0a672382f1e4	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0147-bcc4-449103273fce	00040000-55ca-0146-decf-d92009b8067d	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0147-c729-0b45755935c4	00040000-55ca-0146-807b-a2d84c928218	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0147-9d2c-9c9c7f629232	00040000-55ca-0146-071b-2503a362f97c	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ca-0148-83e8-af1bea02a678	00040000-55ca-0146-8d6d-0a672382f1e4	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 12818202)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ca-0146-6f29-44492c4b76ac	8341	Adlešiči
00050000-55ca-0146-7e6c-8b4a1769458d	5270	Ajdovščina
00050000-55ca-0146-85a7-02e5190502b3	6280	Ankaran/Ancarano
00050000-55ca-0146-7f74-6377f3966171	9253	Apače
00050000-55ca-0146-0c9d-bd4d11998dd5	8253	Artiče
00050000-55ca-0146-a6f8-1dd0080fe8ed	4275	Begunje na Gorenjskem
00050000-55ca-0146-f064-122d6a8278af	1382	Begunje pri Cerknici
00050000-55ca-0146-139d-728598ce49c8	9231	Beltinci
00050000-55ca-0146-95a8-02000804f34a	2234	Benedikt
00050000-55ca-0146-d171-4fffbd350575	2345	Bistrica ob Dravi
00050000-55ca-0146-95bc-a7db6ed82bca	3256	Bistrica ob Sotli
00050000-55ca-0146-22e8-095befa7df7f	8259	Bizeljsko
00050000-55ca-0146-c004-22beebbc896c	1223	Blagovica
00050000-55ca-0146-e391-1358c3c4b47e	8283	Blanca
00050000-55ca-0146-23ad-8dd3f25975ca	4260	Bled
00050000-55ca-0146-a05e-518debb6d114	4273	Blejska Dobrava
00050000-55ca-0146-4970-c635d429419d	9265	Bodonci
00050000-55ca-0146-b1a2-c186cdda2320	9222	Bogojina
00050000-55ca-0146-a278-6232d1e3a0bd	4263	Bohinjska Bela
00050000-55ca-0146-5e41-b45658334fc6	4264	Bohinjska Bistrica
00050000-55ca-0146-58a9-749ba7e8129d	4265	Bohinjsko jezero
00050000-55ca-0146-d261-53ab1c6edade	1353	Borovnica
00050000-55ca-0146-caf4-feced872c3ab	8294	Boštanj
00050000-55ca-0146-3710-f9e97a90ecce	5230	Bovec
00050000-55ca-0146-fd73-f2f007672085	5295	Branik
00050000-55ca-0146-61b9-d8e5d9c0f793	3314	Braslovče
00050000-55ca-0146-2cf6-9f90ae5452b9	5223	Breginj
00050000-55ca-0146-f59e-094abb959735	8280	Brestanica
00050000-55ca-0146-4d8a-ce9addb1e555	2354	Bresternica
00050000-55ca-0146-65f6-7dca39b5cdf3	4243	Brezje
00050000-55ca-0146-24a8-edbdd06ce0f2	1351	Brezovica pri Ljubljani
00050000-55ca-0146-247b-a78b4f1d1480	8250	Brežice
00050000-55ca-0146-52a1-63383d6d468c	4210	Brnik - Aerodrom
00050000-55ca-0146-b397-c41a186b9e67	8321	Brusnice
00050000-55ca-0146-52d3-cc770302f6e7	3255	Buče
00050000-55ca-0146-7b5e-f96a0456a975	8276	Bučka 
00050000-55ca-0146-6531-2dfacf8e7939	9261	Cankova
00050000-55ca-0146-201d-f18de1d771f4	3000	Celje 
00050000-55ca-0146-962b-f731f059ef8b	3001	Celje - poštni predali
00050000-55ca-0146-f519-48eb4a2b64ff	4207	Cerklje na Gorenjskem
00050000-55ca-0146-edf0-20da3753c36b	8263	Cerklje ob Krki
00050000-55ca-0146-e531-27a6c57fb9fe	1380	Cerknica
00050000-55ca-0146-745a-7cbdaad9ab9a	5282	Cerkno
00050000-55ca-0146-6236-41b6d90e14cf	2236	Cerkvenjak
00050000-55ca-0146-24be-cf7762679faf	2215	Ceršak
00050000-55ca-0146-1ed8-56e8732a116e	2326	Cirkovce
00050000-55ca-0146-2d44-79c74c05d5b0	2282	Cirkulane
00050000-55ca-0146-e4b2-d65581dd64cd	5273	Col
00050000-55ca-0146-c6ec-e307659ed527	8251	Čatež ob Savi
00050000-55ca-0146-4b39-ec1f4d063fca	1413	Čemšenik
00050000-55ca-0146-6012-63b4cf172fb6	5253	Čepovan
00050000-55ca-0146-361e-8c7c173c2a5f	9232	Črenšovci
00050000-55ca-0146-da7f-50e908204573	2393	Črna na Koroškem
00050000-55ca-0146-324e-d1a7553a4a8f	6275	Črni Kal
00050000-55ca-0146-67a5-2fb8c6c0c503	5274	Črni Vrh nad Idrijo
00050000-55ca-0146-eb00-e39100d7668f	5262	Črniče
00050000-55ca-0146-28d8-37edf560da01	8340	Črnomelj
00050000-55ca-0146-13ab-43edd46d8c70	6271	Dekani
00050000-55ca-0146-b783-5c50a33743bf	5210	Deskle
00050000-55ca-0146-adef-84a479ce1bf9	2253	Destrnik
00050000-55ca-0146-ac79-10c48cbdd948	6215	Divača
00050000-55ca-0146-3f83-c74852af938e	1233	Dob
00050000-55ca-0146-e163-59eb10a8ab8b	3224	Dobje pri Planini
00050000-55ca-0146-f7ba-e738630e09e3	8257	Dobova
00050000-55ca-0146-78ad-abf1af5f64d0	1423	Dobovec
00050000-55ca-0146-049f-a3f124b9f1ef	5263	Dobravlje
00050000-55ca-0146-870f-8dc8535efe0d	3204	Dobrna
00050000-55ca-0146-3d2f-7180916687c4	8211	Dobrnič
00050000-55ca-0146-420a-0cf7be72770b	1356	Dobrova
00050000-55ca-0146-26ac-af065cd5e181	9223	Dobrovnik/Dobronak 
00050000-55ca-0146-9871-a200b17ff9b2	5212	Dobrovo v Brdih
00050000-55ca-0146-6ba9-d351ffd7d13b	1431	Dol pri Hrastniku
00050000-55ca-0146-148c-2c20eed30638	1262	Dol pri Ljubljani
00050000-55ca-0146-7718-ab57384fff22	1273	Dole pri Litiji
00050000-55ca-0146-8694-32243ac06189	1331	Dolenja vas
00050000-55ca-0146-6073-80e320245105	8350	Dolenjske Toplice
00050000-55ca-0146-7045-dd38a2a953ea	1230	Domžale
00050000-55ca-0146-7ada-0f528aed3d45	2252	Dornava
00050000-55ca-0146-cecc-5c2503e64c1c	5294	Dornberk
00050000-55ca-0146-23a4-e39c605cf474	1319	Draga
00050000-55ca-0146-b77f-66fb78a89c8a	8343	Dragatuš
00050000-55ca-0146-9183-d59babb753d8	3222	Dramlje
00050000-55ca-0146-8869-2c13b48ece7d	2370	Dravograd
00050000-55ca-0146-4899-88de4b370ab2	4203	Duplje
00050000-55ca-0146-baf1-e5be274974c4	6221	Dutovlje
00050000-55ca-0146-93bb-eb032d5b7172	8361	Dvor
00050000-55ca-0146-84e4-0e0823e62ff0	2343	Fala
00050000-55ca-0146-e10c-d3191be5022a	9208	Fokovci
00050000-55ca-0146-6750-3c9d5ec86e37	2313	Fram
00050000-55ca-0146-35fd-6ee9a7af5947	3213	Frankolovo
00050000-55ca-0146-8b6d-10dd0adeffc4	1274	Gabrovka
00050000-55ca-0146-96d1-d7eae38998e7	8254	Globoko
00050000-55ca-0146-1590-1d47894dbeff	5275	Godovič
00050000-55ca-0146-e610-7b33021237ed	4204	Golnik
00050000-55ca-0146-75b5-c11c83bd5d2c	3303	Gomilsko
00050000-55ca-0146-444e-4e1fe9c4bd0d	4224	Gorenja vas
00050000-55ca-0146-8709-4777799ae601	3263	Gorica pri Slivnici
00050000-55ca-0146-69e6-1f12405606e8	2272	Gorišnica
00050000-55ca-0146-eb0e-d278b0ecb0ec	9250	Gornja Radgona
00050000-55ca-0146-8d0d-f04a16827cb7	3342	Gornji Grad
00050000-55ca-0146-9827-bbef241087e4	4282	Gozd Martuljek
00050000-55ca-0146-2db3-b4bd808843cc	6272	Gračišče
00050000-55ca-0146-ffbe-319f69d9480c	9264	Grad
00050000-55ca-0146-7170-8824dee30abd	8332	Gradac
00050000-55ca-0146-17dd-23a2059e51c0	1384	Grahovo
00050000-55ca-0146-e0a7-b6e17802656a	5242	Grahovo ob Bači
00050000-55ca-0146-5542-cee9551758f3	5251	Grgar
00050000-55ca-0146-8745-4680d414a06a	3302	Griže
00050000-55ca-0146-0c36-f7f491d36823	3231	Grobelno
00050000-55ca-0146-6c10-d61a84f5f03a	1290	Grosuplje
00050000-55ca-0146-94c9-c8dcda509645	2288	Hajdina
00050000-55ca-0146-e77b-f9b3e5a704f5	8362	Hinje
00050000-55ca-0146-a09c-2e87195e446e	2311	Hoče
00050000-55ca-0146-3852-8c9c6adba6ca	9205	Hodoš/Hodos
00050000-55ca-0146-7d74-5a98384bd1d5	1354	Horjul
00050000-55ca-0146-9b31-9cf3aca5bcbd	1372	Hotedršica
00050000-55ca-0146-c73f-2a9f78126638	1430	Hrastnik
00050000-55ca-0146-53cd-51b337c65703	6225	Hruševje
00050000-55ca-0146-c012-cd7bfed957ee	4276	Hrušica
00050000-55ca-0146-dbd2-e0bc81abad1d	5280	Idrija
00050000-55ca-0146-2592-db361c84229c	1292	Ig
00050000-55ca-0146-7480-98c47033455e	6250	Ilirska Bistrica
00050000-55ca-0146-95dd-694d600956b5	6251	Ilirska Bistrica-Trnovo
00050000-55ca-0146-13a4-71de9734e9dc	1295	Ivančna Gorica
00050000-55ca-0146-893c-03fb1a8c25b4	2259	Ivanjkovci
00050000-55ca-0146-f3e5-6b9b68624028	1411	Izlake
00050000-55ca-0146-5317-45fdc7837fb1	6310	Izola/Isola
00050000-55ca-0146-fec2-b153b8a3c09b	2222	Jakobski Dol
00050000-55ca-0146-0141-3a6984ee8c3a	2221	Jarenina
00050000-55ca-0146-a76b-2e7b06fbf6f1	6254	Jelšane
00050000-55ca-0146-4eea-297363360f4a	4270	Jesenice
00050000-55ca-0146-c206-63641705fbfd	8261	Jesenice na Dolenjskem
00050000-55ca-0146-9c42-ce0359adefa2	3273	Jurklošter
00050000-55ca-0146-1042-2e2c2d0f1551	2223	Jurovski Dol
00050000-55ca-0146-19ef-823ddea60a58	2256	Juršinci
00050000-55ca-0146-7576-c192de867e69	5214	Kal nad Kanalom
00050000-55ca-0146-2264-9d82fb1dada5	3233	Kalobje
00050000-55ca-0146-f3f7-4eea520546c3	4246	Kamna Gorica
00050000-55ca-0146-b7ca-581c66ab9d0c	2351	Kamnica
00050000-55ca-0146-ae46-63bbaeef095b	1241	Kamnik
00050000-55ca-0146-f655-178207bf9d92	5213	Kanal
00050000-55ca-0146-434f-2fd7b76ffcd6	8258	Kapele
00050000-55ca-0146-1dcb-cc6135fc3004	2362	Kapla
00050000-55ca-0146-45e0-7ce95487a4dd	2325	Kidričevo
00050000-55ca-0146-9ea8-16784a63d681	1412	Kisovec
00050000-55ca-0146-b02f-33791a41a984	6253	Knežak
00050000-55ca-0146-d4a0-a2a904dff39d	5222	Kobarid
00050000-55ca-0146-82b9-a1d052c06ea8	9227	Kobilje
00050000-55ca-0146-6b1b-03716a11c78e	1330	Kočevje
00050000-55ca-0146-dd98-12574cddc793	1338	Kočevska Reka
00050000-55ca-0146-d60b-4de3aa4fe13c	2276	Kog
00050000-55ca-0146-f0ed-af2d83cae6dd	5211	Kojsko
00050000-55ca-0146-dde3-c3f984413f2a	6223	Komen
00050000-55ca-0146-1e70-925cd827e0c8	1218	Komenda
00050000-55ca-0146-9396-1129ea36d41b	6000	Koper/Capodistria 
00050000-55ca-0146-90b6-285ecae955c4	6001	Koper/Capodistria - poštni predali
00050000-55ca-0146-66c5-7c7f14da867e	8282	Koprivnica
00050000-55ca-0146-f773-daf9e3dc2fe2	5296	Kostanjevica na Krasu
00050000-55ca-0146-1098-9ae06d164ff9	8311	Kostanjevica na Krki
00050000-55ca-0146-e620-3e812503b7de	1336	Kostel
00050000-55ca-0146-0c44-369423c79af2	6256	Košana
00050000-55ca-0146-f3c0-4989eb630db5	2394	Kotlje
00050000-55ca-0146-849d-1ddd04a0dc44	6240	Kozina
00050000-55ca-0146-29f3-7400bb5b7c6d	3260	Kozje
00050000-55ca-0146-1144-b02130804310	4000	Kranj 
00050000-55ca-0146-4909-32bf44a78410	4001	Kranj - poštni predali
00050000-55ca-0146-d147-759bae4693ce	4280	Kranjska Gora
00050000-55ca-0146-6d27-a63ad421c5fe	1281	Kresnice
00050000-55ca-0146-7f0e-78ac2d1206aa	4294	Križe
00050000-55ca-0146-94a6-e93aa8e54d40	9206	Križevci
00050000-55ca-0146-6b2e-f0ef54c34d49	9242	Križevci pri Ljutomeru
00050000-55ca-0146-b495-e09ba959a121	1301	Krka
00050000-55ca-0146-9b19-d8e83603f0b3	8296	Krmelj
00050000-55ca-0146-73e1-23e43dbf6817	4245	Kropa
00050000-55ca-0146-1f9d-b31bae9bbd97	8262	Krška vas
00050000-55ca-0146-37b1-e885e760e680	8270	Krško
00050000-55ca-0146-2de9-adeced34a35c	9263	Kuzma
00050000-55ca-0146-c8e2-c1ad7d948382	2318	Laporje
00050000-55ca-0146-cdeb-04150fd29838	3270	Laško
00050000-55ca-0146-df2b-f2e6db79483f	1219	Laze v Tuhinju
00050000-55ca-0146-4f4f-eb7ab6143e6c	2230	Lenart v Slovenskih goricah
00050000-55ca-0146-ec56-f4a4dba5c6a5	9220	Lendava/Lendva
00050000-55ca-0146-6c97-84c8b7ccea62	4248	Lesce
00050000-55ca-0146-cb59-8bc5d11f6581	3261	Lesično
00050000-55ca-0146-44be-a2184dac7b0b	8273	Leskovec pri Krškem
00050000-55ca-0146-f21f-69e50c87c217	2372	Libeliče
00050000-55ca-0146-9219-28b4623425e7	2341	Limbuš
00050000-55ca-0146-ba40-9cc8f93f851a	1270	Litija
00050000-55ca-0146-1ed2-e95c474513ef	3202	Ljubečna
00050000-55ca-0146-2d05-19651c0cbdc3	1000	Ljubljana 
00050000-55ca-0146-9ed2-7d8163e1466f	1001	Ljubljana - poštni predali
00050000-55ca-0146-e771-e949c0eceb84	1231	Ljubljana - Črnuče
00050000-55ca-0146-96ae-edb5e5f40b56	1261	Ljubljana - Dobrunje
00050000-55ca-0146-7a6d-a32293d0f6f1	1260	Ljubljana - Polje
00050000-55ca-0146-35d0-748ecf03186e	1210	Ljubljana - Šentvid
00050000-55ca-0146-fe89-ac6b38696d52	1211	Ljubljana - Šmartno
00050000-55ca-0146-3b1e-ffb481753905	3333	Ljubno ob Savinji
00050000-55ca-0146-bae4-80204d59651a	9240	Ljutomer
00050000-55ca-0146-8a2d-5fcf42a78b42	3215	Loče
00050000-55ca-0146-9437-14912d040e85	5231	Log pod Mangartom
00050000-55ca-0146-8ec9-ea642f515005	1358	Log pri Brezovici
00050000-55ca-0146-0862-82bdca1a645b	1370	Logatec
00050000-55ca-0146-9eb6-84effe6a513a	1371	Logatec
00050000-55ca-0146-5a5a-f1cfeaf23ed7	1434	Loka pri Zidanem Mostu
00050000-55ca-0146-f38e-765309b53729	3223	Loka pri Žusmu
00050000-55ca-0146-ae9a-e835c2cf08c3	6219	Lokev
00050000-55ca-0146-2159-8dbce874504c	1318	Loški Potok
00050000-55ca-0146-4b16-c405a9d24657	2324	Lovrenc na Dravskem polju
00050000-55ca-0146-5f96-818c61dd5ff8	2344	Lovrenc na Pohorju
00050000-55ca-0146-4ae5-228e03b383b8	3334	Luče
00050000-55ca-0146-d157-150c0d9048a6	1225	Lukovica
00050000-55ca-0146-c403-7182cab3a123	9202	Mačkovci
00050000-55ca-0146-2672-cd5cfefa38a3	2322	Majšperk
00050000-55ca-0146-8404-64ea447c884d	2321	Makole
00050000-55ca-0146-9e9f-a3eddba5c3e6	9243	Mala Nedelja
00050000-55ca-0146-4705-272e23ce7517	2229	Malečnik
00050000-55ca-0146-c2ef-4712c3f62f15	6273	Marezige
00050000-55ca-0146-ddf7-2b8ae837dba4	2000	Maribor 
00050000-55ca-0146-4bd2-a7465ab408ea	2001	Maribor - poštni predali
00050000-55ca-0146-d043-613cd71cd756	2206	Marjeta na Dravskem polju
00050000-55ca-0146-9adb-357f273a1f11	2281	Markovci
00050000-55ca-0146-b7b9-5c39806ddd69	9221	Martjanci
00050000-55ca-0146-a1f0-1defe0724c14	6242	Materija
00050000-55ca-0146-0291-96fc8803ccfc	4211	Mavčiče
00050000-55ca-0146-7925-6174102d51eb	1215	Medvode
00050000-55ca-0146-6ce6-78880d6fd8a0	1234	Mengeš
00050000-55ca-0146-8df8-0d25fb505f8f	8330	Metlika
00050000-55ca-0146-43ff-ad1a15bfcb2d	2392	Mežica
00050000-55ca-0146-e208-44939fb4a52e	2204	Miklavž na Dravskem polju
00050000-55ca-0146-4921-eefc33e651c9	2275	Miklavž pri Ormožu
00050000-55ca-0146-199c-8a54f783c74a	5291	Miren
00050000-55ca-0146-dc04-da8e40731d02	8233	Mirna
00050000-55ca-0146-5569-c14d7584c672	8216	Mirna Peč
00050000-55ca-0146-9574-7b06f14e6ffe	2382	Mislinja
00050000-55ca-0146-59e9-f097b8610f05	4281	Mojstrana
00050000-55ca-0146-df46-613848f0e3e2	8230	Mokronog
00050000-55ca-0146-1884-508c2ad944ce	1251	Moravče
00050000-55ca-0146-fd87-c456e7b80d26	9226	Moravske Toplice
00050000-55ca-0146-57ac-b1dc09988b2b	5216	Most na Soči
00050000-55ca-0146-7e63-52a878b57dd8	1221	Motnik
00050000-55ca-0146-c5f3-463c8aa232f2	3330	Mozirje
00050000-55ca-0146-6e0c-06bd505e188c	9000	Murska Sobota 
00050000-55ca-0146-1589-0ec3b140b1ac	9001	Murska Sobota - poštni predali
00050000-55ca-0146-c651-05222cfdb4aa	2366	Muta
00050000-55ca-0146-e2fc-f14650e7f236	4202	Naklo
00050000-55ca-0146-0e8d-ff3a180dff75	3331	Nazarje
00050000-55ca-0146-d68f-65b0c5fe9942	1357	Notranje Gorice
00050000-55ca-0146-f9e3-1f35b179a374	3203	Nova Cerkev
00050000-55ca-0146-ec9e-64d5b3ee27e5	5000	Nova Gorica 
00050000-55ca-0146-85fb-157be0a6b10a	5001	Nova Gorica - poštni predali
00050000-55ca-0146-ca56-4b56660bc348	1385	Nova vas
00050000-55ca-0146-1122-f2f266816229	8000	Novo mesto
00050000-55ca-0146-c0e2-23194acd56be	8001	Novo mesto - poštni predali
00050000-55ca-0146-0cf1-9a2657e7b7c5	6243	Obrov
00050000-55ca-0146-f96f-6c9a5285d41a	9233	Odranci
00050000-55ca-0146-6340-f631e473d9ba	2317	Oplotnica
00050000-55ca-0146-9238-094540dac5e4	2312	Orehova vas
00050000-55ca-0146-b72d-d1078fa453f7	2270	Ormož
00050000-55ca-0146-6fce-9c899326eeaa	1316	Ortnek
00050000-55ca-0146-8267-716cc2584216	1337	Osilnica
00050000-55ca-0146-be99-18ae724f255e	8222	Otočec
00050000-55ca-0146-ef1c-fcdf28193bcb	2361	Ožbalt
00050000-55ca-0146-c6d4-e297a85f43c5	2231	Pernica
00050000-55ca-0146-6e20-61e1ed2e425b	2211	Pesnica pri Mariboru
00050000-55ca-0146-d40c-397535e39382	9203	Petrovci
00050000-55ca-0146-256c-5d1b1fe43f88	3301	Petrovče
00050000-55ca-0146-e871-a4e893916494	6330	Piran/Pirano
00050000-55ca-0146-27a8-f68a453155c0	8255	Pišece
00050000-55ca-0146-d710-f69daa93b51d	6257	Pivka
00050000-55ca-0146-0885-ff554f11636a	6232	Planina
00050000-55ca-0146-b1fc-47f2d181fc91	3225	Planina pri Sevnici
00050000-55ca-0146-1c87-0d6cfb9f3aa6	6276	Pobegi
00050000-55ca-0146-a835-d981990e0e52	8312	Podbočje
00050000-55ca-0146-610e-cb3dc98780f8	5243	Podbrdo
00050000-55ca-0146-e9c3-337bcd16591b	3254	Podčetrtek
00050000-55ca-0146-a55f-a2a30d4ec9b8	2273	Podgorci
00050000-55ca-0146-7f5b-fa2cdfd82108	6216	Podgorje
00050000-55ca-0146-26aa-662cd8a7d4c2	2381	Podgorje pri Slovenj Gradcu
00050000-55ca-0146-f323-698b532230dd	6244	Podgrad
00050000-55ca-0146-0174-8724bdcb9cd9	1414	Podkum
00050000-55ca-0146-a9d2-3db26afa283e	2286	Podlehnik
00050000-55ca-0146-8aab-92bee6cf7042	5272	Podnanos
00050000-55ca-0146-523b-987eb8a948d3	4244	Podnart
00050000-55ca-0146-bef7-e0f587ee71d1	3241	Podplat
00050000-55ca-0146-83bc-97b51f07f09a	3257	Podsreda
00050000-55ca-0146-f677-63868bdd00c1	2363	Podvelka
00050000-55ca-0146-8450-8a8bbc9e09cd	2208	Pohorje
00050000-55ca-0146-a517-53c05d32e544	2257	Polenšak
00050000-55ca-0146-1920-6c5a517ea3e8	1355	Polhov Gradec
00050000-55ca-0146-efed-2c7ad220942a	4223	Poljane nad Škofjo Loko
00050000-55ca-0146-42e4-a368d6a32efb	2319	Poljčane
00050000-55ca-0146-dffe-6a692246a588	1272	Polšnik
00050000-55ca-0146-44c4-9af22af95521	3313	Polzela
00050000-55ca-0146-5cb2-184927d9a35c	3232	Ponikva
00050000-55ca-0146-1539-bb960d9562c9	6320	Portorož/Portorose
00050000-55ca-0146-febe-c7ea4648e09b	6230	Postojna
00050000-55ca-0146-f9e2-9e34bd473a92	2331	Pragersko
00050000-55ca-0146-4f68-00b4aedfc258	3312	Prebold
00050000-55ca-0146-9102-51cb946f447d	4205	Preddvor
00050000-55ca-0146-aa59-d230e290bf6c	6255	Prem
00050000-55ca-0146-bf05-927238d689c3	1352	Preserje
00050000-55ca-0146-dbe9-60c623b2a7a2	6258	Prestranek
00050000-55ca-0146-c03c-d2d8d892f316	2391	Prevalje
00050000-55ca-0146-90c5-d2e42dbad2d4	3262	Prevorje
00050000-55ca-0146-e47c-a601d9a76ea8	1276	Primskovo 
00050000-55ca-0146-041a-eb4337b2a566	3253	Pristava pri Mestinju
00050000-55ca-0146-2979-df21d4721321	9207	Prosenjakovci/Partosfalva
00050000-55ca-0146-b2c5-3671830ca075	5297	Prvačina
00050000-55ca-0146-1f04-11a99e481b3e	2250	Ptuj
00050000-55ca-0146-2e88-aa1f6db85a41	2323	Ptujska Gora
00050000-55ca-0146-0396-ee5384adec50	9201	Puconci
00050000-55ca-0146-0d2f-3a85e426f49d	2327	Rače
00050000-55ca-0146-d5fb-10ae38ddbac1	1433	Radeče
00050000-55ca-0146-5396-32d25d4ee19a	9252	Radenci
00050000-55ca-0146-3122-b6a69e7f732d	2360	Radlje ob Dravi
00050000-55ca-0146-5657-71e091ac0c03	1235	Radomlje
00050000-55ca-0146-7cc3-72d313bf7c38	4240	Radovljica
00050000-55ca-0146-e00b-d397f51cf65c	8274	Raka
00050000-55ca-0146-5ac5-04306a58e6bc	1381	Rakek
00050000-55ca-0146-f208-df2c5f0602a4	4283	Rateče - Planica
00050000-55ca-0146-099b-f9ac3040a782	2390	Ravne na Koroškem
00050000-55ca-0146-d512-ee828f5a2614	9246	Razkrižje
00050000-55ca-0146-f8ff-8b0cf40cf38e	3332	Rečica ob Savinji
00050000-55ca-0146-e064-16f1ea83877b	5292	Renče
00050000-55ca-0146-e09d-28040942e2a8	1310	Ribnica
00050000-55ca-0146-2bdb-3bc19f1bd2a7	2364	Ribnica na Pohorju
00050000-55ca-0146-7e66-8e1046756cf1	3272	Rimske Toplice
00050000-55ca-0146-0838-c311e047ba7f	1314	Rob
00050000-55ca-0146-cac3-9f97005c84e0	5215	Ročinj
00050000-55ca-0146-540d-3e924dc0ce33	3250	Rogaška Slatina
00050000-55ca-0146-a450-3632b99fd422	9262	Rogašovci
00050000-55ca-0146-e128-915a90c3b233	3252	Rogatec
00050000-55ca-0146-7b22-8ba7f9ddb9cb	1373	Rovte
00050000-55ca-0146-71de-cc4e5efd88bb	2342	Ruše
00050000-55ca-0146-a82c-a5e0f7a09075	1282	Sava
00050000-55ca-0146-4330-a2e25cfcf91e	6333	Sečovlje/Sicciole
00050000-55ca-0146-6a22-fc86dd578d2a	4227	Selca
00050000-55ca-0146-4e68-39625cbbfb0e	2352	Selnica ob Dravi
00050000-55ca-0146-3714-ab7c91ce1c48	8333	Semič
00050000-55ca-0146-40a3-2675fbf944d3	8281	Senovo
00050000-55ca-0146-7c7b-cb1e728cc45b	6224	Senožeče
00050000-55ca-0146-cd93-a599e118c85c	8290	Sevnica
00050000-55ca-0146-2b76-b8e1dc7e66f0	6210	Sežana
00050000-55ca-0146-b686-2189d2a5da8f	2214	Sladki Vrh
00050000-55ca-0146-e31d-3b70991c1982	5283	Slap ob Idrijci
00050000-55ca-0146-59c4-dd892fbd7df3	2380	Slovenj Gradec
00050000-55ca-0146-06c3-f9f03087b9d7	2310	Slovenska Bistrica
00050000-55ca-0146-132f-30137e35c56e	3210	Slovenske Konjice
00050000-55ca-0146-10d6-638e0ad4dfbc	1216	Smlednik
00050000-55ca-0146-61d7-2ccd133437f9	5232	Soča
00050000-55ca-0146-9926-70b654ede49f	1317	Sodražica
00050000-55ca-0146-44b7-9c7b5defa7a0	3335	Solčava
00050000-55ca-0146-043d-bfe645af96fe	5250	Solkan
00050000-55ca-0146-13a9-f079a839322a	4229	Sorica
00050000-55ca-0146-df9e-6d7e5ef4ad61	4225	Sovodenj
00050000-55ca-0146-cc48-a41e50facba2	5281	Spodnja Idrija
00050000-55ca-0146-e5bb-926129aeaf34	2241	Spodnji Duplek
00050000-55ca-0146-ee86-fbbc94a310d9	9245	Spodnji Ivanjci
00050000-55ca-0146-366a-8c63d70514cc	2277	Središče ob Dravi
00050000-55ca-0146-d3f5-b4997b3412e4	4267	Srednja vas v Bohinju
00050000-55ca-0146-2749-7770baa8d1d9	8256	Sromlje 
00050000-55ca-0146-3b0d-65c6b2fe3fb2	5224	Srpenica
00050000-55ca-0146-2664-957f5cb4103a	1242	Stahovica
00050000-55ca-0146-0242-69a757e9d00c	1332	Stara Cerkev
00050000-55ca-0146-8589-22021677f980	8342	Stari trg ob Kolpi
00050000-55ca-0146-391c-d974411c11a7	1386	Stari trg pri Ložu
00050000-55ca-0146-cf83-e35dba06444b	2205	Starše
00050000-55ca-0146-cafb-9be4ff3c89ce	2289	Stoperce
00050000-55ca-0146-10b3-533cc38b513a	8322	Stopiče
00050000-55ca-0146-46d2-3eb50e5c3de3	3206	Stranice
00050000-55ca-0146-3ef3-0369986405e9	8351	Straža
00050000-55ca-0146-a669-2b4bd6abd79a	1313	Struge
00050000-55ca-0146-89dd-bf6835dfa169	8293	Studenec
00050000-55ca-0146-18af-309b4be9cb04	8331	Suhor
00050000-55ca-0146-f4a0-a04b5e004ba1	2233	Sv. Ana v Slovenskih goricah
00050000-55ca-0146-7e4f-979fb48f5224	2235	Sv. Trojica v Slovenskih goricah
00050000-55ca-0146-f3b9-c717cbe2a733	2353	Sveti Duh na Ostrem Vrhu
00050000-55ca-0146-fdd2-d2e87c7bfe51	9244	Sveti Jurij ob Ščavnici
00050000-55ca-0146-4a1b-81355753d969	3264	Sveti Štefan
00050000-55ca-0146-a986-49a3a121ba37	2258	Sveti Tomaž
00050000-55ca-0146-f9f1-7c9f707bdfc6	9204	Šalovci
00050000-55ca-0146-c013-f47ff6b820aa	5261	Šempas
00050000-55ca-0146-5d43-7d7ba91f41a6	5290	Šempeter pri Gorici
00050000-55ca-0146-1019-a1ab37f39ab0	3311	Šempeter v Savinjski dolini
00050000-55ca-0146-388b-a3e9870b5746	4208	Šenčur
00050000-55ca-0146-1fe4-681efdb78b3d	2212	Šentilj v Slovenskih goricah
00050000-55ca-0146-35ca-b03ecc4578d4	8297	Šentjanž
00050000-55ca-0146-1660-3d0d3524282f	2373	Šentjanž pri Dravogradu
00050000-55ca-0146-6bee-0f52aebadd52	8310	Šentjernej
00050000-55ca-0146-f2dd-b4da20e33ea1	3230	Šentjur
00050000-55ca-0146-b3e0-f5480dcecfac	3271	Šentrupert
00050000-55ca-0146-79bf-37f19ba6fd98	8232	Šentrupert
00050000-55ca-0146-b777-47559b65d28e	1296	Šentvid pri Stični
00050000-55ca-0146-17af-6c9a74c80c26	8275	Škocjan
00050000-55ca-0146-1824-21ee8a29a370	6281	Škofije
00050000-55ca-0146-e327-1dbde8d657be	4220	Škofja Loka
00050000-55ca-0146-6c9c-75ba989ccbb4	3211	Škofja vas
00050000-55ca-0146-535b-b24aa8e29619	1291	Škofljica
00050000-55ca-0146-1e7c-ea149c7b1db5	6274	Šmarje
00050000-55ca-0146-5a35-ab5363a993ab	1293	Šmarje - Sap
00050000-55ca-0146-fedd-9784226d111d	3240	Šmarje pri Jelšah
00050000-55ca-0146-2616-df12b8c5bf54	8220	Šmarješke Toplice
00050000-55ca-0146-99e2-71de1074d4ad	2315	Šmartno na Pohorju
00050000-55ca-0146-80f6-27001a58b146	3341	Šmartno ob Dreti
00050000-55ca-0146-0729-b4fe78a0cb94	3327	Šmartno ob Paki
00050000-55ca-0146-f5a7-3d649aec2eb9	1275	Šmartno pri Litiji
00050000-55ca-0146-f838-25483221a1ff	2383	Šmartno pri Slovenj Gradcu
00050000-55ca-0146-6568-b24bfbc9222b	3201	Šmartno v Rožni dolini
00050000-55ca-0146-3ecd-682b72d9d346	3325	Šoštanj
00050000-55ca-0146-f2ad-5a8ce24e8eff	6222	Štanjel
00050000-55ca-0146-d81b-1ec40a4662eb	3220	Štore
00050000-55ca-0146-d0cb-e9170ef7cc46	3304	Tabor
00050000-55ca-0146-7196-7e4626d8f668	3221	Teharje
00050000-55ca-0146-da06-7aeed68c8d5f	9251	Tišina
00050000-55ca-0146-f960-6b00b623c856	5220	Tolmin
00050000-55ca-0146-3b04-dab0c37af129	3326	Topolšica
00050000-55ca-0146-3d51-19c54a687039	2371	Trbonje
00050000-55ca-0146-e92d-e8b6df4c86ce	1420	Trbovlje
00050000-55ca-0146-f45e-f7b4eec8c3f6	8231	Trebelno 
00050000-55ca-0146-7fcb-9ec19dbf16a0	8210	Trebnje
00050000-55ca-0146-e3ff-26151ae3d2f1	5252	Trnovo pri Gorici
00050000-55ca-0146-2db7-fa54b2fff97e	2254	Trnovska vas
00050000-55ca-0146-9212-4e5da624c75c	1222	Trojane
00050000-55ca-0146-1ced-201f30ea5b69	1236	Trzin
00050000-55ca-0146-7ede-e0edbafa5cec	4290	Tržič
00050000-55ca-0146-505e-489db320dcb6	8295	Tržišče
00050000-55ca-0146-aeea-09208ccb2961	1311	Turjak
00050000-55ca-0146-6e1f-276f1d9a657a	9224	Turnišče
00050000-55ca-0146-ed23-afedf4f56eba	8323	Uršna sela
00050000-55ca-0146-580e-e9eff3bf56d3	1252	Vače
00050000-55ca-0146-8a1b-166702869246	3320	Velenje 
00050000-55ca-0146-31b0-f3af3df3b193	3322	Velenje - poštni predali
00050000-55ca-0146-41cf-740c95f30251	8212	Velika Loka
00050000-55ca-0146-7a91-65c8afb72ed2	2274	Velika Nedelja
00050000-55ca-0146-8aeb-b463bcabbf9c	9225	Velika Polana
00050000-55ca-0146-0bb8-4cba69b4c57e	1315	Velike Lašče
00050000-55ca-0146-554e-77d8f455d06d	8213	Veliki Gaber
00050000-55ca-0146-22e2-9fe45fc90294	9241	Veržej
00050000-55ca-0146-60f4-3ba25217f18b	1312	Videm - Dobrepolje
00050000-55ca-0146-ea4b-39d697bd8e05	2284	Videm pri Ptuju
00050000-55ca-0146-dc47-3062b65fb204	8344	Vinica
00050000-55ca-0146-846e-31bbcac25c4b	5271	Vipava
00050000-55ca-0146-d54b-57c21c79ae85	4212	Visoko
00050000-55ca-0146-ec4a-4dc6a5791aad	1294	Višnja Gora
00050000-55ca-0146-e682-a6750d5e9366	3205	Vitanje
00050000-55ca-0146-992e-875b89673caa	2255	Vitomarci
00050000-55ca-0146-334d-9137a810a6fd	1217	Vodice
00050000-55ca-0146-e1ed-505a0182db3a	3212	Vojnik\t
00050000-55ca-0146-2a6a-03638206f564	5293	Volčja Draga
00050000-55ca-0146-5e51-8fd09c1d9278	2232	Voličina
00050000-55ca-0146-227a-c537d60cd600	3305	Vransko
00050000-55ca-0146-04b4-8ca06687ca34	6217	Vremski Britof
00050000-55ca-0146-e3e2-da60f9193ab3	1360	Vrhnika
00050000-55ca-0146-3097-fe17fd92ad56	2365	Vuhred
00050000-55ca-0146-692b-889a6bd38306	2367	Vuzenica
00050000-55ca-0146-c217-e5529a3fa19b	8292	Zabukovje 
00050000-55ca-0146-ab91-46d3eecc7599	1410	Zagorje ob Savi
00050000-55ca-0146-ea77-83e9c9e1375a	1303	Zagradec
00050000-55ca-0146-2cdf-e78054be3086	2283	Zavrč
00050000-55ca-0146-b934-6bc90eed1b7b	8272	Zdole 
00050000-55ca-0146-369a-93e0846527da	4201	Zgornja Besnica
00050000-55ca-0146-51c5-9142d9a1e044	2242	Zgornja Korena
00050000-55ca-0146-0a05-a2f72f312c50	2201	Zgornja Kungota
00050000-55ca-0146-92d5-ca59433d186d	2316	Zgornja Ložnica
00050000-55ca-0146-5568-70278aa98fb6	2314	Zgornja Polskava
00050000-55ca-0146-0f4b-e904925b0c84	2213	Zgornja Velka
00050000-55ca-0146-4823-c2ddfe5a0207	4247	Zgornje Gorje
00050000-55ca-0146-b720-364d737773d8	4206	Zgornje Jezersko
00050000-55ca-0146-e325-fa0e536ebde8	2285	Zgornji Leskovec
00050000-55ca-0146-d503-52c729c38520	1432	Zidani Most
00050000-55ca-0146-b4e9-dd59876c53b7	3214	Zreče
00050000-55ca-0146-407e-3d16987e6e10	4209	Žabnica
00050000-55ca-0146-6ba9-f2abbbf2c69d	3310	Žalec
00050000-55ca-0146-8f4a-95a0e9d65b81	4228	Železniki
00050000-55ca-0146-557d-02bf676d0131	2287	Žetale
00050000-55ca-0146-e163-23fe8d9b01e7	4226	Žiri
00050000-55ca-0146-ec01-b6b032aa834f	4274	Žirovnica
00050000-55ca-0146-048a-bf1355425757	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 12818380)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 12818187)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 12818265)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 12818392)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 12818724)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 12818734)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ca-0148-a48c-f2181306f6f1	00080000-55ca-0148-83e8-af1bea02a678	0900	AK
00190000-55ca-0148-0029-7e56b22620d5	00080000-55ca-0147-7a45-8d6b7f26a703	0987	AK
00190000-55ca-0148-2c6a-f4ee7c63f555	00080000-55ca-0147-b5b7-ebe5ffad0af0	0989	AK
00190000-55ca-0148-6bad-cfba6f076398	00080000-55ca-0147-005b-fe86fb7aada2	0986	AK
00190000-55ca-0148-271f-2f28eddb87e9	00080000-55ca-0147-bcc4-449103273fce	0984	AK
00190000-55ca-0148-a7b5-bac448d72535	00080000-55ca-0147-c729-0b45755935c4	0983	AK
00190000-55ca-0148-93b6-1b86487a0dc4	00080000-55ca-0147-9d2c-9c9c7f629232	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 12818680)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ca-0148-c2ff-936096ba6045	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 12818742)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 12818421)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55ca-0147-6f0d-ee882200e8d2	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55ca-0147-3277-d625cba36a6b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55ca-0147-e523-7af3a7b513a1	0003	Kazinska	t	84	Kazinska dvorana
00220000-55ca-0147-1d8e-eb887dc3cbd9	0004	Mali oder	t	24	Mali oder 
00220000-55ca-0147-4aa9-44c7a76722fb	0005	Komorni oder	t	15	Komorni oder
00220000-55ca-0147-7d48-ef0e1a735f0d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ca-0147-c96f-103de47ce2f6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 12818365)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 12818355)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 12818540)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 12818489)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 12818059)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2921 (class 0 OID 12818431)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 12818097)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ca-0146-971b-b40c38b8d5a9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ca-0146-5e72-f43d23561fe7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ca-0146-1444-29ce6fa61400	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ca-0146-724e-a4999d7227ed	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ca-0146-73dc-de004b2c7b5c	planer	Planer dogodkov v koledarju	t
00020000-55ca-0146-2965-eab89ce80052	kadrovska	Kadrovska služba	t
00020000-55ca-0146-2938-8d0a096974b1	arhivar	Ažuriranje arhivalij	t
00020000-55ca-0146-1af5-e341151038ed	igralec	Igralec	t
00020000-55ca-0146-ce5f-4e81aded035b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ca-0148-4467-72be48a3eab7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 12818081)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ca-0146-9146-647af772f869	00020000-55ca-0146-1444-29ce6fa61400
00010000-55ca-0146-f1f5-20acd16cffd3	00020000-55ca-0146-1444-29ce6fa61400
00010000-55ca-0148-f42b-beb7f06c4916	00020000-55ca-0148-4467-72be48a3eab7
\.


--
-- TOC entry 2923 (class 0 OID 12818445)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 12818386)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 12818332)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 12818783)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ca-0147-abff-dd678f0ce8e0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ca-0147-c887-3cb8bd155d9b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ca-0147-0832-366701e3b78d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ca-0147-bba6-cd8815c72a54	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55ca-0147-a0e6-7210e4090192	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 12818775)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ca-0147-fdad-d2889fb033a0	00230000-55ca-0147-bba6-cd8815c72a54	popa
00240000-55ca-0147-8bfd-477fef600eb3	00230000-55ca-0147-bba6-cd8815c72a54	oseba
00240000-55ca-0147-adc4-a785f46c0df2	00230000-55ca-0147-bba6-cd8815c72a54	sezona
00240000-55ca-0147-d42b-d94e5f1534ea	00230000-55ca-0147-c887-3cb8bd155d9b	prostor
00240000-55ca-0147-a910-a28f4de302f8	00230000-55ca-0147-bba6-cd8815c72a54	besedilo
00240000-55ca-0147-ddbf-0d954eca32f0	00230000-55ca-0147-bba6-cd8815c72a54	uprizoritev
00240000-55ca-0147-f25d-0fb3e9adfc27	00230000-55ca-0147-bba6-cd8815c72a54	funkcija
00240000-55ca-0147-b3f4-861c2c398a07	00230000-55ca-0147-bba6-cd8815c72a54	tipfunkcije
00240000-55ca-0147-3704-49bf2cf43d7d	00230000-55ca-0147-bba6-cd8815c72a54	alternacija
00240000-55ca-0147-fb16-3cf17c98689b	00230000-55ca-0147-abff-dd678f0ce8e0	pogodba
00240000-55ca-0147-3540-6e79653ac089	00230000-55ca-0147-bba6-cd8815c72a54	zaposlitev
00240000-55ca-0147-e045-bed95f0681f1	00230000-55ca-0147-abff-dd678f0ce8e0	programdela
00240000-55ca-0147-d8ef-d1f20272fd60	00230000-55ca-0147-bba6-cd8815c72a54	zapis
\.


--
-- TOC entry 2944 (class 0 OID 12818770)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 12818499)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55ca-0148-e74c-fc5c20a113d9	000e0000-55ca-0148-03f4-c4f56d0a108b	00080000-55ca-0147-1374-5e71c05a4b43	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55ca-0148-bad5-a3eee3fba146	000e0000-55ca-0148-03f4-c4f56d0a108b	00080000-55ca-0147-1374-5e71c05a4b43	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55ca-0148-1f3f-b6f0f06a45ac	000e0000-55ca-0148-03f4-c4f56d0a108b	00080000-55ca-0147-9f76-23586571e61e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55ca-0148-ae73-9666eec17b93	000e0000-55ca-0148-03f4-c4f56d0a108b	00080000-55ca-0147-9f76-23586571e61e	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 12818159)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 12818342)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ca-0148-8038-a19a313602e9	00180000-55ca-0148-7f7d-488fb66125a0	000c0000-55ca-0148-1b02-1f912f431678	00090000-55ca-0148-90e1-21a930d35a59	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ca-0148-f2cb-5abc0bb8c182	00180000-55ca-0148-7f7d-488fb66125a0	000c0000-55ca-0148-dbb8-a1fac674b7f4	00090000-55ca-0148-1770-760e677ec160	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ca-0148-5bb9-0692a901e57e	00180000-55ca-0148-7f7d-488fb66125a0	000c0000-55ca-0148-b2ab-bc019508446f	00090000-55ca-0148-95db-15b7fe287cf5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ca-0148-b05e-1880ba9e585d	00180000-55ca-0148-7f7d-488fb66125a0	000c0000-55ca-0148-39dc-181085452e1d	00090000-55ca-0148-7113-75d67ace6f49	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ca-0148-5164-d27b1bee1e7f	00180000-55ca-0148-7f7d-488fb66125a0	000c0000-55ca-0148-411f-22c8efe3b8f9	00090000-55ca-0148-5e37-8dd3f13f5275	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ca-0148-0fb3-04d1b764170f	00180000-55ca-0148-7553-428e0f7d4a9b	\N	00090000-55ca-0148-5e37-8dd3f13f5275	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 12818529)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ca-0147-72e3-6cb289cd4ecd	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ca-0147-0670-b83989f43a73	Priredba	Priredba	Priredba	umetnik
000f0000-55ca-0147-f9d4-bffb595e89c4	Prevod	Prevod	Prevod	umetnik
000f0000-55ca-0147-cc92-9cc9e235a0cc	Režija	Režija	Režija	umetnik
000f0000-55ca-0147-ca47-5bed7463de1b	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ca-0147-0d6d-4bf2a0bcd65a	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55ca-0147-c47b-606bf2e3bb61	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55ca-0147-77f3-38b00ca196e6	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ca-0147-6b1b-0384650b77de	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55ca-0147-3af5-c8f0ba0f6f93	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55ca-0147-cd5a-5254240382d4	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ca-0147-d3f3-4bb582e3ed77	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ca-0147-4001-1fa655ebd684	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55ca-0147-9a22-1903b5b893b3	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55ca-0147-e02d-5ace4e7e872c	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ca-0147-9caa-49e3bd384c0e	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ca-0147-e70c-304ccce25dc4	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ca-0147-f1e3-740f032c16b0	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 12818752)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ca-0147-29da-51b7ee5b8250	01	Velika predstava	f	1.00	1.00
002b0000-55ca-0147-abcc-84a09dcb27d0	02	Mala predstava	f	0.50	0.50
002b0000-55ca-0147-921e-b7dd7dde6b54	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ca-0147-eb29-21e852cdb2ad	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ca-0147-c9a1-7f363596e8c7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 12818222)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 12818068)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ca-0146-f1f5-20acd16cffd3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROQHVmnZrgdyfpTKl4kyinb8dYzlKdRDK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ca-0148-60b0-3998e447bc62	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ca-0148-e063-0c38f3a513be	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ca-0148-9dad-db5fab735da6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ca-0148-26e1-cbf8477a0258	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ca-0148-cc9e-884b24166b8e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ca-0148-b6df-0cabebb3c8a8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ca-0148-aded-6db1174e58b1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ca-0148-d87d-f455446795a7	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ca-0148-94c4-97c2b6c28f48	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ca-0148-f42b-beb7f06c4916	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ca-0146-9146-647af772f869	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 12818577)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ca-0148-9589-8087e2fc4e08	00160000-55ca-0147-fc33-928b3593e091	00150000-55ca-0147-917a-d58a6bad8360	00140000-55ca-0146-bda3-bb9a8e065f37	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55ca-0147-4aa9-44c7a76722fb
000e0000-55ca-0148-03f4-c4f56d0a108b	00160000-55ca-0147-cab4-addd48942483	00150000-55ca-0147-ded0-f38bfc734df5	00140000-55ca-0146-0dfe-7080dab73ae3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55ca-0147-7d48-ef0e1a735f0d
000e0000-55ca-0148-3667-0ece6c94b7ec	\N	00150000-55ca-0147-ded0-f38bfc734df5	00140000-55ca-0146-0dfe-7080dab73ae3	00190000-55ca-0148-0029-7e56b22620d5	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55ca-0147-4aa9-44c7a76722fb
000e0000-55ca-0148-3747-47f690267496	\N	00150000-55ca-0147-ded0-f38bfc734df5	00140000-55ca-0146-0dfe-7080dab73ae3	00190000-55ca-0148-0029-7e56b22620d5	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55ca-0147-4aa9-44c7a76722fb
000e0000-55ca-0148-579d-3d96b9bedc08	\N	00150000-55ca-0147-ded0-f38bfc734df5	00140000-55ca-0146-0dfe-7080dab73ae3	00190000-55ca-0148-0029-7e56b22620d5	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55ca-0147-6f0d-ee882200e8d2
\.


--
-- TOC entry 2904 (class 0 OID 12818284)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55ca-0148-6f08-eb84f809de6b	000e0000-55ca-0148-03f4-c4f56d0a108b	1	
00200000-55ca-0148-6a04-4216dfa7afc7	000e0000-55ca-0148-03f4-c4f56d0a108b	2	
\.


--
-- TOC entry 2919 (class 0 OID 12818413)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 12818822)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 12818794)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 12818834)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 12818482)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ca-0148-636b-26c8f7482a2e	00090000-55ca-0148-1770-760e677ec160	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ca-0148-8ef1-7a1c2a0ca494	00090000-55ca-0148-95db-15b7fe287cf5	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ca-0148-07b2-aa8c0fd74485	00090000-55ca-0148-7d38-3d4180af6314	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ca-0148-c55f-5a6728163c9c	00090000-55ca-0148-abce-167a11d45be0	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ca-0148-de74-e109b508ec7b	00090000-55ca-0148-90e1-21a930d35a59	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ca-0148-458b-136a9fa567c7	00090000-55ca-0148-2974-036e09960c25	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 12818316)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 12818567)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ca-0146-bda3-bb9a8e065f37	01	Drama	drama (SURS 01)
00140000-55ca-0146-e7fe-0e1ce7275217	02	Opera	opera (SURS 02)
00140000-55ca-0146-be3d-dd61368e0eb9	03	Balet	balet (SURS 03)
00140000-55ca-0146-d90a-c6be93021109	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ca-0146-7bb4-381e6806dfe5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ca-0146-0dfe-7080dab73ae3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ca-0146-6d01-eeb2950871e8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 12818472)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55ca-0147-25eb-af35d38b8a10	01	Opera	opera
00150000-55ca-0147-52f2-2b8c166a9612	02	Opereta	opereta
00150000-55ca-0147-e013-11c163717dcc	03	Balet	balet
00150000-55ca-0147-f07e-20af5660906a	04	Plesne prireditve	plesne prireditve
00150000-55ca-0147-5ab9-b59bfdc78b05	05	Lutkovno gledališče	lutkovno gledališče
00150000-55ca-0147-08f4-25d9a7031012	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55ca-0147-2640-0e03d0fe39d5	07	Biografska drama	biografska drama
00150000-55ca-0147-917a-d58a6bad8360	08	Komedija	komedija
00150000-55ca-0147-f4d7-a3397194cf80	09	Črna komedija	črna komedija
00150000-55ca-0147-8149-521b8e6ebcef	10	E-igra	E-igra
00150000-55ca-0147-ded0-f38bfc734df5	11	Kriminalka	kriminalka
00150000-55ca-0147-9b20-84b7563694b6	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 12818122)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 12818624)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12818614)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 12818528)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 12818875)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 12818306)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 12818331)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 12818768)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 12818248)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12818673)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 12818468)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 12818282)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 12818325)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 12818262)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 12818378)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 12818851)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12818858)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 12818883)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12818405)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 12818220)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 12818131)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 12818155)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 12818111)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 12818096)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 12818411)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 12818444)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 12818562)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 12818184)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 12818208)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 12818384)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 12818198)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 12818269)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 12818396)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12818731)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 12818739)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 12818722)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 12818750)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 12818428)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 12818369)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 12818360)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12818550)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 12818496)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 12818067)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 12818435)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 12818085)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 12818105)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12818453)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12818391)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 12818340)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12818792)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12818780)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12818774)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 12818509)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 12818164)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 12818351)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12818539)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 12818762)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 12818233)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 12818080)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12818593)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 12818291)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 12818419)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 12818832)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 12818816)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12818840)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 12818487)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 12818320)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 12818575)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12818480)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 12818313)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 12818510)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 12818511)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 12818853)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 12818852)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 12818186)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 12818412)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 12818820)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 12818819)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 12818821)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 12818818)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 12818817)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 12818398)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 12818397)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 12818292)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 12818469)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 12818471)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 12818470)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 12818264)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 12818263)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 12818751)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 12818564)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 12818565)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 12818566)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 12818841)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 12818598)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 12818595)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 12818599)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 12818597)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 12818596)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 12818235)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 12818234)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 12818158)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 12818436)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 12818326)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 12818112)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 12818113)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 12818456)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 12818455)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 12818454)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 12818270)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 12818272)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 12818271)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 12818782)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 12818364)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 12818362)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 12818361)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 12818363)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 12818086)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 12818087)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 12818420)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 12818876)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 12818884)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 12818885)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 12818385)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 12818497)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 12818498)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 12818679)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 12818677)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 12818674)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 12818675)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 12818676)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 12818200)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 12818199)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 12818201)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 12818732)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 12818733)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 12818628)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 12818629)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 12818626)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 12818627)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 12818488)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 12818373)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 12818372)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 12818370)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 12818371)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12818616)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 12818615)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 12818723)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 12818283)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 12818769)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 12818859)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 12818860)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 12818133)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 12818132)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 12818165)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 12818166)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 12818354)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 12818353)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 12818352)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 12818315)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 12818311)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 12818308)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 12818309)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 12818307)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 12818312)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 12818310)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 12818185)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 12818249)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 12818251)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 12818250)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 12818252)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 12818379)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 12818563)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 12818594)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 12818156)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 12818157)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 12818481)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 12818793)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 12818221)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 12818781)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 12818430)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 12818429)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 12818625)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 12818209)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 12818576)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 12818833)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 12818740)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 12818741)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 12818341)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 12818106)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 12818314)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2703 (class 2606 OID 12819021)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2706 (class 2606 OID 12819006)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2705 (class 2606 OID 12819011)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2701 (class 2606 OID 12819031)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2707 (class 2606 OID 12819001)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2702 (class 2606 OID 12819026)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 12819016)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 12819176)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 12819181)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 12819351)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2771 (class 2606 OID 12819346)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 12818936)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 12819116)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 12819331)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 12819326)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2764 (class 2606 OID 12819336)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 12819321)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2768 (class 2606 OID 12819316)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 12819111)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2723 (class 2606 OID 12819106)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 12818996)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 12819146)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 12819156)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 12819151)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 12818971)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 12818966)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 12819096)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 12819301)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2740 (class 2606 OID 12819186)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 12819191)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 12819196)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 12819341)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2742 (class 2606 OID 12819216)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2745 (class 2606 OID 12819201)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2741 (class 2606 OID 12819221)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 12819211)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2744 (class 2606 OID 12819206)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 12818961)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 12818956)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 12818921)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2685 (class 2606 OID 12818916)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 12819126)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 12819036)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 12818896)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 12818901)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2727 (class 2606 OID 12819141)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 12819136)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2729 (class 2606 OID 12819131)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2698 (class 2606 OID 12818976)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 12818986)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 12818981)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 12819311)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2712 (class 2606 OID 12819071)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2714 (class 2606 OID 12819061)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2715 (class 2606 OID 12819056)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 12819066)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 12818886)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 12818891)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 12819121)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 12819366)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 12819371)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 12819376)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 12819101)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2735 (class 2606 OID 12819166)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 12819171)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 12819276)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 12819271)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2756 (class 2606 OID 12819256)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 12819261)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 12819266)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 12818946)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 12818941)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 12818951)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 12819286)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 12819291)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 12819246)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 12819251)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2751 (class 2606 OID 12819236)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2750 (class 2606 OID 12819241)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 12819161)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 12819091)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 12819086)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2719 (class 2606 OID 12819076)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2718 (class 2606 OID 12819081)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 12819231)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 12819226)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 12819281)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 12818991)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 12819296)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 12819306)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 12819356)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 12819361)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 12818911)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 12818906)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2687 (class 2606 OID 12818926)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 12818931)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 12819051)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 12819046)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 12819041)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-11 16:06:01 CEST

--
-- PostgreSQL database dump complete
--

