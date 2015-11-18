--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-18 15:24:40 CET

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
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 28319713)
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
-- TOC entry 237 (class 1259 OID 28320327)
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
-- TOC entry 236 (class 1259 OID 28320310)
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
-- TOC entry 182 (class 1259 OID 28319706)
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
-- TOC entry 181 (class 1259 OID 28319704)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 28320187)
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
-- TOC entry 230 (class 1259 OID 28320217)
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
-- TOC entry 251 (class 1259 OID 28320618)
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
-- TOC entry 203 (class 1259 OID 28319961)
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
-- TOC entry 205 (class 1259 OID 28319993)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 28319998)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 28320540)
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
-- TOC entry 194 (class 1259 OID 28319858)
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
-- TOC entry 238 (class 1259 OID 28320340)
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
-- TOC entry 223 (class 1259 OID 28320141)
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
-- TOC entry 200 (class 1259 OID 28319932)
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
-- TOC entry 197 (class 1259 OID 28319898)
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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 28319875)
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
-- TOC entry 212 (class 1259 OID 28320055)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 28320598)
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
-- TOC entry 250 (class 1259 OID 28320611)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 28320633)
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
-- TOC entry 216 (class 1259 OID 28320080)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 28319832)
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
-- TOC entry 185 (class 1259 OID 28319732)
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
-- TOC entry 189 (class 1259 OID 28319799)
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
-- TOC entry 186 (class 1259 OID 28319743)
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
-- TOC entry 178 (class 1259 OID 28319678)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 28319697)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 28320087)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 28320121)
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
-- TOC entry 233 (class 1259 OID 28320258)
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
-- TOC entry 188 (class 1259 OID 28319779)
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
-- TOC entry 191 (class 1259 OID 28319824)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 28320485)
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
-- TOC entry 213 (class 1259 OID 28320061)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 28319809)
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
-- TOC entry 202 (class 1259 OID 28319953)
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
-- TOC entry 198 (class 1259 OID 28319913)
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
-- TOC entry 199 (class 1259 OID 28319925)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 28320073)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 28320499)
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
-- TOC entry 242 (class 1259 OID 28320509)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 28320408)
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
-- TOC entry 243 (class 1259 OID 28320517)
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
-- TOC entry 219 (class 1259 OID 28320102)
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
-- TOC entry 211 (class 1259 OID 28320046)
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
-- TOC entry 210 (class 1259 OID 28320036)
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
-- TOC entry 232 (class 1259 OID 28320247)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 28320177)
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
-- TOC entry 196 (class 1259 OID 28319887)
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
-- TOC entry 175 (class 1259 OID 28319649)
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
-- TOC entry 174 (class 1259 OID 28319647)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 28320115)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 28319687)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 28319671)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 28320129)
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
-- TOC entry 214 (class 1259 OID 28320067)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 28320013)
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
-- TOC entry 173 (class 1259 OID 28319636)
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
-- TOC entry 172 (class 1259 OID 28319628)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 28319623)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 28320194)
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
-- TOC entry 187 (class 1259 OID 28319771)
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
-- TOC entry 209 (class 1259 OID 28320023)
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
-- TOC entry 231 (class 1259 OID 28320235)
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
-- TOC entry 184 (class 1259 OID 28319722)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 28320528)
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
-- TOC entry 207 (class 1259 OID 28320003)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 28319844)
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
-- TOC entry 176 (class 1259 OID 28319658)
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
-- TOC entry 235 (class 1259 OID 28320285)
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
-- TOC entry 201 (class 1259 OID 28319943)
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
-- TOC entry 218 (class 1259 OID 28320094)
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
-- TOC entry 229 (class 1259 OID 28320208)
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
-- TOC entry 247 (class 1259 OID 28320578)
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
-- TOC entry 246 (class 1259 OID 28320547)
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
-- TOC entry 248 (class 1259 OID 28320590)
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
-- TOC entry 225 (class 1259 OID 28320166)
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
-- TOC entry 204 (class 1259 OID 28319987)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 28320275)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 28320156)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 28319709)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 28319652)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 28319713)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564c-8a25-0045-cd970d8cfc41	10	30	Otroci	Abonma za otroke	200
000a0000-564c-8a25-a445-1cc7b4a15171	20	60	Mladina	Abonma za mladino	400
000a0000-564c-8a25-59a3-4a3b3fdac535	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 28320327)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564c-8a25-fcfb-f09c86ad9dc1	000d0000-564c-8a25-537f-b59d1f06033b	\N	00090000-564c-8a25-de33-63526d5d4bf5	000b0000-564c-8a25-cedb-b9d09d869870	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564c-8a25-f868-52d28df62a39	000d0000-564c-8a25-063d-db4af6433cd7	00100000-564c-8a25-6509-6ba0a20f2693	00090000-564c-8a25-7242-1037aeb6d763	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564c-8a25-b1b3-da3fdfdcceef	000d0000-564c-8a25-3d3d-45a449dbdda3	00100000-564c-8a25-5c69-4e370a1a0e3e	00090000-564c-8a25-58a4-bca99d773516	\N	0003	t	\N	2015-11-18	\N	2	t	\N	f	f
000c0000-564c-8a25-d5e1-bd633b32499b	000d0000-564c-8a25-ce36-a3d34882b75b	\N	00090000-564c-8a25-e31d-77b5f2ca7d64	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564c-8a25-28cc-06a5e0a68b9e	000d0000-564c-8a25-1469-cce035ad5c0a	\N	00090000-564c-8a25-0652-0866d78798f0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564c-8a25-1a1d-fb47b753e71d	000d0000-564c-8a25-0388-63bea21e0f1d	\N	00090000-564c-8a25-e461-93000ebdaa43	000b0000-564c-8a25-4420-08bf50da9b3d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564c-8a25-59d9-0df4794c5b89	000d0000-564c-8a25-4d50-7e71f451da49	00100000-564c-8a25-b1f3-0ca9ab180af8	00090000-564c-8a25-4779-5540e6ca23dc	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564c-8a25-b271-fe0d6d7907e2	000d0000-564c-8a25-61f2-006304320a6e	\N	00090000-564c-8a25-9406-9fcdb2c9ac5b	000b0000-564c-8a25-3c62-92dcbb1c3433	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564c-8a25-482c-010d0721dbf9	000d0000-564c-8a25-4d50-7e71f451da49	00100000-564c-8a25-f64d-08e0d2682a2b	00090000-564c-8a25-d8fe-dd3092e1c407	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564c-8a25-ab79-07c353582b5c	000d0000-564c-8a25-4d50-7e71f451da49	00100000-564c-8a25-3b90-bf13760f8041	00090000-564c-8a25-5e03-fe8a7f6ba1f9	\N	0010	t	\N	2015-11-18	\N	16	f	\N	f	t
000c0000-564c-8a25-b5ba-7f8406258f16	000d0000-564c-8a25-4d50-7e71f451da49	00100000-564c-8a25-5190-9d2e9d2495d7	00090000-564c-8a25-2127-dc92a9ca18bb	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564c-8a25-9310-16a72c236503	000d0000-564c-8a25-a4fc-e5002820d310	00100000-564c-8a25-6509-6ba0a20f2693	00090000-564c-8a25-7242-1037aeb6d763	000b0000-564c-8a25-4608-21e10ce56286	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 28320310)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 28319706)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 28320187)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564c-8a25-f5e5-9ed8075647f0	00160000-564c-8a25-cc22-8cb7b1184da0	00090000-564c-8a25-ff70-f37ebf5e4b1c	aizv	10	t
003d0000-564c-8a25-0cac-32cc9bbd6c0e	00160000-564c-8a25-cc22-8cb7b1184da0	00090000-564c-8a25-2a18-a82a1af6e382	apri	14	t
003d0000-564c-8a25-db92-6eec8615aaf3	00160000-564c-8a25-8c6e-64f643996d25	00090000-564c-8a25-f120-b3dc5e789715	aizv	11	t
003d0000-564c-8a25-1992-d24162a9a02a	00160000-564c-8a25-feb7-902084ec11ed	00090000-564c-8a25-ccb8-7dc0e942e6b4	aizv	12	t
003d0000-564c-8a25-0897-ab63731dfbb7	00160000-564c-8a25-cc22-8cb7b1184da0	00090000-564c-8a25-e242-f81b1c2ce9b2	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 28320217)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564c-8a25-cc22-8cb7b1184da0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564c-8a25-8c6e-64f643996d25	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564c-8a25-feb7-902084ec11ed	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 28320618)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 28319961)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564c-8a25-24b0-3fe6a1f0e837	\N	\N	00200000-564c-8a25-1270-95f732771357	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564c-8a25-d650-d60f7eb8ebfc	\N	\N	00200000-564c-8a25-ccfd-6bf0bd76d598	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564c-8a25-6fad-23a6618cd8cb	\N	\N	00200000-564c-8a25-8a50-739671bb9c1f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564c-8a25-27e7-ffd4189fca04	\N	\N	00200000-564c-8a25-f04e-001b00e73d6b	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564c-8a25-05d7-71cf14864bdf	\N	\N	00200000-564c-8a25-102f-128c732b7faf	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 28319993)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 28319998)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 28320540)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 28319858)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564c-8a23-e352-89651c174ad8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564c-8a23-5afe-0b2c120f1f6b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564c-8a23-18cb-bf8b8cc8017a	AL	ALB	008	Albania 	Albanija	\N
00040000-564c-8a23-0f01-36d0007d0d06	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564c-8a23-8d7e-30a13e71d709	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564c-8a23-702e-f70c3f958e14	AD	AND	020	Andorra 	Andora	\N
00040000-564c-8a23-1877-2c9446a240c9	AO	AGO	024	Angola 	Angola	\N
00040000-564c-8a23-6aac-e4a7f08d581f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564c-8a23-10f2-56bbc2753dd5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564c-8a23-79aa-751a6dee9deb	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564c-8a23-8973-90e61d660f29	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564c-8a23-8220-0965b73f82b0	AM	ARM	051	Armenia 	Armenija	\N
00040000-564c-8a23-da77-b699acb29ef2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564c-8a23-afe8-26acdede98f2	AU	AUS	036	Australia 	Avstralija	\N
00040000-564c-8a23-772a-66a383b68299	AT	AUT	040	Austria 	Avstrija	\N
00040000-564c-8a23-e08f-ea13cda96db1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564c-8a23-7e3f-767a2dba388b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564c-8a23-3d4e-c5f3f2e4c662	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564c-8a23-4414-7d97bcc21853	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564c-8a23-ec33-695ce7309fef	BB	BRB	052	Barbados 	Barbados	\N
00040000-564c-8a23-960a-5a9ae328a9d9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564c-8a23-fc03-6139e4921607	BE	BEL	056	Belgium 	Belgija	\N
00040000-564c-8a23-d28f-8d3005356b1b	BZ	BLZ	084	Belize 	Belize	\N
00040000-564c-8a23-d345-a4726f1c2c0e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564c-8a23-4993-25d0eee24bac	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564c-8a23-8c9d-b0de1ef1c25b	BT	BTN	064	Bhutan 	Butan	\N
00040000-564c-8a23-4e74-5ddcaf85cf23	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564c-8a23-81cb-3b6a6c198a0c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564c-8a23-4186-e41383d8eb75	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564c-8a23-fe76-b981964fb5ef	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564c-8a23-4acc-4f7dd376d05f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564c-8a23-85c7-e2d1590045f1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564c-8a23-a7f0-001ead0d66aa	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564c-8a23-56c0-ecc870a54a31	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564c-8a23-af84-0e06f7e9b7a2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564c-8a23-de39-f4f2bc1a2367	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564c-8a23-7612-af1e6fd07591	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564c-8a23-9eb6-ba6595d40e67	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564c-8a23-9ad6-d6f06b750888	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564c-8a23-2974-3bbe4f3f20dc	CA	CAN	124	Canada 	Kanada	\N
00040000-564c-8a23-791c-9c040d0f699f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564c-8a23-cc17-788bd266f233	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564c-8a23-31b6-a02b88fbc64d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564c-8a23-a11c-5e9242e47d60	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564c-8a23-a38d-83dd88f89bbd	CL	CHL	152	Chile 	Čile	\N
00040000-564c-8a23-2e64-f087fbb6bde2	CN	CHN	156	China 	Kitajska	\N
00040000-564c-8a23-5203-283266d542e1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564c-8a23-14f0-30098ebfcd98	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564c-8a23-4ed1-641ab3b98fbb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564c-8a23-0984-87d5c0397866	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564c-8a23-ece0-999a54da30ed	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564c-8a23-42ba-006399dadec1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564c-8a23-823f-9fb325e69ec3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564c-8a23-45a2-1b00ad8400c1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564c-8a23-7533-65700b14b185	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564c-8a23-8e5f-19c948e324f8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564c-8a23-4c62-868fe7ad86a9	CU	CUB	192	Cuba 	Kuba	\N
00040000-564c-8a23-e786-6f48ca7877cc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564c-8a23-30be-e3d0ff1bd7b9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564c-8a23-69a0-38cd3f1f8543	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564c-8a23-c3b5-b5081963cd42	DK	DNK	208	Denmark 	Danska	\N
00040000-564c-8a23-ff42-4cc1a6ef5a61	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564c-8a23-7a07-fe63b2b7fa67	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564c-8a23-1443-9af07428992d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564c-8a23-42c6-68820eb9cae6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564c-8a23-970d-f99a5e0d45e1	EG	EGY	818	Egypt 	Egipt	\N
00040000-564c-8a23-c065-abc6d4408434	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564c-8a23-e54b-9c8da224422a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564c-8a23-2a3d-e0be262a1732	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564c-8a23-cbca-9d36d7de8441	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564c-8a23-0c8f-a11597347cc3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564c-8a23-fc99-7611a8c2b55f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564c-8a23-2593-9b1a63cf39ea	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564c-8a23-014b-349a00ba6dbc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564c-8a23-b306-83c0c9c44e5e	FI	FIN	246	Finland 	Finska	\N
00040000-564c-8a23-75f0-7bd9c988a5fe	FR	FRA	250	France 	Francija	\N
00040000-564c-8a23-d558-781ec641e8ae	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564c-8a23-1c07-a69f8a536dc7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564c-8a23-cc56-686f3946eb8d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564c-8a23-a189-c5083ac2916a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564c-8a23-9ea4-21b82fcd67bc	GA	GAB	266	Gabon 	Gabon	\N
00040000-564c-8a23-587e-693c63483b5c	GM	GMB	270	Gambia 	Gambija	\N
00040000-564c-8a23-3e64-839fd54e50a6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564c-8a23-49c2-1a23df37e424	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564c-8a23-49de-476a30e6e93c	GH	GHA	288	Ghana 	Gana	\N
00040000-564c-8a23-3f97-a7fc19f17d89	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564c-8a23-3c69-157ad737bd07	GR	GRC	300	Greece 	Grčija	\N
00040000-564c-8a23-af35-e0d04fe4fac3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564c-8a23-4a27-aaa2c6630b0e	GD	GRD	308	Grenada 	Grenada	\N
00040000-564c-8a23-eea4-626ed85c333c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564c-8a23-c751-319d0963a09c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564c-8a23-e2d0-d7cb272d9190	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564c-8a23-0a3d-b5ec2d67a046	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564c-8a23-b397-47b96252e2a2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564c-8a23-f853-d3f97e252584	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564c-8a23-a2bf-e17a55fad69b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564c-8a23-e00e-e33ab408059d	HT	HTI	332	Haiti 	Haiti	\N
00040000-564c-8a23-fb39-37a195caf506	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564c-8a23-4049-252a0857f296	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564c-8a23-d679-ab9a78a2b1e2	HN	HND	340	Honduras 	Honduras	\N
00040000-564c-8a23-0a92-697d5aafac35	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564c-8a23-c5ce-4120be34028d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564c-8a23-bc1e-845b62588703	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564c-8a23-1472-50d218f313d8	IN	IND	356	India 	Indija	\N
00040000-564c-8a23-3da0-93f964e200e0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564c-8a23-a5f5-42107f992068	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564c-8a23-5d83-f56539dd594a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564c-8a23-88e0-79a75b6f8b23	IE	IRL	372	Ireland 	Irska	\N
00040000-564c-8a23-fadc-72de1ad69622	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564c-8a23-bf31-98702a1a4b35	IL	ISR	376	Israel 	Izrael	\N
00040000-564c-8a23-6530-cd9f6d94730c	IT	ITA	380	Italy 	Italija	\N
00040000-564c-8a23-2a1c-7eee1da62e7b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564c-8a23-45f1-2d4fe1487fdf	JP	JPN	392	Japan 	Japonska	\N
00040000-564c-8a23-aba5-fc645803bb42	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564c-8a23-f3c0-cd76fa552e08	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564c-8a23-a4c4-adae25fa723c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564c-8a23-d618-cd5cc84f2ba5	KE	KEN	404	Kenya 	Kenija	\N
00040000-564c-8a23-9eeb-0bbef35e94e8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564c-8a23-a70e-c3307f406895	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564c-8a23-5589-20e2d73bea33	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564c-8a23-c132-bddb02fc7738	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564c-8a23-53c6-0e835c17322a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564c-8a23-e1ba-9f60026971d2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564c-8a23-2893-9387ee1f33ba	LV	LVA	428	Latvia 	Latvija	\N
00040000-564c-8a23-3e84-815abc1db17b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564c-8a23-b777-dbd9fcdf19ed	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564c-8a23-7760-5b80e6477009	LR	LBR	430	Liberia 	Liberija	\N
00040000-564c-8a23-0c98-9d99387ac89d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564c-8a23-842f-c55031f25b9b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564c-8a23-89fa-af135871d85b	LT	LTU	440	Lithuania 	Litva	\N
00040000-564c-8a23-9caf-2b7f2457f48d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564c-8a23-a602-a3b9f4ce5e50	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564c-8a23-5cda-6674f4a4729c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564c-8a23-a967-7ad71e3e0819	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564c-8a23-b60c-eae87e5c3236	MW	MWI	454	Malawi 	Malavi	\N
00040000-564c-8a23-a165-a31505477095	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564c-8a23-b348-128ec1e9e340	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564c-8a23-ddea-d9b17c92ca99	ML	MLI	466	Mali 	Mali	\N
00040000-564c-8a23-850d-33f5315daa7f	MT	MLT	470	Malta 	Malta	\N
00040000-564c-8a23-5772-adf4eed52406	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564c-8a23-1a40-b66530151313	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564c-8a23-0136-7e85add5d653	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564c-8a23-591f-32780dabfe2c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564c-8a23-6030-16922e3530f8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564c-8a23-7003-dbcbd0e793f2	MX	MEX	484	Mexico 	Mehika	\N
00040000-564c-8a23-6a53-0698de287fb0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564c-8a23-5e35-86097d26f80f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564c-8a23-7fee-3ade9f6e9c40	MC	MCO	492	Monaco 	Monako	\N
00040000-564c-8a23-ba29-10bbc1fbce49	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564c-8a23-8d86-bbe41d34f2bd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564c-8a23-d337-a9030fd97841	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564c-8a23-a4c7-536ed506321d	MA	MAR	504	Morocco 	Maroko	\N
00040000-564c-8a23-801e-2f5e55becc2c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564c-8a23-bfd2-5037047ea6a7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564c-8a23-b488-4451a8d9ccb0	NA	NAM	516	Namibia 	Namibija	\N
00040000-564c-8a23-bf71-6026a917e3f3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564c-8a23-d80e-d82773168bf4	NP	NPL	524	Nepal 	Nepal	\N
00040000-564c-8a23-7f7e-e0da20539636	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564c-8a23-6219-f5bd323929f7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564c-8a23-8aae-6c279d04afe3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564c-8a23-f4c2-4eee876dbd63	NE	NER	562	Niger 	Niger 	\N
00040000-564c-8a23-3640-51525b0e5a42	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564c-8a23-81ed-eb98d47b9400	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564c-8a23-2600-0dc2edd918e1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564c-8a23-dfd9-b7203a3965f6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564c-8a23-54e4-e101acfd2b02	NO	NOR	578	Norway 	Norveška	\N
00040000-564c-8a23-9b7c-09d901aee6c4	OM	OMN	512	Oman 	Oman	\N
00040000-564c-8a23-d76d-e7be8921ba5a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564c-8a23-9cdb-b4ffe4e78d2a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564c-8a23-900b-6380d47dd767	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564c-8a23-ed3f-90440e1e0caf	PA	PAN	591	Panama 	Panama	\N
00040000-564c-8a23-e184-7f67da8a4305	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564c-8a23-a3c0-de7c8416cb46	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564c-8a23-9164-bd9a030b889a	PE	PER	604	Peru 	Peru	\N
00040000-564c-8a23-9968-cc0d31a3a3d0	PH	PHL	608	Philippines 	Filipini	\N
00040000-564c-8a23-84cd-d7af108c21ca	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564c-8a23-7b79-3b07c83a4c5e	PL	POL	616	Poland 	Poljska	\N
00040000-564c-8a23-e8eb-01e50e9c5c7a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564c-8a23-a7b4-e9d23712033e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564c-8a23-de1d-470b6e28bd77	QA	QAT	634	Qatar 	Katar	\N
00040000-564c-8a23-8703-5fe63d91af9e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564c-8a23-9145-a2b31b7e10b8	RO	ROU	642	Romania 	Romunija	\N
00040000-564c-8a23-9ccd-9ff8633621a7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564c-8a23-9efa-d830056918f7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564c-8a23-2a11-2305ed4da93e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564c-8a23-6503-19d93a3249d0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564c-8a23-8a8c-afa18198e86e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564c-8a23-7cad-af0af4029911	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564c-8a23-680c-18ddd6fd75ba	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564c-8a23-5bd3-bc50850f55b9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564c-8a23-d2e0-b397aae2421a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564c-8a23-d035-e81c18aa2b5c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564c-8a23-2c40-9e24f2f6d545	SM	SMR	674	San Marino 	San Marino	\N
00040000-564c-8a23-cdaf-232039994c7f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564c-8a23-f27f-b349eeed0888	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564c-8a23-4943-08e62316cc53	SN	SEN	686	Senegal 	Senegal	\N
00040000-564c-8a23-266a-44c78334159b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564c-8a23-8183-d508c2cbbfc2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564c-8a23-2aef-0e4cd50de93a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564c-8a23-a3b6-fc23089e50d4	SG	SGP	702	Singapore 	Singapur	\N
00040000-564c-8a23-7828-5339dfd4eb94	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564c-8a23-3eaf-c98145c32a31	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564c-8a23-68dc-178fc90f894b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564c-8a23-4c52-85cba66d4c9d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564c-8a23-26e0-b6245356aefa	SO	SOM	706	Somalia 	Somalija	\N
00040000-564c-8a23-366b-db194055814f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564c-8a23-8a7d-f6e55cfcd26f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564c-8a23-1c32-4db24fbbd706	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564c-8a23-1116-be04dd706ada	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564c-8a23-5494-a70036aa1236	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564c-8a23-f695-28bb8445f31e	SD	SDN	729	Sudan 	Sudan	\N
00040000-564c-8a23-5337-680ea7b33ff9	SR	SUR	740	Suriname 	Surinam	\N
00040000-564c-8a23-1e00-2ba73b935688	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564c-8a23-2159-eaf32d459d8c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564c-8a23-f3a0-8a739b2ed8d7	SE	SWE	752	Sweden 	Švedska	\N
00040000-564c-8a23-7741-2166bbb567fa	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564c-8a23-54e5-0c118a36f145	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564c-8a23-d5ac-703f74a21372	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564c-8a23-1693-86f402d3c990	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564c-8a23-4c0b-d3a2a5dd8340	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564c-8a23-fb03-7c8a7c77c307	TH	THA	764	Thailand 	Tajska	\N
00040000-564c-8a23-e7d4-f0af4c1682b8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564c-8a23-5f18-23eb861756c2	TG	TGO	768	Togo 	Togo	\N
00040000-564c-8a23-72b8-5ae4ebe4d2bb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564c-8a23-5acb-5d5b7e2f0556	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564c-8a23-9d2d-e13d39aec124	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564c-8a23-d2d9-f97a8933fd1d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564c-8a23-1bbe-f7070ee4ca9b	TR	TUR	792	Turkey 	Turčija	\N
00040000-564c-8a23-3794-e77c028fe369	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564c-8a23-c8b1-afff1bbecda9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564c-8a23-ad2a-4ee2165c46fe	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564c-8a23-b80d-cb22f5e6dfb4	UG	UGA	800	Uganda 	Uganda	\N
00040000-564c-8a23-5aff-84483608be08	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564c-8a23-8acf-6dead96e109c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564c-8a23-8c8f-e993c5533645	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564c-8a23-10b3-2a6fae9f6a63	US	USA	840	United States 	Združene države Amerike	\N
00040000-564c-8a23-dbf6-212f7b0352a3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564c-8a23-c945-8b1f43f5e4ae	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564c-8a23-ba78-3c1a146df417	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564c-8a23-ebe7-b08d9536cc75	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564c-8a23-adaf-f6c63acfb670	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564c-8a23-09d1-b6233d028c54	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564c-8a23-de3d-46f22bad0b68	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564c-8a23-12bb-8f2a7b77ee69	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564c-8a23-e501-5fbc2a7a5d08	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564c-8a23-0244-daf1f41afa30	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564c-8a23-a208-58b526eb1d86	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564c-8a23-2092-df709b7c5bd1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564c-8a23-64fb-eec69330f9cd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 28320340)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564c-8a25-2b88-122cdd8f9225	000e0000-564c-8a25-6aa5-c5d10329f520	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-8a22-6bf7-a62ccfc9bb45	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564c-8a25-6e0c-57af71afe598	000e0000-564c-8a25-45e0-94709649b863	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-8a22-73d6-f73eccc1dbf7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564c-8a25-3034-a9a9c56d57e2	000e0000-564c-8a25-35ab-01f100dd45c1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-8a22-6bf7-a62ccfc9bb45	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564c-8a25-dbe6-564490d17979	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564c-8a25-ac5c-d22c63a4c13c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 28320141)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564c-8a25-4d50-7e71f451da49	000e0000-564c-8a25-45e0-94709649b863	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564c-8a22-0250-40c35c1d79fe
000d0000-564c-8a25-537f-b59d1f06033b	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-fcfb-f09c86ad9dc1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564c-8a22-0250-40c35c1d79fe
000d0000-564c-8a25-063d-db4af6433cd7	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-f868-52d28df62a39	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564c-8a22-002a-2a864fe95ce5
000d0000-564c-8a25-3d3d-45a449dbdda3	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-b1b3-da3fdfdcceef	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564c-8a22-51e1-992b4aa30bf9
000d0000-564c-8a25-ce36-a3d34882b75b	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-d5e1-bd633b32499b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564c-8a22-dfd4-30cfd3d9ce90
000d0000-564c-8a25-1469-cce035ad5c0a	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-28cc-06a5e0a68b9e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564c-8a22-dfd4-30cfd3d9ce90
000d0000-564c-8a25-0388-63bea21e0f1d	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-1a1d-fb47b753e71d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564c-8a22-0250-40c35c1d79fe
000d0000-564c-8a25-61f2-006304320a6e	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-b271-fe0d6d7907e2	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564c-8a22-562c-c42ff0fce7f6
000d0000-564c-8a25-a4fc-e5002820d310	000e0000-564c-8a25-45e0-94709649b863	000c0000-564c-8a25-9310-16a72c236503	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564c-8a22-79bd-4cab5eed3f1b
\.


--
-- TOC entry 3122 (class 0 OID 28319932)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 28319898)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 28319875)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564c-8a25-d1ee-31fa008001ba	00080000-564c-8a25-94f9-95796c3cf9c2	00090000-564c-8a25-5e03-fe8a7f6ba1f9	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 28320055)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 28320598)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564c-8a25-02b4-00cc9efd7971	00010000-564c-8a23-03a0-3ff018be06e2	\N	Prva mapa	Root mapa	2015-11-18 15:24:37	2015-11-18 15:24:37	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 28320611)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 28320633)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 25231831)
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
-- TOC entry 3138 (class 0 OID 28320080)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 28319832)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564c-8a23-8789-4deb7e2a8ba4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564c-8a23-2c29-2a0022e701bc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564c-8a23-bde4-d18cea9ce47a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564c-8a23-cc68-17fc0f703e5f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564c-8a23-57c4-8fb705015c33	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564c-8a23-d9d5-c8d4f1896d02	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564c-8a23-5ee0-767c44edf22e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564c-8a23-592b-35e8b9c47f00	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564c-8a23-ec59-f3523bf81cbe	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564c-8a23-6260-6505e43f5bf5	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564c-8a23-6474-c8fd1e6c9d78	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564c-8a23-bdb7-5b776124eaf5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564c-8a23-33e6-443cb7f242e4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564c-8a23-0b55-546e315058ea	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564c-8a25-531f-7a6eae7f2fae	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564c-8a25-325d-99c3c7da99e5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564c-8a25-fd25-17a59900a201	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564c-8a25-347f-c4ada22b69cf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564c-8a25-36ea-a160f770594c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564c-8a27-d2c4-649ccf08ad6e	application.tenant.maticnopodjetje	string	s:36:"00080000-564c-8a27-3f35-75d8ab5b2282";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 28319732)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564c-8a25-1ce2-32c6da4d5d59	00000000-564c-8a25-531f-7a6eae7f2fae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564c-8a25-0e12-7927fbf59907	00000000-564c-8a25-531f-7a6eae7f2fae	00010000-564c-8a23-03a0-3ff018be06e2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564c-8a25-1777-3f534692ae0b	00000000-564c-8a25-325d-99c3c7da99e5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 28319799)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564c-8a25-7a45-b9a83dc32e84	\N	00100000-564c-8a25-6509-6ba0a20f2693	00100000-564c-8a25-5c69-4e370a1a0e3e	01	Gledališče Nimbis
00410000-564c-8a25-a382-a9a4a716b1dc	00410000-564c-8a25-7a45-b9a83dc32e84	00100000-564c-8a25-6509-6ba0a20f2693	00100000-564c-8a25-5c69-4e370a1a0e3e	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 28319743)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564c-8a25-de33-63526d5d4bf5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564c-8a25-e31d-77b5f2ca7d64	00010000-564c-8a25-3cd9-3b5ac2c04aff	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564c-8a25-58a4-bca99d773516	00010000-564c-8a25-aeda-e82ea6b5ea1b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564c-8a25-d8fe-dd3092e1c407	00010000-564c-8a25-8b84-d48f09c296b8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564c-8a25-046d-3bd6f52fa320	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564c-8a25-e461-93000ebdaa43	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564c-8a25-2127-dc92a9ca18bb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564c-8a25-4779-5540e6ca23dc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564c-8a25-5e03-fe8a7f6ba1f9	00010000-564c-8a25-ab89-01e5a466ce50	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564c-8a25-7242-1037aeb6d763	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564c-8a25-0bba-38eb3165d3db	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564c-8a25-0652-0866d78798f0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564c-8a25-9406-9fcdb2c9ac5b	00010000-564c-8a25-d04d-666912c1bd74	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564c-8a25-ff70-f37ebf5e4b1c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-8a25-2a18-a82a1af6e382	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-8a25-f120-b3dc5e789715	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-8a25-ccb8-7dc0e942e6b4	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564c-8a25-e242-f81b1c2ce9b2	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564c-8a25-24b7-ffc7bd001152	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-8a25-ab25-1b04b238ccb7	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-8a25-a992-a88f0191cda0	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 28319678)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564c-8a23-2686-0dc9d5183e33	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564c-8a23-391c-47a50a84d696	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564c-8a23-d10b-a2754132bbc7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564c-8a23-a4dd-e82469c0fdc5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564c-8a23-39f0-d995d66eb45d	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564c-8a23-66ca-c670d48fede5	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564c-8a23-1447-b00fbc430089	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564c-8a23-ec68-3c3b807b9f7a	Abonma-read	Abonma - branje	t
00030000-564c-8a23-163e-50e555386646	Abonma-write	Abonma - spreminjanje	t
00030000-564c-8a23-5104-db9aaeb962fc	Alternacija-read	Alternacija - branje	t
00030000-564c-8a23-1f58-46b596db19d2	Alternacija-write	Alternacija - spreminjanje	t
00030000-564c-8a23-536d-6dee714824ab	Arhivalija-read	Arhivalija - branje	t
00030000-564c-8a23-1a51-d78d91064393	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564c-8a23-c354-e3193d48bed4	AuthStorage-read	AuthStorage - branje	t
00030000-564c-8a23-8eba-022ca3b1f01c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564c-8a23-1863-7e68b0236236	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564c-8a23-1807-b0170a81528c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564c-8a23-f091-4c08ac03ef47	Besedilo-read	Besedilo - branje	t
00030000-564c-8a23-7514-392b4e7bc464	Besedilo-write	Besedilo - spreminjanje	t
00030000-564c-8a23-8177-e9f9c0219849	Dogodek-read	Dogodek - branje	t
00030000-564c-8a23-e13a-3d8c7c190eee	Dogodek-write	Dogodek - spreminjanje	t
00030000-564c-8a23-8bc8-dd92848334fb	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564c-8a23-ee4a-f4981f44756e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564c-8a23-7126-b358f7e74295	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564c-8a23-2c82-51ac54ccb114	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564c-8a23-e972-9d443729f4cc	DogodekTrait-read	DogodekTrait - branje	t
00030000-564c-8a23-f49f-2ce318962c68	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564c-8a23-9caf-4f6866e399b3	DrugiVir-read	DrugiVir - branje	t
00030000-564c-8a23-2752-1be1aa7cddd4	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564c-8a23-6848-f3e497e6ee5a	Drzava-read	Drzava - branje	t
00030000-564c-8a23-cff0-902bd2ed0cb6	Drzava-write	Drzava - spreminjanje	t
00030000-564c-8a23-40c5-ffcb09237c15	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564c-8a23-d4c5-dab71c12e79d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564c-8a23-d4a0-08222871e6aa	Funkcija-read	Funkcija - branje	t
00030000-564c-8a23-dd31-c2a833be59a3	Funkcija-write	Funkcija - spreminjanje	t
00030000-564c-8a23-1a89-1302eb28236a	Gostovanje-read	Gostovanje - branje	t
00030000-564c-8a23-5d32-1b67902db400	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564c-8a23-1bef-77bb675f31dd	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564c-8a23-9fd8-32bd1ce9fd51	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564c-8a23-f8a6-9e187b265bb8	Kupec-read	Kupec - branje	t
00030000-564c-8a23-e95b-bdf668305952	Kupec-write	Kupec - spreminjanje	t
00030000-564c-8a23-70c3-999ad848357b	NacinPlacina-read	NacinPlacina - branje	t
00030000-564c-8a23-6cc7-6ef8f1792dea	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564c-8a23-ea1c-8f2fe749aeb0	Option-read	Option - branje	t
00030000-564c-8a23-37f4-7b94281b579d	Option-write	Option - spreminjanje	t
00030000-564c-8a23-999a-70e7d375efe2	OptionValue-read	OptionValue - branje	t
00030000-564c-8a23-a843-47fe3f7a2ade	OptionValue-write	OptionValue - spreminjanje	t
00030000-564c-8a23-5636-061fd50260dd	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564c-8a23-c3fe-6246817c9d3f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564c-8a23-9cce-40ae590f91c0	Oseba-read	Oseba - branje	t
00030000-564c-8a23-edfe-283ec87f80da	Oseba-write	Oseba - spreminjanje	t
00030000-564c-8a23-a72c-2804c8d6dc07	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564c-8a23-b5d6-446fb84b9971	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564c-8a23-0645-1df0b5545b3c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564c-8a23-4d2b-97f0c1f20723	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564c-8a23-3f28-31c30ca796e7	Pogodba-read	Pogodba - branje	t
00030000-564c-8a23-0e7d-5941b51bb9b8	Pogodba-write	Pogodba - spreminjanje	t
00030000-564c-8a23-ee28-2d1ccd02e50b	Popa-read	Popa - branje	t
00030000-564c-8a23-9f84-7c85fd10c5e1	Popa-write	Popa - spreminjanje	t
00030000-564c-8a23-195c-5910bcbd48f6	Posta-read	Posta - branje	t
00030000-564c-8a23-3612-2cf40667a338	Posta-write	Posta - spreminjanje	t
00030000-564c-8a23-0ff8-127968e5d642	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564c-8a23-cbd4-cc60c27c0e48	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564c-8a23-9957-fd7bbb233189	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564c-8a23-e807-4afae750cbe0	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564c-8a23-4233-cc8047c47f82	PostniNaslov-read	PostniNaslov - branje	t
00030000-564c-8a23-0faa-68418ec67578	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564c-8a23-2e5d-3f571daee853	Praznik-read	Praznik - branje	t
00030000-564c-8a23-b3d8-69e1968d9868	Praznik-write	Praznik - spreminjanje	t
00030000-564c-8a23-bd94-f583c5f70d5b	Predstava-read	Predstava - branje	t
00030000-564c-8a23-6337-2aeb3d89a259	Predstava-write	Predstava - spreminjanje	t
00030000-564c-8a23-a47b-af17c3b87c7d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564c-8a23-c3f9-fa5ebe53bd28	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564c-8a23-6310-29154b9d1c5a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564c-8a23-8847-e2fc4a4ac45a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564c-8a23-3c43-f653192cade9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564c-8a23-ee19-f93735c6ace2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564c-8a23-0893-393ee1c677f5	ProgramDela-read	ProgramDela - branje	t
00030000-564c-8a23-3746-8161fe615b1d	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564c-8a23-b86f-980083deb459	ProgramFestival-read	ProgramFestival - branje	t
00030000-564c-8a23-6356-8d22e9aa8365	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564c-8a23-8666-c6db2f899f94	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564c-8a23-71f0-31b38725b58a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564c-8a23-5494-a74e0154b495	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564c-8a23-4c85-9b9cac68240e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564c-8a23-a770-15cdfff26dc3	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564c-8a23-084c-29cc9c64dd0b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564c-8a23-aa6e-4cb0727ffb42	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564c-8a23-6f54-552f4b15a8ec	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564c-8a23-dc0d-3b89a7642a7d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564c-8a23-0c30-5c5afc256dd3	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564c-8a23-ba48-9c3c700d920c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564c-8a23-409f-581efe0bd374	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564c-8a23-7c7d-75ae20d227af	ProgramRazno-read	ProgramRazno - branje	t
00030000-564c-8a23-ff88-5cdc8d659c3f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564c-8a23-6207-c399079635fc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564c-8a23-010f-466a02cf60ea	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564c-8a23-6a31-c89100fc0ff3	Prostor-read	Prostor - branje	t
00030000-564c-8a23-a95e-9203485f76b8	Prostor-write	Prostor - spreminjanje	t
00030000-564c-8a23-eb18-73efcea5888e	Racun-read	Racun - branje	t
00030000-564c-8a23-682a-03ebc77be9d6	Racun-write	Racun - spreminjanje	t
00030000-564c-8a23-8d80-d609ad36ce2b	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564c-8a23-bd1c-35f3a9ee7c03	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564c-8a23-a70a-ec3ae25a0e9d	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564c-8a23-49b7-5dd5f555383c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564c-8a23-1b44-38593bdacfcc	Rekvizit-read	Rekvizit - branje	t
00030000-564c-8a23-373b-47c38d7825ac	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564c-8a23-f244-b2c4e96639f9	Revizija-read	Revizija - branje	t
00030000-564c-8a23-70e5-9bf10a61b56f	Revizija-write	Revizija - spreminjanje	t
00030000-564c-8a23-f43a-fc7d7a7f59eb	Rezervacija-read	Rezervacija - branje	t
00030000-564c-8a23-3db4-b8ca4ccf45bc	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564c-8a23-2537-39dabb39f599	SedezniRed-read	SedezniRed - branje	t
00030000-564c-8a23-181a-c334d8044102	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564c-8a23-b54b-0763aed00a5c	Sedez-read	Sedez - branje	t
00030000-564c-8a23-40c8-2fba76231511	Sedez-write	Sedez - spreminjanje	t
00030000-564c-8a23-2ac2-3ff5b31e5a88	Sezona-read	Sezona - branje	t
00030000-564c-8a23-5fb2-a24554e75417	Sezona-write	Sezona - spreminjanje	t
00030000-564c-8a23-88c6-0712277a67cc	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564c-8a23-f1e5-416254c87dcb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564c-8a23-2eee-7af7539389af	Stevilcenje-read	Stevilcenje - branje	t
00030000-564c-8a23-073b-19123c52e8dc	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564c-8a23-1138-7681f7fc81bf	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564c-8a23-f3b1-231245ac8175	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564c-8a23-b063-bf788b0195fe	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564c-8a23-3b8c-6de4036942eb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564c-8a23-3af3-2d3e4f6154ce	Telefonska-read	Telefonska - branje	t
00030000-564c-8a23-cab4-37257dfefacf	Telefonska-write	Telefonska - spreminjanje	t
00030000-564c-8a23-e855-644ecea435f0	TerminStoritve-read	TerminStoritve - branje	t
00030000-564c-8a23-61e7-27ed78670986	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564c-8a23-8b65-ed2d103af834	TipFunkcije-read	TipFunkcije - branje	t
00030000-564c-8a23-c252-de8ac9fe6e38	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564c-8a23-0bb4-60fd85a0f6a7	TipPopa-read	TipPopa - branje	t
00030000-564c-8a23-ceeb-34b31e4fbfee	TipPopa-write	TipPopa - spreminjanje	t
00030000-564c-8a23-0df2-1dd2aad4e868	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564c-8a23-5189-f2ca26ea23cd	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564c-8a23-db90-7097023b866f	TipVaje-read	TipVaje - branje	t
00030000-564c-8a23-e59c-236c647f151f	TipVaje-write	TipVaje - spreminjanje	t
00030000-564c-8a23-1d83-3a8a04d527d1	Trr-read	Trr - branje	t
00030000-564c-8a23-5c8b-874f1009f58e	Trr-write	Trr - spreminjanje	t
00030000-564c-8a23-67d1-f179355dc2b3	Uprizoritev-read	Uprizoritev - branje	t
00030000-564c-8a23-03e0-b2c662f386c8	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564c-8a23-5bb2-7c46ece7d588	Vaja-read	Vaja - branje	t
00030000-564c-8a23-ec08-df53fe291159	Vaja-write	Vaja - spreminjanje	t
00030000-564c-8a23-895f-cc7460d8b725	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564c-8a23-f91b-8406b67c6f38	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564c-8a23-5cee-56811716a249	VrstaStroska-read	VrstaStroska - branje	t
00030000-564c-8a23-8a5b-58a05979cb19	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564c-8a23-2261-2f936b7a2240	Zaposlitev-read	Zaposlitev - branje	t
00030000-564c-8a23-995c-fd12b4df3bd9	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564c-8a23-dd49-26f26f42a347	Zasedenost-read	Zasedenost - branje	t
00030000-564c-8a23-7eb2-d26c1ffc2d45	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564c-8a23-79c2-b2b2f3597ebd	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564c-8a23-95a0-3c3e2a8756e7	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564c-8a23-599a-205496606b91	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564c-8a23-feea-dd2064032613	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564c-8a23-8038-55d601d174ad	Job-read	Branje opravil - samo zase - branje	t
00030000-564c-8a23-3f3e-764fbd5f0213	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564c-8a23-e2e8-05e968f63909	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564c-8a23-0b4e-4c97cfa41850	Report-read	Report - branje	t
00030000-564c-8a23-c40b-5dae4d8a250a	Report-write	Report - spreminjanje	t
00030000-564c-8a23-4ed5-367df0e0b209	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564c-8a23-7e8e-82bd9838ffbb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564c-8a23-2901-87b9f9eb3b44	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564c-8a23-965a-a3899b9ff983	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564c-8a23-de08-a864d1429d32	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564c-8a23-a3e4-87895c1b16e9	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564c-8a23-7287-2b735c9525d6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564c-8a23-df94-47e93cf89146	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564c-8a23-387f-adfa9d8412ea	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564c-8a23-0549-440ce03e971b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564c-8a23-a270-787c4c0c8021	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564c-8a23-fd48-3d87f3ab2e2e	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564c-8a23-c542-82b8290bdf67	Datoteka-write	Datoteka - spreminjanje	t
00030000-564c-8a23-5cb1-f363d913ded8	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 28319697)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564c-8a23-a5e6-bf7cb6102311	00030000-564c-8a23-391c-47a50a84d696
00020000-564c-8a23-abeb-2b444e09b334	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-ec68-3c3b807b9f7a
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-163e-50e555386646
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-5104-db9aaeb962fc
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-1f58-46b596db19d2
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-536d-6dee714824ab
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-8177-e9f9c0219849
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-a4dd-e82469c0fdc5
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-e13a-3d8c7c190eee
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-cff0-902bd2ed0cb6
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-d4a0-08222871e6aa
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-dd31-c2a833be59a3
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-1a89-1302eb28236a
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-5d32-1b67902db400
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-1bef-77bb675f31dd
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-9fd8-32bd1ce9fd51
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-ea1c-8f2fe749aeb0
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-999a-70e7d375efe2
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-9cce-40ae590f91c0
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-edfe-283ec87f80da
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-ee28-2d1ccd02e50b
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-9f84-7c85fd10c5e1
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-195c-5910bcbd48f6
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-3612-2cf40667a338
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-4233-cc8047c47f82
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-0faa-68418ec67578
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-bd94-f583c5f70d5b
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-6337-2aeb3d89a259
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-3c43-f653192cade9
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-ee19-f93735c6ace2
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-6a31-c89100fc0ff3
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-a95e-9203485f76b8
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-a70a-ec3ae25a0e9d
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-49b7-5dd5f555383c
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-1b44-38593bdacfcc
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-373b-47c38d7825ac
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-2ac2-3ff5b31e5a88
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-5fb2-a24554e75417
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-8b65-ed2d103af834
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-67d1-f179355dc2b3
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-03e0-b2c662f386c8
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-5bb2-7c46ece7d588
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-ec08-df53fe291159
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-dd49-26f26f42a347
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-7eb2-d26c1ffc2d45
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-79c2-b2b2f3597ebd
00020000-564c-8a23-e7f0-56cf089dc6b4	00030000-564c-8a23-599a-205496606b91
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-ec68-3c3b807b9f7a
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-536d-6dee714824ab
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-8177-e9f9c0219849
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-1a89-1302eb28236a
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-1bef-77bb675f31dd
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-9fd8-32bd1ce9fd51
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-ea1c-8f2fe749aeb0
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-999a-70e7d375efe2
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-9cce-40ae590f91c0
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-edfe-283ec87f80da
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-ee28-2d1ccd02e50b
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-195c-5910bcbd48f6
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-4233-cc8047c47f82
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-0faa-68418ec67578
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-bd94-f583c5f70d5b
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-6a31-c89100fc0ff3
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-a70a-ec3ae25a0e9d
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-1b44-38593bdacfcc
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-2ac2-3ff5b31e5a88
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-3af3-2d3e4f6154ce
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-cab4-37257dfefacf
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-1d83-3a8a04d527d1
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-5c8b-874f1009f58e
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-2261-2f936b7a2240
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-995c-fd12b4df3bd9
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-79c2-b2b2f3597ebd
00020000-564c-8a23-854f-571bf47fdbd4	00030000-564c-8a23-599a-205496606b91
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-ec68-3c3b807b9f7a
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-5104-db9aaeb962fc
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-536d-6dee714824ab
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-1a51-d78d91064393
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-f091-4c08ac03ef47
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-8bc8-dd92848334fb
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-8177-e9f9c0219849
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-d4a0-08222871e6aa
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-1a89-1302eb28236a
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-1bef-77bb675f31dd
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-ea1c-8f2fe749aeb0
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-999a-70e7d375efe2
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-9cce-40ae590f91c0
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-ee28-2d1ccd02e50b
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-195c-5910bcbd48f6
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-bd94-f583c5f70d5b
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-3c43-f653192cade9
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-6a31-c89100fc0ff3
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-a70a-ec3ae25a0e9d
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-1b44-38593bdacfcc
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-2ac2-3ff5b31e5a88
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-8b65-ed2d103af834
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-5bb2-7c46ece7d588
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-dd49-26f26f42a347
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-79c2-b2b2f3597ebd
00020000-564c-8a23-ebaf-ffce21a71d30	00030000-564c-8a23-599a-205496606b91
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-ec68-3c3b807b9f7a
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-163e-50e555386646
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-1f58-46b596db19d2
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-536d-6dee714824ab
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-8177-e9f9c0219849
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-1a89-1302eb28236a
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-ea1c-8f2fe749aeb0
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-999a-70e7d375efe2
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-ee28-2d1ccd02e50b
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-195c-5910bcbd48f6
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-bd94-f583c5f70d5b
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-6a31-c89100fc0ff3
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-a70a-ec3ae25a0e9d
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-1b44-38593bdacfcc
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-2ac2-3ff5b31e5a88
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-8b65-ed2d103af834
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-79c2-b2b2f3597ebd
00020000-564c-8a23-584c-976ba7f81d1d	00030000-564c-8a23-599a-205496606b91
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-ec68-3c3b807b9f7a
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-536d-6dee714824ab
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-8177-e9f9c0219849
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-1a89-1302eb28236a
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-ea1c-8f2fe749aeb0
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-999a-70e7d375efe2
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-ee28-2d1ccd02e50b
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-195c-5910bcbd48f6
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-bd94-f583c5f70d5b
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-6a31-c89100fc0ff3
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-a70a-ec3ae25a0e9d
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-1b44-38593bdacfcc
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-2ac2-3ff5b31e5a88
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-e855-644ecea435f0
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-d10b-a2754132bbc7
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-8b65-ed2d103af834
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-79c2-b2b2f3597ebd
00020000-564c-8a23-295d-c7270a97c2fd	00030000-564c-8a23-599a-205496606b91
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2686-0dc9d5183e33
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-391c-47a50a84d696
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ec68-3c3b807b9f7a
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-163e-50e555386646
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5104-db9aaeb962fc
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1f58-46b596db19d2
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-536d-6dee714824ab
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1a51-d78d91064393
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1863-7e68b0236236
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1807-b0170a81528c
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f091-4c08ac03ef47
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-7514-392b4e7bc464
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8bc8-dd92848334fb
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ee4a-f4981f44756e
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8177-e9f9c0219849
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a4dd-e82469c0fdc5
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-e13a-3d8c7c190eee
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-9caf-4f6866e399b3
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2752-1be1aa7cddd4
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6848-f3e497e6ee5a
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-cff0-902bd2ed0cb6
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-40c5-ffcb09237c15
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-d4c5-dab71c12e79d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-d4a0-08222871e6aa
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-dd31-c2a833be59a3
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1a89-1302eb28236a
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5d32-1b67902db400
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1bef-77bb675f31dd
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-9fd8-32bd1ce9fd51
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f8a6-9e187b265bb8
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-e95b-bdf668305952
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-70c3-999ad848357b
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6cc7-6ef8f1792dea
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ea1c-8f2fe749aeb0
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-999a-70e7d375efe2
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a843-47fe3f7a2ade
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-37f4-7b94281b579d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5636-061fd50260dd
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-c3fe-6246817c9d3f
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-9cce-40ae590f91c0
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-39f0-d995d66eb45d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-edfe-283ec87f80da
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a72c-2804c8d6dc07
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-b5d6-446fb84b9971
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0645-1df0b5545b3c
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-4d2b-97f0c1f20723
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3f28-31c30ca796e7
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0e7d-5941b51bb9b8
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ee28-2d1ccd02e50b
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-9f84-7c85fd10c5e1
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-195c-5910bcbd48f6
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0ff8-127968e5d642
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-cbd4-cc60c27c0e48
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-9957-fd7bbb233189
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-e807-4afae750cbe0
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3612-2cf40667a338
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-4233-cc8047c47f82
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0faa-68418ec67578
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2e5d-3f571daee853
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-b3d8-69e1968d9868
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-bd94-f583c5f70d5b
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6337-2aeb3d89a259
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a47b-af17c3b87c7d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-c3f9-fa5ebe53bd28
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6310-29154b9d1c5a
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8847-e2fc4a4ac45a
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3c43-f653192cade9
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ee19-f93735c6ace2
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-66ca-c670d48fede5
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0893-393ee1c677f5
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1447-b00fbc430089
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3746-8161fe615b1d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-b86f-980083deb459
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6356-8d22e9aa8365
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8666-c6db2f899f94
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-71f0-31b38725b58a
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5494-a74e0154b495
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-4c85-9b9cac68240e
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a770-15cdfff26dc3
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-084c-29cc9c64dd0b
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-aa6e-4cb0727ffb42
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6f54-552f4b15a8ec
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-dc0d-3b89a7642a7d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0c30-5c5afc256dd3
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ba48-9c3c700d920c
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-409f-581efe0bd374
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-7c7d-75ae20d227af
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ff88-5cdc8d659c3f
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6207-c399079635fc
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-010f-466a02cf60ea
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-6a31-c89100fc0ff3
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a95e-9203485f76b8
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-eb18-73efcea5888e
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-682a-03ebc77be9d6
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8d80-d609ad36ce2b
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-bd1c-35f3a9ee7c03
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-a70a-ec3ae25a0e9d
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-49b7-5dd5f555383c
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1b44-38593bdacfcc
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-373b-47c38d7825ac
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f244-b2c4e96639f9
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-70e5-9bf10a61b56f
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f43a-fc7d7a7f59eb
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3db4-b8ca4ccf45bc
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2537-39dabb39f599
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-181a-c334d8044102
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-b54b-0763aed00a5c
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-40c8-2fba76231511
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2ac2-3ff5b31e5a88
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5fb2-a24554e75417
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-88c6-0712277a67cc
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f1e5-416254c87dcb
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2eee-7af7539389af
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1138-7681f7fc81bf
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f3b1-231245ac8175
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-073b-19123c52e8dc
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-b063-bf788b0195fe
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3b8c-6de4036942eb
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-3af3-2d3e4f6154ce
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-cab4-37257dfefacf
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-e855-644ecea435f0
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-d10b-a2754132bbc7
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-61e7-27ed78670986
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8b65-ed2d103af834
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-c252-de8ac9fe6e38
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0bb4-60fd85a0f6a7
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ceeb-34b31e4fbfee
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-0df2-1dd2aad4e868
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5189-f2ca26ea23cd
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-db90-7097023b866f
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-e59c-236c647f151f
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-1d83-3a8a04d527d1
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5c8b-874f1009f58e
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-67d1-f179355dc2b3
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-03e0-b2c662f386c8
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5bb2-7c46ece7d588
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-ec08-df53fe291159
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-895f-cc7460d8b725
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-f91b-8406b67c6f38
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-5cee-56811716a249
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-8a5b-58a05979cb19
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-2261-2f936b7a2240
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-995c-fd12b4df3bd9
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-dd49-26f26f42a347
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-7eb2-d26c1ffc2d45
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-79c2-b2b2f3597ebd
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-95a0-3c3e2a8756e7
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-599a-205496606b91
00020000-564c-8a25-d8ac-847f61a30f98	00030000-564c-8a23-feea-dd2064032613
00020000-564c-8a25-5904-b9399e8e2db3	00030000-564c-8a23-0549-440ce03e971b
00020000-564c-8a25-5110-d5511c953a9d	00030000-564c-8a23-387f-adfa9d8412ea
00020000-564c-8a25-4d6c-8dc8a4bf04d1	00030000-564c-8a23-03e0-b2c662f386c8
00020000-564c-8a25-38de-b7f5dc7f91a1	00030000-564c-8a23-67d1-f179355dc2b3
00020000-564c-8a25-9052-601031e7484f	00030000-564c-8a23-7e8e-82bd9838ffbb
00020000-564c-8a25-3324-a77827f19473	00030000-564c-8a23-2901-87b9f9eb3b44
00020000-564c-8a25-e460-7323f3e3ca31	00030000-564c-8a23-965a-a3899b9ff983
00020000-564c-8a25-3888-e997e2f86672	00030000-564c-8a23-4ed5-367df0e0b209
00020000-564c-8a25-7685-ded00f648f11	00030000-564c-8a23-a3e4-87895c1b16e9
00020000-564c-8a25-0a0d-a70fb085db58	00030000-564c-8a23-de08-a864d1429d32
00020000-564c-8a25-af14-c4b9a38be03c	00030000-564c-8a23-df94-47e93cf89146
00020000-564c-8a25-a4c3-1fee4caab6e8	00030000-564c-8a23-7287-2b735c9525d6
00020000-564c-8a25-02f2-b2d26081b320	00030000-564c-8a23-edfe-283ec87f80da
00020000-564c-8a25-fa49-9cc1e9f99701	00030000-564c-8a23-9cce-40ae590f91c0
00020000-564c-8a25-0c09-66d38dbb1d00	00030000-564c-8a23-c542-82b8290bdf67
00020000-564c-8a25-c95c-a5e541c60144	00030000-564c-8a23-5cb1-f363d913ded8
\.


--
-- TOC entry 3139 (class 0 OID 28320087)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 28320121)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 28320258)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564c-8a25-cedb-b9d09d869870	00090000-564c-8a25-de33-63526d5d4bf5	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564c-8a25-4420-08bf50da9b3d	00090000-564c-8a25-e461-93000ebdaa43	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564c-8a25-3c62-92dcbb1c3433	00090000-564c-8a25-9406-9fcdb2c9ac5b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564c-8a25-4608-21e10ce56286	00090000-564c-8a25-7242-1037aeb6d763	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 28319779)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564c-8a25-94f9-95796c3cf9c2	\N	00040000-564c-8a23-68dc-178fc90f894b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-572b-aabbc5a34f2b	\N	00040000-564c-8a23-68dc-178fc90f894b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564c-8a25-cecd-27af4f40a71f	\N	00040000-564c-8a23-68dc-178fc90f894b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-62e9-f7cc6f3e0ed6	\N	00040000-564c-8a23-68dc-178fc90f894b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-87bf-3ee0bcc5ba3d	\N	00040000-564c-8a23-68dc-178fc90f894b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-64c6-cec5eb23a9bf	\N	00040000-564c-8a23-8973-90e61d660f29	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-ac6b-1a7687e991d7	\N	00040000-564c-8a23-8e5f-19c948e324f8	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-2790-dd250b7d3523	\N	00040000-564c-8a23-772a-66a383b68299	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a25-879c-7332967365ed	\N	00040000-564c-8a23-49c2-1a23df37e424	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-8a27-3f35-75d8ab5b2282	\N	00040000-564c-8a23-68dc-178fc90f894b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 28319824)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564c-8a22-9f3b-bc488a0fb84d	8341	Adlešiči
00050000-564c-8a22-bb42-342e0688a1a3	5270	Ajdovščina
00050000-564c-8a22-051b-3a89881c8e48	6280	Ankaran/Ancarano
00050000-564c-8a22-eee0-10b47668dc42	9253	Apače
00050000-564c-8a22-56ef-c6aa5efe4649	8253	Artiče
00050000-564c-8a22-b016-7b8b00672e40	4275	Begunje na Gorenjskem
00050000-564c-8a22-8e1d-099135f1f331	1382	Begunje pri Cerknici
00050000-564c-8a22-1efe-51258af2a5cc	9231	Beltinci
00050000-564c-8a22-d2ea-fdb1e87abe94	2234	Benedikt
00050000-564c-8a22-2a67-2c55d0d75327	2345	Bistrica ob Dravi
00050000-564c-8a22-f2b4-3d688725f178	3256	Bistrica ob Sotli
00050000-564c-8a22-4b9e-cc7d26e80360	8259	Bizeljsko
00050000-564c-8a22-5022-91dfe74688db	1223	Blagovica
00050000-564c-8a22-ee14-3aa8dbe6a6dc	8283	Blanca
00050000-564c-8a22-0ae3-03345b511151	4260	Bled
00050000-564c-8a22-04b3-0fa66930bcb2	4273	Blejska Dobrava
00050000-564c-8a22-17aa-f6efead931f4	9265	Bodonci
00050000-564c-8a22-eec4-9b8d01027499	9222	Bogojina
00050000-564c-8a22-8fd9-b4333542a670	4263	Bohinjska Bela
00050000-564c-8a22-ffb7-070b59e95c4f	4264	Bohinjska Bistrica
00050000-564c-8a22-b67f-6974dbb2dcec	4265	Bohinjsko jezero
00050000-564c-8a22-526e-bfa165285e7d	1353	Borovnica
00050000-564c-8a22-4e83-5c5567ae3bc5	8294	Boštanj
00050000-564c-8a22-fd26-bd27383d588a	5230	Bovec
00050000-564c-8a22-7df9-d6138cc09ce0	5295	Branik
00050000-564c-8a22-0247-9a6be5fa1821	3314	Braslovče
00050000-564c-8a22-02e6-aa0a9ef3be95	5223	Breginj
00050000-564c-8a22-2a28-ef10f663c46d	8280	Brestanica
00050000-564c-8a22-21dd-62a1df38ce4a	2354	Bresternica
00050000-564c-8a22-4b6f-deebd658ada7	4243	Brezje
00050000-564c-8a22-ae55-f9f65a47c62e	1351	Brezovica pri Ljubljani
00050000-564c-8a22-04df-8a61b6f78c51	8250	Brežice
00050000-564c-8a22-60b0-8481d50a808e	4210	Brnik - Aerodrom
00050000-564c-8a22-8dac-212646ac3d2b	8321	Brusnice
00050000-564c-8a22-e2d1-6a3c63afc66d	3255	Buče
00050000-564c-8a22-f84a-315f8fd875be	8276	Bučka 
00050000-564c-8a22-c42e-fbfc8399eec5	9261	Cankova
00050000-564c-8a22-ee8e-bc01a1f50cc8	3000	Celje 
00050000-564c-8a22-0a81-170412587743	3001	Celje - poštni predali
00050000-564c-8a22-4193-932a19e9d830	4207	Cerklje na Gorenjskem
00050000-564c-8a22-8733-ef0c8ab312da	8263	Cerklje ob Krki
00050000-564c-8a22-7cde-8f1f57dc1826	1380	Cerknica
00050000-564c-8a22-1980-2dfda5d25950	5282	Cerkno
00050000-564c-8a22-6482-b43d2b04cb33	2236	Cerkvenjak
00050000-564c-8a22-f5d8-6fcbdf012c96	2215	Ceršak
00050000-564c-8a22-c272-fe75e9b4c56d	2326	Cirkovce
00050000-564c-8a22-b44f-6193a3496ee5	2282	Cirkulane
00050000-564c-8a22-bb61-b52d8f3a8c8d	5273	Col
00050000-564c-8a22-64b7-32939fdc3d45	8251	Čatež ob Savi
00050000-564c-8a22-2932-21e966a3b11d	1413	Čemšenik
00050000-564c-8a22-dee2-986a50be3dce	5253	Čepovan
00050000-564c-8a22-1009-d100dff4a6da	9232	Črenšovci
00050000-564c-8a22-b554-4516d0a7bd69	2393	Črna na Koroškem
00050000-564c-8a22-6697-d1fba35ebaf6	6275	Črni Kal
00050000-564c-8a22-966d-9bcc7d3dd137	5274	Črni Vrh nad Idrijo
00050000-564c-8a22-7539-dd1eb2ae60fd	5262	Črniče
00050000-564c-8a22-0ca2-f937282bc1f4	8340	Črnomelj
00050000-564c-8a22-5786-be2fc8d0635d	6271	Dekani
00050000-564c-8a22-7497-506e52413b68	5210	Deskle
00050000-564c-8a22-3a28-b1c7cef5738c	2253	Destrnik
00050000-564c-8a22-97cc-4374bbf915bd	6215	Divača
00050000-564c-8a22-7fb7-9d991ffea773	1233	Dob
00050000-564c-8a22-567f-d59ce65e0426	3224	Dobje pri Planini
00050000-564c-8a22-f6d7-299e608dbfe4	8257	Dobova
00050000-564c-8a22-9d19-aebe54a0000c	1423	Dobovec
00050000-564c-8a22-4090-96351362fe3e	5263	Dobravlje
00050000-564c-8a22-3263-377741a8f832	3204	Dobrna
00050000-564c-8a22-7a7a-b30e0f30bed5	8211	Dobrnič
00050000-564c-8a22-a632-03c32def57ce	1356	Dobrova
00050000-564c-8a22-1abd-0c37432f6334	9223	Dobrovnik/Dobronak 
00050000-564c-8a22-21f7-7074c0f663b2	5212	Dobrovo v Brdih
00050000-564c-8a22-3d6f-7d6b2385896b	1431	Dol pri Hrastniku
00050000-564c-8a22-edc8-d28bac88028c	1262	Dol pri Ljubljani
00050000-564c-8a22-90bc-d6ff7d06675f	1273	Dole pri Litiji
00050000-564c-8a22-0f44-bada9ed9d323	1331	Dolenja vas
00050000-564c-8a22-ec80-8adb8d6c3366	8350	Dolenjske Toplice
00050000-564c-8a22-0dc8-34e4f695dae2	1230	Domžale
00050000-564c-8a22-e14a-e4e5befa2342	2252	Dornava
00050000-564c-8a22-2502-2417685b36f2	5294	Dornberk
00050000-564c-8a22-3347-bc86a090bddb	1319	Draga
00050000-564c-8a22-fe27-17ec10816939	8343	Dragatuš
00050000-564c-8a22-1166-bb54aabe6a90	3222	Dramlje
00050000-564c-8a22-ce38-6c9983b92887	2370	Dravograd
00050000-564c-8a22-7893-c246872b28c5	4203	Duplje
00050000-564c-8a22-9b7f-3a523604b48b	6221	Dutovlje
00050000-564c-8a22-4e4f-e1c4809b72b7	8361	Dvor
00050000-564c-8a22-b7e7-c534dc2282e8	2343	Fala
00050000-564c-8a22-a4b6-d60fe402a973	9208	Fokovci
00050000-564c-8a22-ca7d-fe6c1186c91c	2313	Fram
00050000-564c-8a22-7ac7-094a4486862a	3213	Frankolovo
00050000-564c-8a22-f8f8-cae2e8e92632	1274	Gabrovka
00050000-564c-8a22-4fa5-8906f4b91887	8254	Globoko
00050000-564c-8a22-86f7-6d23fde46da0	5275	Godovič
00050000-564c-8a22-8529-a58d7e9a82e2	4204	Golnik
00050000-564c-8a22-eb5b-66d9b8ec71f7	3303	Gomilsko
00050000-564c-8a22-b977-5acac866d876	4224	Gorenja vas
00050000-564c-8a22-6aca-0e2ed5425265	3263	Gorica pri Slivnici
00050000-564c-8a22-18ee-e4bcde1172e3	2272	Gorišnica
00050000-564c-8a22-1ebb-e4e3a711a71c	9250	Gornja Radgona
00050000-564c-8a22-1c85-a7e8f6f75af8	3342	Gornji Grad
00050000-564c-8a22-8219-b86d3b219a4d	4282	Gozd Martuljek
00050000-564c-8a22-44dd-4f295f3cb695	6272	Gračišče
00050000-564c-8a22-41ae-3f76bc080184	9264	Grad
00050000-564c-8a22-392c-df235e0dc91f	8332	Gradac
00050000-564c-8a22-f89e-d5e43a218364	1384	Grahovo
00050000-564c-8a22-33da-4368fd81be22	5242	Grahovo ob Bači
00050000-564c-8a22-f6ae-4dc67e7c847a	5251	Grgar
00050000-564c-8a22-6d99-71682deaa450	3302	Griže
00050000-564c-8a22-d45e-b1432c80326c	3231	Grobelno
00050000-564c-8a22-c4c8-44efbcf9bd21	1290	Grosuplje
00050000-564c-8a22-e5ba-29164a8c63a1	2288	Hajdina
00050000-564c-8a22-b47a-1aa905972ea8	8362	Hinje
00050000-564c-8a22-0888-4ab88c4ffa45	2311	Hoče
00050000-564c-8a22-f103-658e0287c930	9205	Hodoš/Hodos
00050000-564c-8a22-8358-78aeb0d47318	1354	Horjul
00050000-564c-8a22-cdaa-50aa30cf63b0	1372	Hotedršica
00050000-564c-8a22-ec28-d79956988f78	1430	Hrastnik
00050000-564c-8a22-9333-61e10075cb2c	6225	Hruševje
00050000-564c-8a22-b6ce-32493d6b7d9d	4276	Hrušica
00050000-564c-8a22-17e9-88a2738a6fd0	5280	Idrija
00050000-564c-8a22-bfe9-a5104a7244a9	1292	Ig
00050000-564c-8a22-d192-9e5b6681655d	6250	Ilirska Bistrica
00050000-564c-8a22-899c-a51eda169bb8	6251	Ilirska Bistrica-Trnovo
00050000-564c-8a22-f5ae-51710338f820	1295	Ivančna Gorica
00050000-564c-8a22-8989-e6fe4ea6a241	2259	Ivanjkovci
00050000-564c-8a22-0f1d-81887fa37c3e	1411	Izlake
00050000-564c-8a22-0cae-c8999d1f605b	6310	Izola/Isola
00050000-564c-8a22-3be3-4701a9b21c4e	2222	Jakobski Dol
00050000-564c-8a22-90fa-603e1e8dc107	2221	Jarenina
00050000-564c-8a22-4fbb-c1ef51c04430	6254	Jelšane
00050000-564c-8a22-583f-20e3ac38d7d8	4270	Jesenice
00050000-564c-8a22-4e25-3851973b0f36	8261	Jesenice na Dolenjskem
00050000-564c-8a22-9d84-556776624fb8	3273	Jurklošter
00050000-564c-8a22-7c31-d584d4d341a1	2223	Jurovski Dol
00050000-564c-8a22-253d-8374fa829ba2	2256	Juršinci
00050000-564c-8a22-65ec-f0feacf04470	5214	Kal nad Kanalom
00050000-564c-8a22-9a56-ceaedfcef721	3233	Kalobje
00050000-564c-8a22-766a-60e49d4db17d	4246	Kamna Gorica
00050000-564c-8a22-3dfe-913cc1cf9bdb	2351	Kamnica
00050000-564c-8a22-4854-e4a1e40ae808	1241	Kamnik
00050000-564c-8a22-14b9-e12977812a6e	5213	Kanal
00050000-564c-8a22-fefc-194f1146a448	8258	Kapele
00050000-564c-8a22-5d74-da66928f61e6	2362	Kapla
00050000-564c-8a22-1f55-40e08e20a2bf	2325	Kidričevo
00050000-564c-8a22-2d77-bb04c30a753e	1412	Kisovec
00050000-564c-8a22-77f5-30b364e48874	6253	Knežak
00050000-564c-8a22-1a09-e34fedab9ed5	5222	Kobarid
00050000-564c-8a22-4916-835c033fb281	9227	Kobilje
00050000-564c-8a22-4300-5a7f8609c6f2	1330	Kočevje
00050000-564c-8a22-867d-0a07655dd5ca	1338	Kočevska Reka
00050000-564c-8a22-ba75-0427174bf433	2276	Kog
00050000-564c-8a22-a641-3ab5d0fd88c7	5211	Kojsko
00050000-564c-8a22-64bc-83279b279025	6223	Komen
00050000-564c-8a22-66a8-4ccd8d124326	1218	Komenda
00050000-564c-8a22-b8e6-6717480b8fa1	6000	Koper/Capodistria 
00050000-564c-8a22-dc12-23f3fb19bbe2	6001	Koper/Capodistria - poštni predali
00050000-564c-8a22-2be8-dc5dc0acc497	8282	Koprivnica
00050000-564c-8a22-bbe9-6ecdf8ea2144	5296	Kostanjevica na Krasu
00050000-564c-8a22-6dcd-43bd1e2ad25c	8311	Kostanjevica na Krki
00050000-564c-8a22-9315-62ea3d3e5238	1336	Kostel
00050000-564c-8a22-6b0d-e16ee33b3012	6256	Košana
00050000-564c-8a22-570b-20ca6bb3782d	2394	Kotlje
00050000-564c-8a22-ba1c-2eff9cfd6bf4	6240	Kozina
00050000-564c-8a22-4598-a941e5c81b40	3260	Kozje
00050000-564c-8a22-5afb-4265f88c0045	4000	Kranj 
00050000-564c-8a22-4fca-ea0ed938984a	4001	Kranj - poštni predali
00050000-564c-8a22-9d1f-42ae4a1cc415	4280	Kranjska Gora
00050000-564c-8a22-4214-0415121cea7e	1281	Kresnice
00050000-564c-8a22-4a2e-d9d47135bda0	4294	Križe
00050000-564c-8a22-a0c9-a0317b48018a	9206	Križevci
00050000-564c-8a22-3f1a-2c9638b33b1c	9242	Križevci pri Ljutomeru
00050000-564c-8a22-f694-89aa07168976	1301	Krka
00050000-564c-8a22-1edc-5bd25515b733	8296	Krmelj
00050000-564c-8a22-7dc8-afbdd52b411f	4245	Kropa
00050000-564c-8a22-6c4a-fc3704e36554	8262	Krška vas
00050000-564c-8a22-73e5-5a7b8918fadc	8270	Krško
00050000-564c-8a22-a430-0dcd0fcdaf16	9263	Kuzma
00050000-564c-8a22-b7a7-87ee8f48d691	2318	Laporje
00050000-564c-8a22-321b-1474d35fde9e	3270	Laško
00050000-564c-8a22-aa35-b1f4c9e34368	1219	Laze v Tuhinju
00050000-564c-8a22-9efa-9d1a5bdf8c14	2230	Lenart v Slovenskih goricah
00050000-564c-8a22-9e20-c3c643a0524e	9220	Lendava/Lendva
00050000-564c-8a22-737b-73b26b8a4b97	4248	Lesce
00050000-564c-8a22-617f-cfd68f7524f1	3261	Lesično
00050000-564c-8a22-de42-a81c0851727f	8273	Leskovec pri Krškem
00050000-564c-8a22-dadd-f443bdd16496	2372	Libeliče
00050000-564c-8a22-caf5-bfbda20ed909	2341	Limbuš
00050000-564c-8a22-2d47-1eac962ba0a3	1270	Litija
00050000-564c-8a22-b4e7-c78bba09dc98	3202	Ljubečna
00050000-564c-8a22-5655-5fd2fa5a5861	1000	Ljubljana 
00050000-564c-8a22-0fb1-b34f1d688140	1001	Ljubljana - poštni predali
00050000-564c-8a22-5e57-33a1d3088727	1231	Ljubljana - Črnuče
00050000-564c-8a22-1502-e76406fbec64	1261	Ljubljana - Dobrunje
00050000-564c-8a22-cb90-3aa6e886232f	1260	Ljubljana - Polje
00050000-564c-8a22-8785-fdd5831cfd5c	1210	Ljubljana - Šentvid
00050000-564c-8a22-69ff-42d0fe7751f1	1211	Ljubljana - Šmartno
00050000-564c-8a22-3140-f6b3dbb4bd0a	3333	Ljubno ob Savinji
00050000-564c-8a22-3351-c50b7b5e5d42	9240	Ljutomer
00050000-564c-8a22-9132-897e443ac517	3215	Loče
00050000-564c-8a22-8397-2c91385d1042	5231	Log pod Mangartom
00050000-564c-8a22-f1dc-1375169a1837	1358	Log pri Brezovici
00050000-564c-8a22-ceb7-ac5c133f2c53	1370	Logatec
00050000-564c-8a22-3824-b40c2d754f9a	1371	Logatec
00050000-564c-8a22-b1ce-ac62b7b5177a	1434	Loka pri Zidanem Mostu
00050000-564c-8a22-7c6d-50e7d5b60b4a	3223	Loka pri Žusmu
00050000-564c-8a22-58cf-d1e33f70f810	6219	Lokev
00050000-564c-8a22-9b76-6aa6146cb9ec	1318	Loški Potok
00050000-564c-8a22-2445-c6dc63b597b7	2324	Lovrenc na Dravskem polju
00050000-564c-8a22-3c82-732605aa4a04	2344	Lovrenc na Pohorju
00050000-564c-8a22-25ae-52533a13fc2c	3334	Luče
00050000-564c-8a22-103d-e104e0597c2b	1225	Lukovica
00050000-564c-8a22-5fa7-1ba38516db81	9202	Mačkovci
00050000-564c-8a22-f01f-0cf51c63e2a2	2322	Majšperk
00050000-564c-8a22-748b-92e33e10637c	2321	Makole
00050000-564c-8a22-e1a6-bd973dc18294	9243	Mala Nedelja
00050000-564c-8a22-a4ec-4762b1bc324e	2229	Malečnik
00050000-564c-8a22-484c-8dc09cc3c502	6273	Marezige
00050000-564c-8a22-89fe-2fefd6cb4ed8	2000	Maribor 
00050000-564c-8a22-305f-2f7b14db1183	2001	Maribor - poštni predali
00050000-564c-8a22-9878-54e14f6f71a8	2206	Marjeta na Dravskem polju
00050000-564c-8a22-6e57-be9d71dad40a	2281	Markovci
00050000-564c-8a22-450d-5abfdf42c3da	9221	Martjanci
00050000-564c-8a22-c6d3-1da543b3bc20	6242	Materija
00050000-564c-8a22-01d7-27c8f0f2c89c	4211	Mavčiče
00050000-564c-8a22-82ad-30ae73ad376d	1215	Medvode
00050000-564c-8a22-86bf-420a2b2a9a80	1234	Mengeš
00050000-564c-8a22-2711-e90a3e9f97f5	8330	Metlika
00050000-564c-8a22-deb7-9d4cd16a078e	2392	Mežica
00050000-564c-8a22-fb78-6f99aed2045b	2204	Miklavž na Dravskem polju
00050000-564c-8a22-89d8-156f28d7b155	2275	Miklavž pri Ormožu
00050000-564c-8a22-5211-c3845ca48db0	5291	Miren
00050000-564c-8a22-fbeb-f7e92d3efcde	8233	Mirna
00050000-564c-8a22-0e98-55109ddabe41	8216	Mirna Peč
00050000-564c-8a22-9ca5-2c28ed934726	2382	Mislinja
00050000-564c-8a22-6573-a2fba41e99c5	4281	Mojstrana
00050000-564c-8a22-0420-c55116e2d164	8230	Mokronog
00050000-564c-8a22-553b-e8960703339e	1251	Moravče
00050000-564c-8a22-8ac9-41d74c7e7fcb	9226	Moravske Toplice
00050000-564c-8a22-1413-01feae28ed1f	5216	Most na Soči
00050000-564c-8a22-077d-ba432961f41d	1221	Motnik
00050000-564c-8a22-5419-a19e3a36a499	3330	Mozirje
00050000-564c-8a22-eb94-d6c50a6bd94b	9000	Murska Sobota 
00050000-564c-8a22-fa1b-ee2a6c97d711	9001	Murska Sobota - poštni predali
00050000-564c-8a22-350f-95f2091a5679	2366	Muta
00050000-564c-8a22-7a2c-a3e837412a9e	4202	Naklo
00050000-564c-8a22-e6e6-8613ad17f251	3331	Nazarje
00050000-564c-8a22-4a0e-7c3e7a75d1a1	1357	Notranje Gorice
00050000-564c-8a22-ac6f-99a0d3b95ecd	3203	Nova Cerkev
00050000-564c-8a22-ca23-a2a93c04cfa2	5000	Nova Gorica 
00050000-564c-8a22-f717-64dbefec408b	5001	Nova Gorica - poštni predali
00050000-564c-8a22-279e-d5f2020cd6ef	1385	Nova vas
00050000-564c-8a22-f5da-5ac791977199	8000	Novo mesto
00050000-564c-8a22-48e8-ecca08872d3b	8001	Novo mesto - poštni predali
00050000-564c-8a22-a9b8-03f9f774f8b6	6243	Obrov
00050000-564c-8a22-951f-83b2aba0e978	9233	Odranci
00050000-564c-8a22-abfc-a355daf44909	2317	Oplotnica
00050000-564c-8a22-0db5-32a7494504e3	2312	Orehova vas
00050000-564c-8a22-9782-ffc960486066	2270	Ormož
00050000-564c-8a22-01e3-9ac6d4a4dad3	1316	Ortnek
00050000-564c-8a22-ce26-b2d7287696cb	1337	Osilnica
00050000-564c-8a22-80c3-19c09f34c349	8222	Otočec
00050000-564c-8a22-d96b-e545efb5c76b	2361	Ožbalt
00050000-564c-8a22-03ab-433965d73890	2231	Pernica
00050000-564c-8a22-ed3f-b8c5d9667d73	2211	Pesnica pri Mariboru
00050000-564c-8a22-8343-595960e18cb2	9203	Petrovci
00050000-564c-8a22-4f88-0906674b3bba	3301	Petrovče
00050000-564c-8a22-f846-7bd588a247f8	6330	Piran/Pirano
00050000-564c-8a22-2d3d-12dd43de4916	8255	Pišece
00050000-564c-8a22-cafc-ebf7d78c57b4	6257	Pivka
00050000-564c-8a22-8b4d-48cb4ab1c68b	6232	Planina
00050000-564c-8a22-0d39-4894a85c7cc5	3225	Planina pri Sevnici
00050000-564c-8a22-c111-8b2528155e4d	6276	Pobegi
00050000-564c-8a22-4361-2887e9eb27c4	8312	Podbočje
00050000-564c-8a22-5689-b574582debb8	5243	Podbrdo
00050000-564c-8a22-58e3-9488206ac028	3254	Podčetrtek
00050000-564c-8a22-fe3c-4de9ccb4db83	2273	Podgorci
00050000-564c-8a22-45d3-1c51d98754af	6216	Podgorje
00050000-564c-8a22-0018-80fc1500052b	2381	Podgorje pri Slovenj Gradcu
00050000-564c-8a22-d0d0-818fab7f42f8	6244	Podgrad
00050000-564c-8a22-2c0f-2486fe02acc3	1414	Podkum
00050000-564c-8a22-539f-fcca16cce6fd	2286	Podlehnik
00050000-564c-8a22-880d-8112f6c5bb26	5272	Podnanos
00050000-564c-8a22-3104-b2671190dfca	4244	Podnart
00050000-564c-8a22-3fb5-1486499cefdf	3241	Podplat
00050000-564c-8a22-2c87-d3a80ee703ec	3257	Podsreda
00050000-564c-8a22-793b-f592f4d00769	2363	Podvelka
00050000-564c-8a22-9bdf-6cb81303b5f5	2208	Pohorje
00050000-564c-8a22-102c-ac049300d88a	2257	Polenšak
00050000-564c-8a22-fe44-274386d02532	1355	Polhov Gradec
00050000-564c-8a22-401f-877f4ede2069	4223	Poljane nad Škofjo Loko
00050000-564c-8a22-03dd-840a614ed93f	2319	Poljčane
00050000-564c-8a22-582c-e32f7eb1af04	1272	Polšnik
00050000-564c-8a22-98b2-a98e6378c38e	3313	Polzela
00050000-564c-8a22-15f4-5d4fe36c8f75	3232	Ponikva
00050000-564c-8a22-9b7d-ae29a9baded0	6320	Portorož/Portorose
00050000-564c-8a22-f42c-614c209d197b	6230	Postojna
00050000-564c-8a22-2ca0-cc1ccc22951a	2331	Pragersko
00050000-564c-8a22-e4ac-ec6707237062	3312	Prebold
00050000-564c-8a22-e9e7-2dfa3735dca6	4205	Preddvor
00050000-564c-8a22-d935-8ce871b1b1b3	6255	Prem
00050000-564c-8a22-57a7-324b9e243230	1352	Preserje
00050000-564c-8a22-523b-d528a56e5414	6258	Prestranek
00050000-564c-8a22-ebdc-be221fda4dc2	2391	Prevalje
00050000-564c-8a22-a53a-0672f9a91912	3262	Prevorje
00050000-564c-8a22-5238-b181c946eb27	1276	Primskovo 
00050000-564c-8a22-98da-5ae59c66fc3a	3253	Pristava pri Mestinju
00050000-564c-8a22-74d7-7e0b33b4881d	9207	Prosenjakovci/Partosfalva
00050000-564c-8a22-ce48-ec8d7a227ac3	5297	Prvačina
00050000-564c-8a22-c149-bb8700bd423d	2250	Ptuj
00050000-564c-8a22-4486-3bb9a61104b5	2323	Ptujska Gora
00050000-564c-8a22-6ad1-62a77cebc38d	9201	Puconci
00050000-564c-8a22-4af4-fdf12aa9fdef	2327	Rače
00050000-564c-8a22-3d2e-cf3546c2c510	1433	Radeče
00050000-564c-8a22-ef79-5b6235d1654b	9252	Radenci
00050000-564c-8a22-27d7-33c97335ba98	2360	Radlje ob Dravi
00050000-564c-8a22-1f97-d7c9f33e132d	1235	Radomlje
00050000-564c-8a22-0910-ec347c49b447	4240	Radovljica
00050000-564c-8a22-2357-f99cc514310f	8274	Raka
00050000-564c-8a22-4971-08fd26772422	1381	Rakek
00050000-564c-8a22-e810-bc4b5a1da3ab	4283	Rateče - Planica
00050000-564c-8a22-f037-31ca7822f781	2390	Ravne na Koroškem
00050000-564c-8a22-d698-fcca4c99f776	9246	Razkrižje
00050000-564c-8a22-f936-92011d9744f1	3332	Rečica ob Savinji
00050000-564c-8a22-ca6b-619c0112210e	5292	Renče
00050000-564c-8a22-8f75-ca6bca35066f	1310	Ribnica
00050000-564c-8a22-507c-38772a62e93d	2364	Ribnica na Pohorju
00050000-564c-8a22-6455-2a3c2423ed12	3272	Rimske Toplice
00050000-564c-8a22-bb48-3bfffe5326b4	1314	Rob
00050000-564c-8a22-778c-458e992fd2c3	5215	Ročinj
00050000-564c-8a22-7696-d4ba41187024	3250	Rogaška Slatina
00050000-564c-8a22-c3a6-e5dc609b9093	9262	Rogašovci
00050000-564c-8a22-0109-2721cf908d28	3252	Rogatec
00050000-564c-8a22-6d60-287a4c91fceb	1373	Rovte
00050000-564c-8a22-1c13-73e26d3ea934	2342	Ruše
00050000-564c-8a22-a0e6-8ae0367cc715	1282	Sava
00050000-564c-8a22-624c-be86699042f5	6333	Sečovlje/Sicciole
00050000-564c-8a22-ba80-c67ce2bcd3c6	4227	Selca
00050000-564c-8a22-04ae-dcd79ad8fdc2	2352	Selnica ob Dravi
00050000-564c-8a22-5464-09635ffab0db	8333	Semič
00050000-564c-8a22-9cf0-a7b94ad0aff9	8281	Senovo
00050000-564c-8a22-97e1-3e80a602b39d	6224	Senožeče
00050000-564c-8a22-ac79-e1796ba46fc6	8290	Sevnica
00050000-564c-8a22-e1a4-ab488441cede	6210	Sežana
00050000-564c-8a22-8071-e82391a2b70f	2214	Sladki Vrh
00050000-564c-8a22-98cf-29f8b80d8fae	5283	Slap ob Idrijci
00050000-564c-8a22-ef12-e41b021277e8	2380	Slovenj Gradec
00050000-564c-8a22-7f82-0e07587f3305	2310	Slovenska Bistrica
00050000-564c-8a22-b9b0-5f666da7fc94	3210	Slovenske Konjice
00050000-564c-8a22-16d8-d225101f3b7e	1216	Smlednik
00050000-564c-8a22-1c0e-620c3c648527	5232	Soča
00050000-564c-8a22-783f-c420deaf06f4	1317	Sodražica
00050000-564c-8a22-ea78-165b74370744	3335	Solčava
00050000-564c-8a22-2ce0-bd1e999d6ca5	5250	Solkan
00050000-564c-8a22-6903-ca853b42a606	4229	Sorica
00050000-564c-8a22-b3df-d6dbb0dc9ea4	4225	Sovodenj
00050000-564c-8a22-f991-83d9939489f4	5281	Spodnja Idrija
00050000-564c-8a22-9e14-e74e91096a16	2241	Spodnji Duplek
00050000-564c-8a22-12ff-08cb230512da	9245	Spodnji Ivanjci
00050000-564c-8a22-5238-3bc7d659522b	2277	Središče ob Dravi
00050000-564c-8a22-799c-04fe0eb42c42	4267	Srednja vas v Bohinju
00050000-564c-8a22-b28d-d13278bf6a79	8256	Sromlje 
00050000-564c-8a22-0006-5d9ccac89d7d	5224	Srpenica
00050000-564c-8a22-79c0-ae575ee94a81	1242	Stahovica
00050000-564c-8a22-a179-a138d36abf42	1332	Stara Cerkev
00050000-564c-8a22-7e57-3941d04011dc	8342	Stari trg ob Kolpi
00050000-564c-8a22-8dd8-dc177b4fc924	1386	Stari trg pri Ložu
00050000-564c-8a22-dfff-aa18043133ba	2205	Starše
00050000-564c-8a22-f851-c0def8ed9268	2289	Stoperce
00050000-564c-8a22-d937-13c3442dda5d	8322	Stopiče
00050000-564c-8a22-1722-2fba4bc3114a	3206	Stranice
00050000-564c-8a22-221a-30790eefedf9	8351	Straža
00050000-564c-8a22-0b71-3b03edf4a396	1313	Struge
00050000-564c-8a22-ec49-66c8d838cc26	8293	Studenec
00050000-564c-8a22-0d1c-5f4802850841	8331	Suhor
00050000-564c-8a22-f390-9d70972ffb41	2233	Sv. Ana v Slovenskih goricah
00050000-564c-8a22-d11e-14f493ecae18	2235	Sv. Trojica v Slovenskih goricah
00050000-564c-8a22-2f85-ffb07f7411f6	2353	Sveti Duh na Ostrem Vrhu
00050000-564c-8a22-fb4a-bc0e7b63f75b	9244	Sveti Jurij ob Ščavnici
00050000-564c-8a22-50e1-c8494d52520f	3264	Sveti Štefan
00050000-564c-8a22-efb5-535caf536f93	2258	Sveti Tomaž
00050000-564c-8a22-1cd0-1d646ade6ba5	9204	Šalovci
00050000-564c-8a22-017b-5fe9bcc6b3db	5261	Šempas
00050000-564c-8a22-7507-ba95d0c266eb	5290	Šempeter pri Gorici
00050000-564c-8a22-9395-02c2935ff788	3311	Šempeter v Savinjski dolini
00050000-564c-8a22-739f-dec999614985	4208	Šenčur
00050000-564c-8a22-b57c-930f07e91007	2212	Šentilj v Slovenskih goricah
00050000-564c-8a22-043b-7d56e7345dee	8297	Šentjanž
00050000-564c-8a22-04d2-c9eaec40957b	2373	Šentjanž pri Dravogradu
00050000-564c-8a22-5b41-5707e712a2c5	8310	Šentjernej
00050000-564c-8a22-ebef-fc1250ec9e09	3230	Šentjur
00050000-564c-8a22-34e6-1e66354ff6c3	3271	Šentrupert
00050000-564c-8a22-0c2d-0c6d61aeda9b	8232	Šentrupert
00050000-564c-8a22-fe9e-f1e2f5fa2e07	1296	Šentvid pri Stični
00050000-564c-8a22-ef3c-22c907d4ed36	8275	Škocjan
00050000-564c-8a22-3689-d3c337a188cb	6281	Škofije
00050000-564c-8a22-026e-f48df8709da6	4220	Škofja Loka
00050000-564c-8a22-b6e3-fa12f5404ac2	3211	Škofja vas
00050000-564c-8a22-e38e-68c79e517a5a	1291	Škofljica
00050000-564c-8a22-bd82-7285d390a390	6274	Šmarje
00050000-564c-8a22-9ed6-ebc523e5e6b2	1293	Šmarje - Sap
00050000-564c-8a22-5998-649e14d9f43e	3240	Šmarje pri Jelšah
00050000-564c-8a22-4020-8b6f30eb6a5c	8220	Šmarješke Toplice
00050000-564c-8a22-d26d-930e9b6f9733	2315	Šmartno na Pohorju
00050000-564c-8a22-0676-c4a0905269e7	3341	Šmartno ob Dreti
00050000-564c-8a22-847e-f094145c23b8	3327	Šmartno ob Paki
00050000-564c-8a22-9299-5ba68f270728	1275	Šmartno pri Litiji
00050000-564c-8a22-79f5-db049589d90c	2383	Šmartno pri Slovenj Gradcu
00050000-564c-8a22-610d-c3a95f6a2aaa	3201	Šmartno v Rožni dolini
00050000-564c-8a22-a997-33c4e1421d8e	3325	Šoštanj
00050000-564c-8a22-9e4d-04d535f06037	6222	Štanjel
00050000-564c-8a22-58fe-3ffbff1e262d	3220	Štore
00050000-564c-8a22-afe9-e525f9ca477f	3304	Tabor
00050000-564c-8a22-a9da-bac2c8f5db67	3221	Teharje
00050000-564c-8a22-89aa-af589e9caa68	9251	Tišina
00050000-564c-8a22-566d-87b87e1676c1	5220	Tolmin
00050000-564c-8a22-9f7f-4679b5b11310	3326	Topolšica
00050000-564c-8a22-2e06-641e63e4f80d	2371	Trbonje
00050000-564c-8a22-262f-f7f97bb0bed1	1420	Trbovlje
00050000-564c-8a22-291d-886cff0c8f5a	8231	Trebelno 
00050000-564c-8a22-6e79-0b818fed3db0	8210	Trebnje
00050000-564c-8a22-9f3e-92b8427e0394	5252	Trnovo pri Gorici
00050000-564c-8a22-5f39-f4c13a0d66a1	2254	Trnovska vas
00050000-564c-8a22-e43b-716fd5d844e0	1222	Trojane
00050000-564c-8a22-3074-8b709b392c74	1236	Trzin
00050000-564c-8a22-6438-0ccc96d67fae	4290	Tržič
00050000-564c-8a22-8823-2176c2542822	8295	Tržišče
00050000-564c-8a22-0356-5468756e1949	1311	Turjak
00050000-564c-8a22-d364-1370bb19b563	9224	Turnišče
00050000-564c-8a22-4d6f-6f145fdfdb6f	8323	Uršna sela
00050000-564c-8a22-22f9-3508488cd639	1252	Vače
00050000-564c-8a22-4c72-4e047aed5af8	3320	Velenje 
00050000-564c-8a22-b048-b39f1de2dd28	3322	Velenje - poštni predali
00050000-564c-8a22-19c3-536356638d06	8212	Velika Loka
00050000-564c-8a22-661b-bdedb8ce4cc5	2274	Velika Nedelja
00050000-564c-8a22-3d45-1b981a16e6b3	9225	Velika Polana
00050000-564c-8a22-8626-574373c235f7	1315	Velike Lašče
00050000-564c-8a22-b406-14ca5239b697	8213	Veliki Gaber
00050000-564c-8a22-b509-1b2e69ba4e6c	9241	Veržej
00050000-564c-8a22-9382-7b6a72cc10ee	1312	Videm - Dobrepolje
00050000-564c-8a22-c268-3768fd461579	2284	Videm pri Ptuju
00050000-564c-8a22-6020-23081216560c	8344	Vinica
00050000-564c-8a22-9e9d-7be42449ed80	5271	Vipava
00050000-564c-8a22-9e76-a7a0a0338404	4212	Visoko
00050000-564c-8a22-c9c9-b1607c3a5d4a	1294	Višnja Gora
00050000-564c-8a22-1668-83f01aae232f	3205	Vitanje
00050000-564c-8a22-136b-cca00cb9cbd0	2255	Vitomarci
00050000-564c-8a22-2275-eaa05feb1b87	1217	Vodice
00050000-564c-8a22-fe40-2fb92955d631	3212	Vojnik\t
00050000-564c-8a22-fb0f-576d99aa3ebb	5293	Volčja Draga
00050000-564c-8a22-a066-b91159fdb1be	2232	Voličina
00050000-564c-8a22-fca9-cc52ec596356	3305	Vransko
00050000-564c-8a22-cf60-c06de567366a	6217	Vremski Britof
00050000-564c-8a22-49ea-f4a81ca294dc	1360	Vrhnika
00050000-564c-8a22-16c6-afcda1075618	2365	Vuhred
00050000-564c-8a22-d97b-ae770aff9806	2367	Vuzenica
00050000-564c-8a22-955f-54edf1dfb042	8292	Zabukovje 
00050000-564c-8a22-6b58-19e00a1f04c1	1410	Zagorje ob Savi
00050000-564c-8a22-d4de-c912f751e752	1303	Zagradec
00050000-564c-8a22-8fb8-e2dd86ec36d6	2283	Zavrč
00050000-564c-8a22-4a04-dfcd4884ef85	8272	Zdole 
00050000-564c-8a22-e46a-baded4a9cb23	4201	Zgornja Besnica
00050000-564c-8a22-391c-1bd36db9fe1e	2242	Zgornja Korena
00050000-564c-8a22-ad24-e39dd7c06098	2201	Zgornja Kungota
00050000-564c-8a22-75b0-5cd8c47133c8	2316	Zgornja Ložnica
00050000-564c-8a22-10fc-8779a3340fc2	2314	Zgornja Polskava
00050000-564c-8a22-b2d1-b72ecb3c56f4	2213	Zgornja Velka
00050000-564c-8a22-a04f-16bbee28174e	4247	Zgornje Gorje
00050000-564c-8a22-de50-f232a06d1880	4206	Zgornje Jezersko
00050000-564c-8a22-5114-adc91398726d	2285	Zgornji Leskovec
00050000-564c-8a22-9147-b71bf69fbb31	1432	Zidani Most
00050000-564c-8a22-97c9-09741e6f6789	3214	Zreče
00050000-564c-8a22-9e80-5c03e931d542	4209	Žabnica
00050000-564c-8a22-ff1f-549dfcfe0c30	3310	Žalec
00050000-564c-8a22-e079-dc93a6bc028b	4228	Železniki
00050000-564c-8a22-e68d-539440283f0e	2287	Žetale
00050000-564c-8a22-1307-acdd9378ec58	4226	Žiri
00050000-564c-8a22-8cd0-94ffcd0812c6	4274	Žirovnica
00050000-564c-8a22-5440-46180f98e071	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 28320485)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 28320061)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 28319809)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564c-8a25-fa25-56e1f0d1cad1	00080000-564c-8a25-94f9-95796c3cf9c2	\N	00040000-564c-8a23-68dc-178fc90f894b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564c-8a25-e57f-01ac3eaea30f	00080000-564c-8a25-94f9-95796c3cf9c2	\N	00040000-564c-8a23-68dc-178fc90f894b	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564c-8a25-1174-12fc7721e261	00080000-564c-8a25-572b-aabbc5a34f2b	\N	00040000-564c-8a23-68dc-178fc90f894b	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 28319953)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564c-8a23-6ba4-aae5bdcefdc5	novo leto	1	1	\N	t
00430000-564c-8a23-435e-e718d38f8529	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564c-8a23-ecf2-762a0076f3a1	dan upora proti okupatorju	27	4	\N	t
00430000-564c-8a23-d41c-56814812052e	praznik dela	1	5	\N	t
00430000-564c-8a23-5ce2-4ebcba53aa87	praznik dela	2	5	\N	t
00430000-564c-8a23-1996-288a0c289443	dan Primoža Trubarja	8	6	\N	f
00430000-564c-8a23-7f62-6288b18b85f1	dan državnosti	25	6	\N	t
00430000-564c-8a23-4ca2-8f684961e7b2	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564c-8a23-9764-c3a600ee0f68	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564c-8a23-987e-ad23bbdacb57	dan suverenosti	25	10	\N	f
00430000-564c-8a23-c214-b546f8bcbc48	dan spomina na mrtve	1	11	\N	t
00430000-564c-8a23-114e-07634c7d262b	dan Rudolfa Maistra	23	11	\N	f
00430000-564c-8a23-ede1-e0cb4ff6999c	božič	25	12	\N	t
00430000-564c-8a23-841f-9ea688b8fbf2	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564c-8a23-bb1f-0e640b04cccc	Marijino vnebovzetje	15	8	\N	t
00430000-564c-8a23-7e72-f8a6f7faa37b	dan reformacije	31	10	\N	t
00430000-564c-8a23-f928-d6e4b3197d91	velikonočna nedelja	27	3	2016	t
00430000-564c-8a23-67a0-93501acf5e7f	velikonočna nedelja	16	4	2017	t
00430000-564c-8a23-68a7-2d5768a836d7	velikonočna nedelja	1	4	2018	t
00430000-564c-8a23-d2bf-8e66cc3d580e	velikonočna nedelja	21	4	2019	t
00430000-564c-8a23-8208-a00dfcc7b139	velikonočna nedelja	12	4	2020	t
00430000-564c-8a23-726e-58bcfc9c649d	velikonočna nedelja	4	4	2021	t
00430000-564c-8a23-1665-88832c90dfe9	velikonočna nedelja	17	4	2022	t
00430000-564c-8a23-617b-5f418742f2c5	velikonočna nedelja	9	4	2023	t
00430000-564c-8a23-c550-6d444e2a8d58	velikonočna nedelja	31	3	2024	t
00430000-564c-8a23-4f61-02d66c68b7bc	velikonočna nedelja	20	4	2025	t
00430000-564c-8a23-61fa-1333f689d790	velikonočna nedelja	5	4	2026	t
00430000-564c-8a23-6fae-9603bdeac718	velikonočna nedelja	28	3	2027	t
00430000-564c-8a23-6c54-11d0af19e058	velikonočna nedelja	16	4	2028	t
00430000-564c-8a23-5725-968e19da2b62	velikonočna nedelja	1	4	2029	t
00430000-564c-8a23-5637-0d1014eb4d47	velikonočna nedelja	21	4	2030	t
00430000-564c-8a23-2c98-f7a7649919c3	velikonočni ponedeljek	28	3	2016	t
00430000-564c-8a23-e799-e2f4934cf61d	velikonočni ponedeljek	17	4	2017	t
00430000-564c-8a23-cf02-fa5e0333120b	velikonočni ponedeljek	2	4	2018	t
00430000-564c-8a23-b101-3e0e75836693	velikonočni ponedeljek	22	4	2019	t
00430000-564c-8a23-0406-0585b05dbac5	velikonočni ponedeljek	13	4	2020	t
00430000-564c-8a23-7c35-2d8fe19005c4	velikonočni ponedeljek	5	4	2021	t
00430000-564c-8a23-9024-10e12aaaa123	velikonočni ponedeljek	18	4	2022	t
00430000-564c-8a23-dbda-3afb50481577	velikonočni ponedeljek	10	4	2023	t
00430000-564c-8a23-4d16-6ccf78ea359d	velikonočni ponedeljek	1	4	2024	t
00430000-564c-8a23-97d0-70a91c983737	velikonočni ponedeljek	21	4	2025	t
00430000-564c-8a23-cb06-4d906fe47378	velikonočni ponedeljek	6	4	2026	t
00430000-564c-8a23-1c36-1e76f526bf31	velikonočni ponedeljek	29	3	2027	t
00430000-564c-8a23-b7cd-f3d416b12ecd	velikonočni ponedeljek	17	4	2028	t
00430000-564c-8a23-333d-a76d45f09c6d	velikonočni ponedeljek	2	4	2029	t
00430000-564c-8a23-b34a-4817221bcb96	velikonočni ponedeljek	22	4	2030	t
00430000-564c-8a23-ee60-d6bbcc6cc98f	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564c-8a23-f2b1-5aa7fcb691c1	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564c-8a23-ffc7-5eb7c501aef1	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564c-8a23-8180-4c3dd08c64f8	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564c-8a23-7ce6-9d562a6f2be1	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564c-8a23-9505-83b03cc35e97	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564c-8a23-caa7-4e8a6e7197fa	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564c-8a23-48e2-eafaa65a8e35	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564c-8a23-e452-96594aac65f4	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564c-8a23-4fdf-167503860e4a	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564c-8a23-eed2-595024140e63	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564c-8a23-236e-a0d69cedfba4	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564c-8a23-1f42-c8b751a97251	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564c-8a23-5ff4-8f983eeb24ce	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564c-8a23-53fd-b17c5b421a54	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 28319913)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 28319925)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 28320073)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 28320499)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 28320509)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564c-8a25-28e6-52c2dbcb56de	00080000-564c-8a25-cecd-27af4f40a71f	0987	AK
00190000-564c-8a25-fdd6-a9b197ce02c3	00080000-564c-8a25-572b-aabbc5a34f2b	0989	AK
00190000-564c-8a25-e655-a338f5c828af	00080000-564c-8a25-62e9-f7cc6f3e0ed6	0986	AK
00190000-564c-8a25-7eb3-9e0077a4a4a6	00080000-564c-8a25-64c6-cec5eb23a9bf	0984	AK
00190000-564c-8a25-afb0-917483b71bb5	00080000-564c-8a25-ac6b-1a7687e991d7	0983	AK
00190000-564c-8a25-195d-f83d9c681a19	00080000-564c-8a25-2790-dd250b7d3523	0982	AK
00190000-564c-8a27-dcfa-b67dd66a8bce	00080000-564c-8a27-3f35-75d8ab5b2282	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 28320408)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564c-8a25-2cc4-00b02f7ca8e8	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 28320517)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 28320102)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564c-8a25-c226-8a0b96efca6e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564c-8a25-04b7-3b7829f6d022	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564c-8a25-b145-a52d3ae346f0	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564c-8a25-af4c-73e0b1d04369	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564c-8a25-44ab-d5c76bdce6f6	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564c-8a25-1413-9115c4b095fd	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564c-8a25-0cd5-5893d0a8eff9	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 28320046)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 28320036)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 28320247)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 28320177)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 28319887)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 28319649)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564c-8a27-3f35-75d8ab5b2282	00010000-564c-8a23-9b69-39700ba149ac	2015-11-18 15:24:39	INS	a:0:{}
2	App\\Entity\\Option	00000000-564c-8a27-d2c4-649ccf08ad6e	00010000-564c-8a23-9b69-39700ba149ac	2015-11-18 15:24:39	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564c-8a27-dcfa-b67dd66a8bce	00010000-564c-8a23-9b69-39700ba149ac	2015-11-18 15:24:39	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 28320115)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 28319687)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564c-8a23-a5e6-bf7cb6102311	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564c-8a23-abeb-2b444e09b334	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564c-8a23-2a8d-1dc1793412af	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564c-8a23-232c-da574f7e6193	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564c-8a23-e7f0-56cf089dc6b4	planer	Planer dogodkov v koledarju	t
00020000-564c-8a23-854f-571bf47fdbd4	kadrovska	Kadrovska služba	t
00020000-564c-8a23-ebaf-ffce21a71d30	arhivar	Ažuriranje arhivalij	t
00020000-564c-8a23-584c-976ba7f81d1d	igralec	Igralec	t
00020000-564c-8a23-295d-c7270a97c2fd	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564c-8a25-d8ac-847f61a30f98	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564c-8a25-5904-b9399e8e2db3	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-5110-d5511c953a9d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-4d6c-8dc8a4bf04d1	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-38de-b7f5dc7f91a1	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-9052-601031e7484f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-3324-a77827f19473	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-e460-7323f3e3ca31	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-3888-e997e2f86672	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-7685-ded00f648f11	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-0a0d-a70fb085db58	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-af14-c4b9a38be03c	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-a4c3-1fee4caab6e8	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-02f2-b2d26081b320	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-fa49-9cc1e9f99701	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-0c09-66d38dbb1d00	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564c-8a25-c95c-a5e541c60144	Datoteka-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 28319671)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564c-8a23-03a0-3ff018be06e2	00020000-564c-8a23-2a8d-1dc1793412af
00010000-564c-8a23-9b69-39700ba149ac	00020000-564c-8a23-2a8d-1dc1793412af
00010000-564c-8a25-812a-e220bb883212	00020000-564c-8a25-d8ac-847f61a30f98
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-5904-b9399e8e2db3
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-9052-601031e7484f
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-7685-ded00f648f11
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-af14-c4b9a38be03c
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-fa49-9cc1e9f99701
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-c95c-a5e541c60144
00010000-564c-8a25-3e99-f7ada3bcbaa2	00020000-564c-8a25-4d6c-8dc8a4bf04d1
00010000-564c-8a25-c905-ffb56ce8b6a3	00020000-564c-8a25-5904-b9399e8e2db3
00010000-564c-8a25-c905-ffb56ce8b6a3	00020000-564c-8a25-5110-d5511c953a9d
00010000-564c-8a25-c905-ffb56ce8b6a3	00020000-564c-8a25-4d6c-8dc8a4bf04d1
00010000-564c-8a25-c905-ffb56ce8b6a3	00020000-564c-8a25-38de-b7f5dc7f91a1
00010000-564c-8a25-dd11-380e9368a071	00020000-564c-8a25-5904-b9399e8e2db3
00010000-564c-8a25-dd11-380e9368a071	00020000-564c-8a25-5110-d5511c953a9d
00010000-564c-8a25-dd11-380e9368a071	00020000-564c-8a25-4d6c-8dc8a4bf04d1
00010000-564c-8a25-dd11-380e9368a071	00020000-564c-8a25-38de-b7f5dc7f91a1
00010000-564c-8a25-dd11-380e9368a071	00020000-564c-8a25-af14-c4b9a38be03c
00010000-564c-8a25-22ed-47bae1adef4d	00020000-564c-8a25-5110-d5511c953a9d
00010000-564c-8a25-22ed-47bae1adef4d	00020000-564c-8a25-3324-a77827f19473
00010000-564c-8a25-22ed-47bae1adef4d	00020000-564c-8a25-0a0d-a70fb085db58
00010000-564c-8a25-22ed-47bae1adef4d	00020000-564c-8a25-a4c3-1fee4caab6e8
00010000-564c-8a25-22ed-47bae1adef4d	00020000-564c-8a25-af14-c4b9a38be03c
00010000-564c-8a25-22ed-47bae1adef4d	00020000-564c-8a25-0c09-66d38dbb1d00
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-5110-d5511c953a9d
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-3324-a77827f19473
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-3888-e997e2f86672
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-0a0d-a70fb085db58
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-a4c3-1fee4caab6e8
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-af14-c4b9a38be03c
00010000-564c-8a25-55a5-07502f7c8c7a	00020000-564c-8a25-0c09-66d38dbb1d00
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-5110-d5511c953a9d
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-4d6c-8dc8a4bf04d1
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-3324-a77827f19473
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-e460-7323f3e3ca31
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-3888-e997e2f86672
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-9052-601031e7484f
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-0a0d-a70fb085db58
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-a4c3-1fee4caab6e8
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-af14-c4b9a38be03c
00010000-564c-8a25-3668-b341954b9eb7	00020000-564c-8a25-0c09-66d38dbb1d00
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-5904-b9399e8e2db3
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-38de-b7f5dc7f91a1
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-9052-601031e7484f
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-7685-ded00f648f11
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-af14-c4b9a38be03c
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-fa49-9cc1e9f99701
00010000-564c-8a25-e103-5da330bc0d41	00020000-564c-8a25-c95c-a5e541c60144
\.


--
-- TOC entry 3144 (class 0 OID 28320129)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 28320067)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 28320013)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564c-8a25-f6b2-23e451062375	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564c-8a25-a304-170123efddff	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564c-8a25-46ca-e9948b69eec5	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 28319636)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564c-8a22-68a5-c38b50f68441	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564c-8a22-c8c0-63192d2f9323	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564c-8a22-3b16-94a3217b85e4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564c-8a22-8c2c-b6a5748a9b25	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564c-8a22-904c-9bb77ee79ff6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 28319628)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564c-8a22-772f-415d0aadf857	00230000-564c-8a22-8c2c-b6a5748a9b25	popa
00240000-564c-8a22-c140-1cb5b2afda09	00230000-564c-8a22-8c2c-b6a5748a9b25	oseba
00240000-564c-8a22-4e0a-e8133be0f598	00230000-564c-8a22-8c2c-b6a5748a9b25	tippopa
00240000-564c-8a22-e949-18638ae2ab54	00230000-564c-8a22-8c2c-b6a5748a9b25	organizacijskaenota
00240000-564c-8a22-9008-288e252e9a76	00230000-564c-8a22-8c2c-b6a5748a9b25	sezona
00240000-564c-8a22-6af3-72438be75db2	00230000-564c-8a22-8c2c-b6a5748a9b25	tipvaje
00240000-564c-8a22-a1b1-a6739e99e081	00230000-564c-8a22-c8c0-63192d2f9323	prostor
00240000-564c-8a22-26fe-2060a7a2a079	00230000-564c-8a22-8c2c-b6a5748a9b25	besedilo
00240000-564c-8a22-0682-70e70702be14	00230000-564c-8a22-8c2c-b6a5748a9b25	uprizoritev
00240000-564c-8a22-dd60-7fa89a9bd7e8	00230000-564c-8a22-8c2c-b6a5748a9b25	funkcija
00240000-564c-8a22-b664-f2f03b158693	00230000-564c-8a22-8c2c-b6a5748a9b25	tipfunkcije
00240000-564c-8a22-0387-6ea6529ebbf2	00230000-564c-8a22-8c2c-b6a5748a9b25	alternacija
00240000-564c-8a22-6db0-c83386ca1eaa	00230000-564c-8a22-68a5-c38b50f68441	pogodba
00240000-564c-8a22-bd8a-6cf72060e903	00230000-564c-8a22-8c2c-b6a5748a9b25	zaposlitev
00240000-564c-8a22-980e-55a4958ecd07	00230000-564c-8a22-8c2c-b6a5748a9b25	zvrstuprizoritve
00240000-564c-8a22-a644-3d1463190deb	00230000-564c-8a22-68a5-c38b50f68441	programdela
00240000-564c-8a22-cbbf-4a8748cc7854	00230000-564c-8a22-8c2c-b6a5748a9b25	zapis
\.


--
-- TOC entry 3093 (class 0 OID 28319623)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e95e29dd-98cf-4c16-b348-bac778e961a0	00240000-564c-8a22-772f-415d0aadf857	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 28320194)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564c-8a25-ac1d-b15366c0dc50	000e0000-564c-8a25-45e0-94709649b863	00080000-564c-8a25-94f9-95796c3cf9c2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564c-8a23-efe0-3f19bb0f29c2
00270000-564c-8a25-5228-168ba36a0268	000e0000-564c-8a25-45e0-94709649b863	00080000-564c-8a25-94f9-95796c3cf9c2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564c-8a23-efe0-3f19bb0f29c2
\.


--
-- TOC entry 3109 (class 0 OID 28319771)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 28320023)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564c-8a25-14ad-9a2ab3dbc7db	00180000-564c-8a25-24b0-3fe6a1f0e837	000c0000-564c-8a25-fcfb-f09c86ad9dc1	00090000-564c-8a25-de33-63526d5d4bf5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-8a25-75cf-cd07f72e7d90	00180000-564c-8a25-24b0-3fe6a1f0e837	000c0000-564c-8a25-f868-52d28df62a39	00090000-564c-8a25-7242-1037aeb6d763	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-8a25-c5f9-76f37b58a6ff	00180000-564c-8a25-24b0-3fe6a1f0e837	000c0000-564c-8a25-b1b3-da3fdfdcceef	00090000-564c-8a25-58a4-bca99d773516	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-8a25-4e21-28be3130c2f3	00180000-564c-8a25-24b0-3fe6a1f0e837	000c0000-564c-8a25-d5e1-bd633b32499b	00090000-564c-8a25-e31d-77b5f2ca7d64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-8a25-96e9-e0bd0e3c2f59	00180000-564c-8a25-24b0-3fe6a1f0e837	000c0000-564c-8a25-28cc-06a5e0a68b9e	00090000-564c-8a25-0652-0866d78798f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-8a25-3c0d-8c2361be9c4f	00180000-564c-8a25-6fad-23a6618cd8cb	\N	00090000-564c-8a25-0652-0866d78798f0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564c-8a25-140e-b164e56b1b70	00180000-564c-8a25-6fad-23a6618cd8cb	\N	00090000-564c-8a25-7242-1037aeb6d763	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 28320235)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564c-8a22-79bd-4cab5eed3f1b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564c-8a22-6cff-2cc4a2c79bd6	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564c-8a22-8dff-f371ebdc334f	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564c-8a22-002a-2a864fe95ce5	04	Režija	Režija	Režija	umetnik	30
000f0000-564c-8a22-5704-93d049eed190	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564c-8a22-9b83-9f349ac4447a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564c-8a22-0329-25dc61898a70	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564c-8a22-50e3-6f090dcf6066	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564c-8a22-1ca9-7d4ba996dc20	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564c-8a22-b315-5a78fc074e13	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564c-8a22-562c-c42ff0fce7f6	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564c-8a22-a52a-d99fdbc52321	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564c-8a22-8cc2-ac6d6ebf4543	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564c-8a22-7d70-3292a7275f96	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564c-8a22-0250-40c35c1d79fe	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564c-8a22-f6f2-8718ad9b8c75	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564c-8a22-dfd4-30cfd3d9ce90	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564c-8a22-51e1-992b4aa30bf9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 28319722)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564c-8a25-7495-cbe09b03d87b	0001	šola	osnovna ali srednja šola
00400000-564c-8a25-6850-496c01141f7d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564c-8a25-d5e7-5405033967e2	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 28320528)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564c-8a22-1d5c-0d2b008b489e	01	Velika predstava	f	1.00	1.00
002b0000-564c-8a22-dfe4-508b7e902856	02	Mala predstava	f	0.50	0.50
002b0000-564c-8a22-193f-f482f19c5288	03	Mala koprodukcija	t	0.40	1.00
002b0000-564c-8a22-6bf7-a62ccfc9bb45	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564c-8a22-73d6-f73eccc1dbf7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 28320003)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564c-8a22-d0de-5c9d27d7a841	0001	prva vaja	prva vaja
00420000-564c-8a22-a5d4-301267b5770f	0002	tehnična vaja	tehnična vaja
00420000-564c-8a22-dd53-9de5b99225f3	0003	lučna vaja	lučna vaja
00420000-564c-8a22-cf50-5d958beffa88	0004	kostumska vaja	kostumska vaja
00420000-564c-8a22-b500-e9da0931df56	0005	foto vaja	foto vaja
00420000-564c-8a22-28d8-6a1554e4180b	0006	1. glavna vaja	1. glavna vaja
00420000-564c-8a22-fcd8-6740ab9bac16	0007	2. glavna vaja	2. glavna vaja
00420000-564c-8a22-e0a3-5e0c7eb9689e	0008	1. generalka	1. generalka
00420000-564c-8a22-5758-9e882460cd8d	0009	2. generalka	2. generalka
00420000-564c-8a22-3f14-1edf28fac639	0010	odprta generalka	odprta generalka
00420000-564c-8a22-53c9-63cf68627624	0011	obnovitvena vaja	obnovitvena vaja
00420000-564c-8a22-a23a-9ae9bb7f35d6	0012	pevska vaja	pevska vaja
00420000-564c-8a22-eb45-0a5fa5a29aca	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564c-8a22-a7c2-4aa464305f27	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 28319844)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 28319658)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564c-8a23-9b69-39700ba149ac	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROLO8CZdMcDII.66bhgR6Q5yo9iSPGVvy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564c-8a25-aeda-e82ea6b5ea1b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564c-8a25-3cd9-3b5ac2c04aff	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564c-8a25-ab89-01e5a466ce50	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564c-8a25-d04d-666912c1bd74	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564c-8a25-8b84-d48f09c296b8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564c-8a25-1aa9-33040b6ad92c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564c-8a25-ab66-17ab7ea5fd62	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564c-8a25-39c3-494f5a50145c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564c-8a25-8b94-d11d6b412d34	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564c-8a25-812a-e220bb883212	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564c-8a25-0962-ca0c0a47c2b9	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564c-8a25-3e99-f7ada3bcbaa2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564c-8a25-c905-ffb56ce8b6a3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-564c-8a25-dd11-380e9368a071	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-564c-8a25-22ed-47bae1adef4d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564c-8a25-55a5-07502f7c8c7a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564c-8a25-3668-b341954b9eb7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564c-8a25-e103-5da330bc0d41	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564c-8a23-03a0-3ff018be06e2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 28320285)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564c-8a25-6aa5-c5d10329f520	00160000-564c-8a25-cc22-8cb7b1184da0	\N	00140000-564c-8a22-c1f8-2e3eea34372d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564c-8a25-44ab-d5c76bdce6f6
000e0000-564c-8a25-45e0-94709649b863	00160000-564c-8a25-feb7-902084ec11ed	\N	00140000-564c-8a22-1ff2-2014c58e6ec0	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564c-8a25-1413-9115c4b095fd
000e0000-564c-8a25-35ab-01f100dd45c1	\N	\N	00140000-564c-8a22-1ff2-2014c58e6ec0	00190000-564c-8a25-28e6-52c2dbcb56de	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564c-8a25-44ab-d5c76bdce6f6
000e0000-564c-8a25-9d8c-5ab0cca46c31	\N	\N	00140000-564c-8a22-1ff2-2014c58e6ec0	00190000-564c-8a25-28e6-52c2dbcb56de	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564c-8a25-44ab-d5c76bdce6f6
000e0000-564c-8a25-2d31-e8a41cf15d5b	\N	\N	00140000-564c-8a22-1ff2-2014c58e6ec0	00190000-564c-8a25-28e6-52c2dbcb56de	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564c-8a25-c226-8a0b96efca6e
000e0000-564c-8a25-723b-7f1860bc9ad0	\N	\N	00140000-564c-8a22-1ff2-2014c58e6ec0	00190000-564c-8a25-28e6-52c2dbcb56de	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564c-8a25-c226-8a0b96efca6e
\.


--
-- TOC entry 3123 (class 0 OID 28319943)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564c-8a25-1270-95f732771357	\N	000e0000-564c-8a25-45e0-94709649b863	1	
00200000-564c-8a25-ccfd-6bf0bd76d598	\N	000e0000-564c-8a25-45e0-94709649b863	2	
00200000-564c-8a25-8a50-739671bb9c1f	\N	000e0000-564c-8a25-45e0-94709649b863	3	
00200000-564c-8a25-f04e-001b00e73d6b	\N	000e0000-564c-8a25-45e0-94709649b863	4	
00200000-564c-8a25-102f-128c732b7faf	\N	000e0000-564c-8a25-45e0-94709649b863	5	
\.


--
-- TOC entry 3140 (class 0 OID 28320094)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 28320208)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564c-8a23-bbff-e23d7b9c19cc	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564c-8a23-f89e-572af9d730ff	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564c-8a23-13c6-7eed0afb1ca7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564c-8a23-1e89-2170bf86c87a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564c-8a23-578a-acfdcaaccf45	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564c-8a23-edbf-838e8150c5c4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564c-8a23-3e6d-63deb74e8700	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564c-8a23-32a9-98c1e23b4448	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564c-8a23-efe0-3f19bb0f29c2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564c-8a23-e52b-82547c1b5eb9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564c-8a23-f706-70191ab025c7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564c-8a23-8915-b0ba533a97a9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564c-8a23-8ed9-7ed0870b792a	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564c-8a23-3179-6120cb962904	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564c-8a23-5f89-079355b94fdf	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564c-8a23-c63c-adafd56e6f1d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564c-8a23-87f5-b12cdccd0427	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564c-8a23-42ee-038fa04560ef	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564c-8a23-696b-c888d2c0b1b7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564c-8a23-9684-843ca9c7f73e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564c-8a23-9e26-408c3f42a4dc	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564c-8a23-43c3-0e621a9dac9e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564c-8a23-9a57-91b699edf4c6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564c-8a23-d291-98a0a17f63e3	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564c-8a23-5db6-a47b83f035d1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564c-8a23-5d2c-507881e4f73d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564c-8a23-570a-85ec735b53ed	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564c-8a23-baec-deeaf40aab79	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 28320578)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 28320547)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 28320590)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 28320166)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564c-8a25-6509-6ba0a20f2693	00090000-564c-8a25-7242-1037aeb6d763	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-8a25-5c69-4e370a1a0e3e	00090000-564c-8a25-58a4-bca99d773516	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-8a25-b1f3-0ca9ab180af8	00090000-564c-8a25-4779-5540e6ca23dc	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-8a25-f64d-08e0d2682a2b	00090000-564c-8a25-d8fe-dd3092e1c407	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-8a25-3b90-bf13760f8041	00090000-564c-8a25-5e03-fe8a7f6ba1f9	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-8a25-5190-9d2e9d2495d7	00090000-564c-8a25-2127-dc92a9ca18bb	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 28319987)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 28320275)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564c-8a22-c1f8-2e3eea34372d	01	Drama	drama (SURS 01)
00140000-564c-8a22-6701-5717288ec7d1	02	Opera	opera (SURS 02)
00140000-564c-8a22-af4f-a92bf4a84c0e	03	Balet	balet (SURS 03)
00140000-564c-8a22-e276-6e8c7cf0e7b3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564c-8a22-0191-99884b05a18e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564c-8a22-1ff2-2014c58e6ec0	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564c-8a22-e42f-c448c8d14153	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 28320156)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 28319721)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 28320334)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 28320324)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 28319712)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 28320191)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 28320233)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 28320631)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 28319975)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 28319997)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 28320002)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 28320545)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 28319870)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 28320402)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 28320152)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 28319941)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 28319908)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 28319884)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 28320059)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 28320608)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 28320615)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 28320639)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2726 (class 2606 OID 28320086)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 28319842)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 28319740)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 28319804)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 28319767)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 28319701)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 28319686)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 28320092)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 28320128)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 28320270)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 28319795)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 28319830)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 28320497)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 28320065)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 28319820)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 28319960)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 28319929)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 28319921)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 28320077)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 28320506)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 28320514)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 28320484)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 28320526)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 28320110)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 28320050)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 28320041)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 28320257)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 28320184)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 28319896)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 28319657)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 28320119)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 28319675)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 28319695)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 28320137)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 28320072)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 28320021)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 28319645)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 28319633)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 28319627)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 28320204)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 28319776)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 28320032)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 28320244)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 28319729)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 28320538)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 28320010)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 28319855)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 28319670)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 28320303)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 28319950)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 28320100)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 28320216)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 28320588)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 28320572)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 28320596)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 28320174)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 28319991)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 28320283)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 28320164)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 28319985)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 28319986)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 28319984)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 28319983)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 28319982)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 28320205)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 28320206)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 28320207)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 28320610)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 28320609)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 28319797)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 28319798)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 28320093)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 28320576)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 28320575)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 28320577)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 28320574)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 28320573)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 28320079)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 28320078)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 28319951)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 28319952)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 28320153)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 28320155)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 28320154)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 28319886)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 28319885)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 28320527)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 28320272)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 28320273)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 28320274)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 28320597)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 28320308)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 28320305)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 28320309)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 28320307)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 28320306)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 28319857)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 28319856)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 28319770)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 28320120)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 28319702)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 28319703)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 28320140)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 28320139)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 28320138)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 28319807)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 28319806)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 28319808)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 28319924)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 28319922)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 28319923)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 28319635)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 28320045)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 28320043)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 28320042)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 28320044)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 28319676)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 28319677)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 28320101)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 28320632)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 28320193)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 28320192)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 28320640)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 28320641)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 28320066)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 28320185)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 28320186)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 28320407)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 28320406)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 28320403)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 28320404)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 28320405)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 28319822)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 28319821)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 28319823)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 28320114)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 28320113)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 28320507)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 28320508)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 28320338)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 28320339)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 28320336)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 28320337)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 28320175)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 28320176)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 28320054)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 28320053)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 28320051)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 28320052)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 28320326)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 28320325)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 28319897)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 28319911)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 28319910)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 28319909)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 28319912)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 28319942)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 28319930)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 28319931)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 28320498)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 28320546)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 28320616)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 28320617)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 28319742)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 28319741)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 28319777)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 28319778)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 28319992)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 28320035)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 28320034)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 28320033)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 28319977)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 28319978)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 28319981)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 28319976)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 28319980)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 28319979)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 28319796)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 28319730)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 28319731)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 28319871)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 28319873)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 28319872)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 28319874)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 28320060)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 28320271)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 28320304)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 28320245)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 28320246)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 28319768)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 28319769)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 28320165)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 28319646)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 28319843)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 28319805)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 28319634)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 28320539)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 28320112)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 28320111)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 28320011)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 28320012)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 28320335)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 28319831)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 28320284)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 28320589)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 28320515)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 28320516)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 28320234)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 28320022)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 28319696)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2904 (class 2606 OID 28320812)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2905 (class 2606 OID 28320817)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2910 (class 2606 OID 28320842)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2908 (class 2606 OID 28320832)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2903 (class 2606 OID 28320807)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2907 (class 2606 OID 28320827)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2909 (class 2606 OID 28320837)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 28320822)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 28321012)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 28321017)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 28321022)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 28321187)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 28321182)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 28320697)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2882 (class 2606 OID 28320702)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 28320927)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 28321167)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 28321162)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2976 (class 2606 OID 28321172)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 28321157)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 28321152)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2926 (class 2606 OID 28320922)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 28320917)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 28320797)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2902 (class 2606 OID 28320802)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 28320967)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 28320977)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 28320972)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2892 (class 2606 OID 28320752)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 28320747)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 28320907)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 28321142)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2947 (class 2606 OID 28321027)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 28321032)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 28321037)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 28321177)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 28321057)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 28321042)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2954 (class 2606 OID 28321062)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 28321052)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2951 (class 2606 OID 28321047)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2890 (class 2606 OID 28320742)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 28320737)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2878 (class 2606 OID 28320682)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 28320677)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 28320947)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 28320657)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2874 (class 2606 OID 28320662)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 28320962)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 28320957)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2932 (class 2606 OID 28320952)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 28320712)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2883 (class 2606 OID 28320707)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 28320717)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 28320777)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 28320767)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 28320772)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 28320642)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2918 (class 2606 OID 28320882)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 28320872)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2915 (class 2606 OID 28320867)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2917 (class 2606 OID 28320877)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 28320647)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 28320652)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 28320932)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 28321202)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2943 (class 2606 OID 28321007)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 28321002)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 28321207)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2984 (class 2606 OID 28321212)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 28320912)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 28320992)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2941 (class 2606 OID 28320997)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 28321117)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 28321112)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 28321097)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2962 (class 2606 OID 28321102)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 28321107)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 28320727)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 28320722)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 28320732)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 28320942)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 28320937)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 28321127)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2968 (class 2606 OID 28321132)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2959 (class 2606 OID 28321087)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2960 (class 2606 OID 28321092)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2957 (class 2606 OID 28321077)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 28321082)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 28320982)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 28320987)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 28320902)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2921 (class 2606 OID 28320897)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2919 (class 2606 OID 28320887)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 28320892)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2956 (class 2606 OID 28321072)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 28321067)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 28320757)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 28320762)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 28320792)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 28320782)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2899 (class 2606 OID 28320787)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 28321122)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 28321137)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 28321147)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 28321192)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2981 (class 2606 OID 28321197)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2876 (class 2606 OID 28320672)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 28320667)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 28320687)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2880 (class 2606 OID 28320692)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 28320847)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 28320862)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 28320857)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2912 (class 2606 OID 28320852)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-18 15:24:41 CET

--
-- PostgreSQL database dump complete
--

