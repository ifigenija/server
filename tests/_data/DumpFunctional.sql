--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-15 12:44:10 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 257 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 36767686)
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
-- TOC entry 241 (class 1259 OID 36768312)
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
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 240 (class 1259 OID 36768296)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
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
-- TOC entry 183 (class 1259 OID 36767679)
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
-- TOC entry 182 (class 1259 OID 36767677)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 36768173)
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
-- TOC entry 234 (class 1259 OID 36768203)
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
-- TOC entry 255 (class 1259 OID 36768615)
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
-- TOC entry 212 (class 1259 OID 36768009)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 204 (class 1259 OID 36767928)
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
-- TOC entry 206 (class 1259 OID 36767960)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 36767965)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 36768537)
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
-- TOC entry 195 (class 1259 OID 36767831)
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
-- TOC entry 242 (class 1259 OID 36768325)
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
-- TOC entry 227 (class 1259 OID 36768131)
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
-- TOC entry 201 (class 1259 OID 36767902)
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
-- TOC entry 198 (class 1259 OID 36767871)
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
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 196 (class 1259 OID 36767848)
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
-- TOC entry 216 (class 1259 OID 36768045)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 36768595)
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
-- TOC entry 254 (class 1259 OID 36768608)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 36768630)
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
-- TOC entry 170 (class 1259 OID 34548309)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 36768070)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 36767805)
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
-- TOC entry 186 (class 1259 OID 36767705)
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
-- TOC entry 190 (class 1259 OID 36767772)
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
-- TOC entry 187 (class 1259 OID 36767716)
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
-- TOC entry 179 (class 1259 OID 36767651)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 36767670)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 36768077)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 36768111)
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
-- TOC entry 237 (class 1259 OID 36768244)
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
-- TOC entry 189 (class 1259 OID 36767752)
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
-- TOC entry 192 (class 1259 OID 36767797)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 36768481)
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
-- TOC entry 217 (class 1259 OID 36768051)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 191 (class 1259 OID 36767782)
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
-- TOC entry 203 (class 1259 OID 36767920)
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
-- TOC entry 199 (class 1259 OID 36767886)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 200 (class 1259 OID 36767895)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 171 (class 1259 OID 36291776)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 219 (class 1259 OID 36768063)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 36768495)
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
-- TOC entry 246 (class 1259 OID 36768505)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 36768394)
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
    stizvponpremkoprzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkoprgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkoprzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkoprgost numeric(15,2) DEFAULT 0::numeric,
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
    stobiskponprejkopr integer DEFAULT 0,
    stobiskponprejkoprint integer DEFAULT 0,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremgostkopr integer DEFAULT 0,
    stobiskponprejgostkopr integer DEFAULT 0,
    stobiskponpremzamejo integer,
    stobiskponpremzamejokopr integer DEFAULT 0,
    stobiskponprejzamejokopr integer DEFAULT 0,
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
-- TOC entry 247 (class 1259 OID 36768513)
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
-- TOC entry 223 (class 1259 OID 36768092)
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
-- TOC entry 215 (class 1259 OID 36768036)
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
-- TOC entry 214 (class 1259 OID 36768026)
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
-- TOC entry 236 (class 1259 OID 36768233)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 36768163)
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
-- TOC entry 197 (class 1259 OID 36767860)
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
-- TOC entry 176 (class 1259 OID 36767622)
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
-- TOC entry 175 (class 1259 OID 36767620)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 36768105)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 180 (class 1259 OID 36767660)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 36767644)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 36768119)
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
-- TOC entry 218 (class 1259 OID 36768057)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 36767980)
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
-- TOC entry 174 (class 1259 OID 36767609)
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
-- TOC entry 173 (class 1259 OID 36767601)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 36767596)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 36768180)
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
-- TOC entry 188 (class 1259 OID 36767744)
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
-- TOC entry 211 (class 1259 OID 36767999)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    deltaplaniranzacetek integer,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deltaplanirankonec integer,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    dezurni boolean,
    gost boolean,
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 36768016)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 36768221)
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
-- TOC entry 185 (class 1259 OID 36767695)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 36768525)
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
-- TOC entry 208 (class 1259 OID 36767970)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 194 (class 1259 OID 36767817)
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
-- TOC entry 177 (class 1259 OID 36767631)
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
-- TOC entry 239 (class 1259 OID 36768271)
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
-- TOC entry 210 (class 1259 OID 36767990)
-- Name: ura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ura (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 202 (class 1259 OID 36767913)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 36768084)
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
-- TOC entry 233 (class 1259 OID 36768194)
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
-- TOC entry 251 (class 1259 OID 36768575)
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
-- TOC entry 250 (class 1259 OID 36768544)
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
-- TOC entry 252 (class 1259 OID 36768587)
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
-- TOC entry 229 (class 1259 OID 36768156)
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
    delovnaobveza integer,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 205 (class 1259 OID 36767954)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 36768261)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 36768146)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 36767682)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 36767625)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3150 (class 0 OID 36767686)
-- Dependencies: 184
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5698-db86-1707-37bdb0d9fb2a	10	30	Otroci	Abonma za otroke	200
000a0000-5698-db86-d5b6-b4740b77dee8	20	60	Mladina	Abonma za mladino	400
000a0000-5698-db86-f9de-bc2525ca3fbb	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3207 (class 0 OID 36768312)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5698-db87-f2ed-daafaa5f8cf0	000d0000-5698-db87-a74b-62cc5aed4f03	\N	00090000-5698-db87-91f9-38353c24da4d	000b0000-5698-db87-dcae-3574e82bf6a5	0001	f	\N	\N	\N	3	t	t	t
000c0000-5698-db87-c809-c8f986dfa092	000d0000-5698-db87-98d2-dcc6fc03341a	00100000-5698-db87-8e42-0eff3b8fc8d5	00090000-5698-db87-92b4-c27ed1cf4c39	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5698-db87-c2ec-324cca7e988d	000d0000-5698-db87-199a-72f29e589a43	00100000-5698-db87-3079-61f90e0f951b	00090000-5698-db87-04db-ec6b9c5289d6	\N	0003	t	\N	2016-01-15	\N	2	t	f	f
000c0000-5698-db87-905c-1629265ecc42	000d0000-5698-db87-a376-b1e74be66d4c	\N	00090000-5698-db87-7166-c6cb792aafbc	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5698-db87-da72-b0dfd8d3d5fe	000d0000-5698-db87-8dd4-c8ad64595090	\N	00090000-5698-db87-8c73-d96e1f716788	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5698-db87-3652-e2280f61a2ba	000d0000-5698-db87-26bf-96fe1923d548	\N	00090000-5698-db87-dedb-a195b8dcbbd7	000b0000-5698-db87-2790-240d3f566cb5	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5698-db87-8a5b-52792dac4067	000d0000-5698-db87-91b4-858c430ee36c	00100000-5698-db87-e531-cafb2719e19c	00090000-5698-db87-8e2d-8592dca8e21a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5698-db87-3114-4072e5af896c	000d0000-5698-db87-b13b-2d3783f412a5	\N	00090000-5698-db87-085e-cae05e059ab6	000b0000-5698-db87-d16b-da8858e326d4	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5698-db87-495b-9e45f87e1a91	000d0000-5698-db87-91b4-858c430ee36c	00100000-5698-db87-e983-b1aaafd705e1	00090000-5698-db87-72f1-a852336352ea	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5698-db87-7368-727df62a5fab	000d0000-5698-db87-91b4-858c430ee36c	00100000-5698-db87-8093-3f95fbb2947d	00090000-5698-db87-ac00-b3f7e4c0d032	\N	0010	t	\N	2016-01-15	\N	16	f	f	t
000c0000-5698-db87-a01e-1c95376c87b1	000d0000-5698-db87-91b4-858c430ee36c	00100000-5698-db87-8dea-2e929933b506	00090000-5698-db87-3db5-df1ea596fa7c	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5698-db87-6da7-33cc451417ce	000d0000-5698-db87-a1c4-539b7e59b3e1	00100000-5698-db87-8e42-0eff3b8fc8d5	00090000-5698-db87-92b4-c27ed1cf4c39	000b0000-5698-db87-3617-41daabfd8688	0012	t	\N	\N	\N	2	t	t	t
000c0000-5698-db87-d492-fba684053f64	000d0000-5698-db87-1567-673bd298ec2a	\N	00090000-5698-db87-085e-cae05e059ab6	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-4836-dd7e2d7e5bcc	000d0000-5698-db87-1567-673bd298ec2a	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5698-db87-b666-a63ef9c4f5fd	000d0000-5698-db87-c4d4-48acd5de6086	00100000-5698-db87-3079-61f90e0f951b	00090000-5698-db87-04db-ec6b9c5289d6	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5698-db87-32ce-4324dc60ebaa	000d0000-5698-db87-c4d4-48acd5de6086	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5698-db87-a148-cbe62e1dae50	000d0000-5698-db87-dba3-0ad4518cc966	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-c451-129c849a3f45	000d0000-5698-db87-dba3-0ad4518cc966	\N	00090000-5698-db87-085e-cae05e059ab6	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5698-db87-14c9-cc698c4d9c44	000d0000-5698-db87-3918-294ba0ea574a	00100000-5698-db87-e531-cafb2719e19c	00090000-5698-db87-8e2d-8592dca8e21a	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5698-db87-82dc-c26f386045a2	000d0000-5698-db87-3918-294ba0ea574a	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5698-db87-8ea8-41a749a610ad	000d0000-5698-db87-905c-ddccb3e0e673	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-7cd2-3a283146f115	000d0000-5698-db87-905c-ddccb3e0e673	00100000-5698-db87-e531-cafb2719e19c	00090000-5698-db87-8e2d-8592dca8e21a	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5698-db87-a1e9-bc76d268fbbb	000d0000-5698-db87-4f5e-5656a05c40b3	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-44f3-1b209dfa53ce	000d0000-5698-db87-ab94-f6d75c0e1957	\N	00090000-5698-db87-085e-cae05e059ab6	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-4a46-0f7306b8116c	000d0000-5698-db87-7347-59a65bba3333	\N	00090000-5698-db87-085e-cae05e059ab6	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-1d69-da8c717c30c4	000d0000-5698-db87-7347-59a65bba3333	00100000-5698-db87-3079-61f90e0f951b	00090000-5698-db87-04db-ec6b9c5289d6	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5698-db87-70c1-897664f78051	000d0000-5698-db87-1ce4-2eddacb0fa69	\N	00090000-5698-db87-7181-c5856098b2f0	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5698-db87-f3f5-3037f3bc726e	000d0000-5698-db87-1ce4-2eddacb0fa69	\N	00090000-5698-db87-dcb4-6d2826551124	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5698-db87-6af6-9fa7455a9283	000d0000-5698-db87-b23a-a5674bc746ac	\N	00090000-5698-db87-085e-cae05e059ab6	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5698-db87-1a50-01f4367ed9b2	000d0000-5698-db87-b23a-a5674bc746ac	00100000-5698-db87-3079-61f90e0f951b	00090000-5698-db87-04db-ec6b9c5289d6	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5698-db87-bf30-31c23721ea13	000d0000-5698-db87-b23a-a5674bc746ac	\N	00090000-5698-db87-dcb4-6d2826551124	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5698-db87-23e3-dbb973156764	000d0000-5698-db87-b23a-a5674bc746ac	\N	00090000-5698-db87-7181-c5856098b2f0	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5698-db87-c48c-1d6b165070f1	000d0000-5698-db87-a8cd-3c052dda5c61	\N	00090000-5698-db87-085e-cae05e059ab6	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5698-db87-5717-4864c87d6411	000d0000-5698-db87-5cd1-54f8e7c45c73	00100000-5698-db87-3079-61f90e0f951b	00090000-5698-db87-04db-ec6b9c5289d6	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5698-db87-47e7-0fc29b2cb31a	000d0000-5698-db87-5cd1-54f8e7c45c73	\N	00090000-5698-db87-1784-d4d3239d1d06	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3206 (class 0 OID 36768296)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 36767679)
-- Dependencies: 183
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 36768173)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5698-db87-4e57-a9587647d4fd	00160000-5698-db86-f643-e2da1fdfe57e	00090000-5698-db87-dcb4-6d2826551124	aizv	10	t
003d0000-5698-db87-05a4-07a146300775	00160000-5698-db86-f643-e2da1fdfe57e	00090000-5698-db87-2bf1-afc8bb346a4a	apri	14	t
003d0000-5698-db87-c87c-e8ff00de1d78	00160000-5698-db86-1ce1-129c6680d0ac	00090000-5698-db87-7181-c5856098b2f0	aizv	11	t
003d0000-5698-db87-3720-b7e1c0378de8	00160000-5698-db86-523f-9bd2a971cc42	00090000-5698-db87-4305-dd9d79be8073	aizv	12	t
003d0000-5698-db87-3cf9-ab2b3e9723ed	00160000-5698-db86-f643-e2da1fdfe57e	00090000-5698-db87-1784-d4d3239d1d06	apri	18	f
\.


--
-- TOC entry 3200 (class 0 OID 36768203)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5698-db86-f643-e2da1fdfe57e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5698-db86-1ce1-129c6680d0ac	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5698-db86-523f-9bd2a971cc42	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3221 (class 0 OID 36768615)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 36768009)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 36767928)
-- Dependencies: 204
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5698-db87-5367-4b8a3f71cd90	\N	\N	00200000-5698-db87-d629-0f7d43796867	\N	\N	\N	00220000-5698-db86-497c-1112805164db	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5698-db87-680d-77c403e52d16	\N	\N	00200000-5698-db87-52f7-a33b4ae811e7	\N	\N	\N	00220000-5698-db86-497c-1112805164db	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5698-db87-3763-c171f6670eac	\N	\N	00200000-5698-db87-95cf-0c59446c7887	\N	\N	\N	00220000-5698-db86-26b7-20e7c6fc2f5b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5698-db87-43a0-44b0fedbfe68	\N	\N	00200000-5698-db87-4431-92dd9d6a7b5f	\N	\N	\N	00220000-5698-db86-35ae-ddb031f89ccb	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5698-db87-0384-68c2d9857a5c	\N	\N	00200000-5698-db87-591d-4037547ea59e	\N	\N	\N	00220000-5698-db86-632e-074df9304593	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3172 (class 0 OID 36767960)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 36767965)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 36768537)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 36767831)
-- Dependencies: 195
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5698-db84-9501-5707612b6683	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5698-db84-081d-82da8a1daf6c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5698-db84-a53a-36e54abeea00	AL	ALB	008	Albania 	Albanija	\N
00040000-5698-db84-73d1-2a45316cc8c2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5698-db84-fe36-8556ead75a31	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5698-db84-265d-e5ae1f2cc7bc	AD	AND	020	Andorra 	Andora	\N
00040000-5698-db84-7776-0702ad4f3ed9	AO	AGO	024	Angola 	Angola	\N
00040000-5698-db84-f946-550abab980ce	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5698-db84-21ad-1abe423145d8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5698-db84-0218-bf534930633f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5698-db84-8b3a-5c9faad6fe6b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5698-db84-1d53-73e6810f44ef	AM	ARM	051	Armenia 	Armenija	\N
00040000-5698-db84-651b-4fcd4afbe6e2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5698-db84-d6e7-0c64bd029bb6	AU	AUS	036	Australia 	Avstralija	\N
00040000-5698-db84-1626-637dbbfd644c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5698-db84-051a-3cb823bba57b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5698-db84-2bc9-8dc6d6b22a64	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5698-db84-8099-5b35c883c56d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5698-db84-bcc9-24c73cf6b130	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5698-db84-d747-4e5f2e2599a0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5698-db84-bffa-bd6e3e5a20be	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5698-db84-8e03-1314f65a6f99	BE	BEL	056	Belgium 	Belgija	\N
00040000-5698-db84-30ae-6b3d970332a4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5698-db84-ba02-9bfb49561ec6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5698-db84-118e-7eeb849d928a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5698-db84-e87b-e9bf7ce2ebd1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5698-db84-c938-6dff0389a974	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5698-db84-319c-960814426a5e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5698-db84-b4bf-0553d69939df	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5698-db84-e1fd-0464fa02c042	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5698-db84-9946-f11831a81602	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5698-db84-9a11-3de691219c90	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5698-db84-4316-e4aa381caabd	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5698-db84-e06c-80253ebe0c58	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5698-db84-60ae-dae1b7509d82	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5698-db84-1ac5-4b94d9c3e0d9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5698-db84-12a7-c4ec0fa63fce	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5698-db84-c9f7-73bd3ba2ac62	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5698-db84-fcf6-5e70fc6447ea	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5698-db84-dd55-1a41201d4ba6	CA	CAN	124	Canada 	Kanada	\N
00040000-5698-db84-9d30-b00ba231d0d5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5698-db84-e416-f050f7e3c850	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5698-db84-2ae7-6733cb1f9c90	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5698-db84-fda1-9c8aa891647d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5698-db84-ae8e-103097e14a3c	CL	CHL	152	Chile 	Čile	\N
00040000-5698-db84-7e2d-4b4df8d07b70	CN	CHN	156	China 	Kitajska	\N
00040000-5698-db84-4521-1963f3f303cc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5698-db84-069f-e9adbed71b3c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5698-db84-64b1-1e62aab3235b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5698-db84-4254-6a72041ba0e2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5698-db84-ed29-bb054bc7f299	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5698-db84-2f29-7cf14d164ea7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5698-db84-c664-04d815afd69d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5698-db84-217c-abc35d0fc1bb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5698-db84-12f8-e83a036fcf34	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5698-db84-776d-d9a17ece8b88	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5698-db84-8fa3-d25dc2b3b741	CU	CUB	192	Cuba 	Kuba	\N
00040000-5698-db84-9cc6-306bdb311cfd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5698-db84-d2b0-73d386013f53	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5698-db84-ad33-8763f3694942	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5698-db84-d878-2ce1ef46c301	DK	DNK	208	Denmark 	Danska	\N
00040000-5698-db84-7178-39d612d672e5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5698-db84-f8bd-4a8cd093ebb6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5698-db84-ba15-53e16377c345	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5698-db84-99ce-5786ff442a74	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5698-db84-f6f5-0096119636f5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5698-db84-5849-8103ee7987b0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5698-db84-4443-75e027ae9dda	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5698-db84-69e7-1a4bcd310d25	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5698-db84-8b2f-4ae6413fda07	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5698-db84-e98f-b64638a634b4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5698-db84-cbc7-f0ac5972c90c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5698-db84-e5e6-bde96959bd54	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5698-db84-4745-647268b7cfc5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5698-db84-812a-d822db29544d	FI	FIN	246	Finland 	Finska	\N
00040000-5698-db84-228d-eaa0ef2af473	FR	FRA	250	France 	Francija	\N
00040000-5698-db84-23d8-d801a9181d9d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5698-db84-a1fa-f6236d39bd73	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5698-db84-a1cf-1498bc79fc03	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5698-db84-4a96-bee1f3580f5b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5698-db84-34fa-e908919f9bde	GA	GAB	266	Gabon 	Gabon	\N
00040000-5698-db84-1583-18b44a21e758	GM	GMB	270	Gambia 	Gambija	\N
00040000-5698-db84-6bdc-f59ce7b5d2cb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5698-db84-ea1a-faa80d4cbd0a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5698-db84-6427-5f24c075153d	GH	GHA	288	Ghana 	Gana	\N
00040000-5698-db84-b578-9a70676a0678	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5698-db84-306e-2255bf13e9cd	GR	GRC	300	Greece 	Grčija	\N
00040000-5698-db84-bc0d-0e4107c7804d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5698-db84-e527-6acd437ddb86	GD	GRD	308	Grenada 	Grenada	\N
00040000-5698-db84-ba6b-eacd32522d66	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5698-db84-a370-fcc5c932564f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5698-db84-e699-fdfebefc78c8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5698-db84-8e2b-de5fe84738e1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5698-db84-a70a-2b7518c51666	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5698-db84-d5e5-f61f80d85e08	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5698-db84-a21c-8ac80f4c0e3e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5698-db84-96f8-066f91c74e12	HT	HTI	332	Haiti 	Haiti	\N
00040000-5698-db84-72e0-b92427a3d3fe	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5698-db84-111e-2ac777a51f5a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5698-db84-ca0d-08ca18777617	HN	HND	340	Honduras 	Honduras	\N
00040000-5698-db84-4973-cbe66830902e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5698-db84-61b6-4ac00f9fa005	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5698-db84-dc9d-85abef63feec	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5698-db84-3715-04cb5560780b	IN	IND	356	India 	Indija	\N
00040000-5698-db84-cb79-e8db791e9b37	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5698-db84-4942-475da22efff9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5698-db84-8e99-22e3a6db6df0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5698-db84-54db-73562f5c19e4	IE	IRL	372	Ireland 	Irska	\N
00040000-5698-db84-dfe5-ad4420db02e4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5698-db84-52f1-b3e7bf4f5268	IL	ISR	376	Israel 	Izrael	\N
00040000-5698-db84-cbd5-8db4b0a783ff	IT	ITA	380	Italy 	Italija	\N
00040000-5698-db84-9c45-76b62db5f1e0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5698-db84-f5ea-e16252eec762	JP	JPN	392	Japan 	Japonska	\N
00040000-5698-db84-faec-c3a335809d07	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5698-db84-ebfa-244e62630fd6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5698-db84-a191-95932a22e44b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5698-db84-554e-9ab875f428fc	KE	KEN	404	Kenya 	Kenija	\N
00040000-5698-db84-102a-027d5b91345a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5698-db84-4f76-2feba58b062c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5698-db84-1bff-dfad7a65cb6d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5698-db84-e2fd-6de79c02fc20	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5698-db84-ec08-e7f9da459256	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5698-db84-05ca-b79b0cf43077	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5698-db84-1337-19d683b8a3b1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5698-db84-6343-1b8aa68ea6f2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5698-db84-43a9-7ddd69263e07	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5698-db84-76b4-4c6c953120e3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5698-db84-fa2a-461254f4eb29	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5698-db84-c9b9-cc0b317666b0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5698-db84-3471-501977bbe181	LT	LTU	440	Lithuania 	Litva	\N
00040000-5698-db84-f87a-0aceeb0af48e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5698-db84-3ab6-9de5449c4bae	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5698-db84-f899-9a3c3f857b94	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5698-db84-ac00-2843fc558e26	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5698-db84-255f-42b7434dd5ad	MW	MWI	454	Malawi 	Malavi	\N
00040000-5698-db84-f096-57164c5ea6c9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5698-db84-6cec-7ff0899db750	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5698-db84-83ee-e53cf656046f	ML	MLI	466	Mali 	Mali	\N
00040000-5698-db84-181d-fed83cf688af	MT	MLT	470	Malta 	Malta	\N
00040000-5698-db84-c3c3-93d0a77e3093	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5698-db84-45e0-35d84cf2407c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5698-db84-01bb-03230179aef9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5698-db84-33b6-f8cf2efac2f1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5698-db84-1a3e-7194ff5b0141	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5698-db84-6ee6-5b25c115e985	MX	MEX	484	Mexico 	Mehika	\N
00040000-5698-db84-5016-44cb6f599fdd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5698-db84-2307-b4996c775a4e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5698-db84-0afb-c9451cda9f9c	MC	MCO	492	Monaco 	Monako	\N
00040000-5698-db84-d844-ab2c3789f514	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5698-db84-d20d-0b6cce5e62aa	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5698-db84-87bb-41b9e9013d6c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5698-db84-a2a7-0ab652381503	MA	MAR	504	Morocco 	Maroko	\N
00040000-5698-db84-9386-cb59b61ebf18	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5698-db84-9148-31e640b88f34	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5698-db84-41fe-61ac642a5320	NA	NAM	516	Namibia 	Namibija	\N
00040000-5698-db84-cbb3-931df040ca98	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5698-db84-1ad6-dd9d7ad4cb3d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5698-db84-ccc0-fe6c1f290060	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5698-db84-2336-eee9a4c51bf7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5698-db84-db05-4d168657bc0b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5698-db84-3546-d83fb0a53efc	NE	NER	562	Niger 	Niger 	\N
00040000-5698-db84-0de3-2b271e4b75c3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5698-db84-9fe0-168405907704	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5698-db84-bdd0-b4431fca5f79	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5698-db84-d511-305230cc413a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5698-db84-d794-8ef745dc95dd	NO	NOR	578	Norway 	Norveška	\N
00040000-5698-db84-1a10-fbe530cac182	OM	OMN	512	Oman 	Oman	\N
00040000-5698-db84-ca0d-6660d314ae76	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5698-db84-6a08-42264c70e2d7	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5698-db84-69eb-004260f33f28	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5698-db84-1e70-9ac357af36c8	PA	PAN	591	Panama 	Panama	\N
00040000-5698-db84-13c2-1591fb4674db	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5698-db84-d9be-064b905bf948	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5698-db84-af4b-f920cc6f7c15	PE	PER	604	Peru 	Peru	\N
00040000-5698-db84-a228-94bbf9f7c385	PH	PHL	608	Philippines 	Filipini	\N
00040000-5698-db84-9983-e01df9464ace	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5698-db84-1048-02a75ea65183	PL	POL	616	Poland 	Poljska	\N
00040000-5698-db84-f12f-cbc53dbb50e2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5698-db84-2270-28e0d9c306f7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5698-db84-591c-ff289ceab7ec	QA	QAT	634	Qatar 	Katar	\N
00040000-5698-db84-10d8-016c2b6ec651	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5698-db84-9cca-615f674343c5	RO	ROU	642	Romania 	Romunija	\N
00040000-5698-db84-c644-c14234fa7000	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5698-db84-71d6-9cc9d441c8af	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5698-db84-fa88-2ec7e6b80839	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5698-db84-fb18-0d5aad5c3a77	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5698-db84-2eb0-c7420bcd522c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5698-db84-e0c5-27e9a4576eb8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5698-db84-34ef-68e6fa49e311	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5698-db84-db4f-9bef9541b40d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5698-db84-be39-8ef5c11a9565	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5698-db84-2517-3796f091415d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5698-db84-e15d-d124c35d97c3	SM	SMR	674	San Marino 	San Marino	\N
00040000-5698-db84-468c-97e263bcdfe8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5698-db84-d8aa-0be85c631079	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5698-db84-950c-716490dd0c14	SN	SEN	686	Senegal 	Senegal	\N
00040000-5698-db84-7a7e-7b2bae74d77b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5698-db84-c0bd-2150b0edd66d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5698-db84-b30b-d3e1bc928644	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5698-db84-0e5b-4e5dcc2cca99	SG	SGP	702	Singapore 	Singapur	\N
00040000-5698-db84-b322-d7b9651de566	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5698-db84-663b-db9c49cd4d84	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5698-db84-f757-5c99083c1982	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5698-db84-7aa1-aa907bd5d385	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5698-db84-c164-5f993284b9b4	SO	SOM	706	Somalia 	Somalija	\N
00040000-5698-db84-7bdb-af60cfe47598	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5698-db84-2a2d-ea75827f0864	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5698-db84-a862-8583b911f580	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5698-db84-76f7-41019aad2d19	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5698-db84-91ae-12ffe9a2b8be	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5698-db84-cb41-f8eee1dd69cb	SD	SDN	729	Sudan 	Sudan	\N
00040000-5698-db84-a344-d09b0877a485	SR	SUR	740	Suriname 	Surinam	\N
00040000-5698-db84-b2ff-6754cc12ec2c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5698-db84-823d-8ab8c78c3ed5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5698-db84-e6c1-8d4223a82e1b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5698-db84-a998-a6eea40d689d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5698-db84-aa99-497f39159796	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5698-db84-4327-5bbe67f42c02	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5698-db84-a9e0-a86f483c6160	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5698-db84-2e08-4bd5bdf03a52	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5698-db84-9d42-a7c6b77512c2	TH	THA	764	Thailand 	Tajska	\N
00040000-5698-db84-00f9-5f97ad27dc0a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5698-db84-9788-38b6558cb488	TG	TGO	768	Togo 	Togo	\N
00040000-5698-db84-6f4a-bc775ac0e893	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5698-db84-4495-1db8d803b333	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5698-db84-df41-467cec499588	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5698-db84-e150-70f15d9c9549	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5698-db84-7ea4-f86925096e0b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5698-db84-cd79-9106db4b1850	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5698-db84-5e8d-47ced5304ce3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5698-db84-54a3-f84c5e947f5c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5698-db84-2248-99e35f4ff7fe	UG	UGA	800	Uganda 	Uganda	\N
00040000-5698-db84-2d9d-9840e7ddbe7b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5698-db84-73f1-e4b4f0b8c5af	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5698-db84-9813-297a4480bded	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5698-db84-17e5-8da4d04774c2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5698-db84-1d66-9579f20309eb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5698-db84-6eff-c79fa6dda9c9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5698-db84-12c7-db63e49a797f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5698-db84-c486-7b60bded0c59	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5698-db84-e3b9-62d090bfafc5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5698-db84-b7b3-b150f03d2292	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5698-db84-e78d-cbcf3df2b1b0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5698-db84-66a6-180cb94d8a3e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5698-db84-3b32-94e93bb27da3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5698-db84-ce64-171ce84cbcfa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5698-db84-07e5-186645664ba6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5698-db84-26ab-9ee508484ae7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5698-db84-d00c-2806f2bdd9f5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3208 (class 0 OID 36768325)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5698-db87-8575-0dc54e0b5de6	000e0000-5698-db87-f11d-f28c429dc907	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5698-db83-01b6-82be8e2c12a3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5698-db87-f080-1a336d9298b5	000e0000-5698-db87-1704-778be3ca2922	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5698-db83-a726-bb2ef7f74e1d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5698-db87-f01a-ccd6b5077450	000e0000-5698-db87-07dd-7f65287e7748	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5698-db83-01b6-82be8e2c12a3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5698-db87-dc95-460e52064a30	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5698-db87-555f-a2629c5879cb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3193 (class 0 OID 36768131)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5698-db87-795f-7ce7bd3e918c	000e0000-5698-db87-1704-778be3ca2922	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5698-db84-6c61-225b8363e88d
000d0000-5698-db87-6787-c38507395e80	000e0000-5698-db87-0458-16113d8196ec	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5698-db84-081a-974e816050e3
000d0000-5698-db87-6d4e-2e714e056f7f	000e0000-5698-db87-0458-16113d8196ec	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-a74b-62cc5aed4f03	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-f2ed-daafaa5f8cf0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5698-db84-081a-974e816050e3
000d0000-5698-db87-98d2-dcc6fc03341a	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-c809-c8f986dfa092	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-199a-72f29e589a43	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-c2ec-324cca7e988d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5698-db84-0c73-5173d01159cd
000d0000-5698-db87-a376-b1e74be66d4c	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-905c-1629265ecc42	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5698-db84-6c61-225b8363e88d
000d0000-5698-db87-8dd4-c8ad64595090	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-da72-b0dfd8d3d5fe	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5698-db84-6c61-225b8363e88d
000d0000-5698-db87-26bf-96fe1923d548	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-3652-e2280f61a2ba	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5698-db84-081a-974e816050e3
000d0000-5698-db87-91b4-858c430ee36c	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-495b-9e45f87e1a91	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5698-db84-081a-974e816050e3
000d0000-5698-db87-b13b-2d3783f412a5	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-3114-4072e5af896c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5698-db84-e210-99cf1fadc445
000d0000-5698-db87-a1c4-539b7e59b3e1	000e0000-5698-db87-1704-778be3ca2922	000c0000-5698-db87-6da7-33cc451417ce	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5698-db83-d42f-d15fdf22d7f0
000d0000-5698-db87-1567-673bd298ec2a	000e0000-5698-db87-ecb3-f93706d1f172	000c0000-5698-db87-d492-fba684053f64	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-c4d4-48acd5de6086	000e0000-5698-db87-9ee4-40090daf2468	000c0000-5698-db87-b666-a63ef9c4f5fd	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-dba3-0ad4518cc966	000e0000-5698-db87-9ee4-40090daf2468	000c0000-5698-db87-a148-cbe62e1dae50	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-3918-294ba0ea574a	000e0000-5698-db87-72dd-2accf9cd24c5	000c0000-5698-db87-14c9-cc698c4d9c44	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-905c-ddccb3e0e673	000e0000-5698-db87-673e-c319e9ce9775	000c0000-5698-db87-8ea8-41a749a610ad	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-4f5e-5656a05c40b3	000e0000-5698-db87-80f6-e2863ef01285	000c0000-5698-db87-a1e9-bc76d268fbbb	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-ab94-f6d75c0e1957	000e0000-5698-db87-f47f-b2535b188cc6	000c0000-5698-db87-44f3-1b209dfa53ce	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-7347-59a65bba3333	000e0000-5698-db87-06dc-a2305346f5b4	000c0000-5698-db87-4a46-0f7306b8116c	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-1ce4-2eddacb0fa69	000e0000-5698-db87-c6ba-7e5bdf8f14ac	000c0000-5698-db87-70c1-897664f78051	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-b23a-a5674bc746ac	000e0000-5698-db87-c6ba-7e5bdf8f14ac	000c0000-5698-db87-6af6-9fa7455a9283	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-a8cd-3c052dda5c61	000e0000-5698-db87-60d3-b4807e954764	000c0000-5698-db87-c48c-1d6b165070f1	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
000d0000-5698-db87-5cd1-54f8e7c45c73	000e0000-5698-db87-60d3-b4807e954764	000c0000-5698-db87-5717-4864c87d6411	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5698-db83-267d-82266527254e
\.


--
-- TOC entry 3167 (class 0 OID 36767902)
-- Dependencies: 201
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 36767871)
-- Dependencies: 198
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 36767848)
-- Dependencies: 196
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5698-db87-7025-037429e37a03	00080000-5698-db87-1118-67e4a5e41a7d	00090000-5698-db87-ac00-b3f7e4c0d032	AK		igralka
\.


--
-- TOC entry 3182 (class 0 OID 36768045)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 36768595)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5698-db87-6378-0d429992b582	00010000-5698-db85-000c-cf8dedffef45	\N	Prva mapa	Root mapa	2016-01-15 12:44:07	2016-01-15 12:44:07	R	\N	\N
\.


--
-- TOC entry 3220 (class 0 OID 36768608)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 36768630)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34548309)
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
20151105104249
20151210170541
20151214151027
20151218121329
20151229153831
\.


--
-- TOC entry 3186 (class 0 OID 36768070)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 36767805)
-- Dependencies: 193
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5698-db85-691a-58e76bf1ca97	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5698-db85-b981-7a27b34b6429	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5698-db85-268c-1b48dd2480ff	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5698-db85-349e-18ab79304f44	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5698-db85-db2a-e818ce10bc87	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5698-db85-c549-1b07e8e07e8e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5698-db85-08c3-a0e72c3bc7cf	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-5698-db85-9b28-ceb0557e0497	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5698-db85-0e24-d3ae06ae957b	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5698-db85-4c03-fc9a5d8d3d25	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5698-db85-3c7d-0ac63c3297d8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5698-db85-5386-dbb432599a4e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5698-db85-d781-8dd0ab61ec1c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5698-db85-4077-7a8fdce3d6b0	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5698-db85-4803-2f4c667a046b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5698-db86-42e3-d1e3ffe8d222	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5698-db86-6a44-1b30aa575b25	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5698-db86-521a-e77afb35513c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5698-db86-e6d4-40ad6df8c33c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5698-db86-359e-53e4e8668e41	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5698-db89-1a90-38033aa3a7c9	application.tenant.maticnopodjetje	string	s:36:"00080000-5698-db88-e65b-8b3249c1b073";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3152 (class 0 OID 36767705)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5698-db86-6c3d-c82562d33862	00000000-5698-db86-42e3-d1e3ffe8d222	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5698-db86-9670-ca4c33e5afbc	00000000-5698-db86-42e3-d1e3ffe8d222	00010000-5698-db85-000c-cf8dedffef45	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5698-db86-c74f-bfa03fc8a2f7	00000000-5698-db86-6a44-1b30aa575b25	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3156 (class 0 OID 36767772)
-- Dependencies: 190
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5698-db87-3754-b3456236eb09	\N	00100000-5698-db87-8e42-0eff3b8fc8d5	00100000-5698-db87-3079-61f90e0f951b	01	Gledališče Nimbis
00410000-5698-db87-1146-1f25bf607b8e	00410000-5698-db87-3754-b3456236eb09	00100000-5698-db87-8e42-0eff3b8fc8d5	00100000-5698-db87-3079-61f90e0f951b	02	Tehnika
\.


--
-- TOC entry 3153 (class 0 OID 36767716)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5698-db87-91f9-38353c24da4d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5698-db87-7166-c6cb792aafbc	00010000-5698-db86-3e26-f7059d4e06bc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5698-db87-04db-ec6b9c5289d6	00010000-5698-db86-13eb-a97005d66b55	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5698-db87-72f1-a852336352ea	00010000-5698-db86-56a4-90ab5a97d867	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5698-db87-fbc5-b65059b48318	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5698-db87-dedb-a195b8dcbbd7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5698-db87-3db5-df1ea596fa7c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5698-db87-8e2d-8592dca8e21a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5698-db87-ac00-b3f7e4c0d032	00010000-5698-db86-ce88-f389ac0a939b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5698-db87-92b4-c27ed1cf4c39	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5698-db87-8c08-5eb653500127	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5698-db87-8c73-d96e1f716788	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5698-db87-085e-cae05e059ab6	00010000-5698-db86-99f5-0b094cbce03f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5698-db87-dcb4-6d2826551124	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5698-db87-2bf1-afc8bb346a4a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5698-db87-7181-c5856098b2f0	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5698-db87-4305-dd9d79be8073	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5698-db87-1784-d4d3239d1d06	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5698-db87-b088-0d2140d463c7	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5698-db87-efd8-a27835e24e6e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5698-db87-ea56-75b8ad18c1de	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 36767651)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5698-db84-cf04-d1a5bcba6556	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5698-db84-9291-4c0736466b68	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5698-db84-a9f6-169265e9af0b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5698-db84-95d9-ab6bc8fc17d3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5698-db84-020a-1d3d2611e29a	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5698-db84-24ba-6d2bc68c14a4	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5698-db84-4554-ab8533bb9078	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5698-db84-a1c0-f828049177d0	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5698-db84-4280-2e5b5598709a	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5698-db84-44f5-9e81926886a4	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5698-db84-6bb2-4c75885e0a7a	Abonma-read	Abonma - branje	t
00030000-5698-db84-851d-f3b369bbea67	Abonma-write	Abonma - spreminjanje	t
00030000-5698-db84-b699-72323fb6b23a	Alternacija-read	Alternacija - branje	t
00030000-5698-db84-0ff0-6ca3260ca1c3	Alternacija-write	Alternacija - spreminjanje	t
00030000-5698-db84-1645-c1e611317856	Arhivalija-read	Arhivalija - branje	t
00030000-5698-db84-c269-cffc4f564009	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5698-db84-ff00-e211085cc88a	AuthStorage-read	AuthStorage - branje	t
00030000-5698-db84-9f9b-454d305fdc2f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5698-db84-bdbb-de0fca833b6b	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5698-db84-7c3c-f6583282bb93	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5698-db84-36f5-905d5ca90b58	Besedilo-read	Besedilo - branje	t
00030000-5698-db84-136b-1dda0c015b46	Besedilo-write	Besedilo - spreminjanje	t
00030000-5698-db84-8556-d2ceeaf3d1a7	Dodatek-read	Dodatek - branje	t
00030000-5698-db84-c5dd-6d748c2ecfdc	Dodatek-write	Dodatek - spreminjanje	t
00030000-5698-db84-97dc-32b379f007e6	Dogodek-read	Dogodek - branje	t
00030000-5698-db84-9559-616960cb28d6	Dogodek-write	Dogodek - spreminjanje	t
00030000-5698-db84-9b1c-7018cb3cca32	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5698-db84-ca39-3809a9aa5afc	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5698-db84-b416-27a55111af97	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5698-db84-ce07-bfe16011ad61	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5698-db84-61f0-bc16b133fae0	DogodekTrait-read	DogodekTrait - branje	t
00030000-5698-db84-2321-1f0a55733b95	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5698-db84-1948-30e51a535616	DrugiVir-read	DrugiVir - branje	t
00030000-5698-db84-0afc-b0dd60fc939a	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5698-db84-fb9a-09305a3e81fb	Drzava-read	Drzava - branje	t
00030000-5698-db84-ee07-ce976068c53d	Drzava-write	Drzava - spreminjanje	t
00030000-5698-db84-9b8c-810cb774bfa6	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5698-db84-5774-7187b0b27e0c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5698-db84-c2d3-1a610c6705cc	Funkcija-read	Funkcija - branje	t
00030000-5698-db84-9866-a1915265a2cb	Funkcija-write	Funkcija - spreminjanje	t
00030000-5698-db84-a602-15c082c3ee7f	Gostovanje-read	Gostovanje - branje	t
00030000-5698-db84-525e-7e585ac1c67f	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5698-db84-49bb-d2e2602e4973	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5698-db84-3e29-69e1107725e7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5698-db84-8fc6-6b4c7a4c8d60	Kupec-read	Kupec - branje	t
00030000-5698-db84-f2ba-ae97473d6f67	Kupec-write	Kupec - spreminjanje	t
00030000-5698-db84-a2ca-183279ecd330	NacinPlacina-read	NacinPlacina - branje	t
00030000-5698-db84-f006-1ac2448f3a0f	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5698-db84-db1b-69aaed70cbe9	Option-read	Option - branje	t
00030000-5698-db84-d412-2b04b4f2df10	Option-write	Option - spreminjanje	t
00030000-5698-db84-c300-576876a3c709	OptionValue-read	OptionValue - branje	t
00030000-5698-db84-6199-6757cbbf945e	OptionValue-write	OptionValue - spreminjanje	t
00030000-5698-db84-d446-6f32be0606d2	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5698-db84-88bc-74fe9aa9a40c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5698-db84-e23d-d71175a909c6	Oseba-read	Oseba - branje	t
00030000-5698-db84-4915-4766bbdfe64d	Oseba-write	Oseba - spreminjanje	t
00030000-5698-db84-f8fe-d57fafe1efee	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5698-db84-dc5d-06a3b61ce7b4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5698-db84-1a86-53da82f94194	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5698-db84-15c6-7191ca30e18f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5698-db84-e2c4-dc4e01950460	Pogodba-read	Pogodba - branje	t
00030000-5698-db84-9d95-9f12de61438b	Pogodba-write	Pogodba - spreminjanje	t
00030000-5698-db84-9547-388f20a5e575	Popa-read	Popa - branje	t
00030000-5698-db84-3f32-db08583babf9	Popa-write	Popa - spreminjanje	t
00030000-5698-db84-4aba-098a65537071	Posta-read	Posta - branje	t
00030000-5698-db84-d193-b79b617a7880	Posta-write	Posta - spreminjanje	t
00030000-5698-db84-e989-1029a0d12d70	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5698-db84-70bf-40b7056eeb6f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5698-db84-819f-b3081883f040	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5698-db84-ac13-c1d67d52e376	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5698-db84-3ea8-04062ab16494	PostniNaslov-read	PostniNaslov - branje	t
00030000-5698-db84-21ae-2b3b93a24f39	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5698-db84-b263-1e8b4139469f	Praznik-read	Praznik - branje	t
00030000-5698-db84-5efc-ef1935ac16f2	Praznik-write	Praznik - spreminjanje	t
00030000-5698-db84-6bf5-877f190bcb73	Predstava-read	Predstava - branje	t
00030000-5698-db84-9199-ccdd487ae4db	Predstava-write	Predstava - spreminjanje	t
00030000-5698-db84-fdbf-a61b2be8fe84	Ura-read	Ura - branje	t
00030000-5698-db84-9629-10ad4fb85455	Ura-write	Ura - spreminjanje	t
00030000-5698-db84-878c-1ab779ae0977	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5698-db84-ae19-f830b36c55c8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5698-db84-7210-760c6676b053	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5698-db84-6d73-c9542d59325a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5698-db84-26ea-1ed822a2bc55	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5698-db84-e12e-2f3477207ecf	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5698-db84-fa25-0b0e11da3627	ProgramDela-read	ProgramDela - branje	t
00030000-5698-db84-a8c3-199ae2001be3	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5698-db84-239f-fd47bee2164a	ProgramFestival-read	ProgramFestival - branje	t
00030000-5698-db84-bc4d-f1ce1345c842	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5698-db84-e7f6-81f1a928d097	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5698-db84-ce75-96b8d0b65d33	Datoteka-write	Datoteka - spreminjanje	t
00030000-5698-db84-8adc-9bcfb4db2aed	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5698-db84-9ed5-7c93a7ebabb6	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5698-db84-b01f-aafd52f1f711	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5698-db84-7410-635e205b7aa6	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5698-db84-58af-775e140273c2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5698-db84-42ba-c1500c9c10a1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5698-db84-95e0-363a04100a2b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5698-db84-953c-aad0f0343b09	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5698-db84-7c14-533d0425cf17	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5698-db84-2840-1f8f9ff4652b	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5698-db84-0910-e7274c198668	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5698-db84-efbf-e288773dec14	ProgramRazno-read	ProgramRazno - branje	t
00030000-5698-db84-5f39-fd0b0cb83df6	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5698-db84-bc3d-f9bc462e08ca	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5698-db84-93cf-fad67357dfae	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5698-db84-b939-5f17e6342f58	Prostor-read	Prostor - branje	t
00030000-5698-db84-e78e-66a3e2e829aa	Prostor-write	Prostor - spreminjanje	t
00030000-5698-db84-9211-4f1f66bcf820	Racun-read	Racun - branje	t
00030000-5698-db84-6146-b08b730eec0f	Racun-write	Racun - spreminjanje	t
00030000-5698-db84-05f1-8ec819b7abd9	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5698-db84-140b-5b374595a7e2	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5698-db84-cfe8-093b68845fd6	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5698-db84-c908-0be3d6c90722	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5698-db84-8ca5-e93802491125	Rekvizit-read	Rekvizit - branje	t
00030000-5698-db84-21fe-e55e3c8e6df8	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5698-db84-a0a1-98f39422270b	Revizija-read	Revizija - branje	t
00030000-5698-db84-3944-a6be272965a2	Revizija-write	Revizija - spreminjanje	t
00030000-5698-db84-f5bc-ebc1f9757b84	Rezervacija-read	Rezervacija - branje	t
00030000-5698-db84-b707-88d9ec5a9cbf	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5698-db84-2ff3-4f872858fc78	SedezniRed-read	SedezniRed - branje	t
00030000-5698-db84-a558-997450b60bea	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5698-db84-90f9-51b33db37831	Sedez-read	Sedez - branje	t
00030000-5698-db84-6c11-db18e975ddf5	Sedez-write	Sedez - spreminjanje	t
00030000-5698-db84-3baf-28f01ce118ce	Sezona-read	Sezona - branje	t
00030000-5698-db84-7274-3b42e45ea2ea	Sezona-write	Sezona - spreminjanje	t
00030000-5698-db84-8af6-a7c469c1353f	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5698-db84-3779-f10cf5f92121	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5698-db84-69de-1a4186c9cb19	Telefonska-read	Telefonska - branje	t
00030000-5698-db84-3615-2bb1581ce305	Telefonska-write	Telefonska - spreminjanje	t
00030000-5698-db84-9662-c2cb5040e404	TerminStoritve-read	TerminStoritve - branje	t
00030000-5698-db84-e6f5-b54cd586504b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5698-db84-aa2c-8ed15bba89ae	TipDodatka-read	TipDodatka - branje	t
00030000-5698-db84-67d1-e115b94f606e	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5698-db84-acfe-d35020cc36b7	TipFunkcije-read	TipFunkcije - branje	t
00030000-5698-db84-18db-26d5ea1f9888	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5698-db84-0f31-7841c3022237	TipPopa-read	TipPopa - branje	t
00030000-5698-db84-20f2-9d1247336623	TipPopa-write	TipPopa - spreminjanje	t
00030000-5698-db84-55eb-255e58b8e217	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5698-db84-6b8e-60e0d031b022	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5698-db84-f1d0-189cfcab8646	TipVaje-read	TipVaje - branje	t
00030000-5698-db84-9046-61c806ad991f	TipVaje-write	TipVaje - spreminjanje	t
00030000-5698-db84-5b46-9a5f21cb19b7	Trr-read	Trr - branje	t
00030000-5698-db84-8b4d-a4d57708d5a9	Trr-write	Trr - spreminjanje	t
00030000-5698-db84-64bd-c6119088a45a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5698-db84-6cb4-8abe7c6e43c7	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5698-db84-c5bd-25e4c52ffd8a	Vaja-read	Vaja - branje	t
00030000-5698-db84-39fe-915979a88f13	Vaja-write	Vaja - spreminjanje	t
00030000-5698-db84-f001-bed4fe8fb48a	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5698-db84-fae1-806eaca46f93	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5698-db84-df41-ade21751d47a	VrstaStroska-read	VrstaStroska - branje	t
00030000-5698-db84-16d8-7377a0174301	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5698-db84-8c4a-8faf61eef3c1	Zaposlitev-read	Zaposlitev - branje	t
00030000-5698-db84-132a-6f4eaab6c8b9	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5698-db84-7a8d-71abd2b5199a	Zasedenost-read	Zasedenost - branje	t
00030000-5698-db84-3f92-74da21079b31	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5698-db84-a01c-993b5f2e6634	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5698-db84-2c5f-55106bd82523	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5698-db84-7613-12f4b34555db	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5698-db84-e252-ce9899d58064	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5698-db84-2930-87768bf67681	Job-read	Branje opravil - samo zase - branje	t
00030000-5698-db84-b4ea-f52bac24b3c8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5698-db84-5e8b-9b046c855dbd	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5698-db84-a0d5-5c16ccc6758a	Report-read	Report - branje	t
00030000-5698-db84-10f7-160be3bab45d	Report-write	Report - spreminjanje	t
00030000-5698-db84-d2b4-b417819fd6e7	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5698-db84-a0e9-5e72fff9bb5b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5698-db84-da4d-01b5adefc857	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5698-db84-b5d2-9e8211e4a5bc	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5698-db84-1cf2-b97abe06dfe2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5698-db84-bc31-01bc69d4aecf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5698-db84-7785-e12f53d9d0ae	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5698-db84-d125-caa858d9d0b1	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5698-db84-29f7-b01f093285fc	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5698-db84-5b3a-3632262218ae	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5698-db84-7b58-3f1a6a2b955d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5698-db84-5bdb-501779c2df33	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5698-db84-d1fb-be5c2d62b733	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5698-db84-f55b-f2cb2f92653e	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3147 (class 0 OID 36767670)
-- Dependencies: 181
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5698-db84-3cdf-5063681b199f	00030000-5698-db84-9291-4c0736466b68
00020000-5698-db84-3cdf-5063681b199f	00030000-5698-db84-cf04-d1a5bcba6556
00020000-5698-db84-8f2c-8e93412b069c	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-637e-dae5d9d1459b	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-a5b8-9584a69bb45d	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db84-a5b8-9584a69bb45d	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-a5b8-9584a69bb45d	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-a5b8-9584a69bb45d	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-a5b8-9584a69bb45d	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-a5b8-9584a69bb45d	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-132a-6f4eaab6c8b9
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-c515-3df408c881c6	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-b4c8-4017c6fbfaff	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-b4c8-4017c6fbfaff	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-b4c8-4017c6fbfaff	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-7713-eaf1232b4b31	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-62ec-106eb732db8a	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-62ec-106eb732db8a	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-62ec-106eb732db8a	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-62ec-106eb732db8a	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-d6c1-a3b27381fb4f	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-3e27-d4ecccc21c25	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-3f32-db08583babf9
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-3e29-69e1107725e7
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-e12e-2f3477207ecf
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-34ce-6c64a9fa3df6	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-945a-5c125eaaf4b7	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-6751-61b5f9052608	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-6751-61b5f9052608	00030000-5698-db84-20f2-9d1247336623
00020000-5698-db84-0072-cdc951567842	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-4ab7-579d0c7f5d32	00030000-5698-db84-4aba-098a65537071
00020000-5698-db84-4ab7-579d0c7f5d32	00030000-5698-db84-d193-b79b617a7880
00020000-5698-db84-cf0c-81134b10df00	00030000-5698-db84-4aba-098a65537071
00020000-5698-db84-ed9f-d2d119a36a82	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-ed9f-d2d119a36a82	00030000-5698-db84-ee07-ce976068c53d
00020000-5698-db84-c2e3-e50bf94c97d6	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-04be-de82505a2dd5	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db84-04be-de82505a2dd5	00030000-5698-db84-e252-ce9899d58064
00020000-5698-db84-723d-c73a095d3e3b	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db84-4f46-d08c57a66885	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db84-4f46-d08c57a66885	00030000-5698-db84-2c5f-55106bd82523
00020000-5698-db84-2e23-4a73a553749b	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db84-88c1-d84cb427d808	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db84-88c1-d84cb427d808	00030000-5698-db84-851d-f3b369bbea67
00020000-5698-db84-b5f7-83febb159ca4	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db84-1fdd-55d612822a56	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db84-1fdd-55d612822a56	00030000-5698-db84-e78e-66a3e2e829aa
00020000-5698-db84-1fdd-55d612822a56	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-1fdd-55d612822a56	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-1fdd-55d612822a56	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db84-1fdd-55d612822a56	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-1b6e-7f39bdb1b6fe	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db84-1b6e-7f39bdb1b6fe	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-1b6e-7f39bdb1b6fe	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-8d7c-93a02e16d875	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db84-8d7c-93a02e16d875	00030000-5698-db84-16d8-7377a0174301
00020000-5698-db84-6797-34c50960f1ae	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-88bc-74fe9aa9a40c
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-87a3-2554850e88e4	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-98ce-ff5e553f5c92	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-98ce-ff5e553f5c92	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-98ce-ff5e553f5c92	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-98ce-ff5e553f5c92	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-98ce-ff5e553f5c92	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-5fbb-1499a884ab00	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db84-5fbb-1499a884ab00	00030000-5698-db84-9046-61c806ad991f
00020000-5698-db84-2215-e2139f26d33a	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-4554-ab8533bb9078
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-a1c0-f828049177d0
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-fa25-0b0e11da3627
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-a8c3-199ae2001be3
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-239f-fd47bee2164a
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-bc4d-f1ce1345c842
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-e7f6-81f1a928d097
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-8adc-9bcfb4db2aed
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-9ed5-7c93a7ebabb6
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-b01f-aafd52f1f711
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-7410-635e205b7aa6
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-58af-775e140273c2
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-42ba-c1500c9c10a1
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-95e0-363a04100a2b
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-953c-aad0f0343b09
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-7c14-533d0425cf17
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-2840-1f8f9ff4652b
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-0910-e7274c198668
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-efbf-e288773dec14
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-5f39-fd0b0cb83df6
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-bc3d-f9bc462e08ca
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-93cf-fad67357dfae
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-6d73-c9542d59325a
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-0afc-b0dd60fc939a
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-70bf-40b7056eeb6f
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-b4ea-f52bac24b3c8
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-1948-30e51a535616
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-7210-760c6676b053
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-e989-1029a0d12d70
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-2930-87768bf67681
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-1f07-977158bec5db	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-fa25-0b0e11da3627
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-239f-fd47bee2164a
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-e7f6-81f1a928d097
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-9ed5-7c93a7ebabb6
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-7410-635e205b7aa6
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-42ba-c1500c9c10a1
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-953c-aad0f0343b09
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-2840-1f8f9ff4652b
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-efbf-e288773dec14
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-bc3d-f9bc462e08ca
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-7210-760c6676b053
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-1948-30e51a535616
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-e989-1029a0d12d70
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-2930-87768bf67681
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-8e24-18d263b51655	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-44f5-9e81926886a4
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-2d8c-27b240d6985a	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-ad2b-eba787702d16	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-9bc9-39be14dc81cf	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-9d95-9f12de61438b
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-785f-18c84d87522d	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-2ebf-5c46624673a3	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-0139-25493b01bdb9	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-8793-a2bac5379b32	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-8793-a2bac5379b32	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db84-8793-a2bac5379b32	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-8793-a2bac5379b32	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-e4e0-6aa7e1b5046e	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-e4e0-6aa7e1b5046e	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-1948-30e51a535616
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-0afc-b0dd60fc939a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-44f5-9e81926886a4
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-2930-87768bf67681
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-b4ea-f52bac24b3c8
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-9d95-9f12de61438b
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-4aba-098a65537071
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-e989-1029a0d12d70
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-70bf-40b7056eeb6f
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-7210-760c6676b053
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-6d73-c9542d59325a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-4554-ab8533bb9078
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-fa25-0b0e11da3627
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-a1c0-f828049177d0
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-a8c3-199ae2001be3
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-239f-fd47bee2164a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-bc4d-f1ce1345c842
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-e7f6-81f1a928d097
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-8adc-9bcfb4db2aed
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-9ed5-7c93a7ebabb6
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-b01f-aafd52f1f711
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-7410-635e205b7aa6
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-58af-775e140273c2
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-42ba-c1500c9c10a1
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-95e0-363a04100a2b
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-953c-aad0f0343b09
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-7c14-533d0425cf17
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-2840-1f8f9ff4652b
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-0910-e7274c198668
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-efbf-e288773dec14
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-5f39-fd0b0cb83df6
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-bc3d-f9bc462e08ca
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-93cf-fad67357dfae
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db84-02d0-9441895bcf56	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-4aba-098a65537071
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db84-a577-98d0d26f1c49	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-44f5-9e81926886a4
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-4aba-098a65537071
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db84-814e-f4b290c44f0d	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-1948-30e51a535616
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-0afc-b0dd60fc939a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-44f5-9e81926886a4
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-2930-87768bf67681
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-b4ea-f52bac24b3c8
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-3e29-69e1107725e7
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-9d95-9f12de61438b
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-3f32-db08583babf9
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-4aba-098a65537071
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-e989-1029a0d12d70
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-70bf-40b7056eeb6f
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-7210-760c6676b053
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-6d73-c9542d59325a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-e12e-2f3477207ecf
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-4554-ab8533bb9078
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-fa25-0b0e11da3627
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-a1c0-f828049177d0
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-a8c3-199ae2001be3
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-239f-fd47bee2164a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-bc4d-f1ce1345c842
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-e7f6-81f1a928d097
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-8adc-9bcfb4db2aed
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-9ed5-7c93a7ebabb6
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-b01f-aafd52f1f711
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-7410-635e205b7aa6
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-58af-775e140273c2
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-42ba-c1500c9c10a1
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-95e0-363a04100a2b
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-953c-aad0f0343b09
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-7c14-533d0425cf17
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-2840-1f8f9ff4652b
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-0910-e7274c198668
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-efbf-e288773dec14
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-5f39-fd0b0cb83df6
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-bc3d-f9bc462e08ca
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-93cf-fad67357dfae
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-132a-6f4eaab6c8b9
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db85-9baa-3f2ae4bb6d55	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-44f5-9e81926886a4
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-3e29-69e1107725e7
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-3f32-db08583babf9
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-4aba-098a65537071
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-e12e-2f3477207ecf
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-132a-6f4eaab6c8b9
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db85-bb59-73dd3cd8fc28	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-4aba-098a65537071
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db85-d50c-923239f3fba7	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-1948-30e51a535616
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-0afc-b0dd60fc939a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-2930-87768bf67681
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-b4ea-f52bac24b3c8
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-3e29-69e1107725e7
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-88bc-74fe9aa9a40c
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-9d95-9f12de61438b
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-3f32-db08583babf9
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-4aba-098a65537071
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-e989-1029a0d12d70
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-70bf-40b7056eeb6f
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-7210-760c6676b053
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-6d73-c9542d59325a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-e12e-2f3477207ecf
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-4554-ab8533bb9078
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-fa25-0b0e11da3627
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-a1c0-f828049177d0
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-a8c3-199ae2001be3
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-239f-fd47bee2164a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-bc4d-f1ce1345c842
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-e7f6-81f1a928d097
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-8adc-9bcfb4db2aed
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-9ed5-7c93a7ebabb6
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-b01f-aafd52f1f711
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-7410-635e205b7aa6
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-58af-775e140273c2
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-42ba-c1500c9c10a1
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-95e0-363a04100a2b
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-953c-aad0f0343b09
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-7c14-533d0425cf17
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-2840-1f8f9ff4652b
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-0910-e7274c198668
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-efbf-e288773dec14
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-5f39-fd0b0cb83df6
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-bc3d-f9bc462e08ca
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-93cf-fad67357dfae
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-16d8-7377a0174301
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-132a-6f4eaab6c8b9
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db85-ce96-f2320ce1cc69	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-cf04-d1a5bcba6556
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9291-4c0736466b68
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6bb2-4c75885e0a7a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-851d-f3b369bbea67
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-1645-c1e611317856
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-c269-cffc4f564009
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ff00-e211085cc88a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9f9b-454d305fdc2f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-bdbb-de0fca833b6b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7c3c-f6583282bb93
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-36f5-905d5ca90b58
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-136b-1dda0c015b46
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-97dc-32b379f007e6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-95d9-ab6bc8fc17d3
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9b1c-7018cb3cca32
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ca39-3809a9aa5afc
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b416-27a55111af97
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ce07-bfe16011ad61
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-61f0-bc16b133fae0
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-2321-1f0a55733b95
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9559-616960cb28d6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-1948-30e51a535616
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-0afc-b0dd60fc939a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-fb9a-09305a3e81fb
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ee07-ce976068c53d
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9b8c-810cb774bfa6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5774-7187b0b27e0c
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-44f5-9e81926886a4
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a602-15c082c3ee7f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-525e-7e585ac1c67f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5e8b-9b046c855dbd
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-2930-87768bf67681
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b4ea-f52bac24b3c8
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-49bb-d2e2602e4973
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3e29-69e1107725e7
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-8fc6-6b4c7a4c8d60
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f2ba-ae97473d6f67
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7785-e12f53d9d0ae
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-bc31-01bc69d4aecf
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a0e9-5e72fff9bb5b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-da4d-01b5adefc857
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b5d2-9e8211e4a5bc
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-1cf2-b97abe06dfe2
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a2ca-183279ecd330
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f006-1ac2448f3a0f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-db1b-69aaed70cbe9
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-c300-576876a3c709
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6199-6757cbbf945e
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-d412-2b04b4f2df10
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-d446-6f32be0606d2
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-88bc-74fe9aa9a40c
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f8fe-d57fafe1efee
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-dc5d-06a3b61ce7b4
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-1a86-53da82f94194
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-15c6-7191ca30e18f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9d95-9f12de61438b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3f32-db08583babf9
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-4aba-098a65537071
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e989-1029a0d12d70
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-70bf-40b7056eeb6f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-819f-b3081883f040
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ac13-c1d67d52e376
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-d193-b79b617a7880
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b263-1e8b4139469f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5efc-ef1935ac16f2
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6bf5-877f190bcb73
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9199-ccdd487ae4db
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-878c-1ab779ae0977
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-ae19-f830b36c55c8
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7210-760c6676b053
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6d73-c9542d59325a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-26ea-1ed822a2bc55
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e12e-2f3477207ecf
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-4554-ab8533bb9078
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-fa25-0b0e11da3627
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a1c0-f828049177d0
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a8c3-199ae2001be3
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-239f-fd47bee2164a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-bc4d-f1ce1345c842
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e7f6-81f1a928d097
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-8adc-9bcfb4db2aed
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9ed5-7c93a7ebabb6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b01f-aafd52f1f711
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7410-635e205b7aa6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-58af-775e140273c2
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-42ba-c1500c9c10a1
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-95e0-363a04100a2b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-953c-aad0f0343b09
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7c14-533d0425cf17
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-2840-1f8f9ff4652b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-0910-e7274c198668
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-efbf-e288773dec14
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5f39-fd0b0cb83df6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-bc3d-f9bc462e08ca
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-93cf-fad67357dfae
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b939-5f17e6342f58
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e78e-66a3e2e829aa
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9211-4f1f66bcf820
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6146-b08b730eec0f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-05f1-8ec819b7abd9
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-140b-5b374595a7e2
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-cfe8-093b68845fd6
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-c908-0be3d6c90722
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-8ca5-e93802491125
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-21fe-e55e3c8e6df8
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a0d5-5c16ccc6758a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-10f7-160be3bab45d
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a0a1-98f39422270b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3944-a6be272965a2
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f5bc-ebc1f9757b84
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-b707-88d9ec5a9cbf
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-2ff3-4f872858fc78
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a558-997450b60bea
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-90f9-51b33db37831
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6c11-db18e975ddf5
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3baf-28f01ce118ce
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7274-3b42e45ea2ea
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-d2b4-b417819fd6e7
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9662-c2cb5040e404
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a9f6-169265e9af0b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e6f5-b54cd586504b
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-acfe-d35020cc36b7
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-18db-26d5ea1f9888
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-0f31-7841c3022237
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-20f2-9d1247336623
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-55eb-255e58b8e217
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6b8e-60e0d031b022
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f1d0-189cfcab8646
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-9046-61c806ad991f
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-c5bd-25e4c52ffd8a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-39fe-915979a88f13
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-f001-bed4fe8fb48a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-fae1-806eaca46f93
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-df41-ade21751d47a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-16d8-7377a0174301
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-d1fb-be5c2d62b733
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5bdb-501779c2df33
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-132a-6f4eaab6c8b9
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7a8d-71abd2b5199a
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-3f92-74da21079b31
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-a01c-993b5f2e6634
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-2c5f-55106bd82523
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-7613-12f4b34555db
00020000-5698-db86-e2cc-9da67355c3ba	00030000-5698-db84-e252-ce9899d58064
00020000-5698-db86-e1f6-b11eb61f790f	00030000-5698-db84-7b58-3f1a6a2b955d
00020000-5698-db86-81c3-3af00921c5d1	00030000-5698-db84-5b3a-3632262218ae
00020000-5698-db86-5c08-a989354fab7c	00030000-5698-db84-6cb4-8abe7c6e43c7
00020000-5698-db86-90c7-019490c304dd	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db86-625b-bd1d0cc891ce	00030000-5698-db84-da4d-01b5adefc857
00020000-5698-db86-e5a4-ec1a913aa645	00030000-5698-db84-b5d2-9e8211e4a5bc
00020000-5698-db86-6ac5-a3a0741459dd	00030000-5698-db84-1cf2-b97abe06dfe2
00020000-5698-db86-246b-777359fa01f6	00030000-5698-db84-a0e9-5e72fff9bb5b
00020000-5698-db86-18b6-1664ced4bba3	00030000-5698-db84-7785-e12f53d9d0ae
00020000-5698-db86-160b-806736fdf1fb	00030000-5698-db84-bc31-01bc69d4aecf
00020000-5698-db86-8965-46b20a12f47b	00030000-5698-db84-29f7-b01f093285fc
00020000-5698-db86-0957-4466f418376a	00030000-5698-db84-d125-caa858d9d0b1
00020000-5698-db86-e507-70228307e2bf	00030000-5698-db84-e23d-d71175a909c6
00020000-5698-db86-1ad8-0c78891f2164	00030000-5698-db84-4915-4766bbdfe64d
00020000-5698-db86-0b02-3706ff51caf5	00030000-5698-db84-020a-1d3d2611e29a
00020000-5698-db86-307d-e4e9dd7f49d4	00030000-5698-db84-24ba-6d2bc68c14a4
00020000-5698-db86-5eea-ca5a1d1bac97	00030000-5698-db84-ce75-96b8d0b65d33
00020000-5698-db86-6402-ba87ba45a41b	00030000-5698-db84-f55b-f2cb2f92653e
00020000-5698-db86-e116-ceec23086adf	00030000-5698-db84-9547-388f20a5e575
00020000-5698-db86-e116-ceec23086adf	00030000-5698-db84-3f32-db08583babf9
00020000-5698-db86-e116-ceec23086adf	00030000-5698-db84-64bd-c6119088a45a
00020000-5698-db86-7459-c599a40c4f11	00030000-5698-db84-5b46-9a5f21cb19b7
00020000-5698-db86-df0b-4508bfe05e1a	00030000-5698-db84-8b4d-a4d57708d5a9
00020000-5698-db86-26ef-2dd31d3e244a	00030000-5698-db84-d2b4-b417819fd6e7
00020000-5698-db86-23aa-904b8e8a1ff9	00030000-5698-db84-69de-1a4186c9cb19
00020000-5698-db86-0f17-3139ecbb258f	00030000-5698-db84-3615-2bb1581ce305
00020000-5698-db86-b0d6-db511534dad9	00030000-5698-db84-3ea8-04062ab16494
00020000-5698-db86-1b41-b6f1c3476461	00030000-5698-db84-21ae-2b3b93a24f39
00020000-5698-db86-39fe-915a435f6032	00030000-5698-db84-8c4a-8faf61eef3c1
00020000-5698-db86-8104-d35b4a5f5b83	00030000-5698-db84-132a-6f4eaab6c8b9
00020000-5698-db86-cce0-f4083d73e89b	00030000-5698-db84-e2c4-dc4e01950460
00020000-5698-db86-1477-b7d4bce86687	00030000-5698-db84-9d95-9f12de61438b
00020000-5698-db86-49fe-46ed8fdf5c11	00030000-5698-db84-8af6-a7c469c1353f
00020000-5698-db86-079e-d9dabc3cf93b	00030000-5698-db84-3779-f10cf5f92121
00020000-5698-db86-917c-46adfb78d131	00030000-5698-db84-b699-72323fb6b23a
00020000-5698-db86-f5c4-1b3535aec343	00030000-5698-db84-0ff0-6ca3260ca1c3
00020000-5698-db86-254a-7b16586e059c	00030000-5698-db84-4280-2e5b5598709a
00020000-5698-db86-381b-88bd2aa06fdf	00030000-5698-db84-c2d3-1a610c6705cc
00020000-5698-db86-d885-b4389c8df500	00030000-5698-db84-9866-a1915265a2cb
00020000-5698-db86-3ed9-2744de647811	00030000-5698-db84-44f5-9e81926886a4
\.


--
-- TOC entry 3187 (class 0 OID 36768077)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 36768111)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 36768244)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5698-db87-dcae-3574e82bf6a5	00090000-5698-db87-91f9-38353c24da4d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5698-db87-2790-240d3f566cb5	00090000-5698-db87-dedb-a195b8dcbbd7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5698-db87-d16b-da8858e326d4	00090000-5698-db87-085e-cae05e059ab6	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5698-db87-3617-41daabfd8688	00090000-5698-db87-92b4-c27ed1cf4c39	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3155 (class 0 OID 36767752)
-- Dependencies: 189
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5698-db87-1118-67e4a5e41a7d	\N	00040000-5698-db84-f757-5c99083c1982	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-be30-cfb7320558fa	\N	00040000-5698-db84-f757-5c99083c1982	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5698-db87-4f1c-fb40df1d5c29	\N	00040000-5698-db84-f757-5c99083c1982	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-5468-7e9f18904d00	\N	00040000-5698-db84-f757-5c99083c1982	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-3529-b385ce5bb8b4	\N	00040000-5698-db84-f757-5c99083c1982	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-8d8e-48b265e07ce8	\N	00040000-5698-db84-8b3a-5c9faad6fe6b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-7594-0a7e0f9905a7	\N	00040000-5698-db84-776d-d9a17ece8b88	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-3472-c769b6757ae2	\N	00040000-5698-db84-1626-637dbbfd644c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db87-38df-6c171487603b	\N	00040000-5698-db84-ea1a-faa80d4cbd0a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5698-db88-e65b-8b3249c1b073	\N	00040000-5698-db84-f757-5c99083c1982	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3158 (class 0 OID 36767797)
-- Dependencies: 192
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5698-db83-b565-4aa46950faa0	8341	Adlešiči
00050000-5698-db83-c272-2f37186d4b1a	5270	Ajdovščina
00050000-5698-db83-4afd-d87af820cb81	6280	Ankaran/Ancarano
00050000-5698-db83-8aed-cbbd54163457	9253	Apače
00050000-5698-db83-eb7a-38e679e36391	8253	Artiče
00050000-5698-db83-9ec2-4fa4a287768f	4275	Begunje na Gorenjskem
00050000-5698-db83-9b26-7722d663a2c8	1382	Begunje pri Cerknici
00050000-5698-db83-1e97-43f50401e5b5	9231	Beltinci
00050000-5698-db83-25e3-b2ae8ae702bb	2234	Benedikt
00050000-5698-db83-28fd-6858d9f2f9b5	2345	Bistrica ob Dravi
00050000-5698-db83-2263-904c82653676	3256	Bistrica ob Sotli
00050000-5698-db83-601c-e1bc03cfaa67	8259	Bizeljsko
00050000-5698-db83-b363-7188041b2fa7	1223	Blagovica
00050000-5698-db83-7373-ee6e878d5e78	8283	Blanca
00050000-5698-db83-0131-94bcad7e76db	4260	Bled
00050000-5698-db83-0b8c-eef03354ebcb	4273	Blejska Dobrava
00050000-5698-db83-e65f-a23daadb5514	9265	Bodonci
00050000-5698-db83-645a-ed9583f645c9	9222	Bogojina
00050000-5698-db83-0ad7-bb9b185f4c8a	4263	Bohinjska Bela
00050000-5698-db83-24c0-5c2c06bd5646	4264	Bohinjska Bistrica
00050000-5698-db83-c62c-dd732a7de970	4265	Bohinjsko jezero
00050000-5698-db83-d2d5-5ec17054efca	1353	Borovnica
00050000-5698-db83-6413-74d61e3e0a5e	8294	Boštanj
00050000-5698-db83-a06a-1c44d06e6afc	5230	Bovec
00050000-5698-db83-c111-7fad8353bc60	5295	Branik
00050000-5698-db83-e420-9f04aa1aa928	3314	Braslovče
00050000-5698-db83-d140-f05dbfb828c5	5223	Breginj
00050000-5698-db83-6826-7acee461fa1c	8280	Brestanica
00050000-5698-db83-daf5-9bb65e5e0f77	2354	Bresternica
00050000-5698-db83-ab2f-4062612ab618	4243	Brezje
00050000-5698-db83-c75e-6974585c9063	1351	Brezovica pri Ljubljani
00050000-5698-db83-a235-f749e7d67a7d	8250	Brežice
00050000-5698-db83-5da5-d43c3ed0d523	4210	Brnik - Aerodrom
00050000-5698-db83-cd8b-b255f05b202e	8321	Brusnice
00050000-5698-db83-b902-fd0cd51cfbe5	3255	Buče
00050000-5698-db83-e8f2-97013dbb88f7	8276	Bučka 
00050000-5698-db83-b4e6-6db7cc0d397e	9261	Cankova
00050000-5698-db83-2477-83e7dd1500b7	3000	Celje 
00050000-5698-db83-e467-7545cb5629cc	3001	Celje - poštni predali
00050000-5698-db83-317c-0f4c11ac4c97	4207	Cerklje na Gorenjskem
00050000-5698-db83-14e7-8b8f716f5644	8263	Cerklje ob Krki
00050000-5698-db83-1c32-838d1222495c	1380	Cerknica
00050000-5698-db83-32d6-611e5d12dbb4	5282	Cerkno
00050000-5698-db83-8936-9ef83e53c366	2236	Cerkvenjak
00050000-5698-db83-3c46-2762ba715d84	2215	Ceršak
00050000-5698-db83-d4a2-7cd460175c70	2326	Cirkovce
00050000-5698-db83-47ea-778d51843d99	2282	Cirkulane
00050000-5698-db83-c004-961d5e61ea43	5273	Col
00050000-5698-db83-a7bf-c19e2f527d84	8251	Čatež ob Savi
00050000-5698-db83-ee3b-5d56962101bb	1413	Čemšenik
00050000-5698-db83-dc60-bacdf85a286c	5253	Čepovan
00050000-5698-db83-508c-efaf7ad2aa45	9232	Črenšovci
00050000-5698-db83-6b3f-0270b32dc1b7	2393	Črna na Koroškem
00050000-5698-db83-0858-b20b1a1b74ce	6275	Črni Kal
00050000-5698-db83-8156-d02a44869657	5274	Črni Vrh nad Idrijo
00050000-5698-db83-355d-cfba1648b772	5262	Črniče
00050000-5698-db83-c5da-fa72be12810b	8340	Črnomelj
00050000-5698-db83-9cb8-7a914a823292	6271	Dekani
00050000-5698-db83-2de2-4bf8d3353fbc	5210	Deskle
00050000-5698-db83-adfd-e2cbef24f79c	2253	Destrnik
00050000-5698-db83-b552-975b37262c8e	6215	Divača
00050000-5698-db83-dca3-fecf3ec59b7a	1233	Dob
00050000-5698-db83-c74c-fc2ca2465224	3224	Dobje pri Planini
00050000-5698-db83-ac5a-9049f8ac3154	8257	Dobova
00050000-5698-db83-cde9-f63a2ae8d0f3	1423	Dobovec
00050000-5698-db83-36ad-0389894fa3ba	5263	Dobravlje
00050000-5698-db83-a2e9-7af7842817a9	3204	Dobrna
00050000-5698-db83-3a7f-8939e4ecda5e	8211	Dobrnič
00050000-5698-db83-ce0b-506c3d545e6f	1356	Dobrova
00050000-5698-db83-9e95-822b9c967653	9223	Dobrovnik/Dobronak 
00050000-5698-db83-ef0e-9bb50ad80d36	5212	Dobrovo v Brdih
00050000-5698-db83-2403-ffc4ebff0b5f	1431	Dol pri Hrastniku
00050000-5698-db83-11e7-539a2a5c4527	1262	Dol pri Ljubljani
00050000-5698-db83-9e81-e204de7850ca	1273	Dole pri Litiji
00050000-5698-db83-2709-b27cdb25ac80	1331	Dolenja vas
00050000-5698-db83-0bcb-c9ef87626254	8350	Dolenjske Toplice
00050000-5698-db83-35d5-3c2f54ebcd8b	1230	Domžale
00050000-5698-db83-cebd-0ceb1a5d313c	2252	Dornava
00050000-5698-db83-1f8e-c75a9daf7e1c	5294	Dornberk
00050000-5698-db83-f7bf-4a540898c94a	1319	Draga
00050000-5698-db83-1a5d-55c07b14ab21	8343	Dragatuš
00050000-5698-db83-6a07-4c8942f1f8f8	3222	Dramlje
00050000-5698-db83-beec-60bcc32a9c29	2370	Dravograd
00050000-5698-db83-3d60-f6a2a7c82946	4203	Duplje
00050000-5698-db83-969d-c9c67fe905f4	6221	Dutovlje
00050000-5698-db83-c7e3-445cccf49c1b	8361	Dvor
00050000-5698-db83-89ab-24115fb51d44	2343	Fala
00050000-5698-db83-6f0d-51a40a7167fa	9208	Fokovci
00050000-5698-db83-eb0a-badd606c0c28	2313	Fram
00050000-5698-db83-0d4e-395f0d0c2229	3213	Frankolovo
00050000-5698-db83-26b6-abca34df0c0c	1274	Gabrovka
00050000-5698-db83-1768-29d514f3e246	8254	Globoko
00050000-5698-db83-478d-ea15b8d22ae9	5275	Godovič
00050000-5698-db83-c0c3-b414aa8a726e	4204	Golnik
00050000-5698-db83-5944-1bc732fb9a77	3303	Gomilsko
00050000-5698-db83-0036-f87e3ea4458a	4224	Gorenja vas
00050000-5698-db83-49ad-01739798bc13	3263	Gorica pri Slivnici
00050000-5698-db83-df88-7920e084ba83	2272	Gorišnica
00050000-5698-db83-49fb-0fa9e2dbe3de	9250	Gornja Radgona
00050000-5698-db83-8c84-41cdd618a045	3342	Gornji Grad
00050000-5698-db83-0974-1682ba40a56b	4282	Gozd Martuljek
00050000-5698-db83-21de-7b9f459bab20	6272	Gračišče
00050000-5698-db83-7d77-fcd616a0ed28	9264	Grad
00050000-5698-db83-8e9d-64b5c75e78cf	8332	Gradac
00050000-5698-db83-3bb3-46014173868a	1384	Grahovo
00050000-5698-db83-f4ff-1c0b4f995520	5242	Grahovo ob Bači
00050000-5698-db83-77b6-a818d146ea1f	5251	Grgar
00050000-5698-db83-3f6d-4a58e45c53df	3302	Griže
00050000-5698-db83-d292-4b0243c6dcfe	3231	Grobelno
00050000-5698-db83-dfd6-1c32991ff0a5	1290	Grosuplje
00050000-5698-db83-6efa-e8cea81fe2a7	2288	Hajdina
00050000-5698-db83-bd82-96f33c2f84a6	8362	Hinje
00050000-5698-db83-c918-9a0a77bd500a	2311	Hoče
00050000-5698-db83-e3c8-bf5f29ab4369	9205	Hodoš/Hodos
00050000-5698-db83-45d1-9374691150a9	1354	Horjul
00050000-5698-db83-67e8-2fec14679c7b	1372	Hotedršica
00050000-5698-db83-3251-22782720e7d8	1430	Hrastnik
00050000-5698-db83-7ee4-5887b5d00f68	6225	Hruševje
00050000-5698-db83-c791-79bd5efd2d25	4276	Hrušica
00050000-5698-db83-2770-88c76f5206fe	5280	Idrija
00050000-5698-db83-eef1-59d5e7aac2c5	1292	Ig
00050000-5698-db83-ac54-613ea9542f51	6250	Ilirska Bistrica
00050000-5698-db83-b917-f6413b555431	6251	Ilirska Bistrica-Trnovo
00050000-5698-db83-642f-2169ff6627d6	1295	Ivančna Gorica
00050000-5698-db83-a130-59f5d0a5592b	2259	Ivanjkovci
00050000-5698-db83-3447-bbf7f25afff3	1411	Izlake
00050000-5698-db83-1831-dd5e7ac10527	6310	Izola/Isola
00050000-5698-db83-d284-8856606e31bd	2222	Jakobski Dol
00050000-5698-db83-8fdc-035d3ca08142	2221	Jarenina
00050000-5698-db83-6000-da8b3cd55f5a	6254	Jelšane
00050000-5698-db83-8e67-ce586b2c056f	4270	Jesenice
00050000-5698-db83-feb8-f20e761937d9	8261	Jesenice na Dolenjskem
00050000-5698-db83-48ab-5ce5ac164c03	3273	Jurklošter
00050000-5698-db83-d39f-59d8f56604ca	2223	Jurovski Dol
00050000-5698-db83-b2dd-77bb12bca4eb	2256	Juršinci
00050000-5698-db83-93ea-bd8977ff914d	5214	Kal nad Kanalom
00050000-5698-db83-865b-25dc6a97c453	3233	Kalobje
00050000-5698-db83-67fa-c98dd20ce5e5	4246	Kamna Gorica
00050000-5698-db83-a8c7-2a6ac8ac262c	2351	Kamnica
00050000-5698-db83-7bce-b0255f49a489	1241	Kamnik
00050000-5698-db83-062b-57d0ed3e245c	5213	Kanal
00050000-5698-db83-bb49-ef2bc6668688	8258	Kapele
00050000-5698-db83-da52-82d4d2bf2530	2362	Kapla
00050000-5698-db83-dec9-e82c7a4fdb10	2325	Kidričevo
00050000-5698-db83-8ce0-c4e753da5a40	1412	Kisovec
00050000-5698-db83-1a26-d10537e0b0b7	6253	Knežak
00050000-5698-db83-cc2d-b318dc5e6488	5222	Kobarid
00050000-5698-db83-fdf2-b30259e70fe0	9227	Kobilje
00050000-5698-db83-b499-d11479a7d1ff	1330	Kočevje
00050000-5698-db83-e959-5d156b29e92e	1338	Kočevska Reka
00050000-5698-db83-9830-b4de4d77e9d9	2276	Kog
00050000-5698-db83-b0e1-10ffedb330db	5211	Kojsko
00050000-5698-db83-e738-ee14179a5a1c	6223	Komen
00050000-5698-db83-1cb5-e03905650501	1218	Komenda
00050000-5698-db83-9d39-4c646584aead	6000	Koper/Capodistria 
00050000-5698-db83-972d-64b785cd1d1d	6001	Koper/Capodistria - poštni predali
00050000-5698-db83-b0eb-3e1edb2cde68	8282	Koprivnica
00050000-5698-db83-a2cd-0fb3b065a827	5296	Kostanjevica na Krasu
00050000-5698-db83-9b62-711195983ee1	8311	Kostanjevica na Krki
00050000-5698-db83-dc7f-3dade6aec912	1336	Kostel
00050000-5698-db83-42b7-e90f83863f6e	6256	Košana
00050000-5698-db83-4ff8-f3cb69d6e16f	2394	Kotlje
00050000-5698-db83-da76-127b781c5dea	6240	Kozina
00050000-5698-db83-de90-e688bdeb48f4	3260	Kozje
00050000-5698-db83-3e4b-7a925d2d2196	4000	Kranj 
00050000-5698-db83-8db3-43fa49deeb44	4001	Kranj - poštni predali
00050000-5698-db83-161e-c414090300e4	4280	Kranjska Gora
00050000-5698-db83-740d-673dad318db4	1281	Kresnice
00050000-5698-db83-3321-1255788953a6	4294	Križe
00050000-5698-db83-34eb-91dfdd4fce85	9206	Križevci
00050000-5698-db83-5798-bc3acd79dfac	9242	Križevci pri Ljutomeru
00050000-5698-db83-bfdb-8addb15aac43	1301	Krka
00050000-5698-db83-d40c-b0f18f08dd5b	8296	Krmelj
00050000-5698-db83-80d0-96084a71260f	4245	Kropa
00050000-5698-db83-63eb-8c619a814468	8262	Krška vas
00050000-5698-db83-1089-1f55e096d855	8270	Krško
00050000-5698-db83-9a48-77298cfd72ac	9263	Kuzma
00050000-5698-db83-b147-320b2726315c	2318	Laporje
00050000-5698-db83-4957-4ab8a218dd23	3270	Laško
00050000-5698-db83-feda-c04b36370a3b	1219	Laze v Tuhinju
00050000-5698-db83-6171-c28b19105e7b	2230	Lenart v Slovenskih goricah
00050000-5698-db83-606a-5aefad00e4b0	9220	Lendava/Lendva
00050000-5698-db83-a844-0207f8ffa550	4248	Lesce
00050000-5698-db83-b0b6-8282ce25f30a	3261	Lesično
00050000-5698-db83-f86c-9fed0ada6ebc	8273	Leskovec pri Krškem
00050000-5698-db83-3c1d-a813bfd17c09	2372	Libeliče
00050000-5698-db83-8833-d4b437f09c17	2341	Limbuš
00050000-5698-db83-a659-732ade4c4d57	1270	Litija
00050000-5698-db83-9f5a-d59b45b29758	3202	Ljubečna
00050000-5698-db83-1258-0292c9810fd5	1000	Ljubljana 
00050000-5698-db83-03e0-06c3f6cbcb89	1001	Ljubljana - poštni predali
00050000-5698-db83-22f7-41927e182ecd	1231	Ljubljana - Črnuče
00050000-5698-db83-1755-c99ca37b6cbb	1261	Ljubljana - Dobrunje
00050000-5698-db83-d7af-cca53914e72c	1260	Ljubljana - Polje
00050000-5698-db83-0968-9695b8c4c0d6	1210	Ljubljana - Šentvid
00050000-5698-db83-c434-0e3ea65d65a0	1211	Ljubljana - Šmartno
00050000-5698-db83-1d25-b120f00bd389	3333	Ljubno ob Savinji
00050000-5698-db83-4c59-d3e39d08b5bb	9240	Ljutomer
00050000-5698-db83-5f05-d3ec2ea42bc9	3215	Loče
00050000-5698-db83-12d8-a6da68da4c4e	5231	Log pod Mangartom
00050000-5698-db83-f7d7-6bdc3d3e8912	1358	Log pri Brezovici
00050000-5698-db83-8d37-3d0180de730c	1370	Logatec
00050000-5698-db83-6ea7-83b3958d5327	1371	Logatec
00050000-5698-db83-3b5c-f1137080b5a2	1434	Loka pri Zidanem Mostu
00050000-5698-db83-2ed5-d72a3a566e9e	3223	Loka pri Žusmu
00050000-5698-db83-a2a6-0066ec4da90d	6219	Lokev
00050000-5698-db83-8d62-d7aa8c08fefa	1318	Loški Potok
00050000-5698-db83-0c50-f3089451f68b	2324	Lovrenc na Dravskem polju
00050000-5698-db83-cbfe-a19986a53dd4	2344	Lovrenc na Pohorju
00050000-5698-db83-4130-d024de69996d	3334	Luče
00050000-5698-db83-e38e-6f7cb6ea4d2b	1225	Lukovica
00050000-5698-db83-8caa-83eb47b8a60a	9202	Mačkovci
00050000-5698-db83-3c35-fe29bd4956ea	2322	Majšperk
00050000-5698-db83-1fc7-2a65978acabd	2321	Makole
00050000-5698-db83-4e7e-c406beaf8b5a	9243	Mala Nedelja
00050000-5698-db83-064b-f2fc1a2ce69c	2229	Malečnik
00050000-5698-db83-ed9f-ff77a55a95bd	6273	Marezige
00050000-5698-db83-1112-967fd63917cf	2000	Maribor 
00050000-5698-db83-7df4-4b59f5cf92f8	2001	Maribor - poštni predali
00050000-5698-db83-ba48-5ba5a06c83bb	2206	Marjeta na Dravskem polju
00050000-5698-db83-7e9e-2a342b39db2f	2281	Markovci
00050000-5698-db83-aaeb-e207efaa672f	9221	Martjanci
00050000-5698-db83-550c-ef1589411b3f	6242	Materija
00050000-5698-db83-898a-90b4afe8c5f1	4211	Mavčiče
00050000-5698-db83-43dd-645ac484aa88	1215	Medvode
00050000-5698-db83-747c-6472843b0c8a	1234	Mengeš
00050000-5698-db83-ff88-b804693b4297	8330	Metlika
00050000-5698-db83-a216-081b4a7b8e3c	2392	Mežica
00050000-5698-db83-dc07-d7293f25683f	2204	Miklavž na Dravskem polju
00050000-5698-db83-7122-646bdabfd3ac	2275	Miklavž pri Ormožu
00050000-5698-db83-829b-8ed33173ba67	5291	Miren
00050000-5698-db83-fa8d-7192a9184417	8233	Mirna
00050000-5698-db83-fb5c-9e808db50e17	8216	Mirna Peč
00050000-5698-db83-1306-24c237506fc1	2382	Mislinja
00050000-5698-db83-f319-834af95ee8d0	4281	Mojstrana
00050000-5698-db83-e098-db338f7eacda	8230	Mokronog
00050000-5698-db83-6d16-32ee88099ae9	1251	Moravče
00050000-5698-db83-cfb4-edd5b7729bf2	9226	Moravske Toplice
00050000-5698-db83-2b90-52fb60224ae3	5216	Most na Soči
00050000-5698-db83-f01c-a92ae7e42571	1221	Motnik
00050000-5698-db83-7ca7-933aada5bf35	3330	Mozirje
00050000-5698-db83-2c3b-4f25de6542af	9000	Murska Sobota 
00050000-5698-db83-36cd-1649e2200bb3	9001	Murska Sobota - poštni predali
00050000-5698-db83-89f7-0c0ff96b6596	2366	Muta
00050000-5698-db83-a237-6ed70dbd1b7e	4202	Naklo
00050000-5698-db83-3dd3-4aa929de0097	3331	Nazarje
00050000-5698-db83-e193-49178fbad1d4	1357	Notranje Gorice
00050000-5698-db83-fc2e-77126f439d47	3203	Nova Cerkev
00050000-5698-db83-7976-fd8f74d2ce46	5000	Nova Gorica 
00050000-5698-db83-c6c3-f145edaa5cf8	5001	Nova Gorica - poštni predali
00050000-5698-db83-45a8-bfebf7a3306a	1385	Nova vas
00050000-5698-db83-aca9-132033d4c75b	8000	Novo mesto
00050000-5698-db83-4405-4b293d86a86e	8001	Novo mesto - poštni predali
00050000-5698-db83-d3c4-946cc6b6070b	6243	Obrov
00050000-5698-db83-aa61-4f58f1a83dc6	9233	Odranci
00050000-5698-db83-2580-d6c3cb52a035	2317	Oplotnica
00050000-5698-db83-8c79-660dd13f3f2e	2312	Orehova vas
00050000-5698-db83-dce2-a69ef47e657d	2270	Ormož
00050000-5698-db83-0c33-a0cea8905776	1316	Ortnek
00050000-5698-db83-8566-6cc7fc5f12a4	1337	Osilnica
00050000-5698-db83-9789-4431e57f5e93	8222	Otočec
00050000-5698-db83-0dac-a5e09a28b5ee	2361	Ožbalt
00050000-5698-db83-3938-91640462655b	2231	Pernica
00050000-5698-db83-fe28-2b444f32d95f	2211	Pesnica pri Mariboru
00050000-5698-db83-e693-d8bef933bd73	9203	Petrovci
00050000-5698-db83-45c6-3046ed47cada	3301	Petrovče
00050000-5698-db83-1875-8531b7922491	6330	Piran/Pirano
00050000-5698-db83-4baf-a20f47a2f6bb	8255	Pišece
00050000-5698-db83-1c5b-eca84f60a8e0	6257	Pivka
00050000-5698-db83-6930-110d55f33e7b	6232	Planina
00050000-5698-db83-b43a-6d42fd288c5c	3225	Planina pri Sevnici
00050000-5698-db83-8e76-c1e247406533	6276	Pobegi
00050000-5698-db83-8bdf-b9d1aa26b85e	8312	Podbočje
00050000-5698-db83-3e06-6ef52cbcd54c	5243	Podbrdo
00050000-5698-db83-f153-0b9cbde01039	3254	Podčetrtek
00050000-5698-db83-ba9d-ac283967ba3e	2273	Podgorci
00050000-5698-db83-fd91-a4f246705393	6216	Podgorje
00050000-5698-db83-f986-c0f3740570ac	2381	Podgorje pri Slovenj Gradcu
00050000-5698-db83-cc2d-97fe50045085	6244	Podgrad
00050000-5698-db83-0918-2b5c8d1305df	1414	Podkum
00050000-5698-db83-ce8e-47c4cb5f6944	2286	Podlehnik
00050000-5698-db83-98d8-873e581fc26a	5272	Podnanos
00050000-5698-db83-aa8e-e33a0da7a1e1	4244	Podnart
00050000-5698-db83-15df-a1576bbc7258	3241	Podplat
00050000-5698-db83-ac9b-1a9f2d1606ff	3257	Podsreda
00050000-5698-db83-a8e2-071cdee6c2b4	2363	Podvelka
00050000-5698-db83-9ec5-0014eb6fe500	2208	Pohorje
00050000-5698-db83-2d3f-6a913d1a3da0	2257	Polenšak
00050000-5698-db83-43e6-e2281243efbb	1355	Polhov Gradec
00050000-5698-db83-6392-981bff6898ba	4223	Poljane nad Škofjo Loko
00050000-5698-db83-dbf8-b2146fc13b99	2319	Poljčane
00050000-5698-db83-0c7d-86bc5cd54756	1272	Polšnik
00050000-5698-db83-3652-b3911a3147de	3313	Polzela
00050000-5698-db83-628d-09201dc39316	3232	Ponikva
00050000-5698-db83-5967-d54f1319e73b	6320	Portorož/Portorose
00050000-5698-db83-0216-2bc511c8f794	6230	Postojna
00050000-5698-db83-8171-913f62eb3c67	2331	Pragersko
00050000-5698-db83-e0d6-ed4c63c51e10	3312	Prebold
00050000-5698-db83-5100-a4bf47b9ad7a	4205	Preddvor
00050000-5698-db83-9a45-d625dfabef1a	6255	Prem
00050000-5698-db83-51d6-cd80927ba58c	1352	Preserje
00050000-5698-db83-9186-e59744c03491	6258	Prestranek
00050000-5698-db83-6232-581fb8d4dc55	2391	Prevalje
00050000-5698-db83-5d11-fc78f6c979ee	3262	Prevorje
00050000-5698-db83-27b5-5fd58a699119	1276	Primskovo 
00050000-5698-db83-8b3a-08aadef84ee8	3253	Pristava pri Mestinju
00050000-5698-db83-0878-490007797267	9207	Prosenjakovci/Partosfalva
00050000-5698-db83-6234-4233bc616aa6	5297	Prvačina
00050000-5698-db83-636a-cd3a33d451e4	2250	Ptuj
00050000-5698-db83-133c-4e0b2aa2a3a5	2323	Ptujska Gora
00050000-5698-db83-b4a8-fedc4ed463aa	9201	Puconci
00050000-5698-db83-21ff-f0a452a28243	2327	Rače
00050000-5698-db83-d9f6-4fb83d6360ce	1433	Radeče
00050000-5698-db83-2786-90329a2e6b9c	9252	Radenci
00050000-5698-db83-8fa7-c34dd1abb010	2360	Radlje ob Dravi
00050000-5698-db83-e61e-5fa6cc1f87a3	1235	Radomlje
00050000-5698-db83-079f-95b02d33d41a	4240	Radovljica
00050000-5698-db83-0a20-9437c400771f	8274	Raka
00050000-5698-db83-51cf-ac898e9200a2	1381	Rakek
00050000-5698-db83-0ece-397b124d0ce9	4283	Rateče - Planica
00050000-5698-db83-b908-1bf680ff40f8	2390	Ravne na Koroškem
00050000-5698-db83-7511-d2736de86f08	9246	Razkrižje
00050000-5698-db83-ded9-97fe012117b8	3332	Rečica ob Savinji
00050000-5698-db83-c73f-48d46a43c219	5292	Renče
00050000-5698-db83-e2e8-578c65e74f29	1310	Ribnica
00050000-5698-db83-05db-bbf847a90b6d	2364	Ribnica na Pohorju
00050000-5698-db83-21cb-7a414b6e6000	3272	Rimske Toplice
00050000-5698-db83-6c64-9da892b19d0e	1314	Rob
00050000-5698-db83-1081-cc7a4c438bb0	5215	Ročinj
00050000-5698-db83-8ce4-509cd7cdbd02	3250	Rogaška Slatina
00050000-5698-db83-609b-29e9b2652b6f	9262	Rogašovci
00050000-5698-db83-dca2-d836383c7d57	3252	Rogatec
00050000-5698-db83-e82e-28d411318ea4	1373	Rovte
00050000-5698-db83-5013-4b13a514815f	2342	Ruše
00050000-5698-db83-5289-707d2c59d1cc	1282	Sava
00050000-5698-db83-692b-2f884a7f2577	6333	Sečovlje/Sicciole
00050000-5698-db83-1ac8-0f0dea588015	4227	Selca
00050000-5698-db83-6cfd-e24490f6718b	2352	Selnica ob Dravi
00050000-5698-db83-6196-f10716a0d95d	8333	Semič
00050000-5698-db83-bf52-01a87691ae42	8281	Senovo
00050000-5698-db83-e7ec-3a8f53493081	6224	Senožeče
00050000-5698-db83-5fca-6257b8afef43	8290	Sevnica
00050000-5698-db83-5a65-2a30319e1459	6210	Sežana
00050000-5698-db83-46f3-50717092bd5c	2214	Sladki Vrh
00050000-5698-db83-f2e1-45506e2e42ec	5283	Slap ob Idrijci
00050000-5698-db83-5332-491e759cd666	2380	Slovenj Gradec
00050000-5698-db83-ecbb-129e8825d429	2310	Slovenska Bistrica
00050000-5698-db83-0086-698c9b579d8c	3210	Slovenske Konjice
00050000-5698-db83-e3a2-86b93107b388	1216	Smlednik
00050000-5698-db83-dc18-87aa7b074eec	5232	Soča
00050000-5698-db83-e039-dbd2f8814cbe	1317	Sodražica
00050000-5698-db83-0417-900685860907	3335	Solčava
00050000-5698-db83-4f8f-e3559d0fa63f	5250	Solkan
00050000-5698-db83-cc1c-3da50a18a5ea	4229	Sorica
00050000-5698-db83-4650-5a5576886495	4225	Sovodenj
00050000-5698-db83-9a37-3ada380581d7	5281	Spodnja Idrija
00050000-5698-db83-a0d6-754a3667e30a	2241	Spodnji Duplek
00050000-5698-db83-a106-d53fea41b414	9245	Spodnji Ivanjci
00050000-5698-db83-5d18-0d8361ec719a	2277	Središče ob Dravi
00050000-5698-db83-39b3-6000d953af17	4267	Srednja vas v Bohinju
00050000-5698-db83-d131-8fbb05e21e4e	8256	Sromlje 
00050000-5698-db83-6a80-9ca459d3134a	5224	Srpenica
00050000-5698-db83-0916-606bd7643697	1242	Stahovica
00050000-5698-db83-dc50-74f242fc87b6	1332	Stara Cerkev
00050000-5698-db83-18c8-63acd239353c	8342	Stari trg ob Kolpi
00050000-5698-db83-8179-3a1816cd25dd	1386	Stari trg pri Ložu
00050000-5698-db83-8a64-33324d273329	2205	Starše
00050000-5698-db83-435f-27321fc15fe5	2289	Stoperce
00050000-5698-db83-079b-eb019f5b7491	8322	Stopiče
00050000-5698-db83-232c-b08a69a0f002	3206	Stranice
00050000-5698-db83-c114-a1cce0a9bd12	8351	Straža
00050000-5698-db83-2abb-5242b5156a31	1313	Struge
00050000-5698-db83-b398-0979a4c1b10a	8293	Studenec
00050000-5698-db83-4790-9a94a8b81d52	8331	Suhor
00050000-5698-db83-048c-a42c26a1c020	2233	Sv. Ana v Slovenskih goricah
00050000-5698-db83-1741-3414ef12d6d2	2235	Sv. Trojica v Slovenskih goricah
00050000-5698-db83-cc82-180bb9154654	2353	Sveti Duh na Ostrem Vrhu
00050000-5698-db83-52ea-f334c2a9cb8a	9244	Sveti Jurij ob Ščavnici
00050000-5698-db83-1dde-b04370335027	3264	Sveti Štefan
00050000-5698-db83-f28e-6cd643cf52bb	2258	Sveti Tomaž
00050000-5698-db83-c40f-6216de64e9da	9204	Šalovci
00050000-5698-db83-464c-987bd2582516	5261	Šempas
00050000-5698-db83-523c-1c8ced4a7351	5290	Šempeter pri Gorici
00050000-5698-db83-bc93-724ead0ef41f	3311	Šempeter v Savinjski dolini
00050000-5698-db83-9244-e28223068593	4208	Šenčur
00050000-5698-db83-df10-9b273e2ea215	2212	Šentilj v Slovenskih goricah
00050000-5698-db83-60f7-cc6838c3ea31	8297	Šentjanž
00050000-5698-db83-e70b-815b8d1279c7	2373	Šentjanž pri Dravogradu
00050000-5698-db83-d471-9840f1ed4bc3	8310	Šentjernej
00050000-5698-db83-4739-b8e3de71201f	3230	Šentjur
00050000-5698-db83-f51e-7f309a9924f8	3271	Šentrupert
00050000-5698-db83-5bd3-540de90e25db	8232	Šentrupert
00050000-5698-db83-86be-c27fa9218abc	1296	Šentvid pri Stični
00050000-5698-db83-24cc-083a48171b22	8275	Škocjan
00050000-5698-db83-3e50-3fe7f0ff7ad2	6281	Škofije
00050000-5698-db83-79a1-b7bea9c1aa87	4220	Škofja Loka
00050000-5698-db83-fe9c-45c23ae49a47	3211	Škofja vas
00050000-5698-db83-7bfa-fa02d5e7f826	1291	Škofljica
00050000-5698-db83-ccd4-9b697a3a1d83	6274	Šmarje
00050000-5698-db83-6fa5-a14206659cd8	1293	Šmarje - Sap
00050000-5698-db83-e425-bf97fa7553d5	3240	Šmarje pri Jelšah
00050000-5698-db83-f70e-e9323f8089ae	8220	Šmarješke Toplice
00050000-5698-db83-15d5-a069a059ffa2	2315	Šmartno na Pohorju
00050000-5698-db83-34b3-203fb1af0f34	3341	Šmartno ob Dreti
00050000-5698-db83-72ae-d946700dca72	3327	Šmartno ob Paki
00050000-5698-db83-e677-66a363ffa419	1275	Šmartno pri Litiji
00050000-5698-db83-127d-fca03a36afb0	2383	Šmartno pri Slovenj Gradcu
00050000-5698-db83-d742-15fc2f49dbf9	3201	Šmartno v Rožni dolini
00050000-5698-db83-d259-b3800c2d4083	3325	Šoštanj
00050000-5698-db83-32bf-b4c52e8169c2	6222	Štanjel
00050000-5698-db83-f5dd-dd79c9848d03	3220	Štore
00050000-5698-db83-a289-a8420ab5757a	3304	Tabor
00050000-5698-db83-def8-4b4efd70d4f8	3221	Teharje
00050000-5698-db83-515f-ca6cd2a778b6	9251	Tišina
00050000-5698-db83-89eb-9671fd75ad75	5220	Tolmin
00050000-5698-db83-700d-1f1316c3bdb7	3326	Topolšica
00050000-5698-db83-96e1-552a841d4547	2371	Trbonje
00050000-5698-db83-352e-7924387d43f0	1420	Trbovlje
00050000-5698-db83-307b-f56c2d2c75b7	8231	Trebelno 
00050000-5698-db83-2171-4139d1a6e73d	8210	Trebnje
00050000-5698-db83-e862-d465f0938457	5252	Trnovo pri Gorici
00050000-5698-db83-b5fa-80c069eda27f	2254	Trnovska vas
00050000-5698-db83-766a-d0378f9ef373	1222	Trojane
00050000-5698-db83-0f5b-104ee9bb4bd1	1236	Trzin
00050000-5698-db83-0a8e-96a26761fa87	4290	Tržič
00050000-5698-db83-64de-2d5bb729a422	8295	Tržišče
00050000-5698-db83-278e-2c145b422cd1	1311	Turjak
00050000-5698-db83-407d-f9bc87aa4ea6	9224	Turnišče
00050000-5698-db83-7f84-f85015c58bc9	8323	Uršna sela
00050000-5698-db83-c632-838fc1716562	1252	Vače
00050000-5698-db83-9cd0-2c1c88961792	3320	Velenje 
00050000-5698-db83-6ea4-ec4fd96431da	3322	Velenje - poštni predali
00050000-5698-db83-e754-fa5cb2217496	8212	Velika Loka
00050000-5698-db83-7232-cb3f4e354cc0	2274	Velika Nedelja
00050000-5698-db83-29bf-251e99da1a78	9225	Velika Polana
00050000-5698-db83-b56e-a7eae7575b09	1315	Velike Lašče
00050000-5698-db83-6c35-d7f01cf416bf	8213	Veliki Gaber
00050000-5698-db83-57ea-a281f5e98c7a	9241	Veržej
00050000-5698-db83-35be-6511c19c8d1a	1312	Videm - Dobrepolje
00050000-5698-db83-eb80-deda26a64b8f	2284	Videm pri Ptuju
00050000-5698-db83-2bd2-66e8e047c075	8344	Vinica
00050000-5698-db83-4fd3-590e840659fa	5271	Vipava
00050000-5698-db83-2d73-532fd2022006	4212	Visoko
00050000-5698-db83-9f4b-3a9b5279217e	1294	Višnja Gora
00050000-5698-db83-03f1-79668c8df7c9	3205	Vitanje
00050000-5698-db83-705e-a28a8ab5ea84	2255	Vitomarci
00050000-5698-db83-9b8d-1ebbcfe0ec0b	1217	Vodice
00050000-5698-db83-31c6-dbc53995446c	3212	Vojnik\t
00050000-5698-db83-ef03-922c15c462b2	5293	Volčja Draga
00050000-5698-db83-7f93-c68cb2c780a0	2232	Voličina
00050000-5698-db83-62a5-e8db57710da6	3305	Vransko
00050000-5698-db83-a3fa-df4d453ebab1	6217	Vremski Britof
00050000-5698-db83-3a21-f9c6c82b40d2	1360	Vrhnika
00050000-5698-db83-43f2-44f35326ff67	2365	Vuhred
00050000-5698-db83-f0c2-aacf74b38873	2367	Vuzenica
00050000-5698-db83-d6cb-c1bc9ea3e140	8292	Zabukovje 
00050000-5698-db83-34b9-e51532365650	1410	Zagorje ob Savi
00050000-5698-db83-0540-525becfa5876	1303	Zagradec
00050000-5698-db83-7c6a-2e0acf587a40	2283	Zavrč
00050000-5698-db83-8551-d8f3a635a132	8272	Zdole 
00050000-5698-db83-2bf8-48dd02b0e9a0	4201	Zgornja Besnica
00050000-5698-db83-5aa8-35ea4b72d16b	2242	Zgornja Korena
00050000-5698-db83-8263-d4b0a5762dfb	2201	Zgornja Kungota
00050000-5698-db83-c6c9-83a65b991a4d	2316	Zgornja Ložnica
00050000-5698-db83-7f45-2af1ef46ba46	2314	Zgornja Polskava
00050000-5698-db83-d50f-35739f8443d1	2213	Zgornja Velka
00050000-5698-db83-0a73-a97caebd5b79	4247	Zgornje Gorje
00050000-5698-db83-d549-5026a9b0e903	4206	Zgornje Jezersko
00050000-5698-db83-c7ea-e7bb6ac783c9	2285	Zgornji Leskovec
00050000-5698-db83-7367-75ccb927afee	1432	Zidani Most
00050000-5698-db83-0c7b-c73b35e1c9f8	3214	Zreče
00050000-5698-db83-85ef-423cf0e03260	4209	Žabnica
00050000-5698-db83-a0e9-0428adb35fa4	3310	Žalec
00050000-5698-db83-eda6-0c0bcde607e0	4228	Železniki
00050000-5698-db83-bca9-8b2cc7b79a3e	2287	Žetale
00050000-5698-db83-91f3-b265d357f179	4226	Žiri
00050000-5698-db83-3426-0c77f1e492db	4274	Žirovnica
00050000-5698-db83-d980-6d13c9eac3ea	8360	Žužemberk
\.


--
-- TOC entry 3210 (class 0 OID 36768481)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 36768051)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 36767782)
-- Dependencies: 191
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5698-db87-a140-b9143cdb4957	00080000-5698-db87-1118-67e4a5e41a7d	\N	00040000-5698-db84-f757-5c99083c1982	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5698-db87-f791-488d0deb2ddb	00080000-5698-db87-1118-67e4a5e41a7d	\N	00040000-5698-db84-f757-5c99083c1982	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5698-db87-cafc-91cfad649250	00080000-5698-db87-be30-cfb7320558fa	\N	00040000-5698-db84-f757-5c99083c1982	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 36767920)
-- Dependencies: 203
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5698-db84-e5eb-8ed7ae304598	novo leto	1	1	\N	t
00430000-5698-db84-8c44-c18a1470b6ac	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5698-db84-90b8-5d78161ae367	dan upora proti okupatorju	27	4	\N	t
00430000-5698-db84-3419-bdee54026a52	praznik dela	1	5	\N	t
00430000-5698-db84-340a-b118ca571104	praznik dela	2	5	\N	t
00430000-5698-db84-0fb0-a1992c192dcd	dan Primoža Trubarja	8	6	\N	f
00430000-5698-db84-20a6-1a3cb827514f	dan državnosti	25	6	\N	t
00430000-5698-db84-4a89-01c02dffaa27	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5698-db84-d044-54723e172b37	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5698-db84-95aa-caec42fe8bd4	dan suverenosti	25	10	\N	f
00430000-5698-db84-5deb-22ec32a796dd	dan spomina na mrtve	1	11	\N	t
00430000-5698-db84-3171-ada81fc4f6ef	dan Rudolfa Maistra	23	11	\N	f
00430000-5698-db84-549a-1350904fc042	božič	25	12	\N	t
00430000-5698-db84-bf1c-b8d20a4cab1a	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5698-db84-319f-f9649d8d829a	Marijino vnebovzetje	15	8	\N	t
00430000-5698-db84-90f7-fc272c8d8f35	dan reformacije	31	10	\N	t
00430000-5698-db84-9353-6f1f73c036d3	velikonočna nedelja	27	3	2016	t
00430000-5698-db84-2daa-178f6dbe148f	velikonočna nedelja	16	4	2017	t
00430000-5698-db84-79f9-d08d90395ad5	velikonočna nedelja	1	4	2018	t
00430000-5698-db84-1b50-50e0e7c56c58	velikonočna nedelja	21	4	2019	t
00430000-5698-db84-87ba-7fcbcfe0aa54	velikonočna nedelja	12	4	2020	t
00430000-5698-db84-0985-e7d78878db51	velikonočna nedelja	4	4	2021	t
00430000-5698-db84-a3ff-c7e4df15ca2f	velikonočna nedelja	17	4	2022	t
00430000-5698-db84-6882-dd4b40e3b42a	velikonočna nedelja	9	4	2023	t
00430000-5698-db84-5b64-3a5196d87837	velikonočna nedelja	31	3	2024	t
00430000-5698-db84-33ee-d27b0c641bee	velikonočna nedelja	20	4	2025	t
00430000-5698-db84-07d3-873db2588de0	velikonočna nedelja	5	4	2026	t
00430000-5698-db84-a524-1ba0b4aa4467	velikonočna nedelja	28	3	2027	t
00430000-5698-db84-c27a-68feee2bf363	velikonočna nedelja	16	4	2028	t
00430000-5698-db84-2e1d-1cd711bd9643	velikonočna nedelja	1	4	2029	t
00430000-5698-db84-a78e-e0a1c4139247	velikonočna nedelja	21	4	2030	t
00430000-5698-db84-7c58-19dc48d1a405	velikonočni ponedeljek	28	3	2016	t
00430000-5698-db84-af1d-e4b12b0e9e11	velikonočni ponedeljek	17	4	2017	t
00430000-5698-db84-1dcb-97d26fd68f09	velikonočni ponedeljek	2	4	2018	t
00430000-5698-db84-6b95-20f467e2a388	velikonočni ponedeljek	22	4	2019	t
00430000-5698-db84-8b8b-fe079e369567	velikonočni ponedeljek	13	4	2020	t
00430000-5698-db84-83f2-ad6c9c25354a	velikonočni ponedeljek	5	4	2021	t
00430000-5698-db84-ac09-65925cfe2238	velikonočni ponedeljek	18	4	2022	t
00430000-5698-db84-e38b-06bfd4c51480	velikonočni ponedeljek	10	4	2023	t
00430000-5698-db84-98e5-61b57f3f6f45	velikonočni ponedeljek	1	4	2024	t
00430000-5698-db84-5542-ff709cab542c	velikonočni ponedeljek	21	4	2025	t
00430000-5698-db84-6902-9d87525e241a	velikonočni ponedeljek	6	4	2026	t
00430000-5698-db84-f7a6-e13fee7d64aa	velikonočni ponedeljek	29	3	2027	t
00430000-5698-db84-ceac-909a033da808	velikonočni ponedeljek	17	4	2028	t
00430000-5698-db84-e74f-df4f6d272223	velikonočni ponedeljek	2	4	2029	t
00430000-5698-db84-168e-8aece30778dc	velikonočni ponedeljek	22	4	2030	t
00430000-5698-db84-451c-2b39ec95ae87	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5698-db84-94fc-5cd2d021a7bf	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5698-db84-1b05-03c389eb5dbe	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5698-db84-2d63-72c9be2b2c47	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5698-db84-d234-11746ae22737	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5698-db84-1343-b7705ab12b97	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5698-db84-ccd4-472590f4a828	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5698-db84-088f-31a1287384a9	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5698-db84-bcd5-b41e15674b55	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5698-db84-93f2-157923dde812	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5698-db84-f5d1-e7d218fa02d2	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5698-db84-a736-f9c8766538d8	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5698-db84-b7f9-57579b353410	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5698-db84-afb4-dc34ac54747e	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5698-db84-df18-c7fdab86375f	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3165 (class 0 OID 36767886)
-- Dependencies: 199
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 36767895)
-- Dependencies: 200
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 36768063)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 36768495)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 36768505)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5698-db87-53f0-9cac942639d2	00080000-5698-db87-4f1c-fb40df1d5c29	0987	AK
00190000-5698-db87-eced-cbf4166e0013	00080000-5698-db87-be30-cfb7320558fa	0989	AK
00190000-5698-db87-80e0-732c8ef1b822	00080000-5698-db87-5468-7e9f18904d00	0986	AK
00190000-5698-db87-d90d-074affb8d80a	00080000-5698-db87-8d8e-48b265e07ce8	0984	AK
00190000-5698-db87-7050-3fbe3b36daf7	00080000-5698-db87-7594-0a7e0f9905a7	0983	AK
00190000-5698-db87-6d03-e9dbe07f1763	00080000-5698-db87-3472-c769b6757ae2	0982	AK
00190000-5698-db89-350f-2ff3a4fa2cf7	00080000-5698-db88-e65b-8b3249c1b073	1001	AK
\.


--
-- TOC entry 3209 (class 0 OID 36768394)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5698-db87-fe5d-d159201cc6fa	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3213 (class 0 OID 36768513)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 36768092)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5698-db86-5035-28697c2f680f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5698-db86-26b7-20e7c6fc2f5b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5698-db86-35ae-ddb031f89ccb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5698-db86-beb8-5e02c61be9b7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5698-db86-497c-1112805164db	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5698-db86-632e-074df9304593	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5698-db86-3dad-f5eacf3950ee	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3181 (class 0 OID 36768036)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 36768026)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 36768233)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 36768163)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 36767860)
-- Dependencies: 197
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 36767622)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5698-db88-e65b-8b3249c1b073	00010000-5698-db85-5443-13e9438e1d2f	2016-01-15 12:44:09	INS	a:0:{}
2	App\\Entity\\Option	00000000-5698-db89-1a90-38033aa3a7c9	00010000-5698-db85-5443-13e9438e1d2f	2016-01-15 12:44:09	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5698-db89-350f-2ff3a4fa2cf7	00010000-5698-db85-5443-13e9438e1d2f	2016-01-15 12:44:09	INS	a:0:{}
\.


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3190 (class 0 OID 36768105)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 36767660)
-- Dependencies: 180
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5698-db84-3cdf-5063681b199f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5698-db84-8f2c-8e93412b069c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5698-db84-f96b-dbbf8449e4f5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5698-db84-e436-a08cae3236a3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5698-db84-637e-dae5d9d1459b	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5698-db84-a5b8-9584a69bb45d	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5698-db84-c515-3df408c881c6	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5698-db84-b4c8-4017c6fbfaff	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5698-db84-7713-eaf1232b4b31	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5698-db84-62ec-106eb732db8a	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5698-db84-d6c1-a3b27381fb4f	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5698-db84-3e27-d4ecccc21c25	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5698-db84-34ce-6c64a9fa3df6	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5698-db84-945a-5c125eaaf4b7	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5698-db84-6751-61b5f9052608	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5698-db84-0072-cdc951567842	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5698-db84-4ab7-579d0c7f5d32	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5698-db84-cf0c-81134b10df00	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5698-db84-ed9f-d2d119a36a82	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5698-db84-c2e3-e50bf94c97d6	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5698-db84-04be-de82505a2dd5	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5698-db84-723d-c73a095d3e3b	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5698-db84-4f46-d08c57a66885	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5698-db84-2e23-4a73a553749b	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5698-db84-88c1-d84cb427d808	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5698-db84-b5f7-83febb159ca4	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5698-db84-1fdd-55d612822a56	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5698-db84-1b6e-7f39bdb1b6fe	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5698-db84-8d7c-93a02e16d875	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5698-db84-6797-34c50960f1ae	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5698-db84-87a3-2554850e88e4	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5698-db84-98ce-ff5e553f5c92	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5698-db84-5fbb-1499a884ab00	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5698-db84-2215-e2139f26d33a	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5698-db84-1f07-977158bec5db	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5698-db84-8e24-18d263b51655	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5698-db84-2d8c-27b240d6985a	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5698-db84-ad2b-eba787702d16	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5698-db84-9bc9-39be14dc81cf	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5698-db84-785f-18c84d87522d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5698-db84-2ebf-5c46624673a3	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5698-db84-0139-25493b01bdb9	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5698-db84-8793-a2bac5379b32	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5698-db84-e4e0-6aa7e1b5046e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5698-db84-02d0-9441895bcf56	direktor	minimalne pravice za direktorja	t
00020000-5698-db84-a577-98d0d26f1c49	arhivar	arhivar	t
00020000-5698-db84-814e-f4b290c44f0d	dramaturg	dramaturg	t
00020000-5698-db85-9baa-3f2ae4bb6d55	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5698-db85-bb59-73dd3cd8fc28	poslovni-sekretar	poslovni sekretar	t
00020000-5698-db85-d50c-923239f3fba7	vodja-tehnike	vodja tehnike	t
00020000-5698-db85-ce96-f2320ce1cc69	racunovodja	računovodja	t
00020000-5698-db86-e2cc-9da67355c3ba	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5698-db86-e1f6-b11eb61f790f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-81c3-3af00921c5d1	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-5c08-a989354fab7c	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-90c7-019490c304dd	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-625b-bd1d0cc891ce	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-e5a4-ec1a913aa645	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-6ac5-a3a0741459dd	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5698-db86-246b-777359fa01f6	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5698-db86-18b6-1664ced4bba3	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-160b-806736fdf1fb	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-8965-46b20a12f47b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-0957-4466f418376a	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-e507-70228307e2bf	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-1ad8-0c78891f2164	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-0b02-3706ff51caf5	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-307d-e4e9dd7f49d4	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-5eea-ca5a1d1bac97	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-6402-ba87ba45a41b	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-e116-ceec23086adf	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5698-db86-7459-c599a40c4f11	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-df0b-4508bfe05e1a	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-26ef-2dd31d3e244a	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-23aa-904b8e8a1ff9	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-0f17-3139ecbb258f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-b0d6-db511534dad9	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-1b41-b6f1c3476461	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-39fe-915a435f6032	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-8104-d35b4a5f5b83	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-cce0-f4083d73e89b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-1477-b7d4bce86687	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-49fe-46ed8fdf5c11	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-079e-d9dabc3cf93b	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-917c-46adfb78d131	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-f5c4-1b3535aec343	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-254a-7b16586e059c	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5698-db86-381b-88bd2aa06fdf	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5698-db86-d885-b4389c8df500	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5698-db86-3ed9-2744de647811	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3144 (class 0 OID 36767644)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5698-db85-000c-cf8dedffef45	00020000-5698-db84-f96b-dbbf8449e4f5
00010000-5698-db85-5443-13e9438e1d2f	00020000-5698-db84-f96b-dbbf8449e4f5
00010000-5698-db86-a0fe-c79ea814782a	00020000-5698-db86-e2cc-9da67355c3ba
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-e1f6-b11eb61f790f
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-625b-bd1d0cc891ce
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-18b6-1664ced4bba3
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-8965-46b20a12f47b
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-e507-70228307e2bf
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-6402-ba87ba45a41b
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-5c08-a989354fab7c
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-7459-c599a40c4f11
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-23aa-904b8e8a1ff9
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-b0d6-db511534dad9
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-39fe-915a435f6032
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-cce0-f4083d73e89b
00010000-5698-db86-2a54-883329ae4c8b	00020000-5698-db86-917c-46adfb78d131
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-e1f6-b11eb61f790f
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-81c3-3af00921c5d1
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-5c08-a989354fab7c
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-90c7-019490c304dd
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-e507-70228307e2bf
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-307d-e4e9dd7f49d4
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-7459-c599a40c4f11
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-23aa-904b8e8a1ff9
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-b0d6-db511534dad9
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-39fe-915a435f6032
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-cce0-f4083d73e89b
00010000-5698-db86-3e0b-f09bbba3c9b7	00020000-5698-db86-917c-46adfb78d131
00010000-5698-db86-48d6-b28a420affc2	00020000-5698-db86-e1f6-b11eb61f790f
00010000-5698-db86-48d6-b28a420affc2	00020000-5698-db86-81c3-3af00921c5d1
00010000-5698-db86-48d6-b28a420affc2	00020000-5698-db86-5c08-a989354fab7c
00010000-5698-db86-48d6-b28a420affc2	00020000-5698-db86-90c7-019490c304dd
00010000-5698-db86-48d6-b28a420affc2	00020000-5698-db86-8965-46b20a12f47b
00010000-5698-db86-48d6-b28a420affc2	00020000-5698-db86-e507-70228307e2bf
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-81c3-3af00921c5d1
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-e5a4-ec1a913aa645
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-160b-806736fdf1fb
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-0957-4466f418376a
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-8965-46b20a12f47b
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-5eea-ca5a1d1bac97
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-e507-70228307e2bf
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-1ad8-0c78891f2164
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-7459-c599a40c4f11
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-df0b-4508bfe05e1a
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-23aa-904b8e8a1ff9
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-0f17-3139ecbb258f
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-b0d6-db511534dad9
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-1b41-b6f1c3476461
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-39fe-915a435f6032
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-8104-d35b4a5f5b83
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-cce0-f4083d73e89b
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-1477-b7d4bce86687
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-917c-46adfb78d131
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-f5c4-1b3535aec343
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-381b-88bd2aa06fdf
00010000-5698-db86-dcbc-8e00ae63ffc6	00020000-5698-db86-d885-b4389c8df500
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-81c3-3af00921c5d1
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-e5a4-ec1a913aa645
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-246b-777359fa01f6
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-160b-806736fdf1fb
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-0957-4466f418376a
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-8965-46b20a12f47b
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-5eea-ca5a1d1bac97
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-e507-70228307e2bf
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-1ad8-0c78891f2164
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-0b02-3706ff51caf5
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-7459-c599a40c4f11
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-df0b-4508bfe05e1a
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-26ef-2dd31d3e244a
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-23aa-904b8e8a1ff9
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-0f17-3139ecbb258f
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-b0d6-db511534dad9
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-1b41-b6f1c3476461
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-39fe-915a435f6032
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-8104-d35b4a5f5b83
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-cce0-f4083d73e89b
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-1477-b7d4bce86687
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-917c-46adfb78d131
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-f5c4-1b3535aec343
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-254a-7b16586e059c
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-381b-88bd2aa06fdf
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-d885-b4389c8df500
00010000-5698-db87-50e3-2620843ff1d6	00020000-5698-db86-3ed9-2744de647811
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-81c3-3af00921c5d1
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-5c08-a989354fab7c
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-e5a4-ec1a913aa645
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-6ac5-a3a0741459dd
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-246b-777359fa01f6
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-625b-bd1d0cc891ce
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-160b-806736fdf1fb
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-0957-4466f418376a
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-8965-46b20a12f47b
00010000-5698-db87-e3c5-f2d82ed6af97	00020000-5698-db86-5eea-ca5a1d1bac97
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-e1f6-b11eb61f790f
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-90c7-019490c304dd
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-625b-bd1d0cc891ce
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-18b6-1664ced4bba3
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-8965-46b20a12f47b
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-e507-70228307e2bf
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-6402-ba87ba45a41b
00010000-5698-db87-a680-86de1123f1c5	00020000-5698-db86-49fe-46ed8fdf5c11
00010000-5698-db87-fe8a-e3b31e6f7906	00020000-5698-db86-e116-ceec23086adf
00010000-5698-db87-ebd7-cdb98520f4c3	00020000-5698-db84-02d0-9441895bcf56
00010000-5698-db87-1e45-6d4471e98033	00020000-5698-db84-a577-98d0d26f1c49
00010000-5698-db87-48d5-282e2f918834	00020000-5698-db84-814e-f4b290c44f0d
00010000-5698-db87-ed3a-769a1dade97f	00020000-5698-db85-9baa-3f2ae4bb6d55
00010000-5698-db87-8418-c285ed429932	00020000-5698-db85-bb59-73dd3cd8fc28
00010000-5698-db87-e0fb-2c9cca02411e	00020000-5698-db85-d50c-923239f3fba7
00010000-5698-db87-46ea-8fa1da55b90c	00020000-5698-db85-ce96-f2320ce1cc69
\.


--
-- TOC entry 3192 (class 0 OID 36768119)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 36768057)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 36767980)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5698-db86-40e7-8ef19c35ccc0	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5698-db86-f668-e3bd616d5063	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5698-db86-a6aa-923ca5f6c192	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3140 (class 0 OID 36767609)
-- Dependencies: 174
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5698-db84-faff-1f2aa22a111c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5698-db84-38c2-c44b3df01e22	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5698-db84-f08b-00eda45ef9f8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5698-db84-1f60-4bb3d2ce7496	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5698-db84-e104-359c30a33b5e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3139 (class 0 OID 36767601)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5698-db84-a60a-094a39d36f6c	00230000-5698-db84-1f60-4bb3d2ce7496	popa
00240000-5698-db84-65d7-047a141ac445	00230000-5698-db84-1f60-4bb3d2ce7496	oseba
00240000-5698-db84-6974-e77c22ce600d	00230000-5698-db84-1f60-4bb3d2ce7496	tippopa
00240000-5698-db84-e636-ed9a772683a4	00230000-5698-db84-1f60-4bb3d2ce7496	organizacijskaenota
00240000-5698-db84-1db6-03caeba5c4a7	00230000-5698-db84-1f60-4bb3d2ce7496	sezona
00240000-5698-db84-c3cc-cf7a7de41fe6	00230000-5698-db84-1f60-4bb3d2ce7496	tipvaje
00240000-5698-db84-90d2-fa8059758f0a	00230000-5698-db84-1f60-4bb3d2ce7496	tipdodatka
00240000-5698-db84-cdde-59c5e3c224a4	00230000-5698-db84-38c2-c44b3df01e22	prostor
00240000-5698-db84-5797-31af98e20ce1	00230000-5698-db84-1f60-4bb3d2ce7496	besedilo
00240000-5698-db84-9aa2-d179659e10c2	00230000-5698-db84-1f60-4bb3d2ce7496	uprizoritev
00240000-5698-db84-b2e7-f4d4b892bad5	00230000-5698-db84-1f60-4bb3d2ce7496	funkcija
00240000-5698-db84-014b-050695724172	00230000-5698-db84-1f60-4bb3d2ce7496	tipfunkcije
00240000-5698-db84-a0a3-fbb485a5df85	00230000-5698-db84-1f60-4bb3d2ce7496	alternacija
00240000-5698-db84-a575-fbc216456e7e	00230000-5698-db84-faff-1f2aa22a111c	pogodba
00240000-5698-db84-2684-e520585d0743	00230000-5698-db84-1f60-4bb3d2ce7496	zaposlitev
00240000-5698-db84-7e5b-d9e2f68f1737	00230000-5698-db84-1f60-4bb3d2ce7496	zvrstuprizoritve
00240000-5698-db84-f709-36d272705f31	00230000-5698-db84-faff-1f2aa22a111c	programdela
00240000-5698-db84-58e0-3d3d9b13f940	00230000-5698-db84-1f60-4bb3d2ce7496	zapis
\.


--
-- TOC entry 3138 (class 0 OID 36767596)
-- Dependencies: 172
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8b10ebc2-96c6-4738-bcd0-36af0ac7d3ee	00240000-5698-db84-a60a-094a39d36f6c	0	1001
\.


--
-- TOC entry 3198 (class 0 OID 36768180)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5698-db87-8a14-bc685c204b0c	000e0000-5698-db87-1704-778be3ca2922	00080000-5698-db87-1118-67e4a5e41a7d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5698-db84-02f0-a7ba99e56297
00270000-5698-db87-4fec-e2f9f7935461	000e0000-5698-db87-1704-778be3ca2922	00080000-5698-db87-1118-67e4a5e41a7d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5698-db84-02f0-a7ba99e56297
\.


--
-- TOC entry 3154 (class 0 OID 36767744)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 36767999)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, zasedenost, virtzasedenost) FROM stdin;
001a0000-5698-db87-b4f6-936d9d643c01	00180000-5698-db87-5367-4b8a3f71cd90	000c0000-5698-db87-f2ed-daafaa5f8cf0	00090000-5698-db87-91f9-38353c24da4d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5698-db87-bc19-469924dc1d88	00180000-5698-db87-5367-4b8a3f71cd90	000c0000-5698-db87-c809-c8f986dfa092	00090000-5698-db87-92b4-c27ed1cf4c39	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5698-db87-28dc-26862b817486	00180000-5698-db87-5367-4b8a3f71cd90	000c0000-5698-db87-c2ec-324cca7e988d	00090000-5698-db87-04db-ec6b9c5289d6	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5698-db87-9a28-06322978e7ee	00180000-5698-db87-5367-4b8a3f71cd90	000c0000-5698-db87-905c-1629265ecc42	00090000-5698-db87-7166-c6cb792aafbc	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5698-db87-7741-22cf28a48d18	00180000-5698-db87-5367-4b8a3f71cd90	000c0000-5698-db87-da72-b0dfd8d3d5fe	00090000-5698-db87-8c73-d96e1f716788	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5698-db87-4035-cfb01a54f841	00180000-5698-db87-3763-c171f6670eac	\N	00090000-5698-db87-8c73-d96e1f716788	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N
001a0000-5698-db87-48a7-8afd7acb13f3	00180000-5698-db87-3763-c171f6670eac	\N	00090000-5698-db87-92b4-c27ed1cf4c39	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N
\.


--
-- TOC entry 3179 (class 0 OID 36768016)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5698-db84-c78c-099c24599ef7	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5698-db84-526a-e23d41907082	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5698-db84-9c91-897e552010e4	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5698-db84-6cc0-bf136d584244	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5698-db84-0346-5856665bab9c	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5698-db84-7ef6-34e139343677	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3201 (class 0 OID 36768221)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5698-db83-d42f-d15fdf22d7f0	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5698-db83-48ef-fbe539f78a00	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5698-db83-298b-7d3a7ea0ef50	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5698-db83-267d-82266527254e	04	Režija	Režija	Režija	umetnik	30
000f0000-5698-db83-5913-ddd449874595	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5698-db83-d743-ab587326be3e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5698-db84-ff6b-bd9d2f7ff302	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5698-db84-7481-1f5132174b82	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5698-db84-f802-912722c8efb6	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5698-db84-c163-d52af3a8340b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5698-db84-e210-99cf1fadc445	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5698-db84-a213-141ed7f83d0f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5698-db84-4244-4ee5eb2b8ebc	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5698-db84-c66f-4655884f1451	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5698-db84-081a-974e816050e3	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5698-db84-9878-828810e3fdc3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5698-db84-6c61-225b8363e88d	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5698-db84-0c73-5173d01159cd	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5698-db84-c0b7-ea5541974f3a	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3151 (class 0 OID 36767695)
-- Dependencies: 185
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5698-db86-b4f8-89ecacb1a27f	0001	šola	osnovna ali srednja šola
00400000-5698-db86-ac31-381c83284bda	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5698-db86-29ea-18a325cbc9d8	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3214 (class 0 OID 36768525)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5698-db83-9aa5-3d4e38b1bb4f	01	Velika predstava	f	1.00	1.00
002b0000-5698-db83-4699-0aaa518b8e41	02	Mala predstava	f	0.50	0.50
002b0000-5698-db83-bf9b-9ef34347d298	03	Mala koprodukcija	t	0.40	1.00
002b0000-5698-db83-01b6-82be8e2c12a3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5698-db83-a726-bb2ef7f74e1d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3174 (class 0 OID 36767970)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5698-db83-0046-28ede9a1ef81	0001	prva vaja	prva vaja
00420000-5698-db83-806b-fdf9495f0bb0	0002	tehnična vaja	tehnična vaja
00420000-5698-db83-ff28-8ceecdf55952	0003	lučna vaja	lučna vaja
00420000-5698-db83-4b11-51c7fb82bef5	0004	kostumska vaja	kostumska vaja
00420000-5698-db83-1d02-50226d1ce1fa	0005	foto vaja	foto vaja
00420000-5698-db83-f064-b2d162d2a7c6	0006	1. glavna vaja	1. glavna vaja
00420000-5698-db83-9218-2c74ce24a31f	0007	2. glavna vaja	2. glavna vaja
00420000-5698-db83-4097-7ac8c630c5d5	0008	1. generalka	1. generalka
00420000-5698-db83-a6b2-c6355a67ecdb	0009	2. generalka	2. generalka
00420000-5698-db83-0777-5953c5f7ab1d	0010	odprta generalka	odprta generalka
00420000-5698-db83-8a62-1d99b8e1c615	0011	obnovitvena vaja	obnovitvena vaja
00420000-5698-db83-67ec-26103013d6cc	0012	italijanka	krajša "obnovitvena" vaja
00420000-5698-db83-1618-e6677a719a09	0013	pevska vaja	pevska vaja
00420000-5698-db83-803b-5fb3cea2d13d	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5698-db83-3893-6cb4042c7bde	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5698-db83-6f4e-ac8346bfed12	0016	orientacijska vaja	orientacijska vaja
00420000-5698-db83-c926-c9c4e86c6e0a	0017	situacijska vaja	situacijska vaja
00420000-5698-db83-5daa-d161228c2b4a	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3160 (class 0 OID 36767817)
-- Dependencies: 194
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 36767631)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5698-db85-5443-13e9438e1d2f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROfJCRcHzWOOBPV8xmCLb5b8Ekevjp1VO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5698-db86-13eb-a97005d66b55	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5698-db86-3e26-f7059d4e06bc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5698-db86-ce88-f389ac0a939b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5698-db86-99f5-0b094cbce03f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5698-db86-56a4-90ab5a97d867	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5698-db86-8809-e02773a691b1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5698-db86-20b8-5c7fe3477a88	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5698-db86-714c-d213814db2a6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5698-db86-0a19-68f4a376f0e7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5698-db86-a0fe-c79ea814782a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5698-db86-0f03-5854c52da4b2	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5698-db86-2a54-883329ae4c8b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5698-db86-3e0b-f09bbba3c9b7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5698-db86-48d6-b28a420affc2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5698-db86-dcbc-8e00ae63ffc6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5698-db87-50e3-2620843ff1d6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5698-db87-e3c5-f2d82ed6af97	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5698-db87-a680-86de1123f1c5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5698-db87-fe8a-e3b31e6f7906	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5698-db87-ebd7-cdb98520f4c3	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5698-db87-1e45-6d4471e98033	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5698-db87-48d5-282e2f918834	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5698-db87-ed3a-769a1dade97f	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5698-db87-8418-c285ed429932	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5698-db87-e0fb-2c9cca02411e	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5698-db87-46ea-8fa1da55b90c	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5698-db85-000c-cf8dedffef45	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3205 (class 0 OID 36768271)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5698-db87-f11d-f28c429dc907	00160000-5698-db86-f643-e2da1fdfe57e	\N	00140000-5698-db84-b229-73f49d2375d8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5698-db86-497c-1112805164db
000e0000-5698-db87-1704-778be3ca2922	00160000-5698-db86-523f-9bd2a971cc42	\N	00140000-5698-db84-f3d7-3a66381e9862	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5698-db86-632e-074df9304593
000e0000-5698-db87-07dd-7f65287e7748	\N	\N	00140000-5698-db84-f3d7-3a66381e9862	00190000-5698-db87-53f0-9cac942639d2	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5698-db86-497c-1112805164db
000e0000-5698-db87-a859-7e93fedadeac	\N	\N	00140000-5698-db84-f3d7-3a66381e9862	00190000-5698-db87-53f0-9cac942639d2	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5698-db86-497c-1112805164db
000e0000-5698-db87-0458-16113d8196ec	\N	\N	00140000-5698-db84-f3d7-3a66381e9862	00190000-5698-db87-53f0-9cac942639d2	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-8bea-4a06ba890c35	\N	\N	00140000-5698-db84-f3d7-3a66381e9862	00190000-5698-db87-53f0-9cac942639d2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-ecb3-f93706d1f172	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-9ee4-40090daf2468	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-72dd-2accf9cd24c5	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-673e-c319e9ce9775	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-80f6-e2863ef01285	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-f47f-b2535b188cc6	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-06dc-a2305346f5b4	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-c6ba-7e5bdf8f14ac	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
000e0000-5698-db87-60d3-b4807e954764	\N	\N	00140000-5698-db84-09d4-57927e6fbcb3	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5698-db86-5035-28697c2f680f
\.


--
-- TOC entry 3176 (class 0 OID 36767990)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 36767913)
-- Dependencies: 202
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5698-db87-d629-0f7d43796867	\N	000e0000-5698-db87-1704-778be3ca2922	1
00200000-5698-db87-52f7-a33b4ae811e7	\N	000e0000-5698-db87-1704-778be3ca2922	2
00200000-5698-db87-95cf-0c59446c7887	\N	000e0000-5698-db87-1704-778be3ca2922	3
00200000-5698-db87-4431-92dd9d6a7b5f	\N	000e0000-5698-db87-1704-778be3ca2922	4
00200000-5698-db87-591d-4037547ea59e	\N	000e0000-5698-db87-1704-778be3ca2922	5
\.


--
-- TOC entry 3188 (class 0 OID 36768084)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 36768194)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5698-db84-d9ee-1fef9071546c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5698-db84-72c9-f14360aab7df	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5698-db84-f80d-045f29b9f055	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5698-db84-523e-8aa642f93bb4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5698-db84-7169-4705226f6152	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5698-db84-592b-b2534b48aea0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5698-db84-059f-90ee93873c60	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5698-db84-2883-40b194b17fa3	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5698-db84-02f0-a7ba99e56297	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5698-db84-817a-6f7da472faf2	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5698-db84-257c-1d18fec31233	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5698-db84-4b23-1964e0932c2d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5698-db84-5b7a-e6f7e6ec44c0	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5698-db84-33d0-2535ae12df50	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5698-db84-db1a-0f141ce6916d	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5698-db84-1af0-d1658e2ceefa	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5698-db84-57ef-a2f1cdf30a35	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5698-db84-878d-c0347df31cfb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5698-db84-099d-ba3e86f828e5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5698-db84-0d70-ea43d973995d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5698-db84-40f6-e99cd7f04fbf	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5698-db84-c404-9d31b3bdc5db	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5698-db84-0f29-c18e8dedfb07	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5698-db84-b56d-305e14a7f1d7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5698-db84-1de8-21073345808a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5698-db84-1c77-099875ff4742	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5698-db84-531d-dc1ae501c2a6	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5698-db84-6915-0643e77fc7c5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3217 (class 0 OID 36768575)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 36768544)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 36768587)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 36768156)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5698-db87-8e42-0eff3b8fc8d5	00090000-5698-db87-92b4-c27ed1cf4c39	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5698-db87-3079-61f90e0f951b	00090000-5698-db87-04db-ec6b9c5289d6	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5698-db87-e531-cafb2719e19c	00090000-5698-db87-8e2d-8592dca8e21a	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5698-db87-e983-b1aaafd705e1	00090000-5698-db87-72f1-a852336352ea	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5698-db87-8093-3f95fbb2947d	00090000-5698-db87-ac00-b3f7e4c0d032	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5698-db87-8dea-2e929933b506	00090000-5698-db87-3db5-df1ea596fa7c	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3171 (class 0 OID 36767954)
-- Dependencies: 205
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 36768261)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5698-db84-b229-73f49d2375d8	01	Drama	drama (SURS 01)
00140000-5698-db84-0c22-1f8963d21058	02	Opera	opera (SURS 02)
00140000-5698-db84-ef09-4e282dd2e3fb	03	Balet	balet (SURS 03)
00140000-5698-db84-5837-eded3fdbbc51	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5698-db84-09d4-57927e6fbcb3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5698-db84-f3d7-3a66381e9862	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5698-db84-be4b-55355b8d69a2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3194 (class 0 OID 36768146)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2618 (class 2606 OID 36767694)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 36768319)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 36768310)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 36767685)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 36768177)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 36768219)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 36768628)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 36768013)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 36767942)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 36767964)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 36767969)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 36768542)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 36767843)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 36768388)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 36768142)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 36767911)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 36767881)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 36767857)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 36768049)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 36768605)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 36768612)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2910 (class 2606 OID 36768636)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2768 (class 2606 OID 36768076)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 36767815)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 36767713)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 36767777)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 36767740)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 36767674)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2607 (class 2606 OID 36767659)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 36768082)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 36768118)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 36768256)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 36767768)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 36767803)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 36768493)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 36768055)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 36767793)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 36767927)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 36767899)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2685 (class 2606 OID 36767891)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 36768067)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 36768502)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 36768510)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 36768480)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 36768523)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 36768100)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 36768040)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 36768031)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 36768243)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 36768170)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 36767869)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 36767630)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 36768109)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 36767648)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2609 (class 2606 OID 36767668)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 36768127)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 36768062)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 36767988)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 36767618)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 36767606)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36767600)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 36768190)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 36767749)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 36768005)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 36768023)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 36768230)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 36767702)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 36768535)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 36767977)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 36767828)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 36767643)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 36768289)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 36767996)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 36767917)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 36768090)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 36768202)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 36768585)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 36768569)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 36768593)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 36768160)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 36767958)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 36768269)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 36768154)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 1259 OID 36767952)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2702 (class 1259 OID 36767953)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2703 (class 1259 OID 36767951)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2704 (class 1259 OID 36767950)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2705 (class 1259 OID 36767949)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2811 (class 1259 OID 36768191)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2812 (class 1259 OID 36768192)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2813 (class 1259 OID 36768193)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2896 (class 1259 OID 36768607)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2897 (class 1259 OID 36768606)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2636 (class 1259 OID 36767770)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2637 (class 1259 OID 36767771)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2769 (class 1259 OID 36768083)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2883 (class 1259 OID 36768573)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2884 (class 1259 OID 36768572)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2885 (class 1259 OID 36768574)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2886 (class 1259 OID 36768571)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2887 (class 1259 OID 36768570)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2763 (class 1259 OID 36768069)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2764 (class 1259 OID 36768068)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2693 (class 1259 OID 36767918)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2694 (class 1259 OID 36767919)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 36768143)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 36768145)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2795 (class 1259 OID 36768144)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2668 (class 1259 OID 36767859)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 36767858)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2874 (class 1259 OID 36768524)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2827 (class 1259 OID 36768258)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2828 (class 1259 OID 36768259)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 36768260)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2893 (class 1259 OID 36768594)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2836 (class 1259 OID 36768294)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2837 (class 1259 OID 36768291)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2838 (class 1259 OID 36768295)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2839 (class 1259 OID 36768293)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2840 (class 1259 OID 36768292)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2658 (class 1259 OID 36767830)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 36767829)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2627 (class 1259 OID 36767743)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2781 (class 1259 OID 36768110)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 36767675)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 36767676)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2786 (class 1259 OID 36768130)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 36768129)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2788 (class 1259 OID 36768128)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2641 (class 1259 OID 36767780)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2642 (class 1259 OID 36767779)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2643 (class 1259 OID 36767781)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2681 (class 1259 OID 36767894)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2682 (class 1259 OID 36767892)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 36767893)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2591 (class 1259 OID 36767608)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2743 (class 1259 OID 36768035)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2744 (class 1259 OID 36768033)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2745 (class 1259 OID 36768032)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2746 (class 1259 OID 36768034)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 36767649)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 36767650)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2772 (class 1259 OID 36768091)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2906 (class 1259 OID 36768629)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2809 (class 1259 OID 36768179)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2810 (class 1259 OID 36768178)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2907 (class 1259 OID 36768637)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2908 (class 1259 OID 36768638)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2758 (class 1259 OID 36768056)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2803 (class 1259 OID 36768171)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2804 (class 1259 OID 36768172)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2856 (class 1259 OID 36768393)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2857 (class 1259 OID 36768392)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2858 (class 1259 OID 36768389)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2859 (class 1259 OID 36768390)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2860 (class 1259 OID 36768391)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2647 (class 1259 OID 36767795)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 36767794)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2649 (class 1259 OID 36767796)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2775 (class 1259 OID 36768104)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2776 (class 1259 OID 36768103)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 36768503)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2867 (class 1259 OID 36768504)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2849 (class 1259 OID 36768323)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2850 (class 1259 OID 36768324)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2851 (class 1259 OID 36768321)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2852 (class 1259 OID 36768322)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2737 (class 1259 OID 36768014)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2738 (class 1259 OID 36768015)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2799 (class 1259 OID 36768161)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 36768162)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2726 (class 1259 OID 36767997)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 36768044)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2750 (class 1259 OID 36768043)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 36768041)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2752 (class 1259 OID 36768042)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2846 (class 1259 OID 36768311)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 36767870)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2675 (class 1259 OID 36767884)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2676 (class 1259 OID 36767883)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2677 (class 1259 OID 36767882)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 36767885)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2692 (class 1259 OID 36767912)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 36767900)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2687 (class 1259 OID 36767901)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2863 (class 1259 OID 36768494)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2882 (class 1259 OID 36768543)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2900 (class 1259 OID 36768613)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2901 (class 1259 OID 36768614)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2623 (class 1259 OID 36767715)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2624 (class 1259 OID 36767714)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2632 (class 1259 OID 36767750)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 36767751)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 36767959)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 36768008)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 36768007)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2732 (class 1259 OID 36768006)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2706 (class 1259 OID 36767944)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2707 (class 1259 OID 36767945)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2708 (class 1259 OID 36767948)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2709 (class 1259 OID 36767943)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2710 (class 1259 OID 36767947)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2711 (class 1259 OID 36767946)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2640 (class 1259 OID 36767769)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 36767703)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 36767704)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2664 (class 1259 OID 36767844)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 36767846)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2666 (class 1259 OID 36767845)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2667 (class 1259 OID 36767847)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2757 (class 1259 OID 36768050)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 36768257)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2841 (class 1259 OID 36768290)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 36768231)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 36768232)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 36767741)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 36767742)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2741 (class 1259 OID 36768024)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 36768025)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2796 (class 1259 OID 36768155)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 36767619)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 36767816)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 36767778)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 36767607)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2879 (class 1259 OID 36768536)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2779 (class 1259 OID 36768102)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2780 (class 1259 OID 36768101)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 36767978)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 36767979)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2853 (class 1259 OID 36768320)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2727 (class 1259 OID 36767998)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2654 (class 1259 OID 36767804)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2833 (class 1259 OID 36768270)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2890 (class 1259 OID 36768586)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2872 (class 1259 OID 36768511)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2873 (class 1259 OID 36768512)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 36768220)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2725 (class 1259 OID 36767989)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 36767669)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2950 (class 2606 OID 36768809)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2949 (class 2606 OID 36768814)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 36768839)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 36768829)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2951 (class 2606 OID 36768804)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 36768824)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 36768834)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 36768819)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2991 (class 2606 OID 36769029)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2990 (class 2606 OID 36769034)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2989 (class 2606 OID 36769039)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3022 (class 2606 OID 36769199)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 36769194)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2923 (class 2606 OID 36768694)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2922 (class 2606 OID 36768699)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 36768944)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3017 (class 2606 OID 36769179)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3018 (class 2606 OID 36769174)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 36769184)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3019 (class 2606 OID 36769169)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3020 (class 2606 OID 36769164)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2970 (class 2606 OID 36768939)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2971 (class 2606 OID 36768934)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 36768794)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 36768799)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2982 (class 2606 OID 36768984)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 36768994)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2981 (class 2606 OID 36768989)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2932 (class 2606 OID 36768749)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2933 (class 2606 OID 36768744)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 36768924)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 36769154)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 36769044)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 36769049)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 36769054)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3021 (class 2606 OID 36769189)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2996 (class 2606 OID 36769074)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2999 (class 2606 OID 36769059)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2995 (class 2606 OID 36769079)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 36769069)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2998 (class 2606 OID 36769064)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2930 (class 2606 OID 36768739)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 36768734)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 36768679)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2919 (class 2606 OID 36768674)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 36768964)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2915 (class 2606 OID 36768654)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2914 (class 2606 OID 36768659)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2977 (class 2606 OID 36768979)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 36768974)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2979 (class 2606 OID 36768969)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2925 (class 2606 OID 36768709)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2926 (class 2606 OID 36768704)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 36768714)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2936 (class 2606 OID 36768774)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 36768764)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 36768769)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2911 (class 2606 OID 36768639)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2960 (class 2606 OID 36768899)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2962 (class 2606 OID 36768889)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2963 (class 2606 OID 36768884)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2961 (class 2606 OID 36768894)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 36768644)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2912 (class 2606 OID 36768649)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2973 (class 2606 OID 36768949)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3026 (class 2606 OID 36769214)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 36769024)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 36769019)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3028 (class 2606 OID 36769219)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3027 (class 2606 OID 36769224)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 36768929)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2986 (class 2606 OID 36769009)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2985 (class 2606 OID 36769014)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 36769129)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 36769124)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3009 (class 2606 OID 36769109)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3008 (class 2606 OID 36769114)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3007 (class 2606 OID 36769119)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 36768724)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 36768719)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 36768729)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 36768959)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2975 (class 2606 OID 36768954)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 36769139)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 36769144)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3002 (class 2606 OID 36769099)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3001 (class 2606 OID 36769104)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3004 (class 2606 OID 36769089)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3003 (class 2606 OID 36769094)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2959 (class 2606 OID 36768874)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2958 (class 2606 OID 36768879)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2984 (class 2606 OID 36768999)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 36769004)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2954 (class 2606 OID 36768849)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 36768854)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2964 (class 2606 OID 36768919)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2965 (class 2606 OID 36768914)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2967 (class 2606 OID 36768904)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2966 (class 2606 OID 36768909)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3000 (class 2606 OID 36769084)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 36768754)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2935 (class 2606 OID 36768759)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 36768789)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 36768779)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 36768784)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 36769134)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3013 (class 2606 OID 36769149)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3015 (class 2606 OID 36769159)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3025 (class 2606 OID 36769204)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 36769209)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2916 (class 2606 OID 36768669)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2917 (class 2606 OID 36768664)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2921 (class 2606 OID 36768684)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 36768689)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 36768844)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 36768869)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 36768864)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2957 (class 2606 OID 36768859)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-15 12:44:10 CET

--
-- PostgreSQL database dump complete
--

