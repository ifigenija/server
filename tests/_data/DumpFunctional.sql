--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-02 16:43:38 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 253 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 30683995)
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
-- TOC entry 237 (class 1259 OID 30684609)
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
-- TOC entry 236 (class 1259 OID 30684592)
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
-- TOC entry 182 (class 1259 OID 30683988)
-- Name: authstorage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authstorage (
    id integer NOT NULL,
    sessionid character varying(100) NOT NULL,
    upor uuid NOT NULL,
    datum timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 30683986)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 30684469)
-- Name: avtorbesedila; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE avtorbesedila (
    id uuid NOT NULL,
    besedilo_id uuid,
    oseba_id uuid,
    tipavtorja character varying(255) NOT NULL,
    zaporedna integer,
    alivnaslovu boolean
);


--
-- TOC entry 230 (class 1259 OID 30684499)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 251 (class 1259 OID 30684902)
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
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 203 (class 1259 OID 30684243)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
    tehnicni_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 30684275)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30684280)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30684824)
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
-- TOC entry 194 (class 1259 OID 30684140)
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
-- TOC entry 238 (class 1259 OID 30684622)
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer DEFAULT 0,
    sthonorarnihzunsamoz integer DEFAULT 0,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskkoprgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskkoprzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprzamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovigost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprgost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    prikoproducentu boolean,
    prizorisce character varying(255) DEFAULT NULL::character varying,
    trajanje character varying(255) DEFAULT NULL::character varying,
    zvrst character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    reziser character varying(255) DEFAULT NULL::character varying,
    datum date,
    soustvarjalci character varying(255) DEFAULT NULL::character varying,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    stdogodkov integer DEFAULT 0,
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
-- TOC entry 223 (class 1259 OID 30684423)
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
-- TOC entry 200 (class 1259 OID 30684214)
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
-- TOC entry 197 (class 1259 OID 30684180)
-- Name: job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job (
    id uuid NOT NULL,
    user_id uuid,
    name character varying(50) NOT NULL,
    task character varying(50) NOT NULL,
    status integer NOT NULL,
    log text,
    datum timestamp(0) without time zone NOT NULL,
    casizvedbe timestamp(0) without time zone NOT NULL,
    izveden timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    data text,
    alert boolean,
    hidden boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 30684157)
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
-- TOC entry 212 (class 1259 OID 30684337)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30684882)
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
    javnidostop character varying(20) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 250 (class 1259 OID 30684895)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30684917)
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
-- TOC entry 170 (class 1259 OID 25231831)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 30684362)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30684114)
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
-- TOC entry 185 (class 1259 OID 30684014)
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
-- TOC entry 189 (class 1259 OID 30684081)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 186 (class 1259 OID 30684025)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    srednjeime character varying(255) DEFAULT NULL::character varying,
    polnoime character varying(255) DEFAULT NULL::character varying,
    psevdonim character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    twitter character varying(255) DEFAULT NULL::character varying,
    skype character varying(255) DEFAULT NULL::character varying,
    fb character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 178 (class 1259 OID 30683960)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30683979)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30684369)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30684403)
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
-- TOC entry 233 (class 1259 OID 30684540)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(255) NOT NULL,
    zacetek date,
    konec date,
    jeavtorskepravice boolean,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    procentodinkasa numeric(12,2) DEFAULT NULL::numeric,
    jeprocentodinkasa boolean,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 188 (class 1259 OID 30684061)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
    drzava_id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
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
-- TOC entry 191 (class 1259 OID 30684106)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30684768)
-- Name: postavkacdve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkacdve (
    id uuid NOT NULL,
    skupina character varying(2) NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrpremiere numeric(15,2) DEFAULT NULL::numeric,
    vrponovitvepremier numeric(15,2) DEFAULT NULL::numeric,
    vrponovitveprejsnjih numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjazamejstvo numeric(15,2) DEFAULT NULL::numeric,
    vrfestivali numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjaint numeric(15,2) DEFAULT NULL::numeric,
    vrostalo numeric(15,2) DEFAULT NULL::numeric,
    programdela_id uuid
);


--
-- TOC entry 213 (class 1259 OID 30684343)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30684091)
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
-- TOC entry 202 (class 1259 OID 30684235)
-- Name: praznik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE praznik (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    dan character varying(255) NOT NULL,
    mesec integer NOT NULL,
    leto integer,
    delaprost boolean NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 30684195)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 199 (class 1259 OID 30684207)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30684355)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30684782)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 242 (class 1259 OID 30684792)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30684691)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    zakljuceno boolean NOT NULL,
    potrjenprogram boolean NOT NULL,
    stpremier integer,
    stpremiervelikih integer DEFAULT 0,
    stpremiermalih integer DEFAULT 0,
    stpremiermalihkopr integer DEFAULT 0,
    stpremiervelikihkopr integer DEFAULT 0,
    stpremiersredkopr integer DEFAULT 0,
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
    stizvnekomerc numeric(15,2) DEFAULT 0::numeric,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem numeric(15,2) DEFAULT 0::numeric,
    stizvponpremdoma integer,
    stizvponpremzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjslo numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjzam numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    stobiskprem integer,
    stobiskpremdoma integer,
    stobiskpremkopr integer,
    stobiskponprem integer,
    stobiskponpremdoma integer,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremzamejo integer,
    stobiskponpremint integer,
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
    sredstvavlozekgostiteljaprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljagostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljafest numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljarazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnagostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnafest numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnarazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 243 (class 1259 OID 30684800)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    stdogodkov integer DEFAULT 1 NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 219 (class 1259 OID 30684384)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    jematicnioder boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 30684328)
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
-- TOC entry 210 (class 1259 OID 30684318)
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
-- TOC entry 232 (class 1259 OID 30684529)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30684459)
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
-- TOC entry 196 (class 1259 OID 30684169)
-- Name: report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE report (
    id uuid NOT NULL,
    job_id uuid,
    title character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 175 (class 1259 OID 30683931)
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
-- TOC entry 174 (class 1259 OID 30683929)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 30684397)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30683969)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30683953)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30684411)
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
-- TOC entry 214 (class 1259 OID 30684349)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30684295)
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
-- TOC entry 173 (class 1259 OID 30683918)
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
-- TOC entry 172 (class 1259 OID 30683910)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30683905)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30684476)
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
    sort integer,
    vrstastroska_id uuid
);


--
-- TOC entry 187 (class 1259 OID 30684053)
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
-- TOC entry 209 (class 1259 OID 30684305)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 231 (class 1259 OID 30684517)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    sort integer
);


--
-- TOC entry 184 (class 1259 OID 30684004)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30684812)
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
-- TOC entry 207 (class 1259 OID 30684285)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30684126)
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
-- TOC entry 176 (class 1259 OID 30683940)
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
-- TOC entry 235 (class 1259 OID 30684567)
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
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
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
    krstna boolean,
    prvaslovenska boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    jekoprodukcija boolean,
    maticnioder_id uuid
);


--
-- TOC entry 201 (class 1259 OID 30684225)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 218 (class 1259 OID 30684376)
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
-- TOC entry 229 (class 1259 OID 30684490)
-- Name: vrstastroska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstastroska (
    id uuid NOT NULL,
    skupina integer NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 247 (class 1259 OID 30684862)
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
-- TOC entry 246 (class 1259 OID 30684831)
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
    contributor character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    format character varying(255) DEFAULT NULL::character varying,
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 248 (class 1259 OID 30684874)
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
-- TOC entry 225 (class 1259 OID 30684448)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(10) NOT NULL,
    delovnomesto character varying(255) NOT NULL,
    zacetek date,
    konec date,
    tip integer,
    delovnaobveza integer,
    malica character varying(255) DEFAULT NULL::character varying,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 204 (class 1259 OID 30684269)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30684557)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30684438)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30683991)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30683934)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30683995)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-565f-11a6-8a76-54d26cba8e87	10	30	Otroci	Abonma za otroke	200
000a0000-565f-11a6-bcea-9ec900592efc	20	60	Mladina	Abonma za mladino	400
000a0000-565f-11a6-57ae-d7004dda8ca0	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30684609)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-565f-11a7-0360-652a915575ef	000d0000-565f-11a6-476b-577cdb4fa260	\N	00090000-565f-11a6-e89c-677ad5e6d68a	000b0000-565f-11a6-a5fd-2e41e2d8509f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-565f-11a7-8a99-f1ed74609d2d	000d0000-565f-11a6-f4d9-dc752c6fb333	00100000-565f-11a6-161f-d51e4551ae12	00090000-565f-11a6-daaf-f0a325a93b3b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-565f-11a7-ba91-91c9ca00cb24	000d0000-565f-11a6-941b-8fff15b96451	00100000-565f-11a6-f1ea-59c8e370d6e0	00090000-565f-11a6-0e55-239206ffa52c	\N	0003	t	\N	2015-12-02	\N	2	t	\N	f	f
000c0000-565f-11a7-a4a3-9cdd55440b40	000d0000-565f-11a6-e2d2-ed9e5767222c	\N	00090000-565f-11a6-4e7c-73dc1992e184	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-565f-11a7-b73d-c755203f46a0	000d0000-565f-11a6-c51c-8fa526b47537	\N	00090000-565f-11a6-f736-390908a3548d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-565f-11a7-876d-b6f14f9c728e	000d0000-565f-11a6-446c-7b2b56f37081	\N	00090000-565f-11a6-ca14-0d00dcf12d51	000b0000-565f-11a6-69bb-db6af2b51ada	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-565f-11a7-e57a-4af8b0ebe2d0	000d0000-565f-11a6-e87a-6a39a3b797a5	00100000-565f-11a6-5885-ddd13a95b21c	00090000-565f-11a6-925c-79e6f6f906ac	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-565f-11a7-459d-d23643c00342	000d0000-565f-11a6-54ab-54865dfce5bd	\N	00090000-565f-11a6-ac51-3c59fb2c08f2	000b0000-565f-11a6-d019-1652244da957	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-565f-11a7-3818-6013c463c777	000d0000-565f-11a6-e87a-6a39a3b797a5	00100000-565f-11a6-7005-40ff07d92b68	00090000-565f-11a6-e48f-a5aca43f9d0a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-565f-11a7-cbe9-1cc07c09d81b	000d0000-565f-11a6-e87a-6a39a3b797a5	00100000-565f-11a6-14ae-d58a2f707ac7	00090000-565f-11a6-a2ab-dc3af1e46bc0	\N	0010	t	\N	2015-12-02	\N	16	f	\N	f	t
000c0000-565f-11a7-8077-6eeee3516f46	000d0000-565f-11a6-e87a-6a39a3b797a5	00100000-565f-11a6-3a6b-22f78749d21e	00090000-565f-11a6-7cdd-ca364ba519e9	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-565f-11a7-94e2-edce918cb6a0	000d0000-565f-11a6-f5f9-25be227c2ebd	00100000-565f-11a6-161f-d51e4551ae12	00090000-565f-11a6-daaf-f0a325a93b3b	000b0000-565f-11a6-08d5-1e069a822c97	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30684592)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30683988)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 30684469)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-565f-11a6-c3a6-ca40cd5f9779	00160000-565f-11a6-8fab-462bf9e77299	00090000-565f-11a6-20bf-57c595330d89	aizv	10	t
003d0000-565f-11a6-34fe-58d5681084dc	00160000-565f-11a6-8fab-462bf9e77299	00090000-565f-11a6-b69c-18f84b630ff8	apri	14	t
003d0000-565f-11a6-034e-10ba1a0ccad1	00160000-565f-11a6-1b49-ffacebf9d9c5	00090000-565f-11a6-874f-3af33e7896cf	aizv	11	t
003d0000-565f-11a6-39f9-70eb6ec67e75	00160000-565f-11a6-8471-6a0d1ef08877	00090000-565f-11a6-8c21-7a1cd8a12602	aizv	12	t
003d0000-565f-11a6-ad88-045ba1c6f32b	00160000-565f-11a6-8fab-462bf9e77299	00090000-565f-11a6-d72f-edce6d47f507	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30684499)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-565f-11a6-8fab-462bf9e77299	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-565f-11a6-1b49-ffacebf9d9c5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-565f-11a6-8471-6a0d1ef08877	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30684902)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30684243)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-565f-11a6-9550-0127e971380e	\N	\N	00200000-565f-11a6-27e1-8101740a44e7	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-565f-11a6-3501-ec332ec691e9	\N	\N	00200000-565f-11a6-68a6-90a0d8f0cd0d	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-565f-11a6-3f26-b7f2a1ce28ce	\N	\N	00200000-565f-11a6-d620-833282b9ed31	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-565f-11a6-f6af-9b6fdfb00c10	\N	\N	00200000-565f-11a6-eda6-eb5c028baaff	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-565f-11a6-3b61-041416e913d1	\N	\N	00200000-565f-11a6-d083-6c646bb24c00	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30684275)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30684280)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30684824)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30684140)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-565f-11a4-eaa2-1563d3370a6e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-565f-11a4-7c42-943229f8205e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-565f-11a4-a734-bb852a874e93	AL	ALB	008	Albania 	Albanija	\N
00040000-565f-11a4-9224-d1075c54d23a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-565f-11a4-9bbd-6310c4da6fc3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-565f-11a4-14c8-d566fa11ee24	AD	AND	020	Andorra 	Andora	\N
00040000-565f-11a4-7cce-f2a122ab2f50	AO	AGO	024	Angola 	Angola	\N
00040000-565f-11a4-bada-95467584de31	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-565f-11a4-83f3-94354a80ea03	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-565f-11a4-e4c2-7b7ff3fe62cc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-565f-11a4-4e2d-43011678cd26	AR	ARG	032	Argentina 	Argenitna	\N
00040000-565f-11a4-6fd4-85cff1669749	AM	ARM	051	Armenia 	Armenija	\N
00040000-565f-11a4-43f4-aa0788e07c91	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-565f-11a4-84ca-7f591d4b8782	AU	AUS	036	Australia 	Avstralija	\N
00040000-565f-11a4-4d17-6a776df4b48d	AT	AUT	040	Austria 	Avstrija	\N
00040000-565f-11a4-259e-f19dafdfc526	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-565f-11a4-d4a4-111b0d6e5d34	BS	BHS	044	Bahamas 	Bahami	\N
00040000-565f-11a4-555d-bd92a0199d69	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-565f-11a4-51f5-041bd2f19d88	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-565f-11a4-8ac9-5654d87b6940	BB	BRB	052	Barbados 	Barbados	\N
00040000-565f-11a4-b2f0-d2612a8e3e1d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-565f-11a4-b435-f5b31ea953df	BE	BEL	056	Belgium 	Belgija	\N
00040000-565f-11a4-b6b3-2e3b65a8aa99	BZ	BLZ	084	Belize 	Belize	\N
00040000-565f-11a4-c4a0-546c9319a5bc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-565f-11a4-3173-b40ce4ab7f68	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-565f-11a4-3ce2-1ceb67893965	BT	BTN	064	Bhutan 	Butan	\N
00040000-565f-11a4-10f6-fec2b8ee0b45	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-565f-11a4-e25c-5cbd722f47d2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-565f-11a4-aa0b-fe75a4f0a0ba	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-565f-11a4-906b-eea2b6ee1693	BW	BWA	072	Botswana 	Bocvana	\N
00040000-565f-11a4-39b1-43beaa0c755f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-565f-11a4-141d-912b0858426c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-565f-11a4-2868-68bb8c4c322b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-565f-11a4-6e29-2255a3a71204	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-565f-11a4-b189-0ae64fce4911	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-565f-11a4-37ee-0fbb4f5e2d73	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-565f-11a4-0d52-92f70edde7e4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-565f-11a4-6310-5000417674a1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-565f-11a4-d793-6a4a7214e12a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-565f-11a4-8bea-290eceee4508	CA	CAN	124	Canada 	Kanada	\N
00040000-565f-11a4-00cb-b0424ac57df1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-565f-11a4-10d2-10696d245803	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-565f-11a4-de8e-a74bfbba0c98	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-565f-11a4-c4f5-2500fd9907aa	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-565f-11a4-10e7-8fe885168f62	CL	CHL	152	Chile 	Čile	\N
00040000-565f-11a4-47a8-422499c0e5ae	CN	CHN	156	China 	Kitajska	\N
00040000-565f-11a4-68a2-08e889bfc0f5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-565f-11a4-9173-a22484b92653	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-565f-11a4-ec7d-7feeffe87331	CO	COL	170	Colombia 	Kolumbija	\N
00040000-565f-11a4-5934-726a7cf8cacb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-565f-11a4-0ee1-315c29b40317	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-565f-11a4-1f20-b038d7331c63	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-565f-11a4-160e-81a89fcbe3b3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-565f-11a4-dabb-f9b80745701f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-565f-11a4-a741-d7ae657262fe	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-565f-11a4-b378-25294ff556c5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-565f-11a4-ba5c-b0ccbbe54783	CU	CUB	192	Cuba 	Kuba	\N
00040000-565f-11a4-8017-b0efc67f3034	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-565f-11a4-29ed-a38784924e39	CY	CYP	196	Cyprus 	Ciper	\N
00040000-565f-11a4-5893-c4b59854b943	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-565f-11a4-cb72-fe993c4fee8e	DK	DNK	208	Denmark 	Danska	\N
00040000-565f-11a4-fd2a-58daa0d1edfb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-565f-11a4-67f4-6284fd0dfc51	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-565f-11a4-b0c7-10b342ec7f47	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-565f-11a4-be68-651b3b45c231	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-565f-11a4-a01a-1459f38e6947	EG	EGY	818	Egypt 	Egipt	\N
00040000-565f-11a4-2605-57cfee6bf23f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-565f-11a4-99db-464ed2229a08	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-565f-11a4-c82b-4e7f9194d440	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-565f-11a4-b0b3-b4c248a41d82	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-565f-11a4-4741-6341e23c95c8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-565f-11a4-346e-c3a668d568c6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-565f-11a4-25d7-59269a744b2d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-565f-11a4-ad55-1581666600cb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-565f-11a4-d1d9-bfa7b894a6ee	FI	FIN	246	Finland 	Finska	\N
00040000-565f-11a4-c04b-2c229872bfda	FR	FRA	250	France 	Francija	\N
00040000-565f-11a4-f4b5-0d54f4f5bfa4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-565f-11a4-4c33-2452fdbe9837	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-565f-11a4-76f9-e7641a044590	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-565f-11a4-b83e-c98b9c71ef49	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-565f-11a4-dd85-125899339664	GA	GAB	266	Gabon 	Gabon	\N
00040000-565f-11a4-76d9-59524e6f8745	GM	GMB	270	Gambia 	Gambija	\N
00040000-565f-11a4-135b-94c644e47809	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-565f-11a4-342f-f7edc5f43cdc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-565f-11a4-86ff-01583df291ef	GH	GHA	288	Ghana 	Gana	\N
00040000-565f-11a4-d977-6d09dceb57f0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-565f-11a4-cded-e07eda949df1	GR	GRC	300	Greece 	Grčija	\N
00040000-565f-11a4-f4a5-dafc3ef0f89a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-565f-11a4-f490-e518b8ca9aa7	GD	GRD	308	Grenada 	Grenada	\N
00040000-565f-11a4-cbdb-c0a8b4ed124f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-565f-11a4-19ff-6b8b5de62bff	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-565f-11a4-17ce-693bb5ad4d29	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-565f-11a4-9a69-c8fe3bd9dac4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-565f-11a4-4364-476f87072b2f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-565f-11a4-d965-236dbf8e4459	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-565f-11a4-d745-f38d4c017673	GY	GUY	328	Guyana 	Gvajana	\N
00040000-565f-11a4-2aed-de760f2fa750	HT	HTI	332	Haiti 	Haiti	\N
00040000-565f-11a4-ca41-dbabaf4b16ee	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-565f-11a4-1d41-fb23551263df	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-565f-11a4-6eba-4b390031f8a7	HN	HND	340	Honduras 	Honduras	\N
00040000-565f-11a4-6ba7-a5bd5b2d705b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-565f-11a4-9ef7-8e9814b049bf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-565f-11a4-d26a-b1d5a94bfa1d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-565f-11a4-8c3f-5488b32247ba	IN	IND	356	India 	Indija	\N
00040000-565f-11a4-3856-36a7fe00b5ce	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-565f-11a4-df0a-71bde532df25	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-565f-11a4-f7be-77fc1f217169	IQ	IRQ	368	Iraq 	Irak	\N
00040000-565f-11a4-95f9-ff22f323ac54	IE	IRL	372	Ireland 	Irska	\N
00040000-565f-11a4-f865-f320b4bf879d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-565f-11a4-f54e-3cc1b30967a6	IL	ISR	376	Israel 	Izrael	\N
00040000-565f-11a4-9422-705cb3088e84	IT	ITA	380	Italy 	Italija	\N
00040000-565f-11a4-d17f-716e546e69a1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-565f-11a4-328c-e933d0bd0802	JP	JPN	392	Japan 	Japonska	\N
00040000-565f-11a4-0ac7-ef5ae16349c2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-565f-11a4-65b6-a6e8c089ac84	JO	JOR	400	Jordan 	Jordanija	\N
00040000-565f-11a4-908e-f69f3ab0677d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-565f-11a4-1aa9-935ccdd62c33	KE	KEN	404	Kenya 	Kenija	\N
00040000-565f-11a4-fa61-ec8862874226	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-565f-11a4-b44a-738a04913fa7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-565f-11a4-9e7e-f67fbf9b092c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-565f-11a4-fc53-f40c54150037	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-565f-11a4-8e68-3e61b470e5f5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-565f-11a4-1347-ad54ec34be2c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-565f-11a4-c64f-a87f7aa59f76	LV	LVA	428	Latvia 	Latvija	\N
00040000-565f-11a4-75e7-30e2934a3a57	LB	LBN	422	Lebanon 	Libanon	\N
00040000-565f-11a4-b408-b19d4f93ae65	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-565f-11a4-bf20-4d1892f9ef14	LR	LBR	430	Liberia 	Liberija	\N
00040000-565f-11a4-9a21-185c460bf599	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-565f-11a4-d553-5eec2ea81a63	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-565f-11a4-d39c-d36b51b061f0	LT	LTU	440	Lithuania 	Litva	\N
00040000-565f-11a4-4ceb-1ba7ae79e4ae	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-565f-11a4-cee0-be5631318b16	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-565f-11a4-ca12-4b97949cd997	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-565f-11a4-1123-bbe0152d9352	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-565f-11a4-d4c6-2f617b6dc5dd	MW	MWI	454	Malawi 	Malavi	\N
00040000-565f-11a4-bb35-bb9932b70177	MY	MYS	458	Malaysia 	Malezija	\N
00040000-565f-11a4-49d7-cd138bde3103	MV	MDV	462	Maldives 	Maldivi	\N
00040000-565f-11a4-3c4a-2fc309173475	ML	MLI	466	Mali 	Mali	\N
00040000-565f-11a4-0d0a-87b52d0e2708	MT	MLT	470	Malta 	Malta	\N
00040000-565f-11a4-bf92-1fa2bcc0188d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-565f-11a4-fecf-def4295b6908	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-565f-11a4-d382-53de2668767f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-565f-11a4-ea0f-3bc79c7f4b95	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-565f-11a4-9e44-1e5032a0b95a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-565f-11a4-6f13-cc425a530776	MX	MEX	484	Mexico 	Mehika	\N
00040000-565f-11a4-9c68-2b20dcb83dd6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-565f-11a4-97a7-fee50361886c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-565f-11a4-60ba-f48cd5e91fcf	MC	MCO	492	Monaco 	Monako	\N
00040000-565f-11a4-c616-3966339bbbf0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-565f-11a4-27bc-8a7f0c858df1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-565f-11a4-8959-f8e6882f0ab2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-565f-11a4-582d-63f2f8a7a84e	MA	MAR	504	Morocco 	Maroko	\N
00040000-565f-11a4-00cf-626332ec85bf	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-565f-11a4-eea1-24a67c39b140	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-565f-11a4-bef0-578fcc9c7157	NA	NAM	516	Namibia 	Namibija	\N
00040000-565f-11a4-b33d-b9bd8bc5c475	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-565f-11a4-f004-f3d06bff4b89	NP	NPL	524	Nepal 	Nepal	\N
00040000-565f-11a4-b2be-92e59ada2914	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-565f-11a4-5c75-7ad3624aa9b3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-565f-11a4-a200-a0555c50868b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-565f-11a4-7d01-3fddf57a4e07	NE	NER	562	Niger 	Niger 	\N
00040000-565f-11a4-8281-798198af72d9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-565f-11a4-b7d0-b93711ba144b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-565f-11a4-9646-9a5419310f9f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-565f-11a4-c217-6069c5310966	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-565f-11a4-69c9-d0330b8d2f0a	NO	NOR	578	Norway 	Norveška	\N
00040000-565f-11a4-ea4b-8d6625219339	OM	OMN	512	Oman 	Oman	\N
00040000-565f-11a4-cbd2-1c97edf3de25	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-565f-11a4-c414-452fde4f6a99	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-565f-11a4-1220-bff1488002ea	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-565f-11a4-548c-7aa8e4bcf54d	PA	PAN	591	Panama 	Panama	\N
00040000-565f-11a4-5515-bafab4f501b7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-565f-11a4-813e-0127cfdd64e2	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-565f-11a4-5db2-14525ece9ff9	PE	PER	604	Peru 	Peru	\N
00040000-565f-11a4-e303-b6401e88f2b5	PH	PHL	608	Philippines 	Filipini	\N
00040000-565f-11a4-d9f6-6f520bd7491d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-565f-11a4-818f-20d3c3d997e7	PL	POL	616	Poland 	Poljska	\N
00040000-565f-11a4-857f-b927a07940e2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-565f-11a4-6da1-af02c3402ef0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-565f-11a4-34fd-f2a3c50190f4	QA	QAT	634	Qatar 	Katar	\N
00040000-565f-11a4-c2a7-94880645fe38	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-565f-11a4-94fe-a3a54ffa229d	RO	ROU	642	Romania 	Romunija	\N
00040000-565f-11a4-ea36-157e3a642391	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-565f-11a4-5bcd-87aea75e9879	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-565f-11a4-5ed0-2ba40cad0a23	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-565f-11a4-d527-a9991d2afce6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-565f-11a4-9ff4-aa5c7e985803	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-565f-11a4-674d-2e29d7476a83	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-565f-11a4-104e-ba9bf2bccb7e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-565f-11a4-769a-93ff9b49ea87	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-565f-11a4-aaa6-fb6234c5d0a7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-565f-11a4-0a25-bc5f168dda9f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-565f-11a4-347d-5416292a9a16	SM	SMR	674	San Marino 	San Marino	\N
00040000-565f-11a4-3ead-9d9c47550578	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-565f-11a4-5d69-93beb623e809	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-565f-11a4-f7f6-ce4aea6d7fb8	SN	SEN	686	Senegal 	Senegal	\N
00040000-565f-11a4-1532-4a8b86ed4519	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-565f-11a4-05cd-0ed29cdc586c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-565f-11a4-a76c-685a210f0465	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-565f-11a4-8138-8197108e59f4	SG	SGP	702	Singapore 	Singapur	\N
00040000-565f-11a4-7bed-d5685c887620	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-565f-11a4-e6c1-cd5bc12f1f5c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-565f-11a4-a82e-6b682b661525	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-565f-11a4-6bfe-40a9c29d2dfc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-565f-11a4-1f4f-d59a54701170	SO	SOM	706	Somalia 	Somalija	\N
00040000-565f-11a4-404b-fcb4674c180b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-565f-11a4-0bb5-3cedd52617ef	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-565f-11a4-acec-446978e8eb1b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-565f-11a4-f384-6e9833be2c1f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-565f-11a4-35e4-a61ad6d8b139	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-565f-11a4-39e6-7fdc740c704e	SD	SDN	729	Sudan 	Sudan	\N
00040000-565f-11a4-3fdd-898dbf15b0da	SR	SUR	740	Suriname 	Surinam	\N
00040000-565f-11a4-2464-3f89b9bb6e0c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-565f-11a4-d779-0b2b9bd7bce8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-565f-11a4-a49f-7dbcfbced5d7	SE	SWE	752	Sweden 	Švedska	\N
00040000-565f-11a4-2fc9-f7d17a929c54	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-565f-11a4-9b73-4b44d679a224	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-565f-11a4-4397-e2a7a9842c9d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-565f-11a4-efaf-9a54977b0402	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-565f-11a4-f77c-fca084773c2c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-565f-11a4-80bc-1e59bfc251a0	TH	THA	764	Thailand 	Tajska	\N
00040000-565f-11a4-0d32-bec1aba88b5c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-565f-11a4-6663-5f59a39692aa	TG	TGO	768	Togo 	Togo	\N
00040000-565f-11a4-bd82-e963a00db3b8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-565f-11a4-efcb-c037f890ab75	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-565f-11a4-0bbe-61effffb00eb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-565f-11a4-0264-5c5fa25a7205	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-565f-11a4-e20c-9461e7fd816f	TR	TUR	792	Turkey 	Turčija	\N
00040000-565f-11a4-1663-f4469c6e99bf	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-565f-11a4-2880-d5dd46874618	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565f-11a4-7beb-26c7ec8c2e6e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-565f-11a4-1091-6fcb680d0278	UG	UGA	800	Uganda 	Uganda	\N
00040000-565f-11a4-ceba-31d54d78e24b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-565f-11a4-614d-526a24f911e5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-565f-11a4-bf5b-0595a280d4ca	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-565f-11a4-26f0-78309d674105	US	USA	840	United States 	Združene države Amerike	\N
00040000-565f-11a4-b5e0-18a7b8c46b47	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-565f-11a4-20df-c7e2d3563684	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-565f-11a4-ec41-e31121f1a51b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-565f-11a4-c488-865ab68e984e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-565f-11a4-caaa-3f1206fab0e3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-565f-11a4-7153-f41ff52f7912	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-565f-11a4-4e03-74315e12078c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565f-11a4-d8f0-ffb078e20bf1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-565f-11a4-a5fb-36b221839706	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-565f-11a4-fb08-1cb375bb31d2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-565f-11a4-cc28-da7cb939b196	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-565f-11a4-ffb7-4f37561937d1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-565f-11a4-5408-5f0fe1d7c6bb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30684622)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-565f-11a6-aa60-e578cb767cd0	000e0000-565f-11a6-b262-fb82f6d9484b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565f-11a3-b7e0-2ad88c8b6ab7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565f-11a6-4851-b6d3a5c4720d	000e0000-565f-11a6-da03-bb922afca3c9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565f-11a3-923a-1b2532060dcf	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565f-11a6-143f-d9564d4e09b7	000e0000-565f-11a6-5d69-1184b002dbab	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565f-11a3-b7e0-2ad88c8b6ab7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565f-11a7-6b97-815c92f112de	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565f-11a7-7377-52408e3643c6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30684423)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-565f-11a6-e87a-6a39a3b797a5	000e0000-565f-11a6-da03-bb922afca3c9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-565f-11a3-e150-e41ee3c7353d
000d0000-565f-11a6-476b-577cdb4fa260	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-0360-652a915575ef	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-565f-11a3-e150-e41ee3c7353d
000d0000-565f-11a6-f4d9-dc752c6fb333	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-8a99-f1ed74609d2d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-565f-11a3-99ca-2f16559715de
000d0000-565f-11a6-941b-8fff15b96451	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-ba91-91c9ca00cb24	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-565f-11a3-03af-52cdafefb8fd
000d0000-565f-11a6-e2d2-ed9e5767222c	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-a4a3-9cdd55440b40	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-565f-11a3-78a2-f4b8dd88d594
000d0000-565f-11a6-c51c-8fa526b47537	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-b73d-c755203f46a0	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-565f-11a3-78a2-f4b8dd88d594
000d0000-565f-11a6-446c-7b2b56f37081	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-876d-b6f14f9c728e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-565f-11a3-e150-e41ee3c7353d
000d0000-565f-11a6-54ab-54865dfce5bd	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-459d-d23643c00342	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-565f-11a3-4af0-50aa0e4f1839
000d0000-565f-11a6-f5f9-25be227c2ebd	000e0000-565f-11a6-da03-bb922afca3c9	000c0000-565f-11a7-94e2-edce918cb6a0	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-565f-11a3-577f-391f3b702f79
\.


--
-- TOC entry 3124 (class 0 OID 30684214)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30684180)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30684157)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-565f-11a6-7ea1-8dc936258c6b	00080000-565f-11a6-3189-68c7e6dd3ed7	00090000-565f-11a6-a2ab-dc3af1e46bc0	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30684337)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30684882)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-565f-11a6-10fa-fa3f84293e00	00010000-565f-11a4-5fbd-04caa3172f73	\N	Prva mapa	Root mapa	2015-12-02 16:43:34	2015-12-02 16:43:34	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30684895)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30684917)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
20150907083238
20150911210328
20150917115047
20150918081756
20150923181744
20150929204104
20150930165014
20151012154609
20151013160827
20151015150048
20151021092904
20151028083119
20151028094855
20151029145336
20151102103154
20151104101328
\.


--
-- TOC entry 3140 (class 0 OID 30684362)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30684114)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-565f-11a5-4e2c-3eedd6977ed1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-565f-11a5-61e3-c86463b038fb	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-565f-11a5-8b0a-382ba6209987	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-565f-11a5-1c22-58a5be491edd	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-565f-11a5-48f4-38a58ed01019	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-565f-11a5-36f6-5cded8c379df	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-565f-11a5-0e54-8c669f9b98ec	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-565f-11a5-2c54-3bed637c3a51	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565f-11a5-e51f-179bd2a47435	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565f-11a5-2fc1-05446d0d33f2	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-565f-11a5-72ab-c7c3667e8960	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-565f-11a5-ac73-46822d8b4680	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-565f-11a5-5f1b-cee34fa70964	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-565f-11a5-2e22-8e26e5323651	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-565f-11a6-0f47-acbb777cc2ee	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-565f-11a6-3f0e-a6ded3ee4617	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-565f-11a6-3ce2-89335f43d2af	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-565f-11a6-35e9-0e506b1ff0f8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-565f-11a6-044c-d70dd3139df9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-565f-11a8-3ffb-3ef64761832b	application.tenant.maticnopodjetje	string	s:36:"00080000-565f-11a8-cbaf-534bb7e203d7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30684014)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-565f-11a6-eb0c-14ad9994cf6e	00000000-565f-11a6-0f47-acbb777cc2ee	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-565f-11a6-9c87-ec15617415e0	00000000-565f-11a6-0f47-acbb777cc2ee	00010000-565f-11a4-5fbd-04caa3172f73	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-565f-11a6-9520-6e63d097a1e3	00000000-565f-11a6-3f0e-a6ded3ee4617	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30684081)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-565f-11a6-550d-a9ace01f8b00	\N	00100000-565f-11a6-161f-d51e4551ae12	00100000-565f-11a6-f1ea-59c8e370d6e0	01	Gledališče Nimbis
00410000-565f-11a6-e527-5479cd352d4c	00410000-565f-11a6-550d-a9ace01f8b00	00100000-565f-11a6-161f-d51e4551ae12	00100000-565f-11a6-f1ea-59c8e370d6e0	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30684025)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-565f-11a6-e89c-677ad5e6d68a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-565f-11a6-4e7c-73dc1992e184	00010000-565f-11a6-5626-ba24ba52080a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-565f-11a6-0e55-239206ffa52c	00010000-565f-11a6-2114-92307a9437e9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-565f-11a6-e48f-a5aca43f9d0a	00010000-565f-11a6-a305-a5ea1754a791	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-565f-11a6-63eb-e0d86d6b01cf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-565f-11a6-ca14-0d00dcf12d51	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-565f-11a6-7cdd-ca364ba519e9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-565f-11a6-925c-79e6f6f906ac	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-565f-11a6-a2ab-dc3af1e46bc0	00010000-565f-11a6-86cb-f5e329900756	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-565f-11a6-daaf-f0a325a93b3b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-565f-11a6-2b60-db83e9ee955c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565f-11a6-f736-390908a3548d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-565f-11a6-ac51-3c59fb2c08f2	00010000-565f-11a6-8d1f-bed81571b5bb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565f-11a6-20bf-57c595330d89	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-565f-11a6-b69c-18f84b630ff8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-565f-11a6-874f-3af33e7896cf	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-565f-11a6-8c21-7a1cd8a12602	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565f-11a6-d72f-edce6d47f507	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565f-11a6-32ac-c722ab352264	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-565f-11a6-cf41-4311c45f97da	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-565f-11a6-c527-1cb5c62407ad	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30683960)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-565f-11a4-3860-099096b4410b	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-565f-11a4-b9ac-7a7bafca9848	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-565f-11a4-7e76-68af68f2c0fa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-565f-11a4-9528-e2c415d9e7c3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-565f-11a4-c22b-c0fc6a618e6f	Oseba-vse	Oseba - spreminjanje osebnih podatkov	t
00030000-565f-11a4-fb14-79e28c9665b3	Oseba-readVse	Oseba - branje tudi osebnih podatkov	t
00030000-565f-11a4-e1fb-d7251bd08b7c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-565f-11a4-be50-86b58b897822	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-565f-11a4-beff-983c3908d50e	Abonma-read	Abonma - branje	t
00030000-565f-11a4-ba02-c4953811643b	Abonma-write	Abonma - spreminjanje	t
00030000-565f-11a4-808e-2b4ff5aa6f9e	Alternacija-read	Alternacija - branje	t
00030000-565f-11a4-1559-da079603d003	Alternacija-write	Alternacija - spreminjanje	t
00030000-565f-11a4-1ed2-34e51d67ff09	Arhivalija-read	Arhivalija - branje	t
00030000-565f-11a4-b378-32c04696aa1a	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-565f-11a4-e9e1-018ab26aa533	AuthStorage-read	AuthStorage - branje	t
00030000-565f-11a4-7fc3-243bcec9553f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-565f-11a4-6048-e2e5b4b40348	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-565f-11a4-a2b4-ca5243f1233d	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-565f-11a4-2d13-b9d130809dd6	Besedilo-read	Besedilo - branje	t
00030000-565f-11a4-7acf-9949172be949	Besedilo-write	Besedilo - spreminjanje	t
00030000-565f-11a4-20a7-538ec697c4b1	Dogodek-read	Dogodek - branje	t
00030000-565f-11a4-5b24-96e1140822de	Dogodek-write	Dogodek - spreminjanje	t
00030000-565f-11a4-6715-4f70b46ea19a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-565f-11a4-08fc-bb01e302ac39	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-565f-11a4-5384-515840a2fd37	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-565f-11a4-a557-d2d6cacb523b	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-565f-11a4-c691-ff26ed8fe08c	DogodekTrait-read	DogodekTrait - branje	t
00030000-565f-11a4-f257-178dd0c9f6dd	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-565f-11a4-7172-a2e6e545d8f6	DrugiVir-read	DrugiVir - branje	t
00030000-565f-11a4-e2c8-ad378c7c112c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-565f-11a4-ee00-1df0fccc7c91	Drzava-read	Drzava - branje	t
00030000-565f-11a4-5ff1-ca393ededb9b	Drzava-write	Drzava - spreminjanje	t
00030000-565f-11a4-46c5-791317320008	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-565f-11a4-d230-a70d28f8842d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-565f-11a4-6cab-ffd5d8ef987e	Funkcija-read	Funkcija - branje	t
00030000-565f-11a4-6f7f-0753f322e603	Funkcija-write	Funkcija - spreminjanje	t
00030000-565f-11a4-5b66-01a2c7f970d1	Gostovanje-read	Gostovanje - branje	t
00030000-565f-11a4-953b-6866a7e4f852	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-565f-11a4-a27e-726f0d8e529e	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-565f-11a4-90e3-53f130dfca24	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-565f-11a4-7ba8-ef916eefda9c	Kupec-read	Kupec - branje	t
00030000-565f-11a4-afb3-f2e6c4436373	Kupec-write	Kupec - spreminjanje	t
00030000-565f-11a4-8d65-b7ee32884280	NacinPlacina-read	NacinPlacina - branje	t
00030000-565f-11a4-e457-faa72e487a99	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-565f-11a4-2d7b-06d87106895a	Option-read	Option - branje	t
00030000-565f-11a4-c0d6-62c1098a9266	Option-write	Option - spreminjanje	t
00030000-565f-11a4-5b38-ec7988ad6ea7	OptionValue-read	OptionValue - branje	t
00030000-565f-11a4-a8e6-ef6405b5c887	OptionValue-write	OptionValue - spreminjanje	t
00030000-565f-11a4-cb00-a9cfb0a56acd	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-565f-11a4-111c-4010a16addba	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-565f-11a4-653b-9769f74a3428	Oseba-read	Oseba - branje	t
00030000-565f-11a4-64b0-6871f2b51cb9	Oseba-write	Oseba - spreminjanje	t
00030000-565f-11a4-6f92-40f9b81647ff	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-565f-11a4-88b8-0fcd55fdc527	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-565f-11a4-e240-076c487a8047	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-565f-11a4-1cd7-0631d2ece1b4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-565f-11a4-43df-78d24bffd778	Pogodba-read	Pogodba - branje	t
00030000-565f-11a4-f646-ee7faa94bc91	Pogodba-write	Pogodba - spreminjanje	t
00030000-565f-11a4-3a5f-01389ed6b7e8	Popa-read	Popa - branje	t
00030000-565f-11a4-debb-6fca60cad0c7	Popa-write	Popa - spreminjanje	t
00030000-565f-11a4-380a-23d15ee3179c	Posta-read	Posta - branje	t
00030000-565f-11a4-16af-8aa350a52305	Posta-write	Posta - spreminjanje	t
00030000-565f-11a4-294b-319036e9fa24	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-565f-11a4-4999-cbed1b64e1ce	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-565f-11a4-ff8a-cfc0fbd7d06e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-565f-11a4-7960-a11ef553a2f4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-565f-11a4-5762-555ee2d7874d	PostniNaslov-read	PostniNaslov - branje	t
00030000-565f-11a4-41e1-d3b3479a59a5	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-565f-11a4-65fd-34ef776c553d	Praznik-read	Praznik - branje	t
00030000-565f-11a4-267c-d80e63fe87c7	Praznik-write	Praznik - spreminjanje	t
00030000-565f-11a4-55b1-d547cc7c2f1c	Predstava-read	Predstava - branje	t
00030000-565f-11a4-7c37-4a62a7494eb0	Predstava-write	Predstava - spreminjanje	t
00030000-565f-11a4-9990-10ecbc438d28	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-565f-11a4-6128-2a9e8c1c71e5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-565f-11a4-acf8-fc6256f89ce6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-565f-11a4-7220-0b360e6f8c76	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-565f-11a4-c7a2-ac2b7c570c9d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-565f-11a4-14c3-8ed41c2fbdae	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-565f-11a4-7ee8-5f5178170612	ProgramDela-read	ProgramDela - branje	t
00030000-565f-11a4-7e2f-da67a6cd6e30	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-565f-11a4-6d36-e88f3981aaac	ProgramFestival-read	ProgramFestival - branje	t
00030000-565f-11a4-e635-e1f71c9bac9a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-565f-11a4-b6aa-ffd34a01c787	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-565f-11a4-190b-7926fcb9ab1d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-565f-11a4-f265-1e6f60d17c88	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-565f-11a4-6b05-eda5d61ec30a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-565f-11a4-a93b-4dc09eec20d6	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-565f-11a4-21d7-e37898954379	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-565f-11a4-990c-3a5e739f398e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-565f-11a4-ff93-e3243865a632	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-565f-11a4-5057-7878e5751803	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-565f-11a4-6f6e-8841425e499d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-565f-11a4-22b2-adf7d9ea7fff	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-565f-11a4-e6e0-7915660c7d66	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-565f-11a4-4362-7d2479e72707	ProgramRazno-read	ProgramRazno - branje	t
00030000-565f-11a4-46d0-4eb123e0ddb1	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-565f-11a4-27f5-d61cc9e06e7e	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-565f-11a4-697a-faccf1e2aa46	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-565f-11a4-0b84-0edaf09414f0	Prostor-read	Prostor - branje	t
00030000-565f-11a4-3252-9388c566d432	Prostor-write	Prostor - spreminjanje	t
00030000-565f-11a4-38d2-fa02fbf7d754	Racun-read	Racun - branje	t
00030000-565f-11a4-c711-c6a8dec33722	Racun-write	Racun - spreminjanje	t
00030000-565f-11a4-824c-5d81fe080fca	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-565f-11a4-98d7-7c205f664eb2	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-565f-11a4-63ce-f0ec5bc481e7	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-565f-11a4-e919-5de8ee04fc29	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-565f-11a4-282b-17239e860dd9	Rekvizit-read	Rekvizit - branje	t
00030000-565f-11a4-2319-9b7c973c824c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-565f-11a4-2b2c-e5c89479cb4d	Revizija-read	Revizija - branje	t
00030000-565f-11a4-d50c-e60cc2bb7f3f	Revizija-write	Revizija - spreminjanje	t
00030000-565f-11a4-1af3-300818cc7093	Rezervacija-read	Rezervacija - branje	t
00030000-565f-11a4-1bd1-d3626350775d	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-565f-11a4-82fb-5d6a54a548bf	SedezniRed-read	SedezniRed - branje	t
00030000-565f-11a4-5fbc-a73c4dab88db	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-565f-11a4-2df8-9fc6dbf8df4c	Sedez-read	Sedez - branje	t
00030000-565f-11a4-c0b8-4dcf2b1ea805	Sedez-write	Sedez - spreminjanje	t
00030000-565f-11a4-7ae2-42ea792cf4c0	Sezona-read	Sezona - branje	t
00030000-565f-11a4-02ba-e5e29b130ef4	Sezona-write	Sezona - spreminjanje	t
00030000-565f-11a4-637b-f7e8f9bd3dfd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-565f-11a4-bad7-059e15c75dac	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-565f-11a4-6144-974e2938bc5d	Stevilcenje-read	Stevilcenje - branje	t
00030000-565f-11a4-d40a-fa9b53d80c7b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-565f-11a4-2110-4b7bab294d7f	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-565f-11a4-9645-08af9bdbb000	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-565f-11a4-0bc6-88234474c1eb	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-565f-11a4-fb4c-283003565556	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-565f-11a4-02c5-eef8abf5f7e4	Telefonska-read	Telefonska - branje	t
00030000-565f-11a4-efcc-c7df7b9bb9e7	Telefonska-write	Telefonska - spreminjanje	t
00030000-565f-11a4-d120-ad068999b5c4	TerminStoritve-read	TerminStoritve - branje	t
00030000-565f-11a4-436b-255eb5ef9377	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-565f-11a4-e6cc-3dfa3567ee91	TipFunkcije-read	TipFunkcije - branje	t
00030000-565f-11a4-fe8b-43a8fd379693	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-565f-11a4-e279-b692cc57b83a	TipPopa-read	TipPopa - branje	t
00030000-565f-11a4-c3ca-5399869c6dad	TipPopa-write	TipPopa - spreminjanje	t
00030000-565f-11a4-9008-db82931c1fe3	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-565f-11a4-7262-26e216e48ae8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-565f-11a4-1067-407993afcec5	TipVaje-read	TipVaje - branje	t
00030000-565f-11a4-0688-7088610232e2	TipVaje-write	TipVaje - spreminjanje	t
00030000-565f-11a4-59d2-524c0227d3d3	Trr-read	Trr - branje	t
00030000-565f-11a4-78e5-0c513cbc1829	Trr-write	Trr - spreminjanje	t
00030000-565f-11a4-9af3-54256dc0e7a1	Uprizoritev-read	Uprizoritev - branje	t
00030000-565f-11a4-0dc4-4f861a4afbff	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-565f-11a4-7427-4dc57e3ff43a	Vaja-read	Vaja - branje	t
00030000-565f-11a4-e1ea-502958638863	Vaja-write	Vaja - spreminjanje	t
00030000-565f-11a4-81af-8b0ec97b1c06	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-565f-11a4-80d7-104b6d571853	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-565f-11a4-c82c-4d668fa9a160	VrstaStroska-read	VrstaStroska - branje	t
00030000-565f-11a4-189b-02265a3ce3d6	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-565f-11a4-2a40-a3743f1d08d6	Zaposlitev-read	Zaposlitev - branje	t
00030000-565f-11a4-350a-0301c82a763b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-565f-11a4-921c-e25e20b5606e	Zasedenost-read	Zasedenost - branje	t
00030000-565f-11a4-f75c-7ab8932ab756	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-565f-11a4-b6d7-74446deb5ad9	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-565f-11a4-e757-3de928ec160f	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-565f-11a4-2036-e258c405ed86	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-565f-11a4-1a71-d200d08819b2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-565f-11a4-0399-a5b22b0ed717	Job-read	Branje opravil - samo zase - branje	t
00030000-565f-11a4-e1a3-214f995f8a9c	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-565f-11a4-51a0-a97fd92cff81	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-565f-11a4-9012-98cf0588d84c	Report-read	Report - branje	t
00030000-565f-11a4-6e9e-77d63003d1c9	Report-write	Report - spreminjanje	t
00030000-565f-11a4-7078-62ea8c2207c1	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-565f-11a4-5f6f-27bf5b17c4bb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-565f-11a4-6b5f-909e88584498	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-565f-11a4-6c88-3d7cd1356630	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-565f-11a4-b9e9-90291ec52ae2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-565f-11a4-a7fa-edc600564feb	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-565f-11a4-73f0-98d8b22a085a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-565f-11a4-46d8-be678da4b6d1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-565f-11a4-7f05-1f5991d57f9f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565f-11a4-b1c6-569180ec0740	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565f-11a4-7b1d-f221fe8aabff	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-565f-11a4-9fcf-1b762120396a	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-565f-11a4-dc97-8f5617c6bea9	Datoteka-write	Datoteka - spreminjanje	t
00030000-565f-11a4-5a6e-9b36a4f9baab	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30683979)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-565f-11a4-310b-ba1957a7b950	00030000-565f-11a4-b9ac-7a7bafca9848
00020000-565f-11a4-310b-ba1957a7b950	00030000-565f-11a4-3860-099096b4410b
00020000-565f-11a4-7390-b11282d3875e	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-a2b4-ca5243f1233d
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-7acf-9949172be949
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-6048-e2e5b4b40348
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-2d13-b9d130809dd6
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-9a12-59a451ee82cb	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-375f-3bf8847b30d0	00030000-565f-11a4-6048-e2e5b4b40348
00020000-565f-11a4-375f-3bf8847b30d0	00030000-565f-11a4-2d13-b9d130809dd6
00020000-565f-11a4-375f-3bf8847b30d0	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-375f-3bf8847b30d0	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-375f-3bf8847b30d0	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-3fd9-a7c347ee3b42	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-3fd9-a7c347ee3b42	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-3fd9-a7c347ee3b42	00030000-565f-11a4-350a-0301c82a763b
00020000-565f-11a4-3fd9-a7c347ee3b42	00030000-565f-11a4-cb00-a9cfb0a56acd
00020000-565f-11a4-41de-e1287ef5893c	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-41de-e1287ef5893c	00030000-565f-11a4-cb00-a9cfb0a56acd
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-64b0-6871f2b51cb9
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-41e1-d3b3479a59a5
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-02c5-eef8abf5f7e4
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-efcc-c7df7b9bb9e7
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-c39c-fc6bd221a050	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-02c5-eef8abf5f7e4
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-2470-0670c3b20ee8	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-c22b-c0fc6a618e6f
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-64b0-6871f2b51cb9
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-fd88-1dae4aacd054	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-4049-82c565219db9	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-4049-82c565219db9	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a4-4049-82c565219db9	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-4049-82c565219db9	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-4049-82c565219db9	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-02c5-eef8abf5f7e4
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-a27e-726f0d8e529e
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-efcc-c7df7b9bb9e7
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-41e1-d3b3479a59a5
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-78e5-0c513cbc1829
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-debb-6fca60cad0c7
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-90e3-53f130dfca24
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-14c3-8ed41c2fbdae
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-1505-396cec80c0ae	00030000-565f-11a4-e279-b692cc57b83a
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-02c5-eef8abf5f7e4
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-a27e-726f0d8e529e
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-2183-b4714ba06c06	00030000-565f-11a4-e279-b692cc57b83a
00020000-565f-11a4-be17-374ff5e20c62	00030000-565f-11a4-e279-b692cc57b83a
00020000-565f-11a4-be17-374ff5e20c62	00030000-565f-11a4-c3ca-5399869c6dad
00020000-565f-11a4-6e35-e5d5dab8d17b	00030000-565f-11a4-e279-b692cc57b83a
00020000-565f-11a4-aeb4-f30cbdf013cb	00030000-565f-11a4-380a-23d15ee3179c
00020000-565f-11a4-aeb4-f30cbdf013cb	00030000-565f-11a4-16af-8aa350a52305
00020000-565f-11a4-bc5c-fca1132ac402	00030000-565f-11a4-380a-23d15ee3179c
00020000-565f-11a4-add0-e3fb5106e098	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-add0-e3fb5106e098	00030000-565f-11a4-5ff1-ca393ededb9b
00020000-565f-11a4-bad7-eaa5511f6448	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-4c2d-8fbf30d0acf8	00030000-565f-11a4-2036-e258c405ed86
00020000-565f-11a4-4c2d-8fbf30d0acf8	00030000-565f-11a4-1a71-d200d08819b2
00020000-565f-11a4-b817-4e571249020c	00030000-565f-11a4-2036-e258c405ed86
00020000-565f-11a4-f050-4d05c4124cef	00030000-565f-11a4-b6d7-74446deb5ad9
00020000-565f-11a4-f050-4d05c4124cef	00030000-565f-11a4-e757-3de928ec160f
00020000-565f-11a4-6b12-3182f5d67991	00030000-565f-11a4-b6d7-74446deb5ad9
00020000-565f-11a4-2064-670168d19d26	00030000-565f-11a4-beff-983c3908d50e
00020000-565f-11a4-2064-670168d19d26	00030000-565f-11a4-ba02-c4953811643b
00020000-565f-11a4-c4aa-47ae14ad15d6	00030000-565f-11a4-beff-983c3908d50e
00020000-565f-11a4-b212-a0799a432b6f	00030000-565f-11a4-0b84-0edaf09414f0
00020000-565f-11a4-b212-a0799a432b6f	00030000-565f-11a4-3252-9388c566d432
00020000-565f-11a4-b212-a0799a432b6f	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-b212-a0799a432b6f	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-b212-a0799a432b6f	00030000-565f-11a4-41e1-d3b3479a59a5
00020000-565f-11a4-b212-a0799a432b6f	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-7b29-951dfb0f8f51	00030000-565f-11a4-0b84-0edaf09414f0
00020000-565f-11a4-7b29-951dfb0f8f51	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-7b29-951dfb0f8f51	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-ca8a-d98dec31a7f8	00030000-565f-11a4-c82c-4d668fa9a160
00020000-565f-11a4-ca8a-d98dec31a7f8	00030000-565f-11a4-189b-02265a3ce3d6
00020000-565f-11a4-2429-bd118ba16d15	00030000-565f-11a4-c82c-4d668fa9a160
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-111c-4010a16addba
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-cb00-a9cfb0a56acd
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-cd5d-593ba399088e	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-b6db-2a41efa5dd9e	00030000-565f-11a4-cb00-a9cfb0a56acd
00020000-565f-11a4-b6db-2a41efa5dd9e	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-b6db-2a41efa5dd9e	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-b6db-2a41efa5dd9e	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-b6db-2a41efa5dd9e	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-f05b-d11f677ceae1	00030000-565f-11a4-1067-407993afcec5
00020000-565f-11a4-f05b-d11f677ceae1	00030000-565f-11a4-0688-7088610232e2
00020000-565f-11a4-6e12-126cd0c9d1b6	00030000-565f-11a4-1067-407993afcec5
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-e1fb-d7251bd08b7c
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-be50-86b58b897822
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-7ee8-5f5178170612
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-7e2f-da67a6cd6e30
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-6d36-e88f3981aaac
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-e635-e1f71c9bac9a
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-b6aa-ffd34a01c787
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-190b-7926fcb9ab1d
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-f265-1e6f60d17c88
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-6b05-eda5d61ec30a
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-a93b-4dc09eec20d6
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-21d7-e37898954379
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-990c-3a5e739f398e
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-ff93-e3243865a632
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-5057-7878e5751803
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-6f6e-8841425e499d
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-22b2-adf7d9ea7fff
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-e6e0-7915660c7d66
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-4362-7d2479e72707
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-46d0-4eb123e0ddb1
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-27f5-d61cc9e06e7e
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-697a-faccf1e2aa46
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-7220-0b360e6f8c76
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-e2c8-ad378c7c112c
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-4999-cbed1b64e1ce
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-e1a3-214f995f8a9c
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-7172-a2e6e545d8f6
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-acf8-fc6256f89ce6
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-294b-319036e9fa24
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-c82c-4d668fa9a160
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-43df-78d24bffd778
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-0399-a5b22b0ed717
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-5bf4-1b3dd66efb0e	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-7ee8-5f5178170612
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-6d36-e88f3981aaac
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-b6aa-ffd34a01c787
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-f265-1e6f60d17c88
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-a93b-4dc09eec20d6
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-990c-3a5e739f398e
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-5057-7878e5751803
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-22b2-adf7d9ea7fff
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-4362-7d2479e72707
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-27f5-d61cc9e06e7e
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-acf8-fc6256f89ce6
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-7172-a2e6e545d8f6
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-294b-319036e9fa24
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-0399-a5b22b0ed717
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-ec58-c92ea8a18ccd	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-0dc4-4f861a4afbff
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-1559-da079603d003
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-2d13-b9d130809dd6
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-6f7f-0753f322e603
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-1c7e-fa91ecb90712	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-2d13-b9d130809dd6
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-03c0-0a91707484ac	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-1559-da079603d003
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-43df-78d24bffd778
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-f646-ee7faa94bc91
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-fb4c-283003565556
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-7336-60d6889c9a59	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-43df-78d24bffd778
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-e97e-4ede7c55b595	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-43df-78d24bffd778
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-7891-c1f1d00ec308	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-7987-4f013583d5a0	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a4-7987-4f013583d5a0	00030000-565f-11a4-fb4c-283003565556
00020000-565f-11a4-7987-4f013583d5a0	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-7987-4f013583d5a0	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-91c6-00eaa1d0f904	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a4-91c6-00eaa1d0f904	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-beff-983c3908d50e
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-6048-e2e5b4b40348
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-a2b4-ca5243f1233d
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-2d13-b9d130809dd6
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-7acf-9949172be949
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-a27e-726f0d8e529e
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-cb00-a9cfb0a56acd
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-64b0-6871f2b51cb9
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-380a-23d15ee3179c
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-41e1-d3b3479a59a5
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-0b84-0edaf09414f0
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-02c5-eef8abf5f7e4
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-efcc-c7df7b9bb9e7
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-e279-b692cc57b83a
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-1067-407993afcec5
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-c82c-4d668fa9a160
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-b6d7-74446deb5ad9
00020000-565f-11a4-3426-04a779a845f0	00030000-565f-11a4-2036-e258c405ed86
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-3860-099096b4410b
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-b9ac-7a7bafca9848
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-beff-983c3908d50e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-ba02-c4953811643b
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-808e-2b4ff5aa6f9e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1559-da079603d003
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1ed2-34e51d67ff09
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-b378-32c04696aa1a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e9e1-018ab26aa533
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7fc3-243bcec9553f
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6048-e2e5b4b40348
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-a2b4-ca5243f1233d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2d13-b9d130809dd6
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7acf-9949172be949
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-20a7-538ec697c4b1
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9528-e2c415d9e7c3
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5b24-96e1140822de
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6715-4f70b46ea19a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-08fc-bb01e302ac39
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5384-515840a2fd37
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-a557-d2d6cacb523b
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7172-a2e6e545d8f6
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e2c8-ad378c7c112c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-ee00-1df0fccc7c91
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5ff1-ca393ededb9b
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-46c5-791317320008
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-d230-a70d28f8842d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6cab-ffd5d8ef987e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6f7f-0753f322e603
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5b66-01a2c7f970d1
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-953b-6866a7e4f852
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-51a0-a97fd92cff81
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-0399-a5b22b0ed717
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e1a3-214f995f8a9c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-a27e-726f0d8e529e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-90e3-53f130dfca24
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7ba8-ef916eefda9c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-afb3-f2e6c4436373
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7078-62ea8c2207c1
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5f6f-27bf5b17c4bb
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6b5f-909e88584498
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6c88-3d7cd1356630
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-a7fa-edc600564feb
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-b9e9-90291ec52ae2
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-8d65-b7ee32884280
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e457-faa72e487a99
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2d7b-06d87106895a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c0d6-62c1098a9266
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5b38-ec7988ad6ea7
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-a8e6-ef6405b5c887
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-cb00-a9cfb0a56acd
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-111c-4010a16addba
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c22b-c0fc6a618e6f
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-64b0-6871f2b51cb9
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6f92-40f9b81647ff
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-88b8-0fcd55fdc527
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e240-076c487a8047
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1cd7-0631d2ece1b4
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-43df-78d24bffd778
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-f646-ee7faa94bc91
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-debb-6fca60cad0c7
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-380a-23d15ee3179c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-16af-8aa350a52305
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-294b-319036e9fa24
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-4999-cbed1b64e1ce
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-ff8a-cfc0fbd7d06e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7960-a11ef553a2f4
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5762-555ee2d7874d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-41e1-d3b3479a59a5
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-65fd-34ef776c553d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-267c-d80e63fe87c7
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-55b1-d547cc7c2f1c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7c37-4a62a7494eb0
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9990-10ecbc438d28
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6128-2a9e8c1c71e5
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-acf8-fc6256f89ce6
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7220-0b360e6f8c76
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c7a2-ac2b7c570c9d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-14c3-8ed41c2fbdae
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e1fb-d7251bd08b7c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7ee8-5f5178170612
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-be50-86b58b897822
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7e2f-da67a6cd6e30
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6d36-e88f3981aaac
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e635-e1f71c9bac9a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-b6aa-ffd34a01c787
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-190b-7926fcb9ab1d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-f265-1e6f60d17c88
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6b05-eda5d61ec30a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-a93b-4dc09eec20d6
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-21d7-e37898954379
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-990c-3a5e739f398e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-ff93-e3243865a632
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5057-7878e5751803
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6f6e-8841425e499d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-22b2-adf7d9ea7fff
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e6e0-7915660c7d66
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-4362-7d2479e72707
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-46d0-4eb123e0ddb1
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-27f5-d61cc9e06e7e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-697a-faccf1e2aa46
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-0b84-0edaf09414f0
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-3252-9388c566d432
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-38d2-fa02fbf7d754
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c711-c6a8dec33722
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-824c-5d81fe080fca
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-98d7-7c205f664eb2
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-282b-17239e860dd9
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2319-9b7c973c824c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-63ce-f0ec5bc481e7
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e919-5de8ee04fc29
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9012-98cf0588d84c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6e9e-77d63003d1c9
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2b2c-e5c89479cb4d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-d50c-e60cc2bb7f3f
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1af3-300818cc7093
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1bd1-d3626350775d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2df8-9fc6dbf8df4c
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c0b8-4dcf2b1ea805
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-82fb-5d6a54a548bf
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-5fbc-a73c4dab88db
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7ae2-42ea792cf4c0
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-02ba-e5e29b130ef4
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-6144-974e2938bc5d
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-d40a-fa9b53d80c7b
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-637b-f7e8f9bd3dfd
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-bad7-059e15c75dac
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2110-4b7bab294d7f
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9645-08af9bdbb000
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-0bc6-88234474c1eb
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-fb4c-283003565556
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-02c5-eef8abf5f7e4
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-efcc-c7df7b9bb9e7
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-d120-ad068999b5c4
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7e76-68af68f2c0fa
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-436b-255eb5ef9377
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e6cc-3dfa3567ee91
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-fe8b-43a8fd379693
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e279-b692cc57b83a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c3ca-5399869c6dad
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9008-db82931c1fe3
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7262-26e216e48ae8
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1067-407993afcec5
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-0688-7088610232e2
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-59d2-524c0227d3d3
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-78e5-0c513cbc1829
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-0dc4-4f861a4afbff
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7427-4dc57e3ff43a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e1ea-502958638863
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-81af-8b0ec97b1c06
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-80d7-104b6d571853
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-c82c-4d668fa9a160
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-189b-02265a3ce3d6
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-9fcf-1b762120396a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7b1d-f221fe8aabff
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2a40-a3743f1d08d6
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-350a-0301c82a763b
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-921c-e25e20b5606e
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-f75c-7ab8932ab756
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-b6d7-74446deb5ad9
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-e757-3de928ec160f
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-2036-e258c405ed86
00020000-565f-11a6-1ab3-b7512d707606	00030000-565f-11a4-1a71-d200d08819b2
00020000-565f-11a6-fdf7-d97f7939bd10	00030000-565f-11a4-b1c6-569180ec0740
00020000-565f-11a6-b798-5780e68573a8	00030000-565f-11a4-7f05-1f5991d57f9f
00020000-565f-11a6-aa9c-003f5dba4a17	00030000-565f-11a4-0dc4-4f861a4afbff
00020000-565f-11a6-d468-8fcfd02686c4	00030000-565f-11a4-9af3-54256dc0e7a1
00020000-565f-11a6-b93b-19e1ae90eb14	00030000-565f-11a4-5f6f-27bf5b17c4bb
00020000-565f-11a6-ab10-5431896b7d74	00030000-565f-11a4-6b5f-909e88584498
00020000-565f-11a6-562b-47bcda0a0b2e	00030000-565f-11a4-6c88-3d7cd1356630
00020000-565f-11a6-2bd6-c6906c925667	00030000-565f-11a4-7078-62ea8c2207c1
00020000-565f-11a6-525d-c0a9e0d5895f	00030000-565f-11a4-a7fa-edc600564feb
00020000-565f-11a6-56ca-6008e104fa3e	00030000-565f-11a4-b9e9-90291ec52ae2
00020000-565f-11a6-bb52-63b1904071a1	00030000-565f-11a4-46d8-be678da4b6d1
00020000-565f-11a6-64af-35c37668922a	00030000-565f-11a4-73f0-98d8b22a085a
00020000-565f-11a6-411c-179a7353132e	00030000-565f-11a4-653b-9769f74a3428
00020000-565f-11a6-e91d-514a3f1184e7	00030000-565f-11a4-64b0-6871f2b51cb9
00020000-565f-11a6-73c8-dc7c33cfd792	00030000-565f-11a4-c22b-c0fc6a618e6f
00020000-565f-11a6-9433-54a55022d484	00030000-565f-11a4-fb14-79e28c9665b3
00020000-565f-11a6-2011-c050f47eeedb	00030000-565f-11a4-dc97-8f5617c6bea9
00020000-565f-11a6-fa84-871533b3a794	00030000-565f-11a4-5a6e-9b36a4f9baab
00020000-565f-11a6-d201-bce2603637ee	00030000-565f-11a4-3a5f-01389ed6b7e8
00020000-565f-11a6-d201-bce2603637ee	00030000-565f-11a4-debb-6fca60cad0c7
00020000-565f-11a6-d201-bce2603637ee	00030000-565f-11a4-9af3-54256dc0e7a1
\.


--
-- TOC entry 3141 (class 0 OID 30684369)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30684403)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30684540)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-565f-11a6-a5fd-2e41e2d8509f	00090000-565f-11a6-e89c-677ad5e6d68a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-565f-11a6-69bb-db6af2b51ada	00090000-565f-11a6-ca14-0d00dcf12d51	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-565f-11a6-d019-1652244da957	00090000-565f-11a6-ac51-3c59fb2c08f2	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-565f-11a6-08d5-1e069a822c97	00090000-565f-11a6-daaf-f0a325a93b3b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30684061)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-565f-11a6-3189-68c7e6dd3ed7	\N	00040000-565f-11a4-a82e-6b682b661525	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-0d05-6738900bb5ec	\N	00040000-565f-11a4-a82e-6b682b661525	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-565f-11a6-bc30-99431fd1178a	\N	00040000-565f-11a4-a82e-6b682b661525	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-be0e-bb41f0eb1dc9	\N	00040000-565f-11a4-a82e-6b682b661525	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-b106-39f175170036	\N	00040000-565f-11a4-a82e-6b682b661525	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-3744-97ec1cb7ea0e	\N	00040000-565f-11a4-4e2d-43011678cd26	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-87fb-1e01b806ee62	\N	00040000-565f-11a4-b378-25294ff556c5	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-f51d-b0237a7895da	\N	00040000-565f-11a4-4d17-6a776df4b48d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a6-da07-182168fb5c84	\N	00040000-565f-11a4-342f-f7edc5f43cdc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565f-11a8-cbaf-534bb7e203d7	\N	00040000-565f-11a4-a82e-6b682b661525	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30684106)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-565f-11a3-4fa5-604926a92467	8341	Adlešiči
00050000-565f-11a3-d431-edc00bc75fc7	5270	Ajdovščina
00050000-565f-11a3-a4cb-ef6e185737ed	6280	Ankaran/Ancarano
00050000-565f-11a3-5964-c5f6de31a5f1	9253	Apače
00050000-565f-11a3-e48d-b5fefa244949	8253	Artiče
00050000-565f-11a3-7596-b7cc50fd8c64	4275	Begunje na Gorenjskem
00050000-565f-11a3-b903-a29b7432117d	1382	Begunje pri Cerknici
00050000-565f-11a3-d639-0b1b22a8205b	9231	Beltinci
00050000-565f-11a3-0dad-d06d64c1e045	2234	Benedikt
00050000-565f-11a3-9637-2bc7a0b4d52f	2345	Bistrica ob Dravi
00050000-565f-11a3-001a-576329a0cc81	3256	Bistrica ob Sotli
00050000-565f-11a3-e2f0-351021ef2fb4	8259	Bizeljsko
00050000-565f-11a3-00a9-fd24db3dd689	1223	Blagovica
00050000-565f-11a3-5d93-ac6f1dd15c7d	8283	Blanca
00050000-565f-11a3-6274-0d173235b368	4260	Bled
00050000-565f-11a3-5aa5-82cde7bb8571	4273	Blejska Dobrava
00050000-565f-11a3-5512-23b11b12f74d	9265	Bodonci
00050000-565f-11a3-233d-2a0b1c93c38f	9222	Bogojina
00050000-565f-11a3-2e7f-6484a1f0471d	4263	Bohinjska Bela
00050000-565f-11a3-6dd8-9bc98becfe99	4264	Bohinjska Bistrica
00050000-565f-11a3-06dc-f53a121b8bae	4265	Bohinjsko jezero
00050000-565f-11a3-660e-1368271a466a	1353	Borovnica
00050000-565f-11a3-6f88-8976f3105da5	8294	Boštanj
00050000-565f-11a3-700d-e356341b015e	5230	Bovec
00050000-565f-11a3-5fb5-0ba641837309	5295	Branik
00050000-565f-11a3-be37-81bb919d820e	3314	Braslovče
00050000-565f-11a3-243b-64790f822efd	5223	Breginj
00050000-565f-11a3-8c85-a9cb3bdce53a	8280	Brestanica
00050000-565f-11a3-93d7-2d5cd692ee59	2354	Bresternica
00050000-565f-11a3-521f-d985f517af18	4243	Brezje
00050000-565f-11a3-6a2f-7fd8a2c0b48a	1351	Brezovica pri Ljubljani
00050000-565f-11a3-c67a-20087d5f3496	8250	Brežice
00050000-565f-11a3-5699-8472df3afa4d	4210	Brnik - Aerodrom
00050000-565f-11a3-60eb-a0a52e10e799	8321	Brusnice
00050000-565f-11a3-c59d-c9b4a4a5b2ed	3255	Buče
00050000-565f-11a3-f1d3-017b194198c5	8276	Bučka 
00050000-565f-11a3-baea-79715c2803f0	9261	Cankova
00050000-565f-11a3-4cc5-ca4d95067e4d	3000	Celje 
00050000-565f-11a3-0698-55bb37c54679	3001	Celje - poštni predali
00050000-565f-11a3-d530-60efd1b06ec2	4207	Cerklje na Gorenjskem
00050000-565f-11a3-0ad8-089ada2f2efa	8263	Cerklje ob Krki
00050000-565f-11a3-90f2-d8144044129a	1380	Cerknica
00050000-565f-11a3-c1bf-0aaceb146540	5282	Cerkno
00050000-565f-11a3-1d1b-c7e822ccbc3a	2236	Cerkvenjak
00050000-565f-11a3-4f71-9cbf9c75593a	2215	Ceršak
00050000-565f-11a3-f212-6882f8288370	2326	Cirkovce
00050000-565f-11a3-d27b-806c97f9668e	2282	Cirkulane
00050000-565f-11a3-744d-9ade2221a61b	5273	Col
00050000-565f-11a3-9ea9-880205c6390a	8251	Čatež ob Savi
00050000-565f-11a3-a738-96d917a993f4	1413	Čemšenik
00050000-565f-11a3-beb9-feb816b0c258	5253	Čepovan
00050000-565f-11a3-c6b5-6c1070c9d6be	9232	Črenšovci
00050000-565f-11a3-f1f6-941b96e92162	2393	Črna na Koroškem
00050000-565f-11a3-fc66-75d407206283	6275	Črni Kal
00050000-565f-11a3-6dc4-33ac4c905223	5274	Črni Vrh nad Idrijo
00050000-565f-11a3-ff1f-500b2a41286c	5262	Črniče
00050000-565f-11a3-a779-83552ae5cb8e	8340	Črnomelj
00050000-565f-11a3-ca4f-04a4f20468cf	6271	Dekani
00050000-565f-11a3-9bb6-a542aa88d450	5210	Deskle
00050000-565f-11a3-5a96-bcbb39fe4090	2253	Destrnik
00050000-565f-11a3-2a99-f069c581654b	6215	Divača
00050000-565f-11a3-c277-877ae750aee8	1233	Dob
00050000-565f-11a3-f400-23adb1abf221	3224	Dobje pri Planini
00050000-565f-11a3-81ec-083edb1c45a6	8257	Dobova
00050000-565f-11a3-2443-ea1b7cbf683f	1423	Dobovec
00050000-565f-11a3-89af-ffcec18f58bf	5263	Dobravlje
00050000-565f-11a3-e01a-d129187ec73a	3204	Dobrna
00050000-565f-11a3-c7b0-c203c2150136	8211	Dobrnič
00050000-565f-11a3-adc0-d3b38a9ae989	1356	Dobrova
00050000-565f-11a3-623a-362df3e72cde	9223	Dobrovnik/Dobronak 
00050000-565f-11a3-ea22-473cc7e35ac5	5212	Dobrovo v Brdih
00050000-565f-11a3-acd5-0010c220e737	1431	Dol pri Hrastniku
00050000-565f-11a3-438a-20673550f090	1262	Dol pri Ljubljani
00050000-565f-11a3-08d6-919f2a2d6c9f	1273	Dole pri Litiji
00050000-565f-11a3-c1b5-0de30412be02	1331	Dolenja vas
00050000-565f-11a3-c78e-3e01ea108062	8350	Dolenjske Toplice
00050000-565f-11a3-6af7-54c145350939	1230	Domžale
00050000-565f-11a3-b27b-b84ef0c57627	2252	Dornava
00050000-565f-11a3-cda4-6fae38f195ce	5294	Dornberk
00050000-565f-11a3-581c-1a1b85dfbb89	1319	Draga
00050000-565f-11a3-f0bf-fc4871a1f768	8343	Dragatuš
00050000-565f-11a3-1263-e999a3b686c3	3222	Dramlje
00050000-565f-11a3-65b4-a59894bc251c	2370	Dravograd
00050000-565f-11a3-0857-34a513c2aaf0	4203	Duplje
00050000-565f-11a3-1b77-374f764f16d1	6221	Dutovlje
00050000-565f-11a3-866a-08b1d79a8e02	8361	Dvor
00050000-565f-11a3-3405-cc01bebc77ab	2343	Fala
00050000-565f-11a3-93b0-5d088cde848c	9208	Fokovci
00050000-565f-11a3-8bb7-fd3646166eb2	2313	Fram
00050000-565f-11a3-da26-2bb72daf2ec0	3213	Frankolovo
00050000-565f-11a3-5ba6-c19d35e041e9	1274	Gabrovka
00050000-565f-11a3-faa4-4772bb43fef7	8254	Globoko
00050000-565f-11a3-2b54-59f7b3cc88c1	5275	Godovič
00050000-565f-11a3-cd41-a8eb605d2888	4204	Golnik
00050000-565f-11a3-506e-208415071a97	3303	Gomilsko
00050000-565f-11a3-351e-7b6038f51744	4224	Gorenja vas
00050000-565f-11a3-335b-3777e84a0f6c	3263	Gorica pri Slivnici
00050000-565f-11a3-d2fc-8f3cf8cc8e14	2272	Gorišnica
00050000-565f-11a3-d719-6193aae2e0d4	9250	Gornja Radgona
00050000-565f-11a3-a7df-3f542b49c955	3342	Gornji Grad
00050000-565f-11a3-be71-98bb2943026e	4282	Gozd Martuljek
00050000-565f-11a3-1a95-73d167cc8364	6272	Gračišče
00050000-565f-11a3-daff-1ef52fcfe96d	9264	Grad
00050000-565f-11a3-0d74-9f3f022770f9	8332	Gradac
00050000-565f-11a3-d5ac-109438578edc	1384	Grahovo
00050000-565f-11a3-42fb-c432972f4448	5242	Grahovo ob Bači
00050000-565f-11a3-d379-9c9d75dd1ea0	5251	Grgar
00050000-565f-11a3-b241-73a0e12433e9	3302	Griže
00050000-565f-11a3-5ae4-7e610eb842e1	3231	Grobelno
00050000-565f-11a3-0d55-58891320a1e2	1290	Grosuplje
00050000-565f-11a3-3f7a-291bc36e71af	2288	Hajdina
00050000-565f-11a3-e504-245cf87cf699	8362	Hinje
00050000-565f-11a3-6176-2dfbc58482ce	2311	Hoče
00050000-565f-11a3-9da7-000f07517227	9205	Hodoš/Hodos
00050000-565f-11a3-f64f-97ee3621c850	1354	Horjul
00050000-565f-11a3-7baa-2ff9b6b68174	1372	Hotedršica
00050000-565f-11a3-862b-99d38421d312	1430	Hrastnik
00050000-565f-11a3-2ab5-6b624313630f	6225	Hruševje
00050000-565f-11a3-d675-965fd3e455f6	4276	Hrušica
00050000-565f-11a3-4990-30b806ab409c	5280	Idrija
00050000-565f-11a3-9e79-64fdf8ac9bab	1292	Ig
00050000-565f-11a3-3998-f76f4799f547	6250	Ilirska Bistrica
00050000-565f-11a3-2994-70235e8e490a	6251	Ilirska Bistrica-Trnovo
00050000-565f-11a3-9674-eac37b7daaa0	1295	Ivančna Gorica
00050000-565f-11a3-c221-7685f0653a6b	2259	Ivanjkovci
00050000-565f-11a3-4fbe-5978451dc9fe	1411	Izlake
00050000-565f-11a3-4ad5-30e8ebcc6437	6310	Izola/Isola
00050000-565f-11a3-00f1-7123eef7d443	2222	Jakobski Dol
00050000-565f-11a3-5d45-cca151d9d90f	2221	Jarenina
00050000-565f-11a3-f6c6-ae3c80a1eb5f	6254	Jelšane
00050000-565f-11a3-1949-ab484e3e178c	4270	Jesenice
00050000-565f-11a3-b692-eebe926051c2	8261	Jesenice na Dolenjskem
00050000-565f-11a3-f394-612ef0bc63a8	3273	Jurklošter
00050000-565f-11a3-4fc1-85d098fa3ca1	2223	Jurovski Dol
00050000-565f-11a3-ee74-0b85f0bff40d	2256	Juršinci
00050000-565f-11a3-5d63-84faf190a44e	5214	Kal nad Kanalom
00050000-565f-11a3-148a-92d2fdfdbd9a	3233	Kalobje
00050000-565f-11a3-e6a1-6a42e074b355	4246	Kamna Gorica
00050000-565f-11a3-dd6f-0dcaf97b19d0	2351	Kamnica
00050000-565f-11a3-14b9-38b5227ba569	1241	Kamnik
00050000-565f-11a3-9326-84f7e7f50821	5213	Kanal
00050000-565f-11a3-e957-9e8017eed5a2	8258	Kapele
00050000-565f-11a3-8edd-f999395678b7	2362	Kapla
00050000-565f-11a3-62ad-9ee52978801b	2325	Kidričevo
00050000-565f-11a3-02b9-232e60fa8c49	1412	Kisovec
00050000-565f-11a3-3679-a2183ed8e7cf	6253	Knežak
00050000-565f-11a3-364d-6dee600f8fe8	5222	Kobarid
00050000-565f-11a3-a100-3226d73b541e	9227	Kobilje
00050000-565f-11a3-8d89-43696ed07b64	1330	Kočevje
00050000-565f-11a3-1cb7-fd82b075fc0e	1338	Kočevska Reka
00050000-565f-11a3-beb3-7438307bb412	2276	Kog
00050000-565f-11a3-61c6-f2f5dd801cff	5211	Kojsko
00050000-565f-11a3-61cc-88ddd7ec4d78	6223	Komen
00050000-565f-11a3-557a-70fba2b921fb	1218	Komenda
00050000-565f-11a3-6e28-e80673ff0e00	6000	Koper/Capodistria 
00050000-565f-11a3-058d-82d65ccaebd6	6001	Koper/Capodistria - poštni predali
00050000-565f-11a3-4e5c-5dd9c2b945d0	8282	Koprivnica
00050000-565f-11a3-9b5c-a3c0984b09bf	5296	Kostanjevica na Krasu
00050000-565f-11a3-5d9b-90e4074643c1	8311	Kostanjevica na Krki
00050000-565f-11a3-5f4b-fab54659a679	1336	Kostel
00050000-565f-11a3-495b-c466846277a0	6256	Košana
00050000-565f-11a3-a950-68e1432409a3	2394	Kotlje
00050000-565f-11a3-f395-6e88dbac892e	6240	Kozina
00050000-565f-11a3-f9b6-0c57330ae20f	3260	Kozje
00050000-565f-11a3-e64c-4d7cf956068c	4000	Kranj 
00050000-565f-11a3-61b1-ba02487f0336	4001	Kranj - poštni predali
00050000-565f-11a3-75c3-8342c331aba8	4280	Kranjska Gora
00050000-565f-11a3-aa92-3a3cb59a2c35	1281	Kresnice
00050000-565f-11a3-25ab-0877be247a04	4294	Križe
00050000-565f-11a3-b68d-47b56c902c02	9206	Križevci
00050000-565f-11a3-ef26-3dac7785b4ef	9242	Križevci pri Ljutomeru
00050000-565f-11a3-5dae-b080ad368cad	1301	Krka
00050000-565f-11a3-1d68-1c67d41d96c5	8296	Krmelj
00050000-565f-11a3-92c5-cb0b2e491349	4245	Kropa
00050000-565f-11a3-4b2a-b2c2af83ca80	8262	Krška vas
00050000-565f-11a3-5c68-d03862501dfa	8270	Krško
00050000-565f-11a3-a24e-12ee97f8328b	9263	Kuzma
00050000-565f-11a3-50c6-facc2c731509	2318	Laporje
00050000-565f-11a3-5531-00da08d4ed0b	3270	Laško
00050000-565f-11a3-a386-5ca6ab30bb72	1219	Laze v Tuhinju
00050000-565f-11a3-86eb-4795828b72b6	2230	Lenart v Slovenskih goricah
00050000-565f-11a3-377d-c112d83a03e2	9220	Lendava/Lendva
00050000-565f-11a3-7c7a-dd72af3fb878	4248	Lesce
00050000-565f-11a3-3b41-f7a44c8ba9af	3261	Lesično
00050000-565f-11a3-6ad6-a4f28197f5c6	8273	Leskovec pri Krškem
00050000-565f-11a3-9422-41965c5aa2d4	2372	Libeliče
00050000-565f-11a3-22ba-7b8af4d43f81	2341	Limbuš
00050000-565f-11a3-7e90-6008d8891306	1270	Litija
00050000-565f-11a3-b104-a28d88424b0c	3202	Ljubečna
00050000-565f-11a3-33b4-012210deaa0b	1000	Ljubljana 
00050000-565f-11a3-8b61-f5e708001156	1001	Ljubljana - poštni predali
00050000-565f-11a3-323e-020244266a57	1231	Ljubljana - Črnuče
00050000-565f-11a3-74c2-8849d374a8c7	1261	Ljubljana - Dobrunje
00050000-565f-11a3-edda-629352f59c52	1260	Ljubljana - Polje
00050000-565f-11a3-0071-c9cd919f1078	1210	Ljubljana - Šentvid
00050000-565f-11a3-7573-822ee21efc40	1211	Ljubljana - Šmartno
00050000-565f-11a3-b3bb-7b7d79b079cc	3333	Ljubno ob Savinji
00050000-565f-11a3-8db0-de6c29e8dfc6	9240	Ljutomer
00050000-565f-11a3-b101-3e16d387af83	3215	Loče
00050000-565f-11a3-e105-879608d87180	5231	Log pod Mangartom
00050000-565f-11a3-b88b-3e4a9bb2d467	1358	Log pri Brezovici
00050000-565f-11a3-dcb5-d2e25ee1ebc8	1370	Logatec
00050000-565f-11a3-78bf-c0cdd8c59e22	1371	Logatec
00050000-565f-11a3-3bda-a471ebaf212b	1434	Loka pri Zidanem Mostu
00050000-565f-11a3-4903-dc445f51c5e0	3223	Loka pri Žusmu
00050000-565f-11a3-0d65-13032c1724ac	6219	Lokev
00050000-565f-11a3-9e3a-f8535f3c5167	1318	Loški Potok
00050000-565f-11a3-e568-3189381a0dd1	2324	Lovrenc na Dravskem polju
00050000-565f-11a3-1f37-9e9f70c29e63	2344	Lovrenc na Pohorju
00050000-565f-11a3-a751-639884ad8ca6	3334	Luče
00050000-565f-11a3-4bf9-e822c982775c	1225	Lukovica
00050000-565f-11a3-107d-2b5766724e76	9202	Mačkovci
00050000-565f-11a3-df4c-b4dec56636c9	2322	Majšperk
00050000-565f-11a3-fcc0-f21ae326331c	2321	Makole
00050000-565f-11a3-c20c-d8eaad8cb65a	9243	Mala Nedelja
00050000-565f-11a3-eb4a-0914cab23362	2229	Malečnik
00050000-565f-11a3-6039-18152a6a5544	6273	Marezige
00050000-565f-11a3-a5f5-333c1bbe3d56	2000	Maribor 
00050000-565f-11a3-4784-f01840893801	2001	Maribor - poštni predali
00050000-565f-11a3-f436-6407399f7e59	2206	Marjeta na Dravskem polju
00050000-565f-11a3-f812-b88a5584d002	2281	Markovci
00050000-565f-11a3-b83c-6be41f9b585a	9221	Martjanci
00050000-565f-11a3-fe3c-5cecca491663	6242	Materija
00050000-565f-11a3-25a7-c98be9d9d0c8	4211	Mavčiče
00050000-565f-11a3-18f2-2c03c6af66d4	1215	Medvode
00050000-565f-11a3-1a8e-c0e0b15cf539	1234	Mengeš
00050000-565f-11a3-7fbf-d9984797639f	8330	Metlika
00050000-565f-11a3-1463-43b65cb27863	2392	Mežica
00050000-565f-11a3-0414-86c0ab1fa888	2204	Miklavž na Dravskem polju
00050000-565f-11a3-8681-dd7d91b7fb67	2275	Miklavž pri Ormožu
00050000-565f-11a3-3c4d-ea963b2f2675	5291	Miren
00050000-565f-11a3-3821-c1f10e5a8036	8233	Mirna
00050000-565f-11a3-186e-ace5d5256762	8216	Mirna Peč
00050000-565f-11a3-b891-a8fc155a96aa	2382	Mislinja
00050000-565f-11a3-8c09-e2956fd0aab6	4281	Mojstrana
00050000-565f-11a3-7d73-f00514d09f7c	8230	Mokronog
00050000-565f-11a3-5e62-9ae7784d140e	1251	Moravče
00050000-565f-11a3-dbae-0840e1af5a70	9226	Moravske Toplice
00050000-565f-11a3-2913-83c41a2e54fc	5216	Most na Soči
00050000-565f-11a3-5d18-dae42caf99fb	1221	Motnik
00050000-565f-11a3-8fc6-1ff19c90412b	3330	Mozirje
00050000-565f-11a3-9d6e-44a536bf2c3d	9000	Murska Sobota 
00050000-565f-11a3-88e2-6e70281e540f	9001	Murska Sobota - poštni predali
00050000-565f-11a3-e733-8a9f65f5a433	2366	Muta
00050000-565f-11a3-c0fd-77f0c6bc9d9b	4202	Naklo
00050000-565f-11a3-787d-e6b1bb0db470	3331	Nazarje
00050000-565f-11a3-8e11-5ebcc68aa9fb	1357	Notranje Gorice
00050000-565f-11a3-194f-fb3955498348	3203	Nova Cerkev
00050000-565f-11a3-f281-65a0af14e565	5000	Nova Gorica 
00050000-565f-11a3-b531-55ab8a275b95	5001	Nova Gorica - poštni predali
00050000-565f-11a3-7d31-108123d9dc38	1385	Nova vas
00050000-565f-11a3-1760-ee0bd21c027d	8000	Novo mesto
00050000-565f-11a3-14ba-c47d2928fc7f	8001	Novo mesto - poštni predali
00050000-565f-11a3-7fd5-7cd430eebebd	6243	Obrov
00050000-565f-11a3-2408-c6b399a090f0	9233	Odranci
00050000-565f-11a3-ceb2-b74af90dee47	2317	Oplotnica
00050000-565f-11a3-5b63-b684314846c5	2312	Orehova vas
00050000-565f-11a3-66b3-9ead1a4d4d5a	2270	Ormož
00050000-565f-11a3-ac55-5c310ceb885b	1316	Ortnek
00050000-565f-11a3-3c33-c749a4b6b72b	1337	Osilnica
00050000-565f-11a3-aa5b-a1ff22cfa75b	8222	Otočec
00050000-565f-11a3-5b8c-d17673d35ad6	2361	Ožbalt
00050000-565f-11a3-4455-c5c56745d7dd	2231	Pernica
00050000-565f-11a3-9eb9-8a6f43c0353e	2211	Pesnica pri Mariboru
00050000-565f-11a3-3662-683025398b87	9203	Petrovci
00050000-565f-11a3-43a5-ef420f093d61	3301	Petrovče
00050000-565f-11a3-f91c-deca4a4ef3a9	6330	Piran/Pirano
00050000-565f-11a3-ddbe-3c12513271f6	8255	Pišece
00050000-565f-11a3-2d58-25bd284fb4b1	6257	Pivka
00050000-565f-11a3-6b29-b034df9dac70	6232	Planina
00050000-565f-11a3-8e4d-cb76f6a4edd4	3225	Planina pri Sevnici
00050000-565f-11a3-0c25-0194ee2ff569	6276	Pobegi
00050000-565f-11a3-34c0-f8de97a9153f	8312	Podbočje
00050000-565f-11a3-c65b-c6fa9d4a7d83	5243	Podbrdo
00050000-565f-11a3-553c-27f44f2b265a	3254	Podčetrtek
00050000-565f-11a3-deaf-c3e2828f4b62	2273	Podgorci
00050000-565f-11a3-18d1-0261baaeecf5	6216	Podgorje
00050000-565f-11a3-b984-7f3b236ed9ef	2381	Podgorje pri Slovenj Gradcu
00050000-565f-11a3-bf71-7d3546e792d4	6244	Podgrad
00050000-565f-11a3-224f-e1d27b32e8e7	1414	Podkum
00050000-565f-11a3-87ee-d9355044d44a	2286	Podlehnik
00050000-565f-11a3-03bc-9e170fb45e0a	5272	Podnanos
00050000-565f-11a3-5d9d-5887bd66c4ed	4244	Podnart
00050000-565f-11a3-912b-6a53031e702a	3241	Podplat
00050000-565f-11a3-412c-4ada9dd2f4d4	3257	Podsreda
00050000-565f-11a3-f4b0-44b57fe0971a	2363	Podvelka
00050000-565f-11a3-7133-ea03df5842a6	2208	Pohorje
00050000-565f-11a3-bdb9-19a4c131cbf7	2257	Polenšak
00050000-565f-11a3-7426-483c12ed7d82	1355	Polhov Gradec
00050000-565f-11a3-b6ff-940be9e05c39	4223	Poljane nad Škofjo Loko
00050000-565f-11a3-4676-a5cf563d62af	2319	Poljčane
00050000-565f-11a3-c10f-bbcc763b270f	1272	Polšnik
00050000-565f-11a3-5201-124739862779	3313	Polzela
00050000-565f-11a3-a849-50b0066fb01d	3232	Ponikva
00050000-565f-11a3-339b-52723b13ee21	6320	Portorož/Portorose
00050000-565f-11a3-5af3-ff1c179bcd5f	6230	Postojna
00050000-565f-11a3-c51d-e174dd44000b	2331	Pragersko
00050000-565f-11a3-1096-e8417dd36094	3312	Prebold
00050000-565f-11a3-44c3-ae1acd33ea5f	4205	Preddvor
00050000-565f-11a3-0b03-623c139b4e43	6255	Prem
00050000-565f-11a3-1cc5-6bf68e051c03	1352	Preserje
00050000-565f-11a3-b026-430ad8292cbd	6258	Prestranek
00050000-565f-11a3-5fe6-eeb7a3dda57a	2391	Prevalje
00050000-565f-11a3-2fd3-0770fe43954b	3262	Prevorje
00050000-565f-11a3-80ca-924075bbbd2e	1276	Primskovo 
00050000-565f-11a3-8e3d-3a54b71a993b	3253	Pristava pri Mestinju
00050000-565f-11a3-f71e-a2f988f8169e	9207	Prosenjakovci/Partosfalva
00050000-565f-11a3-e569-f49fe475a794	5297	Prvačina
00050000-565f-11a3-c5f2-c122fb6eac5f	2250	Ptuj
00050000-565f-11a3-e420-f6ecc1c08600	2323	Ptujska Gora
00050000-565f-11a3-361c-73b88ec9fcd3	9201	Puconci
00050000-565f-11a3-3f3d-f3ef50a043bf	2327	Rače
00050000-565f-11a3-53bf-31a1aefd899b	1433	Radeče
00050000-565f-11a3-90c9-a93ebc9be08b	9252	Radenci
00050000-565f-11a3-edb3-90b16142a4a0	2360	Radlje ob Dravi
00050000-565f-11a3-4960-a7a3d1720d26	1235	Radomlje
00050000-565f-11a3-0aba-1711b5beeb30	4240	Radovljica
00050000-565f-11a3-dd06-5ab903ec9a32	8274	Raka
00050000-565f-11a3-4b8d-530b103bac90	1381	Rakek
00050000-565f-11a3-f39d-353263665e54	4283	Rateče - Planica
00050000-565f-11a3-e8a1-24b464cd4352	2390	Ravne na Koroškem
00050000-565f-11a3-729b-2283bcfc4bfd	9246	Razkrižje
00050000-565f-11a3-ca2b-573d0f525005	3332	Rečica ob Savinji
00050000-565f-11a3-8dc4-68984e389209	5292	Renče
00050000-565f-11a3-8c2e-c2360f83386f	1310	Ribnica
00050000-565f-11a3-cb6b-bbd6a485cfc4	2364	Ribnica na Pohorju
00050000-565f-11a3-64bb-539956fe9f01	3272	Rimske Toplice
00050000-565f-11a3-390a-1fc9d4015046	1314	Rob
00050000-565f-11a3-f5be-5c52cf3c0f23	5215	Ročinj
00050000-565f-11a3-1fbe-b66e1320b137	3250	Rogaška Slatina
00050000-565f-11a3-d8f7-6e170a74c1ba	9262	Rogašovci
00050000-565f-11a3-514c-cec0e7a8e7e1	3252	Rogatec
00050000-565f-11a3-2c72-62f71e32b1af	1373	Rovte
00050000-565f-11a3-0551-b4466ca677f7	2342	Ruše
00050000-565f-11a3-17b7-a9923a6ac04b	1282	Sava
00050000-565f-11a3-af21-23a06a7732bd	6333	Sečovlje/Sicciole
00050000-565f-11a3-288b-6948217020d0	4227	Selca
00050000-565f-11a3-9162-0f3599422cb7	2352	Selnica ob Dravi
00050000-565f-11a3-c28f-c42f9ce75f6a	8333	Semič
00050000-565f-11a3-b6a3-74edb8d7da8a	8281	Senovo
00050000-565f-11a3-a1d7-0200078e2906	6224	Senožeče
00050000-565f-11a3-54b3-25e4b9133988	8290	Sevnica
00050000-565f-11a3-0dca-e8f90c981a6a	6210	Sežana
00050000-565f-11a3-86cc-6f10b1553d97	2214	Sladki Vrh
00050000-565f-11a3-ce21-bb7b2fb2497e	5283	Slap ob Idrijci
00050000-565f-11a3-98e6-09f85e25f0ff	2380	Slovenj Gradec
00050000-565f-11a3-21de-749da0598563	2310	Slovenska Bistrica
00050000-565f-11a3-f0d3-02cde4015873	3210	Slovenske Konjice
00050000-565f-11a3-7106-e8f54329a124	1216	Smlednik
00050000-565f-11a3-4216-4c0818a63073	5232	Soča
00050000-565f-11a3-bdff-0eb6b31bd783	1317	Sodražica
00050000-565f-11a3-1605-72db4c537ffa	3335	Solčava
00050000-565f-11a3-503f-708b77827902	5250	Solkan
00050000-565f-11a3-aaec-22275cc94ab5	4229	Sorica
00050000-565f-11a3-745c-cf8de821edfe	4225	Sovodenj
00050000-565f-11a3-f52e-4b4db4778bd5	5281	Spodnja Idrija
00050000-565f-11a3-bbb8-89b1ac9840fc	2241	Spodnji Duplek
00050000-565f-11a3-846c-74fff5b655bc	9245	Spodnji Ivanjci
00050000-565f-11a3-d19c-fda649879010	2277	Središče ob Dravi
00050000-565f-11a3-5eb8-e3a214c673c9	4267	Srednja vas v Bohinju
00050000-565f-11a3-b830-7be8b5c29020	8256	Sromlje 
00050000-565f-11a3-d7e0-93e07e666d09	5224	Srpenica
00050000-565f-11a3-4db3-6663d92b9c04	1242	Stahovica
00050000-565f-11a3-cd90-8183f6916401	1332	Stara Cerkev
00050000-565f-11a3-8806-ef87f9291a79	8342	Stari trg ob Kolpi
00050000-565f-11a3-38e5-9b9154eec526	1386	Stari trg pri Ložu
00050000-565f-11a3-08e1-ae98649c1525	2205	Starše
00050000-565f-11a3-0455-551de6342254	2289	Stoperce
00050000-565f-11a3-3689-8f8226482816	8322	Stopiče
00050000-565f-11a3-1dd9-2cd99da99a66	3206	Stranice
00050000-565f-11a3-0e20-dd1fc4d60384	8351	Straža
00050000-565f-11a3-03a7-0b1bf5303ea9	1313	Struge
00050000-565f-11a3-b211-46566fffc16a	8293	Studenec
00050000-565f-11a3-6afb-e0b8786a13c7	8331	Suhor
00050000-565f-11a3-7a2c-ddd411f479ec	2233	Sv. Ana v Slovenskih goricah
00050000-565f-11a3-12d1-7d7e82ab11b1	2235	Sv. Trojica v Slovenskih goricah
00050000-565f-11a3-03f0-c835c6c09899	2353	Sveti Duh na Ostrem Vrhu
00050000-565f-11a3-7227-915e9d2b326e	9244	Sveti Jurij ob Ščavnici
00050000-565f-11a3-a4fd-60b9cc5d1231	3264	Sveti Štefan
00050000-565f-11a3-f718-0b67fec9b518	2258	Sveti Tomaž
00050000-565f-11a3-2131-7c6b49420c66	9204	Šalovci
00050000-565f-11a3-eaf3-dfd98c69e1f0	5261	Šempas
00050000-565f-11a3-b71a-a1f1f266edcf	5290	Šempeter pri Gorici
00050000-565f-11a3-05cf-6a4b3c6f9276	3311	Šempeter v Savinjski dolini
00050000-565f-11a3-e0d1-9d65823b9757	4208	Šenčur
00050000-565f-11a3-6b18-afcafe91deb3	2212	Šentilj v Slovenskih goricah
00050000-565f-11a3-13ec-6d1ac375cb99	8297	Šentjanž
00050000-565f-11a3-9346-e11ba60791d9	2373	Šentjanž pri Dravogradu
00050000-565f-11a3-a137-e2f6c812a39a	8310	Šentjernej
00050000-565f-11a3-eb00-0a9a700f47d6	3230	Šentjur
00050000-565f-11a3-432d-a66bbdcafaf3	3271	Šentrupert
00050000-565f-11a3-97ca-0c5438e92493	8232	Šentrupert
00050000-565f-11a3-3575-fff9b72862e0	1296	Šentvid pri Stični
00050000-565f-11a3-8f03-713e21585b2a	8275	Škocjan
00050000-565f-11a3-2364-879150bfab8d	6281	Škofije
00050000-565f-11a3-fbb5-d3ea0d5b3448	4220	Škofja Loka
00050000-565f-11a3-73e0-f283aa50a16c	3211	Škofja vas
00050000-565f-11a3-5944-93eb1f619eda	1291	Škofljica
00050000-565f-11a3-215b-26af5fa35014	6274	Šmarje
00050000-565f-11a3-1335-f23205b92897	1293	Šmarje - Sap
00050000-565f-11a3-0e12-6d23d2606369	3240	Šmarje pri Jelšah
00050000-565f-11a3-cf94-44b8d7edc306	8220	Šmarješke Toplice
00050000-565f-11a3-731c-1a05b045a5ca	2315	Šmartno na Pohorju
00050000-565f-11a3-85e9-10d341886bdd	3341	Šmartno ob Dreti
00050000-565f-11a3-1e75-34eac99b52e3	3327	Šmartno ob Paki
00050000-565f-11a3-d4e0-701410418cee	1275	Šmartno pri Litiji
00050000-565f-11a3-337d-db0ffe5bb38f	2383	Šmartno pri Slovenj Gradcu
00050000-565f-11a3-c552-36d671c19289	3201	Šmartno v Rožni dolini
00050000-565f-11a3-665f-8ce23c702b5b	3325	Šoštanj
00050000-565f-11a3-fb99-3adafc2b5cb9	6222	Štanjel
00050000-565f-11a3-599c-a9064225debd	3220	Štore
00050000-565f-11a3-7d41-bbc1b7782cd1	3304	Tabor
00050000-565f-11a3-d275-73466823b00d	3221	Teharje
00050000-565f-11a3-4288-cc06e2327189	9251	Tišina
00050000-565f-11a3-e449-7db236c7f6c0	5220	Tolmin
00050000-565f-11a3-1d8f-b6b247f0aa96	3326	Topolšica
00050000-565f-11a3-6569-d4d3fcd17cc5	2371	Trbonje
00050000-565f-11a3-b7fa-ab184bd4a341	1420	Trbovlje
00050000-565f-11a3-5ff8-52d759c7e2b3	8231	Trebelno 
00050000-565f-11a3-5326-29a8dc872b33	8210	Trebnje
00050000-565f-11a3-685f-5015ce90913d	5252	Trnovo pri Gorici
00050000-565f-11a3-be2c-6d7ea3286155	2254	Trnovska vas
00050000-565f-11a3-cfcd-2d20d7f88556	1222	Trojane
00050000-565f-11a3-eec7-419dd8106e3c	1236	Trzin
00050000-565f-11a3-984f-7b163d9d0503	4290	Tržič
00050000-565f-11a3-0974-e899b7a0d42e	8295	Tržišče
00050000-565f-11a3-17f2-f3a815b9b0bd	1311	Turjak
00050000-565f-11a3-7906-fb9ef143c159	9224	Turnišče
00050000-565f-11a3-e7c1-18b742c3a84c	8323	Uršna sela
00050000-565f-11a3-7316-ddfb04251511	1252	Vače
00050000-565f-11a3-9fcd-9f9364773476	3320	Velenje 
00050000-565f-11a3-693e-b20ea61daa07	3322	Velenje - poštni predali
00050000-565f-11a3-808a-44876321046c	8212	Velika Loka
00050000-565f-11a3-4a70-ac2220a0edfc	2274	Velika Nedelja
00050000-565f-11a3-4f7c-5fe2ff2a66db	9225	Velika Polana
00050000-565f-11a3-3f41-e3b6f2b70348	1315	Velike Lašče
00050000-565f-11a3-ece8-9a20e319c89f	8213	Veliki Gaber
00050000-565f-11a3-406a-27e4cb8972c3	9241	Veržej
00050000-565f-11a3-c0a3-3c33094891dc	1312	Videm - Dobrepolje
00050000-565f-11a3-3694-40355d0b282c	2284	Videm pri Ptuju
00050000-565f-11a3-ff02-ca2a702133e4	8344	Vinica
00050000-565f-11a3-4c3b-898cf01852b2	5271	Vipava
00050000-565f-11a3-483f-10325ee45333	4212	Visoko
00050000-565f-11a3-b7c2-68c82d024098	1294	Višnja Gora
00050000-565f-11a3-c0f6-a4253d1917b2	3205	Vitanje
00050000-565f-11a3-af9c-4ae34960da8b	2255	Vitomarci
00050000-565f-11a3-d47a-32ff0d2714c4	1217	Vodice
00050000-565f-11a3-3970-c2a982927e9c	3212	Vojnik\t
00050000-565f-11a3-414d-488e1e77cea0	5293	Volčja Draga
00050000-565f-11a3-2d2a-989782bb5f40	2232	Voličina
00050000-565f-11a3-11c6-e25fcf777a6c	3305	Vransko
00050000-565f-11a3-40cc-6310c70a3bf2	6217	Vremski Britof
00050000-565f-11a3-054e-da0075bed685	1360	Vrhnika
00050000-565f-11a3-50c9-596a79e8047a	2365	Vuhred
00050000-565f-11a3-f410-ae951e721686	2367	Vuzenica
00050000-565f-11a3-f25f-b9a4be665926	8292	Zabukovje 
00050000-565f-11a3-fb43-7de6ad66d798	1410	Zagorje ob Savi
00050000-565f-11a3-92ed-d9ec2a1f2c4c	1303	Zagradec
00050000-565f-11a3-f434-54419e57761a	2283	Zavrč
00050000-565f-11a3-c2f1-58c5c41eedab	8272	Zdole 
00050000-565f-11a3-799d-296b149e3aea	4201	Zgornja Besnica
00050000-565f-11a3-5037-7511ea2777b0	2242	Zgornja Korena
00050000-565f-11a3-633e-9173ef389a99	2201	Zgornja Kungota
00050000-565f-11a3-a47d-679341975344	2316	Zgornja Ložnica
00050000-565f-11a3-bcc9-4b95c3819209	2314	Zgornja Polskava
00050000-565f-11a3-9ac4-8f4963e8e032	2213	Zgornja Velka
00050000-565f-11a3-137f-7b257a6e9d37	4247	Zgornje Gorje
00050000-565f-11a3-1338-16fcb5ba7c0c	4206	Zgornje Jezersko
00050000-565f-11a3-a49e-1220f87db24f	2285	Zgornji Leskovec
00050000-565f-11a3-6ece-7323a7ccce39	1432	Zidani Most
00050000-565f-11a3-6a5b-b0b03b72d00f	3214	Zreče
00050000-565f-11a3-db06-75c1e3beee4a	4209	Žabnica
00050000-565f-11a3-f779-6c192aa82b60	3310	Žalec
00050000-565f-11a3-8785-746c4f481938	4228	Železniki
00050000-565f-11a3-72a3-08b80c46cafd	2287	Žetale
00050000-565f-11a3-e6ed-fa7b04d593a3	4226	Žiri
00050000-565f-11a3-ccfc-96f01b44235c	4274	Žirovnica
00050000-565f-11a3-851d-9a3f53e351b4	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30684768)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30684343)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30684091)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-565f-11a6-f4ae-f5733f9b624e	00080000-565f-11a6-3189-68c7e6dd3ed7	\N	00040000-565f-11a4-a82e-6b682b661525	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-565f-11a6-554a-b17deebcdb8f	00080000-565f-11a6-3189-68c7e6dd3ed7	\N	00040000-565f-11a4-a82e-6b682b661525	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-565f-11a6-2284-59034cf058f7	00080000-565f-11a6-0d05-6738900bb5ec	\N	00040000-565f-11a4-a82e-6b682b661525	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30684235)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-565f-11a4-fd9b-00f212e89537	novo leto	1	1	\N	t
00430000-565f-11a4-8762-65082fddf0ad	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-565f-11a4-a3a3-2c9834858a9f	dan upora proti okupatorju	27	4	\N	t
00430000-565f-11a4-ea65-a850eee2d177	praznik dela	1	5	\N	t
00430000-565f-11a4-1832-7fa2ce8cf8f1	praznik dela	2	5	\N	t
00430000-565f-11a4-2409-7f4b83ef8aa9	dan Primoža Trubarja	8	6	\N	f
00430000-565f-11a4-22cc-090e5a1fbf2a	dan državnosti	25	6	\N	t
00430000-565f-11a4-6498-c1e873cbbbf7	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-565f-11a4-b366-7a5feb8c80d6	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-565f-11a4-f0e5-a084e62ad82f	dan suverenosti	25	10	\N	f
00430000-565f-11a4-99b9-b1058dbecd50	dan spomina na mrtve	1	11	\N	t
00430000-565f-11a4-d79c-db47da181885	dan Rudolfa Maistra	23	11	\N	f
00430000-565f-11a4-e87d-fab11a95d01f	božič	25	12	\N	t
00430000-565f-11a4-7610-575b8082540f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-565f-11a4-13be-6d001ae7167a	Marijino vnebovzetje	15	8	\N	t
00430000-565f-11a4-c9c7-c81a98ca28ef	dan reformacije	31	10	\N	t
00430000-565f-11a4-7e21-547ba239b8d9	velikonočna nedelja	27	3	2016	t
00430000-565f-11a4-5849-2781d1eba36c	velikonočna nedelja	16	4	2017	t
00430000-565f-11a4-ff9d-9928fd788f34	velikonočna nedelja	1	4	2018	t
00430000-565f-11a4-8b62-fab11abd8355	velikonočna nedelja	21	4	2019	t
00430000-565f-11a4-4bdd-091747ae04f2	velikonočna nedelja	12	4	2020	t
00430000-565f-11a4-1081-c76dbe3f4d0c	velikonočna nedelja	4	4	2021	t
00430000-565f-11a4-caad-62653de9f194	velikonočna nedelja	17	4	2022	t
00430000-565f-11a4-e633-34ae329888ec	velikonočna nedelja	9	4	2023	t
00430000-565f-11a4-503c-9a43bd20496e	velikonočna nedelja	31	3	2024	t
00430000-565f-11a4-4179-0020922383c3	velikonočna nedelja	20	4	2025	t
00430000-565f-11a4-3a2e-772263b7e9f8	velikonočna nedelja	5	4	2026	t
00430000-565f-11a4-6c18-52d7dead1bbb	velikonočna nedelja	28	3	2027	t
00430000-565f-11a4-a362-94e82ef1eaa1	velikonočna nedelja	16	4	2028	t
00430000-565f-11a4-93f3-86d2de89aacd	velikonočna nedelja	1	4	2029	t
00430000-565f-11a4-5a08-763d6c1b567d	velikonočna nedelja	21	4	2030	t
00430000-565f-11a4-1f79-d4b96d9ed9d0	velikonočni ponedeljek	28	3	2016	t
00430000-565f-11a4-0ef2-e83d917c69c4	velikonočni ponedeljek	17	4	2017	t
00430000-565f-11a4-409b-6f6f9d43e6b4	velikonočni ponedeljek	2	4	2018	t
00430000-565f-11a4-31ee-82a98a4f768b	velikonočni ponedeljek	22	4	2019	t
00430000-565f-11a4-e4aa-102a120c8b2c	velikonočni ponedeljek	13	4	2020	t
00430000-565f-11a4-623a-0dadc30bf117	velikonočni ponedeljek	5	4	2021	t
00430000-565f-11a4-848d-504183649520	velikonočni ponedeljek	18	4	2022	t
00430000-565f-11a4-b3c5-4af19296d40a	velikonočni ponedeljek	10	4	2023	t
00430000-565f-11a4-1e26-2b4324824460	velikonočni ponedeljek	1	4	2024	t
00430000-565f-11a4-54ce-0c4e6682a0af	velikonočni ponedeljek	21	4	2025	t
00430000-565f-11a4-d0ce-f24c93fc6443	velikonočni ponedeljek	6	4	2026	t
00430000-565f-11a4-377e-5a6ed74dc03d	velikonočni ponedeljek	29	3	2027	t
00430000-565f-11a4-a835-32735f5ccf2e	velikonočni ponedeljek	17	4	2028	t
00430000-565f-11a4-b911-486d51281f1e	velikonočni ponedeljek	2	4	2029	t
00430000-565f-11a4-329c-840423bb39e4	velikonočni ponedeljek	22	4	2030	t
00430000-565f-11a4-62e9-45d72bc3988d	binkoštna nedelja - binkošti	15	5	2016	t
00430000-565f-11a4-362c-703268dde9f6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-565f-11a4-51ec-5da008951ab3	binkoštna nedelja - binkošti	20	5	2018	t
00430000-565f-11a4-4a09-020253e826e3	binkoštna nedelja - binkošti	9	6	2019	t
00430000-565f-11a4-6197-09009219d24a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-565f-11a4-85d5-2d8669490811	binkoštna nedelja - binkošti	23	5	2021	t
00430000-565f-11a4-94d1-5222f16873b1	binkoštna nedelja - binkošti	5	6	2022	t
00430000-565f-11a4-7ea4-bd3a0ee8dd7e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-565f-11a4-30d4-523f1a3498ba	binkoštna nedelja - binkošti	19	5	2024	t
00430000-565f-11a4-61e2-4ba4e91a8ef5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-565f-11a4-adaa-784a966c1da1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-565f-11a4-e009-351cab5a5276	binkoštna nedelja - binkošti	16	5	2027	t
00430000-565f-11a4-e554-f67e4472c4be	binkoštna nedelja - binkošti	4	6	2028	t
00430000-565f-11a4-452c-1860b8347711	binkoštna nedelja - binkošti	20	5	2029	t
00430000-565f-11a4-1754-8cb92c269085	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30684195)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30684207)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30684355)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30684782)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30684792)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-565f-11a6-3eea-e0e92dafd915	00080000-565f-11a6-bc30-99431fd1178a	0987	AK
00190000-565f-11a6-bd77-1cc764d52d50	00080000-565f-11a6-0d05-6738900bb5ec	0989	AK
00190000-565f-11a6-c751-521a60a364a2	00080000-565f-11a6-be0e-bb41f0eb1dc9	0986	AK
00190000-565f-11a6-bacf-a75ae7fa53d7	00080000-565f-11a6-3744-97ec1cb7ea0e	0984	AK
00190000-565f-11a6-c444-d83e6c32342a	00080000-565f-11a6-87fb-1e01b806ee62	0983	AK
00190000-565f-11a6-3e2a-eab9d02ea44d	00080000-565f-11a6-f51d-b0237a7895da	0982	AK
00190000-565f-11a8-48e4-a16c91d359d7	00080000-565f-11a8-cbaf-534bb7e203d7	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30684691)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-565f-11a7-1d0f-2b884ad23e48	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30684800)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30684384)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-565f-11a6-ed7b-f1424d1bdb1e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-565f-11a6-8120-50efcd066ea9	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-565f-11a6-d0f2-2d656101e8f0	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-565f-11a6-712d-e16909c000d1	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-565f-11a6-a913-cf96951547c3	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-565f-11a6-ae3c-491927ecedb2	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-565f-11a6-037a-6a57d94acbdc	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30684328)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30684318)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30684529)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30684459)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30684169)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30683931)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-565f-11a8-cbaf-534bb7e203d7	00010000-565f-11a4-bd38-d4f05c9ef38a	2015-12-02 16:43:36	INS	a:0:{}
2	App\\Entity\\Option	00000000-565f-11a8-3ffb-3ef64761832b	00010000-565f-11a4-bd38-d4f05c9ef38a	2015-12-02 16:43:36	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-565f-11a8-48e4-a16c91d359d7	00010000-565f-11a4-bd38-d4f05c9ef38a	2015-12-02 16:43:36	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30684397)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30683969)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-565f-11a4-310b-ba1957a7b950	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-565f-11a4-7390-b11282d3875e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-565f-11a4-da43-45fb9f6f4c4e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-565f-11a4-478b-f5a802f6aa51	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-565f-11a4-9a12-59a451ee82cb	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-565f-11a4-375f-3bf8847b30d0	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-565f-11a4-3fd9-a7c347ee3b42	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-565f-11a4-41de-e1287ef5893c	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-565f-11a4-c39c-fc6bd221a050	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-565f-11a4-2470-0670c3b20ee8	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-565f-11a4-fd88-1dae4aacd054	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-565f-11a4-4049-82c565219db9	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-565f-11a4-1505-396cec80c0ae	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-565f-11a4-2183-b4714ba06c06	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-565f-11a4-be17-374ff5e20c62	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565f-11a4-6e35-e5d5dab8d17b	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565f-11a4-aeb4-f30cbdf013cb	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-565f-11a4-bc5c-fca1132ac402	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-565f-11a4-add0-e3fb5106e098	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-565f-11a4-bad7-eaa5511f6448	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-565f-11a4-4c2d-8fbf30d0acf8	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565f-11a4-b817-4e571249020c	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565f-11a4-f050-4d05c4124cef	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565f-11a4-6b12-3182f5d67991	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565f-11a4-2064-670168d19d26	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-565f-11a4-c4aa-47ae14ad15d6	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-565f-11a4-b212-a0799a432b6f	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-565f-11a4-7b29-951dfb0f8f51	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-565f-11a4-ca8a-d98dec31a7f8	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-565f-11a4-2429-bd118ba16d15	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-565f-11a4-cd5d-593ba399088e	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-565f-11a4-b6db-2a41efa5dd9e	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-565f-11a4-f05b-d11f677ceae1	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-565f-11a4-6e12-126cd0c9d1b6	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-565f-11a4-5bf4-1b3dd66efb0e	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-565f-11a4-ec58-c92ea8a18ccd	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-565f-11a4-1c7e-fa91ecb90712	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-565f-11a4-03c0-0a91707484ac	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-565f-11a4-7336-60d6889c9a59	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-565f-11a4-e97e-4ede7c55b595	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-565f-11a4-7891-c1f1d00ec308	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-565f-11a4-7987-4f013583d5a0	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565f-11a4-91c6-00eaa1d0f904	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565f-11a4-3426-04a779a845f0	arhivar	arhivar	t
00020000-565f-11a6-1ab3-b7512d707606	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-565f-11a6-fdf7-d97f7939bd10	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-b798-5780e68573a8	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-aa9c-003f5dba4a17	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-d468-8fcfd02686c4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-b93b-19e1ae90eb14	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-ab10-5431896b7d74	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-562b-47bcda0a0b2e	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-2bd6-c6906c925667	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-525d-c0a9e0d5895f	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-56ca-6008e104fa3e	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-bb52-63b1904071a1	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-64af-35c37668922a	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-411c-179a7353132e	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-e91d-514a3f1184e7	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-73c8-dc7c33cfd792	Oseba-vse	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-9433-54a55022d484	Oseba-readVse	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-2011-c050f47eeedb	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-fa84-871533b3a794	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-565f-11a6-d201-bce2603637ee	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3101 (class 0 OID 30683953)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-565f-11a4-5fbd-04caa3172f73	00020000-565f-11a4-da43-45fb9f6f4c4e
00010000-565f-11a4-bd38-d4f05c9ef38a	00020000-565f-11a4-da43-45fb9f6f4c4e
00010000-565f-11a6-b9f5-3b3502740363	00020000-565f-11a6-1ab3-b7512d707606
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-fdf7-d97f7939bd10
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-b93b-19e1ae90eb14
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-525d-c0a9e0d5895f
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-bb52-63b1904071a1
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-411c-179a7353132e
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-fa84-871533b3a794
00010000-565f-11a6-c681-ef8d1e60e03b	00020000-565f-11a6-aa9c-003f5dba4a17
00010000-565f-11a6-fbc8-664e0e9c1501	00020000-565f-11a6-fdf7-d97f7939bd10
00010000-565f-11a6-fbc8-664e0e9c1501	00020000-565f-11a6-b798-5780e68573a8
00010000-565f-11a6-fbc8-664e0e9c1501	00020000-565f-11a6-aa9c-003f5dba4a17
00010000-565f-11a6-fbc8-664e0e9c1501	00020000-565f-11a6-d468-8fcfd02686c4
00010000-565f-11a6-fbc8-664e0e9c1501	00020000-565f-11a6-411c-179a7353132e
00010000-565f-11a6-fbc8-664e0e9c1501	00020000-565f-11a6-9433-54a55022d484
00010000-565f-11a6-e303-d2e22acb9c0c	00020000-565f-11a6-fdf7-d97f7939bd10
00010000-565f-11a6-e303-d2e22acb9c0c	00020000-565f-11a6-b798-5780e68573a8
00010000-565f-11a6-e303-d2e22acb9c0c	00020000-565f-11a6-aa9c-003f5dba4a17
00010000-565f-11a6-e303-d2e22acb9c0c	00020000-565f-11a6-d468-8fcfd02686c4
00010000-565f-11a6-e303-d2e22acb9c0c	00020000-565f-11a6-bb52-63b1904071a1
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-b798-5780e68573a8
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-ab10-5431896b7d74
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-56ca-6008e104fa3e
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-64af-35c37668922a
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-bb52-63b1904071a1
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-2011-c050f47eeedb
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-411c-179a7353132e
00010000-565f-11a6-0d54-8306d65be75c	00020000-565f-11a6-e91d-514a3f1184e7
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-b798-5780e68573a8
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-ab10-5431896b7d74
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-2bd6-c6906c925667
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-56ca-6008e104fa3e
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-64af-35c37668922a
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-bb52-63b1904071a1
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-2011-c050f47eeedb
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-411c-179a7353132e
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-e91d-514a3f1184e7
00010000-565f-11a6-efa0-9fe0b6f158b9	00020000-565f-11a6-73c8-dc7c33cfd792
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-b798-5780e68573a8
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-aa9c-003f5dba4a17
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-ab10-5431896b7d74
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-562b-47bcda0a0b2e
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-2bd6-c6906c925667
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-b93b-19e1ae90eb14
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-56ca-6008e104fa3e
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-64af-35c37668922a
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-bb52-63b1904071a1
00010000-565f-11a6-be94-4d98cfddd0fd	00020000-565f-11a6-2011-c050f47eeedb
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-fdf7-d97f7939bd10
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-d468-8fcfd02686c4
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-b93b-19e1ae90eb14
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-525d-c0a9e0d5895f
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-bb52-63b1904071a1
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-411c-179a7353132e
00010000-565f-11a6-9c77-e0a292272f24	00020000-565f-11a6-fa84-871533b3a794
00010000-565f-11a6-9fd0-7143fc4744ec	00020000-565f-11a6-d201-bce2603637ee
\.


--
-- TOC entry 3146 (class 0 OID 30684411)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30684349)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30684295)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-565f-11a6-dfba-f944ef812cab	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-565f-11a6-9e05-a7d1dd94fc18	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-565f-11a6-46cb-aab576d6907a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30683918)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-565f-11a3-c7d3-b949a9c06f07	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-565f-11a3-9fd0-c4e04c941432	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-565f-11a3-f451-177c695b2191	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-565f-11a3-4bb3-74241a2bc5aa	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-565f-11a3-5f8a-5ec6380c0778	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30683910)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-565f-11a3-5258-9f7554e1d8f6	00230000-565f-11a3-4bb3-74241a2bc5aa	popa
00240000-565f-11a3-0c3a-39dbca065d32	00230000-565f-11a3-4bb3-74241a2bc5aa	oseba
00240000-565f-11a3-468f-941e5ad1fb49	00230000-565f-11a3-4bb3-74241a2bc5aa	tippopa
00240000-565f-11a3-aa9f-72c7d9bcb4af	00230000-565f-11a3-4bb3-74241a2bc5aa	organizacijskaenota
00240000-565f-11a3-c9d7-c94d6eb9dcd9	00230000-565f-11a3-4bb3-74241a2bc5aa	sezona
00240000-565f-11a3-1088-e196f29f43e3	00230000-565f-11a3-4bb3-74241a2bc5aa	tipvaje
00240000-565f-11a3-3ffc-81fcf4135d40	00230000-565f-11a3-9fd0-c4e04c941432	prostor
00240000-565f-11a3-f654-155857bb9d9a	00230000-565f-11a3-4bb3-74241a2bc5aa	besedilo
00240000-565f-11a3-c050-ffd840c5ff5d	00230000-565f-11a3-4bb3-74241a2bc5aa	uprizoritev
00240000-565f-11a3-739c-7d446afb8282	00230000-565f-11a3-4bb3-74241a2bc5aa	funkcija
00240000-565f-11a3-5b7c-47e36a3cbc80	00230000-565f-11a3-4bb3-74241a2bc5aa	tipfunkcije
00240000-565f-11a3-d9e6-2d2742ffbd59	00230000-565f-11a3-4bb3-74241a2bc5aa	alternacija
00240000-565f-11a3-f670-f908661eadb4	00230000-565f-11a3-c7d3-b949a9c06f07	pogodba
00240000-565f-11a3-b0b4-1248a3ba8f81	00230000-565f-11a3-4bb3-74241a2bc5aa	zaposlitev
00240000-565f-11a3-f642-fe0287e6ddf9	00230000-565f-11a3-4bb3-74241a2bc5aa	zvrstuprizoritve
00240000-565f-11a3-3d8e-b17ed05a2c54	00230000-565f-11a3-c7d3-b949a9c06f07	programdela
00240000-565f-11a4-dda7-e48d55f32e6b	00230000-565f-11a3-4bb3-74241a2bc5aa	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30683905)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f1d15d19-b717-4cca-a77e-9eb80d293fa1	00240000-565f-11a3-5258-9f7554e1d8f6	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30684476)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-565f-11a7-cc1a-f5137acc4d97	000e0000-565f-11a6-da03-bb922afca3c9	00080000-565f-11a6-3189-68c7e6dd3ed7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-565f-11a4-4f0b-69b0027485b2
00270000-565f-11a7-e384-8f5dc2bb23bd	000e0000-565f-11a6-da03-bb922afca3c9	00080000-565f-11a6-3189-68c7e6dd3ed7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-565f-11a4-4f0b-69b0027485b2
\.


--
-- TOC entry 3111 (class 0 OID 30684053)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30684305)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-565f-11a7-d009-39ab382d29a7	00180000-565f-11a6-9550-0127e971380e	000c0000-565f-11a7-0360-652a915575ef	00090000-565f-11a6-e89c-677ad5e6d68a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565f-11a7-d7a7-e4442386af69	00180000-565f-11a6-9550-0127e971380e	000c0000-565f-11a7-8a99-f1ed74609d2d	00090000-565f-11a6-daaf-f0a325a93b3b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565f-11a7-c096-0016e797ed60	00180000-565f-11a6-9550-0127e971380e	000c0000-565f-11a7-ba91-91c9ca00cb24	00090000-565f-11a6-0e55-239206ffa52c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565f-11a7-e5d8-ace6f6a6e3c6	00180000-565f-11a6-9550-0127e971380e	000c0000-565f-11a7-a4a3-9cdd55440b40	00090000-565f-11a6-4e7c-73dc1992e184	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565f-11a7-c1ca-e32ad50a5e88	00180000-565f-11a6-9550-0127e971380e	000c0000-565f-11a7-b73d-c755203f46a0	00090000-565f-11a6-f736-390908a3548d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565f-11a7-eb97-07f44a0b8463	00180000-565f-11a6-3f26-b7f2a1ce28ce	\N	00090000-565f-11a6-f736-390908a3548d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-565f-11a7-a5b3-a64a0f283518	00180000-565f-11a6-3f26-b7f2a1ce28ce	\N	00090000-565f-11a6-daaf-f0a325a93b3b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30684517)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-565f-11a3-577f-391f3b702f79	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-565f-11a3-bf79-4e949aeca18c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-565f-11a3-3d9d-d00738a28352	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-565f-11a3-99ca-2f16559715de	04	Režija	Režija	Režija	umetnik	30
000f0000-565f-11a3-e66e-878769cabcf3	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-565f-11a3-014c-05fa91cfc703	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-565f-11a3-7bbe-18d6853869d0	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-565f-11a3-5a2d-6946ae6704b7	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-565f-11a3-cfe8-ee6d594e15ed	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-565f-11a3-8c31-426488797375	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-565f-11a3-4af0-50aa0e4f1839	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-565f-11a3-d2ce-5f3471addbd8	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-565f-11a3-c4da-0d159dc8ac4e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-565f-11a3-738b-25f9e4e8b380	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-565f-11a3-e150-e41ee3c7353d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-565f-11a3-e358-677f2cc8ea08	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-565f-11a3-78a2-f4b8dd88d594	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-565f-11a3-03af-52cdafefb8fd	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30684004)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-565f-11a6-13b4-3343730e02e3	0001	šola	osnovna ali srednja šola
00400000-565f-11a6-fb21-d5c7a2073ea0	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-565f-11a6-7a33-c05e28246c86	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30684812)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-565f-11a3-e675-0deb3c38ad04	01	Velika predstava	f	1.00	1.00
002b0000-565f-11a3-533f-0e63b1e5250a	02	Mala predstava	f	0.50	0.50
002b0000-565f-11a3-aa1c-a4f1ab90cfc4	03	Mala koprodukcija	t	0.40	1.00
002b0000-565f-11a3-b7e0-2ad88c8b6ab7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-565f-11a3-923a-1b2532060dcf	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30684285)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-565f-11a3-5106-e98c08a3aa9c	0001	prva vaja	prva vaja
00420000-565f-11a3-ffaa-5bf101478a76	0002	tehnična vaja	tehnična vaja
00420000-565f-11a3-2663-ae0368c755a3	0003	lučna vaja	lučna vaja
00420000-565f-11a3-4557-e08e63cf513c	0004	kostumska vaja	kostumska vaja
00420000-565f-11a3-3480-e3a13205fed1	0005	foto vaja	foto vaja
00420000-565f-11a3-2baa-76e2b57ab2f0	0006	1. glavna vaja	1. glavna vaja
00420000-565f-11a3-1f83-bf852471ae39	0007	2. glavna vaja	2. glavna vaja
00420000-565f-11a3-4ff7-49a650fe3757	0008	1. generalka	1. generalka
00420000-565f-11a3-8c1e-d45d9ee9a71e	0009	2. generalka	2. generalka
00420000-565f-11a3-4744-8975744114db	0010	odprta generalka	odprta generalka
00420000-565f-11a3-e5b4-037f697d290c	0011	obnovitvena vaja	obnovitvena vaja
00420000-565f-11a3-4973-802513df2d26	0012	pevska vaja	pevska vaja
00420000-565f-11a3-d885-7a183d5b2748	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-565f-11a3-1bb0-3fb836eb5055	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30684126)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30683940)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-565f-11a4-bd38-d4f05c9ef38a	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROwqdMAgt6aRQGhCHyYS18Z0Hyr2toYGS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-565f-11a6-2114-92307a9437e9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-565f-11a6-5626-ba24ba52080a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-565f-11a6-86cb-f5e329900756	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-565f-11a6-8d1f-bed81571b5bb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-565f-11a6-a305-a5ea1754a791	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-565f-11a6-dc29-cfff432995ff	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-565f-11a6-5ce0-adf94f874990	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-565f-11a6-0ed7-a8bf93377d7a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-565f-11a6-efd4-7ee388e96eae	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-565f-11a6-b9f5-3b3502740363	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-565f-11a6-2f07-44ff06113105	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-565f-11a6-c681-ef8d1e60e03b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-565f-11a6-fbc8-664e0e9c1501	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-565f-11a6-e303-d2e22acb9c0c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-565f-11a6-0d54-8306d65be75c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-565f-11a6-efa0-9fe0b6f158b9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-565f-11a6-be94-4d98cfddd0fd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-565f-11a6-9c77-e0a292272f24	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-565f-11a6-9fd0-7143fc4744ec	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-565f-11a4-5fbd-04caa3172f73	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30684567)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-565f-11a6-b262-fb82f6d9484b	00160000-565f-11a6-8fab-462bf9e77299	\N	00140000-565f-11a4-03d9-5f4800cb0f5e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-565f-11a6-a913-cf96951547c3
000e0000-565f-11a6-da03-bb922afca3c9	00160000-565f-11a6-8471-6a0d1ef08877	\N	00140000-565f-11a4-c90c-93c1702dd1e0	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-565f-11a6-ae3c-491927ecedb2
000e0000-565f-11a6-5d69-1184b002dbab	\N	\N	00140000-565f-11a4-c90c-93c1702dd1e0	00190000-565f-11a6-3eea-e0e92dafd915	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565f-11a6-a913-cf96951547c3
000e0000-565f-11a6-f169-fa33d826c1d5	\N	\N	00140000-565f-11a4-c90c-93c1702dd1e0	00190000-565f-11a6-3eea-e0e92dafd915	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565f-11a6-a913-cf96951547c3
000e0000-565f-11a6-3e18-9622e6cb290a	\N	\N	00140000-565f-11a4-c90c-93c1702dd1e0	00190000-565f-11a6-3eea-e0e92dafd915	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-565f-11a6-ed7b-f1424d1bdb1e
000e0000-565f-11a6-fae4-8a2bc6b06adb	\N	\N	00140000-565f-11a4-c90c-93c1702dd1e0	00190000-565f-11a6-3eea-e0e92dafd915	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-565f-11a6-ed7b-f1424d1bdb1e
\.


--
-- TOC entry 3125 (class 0 OID 30684225)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-565f-11a6-27e1-8101740a44e7	\N	000e0000-565f-11a6-da03-bb922afca3c9	1	
00200000-565f-11a6-68a6-90a0d8f0cd0d	\N	000e0000-565f-11a6-da03-bb922afca3c9	2	
00200000-565f-11a6-d620-833282b9ed31	\N	000e0000-565f-11a6-da03-bb922afca3c9	3	
00200000-565f-11a6-eda6-eb5c028baaff	\N	000e0000-565f-11a6-da03-bb922afca3c9	4	
00200000-565f-11a6-d083-6c646bb24c00	\N	000e0000-565f-11a6-da03-bb922afca3c9	5	
\.


--
-- TOC entry 3142 (class 0 OID 30684376)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30684490)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-565f-11a4-23e2-91bf03b97ae3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-565f-11a4-db6f-f4955dc653aa	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-565f-11a4-b3b7-9753ebef5032	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-565f-11a4-e3fe-5c67ac389338	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-565f-11a4-7252-b497f93bfcbf	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-565f-11a4-d67f-d59291c0c839	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-565f-11a4-931b-3370e8908234	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-565f-11a4-ec0d-79e38246cb10	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-565f-11a4-4f0b-69b0027485b2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-565f-11a4-4720-67ba099c57dd	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-565f-11a4-7dd5-b5cf1a22c1c0	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-565f-11a4-a942-f51be7613884	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-565f-11a4-6955-f0994c0bce31	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-565f-11a4-6bca-f213e891791e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-565f-11a4-d3cd-84ddc3933c1a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-565f-11a4-c204-ae6d3220f988	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-565f-11a4-b3da-bf975d9c2c5c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-565f-11a4-3569-dc456eac3d38	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-565f-11a4-daed-257b42fd635f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-565f-11a4-d3dd-9b2d15142805	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-565f-11a4-b57a-de91f99f14df	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-565f-11a4-3e5c-6c7bdbfccffd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-565f-11a4-458b-6413d3499198	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-565f-11a4-46da-bb3eb9db3a91	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-565f-11a4-eafa-2b3a7570b87c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-565f-11a4-6f4e-9c5528345157	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-565f-11a4-d658-e45edc663a1d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-565f-11a4-e1a2-9edb7f1c2205	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30684862)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30684831)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30684874)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30684448)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-565f-11a6-161f-d51e4551ae12	00090000-565f-11a6-daaf-f0a325a93b3b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565f-11a6-f1ea-59c8e370d6e0	00090000-565f-11a6-0e55-239206ffa52c	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565f-11a6-5885-ddd13a95b21c	00090000-565f-11a6-925c-79e6f6f906ac	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565f-11a6-7005-40ff07d92b68	00090000-565f-11a6-e48f-a5aca43f9d0a	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565f-11a6-14ae-d58a2f707ac7	00090000-565f-11a6-a2ab-dc3af1e46bc0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565f-11a6-3a6b-22f78749d21e	00090000-565f-11a6-7cdd-ca364ba519e9	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30684269)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30684557)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-565f-11a4-03d9-5f4800cb0f5e	01	Drama	drama (SURS 01)
00140000-565f-11a4-f9f8-8a424dd6f9dd	02	Opera	opera (SURS 02)
00140000-565f-11a4-47ca-f7108bcc94ab	03	Balet	balet (SURS 03)
00140000-565f-11a4-73ce-5edfc6f507ea	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-565f-11a4-e831-61abf03a0c87	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-565f-11a4-c90c-93c1702dd1e0	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-565f-11a4-f3cb-f4759f06af6c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30684438)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30684003)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30684616)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30684606)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30683994)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30684473)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30684515)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30684915)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30684257)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30684279)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30684284)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30684829)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30684152)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30684685)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30684434)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30684223)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30684190)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30684166)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30684341)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30684892)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30684899)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30684923)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 30684368)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30684124)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30684022)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30684086)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30684049)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30683983)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30683968)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30684374)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30684410)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30684552)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30684077)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30684112)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30684780)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30684347)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30684102)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30684242)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30684211)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30684203)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30684359)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30684789)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30684797)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30684767)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30684810)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30684392)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30684332)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30684323)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30684539)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30684466)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30684178)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30683939)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30684401)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30683957)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30683977)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30684419)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30684354)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30684303)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30683927)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30683915)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30683909)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30684486)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30684058)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30684314)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30684526)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30684011)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30684822)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30684292)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30684137)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30683952)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30684585)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30684232)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30684382)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30684498)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30684872)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30684856)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30684880)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30684456)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30684273)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30684565)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30684446)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30684267)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30684268)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30684266)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30684265)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30684264)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30684487)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30684488)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30684489)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30684894)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30684893)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30684079)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30684080)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30684375)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30684860)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30684859)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30684861)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30684858)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30684857)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30684361)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30684360)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30684233)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30684234)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30684435)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30684437)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30684436)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30684168)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30684167)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30684811)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30684554)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30684555)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30684556)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30684881)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30684590)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30684587)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30684591)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30684589)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30684588)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30684139)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30684138)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30684052)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30684402)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30683984)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30683985)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30684422)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30684421)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30684420)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30684089)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30684088)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30684090)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30684206)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30684204)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30684205)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30683917)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30684327)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30684325)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30684324)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30684326)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30683958)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30683959)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30684383)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30684916)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30684475)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30684474)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30684924)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30684925)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30684348)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30684467)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30684468)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30684690)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30684689)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30684686)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30684687)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30684688)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30684104)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30684103)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30684105)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30684396)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30684395)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30684790)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30684791)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30684620)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30684621)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30684618)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30684619)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30684457)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30684458)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30684336)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30684335)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30684333)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30684334)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30684608)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30684607)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30684179)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30684193)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30684192)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30684191)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30684194)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30684224)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30684212)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30684213)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30684781)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30684830)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30684900)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30684901)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30684024)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30684023)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30684059)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30684060)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30684274)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30684317)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30684316)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30684315)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30684259)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30684260)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30684263)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30684258)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30684262)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30684261)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30684078)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30684012)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30684013)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30684153)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30684155)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30684154)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30684156)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30684342)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30684553)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30684586)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30684527)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30684528)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30684050)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30684051)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30684447)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30683928)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30684125)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30684087)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30683916)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30684823)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30684394)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30684393)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30684293)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30684294)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30684617)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30684113)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30684566)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30684873)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30684798)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30684799)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30684516)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30684304)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30683978)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2906 (class 2606 OID 30685096)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 30685101)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2912 (class 2606 OID 30685126)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2910 (class 2606 OID 30685116)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2905 (class 2606 OID 30685091)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2909 (class 2606 OID 30685111)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2911 (class 2606 OID 30685121)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2908 (class 2606 OID 30685106)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 30685296)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30685301)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 30685306)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 30685471)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 30685466)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 30684981)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2884 (class 2606 OID 30684986)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30685211)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2977 (class 2606 OID 30685451)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30685446)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 30685456)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 30685441)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2974 (class 2606 OID 30685436)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2928 (class 2606 OID 30685206)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2927 (class 2606 OID 30685201)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2903 (class 2606 OID 30685081)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2904 (class 2606 OID 30685086)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30685251)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30685261)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30685256)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2894 (class 2606 OID 30685036)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 30685031)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30685191)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30685426)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 30685311)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30685316)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2951 (class 2606 OID 30685321)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30685461)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2955 (class 2606 OID 30685341)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2952 (class 2606 OID 30685326)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2956 (class 2606 OID 30685346)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30685336)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 30685331)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2892 (class 2606 OID 30685026)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 30685021)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 30684966)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2879 (class 2606 OID 30684961)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30685231)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2875 (class 2606 OID 30684941)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2876 (class 2606 OID 30684946)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2936 (class 2606 OID 30685246)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30685241)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 30685236)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30684996)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 30684991)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2887 (class 2606 OID 30685001)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2899 (class 2606 OID 30685061)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 30685051)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30685056)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30684926)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2920 (class 2606 OID 30685166)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2918 (class 2606 OID 30685156)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 30685151)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2919 (class 2606 OID 30685161)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 30684931)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2874 (class 2606 OID 30684936)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30685216)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30685486)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2945 (class 2606 OID 30685291)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 30685286)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2985 (class 2606 OID 30685491)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2986 (class 2606 OID 30685496)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30685196)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2942 (class 2606 OID 30685276)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2943 (class 2606 OID 30685281)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 30685401)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 30685396)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2963 (class 2606 OID 30685381)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 30685386)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30685391)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30685011)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 30685006)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 30685016)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2932 (class 2606 OID 30685226)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2931 (class 2606 OID 30685221)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 30685411)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2970 (class 2606 OID 30685416)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2961 (class 2606 OID 30685371)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2962 (class 2606 OID 30685376)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 30685361)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2960 (class 2606 OID 30685366)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2940 (class 2606 OID 30685266)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 30685271)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 30685186)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2923 (class 2606 OID 30685181)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 30685171)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2922 (class 2606 OID 30685176)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2958 (class 2606 OID 30685356)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 30685351)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30685041)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30685046)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30685076)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2900 (class 2606 OID 30685066)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2901 (class 2606 OID 30685071)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30685406)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30685421)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30685431)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2982 (class 2606 OID 30685476)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 30685481)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2878 (class 2606 OID 30684956)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 30684951)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2881 (class 2606 OID 30684971)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 30684976)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30685131)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 30685146)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30685141)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 30685136)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-02 16:43:38 CET

--
-- PostgreSQL database dump complete
--

