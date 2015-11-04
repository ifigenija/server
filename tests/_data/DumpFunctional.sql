--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-04 12:10:50 CET

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
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 25160117)
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
-- TOC entry 237 (class 1259 OID 25160731)
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
-- TOC entry 236 (class 1259 OID 25160714)
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
-- TOC entry 182 (class 1259 OID 25160110)
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
-- TOC entry 181 (class 1259 OID 25160108)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 25160591)
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
-- TOC entry 230 (class 1259 OID 25160621)
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
-- TOC entry 251 (class 1259 OID 25161018)
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
-- TOC entry 203 (class 1259 OID 25160365)
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
-- TOC entry 205 (class 1259 OID 25160397)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25160402)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25160944)
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
-- TOC entry 194 (class 1259 OID 25160262)
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
-- TOC entry 238 (class 1259 OID 25160744)
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
-- TOC entry 223 (class 1259 OID 25160545)
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
-- TOC entry 200 (class 1259 OID 25160336)
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
-- TOC entry 197 (class 1259 OID 25160302)
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
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 25160279)
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
-- TOC entry 212 (class 1259 OID 25160459)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25160999)
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
-- TOC entry 250 (class 1259 OID 25161011)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25161033)
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
-- TOC entry 170 (class 1259 OID 25157733)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25160484)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25160236)
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
-- TOC entry 185 (class 1259 OID 25160136)
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
-- TOC entry 189 (class 1259 OID 25160203)
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
-- TOC entry 186 (class 1259 OID 25160147)
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
-- TOC entry 178 (class 1259 OID 25160082)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25160101)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25160491)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25160525)
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
-- TOC entry 233 (class 1259 OID 25160662)
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
-- TOC entry 188 (class 1259 OID 25160183)
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
-- TOC entry 191 (class 1259 OID 25160228)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25160889)
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
-- TOC entry 213 (class 1259 OID 25160465)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25160213)
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
-- TOC entry 202 (class 1259 OID 25160357)
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
-- TOC entry 198 (class 1259 OID 25160317)
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
-- TOC entry 199 (class 1259 OID 25160329)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25160477)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25160903)
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
-- TOC entry 242 (class 1259 OID 25160913)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25160812)
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
-- TOC entry 243 (class 1259 OID 25160921)
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
-- TOC entry 219 (class 1259 OID 25160506)
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
-- TOC entry 211 (class 1259 OID 25160450)
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
-- TOC entry 210 (class 1259 OID 25160440)
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
-- TOC entry 232 (class 1259 OID 25160651)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25160581)
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
-- TOC entry 196 (class 1259 OID 25160291)
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
-- TOC entry 175 (class 1259 OID 25160053)
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
-- TOC entry 174 (class 1259 OID 25160051)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 25160519)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25160091)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25160075)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25160533)
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
-- TOC entry 214 (class 1259 OID 25160471)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25160417)
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
-- TOC entry 173 (class 1259 OID 25160040)
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
-- TOC entry 172 (class 1259 OID 25160032)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25160027)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25160598)
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
-- TOC entry 187 (class 1259 OID 25160175)
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
-- TOC entry 209 (class 1259 OID 25160427)
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
-- TOC entry 231 (class 1259 OID 25160639)
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
-- TOC entry 184 (class 1259 OID 25160126)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25160932)
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
-- TOC entry 207 (class 1259 OID 25160407)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25160248)
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
-- TOC entry 176 (class 1259 OID 25160062)
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
-- TOC entry 235 (class 1259 OID 25160689)
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
-- TOC entry 201 (class 1259 OID 25160347)
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
-- TOC entry 218 (class 1259 OID 25160498)
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
-- TOC entry 229 (class 1259 OID 25160612)
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
-- TOC entry 247 (class 1259 OID 25160979)
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
-- TOC entry 246 (class 1259 OID 25160951)
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
-- TOC entry 248 (class 1259 OID 25160991)
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
-- TOC entry 225 (class 1259 OID 25160570)
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
-- TOC entry 204 (class 1259 OID 25160391)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25160679)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25160560)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25160113)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25160056)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25160117)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5639-e7b7-c3ea-dcd079991e3b	10	30	Otroci	Abonma za otroke	200
000a0000-5639-e7b7-06e8-d07cb19247a8	20	60	Mladina	Abonma za mladino	400
000a0000-5639-e7b7-39bf-2645e1c0b1df	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25160731)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5639-e7b7-28a0-54a3115ffe53	000d0000-5639-e7b7-54ba-e75d01567477	\N	00090000-5639-e7b7-c72b-ebe5d6d54a34	000b0000-5639-e7b7-aa15-77a6089e9e8f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5639-e7b7-1c15-47ade372e12f	000d0000-5639-e7b7-3b6d-63f020c9df2f	00100000-5639-e7b7-18e8-f60f53f4608f	00090000-5639-e7b7-db8d-5a82f198d7f1	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5639-e7b7-8863-a21e77ebb4a9	000d0000-5639-e7b7-0541-0fa31c720df2	00100000-5639-e7b7-c950-c14780210ba9	00090000-5639-e7b7-7a1f-b0e31d3a1999	\N	0003	t	\N	2015-11-04	\N	2	t	\N	f	f
000c0000-5639-e7b7-b467-16e69654ee3a	000d0000-5639-e7b7-f31e-ce78d17e3503	\N	00090000-5639-e7b7-8032-2bc96e9fe0da	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5639-e7b7-375a-e6f33f20f6f1	000d0000-5639-e7b7-cf15-e66e01c7cd2a	\N	00090000-5639-e7b7-1551-a0ee13b12c63	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5639-e7b7-1ae6-c41be565dfb8	000d0000-5639-e7b7-4912-de12668c1123	\N	00090000-5639-e7b7-5b0f-54372916ae13	000b0000-5639-e7b7-a6e5-c47787cd0965	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5639-e7b7-4293-ab919c4080d1	000d0000-5639-e7b7-e4b7-296d181d795f	00100000-5639-e7b7-5fcb-a34c9c1d932c	00090000-5639-e7b7-480e-7a9b41fb9290	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5639-e7b7-647f-b2613c63be16	000d0000-5639-e7b7-bd80-4243c59ca3c2	\N	00090000-5639-e7b7-c547-ea03fd23d9df	000b0000-5639-e7b7-9736-31ae0dddfbcb	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5639-e7b7-cf95-b9f86c323f41	000d0000-5639-e7b7-e4b7-296d181d795f	00100000-5639-e7b7-20a3-e56074ee1942	00090000-5639-e7b7-ea57-45e090337474	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5639-e7b7-1046-6f6b505bed29	000d0000-5639-e7b7-e4b7-296d181d795f	00100000-5639-e7b7-1b67-bea27e604942	00090000-5639-e7b7-191a-8ee553e328bc	\N	0010	t	\N	2015-11-04	\N	16	f	\N	f	t
000c0000-5639-e7b7-c950-1a0b699cc133	000d0000-5639-e7b7-e4b7-296d181d795f	00100000-5639-e7b7-731c-6d37cbd8b387	00090000-5639-e7b7-1bcc-0ed5ed63c8bb	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5639-e7b7-aa2d-b9bf090169d9	000d0000-5639-e7b7-e8bd-6fe276988034	00100000-5639-e7b7-18e8-f60f53f4608f	00090000-5639-e7b7-db8d-5a82f198d7f1	000b0000-5639-e7b7-b8f5-9e95ab147b7b	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25160714)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25160110)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 25160591)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5639-e7b7-04bc-f168129fe646	00160000-5639-e7b7-3969-59680cf93322	00090000-5639-e7b7-95c7-e4a633049f9f	aizv	10	t
003d0000-5639-e7b7-0014-cf82fd09e9c0	00160000-5639-e7b7-3969-59680cf93322	00090000-5639-e7b7-e820-e3106dd8649d	apri	14	t
003d0000-5639-e7b7-dcdb-a547da48c8ac	00160000-5639-e7b7-d5e8-836eadc0201d	00090000-5639-e7b7-3f10-4e01a507a54a	aizv	11	t
003d0000-5639-e7b7-0dd5-8903697a13d7	00160000-5639-e7b7-b06f-8e2e4e564234	00090000-5639-e7b7-5068-0629e4868de3	aizv	12	t
003d0000-5639-e7b7-0948-7cce30c75b93	00160000-5639-e7b7-3969-59680cf93322	00090000-5639-e7b7-b0e3-d154944ecf03	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25160621)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5639-e7b7-3969-59680cf93322	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5639-e7b7-d5e8-836eadc0201d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5639-e7b7-b06f-8e2e4e564234	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25161018)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25160365)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5639-e7b7-d7f0-fdb7f2a7fc19	\N	\N	00200000-5639-e7b7-5ae5-364d2b6d02b1	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5639-e7b7-d96c-18644a2fed73	\N	\N	00200000-5639-e7b7-c546-5c63f1397c9a	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5639-e7b7-2785-217707a0132a	\N	\N	00200000-5639-e7b7-c0a9-6f8d14c16d9c	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5639-e7b7-4c3a-d32d635435df	\N	\N	00200000-5639-e7b7-89ea-14546e50ece0	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5639-e7b7-bbb8-0ae9a95c3c26	\N	\N	00200000-5639-e7b7-7816-49047cd65870	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25160397)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25160402)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25160944)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25160262)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5639-e7b4-8212-ffca9732ccf6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5639-e7b4-884d-230fda3adfe7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5639-e7b4-c586-b666e45f328f	AL	ALB	008	Albania 	Albanija	\N
00040000-5639-e7b4-a3d2-235a61ae47e2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5639-e7b4-c6ed-4bbec6b7f67f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5639-e7b4-ffdf-6a66a0bf2444	AD	AND	020	Andorra 	Andora	\N
00040000-5639-e7b4-00a0-d537b0f289d6	AO	AGO	024	Angola 	Angola	\N
00040000-5639-e7b4-b0e2-e1bf8e824068	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5639-e7b4-ca6c-6d1a88943fdc	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5639-e7b4-52f9-0e1d45e30384	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5639-e7b4-fc65-bd2524e51108	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5639-e7b4-9495-586e3ba1b77c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5639-e7b4-b9fb-75d956884e6c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5639-e7b4-da6b-d1cf9827307b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5639-e7b4-0435-5c6f11c181d1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5639-e7b4-c7a9-71b3f070efab	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5639-e7b4-17b9-75b1a9893e5e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5639-e7b4-28dd-9742475364c2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5639-e7b4-79b2-83efb3752583	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5639-e7b4-978e-48a9f5087015	BB	BRB	052	Barbados 	Barbados	\N
00040000-5639-e7b4-eff4-1c52f8c534cc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5639-e7b4-7b3a-f2a6d041b8cb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5639-e7b4-fbe0-9c6964816970	BZ	BLZ	084	Belize 	Belize	\N
00040000-5639-e7b4-b207-b7477a52620d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5639-e7b4-2c99-97da9ca9ba7d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5639-e7b4-824b-bf3da44a4346	BT	BTN	064	Bhutan 	Butan	\N
00040000-5639-e7b4-52f3-3de5f4c10772	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5639-e7b4-c9f3-fb75782cd236	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5639-e7b4-d1a0-5bd65b38dd6e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5639-e7b4-9c27-b482ed03f130	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5639-e7b4-8b16-e391f5a8d345	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5639-e7b4-58da-0d0ef9991f41	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5639-e7b4-0844-c4679448950b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5639-e7b4-806c-7692222cfbc9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5639-e7b4-e253-0e99687f51de	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5639-e7b4-8402-d63e20e17dc7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5639-e7b4-9ebf-573897418cf1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5639-e7b4-8fe4-6d8c56f3d156	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5639-e7b4-fc48-075b1ca3413f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5639-e7b4-a99d-c96bb5d47354	CA	CAN	124	Canada 	Kanada	\N
00040000-5639-e7b4-075a-ad05b9a12839	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5639-e7b4-6186-6d81a5c548d4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5639-e7b4-b648-b1ba10490207	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5639-e7b4-de11-3c9d14dd5333	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5639-e7b4-f5ab-a6dbe75b02ee	CL	CHL	152	Chile 	Čile	\N
00040000-5639-e7b4-6d89-2ce6b80c2b4f	CN	CHN	156	China 	Kitajska	\N
00040000-5639-e7b4-be42-ff1f6b6b5868	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5639-e7b4-778e-dc758c4e3748	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5639-e7b4-8a02-d53ba2907aaa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5639-e7b4-9af1-825a0bd37cab	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5639-e7b4-6636-4c09bc523a90	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5639-e7b4-75b7-a951416bf76f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5639-e7b4-53b1-b6ee20f81377	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5639-e7b4-4c36-eabe0c825a20	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5639-e7b4-3f6a-d538787e8010	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5639-e7b4-3312-70a0af8d7cf7	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5639-e7b4-acae-4d9550ec9e47	CU	CUB	192	Cuba 	Kuba	\N
00040000-5639-e7b4-3e7e-ec7365b1d681	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5639-e7b4-3df3-015109c70c56	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5639-e7b4-054f-5fc53e88f483	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5639-e7b4-2598-de460c704993	DK	DNK	208	Denmark 	Danska	\N
00040000-5639-e7b4-8b46-380c92241504	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5639-e7b4-5859-30cafbf97529	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5639-e7b4-ea7c-d059674a91c2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5639-e7b4-1248-d9fea8a82d4d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5639-e7b4-0ba2-24171de31985	EG	EGY	818	Egypt 	Egipt	\N
00040000-5639-e7b4-0c70-e295000730bd	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5639-e7b4-7e32-1a3fdeb88f5f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5639-e7b4-2716-e30107edccb4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5639-e7b4-36f6-4a4a89638075	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5639-e7b5-82ed-699534374c05	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5639-e7b5-2be7-2291fd9e182e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5639-e7b5-86ec-aa667e5a1ef6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5639-e7b5-bd58-9bd5065bf617	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5639-e7b5-80b3-ef2ffd4f3e9a	FI	FIN	246	Finland 	Finska	\N
00040000-5639-e7b5-8245-214fc5b4f254	FR	FRA	250	France 	Francija	\N
00040000-5639-e7b5-f310-eeb4a1484bb2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5639-e7b5-00e8-caca90105219	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5639-e7b5-b22c-73cce2d81461	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5639-e7b5-3224-67c95d5f2ed5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5639-e7b5-8e4b-de208d902279	GA	GAB	266	Gabon 	Gabon	\N
00040000-5639-e7b5-a86d-8b68238cf165	GM	GMB	270	Gambia 	Gambija	\N
00040000-5639-e7b5-5e48-4526e97ee480	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5639-e7b5-1cd2-957fe41d9b68	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5639-e7b5-6cff-84b2e8e6f534	GH	GHA	288	Ghana 	Gana	\N
00040000-5639-e7b5-fc1d-f3bdac8fc8a9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5639-e7b5-b7a5-e6d25d0fbb34	GR	GRC	300	Greece 	Grčija	\N
00040000-5639-e7b5-5e89-86d68b2f3218	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5639-e7b5-4b46-995f9e85f414	GD	GRD	308	Grenada 	Grenada	\N
00040000-5639-e7b5-0f3e-f625b915c67b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5639-e7b5-9ee9-cf7dd0aa4704	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5639-e7b5-905a-4e14d7672082	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5639-e7b5-b08b-4ed157a9ce2c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5639-e7b5-bdd5-36b9987ff46c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5639-e7b5-3117-23c5185d6486	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5639-e7b5-3497-973f7d7a53b4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5639-e7b5-b787-5d089dbb8b30	HT	HTI	332	Haiti 	Haiti	\N
00040000-5639-e7b5-bcb4-02d45056fec0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5639-e7b5-0a0d-6e1f5322dba1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5639-e7b5-cce6-eced41a43ba5	HN	HND	340	Honduras 	Honduras	\N
00040000-5639-e7b5-333f-c90fa3c848be	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5639-e7b5-4617-212b2ffef292	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5639-e7b5-2748-b60356257d59	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5639-e7b5-0c83-b0d22e300119	IN	IND	356	India 	Indija	\N
00040000-5639-e7b5-e93f-ab21c43fd161	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5639-e7b5-aedd-89c651617902	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5639-e7b5-fe5e-60eaa28f86ee	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5639-e7b5-86a7-a3bed7fac4ea	IE	IRL	372	Ireland 	Irska	\N
00040000-5639-e7b5-ec67-7937622b3c87	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5639-e7b5-01df-c32b4ebae7c1	IL	ISR	376	Israel 	Izrael	\N
00040000-5639-e7b5-9327-f12de9b26ffe	IT	ITA	380	Italy 	Italija	\N
00040000-5639-e7b5-5e32-3f8941c27d5c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5639-e7b5-af9b-8d476aa34c4d	JP	JPN	392	Japan 	Japonska	\N
00040000-5639-e7b5-2ef3-864b4935307c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5639-e7b5-13aa-45867ebcd0b1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5639-e7b5-0ad3-744b941864d0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5639-e7b5-dd64-eed8fda04d9b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5639-e7b5-96fe-8bf3dcf3645d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5639-e7b5-cd0d-cf976fb2bcf9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5639-e7b5-6cd3-66294dbbd4f4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5639-e7b5-ac03-2ba72f396ac4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5639-e7b5-362b-8f5af0aa74bc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5639-e7b5-2de3-7a115f81d22c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5639-e7b5-3476-048b2439e691	LV	LVA	428	Latvia 	Latvija	\N
00040000-5639-e7b5-4223-c560a5d95f10	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5639-e7b5-8765-83c1558dea70	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5639-e7b5-49e9-5bbdd5e03c39	LR	LBR	430	Liberia 	Liberija	\N
00040000-5639-e7b5-0c50-8cb6b8bbb511	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5639-e7b5-1173-cafd6a9d5962	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5639-e7b5-016f-225a601c370d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5639-e7b5-b4ac-60444c7e4220	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5639-e7b5-fdff-a0e718f8aa34	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5639-e7b5-cda3-938ecea9cf24	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5639-e7b5-2e69-877810f62348	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5639-e7b5-7495-4d957ec39e84	MW	MWI	454	Malawi 	Malavi	\N
00040000-5639-e7b5-52c7-3fc9b53f9c78	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5639-e7b5-c143-9c918469c3ed	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5639-e7b5-5a69-68afcbefe7bb	ML	MLI	466	Mali 	Mali	\N
00040000-5639-e7b5-3719-ae9cee786a4f	MT	MLT	470	Malta 	Malta	\N
00040000-5639-e7b5-3c7b-41b8ad53970e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5639-e7b5-d66e-3774c4c6a26f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5639-e7b5-9022-d6bc758cb8d2	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5639-e7b5-ea73-f445d75fb560	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5639-e7b5-46a4-cc80fba32392	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5639-e7b5-f0cd-aa7536d37b6d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5639-e7b5-f009-7703648d981a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5639-e7b5-ca38-3e44b66aa89b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5639-e7b5-748d-9efd3f59a718	MC	MCO	492	Monaco 	Monako	\N
00040000-5639-e7b5-d61e-e5601156f5bf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5639-e7b5-675e-38fa7d52f316	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5639-e7b5-191f-ff9206775935	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5639-e7b5-bb83-2e7af0fa99cb	MA	MAR	504	Morocco 	Maroko	\N
00040000-5639-e7b5-7668-938d55db656c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5639-e7b5-df9a-7fe5835f8f21	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5639-e7b5-2dd9-1fa204e03588	NA	NAM	516	Namibia 	Namibija	\N
00040000-5639-e7b5-217e-97f6df491719	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5639-e7b5-4d4a-9c3221d00b15	NP	NPL	524	Nepal 	Nepal	\N
00040000-5639-e7b5-57ec-4a068f3570b8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5639-e7b5-5a75-2fc86e8d1859	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5639-e7b5-97b3-db1d2bb9cdc1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5639-e7b5-c1d6-c1fd621bb46a	NE	NER	562	Niger 	Niger 	\N
00040000-5639-e7b5-1e3f-db6d1c88ca25	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5639-e7b5-e46a-fa472c5f1c7a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5639-e7b5-329f-9c7fd95a4050	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5639-e7b5-111c-b31e107ddde5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5639-e7b5-8634-a46bc1465bc1	NO	NOR	578	Norway 	Norveška	\N
00040000-5639-e7b5-674b-479d037c5ea7	OM	OMN	512	Oman 	Oman	\N
00040000-5639-e7b5-c99b-f275c2797cbf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5639-e7b5-9642-7e8c3056105d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5639-e7b5-9194-207b88ae58f9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5639-e7b5-dd5c-82b268bfcc4b	PA	PAN	591	Panama 	Panama	\N
00040000-5639-e7b5-bec7-67b8627544a5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5639-e7b5-a492-9530c53c9c2f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5639-e7b5-8388-1ca5b205ae18	PE	PER	604	Peru 	Peru	\N
00040000-5639-e7b5-e6a0-bfe03fd74136	PH	PHL	608	Philippines 	Filipini	\N
00040000-5639-e7b5-0f2e-b9ad3eb3ee29	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5639-e7b5-4c2d-c8aef6b7a254	PL	POL	616	Poland 	Poljska	\N
00040000-5639-e7b5-2058-4602e449edca	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5639-e7b5-5959-f1c4bfdd7910	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5639-e7b5-da3d-f061ffeeac96	QA	QAT	634	Qatar 	Katar	\N
00040000-5639-e7b5-a214-c999c4e76a14	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5639-e7b5-355d-f7b338358e4c	RO	ROU	642	Romania 	Romunija	\N
00040000-5639-e7b5-ea83-fe2d1c64f5e4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5639-e7b5-c70e-bf1fc398b32d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5639-e7b5-2542-1d0b421704d7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5639-e7b5-7e34-d330f0127518	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5639-e7b5-e2f2-f6f474b43841	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5639-e7b5-6462-1943204c4afc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5639-e7b5-2779-03883d5416cb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5639-e7b5-eafd-61fb547852ac	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5639-e7b5-61a6-fb1fa958d544	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5639-e7b5-8f8a-7b304b9acd02	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5639-e7b5-838d-abf76565a7f7	SM	SMR	674	San Marino 	San Marino	\N
00040000-5639-e7b5-af10-ad82f7066e95	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5639-e7b5-64f5-b367b7e9338c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5639-e7b5-2b0d-63646626d0d9	SN	SEN	686	Senegal 	Senegal	\N
00040000-5639-e7b5-4522-746a640e16fc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5639-e7b5-0b12-78f18ede3848	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5639-e7b5-c0e6-b6bf1fb2f99b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5639-e7b5-ae97-cacab8764fb8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5639-e7b5-22d9-67210159aaba	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5639-e7b5-f5e2-b38e7f89c361	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5639-e7b5-7240-97381a9c2017	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5639-e7b5-6b4c-8c5e74928238	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5639-e7b5-cc42-9625e95652fc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5639-e7b5-7671-8da7dee872eb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5639-e7b5-5c02-2f4255a85485	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5639-e7b5-bbbb-d10dfd5640d7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5639-e7b5-18c7-cf09e002bf12	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5639-e7b5-22c4-c080c96c7daf	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5639-e7b5-6abe-80dd3ee5e962	SD	SDN	729	Sudan 	Sudan	\N
00040000-5639-e7b5-a617-8d0abdf6a32c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5639-e7b5-1eaf-7aaf0ec07f4e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5639-e7b5-e970-436e09455c63	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5639-e7b5-eef7-42b171456d0e	SE	SWE	752	Sweden 	Švedska	\N
00040000-5639-e7b5-60a2-c9fbbc9e7f28	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5639-e7b5-b03c-19a9bf2ea46d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5639-e7b5-844c-71c265136131	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5639-e7b5-cb86-8306b97015a8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5639-e7b5-c594-f87d8c935419	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5639-e7b5-d2df-22b43e20e55e	TH	THA	764	Thailand 	Tajska	\N
00040000-5639-e7b5-bc3f-53e6264c1509	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5639-e7b5-4ddf-8d1794d75716	TG	TGO	768	Togo 	Togo	\N
00040000-5639-e7b5-bb46-8d72b22d8a7a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5639-e7b5-948f-d8fb00176116	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5639-e7b5-7b03-c0fddfd15e95	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5639-e7b5-f5f9-4fc77a5c6db8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5639-e7b5-5d63-9b6272ac61e1	TR	TUR	792	Turkey 	Turčija	\N
00040000-5639-e7b5-f051-6eb117c9df26	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5639-e7b5-1f09-aabbc4aceda6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5639-e7b5-03a2-b0eba25c32a2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5639-e7b5-b3a5-13c2d115f350	UG	UGA	800	Uganda 	Uganda	\N
00040000-5639-e7b5-527d-d67a57c91a56	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5639-e7b5-77a3-28be8ca0ec22	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5639-e7b5-95e4-cb294d11c137	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5639-e7b5-56de-2563ff6688b7	US	USA	840	United States 	Združene države Amerike	\N
00040000-5639-e7b5-f474-300b7a8c442d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5639-e7b5-b286-50014fc6024b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5639-e7b5-f309-3ecf17332c28	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5639-e7b5-fbf8-9b333858d32e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5639-e7b5-b7da-c52efe480b4a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5639-e7b5-76ef-660891c32e98	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5639-e7b5-c1d6-1d25d94e40a4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5639-e7b5-d9af-4c4965a7a888	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5639-e7b5-825e-ca39021f8284	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5639-e7b5-93fc-8ef1db623236	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5639-e7b5-c092-966bcc225b9d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5639-e7b5-61d0-98fc09e475c3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5639-e7b5-7961-de4d7390f837	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25160744)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5639-e7b7-f4db-8cfbce0a9d3c	000e0000-5639-e7b7-38fd-30b2ce383222	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5639-e7b4-eaa3-8b9d00554439	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5639-e7b7-ed46-97e726df324e	000e0000-5639-e7b7-995d-4197e4299b8c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5639-e7b4-1901-37ed1b3de7a3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5639-e7b7-ee24-dc2b1179f79e	000e0000-5639-e7b7-bec1-2636aca50004	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5639-e7b4-eaa3-8b9d00554439	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5639-e7b7-c9ba-dcd21ffd242f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5639-e7b7-f7e9-e347dbf76682	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25160545)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5639-e7b7-e4b7-296d181d795f	000e0000-5639-e7b7-995d-4197e4299b8c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5639-e7b4-bf30-9bb24e3df229
000d0000-5639-e7b7-54ba-e75d01567477	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-28a0-54a3115ffe53	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5639-e7b4-bf30-9bb24e3df229
000d0000-5639-e7b7-3b6d-63f020c9df2f	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-1c15-47ade372e12f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5639-e7b4-a8ba-571dc391063e
000d0000-5639-e7b7-0541-0fa31c720df2	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-8863-a21e77ebb4a9	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5639-e7b4-8fd0-67263c37424d
000d0000-5639-e7b7-f31e-ce78d17e3503	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-b467-16e69654ee3a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5639-e7b4-e169-2a38aec741d2
000d0000-5639-e7b7-cf15-e66e01c7cd2a	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-375a-e6f33f20f6f1	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5639-e7b4-e169-2a38aec741d2
000d0000-5639-e7b7-4912-de12668c1123	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-1ae6-c41be565dfb8	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5639-e7b4-bf30-9bb24e3df229
000d0000-5639-e7b7-bd80-4243c59ca3c2	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-647f-b2613c63be16	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5639-e7b4-f0d9-662e75b21852
000d0000-5639-e7b7-e8bd-6fe276988034	000e0000-5639-e7b7-995d-4197e4299b8c	000c0000-5639-e7b7-aa2d-b9bf090169d9	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5639-e7b4-ee6c-133d9dfd5e1d
\.


--
-- TOC entry 3118 (class 0 OID 25160336)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25160302)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25160279)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5639-e7b7-7de4-b07ba18156ad	00080000-5639-e7b7-cb2c-90d4ec76b5b2	00090000-5639-e7b7-191a-8ee553e328bc	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25160459)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25160999)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25161011)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25161033)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 25157733)
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
\.


--
-- TOC entry 3134 (class 0 OID 25160484)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25160236)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5639-e7b5-54c3-53a02a740e53	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5639-e7b5-011e-c39721596792	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5639-e7b5-5895-de5d7c6b5865	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5639-e7b5-37e3-d6dd4e4a35fe	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5639-e7b5-f2eb-6986d3a871c7	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5639-e7b5-9de2-feabde12e872	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5639-e7b5-ac10-18a108ee4b99	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5639-e7b5-df24-81855a674f03	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5639-e7b5-43bf-5bd37f9392b5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5639-e7b5-a884-2f94c884040a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5639-e7b5-413c-c12d2bfc79d2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5639-e7b5-c97c-d862e6e4f593	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5639-e7b5-49c8-0c7f73648846	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5639-e7b5-605a-0d396fd01043	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5639-e7b5-c11a-36248451d6ff	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5639-e7b7-17d3-a7b3518e7878	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5639-e7b7-f6f8-ddbf93b5007a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5639-e7b7-732a-18aaf0a96d4a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5639-e7b7-1b79-f38e87e64474	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5639-e7b7-780b-cbc64110130a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5639-e7b9-84ac-ff27a3255efa	application.tenant.maticnopodjetje	string	s:36:"00080000-5639-e7b9-3612-4a57ae83e4af";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25160136)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5639-e7b7-1872-d01f92cfd909	00000000-5639-e7b7-17d3-a7b3518e7878	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5639-e7b7-3c73-4db9d04c4bd2	00000000-5639-e7b7-17d3-a7b3518e7878	00010000-5639-e7b5-40fc-6c1ab42a40d9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5639-e7b7-4c33-f71a184aa493	00000000-5639-e7b7-f6f8-ddbf93b5007a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25160203)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5639-e7b7-a540-7ad97a64dc0b	\N	00100000-5639-e7b7-18e8-f60f53f4608f	00100000-5639-e7b7-c950-c14780210ba9	01	Gledališče Nimbis
00410000-5639-e7b7-a80c-6d88fc462db8	00410000-5639-e7b7-a540-7ad97a64dc0b	00100000-5639-e7b7-18e8-f60f53f4608f	00100000-5639-e7b7-c950-c14780210ba9	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25160147)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5639-e7b7-c72b-ebe5d6d54a34	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5639-e7b7-8032-2bc96e9fe0da	00010000-5639-e7b7-a597-9a435745904c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5639-e7b7-7a1f-b0e31d3a1999	00010000-5639-e7b7-3912-e6d19cd7cd34	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5639-e7b7-ea57-45e090337474	00010000-5639-e7b7-27a3-a707b151e2e3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5639-e7b7-8e4d-cf2659a6b405	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5639-e7b7-5b0f-54372916ae13	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5639-e7b7-1bcc-0ed5ed63c8bb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5639-e7b7-480e-7a9b41fb9290	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5639-e7b7-191a-8ee553e328bc	00010000-5639-e7b7-a3bd-4ac5e046e9b3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5639-e7b7-db8d-5a82f198d7f1	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5639-e7b7-937c-d6ca47467112	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5639-e7b7-1551-a0ee13b12c63	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5639-e7b7-c547-ea03fd23d9df	00010000-5639-e7b7-90ea-3aa06956286b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5639-e7b7-95c7-e4a633049f9f	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5639-e7b7-e820-e3106dd8649d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5639-e7b7-3f10-4e01a507a54a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5639-e7b7-5068-0629e4868de3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5639-e7b7-b0e3-d154944ecf03	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5639-e7b7-2ed8-3c216bbb24ac	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5639-e7b7-8494-be15b10110e1	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5639-e7b7-bae7-f13780d5c883	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25160082)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5639-e7b5-5a58-533562df42ac	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5639-e7b5-517f-3241a6918c6f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5639-e7b5-2a1a-a601945f5956	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5639-e7b5-5ac6-c058531be7d9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5639-e7b5-45b6-ca411f085db8	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5639-e7b5-6981-28455a7e8e92	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5639-e7b5-1418-d46102085bab	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5639-e7b5-15e9-d8939680b806	Abonma-read	Abonma - branje	t
00030000-5639-e7b5-7f44-4e33287d5664	Abonma-write	Abonma - spreminjanje	t
00030000-5639-e7b5-2976-cf5235a638cc	Alternacija-read	Alternacija - branje	t
00030000-5639-e7b5-bd5d-4c0a6a0face1	Alternacija-write	Alternacija - spreminjanje	t
00030000-5639-e7b5-192a-8f9a0bda7cb5	Arhivalija-read	Arhivalija - branje	t
00030000-5639-e7b5-6651-9e7da29d60a9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5639-e7b5-497f-221168918e91	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5639-e7b5-0ad0-4d56ca2b715c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5639-e7b5-0259-d483cf1faea7	Besedilo-read	Besedilo - branje	t
00030000-5639-e7b5-5153-67d15008757f	Besedilo-write	Besedilo - spreminjanje	t
00030000-5639-e7b5-6320-efd4f8538e32	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5639-e7b5-cb1d-5a358994fdb6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5639-e7b5-6c63-0508b9958376	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5639-e7b5-dbf0-32cda72ea307	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5639-e7b5-3a8d-e26e7f02aa9b	Dogodek-read	Dogodek - branje	t
00030000-5639-e7b5-44c3-30d0fde979b0	Dogodek-write	Dogodek - spreminjanje	t
00030000-5639-e7b5-b253-f453156a60f9	DrugiVir-read	DrugiVir - branje	t
00030000-5639-e7b5-776a-33dc3531b6dc	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5639-e7b5-c41b-3319da0fefcd	Drzava-read	Drzava - branje	t
00030000-5639-e7b5-aef9-8f7689171655	Drzava-write	Drzava - spreminjanje	t
00030000-5639-e7b5-5986-a75f08bd3081	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5639-e7b5-a79d-56bfe6fd18f6	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5639-e7b5-46e6-c1e279c2d938	Funkcija-read	Funkcija - branje	t
00030000-5639-e7b5-291a-f735e81f8af8	Funkcija-write	Funkcija - spreminjanje	t
00030000-5639-e7b5-18d4-01d30bebcba6	Gostovanje-read	Gostovanje - branje	t
00030000-5639-e7b5-294d-ee7a00a8fde7	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5639-e7b5-2a9d-4eae3e07bab4	Gostujoca-read	Gostujoca - branje	t
00030000-5639-e7b5-3205-53a6017b2fc9	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5639-e7b5-1653-0e5fe12caec9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5639-e7b5-f969-700edc309528	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5639-e7b5-7ff7-e7255d3208e5	Kupec-read	Kupec - branje	t
00030000-5639-e7b5-2d4f-db9d188c8a5f	Kupec-write	Kupec - spreminjanje	t
00030000-5639-e7b5-ee02-14fdc7281c1e	NacinPlacina-read	NacinPlacina - branje	t
00030000-5639-e7b5-8e8d-4495700a95c9	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5639-e7b5-a8c9-8bb4e2db05f1	Option-read	Option - branje	t
00030000-5639-e7b5-824d-d1a51fb129cd	Option-write	Option - spreminjanje	t
00030000-5639-e7b5-cd3a-945b0dc3e3c1	OptionValue-read	OptionValue - branje	t
00030000-5639-e7b5-1a1b-85d86a9f2d95	OptionValue-write	OptionValue - spreminjanje	t
00030000-5639-e7b5-f518-56b8245c85c0	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5639-e7b5-f800-437b31f7f756	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5639-e7b5-e684-872f1f349b50	Oseba-read	Oseba - branje	t
00030000-5639-e7b5-4ade-518ac6e6ca6a	Oseba-write	Oseba - spreminjanje	t
00030000-5639-e7b5-61a6-e6ab931e3a8e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5639-e7b5-43e9-4bf383912685	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5639-e7b5-4ef9-596ac02ee486	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5639-e7b5-c3b2-80936d6e2abb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5639-e7b5-cb32-c3cb53c5d0f8	Pogodba-read	Pogodba - branje	t
00030000-5639-e7b5-1d20-47ff6a5d9744	Pogodba-write	Pogodba - spreminjanje	t
00030000-5639-e7b5-dce5-804bb2f37e24	Popa-read	Popa - branje	t
00030000-5639-e7b5-cf52-73c56310a30a	Popa-write	Popa - spreminjanje	t
00030000-5639-e7b5-31b9-b196c4bb3043	Posta-read	Posta - branje	t
00030000-5639-e7b5-095e-c73d4893ccb5	Posta-write	Posta - spreminjanje	t
00030000-5639-e7b5-a285-08f8dccfc2c7	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5639-e7b5-1f95-3f4cd5c8e934	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5639-e7b5-cf18-8b543ebc2ee2	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5639-e7b5-55ca-71dbb7f9adcb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5639-e7b5-205a-708be18bcf30	PostniNaslov-read	PostniNaslov - branje	t
00030000-5639-e7b5-b364-a0dbce13880a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5639-e7b5-4021-620de381c0dd	Predstava-read	Predstava - branje	t
00030000-5639-e7b5-a326-2d2605f58aaf	Predstava-write	Predstava - spreminjanje	t
00030000-5639-e7b5-db7e-5d6df296248a	Praznik-read	Praznik - branje	t
00030000-5639-e7b5-133b-c25dfb6be894	Praznik-write	Praznik - spreminjanje	t
00030000-5639-e7b5-6dd4-74bd7c5d2914	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5639-e7b5-9416-8b5dd36187aa	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5639-e7b5-ba6c-2f768803ae77	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5639-e7b5-42fe-b151ba264f49	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5639-e7b5-da38-0905eca18d73	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5639-e7b5-c114-8cc2ae33431e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5639-e7b5-395e-fdfca14c3a4e	ProgramDela-read	ProgramDela - branje	t
00030000-5639-e7b5-2e04-82684b275cd8	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5639-e7b5-ead3-73cfc5236133	ProgramFestival-read	ProgramFestival - branje	t
00030000-5639-e7b5-4241-d77efd368953	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5639-e7b5-8429-4f82a5b552e9	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5639-e7b5-decb-1b982ec0813f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5639-e7b5-2cfd-d25f608709d5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5639-e7b5-39d8-e48da5d19d56	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5639-e7b5-6a15-e787e26fdc29	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5639-e7b5-b149-fac61341e378	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5639-e7b5-aaaa-d0c281574edd	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5639-e7b5-0ac0-ffb4cdba45bd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5639-e7b5-c3b6-8fbab1e98da8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5639-e7b5-299f-835449fbf2fc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5639-e7b5-dd10-13bf100c347b	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5639-e7b5-a77f-0fdc49b55787	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5639-e7b5-963c-58b125111b6b	ProgramRazno-read	ProgramRazno - branje	t
00030000-5639-e7b5-f403-b370f0bf990d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5639-e7b5-b4c7-5ae363a9e6da	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5639-e7b5-c318-4a47aabfaba1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5639-e7b5-63bf-d0613c4b7297	Prostor-read	Prostor - branje	t
00030000-5639-e7b5-1be2-af4a66e05d4a	Prostor-write	Prostor - spreminjanje	t
00030000-5639-e7b5-9792-22cdddad5644	Racun-read	Racun - branje	t
00030000-5639-e7b5-0fd4-aa0fa97678b2	Racun-write	Racun - spreminjanje	t
00030000-5639-e7b5-dd4a-58ed2fa86a41	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5639-e7b5-ddd1-9cdb36ae17db	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5639-e7b5-f7eb-8c0747d597a1	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5639-e7b5-71fe-4167af61ea09	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5639-e7b5-848f-1a3be52aba22	Rekvizit-read	Rekvizit - branje	t
00030000-5639-e7b5-145e-3ea747015045	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5639-e7b5-b870-31928845a825	Revizija-read	Revizija - branje	t
00030000-5639-e7b5-5b53-473fd5115123	Revizija-write	Revizija - spreminjanje	t
00030000-5639-e7b5-7b88-7eb2d7906915	Rezervacija-read	Rezervacija - branje	t
00030000-5639-e7b5-c659-d078c0243565	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5639-e7b5-4977-f7d2ca997901	SedezniRed-read	SedezniRed - branje	t
00030000-5639-e7b5-8750-191a0c71ddf9	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5639-e7b5-28ff-7ec599fa1c7d	Sedez-read	Sedez - branje	t
00030000-5639-e7b5-93ce-a1fc04540070	Sedez-write	Sedez - spreminjanje	t
00030000-5639-e7b5-fd78-50a5a5c41558	Sezona-read	Sezona - branje	t
00030000-5639-e7b5-cd79-c5b74ffd553e	Sezona-write	Sezona - spreminjanje	t
00030000-5639-e7b5-dda6-cc99cbf122e6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5639-e7b5-5760-db85ebbd3f98	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5639-e7b5-af54-02ef74a131cb	Stevilcenje-read	Stevilcenje - branje	t
00030000-5639-e7b5-fe16-170d5bc928b0	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5639-e7b5-b6d8-8cc070a06f9c	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5639-e7b5-81ba-55023f5ae1b4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5639-e7b5-cdb4-a5618efdd29b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5639-e7b5-3778-15d0f83ca15b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5639-e7b5-d0a8-12f44808e7e4	Telefonska-read	Telefonska - branje	t
00030000-5639-e7b5-7367-c5fdb5814d58	Telefonska-write	Telefonska - spreminjanje	t
00030000-5639-e7b5-9167-1e6fba8eb3bf	TerminStoritve-read	TerminStoritve - branje	t
00030000-5639-e7b5-f7b1-99d48135261d	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5639-e7b5-216d-7dab56d1df18	TipFunkcije-read	TipFunkcije - branje	t
00030000-5639-e7b5-5650-082e6dc8c855	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5639-e7b5-b556-92f62311682a	TipPopa-read	TipPopa - branje	t
00030000-5639-e7b5-9c71-1bc3930ec280	TipPopa-write	TipPopa - spreminjanje	t
00030000-5639-e7b5-fb5e-e1798ed4005b	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5639-e7b5-1019-5cb38f496cf1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5639-e7b5-8a08-f7117e3a7e5f	TipVaje-read	TipVaje - branje	t
00030000-5639-e7b5-0feb-a095a8661041	TipVaje-write	TipVaje - spreminjanje	t
00030000-5639-e7b5-bca9-30cc70108e9a	Trr-read	Trr - branje	t
00030000-5639-e7b5-7449-5d57446d8fcf	Trr-write	Trr - spreminjanje	t
00030000-5639-e7b5-3bde-70d2eb97dff5	Uprizoritev-read	Uprizoritev - branje	t
00030000-5639-e7b5-5b4b-77d9aee529f0	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5639-e7b5-87f5-d2933a2ab16e	Vaja-read	Vaja - branje	t
00030000-5639-e7b5-1cd6-56d93b0fd646	Vaja-write	Vaja - spreminjanje	t
00030000-5639-e7b5-66c6-ed4d373e54aa	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5639-e7b5-c308-3c9667e14631	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5639-e7b5-f41d-a91d16e6a5dd	VrstaStroska-read	VrstaStroska - branje	t
00030000-5639-e7b5-b75d-00a2017fd6ec	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5639-e7b5-8e94-63d67a7351e8	Zaposlitev-read	Zaposlitev - branje	t
00030000-5639-e7b5-b60a-7315c48732b2	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5639-e7b5-7309-f5b6f5549be9	Zasedenost-read	Zasedenost - branje	t
00030000-5639-e7b5-9529-a49698087caf	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5639-e7b5-02fe-7080d73b6043	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5639-e7b5-0d88-fd2a7e05062a	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5639-e7b5-1439-85e7cd6988ca	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5639-e7b5-c623-941134d0234b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5639-e7b5-deee-e3bc416b69af	Job-read	Branje opravil - samo zase - branje	t
00030000-5639-e7b5-d1ca-1a65d381bf2b	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5639-e7b5-0ab7-ca815573c69f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5639-e7b5-656c-a082c1c895c3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5639-e7b5-07b1-3a85f71a8ba9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5639-e7b5-b480-da9b0d3b5ba7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5639-e7b5-e102-13104168fff8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5639-e7b5-1269-24c873b9d02d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5639-e7b5-9cae-cb7401508a14	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5639-e7b5-2827-7c2800171c6b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5639-e7b5-1a2d-cc21ca83592b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5639-e7b5-c83e-576eda34f3af	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5639-e7b5-d9f8-f38cf5322ef3	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5639-e7b5-e1e8-d27541936e27	Datoteka-write	Datoteka - spreminjanje	t
00030000-5639-e7b5-131e-f209cf10bc32	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25160101)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5639-e7b5-3903-2f4b77e94ec8	00030000-5639-e7b5-517f-3241a6918c6f
00020000-5639-e7b5-a876-5cef53e77ca8	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-15e9-d8939680b806
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-7f44-4e33287d5664
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-2976-cf5235a638cc
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-bd5d-4c0a6a0face1
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-192a-8f9a0bda7cb5
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-3a8d-e26e7f02aa9b
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-5ac6-c058531be7d9
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-44c3-30d0fde979b0
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-aef9-8f7689171655
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-46e6-c1e279c2d938
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-291a-f735e81f8af8
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-18d4-01d30bebcba6
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-294d-ee7a00a8fde7
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-2a9d-4eae3e07bab4
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-3205-53a6017b2fc9
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-1653-0e5fe12caec9
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-f969-700edc309528
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-a8c9-8bb4e2db05f1
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-cd3a-945b0dc3e3c1
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-e684-872f1f349b50
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-4ade-518ac6e6ca6a
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-dce5-804bb2f37e24
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-cf52-73c56310a30a
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-31b9-b196c4bb3043
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-095e-c73d4893ccb5
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-205a-708be18bcf30
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-b364-a0dbce13880a
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-4021-620de381c0dd
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-a326-2d2605f58aaf
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-da38-0905eca18d73
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-c114-8cc2ae33431e
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-63bf-d0613c4b7297
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-1be2-af4a66e05d4a
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-f7eb-8c0747d597a1
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-71fe-4167af61ea09
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-848f-1a3be52aba22
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-145e-3ea747015045
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-fd78-50a5a5c41558
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-cd79-c5b74ffd553e
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-216d-7dab56d1df18
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-3bde-70d2eb97dff5
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-5b4b-77d9aee529f0
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-87f5-d2933a2ab16e
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-1cd6-56d93b0fd646
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-7309-f5b6f5549be9
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-9529-a49698087caf
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-02fe-7080d73b6043
00020000-5639-e7b5-c62b-aa45f3ba6245	00030000-5639-e7b5-1439-85e7cd6988ca
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-15e9-d8939680b806
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-192a-8f9a0bda7cb5
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-3a8d-e26e7f02aa9b
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-18d4-01d30bebcba6
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-2a9d-4eae3e07bab4
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-1653-0e5fe12caec9
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-f969-700edc309528
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-a8c9-8bb4e2db05f1
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-cd3a-945b0dc3e3c1
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-e684-872f1f349b50
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-4ade-518ac6e6ca6a
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-dce5-804bb2f37e24
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-31b9-b196c4bb3043
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-205a-708be18bcf30
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-b364-a0dbce13880a
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-4021-620de381c0dd
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-63bf-d0613c4b7297
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-f7eb-8c0747d597a1
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-848f-1a3be52aba22
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-fd78-50a5a5c41558
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-d0a8-12f44808e7e4
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-7367-c5fdb5814d58
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-bca9-30cc70108e9a
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-7449-5d57446d8fcf
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-8e94-63d67a7351e8
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-b60a-7315c48732b2
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-02fe-7080d73b6043
00020000-5639-e7b5-8762-532e74bdb58d	00030000-5639-e7b5-1439-85e7cd6988ca
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-15e9-d8939680b806
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-2976-cf5235a638cc
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-192a-8f9a0bda7cb5
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-6651-9e7da29d60a9
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-0259-d483cf1faea7
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-6320-efd4f8538e32
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-3a8d-e26e7f02aa9b
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-46e6-c1e279c2d938
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-18d4-01d30bebcba6
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-2a9d-4eae3e07bab4
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-1653-0e5fe12caec9
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-a8c9-8bb4e2db05f1
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-cd3a-945b0dc3e3c1
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-e684-872f1f349b50
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-dce5-804bb2f37e24
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-31b9-b196c4bb3043
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-4021-620de381c0dd
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-da38-0905eca18d73
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-63bf-d0613c4b7297
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-f7eb-8c0747d597a1
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-848f-1a3be52aba22
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-fd78-50a5a5c41558
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-216d-7dab56d1df18
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-87f5-d2933a2ab16e
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-7309-f5b6f5549be9
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-02fe-7080d73b6043
00020000-5639-e7b5-0e13-ccc3f3746412	00030000-5639-e7b5-1439-85e7cd6988ca
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-15e9-d8939680b806
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-7f44-4e33287d5664
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-bd5d-4c0a6a0face1
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-192a-8f9a0bda7cb5
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-3a8d-e26e7f02aa9b
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-18d4-01d30bebcba6
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-2a9d-4eae3e07bab4
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-a8c9-8bb4e2db05f1
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-cd3a-945b0dc3e3c1
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-dce5-804bb2f37e24
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-31b9-b196c4bb3043
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-4021-620de381c0dd
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-63bf-d0613c4b7297
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-f7eb-8c0747d597a1
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-848f-1a3be52aba22
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-fd78-50a5a5c41558
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-216d-7dab56d1df18
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-02fe-7080d73b6043
00020000-5639-e7b5-2bc6-cf26d1df567d	00030000-5639-e7b5-1439-85e7cd6988ca
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-15e9-d8939680b806
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-192a-8f9a0bda7cb5
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-3a8d-e26e7f02aa9b
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-18d4-01d30bebcba6
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-2a9d-4eae3e07bab4
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-a8c9-8bb4e2db05f1
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-cd3a-945b0dc3e3c1
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-dce5-804bb2f37e24
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-31b9-b196c4bb3043
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-4021-620de381c0dd
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-63bf-d0613c4b7297
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-f7eb-8c0747d597a1
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-848f-1a3be52aba22
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-fd78-50a5a5c41558
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-9167-1e6fba8eb3bf
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-2a1a-a601945f5956
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-216d-7dab56d1df18
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-02fe-7080d73b6043
00020000-5639-e7b5-b9e3-93c919f8f4af	00030000-5639-e7b5-1439-85e7cd6988ca
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5a58-533562df42ac
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-517f-3241a6918c6f
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-15e9-d8939680b806
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-7f44-4e33287d5664
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-2976-cf5235a638cc
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-bd5d-4c0a6a0face1
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-192a-8f9a0bda7cb5
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-6651-9e7da29d60a9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-497f-221168918e91
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-0ad0-4d56ca2b715c
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-0259-d483cf1faea7
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5153-67d15008757f
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-6320-efd4f8538e32
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cb1d-5a358994fdb6
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-3a8d-e26e7f02aa9b
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5ac6-c058531be7d9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-44c3-30d0fde979b0
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b253-f453156a60f9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-776a-33dc3531b6dc
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c41b-3319da0fefcd
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-aef9-8f7689171655
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5986-a75f08bd3081
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-a79d-56bfe6fd18f6
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-46e6-c1e279c2d938
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-291a-f735e81f8af8
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-18d4-01d30bebcba6
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-294d-ee7a00a8fde7
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-2a9d-4eae3e07bab4
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-3205-53a6017b2fc9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1653-0e5fe12caec9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f969-700edc309528
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-7ff7-e7255d3208e5
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-2d4f-db9d188c8a5f
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-ee02-14fdc7281c1e
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-8e8d-4495700a95c9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-a8c9-8bb4e2db05f1
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cd3a-945b0dc3e3c1
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1a1b-85d86a9f2d95
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-824d-d1a51fb129cd
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f518-56b8245c85c0
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f800-437b31f7f756
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-e684-872f1f349b50
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-45b6-ca411f085db8
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-4ade-518ac6e6ca6a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-61a6-e6ab931e3a8e
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-43e9-4bf383912685
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-4ef9-596ac02ee486
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c3b2-80936d6e2abb
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cb32-c3cb53c5d0f8
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1d20-47ff6a5d9744
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-dce5-804bb2f37e24
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cf52-73c56310a30a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-31b9-b196c4bb3043
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-a285-08f8dccfc2c7
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1f95-3f4cd5c8e934
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cf18-8b543ebc2ee2
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-55ca-71dbb7f9adcb
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-095e-c73d4893ccb5
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-205a-708be18bcf30
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b364-a0dbce13880a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-db7e-5d6df296248a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-133b-c25dfb6be894
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-4021-620de381c0dd
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-a326-2d2605f58aaf
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-6dd4-74bd7c5d2914
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-9416-8b5dd36187aa
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-ba6c-2f768803ae77
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-42fe-b151ba264f49
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-da38-0905eca18d73
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c114-8cc2ae33431e
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-6981-28455a7e8e92
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-395e-fdfca14c3a4e
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1418-d46102085bab
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-2e04-82684b275cd8
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-ead3-73cfc5236133
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-4241-d77efd368953
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-8429-4f82a5b552e9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-decb-1b982ec0813f
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-2cfd-d25f608709d5
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-39d8-e48da5d19d56
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-6a15-e787e26fdc29
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b149-fac61341e378
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-aaaa-d0c281574edd
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-0ac0-ffb4cdba45bd
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c3b6-8fbab1e98da8
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-299f-835449fbf2fc
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-dd10-13bf100c347b
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-a77f-0fdc49b55787
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-963c-58b125111b6b
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f403-b370f0bf990d
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b4c7-5ae363a9e6da
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c318-4a47aabfaba1
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-63bf-d0613c4b7297
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1be2-af4a66e05d4a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-9792-22cdddad5644
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-0fd4-aa0fa97678b2
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-dd4a-58ed2fa86a41
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-ddd1-9cdb36ae17db
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f7eb-8c0747d597a1
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-71fe-4167af61ea09
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-848f-1a3be52aba22
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-145e-3ea747015045
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b870-31928845a825
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5b53-473fd5115123
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-7b88-7eb2d7906915
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c659-d078c0243565
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-4977-f7d2ca997901
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-8750-191a0c71ddf9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-28ff-7ec599fa1c7d
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-93ce-a1fc04540070
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-fd78-50a5a5c41558
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cd79-c5b74ffd553e
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-dda6-cc99cbf122e6
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5760-db85ebbd3f98
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-af54-02ef74a131cb
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b6d8-8cc070a06f9c
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-81ba-55023f5ae1b4
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-fe16-170d5bc928b0
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-cdb4-a5618efdd29b
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-3778-15d0f83ca15b
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-d0a8-12f44808e7e4
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-7367-c5fdb5814d58
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-9167-1e6fba8eb3bf
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-2a1a-a601945f5956
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f7b1-99d48135261d
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-216d-7dab56d1df18
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5650-082e6dc8c855
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b556-92f62311682a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-9c71-1bc3930ec280
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-fb5e-e1798ed4005b
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1019-5cb38f496cf1
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-8a08-f7117e3a7e5f
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-0feb-a095a8661041
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-bca9-30cc70108e9a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-7449-5d57446d8fcf
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-3bde-70d2eb97dff5
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-5b4b-77d9aee529f0
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-87f5-d2933a2ab16e
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1cd6-56d93b0fd646
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-66c6-ed4d373e54aa
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c308-3c9667e14631
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-f41d-a91d16e6a5dd
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b75d-00a2017fd6ec
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-8e94-63d67a7351e8
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-b60a-7315c48732b2
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-7309-f5b6f5549be9
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-9529-a49698087caf
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-02fe-7080d73b6043
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-0d88-fd2a7e05062a
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-1439-85e7cd6988ca
00020000-5639-e7b7-b372-15b7e17218dc	00030000-5639-e7b5-c623-941134d0234b
\.


--
-- TOC entry 3135 (class 0 OID 25160491)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25160525)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25160662)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5639-e7b7-aa15-77a6089e9e8f	00090000-5639-e7b7-c72b-ebe5d6d54a34	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5639-e7b7-a6e5-c47787cd0965	00090000-5639-e7b7-5b0f-54372916ae13	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5639-e7b7-9736-31ae0dddfbcb	00090000-5639-e7b7-c547-ea03fd23d9df	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5639-e7b7-b8f5-9e95ab147b7b	00090000-5639-e7b7-db8d-5a82f198d7f1	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25160183)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5639-e7b7-cb2c-90d4ec76b5b2	\N	00040000-5639-e7b5-7240-97381a9c2017	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-ec62-7a29de4b5285	\N	00040000-5639-e7b5-7240-97381a9c2017	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5639-e7b7-9dd8-19d20537a887	\N	00040000-5639-e7b5-7240-97381a9c2017	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-8440-0e3f9a9f6116	\N	00040000-5639-e7b5-7240-97381a9c2017	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-0719-618a378e4f64	\N	00040000-5639-e7b5-7240-97381a9c2017	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-8fdb-73f6bce1d106	\N	00040000-5639-e7b4-fc65-bd2524e51108	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-7f3c-272db9a0075d	\N	00040000-5639-e7b4-3312-70a0af8d7cf7	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-a7cb-bd2964c6c332	\N	00040000-5639-e7b4-0435-5c6f11c181d1	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b7-ccad-d4bcbab2ff3f	\N	00040000-5639-e7b5-1cd2-957fe41d9b68	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5639-e7b9-3612-4a57ae83e4af	\N	00040000-5639-e7b5-7240-97381a9c2017	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25160228)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5639-e7b4-181b-ab43f962ae8b	8341	Adlešiči
00050000-5639-e7b4-4299-0430bc1711f1	5270	Ajdovščina
00050000-5639-e7b4-fe9b-f7817aac9969	6280	Ankaran/Ancarano
00050000-5639-e7b4-a674-a90d7b99aa51	9253	Apače
00050000-5639-e7b4-feb6-7b2c43f5bd1c	8253	Artiče
00050000-5639-e7b4-f7af-458f861e325d	4275	Begunje na Gorenjskem
00050000-5639-e7b4-f9c5-0f2b9a34e242	1382	Begunje pri Cerknici
00050000-5639-e7b4-4574-a3cfe5eb8a61	9231	Beltinci
00050000-5639-e7b4-56f5-38dcffd45c46	2234	Benedikt
00050000-5639-e7b4-e385-484bfe8ee249	2345	Bistrica ob Dravi
00050000-5639-e7b4-c9c3-c497e5708855	3256	Bistrica ob Sotli
00050000-5639-e7b4-8d54-6fe70f48cc17	8259	Bizeljsko
00050000-5639-e7b4-d3c9-a0ce7f9e464a	1223	Blagovica
00050000-5639-e7b4-cfe6-1c20aef3e82b	8283	Blanca
00050000-5639-e7b4-88d2-4df77925ddab	4260	Bled
00050000-5639-e7b4-a5c0-ccee27e9deec	4273	Blejska Dobrava
00050000-5639-e7b4-9df0-35a370247fb8	9265	Bodonci
00050000-5639-e7b4-5236-983c3411ffb2	9222	Bogojina
00050000-5639-e7b4-3b59-08c698df079e	4263	Bohinjska Bela
00050000-5639-e7b4-fd80-13cd8176affd	4264	Bohinjska Bistrica
00050000-5639-e7b4-759d-37b9335d4e5c	4265	Bohinjsko jezero
00050000-5639-e7b4-ea4e-b318587f7c8a	1353	Borovnica
00050000-5639-e7b4-cb91-1f19be9f9c78	8294	Boštanj
00050000-5639-e7b4-4528-630173a0e1b5	5230	Bovec
00050000-5639-e7b4-d42d-5d191bc1505a	5295	Branik
00050000-5639-e7b4-1cb1-65ad62978284	3314	Braslovče
00050000-5639-e7b4-8c4b-3fe1899ab818	5223	Breginj
00050000-5639-e7b4-14c0-125464961e71	8280	Brestanica
00050000-5639-e7b4-6e8a-4f2eb4a1f8af	2354	Bresternica
00050000-5639-e7b4-c8d2-e11b130e1017	4243	Brezje
00050000-5639-e7b4-e39f-a1f138cca259	1351	Brezovica pri Ljubljani
00050000-5639-e7b4-775d-d038429e5e15	8250	Brežice
00050000-5639-e7b4-7696-4327145bff0b	4210	Brnik - Aerodrom
00050000-5639-e7b4-aa26-4042e31b4170	8321	Brusnice
00050000-5639-e7b4-2f41-ca06dabf27f3	3255	Buče
00050000-5639-e7b4-2637-9d432675dd8b	8276	Bučka 
00050000-5639-e7b4-db7b-73723f978b9f	9261	Cankova
00050000-5639-e7b4-97a6-75c8352798bb	3000	Celje 
00050000-5639-e7b4-ff2b-4f738ad1ac56	3001	Celje - poštni predali
00050000-5639-e7b4-e616-410dc2722eb9	4207	Cerklje na Gorenjskem
00050000-5639-e7b4-c4ac-105c4f4d897b	8263	Cerklje ob Krki
00050000-5639-e7b4-2ddf-5b51cce21003	1380	Cerknica
00050000-5639-e7b4-f8a3-26bacebb281f	5282	Cerkno
00050000-5639-e7b4-7c6e-226a8f67e83d	2236	Cerkvenjak
00050000-5639-e7b4-f755-291e968687b5	2215	Ceršak
00050000-5639-e7b4-bab9-67390ea7b5ee	2326	Cirkovce
00050000-5639-e7b4-03a8-72047bd417a9	2282	Cirkulane
00050000-5639-e7b4-c9d2-abdbca56d246	5273	Col
00050000-5639-e7b4-fb4b-90c1b61358ec	8251	Čatež ob Savi
00050000-5639-e7b4-4f00-d272ddc0218e	1413	Čemšenik
00050000-5639-e7b4-9a45-79fda0e6a23f	5253	Čepovan
00050000-5639-e7b4-b521-87f545ca2e11	9232	Črenšovci
00050000-5639-e7b4-e432-76aa8240b808	2393	Črna na Koroškem
00050000-5639-e7b4-b45f-d1ccdda8ce25	6275	Črni Kal
00050000-5639-e7b4-7068-c7d366948f60	5274	Črni Vrh nad Idrijo
00050000-5639-e7b4-2c2b-91cd076b0440	5262	Črniče
00050000-5639-e7b4-3559-d8289b0f8c5f	8340	Črnomelj
00050000-5639-e7b4-d429-cd97abbbfa40	6271	Dekani
00050000-5639-e7b4-bd82-4c1928b2fca5	5210	Deskle
00050000-5639-e7b4-1dec-8602b9469bfb	2253	Destrnik
00050000-5639-e7b4-b3ca-5308f150a7cf	6215	Divača
00050000-5639-e7b4-fe68-e05e2475bea5	1233	Dob
00050000-5639-e7b4-8b10-ff60241eee6f	3224	Dobje pri Planini
00050000-5639-e7b4-1829-fd82a06de89b	8257	Dobova
00050000-5639-e7b4-7e02-d9f7403f75ad	1423	Dobovec
00050000-5639-e7b4-6fe1-449c12471769	5263	Dobravlje
00050000-5639-e7b4-33b8-8eec15f8d956	3204	Dobrna
00050000-5639-e7b4-e53e-4ee3f3e74037	8211	Dobrnič
00050000-5639-e7b4-6210-8ca4bde24603	1356	Dobrova
00050000-5639-e7b4-2b49-8948a4bd83c2	9223	Dobrovnik/Dobronak 
00050000-5639-e7b4-c331-542a0574d5bb	5212	Dobrovo v Brdih
00050000-5639-e7b4-d26f-5a6bab783219	1431	Dol pri Hrastniku
00050000-5639-e7b4-fb93-cc3f730e834c	1262	Dol pri Ljubljani
00050000-5639-e7b4-3f46-3ea80307390c	1273	Dole pri Litiji
00050000-5639-e7b4-55dd-87c84957e37e	1331	Dolenja vas
00050000-5639-e7b4-e33a-99d2e2a5f1c0	8350	Dolenjske Toplice
00050000-5639-e7b4-ba24-a2e365483007	1230	Domžale
00050000-5639-e7b4-1ea9-bc5614b383e0	2252	Dornava
00050000-5639-e7b4-dfd2-d2ea65e880d6	5294	Dornberk
00050000-5639-e7b4-9147-7d4799177849	1319	Draga
00050000-5639-e7b4-4251-7096789bd64e	8343	Dragatuš
00050000-5639-e7b4-358b-7dcb5819395d	3222	Dramlje
00050000-5639-e7b4-041c-5e3072ded979	2370	Dravograd
00050000-5639-e7b4-fadb-1998ed1f4fc3	4203	Duplje
00050000-5639-e7b4-8d52-414b333f5a92	6221	Dutovlje
00050000-5639-e7b4-d7c8-b3e318894805	8361	Dvor
00050000-5639-e7b4-7883-72b967f49098	2343	Fala
00050000-5639-e7b4-49ff-c4ff661ce2c7	9208	Fokovci
00050000-5639-e7b4-4d1f-b5e892950123	2313	Fram
00050000-5639-e7b4-d39d-78dd935cdad7	3213	Frankolovo
00050000-5639-e7b4-494a-72bf92d068c2	1274	Gabrovka
00050000-5639-e7b4-3b85-7614c2350220	8254	Globoko
00050000-5639-e7b4-e54c-ee03e484f6d5	5275	Godovič
00050000-5639-e7b4-9dff-ee934e30ffcd	4204	Golnik
00050000-5639-e7b4-4e33-3e5650ced23f	3303	Gomilsko
00050000-5639-e7b4-30f6-51f62c99aff9	4224	Gorenja vas
00050000-5639-e7b4-caa4-910d638eb61e	3263	Gorica pri Slivnici
00050000-5639-e7b4-2855-8009d07992a3	2272	Gorišnica
00050000-5639-e7b4-7f88-ad1e51197a7d	9250	Gornja Radgona
00050000-5639-e7b4-9a6a-1c8b4d2e2172	3342	Gornji Grad
00050000-5639-e7b4-5f4f-912b8ecd7354	4282	Gozd Martuljek
00050000-5639-e7b4-77a1-9d867b5a913c	6272	Gračišče
00050000-5639-e7b4-cf9f-613550a0a4d4	9264	Grad
00050000-5639-e7b4-110a-ba954bf5cd26	8332	Gradac
00050000-5639-e7b4-287a-2697533cb45d	1384	Grahovo
00050000-5639-e7b4-4a0b-49a8de570755	5242	Grahovo ob Bači
00050000-5639-e7b4-d120-bd7f6ba91727	5251	Grgar
00050000-5639-e7b4-8695-4aeec1be734e	3302	Griže
00050000-5639-e7b4-5095-7ba6562de7a6	3231	Grobelno
00050000-5639-e7b4-19dd-c206b1bd9563	1290	Grosuplje
00050000-5639-e7b4-d699-35ba269f380d	2288	Hajdina
00050000-5639-e7b4-6956-0153d379cb60	8362	Hinje
00050000-5639-e7b4-2bd6-cfeaabfa0110	2311	Hoče
00050000-5639-e7b4-79a4-53059f442776	9205	Hodoš/Hodos
00050000-5639-e7b4-efa1-179c4452589a	1354	Horjul
00050000-5639-e7b4-6d32-4c82127da176	1372	Hotedršica
00050000-5639-e7b4-1a5c-be1ff547c81d	1430	Hrastnik
00050000-5639-e7b4-9735-ef95984da4be	6225	Hruševje
00050000-5639-e7b4-a2e9-c159f0788e8e	4276	Hrušica
00050000-5639-e7b4-4e69-a38a1a6148a0	5280	Idrija
00050000-5639-e7b4-fa06-cbb4a22c6e10	1292	Ig
00050000-5639-e7b4-3536-5b8f3078e46c	6250	Ilirska Bistrica
00050000-5639-e7b4-0eba-859829ef5941	6251	Ilirska Bistrica-Trnovo
00050000-5639-e7b4-6fa0-149adb65c065	1295	Ivančna Gorica
00050000-5639-e7b4-4453-ee926b19b902	2259	Ivanjkovci
00050000-5639-e7b4-c2bc-459d069e6c76	1411	Izlake
00050000-5639-e7b4-67ae-8ff252ac77a4	6310	Izola/Isola
00050000-5639-e7b4-76e4-4408c074e466	2222	Jakobski Dol
00050000-5639-e7b4-de2c-e40fafea29b1	2221	Jarenina
00050000-5639-e7b4-11af-38d85603a9d0	6254	Jelšane
00050000-5639-e7b4-2a5d-dde1618e9a44	4270	Jesenice
00050000-5639-e7b4-f261-5832ed7588fa	8261	Jesenice na Dolenjskem
00050000-5639-e7b4-0765-30e7dfcaf350	3273	Jurklošter
00050000-5639-e7b4-6412-8f85c5cfc3a9	2223	Jurovski Dol
00050000-5639-e7b4-fbd5-97696ee0de71	2256	Juršinci
00050000-5639-e7b4-3075-d8bbcf04cc70	5214	Kal nad Kanalom
00050000-5639-e7b4-ff56-dcbd1c08166d	3233	Kalobje
00050000-5639-e7b4-423f-81bbc3a6fb61	4246	Kamna Gorica
00050000-5639-e7b4-e0fd-38113b8647c8	2351	Kamnica
00050000-5639-e7b4-0914-2f279f9bae63	1241	Kamnik
00050000-5639-e7b4-ad25-e4e3b739e5c2	5213	Kanal
00050000-5639-e7b4-7d27-6b2eae937c65	8258	Kapele
00050000-5639-e7b4-8faf-2e123ab56156	2362	Kapla
00050000-5639-e7b4-6369-5ab86a8a5840	2325	Kidričevo
00050000-5639-e7b4-a263-18cebcb1bd59	1412	Kisovec
00050000-5639-e7b4-9a1d-384c1f975838	6253	Knežak
00050000-5639-e7b4-dbff-1e35adcf07cf	5222	Kobarid
00050000-5639-e7b4-e420-92ac8db769d9	9227	Kobilje
00050000-5639-e7b4-399f-ff341aeeb757	1330	Kočevje
00050000-5639-e7b4-5dcb-ee99e0452fea	1338	Kočevska Reka
00050000-5639-e7b4-4783-6dabda895dc2	2276	Kog
00050000-5639-e7b4-ef7d-35c6e3d8169a	5211	Kojsko
00050000-5639-e7b4-3b0e-6c7f58cb8a57	6223	Komen
00050000-5639-e7b4-7d2b-6dd708ca02af	1218	Komenda
00050000-5639-e7b4-8a1e-0fad4617639a	6000	Koper/Capodistria 
00050000-5639-e7b4-9c7e-0f18a7f3a573	6001	Koper/Capodistria - poštni predali
00050000-5639-e7b4-8022-7fdefe5b4825	8282	Koprivnica
00050000-5639-e7b4-2ec7-7821f8248c6d	5296	Kostanjevica na Krasu
00050000-5639-e7b4-595b-0530d46a2464	8311	Kostanjevica na Krki
00050000-5639-e7b4-5668-4dfdd4e6e940	1336	Kostel
00050000-5639-e7b4-4f3e-0da54671c60e	6256	Košana
00050000-5639-e7b4-d073-308f04b8edf5	2394	Kotlje
00050000-5639-e7b4-275f-4ba1bd9872fc	6240	Kozina
00050000-5639-e7b4-c42b-b4d05f3d5104	3260	Kozje
00050000-5639-e7b4-7bfb-ac2f7432fb44	4000	Kranj 
00050000-5639-e7b4-cfeb-f44cc68f47b0	4001	Kranj - poštni predali
00050000-5639-e7b4-965c-b68858437385	4280	Kranjska Gora
00050000-5639-e7b4-7624-0b55bd5fe985	1281	Kresnice
00050000-5639-e7b4-00c9-7f479ccd5f83	4294	Križe
00050000-5639-e7b4-0a98-1579084d047d	9206	Križevci
00050000-5639-e7b4-2427-2d45a2f4c40c	9242	Križevci pri Ljutomeru
00050000-5639-e7b4-9e9a-cde461e8dc54	1301	Krka
00050000-5639-e7b4-5079-3d5a769830b4	8296	Krmelj
00050000-5639-e7b4-80a6-fbb0a5cb44e2	4245	Kropa
00050000-5639-e7b4-912a-362943d4ee9a	8262	Krška vas
00050000-5639-e7b4-8ee4-5f8bbb7d781a	8270	Krško
00050000-5639-e7b4-0d66-1e5095e5994c	9263	Kuzma
00050000-5639-e7b4-a6f4-acec85257c52	2318	Laporje
00050000-5639-e7b4-bd59-22cfafcb873d	3270	Laško
00050000-5639-e7b4-6c81-84b3a0f6bea7	1219	Laze v Tuhinju
00050000-5639-e7b4-6abb-5a345830bf48	2230	Lenart v Slovenskih goricah
00050000-5639-e7b4-2cc9-0969b0765c6d	9220	Lendava/Lendva
00050000-5639-e7b4-d859-a211ceb11f60	4248	Lesce
00050000-5639-e7b4-38a7-f141110c8f7a	3261	Lesično
00050000-5639-e7b4-4a3a-7021e2889250	8273	Leskovec pri Krškem
00050000-5639-e7b4-b8ea-dfb55fccf154	2372	Libeliče
00050000-5639-e7b4-f5da-1bfe8b9aa814	2341	Limbuš
00050000-5639-e7b4-aa03-11332b79adac	1270	Litija
00050000-5639-e7b4-1114-56fc0ee4512a	3202	Ljubečna
00050000-5639-e7b4-9a86-78e7c2868c3b	1000	Ljubljana 
00050000-5639-e7b4-d9e7-3ad49701f339	1001	Ljubljana - poštni predali
00050000-5639-e7b4-7449-f0f9cd918e1d	1231	Ljubljana - Črnuče
00050000-5639-e7b4-c039-048e9e6a80fc	1261	Ljubljana - Dobrunje
00050000-5639-e7b4-5be9-4fc9d590fb5e	1260	Ljubljana - Polje
00050000-5639-e7b4-dc4f-e8ab8e02fbec	1210	Ljubljana - Šentvid
00050000-5639-e7b4-7c2c-cb55d8ed87ef	1211	Ljubljana - Šmartno
00050000-5639-e7b4-a1ea-deca40f424fd	3333	Ljubno ob Savinji
00050000-5639-e7b4-b674-d0028a8ca00d	9240	Ljutomer
00050000-5639-e7b4-183b-8146f9a80de2	3215	Loče
00050000-5639-e7b4-4ac3-38f736b0d9d6	5231	Log pod Mangartom
00050000-5639-e7b4-a1bb-b2fbb66d6ff3	1358	Log pri Brezovici
00050000-5639-e7b4-f161-e3cb8d6f6e14	1370	Logatec
00050000-5639-e7b4-2f39-3dff53bbe303	1371	Logatec
00050000-5639-e7b4-9db5-fdc2c41173e4	1434	Loka pri Zidanem Mostu
00050000-5639-e7b4-8cdf-56f790cb0dd4	3223	Loka pri Žusmu
00050000-5639-e7b4-ee4a-2e592e8cbc0b	6219	Lokev
00050000-5639-e7b4-74ba-3ffab217d37b	1318	Loški Potok
00050000-5639-e7b4-7678-560ede34d51a	2324	Lovrenc na Dravskem polju
00050000-5639-e7b4-d13f-3682957c5d2c	2344	Lovrenc na Pohorju
00050000-5639-e7b4-8744-f3d88ebf6cd9	3334	Luče
00050000-5639-e7b4-561b-ebe28227e72e	1225	Lukovica
00050000-5639-e7b4-528e-ae74da2ded90	9202	Mačkovci
00050000-5639-e7b4-b762-bba5d8e266a6	2322	Majšperk
00050000-5639-e7b4-efb3-8e4a577b5ce8	2321	Makole
00050000-5639-e7b4-8c31-39fc36c3b0fa	9243	Mala Nedelja
00050000-5639-e7b4-142a-906a7c2f868c	2229	Malečnik
00050000-5639-e7b4-10a3-f61414ab7ae1	6273	Marezige
00050000-5639-e7b4-8ebc-94e183f1435f	2000	Maribor 
00050000-5639-e7b4-da5d-f1f176b2daba	2001	Maribor - poštni predali
00050000-5639-e7b4-9aa8-bccf60906691	2206	Marjeta na Dravskem polju
00050000-5639-e7b4-4168-22092c937a54	2281	Markovci
00050000-5639-e7b4-ad28-4f131ea76e76	9221	Martjanci
00050000-5639-e7b4-573e-c747feb6e94f	6242	Materija
00050000-5639-e7b4-a623-ba4424139794	4211	Mavčiče
00050000-5639-e7b4-22ac-dd784e0f4489	1215	Medvode
00050000-5639-e7b4-9e01-1a8216daa6c5	1234	Mengeš
00050000-5639-e7b4-0562-d737e7b964c2	8330	Metlika
00050000-5639-e7b4-4a34-28e0e892034f	2392	Mežica
00050000-5639-e7b4-a0c4-091a5aa7add2	2204	Miklavž na Dravskem polju
00050000-5639-e7b4-55c8-6198bebdb20f	2275	Miklavž pri Ormožu
00050000-5639-e7b4-e49a-0ade5ed8f5c8	5291	Miren
00050000-5639-e7b4-dae9-49ca3b6bf9b3	8233	Mirna
00050000-5639-e7b4-dcba-8d1e83c13fe2	8216	Mirna Peč
00050000-5639-e7b4-9572-bbf1560839a7	2382	Mislinja
00050000-5639-e7b4-19a5-31f162b2a9d2	4281	Mojstrana
00050000-5639-e7b4-78b1-523e29a0c19f	8230	Mokronog
00050000-5639-e7b4-7b35-0d5b85e0032a	1251	Moravče
00050000-5639-e7b4-ca7a-b4924361b5b3	9226	Moravske Toplice
00050000-5639-e7b4-5fe1-fdb216c667dd	5216	Most na Soči
00050000-5639-e7b4-4675-b2d49ac0e8cf	1221	Motnik
00050000-5639-e7b4-7727-34ed5d56ebe8	3330	Mozirje
00050000-5639-e7b4-d16a-c2ddbd2ff417	9000	Murska Sobota 
00050000-5639-e7b4-ca15-d8a663d0ac0c	9001	Murska Sobota - poštni predali
00050000-5639-e7b4-9010-54ba3d6f244b	2366	Muta
00050000-5639-e7b4-8f5f-ba393aae5c99	4202	Naklo
00050000-5639-e7b4-90f7-8c95bbd605b6	3331	Nazarje
00050000-5639-e7b4-543c-97d6f89e637e	1357	Notranje Gorice
00050000-5639-e7b4-7c9e-edc17892281b	3203	Nova Cerkev
00050000-5639-e7b4-1a86-7d02f6c2395e	5000	Nova Gorica 
00050000-5639-e7b4-3a49-df62df640afd	5001	Nova Gorica - poštni predali
00050000-5639-e7b4-9ef4-a72f4bc97123	1385	Nova vas
00050000-5639-e7b4-9086-3c022ae53078	8000	Novo mesto
00050000-5639-e7b4-7a69-f9ce8c48d770	8001	Novo mesto - poštni predali
00050000-5639-e7b4-b15d-48e955a6c703	6243	Obrov
00050000-5639-e7b4-9e5b-bb519fb81dfb	9233	Odranci
00050000-5639-e7b4-c101-4c3a9b43039d	2317	Oplotnica
00050000-5639-e7b4-6bbb-a81e30ec39c1	2312	Orehova vas
00050000-5639-e7b4-65f3-edf031f0e33f	2270	Ormož
00050000-5639-e7b4-17dd-9ed765d2811b	1316	Ortnek
00050000-5639-e7b4-464f-33ef814c7291	1337	Osilnica
00050000-5639-e7b4-16f2-011e6f1c8198	8222	Otočec
00050000-5639-e7b4-f5f6-1b4fc6c0af66	2361	Ožbalt
00050000-5639-e7b4-7351-0ab56ce8f56f	2231	Pernica
00050000-5639-e7b4-c2f5-f5edc46ac4cf	2211	Pesnica pri Mariboru
00050000-5639-e7b4-d403-6aa4d669d81c	9203	Petrovci
00050000-5639-e7b4-0cc0-1ea3bc393f9e	3301	Petrovče
00050000-5639-e7b4-a3e6-5a7d5a74703c	6330	Piran/Pirano
00050000-5639-e7b4-b7e5-b76147925ed2	8255	Pišece
00050000-5639-e7b4-8986-7066bb25cf69	6257	Pivka
00050000-5639-e7b4-506c-163aa4f10777	6232	Planina
00050000-5639-e7b4-2df5-b2236e579ef1	3225	Planina pri Sevnici
00050000-5639-e7b4-7084-aaa228b24df2	6276	Pobegi
00050000-5639-e7b4-2cc9-1841048c8599	8312	Podbočje
00050000-5639-e7b4-a6be-553b004b38e6	5243	Podbrdo
00050000-5639-e7b4-f7b8-b3855f6aa924	3254	Podčetrtek
00050000-5639-e7b4-d2f7-99504b6070bd	2273	Podgorci
00050000-5639-e7b4-8a32-b2fdd4463974	6216	Podgorje
00050000-5639-e7b4-4f7d-c3c03a692c8b	2381	Podgorje pri Slovenj Gradcu
00050000-5639-e7b4-51d9-73cb091810f7	6244	Podgrad
00050000-5639-e7b4-d444-92e9b31cca27	1414	Podkum
00050000-5639-e7b4-ce68-49d3a925854a	2286	Podlehnik
00050000-5639-e7b4-4c37-fa27d9296700	5272	Podnanos
00050000-5639-e7b4-0374-54bfa77e7bee	4244	Podnart
00050000-5639-e7b4-bec2-84e9075ef534	3241	Podplat
00050000-5639-e7b4-fafb-8579a48e98cb	3257	Podsreda
00050000-5639-e7b4-206b-be0be4cfe345	2363	Podvelka
00050000-5639-e7b4-33e9-9643b99af02b	2208	Pohorje
00050000-5639-e7b4-7a51-2529b4a764bb	2257	Polenšak
00050000-5639-e7b4-43eb-4c5e413c8962	1355	Polhov Gradec
00050000-5639-e7b4-5d01-10782f8116e9	4223	Poljane nad Škofjo Loko
00050000-5639-e7b4-8a34-5d551e034b6e	2319	Poljčane
00050000-5639-e7b4-fbeb-a2470527b8aa	1272	Polšnik
00050000-5639-e7b4-cdfc-9eee8f6cfb7e	3313	Polzela
00050000-5639-e7b4-c692-43c8800b75bd	3232	Ponikva
00050000-5639-e7b4-d90b-434fde0004d1	6320	Portorož/Portorose
00050000-5639-e7b4-d7ca-19f0bd84f726	6230	Postojna
00050000-5639-e7b4-24aa-8b02e8c32aaa	2331	Pragersko
00050000-5639-e7b4-11f9-aa325e97fedb	3312	Prebold
00050000-5639-e7b4-429b-4f29fee8bf1e	4205	Preddvor
00050000-5639-e7b4-a600-c95d45ec1ba5	6255	Prem
00050000-5639-e7b4-7d25-f35cdd5ca02c	1352	Preserje
00050000-5639-e7b4-5e30-1f0d751a736a	6258	Prestranek
00050000-5639-e7b4-6767-4b312996a219	2391	Prevalje
00050000-5639-e7b4-6219-1d0b3e2c9bad	3262	Prevorje
00050000-5639-e7b4-6857-b7f8cfcb207d	1276	Primskovo 
00050000-5639-e7b4-8227-e56432009002	3253	Pristava pri Mestinju
00050000-5639-e7b4-3d3f-d6208e45fda9	9207	Prosenjakovci/Partosfalva
00050000-5639-e7b4-965b-c79fe2b6909a	5297	Prvačina
00050000-5639-e7b4-d66e-be712e614d80	2250	Ptuj
00050000-5639-e7b4-a09f-0e7c7d578c45	2323	Ptujska Gora
00050000-5639-e7b4-826a-15e6ea2d8dc9	9201	Puconci
00050000-5639-e7b4-b61f-df99b9f1177a	2327	Rače
00050000-5639-e7b4-1bfb-0f3b95f968d8	1433	Radeče
00050000-5639-e7b4-002b-158f6833cedc	9252	Radenci
00050000-5639-e7b4-2dc2-5d9b4e006941	2360	Radlje ob Dravi
00050000-5639-e7b4-a5c6-f80e680492fb	1235	Radomlje
00050000-5639-e7b4-f5d1-3c8858e4e493	4240	Radovljica
00050000-5639-e7b4-e27d-eb23ad0763fc	8274	Raka
00050000-5639-e7b4-af5d-8c8b22109ea9	1381	Rakek
00050000-5639-e7b4-24a2-a6b61357f1b4	4283	Rateče - Planica
00050000-5639-e7b4-63a5-0f4ca061146b	2390	Ravne na Koroškem
00050000-5639-e7b4-cc4c-a6658a0d3525	9246	Razkrižje
00050000-5639-e7b4-dd5f-11911fb67b3e	3332	Rečica ob Savinji
00050000-5639-e7b4-e4c1-234c0531eed7	5292	Renče
00050000-5639-e7b4-3bc4-12cea8b55ff8	1310	Ribnica
00050000-5639-e7b4-33c0-e9cff12caeec	2364	Ribnica na Pohorju
00050000-5639-e7b4-b6c9-62474b2a1550	3272	Rimske Toplice
00050000-5639-e7b4-78ba-d6d2287fa47b	1314	Rob
00050000-5639-e7b4-9b80-b9b270a64105	5215	Ročinj
00050000-5639-e7b4-ead6-e2fbfe0e5b41	3250	Rogaška Slatina
00050000-5639-e7b4-d60f-10bd513b6af8	9262	Rogašovci
00050000-5639-e7b4-f5db-01ee6a4f4813	3252	Rogatec
00050000-5639-e7b4-5f11-7f5495af5722	1373	Rovte
00050000-5639-e7b4-a196-d3e252020d53	2342	Ruše
00050000-5639-e7b4-bfc5-658b4a88dd25	1282	Sava
00050000-5639-e7b4-c746-757770f675e1	6333	Sečovlje/Sicciole
00050000-5639-e7b4-f83b-05b1e5c1306a	4227	Selca
00050000-5639-e7b4-ea19-d63878dc8535	2352	Selnica ob Dravi
00050000-5639-e7b4-5809-4c66ca8a8d6c	8333	Semič
00050000-5639-e7b4-502b-abdd34db61da	8281	Senovo
00050000-5639-e7b4-f544-d278ff31e46e	6224	Senožeče
00050000-5639-e7b4-9ab8-128f8f4c99c9	8290	Sevnica
00050000-5639-e7b4-785b-f659cd4f329e	6210	Sežana
00050000-5639-e7b4-90c0-106a264e5915	2214	Sladki Vrh
00050000-5639-e7b4-a81d-849e39370312	5283	Slap ob Idrijci
00050000-5639-e7b4-a9d5-6afe07b8f7a4	2380	Slovenj Gradec
00050000-5639-e7b4-7405-0623a9d65eb7	2310	Slovenska Bistrica
00050000-5639-e7b4-5fe2-ab43f8c2330d	3210	Slovenske Konjice
00050000-5639-e7b4-716c-4409036fdd71	1216	Smlednik
00050000-5639-e7b4-7287-1bcf6b0c9184	5232	Soča
00050000-5639-e7b4-840e-1ccf2f00f218	1317	Sodražica
00050000-5639-e7b4-49b0-86ecd5bbeffd	3335	Solčava
00050000-5639-e7b4-c6ca-9dc96c3c8f4b	5250	Solkan
00050000-5639-e7b4-873b-95d10d034dab	4229	Sorica
00050000-5639-e7b4-dc96-9b1db217012f	4225	Sovodenj
00050000-5639-e7b4-86d2-268e40b8c702	5281	Spodnja Idrija
00050000-5639-e7b4-0aa2-aa285991df98	2241	Spodnji Duplek
00050000-5639-e7b4-ae62-a31e1cd4e154	9245	Spodnji Ivanjci
00050000-5639-e7b4-96c8-f4890d86e55e	2277	Središče ob Dravi
00050000-5639-e7b4-f429-7c8cceffaf08	4267	Srednja vas v Bohinju
00050000-5639-e7b4-7b2b-c6dc1b1c8ae4	8256	Sromlje 
00050000-5639-e7b4-a8bb-7d2b229c7cb5	5224	Srpenica
00050000-5639-e7b4-67b1-fba62323107a	1242	Stahovica
00050000-5639-e7b4-c474-00571c21835c	1332	Stara Cerkev
00050000-5639-e7b4-f7d9-21b6149c63bb	8342	Stari trg ob Kolpi
00050000-5639-e7b4-fa46-777e69deb313	1386	Stari trg pri Ložu
00050000-5639-e7b4-f7e0-6c2f6d5465f5	2205	Starše
00050000-5639-e7b4-f521-d5e60b83bcdd	2289	Stoperce
00050000-5639-e7b4-e3ca-f52c6428b283	8322	Stopiče
00050000-5639-e7b4-f66e-6a38ad2f1838	3206	Stranice
00050000-5639-e7b4-52d6-c9df29e378f3	8351	Straža
00050000-5639-e7b4-193b-0ea64d3e6aba	1313	Struge
00050000-5639-e7b4-e99b-752c179bd292	8293	Studenec
00050000-5639-e7b4-da69-d4c2adaafedf	8331	Suhor
00050000-5639-e7b4-637d-c44a81b55a53	2233	Sv. Ana v Slovenskih goricah
00050000-5639-e7b4-12bd-2f51b8dc366d	2235	Sv. Trojica v Slovenskih goricah
00050000-5639-e7b4-225c-86fb88dbc429	2353	Sveti Duh na Ostrem Vrhu
00050000-5639-e7b4-4e3a-fcd95c0840b8	9244	Sveti Jurij ob Ščavnici
00050000-5639-e7b4-e086-cd5d0c5a5d4c	3264	Sveti Štefan
00050000-5639-e7b4-49a2-989167f079bb	2258	Sveti Tomaž
00050000-5639-e7b4-9e65-bb8ba885338a	9204	Šalovci
00050000-5639-e7b4-06c5-166210396081	5261	Šempas
00050000-5639-e7b4-f865-623e64298752	5290	Šempeter pri Gorici
00050000-5639-e7b4-d8b7-55ebbc4cb816	3311	Šempeter v Savinjski dolini
00050000-5639-e7b4-d11c-edf933b74c34	4208	Šenčur
00050000-5639-e7b4-744c-507660528c24	2212	Šentilj v Slovenskih goricah
00050000-5639-e7b4-2933-3e760166fbe5	8297	Šentjanž
00050000-5639-e7b4-e1fc-0af4b4c64f4e	2373	Šentjanž pri Dravogradu
00050000-5639-e7b4-2160-6bfc1f4cf05c	8310	Šentjernej
00050000-5639-e7b4-3d41-2d4e7db94714	3230	Šentjur
00050000-5639-e7b4-5fa7-c1c527c8a11c	3271	Šentrupert
00050000-5639-e7b4-096e-78731ee1267b	8232	Šentrupert
00050000-5639-e7b4-f5dd-2b25d4fa5513	1296	Šentvid pri Stični
00050000-5639-e7b4-baa9-cf3a7ee060ef	8275	Škocjan
00050000-5639-e7b4-952a-9243e0b1c272	6281	Škofije
00050000-5639-e7b4-8e94-ae74763e786d	4220	Škofja Loka
00050000-5639-e7b4-e4e7-8ae03c2b6cc5	3211	Škofja vas
00050000-5639-e7b4-592a-f0d0f718dc53	1291	Škofljica
00050000-5639-e7b4-bd4c-66f4f81b07b9	6274	Šmarje
00050000-5639-e7b4-a0f8-7da3f7a5173e	1293	Šmarje - Sap
00050000-5639-e7b4-4f12-b2c74a7644db	3240	Šmarje pri Jelšah
00050000-5639-e7b4-d3a5-2da0128b3b87	8220	Šmarješke Toplice
00050000-5639-e7b4-951f-948549b51fd9	2315	Šmartno na Pohorju
00050000-5639-e7b4-91bf-32ae8c4ca13e	3341	Šmartno ob Dreti
00050000-5639-e7b4-3bfc-b3278c4ff696	3327	Šmartno ob Paki
00050000-5639-e7b4-3899-064abbf46cb2	1275	Šmartno pri Litiji
00050000-5639-e7b4-2392-29978f99ae7b	2383	Šmartno pri Slovenj Gradcu
00050000-5639-e7b4-6aa8-5bb5f499ad18	3201	Šmartno v Rožni dolini
00050000-5639-e7b4-5b38-fb95a1dea5aa	3325	Šoštanj
00050000-5639-e7b4-6157-034bb395c189	6222	Štanjel
00050000-5639-e7b4-dce5-6a55ee6dab76	3220	Štore
00050000-5639-e7b4-fe56-b65bfb4677d6	3304	Tabor
00050000-5639-e7b4-37ff-23d0ffe6fc33	3221	Teharje
00050000-5639-e7b4-994b-cea5ee4ba222	9251	Tišina
00050000-5639-e7b4-6f59-7614bbda37ae	5220	Tolmin
00050000-5639-e7b4-9c4a-65ee67dde21f	3326	Topolšica
00050000-5639-e7b4-fd34-d026e840543e	2371	Trbonje
00050000-5639-e7b4-1c27-115cd3205f1f	1420	Trbovlje
00050000-5639-e7b4-6240-85dfa0e83182	8231	Trebelno 
00050000-5639-e7b4-23c1-e73b66e8c923	8210	Trebnje
00050000-5639-e7b4-ece8-ae3edb4f8311	5252	Trnovo pri Gorici
00050000-5639-e7b4-c4a5-1a86ba7f4983	2254	Trnovska vas
00050000-5639-e7b4-08f6-17c3578249d8	1222	Trojane
00050000-5639-e7b4-19b9-d714d98c8b9f	1236	Trzin
00050000-5639-e7b4-1d3d-384cccb2d723	4290	Tržič
00050000-5639-e7b4-22a4-036011b406a8	8295	Tržišče
00050000-5639-e7b4-2e6f-7c36a156c205	1311	Turjak
00050000-5639-e7b4-25c5-9a07fac48bc3	9224	Turnišče
00050000-5639-e7b4-c2e6-16d4a2a9f766	8323	Uršna sela
00050000-5639-e7b4-dfa4-d46f3efd3da9	1252	Vače
00050000-5639-e7b4-12e0-93f1e09d01e2	3320	Velenje 
00050000-5639-e7b4-5d8f-fb6ba417bda8	3322	Velenje - poštni predali
00050000-5639-e7b4-38d8-34ee42d0eae5	8212	Velika Loka
00050000-5639-e7b4-5028-ce59f95c633b	2274	Velika Nedelja
00050000-5639-e7b4-7c0f-c18e914fc401	9225	Velika Polana
00050000-5639-e7b4-a9a9-adf3b9ff45ab	1315	Velike Lašče
00050000-5639-e7b4-c25a-639e3af646e5	8213	Veliki Gaber
00050000-5639-e7b4-df2b-ab606b7ed832	9241	Veržej
00050000-5639-e7b4-f265-36f633fca692	1312	Videm - Dobrepolje
00050000-5639-e7b4-fd38-8e75dad20292	2284	Videm pri Ptuju
00050000-5639-e7b4-a3aa-c364e2859707	8344	Vinica
00050000-5639-e7b4-104c-f5cfcd59d404	5271	Vipava
00050000-5639-e7b4-384f-ceda669211b8	4212	Visoko
00050000-5639-e7b4-d524-edaab3cf14ee	1294	Višnja Gora
00050000-5639-e7b4-2010-6feea0ef9dfb	3205	Vitanje
00050000-5639-e7b4-5ae7-0724df2b16ca	2255	Vitomarci
00050000-5639-e7b4-d377-bd1cc5e21245	1217	Vodice
00050000-5639-e7b4-dc3d-f91cccfdddb7	3212	Vojnik\t
00050000-5639-e7b4-a1b1-db4e3205d2f5	5293	Volčja Draga
00050000-5639-e7b4-aca1-a37ae67d4ffa	2232	Voličina
00050000-5639-e7b4-68ab-1ad96adfe3ee	3305	Vransko
00050000-5639-e7b4-418c-18da299c5640	6217	Vremski Britof
00050000-5639-e7b4-5e7b-0d3e4822b79e	1360	Vrhnika
00050000-5639-e7b4-def9-b52ed56ae871	2365	Vuhred
00050000-5639-e7b4-e805-494a8f89d629	2367	Vuzenica
00050000-5639-e7b4-a527-2b4dbf2a1418	8292	Zabukovje 
00050000-5639-e7b4-9893-7b9c530d919d	1410	Zagorje ob Savi
00050000-5639-e7b4-bdfa-dc55989a519f	1303	Zagradec
00050000-5639-e7b4-169c-d77de59dc020	2283	Zavrč
00050000-5639-e7b4-5199-c45be92e8e49	8272	Zdole 
00050000-5639-e7b4-406e-157ac17ff40c	4201	Zgornja Besnica
00050000-5639-e7b4-af53-aaee88fd4982	2242	Zgornja Korena
00050000-5639-e7b4-2ddb-30a55b26e700	2201	Zgornja Kungota
00050000-5639-e7b4-59d8-d8fb54dcc365	2316	Zgornja Ložnica
00050000-5639-e7b4-792c-227a298745d0	2314	Zgornja Polskava
00050000-5639-e7b4-bd0b-f70f59f0f1df	2213	Zgornja Velka
00050000-5639-e7b4-7f3e-afb4c5b50096	4247	Zgornje Gorje
00050000-5639-e7b4-6483-34e298591790	4206	Zgornje Jezersko
00050000-5639-e7b4-c609-0cbe41876f69	2285	Zgornji Leskovec
00050000-5639-e7b4-6c72-03afb69d15f7	1432	Zidani Most
00050000-5639-e7b4-b3c1-cfeb51f96d09	3214	Zreče
00050000-5639-e7b4-c857-2e500d3d5cdb	4209	Žabnica
00050000-5639-e7b4-0da6-8e857a5ef1e6	3310	Žalec
00050000-5639-e7b4-8b9e-6786d5cef410	4228	Železniki
00050000-5639-e7b4-8ba1-3a775287abfb	2287	Žetale
00050000-5639-e7b4-3354-ca79a8b4658f	4226	Žiri
00050000-5639-e7b4-9794-7bb3209c5ed5	4274	Žirovnica
00050000-5639-e7b4-97b8-9c4c82b5e00b	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25160889)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25160465)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25160213)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5639-e7b7-f824-da212466d0b7	00080000-5639-e7b7-cb2c-90d4ec76b5b2	\N	00040000-5639-e7b5-7240-97381a9c2017	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5639-e7b7-e28f-a72ccfd41bd4	00080000-5639-e7b7-cb2c-90d4ec76b5b2	\N	00040000-5639-e7b5-7240-97381a9c2017	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5639-e7b7-9dcb-6338abe922fc	00080000-5639-e7b7-ec62-7a29de4b5285	\N	00040000-5639-e7b5-7240-97381a9c2017	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25160357)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5639-e7b5-d057-bb3877c6a3f3	novo leto	1	1	\N	t
00430000-5639-e7b5-92fd-b86bd70921a7	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5639-e7b5-ec10-43490e9f1be6	dan upora proti okupatorju	27	4	\N	t
00430000-5639-e7b5-e2fb-84d37b4cd1c4	praznik dela	1	5	\N	t
00430000-5639-e7b5-57e4-37661c706b75	praznik dela	2	5	\N	t
00430000-5639-e7b5-1a3e-727a584ddb43	dan Primoža Trubarja	8	6	\N	f
00430000-5639-e7b5-0b6c-688af1230925	dan državnosti	25	6	\N	t
00430000-5639-e7b5-d172-fef97d9d3df9	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5639-e7b5-9c9c-deb0cbf9e57e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5639-e7b5-5e7a-8226a8cde318	dan suverenosti	25	10	\N	f
00430000-5639-e7b5-3295-ec8914bd9d39	dan spomina na mrtve	1	11	\N	t
00430000-5639-e7b5-9a5b-e875cefde3ee	dan Rudolfa Maistra	23	11	\N	f
00430000-5639-e7b5-07f0-a8e2f360fc37	božič	25	12	\N	t
00430000-5639-e7b5-e2bc-468c85c819bf	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5639-e7b5-63ab-42e50895e003	Marijino vnebovzetje	15	8	\N	t
00430000-5639-e7b5-c0ec-1dfa27c44f2f	dan reformacije	31	10	\N	t
00430000-5639-e7b5-76c1-c54f912191da	velikonočna nedelja	27	3	2016	t
00430000-5639-e7b5-10b0-7d368635923e	velikonočna nedelja	16	4	2017	t
00430000-5639-e7b5-51c4-ce4f2ace3c76	velikonočna nedelja	1	4	2018	t
00430000-5639-e7b5-7962-5a6d627abad0	velikonočna nedelja	21	4	2019	t
00430000-5639-e7b5-7725-57df279c56f4	velikonočna nedelja	12	4	2020	t
00430000-5639-e7b5-984d-9f86cd104f17	velikonočna nedelja	4	4	2021	t
00430000-5639-e7b5-ba8a-1b79bc3f1f47	velikonočna nedelja	17	4	2022	t
00430000-5639-e7b5-8382-4dd3820cf001	velikonočna nedelja	9	4	2023	t
00430000-5639-e7b5-2ad4-fbef96eb9dfe	velikonočna nedelja	31	3	2024	t
00430000-5639-e7b5-efe6-182d4cdd5d9a	velikonočna nedelja	20	4	2025	t
00430000-5639-e7b5-17d8-ede58071388f	velikonočna nedelja	5	4	2026	t
00430000-5639-e7b5-486a-25bfe55c5e9b	velikonočna nedelja	28	3	2027	t
00430000-5639-e7b5-5368-4d320fa62a93	velikonočna nedelja	16	4	2028	t
00430000-5639-e7b5-0e13-e0a7d56e21d6	velikonočna nedelja	1	4	2029	t
00430000-5639-e7b5-6eaa-90f0ea26c1d1	velikonočna nedelja	21	4	2030	t
00430000-5639-e7b5-fe71-574be04affde	velikonočni ponedeljek	28	3	2016	t
00430000-5639-e7b5-1d8b-e80983635910	velikonočni ponedeljek	17	4	2017	t
00430000-5639-e7b5-da11-1501f967e8ac	velikonočni ponedeljek	2	4	2018	t
00430000-5639-e7b5-46a2-d8a708d5d727	velikonočni ponedeljek	22	4	2019	t
00430000-5639-e7b5-e8d0-61016eb464cf	velikonočni ponedeljek	13	4	2020	t
00430000-5639-e7b5-61e2-6b34cf012793	velikonočni ponedeljek	5	4	2021	t
00430000-5639-e7b5-2ab2-70bf059562b3	velikonočni ponedeljek	18	4	2022	t
00430000-5639-e7b5-c5a7-189e8bd65519	velikonočni ponedeljek	10	4	2023	t
00430000-5639-e7b5-9329-d8b9b063aea8	velikonočni ponedeljek	1	4	2024	t
00430000-5639-e7b5-981e-53064492197a	velikonočni ponedeljek	21	4	2025	t
00430000-5639-e7b5-ab62-ec6c57039c99	velikonočni ponedeljek	6	4	2026	t
00430000-5639-e7b5-6a8b-b1c038409957	velikonočni ponedeljek	29	3	2027	t
00430000-5639-e7b5-72ce-8ec5da954af8	velikonočni ponedeljek	17	4	2028	t
00430000-5639-e7b5-085f-27db74cfa1e8	velikonočni ponedeljek	2	4	2029	t
00430000-5639-e7b5-e0f2-aef2be149f13	velikonočni ponedeljek	22	4	2030	t
00430000-5639-e7b5-8cdd-fc951e69eb79	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5639-e7b5-1f2a-413ae63bd138	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5639-e7b5-faf2-063f7dc23ea2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5639-e7b5-fda6-28a705059696	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5639-e7b5-8954-a1c44065495c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5639-e7b5-be29-724eb5f1e464	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5639-e7b5-3a5d-ee39258b6981	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5639-e7b5-25c2-0aa7bb5c6f97	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5639-e7b5-0e57-7edb08d994ac	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5639-e7b5-9ca5-9d46bd3dbec5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5639-e7b5-ba3f-9cd62cd72aa2	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5639-e7b5-6e74-11c7d7999f0a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5639-e7b5-1ce7-0d45663d5edf	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5639-e7b5-cc6a-7dfec8085437	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5639-e7b5-b79c-b345ef711412	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25160317)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25160329)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25160477)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25160903)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25160913)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5639-e7b7-8eb4-0f402014122e	00080000-5639-e7b7-9dd8-19d20537a887	0987	AK
00190000-5639-e7b7-ab53-a70d4cc46c93	00080000-5639-e7b7-ec62-7a29de4b5285	0989	AK
00190000-5639-e7b7-5c5c-ab47e1a18389	00080000-5639-e7b7-8440-0e3f9a9f6116	0986	AK
00190000-5639-e7b7-5460-0ac9e1226506	00080000-5639-e7b7-8fdb-73f6bce1d106	0984	AK
00190000-5639-e7b7-ddd7-18a801e616e7	00080000-5639-e7b7-7f3c-272db9a0075d	0983	AK
00190000-5639-e7b7-8000-6f6a0c6fa1aa	00080000-5639-e7b7-a7cb-bd2964c6c332	0982	AK
00190000-5639-e7b9-691e-a1b821774e24	00080000-5639-e7b9-3612-4a57ae83e4af	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25160812)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5639-e7b7-78aa-a66a21a339f0	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25160921)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25160506)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5639-e7b7-0060-f45dfa6f7cbc	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5639-e7b7-89fa-346f16788ffd	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5639-e7b7-a14e-43e26d587653	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5639-e7b7-6d3d-150d2f09cce4	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5639-e7b7-6062-f4382ae211c8	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5639-e7b7-a100-3dbfa17056c5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5639-e7b7-65f9-5d9c9d2793ff	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25160450)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25160440)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25160651)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25160581)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25160291)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25160053)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5639-e7b9-3612-4a57ae83e4af	00010000-5639-e7b5-d495-f21a319d10cd	2015-11-04 12:10:49	INS	a:0:{}
2	App\\Entity\\Option	00000000-5639-e7b9-84ac-ff27a3255efa	00010000-5639-e7b5-d495-f21a319d10cd	2015-11-04 12:10:49	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5639-e7b9-691e-a1b821774e24	00010000-5639-e7b5-d495-f21a319d10cd	2015-11-04 12:10:49	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25160519)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25160091)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5639-e7b5-3903-2f4b77e94ec8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5639-e7b5-a876-5cef53e77ca8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5639-e7b5-b916-58575eefde3d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5639-e7b5-8cee-46373bd8beb3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5639-e7b5-c62b-aa45f3ba6245	planer	Planer dogodkov v koledarju	t
00020000-5639-e7b5-8762-532e74bdb58d	kadrovska	Kadrovska služba	t
00020000-5639-e7b5-0e13-ccc3f3746412	arhivar	Ažuriranje arhivalij	t
00020000-5639-e7b5-2bc6-cf26d1df567d	igralec	Igralec	t
00020000-5639-e7b5-b9e3-93c919f8f4af	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5639-e7b7-b372-15b7e17218dc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3095 (class 0 OID 25160075)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5639-e7b5-40fc-6c1ab42a40d9	00020000-5639-e7b5-b916-58575eefde3d
00010000-5639-e7b5-d495-f21a319d10cd	00020000-5639-e7b5-b916-58575eefde3d
00010000-5639-e7b7-0179-43de4ea302cc	00020000-5639-e7b7-b372-15b7e17218dc
\.


--
-- TOC entry 3140 (class 0 OID 25160533)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25160471)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25160417)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5639-e7b7-8151-bff6d28ce8f0	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5639-e7b7-db50-9ed6163628fc	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5639-e7b7-3d65-8b0dd22de046	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25160040)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5639-e7b4-0d9c-066a49c9a916	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5639-e7b4-808d-c6eb25ede6de	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5639-e7b4-78db-a3426fc7c61b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5639-e7b4-6f73-57bfb9c469fd	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5639-e7b4-38d2-88f36310a905	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25160032)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5639-e7b4-e549-f99898812531	00230000-5639-e7b4-6f73-57bfb9c469fd	popa
00240000-5639-e7b4-f1de-6096262f5c68	00230000-5639-e7b4-6f73-57bfb9c469fd	oseba
00240000-5639-e7b4-a3fc-67bf5ba677b1	00230000-5639-e7b4-6f73-57bfb9c469fd	tippopa
00240000-5639-e7b4-b0f2-8c4001253272	00230000-5639-e7b4-6f73-57bfb9c469fd	organizacijskaenota
00240000-5639-e7b4-5d2d-d0d85907c9ac	00230000-5639-e7b4-6f73-57bfb9c469fd	sezona
00240000-5639-e7b4-c1f3-a613aa0d94e9	00230000-5639-e7b4-6f73-57bfb9c469fd	tipvaje
00240000-5639-e7b4-3f5c-2a6d631ac532	00230000-5639-e7b4-808d-c6eb25ede6de	prostor
00240000-5639-e7b4-d1c5-8d72ded79268	00230000-5639-e7b4-6f73-57bfb9c469fd	besedilo
00240000-5639-e7b4-0ddf-bf8ddc06a483	00230000-5639-e7b4-6f73-57bfb9c469fd	uprizoritev
00240000-5639-e7b4-b41d-0b0422277d40	00230000-5639-e7b4-6f73-57bfb9c469fd	funkcija
00240000-5639-e7b4-ac34-1fcbde2796c9	00230000-5639-e7b4-6f73-57bfb9c469fd	tipfunkcije
00240000-5639-e7b4-8b6e-a55e1efe346f	00230000-5639-e7b4-6f73-57bfb9c469fd	alternacija
00240000-5639-e7b4-32f0-c0d63c2cf37d	00230000-5639-e7b4-0d9c-066a49c9a916	pogodba
00240000-5639-e7b4-5df7-e64a4d0db7a2	00230000-5639-e7b4-6f73-57bfb9c469fd	zaposlitev
00240000-5639-e7b4-aade-152ca15f62c8	00230000-5639-e7b4-6f73-57bfb9c469fd	zvrstuprizoritve
00240000-5639-e7b4-cc0f-fdef475dbdde	00230000-5639-e7b4-0d9c-066a49c9a916	programdela
00240000-5639-e7b4-6fbc-fd78bb1a7777	00230000-5639-e7b4-6f73-57bfb9c469fd	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25160027)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
db527612-b40e-4ee4-a98e-4945e056df34	00240000-5639-e7b4-e549-f99898812531	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25160598)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5639-e7b7-7f01-fe1f5be05b1f	000e0000-5639-e7b7-995d-4197e4299b8c	00080000-5639-e7b7-cb2c-90d4ec76b5b2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5639-e7b5-3a3e-6a824d81fcff
00270000-5639-e7b7-f6ac-261fae9dc87a	000e0000-5639-e7b7-995d-4197e4299b8c	00080000-5639-e7b7-cb2c-90d4ec76b5b2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5639-e7b5-3a3e-6a824d81fcff
\.


--
-- TOC entry 3105 (class 0 OID 25160175)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25160427)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5639-e7b8-635a-9f6879a651a1	00180000-5639-e7b7-d7f0-fdb7f2a7fc19	000c0000-5639-e7b7-28a0-54a3115ffe53	00090000-5639-e7b7-c72b-ebe5d6d54a34	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5639-e7b8-ddae-0474b2975096	00180000-5639-e7b7-d7f0-fdb7f2a7fc19	000c0000-5639-e7b7-1c15-47ade372e12f	00090000-5639-e7b7-db8d-5a82f198d7f1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5639-e7b8-a564-96b5a9c1ec08	00180000-5639-e7b7-d7f0-fdb7f2a7fc19	000c0000-5639-e7b7-8863-a21e77ebb4a9	00090000-5639-e7b7-7a1f-b0e31d3a1999	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5639-e7b8-de61-fa5e19d1aa69	00180000-5639-e7b7-d7f0-fdb7f2a7fc19	000c0000-5639-e7b7-b467-16e69654ee3a	00090000-5639-e7b7-8032-2bc96e9fe0da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5639-e7b8-cf90-0d1ce335b0b2	00180000-5639-e7b7-d7f0-fdb7f2a7fc19	000c0000-5639-e7b7-375a-e6f33f20f6f1	00090000-5639-e7b7-1551-a0ee13b12c63	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5639-e7b8-b661-c2b33c94a7f9	00180000-5639-e7b7-2785-217707a0132a	\N	00090000-5639-e7b7-1551-a0ee13b12c63	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5639-e7b8-4047-e145257a502c	00180000-5639-e7b7-2785-217707a0132a	\N	00090000-5639-e7b7-db8d-5a82f198d7f1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25160639)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5639-e7b4-ee6c-133d9dfd5e1d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5639-e7b4-b351-b09a273d7ac1	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5639-e7b4-4b15-f30d6ad9f9f0	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5639-e7b4-a8ba-571dc391063e	04	Režija	Režija	Režija	umetnik	30
000f0000-5639-e7b4-10e0-ebe61cf8f2b1	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5639-e7b4-409d-9267018e0bb9	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5639-e7b4-4af0-169d9926972a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5639-e7b4-dcdb-0bcabf4f3a75	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5639-e7b4-996f-238ac6dded16	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5639-e7b4-eaed-458ba66706a9	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5639-e7b4-f0d9-662e75b21852	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5639-e7b4-2556-587ff579aa19	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5639-e7b4-53b5-df38b546a518	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5639-e7b4-39fd-0c29c013c60a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5639-e7b4-bf30-9bb24e3df229	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5639-e7b4-1711-154fcdd2c9d3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5639-e7b4-e169-2a38aec741d2	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5639-e7b4-8fd0-67263c37424d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25160126)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5639-e7b7-5a2b-ec3216d02bc7	0001	šola	osnovna ali srednja šola
00400000-5639-e7b7-bd93-025962de7c69	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5639-e7b7-7893-e88589d1bd7b	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25160932)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5639-e7b4-d635-4bfb8360c8a2	01	Velika predstava	f	1.00	1.00
002b0000-5639-e7b4-1f8e-4897d46ea229	02	Mala predstava	f	0.50	0.50
002b0000-5639-e7b4-e44c-e9e74992bc1c	03	Mala koprodukcija	t	0.40	1.00
002b0000-5639-e7b4-eaa3-8b9d00554439	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5639-e7b4-1901-37ed1b3de7a3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25160407)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5639-e7b4-0784-c22e0a80fb27	0001	prva vaja	prva vaja
00420000-5639-e7b4-b361-cf6a6225858a	0002	tehnična vaja	tehnična vaja
00420000-5639-e7b4-109e-d0405b346e0f	0003	lučna vaja	lučna vaja
00420000-5639-e7b4-f2d9-41e397544727	0004	kostumska vaja	kostumska vaja
00420000-5639-e7b4-db56-b7bd43bbe507	0005	foto vaja	foto vaja
00420000-5639-e7b4-6359-dbbc33881bab	0006	1. glavna vaja	1. glavna vaja
00420000-5639-e7b4-6ab2-d4fe73a14404	0007	2. glavna vaja	2. glavna vaja
00420000-5639-e7b4-7696-842a569246af	0008	1. generalka	1. generalka
00420000-5639-e7b4-4d56-a54de4561744	0009	2. generalka	2. generalka
00420000-5639-e7b4-210d-0e3419917549	0010	odprta generalka	odprta generalka
00420000-5639-e7b4-f28d-781e5f6c6e9b	0011	obnovitvena vaja	obnovitvena vaja
00420000-5639-e7b4-1a68-80e410da1dad	0012	pevska vaja	pevska vaja
00420000-5639-e7b4-c1b9-b10d0b4d7fde	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5639-e7b4-4aa6-7c013ac90443	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25160248)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25160062)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5639-e7b5-d495-f21a319d10cd	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROpcLhJF6.Yi4lRP25.by8vrt6LAaRQgq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-3912-e6d19cd7cd34	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-a597-9a435745904c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-a3bd-4ac5e046e9b3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-90ea-3aa06956286b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-27a3-a707b151e2e3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-4fbd-85f97d6ebe8b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-4965-4fed0a2269d3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-e50c-550d41c8efb2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-39e8-b5800e7b2b81	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5639-e7b7-0179-43de4ea302cc	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5639-e7b5-40fc-6c1ab42a40d9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25160689)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5639-e7b7-38fd-30b2ce383222	00160000-5639-e7b7-3969-59680cf93322	\N	00140000-5639-e7b4-4255-1cc9c22fe190	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5639-e7b7-6062-f4382ae211c8
000e0000-5639-e7b7-995d-4197e4299b8c	00160000-5639-e7b7-b06f-8e2e4e564234	\N	00140000-5639-e7b4-9abe-54749ca13545	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5639-e7b7-a100-3dbfa17056c5
000e0000-5639-e7b7-bec1-2636aca50004	\N	\N	00140000-5639-e7b4-9abe-54749ca13545	00190000-5639-e7b7-8eb4-0f402014122e	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5639-e7b7-6062-f4382ae211c8
000e0000-5639-e7b7-2b11-0ad8a32750ac	\N	\N	00140000-5639-e7b4-9abe-54749ca13545	00190000-5639-e7b7-8eb4-0f402014122e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5639-e7b7-6062-f4382ae211c8
000e0000-5639-e7b7-b7a4-861067b3ac9c	\N	\N	00140000-5639-e7b4-9abe-54749ca13545	00190000-5639-e7b7-8eb4-0f402014122e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5639-e7b7-0060-f45dfa6f7cbc
000e0000-5639-e7b7-09c4-38d9d19ccd68	\N	\N	00140000-5639-e7b4-9abe-54749ca13545	00190000-5639-e7b7-8eb4-0f402014122e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5639-e7b7-0060-f45dfa6f7cbc
\.


--
-- TOC entry 3119 (class 0 OID 25160347)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5639-e7b7-5ae5-364d2b6d02b1	\N	000e0000-5639-e7b7-995d-4197e4299b8c	1	
00200000-5639-e7b7-c546-5c63f1397c9a	\N	000e0000-5639-e7b7-995d-4197e4299b8c	2	
00200000-5639-e7b7-c0a9-6f8d14c16d9c	\N	000e0000-5639-e7b7-995d-4197e4299b8c	3	
00200000-5639-e7b7-89ea-14546e50ece0	\N	000e0000-5639-e7b7-995d-4197e4299b8c	4	
00200000-5639-e7b7-7816-49047cd65870	\N	000e0000-5639-e7b7-995d-4197e4299b8c	5	
\.


--
-- TOC entry 3136 (class 0 OID 25160498)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25160612)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5639-e7b5-21e7-a0ee4ea41e3f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5639-e7b5-f19c-fff483d95c16	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5639-e7b5-0409-891b95787c20	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5639-e7b5-2b66-75cc2bf8c574	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5639-e7b5-0f3f-329d2ee923b1	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5639-e7b5-ce5b-93876955a9c7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5639-e7b5-bfa0-03d106b893f8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5639-e7b5-8564-0f2d969d9832	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5639-e7b5-3a3e-6a824d81fcff	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5639-e7b5-8e12-f565df3548b2	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5639-e7b5-cdc5-668606942bd5	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5639-e7b5-2913-e3291b90c731	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5639-e7b5-3531-70c1bb08b300	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5639-e7b5-630f-1b25e34d25d0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5639-e7b5-7a49-41bb5512a256	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5639-e7b5-2bf5-d51cf867c001	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5639-e7b5-2050-428b21509762	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5639-e7b5-f146-0f991680689e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5639-e7b5-07b7-49223bb7396e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5639-e7b5-a015-9d233774f536	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5639-e7b5-677c-65dd54a4d05e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5639-e7b5-b964-3d894933cbc2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5639-e7b5-400e-23502b5f70f8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5639-e7b5-848b-eec3c51f6637	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5639-e7b5-f8d8-024e13895842	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5639-e7b5-f24d-7f3b3c42570a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5639-e7b5-d8d5-4632d5b66967	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5639-e7b5-de2c-177501d0bff2	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25160979)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25160951)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25160991)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25160570)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5639-e7b7-18e8-f60f53f4608f	00090000-5639-e7b7-db8d-5a82f198d7f1	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5639-e7b7-c950-c14780210ba9	00090000-5639-e7b7-7a1f-b0e31d3a1999	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5639-e7b7-5fcb-a34c9c1d932c	00090000-5639-e7b7-480e-7a9b41fb9290	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5639-e7b7-20a3-e56074ee1942	00090000-5639-e7b7-ea57-45e090337474	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5639-e7b7-1b67-bea27e604942	00090000-5639-e7b7-191a-8ee553e328bc	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5639-e7b7-731c-6d37cbd8b387	00090000-5639-e7b7-1bcc-0ed5ed63c8bb	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25160391)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25160679)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5639-e7b4-4255-1cc9c22fe190	01	Drama	drama (SURS 01)
00140000-5639-e7b4-22d3-0dec846ee967	02	Opera	opera (SURS 02)
00140000-5639-e7b4-536d-48ff2f5a72ef	03	Balet	balet (SURS 03)
00140000-5639-e7b4-88e5-6ae55c189442	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5639-e7b4-bc79-410dfecd59e1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5639-e7b4-9abe-54749ca13545	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5639-e7b4-be41-32c8091f5491	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25160560)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25160125)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25160738)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25160728)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25160116)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25160595)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25160637)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25161031)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25160379)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25160401)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25160406)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25160949)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25160274)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25160806)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25160556)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25160345)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25160312)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25160288)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25160463)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25161008)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25161015)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25161039)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 25157737)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 25160490)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25160246)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25160144)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25160208)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25160171)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25160105)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25160090)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25160496)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25160532)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25160674)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25160199)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25160234)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25160901)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25160469)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25160224)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25160364)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25160333)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25160325)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25160481)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25160910)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25160918)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25160888)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25160930)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25160514)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25160454)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25160445)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25160661)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25160588)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25160300)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25160061)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25160523)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25160079)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25160099)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25160541)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25160476)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25160425)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25160049)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25160037)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25160031)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25160608)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25160180)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25160436)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25160648)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25160133)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25160942)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25160414)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25160259)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25160074)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25160707)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25160354)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25160504)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25160620)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25160989)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25160973)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25160997)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25160578)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25160395)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25160687)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25160568)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25160389)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25160390)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25160388)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25160387)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25160386)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25160609)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25160610)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25160611)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25161010)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25161009)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25160201)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25160202)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25160497)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25160977)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25160976)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25160978)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25160975)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25160974)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25160483)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25160482)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25160355)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25160356)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25160557)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25160559)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25160558)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25160290)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25160289)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25160931)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25160676)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25160677)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25160678)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25160998)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25160712)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25160709)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25160713)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25160711)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25160710)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25160261)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25160260)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25160174)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25160524)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25160106)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25160107)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25160544)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25160543)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25160542)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25160211)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25160210)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25160212)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25160328)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25160326)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25160327)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25160039)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25160449)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25160447)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25160446)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25160448)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25160080)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25160081)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25160505)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25161032)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25160597)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25160596)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25161040)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25161041)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25160470)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25160589)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25160590)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25160811)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25160810)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25160807)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25160808)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25160809)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25160226)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25160225)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25160227)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25160518)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25160517)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25160911)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25160912)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25160742)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25160743)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25160740)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25160741)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25160579)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25160580)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25160458)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25160457)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25160455)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25160456)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25160730)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25160729)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25160301)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25160315)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25160314)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25160313)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25160316)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25160346)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25160334)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25160335)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25160902)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25160950)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25161016)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25161017)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25160146)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25160145)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25160181)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25160182)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25160396)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25160439)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25160438)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25160437)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25160381)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25160382)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25160385)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25160380)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25160384)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25160383)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25160200)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25160134)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25160135)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25160275)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25160277)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25160276)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25160278)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25160464)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25160675)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25160708)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25160649)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25160650)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25160172)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25160173)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25160569)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25160050)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25160247)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25160209)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25160038)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25160943)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25160516)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25160515)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25160415)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25160416)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25160739)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25160235)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25160688)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25160990)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25160919)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25160920)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25160638)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25160426)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25160100)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2900 (class 2606 OID 25161212)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2901 (class 2606 OID 25161217)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2906 (class 2606 OID 25161242)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 25161232)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2899 (class 2606 OID 25161207)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2903 (class 2606 OID 25161227)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2905 (class 2606 OID 25161237)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2902 (class 2606 OID 25161222)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2940 (class 2606 OID 25161412)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25161417)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2942 (class 2606 OID 25161422)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 25161587)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 25161582)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 25161097)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2878 (class 2606 OID 25161102)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25161327)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2971 (class 2606 OID 25161567)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25161562)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 25161572)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2969 (class 2606 OID 25161557)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2968 (class 2606 OID 25161552)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2922 (class 2606 OID 25161322)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 25161317)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2897 (class 2606 OID 25161197)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2898 (class 2606 OID 25161202)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25161367)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25161377)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25161372)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2888 (class 2606 OID 25161152)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 25161147)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25161307)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25161542)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2943 (class 2606 OID 25161427)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25161432)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2945 (class 2606 OID 25161437)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25161577)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2949 (class 2606 OID 25161457)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2946 (class 2606 OID 25161442)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 25161462)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25161452)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2947 (class 2606 OID 25161447)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2886 (class 2606 OID 25161142)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2885 (class 2606 OID 25161137)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 25161082)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2873 (class 2606 OID 25161077)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25161347)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2869 (class 2606 OID 25161057)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2870 (class 2606 OID 25161062)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2930 (class 2606 OID 25161362)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25161357)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2928 (class 2606 OID 25161352)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25161112)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2879 (class 2606 OID 25161107)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2881 (class 2606 OID 25161117)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2893 (class 2606 OID 25161177)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 25161167)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25161172)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25161042)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 25161282)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2912 (class 2606 OID 25161272)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2911 (class 2606 OID 25161267)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2913 (class 2606 OID 25161277)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2867 (class 2606 OID 25161047)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 25161052)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25161332)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25161602)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2939 (class 2606 OID 25161407)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 25161402)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2979 (class 2606 OID 25161607)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 25161612)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25161312)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2936 (class 2606 OID 25161392)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2937 (class 2606 OID 25161397)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 25161517)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 25161512)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 25161497)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 25161502)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25161507)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25161127)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 25161122)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 25161132)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 25161342)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2925 (class 2606 OID 25161337)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 25161527)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2964 (class 2606 OID 25161532)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2955 (class 2606 OID 25161487)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 25161492)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2953 (class 2606 OID 25161477)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2954 (class 2606 OID 25161482)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 25161382)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2935 (class 2606 OID 25161387)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 25161302)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2917 (class 2606 OID 25161297)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2915 (class 2606 OID 25161287)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2916 (class 2606 OID 25161292)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2952 (class 2606 OID 25161472)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2951 (class 2606 OID 25161467)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25161157)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25161162)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25161192)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2894 (class 2606 OID 25161182)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2895 (class 2606 OID 25161187)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25161522)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25161537)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25161547)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2976 (class 2606 OID 25161592)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2977 (class 2606 OID 25161597)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2872 (class 2606 OID 25161072)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 25161067)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2875 (class 2606 OID 25161087)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2876 (class 2606 OID 25161092)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25161247)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 25161262)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25161257)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2908 (class 2606 OID 25161252)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-04 12:10:51 CET

--
-- PostgreSQL database dump complete
--

