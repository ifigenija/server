--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-20 16:24:00 CET

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
-- TOC entry 183 (class 1259 OID 28950067)
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
-- TOC entry 237 (class 1259 OID 28950682)
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
-- TOC entry 236 (class 1259 OID 28950665)
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
-- TOC entry 182 (class 1259 OID 28950060)
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
-- TOC entry 181 (class 1259 OID 28950058)
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
-- TOC entry 227 (class 1259 OID 28950542)
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
-- TOC entry 230 (class 1259 OID 28950572)
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
-- TOC entry 251 (class 1259 OID 28950973)
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
-- TOC entry 203 (class 1259 OID 28950316)
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
-- TOC entry 205 (class 1259 OID 28950348)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 28950353)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 28950895)
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
-- TOC entry 194 (class 1259 OID 28950213)
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
-- TOC entry 238 (class 1259 OID 28950695)
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
-- TOC entry 223 (class 1259 OID 28950496)
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
-- TOC entry 200 (class 1259 OID 28950287)
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
-- TOC entry 197 (class 1259 OID 28950253)
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
-- TOC entry 195 (class 1259 OID 28950230)
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
-- TOC entry 212 (class 1259 OID 28950410)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 28950953)
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
-- TOC entry 250 (class 1259 OID 28950966)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 28950988)
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
-- TOC entry 216 (class 1259 OID 28950435)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 28950186)
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
-- TOC entry 185 (class 1259 OID 28950086)
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
-- TOC entry 189 (class 1259 OID 28950153)
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
-- TOC entry 186 (class 1259 OID 28950097)
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
-- TOC entry 178 (class 1259 OID 28950032)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 28950051)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 28950442)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 28950476)
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
-- TOC entry 233 (class 1259 OID 28950613)
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
-- TOC entry 188 (class 1259 OID 28950133)
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
-- TOC entry 191 (class 1259 OID 28950178)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 28950840)
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
-- TOC entry 213 (class 1259 OID 28950416)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 28950163)
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
-- TOC entry 202 (class 1259 OID 28950308)
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
-- TOC entry 198 (class 1259 OID 28950268)
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
-- TOC entry 199 (class 1259 OID 28950280)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 28950428)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 28950854)
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
-- TOC entry 242 (class 1259 OID 28950864)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 28950763)
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
-- TOC entry 243 (class 1259 OID 28950872)
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
-- TOC entry 219 (class 1259 OID 28950457)
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
-- TOC entry 211 (class 1259 OID 28950401)
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
-- TOC entry 210 (class 1259 OID 28950391)
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
-- TOC entry 232 (class 1259 OID 28950602)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 28950532)
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
-- TOC entry 196 (class 1259 OID 28950242)
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
-- TOC entry 175 (class 1259 OID 28950003)
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
-- TOC entry 174 (class 1259 OID 28950001)
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
-- TOC entry 220 (class 1259 OID 28950470)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 28950041)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 28950025)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 28950484)
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
-- TOC entry 214 (class 1259 OID 28950422)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 28950368)
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
-- TOC entry 173 (class 1259 OID 28949990)
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
-- TOC entry 172 (class 1259 OID 28949982)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 28949977)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 28950549)
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
-- TOC entry 187 (class 1259 OID 28950125)
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
-- TOC entry 209 (class 1259 OID 28950378)
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
-- TOC entry 231 (class 1259 OID 28950590)
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
-- TOC entry 184 (class 1259 OID 28950076)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 28950883)
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
-- TOC entry 207 (class 1259 OID 28950358)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 28950198)
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
-- TOC entry 176 (class 1259 OID 28950012)
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
-- TOC entry 235 (class 1259 OID 28950640)
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
-- TOC entry 201 (class 1259 OID 28950298)
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
-- TOC entry 218 (class 1259 OID 28950449)
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
-- TOC entry 229 (class 1259 OID 28950563)
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
-- TOC entry 247 (class 1259 OID 28950933)
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
-- TOC entry 246 (class 1259 OID 28950902)
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
-- TOC entry 248 (class 1259 OID 28950945)
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
-- TOC entry 225 (class 1259 OID 28950521)
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
-- TOC entry 204 (class 1259 OID 28950342)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 28950630)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 28950511)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 28950063)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 28950006)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 28950067)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564f-3b0c-00b4-8cd4f6a54281	10	30	Otroci	Abonma za otroke	200
000a0000-564f-3b0c-1310-9900c0a1bc1a	20	60	Mladina	Abonma za mladino	400
000a0000-564f-3b0c-471b-81c57e2ffc1a	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 28950682)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564f-3b0d-e137-992bda5789c8	000d0000-564f-3b0d-6420-1e51d9ae21a3	\N	00090000-564f-3b0c-8806-3df9cb099e73	000b0000-564f-3b0d-8740-b3e4a52a2e37	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564f-3b0d-1b03-b197f8bf18f7	000d0000-564f-3b0d-bbd7-2e60aee15834	00100000-564f-3b0d-4c34-f51859e122bf	00090000-564f-3b0c-4b55-e7626bebbb71	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564f-3b0d-21fa-e6a0a7d7870a	000d0000-564f-3b0d-37c7-75064329d459	00100000-564f-3b0d-64bf-8c095f0f6266	00090000-564f-3b0c-34aa-56ef0eb30f79	\N	0003	t	\N	2015-11-20	\N	2	t	\N	f	f
000c0000-564f-3b0d-bdd2-0aa4812f259f	000d0000-564f-3b0d-3578-313714ec396f	\N	00090000-564f-3b0c-0bc8-e383f820f9d0	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564f-3b0d-6c69-e9596b710b0f	000d0000-564f-3b0d-55e0-41e170505343	\N	00090000-564f-3b0c-0014-e7f4e9c631b1	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564f-3b0d-b28c-ebe3e8c79901	000d0000-564f-3b0d-7b5d-3d13255a4f96	\N	00090000-564f-3b0c-4a73-5c8644c4ad5a	000b0000-564f-3b0d-9d59-7f5f8a5b7909	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564f-3b0d-bcb5-ec3776282cfa	000d0000-564f-3b0d-b1d3-5762be08e19e	00100000-564f-3b0d-8d41-efbd059e611c	00090000-564f-3b0c-0643-2165db536b3a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564f-3b0d-cdbc-a06e4b6f63e2	000d0000-564f-3b0d-1f29-153cc88fa9f9	\N	00090000-564f-3b0c-8e9a-e1de84ab1d0f	000b0000-564f-3b0d-1204-3aff5180f576	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564f-3b0d-7abd-f9b20c52eab0	000d0000-564f-3b0d-b1d3-5762be08e19e	00100000-564f-3b0d-69e4-797a29a08ca6	00090000-564f-3b0c-67eb-bc9022b8b38f	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564f-3b0d-e012-6135545d6f92	000d0000-564f-3b0d-b1d3-5762be08e19e	00100000-564f-3b0d-f77d-469b21c1a6c7	00090000-564f-3b0c-ff83-6bc998309e8e	\N	0010	t	\N	2015-11-20	\N	16	f	\N	f	t
000c0000-564f-3b0d-1375-b9baa9db67ab	000d0000-564f-3b0d-b1d3-5762be08e19e	00100000-564f-3b0d-c83e-1ffe0a8e74c7	00090000-564f-3b0c-8582-400d1177c40b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564f-3b0d-0d7e-92b64a91798f	000d0000-564f-3b0d-0e74-39307f5d6d6d	00100000-564f-3b0d-4c34-f51859e122bf	00090000-564f-3b0c-4b55-e7626bebbb71	000b0000-564f-3b0d-dd82-85f6aae3a819	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 28950665)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 28950060)
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
-- TOC entry 3149 (class 0 OID 28950542)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564f-3b0d-4e22-a99b0c6144fd	00160000-564f-3b0c-9d50-0ab277023f53	00090000-564f-3b0c-1a9a-b3ce281e6f07	aizv	10	t
003d0000-564f-3b0d-f14d-23626ed9c343	00160000-564f-3b0c-9d50-0ab277023f53	00090000-564f-3b0c-84ab-9c86240927cc	apri	14	t
003d0000-564f-3b0d-30d6-1c30c858cbc7	00160000-564f-3b0c-c194-3bcaad78f9ee	00090000-564f-3b0c-1374-973b445eccc5	aizv	11	t
003d0000-564f-3b0d-5d28-369c81dcc368	00160000-564f-3b0c-171f-91e35b9f28f5	00090000-564f-3b0c-42bf-42067ea97bb7	aizv	12	t
003d0000-564f-3b0d-3c82-67129c907aaf	00160000-564f-3b0c-9d50-0ab277023f53	00090000-564f-3b0c-2585-3370cff90c01	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 28950572)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564f-3b0c-9d50-0ab277023f53	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564f-3b0c-c194-3bcaad78f9ee	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564f-3b0c-171f-91e35b9f28f5	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 28950973)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 28950316)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564f-3b0d-df42-65435fddb882	\N	\N	00200000-564f-3b0d-fe2b-2b57fa67296c	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564f-3b0d-29d6-abb045e233e9	\N	\N	00200000-564f-3b0d-a9a6-228493de163d	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564f-3b0d-a135-086be0644eb3	\N	\N	00200000-564f-3b0d-4f8d-e9895e8b106b	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564f-3b0d-59c9-b57d39f0e5a6	\N	\N	00200000-564f-3b0d-c2f7-e51b8682d73f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564f-3b0d-906c-d071fea3ec2d	\N	\N	00200000-564f-3b0d-a9a0-0bd5fe3201b0	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 28950348)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 28950353)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 28950895)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 28950213)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564f-3b0a-f5fc-8c834883d08c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564f-3b0a-59b7-2e25eb270767	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564f-3b0a-4b5e-edb6e779bcb8	AL	ALB	008	Albania 	Albanija	\N
00040000-564f-3b0a-f9e2-37cc9cba687b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564f-3b0a-77f9-098e680cba5d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564f-3b0a-8aef-ceab10d03b05	AD	AND	020	Andorra 	Andora	\N
00040000-564f-3b0a-6365-22e6925bf2f4	AO	AGO	024	Angola 	Angola	\N
00040000-564f-3b0a-b80b-111d1dd03fbf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564f-3b0a-08b9-6d375bb76721	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564f-3b0a-914c-b7a2ee5c37e3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564f-3b0a-fe77-e1d6ec9bf59c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564f-3b0a-79c1-96d6f63a184d	AM	ARM	051	Armenia 	Armenija	\N
00040000-564f-3b0a-5fa4-372584812a9f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564f-3b0a-23ef-78da7f76ccd4	AU	AUS	036	Australia 	Avstralija	\N
00040000-564f-3b0a-ae1f-56bff57fa257	AT	AUT	040	Austria 	Avstrija	\N
00040000-564f-3b0a-99b5-68bda5063593	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564f-3b0a-c749-1d2f704ce236	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564f-3b0a-cc93-22fe53c65f4d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564f-3b0a-c193-08aa7f9cd411	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564f-3b0a-1995-b34d2ddd22e2	BB	BRB	052	Barbados 	Barbados	\N
00040000-564f-3b0a-512d-b8bbafb65cc7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564f-3b0a-f72d-cf0f1ebe1fa8	BE	BEL	056	Belgium 	Belgija	\N
00040000-564f-3b0a-c26a-5064a81d5b88	BZ	BLZ	084	Belize 	Belize	\N
00040000-564f-3b0a-e09e-d8060684866b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564f-3b0a-4ce9-4e57a7288190	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564f-3b0a-a6b9-a75382304000	BT	BTN	064	Bhutan 	Butan	\N
00040000-564f-3b0a-12bc-f082f0b1a4a3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564f-3b0a-5ade-1a9a18145b80	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564f-3b0a-dcc3-49ff47963a46	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564f-3b0a-ff23-5d2fd3252cfb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564f-3b0a-9853-abc38da548e3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564f-3b0a-39fb-661056e1deee	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564f-3b0a-0353-211054dfd995	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564f-3b0a-b241-4a745d1a7b99	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564f-3b0a-7905-4d886104cdcc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564f-3b0a-5692-20cc4862e4d6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564f-3b0a-dc9c-f44adee4eae9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564f-3b0a-e3c8-9a4cb9503258	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564f-3b0a-faef-79ae65de1f9b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564f-3b0a-5bff-1e2f6d6266ce	CA	CAN	124	Canada 	Kanada	\N
00040000-564f-3b0a-b5c9-c2cee0b49984	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564f-3b0a-f5ec-55ff14fbbd87	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564f-3b0a-b616-af08d210e7ef	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564f-3b0a-5db7-9355a98059f5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564f-3b0a-5c73-78a31303e591	CL	CHL	152	Chile 	Čile	\N
00040000-564f-3b0a-408f-73ed38342452	CN	CHN	156	China 	Kitajska	\N
00040000-564f-3b0a-52ef-01f96e63b1cb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564f-3b0a-cdca-e4209db75eaf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564f-3b0a-fda7-080b7f6bae8b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564f-3b0a-55a5-faa7a07f06f4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564f-3b0a-a985-5ecbec2e33da	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564f-3b0a-5155-f836fe068077	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564f-3b0a-22e9-45148e9077dd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564f-3b0a-ac00-348f94e86ced	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564f-3b0a-bc0a-f204bb4d8461	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564f-3b0a-d411-f7ea7a2061ce	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564f-3b0a-aae9-0243111f0d12	CU	CUB	192	Cuba 	Kuba	\N
00040000-564f-3b0a-fd0c-29855c27ce13	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564f-3b0a-5d5d-3cab7cd6ce9d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564f-3b0a-2233-8c7ddbf03930	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564f-3b0a-48b4-2e8c540e6a03	DK	DNK	208	Denmark 	Danska	\N
00040000-564f-3b0a-8145-3d5cb93b9924	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564f-3b0a-983f-3069ff40737a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564f-3b0a-06a8-fc2f220de02a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564f-3b0a-2c34-87129b71844b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564f-3b0a-085e-441d430ec367	EG	EGY	818	Egypt 	Egipt	\N
00040000-564f-3b0a-a4ca-fb0aecae079d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564f-3b0a-af82-c6c20717300c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564f-3b0a-8873-f420abec93f3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564f-3b0a-454f-67aeb3998cc6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564f-3b0a-2324-cf94049db745	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564f-3b0a-a8ea-2330f6e6bda1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564f-3b0a-4dc0-afd9f4d59520	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564f-3b0a-f1da-85b43b92eba1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564f-3b0a-99f2-3f8b7cd64e06	FI	FIN	246	Finland 	Finska	\N
00040000-564f-3b0a-b277-e8958c98d31c	FR	FRA	250	France 	Francija	\N
00040000-564f-3b0a-ec30-0bd385dae05f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564f-3b0a-03ff-aea6cf2b7ad9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564f-3b0a-0189-741cca4e11a5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564f-3b0a-26f6-cebbfff7bc9d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564f-3b0a-fd93-5e85f3234dc6	GA	GAB	266	Gabon 	Gabon	\N
00040000-564f-3b0a-cf7f-0cd6f8bc1ef5	GM	GMB	270	Gambia 	Gambija	\N
00040000-564f-3b0a-df42-d3ce7a842a36	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564f-3b0a-b25f-27973a3d5fe7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564f-3b0a-358d-947a5f092bbe	GH	GHA	288	Ghana 	Gana	\N
00040000-564f-3b0a-ced2-94e4a6997761	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564f-3b0a-c375-64585566d851	GR	GRC	300	Greece 	Grčija	\N
00040000-564f-3b0a-5278-1b826f1c8d73	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564f-3b0a-86e5-3b7eb53fdce6	GD	GRD	308	Grenada 	Grenada	\N
00040000-564f-3b0a-f4e3-093e99fca774	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564f-3b0a-c6aa-7d1fad0dff44	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564f-3b0a-3ec1-e203ae170fa8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564f-3b0a-7fe9-2b9c58f404b8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564f-3b0a-4fc3-bb16dfd6b580	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564f-3b0a-f5f1-ae5946e0661d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564f-3b0a-e23c-13857bc013b2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564f-3b0a-eac6-4edcb5a4313b	HT	HTI	332	Haiti 	Haiti	\N
00040000-564f-3b0a-6924-ed8748d541e1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564f-3b0a-bde8-2e65f632195d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564f-3b0a-6b1f-fa9bf5dfdfa7	HN	HND	340	Honduras 	Honduras	\N
00040000-564f-3b0a-0c2a-2ff59f03ee2b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564f-3b0a-2b7d-8f7822da7fbd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564f-3b0a-47a5-99648d3f2451	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564f-3b0a-3ee0-b6e649192260	IN	IND	356	India 	Indija	\N
00040000-564f-3b0a-6486-ae23309bc8a4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564f-3b0a-cdeb-bcbdf092b116	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564f-3b0a-4504-9f89d0cf27ac	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564f-3b0a-9e42-29ef975994de	IE	IRL	372	Ireland 	Irska	\N
00040000-564f-3b0a-85c6-7ba7c0e5e5fb	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564f-3b0a-b147-7968ed31da95	IL	ISR	376	Israel 	Izrael	\N
00040000-564f-3b0a-d820-b411c9f1039d	IT	ITA	380	Italy 	Italija	\N
00040000-564f-3b0a-e38f-0965ff14143b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564f-3b0a-b0d7-0cd617825daf	JP	JPN	392	Japan 	Japonska	\N
00040000-564f-3b0a-b932-01d42d8f2776	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564f-3b0a-9ebf-6c09f6fa916c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564f-3b0a-9970-3ee256db6f85	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564f-3b0a-764c-52e33f33583e	KE	KEN	404	Kenya 	Kenija	\N
00040000-564f-3b0a-1728-9b348da21b89	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564f-3b0a-726d-edce667952ef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564f-3b0a-bcb1-e938c247df0b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564f-3b0a-7052-f347970b6b9d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564f-3b0a-b392-46a7e2876028	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564f-3b0a-23b1-de794c449080	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564f-3b0a-f920-da10f1152d2a	LV	LVA	428	Latvia 	Latvija	\N
00040000-564f-3b0a-bf04-466582df2f9b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564f-3b0a-0edf-86fd34f86bd9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564f-3b0a-51b4-1e3917408b43	LR	LBR	430	Liberia 	Liberija	\N
00040000-564f-3b0a-67c8-9db4a656ab2f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564f-3b0a-5f79-41b35217b092	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564f-3b0a-991b-7daf4cab2b7b	LT	LTU	440	Lithuania 	Litva	\N
00040000-564f-3b0a-b324-8b104bc2e818	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564f-3b0a-1696-db7239f08db8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564f-3b0a-bd32-6183abd79d3b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564f-3b0a-69f0-f19af3d21094	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564f-3b0a-88cf-59a3657d2263	MW	MWI	454	Malawi 	Malavi	\N
00040000-564f-3b0a-6909-f5a188ed0601	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564f-3b0a-4c30-d9e863cbc644	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564f-3b0a-e7da-36b8fa332def	ML	MLI	466	Mali 	Mali	\N
00040000-564f-3b0a-a4a5-a1a98191f4b6	MT	MLT	470	Malta 	Malta	\N
00040000-564f-3b0a-d165-f85b3b51bcb8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564f-3b0a-b8c4-ec969d08af85	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564f-3b0a-a0a2-de1cedafb08c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564f-3b0a-cce5-2a11b7c2b62c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564f-3b0a-56fb-ea9abca17467	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564f-3b0a-0629-e2c2d53e7c49	MX	MEX	484	Mexico 	Mehika	\N
00040000-564f-3b0a-6a6b-ba0048e3bfce	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564f-3b0a-8116-eb8e7247e7f6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564f-3b0a-66d8-c73584f1dfd3	MC	MCO	492	Monaco 	Monako	\N
00040000-564f-3b0a-0359-b100b6a75c3f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564f-3b0a-7295-b56b2c309c95	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564f-3b0a-1ab7-9fb0bf84b6a9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564f-3b0a-1f69-b5bb120dbf1a	MA	MAR	504	Morocco 	Maroko	\N
00040000-564f-3b0a-708a-177f060d6f25	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564f-3b0a-2f1b-4e9c8564a1bb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564f-3b0a-a717-d386f39ea798	NA	NAM	516	Namibia 	Namibija	\N
00040000-564f-3b0a-c619-fbddba3c1873	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564f-3b0a-3fe6-46e7e26c8f59	NP	NPL	524	Nepal 	Nepal	\N
00040000-564f-3b0a-cc55-fd8be9132fa9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564f-3b0a-7cc1-b0c9156d6915	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564f-3b0a-5363-3880049dce40	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564f-3b0a-a6af-855d244f4cc0	NE	NER	562	Niger 	Niger 	\N
00040000-564f-3b0a-3403-1fdcc5b77650	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564f-3b0a-3af8-f592fd078473	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564f-3b0a-13f3-f418fb90fb12	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564f-3b0a-2998-25230ef8b044	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564f-3b0a-82ec-5d29ee61c739	NO	NOR	578	Norway 	Norveška	\N
00040000-564f-3b0a-5fa1-f941b3592752	OM	OMN	512	Oman 	Oman	\N
00040000-564f-3b0a-bbfa-c06e72913f2e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564f-3b0a-5652-ba199a14fc57	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564f-3b0a-7a96-51b8b2229f15	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564f-3b0a-9c38-d1eb8ad5d7e5	PA	PAN	591	Panama 	Panama	\N
00040000-564f-3b0a-ec8b-abe22b57331c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564f-3b0a-7dbc-5fe691676e90	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564f-3b0a-8396-e7eceeedb5b0	PE	PER	604	Peru 	Peru	\N
00040000-564f-3b0a-a6ad-79a1aea3eb8b	PH	PHL	608	Philippines 	Filipini	\N
00040000-564f-3b0a-2cd0-49798513faf4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564f-3b0a-da07-09baf527c868	PL	POL	616	Poland 	Poljska	\N
00040000-564f-3b0a-7034-39aa75eba809	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564f-3b0a-651d-e5d647069bf9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564f-3b0a-9d1b-7f962eaaa8a2	QA	QAT	634	Qatar 	Katar	\N
00040000-564f-3b0a-200f-7109f74dbf23	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564f-3b0a-ed84-9e19744157ac	RO	ROU	642	Romania 	Romunija	\N
00040000-564f-3b0a-9022-b56e28035414	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564f-3b0a-6f87-0a6c26b41081	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564f-3b0a-03a4-faf254fbfdcd	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564f-3b0a-070a-a3b40c59195a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564f-3b0a-a3f8-1644880079ea	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564f-3b0a-e500-977fd0cb2539	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564f-3b0a-191c-d2dae00e5748	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564f-3b0a-8cf9-ca189806492b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564f-3b0a-116e-1662a3909086	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564f-3b0a-3684-c15fa21a4f26	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564f-3b0a-55db-51299d6eeade	SM	SMR	674	San Marino 	San Marino	\N
00040000-564f-3b0a-5aea-579cf2a63036	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564f-3b0a-e6bb-6fd3a54f6fd6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564f-3b0a-6db5-f6c5ffae694a	SN	SEN	686	Senegal 	Senegal	\N
00040000-564f-3b0a-049e-936775e7e229	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564f-3b0a-090f-badc47187cf2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564f-3b0a-76a9-045d741da4bc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564f-3b0a-6a77-b99be1d6c8c9	SG	SGP	702	Singapore 	Singapur	\N
00040000-564f-3b0a-0667-591f8c1af829	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564f-3b0a-9ea4-9e24533b7a69	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564f-3b0a-391e-ad24d726fe83	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564f-3b0a-80a9-bb3c91994fe0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564f-3b0a-f5ad-20020393597b	SO	SOM	706	Somalia 	Somalija	\N
00040000-564f-3b0a-ea8d-644fe67ea727	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564f-3b0a-0092-d12851bb66fb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564f-3b0a-73ed-d376aa1ad221	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564f-3b0a-099c-7866f6ee3077	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564f-3b0a-2747-5bb4a563f1d8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564f-3b0a-4506-7158a79d8b47	SD	SDN	729	Sudan 	Sudan	\N
00040000-564f-3b0a-9e87-fe1e7b4f1873	SR	SUR	740	Suriname 	Surinam	\N
00040000-564f-3b0a-b0ac-d7b2dbc92aa8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564f-3b0a-b514-346c4dc60e06	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564f-3b0a-255c-a40a8b981ac0	SE	SWE	752	Sweden 	Švedska	\N
00040000-564f-3b0a-91b5-1ba28a77cb57	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564f-3b0a-3cbf-390379568981	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564f-3b0a-e4c1-b2fc8895607f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564f-3b0a-20e8-29cb046b526a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564f-3b0a-bd06-6ccf99c095f1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564f-3b0a-e061-26a98df02a53	TH	THA	764	Thailand 	Tajska	\N
00040000-564f-3b0a-8f88-30cbc93aac63	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564f-3b0a-7256-df04beb68f2d	TG	TGO	768	Togo 	Togo	\N
00040000-564f-3b0a-b434-5f006ab8b907	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564f-3b0a-ed4a-0c6b3f51bef5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564f-3b0a-b291-103c9bf50377	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564f-3b0a-2e02-d84bbb03ae47	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564f-3b0a-9e95-dfbab6fb99a4	TR	TUR	792	Turkey 	Turčija	\N
00040000-564f-3b0a-1e3a-4cb1790d5d3e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564f-3b0a-6545-08b48aa8e53a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564f-3b0a-2e34-d7ec4d9d712a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564f-3b0a-2556-53f69052a8e9	UG	UGA	800	Uganda 	Uganda	\N
00040000-564f-3b0a-40e7-bfc9815cb6bb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564f-3b0a-a242-ce0dc00872fa	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564f-3b0a-9fb0-876f8270661b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564f-3b0a-e74f-6fdb2bc495d8	US	USA	840	United States 	Združene države Amerike	\N
00040000-564f-3b0a-1a18-6cefa3330b93	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564f-3b0a-5534-342864091114	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564f-3b0a-21df-994e031821e4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564f-3b0a-33b9-6a9044db62ac	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564f-3b0a-6cc3-c601f1da3ae3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564f-3b0a-613a-aea95ecb51af	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564f-3b0a-1e98-44cd50341a5f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564f-3b0a-bd42-88848554bc20	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564f-3b0a-3aee-071986f45510	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564f-3b0a-a56d-c02a473702db	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564f-3b0a-2d40-e925437a56ef	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564f-3b0a-7f6f-1ca8fead08ec	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564f-3b0a-f28d-f42da1c60122	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 28950695)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564f-3b0d-5532-70481fc116c1	000e0000-564f-3b0d-2249-03ec59a0bb85	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564f-3b0a-0db9-6013a5e8bb10	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564f-3b0d-de4f-2dfc71a66527	000e0000-564f-3b0d-286f-5964d21285fe	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564f-3b0a-7a05-ff073e72552f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564f-3b0d-a844-938fb38a840c	000e0000-564f-3b0d-f2a8-5285988fd15f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564f-3b0a-0db9-6013a5e8bb10	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564f-3b0d-f2c5-ea7bab53ee75	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564f-3b0d-ea69-4ceb694db12c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 28950496)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564f-3b0d-b1d3-5762be08e19e	000e0000-564f-3b0d-286f-5964d21285fe	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564f-3b0a-5aa4-0026dd53f118
000d0000-564f-3b0d-6420-1e51d9ae21a3	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-e137-992bda5789c8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564f-3b0a-5aa4-0026dd53f118
000d0000-564f-3b0d-bbd7-2e60aee15834	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-1b03-b197f8bf18f7	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564f-3b0a-6ef5-e50d752acabe
000d0000-564f-3b0d-37c7-75064329d459	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-21fa-e6a0a7d7870a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564f-3b0a-6433-9b9048c9f911
000d0000-564f-3b0d-3578-313714ec396f	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-bdd2-0aa4812f259f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564f-3b0a-6164-d0a7f94273e6
000d0000-564f-3b0d-55e0-41e170505343	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-6c69-e9596b710b0f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564f-3b0a-6164-d0a7f94273e6
000d0000-564f-3b0d-7b5d-3d13255a4f96	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-b28c-ebe3e8c79901	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564f-3b0a-5aa4-0026dd53f118
000d0000-564f-3b0d-1f29-153cc88fa9f9	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-cdbc-a06e4b6f63e2	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564f-3b0a-61ee-21fd657fac64
000d0000-564f-3b0d-0e74-39307f5d6d6d	000e0000-564f-3b0d-286f-5964d21285fe	000c0000-564f-3b0d-0d7e-92b64a91798f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564f-3b0a-a7ac-6d46d0c4534a
\.


--
-- TOC entry 3122 (class 0 OID 28950287)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 28950253)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 28950230)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564f-3b0d-40fb-58920db03156	00080000-564f-3b0c-8d05-f8c5007dc986	00090000-564f-3b0c-ff83-6bc998309e8e	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 28950410)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 28950953)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564f-3b0c-2e44-1523e4d58927	00010000-564f-3b0b-d0ca-b413ca2fd329	\N	Prva mapa	Root mapa	2015-11-20 16:23:56	2015-11-20 16:23:56	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 28950966)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 28950988)
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
-- TOC entry 3138 (class 0 OID 28950435)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 28950186)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564f-3b0b-e90c-53fbcf147ecc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564f-3b0b-edef-359650bb6b2f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564f-3b0b-fd9c-9aa012bb2a4c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564f-3b0b-4bad-b4e3c3389d33	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564f-3b0b-e606-11f96a2ea0af	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564f-3b0b-79ec-560409a1baeb	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564f-3b0b-b357-0267b77cd730	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564f-3b0b-d409-03fe8c39818e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564f-3b0b-1d33-adc6d024eb2b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564f-3b0b-ad5d-4f228f24af04	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564f-3b0b-6f7d-af936c1eaa06	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564f-3b0b-5716-64aa2300adc5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564f-3b0b-b2f5-bf369ac1cf97	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564f-3b0b-bb0e-88e124782f82	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564f-3b0c-f65c-98bcc3bd92e3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564f-3b0c-6310-2a5b39455461	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564f-3b0c-9620-ad96361c075a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564f-3b0c-5338-eb96d51238fa	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564f-3b0c-ba3b-0cac3395bc7e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564f-3b0e-473e-140bc094e02c	application.tenant.maticnopodjetje	string	s:36:"00080000-564f-3b0e-5cf8-cb13828cf39e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 28950086)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564f-3b0c-4119-40ff0b59ed8b	00000000-564f-3b0c-f65c-98bcc3bd92e3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564f-3b0c-1dd8-874cf5f53112	00000000-564f-3b0c-f65c-98bcc3bd92e3	00010000-564f-3b0b-d0ca-b413ca2fd329	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564f-3b0c-038a-00b3b001de76	00000000-564f-3b0c-6310-2a5b39455461	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 28950153)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564f-3b0d-478e-a5733f7054d0	\N	00100000-564f-3b0d-4c34-f51859e122bf	00100000-564f-3b0d-64bf-8c095f0f6266	01	Gledališče Nimbis
00410000-564f-3b0d-ba6c-7a6216ff050d	00410000-564f-3b0d-478e-a5733f7054d0	00100000-564f-3b0d-4c34-f51859e122bf	00100000-564f-3b0d-64bf-8c095f0f6266	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 28950097)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564f-3b0c-8806-3df9cb099e73	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564f-3b0c-0bc8-e383f820f9d0	00010000-564f-3b0c-840d-2d3724bf48f8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564f-3b0c-34aa-56ef0eb30f79	00010000-564f-3b0c-5696-14efd7f4539a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564f-3b0c-67eb-bc9022b8b38f	00010000-564f-3b0c-27fa-414efe33ec6d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564f-3b0c-9d86-b894a29ebaa6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564f-3b0c-4a73-5c8644c4ad5a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564f-3b0c-8582-400d1177c40b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564f-3b0c-0643-2165db536b3a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564f-3b0c-ff83-6bc998309e8e	00010000-564f-3b0c-0fd9-fde513a53544	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564f-3b0c-4b55-e7626bebbb71	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564f-3b0c-5db4-927712587382	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564f-3b0c-0014-e7f4e9c631b1	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564f-3b0c-8e9a-e1de84ab1d0f	00010000-564f-3b0c-275a-64ab0ba2868d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564f-3b0c-1a9a-b3ce281e6f07	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564f-3b0c-84ab-9c86240927cc	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564f-3b0c-1374-973b445eccc5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564f-3b0c-42bf-42067ea97bb7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564f-3b0c-2585-3370cff90c01	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564f-3b0c-9234-81fc0ecf2b97	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564f-3b0c-33a5-775be87b925f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564f-3b0c-d296-54cec0abc0e4	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 28950032)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564f-3b0a-e0d3-bf49ca2b8f69	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564f-3b0a-c349-0fe4d33028e1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564f-3b0a-bfa6-52ac74732a1c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564f-3b0a-694f-f1802932becd	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564f-3b0a-135a-4f373da29f21	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564f-3b0a-3ce3-b5fece1eb458	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564f-3b0a-224f-c8b29bdb53b6	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564f-3b0a-f293-691025b10a48	Abonma-read	Abonma - branje	t
00030000-564f-3b0a-6c5e-94b03ab31efe	Abonma-write	Abonma - spreminjanje	t
00030000-564f-3b0a-ea35-f38e302ecb8c	Alternacija-read	Alternacija - branje	t
00030000-564f-3b0a-c5d4-57aaf79e3876	Alternacija-write	Alternacija - spreminjanje	t
00030000-564f-3b0a-daf5-c20a5de11523	Arhivalija-read	Arhivalija - branje	t
00030000-564f-3b0a-b5c7-0587eca6818d	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564f-3b0a-8070-028e6480147e	AuthStorage-read	AuthStorage - branje	t
00030000-564f-3b0a-34ca-930313297a3e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564f-3b0a-d014-e6d7622d62d9	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564f-3b0a-cc0a-0ed2fb25619c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564f-3b0a-40ab-491a51079f81	Besedilo-read	Besedilo - branje	t
00030000-564f-3b0a-6296-e1dcfce93242	Besedilo-write	Besedilo - spreminjanje	t
00030000-564f-3b0a-0608-e8d9e6b1b6d8	Dogodek-read	Dogodek - branje	t
00030000-564f-3b0a-2f3a-b46d8ff79a01	Dogodek-write	Dogodek - spreminjanje	t
00030000-564f-3b0a-4b83-02fcae77c359	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564f-3b0a-eaf1-b9670da13786	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564f-3b0a-9040-2b288070989b	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564f-3b0a-0c45-50f77233c958	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564f-3b0a-0def-0f772fb8d41a	DogodekTrait-read	DogodekTrait - branje	t
00030000-564f-3b0a-6094-a132bee216b0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564f-3b0a-09c8-c6387af7ffc8	DrugiVir-read	DrugiVir - branje	t
00030000-564f-3b0a-ab65-d0b84096ebed	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564f-3b0a-a0cd-5f32de7d5602	Drzava-read	Drzava - branje	t
00030000-564f-3b0a-258f-d919ba4d3dd5	Drzava-write	Drzava - spreminjanje	t
00030000-564f-3b0a-55b6-a66ec00f6659	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564f-3b0a-8e94-d485e4668ac3	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564f-3b0a-87a8-0e7ea4bea25b	Funkcija-read	Funkcija - branje	t
00030000-564f-3b0a-dcf9-32e8e8c12b8c	Funkcija-write	Funkcija - spreminjanje	t
00030000-564f-3b0a-20ee-01965e0a089d	Gostovanje-read	Gostovanje - branje	t
00030000-564f-3b0a-96f9-1f6c20418e2f	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564f-3b0a-5213-af10996ec2cd	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564f-3b0a-735f-3112d89aac25	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564f-3b0a-95f1-1fbfbcfd47b1	Kupec-read	Kupec - branje	t
00030000-564f-3b0a-f4a9-342978086536	Kupec-write	Kupec - spreminjanje	t
00030000-564f-3b0a-ccf6-4fb66bca2a22	NacinPlacina-read	NacinPlacina - branje	t
00030000-564f-3b0a-c149-bee6aee648b5	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564f-3b0a-03f7-7c8cb1cf0853	Option-read	Option - branje	t
00030000-564f-3b0a-f2b9-1f2c1b9de053	Option-write	Option - spreminjanje	t
00030000-564f-3b0a-0eb9-de02406b9d63	OptionValue-read	OptionValue - branje	t
00030000-564f-3b0a-21e5-7b28dc65511c	OptionValue-write	OptionValue - spreminjanje	t
00030000-564f-3b0a-e2fa-6543151603ac	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564f-3b0a-58c4-6f82786cd9fd	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564f-3b0a-eb28-cf6b443478e3	Oseba-read	Oseba - branje	t
00030000-564f-3b0a-cc8e-4d7d38d2653d	Oseba-write	Oseba - spreminjanje	t
00030000-564f-3b0a-137a-eaf35e9c707a	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564f-3b0a-461e-4a69236c3d7f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564f-3b0a-6eab-5441b989232c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564f-3b0a-d6b4-d1714f863468	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564f-3b0a-71d1-7919c31f2dc4	Pogodba-read	Pogodba - branje	t
00030000-564f-3b0a-5562-2d1ad07ae462	Pogodba-write	Pogodba - spreminjanje	t
00030000-564f-3b0a-8c51-41daa10564f0	Popa-read	Popa - branje	t
00030000-564f-3b0a-46e0-676de1d0d36d	Popa-write	Popa - spreminjanje	t
00030000-564f-3b0a-ee7b-73df35a1c8ae	Posta-read	Posta - branje	t
00030000-564f-3b0a-2b37-05471bbdb52b	Posta-write	Posta - spreminjanje	t
00030000-564f-3b0a-1e1b-02c8e410d659	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564f-3b0a-4996-b88fb055292b	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564f-3b0a-d13c-283a1cb8db51	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564f-3b0a-6e8a-0677c1bd1c9c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564f-3b0a-37f4-cb913b687780	PostniNaslov-read	PostniNaslov - branje	t
00030000-564f-3b0a-16d2-8df05d1812b6	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564f-3b0a-5089-82db68775d5f	Praznik-read	Praznik - branje	t
00030000-564f-3b0a-3e4d-c98b8bf2fc33	Praznik-write	Praznik - spreminjanje	t
00030000-564f-3b0a-8f3f-6df0b5726e5c	Predstava-read	Predstava - branje	t
00030000-564f-3b0a-08a3-bc43c000beb6	Predstava-write	Predstava - spreminjanje	t
00030000-564f-3b0a-1c88-aeb73081bf6f	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564f-3b0a-fcec-2378ebe4aff3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564f-3b0a-b121-b72f3f3e8a8e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564f-3b0a-3a71-1edff842ff5d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564f-3b0a-d796-30ac6f5652b8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564f-3b0a-2935-adc7d70000cb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564f-3b0a-9e50-7d10386e580d	ProgramDela-read	ProgramDela - branje	t
00030000-564f-3b0a-8341-e2481df2fea4	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564f-3b0a-ed23-98e9e2cd21fa	ProgramFestival-read	ProgramFestival - branje	t
00030000-564f-3b0a-6d8a-1f992d95122f	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564f-3b0a-11bf-3144b608b1bb	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564f-3b0a-8aa6-aea3bf146228	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564f-3b0a-b1d7-f5b1e3c5cfe1	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564f-3b0a-f7a1-b9588b785207	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564f-3b0a-6083-fda65c9944c5	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564f-3b0a-7ae3-58114b0dd6aa	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564f-3b0a-4ffa-a7d842183529	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564f-3b0a-0569-a2017c030fa8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564f-3b0a-ad63-77184cc1d1a4	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564f-3b0a-f4a7-01a46367853b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564f-3b0a-3dd9-fb89d2a7a5b7	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564f-3b0a-2c3a-7a1536823b09	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564f-3b0a-c39c-e8ba4e7abee1	ProgramRazno-read	ProgramRazno - branje	t
00030000-564f-3b0a-c258-5cc18ed4955b	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564f-3b0a-bbe5-1e445c58e66b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564f-3b0a-5f8a-5bee8f57a792	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564f-3b0a-167d-ba21cecfca75	Prostor-read	Prostor - branje	t
00030000-564f-3b0a-8667-fcaad632b692	Prostor-write	Prostor - spreminjanje	t
00030000-564f-3b0a-ce1d-c0a3b0ab946d	Racun-read	Racun - branje	t
00030000-564f-3b0a-8ca7-62a520eea60f	Racun-write	Racun - spreminjanje	t
00030000-564f-3b0a-e335-22491b1cb0db	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564f-3b0a-8881-a4c5b0f12c15	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564f-3b0a-8635-a2549a015065	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564f-3b0a-1186-a34cd9850377	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564f-3b0a-eba3-333b842a912a	Rekvizit-read	Rekvizit - branje	t
00030000-564f-3b0a-af48-09bb17d572c7	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564f-3b0a-98e4-4778d109f968	Revizija-read	Revizija - branje	t
00030000-564f-3b0a-bfd7-b2fa99ac0ae8	Revizija-write	Revizija - spreminjanje	t
00030000-564f-3b0a-97d3-ebf224c2ac27	Rezervacija-read	Rezervacija - branje	t
00030000-564f-3b0a-5713-63b71ce6489c	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564f-3b0a-486c-68527f458ebb	SedezniRed-read	SedezniRed - branje	t
00030000-564f-3b0a-eee3-3577d35e1421	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564f-3b0a-303b-d733e878484a	Sedez-read	Sedez - branje	t
00030000-564f-3b0a-1664-d38c61c305ed	Sedez-write	Sedez - spreminjanje	t
00030000-564f-3b0a-00af-5ab6e096d594	Sezona-read	Sezona - branje	t
00030000-564f-3b0a-9f73-8679fe6f0d8c	Sezona-write	Sezona - spreminjanje	t
00030000-564f-3b0a-f5ea-ae55e0497b88	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564f-3b0a-0755-71c98390220d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564f-3b0a-9a27-6cb34ce62ad1	Stevilcenje-read	Stevilcenje - branje	t
00030000-564f-3b0a-8620-dae511908299	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564f-3b0a-7e3b-c3f98251fdbb	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564f-3b0a-0d25-1a5f0fb7a81e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564f-3b0a-a8c4-ef5c982c7575	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564f-3b0a-b3b2-727efb6062e8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564f-3b0a-dd09-f63e6d645282	Telefonska-read	Telefonska - branje	t
00030000-564f-3b0a-b8a8-2e0a34e79589	Telefonska-write	Telefonska - spreminjanje	t
00030000-564f-3b0a-ea09-f02c208a68e3	TerminStoritve-read	TerminStoritve - branje	t
00030000-564f-3b0a-0290-eb5e2f1d62d8	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564f-3b0a-a516-40dd3d601338	TipFunkcije-read	TipFunkcije - branje	t
00030000-564f-3b0a-5b0e-4eb6d223665c	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564f-3b0a-43b3-512baff96367	TipPopa-read	TipPopa - branje	t
00030000-564f-3b0a-d8a7-b3dbffb480b7	TipPopa-write	TipPopa - spreminjanje	t
00030000-564f-3b0a-a3de-4e00e79bcafd	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564f-3b0a-a79d-7b26e10cf37e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564f-3b0a-db70-aeb497d4cbf1	TipVaje-read	TipVaje - branje	t
00030000-564f-3b0a-5203-cf9b9c1511e3	TipVaje-write	TipVaje - spreminjanje	t
00030000-564f-3b0a-f36b-1c4ceeff3937	Trr-read	Trr - branje	t
00030000-564f-3b0a-a419-dd0393da6526	Trr-write	Trr - spreminjanje	t
00030000-564f-3b0a-67b1-79278dc80e73	Uprizoritev-read	Uprizoritev - branje	t
00030000-564f-3b0a-4c50-460bced84139	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564f-3b0a-357c-1a1142f20ed3	Vaja-read	Vaja - branje	t
00030000-564f-3b0a-5a0b-71419cc8a898	Vaja-write	Vaja - spreminjanje	t
00030000-564f-3b0a-2211-487c6508af3f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564f-3b0a-6513-364fa1a66d44	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564f-3b0a-ce28-8c33c86e0fd0	VrstaStroska-read	VrstaStroska - branje	t
00030000-564f-3b0a-ed56-9af431a6998b	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564f-3b0a-45cd-51438da7fa26	Zaposlitev-read	Zaposlitev - branje	t
00030000-564f-3b0a-9fbd-f89a3da51757	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564f-3b0a-51da-26d7e49c5010	Zasedenost-read	Zasedenost - branje	t
00030000-564f-3b0a-5880-8ca17202e88d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564f-3b0a-cd3b-bd0c00c81cdb	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564f-3b0a-b768-2a663f2a1946	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564f-3b0a-59e5-b32b21fa9bad	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564f-3b0a-e0e9-e0894ecfe89e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564f-3b0a-a5a6-1e81b30b7b7b	Job-read	Branje opravil - samo zase - branje	t
00030000-564f-3b0a-7423-3124a8db21b1	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564f-3b0a-4cc5-fd95c4788bde	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564f-3b0a-2cdf-9a1c65255b50	Report-read	Report - branje	t
00030000-564f-3b0a-69df-9c4c52376e2a	Report-write	Report - spreminjanje	t
00030000-564f-3b0a-60df-abfc46663488	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564f-3b0a-9491-a230db8c46d4	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564f-3b0a-60cd-7f920ee7efa3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564f-3b0a-0276-cf8ffb4b3c58	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564f-3b0a-d3f0-6e4aef514ff3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564f-3b0a-3738-dc0f46d31dcb	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564f-3b0a-0021-e0d4a0f37f90	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564f-3b0a-1ad3-acc936ab64cd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564f-3b0a-f580-7dcdfcba4fcd	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564f-3b0a-ec9b-72418b5b6fd7	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564f-3b0a-deb9-175bdd90d580	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564f-3b0a-7e7e-63470251f70f	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564f-3b0a-15e6-4d8f3313aa97	Datoteka-write	Datoteka - spreminjanje	t
00030000-564f-3b0a-815d-a1d7b78e1481	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 28950051)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564f-3b0a-4fdd-70fb0e3d3e15	00030000-564f-3b0a-c349-0fe4d33028e1
00020000-564f-3b0a-7518-1b3c6e035042	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-f293-691025b10a48
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-6c5e-94b03ab31efe
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-ea35-f38e302ecb8c
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-c5d4-57aaf79e3876
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-daf5-c20a5de11523
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-0608-e8d9e6b1b6d8
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-694f-f1802932becd
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-2f3a-b46d8ff79a01
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-258f-d919ba4d3dd5
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-87a8-0e7ea4bea25b
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-dcf9-32e8e8c12b8c
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-20ee-01965e0a089d
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-96f9-1f6c20418e2f
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-5213-af10996ec2cd
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-735f-3112d89aac25
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-03f7-7c8cb1cf0853
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-0eb9-de02406b9d63
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-eb28-cf6b443478e3
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-cc8e-4d7d38d2653d
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-46e0-676de1d0d36d
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-ee7b-73df35a1c8ae
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-2b37-05471bbdb52b
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-37f4-cb913b687780
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-16d2-8df05d1812b6
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-8f3f-6df0b5726e5c
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-08a3-bc43c000beb6
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-d796-30ac6f5652b8
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-2935-adc7d70000cb
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-167d-ba21cecfca75
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-8667-fcaad632b692
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-8635-a2549a015065
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-1186-a34cd9850377
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-eba3-333b842a912a
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-af48-09bb17d572c7
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-00af-5ab6e096d594
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-9f73-8679fe6f0d8c
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-a516-40dd3d601338
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-67b1-79278dc80e73
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-4c50-460bced84139
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-357c-1a1142f20ed3
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-5a0b-71419cc8a898
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-51da-26d7e49c5010
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-5880-8ca17202e88d
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-cd3b-bd0c00c81cdb
00020000-564f-3b0a-d2fc-f44d089f5eea	00030000-564f-3b0a-59e5-b32b21fa9bad
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-f293-691025b10a48
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-daf5-c20a5de11523
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-0608-e8d9e6b1b6d8
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-20ee-01965e0a089d
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-5213-af10996ec2cd
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-735f-3112d89aac25
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-03f7-7c8cb1cf0853
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-0eb9-de02406b9d63
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-eb28-cf6b443478e3
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-cc8e-4d7d38d2653d
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-ee7b-73df35a1c8ae
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-37f4-cb913b687780
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-16d2-8df05d1812b6
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-8f3f-6df0b5726e5c
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-167d-ba21cecfca75
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-8635-a2549a015065
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-eba3-333b842a912a
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-00af-5ab6e096d594
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-dd09-f63e6d645282
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-b8a8-2e0a34e79589
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-f36b-1c4ceeff3937
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-a419-dd0393da6526
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-45cd-51438da7fa26
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-9fbd-f89a3da51757
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-cd3b-bd0c00c81cdb
00020000-564f-3b0a-77c0-1491392f51ee	00030000-564f-3b0a-59e5-b32b21fa9bad
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-f293-691025b10a48
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-ea35-f38e302ecb8c
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-daf5-c20a5de11523
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-b5c7-0587eca6818d
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-40ab-491a51079f81
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-4b83-02fcae77c359
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-0608-e8d9e6b1b6d8
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-87a8-0e7ea4bea25b
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-20ee-01965e0a089d
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-5213-af10996ec2cd
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-03f7-7c8cb1cf0853
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-0eb9-de02406b9d63
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-eb28-cf6b443478e3
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-ee7b-73df35a1c8ae
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-8f3f-6df0b5726e5c
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-d796-30ac6f5652b8
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-167d-ba21cecfca75
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-8635-a2549a015065
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-eba3-333b842a912a
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-00af-5ab6e096d594
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-a516-40dd3d601338
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-357c-1a1142f20ed3
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-51da-26d7e49c5010
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-cd3b-bd0c00c81cdb
00020000-564f-3b0b-3df0-d3608434ca6b	00030000-564f-3b0a-59e5-b32b21fa9bad
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-f293-691025b10a48
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-6c5e-94b03ab31efe
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-c5d4-57aaf79e3876
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-daf5-c20a5de11523
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-0608-e8d9e6b1b6d8
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-20ee-01965e0a089d
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-03f7-7c8cb1cf0853
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-0eb9-de02406b9d63
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-ee7b-73df35a1c8ae
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-8f3f-6df0b5726e5c
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-167d-ba21cecfca75
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-8635-a2549a015065
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-eba3-333b842a912a
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-00af-5ab6e096d594
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-a516-40dd3d601338
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-cd3b-bd0c00c81cdb
00020000-564f-3b0b-4ecc-d74dffa0368d	00030000-564f-3b0a-59e5-b32b21fa9bad
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-f293-691025b10a48
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-daf5-c20a5de11523
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-0608-e8d9e6b1b6d8
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-20ee-01965e0a089d
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-03f7-7c8cb1cf0853
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-0eb9-de02406b9d63
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-ee7b-73df35a1c8ae
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-8f3f-6df0b5726e5c
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-167d-ba21cecfca75
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-8635-a2549a015065
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-eba3-333b842a912a
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-00af-5ab6e096d594
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-ea09-f02c208a68e3
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-bfa6-52ac74732a1c
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-a516-40dd3d601338
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-cd3b-bd0c00c81cdb
00020000-564f-3b0b-31be-eccdbe21297e	00030000-564f-3b0a-59e5-b32b21fa9bad
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-e0d3-bf49ca2b8f69
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-c349-0fe4d33028e1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f293-691025b10a48
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6c5e-94b03ab31efe
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ea35-f38e302ecb8c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-c5d4-57aaf79e3876
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-daf5-c20a5de11523
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-b5c7-0587eca6818d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8070-028e6480147e
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-34ca-930313297a3e
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-d014-e6d7622d62d9
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-cc0a-0ed2fb25619c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-40ab-491a51079f81
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6296-e1dcfce93242
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-815d-a1d7b78e1481
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-15e6-4d8f3313aa97
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0608-e8d9e6b1b6d8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-694f-f1802932becd
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-2f3a-b46d8ff79a01
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-4b83-02fcae77c359
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-eaf1-b9670da13786
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-9040-2b288070989b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0c45-50f77233c958
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-09c8-c6387af7ffc8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ab65-d0b84096ebed
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a0cd-5f32de7d5602
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-258f-d919ba4d3dd5
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-55b6-a66ec00f6659
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8e94-d485e4668ac3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-87a8-0e7ea4bea25b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-dcf9-32e8e8c12b8c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-20ee-01965e0a089d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-96f9-1f6c20418e2f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-4cc5-fd95c4788bde
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a5a6-1e81b30b7b7b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-7423-3124a8db21b1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5213-af10996ec2cd
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-735f-3112d89aac25
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-95f1-1fbfbcfd47b1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f4a9-342978086536
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-60df-abfc46663488
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-9491-a230db8c46d4
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-60cd-7f920ee7efa3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0276-cf8ffb4b3c58
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-3738-dc0f46d31dcb
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-d3f0-6e4aef514ff3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ccf6-4fb66bca2a22
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-c149-bee6aee648b5
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-03f7-7c8cb1cf0853
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f2b9-1f2c1b9de053
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0eb9-de02406b9d63
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-21e5-7b28dc65511c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-e2fa-6543151603ac
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-58c4-6f82786cd9fd
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-eb28-cf6b443478e3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-135a-4f373da29f21
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-cc8e-4d7d38d2653d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-137a-eaf35e9c707a
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-461e-4a69236c3d7f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6eab-5441b989232c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-d6b4-d1714f863468
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-71d1-7919c31f2dc4
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5562-2d1ad07ae462
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-46e0-676de1d0d36d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ee7b-73df35a1c8ae
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-2b37-05471bbdb52b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-1e1b-02c8e410d659
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-4996-b88fb055292b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-d13c-283a1cb8db51
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6e8a-0677c1bd1c9c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-37f4-cb913b687780
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-16d2-8df05d1812b6
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5089-82db68775d5f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-3e4d-c98b8bf2fc33
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8f3f-6df0b5726e5c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-08a3-bc43c000beb6
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-1c88-aeb73081bf6f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-fcec-2378ebe4aff3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-b121-b72f3f3e8a8e
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-3a71-1edff842ff5d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-d796-30ac6f5652b8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-2935-adc7d70000cb
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-3ce3-b5fece1eb458
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-9e50-7d10386e580d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-224f-c8b29bdb53b6
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8341-e2481df2fea4
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ed23-98e9e2cd21fa
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6d8a-1f992d95122f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-11bf-3144b608b1bb
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8aa6-aea3bf146228
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-b1d7-f5b1e3c5cfe1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f7a1-b9588b785207
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6083-fda65c9944c5
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-7ae3-58114b0dd6aa
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-4ffa-a7d842183529
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0569-a2017c030fa8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ad63-77184cc1d1a4
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f4a7-01a46367853b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-3dd9-fb89d2a7a5b7
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-2c3a-7a1536823b09
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-c39c-e8ba4e7abee1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-c258-5cc18ed4955b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-bbe5-1e445c58e66b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5f8a-5bee8f57a792
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-167d-ba21cecfca75
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8667-fcaad632b692
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ce1d-c0a3b0ab946d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8ca7-62a520eea60f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-e335-22491b1cb0db
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8881-a4c5b0f12c15
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-eba3-333b842a912a
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-af48-09bb17d572c7
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8635-a2549a015065
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-1186-a34cd9850377
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-2cdf-9a1c65255b50
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-69df-9c4c52376e2a
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-98e4-4778d109f968
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-bfd7-b2fa99ac0ae8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-97d3-ebf224c2ac27
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5713-63b71ce6489c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-303b-d733e878484a
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-1664-d38c61c305ed
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-486c-68527f458ebb
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-eee3-3577d35e1421
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-00af-5ab6e096d594
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-9f73-8679fe6f0d8c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-9a27-6cb34ce62ad1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-8620-dae511908299
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f5ea-ae55e0497b88
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0755-71c98390220d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-7e3b-c3f98251fdbb
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0d25-1a5f0fb7a81e
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a8c4-ef5c982c7575
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-b3b2-727efb6062e8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-dd09-f63e6d645282
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-b8a8-2e0a34e79589
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ea09-f02c208a68e3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-bfa6-52ac74732a1c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0290-eb5e2f1d62d8
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a516-40dd3d601338
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5b0e-4eb6d223665c
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-43b3-512baff96367
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-d8a7-b3dbffb480b7
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a3de-4e00e79bcafd
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a79d-7b26e10cf37e
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-db70-aeb497d4cbf1
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5203-cf9b9c1511e3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f36b-1c4ceeff3937
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-a419-dd0393da6526
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-67b1-79278dc80e73
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-4c50-460bced84139
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-357c-1a1142f20ed3
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5a0b-71419cc8a898
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-2211-487c6508af3f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-6513-364fa1a66d44
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ce28-8c33c86e0fd0
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ed56-9af431a6998b
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-7e7e-63470251f70f
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-deb9-175bdd90d580
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-1ad3-acc936ab64cd
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-0021-e0d4a0f37f90
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-ec9b-72418b5b6fd7
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-f580-7dcdfcba4fcd
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-45cd-51438da7fa26
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-9fbd-f89a3da51757
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-51da-26d7e49c5010
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-5880-8ca17202e88d
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-cd3b-bd0c00c81cdb
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-b768-2a663f2a1946
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-59e5-b32b21fa9bad
00020000-564f-3b0c-0bef-dc4c97e869a8	00030000-564f-3b0a-e0e9-e0894ecfe89e
00020000-564f-3b0c-920e-fefee23daca5	00030000-564f-3b0a-ec9b-72418b5b6fd7
00020000-564f-3b0c-5a0d-bdc84ef8dee5	00030000-564f-3b0a-f580-7dcdfcba4fcd
00020000-564f-3b0c-d597-e6cb65b12263	00030000-564f-3b0a-4c50-460bced84139
00020000-564f-3b0c-6490-74a94779e22c	00030000-564f-3b0a-67b1-79278dc80e73
00020000-564f-3b0c-2fba-a658397f2d70	00030000-564f-3b0a-9491-a230db8c46d4
00020000-564f-3b0c-79d8-1b79f59c015c	00030000-564f-3b0a-60cd-7f920ee7efa3
00020000-564f-3b0c-cf56-915dc1c02bd4	00030000-564f-3b0a-0276-cf8ffb4b3c58
00020000-564f-3b0c-f244-eb7b82812140	00030000-564f-3b0a-60df-abfc46663488
00020000-564f-3b0c-9dc8-28a30dd8f67a	00030000-564f-3b0a-3738-dc0f46d31dcb
00020000-564f-3b0c-9475-65adbfee7a54	00030000-564f-3b0a-d3f0-6e4aef514ff3
00020000-564f-3b0c-1742-c3c576b521d9	00030000-564f-3b0a-1ad3-acc936ab64cd
00020000-564f-3b0c-d94c-d071c8dfe3a7	00030000-564f-3b0a-0021-e0d4a0f37f90
00020000-564f-3b0c-1520-1ae5407e5af4	00030000-564f-3b0a-cc8e-4d7d38d2653d
00020000-564f-3b0c-f386-112d8e3bcd2c	00030000-564f-3b0a-eb28-cf6b443478e3
00020000-564f-3b0c-7df6-59572d171cc2	00030000-564f-3b0a-15e6-4d8f3313aa97
00020000-564f-3b0c-0346-3b9397c65b11	00030000-564f-3b0a-815d-a1d7b78e1481
00020000-564f-3b0c-0e2d-ea100c3e489f	00030000-564f-3b0a-8c51-41daa10564f0
00020000-564f-3b0c-0e2d-ea100c3e489f	00030000-564f-3b0a-46e0-676de1d0d36d
00020000-564f-3b0c-0e2d-ea100c3e489f	00030000-564f-3b0a-67b1-79278dc80e73
\.


--
-- TOC entry 3139 (class 0 OID 28950442)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 28950476)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 28950613)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564f-3b0d-8740-b3e4a52a2e37	00090000-564f-3b0c-8806-3df9cb099e73	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564f-3b0d-9d59-7f5f8a5b7909	00090000-564f-3b0c-4a73-5c8644c4ad5a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564f-3b0d-1204-3aff5180f576	00090000-564f-3b0c-8e9a-e1de84ab1d0f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564f-3b0d-dd82-85f6aae3a819	00090000-564f-3b0c-4b55-e7626bebbb71	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 28950133)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564f-3b0c-8d05-f8c5007dc986	\N	00040000-564f-3b0a-391e-ad24d726fe83	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-d168-519355860687	\N	00040000-564f-3b0a-391e-ad24d726fe83	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564f-3b0c-8aec-9b22e7f3add1	\N	00040000-564f-3b0a-391e-ad24d726fe83	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-a675-aeee158142cc	\N	00040000-564f-3b0a-391e-ad24d726fe83	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-6c8b-2b4477dce8af	\N	00040000-564f-3b0a-391e-ad24d726fe83	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-a8f8-21994fdb613a	\N	00040000-564f-3b0a-fe77-e1d6ec9bf59c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-1e47-f9e42972847f	\N	00040000-564f-3b0a-d411-f7ea7a2061ce	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-aea4-351e3bbf2ebc	\N	00040000-564f-3b0a-ae1f-56bff57fa257	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0c-6679-5d06472f483f	\N	00040000-564f-3b0a-b25f-27973a3d5fe7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564f-3b0e-5cf8-cb13828cf39e	\N	00040000-564f-3b0a-391e-ad24d726fe83	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 28950178)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564f-3b09-9e34-5f778fd30d4d	8341	Adlešiči
00050000-564f-3b09-9d1e-0c8f4047b323	5270	Ajdovščina
00050000-564f-3b09-1c7a-c91c99ef26cb	6280	Ankaran/Ancarano
00050000-564f-3b09-ac00-3188673a2747	9253	Apače
00050000-564f-3b09-d7b1-47d61a9494ee	8253	Artiče
00050000-564f-3b09-c97f-9c8c4637450e	4275	Begunje na Gorenjskem
00050000-564f-3b09-bc30-f9a1b6434a0c	1382	Begunje pri Cerknici
00050000-564f-3b09-9af8-84df641d3713	9231	Beltinci
00050000-564f-3b09-46d5-aa141584b83c	2234	Benedikt
00050000-564f-3b09-95cd-c6a3eccf54db	2345	Bistrica ob Dravi
00050000-564f-3b09-4b50-a6b6fac637f9	3256	Bistrica ob Sotli
00050000-564f-3b09-836b-15a65fa5db2a	8259	Bizeljsko
00050000-564f-3b09-20f3-57404067af4a	1223	Blagovica
00050000-564f-3b09-921e-04b9370d2de3	8283	Blanca
00050000-564f-3b09-4d62-b95d192ca9bb	4260	Bled
00050000-564f-3b09-305c-dbc0008b1c11	4273	Blejska Dobrava
00050000-564f-3b09-ffbb-cf531cf505fc	9265	Bodonci
00050000-564f-3b09-3b01-0a481287b732	9222	Bogojina
00050000-564f-3b09-a0b1-1d9d672da364	4263	Bohinjska Bela
00050000-564f-3b09-6a40-54130bc35ca4	4264	Bohinjska Bistrica
00050000-564f-3b09-50dd-2ddd1bb0ca4a	4265	Bohinjsko jezero
00050000-564f-3b09-ca9a-f9ced93f763d	1353	Borovnica
00050000-564f-3b09-fa42-177dfa0ea66c	8294	Boštanj
00050000-564f-3b09-5883-4b11151f3396	5230	Bovec
00050000-564f-3b09-5286-eb689d96e1a2	5295	Branik
00050000-564f-3b09-d0c6-ddc3a11b7f4c	3314	Braslovče
00050000-564f-3b09-e1e5-67d35a46ce03	5223	Breginj
00050000-564f-3b09-5a84-3de5239c3c84	8280	Brestanica
00050000-564f-3b09-b8c6-d7cde6176891	2354	Bresternica
00050000-564f-3b09-3964-5fd25f9b7937	4243	Brezje
00050000-564f-3b09-db65-cf13b4ee245a	1351	Brezovica pri Ljubljani
00050000-564f-3b09-2da7-848504db92f5	8250	Brežice
00050000-564f-3b09-93c4-2631d0474138	4210	Brnik - Aerodrom
00050000-564f-3b09-bdd4-eb3e205b74c9	8321	Brusnice
00050000-564f-3b09-7b26-5747e71a2694	3255	Buče
00050000-564f-3b09-85f1-447dea8d54c5	8276	Bučka 
00050000-564f-3b09-08df-cd6531f7c2f6	9261	Cankova
00050000-564f-3b09-cf4b-88687f0299c4	3000	Celje 
00050000-564f-3b09-094a-394c6ed8f330	3001	Celje - poštni predali
00050000-564f-3b09-9175-e3a2df49401a	4207	Cerklje na Gorenjskem
00050000-564f-3b09-e1ea-c03169c4dc5b	8263	Cerklje ob Krki
00050000-564f-3b09-5bc2-59e62055bdfb	1380	Cerknica
00050000-564f-3b09-4e63-7e8c900e11a0	5282	Cerkno
00050000-564f-3b09-1263-22c49de86666	2236	Cerkvenjak
00050000-564f-3b09-70f9-5e975d7dbefb	2215	Ceršak
00050000-564f-3b09-723c-4b5fad76e835	2326	Cirkovce
00050000-564f-3b09-55c8-478c081494ea	2282	Cirkulane
00050000-564f-3b09-977e-6a370fdd035b	5273	Col
00050000-564f-3b09-7d5e-8a226b11fee5	8251	Čatež ob Savi
00050000-564f-3b09-299d-a15db95f2d8e	1413	Čemšenik
00050000-564f-3b09-bcdd-4a325d815396	5253	Čepovan
00050000-564f-3b09-8109-bbbc64741206	9232	Črenšovci
00050000-564f-3b09-c2ab-535384f0383e	2393	Črna na Koroškem
00050000-564f-3b09-15ca-187a8efa5bfd	6275	Črni Kal
00050000-564f-3b09-2c21-fdb628528c58	5274	Črni Vrh nad Idrijo
00050000-564f-3b09-97c5-a29e382de987	5262	Črniče
00050000-564f-3b09-e34f-ecf5fafbc975	8340	Črnomelj
00050000-564f-3b09-82ec-3ed03b4b5bf7	6271	Dekani
00050000-564f-3b09-658b-1dd728698221	5210	Deskle
00050000-564f-3b09-0aa8-88bffe80f5b3	2253	Destrnik
00050000-564f-3b09-9add-48a0b068d662	6215	Divača
00050000-564f-3b09-8238-669114d32cae	1233	Dob
00050000-564f-3b09-f7f7-711d147dc502	3224	Dobje pri Planini
00050000-564f-3b09-e899-1d684bcacb31	8257	Dobova
00050000-564f-3b09-ba45-73212d6e921c	1423	Dobovec
00050000-564f-3b09-8556-ac00d05dac95	5263	Dobravlje
00050000-564f-3b09-6e39-d71abe8512e3	3204	Dobrna
00050000-564f-3b09-b954-78df0c54c8fa	8211	Dobrnič
00050000-564f-3b09-9732-609c0491c58f	1356	Dobrova
00050000-564f-3b09-9c90-67ef5f714566	9223	Dobrovnik/Dobronak 
00050000-564f-3b09-e908-48342bbfaed5	5212	Dobrovo v Brdih
00050000-564f-3b09-0a12-6010e40a4d6d	1431	Dol pri Hrastniku
00050000-564f-3b09-c172-c30a3f8a90ca	1262	Dol pri Ljubljani
00050000-564f-3b09-ddd7-5e90bb0bda4b	1273	Dole pri Litiji
00050000-564f-3b09-c52a-f9050d95b6ce	1331	Dolenja vas
00050000-564f-3b09-f3f5-596fb2ee8614	8350	Dolenjske Toplice
00050000-564f-3b09-1ea8-291b2ee42583	1230	Domžale
00050000-564f-3b09-c222-4270c2bc56d1	2252	Dornava
00050000-564f-3b09-b5b7-14beb2584022	5294	Dornberk
00050000-564f-3b09-df25-1e7f738d57bb	1319	Draga
00050000-564f-3b09-b141-286eb8065413	8343	Dragatuš
00050000-564f-3b09-c354-0cf38cdaef20	3222	Dramlje
00050000-564f-3b09-4bc5-086d4a408155	2370	Dravograd
00050000-564f-3b09-0aac-ff8966d61187	4203	Duplje
00050000-564f-3b09-fc8f-456057587bd8	6221	Dutovlje
00050000-564f-3b09-877a-3eea67cd659c	8361	Dvor
00050000-564f-3b09-c05a-39f8a7421c02	2343	Fala
00050000-564f-3b09-f0d7-3fb96d5b90f3	9208	Fokovci
00050000-564f-3b09-cffd-18ba919f1a0f	2313	Fram
00050000-564f-3b09-56cd-55321b540abb	3213	Frankolovo
00050000-564f-3b09-6261-73f5effd7502	1274	Gabrovka
00050000-564f-3b09-4bfa-fd662af03094	8254	Globoko
00050000-564f-3b09-9478-a03f4177c713	5275	Godovič
00050000-564f-3b09-4b06-34158e8b8a81	4204	Golnik
00050000-564f-3b09-6284-b34dfd502251	3303	Gomilsko
00050000-564f-3b09-ed26-a77065b40f9a	4224	Gorenja vas
00050000-564f-3b09-59ae-8f8371d32cd6	3263	Gorica pri Slivnici
00050000-564f-3b09-2b6c-eb8a867df6c7	2272	Gorišnica
00050000-564f-3b09-1a89-9b3051a8a737	9250	Gornja Radgona
00050000-564f-3b09-2e03-60336420c335	3342	Gornji Grad
00050000-564f-3b09-19c4-0a51f6a74122	4282	Gozd Martuljek
00050000-564f-3b09-a9f2-8dcbc79045b1	6272	Gračišče
00050000-564f-3b09-0d2b-221ec2e9a820	9264	Grad
00050000-564f-3b09-9e30-b8c28cf84a2f	8332	Gradac
00050000-564f-3b09-9007-ded04f159b99	1384	Grahovo
00050000-564f-3b09-c5e8-96fc2e5ebc06	5242	Grahovo ob Bači
00050000-564f-3b09-f728-4d6ad27466af	5251	Grgar
00050000-564f-3b09-8c86-7bdc51ac54eb	3302	Griže
00050000-564f-3b09-fc6a-8457b1b2c0c9	3231	Grobelno
00050000-564f-3b09-f894-fd4852d5ae3a	1290	Grosuplje
00050000-564f-3b09-30bf-0ed8ad3f4252	2288	Hajdina
00050000-564f-3b09-5090-f9449b1bc6bf	8362	Hinje
00050000-564f-3b09-a44f-c7848f51fb32	2311	Hoče
00050000-564f-3b09-5540-5381f7f32b3e	9205	Hodoš/Hodos
00050000-564f-3b09-193a-226cc15250fa	1354	Horjul
00050000-564f-3b09-00f4-5af432c1e350	1372	Hotedršica
00050000-564f-3b09-4b46-a14fdac6a623	1430	Hrastnik
00050000-564f-3b09-c2b0-3fd17f1043e5	6225	Hruševje
00050000-564f-3b09-2528-519bd3f4b4a4	4276	Hrušica
00050000-564f-3b09-2d33-8c69d11f38ce	5280	Idrija
00050000-564f-3b09-b2b2-d38561510ae9	1292	Ig
00050000-564f-3b09-4180-6ab464d6ae2c	6250	Ilirska Bistrica
00050000-564f-3b09-0176-71992e357cc6	6251	Ilirska Bistrica-Trnovo
00050000-564f-3b09-5f44-e0c0986e041f	1295	Ivančna Gorica
00050000-564f-3b09-1bbe-688b331215ea	2259	Ivanjkovci
00050000-564f-3b09-1011-e7264e4a9127	1411	Izlake
00050000-564f-3b09-74f9-b2b6df0800d2	6310	Izola/Isola
00050000-564f-3b09-b363-1149ca04e54c	2222	Jakobski Dol
00050000-564f-3b09-9cc3-e820693066f7	2221	Jarenina
00050000-564f-3b09-2270-dabf3d5c8ba8	6254	Jelšane
00050000-564f-3b09-aed6-a05af9c0a8ff	4270	Jesenice
00050000-564f-3b09-7155-ec7cf7e38ddb	8261	Jesenice na Dolenjskem
00050000-564f-3b09-f949-ef78690d8c69	3273	Jurklošter
00050000-564f-3b09-ad28-5584117dd90f	2223	Jurovski Dol
00050000-564f-3b09-04cb-3f97cb1343a3	2256	Juršinci
00050000-564f-3b09-ec64-88bb267d4248	5214	Kal nad Kanalom
00050000-564f-3b09-764b-4139168f609f	3233	Kalobje
00050000-564f-3b09-ebc0-aeec779fece3	4246	Kamna Gorica
00050000-564f-3b09-51f1-b10378218913	2351	Kamnica
00050000-564f-3b09-c4a3-8ba30fab8214	1241	Kamnik
00050000-564f-3b09-9a5c-8e635c1bc196	5213	Kanal
00050000-564f-3b09-8e3a-60e9a6402ed7	8258	Kapele
00050000-564f-3b09-a10e-10e63a3e54a4	2362	Kapla
00050000-564f-3b09-6817-664e196705f0	2325	Kidričevo
00050000-564f-3b09-a78e-91d485b5c422	1412	Kisovec
00050000-564f-3b09-f9b3-e69b7d2f4814	6253	Knežak
00050000-564f-3b09-dc32-87ddbf2231c8	5222	Kobarid
00050000-564f-3b09-0ff4-9279db586e6a	9227	Kobilje
00050000-564f-3b09-ba22-0e7700da8e58	1330	Kočevje
00050000-564f-3b09-14ba-4cfa5991adfe	1338	Kočevska Reka
00050000-564f-3b09-71c0-b32e44fcc827	2276	Kog
00050000-564f-3b09-2de4-25e10b60802e	5211	Kojsko
00050000-564f-3b09-4a00-0a6005788241	6223	Komen
00050000-564f-3b09-8718-53702e38c4a1	1218	Komenda
00050000-564f-3b09-6ce2-924b1c8ddb5b	6000	Koper/Capodistria 
00050000-564f-3b09-df1c-5caf6440bf8c	6001	Koper/Capodistria - poštni predali
00050000-564f-3b09-7561-df657dca8718	8282	Koprivnica
00050000-564f-3b09-fe32-9311c0e67d88	5296	Kostanjevica na Krasu
00050000-564f-3b09-418e-c54d4d6cf6d6	8311	Kostanjevica na Krki
00050000-564f-3b09-a169-afb8a301f099	1336	Kostel
00050000-564f-3b09-0443-e97ec0076f07	6256	Košana
00050000-564f-3b09-3092-ce67cb1d41d5	2394	Kotlje
00050000-564f-3b09-5d59-1607467f96db	6240	Kozina
00050000-564f-3b09-9b4d-f5ab2b2e9fb4	3260	Kozje
00050000-564f-3b09-7956-20fa26195dbb	4000	Kranj 
00050000-564f-3b09-93cd-7473db89dc1e	4001	Kranj - poštni predali
00050000-564f-3b09-00c4-06b42508013d	4280	Kranjska Gora
00050000-564f-3b09-e32c-cd157ec1538d	1281	Kresnice
00050000-564f-3b09-a3cd-62d306ed0e8a	4294	Križe
00050000-564f-3b09-5fa0-19eacb2e7d89	9206	Križevci
00050000-564f-3b09-6d2b-2401c285b734	9242	Križevci pri Ljutomeru
00050000-564f-3b09-0df2-19b35f344ebb	1301	Krka
00050000-564f-3b09-6322-a2c69f60b1b0	8296	Krmelj
00050000-564f-3b09-9fda-28c25e608915	4245	Kropa
00050000-564f-3b09-ab55-6241325d479c	8262	Krška vas
00050000-564f-3b09-a9b9-b6edba096967	8270	Krško
00050000-564f-3b09-5045-52c4f2d626b4	9263	Kuzma
00050000-564f-3b09-2f48-b76b9b853049	2318	Laporje
00050000-564f-3b09-ff9b-faf225efbde7	3270	Laško
00050000-564f-3b09-d9e3-459a105e57a0	1219	Laze v Tuhinju
00050000-564f-3b09-db95-b01c1d1b3878	2230	Lenart v Slovenskih goricah
00050000-564f-3b09-32e0-742fcf289f94	9220	Lendava/Lendva
00050000-564f-3b09-318b-9f4e130a3337	4248	Lesce
00050000-564f-3b09-ebfc-129b1e58dfb3	3261	Lesično
00050000-564f-3b09-0776-8003400d0fc6	8273	Leskovec pri Krškem
00050000-564f-3b09-cde2-54aeac1412c5	2372	Libeliče
00050000-564f-3b09-a24c-895d51c24d82	2341	Limbuš
00050000-564f-3b09-d650-8c7182312007	1270	Litija
00050000-564f-3b09-f914-cc7c4ce1ba61	3202	Ljubečna
00050000-564f-3b09-e880-173730c67b76	1000	Ljubljana 
00050000-564f-3b09-b31f-fa372af61644	1001	Ljubljana - poštni predali
00050000-564f-3b09-bd0f-664e184a544a	1231	Ljubljana - Črnuče
00050000-564f-3b09-6bc0-d9da5e2d95ad	1261	Ljubljana - Dobrunje
00050000-564f-3b09-8816-8bd4f99508c2	1260	Ljubljana - Polje
00050000-564f-3b09-112b-7e98ecdd0695	1210	Ljubljana - Šentvid
00050000-564f-3b09-efba-1131d55dab1f	1211	Ljubljana - Šmartno
00050000-564f-3b09-679e-4116556bad8c	3333	Ljubno ob Savinji
00050000-564f-3b09-7c2d-b6d2ffa4faa6	9240	Ljutomer
00050000-564f-3b09-91bc-d825841ab2f7	3215	Loče
00050000-564f-3b09-4160-07b230385a06	5231	Log pod Mangartom
00050000-564f-3b09-0426-e42b7eb076a5	1358	Log pri Brezovici
00050000-564f-3b09-7c67-957aa6e28f50	1370	Logatec
00050000-564f-3b09-ddc9-11c81ecf7ad1	1371	Logatec
00050000-564f-3b09-ef7c-a0c85125768f	1434	Loka pri Zidanem Mostu
00050000-564f-3b09-d3a7-680dc27384ce	3223	Loka pri Žusmu
00050000-564f-3b09-498a-7d74e36c8592	6219	Lokev
00050000-564f-3b09-7438-2c9acdcd7605	1318	Loški Potok
00050000-564f-3b09-0993-013d22924c50	2324	Lovrenc na Dravskem polju
00050000-564f-3b09-ec04-6f96534185dd	2344	Lovrenc na Pohorju
00050000-564f-3b09-36c5-efba8dd92dbe	3334	Luče
00050000-564f-3b09-1613-17cb691fc075	1225	Lukovica
00050000-564f-3b09-07a4-6942ed52e9cc	9202	Mačkovci
00050000-564f-3b09-37d2-4580edc34b20	2322	Majšperk
00050000-564f-3b09-1036-58c43c70f256	2321	Makole
00050000-564f-3b09-d766-f89735f93134	9243	Mala Nedelja
00050000-564f-3b09-e0ac-3b152f097af2	2229	Malečnik
00050000-564f-3b09-d15e-24a56d3d016a	6273	Marezige
00050000-564f-3b09-8985-9f31c563c985	2000	Maribor 
00050000-564f-3b09-2d8c-1aee2f21cbe7	2001	Maribor - poštni predali
00050000-564f-3b09-180f-c766e74f2743	2206	Marjeta na Dravskem polju
00050000-564f-3b09-f85e-a77c9eb0cebd	2281	Markovci
00050000-564f-3b09-53a9-5d8a1652984c	9221	Martjanci
00050000-564f-3b09-c2a3-545415d53b4b	6242	Materija
00050000-564f-3b09-d494-d8465736c912	4211	Mavčiče
00050000-564f-3b09-1667-64f50b465d82	1215	Medvode
00050000-564f-3b09-c62c-9ab5ee4023c7	1234	Mengeš
00050000-564f-3b09-ace8-75756c4c6ad5	8330	Metlika
00050000-564f-3b09-8fee-bc469dd0a06a	2392	Mežica
00050000-564f-3b09-76e0-83910397d25e	2204	Miklavž na Dravskem polju
00050000-564f-3b09-887b-bff2be6e3189	2275	Miklavž pri Ormožu
00050000-564f-3b09-bd77-72d266e0b55b	5291	Miren
00050000-564f-3b09-f9a0-0c760c37f00f	8233	Mirna
00050000-564f-3b09-776e-1c794593b0fd	8216	Mirna Peč
00050000-564f-3b09-016f-77602e64625c	2382	Mislinja
00050000-564f-3b09-e133-109fe2056827	4281	Mojstrana
00050000-564f-3b09-b11f-1d765b1d4b40	8230	Mokronog
00050000-564f-3b09-7c88-93aabdc0c63b	1251	Moravče
00050000-564f-3b09-5cae-74f24d20d46a	9226	Moravske Toplice
00050000-564f-3b09-866f-e436c5847987	5216	Most na Soči
00050000-564f-3b09-e4a0-b01bc156165f	1221	Motnik
00050000-564f-3b09-d174-a4a105e543e4	3330	Mozirje
00050000-564f-3b09-2973-49516ee47fa2	9000	Murska Sobota 
00050000-564f-3b09-7ec6-107e69411d75	9001	Murska Sobota - poštni predali
00050000-564f-3b09-96c0-3425fb98b1e1	2366	Muta
00050000-564f-3b09-fa82-15bb69bcda57	4202	Naklo
00050000-564f-3b09-2bdb-867c02d34c49	3331	Nazarje
00050000-564f-3b09-686f-dedaf8ff09a2	1357	Notranje Gorice
00050000-564f-3b09-4237-28eb28055626	3203	Nova Cerkev
00050000-564f-3b09-aa5c-cd11fdf986b0	5000	Nova Gorica 
00050000-564f-3b09-11c5-8f4bdd1b4e67	5001	Nova Gorica - poštni predali
00050000-564f-3b09-5f29-6b007a81da8d	1385	Nova vas
00050000-564f-3b09-f028-c1567264a658	8000	Novo mesto
00050000-564f-3b09-9953-e70717fd74ef	8001	Novo mesto - poštni predali
00050000-564f-3b09-36fb-b53d279780d9	6243	Obrov
00050000-564f-3b09-5b0a-56788a1b9f80	9233	Odranci
00050000-564f-3b09-f9cd-a0765e84106d	2317	Oplotnica
00050000-564f-3b09-e599-beafdfa05da8	2312	Orehova vas
00050000-564f-3b09-4176-dd62c38f766c	2270	Ormož
00050000-564f-3b09-d38f-5523397b3cc7	1316	Ortnek
00050000-564f-3b09-0ce1-d3801a60ed6d	1337	Osilnica
00050000-564f-3b09-ed9a-6e20405abacf	8222	Otočec
00050000-564f-3b09-4aed-0b55c961f280	2361	Ožbalt
00050000-564f-3b09-cce8-0de3c0c6d57a	2231	Pernica
00050000-564f-3b09-8a1b-b111de6df6e1	2211	Pesnica pri Mariboru
00050000-564f-3b09-6315-2e842158bbee	9203	Petrovci
00050000-564f-3b09-5ee8-bfcd10b5c73a	3301	Petrovče
00050000-564f-3b09-27ab-91464d8ef3c3	6330	Piran/Pirano
00050000-564f-3b09-9700-1a4aa531becd	8255	Pišece
00050000-564f-3b09-323e-4f1d56360ae1	6257	Pivka
00050000-564f-3b09-ecfe-7a443ef8f34c	6232	Planina
00050000-564f-3b09-225a-8177fab72222	3225	Planina pri Sevnici
00050000-564f-3b09-38f9-df8a67cb5c36	6276	Pobegi
00050000-564f-3b09-de09-eaa2978e0fb9	8312	Podbočje
00050000-564f-3b09-3093-fc0302ae1382	5243	Podbrdo
00050000-564f-3b09-f76c-464831f0005c	3254	Podčetrtek
00050000-564f-3b09-be4b-1209ab063817	2273	Podgorci
00050000-564f-3b09-ea84-461885876abe	6216	Podgorje
00050000-564f-3b09-1617-7e087a6443b1	2381	Podgorje pri Slovenj Gradcu
00050000-564f-3b09-6c70-3a267460b6d7	6244	Podgrad
00050000-564f-3b09-c3b5-b9b4018909a7	1414	Podkum
00050000-564f-3b09-6db4-918a046b0d64	2286	Podlehnik
00050000-564f-3b09-a356-daf161f8cd7b	5272	Podnanos
00050000-564f-3b09-dda9-ef2f3565e1c1	4244	Podnart
00050000-564f-3b09-77cd-82023c6cccab	3241	Podplat
00050000-564f-3b09-ddfa-909cca03ad16	3257	Podsreda
00050000-564f-3b09-00bd-12c892f4043a	2363	Podvelka
00050000-564f-3b09-f29a-7abc998602ca	2208	Pohorje
00050000-564f-3b09-aca5-94d8fb11d7df	2257	Polenšak
00050000-564f-3b09-7236-ff3762cb276f	1355	Polhov Gradec
00050000-564f-3b09-e7cb-2e8e4eb6dae3	4223	Poljane nad Škofjo Loko
00050000-564f-3b09-82c4-fe061b2506d4	2319	Poljčane
00050000-564f-3b09-8946-f7a3a927466c	1272	Polšnik
00050000-564f-3b09-2665-6529f732887c	3313	Polzela
00050000-564f-3b09-4670-4de8dbea1f12	3232	Ponikva
00050000-564f-3b09-d1fc-8564da13973e	6320	Portorož/Portorose
00050000-564f-3b09-ea79-5b6b5128e5d0	6230	Postojna
00050000-564f-3b09-5070-f9f7ccdf97f3	2331	Pragersko
00050000-564f-3b09-dbf0-816b0253feeb	3312	Prebold
00050000-564f-3b09-c206-8708a2fbbe4b	4205	Preddvor
00050000-564f-3b09-6551-516e7578077f	6255	Prem
00050000-564f-3b09-ffd2-ac69798613a4	1352	Preserje
00050000-564f-3b0a-43da-dd4e62e97f3d	6258	Prestranek
00050000-564f-3b0a-bdef-6acc8d19909d	2391	Prevalje
00050000-564f-3b0a-5d56-9d98950d0cb1	3262	Prevorje
00050000-564f-3b0a-5df0-2b3f6c4b73dc	1276	Primskovo 
00050000-564f-3b0a-6a16-ecb533e5f785	3253	Pristava pri Mestinju
00050000-564f-3b0a-ee41-15a151c940ba	9207	Prosenjakovci/Partosfalva
00050000-564f-3b0a-4bfb-a5ae577ec03e	5297	Prvačina
00050000-564f-3b0a-4abc-2a39f2b24907	2250	Ptuj
00050000-564f-3b0a-65ba-480ea9788ab9	2323	Ptujska Gora
00050000-564f-3b0a-dc65-c3b75351fbcb	9201	Puconci
00050000-564f-3b0a-eeb1-cd0083749d67	2327	Rače
00050000-564f-3b0a-1e29-abe492a68559	1433	Radeče
00050000-564f-3b0a-b392-197c7cb56c16	9252	Radenci
00050000-564f-3b0a-9a34-15794000d3c3	2360	Radlje ob Dravi
00050000-564f-3b0a-dae3-eae4aec47afe	1235	Radomlje
00050000-564f-3b0a-1151-8af4ba9b44cb	4240	Radovljica
00050000-564f-3b0a-762a-45678d66bfb2	8274	Raka
00050000-564f-3b0a-c9b2-5d160cc7cab9	1381	Rakek
00050000-564f-3b0a-3693-9a394987d69f	4283	Rateče - Planica
00050000-564f-3b0a-4314-37b26fbfce86	2390	Ravne na Koroškem
00050000-564f-3b0a-06e6-0873bccd5908	9246	Razkrižje
00050000-564f-3b0a-f392-63885380edfb	3332	Rečica ob Savinji
00050000-564f-3b0a-720f-54a985c516e2	5292	Renče
00050000-564f-3b0a-8721-b021e9d36e48	1310	Ribnica
00050000-564f-3b0a-0de3-67a6965a145e	2364	Ribnica na Pohorju
00050000-564f-3b0a-5a8c-9e18340b3d25	3272	Rimske Toplice
00050000-564f-3b0a-dd30-18e16ec31e77	1314	Rob
00050000-564f-3b0a-7bac-177fb7776163	5215	Ročinj
00050000-564f-3b0a-b8a0-a3d6c817edfb	3250	Rogaška Slatina
00050000-564f-3b0a-31b2-0b0dd004548a	9262	Rogašovci
00050000-564f-3b0a-054c-d94fdfa4612e	3252	Rogatec
00050000-564f-3b0a-1f03-78c57c87615f	1373	Rovte
00050000-564f-3b0a-aa9d-b8cd869a02d0	2342	Ruše
00050000-564f-3b0a-4c8e-0c6fb362496a	1282	Sava
00050000-564f-3b0a-dfc9-c200f939444c	6333	Sečovlje/Sicciole
00050000-564f-3b0a-869c-e40549a75d61	4227	Selca
00050000-564f-3b0a-0991-7fe757d87c52	2352	Selnica ob Dravi
00050000-564f-3b0a-60ff-dfcea5236de3	8333	Semič
00050000-564f-3b0a-4d7c-b0765af418c5	8281	Senovo
00050000-564f-3b0a-f680-e21c16e34d2d	6224	Senožeče
00050000-564f-3b0a-708f-34f90b5210b4	8290	Sevnica
00050000-564f-3b0a-27c0-24c73809fcd5	6210	Sežana
00050000-564f-3b0a-361e-8623d91ecbf7	2214	Sladki Vrh
00050000-564f-3b0a-9383-0e23e2cfe195	5283	Slap ob Idrijci
00050000-564f-3b0a-313b-41d4a09945cd	2380	Slovenj Gradec
00050000-564f-3b0a-87cb-39bfabff27ea	2310	Slovenska Bistrica
00050000-564f-3b0a-7a3f-8fa8a19a1bab	3210	Slovenske Konjice
00050000-564f-3b0a-93b0-05f020f11323	1216	Smlednik
00050000-564f-3b0a-52b8-2fa30fe3f599	5232	Soča
00050000-564f-3b0a-4482-b7443f489667	1317	Sodražica
00050000-564f-3b0a-abcf-dc50080e6752	3335	Solčava
00050000-564f-3b0a-cc05-4250c8d8f7f9	5250	Solkan
00050000-564f-3b0a-7582-302c3dc85753	4229	Sorica
00050000-564f-3b0a-b701-5af6e589c074	4225	Sovodenj
00050000-564f-3b0a-6ba0-252e358c53fd	5281	Spodnja Idrija
00050000-564f-3b0a-f634-a7530da41f97	2241	Spodnji Duplek
00050000-564f-3b0a-471f-27554a2eff4d	9245	Spodnji Ivanjci
00050000-564f-3b0a-3ad2-b0201bf0920d	2277	Središče ob Dravi
00050000-564f-3b0a-3a87-60de9ef3fdd6	4267	Srednja vas v Bohinju
00050000-564f-3b0a-b158-c062b8d2ce5c	8256	Sromlje 
00050000-564f-3b0a-6ad2-11fddc4c230f	5224	Srpenica
00050000-564f-3b0a-687c-f69e7566add7	1242	Stahovica
00050000-564f-3b0a-4072-b59f8d226a06	1332	Stara Cerkev
00050000-564f-3b0a-e695-eadb1303d922	8342	Stari trg ob Kolpi
00050000-564f-3b0a-6ef9-2fa227de6e00	1386	Stari trg pri Ložu
00050000-564f-3b0a-a10b-45cdecc73dde	2205	Starše
00050000-564f-3b0a-eddf-70448cff56ad	2289	Stoperce
00050000-564f-3b0a-0397-149cf88e0781	8322	Stopiče
00050000-564f-3b0a-2247-04a7d0eb5a29	3206	Stranice
00050000-564f-3b0a-d66f-b5d10479b214	8351	Straža
00050000-564f-3b0a-b8ea-7ec1ced45007	1313	Struge
00050000-564f-3b0a-8b6a-f47125ba8052	8293	Studenec
00050000-564f-3b0a-6c68-58ffa51fa503	8331	Suhor
00050000-564f-3b0a-2630-d6961242bf97	2233	Sv. Ana v Slovenskih goricah
00050000-564f-3b0a-5ae9-a5ef11eacc7b	2235	Sv. Trojica v Slovenskih goricah
00050000-564f-3b0a-b49b-53fe1fb8166c	2353	Sveti Duh na Ostrem Vrhu
00050000-564f-3b0a-251b-91bea147125f	9244	Sveti Jurij ob Ščavnici
00050000-564f-3b0a-7106-17ba5958e069	3264	Sveti Štefan
00050000-564f-3b0a-788e-1ee1795a0655	2258	Sveti Tomaž
00050000-564f-3b0a-ad09-e9f7f54f2953	9204	Šalovci
00050000-564f-3b0a-aae4-0199acb3bb18	5261	Šempas
00050000-564f-3b0a-a38d-80a5db73c781	5290	Šempeter pri Gorici
00050000-564f-3b0a-44b3-2eb78096086d	3311	Šempeter v Savinjski dolini
00050000-564f-3b0a-2591-d28a2eb5d96d	4208	Šenčur
00050000-564f-3b0a-5690-d8bb1291cbb4	2212	Šentilj v Slovenskih goricah
00050000-564f-3b0a-ba7c-6e6941ea2512	8297	Šentjanž
00050000-564f-3b0a-55fb-b4cb004be374	2373	Šentjanž pri Dravogradu
00050000-564f-3b0a-eef1-b42b425a7466	8310	Šentjernej
00050000-564f-3b0a-fd03-e729f2c4f825	3230	Šentjur
00050000-564f-3b0a-880e-9d16e4d737f4	3271	Šentrupert
00050000-564f-3b0a-8b71-457d925dcb9d	8232	Šentrupert
00050000-564f-3b0a-f57c-c771ea4a281a	1296	Šentvid pri Stični
00050000-564f-3b0a-754e-e0eb176bfc13	8275	Škocjan
00050000-564f-3b0a-49fa-03132be41b22	6281	Škofije
00050000-564f-3b0a-2209-dd5159795981	4220	Škofja Loka
00050000-564f-3b0a-2df7-af84a10bb212	3211	Škofja vas
00050000-564f-3b0a-2b10-9ad16062dddf	1291	Škofljica
00050000-564f-3b0a-797b-c120ea7f4dcb	6274	Šmarje
00050000-564f-3b0a-0d51-a80a461eb762	1293	Šmarje - Sap
00050000-564f-3b0a-c057-7721cce10453	3240	Šmarje pri Jelšah
00050000-564f-3b0a-3c9d-5e667cd97b67	8220	Šmarješke Toplice
00050000-564f-3b0a-a79b-dc40216ecdd8	2315	Šmartno na Pohorju
00050000-564f-3b0a-694a-acb182aebb3c	3341	Šmartno ob Dreti
00050000-564f-3b0a-8534-cde7951dfbc6	3327	Šmartno ob Paki
00050000-564f-3b0a-3a24-576368a9db8f	1275	Šmartno pri Litiji
00050000-564f-3b0a-bf16-4eaf0a9f16ad	2383	Šmartno pri Slovenj Gradcu
00050000-564f-3b0a-28d1-a583582ffabb	3201	Šmartno v Rožni dolini
00050000-564f-3b0a-e8c1-8eb8db61e9d0	3325	Šoštanj
00050000-564f-3b0a-5c3c-902474db7380	6222	Štanjel
00050000-564f-3b0a-5026-51edf35bb55d	3220	Štore
00050000-564f-3b0a-4cda-f2d09b3dd950	3304	Tabor
00050000-564f-3b0a-7e16-1b27ac312852	3221	Teharje
00050000-564f-3b0a-6a08-fea283e5522e	9251	Tišina
00050000-564f-3b0a-d2da-1d466fe0f939	5220	Tolmin
00050000-564f-3b0a-6b9a-62c7d59c4555	3326	Topolšica
00050000-564f-3b0a-ab3f-56357db8c788	2371	Trbonje
00050000-564f-3b0a-c012-12fed5b9ccfd	1420	Trbovlje
00050000-564f-3b0a-eb89-9e7f8108031d	8231	Trebelno 
00050000-564f-3b0a-510e-578e9041802b	8210	Trebnje
00050000-564f-3b0a-d0ba-9bac53fd1c67	5252	Trnovo pri Gorici
00050000-564f-3b0a-7ae5-d62ed4ddbcdd	2254	Trnovska vas
00050000-564f-3b0a-758e-bb0bb312b831	1222	Trojane
00050000-564f-3b0a-65ea-3936ba38f5f9	1236	Trzin
00050000-564f-3b0a-8d4e-650ffbbf56de	4290	Tržič
00050000-564f-3b0a-3545-f4827b4e59d9	8295	Tržišče
00050000-564f-3b0a-c72c-bc82341fc666	1311	Turjak
00050000-564f-3b0a-7ac5-c92238f049b4	9224	Turnišče
00050000-564f-3b0a-0244-8dcff1312a3e	8323	Uršna sela
00050000-564f-3b0a-debb-718b54c8526b	1252	Vače
00050000-564f-3b0a-7480-588de3f4b0a3	3320	Velenje 
00050000-564f-3b0a-9018-c0f657bacfd9	3322	Velenje - poštni predali
00050000-564f-3b0a-1d74-848bcac900d2	8212	Velika Loka
00050000-564f-3b0a-1426-e26647d388f7	2274	Velika Nedelja
00050000-564f-3b0a-2137-fcb5d0acd23e	9225	Velika Polana
00050000-564f-3b0a-513f-33902aaae49d	1315	Velike Lašče
00050000-564f-3b0a-1e45-f1488c787f03	8213	Veliki Gaber
00050000-564f-3b0a-cc3c-d0ad784ce51d	9241	Veržej
00050000-564f-3b0a-4af8-14f6b7c856c0	1312	Videm - Dobrepolje
00050000-564f-3b0a-df4a-36e95ecfd988	2284	Videm pri Ptuju
00050000-564f-3b0a-b77c-48f6e8a092d5	8344	Vinica
00050000-564f-3b0a-314a-3b110ade64e7	5271	Vipava
00050000-564f-3b0a-af3c-1d8a8b1b622a	4212	Visoko
00050000-564f-3b0a-17dd-452f958619da	1294	Višnja Gora
00050000-564f-3b0a-7d6d-452cbf4b4ea1	3205	Vitanje
00050000-564f-3b0a-053a-b0071692aab1	2255	Vitomarci
00050000-564f-3b0a-f2dd-35d38a428908	1217	Vodice
00050000-564f-3b0a-4b32-c778726cd1de	3212	Vojnik\t
00050000-564f-3b0a-b4cd-86e742236c2b	5293	Volčja Draga
00050000-564f-3b0a-1f62-5d24e3f087d7	2232	Voličina
00050000-564f-3b0a-e2af-77d4ec7b8ee3	3305	Vransko
00050000-564f-3b0a-42d3-77ae31777697	6217	Vremski Britof
00050000-564f-3b0a-dbde-8927e8b9a32a	1360	Vrhnika
00050000-564f-3b0a-c276-b08bef42bded	2365	Vuhred
00050000-564f-3b0a-18c4-c675ff486dba	2367	Vuzenica
00050000-564f-3b0a-a8d6-c6bbe07c87e8	8292	Zabukovje 
00050000-564f-3b0a-1903-5abdef5f82d0	1410	Zagorje ob Savi
00050000-564f-3b0a-27fd-066a21a65013	1303	Zagradec
00050000-564f-3b0a-dae7-16e2027f09e8	2283	Zavrč
00050000-564f-3b0a-2c84-423e76d758f4	8272	Zdole 
00050000-564f-3b0a-f8d1-d810ae13b847	4201	Zgornja Besnica
00050000-564f-3b0a-3ee1-d4af13c7c480	2242	Zgornja Korena
00050000-564f-3b0a-68e9-e420eb12f609	2201	Zgornja Kungota
00050000-564f-3b0a-0e6f-e0dc0d9473c8	2316	Zgornja Ložnica
00050000-564f-3b0a-2c4f-34489e0691e0	2314	Zgornja Polskava
00050000-564f-3b0a-06c0-3da7d525bbcd	2213	Zgornja Velka
00050000-564f-3b0a-bef6-fe2add994a76	4247	Zgornje Gorje
00050000-564f-3b0a-d4ad-a6a7f86c5add	4206	Zgornje Jezersko
00050000-564f-3b0a-8376-bee5302cc68f	2285	Zgornji Leskovec
00050000-564f-3b0a-0209-944f07dd5094	1432	Zidani Most
00050000-564f-3b0a-1cc3-cb201f7e7fb5	3214	Zreče
00050000-564f-3b0a-5d9b-04affa132d07	4209	Žabnica
00050000-564f-3b0a-a06f-80585ed8ab48	3310	Žalec
00050000-564f-3b0a-266e-4b5d16f9960c	4228	Železniki
00050000-564f-3b0a-7b1c-65a0a36fd528	2287	Žetale
00050000-564f-3b0a-7445-45af8f8e68dd	4226	Žiri
00050000-564f-3b0a-04ba-fcb4b942f0a7	4274	Žirovnica
00050000-564f-3b0a-b63b-ee6ad4b8c02c	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 28950840)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 28950416)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 28950163)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564f-3b0c-bcc6-86aa8a668d68	00080000-564f-3b0c-8d05-f8c5007dc986	\N	00040000-564f-3b0a-391e-ad24d726fe83	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564f-3b0c-abf2-f94553c79501	00080000-564f-3b0c-8d05-f8c5007dc986	\N	00040000-564f-3b0a-391e-ad24d726fe83	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564f-3b0c-9024-3e126d0d633b	00080000-564f-3b0c-d168-519355860687	\N	00040000-564f-3b0a-391e-ad24d726fe83	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 28950308)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564f-3b0a-271d-fe1bbd1c5e7b	novo leto	1	1	\N	t
00430000-564f-3b0a-f117-a1a47469b4bc	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564f-3b0a-155f-c2c27c94d116	dan upora proti okupatorju	27	4	\N	t
00430000-564f-3b0a-e285-d5228fa5bb74	praznik dela	1	5	\N	t
00430000-564f-3b0a-e382-a7aed6c06ff1	praznik dela	2	5	\N	t
00430000-564f-3b0a-104a-6431ed8e08cd	dan Primoža Trubarja	8	6	\N	f
00430000-564f-3b0a-5ee1-0dc53fbb807b	dan državnosti	25	6	\N	t
00430000-564f-3b0a-77cb-dde13a444bbb	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564f-3b0a-0545-97da7fe7cc7e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564f-3b0a-79be-57fd46667a33	dan suverenosti	25	10	\N	f
00430000-564f-3b0a-f7d8-f684d4e4c013	dan spomina na mrtve	1	11	\N	t
00430000-564f-3b0a-d731-57f677c19c43	dan Rudolfa Maistra	23	11	\N	f
00430000-564f-3b0a-058a-029edb47e7ce	božič	25	12	\N	t
00430000-564f-3b0a-caaa-217454dc2ca0	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564f-3b0a-2e26-b04715464564	Marijino vnebovzetje	15	8	\N	t
00430000-564f-3b0a-2de9-9833432f201c	dan reformacije	31	10	\N	t
00430000-564f-3b0a-2331-e2e632d6caad	velikonočna nedelja	27	3	2016	t
00430000-564f-3b0a-5467-69c715b38c2b	velikonočna nedelja	16	4	2017	t
00430000-564f-3b0a-8b8c-d21aa50fe009	velikonočna nedelja	1	4	2018	t
00430000-564f-3b0a-998c-a2e9eff19d27	velikonočna nedelja	21	4	2019	t
00430000-564f-3b0a-bcc3-13736850b776	velikonočna nedelja	12	4	2020	t
00430000-564f-3b0a-d9e1-0d49a7b2db0c	velikonočna nedelja	4	4	2021	t
00430000-564f-3b0a-4947-60a4d2ffaa28	velikonočna nedelja	17	4	2022	t
00430000-564f-3b0a-e05c-c74fff18c998	velikonočna nedelja	9	4	2023	t
00430000-564f-3b0a-b8e9-ea047fc48edd	velikonočna nedelja	31	3	2024	t
00430000-564f-3b0a-28c6-ed7eb6b3061b	velikonočna nedelja	20	4	2025	t
00430000-564f-3b0a-f3e8-d050b0991937	velikonočna nedelja	5	4	2026	t
00430000-564f-3b0a-ec35-31aff65af8db	velikonočna nedelja	28	3	2027	t
00430000-564f-3b0a-8956-baa05e6b14de	velikonočna nedelja	16	4	2028	t
00430000-564f-3b0a-d015-062cbb13ea60	velikonočna nedelja	1	4	2029	t
00430000-564f-3b0a-4810-c65829e1b6db	velikonočna nedelja	21	4	2030	t
00430000-564f-3b0a-7f83-c67945b1a4cb	velikonočni ponedeljek	28	3	2016	t
00430000-564f-3b0a-8b45-e9f580ebc2fa	velikonočni ponedeljek	17	4	2017	t
00430000-564f-3b0a-c51f-07ac51a366ff	velikonočni ponedeljek	2	4	2018	t
00430000-564f-3b0a-549b-cc647636f3f2	velikonočni ponedeljek	22	4	2019	t
00430000-564f-3b0a-7fc4-db8edf9b3b6b	velikonočni ponedeljek	13	4	2020	t
00430000-564f-3b0a-75cb-96b690ad6f22	velikonočni ponedeljek	5	4	2021	t
00430000-564f-3b0a-6378-a325bbb92fba	velikonočni ponedeljek	18	4	2022	t
00430000-564f-3b0a-f177-920774503351	velikonočni ponedeljek	10	4	2023	t
00430000-564f-3b0a-e7bd-e34f2ff8e08f	velikonočni ponedeljek	1	4	2024	t
00430000-564f-3b0a-4c09-21e186d14e40	velikonočni ponedeljek	21	4	2025	t
00430000-564f-3b0a-015e-9d2ef9f6e083	velikonočni ponedeljek	6	4	2026	t
00430000-564f-3b0a-2d61-52574e2ef1bc	velikonočni ponedeljek	29	3	2027	t
00430000-564f-3b0a-d8e6-53ce5ef5abb3	velikonočni ponedeljek	17	4	2028	t
00430000-564f-3b0a-5611-38cc105d500b	velikonočni ponedeljek	2	4	2029	t
00430000-564f-3b0a-ec63-5d923ae447e2	velikonočni ponedeljek	22	4	2030	t
00430000-564f-3b0a-237e-7cc07a924521	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564f-3b0a-347c-a609b08cfb28	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564f-3b0a-4bd8-88f4288ed37b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564f-3b0a-03eb-4c5a8299d902	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564f-3b0a-c6e2-9dd5e987718c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564f-3b0a-b94a-9c31443eee98	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564f-3b0a-0b90-9a3759921671	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564f-3b0a-819a-1ba712001183	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564f-3b0a-5756-d2ce0ab9eaf0	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564f-3b0a-bd4f-89d253ed70fc	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564f-3b0a-a825-4154eddf3b32	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564f-3b0a-6273-a68e9e7d46ad	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564f-3b0a-d4c2-d4d7c57eaaac	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564f-3b0a-0551-425e878fd488	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564f-3b0a-04c6-2b2a9a6dba3b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 28950268)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 28950280)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 28950428)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 28950854)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 28950864)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564f-3b0d-a9a6-52e67c9cbc9e	00080000-564f-3b0c-8aec-9b22e7f3add1	0987	AK
00190000-564f-3b0d-4554-557432913e15	00080000-564f-3b0c-d168-519355860687	0989	AK
00190000-564f-3b0d-f999-455684c0e4ea	00080000-564f-3b0c-a675-aeee158142cc	0986	AK
00190000-564f-3b0d-f859-d4cb3867daae	00080000-564f-3b0c-a8f8-21994fdb613a	0984	AK
00190000-564f-3b0d-14df-8a1b4f5d09c9	00080000-564f-3b0c-1e47-f9e42972847f	0983	AK
00190000-564f-3b0d-33a7-1180440b7e95	00080000-564f-3b0c-aea4-351e3bbf2ebc	0982	AK
00190000-564f-3b0e-d758-2ef89841e0a7	00080000-564f-3b0e-5cf8-cb13828cf39e	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 28950763)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564f-3b0d-f9f4-87d08d4e2bd4	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 28950872)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 28950457)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564f-3b0c-8b28-14d0eecf240f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564f-3b0c-0f8f-18d23db4f6b4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564f-3b0c-14fe-5b18c8d77873	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564f-3b0c-5484-4ae13f65e405	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564f-3b0c-2914-4fe082cf8fa5	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564f-3b0c-b959-ce0b79b7bafb	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564f-3b0c-65d4-46ea35ca9084	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 28950401)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 28950391)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 28950602)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 28950532)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 28950242)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 28950003)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564f-3b0e-5cf8-cb13828cf39e	00010000-564f-3b0b-8e86-cdddf5be5276	2015-11-20 16:23:58	INS	a:0:{}
2	App\\Entity\\Option	00000000-564f-3b0e-473e-140bc094e02c	00010000-564f-3b0b-8e86-cdddf5be5276	2015-11-20 16:23:58	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564f-3b0e-d758-2ef89841e0a7	00010000-564f-3b0b-8e86-cdddf5be5276	2015-11-20 16:23:58	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 28950470)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 28950041)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564f-3b0a-4fdd-70fb0e3d3e15	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564f-3b0a-7518-1b3c6e035042	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564f-3b0a-95f4-0893e5dbb80d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564f-3b0a-ee19-5fb0b40b0892	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564f-3b0a-d2fc-f44d089f5eea	planer	Planer dogodkov v koledarju	t
00020000-564f-3b0a-77c0-1491392f51ee	kadrovska	Kadrovska služba	t
00020000-564f-3b0b-3df0-d3608434ca6b	arhivar	Ažuriranje arhivalij	t
00020000-564f-3b0b-4ecc-d74dffa0368d	igralec	Igralec	t
00020000-564f-3b0b-31be-eccdbe21297e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564f-3b0c-0bef-dc4c97e869a8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564f-3b0c-920e-fefee23daca5	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-5a0d-bdc84ef8dee5	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-d597-e6cb65b12263	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-6490-74a94779e22c	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-2fba-a658397f2d70	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-79d8-1b79f59c015c	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-cf56-915dc1c02bd4	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-f244-eb7b82812140	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-9dc8-28a30dd8f67a	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-9475-65adbfee7a54	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-1742-c3c576b521d9	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-d94c-d071c8dfe3a7	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-1520-1ae5407e5af4	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-f386-112d8e3bcd2c	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-7df6-59572d171cc2	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-0346-3b9397c65b11	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-564f-3b0c-0e2d-ea100c3e489f	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3099 (class 0 OID 28950025)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564f-3b0b-d0ca-b413ca2fd329	00020000-564f-3b0a-95f4-0893e5dbb80d
00010000-564f-3b0b-8e86-cdddf5be5276	00020000-564f-3b0a-95f4-0893e5dbb80d
00010000-564f-3b0c-401f-d1abfc1964c6	00020000-564f-3b0c-0bef-dc4c97e869a8
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-920e-fefee23daca5
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-2fba-a658397f2d70
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-9dc8-28a30dd8f67a
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-1742-c3c576b521d9
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-f386-112d8e3bcd2c
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-0346-3b9397c65b11
00010000-564f-3b0c-ddc1-0d5775202d1f	00020000-564f-3b0c-d597-e6cb65b12263
00010000-564f-3b0c-c6b7-3c0989e88841	00020000-564f-3b0c-920e-fefee23daca5
00010000-564f-3b0c-c6b7-3c0989e88841	00020000-564f-3b0c-5a0d-bdc84ef8dee5
00010000-564f-3b0c-c6b7-3c0989e88841	00020000-564f-3b0c-d597-e6cb65b12263
00010000-564f-3b0c-c6b7-3c0989e88841	00020000-564f-3b0c-6490-74a94779e22c
00010000-564f-3b0c-3ad0-8b8493255add	00020000-564f-3b0c-920e-fefee23daca5
00010000-564f-3b0c-3ad0-8b8493255add	00020000-564f-3b0c-5a0d-bdc84ef8dee5
00010000-564f-3b0c-3ad0-8b8493255add	00020000-564f-3b0c-d597-e6cb65b12263
00010000-564f-3b0c-3ad0-8b8493255add	00020000-564f-3b0c-6490-74a94779e22c
00010000-564f-3b0c-3ad0-8b8493255add	00020000-564f-3b0c-1742-c3c576b521d9
00010000-564f-3b0c-1e43-985b3e4baee4	00020000-564f-3b0c-5a0d-bdc84ef8dee5
00010000-564f-3b0c-1e43-985b3e4baee4	00020000-564f-3b0c-79d8-1b79f59c015c
00010000-564f-3b0c-1e43-985b3e4baee4	00020000-564f-3b0c-9475-65adbfee7a54
00010000-564f-3b0c-1e43-985b3e4baee4	00020000-564f-3b0c-d94c-d071c8dfe3a7
00010000-564f-3b0c-1e43-985b3e4baee4	00020000-564f-3b0c-1742-c3c576b521d9
00010000-564f-3b0c-1e43-985b3e4baee4	00020000-564f-3b0c-7df6-59572d171cc2
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-5a0d-bdc84ef8dee5
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-79d8-1b79f59c015c
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-f244-eb7b82812140
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-9475-65adbfee7a54
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-d94c-d071c8dfe3a7
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-1742-c3c576b521d9
00010000-564f-3b0c-5c71-5a622be609b1	00020000-564f-3b0c-7df6-59572d171cc2
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-5a0d-bdc84ef8dee5
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-d597-e6cb65b12263
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-79d8-1b79f59c015c
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-cf56-915dc1c02bd4
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-f244-eb7b82812140
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-2fba-a658397f2d70
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-9475-65adbfee7a54
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-d94c-d071c8dfe3a7
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-1742-c3c576b521d9
00010000-564f-3b0c-51bf-df9a73a8deee	00020000-564f-3b0c-7df6-59572d171cc2
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-920e-fefee23daca5
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-6490-74a94779e22c
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-2fba-a658397f2d70
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-9dc8-28a30dd8f67a
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-1742-c3c576b521d9
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-f386-112d8e3bcd2c
00010000-564f-3b0c-2cf0-299206ecf51f	00020000-564f-3b0c-0346-3b9397c65b11
00010000-564f-3b0c-45ba-b5f57c546ee1	00020000-564f-3b0c-0e2d-ea100c3e489f
\.


--
-- TOC entry 3144 (class 0 OID 28950484)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 28950422)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 28950368)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564f-3b0c-935c-5c10aad7df6a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564f-3b0c-9b8c-1ed6b0c729a4	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564f-3b0c-2591-945ab42a54a9	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 28949990)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564f-3b0a-f763-5ad32948b769	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564f-3b0a-d8bc-b784c513ea85	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564f-3b0a-8ae2-726b4d501185	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564f-3b0a-e73b-3089477a7446	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564f-3b0a-31ae-d4b605d83d30	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 28949982)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564f-3b0a-09bc-1fbe9a4f1756	00230000-564f-3b0a-e73b-3089477a7446	popa
00240000-564f-3b0a-da62-a439bfe9ef1e	00230000-564f-3b0a-e73b-3089477a7446	oseba
00240000-564f-3b0a-ddd7-4cf1f3a11e62	00230000-564f-3b0a-e73b-3089477a7446	tippopa
00240000-564f-3b0a-885e-07f13e6d63ea	00230000-564f-3b0a-e73b-3089477a7446	organizacijskaenota
00240000-564f-3b0a-e8bf-abcda0c40094	00230000-564f-3b0a-e73b-3089477a7446	sezona
00240000-564f-3b0a-ccee-ff60cd9ee9de	00230000-564f-3b0a-e73b-3089477a7446	tipvaje
00240000-564f-3b0a-6fe3-7574d5ab86a2	00230000-564f-3b0a-d8bc-b784c513ea85	prostor
00240000-564f-3b0a-9f63-3b63b4b57970	00230000-564f-3b0a-e73b-3089477a7446	besedilo
00240000-564f-3b0a-9467-ddf2570db282	00230000-564f-3b0a-e73b-3089477a7446	uprizoritev
00240000-564f-3b0a-f5f4-de80cd8be476	00230000-564f-3b0a-e73b-3089477a7446	funkcija
00240000-564f-3b0a-9a4c-bfd60ccacc4c	00230000-564f-3b0a-e73b-3089477a7446	tipfunkcije
00240000-564f-3b0a-7fd4-475ebc180882	00230000-564f-3b0a-e73b-3089477a7446	alternacija
00240000-564f-3b0a-02e6-bce006647d97	00230000-564f-3b0a-f763-5ad32948b769	pogodba
00240000-564f-3b0a-49be-6146b65c9bec	00230000-564f-3b0a-e73b-3089477a7446	zaposlitev
00240000-564f-3b0a-735a-a99df3321d14	00230000-564f-3b0a-e73b-3089477a7446	zvrstuprizoritve
00240000-564f-3b0a-a5fc-3e7f6e9f0e1a	00230000-564f-3b0a-f763-5ad32948b769	programdela
00240000-564f-3b0a-b778-9c1267e882ef	00230000-564f-3b0a-e73b-3089477a7446	zapis
\.


--
-- TOC entry 3093 (class 0 OID 28949977)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
18f702f7-9f31-4f5c-bfc3-6c8c961ef9ff	00240000-564f-3b0a-09bc-1fbe9a4f1756	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 28950549)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564f-3b0d-cf8b-33262942287a	000e0000-564f-3b0d-286f-5964d21285fe	00080000-564f-3b0c-8d05-f8c5007dc986	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564f-3b0a-6cab-cb44d227b614
00270000-564f-3b0d-4e7b-f79bf3fe9394	000e0000-564f-3b0d-286f-5964d21285fe	00080000-564f-3b0c-8d05-f8c5007dc986	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564f-3b0a-6cab-cb44d227b614
\.


--
-- TOC entry 3109 (class 0 OID 28950125)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 28950378)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564f-3b0d-ce75-38123b5141be	00180000-564f-3b0d-df42-65435fddb882	000c0000-564f-3b0d-e137-992bda5789c8	00090000-564f-3b0c-8806-3df9cb099e73	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564f-3b0d-2163-1b9ce997465f	00180000-564f-3b0d-df42-65435fddb882	000c0000-564f-3b0d-1b03-b197f8bf18f7	00090000-564f-3b0c-4b55-e7626bebbb71	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564f-3b0d-9683-2efb3806b852	00180000-564f-3b0d-df42-65435fddb882	000c0000-564f-3b0d-21fa-e6a0a7d7870a	00090000-564f-3b0c-34aa-56ef0eb30f79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564f-3b0d-77f1-0ee540dc98f5	00180000-564f-3b0d-df42-65435fddb882	000c0000-564f-3b0d-bdd2-0aa4812f259f	00090000-564f-3b0c-0bc8-e383f820f9d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564f-3b0d-1ddf-eb4cf512a42e	00180000-564f-3b0d-df42-65435fddb882	000c0000-564f-3b0d-6c69-e9596b710b0f	00090000-564f-3b0c-0014-e7f4e9c631b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564f-3b0d-40ae-e421c615c340	00180000-564f-3b0d-a135-086be0644eb3	\N	00090000-564f-3b0c-0014-e7f4e9c631b1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564f-3b0d-fa11-0b053f7a6f08	00180000-564f-3b0d-a135-086be0644eb3	\N	00090000-564f-3b0c-4b55-e7626bebbb71	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 28950590)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564f-3b0a-a7ac-6d46d0c4534a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564f-3b0a-c08c-ec48f2f2bf97	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564f-3b0a-d7f5-be0f54bdd21c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564f-3b0a-6ef5-e50d752acabe	04	Režija	Režija	Režija	umetnik	30
000f0000-564f-3b0a-1f8e-4894b43e1b45	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564f-3b0a-5a9d-20c8a8d3c9cc	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564f-3b0a-e89c-9ba21f11d8b2	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564f-3b0a-3b29-e847aa51bb60	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564f-3b0a-4a79-426d3ce64df8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564f-3b0a-254e-cbb15fc400ea	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564f-3b0a-61ee-21fd657fac64	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564f-3b0a-a339-a1e410fdc33b	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564f-3b0a-245d-376b68d00d2a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564f-3b0a-d24d-0c196bf39f14	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564f-3b0a-5aa4-0026dd53f118	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564f-3b0a-a13d-c6a03f22b1fc	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564f-3b0a-6164-d0a7f94273e6	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564f-3b0a-6433-9b9048c9f911	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 28950076)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564f-3b0c-057f-23292a4ba805	0001	šola	osnovna ali srednja šola
00400000-564f-3b0c-51a9-da1ad0ffc41f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564f-3b0c-0e8a-4500ee012310	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 28950883)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564f-3b0a-b430-0ac653935499	01	Velika predstava	f	1.00	1.00
002b0000-564f-3b0a-cb37-a45550577d2b	02	Mala predstava	f	0.50	0.50
002b0000-564f-3b0a-9c45-fc78e18e02a7	03	Mala koprodukcija	t	0.40	1.00
002b0000-564f-3b0a-0db9-6013a5e8bb10	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564f-3b0a-7a05-ff073e72552f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 28950358)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564f-3b0a-6833-5e4e3d26e049	0001	prva vaja	prva vaja
00420000-564f-3b0a-7a0a-0e1db6314c72	0002	tehnična vaja	tehnična vaja
00420000-564f-3b0a-e744-fd74038b3a3b	0003	lučna vaja	lučna vaja
00420000-564f-3b0a-6854-731acc135963	0004	kostumska vaja	kostumska vaja
00420000-564f-3b0a-395c-53d5d178fa82	0005	foto vaja	foto vaja
00420000-564f-3b0a-1293-563a32628a66	0006	1. glavna vaja	1. glavna vaja
00420000-564f-3b0a-b914-9c67dd3d0649	0007	2. glavna vaja	2. glavna vaja
00420000-564f-3b0a-6f04-975081ddee8c	0008	1. generalka	1. generalka
00420000-564f-3b0a-a8fb-0888ef33e28a	0009	2. generalka	2. generalka
00420000-564f-3b0a-c48a-d3fa19d660a1	0010	odprta generalka	odprta generalka
00420000-564f-3b0a-aa9a-c0b74f59da16	0011	obnovitvena vaja	obnovitvena vaja
00420000-564f-3b0a-69b8-f59d970cd0f0	0012	pevska vaja	pevska vaja
00420000-564f-3b0a-6a7a-2d1372e6eeb6	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564f-3b0a-88f6-ae77e4bb9e50	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 28950198)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 28950012)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564f-3b0b-8e86-cdddf5be5276	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROCSg6vW/uhx4gmRIVunkUpo/vpezQ0.y	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-5696-14efd7f4539a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-840d-2d3724bf48f8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-0fd9-fde513a53544	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-275a-64ab0ba2868d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-27fa-414efe33ec6d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-9395-8dfc47025ceb	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-446f-dc36914a018f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-95e1-f276b4b96f15	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-11cf-774c1a5dfa77	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-401f-d1abfc1964c6	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-87e9-785376b4f1b8	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-ddc1-0d5775202d1f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-c6b7-3c0989e88841	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-3ad0-8b8493255add	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-1e43-985b3e4baee4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-5c71-5a622be609b1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-51bf-df9a73a8deee	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-2cf0-299206ecf51f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564f-3b0c-45ba-b5f57c546ee1	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-564f-3b0b-d0ca-b413ca2fd329	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 28950640)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564f-3b0d-2249-03ec59a0bb85	00160000-564f-3b0c-9d50-0ab277023f53	\N	00140000-564f-3b0a-3f24-b16b278f5698	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564f-3b0c-2914-4fe082cf8fa5
000e0000-564f-3b0d-286f-5964d21285fe	00160000-564f-3b0c-171f-91e35b9f28f5	\N	00140000-564f-3b0a-2f1b-ec2cece79f90	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564f-3b0c-b959-ce0b79b7bafb
000e0000-564f-3b0d-f2a8-5285988fd15f	\N	\N	00140000-564f-3b0a-2f1b-ec2cece79f90	00190000-564f-3b0d-a9a6-52e67c9cbc9e	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564f-3b0c-2914-4fe082cf8fa5
000e0000-564f-3b0d-7889-74e0d884d32b	\N	\N	00140000-564f-3b0a-2f1b-ec2cece79f90	00190000-564f-3b0d-a9a6-52e67c9cbc9e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564f-3b0c-2914-4fe082cf8fa5
000e0000-564f-3b0d-f0a6-f17eb54cc2f8	\N	\N	00140000-564f-3b0a-2f1b-ec2cece79f90	00190000-564f-3b0d-a9a6-52e67c9cbc9e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564f-3b0c-8b28-14d0eecf240f
000e0000-564f-3b0d-59a5-6e84f0039c34	\N	\N	00140000-564f-3b0a-2f1b-ec2cece79f90	00190000-564f-3b0d-a9a6-52e67c9cbc9e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564f-3b0c-8b28-14d0eecf240f
\.


--
-- TOC entry 3123 (class 0 OID 28950298)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564f-3b0d-fe2b-2b57fa67296c	\N	000e0000-564f-3b0d-286f-5964d21285fe	1	
00200000-564f-3b0d-a9a6-228493de163d	\N	000e0000-564f-3b0d-286f-5964d21285fe	2	
00200000-564f-3b0d-4f8d-e9895e8b106b	\N	000e0000-564f-3b0d-286f-5964d21285fe	3	
00200000-564f-3b0d-c2f7-e51b8682d73f	\N	000e0000-564f-3b0d-286f-5964d21285fe	4	
00200000-564f-3b0d-a9a0-0bd5fe3201b0	\N	000e0000-564f-3b0d-286f-5964d21285fe	5	
\.


--
-- TOC entry 3140 (class 0 OID 28950449)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 28950563)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564f-3b0a-c052-c8e70280a340	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564f-3b0a-3e4a-5ba291516300	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564f-3b0a-fef0-66c7d3765688	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564f-3b0a-8bac-43eae18aea41	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564f-3b0a-c291-db97a6740156	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564f-3b0a-0096-344f195452c5	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564f-3b0a-d7c0-ad0d694d1e13	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564f-3b0a-3605-dd9f21d57cde	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564f-3b0a-6cab-cb44d227b614	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564f-3b0a-1b2d-6dbc75ea99cf	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564f-3b0a-1d8b-90e42fc6d010	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564f-3b0a-863b-641e5628d668	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564f-3b0a-4e58-5d39b125d4f2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564f-3b0a-ea71-0dda0be2ed8e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564f-3b0a-39d9-e6d4107e4444	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564f-3b0a-e92d-09b37dc0ed90	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564f-3b0a-a8f9-e9edc3ed9c21	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564f-3b0a-bc2b-dc3e4696bfec	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564f-3b0a-e751-bce3fcb9cd02	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564f-3b0a-a7f0-bd3320dd2ffa	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564f-3b0a-cbc9-0f14486d2460	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564f-3b0a-38d2-499d5176ce29	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564f-3b0a-878c-fe88d44c6d80	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564f-3b0a-5051-33f4412a3b4b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564f-3b0a-4b1e-2418b47424f9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564f-3b0a-3d5a-45b2f8c402d2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564f-3b0a-d621-63ad9ae6fc31	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564f-3b0a-5eae-5ce63a5e1486	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 28950933)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 28950902)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 28950945)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 28950521)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564f-3b0d-4c34-f51859e122bf	00090000-564f-3b0c-4b55-e7626bebbb71	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564f-3b0d-64bf-8c095f0f6266	00090000-564f-3b0c-34aa-56ef0eb30f79	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564f-3b0d-8d41-efbd059e611c	00090000-564f-3b0c-0643-2165db536b3a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564f-3b0d-69e4-797a29a08ca6	00090000-564f-3b0c-67eb-bc9022b8b38f	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564f-3b0d-f77d-469b21c1a6c7	00090000-564f-3b0c-ff83-6bc998309e8e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564f-3b0d-c83e-1ffe0a8e74c7	00090000-564f-3b0c-8582-400d1177c40b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 28950342)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 28950630)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564f-3b0a-3f24-b16b278f5698	01	Drama	drama (SURS 01)
00140000-564f-3b0a-4c42-3db718781356	02	Opera	opera (SURS 02)
00140000-564f-3b0a-673e-4a27c5758677	03	Balet	balet (SURS 03)
00140000-564f-3b0a-1632-f1e3ed08778e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564f-3b0a-bdc7-8a40c41e23cb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564f-3b0a-2f1b-ec2cece79f90	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564f-3b0a-bc16-233b58cdf191	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 28950511)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 28950075)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 28950689)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 28950679)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 28950066)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 28950546)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 28950588)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 28950986)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 28950330)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 28950352)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 28950357)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 28950900)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 28950225)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 28950757)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 28950507)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 28950296)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 28950263)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 28950239)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 28950414)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 28950963)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 28950970)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 28950994)
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
-- TOC entry 2726 (class 2606 OID 28950441)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 28950196)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 28950094)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 28950158)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 28950121)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 28950055)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 28950040)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 28950447)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 28950483)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 28950625)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 28950149)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 28950184)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 28950852)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 28950420)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 28950174)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 28950315)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 28950284)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 28950276)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 28950432)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 28950861)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 28950869)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 28950839)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 28950881)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 28950465)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 28950405)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 28950396)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 28950612)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 28950539)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 28950251)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 28950011)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 28950474)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 28950029)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 28950049)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 28950492)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 28950427)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 28950376)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 28949999)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 28949987)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 28949981)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 28950559)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 28950130)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 28950387)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 28950599)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 28950083)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 28950893)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 28950365)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 28950209)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 28950024)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 28950658)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 28950305)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 28950455)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 28950571)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 28950943)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 28950927)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 28950951)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 28950529)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 28950346)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 28950638)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 28950519)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 28950340)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 28950341)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 28950339)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 28950338)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 28950337)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 28950560)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 28950561)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 28950562)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 28950965)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 28950964)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 28950151)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 28950152)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 28950448)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 28950931)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 28950930)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 28950932)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 28950929)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 28950928)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 28950434)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 28950433)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 28950306)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 28950307)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 28950508)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 28950510)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 28950509)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 28950241)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 28950240)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 28950882)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 28950627)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 28950628)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 28950629)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 28950952)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 28950663)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 28950660)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 28950664)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 28950662)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 28950661)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 28950212)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 28950210)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 28950124)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 28950475)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 28950056)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 28950057)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 28950495)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 28950494)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 28950493)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 28950161)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 28950160)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 28950162)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 28950279)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 28950277)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 28950278)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 28949989)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 28950400)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 28950398)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 28950397)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 28950399)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 28950030)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 28950031)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 28950456)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 28950987)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 28950548)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 28950547)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 28950995)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 28950996)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 28950421)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 28950540)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 28950541)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 28950762)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 28950761)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 28950758)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 28950759)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 28950760)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 28950176)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 28950175)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 28950177)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 28950469)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 28950468)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 28950862)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 28950863)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 28950693)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 28950694)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 28950691)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 28950692)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 28950530)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 28950531)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 28950409)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 28950408)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 28950406)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 28950407)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 28950681)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 28950680)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 28950252)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 28950266)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 28950265)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 28950264)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 28950267)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 28950297)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 28950285)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 28950286)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 28950853)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 28950901)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 28950971)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 28950972)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 28950096)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 28950095)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 28950131)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 28950132)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 28950347)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 28950390)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 28950389)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 28950388)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 28950332)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 28950333)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 28950336)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 28950331)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 28950335)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 28950334)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 28950150)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 28950084)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 28950085)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 28950226)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 28950228)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 28950227)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 28950229)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 28950415)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 28950626)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 28950659)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 28950600)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 28950601)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 28950122)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 28950123)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 28950520)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 28950000)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 28950197)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 28950159)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 28949988)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 28950894)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 28950467)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 28950466)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 28950366)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 28950367)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 28950690)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 28950185)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 28950639)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 28950944)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 28950870)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 28950871)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 28950589)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 28950377)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 28950050)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2904 (class 2606 OID 28951167)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2905 (class 2606 OID 28951172)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2910 (class 2606 OID 28951197)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2908 (class 2606 OID 28951187)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2903 (class 2606 OID 28951162)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2907 (class 2606 OID 28951182)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2909 (class 2606 OID 28951192)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 28951177)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 28951367)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 28951372)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 28951377)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 28951542)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 28951537)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 28951052)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2882 (class 2606 OID 28951057)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 28951282)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 28951522)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 28951517)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2976 (class 2606 OID 28951527)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 28951512)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 28951507)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2926 (class 2606 OID 28951277)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 28951272)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 28951152)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2902 (class 2606 OID 28951157)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 28951322)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 28951332)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 28951327)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2892 (class 2606 OID 28951107)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 28951102)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 28951262)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 28951497)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2947 (class 2606 OID 28951382)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 28951387)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 28951392)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 28951532)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 28951412)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 28951397)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2954 (class 2606 OID 28951417)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 28951407)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2951 (class 2606 OID 28951402)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2890 (class 2606 OID 28951097)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 28951092)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2878 (class 2606 OID 28951037)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 28951032)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 28951302)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 28951012)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2874 (class 2606 OID 28951017)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 28951317)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 28951312)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2932 (class 2606 OID 28951307)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 28951067)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2883 (class 2606 OID 28951062)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 28951072)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 28951132)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 28951122)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 28951127)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 28950997)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2918 (class 2606 OID 28951237)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 28951227)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2915 (class 2606 OID 28951222)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2917 (class 2606 OID 28951232)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 28951002)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 28951007)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 28951287)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 28951557)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2943 (class 2606 OID 28951362)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 28951357)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 28951562)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2984 (class 2606 OID 28951567)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 28951267)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 28951347)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2941 (class 2606 OID 28951352)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 28951472)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 28951467)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 28951452)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2962 (class 2606 OID 28951457)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 28951462)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 28951082)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 28951077)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 28951087)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 28951297)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 28951292)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 28951482)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2968 (class 2606 OID 28951487)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2959 (class 2606 OID 28951442)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2960 (class 2606 OID 28951447)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2957 (class 2606 OID 28951432)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 28951437)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 28951337)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 28951342)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 28951257)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2921 (class 2606 OID 28951252)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2919 (class 2606 OID 28951242)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 28951247)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2956 (class 2606 OID 28951427)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 28951422)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 28951112)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 28951117)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 28951147)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 28951137)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2899 (class 2606 OID 28951142)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 28951477)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 28951492)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 28951502)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 28951547)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2981 (class 2606 OID 28951552)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2876 (class 2606 OID 28951027)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 28951022)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 28951042)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2880 (class 2606 OID 28951047)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 28951202)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 28951217)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 28951212)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2912 (class 2606 OID 28951207)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-20 16:24:00 CET

--
-- PostgreSQL database dump complete
--

