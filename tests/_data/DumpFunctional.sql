--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-11 12:53:58 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 255 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 255
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 34934345)
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
-- TOC entry 239 (class 1259 OID 34934973)
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
    aktivna boolean,
    opomba text,
    sort integer,
    privzeti boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 238 (class 1259 OID 34934956)
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
-- TOC entry 182 (class 1259 OID 34934338)
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
-- TOC entry 181 (class 1259 OID 34934336)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 229 (class 1259 OID 34934833)
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
-- TOC entry 232 (class 1259 OID 34934863)
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
-- TOC entry 253 (class 1259 OID 34935276)
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
-- TOC entry 210 (class 1259 OID 34934668)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 34934593)
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
-- TOC entry 205 (class 1259 OID 34934625)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 34934630)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 34935198)
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
-- TOC entry 194 (class 1259 OID 34934490)
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
-- TOC entry 240 (class 1259 OID 34934986)
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
-- TOC entry 225 (class 1259 OID 34934790)
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
    altercount integer DEFAULT 0 NOT NULL,
    tipfunkcije_id uuid
);


--
-- TOC entry 200 (class 1259 OID 34934564)
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
-- TOC entry 197 (class 1259 OID 34934530)
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
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 34934507)
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
-- TOC entry 214 (class 1259 OID 34934704)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 34935256)
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
-- TOC entry 252 (class 1259 OID 34935269)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 34935291)
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
-- TOC entry 218 (class 1259 OID 34934729)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 34934464)
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
-- TOC entry 185 (class 1259 OID 34934364)
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
-- TOC entry 189 (class 1259 OID 34934431)
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
-- TOC entry 186 (class 1259 OID 34934375)
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
-- TOC entry 178 (class 1259 OID 34934310)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 34934329)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 34934736)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 34934770)
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
-- TOC entry 235 (class 1259 OID 34934904)
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
-- TOC entry 188 (class 1259 OID 34934411)
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
-- TOC entry 191 (class 1259 OID 34934456)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 34935142)
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
-- TOC entry 215 (class 1259 OID 34934710)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 34934441)
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
-- TOC entry 202 (class 1259 OID 34934585)
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
-- TOC entry 198 (class 1259 OID 34934545)
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
-- TOC entry 199 (class 1259 OID 34934557)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 34934722)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 34935156)
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
-- TOC entry 244 (class 1259 OID 34935166)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 34935055)
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
-- TOC entry 245 (class 1259 OID 34935174)
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
-- TOC entry 221 (class 1259 OID 34934751)
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
-- TOC entry 213 (class 1259 OID 34934695)
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
-- TOC entry 212 (class 1259 OID 34934685)
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
-- TOC entry 234 (class 1259 OID 34934893)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 34934823)
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
-- TOC entry 196 (class 1259 OID 34934519)
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
-- TOC entry 175 (class 1259 OID 34934281)
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
-- TOC entry 174 (class 1259 OID 34934279)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 222 (class 1259 OID 34934764)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 34934319)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 34934303)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 34934778)
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
-- TOC entry 216 (class 1259 OID 34934716)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 34934645)
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
-- TOC entry 173 (class 1259 OID 34934268)
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
-- TOC entry 172 (class 1259 OID 34934260)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 34934255)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 34934840)
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
-- TOC entry 187 (class 1259 OID 34934403)
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
-- TOC entry 209 (class 1259 OID 34934655)
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
-- TOC entry 211 (class 1259 OID 34934675)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 34934881)
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
-- TOC entry 184 (class 1259 OID 34934354)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 34935186)
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
-- TOC entry 207 (class 1259 OID 34934635)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 34934476)
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
-- TOC entry 176 (class 1259 OID 34934290)
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
-- TOC entry 237 (class 1259 OID 34934931)
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
-- TOC entry 201 (class 1259 OID 34934575)
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
-- TOC entry 220 (class 1259 OID 34934743)
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
-- TOC entry 231 (class 1259 OID 34934854)
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
-- TOC entry 249 (class 1259 OID 34935236)
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
-- TOC entry 248 (class 1259 OID 34935205)
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
-- TOC entry 250 (class 1259 OID 34935248)
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
-- TOC entry 227 (class 1259 OID 34934816)
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
-- TOC entry 204 (class 1259 OID 34934619)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 34934921)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 34934806)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 34934341)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 34934284)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3135 (class 0 OID 34934345)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5693-97d3-9be5-6186448b6dcf	10	30	Otroci	Abonma za otroke	200
000a0000-5693-97d3-338e-813d283844b8	20	60	Mladina	Abonma za mladino	400
000a0000-5693-97d3-d7be-6ed3f82f79cf	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3191 (class 0 OID 34934973)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, aktivna, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5693-97d3-24ae-fc3c2c7defed	000d0000-5693-97d3-eb7c-2e9e91dd0c56	\N	00090000-5693-97d3-a6dc-1cc6a6b55d5e	000b0000-5693-97d3-17fe-1482d4063f62	0001	f	\N	\N	\N	\N	3	t	t	t
000c0000-5693-97d3-cdd8-2b0adb2e9181	000d0000-5693-97d3-591e-d48adbb8be4f	00100000-5693-97d3-5d6b-997bc8b93522	00090000-5693-97d3-23b6-a2c4df0ba5eb	\N	0002	t	2016-01-01	\N	\N	\N	8	t	f	f
000c0000-5693-97d3-1ed1-9fdac124aa84	000d0000-5693-97d3-500d-bef898405576	00100000-5693-97d3-4e8c-7973e2d22aa7	00090000-5693-97d3-ce0f-1f9ad361887b	\N	0003	t	\N	2016-01-11	\N	\N	2	t	f	f
000c0000-5693-97d3-e0e2-9c38d1cb6a2d	000d0000-5693-97d3-7339-75828d6b3b5a	\N	00090000-5693-97d3-1fda-c566b68b1746	\N	0004	f	2016-01-01	2016-01-01	\N	\N	26	t	f	f
000c0000-5693-97d3-f657-d6babc81d60a	000d0000-5693-97d3-ad8c-636dfa585c8b	\N	00090000-5693-97d3-2f1c-eb3b7613154c	\N	0005	f	2016-01-01	2016-01-01	\N	\N	7	t	f	f
000c0000-5693-97d3-2dd1-e3b70b28a22a	000d0000-5693-97d3-11c8-98b901517ac9	\N	00090000-5693-97d3-29a2-af4b3bb596b4	000b0000-5693-97d3-4dfc-e0ffecca0c42	0006	f	2016-01-01	2016-01-01	\N	\N	1	t	t	t
000c0000-5693-97d3-16ef-9f5ab0a87e0c	000d0000-5693-97d3-f33c-1f9df8d4202f	00100000-5693-97d3-0016-5f8e494eff75	00090000-5693-97d3-5092-c39bd979af31	\N	0007	t	2016-01-01	2016-01-01	\N	\N	14	f	f	t
000c0000-5693-97d3-3af8-dd730bb6863a	000d0000-5693-97d3-1363-219d40c41b35	\N	00090000-5693-97d3-bd09-31219ca09e93	000b0000-5693-97d3-0abf-8638079c72c5	0008	f	2016-01-01	2016-01-01	\N	\N	12	t	t	t
000c0000-5693-97d3-e3df-f6c32cf3d869	000d0000-5693-97d3-f33c-1f9df8d4202f	00100000-5693-97d3-b86e-a50886a37045	00090000-5693-97d3-cddd-1ad873046642	\N	0009	t	2017-01-01	2017-01-01	\N	\N	15	t	f	t
000c0000-5693-97d3-b5dc-94285c801ce4	000d0000-5693-97d3-f33c-1f9df8d4202f	00100000-5693-97d3-c085-0048f06282ce	00090000-5693-97d3-18f4-09d93dc0c205	\N	0010	t	\N	2016-01-11	\N	\N	16	f	f	t
000c0000-5693-97d3-f33a-2de6253d650c	000d0000-5693-97d3-f33c-1f9df8d4202f	00100000-5693-97d3-8e9c-7a411001c565	00090000-5693-97d3-2669-661a4cf27607	\N	0011	t	2017-01-01	\N	\N	\N	17	f	f	t
000c0000-5693-97d3-8a22-b6e79c7a6b30	000d0000-5693-97d3-a768-c1c0373b47a0	00100000-5693-97d3-5d6b-997bc8b93522	00090000-5693-97d3-23b6-a2c4df0ba5eb	000b0000-5693-97d3-9885-5ec2c63472c6	0012	t	\N	\N	\N	\N	2	t	t	t
000c0000-5693-97d3-4b00-50ed8fe8cd0e	000d0000-5693-97d3-84d4-75595a8dc8ab	\N	00090000-5693-97d3-bd09-31219ca09e93	\N	0013	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-5695-428599ec39b3	000d0000-5693-97d3-84d4-75595a8dc8ab	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0014	f	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-e6b0-62db32d1502c	000d0000-5693-97d3-a184-28056cf426c7	00100000-5693-97d3-4e8c-7973e2d22aa7	00090000-5693-97d3-ce0f-1f9ad361887b	\N	0015	t	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-d574-65ee06d3bc77	000d0000-5693-97d3-a184-28056cf426c7	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0016	f	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-5e18-da8ad2e8231e	000d0000-5693-97d3-88e2-34760cec7f29	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0017	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-2471-3f696b054a8e	000d0000-5693-97d3-88e2-34760cec7f29	\N	00090000-5693-97d3-bd09-31219ca09e93	\N	0018	f	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-547e-2433a527d47d	000d0000-5693-97d3-e370-3ee9b6bb2ad7	00100000-5693-97d3-0016-5f8e494eff75	00090000-5693-97d3-5092-c39bd979af31	\N	0019	t	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-1340-22a0bfcf9a98	000d0000-5693-97d3-e370-3ee9b6bb2ad7	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0020	f	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-2107-a8b231b97c86	000d0000-5693-97d3-cffc-b80d5464f8f1	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0021	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-27c7-74a1395c7cfd	000d0000-5693-97d3-cffc-b80d5464f8f1	00100000-5693-97d3-0016-5f8e494eff75	00090000-5693-97d3-5092-c39bd979af31	\N	0022	t	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-e4a5-f785e8296b61	000d0000-5693-97d3-c19a-54ba8a5da4d4	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0023	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-f75f-8c1d3da8d8ec	000d0000-5693-97d3-d425-7a32846ffa3e	\N	00090000-5693-97d3-bd09-31219ca09e93	\N	0024	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-d76d-597abbb05a7c	000d0000-5693-97d3-da61-804241119523	\N	00090000-5693-97d3-bd09-31219ca09e93	\N	0025	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-e2d4-bb42943d774b	000d0000-5693-97d3-da61-804241119523	00100000-5693-97d3-4e8c-7973e2d22aa7	00090000-5693-97d3-ce0f-1f9ad361887b	\N	0026	t	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-b89b-415ee365e200	000d0000-5693-97d3-edbb-9b22ff429704	\N	00090000-5693-97d3-ff71-e5d31a3b5552	\N	0027	f	\N	\N	\N	\N	2	t	f	t
000c0000-5693-97d3-19dc-2a7b972e4859	000d0000-5693-97d3-edbb-9b22ff429704	\N	00090000-5693-97d3-ed65-126770d5fac3	\N	0028	f	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-ee41-debc1cf25ffd	000d0000-5693-97d3-d8c1-2c9424b17646	\N	00090000-5693-97d3-bd09-31219ca09e93	\N	0029	f	\N	\N	\N	\N	1	t	f	t
000c0000-5693-97d3-736d-bcd7ed02b078	000d0000-5693-97d3-d8c1-2c9424b17646	00100000-5693-97d3-4e8c-7973e2d22aa7	00090000-5693-97d3-ce0f-1f9ad361887b	\N	0030	t	\N	\N	\N	\N	2	f	f	t
000c0000-5693-97d3-0855-2e7022d68d9c	000d0000-5693-97d3-d8c1-2c9424b17646	\N	00090000-5693-97d3-ed65-126770d5fac3	\N	0031	f	\N	\N	\N	\N	3	f	f	t
000c0000-5693-97d3-4f9e-0e970c821efd	000d0000-5693-97d3-d8c1-2c9424b17646	\N	00090000-5693-97d3-ff71-e5d31a3b5552	\N	0032	f	\N	\N	\N	\N	4	f	f	t
000c0000-5693-97d3-76db-369c5924feef	000d0000-5693-97d3-72cd-7a2209dc64d7	\N	00090000-5693-97d3-bd09-31219ca09e93	\N	0033	f	\N	\N	\N	\N	4	t	f	t
000c0000-5693-97d3-c14e-f609ff51ae77	000d0000-5693-97d3-2de6-514191399cee	00100000-5693-97d3-4e8c-7973e2d22aa7	00090000-5693-97d3-ce0f-1f9ad361887b	\N	0034	t	\N	\N	\N	\N	4	t	f	t
000c0000-5693-97d3-39fc-53ec648f4478	000d0000-5693-97d3-2de6-514191399cee	\N	00090000-5693-97d3-a5c0-86c84e6e8982	\N	0035	f	\N	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3190 (class 0 OID 34934956)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 34934338)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3181 (class 0 OID 34934833)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5693-97d3-c874-1a819448df9d	00160000-5693-97d2-cacf-a14536ad2394	00090000-5693-97d3-ed65-126770d5fac3	aizv	10	t
003d0000-5693-97d3-4602-c00bf3f76f59	00160000-5693-97d2-cacf-a14536ad2394	00090000-5693-97d3-6ded-c7df96e93b61	apri	14	t
003d0000-5693-97d3-e893-d35ed40c9de2	00160000-5693-97d2-6542-4d2e9ef4dba4	00090000-5693-97d3-ff71-e5d31a3b5552	aizv	11	t
003d0000-5693-97d3-2143-8e26b9445668	00160000-5693-97d2-8b15-65eafe7a9980	00090000-5693-97d3-1f0b-8187248fe04f	aizv	12	t
003d0000-5693-97d3-4123-a9238b0cc9ce	00160000-5693-97d2-cacf-a14536ad2394	00090000-5693-97d3-a5c0-86c84e6e8982	apri	18	f
\.


--
-- TOC entry 3184 (class 0 OID 34934863)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5693-97d2-cacf-a14536ad2394	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5693-97d2-6542-4d2e9ef4dba4	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5693-97d2-8b15-65eafe7a9980	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3205 (class 0 OID 34935276)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 34934668)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 34934593)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5693-97d3-b074-883cfed5fb61	\N	\N	00200000-5693-97d3-ed37-91cadefbba8a	\N	\N	\N	00220000-5693-97d2-a0b7-484f87054ba8	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5693-97d3-3d33-55a39969b1cc	\N	\N	00200000-5693-97d3-e4dc-f8e62183b670	\N	\N	\N	00220000-5693-97d2-a0b7-484f87054ba8	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5693-97d3-e042-1b4e0af542e2	\N	\N	00200000-5693-97d3-e9fa-9d1071b7e024	\N	\N	\N	00220000-5693-97d2-1f05-d42f6b642248	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5693-97d3-ef68-56f0a96a9cbf	\N	\N	00200000-5693-97d3-0fc5-437cf99e5f94	\N	\N	\N	00220000-5693-97d2-a5a7-7cd3fffd1620	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5693-97d3-8b9c-20d34c57a669	\N	\N	00200000-5693-97d3-c1d8-2f774f0c460d	\N	\N	\N	00220000-5693-97d2-250f-88d41e88e2c3	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3157 (class 0 OID 34934625)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 34934630)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 34935198)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 34934490)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5693-97d0-60c2-6cb615c01176	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5693-97d0-8a41-4d4b2f10a41a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5693-97d0-be12-451a79374cf8	AL	ALB	008	Albania 	Albanija	\N
00040000-5693-97d0-edc7-2a1347a31826	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5693-97d0-e9a2-bfd187f83dfd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5693-97d0-3975-71d824c3ef70	AD	AND	020	Andorra 	Andora	\N
00040000-5693-97d0-7b9c-16773fa920f7	AO	AGO	024	Angola 	Angola	\N
00040000-5693-97d0-5baf-6e2e7bb3803a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5693-97d0-9240-99863b4f550c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5693-97d0-42fe-e71a3d86ef2a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5693-97d0-ec28-ebcb217232ee	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5693-97d0-9c50-3b2bad6632d0	AM	ARM	051	Armenia 	Armenija	\N
00040000-5693-97d0-403f-d436c78c06ed	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5693-97d0-5924-b83b18f3f191	AU	AUS	036	Australia 	Avstralija	\N
00040000-5693-97d0-b032-e56ce76b1f55	AT	AUT	040	Austria 	Avstrija	\N
00040000-5693-97d0-55ea-2ab290f0c23a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5693-97d0-8b67-34a0d493e1e7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5693-97d0-91f4-2334cc232a2b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5693-97d0-7bcb-30bdaefa454b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5693-97d0-63a8-fc607dfe4f41	BB	BRB	052	Barbados 	Barbados	\N
00040000-5693-97d0-ce93-95c43ffbf1fa	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5693-97d0-b451-1fc1c0f7b261	BE	BEL	056	Belgium 	Belgija	\N
00040000-5693-97d0-af9a-2a47e7d0ddb2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5693-97d0-d380-2bd4aedb6339	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5693-97d0-5496-b858492f151d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5693-97d0-babe-29b19c5af96c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5693-97d0-feca-f118940d4088	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5693-97d0-f07b-1632e07af6b8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5693-97d0-c6ae-a5075300b41f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5693-97d0-1e4c-ab4cd99406d4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5693-97d0-5c7e-690ff3c92c39	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5693-97d0-c1b0-28acec964635	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5693-97d0-1b0c-9d5d75897a6f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5693-97d0-720b-849ed116e303	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5693-97d0-aa87-a99387b8dfc3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5693-97d0-8255-68cd23f66744	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5693-97d0-d8c4-a9f72fa55f76	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5693-97d0-7fd4-c8c2d5543995	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5693-97d0-f3f9-1d2a78b18d38	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5693-97d0-5354-85d4d98a7a54	CA	CAN	124	Canada 	Kanada	\N
00040000-5693-97d0-cb5b-2761388b65c3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5693-97d0-af63-722d1460d6f8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5693-97d0-859b-8453773bf285	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5693-97d0-1ae9-09b042aa29ea	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5693-97d0-7530-14d05bd1c5c5	CL	CHL	152	Chile 	Čile	\N
00040000-5693-97d0-f7e3-7ff34448ce7d	CN	CHN	156	China 	Kitajska	\N
00040000-5693-97d0-15f2-9643ca726a5a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5693-97d0-c038-5c480b2234f9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5693-97d0-d19e-5de695467420	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5693-97d0-90a0-54e107f91f70	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5693-97d0-97e4-669a1fc4448c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5693-97d0-4bf6-cd3c958ee0a8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5693-97d0-8406-017b0b737dbd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5693-97d0-c5f1-a1d5b3107778	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5693-97d0-1847-ee4817cfa4ac	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5693-97d0-dd65-5db56ac0faed	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5693-97d0-2948-fe671ecb8d31	CU	CUB	192	Cuba 	Kuba	\N
00040000-5693-97d0-6505-26cea133d0d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5693-97d0-0a83-6cc32759591f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5693-97d0-edc0-aaceadf79f15	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5693-97d0-17c6-dc0beb0534b2	DK	DNK	208	Denmark 	Danska	\N
00040000-5693-97d0-d418-95dc02e3dc90	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5693-97d0-e60c-2731897b9fd6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5693-97d0-45c0-d76039fb45b7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5693-97d0-0c78-fa7585ff57da	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5693-97d0-726b-2c9cbe887643	EG	EGY	818	Egypt 	Egipt	\N
00040000-5693-97d0-a0c2-4f9a7a8ffb9c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5693-97d0-4e5c-189eea2f580a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5693-97d0-375d-a1d7cab89d6e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5693-97d0-3869-49452ee9415b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5693-97d0-a6be-a22505d44097	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5693-97d0-1222-f034d0a125af	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5693-97d0-66ba-a761631c86cd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5693-97d0-5cdf-fb12c093ab4f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5693-97d0-01c7-4e4b6a00b8d4	FI	FIN	246	Finland 	Finska	\N
00040000-5693-97d0-2e27-7ef33eb9d58a	FR	FRA	250	France 	Francija	\N
00040000-5693-97d0-9981-1ebcac87c33c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5693-97d0-fde9-fee8e191e3c3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5693-97d0-085c-7836f58305d7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5693-97d0-67b7-d6026c55068f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5693-97d0-1f75-3350b838aa35	GA	GAB	266	Gabon 	Gabon	\N
00040000-5693-97d0-af12-7c17bcf6374e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5693-97d0-2c79-75b4b61ebfae	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5693-97d0-4384-c3c1dbb41f56	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5693-97d0-eb52-cb880d520516	GH	GHA	288	Ghana 	Gana	\N
00040000-5693-97d0-aac2-8053b8efb6aa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5693-97d0-c1c8-1edd95c2295a	GR	GRC	300	Greece 	Grčija	\N
00040000-5693-97d0-aa3b-1ab39439c78f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5693-97d0-f821-24e69ec8f18e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5693-97d0-53a5-68f4e56df5ca	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5693-97d0-6f21-ce2dc359ad04	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5693-97d0-99c4-9d620a286464	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5693-97d0-4086-b94758f025e0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5693-97d0-aea5-dfde1fade636	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5693-97d0-e1f9-e51239ae28e0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5693-97d0-6007-1ba452459e01	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5693-97d0-ff69-155e01648746	HT	HTI	332	Haiti 	Haiti	\N
00040000-5693-97d0-a62e-f104a6a4d8a0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5693-97d0-e3cb-2acd11f11212	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5693-97d0-ff38-200ce5e24c03	HN	HND	340	Honduras 	Honduras	\N
00040000-5693-97d0-72cb-cec5528f1f8b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5693-97d0-2c01-6189ae6a9d89	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5693-97d0-62bf-6939ac029ac4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5693-97d0-d8fd-ff39d340d897	IN	IND	356	India 	Indija	\N
00040000-5693-97d0-028a-df1350b7cfd6	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5693-97d0-75f8-5b8212408a99	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5693-97d0-2af5-f7ebb20b8c3d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5693-97d0-445c-72a49cd716c3	IE	IRL	372	Ireland 	Irska	\N
00040000-5693-97d0-a6f1-315b97e491d5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5693-97d0-7a9f-2e234d9dc28e	IL	ISR	376	Israel 	Izrael	\N
00040000-5693-97d0-4749-3ffb23ad72be	IT	ITA	380	Italy 	Italija	\N
00040000-5693-97d0-5f71-93e4734ed336	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5693-97d0-b700-5b4ac009591d	JP	JPN	392	Japan 	Japonska	\N
00040000-5693-97d0-a6ea-ebc0a48da556	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5693-97d0-2a0a-280882460183	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5693-97d0-9d48-546bd400ca7d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5693-97d0-0087-41d4c1a3c021	KE	KEN	404	Kenya 	Kenija	\N
00040000-5693-97d0-1109-2d6d97310ede	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5693-97d0-6ccf-48e8d7be28f5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5693-97d0-1157-552aec28d6b7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5693-97d0-610c-04a111a61265	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5693-97d0-9970-d6958e0652b9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5693-97d0-d044-13112b58928c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5693-97d0-d9a9-8d085dff6570	LV	LVA	428	Latvia 	Latvija	\N
00040000-5693-97d0-b1ed-5108a39bb0a2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5693-97d0-73ca-0ab2bbb2ba14	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5693-97d0-4bf4-1c603536fd19	LR	LBR	430	Liberia 	Liberija	\N
00040000-5693-97d0-c8f2-58676c5ad58e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5693-97d0-00ef-8eab7fb77b29	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5693-97d0-64ad-f8f542ea4103	LT	LTU	440	Lithuania 	Litva	\N
00040000-5693-97d0-2825-6395bbdfdd35	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5693-97d0-7ce5-a8135de0ac93	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5693-97d0-81c3-59a62dac20f1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5693-97d0-a797-30db239ad177	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5693-97d0-a21d-2d815b3c93b4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5693-97d0-2d67-2ac79c0537a9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5693-97d0-7beb-7dbaf5f281d3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5693-97d0-ad8b-22b0eb31cb30	ML	MLI	466	Mali 	Mali	\N
00040000-5693-97d0-0754-72ccbc2ba6a6	MT	MLT	470	Malta 	Malta	\N
00040000-5693-97d0-8e74-f4e56cff42d4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5693-97d0-10c2-ec367068f826	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5693-97d0-d4e9-182564f3c83f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5693-97d0-cf38-100d57719f52	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5693-97d0-6fa2-1fb206fc8950	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5693-97d0-b692-099f5213222c	MX	MEX	484	Mexico 	Mehika	\N
00040000-5693-97d0-2858-e59c2f59ddf0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5693-97d0-7364-c58ec5ffa3c8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5693-97d0-9c0d-241ce2821953	MC	MCO	492	Monaco 	Monako	\N
00040000-5693-97d0-ad84-c98341ee8890	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5693-97d0-7d6f-0ad651ccf178	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5693-97d0-93e7-757542b1e610	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5693-97d0-8c23-90bda624d83d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5693-97d0-3787-dc94447342e9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5693-97d0-daf4-38b59ac108f5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5693-97d0-6312-ac314daadf73	NA	NAM	516	Namibia 	Namibija	\N
00040000-5693-97d0-66d1-2b876bd29d9d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5693-97d0-4a93-31327dcaf48f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5693-97d0-ba5f-4695f06a8cc1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5693-97d0-e66d-dc44a3ab2e70	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5693-97d0-5fcb-f3ca8fb6d7f8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5693-97d0-8f9f-a3d7b82ebe14	NE	NER	562	Niger 	Niger 	\N
00040000-5693-97d0-0025-ad86900e56b0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5693-97d0-ee0d-d8616f5ddcee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5693-97d0-6c11-124716b52be4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5693-97d0-b127-ade3bcca6b79	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5693-97d0-1e5b-1a8c55ce6f1a	NO	NOR	578	Norway 	Norveška	\N
00040000-5693-97d0-8898-5d8a8f075ba9	OM	OMN	512	Oman 	Oman	\N
00040000-5693-97d0-0c67-58ff28eab6c5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5693-97d0-20e5-7a2eb922d637	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5693-97d0-4027-1c5941d9706e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5693-97d0-4ba8-b46b96ae1007	PA	PAN	591	Panama 	Panama	\N
00040000-5693-97d0-b03e-fdc570298690	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5693-97d0-24a7-3eb0a18d7348	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5693-97d0-9f00-d6f577a2f6c1	PE	PER	604	Peru 	Peru	\N
00040000-5693-97d0-ed76-33a32e25969e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5693-97d0-225c-3e4ddbe18d2d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5693-97d0-4aa5-666caf52ef5c	PL	POL	616	Poland 	Poljska	\N
00040000-5693-97d0-8da1-70d24c8e9678	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5693-97d0-6b18-744ccf9e99b3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5693-97d0-cc84-67a2864dfcf0	QA	QAT	634	Qatar 	Katar	\N
00040000-5693-97d0-71e7-77c03f932c3f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5693-97d0-38f1-fc9bccfaaf0b	RO	ROU	642	Romania 	Romunija	\N
00040000-5693-97d0-7003-9b30c906880b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5693-97d0-b9c7-ebe20dafb909	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5693-97d0-b5fd-06c63ae8bc9f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5693-97d0-e934-57ff4f2cea38	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5693-97d0-4a18-1c6dabf7ed0e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5693-97d0-ab69-fc06bda15f2b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5693-97d0-637b-f16d1a2eac77	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5693-97d0-9a8b-b4ca82bf9678	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5693-97d0-bda5-7c18f1da670a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5693-97d0-2734-a0d0bf1dc263	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5693-97d0-38b4-2fbc7105db4f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5693-97d0-8c19-90c00c0b6d35	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5693-97d0-07a8-3b58ee0fa346	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5693-97d0-a0d5-cbdbc21268f4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5693-97d0-b3dc-4a8b84f83c06	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5693-97d0-eb25-972966948bd9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5693-97d0-e1f4-bd3f5e884a99	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5693-97d0-ed17-31554382b0a2	SG	SGP	702	Singapore 	Singapur	\N
00040000-5693-97d0-4d1d-b506a443bb1f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5693-97d0-3a7c-bb0fbc23c7c4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5693-97d0-7cdc-7c2b86dc39dd	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5693-97d0-e94b-54d13382ce30	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5693-97d0-626e-73a9a81ffe43	SO	SOM	706	Somalia 	Somalija	\N
00040000-5693-97d0-4026-db4a5296b138	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5693-97d0-73e2-0ad2ff114a8e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5693-97d0-4d24-82ee7f071714	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5693-97d0-24d0-fc000529a087	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5693-97d0-ed69-77b009fbc6ed	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5693-97d0-775f-c12e202f004d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5693-97d0-e5f1-87212cd064b5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5693-97d0-e01c-5301c8ebfe13	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5693-97d0-1fc4-ea3f7c1a1e47	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5693-97d0-b61e-d0b343b68c14	SE	SWE	752	Sweden 	Švedska	\N
00040000-5693-97d0-e473-268b50a582c3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5693-97d0-65c8-29bab8edfab3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5693-97d0-0e44-e0732c365e9a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5693-97d0-1fe9-e9de8fd24c43	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5693-97d0-9c5c-dc5e10da7c8b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5693-97d0-7473-087c6b642e18	TH	THA	764	Thailand 	Tajska	\N
00040000-5693-97d0-6a7b-f3f39f5cb06e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5693-97d0-b9b2-5c5df4f16f29	TG	TGO	768	Togo 	Togo	\N
00040000-5693-97d0-2216-3f1adf7d954d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5693-97d0-b6c3-c6de3aac6202	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5693-97d0-9e86-fc4f1b471d8d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5693-97d0-5a1b-c4b973967ad9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5693-97d0-93a9-8f894c84cf15	TR	TUR	792	Turkey 	Turčija	\N
00040000-5693-97d0-4b1d-a17791b8cb6e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5693-97d0-80c9-a37f59307a48	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5693-97d0-0c70-2710eaeb9c9d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5693-97d0-453f-75e9068030bb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5693-97d0-8380-b62c9ec80247	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5693-97d0-48ac-76583424f875	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5693-97d0-30ce-0e3a433093af	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5693-97d0-4c87-cfb9d2e6e1ae	US	USA	840	United States 	Združene države Amerike	\N
00040000-5693-97d0-9d39-376f70fffc02	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5693-97d0-802d-d5e899350f68	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5693-97d0-ef9f-a659f619712e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5693-97d0-03a3-3a26efb0cd8b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5693-97d0-b41c-57712693bfc4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5693-97d0-f91c-1c0be9ecd75d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5693-97d0-5184-72ee20d7cb2b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5693-97d0-543f-01962213cdcc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5693-97d0-7a00-cc4d8dd1a3a4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5693-97d0-4351-8803112de729	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5693-97d0-b310-a6386cdf1d5e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5693-97d0-a7d2-619e37ebd9c9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5693-97d0-dc7e-fb9fe1f0589f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3192 (class 0 OID 34934986)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5693-97d3-eb0f-f3bcd180ce57	000e0000-5693-97d3-a403-2d4f8d5bdfd3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5693-97d0-f96b-4ae01f8249b4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5693-97d3-70c5-777b19840c45	000e0000-5693-97d3-757c-4d039dee2909	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5693-97d0-6ddb-e728d25442e1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5693-97d3-fe3a-29f0eb3a3242	000e0000-5693-97d3-3673-b9d2113558e8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5693-97d0-f96b-4ae01f8249b4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5693-97d3-3e5a-ad2ae8f5307c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5693-97d3-2b69-2dc495c4baa6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 34934790)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5693-97d3-e9ac-5c811a0a8742	000e0000-5693-97d3-4018-dfc37a7e887a	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-5693-97d0-e29e-507bdc7f67ee
000d0000-5693-97d3-12a8-ae2bcb542ec5	000e0000-5693-97d3-4018-dfc37a7e887a	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-eb7c-2e9e91dd0c56	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-24ae-fc3c2c7defed	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5693-97d0-e29e-507bdc7f67ee
000d0000-5693-97d3-591e-d48adbb8be4f	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-cdd8-2b0adb2e9181	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-500d-bef898405576	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-1ed1-9fdac124aa84	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5693-97d0-80ef-a96c88a18b37
000d0000-5693-97d3-7339-75828d6b3b5a	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-e0e2-9c38d1cb6a2d	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5693-97d0-b9c0-5ab3fa6ce6c1
000d0000-5693-97d3-ad8c-636dfa585c8b	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-f657-d6babc81d60a	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5693-97d0-b9c0-5ab3fa6ce6c1
000d0000-5693-97d3-11c8-98b901517ac9	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-2dd1-e3b70b28a22a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5693-97d0-e29e-507bdc7f67ee
000d0000-5693-97d3-f33c-1f9df8d4202f	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-e3df-f6c32cf3d869	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5693-97d0-e29e-507bdc7f67ee
000d0000-5693-97d3-1363-219d40c41b35	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-3af8-dd730bb6863a	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5693-97d0-ced4-a5956425c335
000d0000-5693-97d3-a768-c1c0373b47a0	000e0000-5693-97d3-757c-4d039dee2909	000c0000-5693-97d3-8a22-b6e79c7a6b30	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5693-97d0-d659-80f7d8e8e24b
000d0000-5693-97d3-84d4-75595a8dc8ab	000e0000-5693-97d3-2860-1f8167939df9	000c0000-5693-97d3-4b00-50ed8fe8cd0e	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-a184-28056cf426c7	000e0000-5693-97d3-8d76-ff1dcb117b50	000c0000-5693-97d3-e6b0-62db32d1502c	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-88e2-34760cec7f29	000e0000-5693-97d3-8d76-ff1dcb117b50	000c0000-5693-97d3-5e18-da8ad2e8231e	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-e370-3ee9b6bb2ad7	000e0000-5693-97d3-fb34-119c6def8629	000c0000-5693-97d3-547e-2433a527d47d	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-cffc-b80d5464f8f1	000e0000-5693-97d3-db71-57ed2afda47f	000c0000-5693-97d3-2107-a8b231b97c86	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-c19a-54ba8a5da4d4	000e0000-5693-97d3-5df0-7ff8064dbb3f	000c0000-5693-97d3-e4a5-f785e8296b61	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-d425-7a32846ffa3e	000e0000-5693-97d3-1365-3e8683c0f16b	000c0000-5693-97d3-f75f-8c1d3da8d8ec	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-da61-804241119523	000e0000-5693-97d3-a4ea-49feedfb970f	000c0000-5693-97d3-d76d-597abbb05a7c	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-edbb-9b22ff429704	000e0000-5693-97d3-0966-d57b416665a7	000c0000-5693-97d3-b89b-415ee365e200	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-d8c1-2c9424b17646	000e0000-5693-97d3-0966-d57b416665a7	000c0000-5693-97d3-ee41-debc1cf25ffd	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-72cd-7a2209dc64d7	000e0000-5693-97d3-f6ac-a66274326f2d	000c0000-5693-97d3-76db-369c5924feef	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-5693-97d0-fc38-92c211c54737
000d0000-5693-97d3-2de6-514191399cee	000e0000-5693-97d3-f6ac-a66274326f2d	000c0000-5693-97d3-c14e-f609ff51ae77	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-5693-97d0-fc38-92c211c54737
\.


--
-- TOC entry 3152 (class 0 OID 34934564)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 34934530)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 34934507)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5693-97d3-78b2-ef9c9d6ab88b	00080000-5693-97d3-fd79-d098245531fd	00090000-5693-97d3-18f4-09d93dc0c205	AK		igralka
\.


--
-- TOC entry 3166 (class 0 OID 34934704)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 34935256)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5693-97d3-ae2d-b3fcee87deb4	00010000-5693-97d1-68ac-ae320cd308ab	\N	Prva mapa	Root mapa	2016-01-11 12:53:55	2016-01-11 12:53:55	R	\N	\N
\.


--
-- TOC entry 3204 (class 0 OID 34935269)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 34935291)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 34548309)
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
-- TOC entry 3170 (class 0 OID 34934729)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 34934464)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5693-97d1-59c7-69215299fa8d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5693-97d1-bd16-998f94dd4ee9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5693-97d1-9920-1a33fcb6e988	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5693-97d1-5360-8e80256c5408	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5693-97d1-918c-311e9ecf83bf	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5693-97d1-ccc6-a4ea0c7df91f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5693-97d1-3af9-499c6db2e7bb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5693-97d1-2b32-148dae53d20b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5693-97d1-9a73-fcadd1e8c18e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5693-97d1-e3b9-7a54f55c1383	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5693-97d1-5dad-694dd38faaa6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5693-97d1-03ba-262d95de8716	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5693-97d1-2a86-38704ab6fc1c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5693-97d1-47f1-ced3fb38bb70	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5693-97d2-b6cb-7b15f02c5775	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5693-97d2-4916-6d29f2960c25	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5693-97d2-3425-0c2566967e28	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5693-97d2-d483-fb2ab74c0b5b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5693-97d2-68a7-2d7fbe309d09	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5693-97d5-eefa-e0adbe8bc797	application.tenant.maticnopodjetje	string	s:36:"00080000-5693-97d5-c3ae-d117176bc27c";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3137 (class 0 OID 34934364)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5693-97d2-32cf-365fe442353a	00000000-5693-97d2-b6cb-7b15f02c5775	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5693-97d2-5909-7b9cbbd71ee7	00000000-5693-97d2-b6cb-7b15f02c5775	00010000-5693-97d1-68ac-ae320cd308ab	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5693-97d2-ba6f-db4f75c9f158	00000000-5693-97d2-4916-6d29f2960c25	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3141 (class 0 OID 34934431)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5693-97d3-d079-9d80b2e1e9ba	\N	00100000-5693-97d3-5d6b-997bc8b93522	00100000-5693-97d3-4e8c-7973e2d22aa7	01	Gledališče Nimbis
00410000-5693-97d3-f281-1e09b9787c91	00410000-5693-97d3-d079-9d80b2e1e9ba	00100000-5693-97d3-5d6b-997bc8b93522	00100000-5693-97d3-4e8c-7973e2d22aa7	02	Tehnika
\.


--
-- TOC entry 3138 (class 0 OID 34934375)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5693-97d3-a6dc-1cc6a6b55d5e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5693-97d3-1fda-c566b68b1746	00010000-5693-97d3-6de1-88c041c1470c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5693-97d3-ce0f-1f9ad361887b	00010000-5693-97d3-c3bd-eed0b01334ce	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5693-97d3-cddd-1ad873046642	00010000-5693-97d3-1bfa-04ec770e97dd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5693-97d3-4f81-e0715b789ac2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5693-97d3-29a2-af4b3bb596b4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5693-97d3-2669-661a4cf27607	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5693-97d3-5092-c39bd979af31	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5693-97d3-18f4-09d93dc0c205	00010000-5693-97d3-9a3a-1ad803a4a7a1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5693-97d3-23b6-a2c4df0ba5eb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5693-97d3-351c-475f3ca4b3fb	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5693-97d3-2f1c-eb3b7613154c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5693-97d3-bd09-31219ca09e93	00010000-5693-97d3-9688-afbb95bf9873	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5693-97d3-ed65-126770d5fac3	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-97d3-6ded-c7df96e93b61	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-97d3-ff71-e5d31a3b5552	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-97d3-1f0b-8187248fe04f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5693-97d3-a5c0-86c84e6e8982	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5693-97d3-82e2-08990fe18c74	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-97d3-bdd2-ae04c8cb566f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-97d3-66a6-6a2707f1f125	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3130 (class 0 OID 34934310)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5693-97d0-11b3-bef29b59e3f1	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5693-97d0-a4e8-4bd26f35a66b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5693-97d0-e194-2ea1b93a068e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5693-97d0-5793-49fcc0e797cf	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5693-97d0-ae71-85609edc3444	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5693-97d0-7903-8bc53f375614	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5693-97d0-cc5e-00f1862a216f	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5693-97d0-c46b-56ebd67fb9e7	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5693-97d0-c392-748e23dbefbf	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5693-97d0-9330-c69dd8f9577b	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5693-97d0-2f7f-eb79fa7d25cb	Abonma-read	Abonma - branje	t
00030000-5693-97d0-f7e0-633beca8f48c	Abonma-write	Abonma - spreminjanje	t
00030000-5693-97d0-b894-d29f68ff1e93	Alternacija-read	Alternacija - branje	t
00030000-5693-97d0-295d-2adc71e559b2	Alternacija-write	Alternacija - spreminjanje	t
00030000-5693-97d0-f768-8b6e7ba6fb94	Arhivalija-read	Arhivalija - branje	t
00030000-5693-97d0-ac1b-f77f3a03c8ae	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5693-97d0-63ed-8ff5ee78b396	AuthStorage-read	AuthStorage - branje	t
00030000-5693-97d0-7a81-9e3582f16fd6	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5693-97d0-cfcb-ff8212885af8	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5693-97d0-dba9-31b701571552	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5693-97d0-9ed6-9731c65649eb	Besedilo-read	Besedilo - branje	t
00030000-5693-97d0-db96-43d371fa8498	Besedilo-write	Besedilo - spreminjanje	t
00030000-5693-97d0-6063-8f066671f4b3	Dodatek-read	Dodatek - branje	t
00030000-5693-97d0-f83e-9b26fa74facd	Dodatek-write	Dodatek - spreminjanje	t
00030000-5693-97d0-1652-d444457ddc09	Dogodek-read	Dogodek - branje	t
00030000-5693-97d0-023b-198862e8fe69	Dogodek-write	Dogodek - spreminjanje	t
00030000-5693-97d0-560b-ea296955643b	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5693-97d0-d5ad-5185d797e666	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5693-97d0-1803-642136fd7f4d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5693-97d0-8833-1c2b107277da	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5693-97d0-c6ec-bce00e706508	DogodekTrait-read	DogodekTrait - branje	t
00030000-5693-97d0-0ef0-41707d6a9369	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5693-97d0-a816-1f5a5ff0bdeb	DrugiVir-read	DrugiVir - branje	t
00030000-5693-97d0-dae1-fc203148dd23	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5693-97d0-f022-8fa704d4b185	Drzava-read	Drzava - branje	t
00030000-5693-97d0-87ac-97d8523a6194	Drzava-write	Drzava - spreminjanje	t
00030000-5693-97d0-012d-f8ae642505ac	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5693-97d0-901e-633e6a029672	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5693-97d0-9ae8-2b20e1da9d3b	Funkcija-read	Funkcija - branje	t
00030000-5693-97d0-fddb-c945cd439105	Funkcija-write	Funkcija - spreminjanje	t
00030000-5693-97d0-e1e1-55df5cf5c201	Gostovanje-read	Gostovanje - branje	t
00030000-5693-97d0-965f-e2b68b9ad85c	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5693-97d0-2a83-a0800543e651	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5693-97d0-ca9b-c2666ef8f1fb	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5693-97d0-4a67-bfa54914b7c1	Kupec-read	Kupec - branje	t
00030000-5693-97d0-d189-3d089ee4cefe	Kupec-write	Kupec - spreminjanje	t
00030000-5693-97d0-ce68-ef43388d00ec	NacinPlacina-read	NacinPlacina - branje	t
00030000-5693-97d0-21b0-25681fd4607a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5693-97d0-0143-03d42c6d298f	Option-read	Option - branje	t
00030000-5693-97d0-a10a-dc6384439ac5	Option-write	Option - spreminjanje	t
00030000-5693-97d0-d9ad-53a0538bfed5	OptionValue-read	OptionValue - branje	t
00030000-5693-97d0-20e6-7e9502ca3719	OptionValue-write	OptionValue - spreminjanje	t
00030000-5693-97d0-da73-57f0e155f05c	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5693-97d0-cc9b-264256d3606c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5693-97d0-9e36-a41be7c15424	Oseba-read	Oseba - branje	t
00030000-5693-97d0-7675-713f5532fce1	Oseba-write	Oseba - spreminjanje	t
00030000-5693-97d0-842a-0bf85df77d07	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5693-97d0-ed05-91ac3563978f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5693-97d0-d4a7-1b9659a4fc5d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5693-97d0-ed5c-a774402d7cce	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5693-97d0-5f31-78a86c50803c	Pogodba-read	Pogodba - branje	t
00030000-5693-97d0-d93e-545e54cbbe7f	Pogodba-write	Pogodba - spreminjanje	t
00030000-5693-97d0-44e1-a1ebd77b91cb	Popa-read	Popa - branje	t
00030000-5693-97d0-3e2c-b67de73aba30	Popa-write	Popa - spreminjanje	t
00030000-5693-97d0-4321-bf4f07b0679b	Posta-read	Posta - branje	t
00030000-5693-97d0-aed4-674e114c6289	Posta-write	Posta - spreminjanje	t
00030000-5693-97d0-e736-5ddfe668fa22	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5693-97d0-6320-60c1721b7cdf	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5693-97d0-02b2-7b45c36c11c3	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5693-97d0-8cab-f88174451fa3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5693-97d0-46cd-59cff6f271e7	PostniNaslov-read	PostniNaslov - branje	t
00030000-5693-97d0-0152-a41513885302	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5693-97d0-d63b-a2dbd058c486	Praznik-read	Praznik - branje	t
00030000-5693-97d0-1708-24b8cc15eeea	Praznik-write	Praznik - spreminjanje	t
00030000-5693-97d0-ad03-7a1b08e29b45	Predstava-read	Predstava - branje	t
00030000-5693-97d0-76b3-8c17074679a3	Predstava-write	Predstava - spreminjanje	t
00030000-5693-97d0-72bc-ac70f20535ac	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5693-97d0-7439-e08e0371f5f7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5693-97d0-5c00-f70a437967ab	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5693-97d0-e27e-d0a98c65becc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5693-97d0-275d-b52142cb250c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5693-97d0-fe29-77b35084ec51	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5693-97d0-5b98-d35165cc6b32	ProgramDela-read	ProgramDela - branje	t
00030000-5693-97d0-8d4e-ca400ab40ab9	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5693-97d0-5000-56dcfec2bf02	ProgramFestival-read	ProgramFestival - branje	t
00030000-5693-97d0-2761-64ad075c8918	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5693-97d0-b43f-c302daffb66e	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5693-97d0-346a-c1140a095bbf	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5693-97d0-185f-d9097a0b584d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5693-97d0-1a66-654fb2b884d8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5693-97d0-5d8a-3db244a135e6	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5693-97d0-abeb-e1bd4138b718	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5693-97d0-16fa-51645e111235	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5693-97d0-ac8b-e9be4a2376cd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5693-97d0-40e9-3a9a0cfcba4a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5693-97d0-a9ea-1d5dc0ffa5b4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5693-97d0-027d-2c5aa3f07917	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5693-97d0-5886-f6b50ab79777	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5693-97d0-7426-edede133bbec	ProgramRazno-read	ProgramRazno - branje	t
00030000-5693-97d0-7e74-0de3d9fdef52	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5693-97d0-f1ec-18c6a5e29624	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5693-97d0-d0f1-97254d60a2f2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5693-97d0-fe29-c3b9bbc0e6cd	Prostor-read	Prostor - branje	t
00030000-5693-97d0-91eb-20ebad57c0c1	Prostor-write	Prostor - spreminjanje	t
00030000-5693-97d0-2ec7-3afdfb907b2d	Racun-read	Racun - branje	t
00030000-5693-97d0-0024-6db4fb2f2881	Racun-write	Racun - spreminjanje	t
00030000-5693-97d0-575d-9dd0fc30a3dc	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5693-97d0-505c-b91877aef8c3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5693-97d0-2771-1a698a932554	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5693-97d0-f5d4-7a0aa5571b43	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5693-97d0-5d07-e9bb6c6e066a	Rekvizit-read	Rekvizit - branje	t
00030000-5693-97d0-e698-11849675372a	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5693-97d0-f532-8b033f1a7624	Revizija-read	Revizija - branje	t
00030000-5693-97d0-014e-9fe7745fa1a3	Revizija-write	Revizija - spreminjanje	t
00030000-5693-97d0-4431-017d10a51a7d	Rezervacija-read	Rezervacija - branje	t
00030000-5693-97d0-497e-187995278b4d	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5693-97d0-2c3c-2d9b0b923d58	SedezniRed-read	SedezniRed - branje	t
00030000-5693-97d0-44c9-477f2da496b2	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5693-97d0-1f8a-c837fc7bfe89	Sedez-read	Sedez - branje	t
00030000-5693-97d0-6089-75e898b0ad37	Sedez-write	Sedez - spreminjanje	t
00030000-5693-97d0-8be0-af959e481dd8	Sezona-read	Sezona - branje	t
00030000-5693-97d0-c37e-21d450065cd3	Sezona-write	Sezona - spreminjanje	t
00030000-5693-97d0-5630-aa298a4e0665	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5693-97d0-df1b-452179951a1d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5693-97d0-9d64-0721fc665d27	Telefonska-read	Telefonska - branje	t
00030000-5693-97d0-8d81-36ca13eebabd	Telefonska-write	Telefonska - spreminjanje	t
00030000-5693-97d0-57ea-ae9a37772da5	TerminStoritve-read	TerminStoritve - branje	t
00030000-5693-97d0-adf4-e891a37c5bd1	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5693-97d0-dcfa-c7e6c401544e	TipDodatka-read	TipDodatka - branje	t
00030000-5693-97d0-3c77-618da9092ead	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5693-97d0-82bd-67eb55a8b020	TipFunkcije-read	TipFunkcije - branje	t
00030000-5693-97d0-fd91-e74ccab935bf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5693-97d0-d2dc-f7f3f57d00e3	TipPopa-read	TipPopa - branje	t
00030000-5693-97d0-d982-984eaefa3ab1	TipPopa-write	TipPopa - spreminjanje	t
00030000-5693-97d0-b5c5-e0ebc0a00700	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5693-97d0-c0d9-943a188aad0a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5693-97d0-5248-a5579d836f2d	TipVaje-read	TipVaje - branje	t
00030000-5693-97d0-20c4-c362b70de826	TipVaje-write	TipVaje - spreminjanje	t
00030000-5693-97d0-ae74-fd9bff873134	Trr-read	Trr - branje	t
00030000-5693-97d0-840d-b602f97cfd27	Trr-write	Trr - spreminjanje	t
00030000-5693-97d0-8524-91f179d73d79	Uprizoritev-read	Uprizoritev - branje	t
00030000-5693-97d0-f727-b4510409c31d	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5693-97d0-eb34-9fe760a07def	Vaja-read	Vaja - branje	t
00030000-5693-97d0-cae3-74c921c26704	Vaja-write	Vaja - spreminjanje	t
00030000-5693-97d0-2707-cade86bf8a98	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5693-97d0-9085-78f03c89e635	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5693-97d0-a881-2bfcb198e579	VrstaStroska-read	VrstaStroska - branje	t
00030000-5693-97d0-a376-976f165d864d	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5693-97d0-6916-7f716f667bb1	Zaposlitev-read	Zaposlitev - branje	t
00030000-5693-97d0-637c-859670a62ab7	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5693-97d0-9804-7f2129869a51	Zasedenost-read	Zasedenost - branje	t
00030000-5693-97d0-5516-9927636db91a	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5693-97d0-511a-f642f0464c73	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5693-97d0-b6d4-ca8b11b1cd3d	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5693-97d0-bfa0-e86d5541bcf9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5693-97d0-f365-b49e8d9cbd13	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5693-97d0-8f7a-dec8d924ee6b	Job-read	Branje opravil - samo zase - branje	t
00030000-5693-97d0-c28e-debc0103e094	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5693-97d0-6b0f-77b18ccd43de	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5693-97d0-06dc-39e7979a4e0b	Report-read	Report - branje	t
00030000-5693-97d0-c502-4fc86bbba557	Report-write	Report - spreminjanje	t
00030000-5693-97d0-5f2c-8aa84e841c15	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5693-97d0-9657-c8bc046ec9f2	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5693-97d0-468f-33bd22eafc0c	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5693-97d0-1ce0-c635bcca9b05	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5693-97d0-ca27-fccfb86bff71	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5693-97d0-f04c-839528b514a7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5693-97d0-0277-1e4851270e54	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5693-97d0-1e2d-be441d30af83	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5693-97d0-6c09-ce72d133e147	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5693-97d0-bb76-783df0af6b54	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5693-97d0-88ca-09bd673733fc	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5693-97d0-961d-b307b17f97e3	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5693-97d0-1bb1-320f9e13326b	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5693-97d0-da24-c24f20bdd4a4	Datoteka-write	Datoteka - spreminjanje	t
00030000-5693-97d0-4e2c-b1c9223bede4	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3132 (class 0 OID 34934329)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5693-97d1-f2bd-ed80ca30c6dd	00030000-5693-97d0-a4e8-4bd26f35a66b
00020000-5693-97d1-f2bd-ed80ca30c6dd	00030000-5693-97d0-11b3-bef29b59e3f1
00020000-5693-97d1-5d74-8ed4edea2f7b	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-cc05-4b41ae110722	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-c32c-3a34dbb46140	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-c32c-3a34dbb46140	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-c32c-3a34dbb46140	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-c32c-3a34dbb46140	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-c32c-3a34dbb46140	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-c32c-3a34dbb46140	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-637c-859670a62ab7
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-2121-6257b1681527	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-fbf8-e940eaa10636	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-fbf8-e940eaa10636	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-fbf8-e940eaa10636	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-10e8-00a6397d1faa	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-0b43-b1f9aed0eb01	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-0b43-b1f9aed0eb01	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-0b43-b1f9aed0eb01	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-0b43-b1f9aed0eb01	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-429d-1f492dde13e0	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-d034-cc83a2cab9d1	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-3e2c-b67de73aba30
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-ca9b-c2666ef8f1fb
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-fe29-77b35084ec51
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-f80c-4d42b7c40ac7	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-456a-33582642d55a	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-0f44-b63ab4194d0f	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-0f44-b63ab4194d0f	00030000-5693-97d0-d982-984eaefa3ab1
00020000-5693-97d1-e14a-baacd0f02f2f	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-888a-630746d813e0	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-888a-630746d813e0	00030000-5693-97d0-aed4-674e114c6289
00020000-5693-97d1-3801-bfd13df74cfc	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-3715-cf4790cf3b5c	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-3715-cf4790cf3b5c	00030000-5693-97d0-87ac-97d8523a6194
00020000-5693-97d1-60ac-f1b7243fb498	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-6193-4c26785ce5e4	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-6193-4c26785ce5e4	00030000-5693-97d0-f365-b49e8d9cbd13
00020000-5693-97d1-7585-f896243b937c	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-4e51-6ad326013ea2	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-4e51-6ad326013ea2	00030000-5693-97d0-b6d4-ca8b11b1cd3d
00020000-5693-97d1-951f-2e7f9f6c0665	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-0f63-a5383a53747d	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-0f63-a5383a53747d	00030000-5693-97d0-f7e0-633beca8f48c
00020000-5693-97d1-e31d-cc1e3efa62c4	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-cd2e-a55e34927099	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-cd2e-a55e34927099	00030000-5693-97d0-91eb-20ebad57c0c1
00020000-5693-97d1-cd2e-a55e34927099	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-cd2e-a55e34927099	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-cd2e-a55e34927099	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d1-cd2e-a55e34927099	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-4f85-b26cff0dd715	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-4f85-b26cff0dd715	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-4f85-b26cff0dd715	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-d030-86caa5b5b0a7	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-d030-86caa5b5b0a7	00030000-5693-97d0-a376-976f165d864d
00020000-5693-97d1-1652-4db876d81119	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-cc9b-264256d3606c
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-7c5f-53f46e61c905	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-7934-4416c07ed228	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-7934-4416c07ed228	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-7934-4416c07ed228	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-7934-4416c07ed228	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-7934-4416c07ed228	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-0703-b613e2d6dc99	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-0703-b613e2d6dc99	00030000-5693-97d0-20c4-c362b70de826
00020000-5693-97d1-3596-c02a35702c27	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-cc5e-00f1862a216f
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-c46b-56ebd67fb9e7
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5b98-d35165cc6b32
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-8d4e-ca400ab40ab9
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5000-56dcfec2bf02
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-2761-64ad075c8918
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-b43f-c302daffb66e
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-346a-c1140a095bbf
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-185f-d9097a0b584d
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-1a66-654fb2b884d8
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5d8a-3db244a135e6
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-abeb-e1bd4138b718
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-16fa-51645e111235
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-ac8b-e9be4a2376cd
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-40e9-3a9a0cfcba4a
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-a9ea-1d5dc0ffa5b4
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-027d-2c5aa3f07917
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5886-f6b50ab79777
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-7426-edede133bbec
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-7e74-0de3d9fdef52
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-f1ec-18c6a5e29624
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-d0f1-97254d60a2f2
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-e27e-d0a98c65becc
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-dae1-fc203148dd23
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-6320-60c1721b7cdf
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-c28e-debc0103e094
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-a816-1f5a5ff0bdeb
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5c00-f70a437967ab
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-e736-5ddfe668fa22
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-8f7a-dec8d924ee6b
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-9a1d-dcaf0e291670	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-5b98-d35165cc6b32
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-5000-56dcfec2bf02
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-b43f-c302daffb66e
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-185f-d9097a0b584d
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-5d8a-3db244a135e6
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-16fa-51645e111235
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-40e9-3a9a0cfcba4a
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-027d-2c5aa3f07917
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-7426-edede133bbec
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-f1ec-18c6a5e29624
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-5c00-f70a437967ab
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-a816-1f5a5ff0bdeb
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-e736-5ddfe668fa22
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-8f7a-dec8d924ee6b
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-c7ac-0809b3ba3993	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-9330-c69dd8f9577b
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-e6cc-20c1670c12a1	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-cf63-972438029cc8	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-5c8e-e034fbd3c0c0	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-d93e-545e54cbbe7f
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-ffbf-107b4d08816d	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-7c35-1e798e9ad307	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-27f0-61e41165ad78	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-ebd4-9a109fbc06e6	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-ebd4-9a109fbc06e6	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d1-ebd4-9a109fbc06e6	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-ebd4-9a109fbc06e6	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-a3b6-f70207601d40	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-a3b6-f70207601d40	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-a816-1f5a5ff0bdeb
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-dae1-fc203148dd23
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-9330-c69dd8f9577b
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-8f7a-dec8d924ee6b
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-c28e-debc0103e094
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-d93e-545e54cbbe7f
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-e736-5ddfe668fa22
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-6320-60c1721b7cdf
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5c00-f70a437967ab
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-e27e-d0a98c65becc
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-cc5e-00f1862a216f
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5b98-d35165cc6b32
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-c46b-56ebd67fb9e7
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-8d4e-ca400ab40ab9
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5000-56dcfec2bf02
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-2761-64ad075c8918
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-b43f-c302daffb66e
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-346a-c1140a095bbf
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-185f-d9097a0b584d
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-1a66-654fb2b884d8
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5d8a-3db244a135e6
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-abeb-e1bd4138b718
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-16fa-51645e111235
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-ac8b-e9be4a2376cd
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-40e9-3a9a0cfcba4a
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-a9ea-1d5dc0ffa5b4
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-027d-2c5aa3f07917
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5886-f6b50ab79777
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-7426-edede133bbec
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-7e74-0de3d9fdef52
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-f1ec-18c6a5e29624
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-d0f1-97254d60a2f2
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-28ae-d0f361cca2de	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-7827-4f4dc7be35ef	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-9330-c69dd8f9577b
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-75d7-3418ce305469	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-a816-1f5a5ff0bdeb
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-dae1-fc203148dd23
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-9330-c69dd8f9577b
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-8f7a-dec8d924ee6b
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-c28e-debc0103e094
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-ca9b-c2666ef8f1fb
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-d93e-545e54cbbe7f
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-3e2c-b67de73aba30
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-e736-5ddfe668fa22
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-6320-60c1721b7cdf
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5c00-f70a437967ab
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-e27e-d0a98c65becc
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-fe29-77b35084ec51
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-cc5e-00f1862a216f
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5b98-d35165cc6b32
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-c46b-56ebd67fb9e7
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-8d4e-ca400ab40ab9
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5000-56dcfec2bf02
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-2761-64ad075c8918
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-b43f-c302daffb66e
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-346a-c1140a095bbf
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-185f-d9097a0b584d
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-1a66-654fb2b884d8
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5d8a-3db244a135e6
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-abeb-e1bd4138b718
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-16fa-51645e111235
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-ac8b-e9be4a2376cd
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-40e9-3a9a0cfcba4a
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-a9ea-1d5dc0ffa5b4
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-027d-2c5aa3f07917
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5886-f6b50ab79777
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-7426-edede133bbec
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-7e74-0de3d9fdef52
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-f1ec-18c6a5e29624
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-d0f1-97254d60a2f2
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-637c-859670a62ab7
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-b67f-11518aacee5d	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-9330-c69dd8f9577b
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-ca9b-c2666ef8f1fb
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-3e2c-b67de73aba30
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-fe29-77b35084ec51
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-637c-859670a62ab7
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-9333-53d72457574a	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-c4a9-c4bddea663bc	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-a816-1f5a5ff0bdeb
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-dae1-fc203148dd23
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-8f7a-dec8d924ee6b
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-c28e-debc0103e094
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-ca9b-c2666ef8f1fb
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-cc9b-264256d3606c
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-d93e-545e54cbbe7f
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-3e2c-b67de73aba30
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-e736-5ddfe668fa22
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-6320-60c1721b7cdf
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5c00-f70a437967ab
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-e27e-d0a98c65becc
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-fe29-77b35084ec51
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-cc5e-00f1862a216f
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5b98-d35165cc6b32
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-c46b-56ebd67fb9e7
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-8d4e-ca400ab40ab9
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5000-56dcfec2bf02
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-2761-64ad075c8918
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-b43f-c302daffb66e
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-346a-c1140a095bbf
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-185f-d9097a0b584d
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-1a66-654fb2b884d8
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5d8a-3db244a135e6
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-abeb-e1bd4138b718
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-16fa-51645e111235
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-ac8b-e9be4a2376cd
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-40e9-3a9a0cfcba4a
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-a9ea-1d5dc0ffa5b4
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-027d-2c5aa3f07917
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5886-f6b50ab79777
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-7426-edede133bbec
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-7e74-0de3d9fdef52
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-f1ec-18c6a5e29624
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-d0f1-97254d60a2f2
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-a376-976f165d864d
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-637c-859670a62ab7
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d1-8a72-367df534959f	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-11b3-bef29b59e3f1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-a4e8-4bd26f35a66b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2f7f-eb79fa7d25cb
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f7e0-633beca8f48c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f768-8b6e7ba6fb94
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ac1b-f77f3a03c8ae
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-63ed-8ff5ee78b396
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-7a81-9e3582f16fd6
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-cfcb-ff8212885af8
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-dba9-31b701571552
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9ed6-9731c65649eb
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-db96-43d371fa8498
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1652-d444457ddc09
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5793-49fcc0e797cf
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-560b-ea296955643b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d5ad-5185d797e666
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1803-642136fd7f4d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8833-1c2b107277da
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c6ec-bce00e706508
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-0ef0-41707d6a9369
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-023b-198862e8fe69
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-a816-1f5a5ff0bdeb
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-dae1-fc203148dd23
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f022-8fa704d4b185
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-87ac-97d8523a6194
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-012d-f8ae642505ac
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-901e-633e6a029672
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9330-c69dd8f9577b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-e1e1-55df5cf5c201
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-965f-e2b68b9ad85c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-6b0f-77b18ccd43de
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8f7a-dec8d924ee6b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c28e-debc0103e094
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2a83-a0800543e651
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ca9b-c2666ef8f1fb
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-4a67-bfa54914b7c1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d189-3d089ee4cefe
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-0277-1e4851270e54
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f04c-839528b514a7
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9657-c8bc046ec9f2
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-468f-33bd22eafc0c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1ce0-c635bcca9b05
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ca27-fccfb86bff71
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ce68-ef43388d00ec
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-21b0-25681fd4607a
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-0143-03d42c6d298f
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d9ad-53a0538bfed5
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-20e6-7e9502ca3719
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-a10a-dc6384439ac5
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-da73-57f0e155f05c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-cc9b-264256d3606c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-842a-0bf85df77d07
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ed05-91ac3563978f
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d4a7-1b9659a4fc5d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ed5c-a774402d7cce
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d93e-545e54cbbe7f
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-3e2c-b67de73aba30
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-4321-bf4f07b0679b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-e736-5ddfe668fa22
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-6320-60c1721b7cdf
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-02b2-7b45c36c11c3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8cab-f88174451fa3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-aed4-674e114c6289
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d63b-a2dbd058c486
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1708-24b8cc15eeea
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ad03-7a1b08e29b45
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-76b3-8c17074679a3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-72bc-ac70f20535ac
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-7439-e08e0371f5f7
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5c00-f70a437967ab
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-e27e-d0a98c65becc
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-275d-b52142cb250c
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-fe29-77b35084ec51
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-cc5e-00f1862a216f
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5b98-d35165cc6b32
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c46b-56ebd67fb9e7
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8d4e-ca400ab40ab9
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5000-56dcfec2bf02
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2761-64ad075c8918
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-b43f-c302daffb66e
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-346a-c1140a095bbf
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-185f-d9097a0b584d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1a66-654fb2b884d8
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5d8a-3db244a135e6
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-abeb-e1bd4138b718
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-16fa-51645e111235
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ac8b-e9be4a2376cd
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-40e9-3a9a0cfcba4a
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-a9ea-1d5dc0ffa5b4
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-027d-2c5aa3f07917
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5886-f6b50ab79777
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-7426-edede133bbec
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-7e74-0de3d9fdef52
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f1ec-18c6a5e29624
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d0f1-97254d60a2f2
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-fe29-c3b9bbc0e6cd
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-91eb-20ebad57c0c1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2ec7-3afdfb907b2d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-0024-6db4fb2f2881
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-575d-9dd0fc30a3dc
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-505c-b91877aef8c3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2771-1a698a932554
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f5d4-7a0aa5571b43
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5d07-e9bb6c6e066a
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-e698-11849675372a
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-06dc-39e7979a4e0b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c502-4fc86bbba557
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f532-8b033f1a7624
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-014e-9fe7745fa1a3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-4431-017d10a51a7d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-497e-187995278b4d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2c3c-2d9b0b923d58
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-44c9-477f2da496b2
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1f8a-c837fc7bfe89
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-6089-75e898b0ad37
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8be0-af959e481dd8
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c37e-21d450065cd3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5f2c-8aa84e841c15
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-57ea-ae9a37772da5
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-e194-2ea1b93a068e
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-adf4-e891a37c5bd1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-82bd-67eb55a8b020
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-fd91-e74ccab935bf
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d2dc-f7f3f57d00e3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-d982-984eaefa3ab1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-b5c5-e0ebc0a00700
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-c0d9-943a188aad0a
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5248-a5579d836f2d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-20c4-c362b70de826
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-eb34-9fe760a07def
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-cae3-74c921c26704
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-2707-cade86bf8a98
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9085-78f03c89e635
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-a881-2bfcb198e579
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-a376-976f165d864d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1bb1-320f9e13326b
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-961d-b307b17f97e3
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-637c-859670a62ab7
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-9804-7f2129869a51
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-5516-9927636db91a
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-511a-f642f0464c73
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-b6d4-ca8b11b1cd3d
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-bfa0-e86d5541bcf9
00020000-5693-97d3-c971-94b3b645ed58	00030000-5693-97d0-f365-b49e8d9cbd13
00020000-5693-97d3-0c98-aba4d19d3128	00030000-5693-97d0-88ca-09bd673733fc
00020000-5693-97d3-0448-3ad05681e3b8	00030000-5693-97d0-bb76-783df0af6b54
00020000-5693-97d3-ab2c-66c68a028448	00030000-5693-97d0-f727-b4510409c31d
00020000-5693-97d3-e80e-8aed8cf68cdf	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d3-a34f-954fdc7fbeef	00030000-5693-97d0-468f-33bd22eafc0c
00020000-5693-97d3-d79c-6244f5d23c7e	00030000-5693-97d0-1ce0-c635bcca9b05
00020000-5693-97d3-702e-b083d4832ea8	00030000-5693-97d0-ca27-fccfb86bff71
00020000-5693-97d3-b69d-98bb549d4889	00030000-5693-97d0-9657-c8bc046ec9f2
00020000-5693-97d3-29f2-f427c89bdbae	00030000-5693-97d0-0277-1e4851270e54
00020000-5693-97d3-5d04-77b11a883aa6	00030000-5693-97d0-f04c-839528b514a7
00020000-5693-97d3-ba00-0885f8990ccc	00030000-5693-97d0-6c09-ce72d133e147
00020000-5693-97d3-d38b-beb1cd141c43	00030000-5693-97d0-1e2d-be441d30af83
00020000-5693-97d3-00b0-920fc03ee545	00030000-5693-97d0-9e36-a41be7c15424
00020000-5693-97d3-12b6-d8aaf8cab0ce	00030000-5693-97d0-7675-713f5532fce1
00020000-5693-97d3-37de-fd6a77b9072a	00030000-5693-97d0-ae71-85609edc3444
00020000-5693-97d3-f60f-f12e352c7813	00030000-5693-97d0-7903-8bc53f375614
00020000-5693-97d3-a98b-7a181cb3d688	00030000-5693-97d0-da24-c24f20bdd4a4
00020000-5693-97d3-8236-9662f097b620	00030000-5693-97d0-4e2c-b1c9223bede4
00020000-5693-97d3-df76-cf44e1e1aac4	00030000-5693-97d0-44e1-a1ebd77b91cb
00020000-5693-97d3-df76-cf44e1e1aac4	00030000-5693-97d0-3e2c-b67de73aba30
00020000-5693-97d3-df76-cf44e1e1aac4	00030000-5693-97d0-8524-91f179d73d79
00020000-5693-97d3-04f9-01cbfb5d0467	00030000-5693-97d0-ae74-fd9bff873134
00020000-5693-97d3-52d4-c61bec7ca461	00030000-5693-97d0-840d-b602f97cfd27
00020000-5693-97d3-56f4-a9f40fb31173	00030000-5693-97d0-5f2c-8aa84e841c15
00020000-5693-97d3-72e6-5a97f12fd073	00030000-5693-97d0-9d64-0721fc665d27
00020000-5693-97d3-1fd1-c35d2c6c551e	00030000-5693-97d0-8d81-36ca13eebabd
00020000-5693-97d3-f23b-6134f6a7f0f0	00030000-5693-97d0-46cd-59cff6f271e7
00020000-5693-97d3-fdbf-ab215fc59633	00030000-5693-97d0-0152-a41513885302
00020000-5693-97d3-b375-14ebf8ad63ff	00030000-5693-97d0-6916-7f716f667bb1
00020000-5693-97d3-fb86-a365b9dbc056	00030000-5693-97d0-637c-859670a62ab7
00020000-5693-97d3-b891-83b0361dcd0b	00030000-5693-97d0-5f31-78a86c50803c
00020000-5693-97d3-409a-52a889820d48	00030000-5693-97d0-d93e-545e54cbbe7f
00020000-5693-97d3-5fb5-bab1a6230a54	00030000-5693-97d0-5630-aa298a4e0665
00020000-5693-97d3-abb5-4cc622fc0731	00030000-5693-97d0-df1b-452179951a1d
00020000-5693-97d3-396e-d9ecd9838800	00030000-5693-97d0-b894-d29f68ff1e93
00020000-5693-97d3-d8f0-cb80bf2197d2	00030000-5693-97d0-295d-2adc71e559b2
00020000-5693-97d3-03ff-ca0d905fd4e2	00030000-5693-97d0-c392-748e23dbefbf
00020000-5693-97d3-c23b-7ba46461d406	00030000-5693-97d0-9ae8-2b20e1da9d3b
00020000-5693-97d3-0f14-9df223708333	00030000-5693-97d0-fddb-c945cd439105
00020000-5693-97d3-c497-302c47fad1b5	00030000-5693-97d0-9330-c69dd8f9577b
\.


--
-- TOC entry 3171 (class 0 OID 34934736)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 34934770)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 34934904)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5693-97d3-17fe-1482d4063f62	00090000-5693-97d3-a6dc-1cc6a6b55d5e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5693-97d3-4dfc-e0ffecca0c42	00090000-5693-97d3-29a2-af4b3bb596b4	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5693-97d3-0abf-8638079c72c5	00090000-5693-97d3-bd09-31219ca09e93	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5693-97d3-9885-5ec2c63472c6	00090000-5693-97d3-23b6-a2c4df0ba5eb	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3140 (class 0 OID 34934411)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5693-97d3-fd79-d098245531fd	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-3972-fa7694fa2efa	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5693-97d3-491f-51e92558374c	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-d383-9ec735c2e871	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-48e1-3f4a0c03ea07	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-d146-391b713b81dc	\N	00040000-5693-97d0-ec28-ebcb217232ee	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-9060-2b1a99e76f99	\N	00040000-5693-97d0-dd65-5db56ac0faed	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-63f8-dd910ca4956a	\N	00040000-5693-97d0-b032-e56ce76b1f55	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d3-abfc-d7525e357607	\N	00040000-5693-97d0-4384-c3c1dbb41f56	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-97d5-c3ae-d117176bc27c	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3143 (class 0 OID 34934456)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5693-97cf-8f36-c7bcbb91d744	8341	Adlešiči
00050000-5693-97cf-8bf4-22752235bd9b	5270	Ajdovščina
00050000-5693-97cf-6b0b-9d71276c2782	6280	Ankaran/Ancarano
00050000-5693-97cf-4cda-dfa4b8c3c9a0	9253	Apače
00050000-5693-97cf-78a5-a03d20f3e00c	8253	Artiče
00050000-5693-97cf-6c5b-9a5515faa0ff	4275	Begunje na Gorenjskem
00050000-5693-97cf-e580-07267acc4d55	1382	Begunje pri Cerknici
00050000-5693-97cf-61f1-1eceb67caf06	9231	Beltinci
00050000-5693-97cf-0262-af32d030dcaf	2234	Benedikt
00050000-5693-97cf-e851-60209596bb73	2345	Bistrica ob Dravi
00050000-5693-97cf-c4c6-857e06250935	3256	Bistrica ob Sotli
00050000-5693-97cf-e18d-b73cdf5a703f	8259	Bizeljsko
00050000-5693-97cf-0909-dcd2cd17c707	1223	Blagovica
00050000-5693-97cf-f0b5-9b81e863b88f	8283	Blanca
00050000-5693-97cf-eb89-0ba781aa769a	4260	Bled
00050000-5693-97cf-7ef1-76d6235f245f	4273	Blejska Dobrava
00050000-5693-97cf-a96c-a03da8a3c9f2	9265	Bodonci
00050000-5693-97cf-61e4-524922dc5f2f	9222	Bogojina
00050000-5693-97cf-f77a-55fc24a64139	4263	Bohinjska Bela
00050000-5693-97cf-220c-67c0625b5fb6	4264	Bohinjska Bistrica
00050000-5693-97d0-6fb2-7f5f829424a2	4265	Bohinjsko jezero
00050000-5693-97d0-f8ec-a84a166e05fc	1353	Borovnica
00050000-5693-97d0-e169-1088db5ff811	8294	Boštanj
00050000-5693-97d0-2876-6f23788a1a9a	5230	Bovec
00050000-5693-97d0-acff-e5df6807cb80	5295	Branik
00050000-5693-97d0-2006-2c2bcab242f5	3314	Braslovče
00050000-5693-97d0-5289-ff0480a58371	5223	Breginj
00050000-5693-97d0-f75d-15d5ea51ff4a	8280	Brestanica
00050000-5693-97d0-d0f1-56574c38d265	2354	Bresternica
00050000-5693-97d0-8a17-549cef1ad722	4243	Brezje
00050000-5693-97d0-4b4f-23279eb4f8f9	1351	Brezovica pri Ljubljani
00050000-5693-97d0-d76e-0f4a74517bc2	8250	Brežice
00050000-5693-97d0-8e6b-6e561f039e5b	4210	Brnik - Aerodrom
00050000-5693-97d0-f13c-38c3bdd4dc93	8321	Brusnice
00050000-5693-97d0-16cb-8b2c17371e64	3255	Buče
00050000-5693-97d0-2188-7015d9ce047b	8276	Bučka 
00050000-5693-97d0-4128-6686a47defed	9261	Cankova
00050000-5693-97d0-0cad-dbdd661b1622	3000	Celje 
00050000-5693-97d0-93ec-644aa56d8d8c	3001	Celje - poštni predali
00050000-5693-97d0-c9ba-12ac20341955	4207	Cerklje na Gorenjskem
00050000-5693-97d0-290b-a08f1af07637	8263	Cerklje ob Krki
00050000-5693-97d0-ed29-a8b51dbd4951	1380	Cerknica
00050000-5693-97d0-20d1-cfbad92ba92c	5282	Cerkno
00050000-5693-97d0-ada2-735041ddcb5b	2236	Cerkvenjak
00050000-5693-97d0-68b3-0900442346a7	2215	Ceršak
00050000-5693-97d0-fcfe-a7d0fdfffec2	2326	Cirkovce
00050000-5693-97d0-244c-b047359d09cd	2282	Cirkulane
00050000-5693-97d0-13e0-1c0e9662d6d3	5273	Col
00050000-5693-97d0-cbd9-7de61ee38e32	8251	Čatež ob Savi
00050000-5693-97d0-b97d-e654ac2219b0	1413	Čemšenik
00050000-5693-97d0-1383-edecd4d9cb22	5253	Čepovan
00050000-5693-97d0-e867-ddd5a2ce38b0	9232	Črenšovci
00050000-5693-97d0-b682-44cf867cbf70	2393	Črna na Koroškem
00050000-5693-97d0-a470-72b73f9f2cb8	6275	Črni Kal
00050000-5693-97d0-78ed-e0eacd7e59c6	5274	Črni Vrh nad Idrijo
00050000-5693-97d0-5c82-0cfc6441d635	5262	Črniče
00050000-5693-97d0-d39b-936aa5628908	8340	Črnomelj
00050000-5693-97d0-58fa-fdacf6455126	6271	Dekani
00050000-5693-97d0-e3bf-f1e3aa56aae1	5210	Deskle
00050000-5693-97d0-66ef-86ae5f84a366	2253	Destrnik
00050000-5693-97d0-0c75-f8871528a044	6215	Divača
00050000-5693-97d0-4016-cd6a5f1ac7ab	1233	Dob
00050000-5693-97d0-c543-9ce8ed3a82b9	3224	Dobje pri Planini
00050000-5693-97d0-43a7-a4a573c27d75	8257	Dobova
00050000-5693-97d0-9544-9421709a07de	1423	Dobovec
00050000-5693-97d0-258f-40e6a01de4d7	5263	Dobravlje
00050000-5693-97d0-80df-01da6050250f	3204	Dobrna
00050000-5693-97d0-3d28-4368395a91d6	8211	Dobrnič
00050000-5693-97d0-e0a4-bac093babe12	1356	Dobrova
00050000-5693-97d0-3575-65f4dcaa54d8	9223	Dobrovnik/Dobronak 
00050000-5693-97d0-e7cc-5aaa32e98527	5212	Dobrovo v Brdih
00050000-5693-97d0-8b9b-089c11337f9b	1431	Dol pri Hrastniku
00050000-5693-97d0-a9ed-0cee29d73004	1262	Dol pri Ljubljani
00050000-5693-97d0-b07f-3c50e97d15c5	1273	Dole pri Litiji
00050000-5693-97d0-cae3-a397cbdee3e7	1331	Dolenja vas
00050000-5693-97d0-2b67-0ed5b869c703	8350	Dolenjske Toplice
00050000-5693-97d0-3de3-3fdc277f12c6	1230	Domžale
00050000-5693-97d0-f528-3fddda6624e4	2252	Dornava
00050000-5693-97d0-30d4-9437a11128af	5294	Dornberk
00050000-5693-97d0-fdb7-c9ad7d441a14	1319	Draga
00050000-5693-97d0-efdc-f6033a11fd9e	8343	Dragatuš
00050000-5693-97d0-24b9-fbaea2d2bf79	3222	Dramlje
00050000-5693-97d0-b765-bbdd79d986c6	2370	Dravograd
00050000-5693-97d0-6615-26d79f6029a9	4203	Duplje
00050000-5693-97d0-728b-54672f991e79	6221	Dutovlje
00050000-5693-97d0-ae37-9fee6f886946	8361	Dvor
00050000-5693-97d0-fa75-f7f97625b360	2343	Fala
00050000-5693-97d0-e3c4-b50bc1c13553	9208	Fokovci
00050000-5693-97d0-9156-2b0d2378e995	2313	Fram
00050000-5693-97d0-2de9-85a6cc71d7c8	3213	Frankolovo
00050000-5693-97d0-aa41-c3537f1e7910	1274	Gabrovka
00050000-5693-97d0-2feb-90118a7e566b	8254	Globoko
00050000-5693-97d0-5cf6-31a834094f06	5275	Godovič
00050000-5693-97d0-64a9-f87c21c5d467	4204	Golnik
00050000-5693-97d0-ccc1-fd30575a5708	3303	Gomilsko
00050000-5693-97d0-7c47-2bf36ad1fe70	4224	Gorenja vas
00050000-5693-97d0-a789-9424bcfaacc8	3263	Gorica pri Slivnici
00050000-5693-97d0-936b-7223a1378238	2272	Gorišnica
00050000-5693-97d0-c8e8-98c7960f3071	9250	Gornja Radgona
00050000-5693-97d0-8617-60fed8bd19ca	3342	Gornji Grad
00050000-5693-97d0-a344-5bc2ca4d03f5	4282	Gozd Martuljek
00050000-5693-97d0-cf74-639cc4d7c3de	6272	Gračišče
00050000-5693-97d0-f394-0506bf41eb33	9264	Grad
00050000-5693-97d0-12b5-deb24f6fa5cf	8332	Gradac
00050000-5693-97d0-5d04-b7220a4f3063	1384	Grahovo
00050000-5693-97d0-54f1-06d1fdb79234	5242	Grahovo ob Bači
00050000-5693-97d0-e0e9-1abb9f77df08	5251	Grgar
00050000-5693-97d0-d2a0-46976954a11f	3302	Griže
00050000-5693-97d0-bac4-75f1b397ada9	3231	Grobelno
00050000-5693-97d0-45c7-bd3d7e71fde8	1290	Grosuplje
00050000-5693-97d0-8a8d-61e22a8c7bcb	2288	Hajdina
00050000-5693-97d0-299c-eebb7424d64e	8362	Hinje
00050000-5693-97d0-64c8-d33bbd7ea007	2311	Hoče
00050000-5693-97d0-c2f4-731bde158900	9205	Hodoš/Hodos
00050000-5693-97d0-cd0d-12368b593a55	1354	Horjul
00050000-5693-97d0-2b78-b5c8bdfd4300	1372	Hotedršica
00050000-5693-97d0-4f0b-216cb6f93c02	1430	Hrastnik
00050000-5693-97d0-0199-bcb9ef4c1b55	6225	Hruševje
00050000-5693-97d0-9c19-3eb69d829ef8	4276	Hrušica
00050000-5693-97d0-4d00-4467ca431429	5280	Idrija
00050000-5693-97d0-c629-6d526efc8c31	1292	Ig
00050000-5693-97d0-e415-5f65ee74967e	6250	Ilirska Bistrica
00050000-5693-97d0-b6a0-5b644788c0d5	6251	Ilirska Bistrica-Trnovo
00050000-5693-97d0-f705-7ae3d3c2cf53	1295	Ivančna Gorica
00050000-5693-97d0-579d-05fc9ee45cab	2259	Ivanjkovci
00050000-5693-97d0-5a7e-fe18d88f200e	1411	Izlake
00050000-5693-97d0-2ea9-c253f42793f9	6310	Izola/Isola
00050000-5693-97d0-8e42-e027f77d9a29	2222	Jakobski Dol
00050000-5693-97d0-5a61-e470b8aee71a	2221	Jarenina
00050000-5693-97d0-5bd1-a2c907a6c86d	6254	Jelšane
00050000-5693-97d0-41f6-fbcc8c818837	4270	Jesenice
00050000-5693-97d0-689a-6fbafa8bdcc7	8261	Jesenice na Dolenjskem
00050000-5693-97d0-b286-288128d8942a	3273	Jurklošter
00050000-5693-97d0-66c5-1caed4b72907	2223	Jurovski Dol
00050000-5693-97d0-7380-cf3514c04e0f	2256	Juršinci
00050000-5693-97d0-c9c0-eaf4dd291edc	5214	Kal nad Kanalom
00050000-5693-97d0-3228-fe24f0f13a52	3233	Kalobje
00050000-5693-97d0-f9b5-7583e888daf6	4246	Kamna Gorica
00050000-5693-97d0-1b80-edccebe8a28a	2351	Kamnica
00050000-5693-97d0-8b8e-f1f601f6bc1a	1241	Kamnik
00050000-5693-97d0-e374-c44aa0adccd9	5213	Kanal
00050000-5693-97d0-6671-9ff11d1e9569	8258	Kapele
00050000-5693-97d0-a849-98ee4b2a5e62	2362	Kapla
00050000-5693-97d0-eff1-c24c7b8dcd50	2325	Kidričevo
00050000-5693-97d0-d534-5d44d0eb91e6	1412	Kisovec
00050000-5693-97d0-8be3-506a17611ff1	6253	Knežak
00050000-5693-97d0-d98b-5199a0f4b5b3	5222	Kobarid
00050000-5693-97d0-f2ab-5f14bfc59447	9227	Kobilje
00050000-5693-97d0-5337-342f471d1347	1330	Kočevje
00050000-5693-97d0-8672-5c39b3297357	1338	Kočevska Reka
00050000-5693-97d0-cfa8-bf0e784e0512	2276	Kog
00050000-5693-97d0-efa8-c191b87b9fb2	5211	Kojsko
00050000-5693-97d0-8e5a-0fb454296fd5	6223	Komen
00050000-5693-97d0-05a5-32cad8dbbf2f	1218	Komenda
00050000-5693-97d0-c22a-17737df19599	6000	Koper/Capodistria 
00050000-5693-97d0-a26e-29f95bea0a9f	6001	Koper/Capodistria - poštni predali
00050000-5693-97d0-6f43-bda4c7f40bcd	8282	Koprivnica
00050000-5693-97d0-9125-df87c850c513	5296	Kostanjevica na Krasu
00050000-5693-97d0-b678-ad32098f62a7	8311	Kostanjevica na Krki
00050000-5693-97d0-56ba-256249d59c93	1336	Kostel
00050000-5693-97d0-24c4-64a5ed17f79b	6256	Košana
00050000-5693-97d0-53b0-b78c52b8c25b	2394	Kotlje
00050000-5693-97d0-1120-3fa2908ff81d	6240	Kozina
00050000-5693-97d0-b08f-855ed7cce9dd	3260	Kozje
00050000-5693-97d0-1543-318da77a9fae	4000	Kranj 
00050000-5693-97d0-2e83-6569bac84e9a	4001	Kranj - poštni predali
00050000-5693-97d0-088a-152239030df5	4280	Kranjska Gora
00050000-5693-97d0-978d-da81e94ea1a9	1281	Kresnice
00050000-5693-97d0-bdb6-96eba1c3d3fb	4294	Križe
00050000-5693-97d0-37e4-8f7786c777a2	9206	Križevci
00050000-5693-97d0-f70b-97f4248734ce	9242	Križevci pri Ljutomeru
00050000-5693-97d0-4796-364b891b6286	1301	Krka
00050000-5693-97d0-f4fd-2c122a13f221	8296	Krmelj
00050000-5693-97d0-0400-91c30ce1f038	4245	Kropa
00050000-5693-97d0-b926-9e7796aa71bc	8262	Krška vas
00050000-5693-97d0-9d03-2b371223c7c0	8270	Krško
00050000-5693-97d0-20e6-872b1ea3b23f	9263	Kuzma
00050000-5693-97d0-f7fd-32c12c8925fe	2318	Laporje
00050000-5693-97d0-a2dc-bed571d8af51	3270	Laško
00050000-5693-97d0-3f5f-e99e35171ea0	1219	Laze v Tuhinju
00050000-5693-97d0-e4d0-36f589608e82	2230	Lenart v Slovenskih goricah
00050000-5693-97d0-76c0-f074bc33eb15	9220	Lendava/Lendva
00050000-5693-97d0-fc1d-7dd8760c5e40	4248	Lesce
00050000-5693-97d0-9c18-806ba1a6abe8	3261	Lesično
00050000-5693-97d0-80a4-881ab9e1ddb2	8273	Leskovec pri Krškem
00050000-5693-97d0-6dca-05c33b770f85	2372	Libeliče
00050000-5693-97d0-30c0-4121c7d5c2a5	2341	Limbuš
00050000-5693-97d0-830e-646f6d0c3dc7	1270	Litija
00050000-5693-97d0-df3f-41491cabf2da	3202	Ljubečna
00050000-5693-97d0-56c9-67faf9191741	1000	Ljubljana 
00050000-5693-97d0-2d4a-dd39e4450294	1001	Ljubljana - poštni predali
00050000-5693-97d0-bd85-29f4a22262bf	1231	Ljubljana - Črnuče
00050000-5693-97d0-a444-06b693edf23d	1261	Ljubljana - Dobrunje
00050000-5693-97d0-7867-cfc06a8f1b7f	1260	Ljubljana - Polje
00050000-5693-97d0-b049-01fb691c6270	1210	Ljubljana - Šentvid
00050000-5693-97d0-3ba6-004439e0323d	1211	Ljubljana - Šmartno
00050000-5693-97d0-c91f-97a2fe743b35	3333	Ljubno ob Savinji
00050000-5693-97d0-476b-f755e4c0c743	9240	Ljutomer
00050000-5693-97d0-251e-e799981044e9	3215	Loče
00050000-5693-97d0-bc12-5f176a448317	5231	Log pod Mangartom
00050000-5693-97d0-85b0-ac6213ccd333	1358	Log pri Brezovici
00050000-5693-97d0-8760-c0b54272a08c	1370	Logatec
00050000-5693-97d0-aea2-79cba8c32c48	1371	Logatec
00050000-5693-97d0-7c47-c2db7727fd78	1434	Loka pri Zidanem Mostu
00050000-5693-97d0-a4cb-f8029708ece9	3223	Loka pri Žusmu
00050000-5693-97d0-ce21-9c04e941adef	6219	Lokev
00050000-5693-97d0-6dac-e6e5556d7714	1318	Loški Potok
00050000-5693-97d0-0425-3e012b29fed5	2324	Lovrenc na Dravskem polju
00050000-5693-97d0-c6a0-05c8ba71fb6b	2344	Lovrenc na Pohorju
00050000-5693-97d0-b910-2fd791b09145	3334	Luče
00050000-5693-97d0-bfa3-b05e477cbbd3	1225	Lukovica
00050000-5693-97d0-027d-a79f33e03a45	9202	Mačkovci
00050000-5693-97d0-d920-1c4846e993c5	2322	Majšperk
00050000-5693-97d0-4c4f-c49cbda77193	2321	Makole
00050000-5693-97d0-54c7-e94750a491a2	9243	Mala Nedelja
00050000-5693-97d0-3143-f00705327e7b	2229	Malečnik
00050000-5693-97d0-3315-1f8a36725b64	6273	Marezige
00050000-5693-97d0-9b0b-3e1d5ebe2486	2000	Maribor 
00050000-5693-97d0-c613-4aca988d1ba3	2001	Maribor - poštni predali
00050000-5693-97d0-99f8-f18ee7a405f8	2206	Marjeta na Dravskem polju
00050000-5693-97d0-e325-c18d5fae3d29	2281	Markovci
00050000-5693-97d0-93fa-4076eafccd38	9221	Martjanci
00050000-5693-97d0-e835-cb178379ddce	6242	Materija
00050000-5693-97d0-90c4-b7ea0ba86297	4211	Mavčiče
00050000-5693-97d0-a313-e82946063326	1215	Medvode
00050000-5693-97d0-a80c-fe219f43a866	1234	Mengeš
00050000-5693-97d0-2dea-8ae81f2b963f	8330	Metlika
00050000-5693-97d0-f0c6-819f8b970467	2392	Mežica
00050000-5693-97d0-c2af-2309e2b6bfa9	2204	Miklavž na Dravskem polju
00050000-5693-97d0-d47f-b52292433904	2275	Miklavž pri Ormožu
00050000-5693-97d0-d1e8-b396520d2202	5291	Miren
00050000-5693-97d0-6385-7c01d2f5f66f	8233	Mirna
00050000-5693-97d0-3913-2ddd1c00b721	8216	Mirna Peč
00050000-5693-97d0-04cf-3b2579281096	2382	Mislinja
00050000-5693-97d0-c667-1f7a0f19670c	4281	Mojstrana
00050000-5693-97d0-9541-da3030c0cb6f	8230	Mokronog
00050000-5693-97d0-e247-abff6c014517	1251	Moravče
00050000-5693-97d0-6b83-128868d19abb	9226	Moravske Toplice
00050000-5693-97d0-317d-6718d26c5925	5216	Most na Soči
00050000-5693-97d0-10af-c64535e43081	1221	Motnik
00050000-5693-97d0-06cb-e95331c9f6a4	3330	Mozirje
00050000-5693-97d0-28be-16c36a173a65	9000	Murska Sobota 
00050000-5693-97d0-b7b3-490846ca8caf	9001	Murska Sobota - poštni predali
00050000-5693-97d0-b4c3-9d12920d66eb	2366	Muta
00050000-5693-97d0-a6ce-78978c5ea7ba	4202	Naklo
00050000-5693-97d0-4646-f2bb7e576cd8	3331	Nazarje
00050000-5693-97d0-3627-b30a45bd3b01	1357	Notranje Gorice
00050000-5693-97d0-30ba-035ca64cefeb	3203	Nova Cerkev
00050000-5693-97d0-ec96-125a9cf5fb81	5000	Nova Gorica 
00050000-5693-97d0-9bbb-444ae925cbc3	5001	Nova Gorica - poštni predali
00050000-5693-97d0-da28-1edd24d49885	1385	Nova vas
00050000-5693-97d0-eb87-368b44173411	8000	Novo mesto
00050000-5693-97d0-22ad-28481c3ba670	8001	Novo mesto - poštni predali
00050000-5693-97d0-24d8-ae028b129573	6243	Obrov
00050000-5693-97d0-3a86-5c34cb8786c2	9233	Odranci
00050000-5693-97d0-ec43-66840f91b3d8	2317	Oplotnica
00050000-5693-97d0-3394-9f256e905b2c	2312	Orehova vas
00050000-5693-97d0-c23c-633b569fb94d	2270	Ormož
00050000-5693-97d0-02d1-b07e0523f168	1316	Ortnek
00050000-5693-97d0-5c93-1d0f98e8e14c	1337	Osilnica
00050000-5693-97d0-c713-86076bd294ff	8222	Otočec
00050000-5693-97d0-24d5-247d58755930	2361	Ožbalt
00050000-5693-97d0-15f6-c54975abcfaf	2231	Pernica
00050000-5693-97d0-5cd1-5b77630d5208	2211	Pesnica pri Mariboru
00050000-5693-97d0-741f-2a6f372b69df	9203	Petrovci
00050000-5693-97d0-0bf9-cf8406d8e65a	3301	Petrovče
00050000-5693-97d0-beca-4747194fcfe8	6330	Piran/Pirano
00050000-5693-97d0-8d1f-eada7a023def	8255	Pišece
00050000-5693-97d0-b995-1eb13803edae	6257	Pivka
00050000-5693-97d0-fc71-b1745cd86fe0	6232	Planina
00050000-5693-97d0-627e-0fca44e29801	3225	Planina pri Sevnici
00050000-5693-97d0-41af-fa7a000272da	6276	Pobegi
00050000-5693-97d0-74ac-b9afc5d3457b	8312	Podbočje
00050000-5693-97d0-ef02-9775829ca446	5243	Podbrdo
00050000-5693-97d0-814d-94b77768261d	3254	Podčetrtek
00050000-5693-97d0-6bf3-d579859cece6	2273	Podgorci
00050000-5693-97d0-bc05-662f250b334b	6216	Podgorje
00050000-5693-97d0-7f4d-e7af1adee4f6	2381	Podgorje pri Slovenj Gradcu
00050000-5693-97d0-2837-d0ee000a0acc	6244	Podgrad
00050000-5693-97d0-e9d9-0cd3d178fcfa	1414	Podkum
00050000-5693-97d0-1a98-380fc383da6b	2286	Podlehnik
00050000-5693-97d0-662e-e69e9b18b475	5272	Podnanos
00050000-5693-97d0-4ab6-842c2632deab	4244	Podnart
00050000-5693-97d0-89fa-745b8f81d9ed	3241	Podplat
00050000-5693-97d0-9244-e293867c6dfd	3257	Podsreda
00050000-5693-97d0-4e98-7d92c9d42d04	2363	Podvelka
00050000-5693-97d0-3296-0778c5a54187	2208	Pohorje
00050000-5693-97d0-7ae7-633e510e05c4	2257	Polenšak
00050000-5693-97d0-b1e1-fbdd0c8e462d	1355	Polhov Gradec
00050000-5693-97d0-fd12-cfe598a13190	4223	Poljane nad Škofjo Loko
00050000-5693-97d0-9df8-ffd70813b9bb	2319	Poljčane
00050000-5693-97d0-bb94-6e3242df0d91	1272	Polšnik
00050000-5693-97d0-ce67-70259e757508	3313	Polzela
00050000-5693-97d0-cba3-7b2f7e57ac0d	3232	Ponikva
00050000-5693-97d0-9d07-1d965fe1b6c1	6320	Portorož/Portorose
00050000-5693-97d0-b79d-0ca3f53929f5	6230	Postojna
00050000-5693-97d0-6418-885dcbfe010c	2331	Pragersko
00050000-5693-97d0-fca9-bc52102a70dc	3312	Prebold
00050000-5693-97d0-1638-03968778e74f	4205	Preddvor
00050000-5693-97d0-99f1-2b10380e75b7	6255	Prem
00050000-5693-97d0-2de7-b2866417f5e6	1352	Preserje
00050000-5693-97d0-5db9-9e8444adeada	6258	Prestranek
00050000-5693-97d0-9969-05195e4fd5e4	2391	Prevalje
00050000-5693-97d0-42f1-9c60434722d8	3262	Prevorje
00050000-5693-97d0-97b8-7364080ff855	1276	Primskovo 
00050000-5693-97d0-c6ba-52abcd117c9d	3253	Pristava pri Mestinju
00050000-5693-97d0-f157-74a304776f50	9207	Prosenjakovci/Partosfalva
00050000-5693-97d0-24d3-fbb78e878d4d	5297	Prvačina
00050000-5693-97d0-a2a7-29458dc84112	2250	Ptuj
00050000-5693-97d0-c75b-06ca4a224c9d	2323	Ptujska Gora
00050000-5693-97d0-ae6c-5efaad59f0ed	9201	Puconci
00050000-5693-97d0-718b-f1ec6c483a8a	2327	Rače
00050000-5693-97d0-e0b5-7e929c17527a	1433	Radeče
00050000-5693-97d0-f6e2-4008c1ac809d	9252	Radenci
00050000-5693-97d0-04f1-920295a53a61	2360	Radlje ob Dravi
00050000-5693-97d0-04a1-adf97b9b0dd2	1235	Radomlje
00050000-5693-97d0-3ef8-cbfa59bf9cc8	4240	Radovljica
00050000-5693-97d0-23a6-0c0973985f0c	8274	Raka
00050000-5693-97d0-f3d0-e3fe9fdee197	1381	Rakek
00050000-5693-97d0-f700-17ad86dc9e24	4283	Rateče - Planica
00050000-5693-97d0-7f1c-58658e8f7cb9	2390	Ravne na Koroškem
00050000-5693-97d0-df4f-5a679a707469	9246	Razkrižje
00050000-5693-97d0-d1a6-8bc74271eee0	3332	Rečica ob Savinji
00050000-5693-97d0-de2c-c71b3b05ea01	5292	Renče
00050000-5693-97d0-63d1-036ee6a982bd	1310	Ribnica
00050000-5693-97d0-3f0c-33ec81e66e0d	2364	Ribnica na Pohorju
00050000-5693-97d0-3745-fe2895042b12	3272	Rimske Toplice
00050000-5693-97d0-1ef7-80005415b3aa	1314	Rob
00050000-5693-97d0-617a-ed9f853f88bb	5215	Ročinj
00050000-5693-97d0-1e30-28d19582521e	3250	Rogaška Slatina
00050000-5693-97d0-19bb-4961a56d3ea1	9262	Rogašovci
00050000-5693-97d0-d65e-e10c71c4c6e4	3252	Rogatec
00050000-5693-97d0-bca6-e48c8b4449cb	1373	Rovte
00050000-5693-97d0-86ea-73be2638a44d	2342	Ruše
00050000-5693-97d0-1c21-8284ab3fcd5a	1282	Sava
00050000-5693-97d0-2acc-8c3491de4334	6333	Sečovlje/Sicciole
00050000-5693-97d0-228e-b5d795982ae9	4227	Selca
00050000-5693-97d0-539b-9618ae4f508e	2352	Selnica ob Dravi
00050000-5693-97d0-7b73-674fe0a025b0	8333	Semič
00050000-5693-97d0-04e9-53e70be60117	8281	Senovo
00050000-5693-97d0-00f1-929070acb399	6224	Senožeče
00050000-5693-97d0-821d-aedfe4ea2da5	8290	Sevnica
00050000-5693-97d0-e4dd-a08cf45f0bd4	6210	Sežana
00050000-5693-97d0-367f-41afba17ed5e	2214	Sladki Vrh
00050000-5693-97d0-7148-df38637740a9	5283	Slap ob Idrijci
00050000-5693-97d0-550a-cf35a62e51a6	2380	Slovenj Gradec
00050000-5693-97d0-50f8-c837801f591e	2310	Slovenska Bistrica
00050000-5693-97d0-c942-9d4e88f20ce0	3210	Slovenske Konjice
00050000-5693-97d0-b6f2-873c02070386	1216	Smlednik
00050000-5693-97d0-d0ba-f7389d1ff94b	5232	Soča
00050000-5693-97d0-f68c-69c96a6f15a8	1317	Sodražica
00050000-5693-97d0-6b6b-04429261bcf7	3335	Solčava
00050000-5693-97d0-7f53-093a703bac01	5250	Solkan
00050000-5693-97d0-f7ae-922744f2ee78	4229	Sorica
00050000-5693-97d0-0b7a-5920a17e7d8a	4225	Sovodenj
00050000-5693-97d0-a426-669848b8c2db	5281	Spodnja Idrija
00050000-5693-97d0-d404-7a05411a637a	2241	Spodnji Duplek
00050000-5693-97d0-0d68-5c6bebab9e02	9245	Spodnji Ivanjci
00050000-5693-97d0-4c29-de4fc246419c	2277	Središče ob Dravi
00050000-5693-97d0-2ebf-9ef5c70197b1	4267	Srednja vas v Bohinju
00050000-5693-97d0-d3f9-f35c70ed9ddd	8256	Sromlje 
00050000-5693-97d0-0717-023807aadf7e	5224	Srpenica
00050000-5693-97d0-0747-25525610ffd9	1242	Stahovica
00050000-5693-97d0-f9db-11863edfe8b6	1332	Stara Cerkev
00050000-5693-97d0-5434-21a3e2ef1594	8342	Stari trg ob Kolpi
00050000-5693-97d0-c972-77c2ff030d98	1386	Stari trg pri Ložu
00050000-5693-97d0-993c-bccc0da8273d	2205	Starše
00050000-5693-97d0-3392-949d1fa0c38b	2289	Stoperce
00050000-5693-97d0-26c7-7c1b08e3da28	8322	Stopiče
00050000-5693-97d0-0a01-0f069d581951	3206	Stranice
00050000-5693-97d0-6172-587d4cbb55d6	8351	Straža
00050000-5693-97d0-8d61-b66165154d16	1313	Struge
00050000-5693-97d0-14a2-cd077c9f68c4	8293	Studenec
00050000-5693-97d0-a617-5245ff660bde	8331	Suhor
00050000-5693-97d0-c9a7-e8e2fae0d5cd	2233	Sv. Ana v Slovenskih goricah
00050000-5693-97d0-14d5-bcad9b47c48d	2235	Sv. Trojica v Slovenskih goricah
00050000-5693-97d0-22fc-9fa1c037e00b	2353	Sveti Duh na Ostrem Vrhu
00050000-5693-97d0-5f05-0f89e370a09e	9244	Sveti Jurij ob Ščavnici
00050000-5693-97d0-c07f-59e1f03fe173	3264	Sveti Štefan
00050000-5693-97d0-8958-6964d060f946	2258	Sveti Tomaž
00050000-5693-97d0-65fc-038c9a67b072	9204	Šalovci
00050000-5693-97d0-580f-b3f8fdc9a649	5261	Šempas
00050000-5693-97d0-68da-ca26b0893c67	5290	Šempeter pri Gorici
00050000-5693-97d0-ca11-e1e7eb72bcc0	3311	Šempeter v Savinjski dolini
00050000-5693-97d0-f410-2005db01a883	4208	Šenčur
00050000-5693-97d0-6988-2f215dbef1a5	2212	Šentilj v Slovenskih goricah
00050000-5693-97d0-0de5-daf774ec8a42	8297	Šentjanž
00050000-5693-97d0-dbdc-31eec137f744	2373	Šentjanž pri Dravogradu
00050000-5693-97d0-72be-943482da3e3e	8310	Šentjernej
00050000-5693-97d0-3690-ca1838d53e32	3230	Šentjur
00050000-5693-97d0-159f-2f224eb3e3eb	3271	Šentrupert
00050000-5693-97d0-951b-76b23aca9fa1	8232	Šentrupert
00050000-5693-97d0-0c28-bef5d6bb4297	1296	Šentvid pri Stični
00050000-5693-97d0-814d-ac66871ed705	8275	Škocjan
00050000-5693-97d0-faad-43b05713ee7a	6281	Škofije
00050000-5693-97d0-383a-1001dd608d34	4220	Škofja Loka
00050000-5693-97d0-11a6-f05104f6f19e	3211	Škofja vas
00050000-5693-97d0-9f7b-c6639f03d240	1291	Škofljica
00050000-5693-97d0-ec1e-10f05f24a1dc	6274	Šmarje
00050000-5693-97d0-86ed-1e7363b9c6c0	1293	Šmarje - Sap
00050000-5693-97d0-743e-2d0211c97190	3240	Šmarje pri Jelšah
00050000-5693-97d0-02a1-e8d32d21085c	8220	Šmarješke Toplice
00050000-5693-97d0-7eb4-9dc8a39f6f26	2315	Šmartno na Pohorju
00050000-5693-97d0-dfc1-61b7b165dc24	3341	Šmartno ob Dreti
00050000-5693-97d0-229a-50e928efa050	3327	Šmartno ob Paki
00050000-5693-97d0-abd8-8409ce686b41	1275	Šmartno pri Litiji
00050000-5693-97d0-d621-b10ccd9520c7	2383	Šmartno pri Slovenj Gradcu
00050000-5693-97d0-9734-5a5fd403ae7c	3201	Šmartno v Rožni dolini
00050000-5693-97d0-1742-7bc6d7973488	3325	Šoštanj
00050000-5693-97d0-0ed9-730877167a18	6222	Štanjel
00050000-5693-97d0-146e-be210e21c5de	3220	Štore
00050000-5693-97d0-c6a2-9333826a4d22	3304	Tabor
00050000-5693-97d0-b880-daf0bd9809e6	3221	Teharje
00050000-5693-97d0-7057-39e526c966ce	9251	Tišina
00050000-5693-97d0-d247-f4d36129eb23	5220	Tolmin
00050000-5693-97d0-874e-5c22365378de	3326	Topolšica
00050000-5693-97d0-29c6-4fc1367c42b2	2371	Trbonje
00050000-5693-97d0-8155-9de4324f4a78	1420	Trbovlje
00050000-5693-97d0-e7d3-6f377e49b62c	8231	Trebelno 
00050000-5693-97d0-cf6d-53b58220da4a	8210	Trebnje
00050000-5693-97d0-c72b-441f3251179e	5252	Trnovo pri Gorici
00050000-5693-97d0-1260-cdfd732674c8	2254	Trnovska vas
00050000-5693-97d0-f32a-4468c049a219	1222	Trojane
00050000-5693-97d0-0a30-4c7748db012d	1236	Trzin
00050000-5693-97d0-55f2-2bc9dcbc3842	4290	Tržič
00050000-5693-97d0-b4bd-7393c798a2aa	8295	Tržišče
00050000-5693-97d0-0e92-c6a2fe2ffc4a	1311	Turjak
00050000-5693-97d0-96d7-6aee88e7d515	9224	Turnišče
00050000-5693-97d0-6acb-974bd8d14dce	8323	Uršna sela
00050000-5693-97d0-4884-d93eb5aa0ce0	1252	Vače
00050000-5693-97d0-d283-a9e5597925fb	3320	Velenje 
00050000-5693-97d0-7e83-d477a07d86c8	3322	Velenje - poštni predali
00050000-5693-97d0-2f8d-5054d31d84c0	8212	Velika Loka
00050000-5693-97d0-1d14-9fcb8d070279	2274	Velika Nedelja
00050000-5693-97d0-20f0-9e94d4e9976b	9225	Velika Polana
00050000-5693-97d0-70a4-a8b3d4eff195	1315	Velike Lašče
00050000-5693-97d0-a2b3-1d62afa9b061	8213	Veliki Gaber
00050000-5693-97d0-2015-ceb06996e89f	9241	Veržej
00050000-5693-97d0-c866-2278467253fe	1312	Videm - Dobrepolje
00050000-5693-97d0-6317-4aab4fb22144	2284	Videm pri Ptuju
00050000-5693-97d0-cf84-05bfec3319ed	8344	Vinica
00050000-5693-97d0-7676-174769c439ce	5271	Vipava
00050000-5693-97d0-20fb-966018627ac4	4212	Visoko
00050000-5693-97d0-0050-38865b624d7e	1294	Višnja Gora
00050000-5693-97d0-2277-a05aee5a4875	3205	Vitanje
00050000-5693-97d0-cdba-96b1999bf0a9	2255	Vitomarci
00050000-5693-97d0-5ba1-6e84ff9abc91	1217	Vodice
00050000-5693-97d0-b01e-ce9587a66ae4	3212	Vojnik\t
00050000-5693-97d0-6c46-d3d4a3ee407a	5293	Volčja Draga
00050000-5693-97d0-e54a-b518e9f4f2c2	2232	Voličina
00050000-5693-97d0-57a5-5fd0fbe3a10d	3305	Vransko
00050000-5693-97d0-95fc-e732d3b53c95	6217	Vremski Britof
00050000-5693-97d0-4944-767ee6b46c36	1360	Vrhnika
00050000-5693-97d0-7be0-b2503b55afef	2365	Vuhred
00050000-5693-97d0-71a6-294ece7e53af	2367	Vuzenica
00050000-5693-97d0-0ba6-8e2098a4a686	8292	Zabukovje 
00050000-5693-97d0-4b04-86ab0e2e8f34	1410	Zagorje ob Savi
00050000-5693-97d0-a165-c7e4070162e0	1303	Zagradec
00050000-5693-97d0-f46c-ba04e05c8e33	2283	Zavrč
00050000-5693-97d0-d8a8-33a6063b939e	8272	Zdole 
00050000-5693-97d0-5c4f-b4c1f6911d41	4201	Zgornja Besnica
00050000-5693-97d0-8e87-240d1710c605	2242	Zgornja Korena
00050000-5693-97d0-52b1-b952c0ca04f7	2201	Zgornja Kungota
00050000-5693-97d0-b47d-30befe39fda7	2316	Zgornja Ložnica
00050000-5693-97d0-865c-c03e8756c515	2314	Zgornja Polskava
00050000-5693-97d0-ab1b-7cab658ce7c9	2213	Zgornja Velka
00050000-5693-97d0-3b53-54755a689216	4247	Zgornje Gorje
00050000-5693-97d0-1759-73cf4c6a6601	4206	Zgornje Jezersko
00050000-5693-97d0-965d-1d27816f6e0c	2285	Zgornji Leskovec
00050000-5693-97d0-7620-d7119cc7ab71	1432	Zidani Most
00050000-5693-97d0-db03-d9f8e5d0f643	3214	Zreče
00050000-5693-97d0-8f63-2151d7491603	4209	Žabnica
00050000-5693-97d0-ab0b-699938bd24f4	3310	Žalec
00050000-5693-97d0-2c7a-9dca3dcd7366	4228	Železniki
00050000-5693-97d0-0b15-294e2a7ab414	2287	Žetale
00050000-5693-97d0-2e5a-20d1236e88ff	4226	Žiri
00050000-5693-97d0-20e4-24630f44317c	4274	Žirovnica
00050000-5693-97d0-aec4-67412d24087b	8360	Žužemberk
\.


--
-- TOC entry 3194 (class 0 OID 34935142)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 34934710)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 34934441)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5693-97d3-df72-8a699d5a918a	00080000-5693-97d3-fd79-d098245531fd	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5693-97d3-03f5-7c6648477e63	00080000-5693-97d3-fd79-d098245531fd	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5693-97d3-7ef8-5334c81195cd	00080000-5693-97d3-3972-fa7694fa2efa	\N	00040000-5693-97d0-7cdc-7c2b86dc39dd	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3154 (class 0 OID 34934585)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5693-97d0-c5d2-706e2c47353b	novo leto	1	1	\N	t
00430000-5693-97d0-0122-b9882b283180	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5693-97d0-0e2b-ac06b0858769	dan upora proti okupatorju	27	4	\N	t
00430000-5693-97d0-3190-3f85760ac83d	praznik dela	1	5	\N	t
00430000-5693-97d0-5ac0-92962a63240f	praznik dela	2	5	\N	t
00430000-5693-97d0-90fc-3e33a8aa592d	dan Primoža Trubarja	8	6	\N	f
00430000-5693-97d0-0ca7-b464d4c51a79	dan državnosti	25	6	\N	t
00430000-5693-97d0-7fe0-2a8b8527af87	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5693-97d0-9496-4f14576790c9	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5693-97d0-df53-bbe5b799e7bd	dan suverenosti	25	10	\N	f
00430000-5693-97d0-59fc-0af6a6bd8380	dan spomina na mrtve	1	11	\N	t
00430000-5693-97d0-d3f4-f7ef9f56bb9a	dan Rudolfa Maistra	23	11	\N	f
00430000-5693-97d0-edcf-876e47c4e8e3	božič	25	12	\N	t
00430000-5693-97d0-4330-65e48de55804	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5693-97d0-ade1-c40e7754a3bd	Marijino vnebovzetje	15	8	\N	t
00430000-5693-97d0-39d3-bdf96b2b44d7	dan reformacije	31	10	\N	t
00430000-5693-97d0-d883-b0aa3e4a42dd	velikonočna nedelja	27	3	2016	t
00430000-5693-97d0-421e-6adab6b2f07f	velikonočna nedelja	16	4	2017	t
00430000-5693-97d0-6781-6c04f1d44036	velikonočna nedelja	1	4	2018	t
00430000-5693-97d0-0319-f539124d5b26	velikonočna nedelja	21	4	2019	t
00430000-5693-97d0-5001-220f3069d653	velikonočna nedelja	12	4	2020	t
00430000-5693-97d0-56d9-0b9259bafc78	velikonočna nedelja	4	4	2021	t
00430000-5693-97d0-0723-09df7e57da56	velikonočna nedelja	17	4	2022	t
00430000-5693-97d0-dd78-4a776052f60c	velikonočna nedelja	9	4	2023	t
00430000-5693-97d0-4249-8c5c2c864c32	velikonočna nedelja	31	3	2024	t
00430000-5693-97d0-12ee-973af21b3e97	velikonočna nedelja	20	4	2025	t
00430000-5693-97d0-acd5-ad8c138e2067	velikonočna nedelja	5	4	2026	t
00430000-5693-97d0-04dd-cdf1645aff78	velikonočna nedelja	28	3	2027	t
00430000-5693-97d0-cfa3-eb2f71b06d2e	velikonočna nedelja	16	4	2028	t
00430000-5693-97d0-1550-1bc0b30bd256	velikonočna nedelja	1	4	2029	t
00430000-5693-97d0-0501-e11d46cbeb19	velikonočna nedelja	21	4	2030	t
00430000-5693-97d0-ef75-736c2e46d926	velikonočni ponedeljek	28	3	2016	t
00430000-5693-97d0-4a5c-465351ad57e6	velikonočni ponedeljek	17	4	2017	t
00430000-5693-97d0-6d9a-421af95ed8c5	velikonočni ponedeljek	2	4	2018	t
00430000-5693-97d0-b25d-08a28cffd19b	velikonočni ponedeljek	22	4	2019	t
00430000-5693-97d0-9884-806bdf30fe0d	velikonočni ponedeljek	13	4	2020	t
00430000-5693-97d0-09ae-42d1af2a106c	velikonočni ponedeljek	5	4	2021	t
00430000-5693-97d0-db28-d66022fa0911	velikonočni ponedeljek	18	4	2022	t
00430000-5693-97d0-a9e9-bf91d01e6068	velikonočni ponedeljek	10	4	2023	t
00430000-5693-97d0-8011-4138f0a44045	velikonočni ponedeljek	1	4	2024	t
00430000-5693-97d0-c134-641a3e4e858b	velikonočni ponedeljek	21	4	2025	t
00430000-5693-97d0-6474-30e1ed519abc	velikonočni ponedeljek	6	4	2026	t
00430000-5693-97d0-66ec-57b9d22ef321	velikonočni ponedeljek	29	3	2027	t
00430000-5693-97d0-a196-711b37346a2a	velikonočni ponedeljek	17	4	2028	t
00430000-5693-97d0-84a2-25ec7a1a0702	velikonočni ponedeljek	2	4	2029	t
00430000-5693-97d0-d297-3fc802f9c893	velikonočni ponedeljek	22	4	2030	t
00430000-5693-97d0-74d8-5fe5559ee1e4	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5693-97d0-bb18-5329686e577e	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5693-97d0-a9f8-cdb23180e157	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5693-97d0-99d6-e425f450ab67	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5693-97d0-b549-a2d6f73a95ec	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5693-97d0-7671-41d030f7db2a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5693-97d0-3226-a45e79a05111	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5693-97d0-25af-487d13c230ed	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5693-97d0-413e-ae5ebaa3f324	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5693-97d0-8d20-726668cfce9b	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5693-97d0-115f-fff34506bcab	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5693-97d0-e32e-674f56af5488	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5693-97d0-1cab-cc4e3f783e23	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5693-97d0-89e2-319d0af0bd26	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5693-97d0-8526-5b8b2fa75fdc	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3150 (class 0 OID 34934545)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 34934557)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 34934722)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 34935156)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 34935166)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5693-97d3-6788-b209feb76f7e	00080000-5693-97d3-491f-51e92558374c	0987	AK
00190000-5693-97d3-70b7-0cf8b3973727	00080000-5693-97d3-3972-fa7694fa2efa	0989	AK
00190000-5693-97d3-1062-7eadab036107	00080000-5693-97d3-d383-9ec735c2e871	0986	AK
00190000-5693-97d3-e4a4-23e67fec94e2	00080000-5693-97d3-d146-391b713b81dc	0984	AK
00190000-5693-97d3-b38c-4c1fb47b92c3	00080000-5693-97d3-9060-2b1a99e76f99	0983	AK
00190000-5693-97d3-480d-d4ca6bd7e1ba	00080000-5693-97d3-63f8-dd910ca4956a	0982	AK
00190000-5693-97d5-852f-b09f0d7665ae	00080000-5693-97d5-c3ae-d117176bc27c	1001	AK
\.


--
-- TOC entry 3193 (class 0 OID 34935055)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5693-97d3-06e1-3725121d54de	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3197 (class 0 OID 34935174)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 34934751)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5693-97d2-5510-d00490b642be	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5693-97d2-1f05-d42f6b642248	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5693-97d2-a5a7-7cd3fffd1620	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5693-97d2-03bd-3691fd6db4c9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5693-97d2-a0b7-484f87054ba8	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5693-97d2-250f-88d41e88e2c3	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5693-97d2-4857-c4db98cfad9b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3165 (class 0 OID 34934695)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 34934685)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 34934893)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 34934823)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 34934519)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 34934281)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5693-97d5-c3ae-d117176bc27c	00010000-5693-97d1-6e03-7b747cd63e11	2016-01-11 12:53:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-5693-97d5-eefa-e0adbe8bc797	00010000-5693-97d1-6e03-7b747cd63e11	2016-01-11 12:53:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5693-97d5-852f-b09f0d7665ae	00010000-5693-97d1-6e03-7b747cd63e11	2016-01-11 12:53:57	INS	a:0:{}
\.


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3174 (class 0 OID 34934764)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34934319)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5693-97d1-f2bd-ed80ca30c6dd	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5693-97d1-5d74-8ed4edea2f7b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5693-97d1-f003-5d1b7b51fd53	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5693-97d1-cef7-7ace44c1981a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5693-97d1-cc05-4b41ae110722	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5693-97d1-c32c-3a34dbb46140	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5693-97d1-2121-6257b1681527	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5693-97d1-fbf8-e940eaa10636	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5693-97d1-10e8-00a6397d1faa	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-97d1-0b43-b1f9aed0eb01	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-97d1-429d-1f492dde13e0	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-97d1-d034-cc83a2cab9d1	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-97d1-f80c-4d42b7c40ac7	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5693-97d1-456a-33582642d55a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5693-97d1-0f44-b63ab4194d0f	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5693-97d1-e14a-baacd0f02f2f	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5693-97d1-888a-630746d813e0	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5693-97d1-3801-bfd13df74cfc	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5693-97d1-3715-cf4790cf3b5c	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5693-97d1-60ac-f1b7243fb498	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5693-97d1-6193-4c26785ce5e4	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5693-97d1-7585-f896243b937c	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5693-97d1-4e51-6ad326013ea2	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5693-97d1-951f-2e7f9f6c0665	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5693-97d1-0f63-a5383a53747d	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5693-97d1-e31d-cc1e3efa62c4	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5693-97d1-cd2e-a55e34927099	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5693-97d1-4f85-b26cff0dd715	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5693-97d1-d030-86caa5b5b0a7	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5693-97d1-1652-4db876d81119	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5693-97d1-7c5f-53f46e61c905	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5693-97d1-7934-4416c07ed228	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5693-97d1-0703-b613e2d6dc99	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5693-97d1-3596-c02a35702c27	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5693-97d1-9a1d-dcaf0e291670	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5693-97d1-c7ac-0809b3ba3993	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5693-97d1-e6cc-20c1670c12a1	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5693-97d1-cf63-972438029cc8	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5693-97d1-5c8e-e034fbd3c0c0	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5693-97d1-ffbf-107b4d08816d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5693-97d1-7c35-1e798e9ad307	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5693-97d1-27f0-61e41165ad78	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5693-97d1-ebd4-9a109fbc06e6	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5693-97d1-a3b6-f70207601d40	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5693-97d1-28ae-d0f361cca2de	direktor	minimalne pravice za direktorja	t
00020000-5693-97d1-7827-4f4dc7be35ef	arhivar	arhivar	t
00020000-5693-97d1-75d7-3418ce305469	dramaturg	dramaturg	t
00020000-5693-97d1-b67f-11518aacee5d	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5693-97d1-9333-53d72457574a	poslovni-sekretar	poslovni sekretar	t
00020000-5693-97d1-c4a9-c4bddea663bc	vodja-tehnike	vodja tehnike	t
00020000-5693-97d1-8a72-367df534959f	racunovodja	računovodja	t
00020000-5693-97d3-c971-94b3b645ed58	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5693-97d3-0c98-aba4d19d3128	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-0448-3ad05681e3b8	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-ab2c-66c68a028448	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-e80e-8aed8cf68cdf	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-a34f-954fdc7fbeef	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-d79c-6244f5d23c7e	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-702e-b083d4832ea8	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-b69d-98bb549d4889	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-29f2-f427c89bdbae	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-5d04-77b11a883aa6	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-ba00-0885f8990ccc	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-d38b-beb1cd141c43	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-00b0-920fc03ee545	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-12b6-d8aaf8cab0ce	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-37de-fd6a77b9072a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-f60f-f12e352c7813	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-a98b-7a181cb3d688	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-8236-9662f097b620	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-df76-cf44e1e1aac4	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5693-97d3-04f9-01cbfb5d0467	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-52d4-c61bec7ca461	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-56f4-a9f40fb31173	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-72e6-5a97f12fd073	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-1fd1-c35d2c6c551e	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-f23b-6134f6a7f0f0	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-fdbf-ab215fc59633	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-b375-14ebf8ad63ff	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-fb86-a365b9dbc056	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-b891-83b0361dcd0b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-409a-52a889820d48	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-5fb5-bab1a6230a54	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-abb5-4cc622fc0731	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-396e-d9ecd9838800	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-d8f0-cb80bf2197d2	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-03ff-ca0d905fd4e2	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-c23b-7ba46461d406	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-0f14-9df223708333	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5693-97d3-c497-302c47fad1b5	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3129 (class 0 OID 34934303)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5693-97d1-68ac-ae320cd308ab	00020000-5693-97d1-f003-5d1b7b51fd53
00010000-5693-97d1-6e03-7b747cd63e11	00020000-5693-97d1-f003-5d1b7b51fd53
00010000-5693-97d3-30c2-f2c390febdca	00020000-5693-97d3-c971-94b3b645ed58
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-0c98-aba4d19d3128
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-a34f-954fdc7fbeef
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-29f2-f427c89bdbae
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-ba00-0885f8990ccc
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-00b0-920fc03ee545
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-8236-9662f097b620
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-ab2c-66c68a028448
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-04f9-01cbfb5d0467
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-72e6-5a97f12fd073
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-f23b-6134f6a7f0f0
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-b375-14ebf8ad63ff
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-b891-83b0361dcd0b
00010000-5693-97d3-faaf-c382c39e36ca	00020000-5693-97d3-396e-d9ecd9838800
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-0c98-aba4d19d3128
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-0448-3ad05681e3b8
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-ab2c-66c68a028448
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-e80e-8aed8cf68cdf
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-00b0-920fc03ee545
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-f60f-f12e352c7813
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-04f9-01cbfb5d0467
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-72e6-5a97f12fd073
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-f23b-6134f6a7f0f0
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-b375-14ebf8ad63ff
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-b891-83b0361dcd0b
00010000-5693-97d3-b0c2-0fca08648afa	00020000-5693-97d3-396e-d9ecd9838800
00010000-5693-97d3-2609-4c0dfcb6047b	00020000-5693-97d3-0c98-aba4d19d3128
00010000-5693-97d3-2609-4c0dfcb6047b	00020000-5693-97d3-0448-3ad05681e3b8
00010000-5693-97d3-2609-4c0dfcb6047b	00020000-5693-97d3-ab2c-66c68a028448
00010000-5693-97d3-2609-4c0dfcb6047b	00020000-5693-97d3-e80e-8aed8cf68cdf
00010000-5693-97d3-2609-4c0dfcb6047b	00020000-5693-97d3-ba00-0885f8990ccc
00010000-5693-97d3-2609-4c0dfcb6047b	00020000-5693-97d3-00b0-920fc03ee545
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-0448-3ad05681e3b8
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-d79c-6244f5d23c7e
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-5d04-77b11a883aa6
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-d38b-beb1cd141c43
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-ba00-0885f8990ccc
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-a98b-7a181cb3d688
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-00b0-920fc03ee545
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-12b6-d8aaf8cab0ce
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-04f9-01cbfb5d0467
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-52d4-c61bec7ca461
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-72e6-5a97f12fd073
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-1fd1-c35d2c6c551e
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-f23b-6134f6a7f0f0
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-fdbf-ab215fc59633
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-b375-14ebf8ad63ff
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-fb86-a365b9dbc056
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-b891-83b0361dcd0b
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-409a-52a889820d48
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-396e-d9ecd9838800
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-d8f0-cb80bf2197d2
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-c23b-7ba46461d406
00010000-5693-97d3-48c7-42e246c7b6ed	00020000-5693-97d3-0f14-9df223708333
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-0448-3ad05681e3b8
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-d79c-6244f5d23c7e
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-b69d-98bb549d4889
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-5d04-77b11a883aa6
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-d38b-beb1cd141c43
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-ba00-0885f8990ccc
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-a98b-7a181cb3d688
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-00b0-920fc03ee545
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-12b6-d8aaf8cab0ce
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-37de-fd6a77b9072a
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-04f9-01cbfb5d0467
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-52d4-c61bec7ca461
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-56f4-a9f40fb31173
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-72e6-5a97f12fd073
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-1fd1-c35d2c6c551e
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-f23b-6134f6a7f0f0
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-fdbf-ab215fc59633
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-b375-14ebf8ad63ff
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-fb86-a365b9dbc056
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-b891-83b0361dcd0b
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-409a-52a889820d48
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-396e-d9ecd9838800
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-d8f0-cb80bf2197d2
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-03ff-ca0d905fd4e2
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-c23b-7ba46461d406
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-0f14-9df223708333
00010000-5693-97d3-2de8-6a69b20693c5	00020000-5693-97d3-c497-302c47fad1b5
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-0448-3ad05681e3b8
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-ab2c-66c68a028448
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-d79c-6244f5d23c7e
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-702e-b083d4832ea8
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-b69d-98bb549d4889
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-a34f-954fdc7fbeef
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-5d04-77b11a883aa6
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-d38b-beb1cd141c43
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-ba00-0885f8990ccc
00010000-5693-97d3-ec5d-6af0e50dbbf1	00020000-5693-97d3-a98b-7a181cb3d688
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-0c98-aba4d19d3128
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-e80e-8aed8cf68cdf
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-a34f-954fdc7fbeef
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-29f2-f427c89bdbae
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-ba00-0885f8990ccc
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-00b0-920fc03ee545
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-8236-9662f097b620
00010000-5693-97d3-5cf1-c507e17a7727	00020000-5693-97d3-5fb5-bab1a6230a54
00010000-5693-97d3-f477-47946032547a	00020000-5693-97d3-df76-cf44e1e1aac4
00010000-5693-97d3-6f14-a3a947ec175c	00020000-5693-97d1-28ae-d0f361cca2de
00010000-5693-97d3-7104-a5e89fcc5bbe	00020000-5693-97d1-7827-4f4dc7be35ef
00010000-5693-97d3-ba8c-8bccc3ea4756	00020000-5693-97d1-75d7-3418ce305469
00010000-5693-97d3-2161-b4bed8388e7a	00020000-5693-97d1-b67f-11518aacee5d
00010000-5693-97d3-2a19-a4da6b318b11	00020000-5693-97d1-9333-53d72457574a
00010000-5693-97d3-7e7e-f465442db49b	00020000-5693-97d1-c4a9-c4bddea663bc
00010000-5693-97d3-a0a6-4e722e4cbeb2	00020000-5693-97d1-8a72-367df534959f
\.


--
-- TOC entry 3176 (class 0 OID 34934778)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 34934716)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 34934645)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5693-97d3-e3b8-8e617afd0574	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5693-97d3-5c42-6ee78087b172	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5693-97d3-c525-e1da6e93770b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3125 (class 0 OID 34934268)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5693-97d0-4739-fc56359cc4d6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5693-97d0-a075-2d979fde7456	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5693-97d0-b45c-824d65e62530	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5693-97d0-2dd0-79b130e5f50d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5693-97d0-1a88-613fc99942f0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3124 (class 0 OID 34934260)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5693-97d0-244f-8a7398c6ff5a	00230000-5693-97d0-2dd0-79b130e5f50d	popa
00240000-5693-97d0-36dd-e11893a2b77d	00230000-5693-97d0-2dd0-79b130e5f50d	oseba
00240000-5693-97d0-2449-7b4d8a354eeb	00230000-5693-97d0-2dd0-79b130e5f50d	tippopa
00240000-5693-97d0-face-df6f3749a753	00230000-5693-97d0-2dd0-79b130e5f50d	organizacijskaenota
00240000-5693-97d0-fb6c-c745e9c17491	00230000-5693-97d0-2dd0-79b130e5f50d	sezona
00240000-5693-97d0-1fd3-4c064bf1af34	00230000-5693-97d0-2dd0-79b130e5f50d	tipvaje
00240000-5693-97d0-02aa-51d893f85056	00230000-5693-97d0-2dd0-79b130e5f50d	tipdodatka
00240000-5693-97d0-2197-90becd35bdf5	00230000-5693-97d0-a075-2d979fde7456	prostor
00240000-5693-97d0-7257-e0df9ee0adcd	00230000-5693-97d0-2dd0-79b130e5f50d	besedilo
00240000-5693-97d0-a96b-fd4fefc1c648	00230000-5693-97d0-2dd0-79b130e5f50d	uprizoritev
00240000-5693-97d0-05f5-d6af0669beb7	00230000-5693-97d0-2dd0-79b130e5f50d	funkcija
00240000-5693-97d0-3b48-6c85dd4fd11b	00230000-5693-97d0-2dd0-79b130e5f50d	tipfunkcije
00240000-5693-97d0-1ca3-26f32bc59c40	00230000-5693-97d0-2dd0-79b130e5f50d	alternacija
00240000-5693-97d0-6deb-e2df672586da	00230000-5693-97d0-4739-fc56359cc4d6	pogodba
00240000-5693-97d0-2322-78401bebc014	00230000-5693-97d0-2dd0-79b130e5f50d	zaposlitev
00240000-5693-97d0-2b95-756307f51134	00230000-5693-97d0-2dd0-79b130e5f50d	zvrstuprizoritve
00240000-5693-97d0-2f79-0293ee51f770	00230000-5693-97d0-4739-fc56359cc4d6	programdela
00240000-5693-97d0-ee51-25f44e3c44bb	00230000-5693-97d0-2dd0-79b130e5f50d	zapis
\.


--
-- TOC entry 3123 (class 0 OID 34934255)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
edc78707-dcc3-4440-9594-91fdd73109d6	00240000-5693-97d0-244f-8a7398c6ff5a	0	1001
\.


--
-- TOC entry 3182 (class 0 OID 34934840)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5693-97d3-b28d-c146bd6ca270	000e0000-5693-97d3-757c-4d039dee2909	00080000-5693-97d3-fd79-d098245531fd	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5693-97d0-acc1-d5a497266ea2
00270000-5693-97d3-8263-3777d6a943b3	000e0000-5693-97d3-757c-4d039dee2909	00080000-5693-97d3-fd79-d098245531fd	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5693-97d0-acc1-d5a497266ea2
\.


--
-- TOC entry 3139 (class 0 OID 34934403)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 34934655)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5693-97d3-076b-d56942bab9a6	00180000-5693-97d3-b074-883cfed5fb61	000c0000-5693-97d3-24ae-fc3c2c7defed	00090000-5693-97d3-a6dc-1cc6a6b55d5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-97d3-a194-9776e8e2097f	00180000-5693-97d3-b074-883cfed5fb61	000c0000-5693-97d3-cdd8-2b0adb2e9181	00090000-5693-97d3-23b6-a2c4df0ba5eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-97d3-077d-53eb61af3e97	00180000-5693-97d3-b074-883cfed5fb61	000c0000-5693-97d3-1ed1-9fdac124aa84	00090000-5693-97d3-ce0f-1f9ad361887b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-97d3-6145-beb63bc4a82d	00180000-5693-97d3-b074-883cfed5fb61	000c0000-5693-97d3-e0e2-9c38d1cb6a2d	00090000-5693-97d3-1fda-c566b68b1746	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-97d3-7037-74511f134cb2	00180000-5693-97d3-b074-883cfed5fb61	000c0000-5693-97d3-f657-d6babc81d60a	00090000-5693-97d3-2f1c-eb3b7613154c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-97d3-f825-52d588323858	00180000-5693-97d3-e042-1b4e0af542e2	\N	00090000-5693-97d3-2f1c-eb3b7613154c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5693-97d3-f757-668ce4732acd	00180000-5693-97d3-e042-1b4e0af542e2	\N	00090000-5693-97d3-23b6-a2c4df0ba5eb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3163 (class 0 OID 34934675)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5693-97d0-c5bb-7b992e5097fe	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5693-97d0-5a98-7af94018e0e7	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5693-97d0-9175-b40aa8efb49f	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5693-97d0-8c17-d97de6a175fc	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5693-97d0-134a-17472845c723	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5693-97d0-f2cb-0f9a8e8fd30d	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3185 (class 0 OID 34934881)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5693-97d0-d659-80f7d8e8e24b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5693-97d0-bf45-165953f340af	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5693-97d0-236d-4f3e99d9ca42	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5693-97d0-fc38-92c211c54737	04	Režija	Režija	Režija	umetnik	30
000f0000-5693-97d0-7e55-73e4e44ae591	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5693-97d0-3f8b-19e3bbb1da8a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5693-97d0-93af-a777514d9415	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5693-97d0-f81b-0b242d3bd362	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5693-97d0-86c0-3abf0072ff8a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5693-97d0-093d-969ecd653cee	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5693-97d0-ced4-a5956425c335	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5693-97d0-ea31-0bfcafaf7c1f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5693-97d0-64ff-79a076522911	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5693-97d0-599a-07cc236ec644	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5693-97d0-e29e-507bdc7f67ee	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5693-97d0-d63a-c2beddd1f725	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5693-97d0-b9c0-5ab3fa6ce6c1	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5693-97d0-80ef-a96c88a18b37	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3136 (class 0 OID 34934354)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5693-97d2-3004-e348f407022f	0001	šola	osnovna ali srednja šola
00400000-5693-97d2-6b72-f5a693092019	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5693-97d2-3db3-397ab28a37b4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3198 (class 0 OID 34935186)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5693-97d0-0dce-aeac9db82f3d	01	Velika predstava	f	1.00	1.00
002b0000-5693-97d0-e975-6da4efe2fc87	02	Mala predstava	f	0.50	0.50
002b0000-5693-97d0-92c2-d7d4264f6299	03	Mala koprodukcija	t	0.40	1.00
002b0000-5693-97d0-f96b-4ae01f8249b4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5693-97d0-6ddb-e728d25442e1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3159 (class 0 OID 34934635)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5693-97d0-c0a1-0ace6a36a77e	0001	prva vaja	prva vaja
00420000-5693-97d0-cd63-283d431c39d0	0002	tehnična vaja	tehnična vaja
00420000-5693-97d0-dca1-ba6fd75349aa	0003	lučna vaja	lučna vaja
00420000-5693-97d0-a563-33c8925c1ce0	0004	kostumska vaja	kostumska vaja
00420000-5693-97d0-2250-64c1b0ef51f1	0005	foto vaja	foto vaja
00420000-5693-97d0-b557-9acb278b1f5e	0006	1. glavna vaja	1. glavna vaja
00420000-5693-97d0-de99-0c29854e4503	0007	2. glavna vaja	2. glavna vaja
00420000-5693-97d0-8ffa-6da75000326f	0008	1. generalka	1. generalka
00420000-5693-97d0-a701-8ba6b20e4b90	0009	2. generalka	2. generalka
00420000-5693-97d0-6d00-6270f6b442ea	0010	odprta generalka	odprta generalka
00420000-5693-97d0-fd03-a6a167469617	0011	obnovitvena vaja	obnovitvena vaja
00420000-5693-97d0-63a4-3c87b536cf84	0012	italijanka	krajša "obnovitvena" vaja
00420000-5693-97d0-1c51-767b41abb39e	0013	pevska vaja	pevska vaja
00420000-5693-97d0-8092-bdc40da76b9f	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5693-97d0-9175-c0584ddb178e	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3145 (class 0 OID 34934476)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 34934290)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5693-97d1-6e03-7b747cd63e11	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9.L4TdXsLUPie0AHO5YSLNnW/75.iPC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5693-97d3-c3bd-eed0b01334ce	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5693-97d3-6de1-88c041c1470c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5693-97d3-9a3a-1ad803a4a7a1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5693-97d3-9688-afbb95bf9873	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5693-97d3-1bfa-04ec770e97dd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5693-97d3-3e92-415e57ee5273	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5693-97d3-60d4-6c49ef2ba655	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5693-97d3-007c-27a73d08cc12	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5693-97d3-c895-ef3053468edb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5693-97d3-30c2-f2c390febdca	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5693-97d3-add4-3d2f6dde0723	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5693-97d3-faaf-c382c39e36ca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5693-97d3-b0c2-0fca08648afa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5693-97d3-2609-4c0dfcb6047b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5693-97d3-48c7-42e246c7b6ed	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5693-97d3-2de8-6a69b20693c5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5693-97d3-ec5d-6af0e50dbbf1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5693-97d3-5cf1-c507e17a7727	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5693-97d3-f477-47946032547a	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5693-97d3-6f14-a3a947ec175c	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5693-97d3-7104-a5e89fcc5bbe	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5693-97d3-ba8c-8bccc3ea4756	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5693-97d3-2161-b4bed8388e7a	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5693-97d3-2a19-a4da6b318b11	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5693-97d3-7e7e-f465442db49b	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5693-97d3-a0a6-4e722e4cbeb2	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5693-97d1-68ac-ae320cd308ab	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3189 (class 0 OID 34934931)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5693-97d3-a403-2d4f8d5bdfd3	00160000-5693-97d2-cacf-a14536ad2394	\N	00140000-5693-97d0-4689-374366baac69	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5693-97d2-a0b7-484f87054ba8
000e0000-5693-97d3-757c-4d039dee2909	00160000-5693-97d2-8b15-65eafe7a9980	\N	00140000-5693-97d0-fbe0-b3e23f4e5e78	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5693-97d2-250f-88d41e88e2c3
000e0000-5693-97d3-3673-b9d2113558e8	\N	\N	00140000-5693-97d0-fbe0-b3e23f4e5e78	00190000-5693-97d3-6788-b209feb76f7e	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5693-97d2-a0b7-484f87054ba8
000e0000-5693-97d3-a514-153a5d8ba944	\N	\N	00140000-5693-97d0-fbe0-b3e23f4e5e78	00190000-5693-97d3-6788-b209feb76f7e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5693-97d2-a0b7-484f87054ba8
000e0000-5693-97d3-4018-dfc37a7e887a	\N	\N	00140000-5693-97d0-fbe0-b3e23f4e5e78	00190000-5693-97d3-6788-b209feb76f7e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-6097-3d20a41026fa	\N	\N	00140000-5693-97d0-fbe0-b3e23f4e5e78	00190000-5693-97d3-6788-b209feb76f7e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-2860-1f8167939df9	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-8d76-ff1dcb117b50	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-fb34-119c6def8629	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-db71-57ed2afda47f	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-5df0-7ff8064dbb3f	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-1365-3e8683c0f16b	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-a4ea-49feedfb970f	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-0966-d57b416665a7	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
000e0000-5693-97d3-f6ac-a66274326f2d	\N	\N	00140000-5693-97d0-c370-7de572cc30e6	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-97d2-5510-d00490b642be
\.


--
-- TOC entry 3153 (class 0 OID 34934575)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5693-97d3-ed37-91cadefbba8a	\N	000e0000-5693-97d3-757c-4d039dee2909	1	
00200000-5693-97d3-e4dc-f8e62183b670	\N	000e0000-5693-97d3-757c-4d039dee2909	2	
00200000-5693-97d3-e9fa-9d1071b7e024	\N	000e0000-5693-97d3-757c-4d039dee2909	3	
00200000-5693-97d3-0fc5-437cf99e5f94	\N	000e0000-5693-97d3-757c-4d039dee2909	4	
00200000-5693-97d3-c1d8-2f774f0c460d	\N	000e0000-5693-97d3-757c-4d039dee2909	5	
\.


--
-- TOC entry 3172 (class 0 OID 34934743)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 34934854)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5693-97d0-3073-be298ee89e3c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5693-97d0-d58d-d435d005f6c4	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5693-97d0-0adc-4565ab08b2f6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5693-97d0-0e4d-1bc5dfc2b1b4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5693-97d0-6612-9533445c4c7c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5693-97d0-3285-5f5a228214bb	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5693-97d0-4b29-d09ba311deaa	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5693-97d0-71d5-e2301092b1ce	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5693-97d0-acc1-d5a497266ea2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5693-97d0-7a39-b53145df1563	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5693-97d0-db4b-cf96def0ea44	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5693-97d0-d959-7b10866a85d0	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5693-97d0-f4c0-258e5fba4154	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5693-97d0-a01e-05c678e58be9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5693-97d0-cd9d-0b00cb27ad37	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5693-97d0-e40c-1efec416fe5a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5693-97d0-52a3-068a26a47e09	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5693-97d0-db6e-fda5c43bf68a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5693-97d0-77bc-faaa9d450f30	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5693-97d0-d8c6-1bd76595411a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5693-97d0-db7e-c1d370e8c997	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5693-97d0-f202-b3bbd00dcd48	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5693-97d0-5c48-ae682712d0b8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5693-97d0-e5a2-1b2f13f38dff	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5693-97d0-5b37-5f11f61415b9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5693-97d0-a542-959d5342050a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5693-97d0-d60a-64500191c144	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5693-97d0-de82-a1b0eced0b6b	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3201 (class 0 OID 34935236)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 34935205)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 34935248)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 34934816)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5693-97d3-5d6b-997bc8b93522	00090000-5693-97d3-23b6-a2c4df0ba5eb	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-97d3-4e8c-7973e2d22aa7	00090000-5693-97d3-ce0f-1f9ad361887b	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-97d3-0016-5f8e494eff75	00090000-5693-97d3-5092-c39bd979af31	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-97d3-b86e-a50886a37045	00090000-5693-97d3-cddd-1ad873046642	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-97d3-c085-0048f06282ce	00090000-5693-97d3-18f4-09d93dc0c205	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-97d3-8e9c-7a411001c565	00090000-5693-97d3-2669-661a4cf27607	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3156 (class 0 OID 34934619)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 34934921)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5693-97d0-4689-374366baac69	01	Drama	drama (SURS 01)
00140000-5693-97d0-21f9-379ea8514ea4	02	Opera	opera (SURS 02)
00140000-5693-97d0-4268-271dfb9efac5	03	Balet	balet (SURS 03)
00140000-5693-97d0-d90f-c56d382e0523	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5693-97d0-c370-7de572cc30e6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5693-97d0-fbe0-b3e23f4e5e78	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5693-97d0-6a0b-f4baddac30e9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3178 (class 0 OID 34934806)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 34934353)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 34934980)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 34934970)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 34934344)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 34934837)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 34934879)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 34935289)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 34934672)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 34934607)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 34934629)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 34934634)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 34935203)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 34934502)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 34935049)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 34934802)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 34934573)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 34934540)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 34934516)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 34934708)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 34935266)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 34935273)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2897 (class 2606 OID 34935297)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2754 (class 2606 OID 34934735)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 34934474)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 34934372)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 34934436)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 34934399)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 34934333)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 34934318)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 34934741)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 34934777)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 34934916)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 34934427)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 34934462)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 34935154)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 34934714)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 34934452)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 34934592)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 34934561)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 34934553)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 34934726)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 34935163)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 34935171)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 34935141)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 34935184)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 34934759)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 34934699)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 34934690)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 34934903)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 34934830)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 34934528)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 34934289)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 34934768)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 34934307)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 34934327)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 34934786)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 34934721)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 34934653)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 34934277)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 34934265)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 34934259)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 34934850)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 34934408)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 34934664)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 34934682)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 34934890)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 34934361)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 34935196)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 34934642)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 34934487)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 34934302)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 34934949)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 34934582)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 34934749)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 34934862)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 34935246)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 34935230)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 34935254)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 34934820)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 34934623)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 34934929)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 34934814)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 34934617)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 34934618)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 34934616)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 34934615)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 34934614)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2797 (class 1259 OID 34934851)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2798 (class 1259 OID 34934852)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2799 (class 1259 OID 34934853)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2883 (class 1259 OID 34935268)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2884 (class 1259 OID 34935267)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 34934429)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 34934430)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2755 (class 1259 OID 34934742)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2870 (class 1259 OID 34935234)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2871 (class 1259 OID 34935233)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2872 (class 1259 OID 34935235)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2873 (class 1259 OID 34935232)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2874 (class 1259 OID 34935231)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2749 (class 1259 OID 34934728)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2750 (class 1259 OID 34934727)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 34934583)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 34934584)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 34934803)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2780 (class 1259 OID 34934805)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2781 (class 1259 OID 34934804)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 34934518)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 34934517)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2861 (class 1259 OID 34935185)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2813 (class 1259 OID 34934918)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2814 (class 1259 OID 34934919)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 34934920)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2880 (class 1259 OID 34935255)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2822 (class 1259 OID 34934954)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2823 (class 1259 OID 34934951)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2824 (class 1259 OID 34934955)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2825 (class 1259 OID 34934953)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2826 (class 1259 OID 34934952)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 34934489)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 34934488)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 34934402)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 34934769)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 34934334)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 34934335)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2772 (class 1259 OID 34934789)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 34934788)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2774 (class 1259 OID 34934787)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 34934439)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 34934438)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 34934440)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 34934556)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 34934554)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 34934555)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 34934267)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2729 (class 1259 OID 34934694)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2730 (class 1259 OID 34934692)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2731 (class 1259 OID 34934691)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2732 (class 1259 OID 34934693)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 34934308)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 34934309)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2758 (class 1259 OID 34934750)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2893 (class 1259 OID 34935290)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2795 (class 1259 OID 34934839)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2796 (class 1259 OID 34934838)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2894 (class 1259 OID 34935298)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2895 (class 1259 OID 34935299)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2744 (class 1259 OID 34934715)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2789 (class 1259 OID 34934831)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2790 (class 1259 OID 34934832)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2843 (class 1259 OID 34935054)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2844 (class 1259 OID 34935053)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2845 (class 1259 OID 34935050)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 34935051)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2847 (class 1259 OID 34935052)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 34934454)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 34934453)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 34934455)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2761 (class 1259 OID 34934763)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2762 (class 1259 OID 34934762)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2853 (class 1259 OID 34935164)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2854 (class 1259 OID 34935165)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2836 (class 1259 OID 34934984)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2837 (class 1259 OID 34934985)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2838 (class 1259 OID 34934982)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2839 (class 1259 OID 34934983)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2723 (class 1259 OID 34934673)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2724 (class 1259 OID 34934674)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2785 (class 1259 OID 34934821)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 34934822)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2735 (class 1259 OID 34934703)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2736 (class 1259 OID 34934702)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2737 (class 1259 OID 34934700)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2738 (class 1259 OID 34934701)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2832 (class 1259 OID 34934972)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2833 (class 1259 OID 34934971)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2662 (class 1259 OID 34934529)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 34934543)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 34934542)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 34934541)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 34934544)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 34934574)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 34934562)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 34934563)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2850 (class 1259 OID 34935155)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2869 (class 1259 OID 34935204)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2887 (class 1259 OID 34935274)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2888 (class 1259 OID 34935275)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 34934374)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 34934373)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 34934409)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 34934410)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 34934624)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 34934667)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 34934666)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 34934665)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 34934609)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 34934610)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 34934613)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 34934608)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 34934612)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 34934611)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 34934428)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 34934362)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 34934363)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 34934503)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 34934505)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 34934504)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 34934506)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2743 (class 1259 OID 34934709)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 34934917)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2827 (class 1259 OID 34934950)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 34934891)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 34934892)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 34934400)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 34934401)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 34934683)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 34934684)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2782 (class 1259 OID 34934815)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 34934278)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 34934475)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 34934437)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 34934266)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2866 (class 1259 OID 34935197)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2765 (class 1259 OID 34934761)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2766 (class 1259 OID 34934760)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 34934643)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 34934644)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2840 (class 1259 OID 34934981)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 34934463)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2819 (class 1259 OID 34934930)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2877 (class 1259 OID 34935247)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2859 (class 1259 OID 34935172)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 34935173)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2806 (class 1259 OID 34934880)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 34934654)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 34934328)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2937 (class 2606 OID 34935470)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2936 (class 2606 OID 34935475)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2931 (class 2606 OID 34935500)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2933 (class 2606 OID 34935490)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2938 (class 2606 OID 34935465)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2934 (class 2606 OID 34935485)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2932 (class 2606 OID 34935495)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2935 (class 2606 OID 34935480)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2976 (class 2606 OID 34935680)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2975 (class 2606 OID 34935685)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 34935690)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 34935855)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3009 (class 2606 OID 34935850)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 34935355)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2909 (class 2606 OID 34935360)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 34935595)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3003 (class 2606 OID 34935835)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 34935830)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3002 (class 2606 OID 34935840)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3005 (class 2606 OID 34935825)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3006 (class 2606 OID 34935820)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2955 (class 2606 OID 34935590)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2956 (class 2606 OID 34935585)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 34935455)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2929 (class 2606 OID 34935460)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 34935635)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 34935645)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2966 (class 2606 OID 34935640)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2919 (class 2606 OID 34935410)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 34935405)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 34935575)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 34935810)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2979 (class 2606 OID 34935695)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 34935700)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 34935705)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3007 (class 2606 OID 34935845)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2981 (class 2606 OID 34935725)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2984 (class 2606 OID 34935710)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2980 (class 2606 OID 34935730)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2982 (class 2606 OID 34935720)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2983 (class 2606 OID 34935715)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2917 (class 2606 OID 34935400)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 34935395)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2905 (class 2606 OID 34935340)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2906 (class 2606 OID 34935335)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2961 (class 2606 OID 34935615)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2902 (class 2606 OID 34935315)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2901 (class 2606 OID 34935320)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2962 (class 2606 OID 34935630)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2963 (class 2606 OID 34935625)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2964 (class 2606 OID 34935620)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2912 (class 2606 OID 34935370)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2913 (class 2606 OID 34935365)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2911 (class 2606 OID 34935375)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2923 (class 2606 OID 34935435)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 34935425)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 34935430)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2898 (class 2606 OID 34935300)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2945 (class 2606 OID 34935550)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2947 (class 2606 OID 34935540)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2948 (class 2606 OID 34935535)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2946 (class 2606 OID 34935545)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2900 (class 2606 OID 34935305)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 34935310)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2958 (class 2606 OID 34935600)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3012 (class 2606 OID 34935870)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2972 (class 2606 OID 34935675)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 34935670)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3014 (class 2606 OID 34935875)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 34935880)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2954 (class 2606 OID 34935580)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2971 (class 2606 OID 34935660)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2970 (class 2606 OID 34935665)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2991 (class 2606 OID 34935785)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 34935780)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2995 (class 2606 OID 34935765)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2994 (class 2606 OID 34935770)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2993 (class 2606 OID 34935775)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2915 (class 2606 OID 34935385)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 34935380)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2914 (class 2606 OID 34935390)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2959 (class 2606 OID 34935610)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2960 (class 2606 OID 34935605)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2998 (class 2606 OID 34935795)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2997 (class 2606 OID 34935800)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2988 (class 2606 OID 34935755)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 34935760)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2990 (class 2606 OID 34935745)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2989 (class 2606 OID 34935750)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2944 (class 2606 OID 34935525)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2943 (class 2606 OID 34935530)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2969 (class 2606 OID 34935650)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2968 (class 2606 OID 34935655)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 34935570)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2950 (class 2606 OID 34935565)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2952 (class 2606 OID 34935555)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2951 (class 2606 OID 34935560)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2985 (class 2606 OID 34935740)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 34935735)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 34935415)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2922 (class 2606 OID 34935420)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 34935450)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 34935440)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 34935445)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2996 (class 2606 OID 34935790)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2999 (class 2606 OID 34935805)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 34935815)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 34935860)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 34935865)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2903 (class 2606 OID 34935330)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 34935325)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2908 (class 2606 OID 34935345)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2907 (class 2606 OID 34935350)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2939 (class 2606 OID 34935505)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 34935520)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 34935515)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2942 (class 2606 OID 34935510)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-11 12:53:58 CET

--
-- PostgreSQL database dump complete
--

