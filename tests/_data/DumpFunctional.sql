--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-12 11:42:50 CET

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
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 255
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35331844)
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
-- TOC entry 239 (class 1259 OID 35332471)
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
-- TOC entry 238 (class 1259 OID 35332454)
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
-- TOC entry 182 (class 1259 OID 35331837)
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
-- TOC entry 181 (class 1259 OID 35331835)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 229 (class 1259 OID 35332331)
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
-- TOC entry 232 (class 1259 OID 35332361)
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
-- TOC entry 253 (class 1259 OID 35332774)
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
-- TOC entry 210 (class 1259 OID 35332167)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 35332092)
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
-- TOC entry 205 (class 1259 OID 35332124)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35332129)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 35332696)
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
-- TOC entry 194 (class 1259 OID 35331989)
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
-- TOC entry 240 (class 1259 OID 35332484)
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
-- TOC entry 225 (class 1259 OID 35332289)
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
-- TOC entry 200 (class 1259 OID 35332063)
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
-- TOC entry 197 (class 1259 OID 35332029)
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
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35332006)
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
-- TOC entry 214 (class 1259 OID 35332203)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 35332754)
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
-- TOC entry 252 (class 1259 OID 35332767)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 35332789)
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
-- TOC entry 218 (class 1259 OID 35332228)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35331963)
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
-- TOC entry 185 (class 1259 OID 35331863)
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
-- TOC entry 189 (class 1259 OID 35331930)
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
-- TOC entry 186 (class 1259 OID 35331874)
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
-- TOC entry 178 (class 1259 OID 35331809)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35331828)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 35332235)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 35332269)
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
-- TOC entry 235 (class 1259 OID 35332402)
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
-- TOC entry 188 (class 1259 OID 35331910)
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
-- TOC entry 191 (class 1259 OID 35331955)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35332640)
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
-- TOC entry 215 (class 1259 OID 35332209)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35331940)
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
-- TOC entry 202 (class 1259 OID 35332084)
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
-- TOC entry 198 (class 1259 OID 35332044)
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
-- TOC entry 199 (class 1259 OID 35332056)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 35332221)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 35332654)
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
-- TOC entry 244 (class 1259 OID 35332664)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 35332553)
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
-- TOC entry 245 (class 1259 OID 35332672)
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
-- TOC entry 221 (class 1259 OID 35332250)
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
-- TOC entry 213 (class 1259 OID 35332194)
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
-- TOC entry 212 (class 1259 OID 35332184)
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
-- TOC entry 234 (class 1259 OID 35332391)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 35332321)
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
-- TOC entry 196 (class 1259 OID 35332018)
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
-- TOC entry 175 (class 1259 OID 35331780)
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
-- TOC entry 174 (class 1259 OID 35331778)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 222 (class 1259 OID 35332263)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35331818)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35331802)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 35332277)
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
-- TOC entry 216 (class 1259 OID 35332215)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35332144)
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
-- TOC entry 173 (class 1259 OID 35331767)
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
-- TOC entry 172 (class 1259 OID 35331759)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35331754)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 35332338)
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
-- TOC entry 187 (class 1259 OID 35331902)
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
-- TOC entry 209 (class 1259 OID 35332154)
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
-- TOC entry 211 (class 1259 OID 35332174)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 35332379)
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
-- TOC entry 184 (class 1259 OID 35331853)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 35332684)
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
-- TOC entry 207 (class 1259 OID 35332134)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35331975)
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
-- TOC entry 176 (class 1259 OID 35331789)
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
-- TOC entry 237 (class 1259 OID 35332429)
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
-- TOC entry 201 (class 1259 OID 35332074)
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
-- TOC entry 220 (class 1259 OID 35332242)
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
-- TOC entry 231 (class 1259 OID 35332352)
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
-- TOC entry 249 (class 1259 OID 35332734)
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
-- TOC entry 248 (class 1259 OID 35332703)
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
-- TOC entry 250 (class 1259 OID 35332746)
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
-- TOC entry 227 (class 1259 OID 35332314)
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
-- TOC entry 204 (class 1259 OID 35332118)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 35332419)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 35332304)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 35331840)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 35331783)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3134 (class 0 OID 35331844)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5694-d8a6-fb26-c1ab02f00ff8	10	30	Otroci	Abonma za otroke	200
000a0000-5694-d8a6-e54b-844fd1997b37	20	60	Mladina	Abonma za mladino	400
000a0000-5694-d8a6-4100-4f1afe7a9a80	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3190 (class 0 OID 35332471)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5694-d8a7-3920-a1f9dae4f723	000d0000-5694-d8a7-0127-7f94adf2f8cb	\N	00090000-5694-d8a6-8eb1-ead926542f45	000b0000-5694-d8a6-ae48-878cd757ec1f	0001	f	\N	\N	\N	3	t	t	t
000c0000-5694-d8a7-7b47-c601dfaafc37	000d0000-5694-d8a7-70f9-e5f455e63f32	00100000-5694-d8a6-e77e-cfae015338b7	00090000-5694-d8a6-75ef-cf9c2292d303	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5694-d8a7-d8fe-9cbe9f13be5f	000d0000-5694-d8a7-badf-296b9cdd9038	00100000-5694-d8a6-e900-3fa420eeb2fb	00090000-5694-d8a6-9233-b96a5a4de3e7	\N	0003	t	\N	2016-01-12	\N	2	t	f	f
000c0000-5694-d8a7-1925-7dcf72e3e75e	000d0000-5694-d8a7-af68-e631b85d529f	\N	00090000-5694-d8a6-7d1f-6c5c5f473ac4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5694-d8a7-938b-680963ef17fe	000d0000-5694-d8a7-ed61-0dbcdf16c143	\N	00090000-5694-d8a6-61da-85311db9d6a9	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5694-d8a7-1c1d-3bee876d9cda	000d0000-5694-d8a7-33d9-e7b667e5eb0a	\N	00090000-5694-d8a6-aaee-e8638421ea7d	000b0000-5694-d8a6-71dc-5b53e702a052	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5694-d8a7-60d8-0ea1961968a8	000d0000-5694-d8a7-52f8-cfe47b55906f	00100000-5694-d8a6-0e09-981a55ab6194	00090000-5694-d8a6-ad6a-d32974269d60	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5694-d8a7-a298-b09ff8c1a2ba	000d0000-5694-d8a7-013f-2be30dda1f0b	\N	00090000-5694-d8a6-9865-630e59124c80	000b0000-5694-d8a6-939c-782ed3773c82	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5694-d8a7-60d1-a07536544d4b	000d0000-5694-d8a7-52f8-cfe47b55906f	00100000-5694-d8a6-36b1-687c953ece0e	00090000-5694-d8a6-2e4a-db66c264e025	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5694-d8a7-ebb4-303316cd4bbf	000d0000-5694-d8a7-52f8-cfe47b55906f	00100000-5694-d8a6-189e-6be29865fee8	00090000-5694-d8a6-44d1-90a938489e1f	\N	0010	t	\N	2016-01-12	\N	16	f	f	t
000c0000-5694-d8a7-36e3-bafd733b18cc	000d0000-5694-d8a7-52f8-cfe47b55906f	00100000-5694-d8a6-a231-3e6bca8de35b	00090000-5694-d8a6-9b70-0cb2f3bc4af5	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5694-d8a7-dd50-ddb6682400d7	000d0000-5694-d8a7-63d4-301fff9f3838	00100000-5694-d8a6-e77e-cfae015338b7	00090000-5694-d8a6-75ef-cf9c2292d303	000b0000-5694-d8a6-4b20-bf76765d012f	0012	t	\N	\N	\N	2	t	t	t
000c0000-5694-d8a7-55db-fa8ff632f349	000d0000-5694-d8a7-d1d7-0689c2e724be	\N	00090000-5694-d8a6-9865-630e59124c80	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-f175-0cf9aa68ff9a	000d0000-5694-d8a7-d1d7-0689c2e724be	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-642b-fe969e04f867	000d0000-5694-d8a7-4942-32b80b6024a4	00100000-5694-d8a6-e900-3fa420eeb2fb	00090000-5694-d8a6-9233-b96a5a4de3e7	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-e935-e578042f772f	000d0000-5694-d8a7-4942-32b80b6024a4	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-d4ac-4d86a8f12ab4	000d0000-5694-d8a7-592b-e9c906525841	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-5a0b-d54f3079e460	000d0000-5694-d8a7-592b-e9c906525841	\N	00090000-5694-d8a6-9865-630e59124c80	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-60b0-3aa71d60fc20	000d0000-5694-d8a7-3e3c-ec6e4748b2bf	00100000-5694-d8a6-0e09-981a55ab6194	00090000-5694-d8a6-ad6a-d32974269d60	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-f850-448dd4089d47	000d0000-5694-d8a7-3e3c-ec6e4748b2bf	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-0bdf-39c8214e6ea6	000d0000-5694-d8a7-e6a1-03fefa7a8a8f	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-ed11-f01fb1fc4b0a	000d0000-5694-d8a7-e6a1-03fefa7a8a8f	00100000-5694-d8a6-0e09-981a55ab6194	00090000-5694-d8a6-ad6a-d32974269d60	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-3c66-64f5d85d666d	000d0000-5694-d8a7-a17a-45a917530358	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-b160-d850533b8f32	000d0000-5694-d8a7-f97d-8f00d0419510	\N	00090000-5694-d8a6-9865-630e59124c80	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-37ba-89e0c5e81abe	000d0000-5694-d8a7-d295-ffb95bab7c69	\N	00090000-5694-d8a6-9865-630e59124c80	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-4eda-2826d347de8b	000d0000-5694-d8a7-d295-ffb95bab7c69	00100000-5694-d8a6-e900-3fa420eeb2fb	00090000-5694-d8a6-9233-b96a5a4de3e7	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-3398-2e5265fd4fc4	000d0000-5694-d8a7-5c2a-b866053556a2	\N	00090000-5694-d8a6-30e4-0929aacd0304	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5694-d8a7-b89d-48acb70198fc	000d0000-5694-d8a7-5c2a-b866053556a2	\N	00090000-5694-d8a6-5900-2a905f094d7b	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-4bdb-c1766578c38a	000d0000-5694-d8a7-ca3e-192228ebcf38	\N	00090000-5694-d8a6-9865-630e59124c80	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5694-d8a7-0508-3cc192d4152d	000d0000-5694-d8a7-ca3e-192228ebcf38	00100000-5694-d8a6-e900-3fa420eeb2fb	00090000-5694-d8a6-9233-b96a5a4de3e7	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5694-d8a7-147e-6f9cf7ffa3dd	000d0000-5694-d8a7-ca3e-192228ebcf38	\N	00090000-5694-d8a6-5900-2a905f094d7b	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5694-d8a7-8a35-68c9818aab8b	000d0000-5694-d8a7-ca3e-192228ebcf38	\N	00090000-5694-d8a6-30e4-0929aacd0304	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5694-d8a7-3231-c1dacdd22457	000d0000-5694-d8a7-9923-161db7b1fe95	\N	00090000-5694-d8a6-9865-630e59124c80	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5694-d8a7-5b22-f9fc75ca17e8	000d0000-5694-d8a7-6807-8e65c607dd30	00100000-5694-d8a6-e900-3fa420eeb2fb	00090000-5694-d8a6-9233-b96a5a4de3e7	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5694-d8a7-a30e-c8ac80dd5ca4	000d0000-5694-d8a7-6807-8e65c607dd30	\N	00090000-5694-d8a6-3ab3-4eb792673bd8	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3189 (class 0 OID 35332454)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 35331837)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3180 (class 0 OID 35332331)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5694-d8a6-5280-7ca54ea70860	00160000-5694-d8a6-2bab-0fddff75e52d	00090000-5694-d8a6-5900-2a905f094d7b	aizv	10	t
003d0000-5694-d8a6-51e7-f0d3769d89da	00160000-5694-d8a6-2bab-0fddff75e52d	00090000-5694-d8a6-65e3-a81d97d10424	apri	14	t
003d0000-5694-d8a6-30a9-dcc390d0cb22	00160000-5694-d8a6-f4f4-fa47c1fb3d0b	00090000-5694-d8a6-30e4-0929aacd0304	aizv	11	t
003d0000-5694-d8a6-cb69-aeace3f42ec1	00160000-5694-d8a6-9fa2-962536b21c22	00090000-5694-d8a6-a373-13f9e30d6f5d	aizv	12	t
003d0000-5694-d8a6-a824-e01715f55f98	00160000-5694-d8a6-2bab-0fddff75e52d	00090000-5694-d8a6-3ab3-4eb792673bd8	apri	18	f
\.


--
-- TOC entry 3183 (class 0 OID 35332361)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5694-d8a6-2bab-0fddff75e52d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5694-d8a6-f4f4-fa47c1fb3d0b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5694-d8a6-9fa2-962536b21c22	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3204 (class 0 OID 35332774)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 35332167)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 35332092)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5694-d8a7-c195-263572c25d85	\N	\N	00200000-5694-d8a7-45f3-1fd6cf75fae6	\N	\N	\N	00220000-5694-d8a6-598a-4eea8739d727	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5694-d8a7-f31e-ccdf29d2a7fc	\N	\N	00200000-5694-d8a7-3a3a-8984cae2d884	\N	\N	\N	00220000-5694-d8a6-598a-4eea8739d727	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5694-d8a7-5e95-e29a8fd09491	\N	\N	00200000-5694-d8a7-1297-8c61a460fedd	\N	\N	\N	00220000-5694-d8a6-aff7-50830abfb2da	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5694-d8a7-8e84-0feb895d47f9	\N	\N	00200000-5694-d8a7-17e0-ba7c93b90ee4	\N	\N	\N	00220000-5694-d8a6-44f0-af3a17f168d3	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5694-d8a7-9dde-fe4efa26d827	\N	\N	00200000-5694-d8a7-bf48-c2ac76367eb0	\N	\N	\N	00220000-5694-d8a6-74c5-56a4d0cbe58e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3156 (class 0 OID 35332124)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 35332129)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 35332696)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 35331989)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5694-d8a3-98e9-c173cd903239	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5694-d8a3-c1c2-ca0d052f10b5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5694-d8a3-cca7-8beb58d88361	AL	ALB	008	Albania 	Albanija	\N
00040000-5694-d8a3-a63c-38c471a96977	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5694-d8a3-a57f-7cce903473a5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5694-d8a3-9ed9-2ff08fc53062	AD	AND	020	Andorra 	Andora	\N
00040000-5694-d8a3-ef66-a03c72d15e6e	AO	AGO	024	Angola 	Angola	\N
00040000-5694-d8a3-99d5-94e3e88e0dc1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5694-d8a3-5472-2af7c75709a5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5694-d8a3-6bf7-965b1149464e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-d8a3-c416-f389a71ea34a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5694-d8a3-8de3-7327efef8592	AM	ARM	051	Armenia 	Armenija	\N
00040000-5694-d8a3-0b4e-1df1c6285758	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5694-d8a3-b7a3-aced55fb8765	AU	AUS	036	Australia 	Avstralija	\N
00040000-5694-d8a3-06df-a45a9ed00c99	AT	AUT	040	Austria 	Avstrija	\N
00040000-5694-d8a3-ab49-55cbdc18e160	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5694-d8a3-bccd-cddc6f0bf3e2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5694-d8a3-6d22-93037be6166c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5694-d8a3-0be6-c8b32258b7b4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5694-d8a3-cae3-753aa28e4e77	BB	BRB	052	Barbados 	Barbados	\N
00040000-5694-d8a3-3c40-98975c3d7989	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5694-d8a3-5f28-020c28d98b3e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5694-d8a3-94cf-894fd204536f	BZ	BLZ	084	Belize 	Belize	\N
00040000-5694-d8a3-5ce3-7a3b674af917	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5694-d8a3-eae0-42ecd9cef010	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5694-d8a3-cb0f-2d379424cb81	BT	BTN	064	Bhutan 	Butan	\N
00040000-5694-d8a3-5af1-e2a4eea50f92	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5694-d8a3-6703-eda6691dff28	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5694-d8a3-f19a-4adbf0ef4b28	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5694-d8a3-0063-decccb2f09bb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5694-d8a3-b8e2-c6a9f481285a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5694-d8a3-4fb5-29851d2019f3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5694-d8a3-9337-c799519b9edd	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5694-d8a3-d746-ba975329a056	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5694-d8a3-861a-e8138f18af1d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5694-d8a3-8934-60c25796cf35	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5694-d8a3-bc25-1ec4b4c8661a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5694-d8a3-e80f-501149cebc4a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5694-d8a3-6774-87059711064c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5694-d8a3-a88d-6953d209dc15	CA	CAN	124	Canada 	Kanada	\N
00040000-5694-d8a3-47c0-43ca4cab8bf4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5694-d8a3-91be-6d7892c98773	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5694-d8a3-2fae-a459f3d7bf20	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5694-d8a3-f605-c649dc93c3ab	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5694-d8a3-e427-7e1c3f328a0d	CL	CHL	152	Chile 	Čile	\N
00040000-5694-d8a3-2656-c5deb6f58e1c	CN	CHN	156	China 	Kitajska	\N
00040000-5694-d8a3-42e0-f9caebf9e246	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5694-d8a3-1316-44da09133bb5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5694-d8a3-96b4-705f09d7314e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5694-d8a3-0100-9ca406e144cf	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5694-d8a3-5866-a0c4e789f473	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5694-d8a3-6528-14953b81c230	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5694-d8a3-c6ff-0cc1f807091f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5694-d8a3-f475-5ff7ca97f0c1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5694-d8a3-fb39-3a801a26faa2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5694-d8a3-9a43-1a0388a91fb2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5694-d8a3-8829-84b65caaf477	CU	CUB	192	Cuba 	Kuba	\N
00040000-5694-d8a3-3144-8d0530d7df9d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5694-d8a3-ec7c-4dd6847158d9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5694-d8a3-9b68-2f2541669f61	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5694-d8a3-a7ed-12b6bfbea947	DK	DNK	208	Denmark 	Danska	\N
00040000-5694-d8a3-d99e-168ba4e9e95a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5694-d8a3-395a-9b55a24b26c1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-d8a3-fbf5-008293cf5053	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5694-d8a3-cff6-4d9713712112	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5694-d8a3-6b3e-3326db836589	EG	EGY	818	Egypt 	Egipt	\N
00040000-5694-d8a3-21e8-2aabc97a3d9c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5694-d8a3-9750-c35370f4654a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5694-d8a3-7a56-b65f47dc8d4e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5694-d8a3-bd5c-f34dc599572e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5694-d8a3-7e90-19de91e38fb9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5694-d8a3-c5c8-582b48ed1b75	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5694-d8a3-4ce9-55623acb2736	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5694-d8a3-a4dd-beb38f8d345f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5694-d8a3-e2f1-ec3c8503fb17	FI	FIN	246	Finland 	Finska	\N
00040000-5694-d8a3-778e-173e59c6fda0	FR	FRA	250	France 	Francija	\N
00040000-5694-d8a3-2964-3553e39e85f3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5694-d8a3-de31-4f4f0dc68e67	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5694-d8a3-3f05-4a1be6ab3419	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5694-d8a3-4567-2212b897d99b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5694-d8a3-90a0-404f26b5f505	GA	GAB	266	Gabon 	Gabon	\N
00040000-5694-d8a3-7db8-6789156e001a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5694-d8a3-d346-95bb0bd3fd15	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5694-d8a3-4d0f-9be24ebebab2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5694-d8a3-e047-f22862f017d4	GH	GHA	288	Ghana 	Gana	\N
00040000-5694-d8a3-3656-2717bd809a3f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5694-d8a3-8921-754431b2b2b6	GR	GRC	300	Greece 	Grčija	\N
00040000-5694-d8a3-13c8-8a7d153532c1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5694-d8a3-776b-c6a1b045bef9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5694-d8a3-2e10-5dca548b6b09	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5694-d8a3-5736-5b024d0ac93f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5694-d8a3-98ef-abadd2a5accf	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5694-d8a3-7835-6f626589d9ea	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5694-d8a3-78c9-8b77ac894533	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5694-d8a3-d46b-ec475d1304e7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5694-d8a3-73cc-d036a51d3daf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5694-d8a3-eaa6-50614b441d01	HT	HTI	332	Haiti 	Haiti	\N
00040000-5694-d8a3-c371-d02939391d42	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5694-d8a3-adab-246a5db1ae55	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5694-d8a3-9b83-5f6368bed16d	HN	HND	340	Honduras 	Honduras	\N
00040000-5694-d8a3-b318-8e2a7cd793c4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5694-d8a3-5714-13e061fcb633	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5694-d8a3-4b87-ff1ee4f87696	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5694-d8a3-a4aa-ac37e4cedd32	IN	IND	356	India 	Indija	\N
00040000-5694-d8a3-d060-69aa2aaf6f01	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5694-d8a3-3e28-1690314a6d77	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5694-d8a3-1e9d-289bd8965953	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5694-d8a3-0213-d78d5109e305	IE	IRL	372	Ireland 	Irska	\N
00040000-5694-d8a3-3291-29c674c2ff31	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5694-d8a3-1306-70e876309b34	IL	ISR	376	Israel 	Izrael	\N
00040000-5694-d8a3-e00a-38628611f1bb	IT	ITA	380	Italy 	Italija	\N
00040000-5694-d8a3-cf96-23ad0e6bd594	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5694-d8a3-2f6a-e8a48cfb01f2	JP	JPN	392	Japan 	Japonska	\N
00040000-5694-d8a3-0cc8-c280c61af4c0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5694-d8a3-868c-49be0d2950ff	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5694-d8a3-f7fb-e16e4b1c9641	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5694-d8a3-1d7c-9ec5c71f69c9	KE	KEN	404	Kenya 	Kenija	\N
00040000-5694-d8a3-2e5e-117e5d5b6e66	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5694-d8a3-1a65-d7d4e81a53b1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5694-d8a3-eabf-9e482d973c43	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5694-d8a3-6643-6e1527c285a8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5694-d8a3-99c2-ea60efcb5a82	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5694-d8a3-6d36-b256d3ae11b3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5694-d8a3-4d77-2e287147a797	LV	LVA	428	Latvia 	Latvija	\N
00040000-5694-d8a3-bfd0-ef79a7bfba83	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5694-d8a3-2cf8-550d82643dd7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5694-d8a3-1fc8-04b784c98def	LR	LBR	430	Liberia 	Liberija	\N
00040000-5694-d8a3-5bf5-fa96d865d898	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5694-d8a3-1022-1f37bb7ebc08	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5694-d8a3-fb9f-3cdf82b8de81	LT	LTU	440	Lithuania 	Litva	\N
00040000-5694-d8a3-e384-cdc17e3e9721	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5694-d8a3-981b-3e6d7462504e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5694-d8a3-8bc0-dafc9414eca5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5694-d8a3-222f-34401cb51d7e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5694-d8a3-b43e-78cb90d749e5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5694-d8a3-398e-bb2459a1eb4b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5694-d8a3-6214-cd9f9fc57967	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5694-d8a3-8689-c2afe6428620	ML	MLI	466	Mali 	Mali	\N
00040000-5694-d8a3-4b5a-4c59bfbaa57e	MT	MLT	470	Malta 	Malta	\N
00040000-5694-d8a3-76aa-1b983b8119af	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5694-d8a3-b8a3-2a1c4d8fb930	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5694-d8a3-3873-0daa21095ec0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5694-d8a3-1eab-4fb1a02a8b53	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5694-d8a3-a82e-c9944dd9faec	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5694-d8a3-d3a5-db6a6472ad3b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5694-d8a3-9a52-b318767b9343	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5694-d8a3-230e-01d0a4b4df48	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5694-d8a3-e2c4-bb30291925cc	MC	MCO	492	Monaco 	Monako	\N
00040000-5694-d8a3-e657-ecfd8e106ef5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5694-d8a3-1b7e-23c4fab2d5b6	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5694-d8a3-a13c-b21b560ae44d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5694-d8a3-1917-0df3f06dd546	MA	MAR	504	Morocco 	Maroko	\N
00040000-5694-d8a3-8915-c6ffe8cf9f8e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5694-d8a3-57a1-030f8a932702	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5694-d8a3-62b6-64276aa73a19	NA	NAM	516	Namibia 	Namibija	\N
00040000-5694-d8a3-75ac-f88723227e38	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5694-d8a3-f96d-1a058aa2936d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5694-d8a3-0f69-e05bd9a41684	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5694-d8a3-6999-99b1337a9400	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5694-d8a3-b902-cd4ebeab9909	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5694-d8a3-6e13-42f0080e8aad	NE	NER	562	Niger 	Niger 	\N
00040000-5694-d8a3-8e8c-9f5ffb2a54dc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5694-d8a3-8084-5569dd82350c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5694-d8a3-d5b9-30473fffddc3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5694-d8a3-56a6-5dc87f14c878	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5694-d8a3-a667-4123820242fe	NO	NOR	578	Norway 	Norveška	\N
00040000-5694-d8a3-5d56-e3755ba78072	OM	OMN	512	Oman 	Oman	\N
00040000-5694-d8a3-0270-c488c82a2d89	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5694-d8a3-b2fd-207666786cfc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5694-d8a3-0fc1-6af6e0b35e37	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5694-d8a3-52f6-e34855744fb6	PA	PAN	591	Panama 	Panama	\N
00040000-5694-d8a3-2e74-91738fa647da	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5694-d8a3-a14f-933163759fc3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5694-d8a3-0474-8d5c34e1b85d	PE	PER	604	Peru 	Peru	\N
00040000-5694-d8a3-6d6b-fd347fafc647	PH	PHL	608	Philippines 	Filipini	\N
00040000-5694-d8a3-de6c-161ec82bbb99	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5694-d8a3-36ce-c11480324fb9	PL	POL	616	Poland 	Poljska	\N
00040000-5694-d8a3-c751-ab59f30df915	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5694-d8a3-2ca8-71bbb8e9d20f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5694-d8a3-23bc-0d681c2056e2	QA	QAT	634	Qatar 	Katar	\N
00040000-5694-d8a3-5d47-6ea75e2122c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5694-d8a3-8216-9d056778050c	RO	ROU	642	Romania 	Romunija	\N
00040000-5694-d8a3-fa17-4217ae715d74	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5694-d8a3-1fd8-88ed08a196eb	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5694-d8a3-506d-c37f6d5d40ec	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5694-d8a3-a9ed-a05f09f73950	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5694-d8a3-3a3a-634df99dcdb5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5694-d8a3-ae55-3133b28c4ccb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5694-d8a3-ea71-818361177f11	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5694-d8a3-cc2a-6a7430ec6ced	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5694-d8a3-f750-d10409424fcc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5694-d8a3-da55-fbeea23710ec	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5694-d8a3-7b94-38dca9bb273f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5694-d8a3-675c-3557bb7a925d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5694-d8a3-707c-3ebbe7002f1c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5694-d8a3-229b-0ec37d537297	SN	SEN	686	Senegal 	Senegal	\N
00040000-5694-d8a3-d57f-66113e4c07e5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5694-d8a3-331d-b73ac7ffd237	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5694-d8a3-3469-546a155bd70c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5694-d8a3-7f4f-e347327df420	SG	SGP	702	Singapore 	Singapur	\N
00040000-5694-d8a3-d626-12fba3164c48	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5694-d8a3-7aa8-623061209337	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5694-d8a3-b153-9cabad5972c0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5694-d8a3-b61f-47aee0763774	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5694-d8a3-4e30-b8c35e3b5f3a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5694-d8a3-3d87-121ac800a954	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5694-d8a3-d64f-c96ca8d61f81	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5694-d8a3-85b7-2e50225e9bde	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5694-d8a3-051c-2ca01817233a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5694-d8a3-d864-b64feac9a18b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5694-d8a3-bfbc-b2479d5e0c1e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5694-d8a3-77fe-4317eb738b53	SR	SUR	740	Suriname 	Surinam	\N
00040000-5694-d8a3-3efd-41f85498ad50	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5694-d8a3-ac10-85173fbe5f2c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5694-d8a3-8a5a-21e32f66a300	SE	SWE	752	Sweden 	Švedska	\N
00040000-5694-d8a3-5b9f-f07c01fe4b6d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5694-d8a3-2763-c4c732619225	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5694-d8a3-e676-bf4915df2550	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5694-d8a3-366d-893ec47b054f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5694-d8a3-c21f-d432e93b1402	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5694-d8a3-0493-604207681d13	TH	THA	764	Thailand 	Tajska	\N
00040000-5694-d8a3-228f-dca3cab20256	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5694-d8a3-0257-6366c512bf45	TG	TGO	768	Togo 	Togo	\N
00040000-5694-d8a3-70a5-2369b86df45d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5694-d8a3-455d-29c3718e2642	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5694-d8a3-1c52-a44573fa8c06	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5694-d8a3-1f3e-1954f50f7f1d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5694-d8a3-e2b9-44d847c43fe4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5694-d8a3-a923-129107a38294	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5694-d8a3-4363-3dc8e80becc3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-d8a3-c82b-9c6539ea309b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5694-d8a3-e1e0-6ab0a108a8d5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5694-d8a3-1df8-6457fdeb9465	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5694-d8a3-caf3-a5f169b54016	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5694-d8a3-76b0-f4999833a929	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5694-d8a3-e8a7-467da7ea4dc8	US	USA	840	United States 	Združene države Amerike	\N
00040000-5694-d8a3-50fe-d14af0810f9e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5694-d8a3-3609-052731f9b79b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5694-d8a3-ba9b-4ddf7f74b274	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5694-d8a3-0dbd-257966d82e26	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5694-d8a3-5837-44a46cbd9a4b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5694-d8a3-46de-12f5211d40fa	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5694-d8a3-5b53-133a5d5793c9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-d8a3-1191-dc0c04bc9bae	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5694-d8a3-8ef0-b8691fad6f1d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5694-d8a3-92c0-b9abc2c858f0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5694-d8a3-4667-080194abe21f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5694-d8a3-170d-de04cbc006db	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5694-d8a3-9994-bbdac44b0329	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3191 (class 0 OID 35332484)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5694-d8a7-a75d-866139e7bdba	000e0000-5694-d8a6-2495-4813bef4da53	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-d8a3-c168-3db265708dab	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-d8a7-fa9b-09bb31753740	000e0000-5694-d8a6-e646-c7208720d646	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-d8a3-b725-6ec1613c0c59	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-d8a7-f78a-1035e28a0d68	000e0000-5694-d8a6-7775-7dc823b3aa8e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-d8a3-c168-3db265708dab	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-d8a7-a805-7023f4597ae9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-d8a7-4284-d41ecb8dcd98	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3176 (class 0 OID 35332289)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5694-d8a7-bdaf-d0f045d3f4c9	000e0000-5694-d8a6-8203-fb2984670468	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-d8a3-f3ea-bb911748c1a0
000d0000-5694-d8a7-0f52-67cdcc536f7d	000e0000-5694-d8a6-8203-fb2984670468	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-0127-7f94adf2f8cb	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-3920-a1f9dae4f723	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-d8a3-f3ea-bb911748c1a0
000d0000-5694-d8a7-70f9-e5f455e63f32	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-7b47-c601dfaafc37	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-badf-296b9cdd9038	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-d8fe-9cbe9f13be5f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5694-d8a3-1531-c274925dd3b4
000d0000-5694-d8a7-af68-e631b85d529f	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-1925-7dcf72e3e75e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5694-d8a3-b220-5103817c2408
000d0000-5694-d8a7-ed61-0dbcdf16c143	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-938b-680963ef17fe	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5694-d8a3-b220-5103817c2408
000d0000-5694-d8a7-33d9-e7b667e5eb0a	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-1c1d-3bee876d9cda	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-d8a3-f3ea-bb911748c1a0
000d0000-5694-d8a7-52f8-cfe47b55906f	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-60d1-a07536544d4b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5694-d8a3-f3ea-bb911748c1a0
000d0000-5694-d8a7-013f-2be30dda1f0b	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-a298-b09ff8c1a2ba	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5694-d8a3-5d24-3d22b79310d4
000d0000-5694-d8a7-63d4-301fff9f3838	000e0000-5694-d8a6-e646-c7208720d646	000c0000-5694-d8a7-dd50-ddb6682400d7	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5694-d8a3-eb75-839fc4b8b265
000d0000-5694-d8a7-d1d7-0689c2e724be	000e0000-5694-d8a6-1f34-fd62c454f92b	000c0000-5694-d8a7-55db-fa8ff632f349	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-4942-32b80b6024a4	000e0000-5694-d8a6-f05b-1d90b6306c61	000c0000-5694-d8a7-642b-fe969e04f867	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-592b-e9c906525841	000e0000-5694-d8a6-f05b-1d90b6306c61	000c0000-5694-d8a7-d4ac-4d86a8f12ab4	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-3e3c-ec6e4748b2bf	000e0000-5694-d8a6-6b53-13502b0ba807	000c0000-5694-d8a7-60b0-3aa71d60fc20	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-e6a1-03fefa7a8a8f	000e0000-5694-d8a6-42f6-1fa60e08e9d0	000c0000-5694-d8a7-0bdf-39c8214e6ea6	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-a17a-45a917530358	000e0000-5694-d8a6-0584-fd779563f42b	000c0000-5694-d8a7-3c66-64f5d85d666d	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-f97d-8f00d0419510	000e0000-5694-d8a6-0d71-f5b077b166fe	000c0000-5694-d8a7-b160-d850533b8f32	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-d295-ffb95bab7c69	000e0000-5694-d8a6-b6ed-27988a70f012	000c0000-5694-d8a7-37ba-89e0c5e81abe	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-5c2a-b866053556a2	000e0000-5694-d8a6-108d-e78ad06eee71	000c0000-5694-d8a7-3398-2e5265fd4fc4	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-ca3e-192228ebcf38	000e0000-5694-d8a6-108d-e78ad06eee71	000c0000-5694-d8a7-4bdb-c1766578c38a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-9923-161db7b1fe95	000e0000-5694-d8a6-382a-2d70d23c8294	000c0000-5694-d8a7-3231-c1dacdd22457	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
000d0000-5694-d8a7-6807-8e65c607dd30	000e0000-5694-d8a6-382a-2d70d23c8294	000c0000-5694-d8a7-5b22-f9fc75ca17e8	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5694-d8a3-de4d-192b19eb83c2
\.


--
-- TOC entry 3151 (class 0 OID 35332063)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 35332029)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 35332006)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5694-d8a6-302d-1935a93d4633	00080000-5694-d8a6-6352-303751841c8a	00090000-5694-d8a6-44d1-90a938489e1f	AK		igralka
\.


--
-- TOC entry 3165 (class 0 OID 35332203)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35332754)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5694-d8a6-0e95-ee4f27877070	00010000-5694-d8a4-6817-f618a21f5c86	\N	Prva mapa	Root mapa	2016-01-12 11:42:46	2016-01-12 11:42:46	R	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 35332767)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 35332789)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 34548309)
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
-- TOC entry 3169 (class 0 OID 35332228)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 35331963)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5694-d8a4-6280-26a0a396c2aa	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5694-d8a4-9126-3531c5550004	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5694-d8a4-9a75-2423ee3f3e78	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5694-d8a4-435f-5c2c08197efb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5694-d8a4-0916-ce845a166d68	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5694-d8a4-a60d-59b1fbfcc2a1	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5694-d8a4-bc4e-af8db7a5873a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5694-d8a4-ea2a-ad284833f2bf	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5694-d8a4-054d-7943ae1b42ed	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5694-d8a4-b410-21fde3744a9c	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5694-d8a4-0df6-aa7304b0ec65	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5694-d8a4-8ad0-4a7c929b4bee	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5694-d8a4-5ff2-9a674722731a	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5694-d8a4-1d28-ae32112056e7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5694-d8a6-9121-e95937f6d9c1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5694-d8a6-e4a7-88d53b10a31f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5694-d8a6-6fe5-fd32c9806936	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5694-d8a6-0a7d-e35a92dd8e51	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5694-d8a6-f016-b45176a62b45	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5694-d8a8-13f8-364caf251f5b	application.tenant.maticnopodjetje	string	s:36:"00080000-5694-d8a8-7923-bb760e8062de";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3136 (class 0 OID 35331863)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5694-d8a6-9ead-058676c8fe71	00000000-5694-d8a6-9121-e95937f6d9c1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5694-d8a6-6a67-53a538f2e533	00000000-5694-d8a6-9121-e95937f6d9c1	00010000-5694-d8a4-6817-f618a21f5c86	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5694-d8a6-b81e-80e735fadac5	00000000-5694-d8a6-e4a7-88d53b10a31f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3140 (class 0 OID 35331930)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5694-d8a6-18a6-297c457d106f	\N	00100000-5694-d8a6-e77e-cfae015338b7	00100000-5694-d8a6-e900-3fa420eeb2fb	01	Gledališče Nimbis
00410000-5694-d8a6-9858-ee1b043d3081	00410000-5694-d8a6-18a6-297c457d106f	00100000-5694-d8a6-e77e-cfae015338b7	00100000-5694-d8a6-e900-3fa420eeb2fb	02	Tehnika
\.


--
-- TOC entry 3137 (class 0 OID 35331874)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5694-d8a6-8eb1-ead926542f45	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5694-d8a6-7d1f-6c5c5f473ac4	00010000-5694-d8a6-7b49-6d5d519fed3b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5694-d8a6-9233-b96a5a4de3e7	00010000-5694-d8a6-81d4-3a3bc07f551d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5694-d8a6-2e4a-db66c264e025	00010000-5694-d8a6-a925-ee6d3d841463	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5694-d8a6-a067-8d7f95f265b4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5694-d8a6-aaee-e8638421ea7d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5694-d8a6-9b70-0cb2f3bc4af5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5694-d8a6-ad6a-d32974269d60	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5694-d8a6-44d1-90a938489e1f	00010000-5694-d8a6-022f-49abb9c16e2c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5694-d8a6-75ef-cf9c2292d303	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5694-d8a6-2236-d0ee9e981267	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-d8a6-61da-85311db9d6a9	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5694-d8a6-9865-630e59124c80	00010000-5694-d8a6-4656-341efa287c5d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-d8a6-5900-2a905f094d7b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-d8a6-65e3-a81d97d10424	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-d8a6-30e4-0929aacd0304	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-d8a6-a373-13f9e30d6f5d	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-d8a6-3ab3-4eb792673bd8	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-d8a6-b3b1-420a3291addd	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-d8a6-57d0-3ca49cfd0aa0	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-d8a6-2a70-23bf215775b0	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3129 (class 0 OID 35331809)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5694-d8a3-7da9-289c255e14b1	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5694-d8a3-a42d-1cbb2c211af8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5694-d8a3-2ec9-51aca8685845	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5694-d8a3-356e-2534489a105b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5694-d8a3-d05b-e831058a7d1a	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5694-d8a3-7f89-9c24a88a85f1	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5694-d8a3-63da-f880eb1d2497	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5694-d8a3-102f-0ae43dbcb400	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5694-d8a4-9de9-49c24e1cf78a	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5694-d8a4-299b-58c92db1f354	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5694-d8a4-b271-e4895e96d69e	Abonma-read	Abonma - branje	t
00030000-5694-d8a4-d7e2-0569144ebbd7	Abonma-write	Abonma - spreminjanje	t
00030000-5694-d8a4-25ad-b8948c09e39d	Alternacija-read	Alternacija - branje	t
00030000-5694-d8a4-1ccd-592b8c54c0e1	Alternacija-write	Alternacija - spreminjanje	t
00030000-5694-d8a4-d87d-dd08a16cd66a	Arhivalija-read	Arhivalija - branje	t
00030000-5694-d8a4-fd88-869b73599638	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5694-d8a4-3ee4-5b90b7e24a05	AuthStorage-read	AuthStorage - branje	t
00030000-5694-d8a4-0716-c7518535781b	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5694-d8a4-347b-fb352a150ac6	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5694-d8a4-bf7f-435f6689e3cc	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5694-d8a4-0329-1dc4970a347a	Besedilo-read	Besedilo - branje	t
00030000-5694-d8a4-91c4-f237250dacf4	Besedilo-write	Besedilo - spreminjanje	t
00030000-5694-d8a4-828f-6c7504c351f0	Dodatek-read	Dodatek - branje	t
00030000-5694-d8a4-a86d-e3f4c52eeac2	Dodatek-write	Dodatek - spreminjanje	t
00030000-5694-d8a4-23bd-6e6ca6b93584	Dogodek-read	Dogodek - branje	t
00030000-5694-d8a4-7725-3b7c59f73919	Dogodek-write	Dogodek - spreminjanje	t
00030000-5694-d8a4-c512-09e91c01c7aa	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5694-d8a4-e156-e0a3bee17d21	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5694-d8a4-6e62-ea94c3ea56e8	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5694-d8a4-a418-eebb4e832926	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5694-d8a4-8afa-d177a1460207	DogodekTrait-read	DogodekTrait - branje	t
00030000-5694-d8a4-99ba-b470a5c12d60	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5694-d8a4-be95-3f853c7a19f0	DrugiVir-read	DrugiVir - branje	t
00030000-5694-d8a4-4b6c-d515a14a2610	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5694-d8a4-224a-d09d9f917a46	Drzava-read	Drzava - branje	t
00030000-5694-d8a4-ec43-1b8a3e579b87	Drzava-write	Drzava - spreminjanje	t
00030000-5694-d8a4-ac34-97f09256a995	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5694-d8a4-a0d3-33eb17dd72c7	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5694-d8a4-86d6-368a0cb92d6b	Funkcija-read	Funkcija - branje	t
00030000-5694-d8a4-be21-84c1173b2dd7	Funkcija-write	Funkcija - spreminjanje	t
00030000-5694-d8a4-9f06-c73ac1ab80d5	Gostovanje-read	Gostovanje - branje	t
00030000-5694-d8a4-2020-0383ca8e601d	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5694-d8a4-8a39-45a9953476ff	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5694-d8a4-b7a7-9cfd1afd5fd7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5694-d8a4-fa21-9788680f6594	Kupec-read	Kupec - branje	t
00030000-5694-d8a4-0fb3-78a3e7997162	Kupec-write	Kupec - spreminjanje	t
00030000-5694-d8a4-efd3-b2523da772aa	NacinPlacina-read	NacinPlacina - branje	t
00030000-5694-d8a4-e13d-1b394e7b59a4	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5694-d8a4-9a23-a3dcce6f3a40	Option-read	Option - branje	t
00030000-5694-d8a4-a25e-b9b83f91c59e	Option-write	Option - spreminjanje	t
00030000-5694-d8a4-99d0-b500120ea014	OptionValue-read	OptionValue - branje	t
00030000-5694-d8a4-974f-5db535428ba2	OptionValue-write	OptionValue - spreminjanje	t
00030000-5694-d8a4-9e3a-e963961800a2	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5694-d8a4-7799-860688d479e8	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5694-d8a4-1e06-c8ff00de338c	Oseba-read	Oseba - branje	t
00030000-5694-d8a4-7f70-c1ad43f09b22	Oseba-write	Oseba - spreminjanje	t
00030000-5694-d8a4-7d13-36589d4f2bdf	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5694-d8a4-fa96-4e295b659aa0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5694-d8a4-7a2d-5de4bbd1fedf	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5694-d8a4-8728-80e7ddcb7300	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5694-d8a4-0384-d6e47bb11208	Pogodba-read	Pogodba - branje	t
00030000-5694-d8a4-15f9-bfa4e9e75aff	Pogodba-write	Pogodba - spreminjanje	t
00030000-5694-d8a4-ed07-e78b96d2d3dd	Popa-read	Popa - branje	t
00030000-5694-d8a4-1179-c45c94c59f7b	Popa-write	Popa - spreminjanje	t
00030000-5694-d8a4-6ebd-3ab4872aad0b	Posta-read	Posta - branje	t
00030000-5694-d8a4-1ab4-ea37a5449b49	Posta-write	Posta - spreminjanje	t
00030000-5694-d8a4-8870-5b4f5ea3660d	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5694-d8a4-cbe1-c1c97a69acbe	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5694-d8a4-f1db-dbd39860f55c	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5694-d8a4-93af-cc21c56c7ec9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5694-d8a4-4ded-252b82ed6f2d	PostniNaslov-read	PostniNaslov - branje	t
00030000-5694-d8a4-629d-c09940c458fb	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5694-d8a4-9782-8ceea25fbcc9	Praznik-read	Praznik - branje	t
00030000-5694-d8a4-ee6b-e844c3e8d45d	Praznik-write	Praznik - spreminjanje	t
00030000-5694-d8a4-ec19-8f40ffdb58ff	Predstava-read	Predstava - branje	t
00030000-5694-d8a4-e35c-c596f9e53585	Predstava-write	Predstava - spreminjanje	t
00030000-5694-d8a4-ddb3-aecd0f56ab08	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5694-d8a4-b518-c95255721649	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5694-d8a4-6bfd-50e61ba86acd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5694-d8a4-d039-619d0a3e1b90	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5694-d8a4-0152-7a4649fa7b2c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5694-d8a4-7c88-69b9b9cfae5b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5694-d8a4-c80c-e2f598959d90	ProgramDela-read	ProgramDela - branje	t
00030000-5694-d8a4-bcec-19be65ac00f8	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5694-d8a4-81de-d681ecba56da	ProgramFestival-read	ProgramFestival - branje	t
00030000-5694-d8a4-32c1-8852c15846d6	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5694-d8a4-c013-eaa8818c20b3	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5694-d8a4-8d1d-fc3f5cbeb108	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5694-d8a4-05b7-da10382b1ed4	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5694-d8a4-b930-978d0953aaac	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5694-d8a4-d2ed-7e0a5e0b5bba	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5694-d8a4-a8ca-94c6392e294f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5694-d8a4-49fe-c8b84c9a4c21	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5694-d8a4-3742-bfdad3b78c0a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5694-d8a4-8df6-d21513be8655	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5694-d8a4-9d15-6c95234e69d6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5694-d8a4-a4bb-3556b1e480f1	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5694-d8a4-d6c6-82380a7f1a51	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5694-d8a4-e41a-ed391028cc59	ProgramRazno-read	ProgramRazno - branje	t
00030000-5694-d8a4-9103-e30d499518e4	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5694-d8a4-b486-54c09eb0a500	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5694-d8a4-509d-6a2ecabe76bb	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5694-d8a4-f98d-d51ff827852b	Prostor-read	Prostor - branje	t
00030000-5694-d8a4-d62a-a10214079284	Prostor-write	Prostor - spreminjanje	t
00030000-5694-d8a4-136b-d77c908c16f0	Racun-read	Racun - branje	t
00030000-5694-d8a4-2242-0aa7c48eff5d	Racun-write	Racun - spreminjanje	t
00030000-5694-d8a4-477d-cc190d680369	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5694-d8a4-45d8-67a204ed744c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5694-d8a4-e983-2465e568b939	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5694-d8a4-5860-66710bfd4523	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5694-d8a4-cd66-2856a2d332eb	Rekvizit-read	Rekvizit - branje	t
00030000-5694-d8a4-9a62-e79f4e165463	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5694-d8a4-cfe0-76ff826f383e	Revizija-read	Revizija - branje	t
00030000-5694-d8a4-06d0-3353e2e6e144	Revizija-write	Revizija - spreminjanje	t
00030000-5694-d8a4-4d7a-fcef530b1269	Rezervacija-read	Rezervacija - branje	t
00030000-5694-d8a4-ec90-9af1b1c3a2c8	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5694-d8a4-c277-6fb433e6d7be	SedezniRed-read	SedezniRed - branje	t
00030000-5694-d8a4-3432-a72cc11771b6	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5694-d8a4-019b-3a9236abf716	Sedez-read	Sedez - branje	t
00030000-5694-d8a4-42aa-4d8693e18602	Sedez-write	Sedez - spreminjanje	t
00030000-5694-d8a4-1376-bcba8d688d73	Sezona-read	Sezona - branje	t
00030000-5694-d8a4-5ddb-2692ce238009	Sezona-write	Sezona - spreminjanje	t
00030000-5694-d8a4-abe0-33a8de6f3f9d	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5694-d8a4-1241-1fb66c27710a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5694-d8a4-5ca3-211423640ff2	Telefonska-read	Telefonska - branje	t
00030000-5694-d8a4-0052-316bb163d8fc	Telefonska-write	Telefonska - spreminjanje	t
00030000-5694-d8a4-4e63-a8fb74646d93	TerminStoritve-read	TerminStoritve - branje	t
00030000-5694-d8a4-a6b3-ae8cb67dcb9c	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5694-d8a4-c49e-8b2706863862	TipDodatka-read	TipDodatka - branje	t
00030000-5694-d8a4-af42-eacf43f4d221	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5694-d8a4-d588-e7320d6d3a73	TipFunkcije-read	TipFunkcije - branje	t
00030000-5694-d8a4-f29f-2931744e4eff	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5694-d8a4-57b1-6fc840912ac6	TipPopa-read	TipPopa - branje	t
00030000-5694-d8a4-c8cd-0081e92a9258	TipPopa-write	TipPopa - spreminjanje	t
00030000-5694-d8a4-82cf-c230f72677f0	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5694-d8a4-345e-a608f7ebb1ca	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5694-d8a4-29d6-be124a884b1f	TipVaje-read	TipVaje - branje	t
00030000-5694-d8a4-2b2b-ed816b6325dd	TipVaje-write	TipVaje - spreminjanje	t
00030000-5694-d8a4-ff3c-1976be49ae10	Trr-read	Trr - branje	t
00030000-5694-d8a4-c282-7421b9ceded5	Trr-write	Trr - spreminjanje	t
00030000-5694-d8a4-c79e-928669405583	Uprizoritev-read	Uprizoritev - branje	t
00030000-5694-d8a4-ee83-c1876f72b591	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5694-d8a4-22ba-1c43733a3411	Vaja-read	Vaja - branje	t
00030000-5694-d8a4-35ed-49a4ac7593c9	Vaja-write	Vaja - spreminjanje	t
00030000-5694-d8a4-8341-7b514a6a677d	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5694-d8a4-2580-c825b1dba537	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5694-d8a4-a1f6-6ff2e41a4d8e	VrstaStroska-read	VrstaStroska - branje	t
00030000-5694-d8a4-fbaa-37eaa8ce62cf	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5694-d8a4-8d4e-655e0ca0df8e	Zaposlitev-read	Zaposlitev - branje	t
00030000-5694-d8a4-a004-cf910ca12c05	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5694-d8a4-4d0a-fe311847dd88	Zasedenost-read	Zasedenost - branje	t
00030000-5694-d8a4-4e5c-4c2c5f334ec4	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5694-d8a4-ac0a-633580a6f147	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5694-d8a4-5e80-7f1192ffae5f	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5694-d8a4-de59-e5a6b74de124	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5694-d8a4-1ed4-79041d85c5c9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5694-d8a4-cd12-c3dc0ed51d33	Job-read	Branje opravil - samo zase - branje	t
00030000-5694-d8a4-1723-14272ea2a029	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5694-d8a4-21e0-92d59a091d16	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5694-d8a4-ae03-a175788aeed4	Report-read	Report - branje	t
00030000-5694-d8a4-e85b-189ac4e5ba06	Report-write	Report - spreminjanje	t
00030000-5694-d8a4-b275-ff6d3c792be6	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5694-d8a4-046b-ed15e71beee8	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5694-d8a4-482c-a5ea8358e1e8	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5694-d8a4-b123-db4f57aef82d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5694-d8a4-02de-d1bec6d42b9f	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5694-d8a4-63cf-237e595afea8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5694-d8a4-a0be-7cc4834fcb06	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5694-d8a4-0918-b1b82c04a00c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-d8a4-ed76-f12fac913d79	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-d8a4-7810-4f1954bc172f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-d8a4-fda9-3cab48bcb6b2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-d8a4-758b-8b13425b0e2c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5694-d8a4-9cd3-ad44dfb62d51	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5694-d8a4-ffcc-e8d87a370d77	Datoteka-write	Datoteka - spreminjanje	t
00030000-5694-d8a4-6a36-e4816ff2a58b	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3131 (class 0 OID 35331828)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5694-d8a4-f640-f3ee3bded092	00030000-5694-d8a3-a42d-1cbb2c211af8
00020000-5694-d8a4-f640-f3ee3bded092	00030000-5694-d8a3-7da9-289c255e14b1
00020000-5694-d8a4-0359-fe4b814a6658	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-c10c-b976e4f4e8a0	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-09bd-f99c2ba62556	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-09bd-f99c2ba62556	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-09bd-f99c2ba62556	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-09bd-f99c2ba62556	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-09bd-f99c2ba62556	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-09bd-f99c2ba62556	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a4-a004-cf910ca12c05
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-e2d6-960c8a570bb4	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-8158-bf5acd3537da	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-8158-bf5acd3537da	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-8158-bf5acd3537da	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-5efc-5b0f897bb4de	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-ca6d-046e0c2227de	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-ca6d-046e0c2227de	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-ca6d-046e0c2227de	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-ca6d-046e0c2227de	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-0e0e-e660487693f7	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-e8e0-7d88038f7a5c	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-1179-c45c94c59f7b
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-b7a7-9cfd1afd5fd7
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-7c88-69b9b9cfae5b
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-853c-084f95f571e9	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-407b-05af83db003d	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-2a4b-55fe19bfa0de	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-2a4b-55fe19bfa0de	00030000-5694-d8a4-c8cd-0081e92a9258
00020000-5694-d8a4-b05a-cc81ad8de044	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-6a84-a0709bcc7dc6	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-6a84-a0709bcc7dc6	00030000-5694-d8a4-1ab4-ea37a5449b49
00020000-5694-d8a4-e51d-79ff89c8bf7f	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-9fdd-879881a42f3a	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-9fdd-879881a42f3a	00030000-5694-d8a4-ec43-1b8a3e579b87
00020000-5694-d8a4-053c-5e7bea0c1043	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-a6ac-daca1323d69a	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-a6ac-daca1323d69a	00030000-5694-d8a4-1ed4-79041d85c5c9
00020000-5694-d8a4-023a-676712b947da	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-4c82-c4c55ffed21f	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-4c82-c4c55ffed21f	00030000-5694-d8a4-5e80-7f1192ffae5f
00020000-5694-d8a4-8a9a-b252943ee337	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-1a63-9efae134c246	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-1a63-9efae134c246	00030000-5694-d8a4-d7e2-0569144ebbd7
00020000-5694-d8a4-19d0-99cdbeb3e1ee	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-9175-67c14e149d6a	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-9175-67c14e149d6a	00030000-5694-d8a4-d62a-a10214079284
00020000-5694-d8a4-9175-67c14e149d6a	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-9175-67c14e149d6a	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-9175-67c14e149d6a	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a4-9175-67c14e149d6a	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-dba3-92ce1f1951b5	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-dba3-92ce1f1951b5	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-dba3-92ce1f1951b5	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-122c-e988bdf9e057	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-122c-e988bdf9e057	00030000-5694-d8a4-fbaa-37eaa8ce62cf
00020000-5694-d8a4-cb5b-01824c167c04	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-7799-860688d479e8
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-a330-7cadec322058	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-ea10-c8a9a43af069	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-ea10-c8a9a43af069	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-ea10-c8a9a43af069	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-ea10-c8a9a43af069	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-ea10-c8a9a43af069	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-b961-3e1125171280	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-b961-3e1125171280	00030000-5694-d8a4-2b2b-ed816b6325dd
00020000-5694-d8a4-5f2d-04eb34722533	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a3-63da-f880eb1d2497
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a3-102f-0ae43dbcb400
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-c80c-e2f598959d90
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-bcec-19be65ac00f8
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-81de-d681ecba56da
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-32c1-8852c15846d6
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-c013-eaa8818c20b3
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-8d1d-fc3f5cbeb108
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-05b7-da10382b1ed4
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-b930-978d0953aaac
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-d2ed-7e0a5e0b5bba
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-a8ca-94c6392e294f
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-49fe-c8b84c9a4c21
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-3742-bfdad3b78c0a
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-8df6-d21513be8655
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-9d15-6c95234e69d6
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-a4bb-3556b1e480f1
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-d6c6-82380a7f1a51
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-e41a-ed391028cc59
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-9103-e30d499518e4
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-b486-54c09eb0a500
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-509d-6a2ecabe76bb
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-d039-619d0a3e1b90
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-4b6c-d515a14a2610
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-cbe1-c1c97a69acbe
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-1723-14272ea2a029
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-be95-3f853c7a19f0
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-6bfd-50e61ba86acd
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-8870-5b4f5ea3660d
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-cd12-c3dc0ed51d33
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-5b46-4a4eb2949821	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-c80c-e2f598959d90
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-81de-d681ecba56da
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-c013-eaa8818c20b3
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-05b7-da10382b1ed4
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-d2ed-7e0a5e0b5bba
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-49fe-c8b84c9a4c21
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-8df6-d21513be8655
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-a4bb-3556b1e480f1
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-e41a-ed391028cc59
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-b486-54c09eb0a500
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-6bfd-50e61ba86acd
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-be95-3f853c7a19f0
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-8870-5b4f5ea3660d
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-cd12-c3dc0ed51d33
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-97d2-ac4dc18dbf78	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-299b-58c92db1f354
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-2d47-56f186411dec	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-52fd-b26c65ec606d	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-5de1-d44a7190cbab	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-15f9-bfa4e9e75aff
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-c826-5ca2d05e5e65	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-94ff-d6ce6e3e5f98	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-ff97-dcb863691c35	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-ac92-26e95918450f	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-ac92-26e95918450f	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a4-ac92-26e95918450f	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-ac92-26e95918450f	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-f970-7ff1117320c2	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-f970-7ff1117320c2	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-be95-3f853c7a19f0
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-4b6c-d515a14a2610
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-299b-58c92db1f354
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-cd12-c3dc0ed51d33
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-1723-14272ea2a029
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-15f9-bfa4e9e75aff
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-8870-5b4f5ea3660d
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-cbe1-c1c97a69acbe
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-6bfd-50e61ba86acd
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-d039-619d0a3e1b90
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a3-63da-f880eb1d2497
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-c80c-e2f598959d90
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a3-102f-0ae43dbcb400
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-bcec-19be65ac00f8
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-81de-d681ecba56da
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-32c1-8852c15846d6
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-c013-eaa8818c20b3
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-8d1d-fc3f5cbeb108
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-05b7-da10382b1ed4
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-b930-978d0953aaac
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-d2ed-7e0a5e0b5bba
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-a8ca-94c6392e294f
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-49fe-c8b84c9a4c21
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-3742-bfdad3b78c0a
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-8df6-d21513be8655
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-9d15-6c95234e69d6
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-a4bb-3556b1e480f1
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-d6c6-82380a7f1a51
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-e41a-ed391028cc59
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-9103-e30d499518e4
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-b486-54c09eb0a500
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-509d-6a2ecabe76bb
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-95f4-6056c394b701	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-80ce-9bd17155bfc6	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-299b-58c92db1f354
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-80c4-593593833fb9	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-be95-3f853c7a19f0
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-4b6c-d515a14a2610
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-299b-58c92db1f354
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-cd12-c3dc0ed51d33
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-1723-14272ea2a029
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-b7a7-9cfd1afd5fd7
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-15f9-bfa4e9e75aff
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-1179-c45c94c59f7b
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-8870-5b4f5ea3660d
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-cbe1-c1c97a69acbe
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-6bfd-50e61ba86acd
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-d039-619d0a3e1b90
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-7c88-69b9b9cfae5b
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a3-63da-f880eb1d2497
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-c80c-e2f598959d90
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a3-102f-0ae43dbcb400
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-bcec-19be65ac00f8
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-81de-d681ecba56da
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-32c1-8852c15846d6
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-c013-eaa8818c20b3
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-8d1d-fc3f5cbeb108
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-05b7-da10382b1ed4
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-b930-978d0953aaac
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-d2ed-7e0a5e0b5bba
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-a8ca-94c6392e294f
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-49fe-c8b84c9a4c21
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-3742-bfdad3b78c0a
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-8df6-d21513be8655
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-9d15-6c95234e69d6
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-a4bb-3556b1e480f1
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-d6c6-82380a7f1a51
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-e41a-ed391028cc59
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-9103-e30d499518e4
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-b486-54c09eb0a500
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-509d-6a2ecabe76bb
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-a004-cf910ca12c05
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-f0b3-3898ce39edee	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-299b-58c92db1f354
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-b7a7-9cfd1afd5fd7
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-1179-c45c94c59f7b
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-7c88-69b9b9cfae5b
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-a004-cf910ca12c05
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-b21d-b482d9f7655d	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-8290-989ea849ecb0	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-be95-3f853c7a19f0
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-4b6c-d515a14a2610
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-cd12-c3dc0ed51d33
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-1723-14272ea2a029
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-b7a7-9cfd1afd5fd7
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-7799-860688d479e8
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-15f9-bfa4e9e75aff
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-1179-c45c94c59f7b
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-8870-5b4f5ea3660d
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-cbe1-c1c97a69acbe
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-6bfd-50e61ba86acd
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-d039-619d0a3e1b90
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-7c88-69b9b9cfae5b
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a3-63da-f880eb1d2497
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-c80c-e2f598959d90
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a3-102f-0ae43dbcb400
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-bcec-19be65ac00f8
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-81de-d681ecba56da
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-32c1-8852c15846d6
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-c013-eaa8818c20b3
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-8d1d-fc3f5cbeb108
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-05b7-da10382b1ed4
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-b930-978d0953aaac
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-d2ed-7e0a5e0b5bba
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-a8ca-94c6392e294f
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-49fe-c8b84c9a4c21
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-3742-bfdad3b78c0a
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-8df6-d21513be8655
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-9d15-6c95234e69d6
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-a4bb-3556b1e480f1
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-d6c6-82380a7f1a51
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-e41a-ed391028cc59
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-9103-e30d499518e4
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-b486-54c09eb0a500
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-509d-6a2ecabe76bb
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-fbaa-37eaa8ce62cf
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-a004-cf910ca12c05
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a4-f903-3f42f725e13f	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-7da9-289c255e14b1
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-a42d-1cbb2c211af8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b271-e4895e96d69e
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d7e2-0569144ebbd7
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d87d-dd08a16cd66a
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-fd88-869b73599638
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-3ee4-5b90b7e24a05
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0716-c7518535781b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-347b-fb352a150ac6
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-bf7f-435f6689e3cc
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0329-1dc4970a347a
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-91c4-f237250dacf4
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-23bd-6e6ca6b93584
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-356e-2534489a105b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c512-09e91c01c7aa
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-e156-e0a3bee17d21
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-6e62-ea94c3ea56e8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a418-eebb4e832926
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8afa-d177a1460207
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-99ba-b470a5c12d60
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7725-3b7c59f73919
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-be95-3f853c7a19f0
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-4b6c-d515a14a2610
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-224a-d09d9f917a46
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ec43-1b8a3e579b87
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ac34-97f09256a995
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a0d3-33eb17dd72c7
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-299b-58c92db1f354
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9f06-c73ac1ab80d5
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-2020-0383ca8e601d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-21e0-92d59a091d16
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-cd12-c3dc0ed51d33
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1723-14272ea2a029
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8a39-45a9953476ff
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b7a7-9cfd1afd5fd7
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-fa21-9788680f6594
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0fb3-78a3e7997162
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a0be-7cc4834fcb06
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-63cf-237e595afea8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-046b-ed15e71beee8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-482c-a5ea8358e1e8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b123-db4f57aef82d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-02de-d1bec6d42b9f
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-efd3-b2523da772aa
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-e13d-1b394e7b59a4
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9a23-a3dcce6f3a40
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-99d0-b500120ea014
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-974f-5db535428ba2
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a25e-b9b83f91c59e
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9e3a-e963961800a2
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7799-860688d479e8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7d13-36589d4f2bdf
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-fa96-4e295b659aa0
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7a2d-5de4bbd1fedf
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8728-80e7ddcb7300
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-15f9-bfa4e9e75aff
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1179-c45c94c59f7b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-6ebd-3ab4872aad0b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8870-5b4f5ea3660d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-cbe1-c1c97a69acbe
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-f1db-dbd39860f55c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-93af-cc21c56c7ec9
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1ab4-ea37a5449b49
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9782-8ceea25fbcc9
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ee6b-e844c3e8d45d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ec19-8f40ffdb58ff
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-e35c-c596f9e53585
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ddb3-aecd0f56ab08
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b518-c95255721649
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-6bfd-50e61ba86acd
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d039-619d0a3e1b90
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0152-7a4649fa7b2c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7c88-69b9b9cfae5b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-63da-f880eb1d2497
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c80c-e2f598959d90
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-102f-0ae43dbcb400
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-bcec-19be65ac00f8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-81de-d681ecba56da
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-32c1-8852c15846d6
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c013-eaa8818c20b3
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8d1d-fc3f5cbeb108
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-05b7-da10382b1ed4
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b930-978d0953aaac
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d2ed-7e0a5e0b5bba
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a8ca-94c6392e294f
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-49fe-c8b84c9a4c21
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-3742-bfdad3b78c0a
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8df6-d21513be8655
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9d15-6c95234e69d6
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a4bb-3556b1e480f1
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d6c6-82380a7f1a51
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-e41a-ed391028cc59
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9103-e30d499518e4
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b486-54c09eb0a500
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-509d-6a2ecabe76bb
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-f98d-d51ff827852b
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d62a-a10214079284
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-136b-d77c908c16f0
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-2242-0aa7c48eff5d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-477d-cc190d680369
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-45d8-67a204ed744c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-e983-2465e568b939
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-5860-66710bfd4523
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-cd66-2856a2d332eb
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9a62-e79f4e165463
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ae03-a175788aeed4
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-e85b-189ac4e5ba06
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-cfe0-76ff826f383e
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-06d0-3353e2e6e144
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-4d7a-fcef530b1269
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ec90-9af1b1c3a2c8
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c277-6fb433e6d7be
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-3432-a72cc11771b6
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-019b-3a9236abf716
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-42aa-4d8693e18602
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1376-bcba8d688d73
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-5ddb-2692ce238009
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-b275-ff6d3c792be6
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-4e63-a8fb74646d93
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a3-2ec9-51aca8685845
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a6b3-ae8cb67dcb9c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-d588-e7320d6d3a73
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-f29f-2931744e4eff
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-57b1-6fc840912ac6
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c8cd-0081e92a9258
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-82cf-c230f72677f0
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-345e-a608f7ebb1ca
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-29d6-be124a884b1f
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-2b2b-ed816b6325dd
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-22ba-1c43733a3411
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-35ed-49a4ac7593c9
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8341-7b514a6a677d
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-2580-c825b1dba537
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a1f6-6ff2e41a4d8e
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-fbaa-37eaa8ce62cf
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-9cd3-ad44dfb62d51
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-758b-8b13425b0e2c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-a004-cf910ca12c05
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-4d0a-fe311847dd88
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-4e5c-4c2c5f334ec4
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-ac0a-633580a6f147
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-5e80-7f1192ffae5f
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-de59-e5a6b74de124
00020000-5694-d8a6-904a-3867998363c6	00030000-5694-d8a4-1ed4-79041d85c5c9
00020000-5694-d8a6-aca8-2a2718e600c7	00030000-5694-d8a4-fda9-3cab48bcb6b2
00020000-5694-d8a6-d486-a1a20b5cc19a	00030000-5694-d8a4-7810-4f1954bc172f
00020000-5694-d8a6-6a28-885b37e0b6b8	00030000-5694-d8a4-ee83-c1876f72b591
00020000-5694-d8a6-42ed-1c6c836687ad	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a6-70fa-255792361eee	00030000-5694-d8a4-482c-a5ea8358e1e8
00020000-5694-d8a6-ce3a-8ae5aa0fdac9	00030000-5694-d8a4-b123-db4f57aef82d
00020000-5694-d8a6-5776-9d11ec87b7e2	00030000-5694-d8a4-02de-d1bec6d42b9f
00020000-5694-d8a6-2512-b19e29a2cd4a	00030000-5694-d8a4-046b-ed15e71beee8
00020000-5694-d8a6-c546-7a5a20905ca7	00030000-5694-d8a4-a0be-7cc4834fcb06
00020000-5694-d8a6-2776-f70808df4449	00030000-5694-d8a4-63cf-237e595afea8
00020000-5694-d8a6-9bfd-b2fcd8a6a18e	00030000-5694-d8a4-ed76-f12fac913d79
00020000-5694-d8a6-4b0d-bd34bfd748d2	00030000-5694-d8a4-0918-b1b82c04a00c
00020000-5694-d8a6-0755-047025136591	00030000-5694-d8a4-1e06-c8ff00de338c
00020000-5694-d8a6-c098-ac8e44e874c2	00030000-5694-d8a4-7f70-c1ad43f09b22
00020000-5694-d8a6-f692-42157175a099	00030000-5694-d8a3-d05b-e831058a7d1a
00020000-5694-d8a6-454a-b189e15b053b	00030000-5694-d8a3-7f89-9c24a88a85f1
00020000-5694-d8a6-8943-387d8239fad7	00030000-5694-d8a4-ffcc-e8d87a370d77
00020000-5694-d8a6-44d0-9d168c205d01	00030000-5694-d8a4-6a36-e4816ff2a58b
00020000-5694-d8a6-df32-b5f46e4f952d	00030000-5694-d8a4-ed07-e78b96d2d3dd
00020000-5694-d8a6-df32-b5f46e4f952d	00030000-5694-d8a4-1179-c45c94c59f7b
00020000-5694-d8a6-df32-b5f46e4f952d	00030000-5694-d8a4-c79e-928669405583
00020000-5694-d8a6-8c43-728cab6774ab	00030000-5694-d8a4-ff3c-1976be49ae10
00020000-5694-d8a6-8323-a0ef20e86fa8	00030000-5694-d8a4-c282-7421b9ceded5
00020000-5694-d8a6-2afe-a4556e17ee2a	00030000-5694-d8a4-b275-ff6d3c792be6
00020000-5694-d8a6-74cd-d2063a42569f	00030000-5694-d8a4-5ca3-211423640ff2
00020000-5694-d8a6-35df-2ba3195bb50f	00030000-5694-d8a4-0052-316bb163d8fc
00020000-5694-d8a6-e697-260bb3b70536	00030000-5694-d8a4-4ded-252b82ed6f2d
00020000-5694-d8a6-a9c9-9ee786712e48	00030000-5694-d8a4-629d-c09940c458fb
00020000-5694-d8a6-be95-db54015ffd5b	00030000-5694-d8a4-8d4e-655e0ca0df8e
00020000-5694-d8a6-9fb6-93ad27b8d5ec	00030000-5694-d8a4-a004-cf910ca12c05
00020000-5694-d8a6-0324-7a12ffd35147	00030000-5694-d8a4-0384-d6e47bb11208
00020000-5694-d8a6-081e-a428efa944e1	00030000-5694-d8a4-15f9-bfa4e9e75aff
00020000-5694-d8a6-44b5-76b6ca893496	00030000-5694-d8a4-abe0-33a8de6f3f9d
00020000-5694-d8a6-15eb-96f512641be6	00030000-5694-d8a4-1241-1fb66c27710a
00020000-5694-d8a6-1b23-54697d1bfb91	00030000-5694-d8a4-25ad-b8948c09e39d
00020000-5694-d8a6-8aeb-795e5dfe07ff	00030000-5694-d8a4-1ccd-592b8c54c0e1
00020000-5694-d8a6-9a72-a122387c76e9	00030000-5694-d8a4-9de9-49c24e1cf78a
00020000-5694-d8a6-2d13-d2a44aa0bf64	00030000-5694-d8a4-86d6-368a0cb92d6b
00020000-5694-d8a6-01a5-5e1b76817c01	00030000-5694-d8a4-be21-84c1173b2dd7
00020000-5694-d8a6-6a77-f60556741088	00030000-5694-d8a4-299b-58c92db1f354
\.


--
-- TOC entry 3170 (class 0 OID 35332235)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 35332269)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35332402)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5694-d8a6-ae48-878cd757ec1f	00090000-5694-d8a6-8eb1-ead926542f45	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5694-d8a6-71dc-5b53e702a052	00090000-5694-d8a6-aaee-e8638421ea7d	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5694-d8a6-939c-782ed3773c82	00090000-5694-d8a6-9865-630e59124c80	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5694-d8a6-4b20-bf76765d012f	00090000-5694-d8a6-75ef-cf9c2292d303	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3139 (class 0 OID 35331910)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5694-d8a6-6352-303751841c8a	\N	00040000-5694-d8a3-b153-9cabad5972c0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-9d17-284ec7251491	\N	00040000-5694-d8a3-b153-9cabad5972c0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5694-d8a6-ea4b-35d79ec3d565	\N	00040000-5694-d8a3-b153-9cabad5972c0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-0f18-973ecbc3c154	\N	00040000-5694-d8a3-b153-9cabad5972c0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-0f78-64c62988e492	\N	00040000-5694-d8a3-b153-9cabad5972c0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-6933-c94431256202	\N	00040000-5694-d8a3-c416-f389a71ea34a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-ef08-9726e63436eb	\N	00040000-5694-d8a3-9a43-1a0388a91fb2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-e3de-e3fe71a31d4b	\N	00040000-5694-d8a3-06df-a45a9ed00c99	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a6-ab7d-3bc0941b25a7	\N	00040000-5694-d8a3-4d0f-9be24ebebab2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-d8a8-7923-bb760e8062de	\N	00040000-5694-d8a3-b153-9cabad5972c0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3142 (class 0 OID 35331955)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5694-d8a3-5990-b9649fc411ff	8341	Adlešiči
00050000-5694-d8a3-77b9-02f192ae3880	5270	Ajdovščina
00050000-5694-d8a3-7d2c-07452b404d90	6280	Ankaran/Ancarano
00050000-5694-d8a3-43ed-e167bac9025d	9253	Apače
00050000-5694-d8a3-f99e-882998bfff25	8253	Artiče
00050000-5694-d8a3-4522-369d94370896	4275	Begunje na Gorenjskem
00050000-5694-d8a3-c1ca-010f7f3a30f2	1382	Begunje pri Cerknici
00050000-5694-d8a3-67e8-ae1ac19be07a	9231	Beltinci
00050000-5694-d8a3-5d33-39e433efbec8	2234	Benedikt
00050000-5694-d8a3-d2e5-52d9ecdc8fd3	2345	Bistrica ob Dravi
00050000-5694-d8a3-b4c9-1d3e479ef8cc	3256	Bistrica ob Sotli
00050000-5694-d8a3-cffe-753f05bbdb1e	8259	Bizeljsko
00050000-5694-d8a3-07e7-b4b85046b425	1223	Blagovica
00050000-5694-d8a3-eaf3-7fdab039e6c2	8283	Blanca
00050000-5694-d8a3-4ac6-be31b88a244a	4260	Bled
00050000-5694-d8a3-e997-e559773e384a	4273	Blejska Dobrava
00050000-5694-d8a3-d366-50263c380c86	9265	Bodonci
00050000-5694-d8a3-074a-e7a169e774f4	9222	Bogojina
00050000-5694-d8a3-ecf1-cfdf4fe7ad7d	4263	Bohinjska Bela
00050000-5694-d8a3-357f-6afcd45c500e	4264	Bohinjska Bistrica
00050000-5694-d8a3-aa9c-ba2d107df159	4265	Bohinjsko jezero
00050000-5694-d8a3-dd75-b7f784cd3ed7	1353	Borovnica
00050000-5694-d8a3-0b4c-5b99b290535a	8294	Boštanj
00050000-5694-d8a3-b7fe-221ab164d545	5230	Bovec
00050000-5694-d8a3-8b80-a439a0c0d6cf	5295	Branik
00050000-5694-d8a3-5687-6483833b59c6	3314	Braslovče
00050000-5694-d8a3-922a-f16ae962cc7e	5223	Breginj
00050000-5694-d8a3-8c00-ab2d9a713f7c	8280	Brestanica
00050000-5694-d8a3-f166-6f10b339f817	2354	Bresternica
00050000-5694-d8a3-f343-5d00ba66587a	4243	Brezje
00050000-5694-d8a3-d953-7dac2092676f	1351	Brezovica pri Ljubljani
00050000-5694-d8a3-c54b-557a4f85d2c8	8250	Brežice
00050000-5694-d8a3-4382-8482c087f400	4210	Brnik - Aerodrom
00050000-5694-d8a3-0039-b216962c3861	8321	Brusnice
00050000-5694-d8a3-b760-d8077f0a3d85	3255	Buče
00050000-5694-d8a3-8a65-767203035d76	8276	Bučka 
00050000-5694-d8a3-8d88-5c3b4165dcd9	9261	Cankova
00050000-5694-d8a3-294b-df65785ca2e4	3000	Celje 
00050000-5694-d8a3-c4bc-a6cebb3dd561	3001	Celje - poštni predali
00050000-5694-d8a3-1e55-a260df2cda91	4207	Cerklje na Gorenjskem
00050000-5694-d8a3-a83f-15208ec7c026	8263	Cerklje ob Krki
00050000-5694-d8a3-ffab-390ff47a39c9	1380	Cerknica
00050000-5694-d8a3-3a00-649909c2d34f	5282	Cerkno
00050000-5694-d8a3-d204-c91da7a1e85f	2236	Cerkvenjak
00050000-5694-d8a3-dfd3-cf0b55d7650f	2215	Ceršak
00050000-5694-d8a3-2249-7057b3b0f6f7	2326	Cirkovce
00050000-5694-d8a3-f151-eb0901070cd2	2282	Cirkulane
00050000-5694-d8a3-f3df-f667c9c845e2	5273	Col
00050000-5694-d8a3-e118-83cb56e06602	8251	Čatež ob Savi
00050000-5694-d8a3-8862-08dd28f7cb83	1413	Čemšenik
00050000-5694-d8a3-0dc1-9a40221dd6e2	5253	Čepovan
00050000-5694-d8a3-06b1-b59647b8cf88	9232	Črenšovci
00050000-5694-d8a3-ff27-5891650dcae7	2393	Črna na Koroškem
00050000-5694-d8a3-5d44-09f827ec5eb3	6275	Črni Kal
00050000-5694-d8a3-65df-607e25f1599e	5274	Črni Vrh nad Idrijo
00050000-5694-d8a3-fb38-fb226aa82e5e	5262	Črniče
00050000-5694-d8a3-032c-934a6dbf3b27	8340	Črnomelj
00050000-5694-d8a3-7093-cf8f2f7b8b98	6271	Dekani
00050000-5694-d8a3-ec1a-0d9be3df728d	5210	Deskle
00050000-5694-d8a3-5949-3be867d6d2cd	2253	Destrnik
00050000-5694-d8a3-41aa-55a5fcba8cb5	6215	Divača
00050000-5694-d8a3-dccd-b688582928b8	1233	Dob
00050000-5694-d8a3-dd96-f34d95ebb94e	3224	Dobje pri Planini
00050000-5694-d8a3-b457-9268fa7fc66b	8257	Dobova
00050000-5694-d8a3-da6d-b97ed66d51a7	1423	Dobovec
00050000-5694-d8a3-e82c-0d5e487daa8f	5263	Dobravlje
00050000-5694-d8a3-355e-a81d9225e4f1	3204	Dobrna
00050000-5694-d8a3-c90a-f8cc09eeced6	8211	Dobrnič
00050000-5694-d8a3-e55b-290f51626276	1356	Dobrova
00050000-5694-d8a3-ab2e-b562e9523a40	9223	Dobrovnik/Dobronak 
00050000-5694-d8a3-9c61-259bc61a2cb1	5212	Dobrovo v Brdih
00050000-5694-d8a3-a417-9dbf7d719efa	1431	Dol pri Hrastniku
00050000-5694-d8a3-6702-6ee2f4bb9f48	1262	Dol pri Ljubljani
00050000-5694-d8a3-3258-22789f3eea62	1273	Dole pri Litiji
00050000-5694-d8a3-543b-7a633d35ba67	1331	Dolenja vas
00050000-5694-d8a3-2664-b58fa7b02c33	8350	Dolenjske Toplice
00050000-5694-d8a3-7b2c-7f9929f2565d	1230	Domžale
00050000-5694-d8a3-9087-2cc566c947b1	2252	Dornava
00050000-5694-d8a3-f42d-92a3ef42c869	5294	Dornberk
00050000-5694-d8a3-38d2-72f91159fcec	1319	Draga
00050000-5694-d8a3-7d07-20dc0d007feb	8343	Dragatuš
00050000-5694-d8a3-c6ed-b126e35cadca	3222	Dramlje
00050000-5694-d8a3-4a2a-3b22f592ba46	2370	Dravograd
00050000-5694-d8a3-5851-bf43dc9e9d11	4203	Duplje
00050000-5694-d8a3-a645-aea95084875b	6221	Dutovlje
00050000-5694-d8a3-a400-d337aa0a15d3	8361	Dvor
00050000-5694-d8a3-271f-0955d0cfeac5	2343	Fala
00050000-5694-d8a3-a548-6dcc7a66687d	9208	Fokovci
00050000-5694-d8a3-7faa-e36fcb6ad020	2313	Fram
00050000-5694-d8a3-73a7-83c22b972ceb	3213	Frankolovo
00050000-5694-d8a3-927a-ba483de8d43d	1274	Gabrovka
00050000-5694-d8a3-2d0c-3da515260947	8254	Globoko
00050000-5694-d8a3-ec44-f5fdd68db6ab	5275	Godovič
00050000-5694-d8a3-c998-7427bca85e4c	4204	Golnik
00050000-5694-d8a3-5313-48505bdbe669	3303	Gomilsko
00050000-5694-d8a3-4267-9bf24fd3784e	4224	Gorenja vas
00050000-5694-d8a3-d97a-b4143d9f9297	3263	Gorica pri Slivnici
00050000-5694-d8a3-b9f9-2967669fd85d	2272	Gorišnica
00050000-5694-d8a3-506e-b0e3e98f4d00	9250	Gornja Radgona
00050000-5694-d8a3-9538-596d1d68de10	3342	Gornji Grad
00050000-5694-d8a3-1042-8a6508eafd25	4282	Gozd Martuljek
00050000-5694-d8a3-0c2b-5754e8dce57a	6272	Gračišče
00050000-5694-d8a3-b117-84e61bd0ed2d	9264	Grad
00050000-5694-d8a3-97c9-00ff9496d347	8332	Gradac
00050000-5694-d8a3-baf1-40d9e0e35578	1384	Grahovo
00050000-5694-d8a3-bffb-d8b424517c90	5242	Grahovo ob Bači
00050000-5694-d8a3-cdf3-684ede53fc8d	5251	Grgar
00050000-5694-d8a3-ea51-cc69dd6a8683	3302	Griže
00050000-5694-d8a3-868e-1f331299b866	3231	Grobelno
00050000-5694-d8a3-e4df-00aa9ff0fd4b	1290	Grosuplje
00050000-5694-d8a3-0e7f-d10ec9ca878d	2288	Hajdina
00050000-5694-d8a3-dc15-168dea8f31b1	8362	Hinje
00050000-5694-d8a3-b0da-a4f1eebe6029	2311	Hoče
00050000-5694-d8a3-76e9-a6a77cb1aa09	9205	Hodoš/Hodos
00050000-5694-d8a3-0311-7d740b8bc982	1354	Horjul
00050000-5694-d8a3-bcc5-e54908c37c3a	1372	Hotedršica
00050000-5694-d8a3-beba-9132243a2fba	1430	Hrastnik
00050000-5694-d8a3-4449-a5a19e5a4f1a	6225	Hruševje
00050000-5694-d8a3-afa2-02fc3cfaa99c	4276	Hrušica
00050000-5694-d8a3-32d3-513a0373cb90	5280	Idrija
00050000-5694-d8a3-197d-fe05634e3b36	1292	Ig
00050000-5694-d8a3-94ea-c18e3e644c7a	6250	Ilirska Bistrica
00050000-5694-d8a3-d837-ed4670c1df22	6251	Ilirska Bistrica-Trnovo
00050000-5694-d8a3-1d2c-c3ae3b91840b	1295	Ivančna Gorica
00050000-5694-d8a3-55de-2d924d282b7a	2259	Ivanjkovci
00050000-5694-d8a3-08c7-006583a0299f	1411	Izlake
00050000-5694-d8a3-5c77-b02a8e29038b	6310	Izola/Isola
00050000-5694-d8a3-1469-25db3e10f66b	2222	Jakobski Dol
00050000-5694-d8a3-d9e5-32321f5dd3ed	2221	Jarenina
00050000-5694-d8a3-5392-e1912faf8ba5	6254	Jelšane
00050000-5694-d8a3-8d82-5ab767a67515	4270	Jesenice
00050000-5694-d8a3-b4d2-21aef69fa7c4	8261	Jesenice na Dolenjskem
00050000-5694-d8a3-0dd9-a12fd5be22d7	3273	Jurklošter
00050000-5694-d8a3-1b27-df87dbdded7c	2223	Jurovski Dol
00050000-5694-d8a3-32b5-5713f9982dc2	2256	Juršinci
00050000-5694-d8a3-8d48-dd803c779f73	5214	Kal nad Kanalom
00050000-5694-d8a3-5af1-14bcc0825e2a	3233	Kalobje
00050000-5694-d8a3-e94d-bd93312d0129	4246	Kamna Gorica
00050000-5694-d8a3-2026-bc7b827afec2	2351	Kamnica
00050000-5694-d8a3-460f-ba82d797750b	1241	Kamnik
00050000-5694-d8a3-b485-3087ebb85dba	5213	Kanal
00050000-5694-d8a3-a055-75c46abda1a0	8258	Kapele
00050000-5694-d8a3-5973-4e3f0a77cd69	2362	Kapla
00050000-5694-d8a3-413b-441529218531	2325	Kidričevo
00050000-5694-d8a3-c391-f38608de94a0	1412	Kisovec
00050000-5694-d8a3-c014-20b6d5b395ea	6253	Knežak
00050000-5694-d8a3-9ccf-024ad545375c	5222	Kobarid
00050000-5694-d8a3-4ab5-f21193db31f4	9227	Kobilje
00050000-5694-d8a3-9e71-3dd50f41de46	1330	Kočevje
00050000-5694-d8a3-88a0-6156d50304bd	1338	Kočevska Reka
00050000-5694-d8a3-6ad5-fd20e90e50ae	2276	Kog
00050000-5694-d8a3-7318-fc0519cd5ad3	5211	Kojsko
00050000-5694-d8a3-1601-4190a9099e8f	6223	Komen
00050000-5694-d8a3-0219-00a3c3f5b2f1	1218	Komenda
00050000-5694-d8a3-b254-2f8471e2c195	6000	Koper/Capodistria 
00050000-5694-d8a3-d2d8-deb00fffc6e6	6001	Koper/Capodistria - poštni predali
00050000-5694-d8a3-35c7-b202dfc59288	8282	Koprivnica
00050000-5694-d8a3-6c10-c60c2f2d4a4a	5296	Kostanjevica na Krasu
00050000-5694-d8a3-e2d5-2ded6b0d377b	8311	Kostanjevica na Krki
00050000-5694-d8a3-fb15-65355cf624cf	1336	Kostel
00050000-5694-d8a3-fb8f-92216bbe6379	6256	Košana
00050000-5694-d8a3-b609-fcdc8254f60c	2394	Kotlje
00050000-5694-d8a3-3fca-79e184b1de0a	6240	Kozina
00050000-5694-d8a3-0c81-e46337072103	3260	Kozje
00050000-5694-d8a3-9bd1-739b52e0b3e7	4000	Kranj 
00050000-5694-d8a3-0956-ff4047d084ed	4001	Kranj - poštni predali
00050000-5694-d8a3-a8cb-51fe343a615b	4280	Kranjska Gora
00050000-5694-d8a3-87cd-55b8f284ab69	1281	Kresnice
00050000-5694-d8a3-75a6-80d6536c35fb	4294	Križe
00050000-5694-d8a3-676d-a7a0d532d526	9206	Križevci
00050000-5694-d8a3-8b72-77613d648ed7	9242	Križevci pri Ljutomeru
00050000-5694-d8a3-7853-7a145029b3ed	1301	Krka
00050000-5694-d8a3-1100-860f676e66a4	8296	Krmelj
00050000-5694-d8a3-81bd-b7d99588934f	4245	Kropa
00050000-5694-d8a3-0824-1b9bac2589d3	8262	Krška vas
00050000-5694-d8a3-bcea-409f584b2cb8	8270	Krško
00050000-5694-d8a3-4255-b5be540ee83c	9263	Kuzma
00050000-5694-d8a3-73e2-33948734ef9b	2318	Laporje
00050000-5694-d8a3-357c-6de89c4c0043	3270	Laško
00050000-5694-d8a3-90b2-a4f91f7590cd	1219	Laze v Tuhinju
00050000-5694-d8a3-80c0-748272fce455	2230	Lenart v Slovenskih goricah
00050000-5694-d8a3-305d-46dfb8c05204	9220	Lendava/Lendva
00050000-5694-d8a3-2387-a7578983680f	4248	Lesce
00050000-5694-d8a3-d2a8-e3cbe9c454e5	3261	Lesično
00050000-5694-d8a3-255e-6b4c173fa7d6	8273	Leskovec pri Krškem
00050000-5694-d8a3-1d52-64d32cec881d	2372	Libeliče
00050000-5694-d8a3-1d14-4d10fffa03d9	2341	Limbuš
00050000-5694-d8a3-a1a9-af890ed05375	1270	Litija
00050000-5694-d8a3-3bcd-87cfe86d16f4	3202	Ljubečna
00050000-5694-d8a3-38f0-ab5c19e3e06e	1000	Ljubljana 
00050000-5694-d8a3-e488-cc14f1523987	1001	Ljubljana - poštni predali
00050000-5694-d8a3-f713-1ad58e01b803	1231	Ljubljana - Črnuče
00050000-5694-d8a3-2821-39e011180514	1261	Ljubljana - Dobrunje
00050000-5694-d8a3-6e91-13e698a06357	1260	Ljubljana - Polje
00050000-5694-d8a3-245e-1954acef163c	1210	Ljubljana - Šentvid
00050000-5694-d8a3-17f4-7e1bcefbe23c	1211	Ljubljana - Šmartno
00050000-5694-d8a3-2e7b-5c1537740a7a	3333	Ljubno ob Savinji
00050000-5694-d8a3-5837-e5ec17cf3787	9240	Ljutomer
00050000-5694-d8a3-a62e-6b9d443ced87	3215	Loče
00050000-5694-d8a3-e12b-9a3efc5e9278	5231	Log pod Mangartom
00050000-5694-d8a3-e86b-bce5fc4925ce	1358	Log pri Brezovici
00050000-5694-d8a3-917a-3ac5bbfea4d8	1370	Logatec
00050000-5694-d8a3-8007-4d614de89bdc	1371	Logatec
00050000-5694-d8a3-b95b-07161e9db765	1434	Loka pri Zidanem Mostu
00050000-5694-d8a3-f649-03b255113cb4	3223	Loka pri Žusmu
00050000-5694-d8a3-4452-1cb46a7b524f	6219	Lokev
00050000-5694-d8a3-b845-a0ca802d20b4	1318	Loški Potok
00050000-5694-d8a3-2359-9bf2f93d9f66	2324	Lovrenc na Dravskem polju
00050000-5694-d8a3-0491-345185f24497	2344	Lovrenc na Pohorju
00050000-5694-d8a3-7759-022320d59945	3334	Luče
00050000-5694-d8a3-029b-4b77785b4a38	1225	Lukovica
00050000-5694-d8a3-36aa-f6827b62fb7c	9202	Mačkovci
00050000-5694-d8a3-caca-f42b17588d5e	2322	Majšperk
00050000-5694-d8a3-6d57-46cb9c2becc0	2321	Makole
00050000-5694-d8a3-38e6-80d04a66be2e	9243	Mala Nedelja
00050000-5694-d8a3-35fe-bfd2cf1f9e9c	2229	Malečnik
00050000-5694-d8a3-b5fc-6edcbba0beb2	6273	Marezige
00050000-5694-d8a3-aa4f-3b233a14588b	2000	Maribor 
00050000-5694-d8a3-5cd5-30975b860235	2001	Maribor - poštni predali
00050000-5694-d8a3-a4ee-75a26b2abf34	2206	Marjeta na Dravskem polju
00050000-5694-d8a3-36e5-f27ad129f050	2281	Markovci
00050000-5694-d8a3-ec58-9e981b809896	9221	Martjanci
00050000-5694-d8a3-d7f6-41943904fc37	6242	Materija
00050000-5694-d8a3-bc91-60f2eb55b9c8	4211	Mavčiče
00050000-5694-d8a3-b065-d2114e8e3d4b	1215	Medvode
00050000-5694-d8a3-f4f2-7dee8a58f7f2	1234	Mengeš
00050000-5694-d8a3-8ecf-56447856c788	8330	Metlika
00050000-5694-d8a3-bf47-0baa5a465242	2392	Mežica
00050000-5694-d8a3-711f-a814963e7b03	2204	Miklavž na Dravskem polju
00050000-5694-d8a3-d490-ef167ab8f20b	2275	Miklavž pri Ormožu
00050000-5694-d8a3-2e2f-031720096c56	5291	Miren
00050000-5694-d8a3-b0ca-8212e96640e0	8233	Mirna
00050000-5694-d8a3-2595-609102ca9096	8216	Mirna Peč
00050000-5694-d8a3-29c7-946fbb7735ec	2382	Mislinja
00050000-5694-d8a3-1d71-78710f1bf76e	4281	Mojstrana
00050000-5694-d8a3-ca3d-67eb70c38559	8230	Mokronog
00050000-5694-d8a3-9401-e8bdb8ac1c53	1251	Moravče
00050000-5694-d8a3-03b0-22005f3e645b	9226	Moravske Toplice
00050000-5694-d8a3-279d-0f6f4be8ce5d	5216	Most na Soči
00050000-5694-d8a3-5ecc-0c8e813674d3	1221	Motnik
00050000-5694-d8a3-717f-e4f4edbaea22	3330	Mozirje
00050000-5694-d8a3-8243-29f68883750e	9000	Murska Sobota 
00050000-5694-d8a3-aa4d-dbcf23048151	9001	Murska Sobota - poštni predali
00050000-5694-d8a3-94a2-e533b643c1fc	2366	Muta
00050000-5694-d8a3-9c0c-cbf6614a7056	4202	Naklo
00050000-5694-d8a3-84c6-efcebdb2402c	3331	Nazarje
00050000-5694-d8a3-3f2d-fa18ea9d846e	1357	Notranje Gorice
00050000-5694-d8a3-1d0a-d8ef9bd4d51b	3203	Nova Cerkev
00050000-5694-d8a3-5cb6-e4e6dc852e07	5000	Nova Gorica 
00050000-5694-d8a3-9a5d-04a72af85d24	5001	Nova Gorica - poštni predali
00050000-5694-d8a3-b190-a84215576744	1385	Nova vas
00050000-5694-d8a3-f9d8-d3d601aab006	8000	Novo mesto
00050000-5694-d8a3-fc95-85b7fcb38fc7	8001	Novo mesto - poštni predali
00050000-5694-d8a3-dbd3-595a2cc6b46b	6243	Obrov
00050000-5694-d8a3-7327-585e0cd9c51d	9233	Odranci
00050000-5694-d8a3-f20d-4e8ec51c7773	2317	Oplotnica
00050000-5694-d8a3-4a55-bfd62434c190	2312	Orehova vas
00050000-5694-d8a3-201c-7e3ae008e40f	2270	Ormož
00050000-5694-d8a3-4093-1429e7d7e362	1316	Ortnek
00050000-5694-d8a3-491e-83e1e7ff11e1	1337	Osilnica
00050000-5694-d8a3-1843-3d2319aadd54	8222	Otočec
00050000-5694-d8a3-dcea-3453834d6ecf	2361	Ožbalt
00050000-5694-d8a3-2295-64500334c3ae	2231	Pernica
00050000-5694-d8a3-0f4a-53095dcfad3d	2211	Pesnica pri Mariboru
00050000-5694-d8a3-8ccf-4172be0bf2f2	9203	Petrovci
00050000-5694-d8a3-2e7a-14e1200509e4	3301	Petrovče
00050000-5694-d8a3-1cb4-9c49d0fee721	6330	Piran/Pirano
00050000-5694-d8a3-f5a0-9f3246791811	8255	Pišece
00050000-5694-d8a3-2cc9-fb3365fd9dea	6257	Pivka
00050000-5694-d8a3-d7c9-2af36794aa3a	6232	Planina
00050000-5694-d8a3-2061-53471d17e966	3225	Planina pri Sevnici
00050000-5694-d8a3-5440-e838e9711f19	6276	Pobegi
00050000-5694-d8a3-ebbd-6b8171f88f97	8312	Podbočje
00050000-5694-d8a3-e86c-0aadb266f367	5243	Podbrdo
00050000-5694-d8a3-5e17-d45a43176388	3254	Podčetrtek
00050000-5694-d8a3-59a2-bdcdeaebc612	2273	Podgorci
00050000-5694-d8a3-8379-e6099fbbf452	6216	Podgorje
00050000-5694-d8a3-e4f1-d586a3b1adde	2381	Podgorje pri Slovenj Gradcu
00050000-5694-d8a3-33b0-2aa02ea519b2	6244	Podgrad
00050000-5694-d8a3-e821-26d88bc15d35	1414	Podkum
00050000-5694-d8a3-f15f-96ff64e9c324	2286	Podlehnik
00050000-5694-d8a3-b06a-b1c0ecc3f2eb	5272	Podnanos
00050000-5694-d8a3-2c5f-ba8f8747f230	4244	Podnart
00050000-5694-d8a3-f81d-f65178d4e5be	3241	Podplat
00050000-5694-d8a3-0db3-7235a06d1570	3257	Podsreda
00050000-5694-d8a3-766e-9ab8b0d9e937	2363	Podvelka
00050000-5694-d8a3-a690-c53720b6c847	2208	Pohorje
00050000-5694-d8a3-be63-9dd1f2116434	2257	Polenšak
00050000-5694-d8a3-3f63-7ce7b17c1199	1355	Polhov Gradec
00050000-5694-d8a3-fbc1-6fc032b5e37a	4223	Poljane nad Škofjo Loko
00050000-5694-d8a3-18db-da6cf032d4f1	2319	Poljčane
00050000-5694-d8a3-fb63-133a8e724c5b	1272	Polšnik
00050000-5694-d8a3-a911-f0f356fcb49a	3313	Polzela
00050000-5694-d8a3-6c89-801f12a6675f	3232	Ponikva
00050000-5694-d8a3-7bd5-188b75c54b2e	6320	Portorož/Portorose
00050000-5694-d8a3-a315-e2c83554aab3	6230	Postojna
00050000-5694-d8a3-5faf-1c05aeb96cda	2331	Pragersko
00050000-5694-d8a3-a20d-1e8b1c09d459	3312	Prebold
00050000-5694-d8a3-1b99-3d6898e5b232	4205	Preddvor
00050000-5694-d8a3-a7fa-ec298bc6db4d	6255	Prem
00050000-5694-d8a3-0ef1-16862873b969	1352	Preserje
00050000-5694-d8a3-1dd4-a513a70c6527	6258	Prestranek
00050000-5694-d8a3-22c1-d56e4ee68882	2391	Prevalje
00050000-5694-d8a3-a376-26dbf2e89598	3262	Prevorje
00050000-5694-d8a3-8819-8c0ff1b73123	1276	Primskovo 
00050000-5694-d8a3-24a3-cd511e475d34	3253	Pristava pri Mestinju
00050000-5694-d8a3-ec64-266f12501202	9207	Prosenjakovci/Partosfalva
00050000-5694-d8a3-19b6-fc0833ad0fd7	5297	Prvačina
00050000-5694-d8a3-b089-43261f886514	2250	Ptuj
00050000-5694-d8a3-91d2-5195dea6e6ef	2323	Ptujska Gora
00050000-5694-d8a3-dc05-61c76fdb22ec	9201	Puconci
00050000-5694-d8a3-6289-32e431e26171	2327	Rače
00050000-5694-d8a3-05fe-d717a7da7145	1433	Radeče
00050000-5694-d8a3-e0e1-cad9dcd52d6f	9252	Radenci
00050000-5694-d8a3-aad8-b147a39f1ef7	2360	Radlje ob Dravi
00050000-5694-d8a3-ad84-2391ec68d2fa	1235	Radomlje
00050000-5694-d8a3-73b5-f4f308b57d3a	4240	Radovljica
00050000-5694-d8a3-846a-c2cfc245bd6e	8274	Raka
00050000-5694-d8a3-ddfe-0ae1ae554553	1381	Rakek
00050000-5694-d8a3-5d39-83f3051c3631	4283	Rateče - Planica
00050000-5694-d8a3-1794-74c8d3911b16	2390	Ravne na Koroškem
00050000-5694-d8a3-25db-431f7c3b507b	9246	Razkrižje
00050000-5694-d8a3-68a4-ab5242b1a63d	3332	Rečica ob Savinji
00050000-5694-d8a3-6213-c8c5aa67efa9	5292	Renče
00050000-5694-d8a3-da9b-c27dc8c8c1d8	1310	Ribnica
00050000-5694-d8a3-2d53-fc881737e273	2364	Ribnica na Pohorju
00050000-5694-d8a3-f0e3-dc8e1c2bab46	3272	Rimske Toplice
00050000-5694-d8a3-71af-5389080c5c89	1314	Rob
00050000-5694-d8a3-6df0-d88674315f69	5215	Ročinj
00050000-5694-d8a3-73b2-a7bb89d59b5b	3250	Rogaška Slatina
00050000-5694-d8a3-0013-4531185f0b9c	9262	Rogašovci
00050000-5694-d8a3-c142-76599136eef9	3252	Rogatec
00050000-5694-d8a3-df4a-c87e3fd7f7b5	1373	Rovte
00050000-5694-d8a3-4922-5a8a995ef924	2342	Ruše
00050000-5694-d8a3-3c09-a6b9c7336aaf	1282	Sava
00050000-5694-d8a3-495e-340dd15e383a	6333	Sečovlje/Sicciole
00050000-5694-d8a3-e567-6b71c5c74602	4227	Selca
00050000-5694-d8a3-b16e-1111b1a6ef5f	2352	Selnica ob Dravi
00050000-5694-d8a3-691b-c45897dc24a2	8333	Semič
00050000-5694-d8a3-0641-c64615295a6f	8281	Senovo
00050000-5694-d8a3-982c-2e2433ecdae9	6224	Senožeče
00050000-5694-d8a3-c7e7-710fbe86fda1	8290	Sevnica
00050000-5694-d8a3-51ec-642bd697785b	6210	Sežana
00050000-5694-d8a3-d68d-bc73698716fa	2214	Sladki Vrh
00050000-5694-d8a3-b606-9b297cbe4d56	5283	Slap ob Idrijci
00050000-5694-d8a3-61da-af6312abdbeb	2380	Slovenj Gradec
00050000-5694-d8a3-3867-5249dfe1e5f2	2310	Slovenska Bistrica
00050000-5694-d8a3-687a-74e44df88601	3210	Slovenske Konjice
00050000-5694-d8a3-8891-0b9a988b9748	1216	Smlednik
00050000-5694-d8a3-6eef-a9f71c12d3dc	5232	Soča
00050000-5694-d8a3-a723-d424e8a215f8	1317	Sodražica
00050000-5694-d8a3-17ab-e806fa50f8ee	3335	Solčava
00050000-5694-d8a3-fce8-8bb6cd584fd7	5250	Solkan
00050000-5694-d8a3-a080-285fd5e79ed8	4229	Sorica
00050000-5694-d8a3-0f53-52d7b1c8e918	4225	Sovodenj
00050000-5694-d8a3-1991-f5765de2c03c	5281	Spodnja Idrija
00050000-5694-d8a3-5f71-49be48617601	2241	Spodnji Duplek
00050000-5694-d8a3-aa4a-83e96360bcc7	9245	Spodnji Ivanjci
00050000-5694-d8a3-71af-4b6e617ba223	2277	Središče ob Dravi
00050000-5694-d8a3-1e3d-330d7cf015ca	4267	Srednja vas v Bohinju
00050000-5694-d8a3-e951-2eaa8ce7149f	8256	Sromlje 
00050000-5694-d8a3-b213-788d78b51ab2	5224	Srpenica
00050000-5694-d8a3-b344-e710e1009510	1242	Stahovica
00050000-5694-d8a3-db16-1f0241ecdfc4	1332	Stara Cerkev
00050000-5694-d8a3-922b-2dbba72096dc	8342	Stari trg ob Kolpi
00050000-5694-d8a3-ef60-8305ddefd00b	1386	Stari trg pri Ložu
00050000-5694-d8a3-3b65-64970397263a	2205	Starše
00050000-5694-d8a3-274c-27192d58d58b	2289	Stoperce
00050000-5694-d8a3-7796-12681ac2013a	8322	Stopiče
00050000-5694-d8a3-8ef5-2ac004f0e5a4	3206	Stranice
00050000-5694-d8a3-36af-572e6f8cb596	8351	Straža
00050000-5694-d8a3-f696-9406153f850b	1313	Struge
00050000-5694-d8a3-8dfd-632332e960f5	8293	Studenec
00050000-5694-d8a3-b5b2-b904a9a6a81b	8331	Suhor
00050000-5694-d8a3-8d0b-aa2c2836cc0b	2233	Sv. Ana v Slovenskih goricah
00050000-5694-d8a3-88a7-a27cf6f18083	2235	Sv. Trojica v Slovenskih goricah
00050000-5694-d8a3-b6f6-cb7258940186	2353	Sveti Duh na Ostrem Vrhu
00050000-5694-d8a3-ee4c-5bc9889205ef	9244	Sveti Jurij ob Ščavnici
00050000-5694-d8a3-e338-e7ab7007680f	3264	Sveti Štefan
00050000-5694-d8a3-0368-33ffa798344e	2258	Sveti Tomaž
00050000-5694-d8a3-af6c-96f6bfa86f44	9204	Šalovci
00050000-5694-d8a3-8c39-d8ed3e2afc0c	5261	Šempas
00050000-5694-d8a3-7ac8-86ca32fc3729	5290	Šempeter pri Gorici
00050000-5694-d8a3-c368-de55bbe33c0a	3311	Šempeter v Savinjski dolini
00050000-5694-d8a3-d4d7-c758d5302ae2	4208	Šenčur
00050000-5694-d8a3-3d36-24352898aa1a	2212	Šentilj v Slovenskih goricah
00050000-5694-d8a3-dfd7-421f25cb989b	8297	Šentjanž
00050000-5694-d8a3-c0fa-5b21b75cac11	2373	Šentjanž pri Dravogradu
00050000-5694-d8a3-7955-81214fe34e9f	8310	Šentjernej
00050000-5694-d8a3-9e9c-7fa84afd2b76	3230	Šentjur
00050000-5694-d8a3-e53b-737f885aadc2	3271	Šentrupert
00050000-5694-d8a3-fb2d-757266299b3e	8232	Šentrupert
00050000-5694-d8a3-4558-63b9b4df4ebf	1296	Šentvid pri Stični
00050000-5694-d8a3-adb0-c5b3e7f74c9b	8275	Škocjan
00050000-5694-d8a3-2ec9-5e2fac5af848	6281	Škofije
00050000-5694-d8a3-f519-9df221929997	4220	Škofja Loka
00050000-5694-d8a3-1d59-ffa16098196d	3211	Škofja vas
00050000-5694-d8a3-7d20-fd88f0736fc7	1291	Škofljica
00050000-5694-d8a3-7d3f-d93dd1fa2e64	6274	Šmarje
00050000-5694-d8a3-5ab2-3a8c09b3770b	1293	Šmarje - Sap
00050000-5694-d8a3-eac2-159d524c2d7f	3240	Šmarje pri Jelšah
00050000-5694-d8a3-c891-599737d5d935	8220	Šmarješke Toplice
00050000-5694-d8a3-11e6-4f40942f458e	2315	Šmartno na Pohorju
00050000-5694-d8a3-a617-af67fd4898d5	3341	Šmartno ob Dreti
00050000-5694-d8a3-edea-b9521133d958	3327	Šmartno ob Paki
00050000-5694-d8a3-139f-3fd6a6ae317d	1275	Šmartno pri Litiji
00050000-5694-d8a3-29ab-8a3ce496e94b	2383	Šmartno pri Slovenj Gradcu
00050000-5694-d8a3-9f3a-7568b40c4606	3201	Šmartno v Rožni dolini
00050000-5694-d8a3-769f-84fd03e845b2	3325	Šoštanj
00050000-5694-d8a3-985b-3c1f87be00c7	6222	Štanjel
00050000-5694-d8a3-dd0f-3282902d3fcd	3220	Štore
00050000-5694-d8a3-6846-b19f3505b39d	3304	Tabor
00050000-5694-d8a3-edcd-fad839ad659d	3221	Teharje
00050000-5694-d8a3-1897-02a0b96ce08c	9251	Tišina
00050000-5694-d8a3-57ea-e665a06d7551	5220	Tolmin
00050000-5694-d8a3-a461-dd9a2a692106	3326	Topolšica
00050000-5694-d8a3-6ffd-c31e4edeb650	2371	Trbonje
00050000-5694-d8a3-3778-1afb7e9fe9d3	1420	Trbovlje
00050000-5694-d8a3-96f8-c5db865717e1	8231	Trebelno 
00050000-5694-d8a3-6da2-8043c7db2edb	8210	Trebnje
00050000-5694-d8a3-b232-3779f5f8ab6c	5252	Trnovo pri Gorici
00050000-5694-d8a3-5009-a7bbcf5fb785	2254	Trnovska vas
00050000-5694-d8a3-b772-3f89e6739aee	1222	Trojane
00050000-5694-d8a3-8ffe-d0feb9583e0f	1236	Trzin
00050000-5694-d8a3-7902-c1380e29694f	4290	Tržič
00050000-5694-d8a3-58ac-f468c4d6fc50	8295	Tržišče
00050000-5694-d8a3-390c-40e6b77fe010	1311	Turjak
00050000-5694-d8a3-7362-940ff59e044c	9224	Turnišče
00050000-5694-d8a3-3c31-7da88fe7544a	8323	Uršna sela
00050000-5694-d8a3-a98f-fd030047a0fc	1252	Vače
00050000-5694-d8a3-2d2c-4756c799604a	3320	Velenje 
00050000-5694-d8a3-d24d-e61cc5a04505	3322	Velenje - poštni predali
00050000-5694-d8a3-f1fa-ee7844c900f3	8212	Velika Loka
00050000-5694-d8a3-0bde-bac00e89671b	2274	Velika Nedelja
00050000-5694-d8a3-8d93-e48f3692e7ba	9225	Velika Polana
00050000-5694-d8a3-c776-2fe9b1d1afec	1315	Velike Lašče
00050000-5694-d8a3-b8e6-9d32b4f5b694	8213	Veliki Gaber
00050000-5694-d8a3-fdab-1e71d7ce193f	9241	Veržej
00050000-5694-d8a3-8f06-45f4b894ceb4	1312	Videm - Dobrepolje
00050000-5694-d8a3-47e6-9549d2c56043	2284	Videm pri Ptuju
00050000-5694-d8a3-f232-5153e2066d6a	8344	Vinica
00050000-5694-d8a3-214d-b2dfb3e2f731	5271	Vipava
00050000-5694-d8a3-0c18-03e2e4a7c76a	4212	Visoko
00050000-5694-d8a3-61d0-77ffc1d9522b	1294	Višnja Gora
00050000-5694-d8a3-ded1-58244a1f41bd	3205	Vitanje
00050000-5694-d8a3-1c67-ee68e00c9624	2255	Vitomarci
00050000-5694-d8a3-407c-01cbf17a0759	1217	Vodice
00050000-5694-d8a3-caae-d375e7319410	3212	Vojnik\t
00050000-5694-d8a3-6da9-27dc8eee9c4f	5293	Volčja Draga
00050000-5694-d8a3-3cd6-3683d21c601d	2232	Voličina
00050000-5694-d8a3-d18a-44100b1ae506	3305	Vransko
00050000-5694-d8a3-7a78-c96db5fd208e	6217	Vremski Britof
00050000-5694-d8a3-704e-3ef1d5b531dd	1360	Vrhnika
00050000-5694-d8a3-c8e7-f067d8ea63dc	2365	Vuhred
00050000-5694-d8a3-2bbc-20d2316fedfa	2367	Vuzenica
00050000-5694-d8a3-493c-43156c59d84c	8292	Zabukovje 
00050000-5694-d8a3-6ecb-6e968bd702d8	1410	Zagorje ob Savi
00050000-5694-d8a3-8036-e410866689eb	1303	Zagradec
00050000-5694-d8a3-ce57-0510c616cc7f	2283	Zavrč
00050000-5694-d8a3-fafd-cc31ef4a6414	8272	Zdole 
00050000-5694-d8a3-6256-817227a25bc8	4201	Zgornja Besnica
00050000-5694-d8a3-bbbd-f83702f42a83	2242	Zgornja Korena
00050000-5694-d8a3-c62a-67ca91a5cdc6	2201	Zgornja Kungota
00050000-5694-d8a3-68bd-8d26eff2bf16	2316	Zgornja Ložnica
00050000-5694-d8a3-e04b-aac8d85e5d47	2314	Zgornja Polskava
00050000-5694-d8a3-2101-28b909db7d85	2213	Zgornja Velka
00050000-5694-d8a3-975e-37a3fbd504af	4247	Zgornje Gorje
00050000-5694-d8a3-58d2-ca33dd05de50	4206	Zgornje Jezersko
00050000-5694-d8a3-b664-22e77c082016	2285	Zgornji Leskovec
00050000-5694-d8a3-96eb-545eb79edf60	1432	Zidani Most
00050000-5694-d8a3-3664-d677e704115a	3214	Zreče
00050000-5694-d8a3-c3ef-54cb0b44227f	4209	Žabnica
00050000-5694-d8a3-9f36-62794c60057d	3310	Žalec
00050000-5694-d8a3-b726-1fa91015efbc	4228	Železniki
00050000-5694-d8a3-64fe-ca249c231ff8	2287	Žetale
00050000-5694-d8a3-5c0f-94dae9fa5128	4226	Žiri
00050000-5694-d8a3-c464-5af9a91bac19	4274	Žirovnica
00050000-5694-d8a3-1188-439573d3b38f	8360	Žužemberk
\.


--
-- TOC entry 3193 (class 0 OID 35332640)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 35332209)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 35331940)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5694-d8a6-e57a-f610666b6767	00080000-5694-d8a6-6352-303751841c8a	\N	00040000-5694-d8a3-b153-9cabad5972c0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5694-d8a6-09eb-2ac165a72e15	00080000-5694-d8a6-6352-303751841c8a	\N	00040000-5694-d8a3-b153-9cabad5972c0	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5694-d8a6-32ea-53f758780706	00080000-5694-d8a6-9d17-284ec7251491	\N	00040000-5694-d8a3-b153-9cabad5972c0	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3153 (class 0 OID 35332084)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5694-d8a3-b073-542e09bd0ea9	novo leto	1	1	\N	t
00430000-5694-d8a3-df2e-a082e8ca0308	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5694-d8a3-6e67-1adcae3ecd69	dan upora proti okupatorju	27	4	\N	t
00430000-5694-d8a3-645e-5075b261e0c5	praznik dela	1	5	\N	t
00430000-5694-d8a3-4b11-c6f83c00e0fd	praznik dela	2	5	\N	t
00430000-5694-d8a3-c957-3d56cc160176	dan Primoža Trubarja	8	6	\N	f
00430000-5694-d8a3-4026-c770ade22233	dan državnosti	25	6	\N	t
00430000-5694-d8a3-29ce-2386272b1b01	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5694-d8a3-1b8a-de1c2521ddf5	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5694-d8a3-ce13-b644aae8175b	dan suverenosti	25	10	\N	f
00430000-5694-d8a3-c430-8debe889a37f	dan spomina na mrtve	1	11	\N	t
00430000-5694-d8a3-81c2-2250097e651f	dan Rudolfa Maistra	23	11	\N	f
00430000-5694-d8a3-967f-1cb169475ef0	božič	25	12	\N	t
00430000-5694-d8a3-13f1-ff8aad25835f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5694-d8a3-8156-28cca3f1ad92	Marijino vnebovzetje	15	8	\N	t
00430000-5694-d8a3-e38e-4c95a7ed1a44	dan reformacije	31	10	\N	t
00430000-5694-d8a3-45cc-c0529524388a	velikonočna nedelja	27	3	2016	t
00430000-5694-d8a3-1a1e-390f5b9eb12e	velikonočna nedelja	16	4	2017	t
00430000-5694-d8a3-17d6-7bb707df216a	velikonočna nedelja	1	4	2018	t
00430000-5694-d8a3-400f-6ffff98bf82b	velikonočna nedelja	21	4	2019	t
00430000-5694-d8a3-fbf2-14937e321c66	velikonočna nedelja	12	4	2020	t
00430000-5694-d8a3-b0a3-c61c78a12992	velikonočna nedelja	4	4	2021	t
00430000-5694-d8a3-f067-494300254c3e	velikonočna nedelja	17	4	2022	t
00430000-5694-d8a3-d44d-90f67dcb3dc3	velikonočna nedelja	9	4	2023	t
00430000-5694-d8a3-6b56-0d99b547b17a	velikonočna nedelja	31	3	2024	t
00430000-5694-d8a3-a8b0-00cc1b23d474	velikonočna nedelja	20	4	2025	t
00430000-5694-d8a3-3e65-b524d41bc69f	velikonočna nedelja	5	4	2026	t
00430000-5694-d8a3-38d2-bbd730346976	velikonočna nedelja	28	3	2027	t
00430000-5694-d8a3-5a49-048e77029b8b	velikonočna nedelja	16	4	2028	t
00430000-5694-d8a3-7b2d-194cb2e51716	velikonočna nedelja	1	4	2029	t
00430000-5694-d8a3-1b41-6e6e55d91d6b	velikonočna nedelja	21	4	2030	t
00430000-5694-d8a3-9cbd-54c03ee5edb8	velikonočni ponedeljek	28	3	2016	t
00430000-5694-d8a3-8291-f9b9e187ead8	velikonočni ponedeljek	17	4	2017	t
00430000-5694-d8a3-3fac-e13005d87b1a	velikonočni ponedeljek	2	4	2018	t
00430000-5694-d8a3-4cf8-a21b80865061	velikonočni ponedeljek	22	4	2019	t
00430000-5694-d8a3-ce29-dca3ddcd1407	velikonočni ponedeljek	13	4	2020	t
00430000-5694-d8a3-75d8-63428bd38869	velikonočni ponedeljek	5	4	2021	t
00430000-5694-d8a3-86ff-1b236406d5cd	velikonočni ponedeljek	18	4	2022	t
00430000-5694-d8a3-aa6e-7f9df163d26a	velikonočni ponedeljek	10	4	2023	t
00430000-5694-d8a3-bc32-d15c2775e94b	velikonočni ponedeljek	1	4	2024	t
00430000-5694-d8a3-ca4e-0a333b86c22f	velikonočni ponedeljek	21	4	2025	t
00430000-5694-d8a3-194e-1bde0e22a498	velikonočni ponedeljek	6	4	2026	t
00430000-5694-d8a3-ecbb-528a51435f5c	velikonočni ponedeljek	29	3	2027	t
00430000-5694-d8a3-052b-8a0f2e52e9b1	velikonočni ponedeljek	17	4	2028	t
00430000-5694-d8a3-9dcf-daf505973871	velikonočni ponedeljek	2	4	2029	t
00430000-5694-d8a3-296a-3b59b03b9fea	velikonočni ponedeljek	22	4	2030	t
00430000-5694-d8a3-4c79-4ff520261342	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5694-d8a3-c28f-da5253855f5b	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5694-d8a3-ec3c-e8763c3625ef	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5694-d8a3-bb42-7502d88b13fd	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5694-d8a3-90cd-5c96ef481b19	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5694-d8a3-14a5-e4ddb79e1414	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5694-d8a3-6267-1ea12fb33109	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5694-d8a3-9475-727cd2f47eb0	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5694-d8a3-028a-307e6967a5e2	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5694-d8a3-a351-de264630edca	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5694-d8a3-1a29-0c3394587c3e	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5694-d8a3-ecb0-a87bd3a4a833	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5694-d8a3-bb25-df70c06753cd	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5694-d8a3-52d7-c747e6ae94d3	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5694-d8a3-55b0-557922f0e1e5	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3149 (class 0 OID 35332044)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 35332056)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35332221)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 35332654)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35332664)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5694-d8a6-3cb1-6223af9ab43e	00080000-5694-d8a6-ea4b-35d79ec3d565	0987	AK
00190000-5694-d8a6-c9d5-dd13d75cf41f	00080000-5694-d8a6-9d17-284ec7251491	0989	AK
00190000-5694-d8a6-236c-809b5c4b6ae6	00080000-5694-d8a6-0f18-973ecbc3c154	0986	AK
00190000-5694-d8a6-650b-a07ea4d5d9f4	00080000-5694-d8a6-6933-c94431256202	0984	AK
00190000-5694-d8a6-8da9-fc3bfd8624c8	00080000-5694-d8a6-ef08-9726e63436eb	0983	AK
00190000-5694-d8a6-6441-68b77b03a461	00080000-5694-d8a6-e3de-e3fe71a31d4b	0982	AK
00190000-5694-d8a8-4ed5-cbefc3eba852	00080000-5694-d8a8-7923-bb760e8062de	1001	AK
\.


--
-- TOC entry 3192 (class 0 OID 35332553)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5694-d8a7-64e8-191900fc5ddd	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3196 (class 0 OID 35332672)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 35332250)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5694-d8a6-30c8-882ebae670b2	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5694-d8a6-aff7-50830abfb2da	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5694-d8a6-44f0-af3a17f168d3	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5694-d8a6-6782-56e26bb74a3e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5694-d8a6-598a-4eea8739d727	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5694-d8a6-74c5-56a4d0cbe58e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5694-d8a6-8c31-5eb3c6f68956	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3164 (class 0 OID 35332194)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 35332184)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 35332391)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 35332321)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 35332018)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 35331780)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5694-d8a8-7923-bb760e8062de	00010000-5694-d8a4-e76e-6049f83a8c01	2016-01-12 11:42:48	INS	a:0:{}
2	App\\Entity\\Option	00000000-5694-d8a8-13f8-364caf251f5b	00010000-5694-d8a4-e76e-6049f83a8c01	2016-01-12 11:42:48	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5694-d8a8-4ed5-cbefc3eba852	00010000-5694-d8a4-e76e-6049f83a8c01	2016-01-12 11:42:48	INS	a:0:{}
\.


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3173 (class 0 OID 35332263)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 35331818)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5694-d8a4-f640-f3ee3bded092	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5694-d8a4-0359-fe4b814a6658	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5694-d8a4-9680-36f963545d31	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5694-d8a4-5565-b1a7848f6ec6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5694-d8a4-c10c-b976e4f4e8a0	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5694-d8a4-09bd-f99c2ba62556	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5694-d8a4-e2d6-960c8a570bb4	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5694-d8a4-8158-bf5acd3537da	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5694-d8a4-5efc-5b0f897bb4de	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-d8a4-ca6d-046e0c2227de	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-d8a4-0e0e-e660487693f7	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-d8a4-e8e0-7d88038f7a5c	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-d8a4-853c-084f95f571e9	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-d8a4-407b-05af83db003d	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-d8a4-2a4b-55fe19bfa0de	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-d8a4-b05a-cc81ad8de044	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-d8a4-6a84-a0709bcc7dc6	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5694-d8a4-e51d-79ff89c8bf7f	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5694-d8a4-9fdd-879881a42f3a	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5694-d8a4-053c-5e7bea0c1043	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5694-d8a4-a6ac-daca1323d69a	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-d8a4-023a-676712b947da	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-d8a4-4c82-c4c55ffed21f	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-d8a4-8a9a-b252943ee337	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-d8a4-1a63-9efae134c246	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5694-d8a4-19d0-99cdbeb3e1ee	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5694-d8a4-9175-67c14e149d6a	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5694-d8a4-dba3-92ce1f1951b5	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5694-d8a4-122c-e988bdf9e057	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5694-d8a4-cb5b-01824c167c04	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5694-d8a4-a330-7cadec322058	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-d8a4-ea10-c8a9a43af069	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-d8a4-b961-3e1125171280	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5694-d8a4-5f2d-04eb34722533	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5694-d8a4-5b46-4a4eb2949821	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5694-d8a4-97d2-ac4dc18dbf78	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5694-d8a4-2d47-56f186411dec	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-d8a4-52fd-b26c65ec606d	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-d8a4-5de1-d44a7190cbab	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5694-d8a4-c826-5ca2d05e5e65	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-d8a4-94ff-d6ce6e3e5f98	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-d8a4-ff97-dcb863691c35	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5694-d8a4-ac92-26e95918450f	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-d8a4-f970-7ff1117320c2	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-d8a4-95f4-6056c394b701	direktor	minimalne pravice za direktorja	t
00020000-5694-d8a4-80ce-9bd17155bfc6	arhivar	arhivar	t
00020000-5694-d8a4-80c4-593593833fb9	dramaturg	dramaturg	t
00020000-5694-d8a4-f0b3-3898ce39edee	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5694-d8a4-b21d-b482d9f7655d	poslovni-sekretar	poslovni sekretar	t
00020000-5694-d8a4-8290-989ea849ecb0	vodja-tehnike	vodja tehnike	t
00020000-5694-d8a4-f903-3f42f725e13f	racunovodja	računovodja	t
00020000-5694-d8a6-904a-3867998363c6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5694-d8a6-aca8-2a2718e600c7	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-d486-a1a20b5cc19a	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-6a28-885b37e0b6b8	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-42ed-1c6c836687ad	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-70fa-255792361eee	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-ce3a-8ae5aa0fdac9	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-5776-9d11ec87b7e2	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-2512-b19e29a2cd4a	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-c546-7a5a20905ca7	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-2776-f70808df4449	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-9bfd-b2fcd8a6a18e	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-4b0d-bd34bfd748d2	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-0755-047025136591	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-c098-ac8e44e874c2	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-f692-42157175a099	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-454a-b189e15b053b	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-8943-387d8239fad7	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-44d0-9d168c205d01	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-df32-b5f46e4f952d	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5694-d8a6-8c43-728cab6774ab	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-8323-a0ef20e86fa8	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-2afe-a4556e17ee2a	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-74cd-d2063a42569f	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-35df-2ba3195bb50f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-e697-260bb3b70536	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-a9c9-9ee786712e48	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-be95-db54015ffd5b	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-9fb6-93ad27b8d5ec	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-0324-7a12ffd35147	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-081e-a428efa944e1	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-44b5-76b6ca893496	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-15eb-96f512641be6	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-1b23-54697d1bfb91	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-8aeb-795e5dfe07ff	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-9a72-a122387c76e9	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-2d13-d2a44aa0bf64	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-01a5-5e1b76817c01	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5694-d8a6-6a77-f60556741088	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3128 (class 0 OID 35331802)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5694-d8a4-6817-f618a21f5c86	00020000-5694-d8a4-9680-36f963545d31
00010000-5694-d8a4-e76e-6049f83a8c01	00020000-5694-d8a4-9680-36f963545d31
00010000-5694-d8a6-5983-24722ee604f2	00020000-5694-d8a6-904a-3867998363c6
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-aca8-2a2718e600c7
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-70fa-255792361eee
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-c546-7a5a20905ca7
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-9bfd-b2fcd8a6a18e
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-0755-047025136591
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-44d0-9d168c205d01
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-6a28-885b37e0b6b8
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-8c43-728cab6774ab
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-74cd-d2063a42569f
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-e697-260bb3b70536
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-be95-db54015ffd5b
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-0324-7a12ffd35147
00010000-5694-d8a6-bb00-fedd0c34cd67	00020000-5694-d8a6-1b23-54697d1bfb91
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-aca8-2a2718e600c7
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-d486-a1a20b5cc19a
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-6a28-885b37e0b6b8
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-42ed-1c6c836687ad
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-0755-047025136591
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-454a-b189e15b053b
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-8c43-728cab6774ab
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-74cd-d2063a42569f
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-e697-260bb3b70536
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-be95-db54015ffd5b
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-0324-7a12ffd35147
00010000-5694-d8a6-51fc-81b7ee98e905	00020000-5694-d8a6-1b23-54697d1bfb91
00010000-5694-d8a6-b367-63889ac449b9	00020000-5694-d8a6-aca8-2a2718e600c7
00010000-5694-d8a6-b367-63889ac449b9	00020000-5694-d8a6-d486-a1a20b5cc19a
00010000-5694-d8a6-b367-63889ac449b9	00020000-5694-d8a6-6a28-885b37e0b6b8
00010000-5694-d8a6-b367-63889ac449b9	00020000-5694-d8a6-42ed-1c6c836687ad
00010000-5694-d8a6-b367-63889ac449b9	00020000-5694-d8a6-9bfd-b2fcd8a6a18e
00010000-5694-d8a6-b367-63889ac449b9	00020000-5694-d8a6-0755-047025136591
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-d486-a1a20b5cc19a
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-ce3a-8ae5aa0fdac9
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-2776-f70808df4449
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-4b0d-bd34bfd748d2
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-9bfd-b2fcd8a6a18e
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-8943-387d8239fad7
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-0755-047025136591
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-c098-ac8e44e874c2
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-8c43-728cab6774ab
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-8323-a0ef20e86fa8
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-74cd-d2063a42569f
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-35df-2ba3195bb50f
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-e697-260bb3b70536
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-a9c9-9ee786712e48
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-be95-db54015ffd5b
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-9fb6-93ad27b8d5ec
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-0324-7a12ffd35147
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-081e-a428efa944e1
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-1b23-54697d1bfb91
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-8aeb-795e5dfe07ff
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-2d13-d2a44aa0bf64
00010000-5694-d8a6-0dfa-fec4805d3dee	00020000-5694-d8a6-01a5-5e1b76817c01
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-d486-a1a20b5cc19a
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-ce3a-8ae5aa0fdac9
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-2512-b19e29a2cd4a
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-2776-f70808df4449
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-4b0d-bd34bfd748d2
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-9bfd-b2fcd8a6a18e
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-8943-387d8239fad7
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-0755-047025136591
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-c098-ac8e44e874c2
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-f692-42157175a099
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-8c43-728cab6774ab
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-8323-a0ef20e86fa8
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-2afe-a4556e17ee2a
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-74cd-d2063a42569f
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-35df-2ba3195bb50f
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-e697-260bb3b70536
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-a9c9-9ee786712e48
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-be95-db54015ffd5b
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-9fb6-93ad27b8d5ec
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-0324-7a12ffd35147
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-081e-a428efa944e1
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-1b23-54697d1bfb91
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-8aeb-795e5dfe07ff
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-9a72-a122387c76e9
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-2d13-d2a44aa0bf64
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-01a5-5e1b76817c01
00010000-5694-d8a6-1996-1b057e628cb6	00020000-5694-d8a6-6a77-f60556741088
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-d486-a1a20b5cc19a
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-6a28-885b37e0b6b8
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-ce3a-8ae5aa0fdac9
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-5776-9d11ec87b7e2
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-2512-b19e29a2cd4a
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-70fa-255792361eee
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-2776-f70808df4449
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-4b0d-bd34bfd748d2
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-9bfd-b2fcd8a6a18e
00010000-5694-d8a6-da89-07f71b94fa90	00020000-5694-d8a6-8943-387d8239fad7
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-aca8-2a2718e600c7
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-42ed-1c6c836687ad
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-70fa-255792361eee
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-c546-7a5a20905ca7
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-9bfd-b2fcd8a6a18e
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-0755-047025136591
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-44d0-9d168c205d01
00010000-5694-d8a6-dfb6-662d6ca29448	00020000-5694-d8a6-44b5-76b6ca893496
00010000-5694-d8a6-ad80-5604b01dc271	00020000-5694-d8a6-df32-b5f46e4f952d
00010000-5694-d8a6-9520-c194ff26a542	00020000-5694-d8a4-95f4-6056c394b701
00010000-5694-d8a6-aba1-4c3b6e13de78	00020000-5694-d8a4-80ce-9bd17155bfc6
00010000-5694-d8a6-a398-e442c3646515	00020000-5694-d8a4-80c4-593593833fb9
00010000-5694-d8a6-1a8e-a5fdd4fa220d	00020000-5694-d8a4-f0b3-3898ce39edee
00010000-5694-d8a6-598b-20ec477eff86	00020000-5694-d8a4-b21d-b482d9f7655d
00010000-5694-d8a6-a795-a745ad0f4aa9	00020000-5694-d8a4-8290-989ea849ecb0
00010000-5694-d8a6-64bb-a4e608a47c7d	00020000-5694-d8a4-f903-3f42f725e13f
\.


--
-- TOC entry 3175 (class 0 OID 35332277)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35332215)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 35332144)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5694-d8a6-fb6f-85d000303973	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5694-d8a6-03d7-425d1a6a1e87	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5694-d8a6-ba02-ef6fb8a49a28	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3124 (class 0 OID 35331767)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5694-d8a3-a167-b37a6636cdec	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5694-d8a3-d445-224eb7ac7901	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5694-d8a3-43f5-1cc7354acdd1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5694-d8a3-a7f2-57386a27277f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5694-d8a3-90f9-c51a129d90e8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3123 (class 0 OID 35331759)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5694-d8a3-79c2-820da15fca04	00230000-5694-d8a3-a7f2-57386a27277f	popa
00240000-5694-d8a3-0297-42b5ab009dc2	00230000-5694-d8a3-a7f2-57386a27277f	oseba
00240000-5694-d8a3-7fd1-7821a8af3803	00230000-5694-d8a3-a7f2-57386a27277f	tippopa
00240000-5694-d8a3-84c6-2d6ace9ed5b5	00230000-5694-d8a3-a7f2-57386a27277f	organizacijskaenota
00240000-5694-d8a3-41a8-47e05e39ad50	00230000-5694-d8a3-a7f2-57386a27277f	sezona
00240000-5694-d8a3-0d44-61c3e179f315	00230000-5694-d8a3-a7f2-57386a27277f	tipvaje
00240000-5694-d8a3-df46-2425baeba5d3	00230000-5694-d8a3-a7f2-57386a27277f	tipdodatka
00240000-5694-d8a3-d652-689363daeb2a	00230000-5694-d8a3-d445-224eb7ac7901	prostor
00240000-5694-d8a3-300b-8db982abdc9d	00230000-5694-d8a3-a7f2-57386a27277f	besedilo
00240000-5694-d8a3-fa78-ee6b800460b4	00230000-5694-d8a3-a7f2-57386a27277f	uprizoritev
00240000-5694-d8a3-df25-ba2c6970358d	00230000-5694-d8a3-a7f2-57386a27277f	funkcija
00240000-5694-d8a3-1803-30baa10e47e4	00230000-5694-d8a3-a7f2-57386a27277f	tipfunkcije
00240000-5694-d8a3-fb24-85e33c4decc8	00230000-5694-d8a3-a7f2-57386a27277f	alternacija
00240000-5694-d8a3-f9b0-49d43355af9d	00230000-5694-d8a3-a167-b37a6636cdec	pogodba
00240000-5694-d8a3-2636-3d289c9b0bed	00230000-5694-d8a3-a7f2-57386a27277f	zaposlitev
00240000-5694-d8a3-a69f-b24f9b061525	00230000-5694-d8a3-a7f2-57386a27277f	zvrstuprizoritve
00240000-5694-d8a3-ab9a-cff5a0defe82	00230000-5694-d8a3-a167-b37a6636cdec	programdela
00240000-5694-d8a3-cfdc-da4f1d5a608c	00230000-5694-d8a3-a7f2-57386a27277f	zapis
\.


--
-- TOC entry 3122 (class 0 OID 35331754)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
04c4745a-d4e3-49ac-9915-e79932003656	00240000-5694-d8a3-79c2-820da15fca04	0	1001
\.


--
-- TOC entry 3181 (class 0 OID 35332338)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5694-d8a7-e6e6-c714aa504543	000e0000-5694-d8a6-e646-c7208720d646	00080000-5694-d8a6-6352-303751841c8a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5694-d8a3-45ee-519b709839ec
00270000-5694-d8a7-560a-1ec79ca9e7d3	000e0000-5694-d8a6-e646-c7208720d646	00080000-5694-d8a6-6352-303751841c8a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5694-d8a3-45ee-519b709839ec
\.


--
-- TOC entry 3138 (class 0 OID 35331902)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 35332154)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5694-d8a7-a513-9f57aef9485b	00180000-5694-d8a7-c195-263572c25d85	000c0000-5694-d8a7-3920-a1f9dae4f723	00090000-5694-d8a6-8eb1-ead926542f45	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-d8a7-e5f7-b50c8818f82e	00180000-5694-d8a7-c195-263572c25d85	000c0000-5694-d8a7-7b47-c601dfaafc37	00090000-5694-d8a6-75ef-cf9c2292d303	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-d8a7-c23f-99ee59ce2c27	00180000-5694-d8a7-c195-263572c25d85	000c0000-5694-d8a7-d8fe-9cbe9f13be5f	00090000-5694-d8a6-9233-b96a5a4de3e7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-d8a7-8260-e76a981295b2	00180000-5694-d8a7-c195-263572c25d85	000c0000-5694-d8a7-1925-7dcf72e3e75e	00090000-5694-d8a6-7d1f-6c5c5f473ac4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-d8a7-144d-841d5a436c17	00180000-5694-d8a7-c195-263572c25d85	000c0000-5694-d8a7-938b-680963ef17fe	00090000-5694-d8a6-61da-85311db9d6a9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-d8a7-f951-338f44abb10e	00180000-5694-d8a7-5e95-e29a8fd09491	\N	00090000-5694-d8a6-61da-85311db9d6a9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5694-d8a7-b4fb-ced24a51753f	00180000-5694-d8a7-5e95-e29a8fd09491	\N	00090000-5694-d8a6-75ef-cf9c2292d303	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3162 (class 0 OID 35332174)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5694-d8a3-c5ff-f12d4f98b5f9	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5694-d8a3-4271-d28946ecf35b	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5694-d8a3-eb18-51ba029b3c6e	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5694-d8a3-5046-355228bb0357	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5694-d8a3-59ab-a8c57081666a	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5694-d8a3-59ea-70c1a352aea8	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3184 (class 0 OID 35332379)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5694-d8a3-eb75-839fc4b8b265	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5694-d8a3-74ee-ba7df67555bd	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5694-d8a3-14f9-1f31232b6d37	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5694-d8a3-de4d-192b19eb83c2	04	Režija	Režija	Režija	umetnik	30
000f0000-5694-d8a3-acba-50366fa5249c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5694-d8a3-06cc-531dab3a8144	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5694-d8a3-6508-ec038e7ca69a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5694-d8a3-a062-ad4af6a0c8c0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5694-d8a3-30cc-356697a48d3a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5694-d8a3-2d06-9800f2a595bc	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5694-d8a3-5d24-3d22b79310d4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5694-d8a3-1056-a13d86b5fa55	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5694-d8a3-d731-c0648a94be6e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5694-d8a3-8c34-b2fb798fa807	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5694-d8a3-f3ea-bb911748c1a0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5694-d8a3-9673-6d632a86015c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5694-d8a3-b220-5103817c2408	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5694-d8a3-1531-c274925dd3b4	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3135 (class 0 OID 35331853)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5694-d8a6-7cc4-eb18cc6fb6f5	0001	šola	osnovna ali srednja šola
00400000-5694-d8a6-9a1f-8fc4b3a07066	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5694-d8a6-5cd2-b0ef302d9938	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3197 (class 0 OID 35332684)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5694-d8a3-6078-a0438f41d36f	01	Velika predstava	f	1.00	1.00
002b0000-5694-d8a3-abb1-88e50265c0f1	02	Mala predstava	f	0.50	0.50
002b0000-5694-d8a3-2fef-b42937fb84ee	03	Mala koprodukcija	t	0.40	1.00
002b0000-5694-d8a3-c168-3db265708dab	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5694-d8a3-b725-6ec1613c0c59	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3158 (class 0 OID 35332134)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5694-d8a3-4867-f25636a7ad1b	0001	prva vaja	prva vaja
00420000-5694-d8a3-3683-0ab54ceea807	0002	tehnična vaja	tehnična vaja
00420000-5694-d8a3-5715-82636a961162	0003	lučna vaja	lučna vaja
00420000-5694-d8a3-8ca8-8a854bd9fc27	0004	kostumska vaja	kostumska vaja
00420000-5694-d8a3-2909-c19a3f6549b1	0005	foto vaja	foto vaja
00420000-5694-d8a3-016e-5e54f1c73467	0006	1. glavna vaja	1. glavna vaja
00420000-5694-d8a3-7572-0bcaf97d7eca	0007	2. glavna vaja	2. glavna vaja
00420000-5694-d8a3-fa13-9a570d204a7e	0008	1. generalka	1. generalka
00420000-5694-d8a3-9f74-adfe53d4abea	0009	2. generalka	2. generalka
00420000-5694-d8a3-e33b-3f947f24f13f	0010	odprta generalka	odprta generalka
00420000-5694-d8a3-0d18-74c0e0614950	0011	obnovitvena vaja	obnovitvena vaja
00420000-5694-d8a3-2901-2fbfe2ea5eb6	0012	italijanka	krajša "obnovitvena" vaja
00420000-5694-d8a3-30a2-875a74285ccc	0013	pevska vaja	pevska vaja
00420000-5694-d8a3-921b-b253b8ba17d5	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5694-d8a3-8dd8-08086cce6ba8	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3144 (class 0 OID 35331975)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 35331789)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5694-d8a4-e76e-6049f83a8c01	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRONUS0ZAvIcag22TYqZ2T0kpcS71u/f9e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-81d4-3a3bc07f551d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-7b49-6d5d519fed3b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-022f-49abb9c16e2c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-4656-341efa287c5d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-a925-ee6d3d841463	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-52ee-ab1d013ae8a1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-cdca-fb8b7e2bbd41	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-9592-315b4933d16c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-8688-ca46840adc35	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-5983-24722ee604f2	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-aa60-ac080f04b17c	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-bb00-fedd0c34cd67	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-51fc-81b7ee98e905	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-b367-63889ac449b9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-0dfa-fec4805d3dee	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-1996-1b057e628cb6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-da89-07f71b94fa90	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-dfb6-662d6ca29448	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-ad80-5604b01dc271	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-9520-c194ff26a542	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-aba1-4c3b6e13de78	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-a398-e442c3646515	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-1a8e-a5fdd4fa220d	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-598b-20ec477eff86	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-a795-a745ad0f4aa9	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5694-d8a6-64bb-a4e608a47c7d	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5694-d8a4-6817-f618a21f5c86	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 35332429)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5694-d8a6-2495-4813bef4da53	00160000-5694-d8a6-2bab-0fddff75e52d	\N	00140000-5694-d8a3-7a8a-e5db57380c09	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5694-d8a6-598a-4eea8739d727
000e0000-5694-d8a6-e646-c7208720d646	00160000-5694-d8a6-9fa2-962536b21c22	\N	00140000-5694-d8a3-b357-2dc70fe92e30	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5694-d8a6-74c5-56a4d0cbe58e
000e0000-5694-d8a6-7775-7dc823b3aa8e	\N	\N	00140000-5694-d8a3-b357-2dc70fe92e30	00190000-5694-d8a6-3cb1-6223af9ab43e	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-d8a6-598a-4eea8739d727
000e0000-5694-d8a6-e3d2-3013f1b50d3a	\N	\N	00140000-5694-d8a3-b357-2dc70fe92e30	00190000-5694-d8a6-3cb1-6223af9ab43e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-d8a6-598a-4eea8739d727
000e0000-5694-d8a6-8203-fb2984670468	\N	\N	00140000-5694-d8a3-b357-2dc70fe92e30	00190000-5694-d8a6-3cb1-6223af9ab43e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-9d24-a3a8adcc0575	\N	\N	00140000-5694-d8a3-b357-2dc70fe92e30	00190000-5694-d8a6-3cb1-6223af9ab43e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-1f34-fd62c454f92b	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-f05b-1d90b6306c61	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-6b53-13502b0ba807	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-42f6-1fa60e08e9d0	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-0584-fd779563f42b	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-0d71-f5b077b166fe	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-b6ed-27988a70f012	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-108d-e78ad06eee71	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
000e0000-5694-d8a6-382a-2d70d23c8294	\N	\N	00140000-5694-d8a3-d8a2-7c1ba1c73fff	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-d8a6-30c8-882ebae670b2
\.


--
-- TOC entry 3152 (class 0 OID 35332074)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5694-d8a7-45f3-1fd6cf75fae6	\N	000e0000-5694-d8a6-e646-c7208720d646	1	
00200000-5694-d8a7-3a3a-8984cae2d884	\N	000e0000-5694-d8a6-e646-c7208720d646	2	
00200000-5694-d8a7-1297-8c61a460fedd	\N	000e0000-5694-d8a6-e646-c7208720d646	3	
00200000-5694-d8a7-17e0-ba7c93b90ee4	\N	000e0000-5694-d8a6-e646-c7208720d646	4	
00200000-5694-d8a7-bf48-c2ac76367eb0	\N	000e0000-5694-d8a6-e646-c7208720d646	5	
\.


--
-- TOC entry 3171 (class 0 OID 35332242)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 35332352)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5694-d8a3-ab51-278672b0d5ee	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5694-d8a3-758d-ea598858c6d0	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5694-d8a3-ed75-8409605390d7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5694-d8a3-0a72-b1cde2f0ef68	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5694-d8a3-e761-4a9c927c2385	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5694-d8a3-6809-44bb5661cfb2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5694-d8a3-8773-7e9cd9651675	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5694-d8a3-50bf-4c40d04f9a81	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5694-d8a3-45ee-519b709839ec	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5694-d8a3-3671-c7d1259c98d9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5694-d8a3-51e6-b966c7adfc7a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5694-d8a3-f032-ebca3aa9c9bd	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5694-d8a3-8a72-a4a3139d3026	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5694-d8a3-3aca-228853f36419	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5694-d8a3-c699-eede6536643d	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5694-d8a3-fe32-2dc3a55072cf	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5694-d8a3-1a1f-949d1d069a0d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5694-d8a3-8bd8-eff70608022f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5694-d8a3-d0a2-4e9bfa1d618d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5694-d8a3-f6b8-4c9c7f0135ea	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5694-d8a3-22b7-2e4d191f8453	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5694-d8a3-47bc-383035926fd6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5694-d8a3-fbd3-1b2c7a20e73b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5694-d8a3-a1b7-3a543a64f042	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5694-d8a3-b2a0-af814bc4c794	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5694-d8a3-29a3-cffaffa9b6c8	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5694-d8a3-9f08-32d5c711daa5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5694-d8a3-f54f-0ff5453afd22	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3200 (class 0 OID 35332734)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 35332703)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 35332746)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 35332314)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5694-d8a6-e77e-cfae015338b7	00090000-5694-d8a6-75ef-cf9c2292d303	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-d8a6-e900-3fa420eeb2fb	00090000-5694-d8a6-9233-b96a5a4de3e7	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-d8a6-0e09-981a55ab6194	00090000-5694-d8a6-ad6a-d32974269d60	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-d8a6-36b1-687c953ece0e	00090000-5694-d8a6-2e4a-db66c264e025	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-d8a6-189e-6be29865fee8	00090000-5694-d8a6-44d1-90a938489e1f	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-d8a6-a231-3e6bca8de35b	00090000-5694-d8a6-9b70-0cb2f3bc4af5	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3155 (class 0 OID 35332118)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35332419)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5694-d8a3-7a8a-e5db57380c09	01	Drama	drama (SURS 01)
00140000-5694-d8a3-1e57-f32e2000cb37	02	Opera	opera (SURS 02)
00140000-5694-d8a3-6c55-80f120a352d1	03	Balet	balet (SURS 03)
00140000-5694-d8a3-d859-6fc4833f893c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5694-d8a3-d8a2-7c1ba1c73fff	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5694-d8a3-b357-2dc70fe92e30	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5694-d8a3-5e9f-ba8df540dfb5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3177 (class 0 OID 35332304)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2607 (class 2606 OID 35331852)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 35332478)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 35332468)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 35331843)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 35332335)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 35332377)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 35332787)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 35332171)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 35332106)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 35332128)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 35332133)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 35332701)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 35332001)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 35332547)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 35332300)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 35332072)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 35332039)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 35332015)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 35332207)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 35332764)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 35332771)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2896 (class 2606 OID 35332795)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2753 (class 2606 OID 35332234)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 35331973)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 35331871)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 35331935)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 35331898)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 35331832)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2596 (class 2606 OID 35331817)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 35332240)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 35332276)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 35332414)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 35331926)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 35331961)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 35332652)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 35332213)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 35331951)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 35332091)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 35332060)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2674 (class 2606 OID 35332052)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 35332225)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 35332661)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 35332669)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 35332639)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 35332682)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 35332258)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 35332198)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 35332189)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 35332401)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 35332328)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 35332027)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 35331788)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 35332267)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 35331806)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2598 (class 2606 OID 35331826)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 35332285)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 35332220)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 35332152)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 35331776)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 35331764)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 35331758)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 35332348)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 35331907)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 35332163)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 35332181)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 35332388)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 35331860)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 35332694)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 35332141)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 35331986)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 35331801)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 35332447)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 35332081)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 35332248)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 35332360)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 35332744)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 35332728)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 35332752)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 35332318)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 35332122)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 35332427)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 35332312)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 1259 OID 35332116)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2691 (class 1259 OID 35332117)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2692 (class 1259 OID 35332115)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2693 (class 1259 OID 35332114)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2694 (class 1259 OID 35332113)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2796 (class 1259 OID 35332349)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2797 (class 1259 OID 35332350)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2798 (class 1259 OID 35332351)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2882 (class 1259 OID 35332766)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2883 (class 1259 OID 35332765)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2625 (class 1259 OID 35331928)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2626 (class 1259 OID 35331929)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2754 (class 1259 OID 35332241)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2869 (class 1259 OID 35332732)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2870 (class 1259 OID 35332731)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2871 (class 1259 OID 35332733)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2872 (class 1259 OID 35332730)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2873 (class 1259 OID 35332729)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2748 (class 1259 OID 35332227)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2749 (class 1259 OID 35332226)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2682 (class 1259 OID 35332082)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2683 (class 1259 OID 35332083)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 35332301)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 35332303)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2780 (class 1259 OID 35332302)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2657 (class 1259 OID 35332017)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 35332016)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2860 (class 1259 OID 35332683)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2812 (class 1259 OID 35332416)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2813 (class 1259 OID 35332417)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 35332418)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2879 (class 1259 OID 35332753)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2821 (class 1259 OID 35332452)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2822 (class 1259 OID 35332449)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2823 (class 1259 OID 35332453)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2824 (class 1259 OID 35332451)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2825 (class 1259 OID 35332450)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2647 (class 1259 OID 35331988)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 35331987)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2616 (class 1259 OID 35331901)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2766 (class 1259 OID 35332268)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2600 (class 1259 OID 35331833)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2601 (class 1259 OID 35331834)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2771 (class 1259 OID 35332288)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2772 (class 1259 OID 35332287)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2773 (class 1259 OID 35332286)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2630 (class 1259 OID 35331938)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2631 (class 1259 OID 35331937)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2632 (class 1259 OID 35331939)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2670 (class 1259 OID 35332055)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2671 (class 1259 OID 35332053)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 35332054)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2580 (class 1259 OID 35331766)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2728 (class 1259 OID 35332193)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2729 (class 1259 OID 35332191)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2730 (class 1259 OID 35332190)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2731 (class 1259 OID 35332192)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2591 (class 1259 OID 35331807)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2592 (class 1259 OID 35331808)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2757 (class 1259 OID 35332249)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2892 (class 1259 OID 35332788)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2794 (class 1259 OID 35332337)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2795 (class 1259 OID 35332336)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2893 (class 1259 OID 35332796)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2894 (class 1259 OID 35332797)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2743 (class 1259 OID 35332214)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2788 (class 1259 OID 35332329)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2789 (class 1259 OID 35332330)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2842 (class 1259 OID 35332552)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2843 (class 1259 OID 35332551)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2844 (class 1259 OID 35332548)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2845 (class 1259 OID 35332549)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2846 (class 1259 OID 35332550)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2636 (class 1259 OID 35331953)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 35331952)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2638 (class 1259 OID 35331954)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2760 (class 1259 OID 35332262)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2761 (class 1259 OID 35332261)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2852 (class 1259 OID 35332662)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2853 (class 1259 OID 35332663)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2835 (class 1259 OID 35332482)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2836 (class 1259 OID 35332483)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2837 (class 1259 OID 35332480)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2838 (class 1259 OID 35332481)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2722 (class 1259 OID 35332172)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2723 (class 1259 OID 35332173)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2784 (class 1259 OID 35332319)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 35332320)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2734 (class 1259 OID 35332202)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2735 (class 1259 OID 35332201)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2736 (class 1259 OID 35332199)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2737 (class 1259 OID 35332200)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2831 (class 1259 OID 35332470)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2832 (class 1259 OID 35332469)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2661 (class 1259 OID 35332028)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2664 (class 1259 OID 35332042)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2665 (class 1259 OID 35332041)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2666 (class 1259 OID 35332040)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2667 (class 1259 OID 35332043)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2681 (class 1259 OID 35332073)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2675 (class 1259 OID 35332061)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 35332062)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2849 (class 1259 OID 35332653)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2868 (class 1259 OID 35332702)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2886 (class 1259 OID 35332772)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2887 (class 1259 OID 35332773)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2612 (class 1259 OID 35331873)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2613 (class 1259 OID 35331872)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2621 (class 1259 OID 35331908)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 35331909)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2701 (class 1259 OID 35332123)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 35332166)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 35332165)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2717 (class 1259 OID 35332164)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2695 (class 1259 OID 35332108)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2696 (class 1259 OID 35332109)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2697 (class 1259 OID 35332112)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2698 (class 1259 OID 35332107)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2699 (class 1259 OID 35332111)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2700 (class 1259 OID 35332110)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2629 (class 1259 OID 35331927)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 35331861)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 35331862)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2653 (class 1259 OID 35332002)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 35332004)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2655 (class 1259 OID 35332003)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2656 (class 1259 OID 35332005)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2742 (class 1259 OID 35332208)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2817 (class 1259 OID 35332415)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2826 (class 1259 OID 35332448)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2808 (class 1259 OID 35332389)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 35332390)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2619 (class 1259 OID 35331899)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 35331900)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2726 (class 1259 OID 35332182)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 35332183)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2781 (class 1259 OID 35332313)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 35331777)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 35331974)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2635 (class 1259 OID 35331936)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 35331765)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2865 (class 1259 OID 35332695)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2764 (class 1259 OID 35332260)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2765 (class 1259 OID 35332259)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2710 (class 1259 OID 35332142)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 35332143)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2839 (class 1259 OID 35332479)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 35331962)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2818 (class 1259 OID 35332428)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2876 (class 1259 OID 35332745)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2858 (class 1259 OID 35332670)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2859 (class 1259 OID 35332671)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2805 (class 1259 OID 35332378)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2714 (class 1259 OID 35332153)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 35331827)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2936 (class 2606 OID 35332968)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2935 (class 2606 OID 35332973)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2930 (class 2606 OID 35332998)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2932 (class 2606 OID 35332988)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2937 (class 2606 OID 35332963)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2933 (class 2606 OID 35332983)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2931 (class 2606 OID 35332993)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2934 (class 2606 OID 35332978)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2975 (class 2606 OID 35333178)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2974 (class 2606 OID 35333183)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2973 (class 2606 OID 35333188)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 35333353)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3008 (class 2606 OID 35333348)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2909 (class 2606 OID 35332853)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2908 (class 2606 OID 35332858)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2956 (class 2606 OID 35333093)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3002 (class 2606 OID 35333333)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3003 (class 2606 OID 35333328)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3001 (class 2606 OID 35333338)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 35333323)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3005 (class 2606 OID 35333318)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2954 (class 2606 OID 35333088)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2955 (class 2606 OID 35333083)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2929 (class 2606 OID 35332953)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2928 (class 2606 OID 35332958)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 35333133)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 35333143)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2965 (class 2606 OID 35333138)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2918 (class 2606 OID 35332908)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 35332903)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 35333073)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2999 (class 2606 OID 35333308)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2978 (class 2606 OID 35333193)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 35333198)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2976 (class 2606 OID 35333203)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3006 (class 2606 OID 35333343)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2980 (class 2606 OID 35333223)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2983 (class 2606 OID 35333208)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2979 (class 2606 OID 35333228)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2981 (class 2606 OID 35333218)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2982 (class 2606 OID 35333213)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2916 (class 2606 OID 35332898)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2917 (class 2606 OID 35332893)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2904 (class 2606 OID 35332838)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2905 (class 2606 OID 35332833)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2960 (class 2606 OID 35333113)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2901 (class 2606 OID 35332813)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2900 (class 2606 OID 35332818)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2961 (class 2606 OID 35333128)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2962 (class 2606 OID 35333123)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2963 (class 2606 OID 35333118)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2911 (class 2606 OID 35332868)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2912 (class 2606 OID 35332863)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2910 (class 2606 OID 35332873)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 35332933)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2924 (class 2606 OID 35332923)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 35332928)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 35332798)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2944 (class 2606 OID 35333048)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2946 (class 2606 OID 35333038)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2947 (class 2606 OID 35333033)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2945 (class 2606 OID 35333043)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2899 (class 2606 OID 35332803)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2898 (class 2606 OID 35332808)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2957 (class 2606 OID 35333098)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3011 (class 2606 OID 35333368)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 35333173)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2972 (class 2606 OID 35333168)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3013 (class 2606 OID 35333373)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3012 (class 2606 OID 35333378)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2953 (class 2606 OID 35333078)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2970 (class 2606 OID 35333158)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2969 (class 2606 OID 35333163)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2990 (class 2606 OID 35333283)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 35333278)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2994 (class 2606 OID 35333263)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2993 (class 2606 OID 35333268)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2992 (class 2606 OID 35333273)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2914 (class 2606 OID 35332883)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 35332878)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 35332888)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2958 (class 2606 OID 35333108)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2959 (class 2606 OID 35333103)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2997 (class 2606 OID 35333293)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2996 (class 2606 OID 35333298)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2987 (class 2606 OID 35333253)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2986 (class 2606 OID 35333258)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2989 (class 2606 OID 35333243)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2988 (class 2606 OID 35333248)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2943 (class 2606 OID 35333023)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2942 (class 2606 OID 35333028)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2968 (class 2606 OID 35333148)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2967 (class 2606 OID 35333153)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 35333068)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2949 (class 2606 OID 35333063)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2951 (class 2606 OID 35333053)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2950 (class 2606 OID 35333058)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2984 (class 2606 OID 35333238)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 35333233)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2920 (class 2606 OID 35332913)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2921 (class 2606 OID 35332918)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 35332948)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 35332938)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2925 (class 2606 OID 35332943)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2995 (class 2606 OID 35333288)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2998 (class 2606 OID 35333303)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 35333313)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3010 (class 2606 OID 35333358)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3009 (class 2606 OID 35333363)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2902 (class 2606 OID 35332828)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 35332823)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2907 (class 2606 OID 35332843)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2906 (class 2606 OID 35332848)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2938 (class 2606 OID 35333003)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 35333018)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 35333013)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2941 (class 2606 OID 35333008)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-12 11:42:50 CET

--
-- PostgreSQL database dump complete
--

