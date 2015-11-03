--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-03 09:12:10 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 252 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 252
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 24937529)
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
-- TOC entry 236 (class 1259 OID 24938137)
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
-- TOC entry 235 (class 1259 OID 24938120)
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
-- TOC entry 182 (class 1259 OID 24937522)
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
-- TOC entry 181 (class 1259 OID 24937520)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 226 (class 1259 OID 24937997)
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
-- TOC entry 229 (class 1259 OID 24938027)
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
-- TOC entry 250 (class 1259 OID 24938424)
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
-- TOC entry 203 (class 1259 OID 24937777)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
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
-- TOC entry 205 (class 1259 OID 24937808)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 24938350)
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
-- TOC entry 194 (class 1259 OID 24937674)
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
-- TOC entry 237 (class 1259 OID 24938150)
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
-- TOC entry 222 (class 1259 OID 24937951)
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
-- TOC entry 200 (class 1259 OID 24937748)
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
-- TOC entry 197 (class 1259 OID 24937714)
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
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 24937691)
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
-- TOC entry 211 (class 1259 OID 24937865)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 248 (class 1259 OID 24938405)
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
-- TOC entry 249 (class 1259 OID 24938417)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 24938439)
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
-- TOC entry 170 (class 1259 OID 24507014)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24937890)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 24937648)
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
-- TOC entry 185 (class 1259 OID 24937548)
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
-- TOC entry 189 (class 1259 OID 24937615)
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
-- TOC entry 186 (class 1259 OID 24937559)
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
-- TOC entry 178 (class 1259 OID 24937494)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 24937513)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 24937897)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 24937931)
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
-- TOC entry 232 (class 1259 OID 24938068)
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
-- TOC entry 188 (class 1259 OID 24937595)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 191 (class 1259 OID 24937640)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 24938295)
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
-- TOC entry 212 (class 1259 OID 24937871)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 24937625)
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
-- TOC entry 202 (class 1259 OID 24937769)
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
-- TOC entry 198 (class 1259 OID 24937729)
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
-- TOC entry 199 (class 1259 OID 24937741)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 24937883)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 24938309)
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
-- TOC entry 241 (class 1259 OID 24938319)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 24938218)
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
-- TOC entry 242 (class 1259 OID 24938327)
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
    programrazno_id uuid
);


--
-- TOC entry 218 (class 1259 OID 24937912)
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
-- TOC entry 210 (class 1259 OID 24937856)
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
-- TOC entry 209 (class 1259 OID 24937846)
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
-- TOC entry 231 (class 1259 OID 24938057)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 24937987)
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
-- TOC entry 196 (class 1259 OID 24937703)
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
-- TOC entry 175 (class 1259 OID 24937465)
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
-- TOC entry 174 (class 1259 OID 24937463)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 219 (class 1259 OID 24937925)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 24937503)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 24937487)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24937939)
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
-- TOC entry 213 (class 1259 OID 24937877)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 24937823)
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
-- TOC entry 173 (class 1259 OID 24937452)
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
-- TOC entry 172 (class 1259 OID 24937444)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 24937439)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 227 (class 1259 OID 24938004)
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
-- TOC entry 187 (class 1259 OID 24937587)
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
-- TOC entry 208 (class 1259 OID 24937833)
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
-- TOC entry 230 (class 1259 OID 24938045)
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
-- TOC entry 184 (class 1259 OID 24937538)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 243 (class 1259 OID 24938338)
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
-- TOC entry 206 (class 1259 OID 24937813)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 24937660)
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
-- TOC entry 176 (class 1259 OID 24937474)
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
-- TOC entry 234 (class 1259 OID 24938095)
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
-- TOC entry 201 (class 1259 OID 24937759)
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
-- TOC entry 217 (class 1259 OID 24937904)
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
-- TOC entry 228 (class 1259 OID 24938018)
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
-- TOC entry 246 (class 1259 OID 24938385)
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
-- TOC entry 245 (class 1259 OID 24938357)
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
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 247 (class 1259 OID 24938397)
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
-- TOC entry 224 (class 1259 OID 24937976)
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
-- TOC entry 204 (class 1259 OID 24937802)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 233 (class 1259 OID 24938085)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 223 (class 1259 OID 24937966)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2238 (class 2604 OID 24937525)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 24937468)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3093 (class 0 OID 24937529)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5638-6c57-6a10-5323c236e99e	10	30	Otroci	Abonma za otroke	200
000a0000-5638-6c57-b81a-e0a3320f56f7	20	60	Mladina	Abonma za mladino	400
000a0000-5638-6c57-339a-f72051826269	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3146 (class 0 OID 24938137)
-- Dependencies: 236
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5638-6c57-cf21-8747bed56753	000d0000-5638-6c57-831a-c50436070377	\N	00090000-5638-6c57-d2a4-b1bf5b6b048f	000b0000-5638-6c57-5cea-06a0a772167f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5638-6c57-c4be-43e2af2c61e8	000d0000-5638-6c57-21aa-dcf19388e0dc	00100000-5638-6c57-5e35-fa3bd0c49874	00090000-5638-6c57-00e9-952666b1f68c	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5638-6c57-036f-0492bf575ebf	000d0000-5638-6c57-d3a9-19342f875e75	00100000-5638-6c57-1a4a-8b82243d3636	00090000-5638-6c57-d0e7-82a30796eb15	\N	0003	t	\N	2015-11-03	\N	2	t	\N	f	f
000c0000-5638-6c57-ded8-cffea2e22cff	000d0000-5638-6c57-290b-d2c1403e105e	\N	00090000-5638-6c57-2951-22e512af95bf	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5638-6c57-9709-dfcc59ca32ad	000d0000-5638-6c57-73aa-26fcd5c1e319	\N	00090000-5638-6c57-374c-34fca25cf549	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5638-6c57-63e8-d811fbd47fde	000d0000-5638-6c57-08a1-2ae567f4089d	\N	00090000-5638-6c57-7f9e-eb5948ea20f1	000b0000-5638-6c57-189c-d874d05d84ab	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5638-6c57-6380-7485d8638fcf	000d0000-5638-6c57-dc07-ac32c8046911	00100000-5638-6c57-a285-ca84190abcb8	00090000-5638-6c57-3034-4777e1eab95e	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5638-6c57-6de2-f6c9ff580482	000d0000-5638-6c57-2a36-373d060f99af	\N	00090000-5638-6c57-ded7-74eb6a5e160e	000b0000-5638-6c57-19b9-a421083ee691	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5638-6c57-9dad-188a883ee2db	000d0000-5638-6c57-dc07-ac32c8046911	00100000-5638-6c57-e9d7-d3f26a018925	00090000-5638-6c57-36be-33da744452dc	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5638-6c57-94f1-034f28165e48	000d0000-5638-6c57-dc07-ac32c8046911	00100000-5638-6c57-0201-5039da1ec1d4	00090000-5638-6c57-8ba7-fdbb448b1283	\N	0010	t	\N	2015-11-03	\N	16	f	\N	f	t
000c0000-5638-6c57-cf70-bf80c8774a80	000d0000-5638-6c57-dc07-ac32c8046911	00100000-5638-6c57-0c1e-7cbf2ac4115e	00090000-5638-6c57-a7fe-c05a6258647f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5638-6c57-857c-1e1bd205944c	000d0000-5638-6c57-79c5-6168b25be67d	00100000-5638-6c57-5e35-fa3bd0c49874	00090000-5638-6c57-00e9-952666b1f68c	000b0000-5638-6c57-c0bc-b9ff294f8231	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3145 (class 0 OID 24938120)
-- Dependencies: 235
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 24937522)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3136 (class 0 OID 24937997)
-- Dependencies: 226
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5638-6c57-89ff-96c5a08996b5	00160000-5638-6c57-af0e-15346ae51f96	00090000-5638-6c57-2e80-9714d44dbc0f	aizv	10	t
003d0000-5638-6c57-64cc-399b87400021	00160000-5638-6c57-af0e-15346ae51f96	00090000-5638-6c57-a22a-0b21076e9334	apri	14	t
003d0000-5638-6c57-ea35-c9ffade4bfd4	00160000-5638-6c57-03ce-91cd0f5684c9	00090000-5638-6c57-1b7d-590d188a1773	aizv	11	t
003d0000-5638-6c57-9f23-ddbe0a8490e4	00160000-5638-6c57-56a9-eb5749a2023a	00090000-5638-6c57-8f9f-e6364ecb28c4	aizv	12	t
003d0000-5638-6c57-f55e-c980321f90ae	00160000-5638-6c57-af0e-15346ae51f96	00090000-5638-6c57-4087-c6c9a9417d63	apri	18	f
\.


--
-- TOC entry 3139 (class 0 OID 24938027)
-- Dependencies: 229
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5638-6c57-af0e-15346ae51f96	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5638-6c57-03ce-91cd0f5684c9	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5638-6c57-56a9-eb5749a2023a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3160 (class 0 OID 24938424)
-- Dependencies: 250
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 24937777)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5638-6c57-1506-364b9fff7c25	\N	\N	00200000-5638-6c57-3fed-e3a5e1eb0339	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5638-6c57-a69a-be6b1c8f72a0	\N	\N	00200000-5638-6c57-48c2-7247bc13aa53	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5638-6c57-8962-7e95875cbed9	\N	\N	00200000-5638-6c57-b246-db03207d34f3	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5638-6c57-96c6-86dadf74c3bb	\N	\N	00200000-5638-6c57-2652-0b101f3c567b	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5638-6c57-9a90-93c609ce1249	\N	\N	00200000-5638-6c57-78c8-88bbf496e177	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3115 (class 0 OID 24937808)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 24938350)
-- Dependencies: 244
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 24937674)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5638-6c55-1dd0-9fae783eea37	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5638-6c55-4192-5d0beba09394	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5638-6c55-0df2-8469277130d7	AL	ALB	008	Albania 	Albanija	\N
00040000-5638-6c55-cfeb-cc5669f45414	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5638-6c55-df99-02d4c2a7b7db	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5638-6c55-b26f-760e97fbbd38	AD	AND	020	Andorra 	Andora	\N
00040000-5638-6c55-a57b-88c751c9ff7e	AO	AGO	024	Angola 	Angola	\N
00040000-5638-6c55-13df-565aa461ee31	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5638-6c55-0841-43b9cb571964	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5638-6c55-a259-733db606c491	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5638-6c55-180e-d9ccb3a2cbf6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5638-6c55-37d0-843657da8898	AM	ARM	051	Armenia 	Armenija	\N
00040000-5638-6c55-c281-0eaa14d2cdea	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5638-6c55-c50a-204b6cc76cc2	AU	AUS	036	Australia 	Avstralija	\N
00040000-5638-6c55-ff5a-5df86287b0c1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5638-6c55-5cf5-f45088e5b9e9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5638-6c55-84fe-d9572a56ed82	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5638-6c55-b10e-b283be648ff5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5638-6c55-c738-7ece00c02029	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5638-6c55-e778-cb6210acc82d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5638-6c55-08ad-8653d5fd89f9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5638-6c55-fa82-ef0e455686ca	BE	BEL	056	Belgium 	Belgija	\N
00040000-5638-6c55-1e30-e442b02475ab	BZ	BLZ	084	Belize 	Belize	\N
00040000-5638-6c55-10b5-04aaa9993cf8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5638-6c55-f8d2-99c4dc81204f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5638-6c55-1791-fbd5af1c37f0	BT	BTN	064	Bhutan 	Butan	\N
00040000-5638-6c55-9294-15ba0e275520	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5638-6c55-e2fd-b9ae34282189	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5638-6c55-e72e-22f1c360f4ba	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5638-6c55-9af7-39d1d9f6763f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5638-6c55-a463-f461454b48c7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5638-6c55-4385-ba65661a05e4	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5638-6c55-cc75-354f079a42b1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5638-6c55-5f18-8936353822b6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5638-6c55-bb9a-52aacabec86a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5638-6c55-fde4-c63a3c139476	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5638-6c55-661c-6db21087fcef	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5638-6c55-ae8a-a5b0ff8169ee	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5638-6c55-e476-4857e43c4030	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5638-6c55-6440-c8e0f21c41f1	CA	CAN	124	Canada 	Kanada	\N
00040000-5638-6c55-50a8-fdbca07c88a0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5638-6c55-3f05-37f54a16d571	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5638-6c55-0f6c-af8074187284	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5638-6c55-c2bc-9d49e6d23cf8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5638-6c55-3c67-024620e5cf96	CL	CHL	152	Chile 	Čile	\N
00040000-5638-6c55-aac5-f77620f31ee8	CN	CHN	156	China 	Kitajska	\N
00040000-5638-6c55-2888-11d596215f03	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5638-6c55-4e3d-b49d959c10ab	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5638-6c55-1a1e-92b34394c895	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5638-6c55-d141-04beb5957200	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5638-6c55-1d1d-67e899d037a8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5638-6c55-8cf2-9a44a18e4fa1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5638-6c55-f14c-1260ab153702	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5638-6c55-845a-e5b221c4089c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5638-6c55-8c3a-474f3df112f2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5638-6c55-5154-dabba0cead3f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5638-6c55-7714-17a075e4c810	CU	CUB	192	Cuba 	Kuba	\N
00040000-5638-6c55-13ff-334169e9f1ca	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5638-6c55-2aea-6b799f46de47	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5638-6c55-257d-c785cfda0542	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5638-6c55-0d17-ccf613dccbbb	DK	DNK	208	Denmark 	Danska	\N
00040000-5638-6c55-b774-ef053b0e0c43	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5638-6c55-b122-860a61166420	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5638-6c55-13d1-598fb2af7681	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5638-6c55-ddbb-56a3e0424e7b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5638-6c55-3ae7-7611a2f27b44	EG	EGY	818	Egypt 	Egipt	\N
00040000-5638-6c55-431b-f9e4fe399ba0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5638-6c55-a6f6-c17cb4802432	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5638-6c55-02f5-42fd8b1284e6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5638-6c55-621f-d14713bf712e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5638-6c55-67b4-781ee755ff4d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5638-6c55-2fff-f1251ce051a0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5638-6c55-73fc-eca6ef8e47fa	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5638-6c55-5ed6-6be24dff045a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5638-6c55-a51e-bae0cf9440e4	FI	FIN	246	Finland 	Finska	\N
00040000-5638-6c55-c171-3dd34c121af8	FR	FRA	250	France 	Francija	\N
00040000-5638-6c55-85a3-8d40d626f0c7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5638-6c55-5aff-002b66f3f72e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5638-6c55-1e00-d7f48d5807fc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5638-6c55-6ae7-ad71e4520606	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5638-6c55-c31b-9e93c0bafb8f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5638-6c55-901b-813c63906688	GM	GMB	270	Gambia 	Gambija	\N
00040000-5638-6c55-35e1-b909e820c61d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5638-6c55-b4a3-8bbea47f94e0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5638-6c55-188d-66ae35a7e8d3	GH	GHA	288	Ghana 	Gana	\N
00040000-5638-6c55-0b0c-36f2f5cda95c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5638-6c55-7a7e-d58512834d7d	GR	GRC	300	Greece 	Grčija	\N
00040000-5638-6c55-9994-d129eb9bc33a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5638-6c55-2a14-785cef70d64f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5638-6c55-a3cc-62db3bc484e2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5638-6c55-97f0-73794c5e87dc	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5638-6c55-83ef-ffe9e5070406	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5638-6c55-8b93-2db69b565626	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5638-6c55-a603-7ba3720d9fb1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5638-6c55-ee9f-bf48bf89ffcb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5638-6c55-0683-47666cf306de	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5638-6c55-15e7-21da5582a38c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5638-6c55-e19f-2ab689ef33c5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5638-6c55-5ded-c2a931bc008a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5638-6c55-2506-f5e5bfa122ab	HN	HND	340	Honduras 	Honduras	\N
00040000-5638-6c55-1759-bde9c28a286f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5638-6c55-4f64-cd692adcafac	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5638-6c55-27c4-aa91100dfd58	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5638-6c55-7309-770068874b03	IN	IND	356	India 	Indija	\N
00040000-5638-6c55-5383-709504b568ae	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5638-6c55-f0fb-4da082a6875f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5638-6c55-f044-5df4bd34c8ac	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5638-6c55-6194-aff13ccfcdbd	IE	IRL	372	Ireland 	Irska	\N
00040000-5638-6c55-ad26-53ce87d25dd5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5638-6c55-fd5b-4e459bd9113f	IL	ISR	376	Israel 	Izrael	\N
00040000-5638-6c55-8a36-d2c66c2b3dc3	IT	ITA	380	Italy 	Italija	\N
00040000-5638-6c55-fcad-9a8c5ae955fe	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5638-6c55-dc50-59d191bee4d3	JP	JPN	392	Japan 	Japonska	\N
00040000-5638-6c55-6a3c-6e666fdd877f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5638-6c55-6309-98f46bf9f631	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5638-6c55-5fce-3fd0f96f3410	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5638-6c55-1bf4-eb2c680a4e85	KE	KEN	404	Kenya 	Kenija	\N
00040000-5638-6c55-2c4e-a34007a12d0f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5638-6c55-1423-e0fa148e78a2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5638-6c55-4d6a-4f69427fe811	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5638-6c55-7893-29d84e42fede	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5638-6c55-e1e1-bbed2559397d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5638-6c55-9675-4cdae68dc822	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5638-6c55-debd-4dbbd40cb16d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5638-6c55-ab81-01120acddabd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5638-6c55-4331-b4e27db65247	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5638-6c55-1320-f8ec20c08a43	LR	LBR	430	Liberia 	Liberija	\N
00040000-5638-6c55-5739-84e05fec4bc4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5638-6c55-1c41-6c7eb2b5fe5d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5638-6c55-47e2-e1909ac33c1f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5638-6c55-7863-9423e37132f7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5638-6c55-7b9d-033e6bdc9153	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5638-6c55-d5f2-c871f552d944	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5638-6c55-7f6a-ff3259d7b3f8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5638-6c55-5283-c20b92266612	MW	MWI	454	Malawi 	Malavi	\N
00040000-5638-6c55-5c5d-b8e94596e996	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5638-6c55-ed07-0e06dcf411fa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5638-6c55-5773-03b8f39c7c26	ML	MLI	466	Mali 	Mali	\N
00040000-5638-6c55-4bb5-08a53a7eff3a	MT	MLT	470	Malta 	Malta	\N
00040000-5638-6c55-59db-66e2a4894145	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5638-6c55-f8ba-b415e8bf9f72	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5638-6c55-cc1d-42d35acb45bd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5638-6c55-13a7-5d0cbb504b45	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5638-6c55-7b77-45e3ab494a95	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5638-6c55-0c70-1261326cfca5	MX	MEX	484	Mexico 	Mehika	\N
00040000-5638-6c55-4eb5-984be6d17ad8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5638-6c55-d8d6-9d67f9e7256b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5638-6c55-add0-8049ef37e46c	MC	MCO	492	Monaco 	Monako	\N
00040000-5638-6c55-8caa-f629cb7d4d97	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5638-6c55-dabc-84f6df8c93b8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5638-6c55-a77f-0e1e768befc9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5638-6c55-30b6-fb2e018bfd3f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5638-6c55-e825-659defb598e2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5638-6c55-b27d-4d21056ecd6f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5638-6c55-a69f-c65b719a22a2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5638-6c55-d022-d6f7438d6377	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5638-6c55-282f-fba70eff7239	NP	NPL	524	Nepal 	Nepal	\N
00040000-5638-6c55-3a5e-b9969e1cced1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5638-6c55-f75e-ae6893ab1882	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5638-6c55-e46e-66437272b3df	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5638-6c55-5ce5-9b63cbc6aa36	NE	NER	562	Niger 	Niger 	\N
00040000-5638-6c55-1cd4-743c7ed6cbc7	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5638-6c55-aa5e-f11393c04d5a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5638-6c55-4063-87fad87e91f1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5638-6c55-10a2-a162923e63ee	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5638-6c55-d21e-6a245d211bca	NO	NOR	578	Norway 	Norveška	\N
00040000-5638-6c55-84d2-66cfbdf6d8cf	OM	OMN	512	Oman 	Oman	\N
00040000-5638-6c55-87d2-f85a2b0b5442	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5638-6c55-8435-9f0a776dbe08	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5638-6c55-ea9f-99ed94230048	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5638-6c55-0101-5a484852c348	PA	PAN	591	Panama 	Panama	\N
00040000-5638-6c55-d9fc-38497f2fb8f2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5638-6c55-a21f-1ba5f3cd35ea	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5638-6c55-1369-8028fd3fcb7c	PE	PER	604	Peru 	Peru	\N
00040000-5638-6c55-e679-dbb4bc40d11f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5638-6c55-ce11-03a9e7beea51	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5638-6c55-955d-386e6423290d	PL	POL	616	Poland 	Poljska	\N
00040000-5638-6c55-c976-ae06d64d96b5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5638-6c55-bd34-a751a869dfe5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5638-6c55-b47c-bca694c61ad5	QA	QAT	634	Qatar 	Katar	\N
00040000-5638-6c55-29ed-f3ae3c4bcd92	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5638-6c55-a7f3-79f88ef73fa5	RO	ROU	642	Romania 	Romunija	\N
00040000-5638-6c55-3ed5-2b3b93f0222b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5638-6c55-576f-115820692002	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5638-6c55-46bf-a3b51aaa474a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5638-6c55-6663-3367dda37873	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5638-6c55-faf2-7ae8534eb299	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5638-6c55-b58d-f27ad0390fb2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5638-6c55-3626-da4f05110b5b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5638-6c55-451e-1ebcc1ff5dc8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5638-6c55-46e1-586b15802749	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5638-6c55-c836-46e8120768da	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5638-6c55-81fc-9a095bb59582	SM	SMR	674	San Marino 	San Marino	\N
00040000-5638-6c55-0fcd-a8520d914c2a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5638-6c55-7044-1371ce9c96d1	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5638-6c55-6f9f-e71f765ab0cd	SN	SEN	686	Senegal 	Senegal	\N
00040000-5638-6c55-7a13-88448a3fb34c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5638-6c55-27d2-3808fca69da2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5638-6c55-2c95-082ebf881dd3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5638-6c55-aa16-bc3cabe422ba	SG	SGP	702	Singapore 	Singapur	\N
00040000-5638-6c55-955e-2cd01efc5d18	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5638-6c55-a85f-5f65723f30c2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5638-6c55-8019-b218bef221f1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5638-6c55-05fd-0d5c4caa0717	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5638-6c55-8f70-7d5173d74ce7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5638-6c55-d4f7-54ecbe14c3bd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5638-6c55-26ae-5c41cf82c25b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5638-6c55-ca5c-618fb3a5a4c0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5638-6c55-07b8-72db4e3981c4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5638-6c55-2773-c276c81596e4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5638-6c55-134b-dfb920782f10	SD	SDN	729	Sudan 	Sudan	\N
00040000-5638-6c55-c195-37b54c54ff0a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5638-6c55-a2dd-c3f2f423db60	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5638-6c55-8f59-52710f28abe5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5638-6c55-f131-cd49012726c1	SE	SWE	752	Sweden 	Švedska	\N
00040000-5638-6c55-7cf4-138b33a3ec68	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5638-6c55-1d5b-36fc4ea51ad8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5638-6c55-7ac7-02747e1d0ef0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5638-6c55-d0fa-a956018b03de	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5638-6c55-2668-825133b2ffc8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5638-6c55-517c-5665eff9a196	TH	THA	764	Thailand 	Tajska	\N
00040000-5638-6c55-15e6-4bfa95d42dda	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5638-6c55-df79-264a6c119e91	TG	TGO	768	Togo 	Togo	\N
00040000-5638-6c55-5dc2-386ad5f274a8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5638-6c55-4a15-bfc8fd210e78	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5638-6c55-c51c-cb5f8d071a55	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5638-6c55-e62a-cfe64ea7f419	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5638-6c55-b362-ec065ee40cc3	TR	TUR	792	Turkey 	Turčija	\N
00040000-5638-6c55-074e-788145a26a5a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5638-6c55-bf85-820a9a7ecd3e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5638-6c55-af97-29fa02e2a1f4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5638-6c55-3671-69073080fcae	UG	UGA	800	Uganda 	Uganda	\N
00040000-5638-6c55-288e-170972667d06	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5638-6c55-3254-b6ff339fffe9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5638-6c55-c6a0-c9dd7c26426d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5638-6c55-efe1-c2977fc0242e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5638-6c55-6142-c7e059a7e1c8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5638-6c55-50eb-3287cf471ced	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5638-6c55-7ee3-67be2e9e877c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5638-6c55-660c-fce2fb794de7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5638-6c55-2623-f58714bc3176	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5638-6c55-9d68-acc1d6556924	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5638-6c55-41a8-0bfd2547649c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5638-6c55-e768-7ac906d2a9fb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5638-6c55-f3c7-c0b1032b7a27	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5638-6c55-844d-b7ee7cb59d77	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5638-6c55-039f-ae9f356f8c5d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5638-6c55-a630-f9790c1e8bab	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5638-6c55-974f-ef695937b484	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3147 (class 0 OID 24938150)
-- Dependencies: 237
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5638-6c57-94e2-f958e8fb597b	000e0000-5638-6c57-5c48-812e63e5a791	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5638-6c54-7f86-ab2a135cb7e0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5638-6c57-cb94-99629b0d8b97	000e0000-5638-6c57-6df1-e8e7077435bb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5638-6c54-2b9c-7d2059a8eb33	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5638-6c57-99b5-9e35b5ce7c1d	000e0000-5638-6c57-522d-5c71b83f92bd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5638-6c54-7f86-ab2a135cb7e0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5638-6c57-474a-0b3ba8473a14	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5638-6c57-5a65-8cc0cbac5a82	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3132 (class 0 OID 24937951)
-- Dependencies: 222
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5638-6c57-dc07-ac32c8046911	000e0000-5638-6c57-6df1-e8e7077435bb	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5638-6c55-8c67-df29eb9af2f0
000d0000-5638-6c57-831a-c50436070377	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-cf21-8747bed56753	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5638-6c55-8c67-df29eb9af2f0
000d0000-5638-6c57-21aa-dcf19388e0dc	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-c4be-43e2af2c61e8	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5638-6c55-d717-6dcc19d7be5f
000d0000-5638-6c57-d3a9-19342f875e75	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-036f-0492bf575ebf	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5638-6c55-2794-27592107eb0f
000d0000-5638-6c57-290b-d2c1403e105e	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-ded8-cffea2e22cff	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5638-6c55-ade3-69627949ae3f
000d0000-5638-6c57-73aa-26fcd5c1e319	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-9709-dfcc59ca32ad	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5638-6c55-ade3-69627949ae3f
000d0000-5638-6c57-08a1-2ae567f4089d	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-63e8-d811fbd47fde	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5638-6c55-8c67-df29eb9af2f0
000d0000-5638-6c57-2a36-373d060f99af	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-6de2-f6c9ff580482	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5638-6c55-8be2-fdc41ad352e2
000d0000-5638-6c57-79c5-6168b25be67d	000e0000-5638-6c57-6df1-e8e7077435bb	000c0000-5638-6c57-857c-1e1bd205944c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5638-6c55-b0bf-dad43a059f01
\.


--
-- TOC entry 3110 (class 0 OID 24937748)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 24937714)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 24937691)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5638-6c57-a54f-24cf383a4dd1	00080000-5638-6c57-9266-b30de1971c56	00090000-5638-6c57-8ba7-fdbb448b1283	AK		igralka
\.


--
-- TOC entry 3121 (class 0 OID 24937865)
-- Dependencies: 211
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 24938405)
-- Dependencies: 248
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 24938417)
-- Dependencies: 249
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 24938439)
-- Dependencies: 251
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 24507014)
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
\.


--
-- TOC entry 3125 (class 0 OID 24937890)
-- Dependencies: 215
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 24937648)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5638-6c55-41b5-2fe1c8dd7e36	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5638-6c55-571c-28f7471903bf	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5638-6c55-f196-4fba730a205c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5638-6c55-ab70-495cfc40a496	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5638-6c55-ae4f-b5bd0d79e116	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5638-6c55-a9b0-bf8ee8bb0bf6	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5638-6c55-4529-e6b06de808b2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5638-6c55-3196-e8886646f253	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5638-6c55-787d-f7f088956c11	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5638-6c55-9ef4-ae3ec50ef45a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5638-6c55-7ffa-a0324a6203cd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5638-6c55-e8fc-477448e0d048	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5638-6c55-d965-1cf7588dcd37	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5638-6c55-3c33-0c2f94ffd1e7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5638-6c55-5d8d-a98ec28a1739	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5638-6c57-4692-11b66806ee26	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5638-6c57-50cd-3d78af3faa14	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5638-6c57-738d-5b98a292dd2f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5638-6c57-9ff4-00b540badee4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5638-6c57-c8ea-4d14c33c2a7b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5638-6c58-e2b1-3bfdf7e8950a	application.tenant.maticnopodjetje	string	s:36:"00080000-5638-6c58-370a-698859ffedef";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3095 (class 0 OID 24937548)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5638-6c57-2f28-a8534c38d798	00000000-5638-6c57-4692-11b66806ee26	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5638-6c57-d213-c2ea074f6280	00000000-5638-6c57-4692-11b66806ee26	00010000-5638-6c55-e7ed-f424ab9bdb8c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5638-6c57-18d3-68d9039a26b6	00000000-5638-6c57-50cd-3d78af3faa14	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3099 (class 0 OID 24937615)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5638-6c57-317b-a7e00c0be8ff	\N	00100000-5638-6c57-5e35-fa3bd0c49874	00100000-5638-6c57-1a4a-8b82243d3636	01	Gledališče Nimbis
00410000-5638-6c57-3e3a-35ba43588b63	00410000-5638-6c57-317b-a7e00c0be8ff	00100000-5638-6c57-5e35-fa3bd0c49874	00100000-5638-6c57-1a4a-8b82243d3636	02	Tehnika
\.


--
-- TOC entry 3096 (class 0 OID 24937559)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5638-6c57-d2a4-b1bf5b6b048f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5638-6c57-2951-22e512af95bf	00010000-5638-6c57-ad75-18769f97a176	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5638-6c57-d0e7-82a30796eb15	00010000-5638-6c57-a85f-6600ac744cd6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5638-6c57-36be-33da744452dc	00010000-5638-6c57-8800-11014a381d25	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5638-6c57-9847-ed74cc7a4b9c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5638-6c57-7f9e-eb5948ea20f1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5638-6c57-a7fe-c05a6258647f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5638-6c57-3034-4777e1eab95e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5638-6c57-8ba7-fdbb448b1283	00010000-5638-6c57-08b3-6c357f0be4c3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5638-6c57-00e9-952666b1f68c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5638-6c57-b888-3a55d9fa334e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5638-6c57-374c-34fca25cf549	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5638-6c57-ded7-74eb6a5e160e	00010000-5638-6c57-df38-9ee946eb5e63	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5638-6c57-2e80-9714d44dbc0f	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-6c57-a22a-0b21076e9334	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-6c57-1b7d-590d188a1773	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-6c57-8f9f-e6364ecb28c4	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5638-6c57-4087-c6c9a9417d63	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5638-6c57-16fd-445eb347472e	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-6c57-0c4a-c21f7c59b87f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-6c57-1d6e-7738125905ac	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3088 (class 0 OID 24937494)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5638-6c55-2e4d-85c46a10b961	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5638-6c55-4406-c47d6032ad9c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5638-6c55-e4d5-956851ec1c15	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5638-6c55-db08-01e23a650b73	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5638-6c55-abbf-7c97a274b8cc	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5638-6c55-6154-9ed3ce93f47e	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5638-6c55-27e5-f699a0f072f2	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5638-6c55-b80b-b9ff6f37ae90	Abonma-read	Abonma - branje	t
00030000-5638-6c55-8e3c-0e05ee3f63bb	Abonma-write	Abonma - spreminjanje	t
00030000-5638-6c55-c528-6808fbc02889	Alternacija-read	Alternacija - branje	t
00030000-5638-6c55-e578-7717870bc62f	Alternacija-write	Alternacija - spreminjanje	t
00030000-5638-6c55-5f3f-109111b43b94	Arhivalija-read	Arhivalija - branje	t
00030000-5638-6c55-606b-76c45b41abd9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5638-6c55-8bf7-f178da2710e4	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5638-6c55-896f-888d09895b51	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5638-6c55-f7a2-36d96fb03c8e	Besedilo-read	Besedilo - branje	t
00030000-5638-6c55-83a9-f002675a935c	Besedilo-write	Besedilo - spreminjanje	t
00030000-5638-6c55-6e13-8b7404b34abe	DogodekIzven-read	DogodekIzven - branje	t
00030000-5638-6c55-c054-fda1fe28a08e	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5638-6c55-397b-fe117f48cbe1	Dogodek-read	Dogodek - branje	t
00030000-5638-6c55-9b5e-d1bed68d947c	Dogodek-write	Dogodek - spreminjanje	t
00030000-5638-6c55-4228-59d3b5dee066	DrugiVir-read	DrugiVir - branje	t
00030000-5638-6c55-4a11-d043f6b73d99	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5638-6c55-0941-8cb59d122995	Drzava-read	Drzava - branje	t
00030000-5638-6c55-9f76-b299fc156930	Drzava-write	Drzava - spreminjanje	t
00030000-5638-6c55-ce8a-f1c2478fae56	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5638-6c55-1766-92e2f87cfcd0	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5638-6c55-2190-04eb2fd530e7	Funkcija-read	Funkcija - branje	t
00030000-5638-6c55-2e78-a0ec074beb16	Funkcija-write	Funkcija - spreminjanje	t
00030000-5638-6c55-6126-efd59cf57de4	Gostovanje-read	Gostovanje - branje	t
00030000-5638-6c55-82fc-fc1ed448c8d5	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5638-6c55-b90f-ebb5f0f23510	Gostujoca-read	Gostujoca - branje	t
00030000-5638-6c55-b83b-a2bc2371418d	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5638-6c55-4861-94db1f31e7db	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5638-6c55-9747-0015bdf3b0be	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5638-6c55-28b9-4ac88b2b2fb0	Kupec-read	Kupec - branje	t
00030000-5638-6c55-ec84-8d5f94ee2530	Kupec-write	Kupec - spreminjanje	t
00030000-5638-6c55-ddd2-ef760552f240	NacinPlacina-read	NacinPlacina - branje	t
00030000-5638-6c55-24e2-c4b309063476	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5638-6c55-08b9-28fe0ef6b03a	Option-read	Option - branje	t
00030000-5638-6c55-753f-909df608675a	Option-write	Option - spreminjanje	t
00030000-5638-6c55-d631-30ab4883ccc6	OptionValue-read	OptionValue - branje	t
00030000-5638-6c55-e861-153eb852a74a	OptionValue-write	OptionValue - spreminjanje	t
00030000-5638-6c55-e36f-47d1d8251d0a	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5638-6c55-3476-b5960359c54d	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5638-6c55-a085-b793bc647f82	Oseba-read	Oseba - branje	t
00030000-5638-6c55-714a-89e678281850	Oseba-write	Oseba - spreminjanje	t
00030000-5638-6c55-15b7-67e6204e7f20	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5638-6c55-819e-0502f39178ac	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5638-6c55-6e50-c646a7c1ab36	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5638-6c55-c22f-e2fdf8b89e26	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5638-6c55-83d7-c7c6db6b209d	Pogodba-read	Pogodba - branje	t
00030000-5638-6c55-c7fc-a6dcd405ed50	Pogodba-write	Pogodba - spreminjanje	t
00030000-5638-6c55-5e13-251e2494884b	Popa-read	Popa - branje	t
00030000-5638-6c55-1fdc-bd3ce2973c0f	Popa-write	Popa - spreminjanje	t
00030000-5638-6c55-fbad-f746b2fa7dbb	Posta-read	Posta - branje	t
00030000-5638-6c55-aacb-c6990684f48f	Posta-write	Posta - spreminjanje	t
00030000-5638-6c55-0f0e-9a41851d62b3	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5638-6c55-f08c-1a72819aa3aa	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5638-6c55-393a-9d880c980f67	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5638-6c55-fe23-fca886d03996	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5638-6c55-6df7-bf2a653d4c03	PostniNaslov-read	PostniNaslov - branje	t
00030000-5638-6c55-2a16-ee782df28723	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5638-6c55-154d-7c5ec29d8fe4	Predstava-read	Predstava - branje	t
00030000-5638-6c55-5935-6da4193890c4	Predstava-write	Predstava - spreminjanje	t
00030000-5638-6c55-9e49-e2f421e152eb	Praznik-read	Praznik - branje	t
00030000-5638-6c55-d599-9731a4a63504	Praznik-write	Praznik - spreminjanje	t
00030000-5638-6c55-0969-95af6e19ec5c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5638-6c55-e1ec-5a159a92801e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5638-6c55-2ea3-bdb0170dfe2f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5638-6c55-115d-ad32e66cae94	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5638-6c55-ec7f-11228444312b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5638-6c55-ccef-e9bb1c42dc96	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5638-6c55-f609-6a2b538b4168	ProgramDela-read	ProgramDela - branje	t
00030000-5638-6c55-9831-fd155084f1cc	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5638-6c55-ecfc-52236c9817f9	ProgramFestival-read	ProgramFestival - branje	t
00030000-5638-6c55-ee2e-cf8c9e3d2a4a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5638-6c55-e85b-71e3eb1648c4	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5638-6c55-1e14-299a298bf911	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5638-6c55-cdd6-a4debe5629ab	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5638-6c55-da64-b5720cf9ca10	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5638-6c55-4f83-533e6f07ba18	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5638-6c55-1643-f24c0a4f7257	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5638-6c55-cfe6-4882d45ee4c3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5638-6c55-d2e8-98704ca074eb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5638-6c55-255e-87370e43788e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5638-6c55-95da-8751c0a53ef4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5638-6c55-843a-cd192a7f289e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5638-6c55-c611-40d4d485a1c4	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5638-6c55-bedb-8287595a8169	ProgramRazno-read	ProgramRazno - branje	t
00030000-5638-6c55-bfb2-8c1c5a9390b7	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5638-6c55-905c-b7816e101f71	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5638-6c55-3c56-06400f791514	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5638-6c55-22f1-377e47681a04	Prostor-read	Prostor - branje	t
00030000-5638-6c55-6625-8bac7bec3b3a	Prostor-write	Prostor - spreminjanje	t
00030000-5638-6c55-6d6a-879640d02e83	Racun-read	Racun - branje	t
00030000-5638-6c55-8e4b-881c03056724	Racun-write	Racun - spreminjanje	t
00030000-5638-6c55-8490-e94bb1979299	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5638-6c55-5711-767569fdfee8	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5638-6c55-6b44-24a7ad020a34	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5638-6c55-0637-fe3c58622710	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5638-6c55-9e0a-350dea6255b0	Rekvizit-read	Rekvizit - branje	t
00030000-5638-6c55-79dc-53dc799ea8da	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5638-6c55-1289-d06692cecd86	Revizija-read	Revizija - branje	t
00030000-5638-6c55-6839-9fc5d27dfb69	Revizija-write	Revizija - spreminjanje	t
00030000-5638-6c55-6531-23ad06034cb9	Rezervacija-read	Rezervacija - branje	t
00030000-5638-6c55-d003-83407b5ef93a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5638-6c55-ede1-7ac7268d6dfe	SedezniRed-read	SedezniRed - branje	t
00030000-5638-6c55-1d01-898fc3acbe68	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5638-6c55-7013-923d9132a6a2	Sedez-read	Sedez - branje	t
00030000-5638-6c55-8692-a7fc2343af4c	Sedez-write	Sedez - spreminjanje	t
00030000-5638-6c55-ca9d-42f60128c320	Sezona-read	Sezona - branje	t
00030000-5638-6c55-b663-216e3252046b	Sezona-write	Sezona - spreminjanje	t
00030000-5638-6c55-f53e-b1fb9eee2186	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5638-6c55-e0a6-0e8824c544f9	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5638-6c55-d687-638e04685f78	Stevilcenje-read	Stevilcenje - branje	t
00030000-5638-6c55-cc4f-9d351c856b7d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5638-6c55-6505-f6d86bf46e10	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5638-6c55-9d70-381704967f9f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5638-6c55-59cd-c68f31f72cad	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5638-6c55-f70f-defeb3b7d39a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5638-6c55-2b1a-a8b051e8d354	Telefonska-read	Telefonska - branje	t
00030000-5638-6c55-1c75-c0bc32b3753f	Telefonska-write	Telefonska - spreminjanje	t
00030000-5638-6c55-1d54-a32414c67b18	TerminStoritve-read	TerminStoritve - branje	t
00030000-5638-6c55-fb1e-982edd07ac93	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5638-6c55-1b50-bd9ba3b41485	TipFunkcije-read	TipFunkcije - branje	t
00030000-5638-6c55-b5b8-02ada3d8cc47	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5638-6c55-37e6-32bd0ea271de	TipPopa-read	TipPopa - branje	t
00030000-5638-6c55-d75f-54bcab280935	TipPopa-write	TipPopa - spreminjanje	t
00030000-5638-6c55-1f7f-406c620f14ee	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5638-6c55-acb2-b8191fc6f357	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5638-6c55-a6bf-5f9f3f9f8167	TipVaje-read	TipVaje - branje	t
00030000-5638-6c55-f338-187cd1327bed	TipVaje-write	TipVaje - spreminjanje	t
00030000-5638-6c55-24a7-f34087cdffa8	Trr-read	Trr - branje	t
00030000-5638-6c55-15ad-1529ac3a6fa1	Trr-write	Trr - spreminjanje	t
00030000-5638-6c55-bb98-39788513ecae	Uprizoritev-read	Uprizoritev - branje	t
00030000-5638-6c55-0fe9-fafb03d1aede	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5638-6c55-b36f-56ab76c42645	Vaja-read	Vaja - branje	t
00030000-5638-6c55-0701-ab686a687259	Vaja-write	Vaja - spreminjanje	t
00030000-5638-6c55-eeb4-710d881f84b4	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5638-6c55-a847-c5498f63f27c	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5638-6c55-0756-4fbaf60f2cda	VrstaStroska-read	VrstaStroska - branje	t
00030000-5638-6c55-3790-b2b2421f0049	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5638-6c55-508e-1be792bde30b	Zaposlitev-read	Zaposlitev - branje	t
00030000-5638-6c55-1307-3669771c7c06	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5638-6c55-4e1b-e24353121829	Zasedenost-read	Zasedenost - branje	t
00030000-5638-6c55-e125-94dcff054ee3	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5638-6c55-3de2-78c1fbcc36d5	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5638-6c55-aa43-b2178d3862df	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5638-6c55-75ee-1a263e6be2dd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5638-6c55-c61b-64a9bbba677f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5638-6c55-6b65-883c56190c3b	Job-read	Branje opravil - samo zase - branje	t
00030000-5638-6c55-599a-955caa23fc2a	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5638-6c55-01c8-1d0a99f287ec	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5638-6c55-8c4c-68c9797b4f08	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5638-6c55-c19f-65cc2cb467c5	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5638-6c55-c93c-084e65c438c3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5638-6c55-0935-3b97f84fa52e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5638-6c55-07ff-6b5fab83b0c3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5638-6c55-f6de-2c50a57a6bf2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5638-6c55-89af-4eed993d9333	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5638-6c55-9a55-903015cc1f5a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5638-6c55-48c0-53743f5f6f32	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5638-6c55-f4cc-14e40f705157	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5638-6c55-b1c7-6ed9ddcefd1c	Datoteka-write	Datoteka - spreminjanje	t
00030000-5638-6c55-8e8f-12cfdb0f831c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3090 (class 0 OID 24937513)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5638-6c55-6f73-68977605e4c8	00030000-5638-6c55-4406-c47d6032ad9c
00020000-5638-6c55-c4db-1a457497c7a0	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-b80b-b9ff6f37ae90
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-8e3c-0e05ee3f63bb
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-c528-6808fbc02889
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-e578-7717870bc62f
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-5f3f-109111b43b94
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-397b-fe117f48cbe1
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-db08-01e23a650b73
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-9b5e-d1bed68d947c
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-9f76-b299fc156930
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-2190-04eb2fd530e7
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-2e78-a0ec074beb16
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-6126-efd59cf57de4
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-82fc-fc1ed448c8d5
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-b90f-ebb5f0f23510
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-b83b-a2bc2371418d
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-4861-94db1f31e7db
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-9747-0015bdf3b0be
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-08b9-28fe0ef6b03a
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-d631-30ab4883ccc6
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-a085-b793bc647f82
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-714a-89e678281850
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-5e13-251e2494884b
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-1fdc-bd3ce2973c0f
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-fbad-f746b2fa7dbb
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-aacb-c6990684f48f
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-6df7-bf2a653d4c03
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-2a16-ee782df28723
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-154d-7c5ec29d8fe4
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-5935-6da4193890c4
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-ec7f-11228444312b
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-ccef-e9bb1c42dc96
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-22f1-377e47681a04
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-6625-8bac7bec3b3a
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-6b44-24a7ad020a34
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-0637-fe3c58622710
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-9e0a-350dea6255b0
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-79dc-53dc799ea8da
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-ca9d-42f60128c320
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-b663-216e3252046b
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-1b50-bd9ba3b41485
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-bb98-39788513ecae
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-0fe9-fafb03d1aede
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-b36f-56ab76c42645
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-0701-ab686a687259
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-4e1b-e24353121829
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-e125-94dcff054ee3
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-3de2-78c1fbcc36d5
00020000-5638-6c55-4226-e61fa4ee4812	00030000-5638-6c55-75ee-1a263e6be2dd
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-b80b-b9ff6f37ae90
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-5f3f-109111b43b94
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-397b-fe117f48cbe1
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-6126-efd59cf57de4
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-b90f-ebb5f0f23510
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-4861-94db1f31e7db
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-9747-0015bdf3b0be
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-08b9-28fe0ef6b03a
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-d631-30ab4883ccc6
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-a085-b793bc647f82
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-714a-89e678281850
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-5e13-251e2494884b
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-fbad-f746b2fa7dbb
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-6df7-bf2a653d4c03
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-2a16-ee782df28723
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-154d-7c5ec29d8fe4
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-22f1-377e47681a04
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-6b44-24a7ad020a34
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-9e0a-350dea6255b0
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-ca9d-42f60128c320
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-2b1a-a8b051e8d354
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-1c75-c0bc32b3753f
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-24a7-f34087cdffa8
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-15ad-1529ac3a6fa1
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-508e-1be792bde30b
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-1307-3669771c7c06
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-3de2-78c1fbcc36d5
00020000-5638-6c55-a2a3-979481337cd6	00030000-5638-6c55-75ee-1a263e6be2dd
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-b80b-b9ff6f37ae90
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-c528-6808fbc02889
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-5f3f-109111b43b94
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-606b-76c45b41abd9
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-f7a2-36d96fb03c8e
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-6e13-8b7404b34abe
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-397b-fe117f48cbe1
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-2190-04eb2fd530e7
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-6126-efd59cf57de4
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-b90f-ebb5f0f23510
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-4861-94db1f31e7db
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-08b9-28fe0ef6b03a
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-d631-30ab4883ccc6
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-a085-b793bc647f82
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-5e13-251e2494884b
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-fbad-f746b2fa7dbb
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-154d-7c5ec29d8fe4
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-ec7f-11228444312b
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-22f1-377e47681a04
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-6b44-24a7ad020a34
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-9e0a-350dea6255b0
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-ca9d-42f60128c320
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-1b50-bd9ba3b41485
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-b36f-56ab76c42645
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-4e1b-e24353121829
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-3de2-78c1fbcc36d5
00020000-5638-6c55-462f-5abe07b2e066	00030000-5638-6c55-75ee-1a263e6be2dd
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-b80b-b9ff6f37ae90
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-8e3c-0e05ee3f63bb
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-e578-7717870bc62f
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-5f3f-109111b43b94
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-397b-fe117f48cbe1
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-6126-efd59cf57de4
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-b90f-ebb5f0f23510
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-08b9-28fe0ef6b03a
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-d631-30ab4883ccc6
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-5e13-251e2494884b
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-fbad-f746b2fa7dbb
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-154d-7c5ec29d8fe4
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-22f1-377e47681a04
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-6b44-24a7ad020a34
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-9e0a-350dea6255b0
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-ca9d-42f60128c320
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-1b50-bd9ba3b41485
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-3de2-78c1fbcc36d5
00020000-5638-6c55-63db-fa91f41d6382	00030000-5638-6c55-75ee-1a263e6be2dd
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-b80b-b9ff6f37ae90
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-5f3f-109111b43b94
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-397b-fe117f48cbe1
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-6126-efd59cf57de4
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-b90f-ebb5f0f23510
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-08b9-28fe0ef6b03a
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-d631-30ab4883ccc6
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-5e13-251e2494884b
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-fbad-f746b2fa7dbb
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-154d-7c5ec29d8fe4
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-22f1-377e47681a04
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-6b44-24a7ad020a34
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-9e0a-350dea6255b0
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-ca9d-42f60128c320
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-1d54-a32414c67b18
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-e4d5-956851ec1c15
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-1b50-bd9ba3b41485
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-3de2-78c1fbcc36d5
00020000-5638-6c55-3dab-f814aa29a236	00030000-5638-6c55-75ee-1a263e6be2dd
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-2e4d-85c46a10b961
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-4406-c47d6032ad9c
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-b80b-b9ff6f37ae90
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-8e3c-0e05ee3f63bb
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-c528-6808fbc02889
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e578-7717870bc62f
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-5f3f-109111b43b94
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-606b-76c45b41abd9
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-8bf7-f178da2710e4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-896f-888d09895b51
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-f7a2-36d96fb03c8e
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-83a9-f002675a935c
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6e13-8b7404b34abe
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-c054-fda1fe28a08e
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-397b-fe117f48cbe1
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-db08-01e23a650b73
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9b5e-d1bed68d947c
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-4228-59d3b5dee066
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-4a11-d043f6b73d99
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0941-8cb59d122995
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9f76-b299fc156930
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ce8a-f1c2478fae56
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1766-92e2f87cfcd0
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-2190-04eb2fd530e7
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-2e78-a0ec074beb16
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6126-efd59cf57de4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-82fc-fc1ed448c8d5
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-b90f-ebb5f0f23510
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-b83b-a2bc2371418d
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-4861-94db1f31e7db
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9747-0015bdf3b0be
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-28b9-4ac88b2b2fb0
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ec84-8d5f94ee2530
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ddd2-ef760552f240
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-24e2-c4b309063476
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-08b9-28fe0ef6b03a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-d631-30ab4883ccc6
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e861-153eb852a74a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-753f-909df608675a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e36f-47d1d8251d0a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-3476-b5960359c54d
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-a085-b793bc647f82
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-abbf-7c97a274b8cc
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-714a-89e678281850
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-15b7-67e6204e7f20
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-819e-0502f39178ac
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6e50-c646a7c1ab36
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-c22f-e2fdf8b89e26
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-83d7-c7c6db6b209d
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-c7fc-a6dcd405ed50
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-5e13-251e2494884b
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1fdc-bd3ce2973c0f
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-fbad-f746b2fa7dbb
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0f0e-9a41851d62b3
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-f08c-1a72819aa3aa
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-393a-9d880c980f67
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-fe23-fca886d03996
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-aacb-c6990684f48f
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6df7-bf2a653d4c03
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-2a16-ee782df28723
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9e49-e2f421e152eb
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-d599-9731a4a63504
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-154d-7c5ec29d8fe4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-5935-6da4193890c4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0969-95af6e19ec5c
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e1ec-5a159a92801e
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-2ea3-bdb0170dfe2f
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-115d-ad32e66cae94
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ec7f-11228444312b
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ccef-e9bb1c42dc96
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6154-9ed3ce93f47e
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-f609-6a2b538b4168
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-27e5-f699a0f072f2
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9831-fd155084f1cc
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ecfc-52236c9817f9
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ee2e-cf8c9e3d2a4a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e85b-71e3eb1648c4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1e14-299a298bf911
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-cdd6-a4debe5629ab
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-da64-b5720cf9ca10
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-4f83-533e6f07ba18
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1643-f24c0a4f7257
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-cfe6-4882d45ee4c3
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-d2e8-98704ca074eb
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-255e-87370e43788e
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-95da-8751c0a53ef4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-843a-cd192a7f289e
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-c611-40d4d485a1c4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-bedb-8287595a8169
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-bfb2-8c1c5a9390b7
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-905c-b7816e101f71
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-3c56-06400f791514
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-22f1-377e47681a04
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6625-8bac7bec3b3a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6d6a-879640d02e83
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-8e4b-881c03056724
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-8490-e94bb1979299
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-5711-767569fdfee8
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6b44-24a7ad020a34
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0637-fe3c58622710
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9e0a-350dea6255b0
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-79dc-53dc799ea8da
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1289-d06692cecd86
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6839-9fc5d27dfb69
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6531-23ad06034cb9
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-d003-83407b5ef93a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ede1-7ac7268d6dfe
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1d01-898fc3acbe68
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-7013-923d9132a6a2
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-8692-a7fc2343af4c
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-ca9d-42f60128c320
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-b663-216e3252046b
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-f53e-b1fb9eee2186
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e0a6-0e8824c544f9
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-d687-638e04685f78
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-6505-f6d86bf46e10
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-9d70-381704967f9f
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-cc4f-9d351c856b7d
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-59cd-c68f31f72cad
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-f70f-defeb3b7d39a
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-2b1a-a8b051e8d354
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1c75-c0bc32b3753f
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1d54-a32414c67b18
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e4d5-956851ec1c15
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-fb1e-982edd07ac93
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1b50-bd9ba3b41485
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-b5b8-02ada3d8cc47
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-37e6-32bd0ea271de
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-d75f-54bcab280935
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1f7f-406c620f14ee
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-acb2-b8191fc6f357
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-a6bf-5f9f3f9f8167
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-f338-187cd1327bed
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-24a7-f34087cdffa8
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-15ad-1529ac3a6fa1
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-bb98-39788513ecae
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0fe9-fafb03d1aede
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-b36f-56ab76c42645
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0701-ab686a687259
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-eeb4-710d881f84b4
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-a847-c5498f63f27c
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-0756-4fbaf60f2cda
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-3790-b2b2421f0049
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-508e-1be792bde30b
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-1307-3669771c7c06
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-4e1b-e24353121829
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-e125-94dcff054ee3
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-3de2-78c1fbcc36d5
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-aa43-b2178d3862df
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-75ee-1a263e6be2dd
00020000-5638-6c57-8437-094870d1b6c7	00030000-5638-6c55-c61b-64a9bbba677f
\.


--
-- TOC entry 3126 (class 0 OID 24937897)
-- Dependencies: 216
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 24937931)
-- Dependencies: 220
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 24938068)
-- Dependencies: 232
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5638-6c57-5cea-06a0a772167f	00090000-5638-6c57-d2a4-b1bf5b6b048f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5638-6c57-189c-d874d05d84ab	00090000-5638-6c57-7f9e-eb5948ea20f1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5638-6c57-19b9-a421083ee691	00090000-5638-6c57-ded7-74eb6a5e160e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5638-6c57-c0bc-b9ff294f8231	00090000-5638-6c57-00e9-952666b1f68c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3098 (class 0 OID 24937595)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5638-6c57-9266-b30de1971c56	\N	00040000-5638-6c55-8019-b218bef221f1	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-2de6-af3207842df7	\N	00040000-5638-6c55-8019-b218bef221f1	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5638-6c57-4fa5-eca655f41dae	\N	00040000-5638-6c55-8019-b218bef221f1	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-22a6-443b7976050c	\N	00040000-5638-6c55-8019-b218bef221f1	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-d95d-f2a9a535d45e	\N	00040000-5638-6c55-8019-b218bef221f1	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-e67d-0783c9b353a8	\N	00040000-5638-6c55-180e-d9ccb3a2cbf6	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-fba0-5e7060b82dff	\N	00040000-5638-6c55-5154-dabba0cead3f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-1108-59637da9776a	\N	00040000-5638-6c55-ff5a-5df86287b0c1	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c57-2a1f-d4502018cdf6	\N	00040000-5638-6c55-b4a3-8bbea47f94e0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-6c58-370a-698859ffedef	\N	00040000-5638-6c55-8019-b218bef221f1	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3101 (class 0 OID 24937640)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5638-6c54-c75c-7f027797e2fb	8341	Adlešiči
00050000-5638-6c54-24d5-13211e5244da	5270	Ajdovščina
00050000-5638-6c54-4bfa-14e8b2ab0720	6280	Ankaran/Ancarano
00050000-5638-6c54-7494-8764507469ee	9253	Apače
00050000-5638-6c54-aab7-b282d7b58416	8253	Artiče
00050000-5638-6c54-b494-27e389d263b4	4275	Begunje na Gorenjskem
00050000-5638-6c54-57db-58d97b0d3b1f	1382	Begunje pri Cerknici
00050000-5638-6c54-07f8-145c74e0041f	9231	Beltinci
00050000-5638-6c54-b338-8d1b357f7b16	2234	Benedikt
00050000-5638-6c54-73ce-c7f121530c0d	2345	Bistrica ob Dravi
00050000-5638-6c54-8a29-f43589720687	3256	Bistrica ob Sotli
00050000-5638-6c54-3d9b-318f85189eed	8259	Bizeljsko
00050000-5638-6c54-d71d-9df97b427902	1223	Blagovica
00050000-5638-6c54-fa94-c2250d43c42b	8283	Blanca
00050000-5638-6c54-a9d3-c4893850a847	4260	Bled
00050000-5638-6c54-4166-c815239a58ca	4273	Blejska Dobrava
00050000-5638-6c54-d780-4ed60b99110f	9265	Bodonci
00050000-5638-6c54-267f-143e8bcaeb68	9222	Bogojina
00050000-5638-6c54-8cfb-f071bb3e8eea	4263	Bohinjska Bela
00050000-5638-6c54-852a-e7dfb141f0f7	4264	Bohinjska Bistrica
00050000-5638-6c54-1e2d-3d9948952c7a	4265	Bohinjsko jezero
00050000-5638-6c54-57c3-e47d80b30a54	1353	Borovnica
00050000-5638-6c54-1878-3f990170b12d	8294	Boštanj
00050000-5638-6c54-028c-6fa590aebf7f	5230	Bovec
00050000-5638-6c54-5fe1-99408af301c4	5295	Branik
00050000-5638-6c54-2e66-2c05f652ba0c	3314	Braslovče
00050000-5638-6c54-bfad-0ff745ab73de	5223	Breginj
00050000-5638-6c54-ce3f-0437eddf8ebf	8280	Brestanica
00050000-5638-6c54-2f12-6ce2ced43eb1	2354	Bresternica
00050000-5638-6c54-5af8-54acf64a8fb2	4243	Brezje
00050000-5638-6c54-8599-e265ab41470d	1351	Brezovica pri Ljubljani
00050000-5638-6c54-c2be-ee328af7cac8	8250	Brežice
00050000-5638-6c54-3e66-c6e6a5760efe	4210	Brnik - Aerodrom
00050000-5638-6c54-85f6-0c95e764afd8	8321	Brusnice
00050000-5638-6c54-97f9-2460f0e5bc1d	3255	Buče
00050000-5638-6c54-84e9-d4601c3a2986	8276	Bučka 
00050000-5638-6c54-9d4a-84e881d2d93f	9261	Cankova
00050000-5638-6c54-28e6-920ac23548ae	3000	Celje 
00050000-5638-6c54-dd03-c827fc9a4533	3001	Celje - poštni predali
00050000-5638-6c54-71b5-f58bb2a52f73	4207	Cerklje na Gorenjskem
00050000-5638-6c54-19d3-93e6fcfeef21	8263	Cerklje ob Krki
00050000-5638-6c54-ee1f-073e968197ce	1380	Cerknica
00050000-5638-6c54-6ee8-777b075f66a0	5282	Cerkno
00050000-5638-6c54-20de-58e036854168	2236	Cerkvenjak
00050000-5638-6c54-cfba-2fb4fabb39ae	2215	Ceršak
00050000-5638-6c54-7119-4b570bd3d297	2326	Cirkovce
00050000-5638-6c54-3cf0-d750ec18ab32	2282	Cirkulane
00050000-5638-6c54-bca3-28eadf332bda	5273	Col
00050000-5638-6c54-6b2e-aca67ac084c7	8251	Čatež ob Savi
00050000-5638-6c54-cd4c-ef513adff042	1413	Čemšenik
00050000-5638-6c54-3e43-45dc7f099782	5253	Čepovan
00050000-5638-6c54-878f-c66c2c3e509d	9232	Črenšovci
00050000-5638-6c54-3da9-75f7afcb4d42	2393	Črna na Koroškem
00050000-5638-6c54-f819-5b661f8bbb0b	6275	Črni Kal
00050000-5638-6c54-9cf8-1a1e5d7b89d0	5274	Črni Vrh nad Idrijo
00050000-5638-6c54-64a1-79de96630287	5262	Črniče
00050000-5638-6c54-7e17-beba46862881	8340	Črnomelj
00050000-5638-6c54-641e-86e655f63405	6271	Dekani
00050000-5638-6c54-0e11-d6aacfc71fca	5210	Deskle
00050000-5638-6c54-0e23-72be0f25f94d	2253	Destrnik
00050000-5638-6c54-5cf2-2ddae965e973	6215	Divača
00050000-5638-6c54-656a-2fa72f197ff1	1233	Dob
00050000-5638-6c54-ed31-dc61e64bf3a7	3224	Dobje pri Planini
00050000-5638-6c54-c0a9-bd8f9a63893a	8257	Dobova
00050000-5638-6c54-2cdb-40a6bbdf3329	1423	Dobovec
00050000-5638-6c54-d490-077ac832a214	5263	Dobravlje
00050000-5638-6c54-820b-980a00fc266d	3204	Dobrna
00050000-5638-6c54-9197-3f226e93a71c	8211	Dobrnič
00050000-5638-6c54-eb41-d06bbb201d40	1356	Dobrova
00050000-5638-6c54-accf-a9eb594aa3d1	9223	Dobrovnik/Dobronak 
00050000-5638-6c54-9ed8-711d42c2edbd	5212	Dobrovo v Brdih
00050000-5638-6c54-c291-a19b6a095c55	1431	Dol pri Hrastniku
00050000-5638-6c54-a7c1-ced8d540be76	1262	Dol pri Ljubljani
00050000-5638-6c54-061f-08d24264bf56	1273	Dole pri Litiji
00050000-5638-6c54-8147-9b957a0a5662	1331	Dolenja vas
00050000-5638-6c54-20de-8ff522e1087d	8350	Dolenjske Toplice
00050000-5638-6c54-c90c-cad21c3ba76a	1230	Domžale
00050000-5638-6c54-f4a7-8ff72b917ff0	2252	Dornava
00050000-5638-6c54-8746-a70fa8732697	5294	Dornberk
00050000-5638-6c54-940e-f4f997567c5c	1319	Draga
00050000-5638-6c54-6776-34c2e5653424	8343	Dragatuš
00050000-5638-6c54-8e26-0822b63d1172	3222	Dramlje
00050000-5638-6c54-aa95-96e311224a08	2370	Dravograd
00050000-5638-6c54-b5cf-f7ecaf07ac2a	4203	Duplje
00050000-5638-6c54-22f9-6da417d4b9d8	6221	Dutovlje
00050000-5638-6c54-a78e-c2ca02e36ac0	8361	Dvor
00050000-5638-6c54-d0ec-82026ff05ad1	2343	Fala
00050000-5638-6c54-942c-7cbcb6843d5f	9208	Fokovci
00050000-5638-6c54-eeb9-f9c947fca69b	2313	Fram
00050000-5638-6c54-df17-ea6fc471b2f0	3213	Frankolovo
00050000-5638-6c54-503e-23ac9ccef25c	1274	Gabrovka
00050000-5638-6c54-99a8-c2ff7338beed	8254	Globoko
00050000-5638-6c54-909f-45b67d066fa6	5275	Godovič
00050000-5638-6c54-f89d-dc6046b5e5f2	4204	Golnik
00050000-5638-6c54-72f2-62c085638b45	3303	Gomilsko
00050000-5638-6c54-547c-fb966b27e151	4224	Gorenja vas
00050000-5638-6c54-ae0f-a4e1678f02a7	3263	Gorica pri Slivnici
00050000-5638-6c54-9830-c9f62ec4e059	2272	Gorišnica
00050000-5638-6c54-2aa3-14fd8c4695dc	9250	Gornja Radgona
00050000-5638-6c54-cb70-e7f2c4da5698	3342	Gornji Grad
00050000-5638-6c54-a37b-c55352c98aa8	4282	Gozd Martuljek
00050000-5638-6c54-fbb7-9f1aefb8e683	6272	Gračišče
00050000-5638-6c54-a18f-96a0fa374928	9264	Grad
00050000-5638-6c54-90a3-abf04983fa66	8332	Gradac
00050000-5638-6c54-b888-8f1176ab6e38	1384	Grahovo
00050000-5638-6c54-a58f-1ff42fe9df03	5242	Grahovo ob Bači
00050000-5638-6c54-3bd9-3b32df70a127	5251	Grgar
00050000-5638-6c54-eeb6-46d7d8f68031	3302	Griže
00050000-5638-6c54-09ef-0a171809c9bb	3231	Grobelno
00050000-5638-6c54-2c30-a4c76edc5754	1290	Grosuplje
00050000-5638-6c54-066f-8387b708f6bf	2288	Hajdina
00050000-5638-6c54-f92c-c263fc518631	8362	Hinje
00050000-5638-6c54-7698-677481353f19	2311	Hoče
00050000-5638-6c54-cbaa-86f7edff574b	9205	Hodoš/Hodos
00050000-5638-6c54-02f3-370196b103de	1354	Horjul
00050000-5638-6c54-290a-25a156af4d18	1372	Hotedršica
00050000-5638-6c54-5451-663e5d8b33cf	1430	Hrastnik
00050000-5638-6c54-0a6c-b18bc5fcd6ef	6225	Hruševje
00050000-5638-6c54-becf-b3f149c06b86	4276	Hrušica
00050000-5638-6c54-45fc-1e63172b8192	5280	Idrija
00050000-5638-6c54-a3c8-ef0e24e2977e	1292	Ig
00050000-5638-6c54-2630-e87b600b7339	6250	Ilirska Bistrica
00050000-5638-6c54-0cef-780588cf9747	6251	Ilirska Bistrica-Trnovo
00050000-5638-6c54-fd75-04d3187f9305	1295	Ivančna Gorica
00050000-5638-6c54-5b8e-38a7bb60b9e2	2259	Ivanjkovci
00050000-5638-6c54-9d3f-830c049eae83	1411	Izlake
00050000-5638-6c54-b4e9-be5a929d1a62	6310	Izola/Isola
00050000-5638-6c54-180a-2d97a7e47c5f	2222	Jakobski Dol
00050000-5638-6c54-e21d-a9d7277f460c	2221	Jarenina
00050000-5638-6c54-ccfc-8fc92570a381	6254	Jelšane
00050000-5638-6c54-c91e-cf95c1189a15	4270	Jesenice
00050000-5638-6c54-9d27-060ac652feb8	8261	Jesenice na Dolenjskem
00050000-5638-6c54-d0c2-d7f73e4d0304	3273	Jurklošter
00050000-5638-6c54-a20d-82a7c3adc51e	2223	Jurovski Dol
00050000-5638-6c54-c557-363b577863be	2256	Juršinci
00050000-5638-6c54-ae74-b28ba6649e50	5214	Kal nad Kanalom
00050000-5638-6c54-ffe7-37194af5c843	3233	Kalobje
00050000-5638-6c54-b029-c9f5f85ddf66	4246	Kamna Gorica
00050000-5638-6c54-9f23-4b6b4f3c9713	2351	Kamnica
00050000-5638-6c54-d8e5-911b1b7b55e1	1241	Kamnik
00050000-5638-6c54-273d-b584ec2bb2d0	5213	Kanal
00050000-5638-6c54-d726-00e223ba6c0b	8258	Kapele
00050000-5638-6c54-90b4-a87844cd6d4d	2362	Kapla
00050000-5638-6c54-f659-da0537d709bc	2325	Kidričevo
00050000-5638-6c54-23cb-3b5d85fd1500	1412	Kisovec
00050000-5638-6c54-a0d5-3ad8cd093428	6253	Knežak
00050000-5638-6c54-6dde-f49a6f5231a9	5222	Kobarid
00050000-5638-6c54-b9ea-527eaee5294f	9227	Kobilje
00050000-5638-6c54-b0c3-c121b4597745	1330	Kočevje
00050000-5638-6c54-b9dd-51c855aa0efa	1338	Kočevska Reka
00050000-5638-6c54-d7b7-724afa7dff4f	2276	Kog
00050000-5638-6c54-4ee1-a1620adf47d4	5211	Kojsko
00050000-5638-6c54-c760-7d74438b7c41	6223	Komen
00050000-5638-6c54-a91d-d60b3140a82e	1218	Komenda
00050000-5638-6c54-ecf0-26d8bcbdc539	6000	Koper/Capodistria 
00050000-5638-6c54-5a6c-91d1887955b6	6001	Koper/Capodistria - poštni predali
00050000-5638-6c54-3a7d-a4b11fc51a4b	8282	Koprivnica
00050000-5638-6c54-6419-b8f7e1c216b1	5296	Kostanjevica na Krasu
00050000-5638-6c54-ce0f-9dba1b6dd8e5	8311	Kostanjevica na Krki
00050000-5638-6c54-fa11-30bea744cce9	1336	Kostel
00050000-5638-6c54-b0db-03fc67c2ce8e	6256	Košana
00050000-5638-6c54-4728-19e929c5f2fa	2394	Kotlje
00050000-5638-6c54-0520-63e5f4c892e0	6240	Kozina
00050000-5638-6c54-7ca2-c58cc66ac2b6	3260	Kozje
00050000-5638-6c54-96c3-ef85e84d0a5b	4000	Kranj 
00050000-5638-6c54-fb2e-0e2af7909c1d	4001	Kranj - poštni predali
00050000-5638-6c54-7601-476cd956a6c0	4280	Kranjska Gora
00050000-5638-6c54-ce11-4abbcf242a1d	1281	Kresnice
00050000-5638-6c54-1a23-885be878098a	4294	Križe
00050000-5638-6c54-b02a-fc8ed53d18e4	9206	Križevci
00050000-5638-6c54-25a4-87a03391bdac	9242	Križevci pri Ljutomeru
00050000-5638-6c54-5f41-0387bfa607c4	1301	Krka
00050000-5638-6c54-896c-13fb598719c3	8296	Krmelj
00050000-5638-6c54-2952-09313584bb92	4245	Kropa
00050000-5638-6c54-b935-cd11911fdbf1	8262	Krška vas
00050000-5638-6c54-d2ad-3d335f672354	8270	Krško
00050000-5638-6c54-324c-304ba0725e6c	9263	Kuzma
00050000-5638-6c54-88f6-3e6c3a18feae	2318	Laporje
00050000-5638-6c54-2be0-6a9667c8bf3c	3270	Laško
00050000-5638-6c54-e7b1-e0bbae5686ff	1219	Laze v Tuhinju
00050000-5638-6c54-f2fd-ec898d1e38cb	2230	Lenart v Slovenskih goricah
00050000-5638-6c54-f55e-c88b45aac326	9220	Lendava/Lendva
00050000-5638-6c54-9e94-bfb529bdd152	4248	Lesce
00050000-5638-6c54-219b-6b466a9c96fd	3261	Lesično
00050000-5638-6c54-4578-a9e94d0d2809	8273	Leskovec pri Krškem
00050000-5638-6c54-3e07-5f99ad99c23e	2372	Libeliče
00050000-5638-6c54-a7ea-949006d64851	2341	Limbuš
00050000-5638-6c54-3383-038034f5424e	1270	Litija
00050000-5638-6c54-ea27-98df178d0d59	3202	Ljubečna
00050000-5638-6c54-86d0-91f5bb2a13b5	1000	Ljubljana 
00050000-5638-6c54-b1d3-bebeceaccc2e	1001	Ljubljana - poštni predali
00050000-5638-6c54-6799-a778aa8c0c5a	1231	Ljubljana - Črnuče
00050000-5638-6c54-de27-5a819b6aa4b0	1261	Ljubljana - Dobrunje
00050000-5638-6c54-0a12-04ffab5d87d0	1260	Ljubljana - Polje
00050000-5638-6c54-bf49-bca3902ae640	1210	Ljubljana - Šentvid
00050000-5638-6c54-1907-d54e57f04537	1211	Ljubljana - Šmartno
00050000-5638-6c54-d5e3-024756cdcd54	3333	Ljubno ob Savinji
00050000-5638-6c54-8f4a-938e6392e7eb	9240	Ljutomer
00050000-5638-6c54-ba30-f5396e500b70	3215	Loče
00050000-5638-6c54-4eeb-7cb5219fb5cc	5231	Log pod Mangartom
00050000-5638-6c54-3de2-7bf1443a471d	1358	Log pri Brezovici
00050000-5638-6c54-df1a-4d75b002ef2c	1370	Logatec
00050000-5638-6c54-fbae-fc886a14a919	1371	Logatec
00050000-5638-6c54-acc4-b188befd3876	1434	Loka pri Zidanem Mostu
00050000-5638-6c54-04d9-2f0b78a25914	3223	Loka pri Žusmu
00050000-5638-6c54-e042-8e3e652d9aeb	6219	Lokev
00050000-5638-6c54-ad10-e41954d7f7ec	1318	Loški Potok
00050000-5638-6c54-3ef5-3454653598f6	2324	Lovrenc na Dravskem polju
00050000-5638-6c54-5fd0-15116415dc9f	2344	Lovrenc na Pohorju
00050000-5638-6c54-0bdd-ace52f4f17ac	3334	Luče
00050000-5638-6c54-5d91-04b1ceedec21	1225	Lukovica
00050000-5638-6c54-f51b-9e3951cb728a	9202	Mačkovci
00050000-5638-6c54-5d2d-82f926f1c0d6	2322	Majšperk
00050000-5638-6c54-3938-3cbfcdf28709	2321	Makole
00050000-5638-6c54-6eb7-76cb301ab144	9243	Mala Nedelja
00050000-5638-6c54-ad07-2bac86b66238	2229	Malečnik
00050000-5638-6c54-3c25-03717a3b2a77	6273	Marezige
00050000-5638-6c54-945e-d77a01b33330	2000	Maribor 
00050000-5638-6c54-75ad-7f8a5fa13757	2001	Maribor - poštni predali
00050000-5638-6c54-5ff1-6b6c06f7c7c3	2206	Marjeta na Dravskem polju
00050000-5638-6c54-204f-f0a1042b7c87	2281	Markovci
00050000-5638-6c54-1e25-c6df0026e9cc	9221	Martjanci
00050000-5638-6c54-3bbb-bf93147c73af	6242	Materija
00050000-5638-6c54-d41a-882ce8eb8e6e	4211	Mavčiče
00050000-5638-6c54-8067-fb6a37ba8c69	1215	Medvode
00050000-5638-6c54-3d16-2384486210b8	1234	Mengeš
00050000-5638-6c54-7f6d-3aa644329c82	8330	Metlika
00050000-5638-6c54-e561-5e5425df401a	2392	Mežica
00050000-5638-6c54-bc97-8f42924a4871	2204	Miklavž na Dravskem polju
00050000-5638-6c54-2cb5-c88986cae3c5	2275	Miklavž pri Ormožu
00050000-5638-6c54-7cdd-82b115602ae0	5291	Miren
00050000-5638-6c54-014c-877ab19faa13	8233	Mirna
00050000-5638-6c54-2c00-5d51982347e8	8216	Mirna Peč
00050000-5638-6c54-71a6-3bcd945960f7	2382	Mislinja
00050000-5638-6c54-c7e7-7c4e05dfdb90	4281	Mojstrana
00050000-5638-6c54-fc7b-f0db67835c51	8230	Mokronog
00050000-5638-6c54-2f8b-d120794a388c	1251	Moravče
00050000-5638-6c54-019c-2e5cff416374	9226	Moravske Toplice
00050000-5638-6c54-3e9d-61de9c78ebf0	5216	Most na Soči
00050000-5638-6c54-44d0-18ca511ade4e	1221	Motnik
00050000-5638-6c54-435e-89d9ad95d438	3330	Mozirje
00050000-5638-6c54-b983-77175b7291c0	9000	Murska Sobota 
00050000-5638-6c54-76d9-344c88a6664a	9001	Murska Sobota - poštni predali
00050000-5638-6c54-a83b-32498252ae33	2366	Muta
00050000-5638-6c54-fb0d-3afae89f3e53	4202	Naklo
00050000-5638-6c54-0ded-5ff7e54e1bd7	3331	Nazarje
00050000-5638-6c54-64e5-73f6a8004964	1357	Notranje Gorice
00050000-5638-6c54-df3f-92a4f3e3ce74	3203	Nova Cerkev
00050000-5638-6c54-ead6-4c45692339a2	5000	Nova Gorica 
00050000-5638-6c54-3aed-ca89aa1560f3	5001	Nova Gorica - poštni predali
00050000-5638-6c54-8354-5f08873c25bb	1385	Nova vas
00050000-5638-6c54-6034-c957486c7817	8000	Novo mesto
00050000-5638-6c54-94dd-3b402d2cfa9c	8001	Novo mesto - poštni predali
00050000-5638-6c54-9e3a-e897ef53d0c4	6243	Obrov
00050000-5638-6c54-842e-f8ffcbba7882	9233	Odranci
00050000-5638-6c54-66c7-3c5390d4bc0d	2317	Oplotnica
00050000-5638-6c54-0934-e038b65c4489	2312	Orehova vas
00050000-5638-6c54-d18c-5cf03547650a	2270	Ormož
00050000-5638-6c54-cd60-6ea006bd8225	1316	Ortnek
00050000-5638-6c54-0590-904132e06741	1337	Osilnica
00050000-5638-6c54-2707-d0ccb5f0594b	8222	Otočec
00050000-5638-6c54-8f00-acceeacced1a	2361	Ožbalt
00050000-5638-6c54-2143-f15055768dd6	2231	Pernica
00050000-5638-6c54-c890-9b94fde4148a	2211	Pesnica pri Mariboru
00050000-5638-6c54-e650-cae655e8f0fc	9203	Petrovci
00050000-5638-6c54-9086-bc4a916e56c7	3301	Petrovče
00050000-5638-6c54-e08a-244ca3be4209	6330	Piran/Pirano
00050000-5638-6c54-e770-e90aa5926b0f	8255	Pišece
00050000-5638-6c54-e14c-1062de0cb164	6257	Pivka
00050000-5638-6c54-0025-9ab7188510e2	6232	Planina
00050000-5638-6c54-6533-512572cd6b39	3225	Planina pri Sevnici
00050000-5638-6c54-aeb5-0bab4fb9d029	6276	Pobegi
00050000-5638-6c54-4845-7e245a35e274	8312	Podbočje
00050000-5638-6c54-4b5c-f80f751684ac	5243	Podbrdo
00050000-5638-6c54-6990-80be62c389d2	3254	Podčetrtek
00050000-5638-6c54-ebea-ba35ac2c6ffd	2273	Podgorci
00050000-5638-6c54-ca55-a924b4b9f084	6216	Podgorje
00050000-5638-6c54-61df-603ce4de223e	2381	Podgorje pri Slovenj Gradcu
00050000-5638-6c54-72b9-88f3e0ba50f5	6244	Podgrad
00050000-5638-6c54-e24f-f20e34101ea8	1414	Podkum
00050000-5638-6c54-f22e-ece06b120cb1	2286	Podlehnik
00050000-5638-6c54-1ff7-170e7d9c7d9c	5272	Podnanos
00050000-5638-6c54-2f88-797863522834	4244	Podnart
00050000-5638-6c54-3e30-f8232a26207c	3241	Podplat
00050000-5638-6c54-4eb2-122de9d112ca	3257	Podsreda
00050000-5638-6c54-2c2d-365cc7d4f56d	2363	Podvelka
00050000-5638-6c54-0f67-af6ab12e73a3	2208	Pohorje
00050000-5638-6c54-8bd2-194c88c77379	2257	Polenšak
00050000-5638-6c54-c3aa-346b94c45ee3	1355	Polhov Gradec
00050000-5638-6c54-34c1-6a2c53e4ab54	4223	Poljane nad Škofjo Loko
00050000-5638-6c54-6dd9-065b08203bbc	2319	Poljčane
00050000-5638-6c54-e695-62014b7a073f	1272	Polšnik
00050000-5638-6c54-6a4f-a02b51d25f70	3313	Polzela
00050000-5638-6c54-2e2a-6917530f8b22	3232	Ponikva
00050000-5638-6c54-2e4c-dc8d89026a60	6320	Portorož/Portorose
00050000-5638-6c54-987c-8bb47cc78da3	6230	Postojna
00050000-5638-6c54-f11c-8f27d2792453	2331	Pragersko
00050000-5638-6c54-3a04-bc7a59b47760	3312	Prebold
00050000-5638-6c54-31f5-6d5b54186ca1	4205	Preddvor
00050000-5638-6c54-bb78-6280c4ac8033	6255	Prem
00050000-5638-6c54-5eba-100499128a56	1352	Preserje
00050000-5638-6c54-544c-33183c25eb86	6258	Prestranek
00050000-5638-6c54-4a1e-2423a1024691	2391	Prevalje
00050000-5638-6c54-9530-d3d9f965c87c	3262	Prevorje
00050000-5638-6c54-ad45-0c5b51d26eee	1276	Primskovo 
00050000-5638-6c54-4037-a3cfc57d9559	3253	Pristava pri Mestinju
00050000-5638-6c54-27c2-556f086c7195	9207	Prosenjakovci/Partosfalva
00050000-5638-6c54-fa71-64945a2a75aa	5297	Prvačina
00050000-5638-6c54-8897-6c229c144d13	2250	Ptuj
00050000-5638-6c54-edcf-f633e34e6976	2323	Ptujska Gora
00050000-5638-6c54-a29c-048d8096723f	9201	Puconci
00050000-5638-6c54-c04d-4cb0e1cd518d	2327	Rače
00050000-5638-6c54-2f4c-5989cfd3dcfc	1433	Radeče
00050000-5638-6c54-4923-eff01b05489d	9252	Radenci
00050000-5638-6c54-4184-3f6f403d304e	2360	Radlje ob Dravi
00050000-5638-6c54-c26d-ad5a95a10664	1235	Radomlje
00050000-5638-6c54-3a37-a105a2445883	4240	Radovljica
00050000-5638-6c54-e429-096fc77d6dab	8274	Raka
00050000-5638-6c54-22ee-6c0f8442e4a2	1381	Rakek
00050000-5638-6c54-213c-dba020f35fe4	4283	Rateče - Planica
00050000-5638-6c54-86ca-7aad2232d550	2390	Ravne na Koroškem
00050000-5638-6c54-810c-38b55f1e378c	9246	Razkrižje
00050000-5638-6c54-5676-4780a676822a	3332	Rečica ob Savinji
00050000-5638-6c54-77f3-c1c7c30c3e65	5292	Renče
00050000-5638-6c54-9020-2e37612d61a0	1310	Ribnica
00050000-5638-6c54-06c9-83abfaf51c2f	2364	Ribnica na Pohorju
00050000-5638-6c54-2180-c642ec336e1c	3272	Rimske Toplice
00050000-5638-6c54-8115-febbccd9aab8	1314	Rob
00050000-5638-6c54-d65c-bdf9a1a672b7	5215	Ročinj
00050000-5638-6c54-515a-618ab39510ec	3250	Rogaška Slatina
00050000-5638-6c54-523f-74c773b6822b	9262	Rogašovci
00050000-5638-6c54-0fb4-e97cbd3614a2	3252	Rogatec
00050000-5638-6c54-4da9-3ffc25a515c8	1373	Rovte
00050000-5638-6c54-13f2-42e34a55ae2e	2342	Ruše
00050000-5638-6c54-5b31-21aba9e5f2ac	1282	Sava
00050000-5638-6c54-a02f-0fd900e32c70	6333	Sečovlje/Sicciole
00050000-5638-6c54-1f4e-558ba0687d51	4227	Selca
00050000-5638-6c54-e3a7-cbdcf67b1aad	2352	Selnica ob Dravi
00050000-5638-6c54-e53c-1a3b27eb3afe	8333	Semič
00050000-5638-6c54-f2e7-e11f33e92440	8281	Senovo
00050000-5638-6c54-eee4-0dbc0bf9bc5b	6224	Senožeče
00050000-5638-6c54-5040-f610764b812c	8290	Sevnica
00050000-5638-6c54-bc8a-1546e877fe98	6210	Sežana
00050000-5638-6c54-6edd-82604b0ce450	2214	Sladki Vrh
00050000-5638-6c54-b375-75b440ed61b2	5283	Slap ob Idrijci
00050000-5638-6c54-9853-bbc52475cde8	2380	Slovenj Gradec
00050000-5638-6c54-8af9-d3dc75651ee3	2310	Slovenska Bistrica
00050000-5638-6c54-4c6e-8a9efc175941	3210	Slovenske Konjice
00050000-5638-6c54-6455-6856d5923735	1216	Smlednik
00050000-5638-6c54-ff97-6a7f0033c895	5232	Soča
00050000-5638-6c54-c8d8-9e41310319a3	1317	Sodražica
00050000-5638-6c54-354d-0ada7ad1cf29	3335	Solčava
00050000-5638-6c54-1f6d-7ba658bca1bd	5250	Solkan
00050000-5638-6c54-8f64-3634b8341dae	4229	Sorica
00050000-5638-6c54-fdbe-4dfd1f30e37b	4225	Sovodenj
00050000-5638-6c54-f8ca-72afaf44145c	5281	Spodnja Idrija
00050000-5638-6c54-5289-b43eb05043ec	2241	Spodnji Duplek
00050000-5638-6c54-3e02-f83ae2edbe16	9245	Spodnji Ivanjci
00050000-5638-6c54-d845-198753272bc9	2277	Središče ob Dravi
00050000-5638-6c54-289a-e7391c8f7d16	4267	Srednja vas v Bohinju
00050000-5638-6c54-6996-0b28cebba900	8256	Sromlje 
00050000-5638-6c54-e31d-3e4bd25c2a2f	5224	Srpenica
00050000-5638-6c54-0705-3f0084d9c9e0	1242	Stahovica
00050000-5638-6c54-dcc7-3b4d0a5e524a	1332	Stara Cerkev
00050000-5638-6c54-c871-1e2736ed4745	8342	Stari trg ob Kolpi
00050000-5638-6c54-f987-88e6c884a4dd	1386	Stari trg pri Ložu
00050000-5638-6c54-bf01-c60231d2bf0e	2205	Starše
00050000-5638-6c54-c1c5-70414a0eb753	2289	Stoperce
00050000-5638-6c54-9c3c-f1662807e9b9	8322	Stopiče
00050000-5638-6c54-5d2a-b76ad8b8a6b3	3206	Stranice
00050000-5638-6c54-85f0-f89e285e5a81	8351	Straža
00050000-5638-6c54-b8df-c41a1aa0460f	1313	Struge
00050000-5638-6c54-ff1f-3051e8f56b00	8293	Studenec
00050000-5638-6c54-5eab-1be85670e06d	8331	Suhor
00050000-5638-6c54-8eb3-93cc015dfd3b	2233	Sv. Ana v Slovenskih goricah
00050000-5638-6c54-3fe5-118217307131	2235	Sv. Trojica v Slovenskih goricah
00050000-5638-6c54-5643-6376d6a40d7b	2353	Sveti Duh na Ostrem Vrhu
00050000-5638-6c54-b576-ad4e2d60b903	9244	Sveti Jurij ob Ščavnici
00050000-5638-6c54-7c97-1483bfd2bc9d	3264	Sveti Štefan
00050000-5638-6c54-0c4d-1ac857123ad9	2258	Sveti Tomaž
00050000-5638-6c54-1442-0e95cdf5812c	9204	Šalovci
00050000-5638-6c54-41f3-19d7af59b779	5261	Šempas
00050000-5638-6c54-78ed-761d2f350317	5290	Šempeter pri Gorici
00050000-5638-6c54-e8ff-2128d6a1d70a	3311	Šempeter v Savinjski dolini
00050000-5638-6c54-f68f-25b45d565aa5	4208	Šenčur
00050000-5638-6c54-968d-81b905f613dc	2212	Šentilj v Slovenskih goricah
00050000-5638-6c54-7e61-03f16f2cde82	8297	Šentjanž
00050000-5638-6c54-22c2-deb577408e6c	2373	Šentjanž pri Dravogradu
00050000-5638-6c54-f9f5-5a65b5e6caba	8310	Šentjernej
00050000-5638-6c54-c3a5-abe1e76e4527	3230	Šentjur
00050000-5638-6c54-750e-01fa29e03dde	3271	Šentrupert
00050000-5638-6c54-bd45-4bddebff33d8	8232	Šentrupert
00050000-5638-6c54-00ce-50057d1f1769	1296	Šentvid pri Stični
00050000-5638-6c54-7604-ace2782622db	8275	Škocjan
00050000-5638-6c54-8e72-c8143a007ea7	6281	Škofije
00050000-5638-6c54-d392-e393ad7ba61b	4220	Škofja Loka
00050000-5638-6c54-0f4c-3b69984951b7	3211	Škofja vas
00050000-5638-6c54-fe80-3a163ad89403	1291	Škofljica
00050000-5638-6c54-7553-32e8e8af5838	6274	Šmarje
00050000-5638-6c54-2189-1f46abd88566	1293	Šmarje - Sap
00050000-5638-6c54-3425-ddce3b919241	3240	Šmarje pri Jelšah
00050000-5638-6c54-a5d2-662715c66dae	8220	Šmarješke Toplice
00050000-5638-6c54-bd79-dab382412de4	2315	Šmartno na Pohorju
00050000-5638-6c54-7498-4e26a5a7f292	3341	Šmartno ob Dreti
00050000-5638-6c54-c5aa-469d06439c13	3327	Šmartno ob Paki
00050000-5638-6c54-e282-c3a9542cd868	1275	Šmartno pri Litiji
00050000-5638-6c54-c1d0-d0010883449b	2383	Šmartno pri Slovenj Gradcu
00050000-5638-6c54-488f-4ad678d7e9db	3201	Šmartno v Rožni dolini
00050000-5638-6c54-a3cf-18035f9cf2a8	3325	Šoštanj
00050000-5638-6c54-a9d1-cf555602b9ab	6222	Štanjel
00050000-5638-6c54-c8a5-32580c642237	3220	Štore
00050000-5638-6c54-19fa-466ad323cef1	3304	Tabor
00050000-5638-6c54-3ae2-371665ffe126	3221	Teharje
00050000-5638-6c54-9ee4-fb346943646f	9251	Tišina
00050000-5638-6c54-bd8d-dddf1421d542	5220	Tolmin
00050000-5638-6c54-c5bc-57ebfe6f389e	3326	Topolšica
00050000-5638-6c54-abcd-87a61ffd9cc8	2371	Trbonje
00050000-5638-6c54-2623-d106ba1bdf6e	1420	Trbovlje
00050000-5638-6c54-15f8-6b5c2c94020f	8231	Trebelno 
00050000-5638-6c54-47b0-95f80fff4449	8210	Trebnje
00050000-5638-6c54-1332-e37756d824c3	5252	Trnovo pri Gorici
00050000-5638-6c54-83e9-860cfe3b8f28	2254	Trnovska vas
00050000-5638-6c54-6415-0b8144af3ec9	1222	Trojane
00050000-5638-6c54-a73e-ee150306e214	1236	Trzin
00050000-5638-6c54-b237-4bfc41e7a02a	4290	Tržič
00050000-5638-6c54-e803-4f9d57f3e97f	8295	Tržišče
00050000-5638-6c54-2d19-ccb6edfc69a4	1311	Turjak
00050000-5638-6c54-5552-8d9dfbb3d5a3	9224	Turnišče
00050000-5638-6c54-a869-c2f4bd32e15a	8323	Uršna sela
00050000-5638-6c54-7c7b-8e9570b83fee	1252	Vače
00050000-5638-6c54-0743-5e9ac38e28ca	3320	Velenje 
00050000-5638-6c54-baaa-11179aaa5e95	3322	Velenje - poštni predali
00050000-5638-6c54-af8c-feda7af6b3a0	8212	Velika Loka
00050000-5638-6c54-4e99-9a73083db105	2274	Velika Nedelja
00050000-5638-6c54-e866-7922d7f36a3a	9225	Velika Polana
00050000-5638-6c54-b402-dc31fda0a533	1315	Velike Lašče
00050000-5638-6c54-a0e6-c1fb849f0b7d	8213	Veliki Gaber
00050000-5638-6c54-740e-3e10b8ab11ba	9241	Veržej
00050000-5638-6c54-8201-81090b9c6f60	1312	Videm - Dobrepolje
00050000-5638-6c54-ffe7-550335d76393	2284	Videm pri Ptuju
00050000-5638-6c54-8a66-d243bc619d9a	8344	Vinica
00050000-5638-6c54-58ad-7da567b8f995	5271	Vipava
00050000-5638-6c54-64e4-1651bf2f19dd	4212	Visoko
00050000-5638-6c54-d1bf-539ed5db37a1	1294	Višnja Gora
00050000-5638-6c54-5e9e-f507ca66f74f	3205	Vitanje
00050000-5638-6c54-2b3f-cfdc0ceb40dc	2255	Vitomarci
00050000-5638-6c54-89d2-55ffb605d9a7	1217	Vodice
00050000-5638-6c54-427c-15338de10aca	3212	Vojnik\t
00050000-5638-6c54-47d9-ecf53f615b9b	5293	Volčja Draga
00050000-5638-6c54-7238-35ee5daed04d	2232	Voličina
00050000-5638-6c54-6f37-63847649e603	3305	Vransko
00050000-5638-6c54-c01f-e80e4f1b4a60	6217	Vremski Britof
00050000-5638-6c54-d4b6-b117d8fcc653	1360	Vrhnika
00050000-5638-6c54-f1d0-ebcbfa88d82f	2365	Vuhred
00050000-5638-6c54-a7a5-369810d26596	2367	Vuzenica
00050000-5638-6c54-123d-09f695eb8250	8292	Zabukovje 
00050000-5638-6c54-4bbe-eb34263712f6	1410	Zagorje ob Savi
00050000-5638-6c54-3296-dddccfd5e1e4	1303	Zagradec
00050000-5638-6c54-66d8-a99c0219915a	2283	Zavrč
00050000-5638-6c54-bd1f-eef08438cf6b	8272	Zdole 
00050000-5638-6c54-d3f1-bc3c752bc743	4201	Zgornja Besnica
00050000-5638-6c54-0d52-a615de8cbb8c	2242	Zgornja Korena
00050000-5638-6c54-6627-c483ccd33c49	2201	Zgornja Kungota
00050000-5638-6c54-9595-8b35f0a64939	2316	Zgornja Ložnica
00050000-5638-6c54-f741-de5143bbd30b	2314	Zgornja Polskava
00050000-5638-6c54-03d3-a42849572143	2213	Zgornja Velka
00050000-5638-6c54-7d80-15fd7aa05a43	4247	Zgornje Gorje
00050000-5638-6c54-5b98-9132e0b0c927	4206	Zgornje Jezersko
00050000-5638-6c54-a724-57f2c648145c	2285	Zgornji Leskovec
00050000-5638-6c54-140f-72ddbad551dd	1432	Zidani Most
00050000-5638-6c54-49ad-b22ef5a1f0f5	3214	Zreče
00050000-5638-6c54-4c4a-472996ced9ce	4209	Žabnica
00050000-5638-6c54-73be-769523c97796	3310	Žalec
00050000-5638-6c54-15ac-ff8c8ab169d1	4228	Železniki
00050000-5638-6c54-6672-d59430c24d8f	2287	Žetale
00050000-5638-6c54-2bed-b755b10bd16f	4226	Žiri
00050000-5638-6c54-b706-aa64470d4fc6	4274	Žirovnica
00050000-5638-6c54-2a6e-64c5a94dab6f	8360	Žužemberk
\.


--
-- TOC entry 3149 (class 0 OID 24938295)
-- Dependencies: 239
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 24937871)
-- Dependencies: 212
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 24937625)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5638-6c57-4a07-eca0b95dd3eb	00080000-5638-6c57-9266-b30de1971c56	\N	00040000-5638-6c55-8019-b218bef221f1	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5638-6c57-012f-b81f0429f1cf	00080000-5638-6c57-9266-b30de1971c56	\N	00040000-5638-6c55-8019-b218bef221f1	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5638-6c57-51fb-357dbecf6bc0	00080000-5638-6c57-2de6-af3207842df7	\N	00040000-5638-6c55-8019-b218bef221f1	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3112 (class 0 OID 24937769)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5638-6c55-5930-5043aa3a9998	novo leto	1	1	\N	t
00430000-5638-6c55-eda2-001d849f8fa3	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5638-6c55-228c-0a91a48a440a	dan upora proti okupatorju	27	4	\N	t
00430000-5638-6c55-104d-7489a2821d69	praznik dela	1	5	\N	t
00430000-5638-6c55-3bf7-375b9cf84cf2	praznik dela	2	5	\N	t
00430000-5638-6c55-da42-cf7d25f73692	dan Primoža Trubarja	8	6	\N	f
00430000-5638-6c55-6444-47aed9dcf21d	dan državnosti	25	6	\N	t
00430000-5638-6c55-4b35-fd469c57f650	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5638-6c55-2343-62b19376dbc8	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5638-6c55-a1c5-5efb1077bb12	dan suverenosti	25	10	\N	f
00430000-5638-6c55-344b-22728c91cb1a	dan spomina na mrtve	1	11	\N	t
00430000-5638-6c55-c117-2f5c90dc6bc1	dan Rudolfa Maistra	23	11	\N	f
00430000-5638-6c55-56e9-2154d67dfea5	božič	25	12	\N	t
00430000-5638-6c55-1519-cf41bdb57f8f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5638-6c55-b435-0eab33a97253	Marijino vnebovzetje	15	8	\N	t
00430000-5638-6c55-9cbc-442291372c9e	dan reformacije	31	10	\N	t
00430000-5638-6c55-93eb-1d9aa8258865	velikonočna nedelja	27	3	2016	t
00430000-5638-6c55-0e47-e91fb3300b4e	velikonočna nedelja	16	4	2017	t
00430000-5638-6c55-6ddc-34cb13514f14	velikonočna nedelja	1	4	2018	t
00430000-5638-6c55-5471-24bd03c1a419	velikonočna nedelja	21	4	2019	t
00430000-5638-6c55-d034-a31fead5e891	velikonočna nedelja	12	4	2020	t
00430000-5638-6c55-c1ac-5ffe284ad1b8	velikonočna nedelja	4	4	2021	t
00430000-5638-6c55-f75d-4b0caadc5775	velikonočna nedelja	17	4	2022	t
00430000-5638-6c55-c515-e44273a4a960	velikonočna nedelja	9	4	2023	t
00430000-5638-6c55-bd99-f4c526272b88	velikonočna nedelja	31	3	2024	t
00430000-5638-6c55-a8a2-4f8f6f5f04ab	velikonočna nedelja	20	4	2025	t
00430000-5638-6c55-1bfe-55ca94da29eb	velikonočna nedelja	5	4	2026	t
00430000-5638-6c55-c050-d426693a7f28	velikonočna nedelja	28	3	2027	t
00430000-5638-6c55-5fc5-3065727b3f60	velikonočna nedelja	16	4	2028	t
00430000-5638-6c55-e4ea-9e5b36008164	velikonočna nedelja	1	4	2029	t
00430000-5638-6c55-d7fd-3864e4ecdfbb	velikonočna nedelja	21	4	2030	t
00430000-5638-6c55-d265-1203bbbbcf93	velikonočni ponedeljek	28	3	2016	t
00430000-5638-6c55-a90a-09b54f2dd64e	velikonočni ponedeljek	17	4	2017	t
00430000-5638-6c55-f767-526ca161a155	velikonočni ponedeljek	2	4	2018	t
00430000-5638-6c55-1193-7f5313c815f9	velikonočni ponedeljek	22	4	2019	t
00430000-5638-6c55-7af2-14dcd665a18e	velikonočni ponedeljek	13	4	2020	t
00430000-5638-6c55-6728-36f12f46832d	velikonočni ponedeljek	5	4	2021	t
00430000-5638-6c55-427b-3965b8d5a75d	velikonočni ponedeljek	18	4	2022	t
00430000-5638-6c55-75ea-5705315b2296	velikonočni ponedeljek	10	4	2023	t
00430000-5638-6c55-b7cc-3b11cd927a68	velikonočni ponedeljek	1	4	2024	t
00430000-5638-6c55-3e4e-c527e17cedfd	velikonočni ponedeljek	21	4	2025	t
00430000-5638-6c55-9f66-110398804467	velikonočni ponedeljek	6	4	2026	t
00430000-5638-6c55-72d9-3ef2fbf06821	velikonočni ponedeljek	29	3	2027	t
00430000-5638-6c55-1be8-36dfa43e661f	velikonočni ponedeljek	17	4	2028	t
00430000-5638-6c55-9b4f-9662cbae5098	velikonočni ponedeljek	2	4	2029	t
00430000-5638-6c55-75dc-e24214a172f7	velikonočni ponedeljek	22	4	2030	t
00430000-5638-6c55-0c3a-0abf67e22680	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5638-6c55-c0df-66cbb4fb3442	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5638-6c55-81d6-0d9644c2f8ee	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5638-6c55-0ce3-9b92d565e2ea	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5638-6c55-eea6-976c9e215d40	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5638-6c55-aac6-4ba56c244570	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5638-6c55-f2f5-813eecf956a6	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5638-6c55-3411-f5f62b767094	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5638-6c55-fa31-34a255faa309	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5638-6c55-e041-794bf7fa9242	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5638-6c55-ad8f-25da7ae9a27e	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5638-6c55-b0f6-91041b7be832	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5638-6c55-b020-1f07bec5b1c2	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5638-6c55-e5c1-0a039a434cdd	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5638-6c55-0838-655847c2bde8	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3108 (class 0 OID 24937729)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 24937741)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 24937883)
-- Dependencies: 214
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 24938309)
-- Dependencies: 240
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 24938319)
-- Dependencies: 241
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5638-6c57-90b4-1e55a8b441a6	00080000-5638-6c57-4fa5-eca655f41dae	0987	AK
00190000-5638-6c57-d036-d34204c5ed96	00080000-5638-6c57-2de6-af3207842df7	0989	AK
00190000-5638-6c57-0066-6a10bd4be89c	00080000-5638-6c57-22a6-443b7976050c	0986	AK
00190000-5638-6c57-0e02-2762d197e176	00080000-5638-6c57-e67d-0783c9b353a8	0984	AK
00190000-5638-6c57-4f4c-16e84044a5e4	00080000-5638-6c57-fba0-5e7060b82dff	0983	AK
00190000-5638-6c57-0df3-8636b610076d	00080000-5638-6c57-1108-59637da9776a	0982	AK
00190000-5638-6c58-afd5-1a233957d5b6	00080000-5638-6c58-370a-698859ffedef	1001	AK
\.


--
-- TOC entry 3148 (class 0 OID 24938218)
-- Dependencies: 238
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5638-6c57-068d-ffdb07dbda0c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3152 (class 0 OID 24938327)
-- Dependencies: 242
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 24937912)
-- Dependencies: 218
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5638-6c57-0f76-90ea3a5bb6db	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5638-6c57-0209-559a4a761a1e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5638-6c57-ee31-0a3e485a41de	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5638-6c57-116a-1407dd2d135f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5638-6c57-8351-2d85c6d9b7e2	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5638-6c57-bc0a-716df4099b01	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5638-6c57-30e9-f9fc1410eaa3	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3120 (class 0 OID 24937856)
-- Dependencies: 210
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 24937846)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 24938057)
-- Dependencies: 231
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 24937987)
-- Dependencies: 225
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 24937703)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 24937465)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5638-6c58-370a-698859ffedef	00010000-5638-6c55-a436-1e0c56ab914d	2015-11-03 09:12:08	INS	a:0:{}
2	App\\Entity\\Option	00000000-5638-6c58-e2b1-3bfdf7e8950a	00010000-5638-6c55-a436-1e0c56ab914d	2015-11-03 09:12:08	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5638-6c58-afd5-1a233957d5b6	00010000-5638-6c55-a436-1e0c56ab914d	2015-11-03 09:12:08	INS	a:0:{}
\.


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3129 (class 0 OID 24937925)
-- Dependencies: 219
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 24937503)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5638-6c55-6f73-68977605e4c8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5638-6c55-c4db-1a457497c7a0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5638-6c55-8ec3-4297387dad2a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5638-6c55-ae55-ec6270ed3135	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5638-6c55-4226-e61fa4ee4812	planer	Planer dogodkov v koledarju	t
00020000-5638-6c55-a2a3-979481337cd6	kadrovska	Kadrovska služba	t
00020000-5638-6c55-462f-5abe07b2e066	arhivar	Ažuriranje arhivalij	t
00020000-5638-6c55-63db-fa91f41d6382	igralec	Igralec	t
00020000-5638-6c55-3dab-f814aa29a236	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5638-6c57-8437-094870d1b6c7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3087 (class 0 OID 24937487)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5638-6c55-e7ed-f424ab9bdb8c	00020000-5638-6c55-8ec3-4297387dad2a
00010000-5638-6c55-a436-1e0c56ab914d	00020000-5638-6c55-8ec3-4297387dad2a
00010000-5638-6c57-3ad1-03b6f71e317d	00020000-5638-6c57-8437-094870d1b6c7
\.


--
-- TOC entry 3131 (class 0 OID 24937939)
-- Dependencies: 221
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 24937877)
-- Dependencies: 213
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 24937823)
-- Dependencies: 207
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5638-6c57-0485-40ea6b27ebcf	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5638-6c57-7af3-a658bc2dc235	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5638-6c57-1937-8987eed49494	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3083 (class 0 OID 24937452)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5638-6c55-e11b-50214ad7dfa1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5638-6c55-07b9-cacd89fd7194	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5638-6c55-4795-413fb258f2a1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5638-6c55-981e-dcc1df2f0ea8	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5638-6c55-2d0b-d82b5ae1ac9c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3082 (class 0 OID 24937444)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5638-6c55-7ed5-c778df42a808	00230000-5638-6c55-981e-dcc1df2f0ea8	popa
00240000-5638-6c55-2e29-e4e9beb96714	00230000-5638-6c55-981e-dcc1df2f0ea8	oseba
00240000-5638-6c55-0685-9a20b11c0bf7	00230000-5638-6c55-981e-dcc1df2f0ea8	tippopa
00240000-5638-6c55-8287-88d7b7d516db	00230000-5638-6c55-981e-dcc1df2f0ea8	organizacijskaenota
00240000-5638-6c55-c935-1a8df9e06c23	00230000-5638-6c55-981e-dcc1df2f0ea8	sezona
00240000-5638-6c55-4c9b-fd1c91e19302	00230000-5638-6c55-981e-dcc1df2f0ea8	tipvaje
00240000-5638-6c55-4680-bd86c855925d	00230000-5638-6c55-07b9-cacd89fd7194	prostor
00240000-5638-6c55-d92e-baed00a82af1	00230000-5638-6c55-981e-dcc1df2f0ea8	besedilo
00240000-5638-6c55-3b02-d79e1eea24ae	00230000-5638-6c55-981e-dcc1df2f0ea8	uprizoritev
00240000-5638-6c55-5f08-9e093ab2747b	00230000-5638-6c55-981e-dcc1df2f0ea8	funkcija
00240000-5638-6c55-664d-a20e368710fb	00230000-5638-6c55-981e-dcc1df2f0ea8	tipfunkcije
00240000-5638-6c55-eb12-ee2b8995adab	00230000-5638-6c55-981e-dcc1df2f0ea8	alternacija
00240000-5638-6c55-0975-d33abac6bf84	00230000-5638-6c55-e11b-50214ad7dfa1	pogodba
00240000-5638-6c55-1665-d1b33f97d2a4	00230000-5638-6c55-981e-dcc1df2f0ea8	zaposlitev
00240000-5638-6c55-4393-1ea19fbeb241	00230000-5638-6c55-981e-dcc1df2f0ea8	zvrstuprizoritve
00240000-5638-6c55-e63c-4b207ea23124	00230000-5638-6c55-e11b-50214ad7dfa1	programdela
00240000-5638-6c55-f21c-1acaad7647d3	00230000-5638-6c55-981e-dcc1df2f0ea8	zapis
\.


--
-- TOC entry 3081 (class 0 OID 24937439)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1027d435-7110-4c5a-a4b4-e406eb775ba9	00240000-5638-6c55-7ed5-c778df42a808	0	1001
\.


--
-- TOC entry 3137 (class 0 OID 24938004)
-- Dependencies: 227
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5638-6c57-d25c-779b2e38bc41	000e0000-5638-6c57-6df1-e8e7077435bb	00080000-5638-6c57-9266-b30de1971c56	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5638-6c55-2ed9-4df87436e96e
00270000-5638-6c57-aee6-0f7b7695b769	000e0000-5638-6c57-6df1-e8e7077435bb	00080000-5638-6c57-9266-b30de1971c56	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5638-6c55-2ed9-4df87436e96e
\.


--
-- TOC entry 3097 (class 0 OID 24937587)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 24937833)
-- Dependencies: 208
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5638-6c57-9303-9f308aec9677	00180000-5638-6c57-1506-364b9fff7c25	000c0000-5638-6c57-cf21-8747bed56753	00090000-5638-6c57-d2a4-b1bf5b6b048f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-6c57-9bde-16c6e6dbec4d	00180000-5638-6c57-1506-364b9fff7c25	000c0000-5638-6c57-c4be-43e2af2c61e8	00090000-5638-6c57-00e9-952666b1f68c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-6c57-9499-b3ab1b47653a	00180000-5638-6c57-1506-364b9fff7c25	000c0000-5638-6c57-036f-0492bf575ebf	00090000-5638-6c57-d0e7-82a30796eb15	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-6c57-048e-55a2e2a3a40f	00180000-5638-6c57-1506-364b9fff7c25	000c0000-5638-6c57-ded8-cffea2e22cff	00090000-5638-6c57-2951-22e512af95bf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-6c57-46e6-320b049878d5	00180000-5638-6c57-1506-364b9fff7c25	000c0000-5638-6c57-9709-dfcc59ca32ad	00090000-5638-6c57-374c-34fca25cf549	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-6c57-5471-b9e18a460a64	00180000-5638-6c57-8962-7e95875cbed9	\N	00090000-5638-6c57-374c-34fca25cf549	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5638-6c57-9f37-091e7bd01661	00180000-5638-6c57-8962-7e95875cbed9	\N	00090000-5638-6c57-00e9-952666b1f68c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3140 (class 0 OID 24938045)
-- Dependencies: 230
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5638-6c55-b0bf-dad43a059f01	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5638-6c55-36ef-42b0392b5a06	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5638-6c55-5148-098e02cc0415	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5638-6c55-d717-6dcc19d7be5f	04	Režija	Režija	Režija	umetnik	30
000f0000-5638-6c55-b275-3597c5d3c9b9	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5638-6c55-13ed-2cd3f77f84e1	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5638-6c55-7b47-716ae3a6aacd	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5638-6c55-931a-a130a7db6edf	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5638-6c55-61fe-8a6e55d0be6a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5638-6c55-7503-3a20bd16543c	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5638-6c55-8be2-fdc41ad352e2	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5638-6c55-3c67-3695131f08a9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5638-6c55-00dd-cfb41763f4aa	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5638-6c55-512e-0b4815316be8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5638-6c55-8c67-df29eb9af2f0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5638-6c55-a639-d009c4e33bab	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5638-6c55-ade3-69627949ae3f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5638-6c55-2794-27592107eb0f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3094 (class 0 OID 24937538)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5638-6c57-c513-cdf79645d420	0001	šola	osnovna ali srednja šola
00400000-5638-6c57-6c3d-499ef7e272a6	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5638-6c57-261c-fd6bce19234a	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3153 (class 0 OID 24938338)
-- Dependencies: 243
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5638-6c54-a991-ce0fb4bbb494	01	Velika predstava	f	1.00	1.00
002b0000-5638-6c54-c51b-cab6ae6ff589	02	Mala predstava	f	0.50	0.50
002b0000-5638-6c54-c3a3-9e67275e3a85	03	Mala koprodukcija	t	0.40	1.00
002b0000-5638-6c54-7f86-ab2a135cb7e0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5638-6c54-2b9c-7d2059a8eb33	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3116 (class 0 OID 24937813)
-- Dependencies: 206
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5638-6c54-ee43-55f44be9b40c	0001	prva vaja	prva vaja
00420000-5638-6c54-5604-91b5dc204fcf	0002	tehnična vaja	tehnična vaja
00420000-5638-6c54-a6ad-26bedd6f43b7	0003	lučna vaja	lučna vaja
00420000-5638-6c54-7b5d-ddc49d6f081e	0004	kostumska vaja	kostumska vaja
00420000-5638-6c54-147d-2f04cd8255d8	0005	foto vaja	foto vaja
00420000-5638-6c54-cd55-ff126e0a1e2a	0006	1. glavna vaja	1. glavna vaja
00420000-5638-6c54-940c-fddf5a6ea685	0007	2. glavna vaja	2. glavna vaja
00420000-5638-6c54-eb2f-057b21cb39d9	0008	1. generalka	1. generalka
00420000-5638-6c54-d401-46915674c097	0009	2. generalka	2. generalka
00420000-5638-6c54-fbf0-eba38dfb1a2d	0010	odprta generalka	odprta generalka
00420000-5638-6c54-a2f5-bc9c41683b69	0011	obnovitvena vaja	obnovitvena vaja
00420000-5638-6c54-2f45-8c1957a662f4	0012	pevska vaja	pevska vaja
00420000-5638-6c54-d595-eca40298708f	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5638-6c54-43c3-49d59d254c1c	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3103 (class 0 OID 24937660)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 24937474)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5638-6c55-a436-1e0c56ab914d	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROWDLrL6c5/zN9VHOkqZcqa3A/8CsL9YK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5638-6c57-a85f-6600ac744cd6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5638-6c57-ad75-18769f97a176	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5638-6c57-08b3-6c357f0be4c3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5638-6c57-df38-9ee946eb5e63	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5638-6c57-8800-11014a381d25	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5638-6c57-df2a-fe702fc5c849	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5638-6c57-7652-bf1cc5f4c7f6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5638-6c57-439e-20d696e2a7c9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5638-6c57-cff6-53ec101f6e5a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5638-6c57-3ad1-03b6f71e317d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5638-6c55-e7ed-f424ab9bdb8c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 24938095)
-- Dependencies: 234
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5638-6c57-5c48-812e63e5a791	00160000-5638-6c57-af0e-15346ae51f96	\N	00140000-5638-6c55-818a-77f8e4c58a60	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5638-6c57-8351-2d85c6d9b7e2
000e0000-5638-6c57-6df1-e8e7077435bb	00160000-5638-6c57-56a9-eb5749a2023a	\N	00140000-5638-6c55-7141-27cd0ef00f1f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5638-6c57-bc0a-716df4099b01
000e0000-5638-6c57-522d-5c71b83f92bd	\N	\N	00140000-5638-6c55-7141-27cd0ef00f1f	00190000-5638-6c57-90b4-1e55a8b441a6	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5638-6c57-8351-2d85c6d9b7e2
000e0000-5638-6c57-9e52-82fddd0d3391	\N	\N	00140000-5638-6c55-7141-27cd0ef00f1f	00190000-5638-6c57-90b4-1e55a8b441a6	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5638-6c57-8351-2d85c6d9b7e2
000e0000-5638-6c57-e029-b880b7bf021e	\N	\N	00140000-5638-6c55-7141-27cd0ef00f1f	00190000-5638-6c57-90b4-1e55a8b441a6	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5638-6c57-0f76-90ea3a5bb6db
000e0000-5638-6c57-f93e-87823ab8fb32	\N	\N	00140000-5638-6c55-7141-27cd0ef00f1f	00190000-5638-6c57-90b4-1e55a8b441a6	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5638-6c57-0f76-90ea3a5bb6db
\.


--
-- TOC entry 3111 (class 0 OID 24937759)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5638-6c57-3fed-e3a5e1eb0339	\N	000e0000-5638-6c57-6df1-e8e7077435bb	1	
00200000-5638-6c57-48c2-7247bc13aa53	\N	000e0000-5638-6c57-6df1-e8e7077435bb	2	
00200000-5638-6c57-b246-db03207d34f3	\N	000e0000-5638-6c57-6df1-e8e7077435bb	3	
00200000-5638-6c57-2652-0b101f3c567b	\N	000e0000-5638-6c57-6df1-e8e7077435bb	4	
00200000-5638-6c57-78c8-88bbf496e177	\N	000e0000-5638-6c57-6df1-e8e7077435bb	5	
\.


--
-- TOC entry 3127 (class 0 OID 24937904)
-- Dependencies: 217
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 24938018)
-- Dependencies: 228
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5638-6c55-2ad6-8d9742ce7a3b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5638-6c55-7d2c-a9be6090177e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5638-6c55-bc12-11bb6bf19b55	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5638-6c55-bdb9-92ae5fc5b4cc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5638-6c55-2d19-d8b6f2b88557	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5638-6c55-90d3-8887366a7e37	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5638-6c55-8a51-623dcedf6351	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5638-6c55-610d-6d997abbb4bc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5638-6c55-2ed9-4df87436e96e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5638-6c55-5954-527359bad7de	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5638-6c55-0d68-18d783fccd27	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5638-6c55-14ee-3e175662c57b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5638-6c55-748d-3c847e8dc276	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5638-6c55-dbc5-a6e178051c87	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5638-6c55-62a7-4648ef0d3638	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5638-6c55-2a9a-ed19f95b3414	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5638-6c55-4773-1f4fba9f3a69	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5638-6c55-baa1-709e62724aeb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5638-6c55-e09f-fa943201dd5d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5638-6c55-6bda-414d04611084	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5638-6c55-c934-61317a978e4a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5638-6c55-fe7d-f9f674947714	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5638-6c55-807a-e235e4b9ced8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5638-6c55-cfca-946bd316000a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5638-6c55-4806-fa99de3e5603	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5638-6c55-2364-a50ee6e8030c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5638-6c55-f743-7779841c552b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5638-6c55-08b0-2c5312ca15be	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3156 (class 0 OID 24938385)
-- Dependencies: 246
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 24938357)
-- Dependencies: 245
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 24938397)
-- Dependencies: 247
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 24937976)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5638-6c57-5e35-fa3bd0c49874	00090000-5638-6c57-00e9-952666b1f68c	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-6c57-1a4a-8b82243d3636	00090000-5638-6c57-d0e7-82a30796eb15	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-6c57-a285-ca84190abcb8	00090000-5638-6c57-3034-4777e1eab95e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-6c57-e9d7-d3f26a018925	00090000-5638-6c57-36be-33da744452dc	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-6c57-0201-5039da1ec1d4	00090000-5638-6c57-8ba7-fdbb448b1283	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-6c57-0c1e-7cbf2ac4115e	00090000-5638-6c57-a7fe-c05a6258647f	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3114 (class 0 OID 24937802)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 24938085)
-- Dependencies: 233
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5638-6c55-818a-77f8e4c58a60	01	Drama	drama (SURS 01)
00140000-5638-6c55-12c1-cdb98a34c14e	02	Opera	opera (SURS 02)
00140000-5638-6c55-af7f-49b8bb4b5c7e	03	Balet	balet (SURS 03)
00140000-5638-6c55-8109-e6150a92fb12	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5638-6c55-48f6-37bf41c4c8a7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5638-6c55-7141-27cd0ef00f1f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5638-6c55-e50a-0128c4dd6780	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3133 (class 0 OID 24937966)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2580 (class 2606 OID 24937537)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 24938144)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 24938134)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 24937528)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 24938001)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 24938043)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 24938437)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 24937791)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 24937812)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 24938355)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 24937686)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 24938212)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 24937962)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 24937757)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 24937724)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 24937700)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 24937869)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 24938414)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 24938421)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2858 (class 2606 OID 24938445)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 24507018)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2715 (class 2606 OID 24937896)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 24937658)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 24937556)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 24937620)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 24937583)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 24937517)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2569 (class 2606 OID 24937502)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 24937902)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 24937938)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 24938080)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 24937611)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 24937646)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 24938307)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 24937875)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 24937636)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 24937776)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 24937745)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2647 (class 2606 OID 24937737)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 24937887)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 24938316)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 24938324)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24938294)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 24938336)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 24937920)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 24937860)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 24937851)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 24938067)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24937994)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 24937712)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 24937473)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 24937929)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 24937491)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2571 (class 2606 OID 24937511)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24937947)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 24937882)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 24937831)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 24937461)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 24937449)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 24937443)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 24938014)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 24937592)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 24937842)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 24938054)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 24937545)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 24938348)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 24937820)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 24937671)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 24937486)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 24938113)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 24937766)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 24937910)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 24938026)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 24938395)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 24938379)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 24938403)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 24937984)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 24937806)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 24938093)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 24937974)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 1259 OID 24937800)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2664 (class 1259 OID 24937801)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2665 (class 1259 OID 24937799)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2666 (class 1259 OID 24937798)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2667 (class 1259 OID 24937797)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2758 (class 1259 OID 24938015)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2759 (class 1259 OID 24938016)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 24938017)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2844 (class 1259 OID 24938416)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2845 (class 1259 OID 24938415)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2598 (class 1259 OID 24937613)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2599 (class 1259 OID 24937614)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2716 (class 1259 OID 24937903)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2831 (class 1259 OID 24938383)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2832 (class 1259 OID 24938382)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2833 (class 1259 OID 24938384)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2834 (class 1259 OID 24938381)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2835 (class 1259 OID 24938380)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2710 (class 1259 OID 24937889)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 24937888)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2655 (class 1259 OID 24937767)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2656 (class 1259 OID 24937768)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2740 (class 1259 OID 24937963)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 24937965)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2742 (class 1259 OID 24937964)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2630 (class 1259 OID 24937702)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 24937701)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2822 (class 1259 OID 24938337)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2774 (class 1259 OID 24938082)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2775 (class 1259 OID 24938083)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2776 (class 1259 OID 24938084)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2841 (class 1259 OID 24938404)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2783 (class 1259 OID 24938118)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2784 (class 1259 OID 24938115)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2785 (class 1259 OID 24938119)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2786 (class 1259 OID 24938117)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2787 (class 1259 OID 24938116)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2620 (class 1259 OID 24937673)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 24937672)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 24937586)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2728 (class 1259 OID 24937930)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2573 (class 1259 OID 24937518)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2574 (class 1259 OID 24937519)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2733 (class 1259 OID 24937950)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2734 (class 1259 OID 24937949)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2735 (class 1259 OID 24937948)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 24937623)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2604 (class 1259 OID 24937622)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2605 (class 1259 OID 24937624)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2643 (class 1259 OID 24937740)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2644 (class 1259 OID 24937738)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 24937739)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2553 (class 1259 OID 24937451)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2690 (class 1259 OID 24937855)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2691 (class 1259 OID 24937853)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2692 (class 1259 OID 24937852)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2693 (class 1259 OID 24937854)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2564 (class 1259 OID 24937492)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 24937493)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2719 (class 1259 OID 24937911)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2854 (class 1259 OID 24938438)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2756 (class 1259 OID 24938003)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 24938002)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2855 (class 1259 OID 24938446)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 24938447)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2705 (class 1259 OID 24937876)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2750 (class 1259 OID 24937995)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2751 (class 1259 OID 24937996)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 24938217)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2805 (class 1259 OID 24938216)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2806 (class 1259 OID 24938213)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 24938214)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2808 (class 1259 OID 24938215)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2609 (class 1259 OID 24937638)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 24937637)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2611 (class 1259 OID 24937639)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2722 (class 1259 OID 24937924)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2723 (class 1259 OID 24937923)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 24938317)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2815 (class 1259 OID 24938318)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2797 (class 1259 OID 24938148)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 24938149)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2799 (class 1259 OID 24938146)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2800 (class 1259 OID 24938147)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2746 (class 1259 OID 24937985)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 24937986)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2696 (class 1259 OID 24937864)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2697 (class 1259 OID 24937863)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 24937861)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2699 (class 1259 OID 24937862)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2793 (class 1259 OID 24938136)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 24938135)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2634 (class 1259 OID 24937713)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2637 (class 1259 OID 24937727)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2638 (class 1259 OID 24937726)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2639 (class 1259 OID 24937725)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2640 (class 1259 OID 24937728)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2654 (class 1259 OID 24937758)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2648 (class 1259 OID 24937746)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2649 (class 1259 OID 24937747)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2811 (class 1259 OID 24938308)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2830 (class 1259 OID 24938356)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2848 (class 1259 OID 24938422)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2849 (class 1259 OID 24938423)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2585 (class 1259 OID 24937558)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 24937557)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2594 (class 1259 OID 24937593)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 24937594)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 24937807)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2685 (class 1259 OID 24937845)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2686 (class 1259 OID 24937844)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2687 (class 1259 OID 24937843)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2668 (class 1259 OID 24937793)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2669 (class 1259 OID 24937794)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2670 (class 1259 OID 24937792)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2671 (class 1259 OID 24937796)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2672 (class 1259 OID 24937795)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2602 (class 1259 OID 24937612)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 24937546)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 24937547)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2626 (class 1259 OID 24937687)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 24937689)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2628 (class 1259 OID 24937688)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2629 (class 1259 OID 24937690)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2704 (class 1259 OID 24937870)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 24938081)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2788 (class 1259 OID 24938114)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 24938055)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 24938056)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2592 (class 1259 OID 24937584)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 24937585)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2743 (class 1259 OID 24937975)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 24937462)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 24937659)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2608 (class 1259 OID 24937621)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 24937450)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2827 (class 1259 OID 24938349)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 24937922)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2727 (class 1259 OID 24937921)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 24937821)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 24937822)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2801 (class 1259 OID 24938145)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 24937647)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 24938094)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2838 (class 1259 OID 24938396)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2820 (class 1259 OID 24938325)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 24938326)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2767 (class 1259 OID 24938044)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2684 (class 1259 OID 24937832)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 24937512)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2897 (class 2606 OID 24938618)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2896 (class 2606 OID 24938623)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2892 (class 2606 OID 24938643)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2898 (class 2606 OID 24938613)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2894 (class 2606 OID 24938633)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2893 (class 2606 OID 24938638)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2895 (class 2606 OID 24938628)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2934 (class 2606 OID 24938813)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2933 (class 2606 OID 24938818)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 24938823)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 24938988)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2967 (class 2606 OID 24938983)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 24938503)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2870 (class 2606 OID 24938508)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2915 (class 2606 OID 24938728)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2961 (class 2606 OID 24938968)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2962 (class 2606 OID 24938963)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2960 (class 2606 OID 24938973)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2963 (class 2606 OID 24938958)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2964 (class 2606 OID 24938953)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2913 (class 2606 OID 24938723)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2914 (class 2606 OID 24938718)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2891 (class 2606 OID 24938603)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2890 (class 2606 OID 24938608)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2925 (class 2606 OID 24938768)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 24938778)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2924 (class 2606 OID 24938773)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2880 (class 2606 OID 24938558)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 24938553)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 24938708)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 24938943)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 24938828)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2936 (class 2606 OID 24938833)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2935 (class 2606 OID 24938838)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2965 (class 2606 OID 24938978)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2939 (class 2606 OID 24938858)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2942 (class 2606 OID 24938843)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2938 (class 2606 OID 24938863)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2940 (class 2606 OID 24938853)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2941 (class 2606 OID 24938848)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2878 (class 2606 OID 24938548)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 24938543)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2866 (class 2606 OID 24938488)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2867 (class 2606 OID 24938483)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2919 (class 2606 OID 24938748)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2863 (class 2606 OID 24938463)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2862 (class 2606 OID 24938468)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 24938763)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2921 (class 2606 OID 24938758)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2922 (class 2606 OID 24938753)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2873 (class 2606 OID 24938518)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2874 (class 2606 OID 24938513)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2872 (class 2606 OID 24938523)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 24938583)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 24938573)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 24938578)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2859 (class 2606 OID 24938448)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2903 (class 2606 OID 24938683)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2905 (class 2606 OID 24938673)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2906 (class 2606 OID 24938668)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2904 (class 2606 OID 24938678)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2861 (class 2606 OID 24938453)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 24938458)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2916 (class 2606 OID 24938733)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2970 (class 2606 OID 24939003)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 24938808)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 24938803)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2972 (class 2606 OID 24939008)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 24939013)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2912 (class 2606 OID 24938713)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2929 (class 2606 OID 24938793)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2928 (class 2606 OID 24938798)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2949 (class 2606 OID 24938918)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 24938913)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2953 (class 2606 OID 24938898)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 24938903)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2951 (class 2606 OID 24938908)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2876 (class 2606 OID 24938533)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2877 (class 2606 OID 24938528)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2875 (class 2606 OID 24938538)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2917 (class 2606 OID 24938743)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 24938738)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2956 (class 2606 OID 24938928)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2955 (class 2606 OID 24938933)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2946 (class 2606 OID 24938888)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 24938893)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2948 (class 2606 OID 24938878)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2947 (class 2606 OID 24938883)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 24938783)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 24938788)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2907 (class 2606 OID 24938703)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2908 (class 2606 OID 24938698)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2910 (class 2606 OID 24938688)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2909 (class 2606 OID 24938693)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2943 (class 2606 OID 24938873)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 24938868)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 24938563)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2883 (class 2606 OID 24938568)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 24938598)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2888 (class 2606 OID 24938588)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 24938593)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2954 (class 2606 OID 24938923)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2957 (class 2606 OID 24938938)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2959 (class 2606 OID 24938948)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 24938993)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 24938998)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2864 (class 2606 OID 24938478)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 24938473)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2869 (class 2606 OID 24938493)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 24938498)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 24938648)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 24938663)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 24938658)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2902 (class 2606 OID 24938653)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-03 09:12:10 CET

--
-- PostgreSQL database dump complete
--

