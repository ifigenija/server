--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-11 15:32:38 CET

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
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 26606324)
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
-- TOC entry 237 (class 1259 OID 26606938)
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
-- TOC entry 236 (class 1259 OID 26606921)
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
-- TOC entry 182 (class 1259 OID 26606317)
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
-- TOC entry 181 (class 1259 OID 26606315)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 26606798)
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
-- TOC entry 230 (class 1259 OID 26606828)
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
-- TOC entry 251 (class 1259 OID 26607228)
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
-- TOC entry 203 (class 1259 OID 26606572)
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
-- TOC entry 205 (class 1259 OID 26606604)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 26606609)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 26607151)
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
-- TOC entry 194 (class 1259 OID 26606469)
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
-- TOC entry 238 (class 1259 OID 26606951)
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
-- TOC entry 223 (class 1259 OID 26606752)
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
-- TOC entry 200 (class 1259 OID 26606543)
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
-- TOC entry 197 (class 1259 OID 26606509)
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
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 26606486)
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
-- TOC entry 212 (class 1259 OID 26606666)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 26607209)
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
-- TOC entry 250 (class 1259 OID 26607221)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 26607243)
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
-- TOC entry 216 (class 1259 OID 26606691)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 26606443)
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
-- TOC entry 185 (class 1259 OID 26606343)
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
-- TOC entry 189 (class 1259 OID 26606410)
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
-- TOC entry 186 (class 1259 OID 26606354)
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
-- TOC entry 178 (class 1259 OID 26606289)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 26606308)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 26606698)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 26606732)
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
-- TOC entry 233 (class 1259 OID 26606869)
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
-- TOC entry 188 (class 1259 OID 26606390)
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
-- TOC entry 191 (class 1259 OID 26606435)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 26607096)
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
-- TOC entry 213 (class 1259 OID 26606672)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 26606420)
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
-- TOC entry 202 (class 1259 OID 26606564)
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
-- TOC entry 198 (class 1259 OID 26606524)
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
-- TOC entry 199 (class 1259 OID 26606536)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26606684)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 26607110)
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
-- TOC entry 242 (class 1259 OID 26607120)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 26607019)
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
-- TOC entry 243 (class 1259 OID 26607128)
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
-- TOC entry 219 (class 1259 OID 26606713)
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
-- TOC entry 211 (class 1259 OID 26606657)
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
-- TOC entry 210 (class 1259 OID 26606647)
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
-- TOC entry 232 (class 1259 OID 26606858)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 26606788)
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
-- TOC entry 196 (class 1259 OID 26606498)
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
-- TOC entry 175 (class 1259 OID 26606260)
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
-- TOC entry 174 (class 1259 OID 26606258)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 26606726)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 26606298)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 26606282)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26606740)
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
-- TOC entry 214 (class 1259 OID 26606678)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 26606624)
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
-- TOC entry 173 (class 1259 OID 26606247)
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
-- TOC entry 172 (class 1259 OID 26606239)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 26606234)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 26606805)
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
-- TOC entry 187 (class 1259 OID 26606382)
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
-- TOC entry 209 (class 1259 OID 26606634)
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
-- TOC entry 231 (class 1259 OID 26606846)
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
-- TOC entry 184 (class 1259 OID 26606333)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 26607139)
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
-- TOC entry 207 (class 1259 OID 26606614)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 26606455)
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
-- TOC entry 176 (class 1259 OID 26606269)
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
-- TOC entry 235 (class 1259 OID 26606896)
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
-- TOC entry 201 (class 1259 OID 26606554)
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
-- TOC entry 218 (class 1259 OID 26606705)
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
-- TOC entry 229 (class 1259 OID 26606819)
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
-- TOC entry 247 (class 1259 OID 26607189)
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
-- TOC entry 246 (class 1259 OID 26607158)
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
-- TOC entry 248 (class 1259 OID 26607201)
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
-- TOC entry 225 (class 1259 OID 26606777)
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
-- TOC entry 204 (class 1259 OID 26606598)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 26606886)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 26606767)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 26606320)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 26606263)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3104 (class 0 OID 26606324)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5643-5183-9fa2-c7cd9ccd5e42	10	30	Otroci	Abonma za otroke	200
000a0000-5643-5183-8658-d815b381e469	20	60	Mladina	Abonma za mladino	400
000a0000-5643-5183-73ac-563f529c4459	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3158 (class 0 OID 26606938)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5643-5183-c83f-ddbc5e5fe8d0	000d0000-5643-5183-2cce-b53a6d4aca56	\N	00090000-5643-5183-fed5-c5252b884ca2	000b0000-5643-5183-a59c-f1ae3eb2ed8f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5643-5183-4be2-7bc4c77ff7fc	000d0000-5643-5183-0f53-21dcaba5b618	00100000-5643-5183-8973-dde732d3bdf3	00090000-5643-5183-a326-8e315a63697f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5643-5183-7058-82fec57f9632	000d0000-5643-5183-c968-841bf1933f9c	00100000-5643-5183-0686-ed061b5d0198	00090000-5643-5183-ff3c-99b949a72635	\N	0003	t	\N	2015-11-11	\N	2	t	\N	f	f
000c0000-5643-5183-7f57-b4923f02ccc3	000d0000-5643-5183-0b9d-0cfdc1a9fe44	\N	00090000-5643-5183-1a0e-c228f7512fcd	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5643-5183-d9fa-a714cd581579	000d0000-5643-5183-f905-7afa9e12975a	\N	00090000-5643-5183-b8b9-61a3f855d9dd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5643-5183-56dc-40e24ecf65a8	000d0000-5643-5183-8df4-094277f9f5d9	\N	00090000-5643-5183-854a-3f6b13e84713	000b0000-5643-5183-ee98-c18914a8b94c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5643-5183-7c99-0a290f2225e2	000d0000-5643-5183-afb8-27a1b2cdbac6	00100000-5643-5183-8be5-33214da4096e	00090000-5643-5183-1a24-d40f9fe31060	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5643-5183-a911-971b8591b095	000d0000-5643-5183-32ae-f8b522920a33	\N	00090000-5643-5183-9a1c-9f89dead97bd	000b0000-5643-5183-8dbd-461ada70f4d6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5643-5183-c698-03bd986dbc3a	000d0000-5643-5183-afb8-27a1b2cdbac6	00100000-5643-5183-524a-e76a6cbe64a5	00090000-5643-5183-e14e-ef2f8a577b44	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5643-5183-096e-ccea6b7d6bdf	000d0000-5643-5183-afb8-27a1b2cdbac6	00100000-5643-5183-8648-d93979bb866d	00090000-5643-5183-fb05-c9e56a9ef78b	\N	0010	t	\N	2015-11-11	\N	16	f	\N	f	t
000c0000-5643-5183-96ab-b4256a8e20a5	000d0000-5643-5183-afb8-27a1b2cdbac6	00100000-5643-5183-2192-ffc149c1eb08	00090000-5643-5183-ff18-24fab05a83e8	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5643-5183-3a40-d29f15060d2a	000d0000-5643-5183-a5ca-fbf97546a015	00100000-5643-5183-8973-dde732d3bdf3	00090000-5643-5183-a326-8e315a63697f	000b0000-5643-5183-349d-ab0d19d46ac9	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3157 (class 0 OID 26606921)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 26606317)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3148 (class 0 OID 26606798)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5643-5183-71e8-67290b7f46b5	00160000-5643-5183-f6cd-f7051c70df86	00090000-5643-5183-f7e7-55fe85c35cd2	aizv	10	t
003d0000-5643-5183-b78f-229509e20cc8	00160000-5643-5183-f6cd-f7051c70df86	00090000-5643-5183-0af6-2a726aeff022	apri	14	t
003d0000-5643-5183-0698-702263babf87	00160000-5643-5183-4a15-8bb4db8e747c	00090000-5643-5183-b8a5-d1e79ff98aad	aizv	11	t
003d0000-5643-5183-e464-18e0c1bfd821	00160000-5643-5183-6ac7-451f00c688b1	00090000-5643-5183-20a9-530195efffcf	aizv	12	t
003d0000-5643-5183-3d04-dd206447d902	00160000-5643-5183-f6cd-f7051c70df86	00090000-5643-5183-9e0b-a5fc5e67240e	apri	18	f
\.


--
-- TOC entry 3151 (class 0 OID 26606828)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5643-5183-f6cd-f7051c70df86	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5643-5183-4a15-8bb4db8e747c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5643-5183-6ac7-451f00c688b1	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3172 (class 0 OID 26607228)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 26606572)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5643-5183-7e75-a54f0e4aaecb	\N	\N	00200000-5643-5183-b337-9f28611ce130	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5643-5183-ac99-7cfde0f8d0a9	\N	\N	00200000-5643-5183-ddfe-55a5e2dc13b3	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5643-5183-2c31-30f12bd306de	\N	\N	00200000-5643-5183-f457-df728a0b397a	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5643-5183-38bd-ce200f5b030f	\N	\N	00200000-5643-5183-aead-4bf988dc19ab	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5643-5183-f96c-6f372d22e8c8	\N	\N	00200000-5643-5183-50a3-5de2f163ccde	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3126 (class 0 OID 26606604)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 26606609)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 26607151)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 26606469)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5643-5180-b60c-fdda27bce794	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5643-5180-8720-43edffafd24c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5643-5180-45b7-2f4624697a59	AL	ALB	008	Albania 	Albanija	\N
00040000-5643-5180-314c-abb5aa76beb1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5643-5180-f142-1fb278287465	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5643-5180-736a-7eaf2ac5904b	AD	AND	020	Andorra 	Andora	\N
00040000-5643-5180-25e7-10aba7a758fd	AO	AGO	024	Angola 	Angola	\N
00040000-5643-5180-3638-1052c9a7db7d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5643-5180-9986-fb745b71b9f7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5643-5180-7b8c-adfe24897d2c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5643-5180-a1b6-3e8ed37c9605	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5643-5180-b4de-5f4ed9a80dc5	AM	ARM	051	Armenia 	Armenija	\N
00040000-5643-5180-bcdb-0f67708ef910	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5643-5180-d180-491d5cf78f83	AU	AUS	036	Australia 	Avstralija	\N
00040000-5643-5180-2e69-f072f91fd4a7	AT	AUT	040	Austria 	Avstrija	\N
00040000-5643-5180-fa67-ac5ad2c76be8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5643-5180-0d1b-28109b478e5e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5643-5180-659e-7e153f7f99b9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5643-5180-2c42-cd756dcdbdae	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5643-5180-08eb-24024dd90a6a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5643-5180-9f0f-44e6aea62b88	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5643-5180-efaa-e6c1ea04bf17	BE	BEL	056	Belgium 	Belgija	\N
00040000-5643-5180-defd-e527ed9bf4f0	BZ	BLZ	084	Belize 	Belize	\N
00040000-5643-5180-6d42-c8f4531d0e1b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5643-5180-47e2-14d13a90fe96	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5643-5180-7bd4-d9f90db4a9fc	BT	BTN	064	Bhutan 	Butan	\N
00040000-5643-5180-f472-4b34b48d1a4e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5643-5180-9ffe-9e1697bfe7bb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5643-5180-1a65-414db2568ffa	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5643-5180-69b7-2f95e6cba682	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5643-5180-8359-22b6e6b2cbf9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5643-5180-11e1-14a7f4371c58	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5643-5180-0545-7450d0734d08	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5643-5180-16d7-69f87a576f5c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5643-5180-316d-0cd1dafb1030	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5643-5180-4627-80967f0282fe	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5643-5180-ebd7-baf4c18f955f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5643-5180-5ab7-b5f54748ef7c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5643-5180-4405-b64064a76eec	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5643-5180-eaa6-d9b93ce9af51	CA	CAN	124	Canada 	Kanada	\N
00040000-5643-5180-a871-f81f2ac1bfaf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5643-5180-a7a0-40d675dd0e85	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5643-5180-7ff1-0b443c726e95	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5643-5180-f2cb-c59c4f2fe2c2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5643-5180-cf09-2df4a5dfab40	CL	CHL	152	Chile 	Čile	\N
00040000-5643-5180-2795-867f8c2a2a2f	CN	CHN	156	China 	Kitajska	\N
00040000-5643-5180-fa70-a86a1a2324ff	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5643-5180-88a9-c91bacd0f578	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5643-5180-81d8-63897fe55d9a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5643-5180-4278-371e7e7e8857	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5643-5180-f204-33d7f134b67d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5643-5180-1149-ebea34e78648	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5643-5180-fc3e-8a03fa905835	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5643-5180-1246-06afb0d41f30	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5643-5180-0cd7-e692be9d5078	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5643-5180-4056-e55606757b1b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5643-5180-e10f-9bc82e9200d6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5643-5180-0088-49fdfab321fb	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5643-5180-1bf4-11eb243d8d03	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5643-5180-f5f8-21e904c80acf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5643-5180-9158-6852acc5ae04	DK	DNK	208	Denmark 	Danska	\N
00040000-5643-5180-41eb-d2fa9940be84	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5643-5180-49e1-eccc63f08cf2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5643-5180-9d00-9c2ba5c7fcd9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5643-5180-bfe9-85b310f6603a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5643-5180-7e46-2eb614a004e9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5643-5180-7279-7418d416dd9a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5643-5180-c1bf-9f36b6c9d6d6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5643-5180-2c1d-c5a430bf7961	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5643-5180-1173-5b44ec98e453	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5643-5180-d84d-df019cbd67ab	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5643-5180-eb45-6cef889d08e3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5643-5180-7876-90100b8071b3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5643-5180-9cdc-fd0b6a75c785	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5643-5180-f2ba-8695dcff059f	FI	FIN	246	Finland 	Finska	\N
00040000-5643-5180-96c8-20f9fe0af67e	FR	FRA	250	France 	Francija	\N
00040000-5643-5180-4a11-cced47b82970	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5643-5180-a894-3dc5614b2a34	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5643-5180-4ad1-b3487dae36fe	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5643-5180-0da4-fa8796aa0893	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5643-5180-417c-0181a87b9bc9	GA	GAB	266	Gabon 	Gabon	\N
00040000-5643-5180-6523-7d06fe03e7cf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5643-5180-3c15-8b002dce6b43	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5643-5180-724d-24511a8f985a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5643-5180-c545-32a5ef658691	GH	GHA	288	Ghana 	Gana	\N
00040000-5643-5180-42b5-33820db391df	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5643-5180-e121-12aef42a10c6	GR	GRC	300	Greece 	Grčija	\N
00040000-5643-5180-57b5-91213ca1741c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5643-5180-579c-7d4d75d3602f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5643-5180-e927-32a020376d1b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5643-5180-110a-ebdda6fd97ea	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5643-5180-4b2c-be26a47d3bbf	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5643-5180-236d-628aee1f4114	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5643-5180-13af-16c415c43a7e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5643-5180-350b-28d8de255e60	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5643-5180-616c-885d773d76b3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5643-5180-88c8-01a920f2c297	HT	HTI	332	Haiti 	Haiti	\N
00040000-5643-5180-ab91-3823353307bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5643-5180-4363-41a646e95a99	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5643-5180-905e-df080cf892c1	HN	HND	340	Honduras 	Honduras	\N
00040000-5643-5180-e659-71220ec6c489	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5643-5180-c0ea-8d254e9f0cd2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5643-5180-ee4e-bb04240a2ed0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5643-5180-1df3-e6b8e68f6d74	IN	IND	356	India 	Indija	\N
00040000-5643-5180-dfb5-baf81e924fde	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5643-5180-75a8-25461b778a65	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5643-5180-b0e5-5d4ea3652db5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5643-5180-aff5-d3680e11b8dd	IE	IRL	372	Ireland 	Irska	\N
00040000-5643-5180-8d3c-296fa293fb8b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5643-5180-340b-294adc3edd08	IL	ISR	376	Israel 	Izrael	\N
00040000-5643-5180-540f-6c7475c576d4	IT	ITA	380	Italy 	Italija	\N
00040000-5643-5180-ea75-1aafe2c9a725	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5643-5180-64af-262e70d931eb	JP	JPN	392	Japan 	Japonska	\N
00040000-5643-5180-8895-50835f783fef	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5643-5180-aa44-e8290aa1c36e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5643-5180-6e7a-d91a49aa3a37	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5643-5180-9454-39702df8df7b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5643-5180-e1bb-0042ed0c8872	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5643-5180-d849-47f758fe349a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5643-5180-297a-7588cad5a0b6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5643-5180-f5d9-fb8043f530c5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5643-5180-8e34-2da33be2eb64	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5643-5180-b681-97622ab27d08	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5643-5180-6933-242d79cfa8b0	LV	LVA	428	Latvia 	Latvija	\N
00040000-5643-5180-c4f9-301b6d0c5695	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5643-5180-db5a-a9ae170ba562	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5643-5180-841c-c4bafa89f8af	LR	LBR	430	Liberia 	Liberija	\N
00040000-5643-5180-4d61-78e192a49925	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5643-5180-f375-e15432a338d8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5643-5180-406b-48d21a9d146f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5643-5180-de82-4a3f9f20479f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5643-5180-9f98-b1c6eaa627af	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5643-5180-1346-6251a90dad7c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5643-5180-4853-9f5a6ff5243b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5643-5180-4689-0937bbb0f3a1	MW	MWI	454	Malawi 	Malavi	\N
00040000-5643-5180-e166-ebe2aed27016	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5643-5180-09f7-3f708307ca65	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5643-5180-ab4f-e1be736b74e1	ML	MLI	466	Mali 	Mali	\N
00040000-5643-5180-35ee-755c3a16401c	MT	MLT	470	Malta 	Malta	\N
00040000-5643-5180-4e7b-bbaca71fd2c5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5643-5180-9eda-eef19be8c560	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5643-5180-96fd-00d5375388f3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5643-5180-1c02-5eaa394c42e7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5643-5180-c8b1-1db735f6b05d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5643-5180-854a-855707cec52b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5643-5180-6677-8dc41954d6b0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5643-5180-8a90-8c09414b80a8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5643-5180-919c-4a409626461c	MC	MCO	492	Monaco 	Monako	\N
00040000-5643-5180-c2ae-ea256a9b0dcf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5643-5180-9a5d-2acf4ca634c8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5643-5180-9dfd-0c6c56e93b02	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5643-5180-0c56-d26a146c7a70	MA	MAR	504	Morocco 	Maroko	\N
00040000-5643-5180-3f47-070734d72260	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5643-5180-bb31-fb9de9ef38f2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5643-5180-ac79-7501e6a861b3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5643-5180-78b7-ac65a0c2e630	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5643-5180-1731-24e11c1797c4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5643-5180-e71d-c0e607c2e23d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5643-5180-757e-5bf7ff1c5059	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5643-5180-d551-8f4708ec2426	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5643-5180-dcdc-f9a15a630b4b	NE	NER	562	Niger 	Niger 	\N
00040000-5643-5180-7786-f16a6fefdbf8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5643-5180-b4d1-f9c2399a5aa0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5643-5180-ad1d-f785e4555df1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5643-5180-2150-c696584b2de6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5643-5180-6520-2cdbbde8f965	NO	NOR	578	Norway 	Norveška	\N
00040000-5643-5180-9333-ed1a81010edd	OM	OMN	512	Oman 	Oman	\N
00040000-5643-5180-a6fd-fb79d1ab130b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5643-5180-92f9-ea4d9b1c9b27	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5643-5180-df3b-590b57e8a032	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5643-5180-cbb1-ee48c0c368aa	PA	PAN	591	Panama 	Panama	\N
00040000-5643-5180-9d19-eac10237f1cf	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5643-5180-5b8c-a47d95fc6c81	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5643-5180-8c7a-a84cadaeb0ae	PE	PER	604	Peru 	Peru	\N
00040000-5643-5180-82ae-a9854365fc37	PH	PHL	608	Philippines 	Filipini	\N
00040000-5643-5180-4319-89c13c354a0b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5643-5180-acf4-b9c498469c1e	PL	POL	616	Poland 	Poljska	\N
00040000-5643-5180-8ac4-e6ab67e9af13	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5643-5180-f415-bdeea61ad702	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5643-5180-48ff-30facff4e163	QA	QAT	634	Qatar 	Katar	\N
00040000-5643-5180-2e8e-394aeabeb508	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5643-5180-f269-a2be89883515	RO	ROU	642	Romania 	Romunija	\N
00040000-5643-5180-fb9a-a6f2d97c5e05	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5643-5180-1f45-c8c52202a4de	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5643-5180-563b-cb638eb59db2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5643-5180-824b-023dd13afc0d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5643-5180-1398-b80b068b0275	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5643-5180-b811-d34f24ab63e3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5643-5180-fea8-f3cae566314e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5643-5180-09b7-1c21b4b4edeb	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5643-5180-5b81-5a591c351958	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5643-5180-ed9b-f3b7ad25f6b7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5643-5180-4a4b-fa03a973c784	SM	SMR	674	San Marino 	San Marino	\N
00040000-5643-5180-6b97-9a00dd577cec	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5643-5180-3f69-93f4df3ed4a4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5643-5180-83e6-2280905ca514	SN	SEN	686	Senegal 	Senegal	\N
00040000-5643-5180-cffe-a3ac25d742b8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5643-5180-4aa2-880db247c5ec	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5643-5180-80e5-2d4cc567af90	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5643-5180-bdeb-69f4e98589da	SG	SGP	702	Singapore 	Singapur	\N
00040000-5643-5180-9bf9-b5fa85c21056	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5643-5180-4066-ae354917aee5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5643-5180-830f-858830c5e980	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5643-5180-18a9-0b8d04a07374	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5643-5180-bf9a-c3cbb1461280	SO	SOM	706	Somalia 	Somalija	\N
00040000-5643-5180-718b-3dd044315cf7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5643-5180-65d7-292f7eab4b53	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5643-5180-0730-a9705f2cf010	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5643-5180-6485-d0e66a4cf74a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5643-5180-8130-f3c6b56ae159	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5643-5180-94b3-81898255f643	SD	SDN	729	Sudan 	Sudan	\N
00040000-5643-5180-cc9e-aaab8be51209	SR	SUR	740	Suriname 	Surinam	\N
00040000-5643-5180-9896-34bdb6a32de3	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5643-5180-b4ad-87c98aca60c3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5643-5180-190e-85756cd324a9	SE	SWE	752	Sweden 	Švedska	\N
00040000-5643-5180-f585-0cdbffbc9265	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5643-5180-56d9-2c59b33baae5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5643-5180-4eca-17401b6952e2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5643-5180-82e9-8f537065c73e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5643-5180-87a4-90abac9fe6bd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5643-5180-1552-44509b82721f	TH	THA	764	Thailand 	Tajska	\N
00040000-5643-5180-02e2-35db2dd14730	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5643-5180-9f43-e720eacfc410	TG	TGO	768	Togo 	Togo	\N
00040000-5643-5180-033c-fabbaff0704c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5643-5180-2ecc-2438e85535d8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5643-5180-ea23-9a9534240375	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5643-5180-55c8-315570155356	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5643-5180-d97b-78b939deb55d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5643-5180-cd80-ce8153f15bcd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5643-5180-d43b-7012188e678b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5643-5180-5d94-e69fc7f98154	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5643-5180-ec1a-75de78b30a2d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5643-5180-c7df-6298f479c502	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5643-5180-45ae-cb08b762e16a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5643-5180-cc64-24a458137281	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5643-5180-eed2-5e36e574e0c2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5643-5180-0e85-db982d31a4fe	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5643-5180-0334-f20ff9fdaf35	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5643-5180-58be-467b29b627b1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5643-5180-3e67-84bb6e0af63f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5643-5180-6f3f-9acf453f844d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5643-5180-f3f3-d1dc45905a35	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5643-5180-e7de-34e442443b04	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5643-5180-bc85-e97c047a93d5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5643-5180-5ec9-c1f5c789b1a4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5643-5180-4e56-af28bb3419f0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5643-5180-3462-ed6889b7d57b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5643-5180-25a7-96e1dd838da5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5643-5180-9ecc-31ce1ace0a87	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3159 (class 0 OID 26606951)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5643-5183-ce53-5e8b65ce1251	000e0000-5643-5183-f2be-70e687ba3dfe	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5643-5180-27e4-f4187f0b92d8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5643-5183-fcfc-5f27db6f3e1c	000e0000-5643-5183-f0e0-5831594b86d3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5643-5180-6190-e7344cfbcf72	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5643-5183-1476-3c7571974f24	000e0000-5643-5183-cfcb-95df1ae916c4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5643-5180-27e4-f4187f0b92d8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5643-5183-e258-6650776e9cff	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5643-5183-6fc1-315e87cffaf8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 26606752)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5643-5183-afb8-27a1b2cdbac6	000e0000-5643-5183-f0e0-5831594b86d3	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5643-5180-3faf-b050574c09fb
000d0000-5643-5183-2cce-b53a6d4aca56	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-c83f-ddbc5e5fe8d0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5643-5180-3faf-b050574c09fb
000d0000-5643-5183-0f53-21dcaba5b618	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-4be2-7bc4c77ff7fc	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5643-5180-4d70-aac98c22455e
000d0000-5643-5183-c968-841bf1933f9c	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-7058-82fec57f9632	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5643-5180-4f4f-4726db54b3c2
000d0000-5643-5183-0b9d-0cfdc1a9fe44	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-7f57-b4923f02ccc3	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5643-5180-ad93-1ca5680e3f3f
000d0000-5643-5183-f905-7afa9e12975a	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-d9fa-a714cd581579	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5643-5180-ad93-1ca5680e3f3f
000d0000-5643-5183-8df4-094277f9f5d9	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-56dc-40e24ecf65a8	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5643-5180-3faf-b050574c09fb
000d0000-5643-5183-32ae-f8b522920a33	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-a911-971b8591b095	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5643-5180-c67f-f566c35b9469
000d0000-5643-5183-a5ca-fbf97546a015	000e0000-5643-5183-f0e0-5831594b86d3	000c0000-5643-5183-3a40-d29f15060d2a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5643-5180-f6d7-03eda5aafe3c
\.


--
-- TOC entry 3121 (class 0 OID 26606543)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 26606509)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 26606486)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5643-5183-d434-c2450a8fe8b3	00080000-5643-5183-d7cf-445dc6d80ec5	00090000-5643-5183-fb05-c9e56a9ef78b	AK		igralka
\.


--
-- TOC entry 3133 (class 0 OID 26606666)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 26607209)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5643-5183-4f86-663b03979ed3	00010000-5643-5181-cd9b-334f962acc76	\N	Prva mapa	Root mapa	2015-11-11 15:32:35	2015-11-11 15:32:35	R	\N	\N
\.


--
-- TOC entry 3171 (class 0 OID 26607221)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 26607243)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 25231831)
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
-- TOC entry 3137 (class 0 OID 26606691)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 26606443)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5643-5181-46dc-19ee31c1e2c2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5643-5181-7164-652d3700d6ca	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5643-5181-3b90-bf48b9335de4	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5643-5181-d31e-23aab63aa545	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5643-5181-771d-506b1586abbb	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5643-5181-e8c9-66036ae65bd5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5643-5181-66c0-559d9d12d79f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5643-5181-f466-9a41db174f26	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5643-5181-2f8e-005ee969492e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5643-5181-1601-394b476a5f75	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5643-5181-b20c-afa1a3cad2a0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5643-5181-841d-42687bc09f4d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5643-5181-e039-3b122c955aa0	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5643-5181-2908-e98d65075501	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5643-5181-9d1a-53d96d54c196	fsacl.dostop	array	a:5:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}s:4:"RWDA";a:1:{s:5:"label";s:45:"Branje pisanje, brisanje, ažuriranje zapisov";}}	f	t	f	\N	ACL Javni dostop
00000000-5643-5183-c441-1f7036d9c28d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5643-5183-ec45-fa469668ab5a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5643-5183-c3d6-22fff1178454	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5643-5183-5a02-7535bcc930a7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5643-5183-b157-beab3178cc46	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5643-5185-764d-d10f991cca0b	application.tenant.maticnopodjetje	string	s:36:"00080000-5643-5185-951a-ac6682ce567e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3106 (class 0 OID 26606343)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5643-5183-5f36-789aff03a34f	00000000-5643-5183-c441-1f7036d9c28d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5643-5183-4cd5-3fce7635338b	00000000-5643-5183-c441-1f7036d9c28d	00010000-5643-5181-cd9b-334f962acc76	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5643-5183-14ba-11f0a380cb0a	00000000-5643-5183-ec45-fa469668ab5a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3110 (class 0 OID 26606410)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5643-5183-7cb3-93a52156fc99	\N	00100000-5643-5183-8973-dde732d3bdf3	00100000-5643-5183-0686-ed061b5d0198	01	Gledališče Nimbis
00410000-5643-5183-9f54-249d38a1a0df	00410000-5643-5183-7cb3-93a52156fc99	00100000-5643-5183-8973-dde732d3bdf3	00100000-5643-5183-0686-ed061b5d0198	02	Tehnika
\.


--
-- TOC entry 3107 (class 0 OID 26606354)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5643-5183-fed5-c5252b884ca2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5643-5183-1a0e-c228f7512fcd	00010000-5643-5183-c7f5-a7c5dd63fa50	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5643-5183-ff3c-99b949a72635	00010000-5643-5183-3754-06a311418ab9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5643-5183-e14e-ef2f8a577b44	00010000-5643-5183-482a-29f1cf0a5caf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5643-5183-1e52-7ef1e974ad0c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5643-5183-854a-3f6b13e84713	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5643-5183-ff18-24fab05a83e8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5643-5183-1a24-d40f9fe31060	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5643-5183-fb05-c9e56a9ef78b	00010000-5643-5183-366e-03d18aba9574	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5643-5183-a326-8e315a63697f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5643-5183-916e-a2faf86d9353	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5643-5183-b8b9-61a3f855d9dd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5643-5183-9a1c-9f89dead97bd	00010000-5643-5183-0438-c74113a98087	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5643-5183-f7e7-55fe85c35cd2	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-5183-0af6-2a726aeff022	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-5183-b8a5-d1e79ff98aad	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-5183-20a9-530195efffcf	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5643-5183-9e0b-a5fc5e67240e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5643-5183-8742-61383cc59205	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-5183-5d91-ecd4852e519e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-5183-dde6-59a350a7cdf9	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3099 (class 0 OID 26606289)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5643-5181-a218-c2bcefcb2621	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5643-5181-6a39-9afa5520c3f8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5643-5181-742e-065f4b40f9a4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5643-5181-15f9-41aaa598df7e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5643-5181-fe1b-1b2ce9aa0459	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5643-5181-8df2-7e1ee7056b7b	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5643-5181-a6bc-93b7e2e5274f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5643-5181-d905-1d19b8127092	Abonma-read	Abonma - branje	t
00030000-5643-5181-833e-9c3bd38bc577	Abonma-write	Abonma - spreminjanje	t
00030000-5643-5181-11dc-2e1380aa64fc	Alternacija-read	Alternacija - branje	t
00030000-5643-5181-8645-bf570a1fffa8	Alternacija-write	Alternacija - spreminjanje	t
00030000-5643-5181-cd6f-a984ab823fc9	Arhivalija-read	Arhivalija - branje	t
00030000-5643-5181-4ea9-aef63a78ffd2	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5643-5181-0828-a21c69a0ea13	AuthStorage-read	AuthStorage - branje	t
00030000-5643-5181-980c-0a98d4c249e3	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5643-5181-1546-b017075d4949	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5643-5181-e2ab-177304afc434	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5643-5181-d9c0-46b1d989380c	Besedilo-read	Besedilo - branje	t
00030000-5643-5181-9ba3-fd158936f9d9	Besedilo-write	Besedilo - spreminjanje	t
00030000-5643-5181-3011-11a30b9467ef	Dogodek-read	Dogodek - branje	t
00030000-5643-5181-fd78-a4580872d63f	Dogodek-write	Dogodek - spreminjanje	t
00030000-5643-5181-60d9-1807b7271958	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5643-5181-0a68-5d404d5003ba	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5643-5181-e488-d37eb6e88178	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5643-5181-3b1e-9aff1497e890	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5643-5181-4861-c32f6bef7d5f	DogodekTrait-read	DogodekTrait - branje	t
00030000-5643-5181-a39d-bac612d7ef56	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5643-5181-1712-35342406c1c7	DrugiVir-read	DrugiVir - branje	t
00030000-5643-5181-a142-29908bc23707	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5643-5181-93e7-b84e8165629e	Drzava-read	Drzava - branje	t
00030000-5643-5181-08c1-f6bb7d915aad	Drzava-write	Drzava - spreminjanje	t
00030000-5643-5181-63c5-b7df682ccaa7	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5643-5181-c56f-1d50e19daf2a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5643-5181-a543-5260c7867ba8	Funkcija-read	Funkcija - branje	t
00030000-5643-5181-1c78-874d6b2910ed	Funkcija-write	Funkcija - spreminjanje	t
00030000-5643-5181-1afb-fed3a812ddbc	Gostovanje-read	Gostovanje - branje	t
00030000-5643-5181-a8b3-16c1b290d5f3	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5643-5181-b361-3cf3c57df8e4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5643-5181-ac22-83fdc4a9ab53	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5643-5181-353d-122a1ac65e9d	Kupec-read	Kupec - branje	t
00030000-5643-5181-9660-ef11a812da0a	Kupec-write	Kupec - spreminjanje	t
00030000-5643-5181-64a2-5108339e4f85	NacinPlacina-read	NacinPlacina - branje	t
00030000-5643-5181-86ba-c5093448cfe3	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5643-5181-ee61-5c6810cea5b6	Option-read	Option - branje	t
00030000-5643-5181-02d7-f867e290e634	Option-write	Option - spreminjanje	t
00030000-5643-5181-ead0-3348bf559016	OptionValue-read	OptionValue - branje	t
00030000-5643-5181-1348-58cda37e6f9c	OptionValue-write	OptionValue - spreminjanje	t
00030000-5643-5181-9f4b-7ea6ba6cb184	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5643-5181-1c9d-b41fd62ae2eb	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5643-5181-348c-5baf0a77a8ad	Oseba-read	Oseba - branje	t
00030000-5643-5181-9163-bfb519a7c77d	Oseba-write	Oseba - spreminjanje	t
00030000-5643-5181-7d9d-87e12e8b484b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5643-5181-4bc7-9002769309dc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5643-5181-6c4f-0c3438ee3371	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5643-5181-87a1-90ce7f55c0f5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5643-5181-d354-66a412dab166	Pogodba-read	Pogodba - branje	t
00030000-5643-5181-8b33-5fb0f8e29029	Pogodba-write	Pogodba - spreminjanje	t
00030000-5643-5181-df14-e2182bb76079	Popa-read	Popa - branje	t
00030000-5643-5181-5661-621045aedf2e	Popa-write	Popa - spreminjanje	t
00030000-5643-5181-35d8-ec3d17dba325	Posta-read	Posta - branje	t
00030000-5643-5181-74c7-dedda83cf24c	Posta-write	Posta - spreminjanje	t
00030000-5643-5181-6dc2-88b04011b994	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5643-5181-d41b-a568b82abe94	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5643-5181-c8dc-94bd1240d416	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5643-5181-38cd-4e469700d4c7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5643-5181-79c0-82e3c1ae717c	PostniNaslov-read	PostniNaslov - branje	t
00030000-5643-5181-fca7-d68f3184ef8b	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5643-5181-0578-3e20df8b991f	Praznik-read	Praznik - branje	t
00030000-5643-5181-577e-f06f1559ed2a	Praznik-write	Praznik - spreminjanje	t
00030000-5643-5181-07cd-b3398ca0d239	Predstava-read	Predstava - branje	t
00030000-5643-5181-d12c-88f4f81d6cb5	Predstava-write	Predstava - spreminjanje	t
00030000-5643-5181-bd39-60b263d1ba8b	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5643-5181-4a1c-21d579a41153	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5643-5181-86b9-ac9f3664ea3b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5643-5181-a97e-d6d685e340da	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5643-5181-b99a-4401ed5c5e30	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5643-5181-f123-e3b61d37eb4d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5643-5181-19a7-44091a76a989	ProgramDela-read	ProgramDela - branje	t
00030000-5643-5181-9f5e-c41bea2ee69c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5643-5181-4cba-c4b2f9b9f8d0	ProgramFestival-read	ProgramFestival - branje	t
00030000-5643-5181-0053-cdc811e646e3	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5643-5181-934f-cb4457be81b3	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5643-5181-f3af-69e1f042199c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5643-5181-5237-576d1102a076	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5643-5181-f29f-e81cfb57d40a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5643-5181-5034-43e481968a00	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5643-5181-0e96-32a19ee9fb32	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5643-5181-8f23-770f4220e176	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5643-5181-1396-df668fb0217f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5643-5181-0fe2-e9f778377527	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5643-5181-be30-2e47b09f5d54	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5643-5181-71d2-198770cb4eac	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5643-5181-d026-c7b067673bb7	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5643-5181-3554-ed05488c7e0a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5643-5181-d6c4-1e6ea87dd207	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5643-5181-7004-1296f168b469	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5643-5181-03dc-8bf213e9e2d2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5643-5181-1cfc-91d966fb9965	Prostor-read	Prostor - branje	t
00030000-5643-5181-b3aa-1a6f322ff55f	Prostor-write	Prostor - spreminjanje	t
00030000-5643-5181-729a-815cc3888a9e	Racun-read	Racun - branje	t
00030000-5643-5181-c8bf-af0c2bd720d9	Racun-write	Racun - spreminjanje	t
00030000-5643-5181-e7ad-ecc81570ea24	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5643-5181-7d87-069f36d568e7	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5643-5181-fc07-f18154a3179a	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5643-5181-f0c9-27e260d35517	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5643-5181-841d-339aa0849548	Rekvizit-read	Rekvizit - branje	t
00030000-5643-5181-15ec-9e527bed86eb	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5643-5181-c1dd-91bf2a722318	Revizija-read	Revizija - branje	t
00030000-5643-5181-28f8-d04279e63b09	Revizija-write	Revizija - spreminjanje	t
00030000-5643-5181-84b8-2048737c2f8c	Rezervacija-read	Rezervacija - branje	t
00030000-5643-5181-0d97-3ad57bc2ef5d	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5643-5181-da5f-4db8c8b4121f	SedezniRed-read	SedezniRed - branje	t
00030000-5643-5181-7798-bc9dae3c0fbe	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5643-5181-0505-c61dd3b7821f	Sedez-read	Sedez - branje	t
00030000-5643-5181-0407-ddf03503f46b	Sedez-write	Sedez - spreminjanje	t
00030000-5643-5181-7a41-72d09e7e06fb	Sezona-read	Sezona - branje	t
00030000-5643-5181-e83e-38f850fe256d	Sezona-write	Sezona - spreminjanje	t
00030000-5643-5181-8be3-95cf4da422f5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5643-5181-880c-f0b93205a2c4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5643-5181-d2e0-18529ea9dc2c	Stevilcenje-read	Stevilcenje - branje	t
00030000-5643-5181-206b-e489077074b2	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5643-5181-e6b0-ccc9c80f3900	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5643-5181-6e51-c6c8990659fc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5643-5181-b609-06257648b66f	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5643-5181-1efe-47225c9616db	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5643-5181-36af-11ed685ecfac	Telefonska-read	Telefonska - branje	t
00030000-5643-5181-be8c-ef69046d9919	Telefonska-write	Telefonska - spreminjanje	t
00030000-5643-5181-ff35-563b25e8fdae	TerminStoritve-read	TerminStoritve - branje	t
00030000-5643-5181-ae66-03a8bc90d1a6	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5643-5181-1bcc-b17e1908583f	TipFunkcije-read	TipFunkcije - branje	t
00030000-5643-5181-e5be-ff596dbd8b69	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5643-5181-f61d-3467a54b07cb	TipPopa-read	TipPopa - branje	t
00030000-5643-5181-e7d2-4cbe0e0cad93	TipPopa-write	TipPopa - spreminjanje	t
00030000-5643-5181-2165-1e2472e3606d	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5643-5181-b369-f7f2bb50d724	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5643-5181-f77c-70416786c5e6	TipVaje-read	TipVaje - branje	t
00030000-5643-5181-4095-123b1d09e78c	TipVaje-write	TipVaje - spreminjanje	t
00030000-5643-5181-031e-7b68bbe16dbb	Trr-read	Trr - branje	t
00030000-5643-5181-4fa9-2d84c2a20b4d	Trr-write	Trr - spreminjanje	t
00030000-5643-5181-2a30-deeab6158062	Uprizoritev-read	Uprizoritev - branje	t
00030000-5643-5181-bfce-822048968cb0	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5643-5181-c66f-f8b26d97dc04	Vaja-read	Vaja - branje	t
00030000-5643-5181-7110-c8730a9d0fa9	Vaja-write	Vaja - spreminjanje	t
00030000-5643-5181-fed4-5483be86d1ae	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5643-5181-59f9-dd3639ff0abe	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5643-5181-57d8-2d75be349172	VrstaStroska-read	VrstaStroska - branje	t
00030000-5643-5181-5fe1-19d7ce5f0b2a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5643-5181-0aeb-e0e50c3d97b3	Zaposlitev-read	Zaposlitev - branje	t
00030000-5643-5181-7c87-e71bfc141b5e	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5643-5181-39e7-3d1d5a2eb9cb	Zasedenost-read	Zasedenost - branje	t
00030000-5643-5181-b63f-31111c38488d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5643-5181-2702-17ec008aec3a	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5643-5181-52f1-09f727bb4a00	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5643-5181-a824-5ccb137afd2d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5643-5181-9fec-ffff3776b4b1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5643-5181-3b88-a662fcb74947	Job-read	Branje opravil - samo zase - branje	t
00030000-5643-5181-536b-5eece355c5d6	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5643-5181-0510-6288f13b7cef	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5643-5181-ca0b-c867210e07a5	Report-read	Report - branje	t
00030000-5643-5181-66e1-156295af9f1e	Report-write	Report - spreminjanje	t
00030000-5643-5181-de0a-a2ee378211f2	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5643-5181-95ce-b8cd701703e0	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5643-5181-0d89-1bc8406d87b2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5643-5181-6808-20ed98397ad2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5643-5181-2cc7-f8caa1d7c21f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5643-5181-dfbf-e121e41f24bb	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5643-5181-41c7-0d1e2cd80d76	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5643-5181-2630-f66964bf066f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5643-5181-6e56-551598e3e7df	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5643-5181-6337-94f2a2ce0593	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5643-5181-7cd4-51eb8db1703c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5643-5181-bace-523c7d77d1c1	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5643-5181-3cff-a30cdaf0feef	Datoteka-write	Datoteka - spreminjanje	t
00030000-5643-5181-5c58-3af254a81beb	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3101 (class 0 OID 26606308)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5643-5181-f7eb-a08c388b2e03	00030000-5643-5181-6a39-9afa5520c3f8
00020000-5643-5181-8ca7-cc88dda79b5e	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-d905-1d19b8127092
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-833e-9c3bd38bc577
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-11dc-2e1380aa64fc
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-8645-bf570a1fffa8
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-cd6f-a984ab823fc9
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-3011-11a30b9467ef
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-15f9-41aaa598df7e
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-fd78-a4580872d63f
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-08c1-f6bb7d915aad
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-a543-5260c7867ba8
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-1c78-874d6b2910ed
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-1afb-fed3a812ddbc
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-a8b3-16c1b290d5f3
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-b361-3cf3c57df8e4
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-ac22-83fdc4a9ab53
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-ee61-5c6810cea5b6
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-ead0-3348bf559016
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-348c-5baf0a77a8ad
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-9163-bfb519a7c77d
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-df14-e2182bb76079
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-5661-621045aedf2e
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-35d8-ec3d17dba325
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-74c7-dedda83cf24c
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-79c0-82e3c1ae717c
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-fca7-d68f3184ef8b
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-07cd-b3398ca0d239
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-d12c-88f4f81d6cb5
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-b99a-4401ed5c5e30
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-f123-e3b61d37eb4d
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-1cfc-91d966fb9965
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-b3aa-1a6f322ff55f
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-fc07-f18154a3179a
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-f0c9-27e260d35517
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-841d-339aa0849548
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-15ec-9e527bed86eb
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-7a41-72d09e7e06fb
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-e83e-38f850fe256d
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-1bcc-b17e1908583f
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-2a30-deeab6158062
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-bfce-822048968cb0
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-c66f-f8b26d97dc04
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-7110-c8730a9d0fa9
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-39e7-3d1d5a2eb9cb
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-b63f-31111c38488d
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-2702-17ec008aec3a
00020000-5643-5181-bf0e-058030419928	00030000-5643-5181-a824-5ccb137afd2d
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-d905-1d19b8127092
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-cd6f-a984ab823fc9
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-3011-11a30b9467ef
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-1afb-fed3a812ddbc
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-b361-3cf3c57df8e4
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-ac22-83fdc4a9ab53
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-ee61-5c6810cea5b6
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-ead0-3348bf559016
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-348c-5baf0a77a8ad
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-9163-bfb519a7c77d
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-df14-e2182bb76079
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-35d8-ec3d17dba325
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-79c0-82e3c1ae717c
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-fca7-d68f3184ef8b
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-07cd-b3398ca0d239
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-1cfc-91d966fb9965
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-fc07-f18154a3179a
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-841d-339aa0849548
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-7a41-72d09e7e06fb
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-36af-11ed685ecfac
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-be8c-ef69046d9919
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-031e-7b68bbe16dbb
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-4fa9-2d84c2a20b4d
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-0aeb-e0e50c3d97b3
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-7c87-e71bfc141b5e
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-2702-17ec008aec3a
00020000-5643-5181-31ea-7b69c502e154	00030000-5643-5181-a824-5ccb137afd2d
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-d905-1d19b8127092
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-11dc-2e1380aa64fc
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-cd6f-a984ab823fc9
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-4ea9-aef63a78ffd2
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-d9c0-46b1d989380c
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-60d9-1807b7271958
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-3011-11a30b9467ef
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-a543-5260c7867ba8
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-1afb-fed3a812ddbc
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-b361-3cf3c57df8e4
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-ee61-5c6810cea5b6
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-ead0-3348bf559016
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-348c-5baf0a77a8ad
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-df14-e2182bb76079
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-35d8-ec3d17dba325
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-07cd-b3398ca0d239
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-b99a-4401ed5c5e30
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-1cfc-91d966fb9965
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-fc07-f18154a3179a
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-841d-339aa0849548
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-7a41-72d09e7e06fb
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-1bcc-b17e1908583f
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-c66f-f8b26d97dc04
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-39e7-3d1d5a2eb9cb
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-2702-17ec008aec3a
00020000-5643-5181-9f2a-d90dcea91b37	00030000-5643-5181-a824-5ccb137afd2d
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-d905-1d19b8127092
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-833e-9c3bd38bc577
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-8645-bf570a1fffa8
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-cd6f-a984ab823fc9
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-3011-11a30b9467ef
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-1afb-fed3a812ddbc
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-ee61-5c6810cea5b6
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-ead0-3348bf559016
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-df14-e2182bb76079
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-35d8-ec3d17dba325
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-07cd-b3398ca0d239
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-1cfc-91d966fb9965
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-fc07-f18154a3179a
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-841d-339aa0849548
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-7a41-72d09e7e06fb
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-1bcc-b17e1908583f
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-2702-17ec008aec3a
00020000-5643-5181-4e06-a6bf9931cf14	00030000-5643-5181-a824-5ccb137afd2d
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-d905-1d19b8127092
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-cd6f-a984ab823fc9
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-3011-11a30b9467ef
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-1afb-fed3a812ddbc
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-ee61-5c6810cea5b6
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-ead0-3348bf559016
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-df14-e2182bb76079
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-35d8-ec3d17dba325
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-07cd-b3398ca0d239
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-1cfc-91d966fb9965
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-fc07-f18154a3179a
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-841d-339aa0849548
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-7a41-72d09e7e06fb
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-ff35-563b25e8fdae
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-742e-065f4b40f9a4
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-1bcc-b17e1908583f
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-2702-17ec008aec3a
00020000-5643-5181-a4c0-3c70a32b13c9	00030000-5643-5181-a824-5ccb137afd2d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a218-c2bcefcb2621
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-6a39-9afa5520c3f8
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d905-1d19b8127092
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-833e-9c3bd38bc577
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-11dc-2e1380aa64fc
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-8645-bf570a1fffa8
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-cd6f-a984ab823fc9
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-4ea9-aef63a78ffd2
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1546-b017075d4949
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-e2ab-177304afc434
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d9c0-46b1d989380c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-9ba3-fd158936f9d9
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-60d9-1807b7271958
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0a68-5d404d5003ba
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-3011-11a30b9467ef
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-15f9-41aaa598df7e
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-fd78-a4580872d63f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1712-35342406c1c7
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a142-29908bc23707
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-93e7-b84e8165629e
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-08c1-f6bb7d915aad
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-63c5-b7df682ccaa7
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-c56f-1d50e19daf2a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a543-5260c7867ba8
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1c78-874d6b2910ed
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1afb-fed3a812ddbc
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a8b3-16c1b290d5f3
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-b361-3cf3c57df8e4
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-ac22-83fdc4a9ab53
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-353d-122a1ac65e9d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-9660-ef11a812da0a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-64a2-5108339e4f85
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-86ba-c5093448cfe3
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-ee61-5c6810cea5b6
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-ead0-3348bf559016
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1348-58cda37e6f9c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-02d7-f867e290e634
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-9f4b-7ea6ba6cb184
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1c9d-b41fd62ae2eb
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-348c-5baf0a77a8ad
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-fe1b-1b2ce9aa0459
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-9163-bfb519a7c77d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7d9d-87e12e8b484b
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-4bc7-9002769309dc
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-6c4f-0c3438ee3371
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-87a1-90ce7f55c0f5
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d354-66a412dab166
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-8b33-5fb0f8e29029
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-df14-e2182bb76079
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-5661-621045aedf2e
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-35d8-ec3d17dba325
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-6dc2-88b04011b994
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d41b-a568b82abe94
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-c8dc-94bd1240d416
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-38cd-4e469700d4c7
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-74c7-dedda83cf24c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-79c0-82e3c1ae717c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-fca7-d68f3184ef8b
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0578-3e20df8b991f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-577e-f06f1559ed2a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-07cd-b3398ca0d239
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d12c-88f4f81d6cb5
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-bd39-60b263d1ba8b
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-4a1c-21d579a41153
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-86b9-ac9f3664ea3b
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a97e-d6d685e340da
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-b99a-4401ed5c5e30
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-f123-e3b61d37eb4d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-8df2-7e1ee7056b7b
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-19a7-44091a76a989
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a6bc-93b7e2e5274f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-9f5e-c41bea2ee69c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-4cba-c4b2f9b9f8d0
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0053-cdc811e646e3
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-934f-cb4457be81b3
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-f3af-69e1f042199c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-5237-576d1102a076
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-f29f-e81cfb57d40a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-5034-43e481968a00
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0e96-32a19ee9fb32
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-8f23-770f4220e176
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1396-df668fb0217f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0fe2-e9f778377527
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-be30-2e47b09f5d54
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-71d2-198770cb4eac
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d026-c7b067673bb7
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-3554-ed05488c7e0a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d6c4-1e6ea87dd207
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7004-1296f168b469
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-03dc-8bf213e9e2d2
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1cfc-91d966fb9965
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-b3aa-1a6f322ff55f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-729a-815cc3888a9e
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-c8bf-af0c2bd720d9
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-e7ad-ecc81570ea24
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7d87-069f36d568e7
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-fc07-f18154a3179a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-f0c9-27e260d35517
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-841d-339aa0849548
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-15ec-9e527bed86eb
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-c1dd-91bf2a722318
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-28f8-d04279e63b09
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-84b8-2048737c2f8c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0d97-3ad57bc2ef5d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-da5f-4db8c8b4121f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7798-bc9dae3c0fbe
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0505-c61dd3b7821f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0407-ddf03503f46b
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7a41-72d09e7e06fb
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-e83e-38f850fe256d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-8be3-95cf4da422f5
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-880c-f0b93205a2c4
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-d2e0-18529ea9dc2c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-e6b0-ccc9c80f3900
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-6e51-c6c8990659fc
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-206b-e489077074b2
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-b609-06257648b66f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1efe-47225c9616db
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-36af-11ed685ecfac
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-be8c-ef69046d9919
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-ff35-563b25e8fdae
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-742e-065f4b40f9a4
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-ae66-03a8bc90d1a6
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-1bcc-b17e1908583f
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-e5be-ff596dbd8b69
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-f61d-3467a54b07cb
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-e7d2-4cbe0e0cad93
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-2165-1e2472e3606d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-b369-f7f2bb50d724
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-f77c-70416786c5e6
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-4095-123b1d09e78c
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-031e-7b68bbe16dbb
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-4fa9-2d84c2a20b4d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-2a30-deeab6158062
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-bfce-822048968cb0
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-c66f-f8b26d97dc04
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7110-c8730a9d0fa9
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-fed4-5483be86d1ae
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-59f9-dd3639ff0abe
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-57d8-2d75be349172
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-5fe1-19d7ce5f0b2a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-0aeb-e0e50c3d97b3
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-7c87-e71bfc141b5e
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-39e7-3d1d5a2eb9cb
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-b63f-31111c38488d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-2702-17ec008aec3a
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-52f1-09f727bb4a00
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-a824-5ccb137afd2d
00020000-5643-5183-56c6-04ca734dab9f	00030000-5643-5181-9fec-ffff3776b4b1
00020000-5643-5183-7db9-30a89502a34a	00030000-5643-5181-6337-94f2a2ce0593
00020000-5643-5183-1cf7-1642b425110f	00030000-5643-5181-6e56-551598e3e7df
00020000-5643-5183-8e89-285411cff0b8	00030000-5643-5181-bfce-822048968cb0
00020000-5643-5183-7871-b7efc6754ca2	00030000-5643-5181-2a30-deeab6158062
00020000-5643-5183-6f7b-bbd9b680d7ea	00030000-5643-5181-95ce-b8cd701703e0
00020000-5643-5183-a364-640c0ad1e1b7	00030000-5643-5181-0d89-1bc8406d87b2
00020000-5643-5183-25ee-2f85f8361156	00030000-5643-5181-6808-20ed98397ad2
00020000-5643-5183-b31e-8446d7dd38a6	00030000-5643-5181-de0a-a2ee378211f2
\.


--
-- TOC entry 3138 (class 0 OID 26606698)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 26606732)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 26606869)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5643-5183-a59c-f1ae3eb2ed8f	00090000-5643-5183-fed5-c5252b884ca2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5643-5183-ee98-c18914a8b94c	00090000-5643-5183-854a-3f6b13e84713	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5643-5183-8dbd-461ada70f4d6	00090000-5643-5183-9a1c-9f89dead97bd	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5643-5183-349d-ab0d19d46ac9	00090000-5643-5183-a326-8e315a63697f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3109 (class 0 OID 26606390)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5643-5183-d7cf-445dc6d80ec5	\N	00040000-5643-5180-830f-858830c5e980	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-12f9-433094979786	\N	00040000-5643-5180-830f-858830c5e980	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5643-5183-6418-4788603edc08	\N	00040000-5643-5180-830f-858830c5e980	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-7527-0b3f5b95804c	\N	00040000-5643-5180-830f-858830c5e980	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-dc06-84a678551130	\N	00040000-5643-5180-830f-858830c5e980	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-1e42-b2f5062f0a6e	\N	00040000-5643-5180-a1b6-3e8ed37c9605	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-4d7a-60b4ffb27d9a	\N	00040000-5643-5180-4056-e55606757b1b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-40eb-e72a3e9d6186	\N	00040000-5643-5180-2e69-f072f91fd4a7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5183-70cd-57509c421216	\N	00040000-5643-5180-724d-24511a8f985a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-5185-951a-ac6682ce567e	\N	00040000-5643-5180-830f-858830c5e980	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3112 (class 0 OID 26606435)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5643-5180-daad-85c4e5febe28	8341	Adlešiči
00050000-5643-5180-383d-bc99b81cee23	5270	Ajdovščina
00050000-5643-5180-dd4a-b59417b7f386	6280	Ankaran/Ancarano
00050000-5643-5180-16f3-36ed4f8b4b1a	9253	Apače
00050000-5643-5180-ce73-1da7540c19c0	8253	Artiče
00050000-5643-5180-560a-8870b250ea20	4275	Begunje na Gorenjskem
00050000-5643-5180-47b5-208579bea068	1382	Begunje pri Cerknici
00050000-5643-5180-e89b-a2436458f2fc	9231	Beltinci
00050000-5643-5180-b435-34a7beb61057	2234	Benedikt
00050000-5643-5180-928e-5a86f0e9113a	2345	Bistrica ob Dravi
00050000-5643-5180-52f0-b46a9d3c6f14	3256	Bistrica ob Sotli
00050000-5643-5180-87bb-6db11e7a8811	8259	Bizeljsko
00050000-5643-5180-45d7-faf858e2e872	1223	Blagovica
00050000-5643-5180-1df8-cb276f24fa73	8283	Blanca
00050000-5643-5180-5c86-9bc92aa2102e	4260	Bled
00050000-5643-5180-4bd5-2e274e6ac4e6	4273	Blejska Dobrava
00050000-5643-5180-27d1-1b7445f484c6	9265	Bodonci
00050000-5643-5180-6ff0-b476f2067f35	9222	Bogojina
00050000-5643-5180-d4aa-dab1a8763308	4263	Bohinjska Bela
00050000-5643-5180-b138-9ab524673286	4264	Bohinjska Bistrica
00050000-5643-5180-ebaa-dd0dc63ab527	4265	Bohinjsko jezero
00050000-5643-5180-cfb5-6e553d852917	1353	Borovnica
00050000-5643-5180-3596-c1aaa3f25eae	8294	Boštanj
00050000-5643-5180-04a3-1fd6cde6eba8	5230	Bovec
00050000-5643-5180-5701-2610e81008d8	5295	Branik
00050000-5643-5180-8a57-dce2d8432dec	3314	Braslovče
00050000-5643-5180-8a8d-0c12b7166e88	5223	Breginj
00050000-5643-5180-89bd-d96551490230	8280	Brestanica
00050000-5643-5180-0de7-783855e0bd8d	2354	Bresternica
00050000-5643-5180-01f0-0b0ad7446ba8	4243	Brezje
00050000-5643-5180-48a5-59454ffd2139	1351	Brezovica pri Ljubljani
00050000-5643-5180-9995-44c738b66c4e	8250	Brežice
00050000-5643-5180-971f-29bcb9fd8443	4210	Brnik - Aerodrom
00050000-5643-5180-a0f8-0010b63164cb	8321	Brusnice
00050000-5643-5180-10d8-cd6363c92960	3255	Buče
00050000-5643-5180-7d45-cb6892a55d30	8276	Bučka 
00050000-5643-5180-aa1f-7b9f082eed7c	9261	Cankova
00050000-5643-5180-a9c7-8aa5f58dc9e8	3000	Celje 
00050000-5643-5180-9404-632cbe67bc8e	3001	Celje - poštni predali
00050000-5643-5180-7d69-162ddf0a4124	4207	Cerklje na Gorenjskem
00050000-5643-5180-5e5f-c77ddf960c4e	8263	Cerklje ob Krki
00050000-5643-5180-d92b-c54939754823	1380	Cerknica
00050000-5643-5180-2e93-fb6a07b09441	5282	Cerkno
00050000-5643-5180-b771-31fc5626c2df	2236	Cerkvenjak
00050000-5643-5180-52bd-cb3586177a33	2215	Ceršak
00050000-5643-5180-c2c5-bb042f59ab60	2326	Cirkovce
00050000-5643-5180-b722-38afae84a27d	2282	Cirkulane
00050000-5643-5180-0c51-444c638b1e4d	5273	Col
00050000-5643-5180-69fc-e6a90e9b39e9	8251	Čatež ob Savi
00050000-5643-5180-2ff9-9816e570c206	1413	Čemšenik
00050000-5643-5180-592f-200aec3b3182	5253	Čepovan
00050000-5643-5180-40a0-84591aacef29	9232	Črenšovci
00050000-5643-5180-bcd5-2b071febfc6f	2393	Črna na Koroškem
00050000-5643-5180-1b78-f6fd27e6060e	6275	Črni Kal
00050000-5643-5180-2b33-ee65124ff632	5274	Črni Vrh nad Idrijo
00050000-5643-5180-07af-a90e7e0178f4	5262	Črniče
00050000-5643-5180-7355-3917d57be4be	8340	Črnomelj
00050000-5643-5180-d3f7-8938b1253dbb	6271	Dekani
00050000-5643-5180-9eb6-9c4e72d19bbe	5210	Deskle
00050000-5643-5180-76b5-42fb74b2f4f3	2253	Destrnik
00050000-5643-5180-52f1-55b42d0a1c5f	6215	Divača
00050000-5643-5180-d714-9358d2e276b2	1233	Dob
00050000-5643-5180-03ee-007d2932c16a	3224	Dobje pri Planini
00050000-5643-5180-c2b2-77f9219a7213	8257	Dobova
00050000-5643-5180-962b-c43400bca7ef	1423	Dobovec
00050000-5643-5180-5980-8b6d8c3f89f4	5263	Dobravlje
00050000-5643-5180-5fa1-fa349aaf4f9e	3204	Dobrna
00050000-5643-5180-c317-24c980b514a3	8211	Dobrnič
00050000-5643-5180-d825-d18fafb01379	1356	Dobrova
00050000-5643-5180-e149-c1a3fec5abe9	9223	Dobrovnik/Dobronak 
00050000-5643-5180-f4b8-b68127deeb9c	5212	Dobrovo v Brdih
00050000-5643-5180-b72f-3fdd27d4cae0	1431	Dol pri Hrastniku
00050000-5643-5180-a874-3359310a67d7	1262	Dol pri Ljubljani
00050000-5643-5180-873d-000b3e3020e9	1273	Dole pri Litiji
00050000-5643-5180-adb4-51a0859360fa	1331	Dolenja vas
00050000-5643-5180-aaa4-7cc98a243072	8350	Dolenjske Toplice
00050000-5643-5180-7791-96658a14d726	1230	Domžale
00050000-5643-5180-3503-190054e2cb9f	2252	Dornava
00050000-5643-5180-e5e2-2d4a0b0cb202	5294	Dornberk
00050000-5643-5180-66e5-21cd4ba30175	1319	Draga
00050000-5643-5180-f454-9e818b5fed5e	8343	Dragatuš
00050000-5643-5180-4937-a22484a1c2b7	3222	Dramlje
00050000-5643-5180-8ef8-129ffd4649f4	2370	Dravograd
00050000-5643-5180-2be6-fde1f9e52d1e	4203	Duplje
00050000-5643-5180-965e-5b00c4366c23	6221	Dutovlje
00050000-5643-5180-52df-1711c531174f	8361	Dvor
00050000-5643-5180-1ab3-cb6dec3a46d4	2343	Fala
00050000-5643-5180-23d8-470c66a88204	9208	Fokovci
00050000-5643-5180-8f93-ca36b414d6ff	2313	Fram
00050000-5643-5180-e0ba-125f5ef15986	3213	Frankolovo
00050000-5643-5180-5894-8d132939a9ea	1274	Gabrovka
00050000-5643-5180-829d-7a779381039f	8254	Globoko
00050000-5643-5180-57a7-8327e197e65a	5275	Godovič
00050000-5643-5180-3a7f-a192a234179c	4204	Golnik
00050000-5643-5180-6197-82cabb3a260b	3303	Gomilsko
00050000-5643-5180-c3b3-149c01ad72ae	4224	Gorenja vas
00050000-5643-5180-f388-8d8d19aff6c8	3263	Gorica pri Slivnici
00050000-5643-5180-51e9-40ba15cae836	2272	Gorišnica
00050000-5643-5180-8b1d-50aa4a7bb24e	9250	Gornja Radgona
00050000-5643-5180-0de5-a352ba9ba4b3	3342	Gornji Grad
00050000-5643-5180-0d6d-85876ce49c56	4282	Gozd Martuljek
00050000-5643-5180-102f-f30fa51b27de	6272	Gračišče
00050000-5643-5180-9930-b63e700555a9	9264	Grad
00050000-5643-5180-4b9c-d5f8626ccd6f	8332	Gradac
00050000-5643-5180-ec61-6575676ff2f4	1384	Grahovo
00050000-5643-5180-d360-b25e1d067992	5242	Grahovo ob Bači
00050000-5643-5180-4416-901f3ee1e511	5251	Grgar
00050000-5643-5180-1b7c-19ffa41c0191	3302	Griže
00050000-5643-5180-08c3-7ff0067a4ae9	3231	Grobelno
00050000-5643-5180-0cfd-9832ec6d8a36	1290	Grosuplje
00050000-5643-5180-7281-3448ea0dd71c	2288	Hajdina
00050000-5643-5180-ff81-ff446eb0362b	8362	Hinje
00050000-5643-5180-927d-9c8fe4ad9e16	2311	Hoče
00050000-5643-5180-c4d7-24801d0d5882	9205	Hodoš/Hodos
00050000-5643-5180-7ce2-3247d14d9841	1354	Horjul
00050000-5643-5180-24e6-7ee3bf4b1e64	1372	Hotedršica
00050000-5643-5180-560e-eb54caf83a19	1430	Hrastnik
00050000-5643-5180-2340-a041f88ab375	6225	Hruševje
00050000-5643-5180-3813-174d1e40b47b	4276	Hrušica
00050000-5643-5180-9051-31ed6af1e01a	5280	Idrija
00050000-5643-5180-ab95-8038ce9ca4c0	1292	Ig
00050000-5643-5180-23e8-bb9eb9429f1d	6250	Ilirska Bistrica
00050000-5643-5180-bd4b-3b83b186f662	6251	Ilirska Bistrica-Trnovo
00050000-5643-5180-87fb-1e1ada4c5338	1295	Ivančna Gorica
00050000-5643-5180-e584-bb2e37dec882	2259	Ivanjkovci
00050000-5643-5180-f33f-fe4739955bec	1411	Izlake
00050000-5643-5180-e9e0-15fcaf0d35a9	6310	Izola/Isola
00050000-5643-5180-cb71-275c27aaed19	2222	Jakobski Dol
00050000-5643-5180-018e-6264919bdbdf	2221	Jarenina
00050000-5643-5180-c6d5-49dd8ada4729	6254	Jelšane
00050000-5643-5180-4f7a-64a6351e44c1	4270	Jesenice
00050000-5643-5180-f6d7-648c3193f2ed	8261	Jesenice na Dolenjskem
00050000-5643-5180-bd98-694c70c049c8	3273	Jurklošter
00050000-5643-5180-2a53-380ebaf4ecba	2223	Jurovski Dol
00050000-5643-5180-b6b0-6fe48075c7b9	2256	Juršinci
00050000-5643-5180-5454-aadaa58fc5a7	5214	Kal nad Kanalom
00050000-5643-5180-9e37-3c6d2cd94518	3233	Kalobje
00050000-5643-5180-c7e8-5ce1b45a8adc	4246	Kamna Gorica
00050000-5643-5180-cdb4-1d6ce05460ed	2351	Kamnica
00050000-5643-5180-99fd-d4f425559826	1241	Kamnik
00050000-5643-5180-7e68-b76551708998	5213	Kanal
00050000-5643-5180-65c1-af88d497e20f	8258	Kapele
00050000-5643-5180-0596-4653f43484b3	2362	Kapla
00050000-5643-5180-6a12-3b01325efc79	2325	Kidričevo
00050000-5643-5180-dc04-7ed9e31a47a7	1412	Kisovec
00050000-5643-5180-9434-b1d21ff1ac6b	6253	Knežak
00050000-5643-5180-3da6-2589b969c573	5222	Kobarid
00050000-5643-5180-685e-c200e9a6e8cc	9227	Kobilje
00050000-5643-5180-9c8a-4b04592edcdb	1330	Kočevje
00050000-5643-5180-99ba-669d3a529284	1338	Kočevska Reka
00050000-5643-5180-8e78-e38c22ea5a20	2276	Kog
00050000-5643-5180-ed1b-e92fe9779824	5211	Kojsko
00050000-5643-5180-3320-6e9f22da82e6	6223	Komen
00050000-5643-5180-7e77-f611cf74d9e4	1218	Komenda
00050000-5643-5180-2466-258dc580f33c	6000	Koper/Capodistria 
00050000-5643-5180-9afe-507b989910ca	6001	Koper/Capodistria - poštni predali
00050000-5643-5180-e24f-1ce56b64b6b4	8282	Koprivnica
00050000-5643-5180-462d-dfa6494937cf	5296	Kostanjevica na Krasu
00050000-5643-5180-6bf0-9195ea37a026	8311	Kostanjevica na Krki
00050000-5643-5180-c34f-6441962c3f07	1336	Kostel
00050000-5643-5180-9ea2-bebf9393cb52	6256	Košana
00050000-5643-5180-944e-482f2e142803	2394	Kotlje
00050000-5643-5180-53e3-40062d2ba015	6240	Kozina
00050000-5643-5180-91b9-6cc3bd13d8f8	3260	Kozje
00050000-5643-5180-7dec-922efd4b3867	4000	Kranj 
00050000-5643-5180-0f5c-cbf37ca81f02	4001	Kranj - poštni predali
00050000-5643-5180-849e-5be414c25f74	4280	Kranjska Gora
00050000-5643-5180-5495-62b12aa48ddd	1281	Kresnice
00050000-5643-5180-1aee-26265a75e664	4294	Križe
00050000-5643-5180-7566-cbe1a740fa1e	9206	Križevci
00050000-5643-5180-29cc-98d898dd2906	9242	Križevci pri Ljutomeru
00050000-5643-5180-733c-9e711cc41565	1301	Krka
00050000-5643-5180-5437-d881d646d053	8296	Krmelj
00050000-5643-5180-886a-fc6e7c843e25	4245	Kropa
00050000-5643-5180-63c7-4b3fde49f129	8262	Krška vas
00050000-5643-5180-544a-f6953b517c69	8270	Krško
00050000-5643-5180-fe78-5d64f2b8c8da	9263	Kuzma
00050000-5643-5180-cdac-b00c032a4c8f	2318	Laporje
00050000-5643-5180-962d-ce62a3f66891	3270	Laško
00050000-5643-5180-d0ae-25b4a5ea2f38	1219	Laze v Tuhinju
00050000-5643-5180-57c0-71d55577cd67	2230	Lenart v Slovenskih goricah
00050000-5643-5180-5379-8120ae0758c1	9220	Lendava/Lendva
00050000-5643-5180-bd8e-960534d8338b	4248	Lesce
00050000-5643-5180-c785-40f2f9a26443	3261	Lesično
00050000-5643-5180-fdf1-eafc5f42e7b7	8273	Leskovec pri Krškem
00050000-5643-5180-bb61-81ee6411cb44	2372	Libeliče
00050000-5643-5180-250a-f22c897d140f	2341	Limbuš
00050000-5643-5180-587d-69224ace9378	1270	Litija
00050000-5643-5180-86f2-c48e9c9c5d88	3202	Ljubečna
00050000-5643-5180-c9b0-631f9d21a9f7	1000	Ljubljana 
00050000-5643-5180-5321-23081b85791f	1001	Ljubljana - poštni predali
00050000-5643-5180-40e6-8f15682fd23d	1231	Ljubljana - Črnuče
00050000-5643-5180-dc63-d344cd389527	1261	Ljubljana - Dobrunje
00050000-5643-5180-12c4-18ace63c0a3d	1260	Ljubljana - Polje
00050000-5643-5180-13f6-8a5081580413	1210	Ljubljana - Šentvid
00050000-5643-5180-c566-3e82791b4709	1211	Ljubljana - Šmartno
00050000-5643-5180-a07d-5102fa484578	3333	Ljubno ob Savinji
00050000-5643-5180-b6af-584262a3603b	9240	Ljutomer
00050000-5643-5180-f086-22732e9efdf4	3215	Loče
00050000-5643-5180-d95e-dd4d922c4a2a	5231	Log pod Mangartom
00050000-5643-5180-f720-992aa8364ab6	1358	Log pri Brezovici
00050000-5643-5180-0a3b-2926fd3f2b2c	1370	Logatec
00050000-5643-5180-5adc-b0bf89c971bf	1371	Logatec
00050000-5643-5180-753a-9521aea7e3c6	1434	Loka pri Zidanem Mostu
00050000-5643-5180-4835-6a301d77e855	3223	Loka pri Žusmu
00050000-5643-5180-feb1-772ac15a3505	6219	Lokev
00050000-5643-5180-f810-492c0cf57bc6	1318	Loški Potok
00050000-5643-5180-b494-300bdc7f2e97	2324	Lovrenc na Dravskem polju
00050000-5643-5180-63c2-2dbbe13ede4d	2344	Lovrenc na Pohorju
00050000-5643-5180-5c93-13472886ddf1	3334	Luče
00050000-5643-5180-957e-5a7cb2dff153	1225	Lukovica
00050000-5643-5180-cf2f-64eb6d8a3aa2	9202	Mačkovci
00050000-5643-5180-c601-a84cfae6c219	2322	Majšperk
00050000-5643-5180-fc78-0014e73c3ed4	2321	Makole
00050000-5643-5180-08bb-bd88dc9f8b50	9243	Mala Nedelja
00050000-5643-5180-ee25-0f2e8f204e4e	2229	Malečnik
00050000-5643-5180-a7df-358cbd7396f0	6273	Marezige
00050000-5643-5180-9085-d129881dda34	2000	Maribor 
00050000-5643-5180-ddbd-3918d32d7c2d	2001	Maribor - poštni predali
00050000-5643-5180-f482-98768d6014db	2206	Marjeta na Dravskem polju
00050000-5643-5180-6eb9-c88ad8ac8788	2281	Markovci
00050000-5643-5180-03aa-d1b2985308e1	9221	Martjanci
00050000-5643-5180-0cf3-ae63028f5548	6242	Materija
00050000-5643-5180-1c4e-2b04ab6481d3	4211	Mavčiče
00050000-5643-5180-ef6d-fca8c103c00e	1215	Medvode
00050000-5643-5180-c578-f8c708f3effb	1234	Mengeš
00050000-5643-5180-480e-eba0e740e724	8330	Metlika
00050000-5643-5180-33d1-66903adb0a0c	2392	Mežica
00050000-5643-5180-71de-7ef8e5bdd6e6	2204	Miklavž na Dravskem polju
00050000-5643-5180-568f-264e9f63a1d3	2275	Miklavž pri Ormožu
00050000-5643-5180-3231-2cd177088d61	5291	Miren
00050000-5643-5180-f1b2-877feab56b8f	8233	Mirna
00050000-5643-5180-6e1c-6cd20f525529	8216	Mirna Peč
00050000-5643-5180-9e46-646702da7308	2382	Mislinja
00050000-5643-5180-99d1-97fa1f2baa38	4281	Mojstrana
00050000-5643-5180-9be9-0bcfc861cde5	8230	Mokronog
00050000-5643-5180-0f57-3fbe74ecd138	1251	Moravče
00050000-5643-5180-6438-3d2959988180	9226	Moravske Toplice
00050000-5643-5180-c2c1-6fa04a7178d0	5216	Most na Soči
00050000-5643-5180-815a-bde673617f68	1221	Motnik
00050000-5643-5180-2164-27d86d576385	3330	Mozirje
00050000-5643-5180-bfc6-df0c6d91c65e	9000	Murska Sobota 
00050000-5643-5180-c808-7a3ed596a39f	9001	Murska Sobota - poštni predali
00050000-5643-5180-026e-e826a6a0d9a4	2366	Muta
00050000-5643-5180-5db9-e131f9364520	4202	Naklo
00050000-5643-5180-db80-6aa71cd5f42e	3331	Nazarje
00050000-5643-5180-8848-2fb423046109	1357	Notranje Gorice
00050000-5643-5180-9dfa-61bd5b08b3f0	3203	Nova Cerkev
00050000-5643-5180-979f-8c6b538eab16	5000	Nova Gorica 
00050000-5643-5180-bf0d-7faca7d530b5	5001	Nova Gorica - poštni predali
00050000-5643-5180-b08e-b577e8460f41	1385	Nova vas
00050000-5643-5180-9686-771759844e5e	8000	Novo mesto
00050000-5643-5180-df7b-795b41f3d9c6	8001	Novo mesto - poštni predali
00050000-5643-5180-394d-41af2d3e9ffa	6243	Obrov
00050000-5643-5180-0cd1-b01bfc3e3e35	9233	Odranci
00050000-5643-5180-675d-d3042f9a3b2f	2317	Oplotnica
00050000-5643-5180-f9b1-63e23d2e59b9	2312	Orehova vas
00050000-5643-5180-c34d-e05e39b047f5	2270	Ormož
00050000-5643-5180-e945-499ab7f4b901	1316	Ortnek
00050000-5643-5180-79bd-2b449f9d4a05	1337	Osilnica
00050000-5643-5180-15ae-95db24ceccd1	8222	Otočec
00050000-5643-5180-43c3-b188e733323a	2361	Ožbalt
00050000-5643-5180-5836-cf7993bb99ad	2231	Pernica
00050000-5643-5180-68c6-47e9311c57f6	2211	Pesnica pri Mariboru
00050000-5643-5180-9de3-e3f66cfde978	9203	Petrovci
00050000-5643-5180-9a1b-5b0f65bcec58	3301	Petrovče
00050000-5643-5180-ef99-ee4f6954a277	6330	Piran/Pirano
00050000-5643-5180-8663-908b6500048c	8255	Pišece
00050000-5643-5180-0f32-aaae68cd3438	6257	Pivka
00050000-5643-5180-6805-27efab1a36ed	6232	Planina
00050000-5643-5180-a713-7ca305a86dbf	3225	Planina pri Sevnici
00050000-5643-5180-e1ba-56b87ce58297	6276	Pobegi
00050000-5643-5180-c1ee-65117f0633a1	8312	Podbočje
00050000-5643-5180-8848-dd1a3618aa68	5243	Podbrdo
00050000-5643-5180-9cb0-5c97688ff709	3254	Podčetrtek
00050000-5643-5180-36d5-0c8bd83b9e43	2273	Podgorci
00050000-5643-5180-6e53-8dc3604612b6	6216	Podgorje
00050000-5643-5180-2756-33743d401e2d	2381	Podgorje pri Slovenj Gradcu
00050000-5643-5180-e2cc-2e222404fde5	6244	Podgrad
00050000-5643-5180-6b44-ac3a05bd91f5	1414	Podkum
00050000-5643-5180-d6cb-3911f2b7a5c6	2286	Podlehnik
00050000-5643-5180-7fda-aea757aa5de1	5272	Podnanos
00050000-5643-5180-6e38-4e1a447151fe	4244	Podnart
00050000-5643-5180-fcc3-487e7a80134e	3241	Podplat
00050000-5643-5180-2036-217b118b7b7b	3257	Podsreda
00050000-5643-5180-d84d-84191c595094	2363	Podvelka
00050000-5643-5180-13b2-e74a2c3a9ccc	2208	Pohorje
00050000-5643-5180-9584-8f8982900121	2257	Polenšak
00050000-5643-5180-31ca-954492e6c2cc	1355	Polhov Gradec
00050000-5643-5180-bc40-e9d5455fd480	4223	Poljane nad Škofjo Loko
00050000-5643-5180-bf54-c5550c71b306	2319	Poljčane
00050000-5643-5180-e803-e3780b4b9ace	1272	Polšnik
00050000-5643-5180-de8f-868a4499907e	3313	Polzela
00050000-5643-5180-f8cd-5cf39cc44350	3232	Ponikva
00050000-5643-5180-6b4b-738407f2a4d8	6320	Portorož/Portorose
00050000-5643-5180-d4e1-2965328641ae	6230	Postojna
00050000-5643-5180-1d64-ad5354f40a9d	2331	Pragersko
00050000-5643-5180-fe31-c4b71aa2f484	3312	Prebold
00050000-5643-5180-c875-554afac03703	4205	Preddvor
00050000-5643-5180-0ca5-1eb1799a0d84	6255	Prem
00050000-5643-5180-e8e0-5bb81e0f63ae	1352	Preserje
00050000-5643-5180-9651-0cd81f1451ec	6258	Prestranek
00050000-5643-5180-011a-1d5497b4cfa5	2391	Prevalje
00050000-5643-5180-7ca2-63484a3fc379	3262	Prevorje
00050000-5643-5180-8f30-aafe835b53e7	1276	Primskovo 
00050000-5643-5180-fc1c-ea2e5b8e7a50	3253	Pristava pri Mestinju
00050000-5643-5180-57e4-4ec8c7824e2b	9207	Prosenjakovci/Partosfalva
00050000-5643-5180-df71-18978fa8a457	5297	Prvačina
00050000-5643-5180-9ed2-c0d764b7666d	2250	Ptuj
00050000-5643-5180-4416-87cf76ec9e37	2323	Ptujska Gora
00050000-5643-5180-2986-3e6df429ef7e	9201	Puconci
00050000-5643-5180-2da1-3b58eaf6e6d1	2327	Rače
00050000-5643-5180-c96e-82b9ec8c67c2	1433	Radeče
00050000-5643-5180-5317-f2e6df7fed13	9252	Radenci
00050000-5643-5180-404f-08ac7c1ceb53	2360	Radlje ob Dravi
00050000-5643-5180-b4cf-e79fa9bc4571	1235	Radomlje
00050000-5643-5180-9fa9-e84667fc8d54	4240	Radovljica
00050000-5643-5180-f286-8b69eb301d4f	8274	Raka
00050000-5643-5180-fca2-c79bff6c3212	1381	Rakek
00050000-5643-5180-a16d-e80b243b9648	4283	Rateče - Planica
00050000-5643-5180-7d65-efc984919b3a	2390	Ravne na Koroškem
00050000-5643-5180-6f00-fb326e1a70b9	9246	Razkrižje
00050000-5643-5180-ad83-04abddbfa755	3332	Rečica ob Savinji
00050000-5643-5180-471e-5165b5b54b41	5292	Renče
00050000-5643-5180-fd4f-e0ca5b28d64e	1310	Ribnica
00050000-5643-5180-45c8-6f93f97d541a	2364	Ribnica na Pohorju
00050000-5643-5180-4506-aac0b994adf8	3272	Rimske Toplice
00050000-5643-5180-049d-16863d0aa8e3	1314	Rob
00050000-5643-5180-c3e2-587498b63389	5215	Ročinj
00050000-5643-5180-4ebf-1e577215ecbb	3250	Rogaška Slatina
00050000-5643-5180-5213-508243d5fc7f	9262	Rogašovci
00050000-5643-5180-d453-6213645bfe99	3252	Rogatec
00050000-5643-5180-04e1-1343f897fced	1373	Rovte
00050000-5643-5180-008f-d60a0e23d735	2342	Ruše
00050000-5643-5180-066e-f56712a52136	1282	Sava
00050000-5643-5180-9f9d-0f3b5d540974	6333	Sečovlje/Sicciole
00050000-5643-5180-1255-9b35021841fb	4227	Selca
00050000-5643-5180-925d-28586d4ec171	2352	Selnica ob Dravi
00050000-5643-5180-1475-f9216a60dac4	8333	Semič
00050000-5643-5180-6e5b-53a57f63c148	8281	Senovo
00050000-5643-5180-f995-e199b1d2601c	6224	Senožeče
00050000-5643-5180-3c7e-787acda533c7	8290	Sevnica
00050000-5643-5180-6c66-8e0abd92dd17	6210	Sežana
00050000-5643-5180-9e5e-e4ad253a0295	2214	Sladki Vrh
00050000-5643-5180-6fa8-003802a2d6dd	5283	Slap ob Idrijci
00050000-5643-5180-ae43-e7e1a62972e7	2380	Slovenj Gradec
00050000-5643-5180-e135-cc84e2c8e728	2310	Slovenska Bistrica
00050000-5643-5180-b8cf-43410a2086e0	3210	Slovenske Konjice
00050000-5643-5180-f65e-3901e3ad1332	1216	Smlednik
00050000-5643-5180-656e-5194bf9d651a	5232	Soča
00050000-5643-5180-ddeb-f402e5a0db01	1317	Sodražica
00050000-5643-5180-10eb-12668d576718	3335	Solčava
00050000-5643-5180-e851-15e6943afb22	5250	Solkan
00050000-5643-5180-019a-cd0e2aed15a6	4229	Sorica
00050000-5643-5180-3d9d-e8710687932d	4225	Sovodenj
00050000-5643-5180-d852-c8a5a1921a36	5281	Spodnja Idrija
00050000-5643-5180-dd88-c0ccac573adf	2241	Spodnji Duplek
00050000-5643-5180-abc0-6540d845199c	9245	Spodnji Ivanjci
00050000-5643-5180-6dad-04be386970d3	2277	Središče ob Dravi
00050000-5643-5180-559c-293c37085ecd	4267	Srednja vas v Bohinju
00050000-5643-5180-3204-64b30ac28458	8256	Sromlje 
00050000-5643-5180-7145-d19b23b1e6a2	5224	Srpenica
00050000-5643-5180-eea6-233822314396	1242	Stahovica
00050000-5643-5180-ccab-8f311a8164ca	1332	Stara Cerkev
00050000-5643-5180-d193-83e464a46285	8342	Stari trg ob Kolpi
00050000-5643-5180-fb98-f8f11638adac	1386	Stari trg pri Ložu
00050000-5643-5180-6846-da97a4db5e48	2205	Starše
00050000-5643-5180-ba44-ba61253a4cf1	2289	Stoperce
00050000-5643-5180-9f11-ab87e61b9b3c	8322	Stopiče
00050000-5643-5180-b354-8d7e2a716ab1	3206	Stranice
00050000-5643-5180-5df1-42e812d0755f	8351	Straža
00050000-5643-5180-20d9-db7601361950	1313	Struge
00050000-5643-5180-1100-1eabb643863d	8293	Studenec
00050000-5643-5180-670e-80480ede9ae3	8331	Suhor
00050000-5643-5180-d51d-4c9ae4edc054	2233	Sv. Ana v Slovenskih goricah
00050000-5643-5180-2db2-374c000520cd	2235	Sv. Trojica v Slovenskih goricah
00050000-5643-5180-7c63-3e7d95367f9a	2353	Sveti Duh na Ostrem Vrhu
00050000-5643-5180-8fc5-b438bb47f748	9244	Sveti Jurij ob Ščavnici
00050000-5643-5180-8322-28fb97c1c180	3264	Sveti Štefan
00050000-5643-5180-b29a-b97f9488303c	2258	Sveti Tomaž
00050000-5643-5180-5ba3-3e0187314b53	9204	Šalovci
00050000-5643-5180-b417-ae2b3ae816e7	5261	Šempas
00050000-5643-5180-8eb3-6061c6e279c5	5290	Šempeter pri Gorici
00050000-5643-5180-4f85-f3adebb2d022	3311	Šempeter v Savinjski dolini
00050000-5643-5180-6b49-886ac79fb88c	4208	Šenčur
00050000-5643-5180-99d2-0b187ee2849e	2212	Šentilj v Slovenskih goricah
00050000-5643-5180-d51c-2fee67ce98c4	8297	Šentjanž
00050000-5643-5180-039f-c764ca202dfd	2373	Šentjanž pri Dravogradu
00050000-5643-5180-0253-b48a5740aac9	8310	Šentjernej
00050000-5643-5180-8a7c-71b7463adcfe	3230	Šentjur
00050000-5643-5180-bb1b-f1a3cb1d7261	3271	Šentrupert
00050000-5643-5180-eb49-9c610daf1351	8232	Šentrupert
00050000-5643-5180-f87f-a682ed84477c	1296	Šentvid pri Stični
00050000-5643-5180-590f-f618c020604c	8275	Škocjan
00050000-5643-5180-8485-0703dca2e48f	6281	Škofije
00050000-5643-5180-f659-912e5143454a	4220	Škofja Loka
00050000-5643-5180-215b-376cd07a9705	3211	Škofja vas
00050000-5643-5180-eec0-42a787dc4b2b	1291	Škofljica
00050000-5643-5180-a6f5-1cf7e26280db	6274	Šmarje
00050000-5643-5180-0c2f-9962c8aa578b	1293	Šmarje - Sap
00050000-5643-5180-d25a-29cbf293df29	3240	Šmarje pri Jelšah
00050000-5643-5180-2f41-cab0e6697fda	8220	Šmarješke Toplice
00050000-5643-5180-886f-c7f0cb6fc17e	2315	Šmartno na Pohorju
00050000-5643-5180-5d2d-ea3f458b973a	3341	Šmartno ob Dreti
00050000-5643-5180-673d-d17088dccd70	3327	Šmartno ob Paki
00050000-5643-5180-0061-b694808d1f1e	1275	Šmartno pri Litiji
00050000-5643-5180-0b1c-d0aa6f691b58	2383	Šmartno pri Slovenj Gradcu
00050000-5643-5180-cae4-63044e9cc52b	3201	Šmartno v Rožni dolini
00050000-5643-5180-f639-5edf61e4ff88	3325	Šoštanj
00050000-5643-5180-8f9e-76b8a1f94604	6222	Štanjel
00050000-5643-5180-277c-6ac99b32c3e3	3220	Štore
00050000-5643-5180-d505-909a5a703525	3304	Tabor
00050000-5643-5180-a0e6-a93c85f36232	3221	Teharje
00050000-5643-5180-ffe8-9ad451b91176	9251	Tišina
00050000-5643-5180-2362-714b34704c15	5220	Tolmin
00050000-5643-5180-ab42-13086f77115d	3326	Topolšica
00050000-5643-5180-64cf-d52b69cf72bb	2371	Trbonje
00050000-5643-5180-bc98-aa36d0c6106c	1420	Trbovlje
00050000-5643-5180-f60d-c117da37d356	8231	Trebelno 
00050000-5643-5180-8817-8a15c9d2d1a9	8210	Trebnje
00050000-5643-5180-ad7a-b717316b7830	5252	Trnovo pri Gorici
00050000-5643-5180-41c0-f8a92095cffb	2254	Trnovska vas
00050000-5643-5180-63e9-87e59f978175	1222	Trojane
00050000-5643-5180-405e-5ec932f5c613	1236	Trzin
00050000-5643-5180-5d84-17ae32f82236	4290	Tržič
00050000-5643-5180-3c50-0e2acf3ed3ee	8295	Tržišče
00050000-5643-5180-0e04-1ed2cf996fc7	1311	Turjak
00050000-5643-5180-40d6-e16d38d06248	9224	Turnišče
00050000-5643-5180-6ff4-9054251f9207	8323	Uršna sela
00050000-5643-5180-fc42-f1a3d6ef88e4	1252	Vače
00050000-5643-5180-aeed-c5130302d16d	3320	Velenje 
00050000-5643-5180-9098-0d55ae1ec772	3322	Velenje - poštni predali
00050000-5643-5180-513d-8a5d7f6e88d0	8212	Velika Loka
00050000-5643-5180-6ed1-04823e5714a7	2274	Velika Nedelja
00050000-5643-5180-f897-31f236fdd8f6	9225	Velika Polana
00050000-5643-5180-dc54-fa8c86076e82	1315	Velike Lašče
00050000-5643-5180-ac01-18e3360f9a6c	8213	Veliki Gaber
00050000-5643-5180-c85e-931c45c0f9f5	9241	Veržej
00050000-5643-5180-2109-18a4b7832596	1312	Videm - Dobrepolje
00050000-5643-5180-7aae-d1c9d3047f72	2284	Videm pri Ptuju
00050000-5643-5180-a8dd-f744f4723e9c	8344	Vinica
00050000-5643-5180-159a-457e834f265c	5271	Vipava
00050000-5643-5180-0c03-c26b8e656ba0	4212	Visoko
00050000-5643-5180-f2a3-8fcb840e3a80	1294	Višnja Gora
00050000-5643-5180-0f37-e3c7cadde993	3205	Vitanje
00050000-5643-5180-a181-e59972559056	2255	Vitomarci
00050000-5643-5180-b166-e278e0c5efc0	1217	Vodice
00050000-5643-5180-2406-e4bdc6051bc0	3212	Vojnik\t
00050000-5643-5180-d274-205bab1c4ed9	5293	Volčja Draga
00050000-5643-5180-b6b3-3f5ef3b10767	2232	Voličina
00050000-5643-5180-2785-504585f5b3ad	3305	Vransko
00050000-5643-5180-9919-92f21dd404e6	6217	Vremski Britof
00050000-5643-5180-488b-a21bf5596390	1360	Vrhnika
00050000-5643-5180-6ce0-813d687fc0df	2365	Vuhred
00050000-5643-5180-8201-1aaaaaaa2072	2367	Vuzenica
00050000-5643-5180-3ff2-a2976b42e7a4	8292	Zabukovje 
00050000-5643-5180-425a-2c3e6a39e27e	1410	Zagorje ob Savi
00050000-5643-5180-d3d7-adb8474f5999	1303	Zagradec
00050000-5643-5180-4d0f-6da50abc5ed3	2283	Zavrč
00050000-5643-5180-5be2-8a4337d59f87	8272	Zdole 
00050000-5643-5180-5084-eff2c7307a05	4201	Zgornja Besnica
00050000-5643-5180-dc13-6c732d0f7ef2	2242	Zgornja Korena
00050000-5643-5180-19ef-8860a45f6df1	2201	Zgornja Kungota
00050000-5643-5180-53b4-01dc1b5fdb47	2316	Zgornja Ložnica
00050000-5643-5180-5056-b5d162539498	2314	Zgornja Polskava
00050000-5643-5180-57ac-217a6fe23dcd	2213	Zgornja Velka
00050000-5643-5180-1136-fc30d5d0b884	4247	Zgornje Gorje
00050000-5643-5180-486d-86c5579e6bf9	4206	Zgornje Jezersko
00050000-5643-5180-be09-08484c97129b	2285	Zgornji Leskovec
00050000-5643-5180-bcca-cd659c7ea876	1432	Zidani Most
00050000-5643-5180-1f65-68ab5190e734	3214	Zreče
00050000-5643-5180-6a09-cbaa0fae41c1	4209	Žabnica
00050000-5643-5180-565e-86d95b81d7c6	3310	Žalec
00050000-5643-5180-d1f2-700671e97a08	4228	Železniki
00050000-5643-5180-3602-d361eb3a4911	2287	Žetale
00050000-5643-5180-b8fe-6c11dbd16984	4226	Žiri
00050000-5643-5180-23a3-2a771631e04e	4274	Žirovnica
00050000-5643-5180-5742-f50139846208	8360	Žužemberk
\.


--
-- TOC entry 3161 (class 0 OID 26607096)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 26606672)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 26606420)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5643-5183-99cd-0b1f41a5104e	00080000-5643-5183-d7cf-445dc6d80ec5	\N	00040000-5643-5180-830f-858830c5e980	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5643-5183-3112-c033bf008850	00080000-5643-5183-d7cf-445dc6d80ec5	\N	00040000-5643-5180-830f-858830c5e980	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5643-5183-c8c0-eb1509a273e8	00080000-5643-5183-12f9-433094979786	\N	00040000-5643-5180-830f-858830c5e980	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3123 (class 0 OID 26606564)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5643-5181-28e1-4289144ef2ca	novo leto	1	1	\N	t
00430000-5643-5181-8cdc-79f595b3d035	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5643-5181-98e6-3194d56fb33b	dan upora proti okupatorju	27	4	\N	t
00430000-5643-5181-38d5-c8e10af62a74	praznik dela	1	5	\N	t
00430000-5643-5181-9961-196d8b8524fb	praznik dela	2	5	\N	t
00430000-5643-5181-fb38-aabd18d5c5bc	dan Primoža Trubarja	8	6	\N	f
00430000-5643-5181-ac6d-263f1bb3b894	dan državnosti	25	6	\N	t
00430000-5643-5181-413d-9f34d2f95c85	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5643-5181-55c8-c19afd513077	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5643-5181-ed70-163245881711	dan suverenosti	25	10	\N	f
00430000-5643-5181-b8e9-0a4415d68844	dan spomina na mrtve	1	11	\N	t
00430000-5643-5181-1e7f-a16385ecdcb0	dan Rudolfa Maistra	23	11	\N	f
00430000-5643-5181-d47c-e8e5124222c0	božič	25	12	\N	t
00430000-5643-5181-7547-043a7b8217f3	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5643-5181-74ff-b855c03bd7f3	Marijino vnebovzetje	15	8	\N	t
00430000-5643-5181-c183-58daaadae6d6	dan reformacije	31	10	\N	t
00430000-5643-5181-87b4-0398535111b9	velikonočna nedelja	27	3	2016	t
00430000-5643-5181-2b37-c3c78845244b	velikonočna nedelja	16	4	2017	t
00430000-5643-5181-d99f-4581285f4111	velikonočna nedelja	1	4	2018	t
00430000-5643-5181-6551-d88835204a2d	velikonočna nedelja	21	4	2019	t
00430000-5643-5181-0005-f8dd18294930	velikonočna nedelja	12	4	2020	t
00430000-5643-5181-e7c3-5c3a31246e89	velikonočna nedelja	4	4	2021	t
00430000-5643-5181-4732-84ae5f45819d	velikonočna nedelja	17	4	2022	t
00430000-5643-5181-41ec-737f3ba0da5c	velikonočna nedelja	9	4	2023	t
00430000-5643-5181-be9e-36c963b62d3b	velikonočna nedelja	31	3	2024	t
00430000-5643-5181-196e-39f82d3fdba7	velikonočna nedelja	20	4	2025	t
00430000-5643-5181-804e-58c95311672d	velikonočna nedelja	5	4	2026	t
00430000-5643-5181-bb41-838ad3f1520e	velikonočna nedelja	28	3	2027	t
00430000-5643-5181-d169-482e9b0f514c	velikonočna nedelja	16	4	2028	t
00430000-5643-5181-ff98-cf962eb8ea23	velikonočna nedelja	1	4	2029	t
00430000-5643-5181-d348-cea04406ee0b	velikonočna nedelja	21	4	2030	t
00430000-5643-5181-0ea4-f23a40238824	velikonočni ponedeljek	28	3	2016	t
00430000-5643-5181-9537-225fdbb21b4e	velikonočni ponedeljek	17	4	2017	t
00430000-5643-5181-3880-1b4867ab97d6	velikonočni ponedeljek	2	4	2018	t
00430000-5643-5181-09f9-9c6d2d0e9285	velikonočni ponedeljek	22	4	2019	t
00430000-5643-5181-25f1-267da906aa39	velikonočni ponedeljek	13	4	2020	t
00430000-5643-5181-1d33-106cdc5754a8	velikonočni ponedeljek	5	4	2021	t
00430000-5643-5181-3e89-b64cc3b8f69f	velikonočni ponedeljek	18	4	2022	t
00430000-5643-5181-3738-af5a0f05b74e	velikonočni ponedeljek	10	4	2023	t
00430000-5643-5181-439a-dfd9ffbc71a8	velikonočni ponedeljek	1	4	2024	t
00430000-5643-5181-4bc3-1ce215b087a2	velikonočni ponedeljek	21	4	2025	t
00430000-5643-5181-49ca-f4e3167172a7	velikonočni ponedeljek	6	4	2026	t
00430000-5643-5181-8fe5-7b35dc61208b	velikonočni ponedeljek	29	3	2027	t
00430000-5643-5181-7f8b-51366b3bff09	velikonočni ponedeljek	17	4	2028	t
00430000-5643-5181-0e5b-a642c6dc37b3	velikonočni ponedeljek	2	4	2029	t
00430000-5643-5181-2a6a-ed1c19b9fd15	velikonočni ponedeljek	22	4	2030	t
00430000-5643-5181-aab7-392a8d12db17	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5643-5181-fa5f-d9428a5ea778	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5643-5181-7a08-88b2c1b81626	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5643-5181-2d05-d7911ea23d89	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5643-5181-cc02-1fa3b900d85a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5643-5181-636e-e7e725552dc8	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5643-5181-d352-1688c2a87dd3	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5643-5181-43a6-a1e136998e28	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5643-5181-fc0a-ed33a4ace3c3	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5643-5181-01b2-962473fe8e68	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5643-5181-667f-1a9fe961d465	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5643-5181-ba77-13852f653d62	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5643-5181-75cb-a6bd94b73bfa	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5643-5181-c9f1-2df681456e9c	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5643-5181-5b7b-3313e1068e6c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3119 (class 0 OID 26606524)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 26606536)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 26606684)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 26607110)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 26607120)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5643-5183-6a68-a75e1917d106	00080000-5643-5183-6418-4788603edc08	0987	AK
00190000-5643-5183-f18d-fb710f1d2324	00080000-5643-5183-12f9-433094979786	0989	AK
00190000-5643-5183-fe60-675e5cde4428	00080000-5643-5183-7527-0b3f5b95804c	0986	AK
00190000-5643-5183-ed3b-097a8007ccd1	00080000-5643-5183-1e42-b2f5062f0a6e	0984	AK
00190000-5643-5183-0b06-d6bd7749c23f	00080000-5643-5183-4d7a-60b4ffb27d9a	0983	AK
00190000-5643-5183-3f7a-cdaa7b313a4d	00080000-5643-5183-40eb-e72a3e9d6186	0982	AK
00190000-5643-5185-5390-63d3e2a80f0f	00080000-5643-5185-951a-ac6682ce567e	1001	AK
\.


--
-- TOC entry 3160 (class 0 OID 26607019)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5643-5183-17c7-6fa847d30ed2	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3164 (class 0 OID 26607128)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 26606713)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5643-5183-2e81-b094e3b43969	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5643-5183-6262-a7897dbb46ef	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5643-5183-a8f9-6229fd5814c8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5643-5183-3004-bf0c03829880	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5643-5183-251d-4674e69ed7a7	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5643-5183-0e03-efde5996e1e9	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5643-5183-7255-06c6eff809b2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3132 (class 0 OID 26606657)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 26606647)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 26606858)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 26606788)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26606498)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 26606260)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5643-5185-951a-ac6682ce567e	00010000-5643-5181-be92-58a632eb126f	2015-11-11 15:32:37	INS	a:0:{}
2	App\\Entity\\Option	00000000-5643-5185-764d-d10f991cca0b	00010000-5643-5181-be92-58a632eb126f	2015-11-11 15:32:37	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5643-5185-5390-63d3e2a80f0f	00010000-5643-5181-be92-58a632eb126f	2015-11-11 15:32:37	INS	a:0:{}
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3141 (class 0 OID 26606726)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 26606298)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5643-5181-f7eb-a08c388b2e03	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5643-5181-8ca7-cc88dda79b5e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5643-5181-212c-feaf999cdb28	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5643-5181-ffd7-ca5fbdbf8374	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5643-5181-bf0e-058030419928	planer	Planer dogodkov v koledarju	t
00020000-5643-5181-31ea-7b69c502e154	kadrovska	Kadrovska služba	t
00020000-5643-5181-9f2a-d90dcea91b37	arhivar	Ažuriranje arhivalij	t
00020000-5643-5181-4e06-a6bf9931cf14	igralec	Igralec	t
00020000-5643-5181-a4c0-3c70a32b13c9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5643-5183-56c6-04ca734dab9f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5643-5183-7db9-30a89502a34a	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5643-5183-1cf7-1642b425110f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5643-5183-8e89-285411cff0b8	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5643-5183-7871-b7efc6754ca2	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5643-5183-6f7b-bbd9b680d7ea	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5643-5183-a364-640c0ad1e1b7	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5643-5183-25ee-2f85f8361156	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5643-5183-b31e-8446d7dd38a6	Mapa-append	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3098 (class 0 OID 26606282)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5643-5181-cd9b-334f962acc76	00020000-5643-5181-212c-feaf999cdb28
00010000-5643-5181-be92-58a632eb126f	00020000-5643-5181-212c-feaf999cdb28
00010000-5643-5183-3c56-d97ad94dc414	00020000-5643-5183-56c6-04ca734dab9f
00010000-5643-5183-1b5c-fd294bf4453f	00020000-5643-5183-7db9-30a89502a34a
00010000-5643-5183-1b5c-fd294bf4453f	00020000-5643-5183-6f7b-bbd9b680d7ea
00010000-5643-5183-3143-f78c8a65c4e2	00020000-5643-5183-1cf7-1642b425110f
00010000-5643-5183-3143-f78c8a65c4e2	00020000-5643-5183-a364-640c0ad1e1b7
00010000-5643-5183-f0be-825ddcb93f05	00020000-5643-5183-1cf7-1642b425110f
00010000-5643-5183-f0be-825ddcb93f05	00020000-5643-5183-8e89-285411cff0b8
00010000-5643-5183-f0be-825ddcb93f05	00020000-5643-5183-a364-640c0ad1e1b7
00010000-5643-5183-f0be-825ddcb93f05	00020000-5643-5183-25ee-2f85f8361156
00010000-5643-5183-f0be-825ddcb93f05	00020000-5643-5183-b31e-8446d7dd38a6
00010000-5643-5183-6629-89c45599a106	00020000-5643-5183-7db9-30a89502a34a
00010000-5643-5183-6629-89c45599a106	00020000-5643-5183-7871-b7efc6754ca2
\.


--
-- TOC entry 3143 (class 0 OID 26606740)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 26606678)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 26606624)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5643-5183-f502-c6d3f875af46	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5643-5183-2daf-d8124a221907	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5643-5183-9f33-ef0d8e346c3b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3094 (class 0 OID 26606247)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5643-5180-5550-50796b0a94cb	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5643-5180-8da5-6d32760e3a06	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5643-5180-ec77-9972b2867097	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5643-5180-eaf0-1dee2bc74363	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5643-5180-0c5b-8a8d9dacf7fa	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3093 (class 0 OID 26606239)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5643-5180-e105-830d00bc908d	00230000-5643-5180-eaf0-1dee2bc74363	popa
00240000-5643-5180-e539-752c62dcc70c	00230000-5643-5180-eaf0-1dee2bc74363	oseba
00240000-5643-5180-8c8f-b8f7b66ceadb	00230000-5643-5180-eaf0-1dee2bc74363	tippopa
00240000-5643-5180-dfb1-f13eb45115ad	00230000-5643-5180-eaf0-1dee2bc74363	organizacijskaenota
00240000-5643-5180-5deb-106f21b15b6a	00230000-5643-5180-eaf0-1dee2bc74363	sezona
00240000-5643-5180-4aa1-48462e547638	00230000-5643-5180-eaf0-1dee2bc74363	tipvaje
00240000-5643-5180-1098-d09786c10368	00230000-5643-5180-8da5-6d32760e3a06	prostor
00240000-5643-5180-62d4-a63e38493a44	00230000-5643-5180-eaf0-1dee2bc74363	besedilo
00240000-5643-5180-4c79-5b19e841044d	00230000-5643-5180-eaf0-1dee2bc74363	uprizoritev
00240000-5643-5180-616e-07fdc5c8e3f7	00230000-5643-5180-eaf0-1dee2bc74363	funkcija
00240000-5643-5180-d23a-b60202b118de	00230000-5643-5180-eaf0-1dee2bc74363	tipfunkcije
00240000-5643-5180-9785-d9160aaa361a	00230000-5643-5180-eaf0-1dee2bc74363	alternacija
00240000-5643-5180-14a5-c63718b58ff6	00230000-5643-5180-5550-50796b0a94cb	pogodba
00240000-5643-5180-7305-dc524ef65c11	00230000-5643-5180-eaf0-1dee2bc74363	zaposlitev
00240000-5643-5180-1424-c8f421ac5e97	00230000-5643-5180-eaf0-1dee2bc74363	zvrstuprizoritve
00240000-5643-5180-42e0-004d3d8cd070	00230000-5643-5180-5550-50796b0a94cb	programdela
00240000-5643-5180-9cde-1ecfbb0f9b36	00230000-5643-5180-eaf0-1dee2bc74363	zapis
\.


--
-- TOC entry 3092 (class 0 OID 26606234)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5de18256-26c1-4808-9b5a-18e522b1ca6c	00240000-5643-5180-e105-830d00bc908d	0	1001
\.


--
-- TOC entry 3149 (class 0 OID 26606805)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5643-5183-e2ff-5b6aec037c71	000e0000-5643-5183-f0e0-5831594b86d3	00080000-5643-5183-d7cf-445dc6d80ec5	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5643-5181-c28a-1ed1ea9ca609
00270000-5643-5183-0c69-5ba42d09bf3a	000e0000-5643-5183-f0e0-5831594b86d3	00080000-5643-5183-d7cf-445dc6d80ec5	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5643-5181-c28a-1ed1ea9ca609
\.


--
-- TOC entry 3108 (class 0 OID 26606382)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 26606634)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5643-5183-f3b2-d77e7a3b3556	00180000-5643-5183-7e75-a54f0e4aaecb	000c0000-5643-5183-c83f-ddbc5e5fe8d0	00090000-5643-5183-fed5-c5252b884ca2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-5183-81a7-d8871db36887	00180000-5643-5183-7e75-a54f0e4aaecb	000c0000-5643-5183-4be2-7bc4c77ff7fc	00090000-5643-5183-a326-8e315a63697f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-5183-f3df-b4d68ef68ba2	00180000-5643-5183-7e75-a54f0e4aaecb	000c0000-5643-5183-7058-82fec57f9632	00090000-5643-5183-ff3c-99b949a72635	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-5183-874e-fbb03bce25d4	00180000-5643-5183-7e75-a54f0e4aaecb	000c0000-5643-5183-7f57-b4923f02ccc3	00090000-5643-5183-1a0e-c228f7512fcd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-5183-4094-da83e253290e	00180000-5643-5183-7e75-a54f0e4aaecb	000c0000-5643-5183-d9fa-a714cd581579	00090000-5643-5183-b8b9-61a3f855d9dd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-5183-2af2-83f858aca1e4	00180000-5643-5183-2c31-30f12bd306de	\N	00090000-5643-5183-b8b9-61a3f855d9dd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5643-5183-1eaa-bdd1f1a39744	00180000-5643-5183-2c31-30f12bd306de	\N	00090000-5643-5183-a326-8e315a63697f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3152 (class 0 OID 26606846)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5643-5180-f6d7-03eda5aafe3c	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5643-5180-b630-59866302aa4a	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5643-5180-56b4-22f2c8661795	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5643-5180-4d70-aac98c22455e	04	Režija	Režija	Režija	umetnik	30
000f0000-5643-5180-143e-c65bcd434f48	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5643-5180-c3c7-ed3cbf75e67a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5643-5180-75a4-9eda26608a55	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5643-5180-2bdc-35e55c2bb864	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5643-5180-ba5d-849dbddde60e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5643-5180-7b64-22fb6cc11c5d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5643-5180-c67f-f566c35b9469	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5643-5180-d724-5b70297265e1	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5643-5180-27fc-de634eb78d65	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5643-5180-a224-72b8b33f2ef2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5643-5180-3faf-b050574c09fb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5643-5180-2dc9-623c0a466f16	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5643-5180-ad93-1ca5680e3f3f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5643-5180-4f4f-4726db54b3c2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3105 (class 0 OID 26606333)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5643-5183-f87b-a818d803050c	0001	šola	osnovna ali srednja šola
00400000-5643-5183-5d61-9fd36572a949	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5643-5183-33aa-5801dec3236f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3165 (class 0 OID 26607139)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5643-5180-90e2-1c10032cce25	01	Velika predstava	f	1.00	1.00
002b0000-5643-5180-8ef6-fb6e1de88235	02	Mala predstava	f	0.50	0.50
002b0000-5643-5180-b0d2-96ed7eb3213e	03	Mala koprodukcija	t	0.40	1.00
002b0000-5643-5180-27e4-f4187f0b92d8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5643-5180-6190-e7344cfbcf72	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3128 (class 0 OID 26606614)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5643-5180-56c7-c4082a3bf646	0001	prva vaja	prva vaja
00420000-5643-5180-4797-498f2e2aa863	0002	tehnična vaja	tehnična vaja
00420000-5643-5180-b046-17fb9d887daa	0003	lučna vaja	lučna vaja
00420000-5643-5180-b0e7-368c544be8ed	0004	kostumska vaja	kostumska vaja
00420000-5643-5180-ffa5-94ee78367765	0005	foto vaja	foto vaja
00420000-5643-5180-69ec-9ee54cfd1fcd	0006	1. glavna vaja	1. glavna vaja
00420000-5643-5180-306a-efbbda2b47e1	0007	2. glavna vaja	2. glavna vaja
00420000-5643-5180-6404-ad28905130a0	0008	1. generalka	1. generalka
00420000-5643-5180-a0cd-9b67a6461b64	0009	2. generalka	2. generalka
00420000-5643-5180-3a13-1d930fca5c99	0010	odprta generalka	odprta generalka
00420000-5643-5180-3275-2a09afb9851e	0011	obnovitvena vaja	obnovitvena vaja
00420000-5643-5180-21e8-907b645c26d1	0012	pevska vaja	pevska vaja
00420000-5643-5180-37a9-369f3d2b4b8f	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5643-5180-bfdd-991ec3e2fb1c	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3114 (class 0 OID 26606455)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 26606269)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5643-5181-be92-58a632eb126f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO0SRZ.h5.qxON86q9IMuhit1kB4qLRGq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5643-5183-3754-06a311418ab9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5643-5183-c7f5-a7c5dd63fa50	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5643-5183-366e-03d18aba9574	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5643-5183-0438-c74113a98087	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5643-5183-482a-29f1cf0a5caf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5643-5183-9104-7c242635db7f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5643-5183-323f-edf0c9f5ec38	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5643-5183-3d3c-67849d5f6408	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5643-5183-00f8-38c07940c34a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5643-5183-3c56-d97ad94dc414	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5643-5183-618c-ce4de708d80f	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5643-5183-1b5c-fd294bf4453f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5643-5183-3143-f78c8a65c4e2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5643-5183-f0be-825ddcb93f05	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5643-5183-6629-89c45599a106	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5643-5181-cd9b-334f962acc76	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3156 (class 0 OID 26606896)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5643-5183-f2be-70e687ba3dfe	00160000-5643-5183-f6cd-f7051c70df86	\N	00140000-5643-5180-b80e-754667fa83dc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5643-5183-251d-4674e69ed7a7
000e0000-5643-5183-f0e0-5831594b86d3	00160000-5643-5183-6ac7-451f00c688b1	\N	00140000-5643-5180-9fbe-b6284bd5d607	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5643-5183-0e03-efde5996e1e9
000e0000-5643-5183-cfcb-95df1ae916c4	\N	\N	00140000-5643-5180-9fbe-b6284bd5d607	00190000-5643-5183-6a68-a75e1917d106	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5643-5183-251d-4674e69ed7a7
000e0000-5643-5183-4187-e68394b9aff8	\N	\N	00140000-5643-5180-9fbe-b6284bd5d607	00190000-5643-5183-6a68-a75e1917d106	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5643-5183-251d-4674e69ed7a7
000e0000-5643-5183-d3d5-29f8f3ea2908	\N	\N	00140000-5643-5180-9fbe-b6284bd5d607	00190000-5643-5183-6a68-a75e1917d106	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5643-5183-2e81-b094e3b43969
000e0000-5643-5183-1dfa-3ee5afe8d608	\N	\N	00140000-5643-5180-9fbe-b6284bd5d607	00190000-5643-5183-6a68-a75e1917d106	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5643-5183-2e81-b094e3b43969
\.


--
-- TOC entry 3122 (class 0 OID 26606554)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5643-5183-b337-9f28611ce130	\N	000e0000-5643-5183-f0e0-5831594b86d3	1	
00200000-5643-5183-ddfe-55a5e2dc13b3	\N	000e0000-5643-5183-f0e0-5831594b86d3	2	
00200000-5643-5183-f457-df728a0b397a	\N	000e0000-5643-5183-f0e0-5831594b86d3	3	
00200000-5643-5183-aead-4bf988dc19ab	\N	000e0000-5643-5183-f0e0-5831594b86d3	4	
00200000-5643-5183-50a3-5de2f163ccde	\N	000e0000-5643-5183-f0e0-5831594b86d3	5	
\.


--
-- TOC entry 3139 (class 0 OID 26606705)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 26606819)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5643-5181-daaa-afc0e8df5402	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5643-5181-3283-e9d27ff8b7de	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5643-5181-ea03-b8b47974d279	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5643-5181-f707-d86ebf254509	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5643-5181-867b-68800482166c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5643-5181-78ac-e699b7c9b5fb	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5643-5181-9f7b-eb41af46c3a1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5643-5181-c3d9-19eca80d252a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5643-5181-c28a-1ed1ea9ca609	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5643-5181-f950-b2856e0fd316	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5643-5181-fca0-0d1100e70d6c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5643-5181-7549-47d0f3d2148b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5643-5181-e8a1-3ce954595927	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5643-5181-1122-165959e4281e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5643-5181-1c43-ade2263c97e8	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5643-5181-99fd-2e8acd5ce741	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5643-5181-d1a6-7ae3d493ad74	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5643-5181-a3e3-ef062f5408e0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5643-5181-d448-f417002cd700	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5643-5181-5246-1ca2bd2dd1c0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5643-5181-6386-d6eb076800c0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5643-5181-ee40-82fd4e3e1d90	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5643-5181-d318-f47ee0e56e28	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5643-5181-a58e-1a33cafe75b1	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5643-5181-808c-363cc4d65080	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5643-5181-7974-2315ea7a835a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5643-5181-9a2d-268522dc56ff	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5643-5181-3a4d-a78c48adc4a8	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3168 (class 0 OID 26607189)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 26607158)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 26607201)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 26606777)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5643-5183-8973-dde732d3bdf3	00090000-5643-5183-a326-8e315a63697f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-5183-0686-ed061b5d0198	00090000-5643-5183-ff3c-99b949a72635	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-5183-8be5-33214da4096e	00090000-5643-5183-1a24-d40f9fe31060	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-5183-524a-e76a6cbe64a5	00090000-5643-5183-e14e-ef2f8a577b44	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-5183-8648-d93979bb866d	00090000-5643-5183-fb05-c9e56a9ef78b	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-5183-2192-ffc149c1eb08	00090000-5643-5183-ff18-24fab05a83e8	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3125 (class 0 OID 26606598)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 26606886)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5643-5180-b80e-754667fa83dc	01	Drama	drama (SURS 01)
00140000-5643-5180-d607-39d056f5c0cc	02	Opera	opera (SURS 02)
00140000-5643-5180-ccef-d2e250819fa1	03	Balet	balet (SURS 03)
00140000-5643-5180-fbcc-8f66a5dfa073	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5643-5180-82ad-aac6cb088b96	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5643-5180-9fbe-b6284bd5d607	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5643-5180-6800-58f8497dbc38	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3145 (class 0 OID 26606767)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2587 (class 2606 OID 26606332)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 26606945)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 26606935)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 26606323)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 26606802)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 26606844)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 26607241)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 26606586)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 26606608)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 26606613)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 26607156)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 26606481)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 26607013)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 26606763)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 26606552)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 26606519)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 26606495)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 26606670)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 26607218)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 26607225)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2868 (class 2606 OID 26607249)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2725 (class 2606 OID 26606697)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 26606453)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 26606351)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 26606415)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 26606378)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 26606312)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2576 (class 2606 OID 26606297)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 26606703)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 26606739)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 26606881)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 26606406)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 26606441)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 26607108)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 26606676)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 26606431)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 26606571)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 26606540)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2654 (class 2606 OID 26606532)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 26606688)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 26607117)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 26607125)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 26607095)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 26607137)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 26606721)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 26606661)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 26606652)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 26606868)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 26606795)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 26606507)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 26606268)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 26606730)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 26606286)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2578 (class 2606 OID 26606306)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 26606748)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 26606683)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 26606632)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 26606256)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 26606244)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 26606238)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 26606815)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 26606387)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 26606643)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 26606855)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 26606340)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 26607149)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 26606621)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 26606466)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 26606281)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 26606914)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 26606561)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 26606711)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 26606827)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 26607199)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 26607183)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 26607207)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 26606785)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 26606602)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 26606894)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 26606775)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 1259 OID 26606596)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2671 (class 1259 OID 26606597)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2672 (class 1259 OID 26606595)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2673 (class 1259 OID 26606594)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2674 (class 1259 OID 26606593)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2768 (class 1259 OID 26606816)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2769 (class 1259 OID 26606817)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2770 (class 1259 OID 26606818)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2854 (class 1259 OID 26607220)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2855 (class 1259 OID 26607219)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2605 (class 1259 OID 26606408)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2606 (class 1259 OID 26606409)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2726 (class 1259 OID 26606704)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2841 (class 1259 OID 26607187)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2842 (class 1259 OID 26607186)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2843 (class 1259 OID 26607188)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2844 (class 1259 OID 26607185)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2845 (class 1259 OID 26607184)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2720 (class 1259 OID 26606690)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2721 (class 1259 OID 26606689)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2662 (class 1259 OID 26606562)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2663 (class 1259 OID 26606563)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 26606764)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 26606766)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2752 (class 1259 OID 26606765)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2637 (class 1259 OID 26606497)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 26606496)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 26607138)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2784 (class 1259 OID 26606883)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 26606884)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 26606885)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2851 (class 1259 OID 26607208)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2793 (class 1259 OID 26606919)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2794 (class 1259 OID 26606916)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2795 (class 1259 OID 26606920)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2796 (class 1259 OID 26606918)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2797 (class 1259 OID 26606917)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2627 (class 1259 OID 26606468)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 26606467)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 26606381)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2738 (class 1259 OID 26606731)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2580 (class 1259 OID 26606313)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2581 (class 1259 OID 26606314)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2743 (class 1259 OID 26606751)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 26606750)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2745 (class 1259 OID 26606749)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2610 (class 1259 OID 26606418)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2611 (class 1259 OID 26606417)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2612 (class 1259 OID 26606419)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2650 (class 1259 OID 26606535)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2651 (class 1259 OID 26606533)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 26606534)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2560 (class 1259 OID 26606246)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2700 (class 1259 OID 26606656)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2701 (class 1259 OID 26606654)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2702 (class 1259 OID 26606653)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2703 (class 1259 OID 26606655)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2571 (class 1259 OID 26606287)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2572 (class 1259 OID 26606288)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2729 (class 1259 OID 26606712)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2864 (class 1259 OID 26607242)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2766 (class 1259 OID 26606804)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2767 (class 1259 OID 26606803)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2865 (class 1259 OID 26607250)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2866 (class 1259 OID 26607251)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2715 (class 1259 OID 26606677)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2760 (class 1259 OID 26606796)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2761 (class 1259 OID 26606797)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 26607018)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2815 (class 1259 OID 26607017)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2816 (class 1259 OID 26607014)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 26607015)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2818 (class 1259 OID 26607016)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2616 (class 1259 OID 26606433)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 26606432)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2618 (class 1259 OID 26606434)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2732 (class 1259 OID 26606725)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2733 (class 1259 OID 26606724)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2824 (class 1259 OID 26607118)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2825 (class 1259 OID 26607119)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2807 (class 1259 OID 26606949)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 26606950)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2809 (class 1259 OID 26606947)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2810 (class 1259 OID 26606948)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2756 (class 1259 OID 26606786)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 26606787)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2706 (class 1259 OID 26606665)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2707 (class 1259 OID 26606664)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2708 (class 1259 OID 26606662)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2709 (class 1259 OID 26606663)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2803 (class 1259 OID 26606937)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 26606936)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2641 (class 1259 OID 26606508)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2644 (class 1259 OID 26606522)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2645 (class 1259 OID 26606521)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2646 (class 1259 OID 26606520)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2647 (class 1259 OID 26606523)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2661 (class 1259 OID 26606553)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 26606541)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2656 (class 1259 OID 26606542)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2821 (class 1259 OID 26607109)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2840 (class 1259 OID 26607157)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2858 (class 1259 OID 26607226)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2859 (class 1259 OID 26607227)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2592 (class 1259 OID 26606353)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 26606352)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2601 (class 1259 OID 26606388)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 26606389)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 26606603)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 26606646)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 26606645)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2697 (class 1259 OID 26606644)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2675 (class 1259 OID 26606588)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2676 (class 1259 OID 26606589)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2677 (class 1259 OID 26606592)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2678 (class 1259 OID 26606587)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2679 (class 1259 OID 26606591)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2680 (class 1259 OID 26606590)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2609 (class 1259 OID 26606407)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 26606341)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 26606342)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 26606482)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 26606484)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2635 (class 1259 OID 26606483)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2636 (class 1259 OID 26606485)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2714 (class 1259 OID 26606671)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 26606882)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2798 (class 1259 OID 26606915)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 26606856)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 26606857)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2599 (class 1259 OID 26606379)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 26606380)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2753 (class 1259 OID 26606776)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 26606257)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 26606454)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2615 (class 1259 OID 26606416)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 26606245)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2837 (class 1259 OID 26607150)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 26606723)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2737 (class 1259 OID 26606722)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 26606622)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 26606623)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2811 (class 1259 OID 26606946)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 26606442)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2790 (class 1259 OID 26606895)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2848 (class 1259 OID 26607200)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2830 (class 1259 OID 26607126)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 26607127)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2777 (class 1259 OID 26606845)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2694 (class 1259 OID 26606633)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 26606307)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2908 (class 2606 OID 26607422)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 26607427)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2902 (class 2606 OID 26607452)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 26607442)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2909 (class 2606 OID 26607417)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2905 (class 2606 OID 26607437)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2903 (class 2606 OID 26607447)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 26607432)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2945 (class 2606 OID 26607622)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2944 (class 2606 OID 26607627)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2943 (class 2606 OID 26607632)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 26607797)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 26607792)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 26607307)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2880 (class 2606 OID 26607312)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 26607537)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2972 (class 2606 OID 26607777)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 26607772)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 26607782)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 26607767)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2975 (class 2606 OID 26607762)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2924 (class 2606 OID 26607532)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 26607527)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 26607407)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2900 (class 2606 OID 26607412)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 26607577)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 26607587)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2935 (class 2606 OID 26607582)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2890 (class 2606 OID 26607362)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 26607357)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 26607517)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 26607752)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2948 (class 2606 OID 26607637)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2947 (class 2606 OID 26607642)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2946 (class 2606 OID 26607647)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2976 (class 2606 OID 26607787)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2950 (class 2606 OID 26607667)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2953 (class 2606 OID 26607652)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2949 (class 2606 OID 26607672)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2951 (class 2606 OID 26607662)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2952 (class 2606 OID 26607657)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2888 (class 2606 OID 26607352)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 26607347)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 26607292)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 26607287)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 26607557)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 26607267)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2872 (class 2606 OID 26607272)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2931 (class 2606 OID 26607572)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2932 (class 2606 OID 26607567)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2933 (class 2606 OID 26607562)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2883 (class 2606 OID 26607322)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 26607317)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2882 (class 2606 OID 26607327)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2894 (class 2606 OID 26607387)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2896 (class 2606 OID 26607377)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 26607382)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2869 (class 2606 OID 26607252)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 26607492)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 26607482)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 26607477)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2915 (class 2606 OID 26607487)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 26607257)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2870 (class 2606 OID 26607262)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2927 (class 2606 OID 26607542)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2981 (class 2606 OID 26607812)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 26607617)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 26607612)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 26607817)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2982 (class 2606 OID 26607822)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2923 (class 2606 OID 26607522)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 26607602)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2939 (class 2606 OID 26607607)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 26607727)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2961 (class 2606 OID 26607722)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 26607707)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 26607712)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2962 (class 2606 OID 26607717)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2886 (class 2606 OID 26607337)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 26607332)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 26607342)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2928 (class 2606 OID 26607552)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 26607547)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 26607737)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2966 (class 2606 OID 26607742)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2957 (class 2606 OID 26607697)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 26607702)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 26607687)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 26607692)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 26607592)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2937 (class 2606 OID 26607597)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 26607512)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2919 (class 2606 OID 26607507)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 26607497)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 26607502)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2954 (class 2606 OID 26607682)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 26607677)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2892 (class 2606 OID 26607367)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2893 (class 2606 OID 26607372)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 26607402)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 26607392)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2897 (class 2606 OID 26607397)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2965 (class 2606 OID 26607732)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2968 (class 2606 OID 26607747)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 26607757)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 26607802)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 26607807)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2874 (class 2606 OID 26607282)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 26607277)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 26607297)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2878 (class 2606 OID 26607302)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 26607457)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2911 (class 2606 OID 26607472)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 26607467)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2913 (class 2606 OID 26607462)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-11 15:32:38 CET

--
-- PostgreSQL database dump complete
--

