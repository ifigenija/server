--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-02 09:57:53 CET

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
-- TOC entry 183 (class 1259 OID 24472270)
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
-- TOC entry 236 (class 1259 OID 24472878)
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
-- TOC entry 235 (class 1259 OID 24472861)
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
-- TOC entry 182 (class 1259 OID 24472263)
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
-- TOC entry 181 (class 1259 OID 24472261)
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
-- TOC entry 226 (class 1259 OID 24472738)
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
-- TOC entry 229 (class 1259 OID 24472768)
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
-- TOC entry 250 (class 1259 OID 24473165)
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
-- TOC entry 203 (class 1259 OID 24472518)
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
-- TOC entry 205 (class 1259 OID 24472549)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 24473091)
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
-- TOC entry 194 (class 1259 OID 24472415)
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
-- TOC entry 237 (class 1259 OID 24472891)
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
-- TOC entry 222 (class 1259 OID 24472692)
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
-- TOC entry 200 (class 1259 OID 24472489)
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
-- TOC entry 197 (class 1259 OID 24472455)
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
-- TOC entry 195 (class 1259 OID 24472432)
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
-- TOC entry 211 (class 1259 OID 24472606)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 248 (class 1259 OID 24473146)
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
-- TOC entry 249 (class 1259 OID 24473158)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 24473180)
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
-- TOC entry 170 (class 1259 OID 24099025)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24472631)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 24472389)
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
-- TOC entry 185 (class 1259 OID 24472289)
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
-- TOC entry 189 (class 1259 OID 24472356)
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
-- TOC entry 186 (class 1259 OID 24472300)
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
-- TOC entry 178 (class 1259 OID 24472235)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 24472254)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 24472638)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 24472672)
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
-- TOC entry 232 (class 1259 OID 24472809)
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
-- TOC entry 188 (class 1259 OID 24472336)
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
-- TOC entry 191 (class 1259 OID 24472381)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 24473036)
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
-- TOC entry 212 (class 1259 OID 24472612)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 24472366)
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
-- TOC entry 202 (class 1259 OID 24472510)
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
-- TOC entry 198 (class 1259 OID 24472470)
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
-- TOC entry 199 (class 1259 OID 24472482)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 24472624)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 24473050)
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
-- TOC entry 241 (class 1259 OID 24473060)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 24472959)
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
-- TOC entry 242 (class 1259 OID 24473068)
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
-- TOC entry 218 (class 1259 OID 24472653)
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
-- TOC entry 210 (class 1259 OID 24472597)
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
-- TOC entry 209 (class 1259 OID 24472587)
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
-- TOC entry 231 (class 1259 OID 24472798)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 24472728)
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
-- TOC entry 196 (class 1259 OID 24472444)
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
-- TOC entry 175 (class 1259 OID 24472206)
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
-- TOC entry 174 (class 1259 OID 24472204)
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
-- TOC entry 219 (class 1259 OID 24472666)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 24472244)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 24472228)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24472680)
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
-- TOC entry 213 (class 1259 OID 24472618)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 24472564)
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
-- TOC entry 173 (class 1259 OID 24472193)
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
-- TOC entry 172 (class 1259 OID 24472185)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 24472180)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 227 (class 1259 OID 24472745)
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
-- TOC entry 187 (class 1259 OID 24472328)
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
-- TOC entry 208 (class 1259 OID 24472574)
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
-- TOC entry 230 (class 1259 OID 24472786)
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
-- TOC entry 184 (class 1259 OID 24472279)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 243 (class 1259 OID 24473079)
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
-- TOC entry 206 (class 1259 OID 24472554)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 24472401)
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
-- TOC entry 176 (class 1259 OID 24472215)
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
-- TOC entry 234 (class 1259 OID 24472836)
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
-- TOC entry 201 (class 1259 OID 24472500)
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
-- TOC entry 217 (class 1259 OID 24472645)
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
-- TOC entry 228 (class 1259 OID 24472759)
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
-- TOC entry 246 (class 1259 OID 24473126)
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
-- TOC entry 245 (class 1259 OID 24473098)
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
-- TOC entry 247 (class 1259 OID 24473138)
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
-- TOC entry 224 (class 1259 OID 24472717)
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
-- TOC entry 204 (class 1259 OID 24472543)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 233 (class 1259 OID 24472826)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 223 (class 1259 OID 24472707)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2238 (class 2604 OID 24472266)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 24472209)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3093 (class 0 OID 24472270)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5637-258e-4609-8fb378810785	10	30	Otroci	Abonma za otroke	200
000a0000-5637-258e-8a47-36e392724c8a	20	60	Mladina	Abonma za mladino	400
000a0000-5637-258e-669b-69bce819fd69	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3146 (class 0 OID 24472878)
-- Dependencies: 236
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5637-258f-4093-bd0028f42bb3	000d0000-5637-258f-d666-459eb6638d5f	\N	00090000-5637-258e-1322-64b6318fe593	000b0000-5637-258e-7e9c-f74bf553da56	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5637-258f-243a-af2f40c43f0b	000d0000-5637-258f-5cf9-6c0f24071b97	00100000-5637-258e-e829-ea67a4aece26	00090000-5637-258e-a0fa-d9f6b12d0ba9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5637-258f-7ea6-3da14e45e970	000d0000-5637-258f-472d-f7a9184a89ee	00100000-5637-258e-8b74-4ee5ea09d9dc	00090000-5637-258e-55a6-ba61a01b45d5	\N	0003	t	\N	2015-11-02	\N	2	t	\N	f	f
000c0000-5637-258f-1aae-4812d0bfc183	000d0000-5637-258f-bd07-56cac1d84fdb	\N	00090000-5637-258e-c15b-37a3397f2b60	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5637-258f-e2ba-b9a9ce88c8c2	000d0000-5637-258f-403b-567362074d5f	\N	00090000-5637-258e-3370-b8dc850227a6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5637-258f-81c6-d60e2ff01ecf	000d0000-5637-258f-f5c6-fe2342fa70e6	\N	00090000-5637-258e-7752-c3fa85f98991	000b0000-5637-258e-9a85-aa052dc5017d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5637-258f-3007-6acfd740e426	000d0000-5637-258f-35f6-6d8f48f07807	00100000-5637-258e-1d51-37f7f10a1514	00090000-5637-258e-3d64-b4d5c53d684a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5637-258f-d87e-29aed5082856	000d0000-5637-258f-4499-5b05e45e2a24	\N	00090000-5637-258e-f460-ec5788882ea5	000b0000-5637-258e-eba6-602b795a047c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5637-258f-1b9b-853c4f12793c	000d0000-5637-258f-35f6-6d8f48f07807	00100000-5637-258e-6b47-cd7aa8900fd6	00090000-5637-258e-4220-5779164d10cf	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5637-258f-f247-6107f4c6e0d9	000d0000-5637-258f-35f6-6d8f48f07807	00100000-5637-258e-b192-9f8ad60f67d4	00090000-5637-258e-0943-32335453a0d0	\N	0010	t	\N	2015-11-02	\N	16	f	\N	f	t
000c0000-5637-258f-b0a6-8444cd6afb50	000d0000-5637-258f-35f6-6d8f48f07807	00100000-5637-258e-5e49-dc233055428d	00090000-5637-258e-33d2-c94bfbee297c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5637-258f-0a0e-9349d505fc0d	000d0000-5637-258f-0699-77639185da95	00100000-5637-258e-e829-ea67a4aece26	00090000-5637-258e-a0fa-d9f6b12d0ba9	000b0000-5637-258e-763a-96fa7d01c185	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3145 (class 0 OID 24472861)
-- Dependencies: 235
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 24472263)
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
-- TOC entry 3136 (class 0 OID 24472738)
-- Dependencies: 226
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5637-258e-a9d0-206131e162eb	00160000-5637-258e-11eb-f4a3ea021377	00090000-5637-258e-fbf8-cd02af7c3503	aizv	10	t
003d0000-5637-258e-5a6a-dd1ec5fab86c	00160000-5637-258e-11eb-f4a3ea021377	00090000-5637-258e-2e3f-1a4f0bff986b	apri	14	t
003d0000-5637-258e-ddee-3574244d2750	00160000-5637-258e-979c-ea9ce509765b	00090000-5637-258e-6cd7-6424a0b86fb5	aizv	11	t
003d0000-5637-258e-5ef5-3e35bfa84a43	00160000-5637-258e-33e6-58846a97e047	00090000-5637-258e-b277-217f6bfc8524	aizv	12	t
003d0000-5637-258e-c56c-df29fca50fee	00160000-5637-258e-11eb-f4a3ea021377	00090000-5637-258e-a9d0-70fba87e29e8	apri	18	f
\.


--
-- TOC entry 3139 (class 0 OID 24472768)
-- Dependencies: 229
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5637-258e-11eb-f4a3ea021377	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5637-258e-979c-ea9ce509765b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5637-258e-33e6-58846a97e047	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3160 (class 0 OID 24473165)
-- Dependencies: 250
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 24472518)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5637-258f-3112-f304d1a8de71	\N	\N	00200000-5637-258f-e115-ce11eadbad6d	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5637-258f-0eab-3b36db0795fc	\N	\N	00200000-5637-258f-6480-6399ecdb628e	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5637-258f-38a4-5f83c529a31b	\N	\N	00200000-5637-258f-dc46-9346eba0f015	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5637-258f-f2be-d23da13051e6	\N	\N	00200000-5637-258f-41e8-e5edf1c656c9	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5637-258f-e9ab-84af4f07706c	\N	\N	00200000-5637-258f-e379-644ceeb23392	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3115 (class 0 OID 24472549)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 24473091)
-- Dependencies: 244
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 24472415)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5637-258c-e5e4-5a60c172f9dd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5637-258c-d9e2-796fa1fd7896	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5637-258c-e8f2-21152fe769d0	AL	ALB	008	Albania 	Albanija	\N
00040000-5637-258c-ccc8-00322f436ab0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5637-258c-c264-656eced4d8c5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5637-258c-a4e2-b04679f40e29	AD	AND	020	Andorra 	Andora	\N
00040000-5637-258c-31af-055108f3b11b	AO	AGO	024	Angola 	Angola	\N
00040000-5637-258c-53e0-abfef812659b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5637-258c-05a5-52073cd86b30	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5637-258c-5d97-8ef6f10fd8f2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5637-258c-c67a-9998ae0d91ea	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5637-258c-0120-0ff4f3fc8b06	AM	ARM	051	Armenia 	Armenija	\N
00040000-5637-258c-7853-c2911b74bf86	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5637-258c-80c1-1bdf31674451	AU	AUS	036	Australia 	Avstralija	\N
00040000-5637-258c-15bb-14d898b3a148	AT	AUT	040	Austria 	Avstrija	\N
00040000-5637-258c-c273-30318bc2d7cc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5637-258c-23c9-3b249f2e9b27	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5637-258c-3f52-ade4d7cdcab0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5637-258c-7a42-ef62a81e9787	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5637-258c-d0a6-c3e7a73421a6	BB	BRB	052	Barbados 	Barbados	\N
00040000-5637-258c-3c1e-2b70ec432568	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5637-258c-4f9b-9dc4aaa981c2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5637-258c-f518-dff90cfc1bb7	BZ	BLZ	084	Belize 	Belize	\N
00040000-5637-258c-a722-5fedd5ab58b0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5637-258c-dc8c-df01b7f7a85a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5637-258c-ab5e-3b5fd24edcf5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5637-258c-15cf-5c7ea454312d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5637-258c-432a-95468dbcf9f3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5637-258c-0aaf-71f8f1f46307	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5637-258c-b474-14740010d23b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5637-258c-b17c-a39d7b78a589	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5637-258c-3f3b-3c4effb385f2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5637-258c-a617-6d045bc5b7bd	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5637-258c-145b-78769a7945c4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5637-258c-1881-04eb9bec7cdd	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5637-258c-719c-e5dc141f0c00	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5637-258c-256e-cfd419cc3022	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5637-258c-fedb-309f82e72d92	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5637-258c-376c-5b20e299d77b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5637-258c-0460-19cf48bffc8f	CA	CAN	124	Canada 	Kanada	\N
00040000-5637-258c-28c8-3f13b794e510	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5637-258c-a1dd-4b60d8b63d7a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5637-258c-932d-068e351c47b9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5637-258c-46ed-e1fe221176c9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5637-258c-432b-262da0b184c8	CL	CHL	152	Chile 	Čile	\N
00040000-5637-258c-522a-63a831521a83	CN	CHN	156	China 	Kitajska	\N
00040000-5637-258c-937e-aeec8123595e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5637-258c-61c6-13ad0ab492bb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5637-258c-ba31-6e54da54f87f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5637-258c-bb2a-0fd6859a5bef	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5637-258c-b8dc-86d89b4c1f11	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5637-258c-4a7b-47b7613e126a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5637-258c-96d6-d7b638a4d10f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5637-258c-d2ac-2e06871aaa4b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5637-258c-8c46-b434d86504ba	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5637-258c-3a00-7f2b00a631fe	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5637-258c-bb43-5bec6fbae2c6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5637-258c-8a77-145d4a9f6522	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5637-258c-12c9-8e0563d120f2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5637-258c-e39b-a0acac351421	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5637-258c-2f9e-b737917d23bb	DK	DNK	208	Denmark 	Danska	\N
00040000-5637-258c-c34c-916ea1ce0bfc	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5637-258c-dd62-8f698a73cf8e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5637-258c-3128-30177bbdbe8e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5637-258c-79ec-ec92cea5706c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5637-258c-91e1-b3a27662daa9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5637-258c-0383-81ac42005fc5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5637-258c-4e6f-56627d2560cd	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5637-258c-d2e3-1670af86e031	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5637-258c-c9dd-e83495332325	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5637-258c-528e-1a1d937bff53	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5637-258c-f40a-3564f9351aaf	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5637-258c-b24f-f82f272f0f30	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5637-258c-ebfa-9f92aa6b86d8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5637-258c-8dc5-295f8a3fe5bb	FI	FIN	246	Finland 	Finska	\N
00040000-5637-258c-142b-e88612e18501	FR	FRA	250	France 	Francija	\N
00040000-5637-258c-b9a2-2710436f16d5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5637-258c-d268-44e9f85969f0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5637-258c-aeb2-a1b099f246ee	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5637-258c-d46c-8faf8a8a49fc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5637-258c-3f2c-60625d7ae18f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5637-258c-b641-188a03cbb8d8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5637-258c-c218-d33ff1597c1a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5637-258c-fbb2-0232f912ff00	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5637-258c-dd02-f274c01c60a2	GH	GHA	288	Ghana 	Gana	\N
00040000-5637-258c-3773-53bf26c88272	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5637-258c-41e3-8fde7b783184	GR	GRC	300	Greece 	Grčija	\N
00040000-5637-258c-dfc4-fb6601f3fff1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5637-258c-e4ff-9ac0d3f84ce7	GD	GRD	308	Grenada 	Grenada	\N
00040000-5637-258c-e523-e443a4bd6e9d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5637-258c-ac46-322cf1ea56a9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5637-258c-47c5-0bc2013cb65c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5637-258c-0fac-44f2b6e460c8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5637-258c-f838-71a733d3082e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5637-258c-e741-a2732fffc817	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5637-258c-9c15-26ec4cd46c7b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5637-258c-57de-69434f7532a1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5637-258c-f0d1-d8727e338b32	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5637-258c-857f-e1d9d71c15c8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5637-258c-f95a-252d4e733961	HN	HND	340	Honduras 	Honduras	\N
00040000-5637-258c-a6a3-3d8a69a88324	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5637-258c-4cf4-77f624c3a633	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5637-258c-beee-d1154d3ac01e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5637-258c-1e2f-eed93fce4206	IN	IND	356	India 	Indija	\N
00040000-5637-258c-e602-2616f7b5c79b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5637-258c-c5a0-a95c923cfb28	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5637-258c-9012-574a1aa6e902	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5637-258c-a877-2eadcd025ae6	IE	IRL	372	Ireland 	Irska	\N
00040000-5637-258c-77df-98d63e924390	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5637-258c-8f12-9c2c373a5dd3	IL	ISR	376	Israel 	Izrael	\N
00040000-5637-258c-e333-7ff4bf3ed98d	IT	ITA	380	Italy 	Italija	\N
00040000-5637-258c-ee74-c2782c16a49a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5637-258c-8698-83a042937395	JP	JPN	392	Japan 	Japonska	\N
00040000-5637-258c-e447-3e6146853c3a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5637-258c-406d-605eec4f8961	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5637-258c-e9f1-259956f032b9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5637-258c-2708-830b7254476d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5637-258c-3f33-5026ef87e6f8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5637-258c-c20b-06ea0ef71e7e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5637-258c-6300-15e6ba3583a7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5637-258c-d8e3-aa2b98aeff66	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5637-258c-7d8f-5d8a60b296cc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5637-258c-0c7e-f1b7433730f5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5637-258c-af20-470381cba2bb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5637-258c-820a-6cbcce9f49d5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5637-258c-9c90-700aee3543d0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5637-258c-c2bf-7ac66d74b4d4	LR	LBR	430	Liberia 	Liberija	\N
00040000-5637-258c-820c-10c56d971d5d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5637-258c-9114-5c84428a7b89	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5637-258c-5b56-8f8eb7df5398	LT	LTU	440	Lithuania 	Litva	\N
00040000-5637-258c-7e6f-958dbd1f45d9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5637-258c-dd6b-474afc564c01	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5637-258c-679d-a28d75f75659	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5637-258c-6080-310637536eb5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5637-258c-b002-c04f4298d445	MW	MWI	454	Malawi 	Malavi	\N
00040000-5637-258c-c076-2db444362c1f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5637-258c-3ce9-0b197fe8d6a9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5637-258c-eadd-cb922b7dac45	ML	MLI	466	Mali 	Mali	\N
00040000-5637-258c-5bee-966b7167a07b	MT	MLT	470	Malta 	Malta	\N
00040000-5637-258c-9b1a-843833d76a59	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5637-258c-5130-6e09d8b68fba	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5637-258c-df99-e3e9e56bf35d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5637-258c-0ae6-ee2890dde31e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5637-258c-acf5-be4f074fd7c9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5637-258c-9896-3829d74cdbbb	MX	MEX	484	Mexico 	Mehika	\N
00040000-5637-258c-9ce5-c79e71261ee1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5637-258c-2e6f-9a74aae87437	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5637-258c-9577-01ce731f59fa	MC	MCO	492	Monaco 	Monako	\N
00040000-5637-258c-a863-1a0253179aa3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5637-258c-003e-57db4744a751	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5637-258c-5ece-ac0b298614d8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5637-258c-e3f8-c0829d1dd71c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5637-258c-506c-18a64907e258	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5637-258c-ea99-0c576e9b615d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5637-258c-d271-207a919ac97a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5637-258c-3982-c88bb9b35123	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5637-258c-5242-d6cf0797f7c6	NP	NPL	524	Nepal 	Nepal	\N
00040000-5637-258c-30a0-011b7333a340	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5637-258c-ab3c-915da88afb94	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5637-258c-d5e8-a67f63661459	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5637-258c-1f84-bc4200353053	NE	NER	562	Niger 	Niger 	\N
00040000-5637-258c-102a-850c8b6515d3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5637-258c-2da0-92e17a8b07bb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5637-258c-a8a9-f6de2a09177a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5637-258c-e748-11f7589d88d8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5637-258c-39f7-5eb7081b341c	NO	NOR	578	Norway 	Norveška	\N
00040000-5637-258c-d697-e4df984413af	OM	OMN	512	Oman 	Oman	\N
00040000-5637-258c-b96d-904e4c8841e0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5637-258c-3df4-13dd498eb339	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5637-258c-c3e2-7feb2e1bffa8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5637-258c-7be2-0f05c3aaae84	PA	PAN	591	Panama 	Panama	\N
00040000-5637-258c-2b14-9c7d41d12957	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5637-258c-a7a4-59e275cf9fb4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5637-258c-4c0e-73aac94287ae	PE	PER	604	Peru 	Peru	\N
00040000-5637-258c-ab96-7bd4a2e3a48f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5637-258c-5c87-bcb84fe764c3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5637-258c-83cb-0e47cfc555bf	PL	POL	616	Poland 	Poljska	\N
00040000-5637-258c-d34c-deeb6990aaf4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5637-258c-1f37-3fa7e6d26f9f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5637-258c-44d3-4b79fe342ab5	QA	QAT	634	Qatar 	Katar	\N
00040000-5637-258c-419b-aa0b59f3fd7f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5637-258c-4856-745e3597e399	RO	ROU	642	Romania 	Romunija	\N
00040000-5637-258c-9056-0b4097b42869	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5637-258c-0243-7149940e89ba	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5637-258c-2b07-d77fd8e2e718	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5637-258c-7e1f-f70e2676746f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5637-258c-28cd-a2f9836477ef	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5637-258c-b597-880e9b365bf1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5637-258c-fb22-64d03e550aee	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5637-258c-4f0c-a259e00c0c6c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5637-258c-de3d-dd885a2cae6d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5637-258c-8b35-cbf678eef94b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5637-258c-20f1-1c27b1685271	SM	SMR	674	San Marino 	San Marino	\N
00040000-5637-258c-c3a5-f5a0227929d2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5637-258c-b5b1-3b7241339771	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5637-258c-15c7-b5a675d26dd7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5637-258c-8723-a756b2728a55	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5637-258c-f2c6-40b21beaa919	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5637-258c-e85f-19dfb6661c79	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5637-258c-b3ef-b037df308a40	SG	SGP	702	Singapore 	Singapur	\N
00040000-5637-258c-d3fc-9648ebb6a793	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5637-258c-103a-69dbd8fb8d3b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5637-258c-1820-c0f8993afd54	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5637-258c-c7c6-4f39dc269ead	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5637-258c-5347-b80072651689	SO	SOM	706	Somalia 	Somalija	\N
00040000-5637-258c-1bf6-a80d02a449d5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5637-258c-bc84-e66b6ad0da1b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5637-258c-195a-f5136556a87c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5637-258c-4403-c474db75690f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5637-258c-5f32-cb908bf8e36e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5637-258c-d8b0-3e7544b33312	SD	SDN	729	Sudan 	Sudan	\N
00040000-5637-258c-ff5c-47a85f75a722	SR	SUR	740	Suriname 	Surinam	\N
00040000-5637-258c-a83f-0e67c46b3863	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5637-258c-c7e0-162ec9f830d2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5637-258c-76f2-983f49f75dca	SE	SWE	752	Sweden 	Švedska	\N
00040000-5637-258c-a649-08e10c69804c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5637-258c-8035-0b4707920fa1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5637-258c-2702-e59172d85983	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5637-258c-b4c9-639d37c43ec9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5637-258c-e0af-ccd2b60759e4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5637-258c-ce1b-94b91b93aa81	TH	THA	764	Thailand 	Tajska	\N
00040000-5637-258c-27e1-91fe46354592	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5637-258c-27dd-5ef03f832dfc	TG	TGO	768	Togo 	Togo	\N
00040000-5637-258c-9e53-eb9a1907f46e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5637-258c-ad6f-1f92808bf9c8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5637-258c-034d-802d1dd96502	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5637-258c-ccb0-a817ea2a6be7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5637-258c-19ab-63df45f6dfcf	TR	TUR	792	Turkey 	Turčija	\N
00040000-5637-258c-4b6a-a55596694a0f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5637-258c-6f22-a03c39ffd8a7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5637-258c-505f-dd407e77a2d5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5637-258c-9c2a-99e44010adcb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5637-258c-33dd-9ff2827b0eab	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5637-258c-d1ca-c6143a8e58aa	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5637-258c-53c2-c414139aeab4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5637-258c-44d3-35db75c024e9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5637-258c-4c23-d54a5fe57569	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5637-258c-801b-0534a528e1ee	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5637-258c-dd0d-1a532be70234	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5637-258c-d0b2-6d84c704cb5c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5637-258c-fdf0-530de3959946	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5637-258c-734f-6f2bb4ade527	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5637-258c-9986-aa5e33f04092	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5637-258c-6b45-d2fb12884a69	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5637-258c-0f4b-472d7a14045c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5637-258c-4f5a-816c915ede9f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5637-258c-a630-edaa8e4b3eff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5637-258c-6fbf-32cb0236d6aa	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5637-258c-caf1-d8c8a4e444c5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3147 (class 0 OID 24472891)
-- Dependencies: 237
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5637-258f-d668-68018930df3c	000e0000-5637-258e-dbd1-a7b907fa8a12	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5637-258c-349a-8cdc352170ed	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5637-258f-6dbf-b0c690de88b9	000e0000-5637-258e-b535-6f3e01020ab0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5637-258c-9a6f-f7368d0d24ba	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5637-258f-b734-91df9b1bb273	000e0000-5637-258e-9596-86d6866e65d0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5637-258c-349a-8cdc352170ed	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5637-258f-418c-4e75f62a4915	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5637-258f-6560-d499e1850f4f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3132 (class 0 OID 24472692)
-- Dependencies: 222
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5637-258f-35f6-6d8f48f07807	000e0000-5637-258e-b535-6f3e01020ab0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5637-258c-0dbe-bfa5babd4ba3
000d0000-5637-258f-d666-459eb6638d5f	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-4093-bd0028f42bb3	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5637-258c-0dbe-bfa5babd4ba3
000d0000-5637-258f-5cf9-6c0f24071b97	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-243a-af2f40c43f0b	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5637-258c-faac-5c2a36cfccfb
000d0000-5637-258f-472d-f7a9184a89ee	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-7ea6-3da14e45e970	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5637-258c-6c7f-e11c59290704
000d0000-5637-258f-bd07-56cac1d84fdb	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-1aae-4812d0bfc183	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5637-258c-a8ff-7bea8b0d11ba
000d0000-5637-258f-403b-567362074d5f	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-e2ba-b9a9ce88c8c2	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5637-258c-a8ff-7bea8b0d11ba
000d0000-5637-258f-f5c6-fe2342fa70e6	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-81c6-d60e2ff01ecf	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5637-258c-0dbe-bfa5babd4ba3
000d0000-5637-258f-4499-5b05e45e2a24	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-d87e-29aed5082856	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5637-258c-7c25-e0e7cbd996e6
000d0000-5637-258f-0699-77639185da95	000e0000-5637-258e-b535-6f3e01020ab0	000c0000-5637-258f-0a0e-9349d505fc0d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5637-258c-f029-4bae79830aa8
\.


--
-- TOC entry 3110 (class 0 OID 24472489)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 24472455)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 24472432)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5637-258e-66b7-a64ac39e3255	00080000-5637-258e-b26f-2e0ebf660f43	00090000-5637-258e-0943-32335453a0d0	AK		igralka
\.


--
-- TOC entry 3121 (class 0 OID 24472606)
-- Dependencies: 211
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 24473146)
-- Dependencies: 248
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 24473158)
-- Dependencies: 249
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 24473180)
-- Dependencies: 251
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 24099025)
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
\.


--
-- TOC entry 3125 (class 0 OID 24472631)
-- Dependencies: 215
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 24472389)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5637-258d-f1e7-ca8af3b6688c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5637-258d-87a3-3a63ca0c91a8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5637-258d-e271-ea0be4b0eb93	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5637-258d-7e18-2296b817d6e2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5637-258d-ea1f-735db688568e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5637-258d-af4f-a5b85aa22713	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5637-258d-bb6d-30c7c72bd4e1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5637-258d-e87e-bfbd9fc90a77	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5637-258d-b9ba-60bd80451675	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5637-258d-0b4c-493f74232422	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5637-258d-6183-d9bfcc4c4418	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5637-258d-6aa3-de12a3f197b5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5637-258d-25cd-f4f2d35d5ea1	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5637-258d-d03e-acee40fef3e5	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5637-258d-84fc-b66e0b2075d2	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5637-258e-7962-51f57c315102	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5637-258e-7d11-ec16bc9860e7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5637-258e-2c6e-2975faa0963d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5637-258e-e1ad-ca7a7f077773	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5637-258e-4f10-62ec78f37858	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5637-2590-3156-ce9d3ce5d875	application.tenant.maticnopodjetje	string	s:36:"00080000-5637-2590-ed21-c4cf4350e921";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3095 (class 0 OID 24472289)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5637-258e-2910-ec8dd559cc6e	00000000-5637-258e-7962-51f57c315102	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5637-258e-d633-a8d773fc037a	00000000-5637-258e-7962-51f57c315102	00010000-5637-258d-8c5c-167938b1ee65	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5637-258e-5c53-0e3a38698752	00000000-5637-258e-7d11-ec16bc9860e7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3099 (class 0 OID 24472356)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5637-258e-d0e7-4775dcc7051c	\N	00100000-5637-258e-e829-ea67a4aece26	00100000-5637-258e-8b74-4ee5ea09d9dc	01	Gledališče Nimbis
00410000-5637-258e-baa1-a38cbeb77fa8	00410000-5637-258e-d0e7-4775dcc7051c	00100000-5637-258e-e829-ea67a4aece26	00100000-5637-258e-8b74-4ee5ea09d9dc	02	Tehnika
\.


--
-- TOC entry 3096 (class 0 OID 24472300)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5637-258e-1322-64b6318fe593	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5637-258e-c15b-37a3397f2b60	00010000-5637-258e-336c-f90aa06514c5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5637-258e-55a6-ba61a01b45d5	00010000-5637-258e-1ffe-81bd5952124d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5637-258e-4220-5779164d10cf	00010000-5637-258e-b2d1-2d2906019000	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5637-258e-b84f-5df0f2830b2e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5637-258e-7752-c3fa85f98991	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5637-258e-33d2-c94bfbee297c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5637-258e-3d64-b4d5c53d684a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5637-258e-0943-32335453a0d0	00010000-5637-258e-5bff-243b7997c9fb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5637-258e-a0fa-d9f6b12d0ba9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5637-258e-69c4-fb6900869234	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5637-258e-3370-b8dc850227a6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5637-258e-f460-ec5788882ea5	00010000-5637-258e-420d-f7a32902e0ad	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5637-258e-fbf8-cd02af7c3503	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-258e-2e3f-1a4f0bff986b	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-258e-6cd7-6424a0b86fb5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-258e-b277-217f6bfc8524	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5637-258e-a9d0-70fba87e29e8	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5637-258e-28a5-179def686fbb	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-258e-5542-41b0a8a90b2b	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-258e-7a9d-a009b0f5a038	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3088 (class 0 OID 24472235)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5637-258c-12bb-c406dddd766b	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5637-258c-8abc-fba86a3901bb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5637-258c-fb34-6542bf113821	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5637-258c-57bb-c77cf421002b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5637-258c-f21b-9f1fa4e9a340	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5637-258c-4e23-9a8e10cadb7f	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5637-258c-53c5-e1a73530b3e4	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5637-258c-fba7-f4dfe2faedf8	Abonma-read	Abonma - branje	t
00030000-5637-258c-bf0b-5c54b67d8ebb	Abonma-write	Abonma - spreminjanje	t
00030000-5637-258c-3c2f-e57a1f804b6f	Alternacija-read	Alternacija - branje	t
00030000-5637-258c-971e-965b0343570e	Alternacija-write	Alternacija - spreminjanje	t
00030000-5637-258c-8204-ca0a13ccbb18	Arhivalija-read	Arhivalija - branje	t
00030000-5637-258c-2186-3d1055d1cf20	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5637-258c-304b-9904d54b098a	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5637-258c-0c37-99f7f66736bd	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5637-258c-c7e1-c8649f713afd	Besedilo-read	Besedilo - branje	t
00030000-5637-258c-85cb-ad22f8de8cfb	Besedilo-write	Besedilo - spreminjanje	t
00030000-5637-258c-a0b4-5bc297d39b8f	DogodekIzven-read	DogodekIzven - branje	t
00030000-5637-258c-b6e6-e757b9cdc0aa	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5637-258c-231e-90f7873ee410	Dogodek-read	Dogodek - branje	t
00030000-5637-258c-ee5a-50d9f17d9c36	Dogodek-write	Dogodek - spreminjanje	t
00030000-5637-258c-1a4c-f403b7aefd54	DrugiVir-read	DrugiVir - branje	t
00030000-5637-258c-db09-02578131b6e4	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5637-258c-dca3-08374f8a45bd	Drzava-read	Drzava - branje	t
00030000-5637-258c-aa7a-9f124e9d473f	Drzava-write	Drzava - spreminjanje	t
00030000-5637-258c-9c89-bb61fef86141	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5637-258c-9a40-aef21256e113	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5637-258c-950c-19d76e7309b8	Funkcija-read	Funkcija - branje	t
00030000-5637-258c-fce6-81bcb57420d9	Funkcija-write	Funkcija - spreminjanje	t
00030000-5637-258c-990a-26f81a13a060	Gostovanje-read	Gostovanje - branje	t
00030000-5637-258c-4144-208d53deb4c7	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5637-258c-34b3-787926b8c3ad	Gostujoca-read	Gostujoca - branje	t
00030000-5637-258c-6f06-4ee82363ce77	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5637-258c-9e6a-db5f1b73af0b	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5637-258c-b077-a1673b80d31c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5637-258c-5515-6bb37dac1207	Kupec-read	Kupec - branje	t
00030000-5637-258c-b244-337f262970e4	Kupec-write	Kupec - spreminjanje	t
00030000-5637-258c-ca6b-4843f84fe107	NacinPlacina-read	NacinPlacina - branje	t
00030000-5637-258c-5f7a-1204d307eb86	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5637-258c-2017-eaeaaa61bbcc	Option-read	Option - branje	t
00030000-5637-258c-42de-40b6bf12dd06	Option-write	Option - spreminjanje	t
00030000-5637-258c-fcd6-38bd1dffcdf6	OptionValue-read	OptionValue - branje	t
00030000-5637-258c-3541-a02d33dc12c9	OptionValue-write	OptionValue - spreminjanje	t
00030000-5637-258c-8871-99fb996d86aa	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5637-258c-5795-f90401e6f050	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5637-258c-e5b0-e4e63438d5aa	Oseba-read	Oseba - branje	t
00030000-5637-258c-7f9b-fc5182ae2139	Oseba-write	Oseba - spreminjanje	t
00030000-5637-258c-c03d-61ac4f29165b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5637-258c-45b6-1e7e2ca06478	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5637-258c-f70d-81776e9f6bb0	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5637-258c-d276-a49c25012546	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5637-258c-92c2-d3f254d7a67c	Pogodba-read	Pogodba - branje	t
00030000-5637-258c-f490-abd03fe07cdd	Pogodba-write	Pogodba - spreminjanje	t
00030000-5637-258c-3db9-d939ab9b7e2f	Popa-read	Popa - branje	t
00030000-5637-258c-67c9-5d7ed132911f	Popa-write	Popa - spreminjanje	t
00030000-5637-258c-cca9-014a7173f44c	Posta-read	Posta - branje	t
00030000-5637-258c-d378-92a3b21a83fd	Posta-write	Posta - spreminjanje	t
00030000-5637-258c-d093-1d6c29f98f43	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5637-258c-e36e-18f919f6a8a1	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5637-258d-749a-b99cf2b591f2	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5637-258d-3069-b78a245415ff	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5637-258d-5b97-006209be3888	PostniNaslov-read	PostniNaslov - branje	t
00030000-5637-258d-922d-de2be2379db1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5637-258d-768f-ceddeeb63337	Predstava-read	Predstava - branje	t
00030000-5637-258d-c21e-0c542c070a40	Predstava-write	Predstava - spreminjanje	t
00030000-5637-258d-18ab-d828675807bf	Praznik-read	Praznik - branje	t
00030000-5637-258d-ce96-6820e45faa6c	Praznik-write	Praznik - spreminjanje	t
00030000-5637-258d-1e90-890e2539064d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5637-258d-172b-bed85cce12ca	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5637-258d-7314-973e3f04a843	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5637-258d-7c50-20f26ebb0da0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5637-258d-7162-6b5eb3075e37	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5637-258d-f292-36f0a4d80e8a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5637-258d-7bf2-2dd7be5ae8cb	ProgramDela-read	ProgramDela - branje	t
00030000-5637-258d-f97a-ffae2ccb91eb	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5637-258d-4856-243f2641f8ad	ProgramFestival-read	ProgramFestival - branje	t
00030000-5637-258d-271a-a4b3c8a99fa3	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5637-258d-0084-913eb8b88b94	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5637-258d-0a16-6a94e98f4862	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5637-258d-a1d5-b0b888c9cf59	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5637-258d-6adf-edba745d542d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5637-258d-f1ce-8d1f475cdbd8	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5637-258d-f16c-2b941b8e236b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5637-258d-c827-83b838a43ca5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5637-258d-b356-d39bbf41335f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5637-258d-2b8a-7258eec562ca	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5637-258d-c1c2-aadcfaa81ade	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5637-258d-13e4-d1eb28e2f582	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5637-258d-fc9c-fac378f39cb8	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5637-258d-0b67-13593d3898f0	ProgramRazno-read	ProgramRazno - branje	t
00030000-5637-258d-94cf-17152f052c47	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5637-258d-5213-b14bf03bbd9d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5637-258d-ca99-947516029dfd	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5637-258d-6d27-1bd9bc873907	Prostor-read	Prostor - branje	t
00030000-5637-258d-71b9-dbbf4e683fdc	Prostor-write	Prostor - spreminjanje	t
00030000-5637-258d-555b-a078750a33d5	Racun-read	Racun - branje	t
00030000-5637-258d-5f7a-40acc8f9945b	Racun-write	Racun - spreminjanje	t
00030000-5637-258d-0edb-fa838651c0a8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5637-258d-f590-a06ed4f10e81	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5637-258d-ae17-54526ee11bdd	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5637-258d-a98a-2a33f517dbd7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5637-258d-46a4-55ebdf3bedf2	Rekvizit-read	Rekvizit - branje	t
00030000-5637-258d-5982-97f24652935c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5637-258d-5e29-3d807f5e243b	Revizija-read	Revizija - branje	t
00030000-5637-258d-8813-395357889cc0	Revizija-write	Revizija - spreminjanje	t
00030000-5637-258d-1b8c-95edac2c7585	Rezervacija-read	Rezervacija - branje	t
00030000-5637-258d-511b-8ff6b290fb9b	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5637-258d-8808-f62b04be18c5	SedezniRed-read	SedezniRed - branje	t
00030000-5637-258d-9160-cbc9c0a1677b	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5637-258d-03c6-89205c6718a7	Sedez-read	Sedez - branje	t
00030000-5637-258d-76ed-63cccf0b2636	Sedez-write	Sedez - spreminjanje	t
00030000-5637-258d-76cc-71961c74261d	Sezona-read	Sezona - branje	t
00030000-5637-258d-78db-758d61117f46	Sezona-write	Sezona - spreminjanje	t
00030000-5637-258d-f556-3a76ef2e1ba4	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5637-258d-1d08-894eedf7ed79	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5637-258d-ec71-a528d6f2f272	Stevilcenje-read	Stevilcenje - branje	t
00030000-5637-258d-99f8-5095715dbf9d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5637-258d-295c-5764c6d41813	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5637-258d-0558-e10f93c28fec	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5637-258d-4fa6-d4bdb30d0422	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5637-258d-4029-f3e91f384ea3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5637-258d-54f5-d8781595e529	Telefonska-read	Telefonska - branje	t
00030000-5637-258d-4a6b-f59e453a9f98	Telefonska-write	Telefonska - spreminjanje	t
00030000-5637-258d-ebd2-aa4d5f71cc20	TerminStoritve-read	TerminStoritve - branje	t
00030000-5637-258d-d762-5f5047c8b039	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5637-258d-6265-237e233987e1	TipFunkcije-read	TipFunkcije - branje	t
00030000-5637-258d-cfb7-c70546eaf8f3	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5637-258d-86cb-8ba33d269ab8	TipPopa-read	TipPopa - branje	t
00030000-5637-258d-92b1-4a022cf0bbc7	TipPopa-write	TipPopa - spreminjanje	t
00030000-5637-258d-1cff-2f6152642c47	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5637-258d-a637-f17714615d00	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5637-258d-376b-75ed8671469c	TipVaje-read	TipVaje - branje	t
00030000-5637-258d-0ab1-1215a5169adb	TipVaje-write	TipVaje - spreminjanje	t
00030000-5637-258d-07c7-87d119131c14	Trr-read	Trr - branje	t
00030000-5637-258d-b7fc-7c06e53e5fdd	Trr-write	Trr - spreminjanje	t
00030000-5637-258d-49b0-02607f357130	Uprizoritev-read	Uprizoritev - branje	t
00030000-5637-258d-100c-ba37d06bc2bf	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5637-258d-a485-6277c0b957a7	Vaja-read	Vaja - branje	t
00030000-5637-258d-f811-7921952ad8eb	Vaja-write	Vaja - spreminjanje	t
00030000-5637-258d-c8d2-ef2859a670fb	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5637-258d-dd68-067d91118b95	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5637-258d-8e3f-69941e3a8214	VrstaStroska-read	VrstaStroska - branje	t
00030000-5637-258d-04f6-ebd79f07cf7b	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5637-258d-0fa5-d27bb454beb2	Zaposlitev-read	Zaposlitev - branje	t
00030000-5637-258d-20b5-486510091c7e	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5637-258d-c1bd-bbe3804cd6d4	Zasedenost-read	Zasedenost - branje	t
00030000-5637-258d-3b4d-c069d074c4bb	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5637-258d-322f-2ccf4ed87ea3	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5637-258d-b187-902abfe2e2d2	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5637-258d-2a82-46d4683302b8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5637-258d-2d33-f9b48da99035	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5637-258d-bf53-36f621a7af2b	Job-read	Branje opravil - samo zase - branje	t
00030000-5637-258d-dd6c-bf31e1b2f778	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5637-258d-80ac-1507a3731424	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5637-258d-4af1-248f46ed475a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5637-258d-ab60-3319c681c7ae	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5637-258d-9f8c-13fca42ea155	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5637-258d-a7bf-dedbae70dce6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5637-258d-c367-8b1d92cc4a2d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5637-258d-5608-cf447c097554	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5637-258d-1a1e-4e9eb9b0ccd8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5637-258d-cc6e-9fcf793cb277	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5637-258d-3d7c-3daf118c3586	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5637-258d-7351-12afd335d191	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5637-258d-9d30-f800de318d47	Datoteka-write	Datoteka - spreminjanje	t
00030000-5637-258d-2831-d26390e7b4a5	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3090 (class 0 OID 24472254)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5637-258d-1abb-e60f79d9553a	00030000-5637-258c-8abc-fba86a3901bb
00020000-5637-258d-1ba9-d18ba8e4ade0	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-fba7-f4dfe2faedf8
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-bf0b-5c54b67d8ebb
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-3c2f-e57a1f804b6f
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-971e-965b0343570e
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-8204-ca0a13ccbb18
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-231e-90f7873ee410
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-57bb-c77cf421002b
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-ee5a-50d9f17d9c36
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-aa7a-9f124e9d473f
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-950c-19d76e7309b8
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-fce6-81bcb57420d9
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-990a-26f81a13a060
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-4144-208d53deb4c7
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-34b3-787926b8c3ad
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-6f06-4ee82363ce77
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-9e6a-db5f1b73af0b
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-b077-a1673b80d31c
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-2017-eaeaaa61bbcc
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-fcd6-38bd1dffcdf6
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-e5b0-e4e63438d5aa
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-7f9b-fc5182ae2139
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-3db9-d939ab9b7e2f
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-67c9-5d7ed132911f
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-cca9-014a7173f44c
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258c-d378-92a3b21a83fd
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-5b97-006209be3888
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-922d-de2be2379db1
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-768f-ceddeeb63337
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-c21e-0c542c070a40
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-7162-6b5eb3075e37
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-f292-36f0a4d80e8a
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-6d27-1bd9bc873907
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-71b9-dbbf4e683fdc
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-ae17-54526ee11bdd
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-a98a-2a33f517dbd7
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-46a4-55ebdf3bedf2
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-5982-97f24652935c
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-76cc-71961c74261d
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-78db-758d61117f46
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-6265-237e233987e1
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-49b0-02607f357130
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-100c-ba37d06bc2bf
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-a485-6277c0b957a7
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-f811-7921952ad8eb
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-c1bd-bbe3804cd6d4
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-3b4d-c069d074c4bb
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-322f-2ccf4ed87ea3
00020000-5637-258d-59d7-fdcb7a9a5038	00030000-5637-258d-2a82-46d4683302b8
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-fba7-f4dfe2faedf8
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-8204-ca0a13ccbb18
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-231e-90f7873ee410
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-990a-26f81a13a060
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-34b3-787926b8c3ad
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-9e6a-db5f1b73af0b
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-b077-a1673b80d31c
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-2017-eaeaaa61bbcc
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-fcd6-38bd1dffcdf6
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-e5b0-e4e63438d5aa
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-7f9b-fc5182ae2139
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-3db9-d939ab9b7e2f
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258c-cca9-014a7173f44c
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-5b97-006209be3888
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-922d-de2be2379db1
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-768f-ceddeeb63337
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-6d27-1bd9bc873907
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-ae17-54526ee11bdd
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-46a4-55ebdf3bedf2
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-76cc-71961c74261d
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-54f5-d8781595e529
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-4a6b-f59e453a9f98
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-07c7-87d119131c14
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-b7fc-7c06e53e5fdd
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-0fa5-d27bb454beb2
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-20b5-486510091c7e
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-322f-2ccf4ed87ea3
00020000-5637-258d-94e1-ef3a3239cfd0	00030000-5637-258d-2a82-46d4683302b8
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-fba7-f4dfe2faedf8
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-3c2f-e57a1f804b6f
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-8204-ca0a13ccbb18
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-2186-3d1055d1cf20
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-c7e1-c8649f713afd
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-a0b4-5bc297d39b8f
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-231e-90f7873ee410
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-950c-19d76e7309b8
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-990a-26f81a13a060
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-34b3-787926b8c3ad
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-9e6a-db5f1b73af0b
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-2017-eaeaaa61bbcc
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-fcd6-38bd1dffcdf6
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-e5b0-e4e63438d5aa
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-3db9-d939ab9b7e2f
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258c-cca9-014a7173f44c
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-768f-ceddeeb63337
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-7162-6b5eb3075e37
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-6d27-1bd9bc873907
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-ae17-54526ee11bdd
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-46a4-55ebdf3bedf2
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-76cc-71961c74261d
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-6265-237e233987e1
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-a485-6277c0b957a7
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-c1bd-bbe3804cd6d4
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-322f-2ccf4ed87ea3
00020000-5637-258d-963e-521e62e8fd6f	00030000-5637-258d-2a82-46d4683302b8
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-fba7-f4dfe2faedf8
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-bf0b-5c54b67d8ebb
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-971e-965b0343570e
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-8204-ca0a13ccbb18
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-231e-90f7873ee410
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-990a-26f81a13a060
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-34b3-787926b8c3ad
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-2017-eaeaaa61bbcc
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-fcd6-38bd1dffcdf6
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-3db9-d939ab9b7e2f
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258c-cca9-014a7173f44c
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-768f-ceddeeb63337
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-6d27-1bd9bc873907
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-ae17-54526ee11bdd
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-46a4-55ebdf3bedf2
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-76cc-71961c74261d
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-6265-237e233987e1
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-322f-2ccf4ed87ea3
00020000-5637-258d-d8e5-907e3e939914	00030000-5637-258d-2a82-46d4683302b8
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-fba7-f4dfe2faedf8
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-8204-ca0a13ccbb18
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-231e-90f7873ee410
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-990a-26f81a13a060
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-34b3-787926b8c3ad
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-2017-eaeaaa61bbcc
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-fcd6-38bd1dffcdf6
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-3db9-d939ab9b7e2f
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-cca9-014a7173f44c
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-768f-ceddeeb63337
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-6d27-1bd9bc873907
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-ae17-54526ee11bdd
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-46a4-55ebdf3bedf2
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-76cc-71961c74261d
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-ebd2-aa4d5f71cc20
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258c-fb34-6542bf113821
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-6265-237e233987e1
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-322f-2ccf4ed87ea3
00020000-5637-258d-fbd1-c562870c49e7	00030000-5637-258d-2a82-46d4683302b8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-12bb-c406dddd766b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-8abc-fba86a3901bb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-fba7-f4dfe2faedf8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-bf0b-5c54b67d8ebb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-3c2f-e57a1f804b6f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-971e-965b0343570e
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-8204-ca0a13ccbb18
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-2186-3d1055d1cf20
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-304b-9904d54b098a
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-0c37-99f7f66736bd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-c7e1-c8649f713afd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-85cb-ad22f8de8cfb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-a0b4-5bc297d39b8f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-b6e6-e757b9cdc0aa
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-231e-90f7873ee410
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-57bb-c77cf421002b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-ee5a-50d9f17d9c36
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-1a4c-f403b7aefd54
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-db09-02578131b6e4
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-dca3-08374f8a45bd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-aa7a-9f124e9d473f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-9c89-bb61fef86141
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-9a40-aef21256e113
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-950c-19d76e7309b8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-fce6-81bcb57420d9
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-990a-26f81a13a060
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-4144-208d53deb4c7
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-34b3-787926b8c3ad
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-6f06-4ee82363ce77
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-9e6a-db5f1b73af0b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-b077-a1673b80d31c
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-5515-6bb37dac1207
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-b244-337f262970e4
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-ca6b-4843f84fe107
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-5f7a-1204d307eb86
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-2017-eaeaaa61bbcc
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-fcd6-38bd1dffcdf6
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-3541-a02d33dc12c9
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-42de-40b6bf12dd06
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-8871-99fb996d86aa
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-5795-f90401e6f050
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-e5b0-e4e63438d5aa
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-f21b-9f1fa4e9a340
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-7f9b-fc5182ae2139
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-c03d-61ac4f29165b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-45b6-1e7e2ca06478
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-f70d-81776e9f6bb0
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-d276-a49c25012546
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-92c2-d3f254d7a67c
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-f490-abd03fe07cdd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-3db9-d939ab9b7e2f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-67c9-5d7ed132911f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-cca9-014a7173f44c
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-d093-1d6c29f98f43
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-e36e-18f919f6a8a1
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-749a-b99cf2b591f2
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-3069-b78a245415ff
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-d378-92a3b21a83fd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-5b97-006209be3888
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-922d-de2be2379db1
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-18ab-d828675807bf
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-ce96-6820e45faa6c
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-768f-ceddeeb63337
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-c21e-0c542c070a40
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-1e90-890e2539064d
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-172b-bed85cce12ca
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-7314-973e3f04a843
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-7c50-20f26ebb0da0
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-7162-6b5eb3075e37
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f292-36f0a4d80e8a
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-4e23-9a8e10cadb7f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-7bf2-2dd7be5ae8cb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-53c5-e1a73530b3e4
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f97a-ffae2ccb91eb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-4856-243f2641f8ad
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-271a-a4b3c8a99fa3
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0084-913eb8b88b94
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0a16-6a94e98f4862
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-a1d5-b0b888c9cf59
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-6adf-edba745d542d
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f1ce-8d1f475cdbd8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f16c-2b941b8e236b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-c827-83b838a43ca5
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-b356-d39bbf41335f
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-2b8a-7258eec562ca
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-c1c2-aadcfaa81ade
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-13e4-d1eb28e2f582
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-fc9c-fac378f39cb8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0b67-13593d3898f0
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-94cf-17152f052c47
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-5213-b14bf03bbd9d
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-ca99-947516029dfd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-6d27-1bd9bc873907
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-71b9-dbbf4e683fdc
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-555b-a078750a33d5
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-5f7a-40acc8f9945b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0edb-fa838651c0a8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f590-a06ed4f10e81
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-ae17-54526ee11bdd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-a98a-2a33f517dbd7
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-46a4-55ebdf3bedf2
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-5982-97f24652935c
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-5e29-3d807f5e243b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-8813-395357889cc0
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-1b8c-95edac2c7585
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-511b-8ff6b290fb9b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-8808-f62b04be18c5
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-9160-cbc9c0a1677b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-03c6-89205c6718a7
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-76ed-63cccf0b2636
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-76cc-71961c74261d
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-78db-758d61117f46
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f556-3a76ef2e1ba4
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-1d08-894eedf7ed79
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-ec71-a528d6f2f272
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-295c-5764c6d41813
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0558-e10f93c28fec
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-99f8-5095715dbf9d
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-4fa6-d4bdb30d0422
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-4029-f3e91f384ea3
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-54f5-d8781595e529
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-4a6b-f59e453a9f98
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-ebd2-aa4d5f71cc20
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258c-fb34-6542bf113821
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-d762-5f5047c8b039
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-6265-237e233987e1
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-cfb7-c70546eaf8f3
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-86cb-8ba33d269ab8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-92b1-4a022cf0bbc7
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-1cff-2f6152642c47
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-a637-f17714615d00
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-376b-75ed8671469c
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0ab1-1215a5169adb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-07c7-87d119131c14
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-b7fc-7c06e53e5fdd
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-49b0-02607f357130
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-100c-ba37d06bc2bf
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-a485-6277c0b957a7
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-f811-7921952ad8eb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-c8d2-ef2859a670fb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-dd68-067d91118b95
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-8e3f-69941e3a8214
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-04f6-ebd79f07cf7b
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-0fa5-d27bb454beb2
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-20b5-486510091c7e
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-c1bd-bbe3804cd6d4
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-3b4d-c069d074c4bb
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-322f-2ccf4ed87ea3
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-b187-902abfe2e2d2
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-2a82-46d4683302b8
00020000-5637-258e-6140-9bbc84dae0ef	00030000-5637-258d-2d33-f9b48da99035
\.


--
-- TOC entry 3126 (class 0 OID 24472638)
-- Dependencies: 216
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 24472672)
-- Dependencies: 220
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 24472809)
-- Dependencies: 232
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5637-258e-7e9c-f74bf553da56	00090000-5637-258e-1322-64b6318fe593	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5637-258e-9a85-aa052dc5017d	00090000-5637-258e-7752-c3fa85f98991	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5637-258e-eba6-602b795a047c	00090000-5637-258e-f460-ec5788882ea5	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5637-258e-763a-96fa7d01c185	00090000-5637-258e-a0fa-d9f6b12d0ba9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3098 (class 0 OID 24472336)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5637-258e-b26f-2e0ebf660f43	\N	00040000-5637-258c-1820-c0f8993afd54	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-9d0f-62429bb973b3	\N	00040000-5637-258c-1820-c0f8993afd54	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5637-258e-f88c-1e7ed3bb3632	\N	00040000-5637-258c-1820-c0f8993afd54	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-86b8-6f5d38b01deb	\N	00040000-5637-258c-1820-c0f8993afd54	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-1f1f-56df19cf20e3	\N	00040000-5637-258c-1820-c0f8993afd54	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-79f0-00d9f55256dc	\N	00040000-5637-258c-c67a-9998ae0d91ea	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-ffd7-02f69914d368	\N	00040000-5637-258c-3a00-7f2b00a631fe	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-66d2-1788078e3562	\N	00040000-5637-258c-15bb-14d898b3a148	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-258e-9973-3987058d8337	\N	00040000-5637-258c-fbb2-0232f912ff00	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-2590-ed21-c4cf4350e921	\N	00040000-5637-258c-1820-c0f8993afd54	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3101 (class 0 OID 24472381)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5637-258c-c167-c4591108b08c	8341	Adlešiči
00050000-5637-258c-c9d6-d1b39a154804	5270	Ajdovščina
00050000-5637-258c-e7e7-12c73469c402	6280	Ankaran/Ancarano
00050000-5637-258c-3c04-7d84936e819a	9253	Apače
00050000-5637-258c-6edb-ba50b327b5f9	8253	Artiče
00050000-5637-258c-abfc-191bf4ae38db	4275	Begunje na Gorenjskem
00050000-5637-258c-e8e8-7d59b62f0d28	1382	Begunje pri Cerknici
00050000-5637-258c-06e0-2e92976a5c3d	9231	Beltinci
00050000-5637-258c-9901-b2571f086ab7	2234	Benedikt
00050000-5637-258c-d983-246ab07bfbea	2345	Bistrica ob Dravi
00050000-5637-258c-727a-95dd0d594a73	3256	Bistrica ob Sotli
00050000-5637-258c-bca5-aa81e121f67e	8259	Bizeljsko
00050000-5637-258c-ff8e-c941ae3760bc	1223	Blagovica
00050000-5637-258c-f773-19da9186c4ae	8283	Blanca
00050000-5637-258c-3617-596af75c8fda	4260	Bled
00050000-5637-258c-f81d-e0430885cbb3	4273	Blejska Dobrava
00050000-5637-258c-0ff8-60d7f28fcc5b	9265	Bodonci
00050000-5637-258c-519c-4ee5ed210b4a	9222	Bogojina
00050000-5637-258c-db67-ca3e87f6e304	4263	Bohinjska Bela
00050000-5637-258c-3e5c-a7777033db0f	4264	Bohinjska Bistrica
00050000-5637-258c-5be0-11cdd199f7bf	4265	Bohinjsko jezero
00050000-5637-258c-ee7a-679592a6156b	1353	Borovnica
00050000-5637-258c-7654-7e45af46bdec	8294	Boštanj
00050000-5637-258c-c695-22f8735e90d1	5230	Bovec
00050000-5637-258c-7e4c-182b813e32ce	5295	Branik
00050000-5637-258c-b89a-5b6524762995	3314	Braslovče
00050000-5637-258c-446a-3a2d6ac1d0e2	5223	Breginj
00050000-5637-258c-acdb-bead9efd426e	8280	Brestanica
00050000-5637-258c-d8e7-d317ee492393	2354	Bresternica
00050000-5637-258c-8d9d-a2e80cca6d6e	4243	Brezje
00050000-5637-258c-9e0e-77e661fbf36c	1351	Brezovica pri Ljubljani
00050000-5637-258c-adec-9c633b48555f	8250	Brežice
00050000-5637-258c-7b78-4b7e4f2fadb4	4210	Brnik - Aerodrom
00050000-5637-258c-f032-39f589cdea72	8321	Brusnice
00050000-5637-258c-bd02-6276e59c8ba6	3255	Buče
00050000-5637-258c-6b81-71ab6bfba699	8276	Bučka 
00050000-5637-258c-25aa-3e797c316303	9261	Cankova
00050000-5637-258c-cead-98619473514a	3000	Celje 
00050000-5637-258c-b4b8-e269ef4403b3	3001	Celje - poštni predali
00050000-5637-258c-6553-dc76cdc3b4ab	4207	Cerklje na Gorenjskem
00050000-5637-258c-e7bd-019b110c4476	8263	Cerklje ob Krki
00050000-5637-258c-9b8c-2d513d3bf65b	1380	Cerknica
00050000-5637-258c-6913-316cbdc0d9ee	5282	Cerkno
00050000-5637-258c-a66e-1d416f9a1983	2236	Cerkvenjak
00050000-5637-258c-14cd-343e9ee2d9f7	2215	Ceršak
00050000-5637-258c-86f5-0f9a69fc6e47	2326	Cirkovce
00050000-5637-258c-6e86-68d024853ce3	2282	Cirkulane
00050000-5637-258c-4bd2-fd06588e2c6c	5273	Col
00050000-5637-258c-43c3-c611eb20d859	8251	Čatež ob Savi
00050000-5637-258c-57f0-2c878c866100	1413	Čemšenik
00050000-5637-258c-c031-46e6dfb4452a	5253	Čepovan
00050000-5637-258c-e136-986d68b6900f	9232	Črenšovci
00050000-5637-258c-af62-e54989824b5d	2393	Črna na Koroškem
00050000-5637-258c-761e-3bf7aba7257f	6275	Črni Kal
00050000-5637-258c-ceb7-813c87f1ec51	5274	Črni Vrh nad Idrijo
00050000-5637-258c-3632-60e286dcc5d8	5262	Črniče
00050000-5637-258c-1ad2-fd5b3b9de12d	8340	Črnomelj
00050000-5637-258c-a8c9-ebdeb07c3e6c	6271	Dekani
00050000-5637-258c-0c14-7e1f9ed85f2b	5210	Deskle
00050000-5637-258c-ac70-f3c2f0aa1adc	2253	Destrnik
00050000-5637-258c-d46b-7323129def8a	6215	Divača
00050000-5637-258c-9f51-ef757d46c3d2	1233	Dob
00050000-5637-258c-0820-e69ab75e41af	3224	Dobje pri Planini
00050000-5637-258c-7f94-1f238b9b8d95	8257	Dobova
00050000-5637-258c-aa48-60e15690f044	1423	Dobovec
00050000-5637-258c-fd4c-1b7d0bb4c2ee	5263	Dobravlje
00050000-5637-258c-dc29-16425ecd06e9	3204	Dobrna
00050000-5637-258c-85ae-9b052fa49388	8211	Dobrnič
00050000-5637-258c-013c-dbee90732637	1356	Dobrova
00050000-5637-258c-686a-0857c6e4b63e	9223	Dobrovnik/Dobronak 
00050000-5637-258c-7d81-1e9624508e02	5212	Dobrovo v Brdih
00050000-5637-258c-6e48-1efd1c3c9580	1431	Dol pri Hrastniku
00050000-5637-258c-1258-b6f10c9c1552	1262	Dol pri Ljubljani
00050000-5637-258c-7eab-01ec3bb4fb09	1273	Dole pri Litiji
00050000-5637-258c-89f0-ac0f995434de	1331	Dolenja vas
00050000-5637-258c-377b-31e798f434fd	8350	Dolenjske Toplice
00050000-5637-258c-1296-a4e3d77fa9e7	1230	Domžale
00050000-5637-258c-7a19-d9aa016c055a	2252	Dornava
00050000-5637-258c-ef61-35461b37e388	5294	Dornberk
00050000-5637-258c-f293-32d3388332b7	1319	Draga
00050000-5637-258c-7923-457a99718e2a	8343	Dragatuš
00050000-5637-258c-3892-5a876ea0cf46	3222	Dramlje
00050000-5637-258c-035e-ba8e9179d622	2370	Dravograd
00050000-5637-258c-9928-7e0e5d6247c3	4203	Duplje
00050000-5637-258c-ad19-4e9199960184	6221	Dutovlje
00050000-5637-258c-9eb5-5b3f3b11f5b8	8361	Dvor
00050000-5637-258c-1150-6f6ed1ab4018	2343	Fala
00050000-5637-258c-1d9e-3627bcde9cd9	9208	Fokovci
00050000-5637-258c-de2e-e12ef65612b3	2313	Fram
00050000-5637-258c-bf8e-a0646c229c5b	3213	Frankolovo
00050000-5637-258c-0597-6b12a765e2be	1274	Gabrovka
00050000-5637-258c-9963-713236ddf6f8	8254	Globoko
00050000-5637-258c-bc0c-c2102a95a20a	5275	Godovič
00050000-5637-258c-d661-986526b0c5f2	4204	Golnik
00050000-5637-258c-9db2-7581d140fe9b	3303	Gomilsko
00050000-5637-258c-5dd8-58b4d5faa041	4224	Gorenja vas
00050000-5637-258c-333b-3af298c38add	3263	Gorica pri Slivnici
00050000-5637-258c-57ae-1c2c61c5b0bb	2272	Gorišnica
00050000-5637-258c-1196-bfcd4c3bae5f	9250	Gornja Radgona
00050000-5637-258c-af8a-05e85953ab0f	3342	Gornji Grad
00050000-5637-258c-b2f9-6518ea02bb6d	4282	Gozd Martuljek
00050000-5637-258c-57c3-d9e7819b4683	6272	Gračišče
00050000-5637-258c-a166-e2b49465cb91	9264	Grad
00050000-5637-258c-f5be-4c87a12d017e	8332	Gradac
00050000-5637-258c-7e40-77914f232841	1384	Grahovo
00050000-5637-258c-1b0d-f0d5e2e36069	5242	Grahovo ob Bači
00050000-5637-258c-12ad-1f68bb1f7dc6	5251	Grgar
00050000-5637-258c-e767-26db4d88418c	3302	Griže
00050000-5637-258c-2413-91341631dad1	3231	Grobelno
00050000-5637-258c-fc2c-89d2b99545ee	1290	Grosuplje
00050000-5637-258c-0037-15f0f86bf76b	2288	Hajdina
00050000-5637-258c-5607-bf81f343ba20	8362	Hinje
00050000-5637-258c-0ee5-b6bbafe4ade7	2311	Hoče
00050000-5637-258c-27a9-cba0c4d1a80d	9205	Hodoš/Hodos
00050000-5637-258c-d4b1-aa6631ed3ed4	1354	Horjul
00050000-5637-258c-8f1e-027321175c25	1372	Hotedršica
00050000-5637-258c-355c-772c72ee5ee9	1430	Hrastnik
00050000-5637-258c-2385-b05266e7cbb9	6225	Hruševje
00050000-5637-258c-a932-a3dc8f8bafd4	4276	Hrušica
00050000-5637-258c-b721-41a37be49d75	5280	Idrija
00050000-5637-258c-5e51-b9ad6d492068	1292	Ig
00050000-5637-258c-bbb3-c2e386234950	6250	Ilirska Bistrica
00050000-5637-258c-2d2e-e2fcedcfeae0	6251	Ilirska Bistrica-Trnovo
00050000-5637-258c-77fe-b52363941344	1295	Ivančna Gorica
00050000-5637-258c-053f-0235ca956fa2	2259	Ivanjkovci
00050000-5637-258c-cdc2-f0c7f7dfcdf6	1411	Izlake
00050000-5637-258c-2e54-015b1af68798	6310	Izola/Isola
00050000-5637-258c-767b-212990592dad	2222	Jakobski Dol
00050000-5637-258c-752a-59c6da4a15fe	2221	Jarenina
00050000-5637-258c-8278-960ff49d3095	6254	Jelšane
00050000-5637-258c-64b0-1c5aa80c5e18	4270	Jesenice
00050000-5637-258c-d0b8-fda0e3fe6c57	8261	Jesenice na Dolenjskem
00050000-5637-258c-e767-fdb47b945dc0	3273	Jurklošter
00050000-5637-258c-29af-15e8e60b9d47	2223	Jurovski Dol
00050000-5637-258c-f4f0-a564ff0c3b74	2256	Juršinci
00050000-5637-258c-683c-4bf0ced49e9c	5214	Kal nad Kanalom
00050000-5637-258c-b43f-2f2569754280	3233	Kalobje
00050000-5637-258c-05ec-d36a51314137	4246	Kamna Gorica
00050000-5637-258c-3cf6-386856237b01	2351	Kamnica
00050000-5637-258c-f656-19615647d827	1241	Kamnik
00050000-5637-258c-1bd7-0a5d6c7d8c37	5213	Kanal
00050000-5637-258c-1d62-561f9fbbcf11	8258	Kapele
00050000-5637-258c-42dc-105c602db0d0	2362	Kapla
00050000-5637-258c-f572-5b7d7bf34747	2325	Kidričevo
00050000-5637-258c-2bf3-51db1dbd881b	1412	Kisovec
00050000-5637-258c-524b-af97c6315098	6253	Knežak
00050000-5637-258c-9ef3-905763e2af09	5222	Kobarid
00050000-5637-258c-2cdc-85ee8643a344	9227	Kobilje
00050000-5637-258c-c1c8-17484ca4afe1	1330	Kočevje
00050000-5637-258c-47d3-c7b1341e7a89	1338	Kočevska Reka
00050000-5637-258c-2549-d7da33174cb9	2276	Kog
00050000-5637-258c-6698-6633bc26ff89	5211	Kojsko
00050000-5637-258c-a979-15987a824aff	6223	Komen
00050000-5637-258c-b1d6-0b5d6c239260	1218	Komenda
00050000-5637-258c-9855-13147166313f	6000	Koper/Capodistria 
00050000-5637-258c-322f-d26c126c45af	6001	Koper/Capodistria - poštni predali
00050000-5637-258c-c45d-c6220e22536b	8282	Koprivnica
00050000-5637-258c-2703-e395f4b1c15f	5296	Kostanjevica na Krasu
00050000-5637-258c-01e4-962de1f996b9	8311	Kostanjevica na Krki
00050000-5637-258c-359d-a54613de10e9	1336	Kostel
00050000-5637-258c-fece-d121fa408d12	6256	Košana
00050000-5637-258c-0f3a-a16a5f2feae0	2394	Kotlje
00050000-5637-258c-4998-08bf95be0781	6240	Kozina
00050000-5637-258c-382a-84dc3d7cb2d9	3260	Kozje
00050000-5637-258c-49f2-505048b50a2a	4000	Kranj 
00050000-5637-258c-09cb-34d732046677	4001	Kranj - poštni predali
00050000-5637-258c-ef83-a013a372ebb0	4280	Kranjska Gora
00050000-5637-258c-51af-f0d9ead72114	1281	Kresnice
00050000-5637-258c-a597-e98f0bab5ba7	4294	Križe
00050000-5637-258c-e1c5-3d04a34b8089	9206	Križevci
00050000-5637-258c-be49-35d7afc96a71	9242	Križevci pri Ljutomeru
00050000-5637-258c-a5e7-cbd7f85f97dc	1301	Krka
00050000-5637-258c-f129-4145b5b4dd54	8296	Krmelj
00050000-5637-258c-8728-3e6371cb1a2a	4245	Kropa
00050000-5637-258c-6b2d-ed46c3e82c0a	8262	Krška vas
00050000-5637-258c-3afe-722f1916f301	8270	Krško
00050000-5637-258c-1182-20a179a1ff01	9263	Kuzma
00050000-5637-258c-fd47-a12f5aec8755	2318	Laporje
00050000-5637-258c-3ff8-a7145f30404b	3270	Laško
00050000-5637-258c-d016-bce3d63ced56	1219	Laze v Tuhinju
00050000-5637-258c-d613-810ce0abb500	2230	Lenart v Slovenskih goricah
00050000-5637-258c-7641-f362d3cfcdf7	9220	Lendava/Lendva
00050000-5637-258c-c2a0-b847ed39c3ee	4248	Lesce
00050000-5637-258c-4262-ca56d57200bd	3261	Lesično
00050000-5637-258c-1e35-e3b0d64213d0	8273	Leskovec pri Krškem
00050000-5637-258c-2e16-3da3e4afa2ac	2372	Libeliče
00050000-5637-258c-9396-f9e6313c1472	2341	Limbuš
00050000-5637-258c-f27b-1d6cedb70dbe	1270	Litija
00050000-5637-258c-a2c6-aa907fa78b9f	3202	Ljubečna
00050000-5637-258c-5083-a96ae6e8dc73	1000	Ljubljana 
00050000-5637-258c-122e-c5255ed63bca	1001	Ljubljana - poštni predali
00050000-5637-258c-a17b-193eb141377a	1231	Ljubljana - Črnuče
00050000-5637-258c-4e5a-aa4c172e071c	1261	Ljubljana - Dobrunje
00050000-5637-258c-79f2-3ee2a99f846c	1260	Ljubljana - Polje
00050000-5637-258c-7632-a19abb9bcb61	1210	Ljubljana - Šentvid
00050000-5637-258c-92e4-827654e7d6d2	1211	Ljubljana - Šmartno
00050000-5637-258c-7bff-f1b747663543	3333	Ljubno ob Savinji
00050000-5637-258c-40d3-9cb47e71d731	9240	Ljutomer
00050000-5637-258c-b546-0b79e5791631	3215	Loče
00050000-5637-258c-d3d3-a17d6863987f	5231	Log pod Mangartom
00050000-5637-258c-a739-c6e669614708	1358	Log pri Brezovici
00050000-5637-258c-e40a-1b572995565f	1370	Logatec
00050000-5637-258c-0024-ce56045805e5	1371	Logatec
00050000-5637-258c-a7d8-3ddbb2224291	1434	Loka pri Zidanem Mostu
00050000-5637-258c-264d-0ec3b096b404	3223	Loka pri Žusmu
00050000-5637-258c-21b3-288c9127afff	6219	Lokev
00050000-5637-258c-40e1-f516cb94a348	1318	Loški Potok
00050000-5637-258c-468f-15c16b88a47c	2324	Lovrenc na Dravskem polju
00050000-5637-258c-2646-973c48aa1047	2344	Lovrenc na Pohorju
00050000-5637-258c-d9c5-a9d464de5af5	3334	Luče
00050000-5637-258c-f0bc-0d588a10a45f	1225	Lukovica
00050000-5637-258c-5a64-9b868a4152c9	9202	Mačkovci
00050000-5637-258c-4b89-e68a89e4ce2f	2322	Majšperk
00050000-5637-258c-ae00-a5eb28dbbcf7	2321	Makole
00050000-5637-258c-cc7c-9f1cf8acc4da	9243	Mala Nedelja
00050000-5637-258c-5920-5d59c5bc0229	2229	Malečnik
00050000-5637-258c-e608-3adf92942db6	6273	Marezige
00050000-5637-258c-22ad-997a57ccc89f	2000	Maribor 
00050000-5637-258c-3b4f-6e32be39b834	2001	Maribor - poštni predali
00050000-5637-258c-f85d-b69d69640537	2206	Marjeta na Dravskem polju
00050000-5637-258c-0266-501a1a26978e	2281	Markovci
00050000-5637-258c-c9fe-52838b2fa43c	9221	Martjanci
00050000-5637-258c-1223-5fd164aa5031	6242	Materija
00050000-5637-258c-8243-77784edd1be1	4211	Mavčiče
00050000-5637-258c-43ea-1bb4e78db609	1215	Medvode
00050000-5637-258c-a2f2-b41896519ca8	1234	Mengeš
00050000-5637-258c-b3bb-9775b4f878d7	8330	Metlika
00050000-5637-258c-f794-d89007d91bc2	2392	Mežica
00050000-5637-258c-1bd7-ff7c8fae4fc4	2204	Miklavž na Dravskem polju
00050000-5637-258c-0ac4-609080c48857	2275	Miklavž pri Ormožu
00050000-5637-258c-745b-570e16a5331e	5291	Miren
00050000-5637-258c-41e9-3d745b3f419f	8233	Mirna
00050000-5637-258c-97cf-c4b291e8bc77	8216	Mirna Peč
00050000-5637-258c-ef80-c720b01f5ebe	2382	Mislinja
00050000-5637-258c-2afe-f41fb20431f7	4281	Mojstrana
00050000-5637-258c-be4c-0016d16b6896	8230	Mokronog
00050000-5637-258c-9335-967bfe33b5a7	1251	Moravče
00050000-5637-258c-1bab-cabb610c121e	9226	Moravske Toplice
00050000-5637-258c-9510-645fc6cf63dc	5216	Most na Soči
00050000-5637-258c-f924-bc865f6481cb	1221	Motnik
00050000-5637-258c-8ca9-c16a4af0eaf8	3330	Mozirje
00050000-5637-258c-9cc4-225764452156	9000	Murska Sobota 
00050000-5637-258c-87ec-3e4f74e786bd	9001	Murska Sobota - poštni predali
00050000-5637-258c-1c6c-00f32ea3eba2	2366	Muta
00050000-5637-258c-7209-2c22021a8d5d	4202	Naklo
00050000-5637-258c-687a-921fc7f058a5	3331	Nazarje
00050000-5637-258c-c24e-9c8a60b0ec1f	1357	Notranje Gorice
00050000-5637-258c-8989-554f8144605a	3203	Nova Cerkev
00050000-5637-258c-34c2-a6b14388961c	5000	Nova Gorica 
00050000-5637-258c-958d-fa21e53ef02e	5001	Nova Gorica - poštni predali
00050000-5637-258c-2c90-79bde103cba5	1385	Nova vas
00050000-5637-258c-f5aa-cb19ec44b155	8000	Novo mesto
00050000-5637-258c-c3a2-801d998d5d3c	8001	Novo mesto - poštni predali
00050000-5637-258c-b45f-f4d9272573e0	6243	Obrov
00050000-5637-258c-5705-58490084a5c7	9233	Odranci
00050000-5637-258c-7714-b31d59218740	2317	Oplotnica
00050000-5637-258c-5436-4c5ef2a9a13a	2312	Orehova vas
00050000-5637-258c-4d16-38406ca2c1db	2270	Ormož
00050000-5637-258c-94df-3a89ef23f875	1316	Ortnek
00050000-5637-258c-eaef-9b254e2d456d	1337	Osilnica
00050000-5637-258c-d2b5-8be1c6636ae4	8222	Otočec
00050000-5637-258c-4dd1-70c609ccb52a	2361	Ožbalt
00050000-5637-258c-3480-b6cdf0ecc2e1	2231	Pernica
00050000-5637-258c-9565-edd2c383b119	2211	Pesnica pri Mariboru
00050000-5637-258c-1c09-8a9f0d2a9296	9203	Petrovci
00050000-5637-258c-c48f-55177caa8a7c	3301	Petrovče
00050000-5637-258c-78d6-95f2523440bc	6330	Piran/Pirano
00050000-5637-258c-5312-292e25341d1f	8255	Pišece
00050000-5637-258c-a8dd-8513a7aefe80	6257	Pivka
00050000-5637-258c-77f2-b22de934e5bc	6232	Planina
00050000-5637-258c-cbc8-24791cc57af7	3225	Planina pri Sevnici
00050000-5637-258c-471d-3cb353f41d57	6276	Pobegi
00050000-5637-258c-965b-83679a472020	8312	Podbočje
00050000-5637-258c-065e-e5efdcbd50af	5243	Podbrdo
00050000-5637-258c-34c4-0ebb6fb52a7f	3254	Podčetrtek
00050000-5637-258c-62da-649555cc29c2	2273	Podgorci
00050000-5637-258c-567b-a695a4a00d5a	6216	Podgorje
00050000-5637-258c-9344-8d954e10bad4	2381	Podgorje pri Slovenj Gradcu
00050000-5637-258c-4fc2-8ecf2c69dc25	6244	Podgrad
00050000-5637-258c-54dd-d56da7b79c2f	1414	Podkum
00050000-5637-258c-8d69-34974674e358	2286	Podlehnik
00050000-5637-258c-b6b7-095431a5dae5	5272	Podnanos
00050000-5637-258c-3ea3-e425a37a0869	4244	Podnart
00050000-5637-258c-407b-51b70125673f	3241	Podplat
00050000-5637-258c-1d29-f74615bfd9e1	3257	Podsreda
00050000-5637-258c-a386-f9d67a258fc9	2363	Podvelka
00050000-5637-258c-ec4d-ab7af783b019	2208	Pohorje
00050000-5637-258c-e6b0-7994b9692804	2257	Polenšak
00050000-5637-258c-79da-0942581dc0f6	1355	Polhov Gradec
00050000-5637-258c-37df-a6a0ea64b2ff	4223	Poljane nad Škofjo Loko
00050000-5637-258c-5fa8-b0fd515b4b18	2319	Poljčane
00050000-5637-258c-13e9-8be2db9d8e24	1272	Polšnik
00050000-5637-258c-bdec-015c9620ed95	3313	Polzela
00050000-5637-258c-ccf1-9f9efb5c2b9b	3232	Ponikva
00050000-5637-258c-aba3-56669fda991d	6320	Portorož/Portorose
00050000-5637-258c-535c-84123c2cd223	6230	Postojna
00050000-5637-258c-beb2-866053f8f986	2331	Pragersko
00050000-5637-258c-cc81-7e3bb62882ae	3312	Prebold
00050000-5637-258c-5f1a-6b06ad5d83be	4205	Preddvor
00050000-5637-258c-4d0f-81984e06fb14	6255	Prem
00050000-5637-258c-98c0-1782ad7543d7	1352	Preserje
00050000-5637-258c-ac68-88658bbb10bf	6258	Prestranek
00050000-5637-258c-d252-6d964fb50063	2391	Prevalje
00050000-5637-258c-1fcd-f4e71ae06c86	3262	Prevorje
00050000-5637-258c-8580-37deb3fe437f	1276	Primskovo 
00050000-5637-258c-a7a8-6ed5cdf3421f	3253	Pristava pri Mestinju
00050000-5637-258c-4d38-87a2feef5d70	9207	Prosenjakovci/Partosfalva
00050000-5637-258c-b14d-98f3473d24cf	5297	Prvačina
00050000-5637-258c-ecd1-cbace9f6dd7a	2250	Ptuj
00050000-5637-258c-ad54-f084c88ff3e3	2323	Ptujska Gora
00050000-5637-258c-31c5-9a85c99d56d8	9201	Puconci
00050000-5637-258c-dc31-9c847068ecbf	2327	Rače
00050000-5637-258c-8670-32e87fa393db	1433	Radeče
00050000-5637-258c-8112-3542eb59422e	9252	Radenci
00050000-5637-258c-8445-6893a8e15a48	2360	Radlje ob Dravi
00050000-5637-258c-4a36-427cc17710ba	1235	Radomlje
00050000-5637-258c-7f96-ae89c28ff6c5	4240	Radovljica
00050000-5637-258c-ecc4-70288ca99b79	8274	Raka
00050000-5637-258c-9b11-59b4811d1589	1381	Rakek
00050000-5637-258c-3106-536cb3887142	4283	Rateče - Planica
00050000-5637-258c-354a-67b13202329c	2390	Ravne na Koroškem
00050000-5637-258c-a381-7e501da4ff82	9246	Razkrižje
00050000-5637-258c-15d1-856c1bb92e0d	3332	Rečica ob Savinji
00050000-5637-258c-d812-1fcc440fa28f	5292	Renče
00050000-5637-258c-20b6-db338936f966	1310	Ribnica
00050000-5637-258c-7ca5-0bd97008178d	2364	Ribnica na Pohorju
00050000-5637-258c-0428-13d6672b8d20	3272	Rimske Toplice
00050000-5637-258c-826d-6049008fa51e	1314	Rob
00050000-5637-258c-9d34-32b290d69b5e	5215	Ročinj
00050000-5637-258c-0bb2-67cc0d357c3b	3250	Rogaška Slatina
00050000-5637-258c-b921-159e5e277c83	9262	Rogašovci
00050000-5637-258c-82f6-89feed0fb9b8	3252	Rogatec
00050000-5637-258c-a087-c776f25d5976	1373	Rovte
00050000-5637-258c-be4f-dc6278e8b1e3	2342	Ruše
00050000-5637-258c-2a93-d37021a3a79e	1282	Sava
00050000-5637-258c-9340-2f0da29876c0	6333	Sečovlje/Sicciole
00050000-5637-258c-a7cd-ec7f4e86a018	4227	Selca
00050000-5637-258c-64be-4ed4981aefe4	2352	Selnica ob Dravi
00050000-5637-258c-4d2a-abfd3ad562c4	8333	Semič
00050000-5637-258c-3e4b-af8c76b2de00	8281	Senovo
00050000-5637-258c-d20d-2d6fa378c51f	6224	Senožeče
00050000-5637-258c-5393-e54930e436f3	8290	Sevnica
00050000-5637-258c-3c9b-326c668d494a	6210	Sežana
00050000-5637-258c-b9aa-9b7f52adbb78	2214	Sladki Vrh
00050000-5637-258c-19ff-82e79572b2df	5283	Slap ob Idrijci
00050000-5637-258c-bdf1-038307b28b90	2380	Slovenj Gradec
00050000-5637-258c-a69c-58576b7c7f84	2310	Slovenska Bistrica
00050000-5637-258c-91c0-cf687110dc30	3210	Slovenske Konjice
00050000-5637-258c-39a4-27296e8fd3fd	1216	Smlednik
00050000-5637-258c-158d-4606a18b914c	5232	Soča
00050000-5637-258c-cf27-c85acb10fc3c	1317	Sodražica
00050000-5637-258c-51ad-972364cc4aa8	3335	Solčava
00050000-5637-258c-65a3-56b73b6fcef5	5250	Solkan
00050000-5637-258c-75ec-8ce484275657	4229	Sorica
00050000-5637-258c-6f8d-6586fd9b9ae5	4225	Sovodenj
00050000-5637-258c-1e04-2d449a174ff7	5281	Spodnja Idrija
00050000-5637-258c-fe30-15f8e79252ff	2241	Spodnji Duplek
00050000-5637-258c-81e6-b307c01f42cb	9245	Spodnji Ivanjci
00050000-5637-258c-4c53-4cc0c128a28c	2277	Središče ob Dravi
00050000-5637-258c-8e2c-42e2f9da1578	4267	Srednja vas v Bohinju
00050000-5637-258c-b6c5-1f9e8dec7038	8256	Sromlje 
00050000-5637-258c-0647-85844d7d5dab	5224	Srpenica
00050000-5637-258c-9a5f-1f8bc7b7a0d8	1242	Stahovica
00050000-5637-258c-c894-5b7bfec450b6	1332	Stara Cerkev
00050000-5637-258c-1b58-9a8654324a0c	8342	Stari trg ob Kolpi
00050000-5637-258c-f30e-99def87c83be	1386	Stari trg pri Ložu
00050000-5637-258c-bc21-c2b54162085d	2205	Starše
00050000-5637-258c-612d-ac989e9c4f5c	2289	Stoperce
00050000-5637-258c-c079-9ecd989a96e8	8322	Stopiče
00050000-5637-258c-12cf-8772ea29d8a6	3206	Stranice
00050000-5637-258c-f1eb-8f0da90165c6	8351	Straža
00050000-5637-258c-330d-892db5767144	1313	Struge
00050000-5637-258c-90d7-55f7b5998546	8293	Studenec
00050000-5637-258c-9fff-66af6967acb9	8331	Suhor
00050000-5637-258c-59c9-c94e353b670c	2233	Sv. Ana v Slovenskih goricah
00050000-5637-258c-7a61-791aace38e66	2235	Sv. Trojica v Slovenskih goricah
00050000-5637-258c-a6c2-f9a3fe086325	2353	Sveti Duh na Ostrem Vrhu
00050000-5637-258c-90ee-09c82f6fa831	9244	Sveti Jurij ob Ščavnici
00050000-5637-258c-186e-51551cdb69ca	3264	Sveti Štefan
00050000-5637-258c-55cb-546270826457	2258	Sveti Tomaž
00050000-5637-258c-c2fb-efddc12dae4f	9204	Šalovci
00050000-5637-258c-66d2-421900dcc379	5261	Šempas
00050000-5637-258c-779f-f7754add02ec	5290	Šempeter pri Gorici
00050000-5637-258c-434e-507b89af61e5	3311	Šempeter v Savinjski dolini
00050000-5637-258c-2633-cd312440691c	4208	Šenčur
00050000-5637-258c-8c9e-0c0c39e693d9	2212	Šentilj v Slovenskih goricah
00050000-5637-258c-0f6d-5fc2c4e5cac5	8297	Šentjanž
00050000-5637-258c-2dbe-29cd4e13098f	2373	Šentjanž pri Dravogradu
00050000-5637-258c-32e9-dacbbcb4fb02	8310	Šentjernej
00050000-5637-258c-80e6-b2937f54a182	3230	Šentjur
00050000-5637-258c-6ab5-5270663d3d8f	3271	Šentrupert
00050000-5637-258c-f79d-445139b74d8f	8232	Šentrupert
00050000-5637-258c-21d8-43f4a952f009	1296	Šentvid pri Stični
00050000-5637-258c-6e19-22589d4b7992	8275	Škocjan
00050000-5637-258c-7734-62f1bac045b8	6281	Škofije
00050000-5637-258c-5104-659c860e88d1	4220	Škofja Loka
00050000-5637-258c-ad81-d15e2a8a2941	3211	Škofja vas
00050000-5637-258c-96b6-708af578d0d3	1291	Škofljica
00050000-5637-258c-38c0-849801263e4b	6274	Šmarje
00050000-5637-258c-b766-ffa8ceaba572	1293	Šmarje - Sap
00050000-5637-258c-43f6-6d00b8b54b84	3240	Šmarje pri Jelšah
00050000-5637-258c-52ee-0b6045870484	8220	Šmarješke Toplice
00050000-5637-258c-7dc5-d303375229cd	2315	Šmartno na Pohorju
00050000-5637-258c-44a9-495f03e0c1fb	3341	Šmartno ob Dreti
00050000-5637-258c-35c0-a2b1af725138	3327	Šmartno ob Paki
00050000-5637-258c-3358-475bbd068626	1275	Šmartno pri Litiji
00050000-5637-258c-6ad9-a65d33492382	2383	Šmartno pri Slovenj Gradcu
00050000-5637-258c-0b30-44d72abf8fc6	3201	Šmartno v Rožni dolini
00050000-5637-258c-1d5e-abd845778013	3325	Šoštanj
00050000-5637-258c-b937-d0bc562e50f4	6222	Štanjel
00050000-5637-258c-7bc1-c46a7c30a1ab	3220	Štore
00050000-5637-258c-e362-0d486e41f91c	3304	Tabor
00050000-5637-258c-8a01-03eaa4bed1f5	3221	Teharje
00050000-5637-258c-af0c-ce10e8787905	9251	Tišina
00050000-5637-258c-edd4-00919a5a4337	5220	Tolmin
00050000-5637-258c-a192-a1fa740e5d48	3326	Topolšica
00050000-5637-258c-d086-d6de4e67eac0	2371	Trbonje
00050000-5637-258c-b6c8-2522da57fc88	1420	Trbovlje
00050000-5637-258c-eeb1-a6e1e8667ea4	8231	Trebelno 
00050000-5637-258c-4489-c7b78daa816f	8210	Trebnje
00050000-5637-258c-6e26-82e3a35614cd	5252	Trnovo pri Gorici
00050000-5637-258c-0c33-1f77bcb13251	2254	Trnovska vas
00050000-5637-258c-edc1-03fb16e9c1db	1222	Trojane
00050000-5637-258c-ff72-11bb081e866f	1236	Trzin
00050000-5637-258c-3aec-8e7c1c8af255	4290	Tržič
00050000-5637-258c-7bb4-b17714dc080a	8295	Tržišče
00050000-5637-258c-aa73-2e5879a25db5	1311	Turjak
00050000-5637-258c-40f5-12a0f7d6d275	9224	Turnišče
00050000-5637-258c-ebb5-bf64ca648683	8323	Uršna sela
00050000-5637-258c-cabd-fb282374acd9	1252	Vače
00050000-5637-258c-058d-a5175bb4fade	3320	Velenje 
00050000-5637-258c-dffe-5c350dd5fdc7	3322	Velenje - poštni predali
00050000-5637-258c-a10f-5de558c0ce57	8212	Velika Loka
00050000-5637-258c-a6ec-d0238737e6ea	2274	Velika Nedelja
00050000-5637-258c-88e4-d74a5ecbf2b9	9225	Velika Polana
00050000-5637-258c-2817-cae4c43a5327	1315	Velike Lašče
00050000-5637-258c-3b3a-c086fd7a5d17	8213	Veliki Gaber
00050000-5637-258c-7e03-28d8044dfe17	9241	Veržej
00050000-5637-258c-12a3-073ede9d7534	1312	Videm - Dobrepolje
00050000-5637-258c-4241-ef619610215a	2284	Videm pri Ptuju
00050000-5637-258c-ab71-109b10e270ea	8344	Vinica
00050000-5637-258c-a69f-116983f79577	5271	Vipava
00050000-5637-258c-7463-9c505832c1b3	4212	Visoko
00050000-5637-258c-d69f-d27967051fdb	1294	Višnja Gora
00050000-5637-258c-c5a6-17dccd790ef1	3205	Vitanje
00050000-5637-258c-4325-d8936ac85228	2255	Vitomarci
00050000-5637-258c-0a3d-467be0c43510	1217	Vodice
00050000-5637-258c-3a4c-83e9088c5eb1	3212	Vojnik\t
00050000-5637-258c-0ea9-c6305b10f860	5293	Volčja Draga
00050000-5637-258c-a539-4ad8ac498fca	2232	Voličina
00050000-5637-258c-a538-b547785b0a55	3305	Vransko
00050000-5637-258c-a447-a3fcea8bfd59	6217	Vremski Britof
00050000-5637-258c-135e-59bab86c9b4d	1360	Vrhnika
00050000-5637-258c-7c8f-e1dc8b1d9d09	2365	Vuhred
00050000-5637-258c-b0a4-dd78dc798621	2367	Vuzenica
00050000-5637-258c-15f4-cf65c479b34f	8292	Zabukovje 
00050000-5637-258c-78b0-6da4f7193aac	1410	Zagorje ob Savi
00050000-5637-258c-2060-7368399ce992	1303	Zagradec
00050000-5637-258c-d081-72a98c8d942d	2283	Zavrč
00050000-5637-258c-eb44-c0b8ceac834f	8272	Zdole 
00050000-5637-258c-2646-0d5411c61258	4201	Zgornja Besnica
00050000-5637-258c-42ee-e65b4dd9658d	2242	Zgornja Korena
00050000-5637-258c-5dd9-351fc7328111	2201	Zgornja Kungota
00050000-5637-258c-48a3-6dac3f9b2a93	2316	Zgornja Ložnica
00050000-5637-258c-69a6-bdd5bd4996ae	2314	Zgornja Polskava
00050000-5637-258c-cf2a-0c6e381d017e	2213	Zgornja Velka
00050000-5637-258c-9d38-dce3b9043dcd	4247	Zgornje Gorje
00050000-5637-258c-3d3e-a77d135613c6	4206	Zgornje Jezersko
00050000-5637-258c-b0ec-4f49f02e62a9	2285	Zgornji Leskovec
00050000-5637-258c-fbe0-5879ac59fe2c	1432	Zidani Most
00050000-5637-258c-de3c-c65e6272a923	3214	Zreče
00050000-5637-258c-1884-05616da4cc64	4209	Žabnica
00050000-5637-258c-da2c-995314dcccca	3310	Žalec
00050000-5637-258c-d5e0-1c9055005ff5	4228	Železniki
00050000-5637-258c-9796-ac8ed734f97b	2287	Žetale
00050000-5637-258c-cf0f-60ccebf3d339	4226	Žiri
00050000-5637-258c-71b0-6b83a02cfbc2	4274	Žirovnica
00050000-5637-258c-e879-3d3ceb4373a1	8360	Žužemberk
\.


--
-- TOC entry 3149 (class 0 OID 24473036)
-- Dependencies: 239
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 24472612)
-- Dependencies: 212
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 24472366)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5637-258e-d283-dbd1e68e9cfa	00080000-5637-258e-b26f-2e0ebf660f43	\N	00040000-5637-258c-1820-c0f8993afd54	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5637-258e-f4a0-43f7f429f499	00080000-5637-258e-b26f-2e0ebf660f43	\N	00040000-5637-258c-1820-c0f8993afd54	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5637-258e-94d3-24d1ab14b018	00080000-5637-258e-9d0f-62429bb973b3	\N	00040000-5637-258c-1820-c0f8993afd54	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3112 (class 0 OID 24472510)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5637-258c-a1c6-e1575b9fe71c	novo leto	1	1	\N	t
00430000-5637-258c-be08-451d2fb76cef	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5637-258c-66b2-24ffe0aa223a	dan upora proti okupatorju	27	4	\N	t
00430000-5637-258c-0186-4e3902a2a2da	praznik dela	1	5	\N	t
00430000-5637-258c-d9e6-0dd6e90a1605	praznik dela	2	5	\N	t
00430000-5637-258c-dd48-7c6ba5916f17	dan Primoža Trubarja	8	6	\N	f
00430000-5637-258c-5f77-04f22d10cc2f	dan državnosti	25	6	\N	t
00430000-5637-258c-c574-bd33acba4fa2	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5637-258c-5b9b-20d13704622c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5637-258c-b359-bc50ca68ed7f	dan suverenosti	25	10	\N	f
00430000-5637-258c-e28c-1211cb2c00e3	dan spomina na mrtve	1	11	\N	t
00430000-5637-258c-191f-ed0292d4ad06	dan Rudolfa Maistra	23	11	\N	f
00430000-5637-258c-f05f-2e2ecefac9d0	božič	25	12	\N	t
00430000-5637-258c-c1a3-1e9e4d67867d	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5637-258c-3ebe-908dd01351f8	Marijino vnebovzetje	15	8	\N	t
00430000-5637-258c-9b4e-0219c204d8e3	dan reformacije	31	10	\N	t
00430000-5637-258c-80d3-e29f1fe2dc58	velikonočna nedelja	27	3	2016	t
00430000-5637-258c-b341-8ce930738b21	velikonočna nedelja	16	4	2017	t
00430000-5637-258c-fd3e-b97a1568b387	velikonočna nedelja	1	4	2018	t
00430000-5637-258c-70f7-d47423dd428f	velikonočna nedelja	21	4	2019	t
00430000-5637-258c-6894-bbb835b3af34	velikonočna nedelja	12	4	2020	t
00430000-5637-258c-6d1f-edf73ea609d7	velikonočna nedelja	4	4	2021	t
00430000-5637-258c-e1c1-f12c7df2bca2	velikonočna nedelja	17	4	2022	t
00430000-5637-258c-846e-43a54bb60f46	velikonočna nedelja	9	4	2023	t
00430000-5637-258c-7062-62a544977e2c	velikonočna nedelja	31	3	2024	t
00430000-5637-258c-fddf-92571ff8df42	velikonočna nedelja	20	4	2025	t
00430000-5637-258c-59eb-4590e47ba8f3	velikonočna nedelja	5	4	2026	t
00430000-5637-258c-e3af-bb898c5b8f1d	velikonočna nedelja	28	3	2027	t
00430000-5637-258c-1463-ddf407f92d50	velikonočna nedelja	16	4	2028	t
00430000-5637-258c-9ec8-e283aac2a6e0	velikonočna nedelja	1	4	2029	t
00430000-5637-258c-1543-a8e7ed152d84	velikonočna nedelja	21	4	2030	t
00430000-5637-258c-f180-ada518918766	velikonočni ponedeljek	28	3	2016	t
00430000-5637-258c-e84d-85383fcb2087	velikonočni ponedeljek	17	4	2017	t
00430000-5637-258c-bf12-b39fdf37c98c	velikonočni ponedeljek	2	4	2018	t
00430000-5637-258c-553f-315828c14bd8	velikonočni ponedeljek	22	4	2019	t
00430000-5637-258c-38f7-0a6c2e9964ef	velikonočni ponedeljek	13	4	2020	t
00430000-5637-258c-70dd-a2c4c46ac84f	velikonočni ponedeljek	5	4	2021	t
00430000-5637-258c-c131-d06434db99be	velikonočni ponedeljek	18	4	2022	t
00430000-5637-258c-cf40-0f0c8a68f4a2	velikonočni ponedeljek	10	4	2023	t
00430000-5637-258c-73e0-f4e93c06ac8a	velikonočni ponedeljek	1	4	2024	t
00430000-5637-258c-e263-15fe9ecf215b	velikonočni ponedeljek	21	4	2025	t
00430000-5637-258c-0fbc-b5338083eaf1	velikonočni ponedeljek	6	4	2026	t
00430000-5637-258c-bb23-58c5763129de	velikonočni ponedeljek	29	3	2027	t
00430000-5637-258c-0f05-6137beb5d451	velikonočni ponedeljek	17	4	2028	t
00430000-5637-258c-eb71-a26a236a596c	velikonočni ponedeljek	2	4	2029	t
00430000-5637-258c-4988-8e2cad90030d	velikonočni ponedeljek	22	4	2030	t
00430000-5637-258c-488c-eb140aa51ff9	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5637-258c-0f69-048b18dc700a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5637-258c-eca7-b2e12104bb48	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5637-258c-f2ca-4f7abc3f0d49	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5637-258c-72c6-ec2b38fb7519	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5637-258c-da9a-0b0c32f31101	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5637-258c-dbc4-1af8e14ebd99	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5637-258c-a461-611c70c2e3be	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5637-258c-04c5-3f78567d376d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5637-258c-d494-6a77c8fc18b1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5637-258c-5968-3ea450db0ce0	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5637-258c-0f9c-3712f77f7b0a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5637-258c-cecc-86d03c2670cb	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5637-258c-d9f1-3fe660fd4d44	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5637-258c-1a66-122d201c5109	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3108 (class 0 OID 24472470)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 24472482)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 24472624)
-- Dependencies: 214
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 24473050)
-- Dependencies: 240
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 24473060)
-- Dependencies: 241
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5637-258e-f0ec-57f7ef04d542	00080000-5637-258e-f88c-1e7ed3bb3632	0987	AK
00190000-5637-258e-6e74-af400d5ce6bc	00080000-5637-258e-9d0f-62429bb973b3	0989	AK
00190000-5637-258e-abe1-5f02f391599b	00080000-5637-258e-86b8-6f5d38b01deb	0986	AK
00190000-5637-258e-742a-22c6fde26dc9	00080000-5637-258e-79f0-00d9f55256dc	0984	AK
00190000-5637-258e-9a6a-0afc3e67c3e9	00080000-5637-258e-ffd7-02f69914d368	0983	AK
00190000-5637-258e-ab48-0290a41b0444	00080000-5637-258e-66d2-1788078e3562	0982	AK
00190000-5637-2590-1622-afccd4c5cca6	00080000-5637-2590-ed21-c4cf4350e921	1001	AK
\.


--
-- TOC entry 3148 (class 0 OID 24472959)
-- Dependencies: 238
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5637-258f-148c-9d51252f116e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3152 (class 0 OID 24473068)
-- Dependencies: 242
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 24472653)
-- Dependencies: 218
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5637-258e-8542-064217804126	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5637-258e-02de-0d1142fc3db4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5637-258e-d10c-e40bd3c27c31	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5637-258e-72ad-6360da63a12d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5637-258e-159c-fdcf675545bd	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5637-258e-c381-af3e70e403d0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5637-258e-56fb-a526383f56b6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3120 (class 0 OID 24472597)
-- Dependencies: 210
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 24472587)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 24472798)
-- Dependencies: 231
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 24472728)
-- Dependencies: 225
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 24472444)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 24472206)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5637-2590-ed21-c4cf4350e921	00010000-5637-258d-d860-6011d7245e5f	2015-11-02 09:57:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-5637-2590-3156-ce9d3ce5d875	00010000-5637-258d-d860-6011d7245e5f	2015-11-02 09:57:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5637-2590-1622-afccd4c5cca6	00010000-5637-258d-d860-6011d7245e5f	2015-11-02 09:57:52	INS	a:0:{}
\.


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3129 (class 0 OID 24472666)
-- Dependencies: 219
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 24472244)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5637-258d-1abb-e60f79d9553a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5637-258d-1ba9-d18ba8e4ade0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5637-258d-1d4e-b6bdc31cf612	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5637-258d-ef58-a73bc736529e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5637-258d-59d7-fdcb7a9a5038	planer	Planer dogodkov v koledarju	t
00020000-5637-258d-94e1-ef3a3239cfd0	kadrovska	Kadrovska služba	t
00020000-5637-258d-963e-521e62e8fd6f	arhivar	Ažuriranje arhivalij	t
00020000-5637-258d-d8e5-907e3e939914	igralec	Igralec	t
00020000-5637-258d-fbd1-c562870c49e7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5637-258e-6140-9bbc84dae0ef	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3087 (class 0 OID 24472228)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5637-258d-8c5c-167938b1ee65	00020000-5637-258d-1d4e-b6bdc31cf612
00010000-5637-258d-d860-6011d7245e5f	00020000-5637-258d-1d4e-b6bdc31cf612
00010000-5637-258e-8659-48af139b9572	00020000-5637-258e-6140-9bbc84dae0ef
\.


--
-- TOC entry 3131 (class 0 OID 24472680)
-- Dependencies: 221
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 24472618)
-- Dependencies: 213
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 24472564)
-- Dependencies: 207
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5637-258e-c15f-16983b32a6c8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5637-258e-e5a7-f4a0f97bf04d	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5637-258e-b3d0-73cca6f5e664	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3083 (class 0 OID 24472193)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5637-258c-a251-2649d4adda1c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5637-258c-746e-c4e230d23414	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5637-258c-01a5-bfb16d1a73e1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5637-258c-85ab-766727da571f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5637-258c-116d-c71d7fa332d2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3082 (class 0 OID 24472185)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5637-258c-f000-98550ab5a684	00230000-5637-258c-85ab-766727da571f	popa
00240000-5637-258c-c21f-ac41d476a6c6	00230000-5637-258c-85ab-766727da571f	oseba
00240000-5637-258c-d1f0-b8d4f939ae63	00230000-5637-258c-85ab-766727da571f	tippopa
00240000-5637-258c-f9f6-c4d557f55531	00230000-5637-258c-85ab-766727da571f	organizacijskaenota
00240000-5637-258c-af3a-1442186c6a79	00230000-5637-258c-85ab-766727da571f	sezona
00240000-5637-258c-7db2-603375387562	00230000-5637-258c-85ab-766727da571f	tipvaje
00240000-5637-258c-c815-2e81479a6b51	00230000-5637-258c-746e-c4e230d23414	prostor
00240000-5637-258c-eb97-9b88bb4337c1	00230000-5637-258c-85ab-766727da571f	besedilo
00240000-5637-258c-7af9-e6209cb81f0c	00230000-5637-258c-85ab-766727da571f	uprizoritev
00240000-5637-258c-36eb-5ee08aa78704	00230000-5637-258c-85ab-766727da571f	funkcija
00240000-5637-258c-830c-e8f5b43bb840	00230000-5637-258c-85ab-766727da571f	tipfunkcije
00240000-5637-258c-b755-dd48389d066b	00230000-5637-258c-85ab-766727da571f	alternacija
00240000-5637-258c-743f-d05f5a900ae4	00230000-5637-258c-a251-2649d4adda1c	pogodba
00240000-5637-258c-347e-4daa869458b4	00230000-5637-258c-85ab-766727da571f	zaposlitev
00240000-5637-258c-cd93-80a150e7de43	00230000-5637-258c-85ab-766727da571f	zvrstuprizoritve
00240000-5637-258c-3e53-05d62decd6d2	00230000-5637-258c-a251-2649d4adda1c	programdela
00240000-5637-258c-bc26-bf5d3392574d	00230000-5637-258c-85ab-766727da571f	zapis
\.


--
-- TOC entry 3081 (class 0 OID 24472180)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
04e7a5e6-74fc-4c63-9754-428d8f7770de	00240000-5637-258c-f000-98550ab5a684	0	1001
\.


--
-- TOC entry 3137 (class 0 OID 24472745)
-- Dependencies: 227
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5637-258f-dcfb-7b4899c75719	000e0000-5637-258e-b535-6f3e01020ab0	00080000-5637-258e-b26f-2e0ebf660f43	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5637-258c-4f22-e0731127c910
00270000-5637-258f-4336-d1e19fe49412	000e0000-5637-258e-b535-6f3e01020ab0	00080000-5637-258e-b26f-2e0ebf660f43	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5637-258c-4f22-e0731127c910
\.


--
-- TOC entry 3097 (class 0 OID 24472328)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 24472574)
-- Dependencies: 208
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5637-258f-a9e2-05baa314efca	00180000-5637-258f-3112-f304d1a8de71	000c0000-5637-258f-4093-bd0028f42bb3	00090000-5637-258e-1322-64b6318fe593	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-258f-fedb-6daa907d549e	00180000-5637-258f-3112-f304d1a8de71	000c0000-5637-258f-243a-af2f40c43f0b	00090000-5637-258e-a0fa-d9f6b12d0ba9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-258f-ff4a-696dc577ad33	00180000-5637-258f-3112-f304d1a8de71	000c0000-5637-258f-7ea6-3da14e45e970	00090000-5637-258e-55a6-ba61a01b45d5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-258f-5156-8ae27f03c037	00180000-5637-258f-3112-f304d1a8de71	000c0000-5637-258f-1aae-4812d0bfc183	00090000-5637-258e-c15b-37a3397f2b60	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-258f-8e28-7ab90333ccd3	00180000-5637-258f-3112-f304d1a8de71	000c0000-5637-258f-e2ba-b9a9ce88c8c2	00090000-5637-258e-3370-b8dc850227a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-258f-258c-e8633ab6269c	00180000-5637-258f-38a4-5f83c529a31b	\N	00090000-5637-258e-3370-b8dc850227a6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5637-258f-7e16-9b59ca0ffe27	00180000-5637-258f-38a4-5f83c529a31b	\N	00090000-5637-258e-a0fa-d9f6b12d0ba9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3140 (class 0 OID 24472786)
-- Dependencies: 230
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5637-258c-f029-4bae79830aa8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5637-258c-bdce-f12d1aef34db	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5637-258c-cb3e-080bd7c5e580	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5637-258c-faac-5c2a36cfccfb	04	Režija	Režija	Režija	umetnik	30
000f0000-5637-258c-fd81-dd0b4c9e580b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5637-258c-5bdf-cc3fd2b6f63a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5637-258c-33f7-a174d0c268d7	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5637-258c-4f43-e5b71bb35dbd	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5637-258c-3177-8e82e3266246	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5637-258c-f928-58371766801e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5637-258c-7c25-e0e7cbd996e6	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5637-258c-bb40-25631ad51518	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5637-258c-d69a-f76b77c31d2e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5637-258c-5740-4f89f983e159	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5637-258c-0dbe-bfa5babd4ba3	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5637-258c-3e6d-07bc20148ec7	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5637-258c-a8ff-7bea8b0d11ba	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5637-258c-6c7f-e11c59290704	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3094 (class 0 OID 24472279)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5637-258e-ba11-e06567493a8d	0001	šola	osnovna ali srednja šola
00400000-5637-258e-c436-a2d284b17229	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5637-258e-ea13-f0f874f353b8	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3153 (class 0 OID 24473079)
-- Dependencies: 243
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5637-258c-7b5f-091b542624f5	01	Velika predstava	f	1.00	1.00
002b0000-5637-258c-34d0-c12e6287d7ce	02	Mala predstava	f	0.50	0.50
002b0000-5637-258c-0542-88f3779b6478	03	Mala koprodukcija	t	0.40	1.00
002b0000-5637-258c-349a-8cdc352170ed	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5637-258c-9a6f-f7368d0d24ba	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3116 (class 0 OID 24472554)
-- Dependencies: 206
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5637-258c-6e1d-0475784c60b7	0001	prva vaja	prva vaja
00420000-5637-258c-55c8-5c796286bb5a	0002	tehnična vaja	tehnična vaja
00420000-5637-258c-92e5-53a10af1499b	0003	lučna vaja	lučna vaja
00420000-5637-258c-a09c-11dd6f077eef	0004	kostumska vaja	kostumska vaja
00420000-5637-258c-1f4e-c6fd433175c6	0005	foto vaja	foto vaja
00420000-5637-258c-23c5-890834e0c4f3	0006	1. glavna vaja	1. glavna vaja
00420000-5637-258c-01d4-2baf635befd2	0007	2. glavna vaja	2. glavna vaja
00420000-5637-258c-bfeb-39fceff3ab9b	0008	1. generalka	1. generalka
00420000-5637-258c-04d7-b6b740954eac	0009	2. generalka	2. generalka
00420000-5637-258c-a570-4e59003d905b	0010	odprta generalka	odprta generalka
00420000-5637-258c-2361-c791d4345868	0011	obnovitvena vaja	obnovitvena vaja
00420000-5637-258c-a17c-673a873a5d24	0012	pevska vaja	pevska vaja
00420000-5637-258c-663f-d49ea4f93fb8	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5637-258c-6f5f-a54433d4ca5c	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3103 (class 0 OID 24472401)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 24472215)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5637-258d-d860-6011d7245e5f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROIenCxFjxdge7X4WbTBY.cGVnlyQq6ku	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5637-258e-1ffe-81bd5952124d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5637-258e-336c-f90aa06514c5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5637-258e-5bff-243b7997c9fb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5637-258e-420d-f7a32902e0ad	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5637-258e-b2d1-2d2906019000	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5637-258e-9152-ea2e6ee008d5	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5637-258e-e305-33268a7d12c0	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5637-258e-5c24-0e885203e0f4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5637-258e-f8a4-de0666b95a84	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5637-258e-8659-48af139b9572	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5637-258d-8c5c-167938b1ee65	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 24472836)
-- Dependencies: 234
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5637-258e-dbd1-a7b907fa8a12	00160000-5637-258e-11eb-f4a3ea021377	\N	00140000-5637-258c-5cf5-daf6e40fecba	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5637-258e-159c-fdcf675545bd
000e0000-5637-258e-b535-6f3e01020ab0	00160000-5637-258e-33e6-58846a97e047	\N	00140000-5637-258c-bc27-686f64eda4c4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5637-258e-c381-af3e70e403d0
000e0000-5637-258e-9596-86d6866e65d0	\N	\N	00140000-5637-258c-bc27-686f64eda4c4	00190000-5637-258e-f0ec-57f7ef04d542	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5637-258e-159c-fdcf675545bd
000e0000-5637-258e-062c-7f95ff096dbb	\N	\N	00140000-5637-258c-bc27-686f64eda4c4	00190000-5637-258e-f0ec-57f7ef04d542	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5637-258e-159c-fdcf675545bd
000e0000-5637-258e-2dab-5f68d126226d	\N	\N	00140000-5637-258c-bc27-686f64eda4c4	00190000-5637-258e-f0ec-57f7ef04d542	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5637-258e-8542-064217804126
000e0000-5637-258e-595a-37a09ade1a92	\N	\N	00140000-5637-258c-bc27-686f64eda4c4	00190000-5637-258e-f0ec-57f7ef04d542	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5637-258e-8542-064217804126
\.


--
-- TOC entry 3111 (class 0 OID 24472500)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5637-258f-e115-ce11eadbad6d	\N	000e0000-5637-258e-b535-6f3e01020ab0	1	
00200000-5637-258f-6480-6399ecdb628e	\N	000e0000-5637-258e-b535-6f3e01020ab0	2	
00200000-5637-258f-dc46-9346eba0f015	\N	000e0000-5637-258e-b535-6f3e01020ab0	3	
00200000-5637-258f-41e8-e5edf1c656c9	\N	000e0000-5637-258e-b535-6f3e01020ab0	4	
00200000-5637-258f-e379-644ceeb23392	\N	000e0000-5637-258e-b535-6f3e01020ab0	5	
\.


--
-- TOC entry 3127 (class 0 OID 24472645)
-- Dependencies: 217
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 24472759)
-- Dependencies: 228
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5637-258c-897e-225324ca4058	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5637-258c-5761-d743d2a228d0	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5637-258c-6cca-b14dbb366f84	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5637-258c-ea96-849cad036dcc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5637-258c-8f72-cd7b29cdf81e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5637-258c-f650-970bf98b7be0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5637-258c-0b00-ae3a7471fbac	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5637-258c-5dae-4afb08ddf52a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5637-258c-4f22-e0731127c910	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5637-258c-180f-ccdadf6ef4f7	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5637-258c-1ba8-aacf59d1e204	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5637-258c-5c81-39952a5d74de	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5637-258c-2924-3f6bf3698fd9	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5637-258c-7c74-717926e52375	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5637-258c-4786-38de17eb061b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5637-258c-bf4c-4013fe249019	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5637-258c-c97f-eb80a038998a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5637-258c-b99a-0893b635fe64	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5637-258c-bbad-f2f849d0b73f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5637-258c-6ec9-d3e8b37d6447	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5637-258c-249d-6a17660abbd1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5637-258c-eb72-8be4d45ed2a3	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5637-258c-8b8b-7071df5dd9fe	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5637-258c-ac2b-344e301604f8	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5637-258c-a0d2-bf57e8f40f66	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5637-258c-bbc1-dfa2f2733ba8	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5637-258c-9a21-bae54e7ead80	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5637-258c-2de3-5e6934930bbc	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3156 (class 0 OID 24473126)
-- Dependencies: 246
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 24473098)
-- Dependencies: 245
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 24473138)
-- Dependencies: 247
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 24472717)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5637-258e-e829-ea67a4aece26	00090000-5637-258e-a0fa-d9f6b12d0ba9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-258e-8b74-4ee5ea09d9dc	00090000-5637-258e-55a6-ba61a01b45d5	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-258e-1d51-37f7f10a1514	00090000-5637-258e-3d64-b4d5c53d684a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-258e-6b47-cd7aa8900fd6	00090000-5637-258e-4220-5779164d10cf	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-258e-b192-9f8ad60f67d4	00090000-5637-258e-0943-32335453a0d0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-258e-5e49-dc233055428d	00090000-5637-258e-33d2-c94bfbee297c	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3114 (class 0 OID 24472543)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 24472826)
-- Dependencies: 233
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5637-258c-5cf5-daf6e40fecba	01	Drama	drama (SURS 01)
00140000-5637-258c-0b7f-fef53de96be5	02	Opera	opera (SURS 02)
00140000-5637-258c-a4b6-8fa2200fe6b8	03	Balet	balet (SURS 03)
00140000-5637-258c-2ec5-a7ea2eeccb01	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5637-258c-d373-4cec8576ede9	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5637-258c-bc27-686f64eda4c4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5637-258c-5613-5b925f9631f8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3133 (class 0 OID 24472707)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2580 (class 2606 OID 24472278)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 24472885)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 24472875)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 24472269)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 24472742)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 24472784)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 24473178)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 24472532)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 24472553)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 24473096)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 24472427)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 24472953)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 24472703)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 24472498)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 24472465)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 24472441)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 24472610)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 24473155)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 24473162)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2858 (class 2606 OID 24473186)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 24099029)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2715 (class 2606 OID 24472637)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 24472399)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 24472297)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 24472361)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 24472324)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 24472258)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2569 (class 2606 OID 24472243)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 24472643)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 24472679)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 24472821)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 24472352)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 24472387)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 24473048)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 24472616)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 24472377)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 24472517)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 24472486)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2647 (class 2606 OID 24472478)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 24472628)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 24473057)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 24473065)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24473035)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 24473077)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 24472661)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 24472601)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 24472592)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 24472808)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24472735)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 24472453)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 24472214)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 24472670)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 24472232)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2571 (class 2606 OID 24472252)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24472688)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 24472623)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 24472572)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 24472202)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 24472190)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 24472184)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 24472755)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 24472333)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 24472583)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 24472795)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 24472286)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 24473089)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 24472561)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 24472412)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 24472227)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 24472854)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 24472507)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 24472651)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 24472767)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 24473136)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 24473120)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 24473144)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 24472725)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 24472547)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 24472834)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 24472715)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 1259 OID 24472541)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2664 (class 1259 OID 24472542)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2665 (class 1259 OID 24472540)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2666 (class 1259 OID 24472539)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2667 (class 1259 OID 24472538)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2758 (class 1259 OID 24472756)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2759 (class 1259 OID 24472757)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 24472758)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2844 (class 1259 OID 24473157)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2845 (class 1259 OID 24473156)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2598 (class 1259 OID 24472354)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2599 (class 1259 OID 24472355)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2716 (class 1259 OID 24472644)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2831 (class 1259 OID 24473124)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2832 (class 1259 OID 24473123)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2833 (class 1259 OID 24473125)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2834 (class 1259 OID 24473122)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2835 (class 1259 OID 24473121)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2710 (class 1259 OID 24472630)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 24472629)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2655 (class 1259 OID 24472508)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2656 (class 1259 OID 24472509)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2740 (class 1259 OID 24472704)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 24472706)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2742 (class 1259 OID 24472705)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2630 (class 1259 OID 24472443)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 24472442)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2822 (class 1259 OID 24473078)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2774 (class 1259 OID 24472823)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2775 (class 1259 OID 24472824)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2776 (class 1259 OID 24472825)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2841 (class 1259 OID 24473145)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2783 (class 1259 OID 24472859)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2784 (class 1259 OID 24472856)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2785 (class 1259 OID 24472860)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2786 (class 1259 OID 24472858)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2787 (class 1259 OID 24472857)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2620 (class 1259 OID 24472414)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 24472413)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 24472327)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2728 (class 1259 OID 24472671)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2573 (class 1259 OID 24472259)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2574 (class 1259 OID 24472260)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2733 (class 1259 OID 24472691)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2734 (class 1259 OID 24472690)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2735 (class 1259 OID 24472689)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 24472364)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2604 (class 1259 OID 24472363)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2605 (class 1259 OID 24472365)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2643 (class 1259 OID 24472481)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2644 (class 1259 OID 24472479)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 24472480)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2553 (class 1259 OID 24472192)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2690 (class 1259 OID 24472596)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2691 (class 1259 OID 24472594)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2692 (class 1259 OID 24472593)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2693 (class 1259 OID 24472595)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2564 (class 1259 OID 24472233)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 24472234)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2719 (class 1259 OID 24472652)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2854 (class 1259 OID 24473179)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2756 (class 1259 OID 24472744)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 24472743)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2855 (class 1259 OID 24473187)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 24473188)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2705 (class 1259 OID 24472617)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2750 (class 1259 OID 24472736)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2751 (class 1259 OID 24472737)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 24472958)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2805 (class 1259 OID 24472957)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2806 (class 1259 OID 24472954)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 24472955)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2808 (class 1259 OID 24472956)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2609 (class 1259 OID 24472379)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 24472378)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2611 (class 1259 OID 24472380)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2722 (class 1259 OID 24472665)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2723 (class 1259 OID 24472664)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 24473058)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2815 (class 1259 OID 24473059)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2797 (class 1259 OID 24472889)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 24472890)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2799 (class 1259 OID 24472887)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2800 (class 1259 OID 24472888)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2746 (class 1259 OID 24472726)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 24472727)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2696 (class 1259 OID 24472605)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2697 (class 1259 OID 24472604)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 24472602)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2699 (class 1259 OID 24472603)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2793 (class 1259 OID 24472877)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 24472876)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2634 (class 1259 OID 24472454)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2637 (class 1259 OID 24472468)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2638 (class 1259 OID 24472467)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2639 (class 1259 OID 24472466)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2640 (class 1259 OID 24472469)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2654 (class 1259 OID 24472499)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2648 (class 1259 OID 24472487)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2649 (class 1259 OID 24472488)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2811 (class 1259 OID 24473049)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2830 (class 1259 OID 24473097)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2848 (class 1259 OID 24473163)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2849 (class 1259 OID 24473164)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2585 (class 1259 OID 24472299)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 24472298)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2594 (class 1259 OID 24472334)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 24472335)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 24472548)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2685 (class 1259 OID 24472586)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2686 (class 1259 OID 24472585)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2687 (class 1259 OID 24472584)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2668 (class 1259 OID 24472534)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2669 (class 1259 OID 24472535)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2670 (class 1259 OID 24472533)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2671 (class 1259 OID 24472537)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2672 (class 1259 OID 24472536)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2602 (class 1259 OID 24472353)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 24472287)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 24472288)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2626 (class 1259 OID 24472428)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 24472430)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2628 (class 1259 OID 24472429)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2629 (class 1259 OID 24472431)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2704 (class 1259 OID 24472611)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 24472822)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2788 (class 1259 OID 24472855)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 24472796)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 24472797)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2592 (class 1259 OID 24472325)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 24472326)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2743 (class 1259 OID 24472716)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 24472203)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 24472400)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2608 (class 1259 OID 24472362)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 24472191)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2827 (class 1259 OID 24473090)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 24472663)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2727 (class 1259 OID 24472662)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 24472562)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 24472563)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2801 (class 1259 OID 24472886)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 24472388)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 24472835)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2838 (class 1259 OID 24473137)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2820 (class 1259 OID 24473066)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 24473067)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2767 (class 1259 OID 24472785)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2684 (class 1259 OID 24472573)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 24472253)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2897 (class 2606 OID 24473359)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2896 (class 2606 OID 24473364)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2892 (class 2606 OID 24473384)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2898 (class 2606 OID 24473354)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2894 (class 2606 OID 24473374)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2893 (class 2606 OID 24473379)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2895 (class 2606 OID 24473369)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2934 (class 2606 OID 24473554)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2933 (class 2606 OID 24473559)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 24473564)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 24473729)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2967 (class 2606 OID 24473724)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 24473244)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2870 (class 2606 OID 24473249)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2915 (class 2606 OID 24473469)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2961 (class 2606 OID 24473709)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2962 (class 2606 OID 24473704)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2960 (class 2606 OID 24473714)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2963 (class 2606 OID 24473699)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2964 (class 2606 OID 24473694)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2913 (class 2606 OID 24473464)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2914 (class 2606 OID 24473459)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2891 (class 2606 OID 24473344)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2890 (class 2606 OID 24473349)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2925 (class 2606 OID 24473509)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 24473519)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2924 (class 2606 OID 24473514)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2880 (class 2606 OID 24473299)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 24473294)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 24473449)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 24473684)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 24473569)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2936 (class 2606 OID 24473574)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2935 (class 2606 OID 24473579)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2965 (class 2606 OID 24473719)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2939 (class 2606 OID 24473599)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2942 (class 2606 OID 24473584)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2938 (class 2606 OID 24473604)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2940 (class 2606 OID 24473594)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2941 (class 2606 OID 24473589)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2878 (class 2606 OID 24473289)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 24473284)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2866 (class 2606 OID 24473229)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2867 (class 2606 OID 24473224)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2919 (class 2606 OID 24473489)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2863 (class 2606 OID 24473204)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2862 (class 2606 OID 24473209)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 24473504)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2921 (class 2606 OID 24473499)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2922 (class 2606 OID 24473494)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2873 (class 2606 OID 24473259)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2874 (class 2606 OID 24473254)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2872 (class 2606 OID 24473264)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 24473324)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 24473314)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 24473319)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2859 (class 2606 OID 24473189)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2903 (class 2606 OID 24473424)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2905 (class 2606 OID 24473414)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2906 (class 2606 OID 24473409)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2904 (class 2606 OID 24473419)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2861 (class 2606 OID 24473194)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 24473199)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2916 (class 2606 OID 24473474)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2970 (class 2606 OID 24473744)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 24473549)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 24473544)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2972 (class 2606 OID 24473749)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 24473754)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2912 (class 2606 OID 24473454)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2929 (class 2606 OID 24473534)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2928 (class 2606 OID 24473539)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2949 (class 2606 OID 24473659)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 24473654)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2953 (class 2606 OID 24473639)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 24473644)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2951 (class 2606 OID 24473649)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2876 (class 2606 OID 24473274)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2877 (class 2606 OID 24473269)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2875 (class 2606 OID 24473279)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2917 (class 2606 OID 24473484)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 24473479)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2956 (class 2606 OID 24473669)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2955 (class 2606 OID 24473674)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2946 (class 2606 OID 24473629)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 24473634)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2948 (class 2606 OID 24473619)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2947 (class 2606 OID 24473624)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 24473524)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 24473529)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2907 (class 2606 OID 24473444)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2908 (class 2606 OID 24473439)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2910 (class 2606 OID 24473429)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2909 (class 2606 OID 24473434)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2943 (class 2606 OID 24473614)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 24473609)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 24473304)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2883 (class 2606 OID 24473309)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 24473339)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2888 (class 2606 OID 24473329)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 24473334)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2954 (class 2606 OID 24473664)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2957 (class 2606 OID 24473679)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2959 (class 2606 OID 24473689)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 24473734)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 24473739)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2864 (class 2606 OID 24473219)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 24473214)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2869 (class 2606 OID 24473234)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 24473239)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 24473389)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 24473404)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 24473399)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2902 (class 2606 OID 24473394)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-02 09:57:54 CET

--
-- PostgreSQL database dump complete
--

