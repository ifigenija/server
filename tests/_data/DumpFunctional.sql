--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-18 15:13:00 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37518917)
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
-- TOC entry 241 (class 1259 OID 37519535)
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
-- TOC entry 240 (class 1259 OID 37519519)
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
-- TOC entry 184 (class 1259 OID 37518910)
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
-- TOC entry 183 (class 1259 OID 37518908)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37519396)
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
-- TOC entry 234 (class 1259 OID 37519426)
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
-- TOC entry 255 (class 1259 OID 37519838)
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
-- TOC entry 212 (class 1259 OID 37519232)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 37519158)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
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
-- TOC entry 206 (class 1259 OID 37519183)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37519188)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37519760)
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
-- TOC entry 196 (class 1259 OID 37519062)
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
-- TOC entry 242 (class 1259 OID 37519548)
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
-- TOC entry 227 (class 1259 OID 37519354)
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
-- TOC entry 202 (class 1259 OID 37519132)
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
-- TOC entry 199 (class 1259 OID 37519102)
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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 37519079)
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
-- TOC entry 216 (class 1259 OID 37519268)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37519818)
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
-- TOC entry 254 (class 1259 OID 37519831)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37519853)
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
-- TOC entry 220 (class 1259 OID 37519293)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 37519036)
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
-- TOC entry 187 (class 1259 OID 37518936)
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
-- TOC entry 191 (class 1259 OID 37519003)
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
-- TOC entry 188 (class 1259 OID 37518947)
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
-- TOC entry 180 (class 1259 OID 37518882)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 37518901)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37519300)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37519334)
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
-- TOC entry 237 (class 1259 OID 37519467)
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
-- TOC entry 190 (class 1259 OID 37518983)
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
-- TOC entry 193 (class 1259 OID 37519028)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37519704)
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
-- TOC entry 217 (class 1259 OID 37519274)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 37519013)
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
-- TOC entry 204 (class 1259 OID 37519150)
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
-- TOC entry 200 (class 1259 OID 37519117)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 37519125)
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
-- TOC entry 219 (class 1259 OID 37519286)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37519718)
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
-- TOC entry 246 (class 1259 OID 37519728)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37519617)
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
-- TOC entry 247 (class 1259 OID 37519736)
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
-- TOC entry 223 (class 1259 OID 37519315)
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
-- TOC entry 215 (class 1259 OID 37519259)
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
-- TOC entry 214 (class 1259 OID 37519249)
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
-- TOC entry 236 (class 1259 OID 37519456)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37519386)
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
-- TOC entry 198 (class 1259 OID 37519091)
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
-- TOC entry 177 (class 1259 OID 37518853)
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
-- TOC entry 176 (class 1259 OID 37518851)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37519328)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 37518891)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 37518875)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37519342)
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
-- TOC entry 218 (class 1259 OID 37519280)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37519203)
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
-- TOC entry 175 (class 1259 OID 37518840)
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
-- TOC entry 174 (class 1259 OID 37518832)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 37518827)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37519403)
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
-- TOC entry 189 (class 1259 OID 37518975)
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
-- TOC entry 211 (class 1259 OID 37519222)
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
    sodelujoc boolean,
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 37519239)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37519444)
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
-- TOC entry 186 (class 1259 OID 37518926)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37519748)
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
-- TOC entry 208 (class 1259 OID 37519193)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 37519048)
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
-- TOC entry 178 (class 1259 OID 37518862)
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
-- TOC entry 239 (class 1259 OID 37519494)
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
-- TOC entry 210 (class 1259 OID 37519213)
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
-- TOC entry 203 (class 1259 OID 37519143)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37519307)
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
-- TOC entry 233 (class 1259 OID 37519417)
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
-- TOC entry 251 (class 1259 OID 37519798)
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
-- TOC entry 250 (class 1259 OID 37519767)
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
-- TOC entry 252 (class 1259 OID 37519810)
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
-- TOC entry 229 (class 1259 OID 37519379)
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
-- TOC entry 172 (class 1259 OID 37017863)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 37519484)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37519369)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37518913)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37518856)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 37518917)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569c-f2e8-efe6-0f0d6d224167	10	30	Otroci	Abonma za otroke	200
000a0000-569c-f2e8-d25e-3b26e0a140a2	20	60	Mladina	Abonma za mladino	400
000a0000-569c-f2e8-e335-4bf4e9008fbd	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 37519535)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569c-f2e9-c0cb-c0cca976f3ae	000d0000-569c-f2e9-2ad0-5810ccbd705b	\N	00090000-569c-f2e8-3802-11b00d10a216	000b0000-569c-f2e8-1d0d-e1553676e6e6	0001	f	\N	\N	\N	3	t	t	t
000c0000-569c-f2e9-d031-86b594f2fa5c	000d0000-569c-f2e9-8af1-958a00aa446f	00100000-569c-f2e8-68b1-4bcce7f5cd5f	00090000-569c-f2e8-3098-9e355fe3b352	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569c-f2e9-6148-7bdab8ddb5c9	000d0000-569c-f2e9-87eb-4ef125d6941d	00100000-569c-f2e8-3aa1-47c72add5931	00090000-569c-f2e8-2e07-7fadc168f558	\N	0003	t	\N	2016-01-18	\N	2	t	f	f
000c0000-569c-f2e9-0b69-d8fa77c90089	000d0000-569c-f2e9-e06f-5c3ff1b9abfe	\N	00090000-569c-f2e8-30cb-82a507bb3cdd	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569c-f2e9-0eea-21db69b87ec2	000d0000-569c-f2e9-b111-3625551bfb47	\N	00090000-569c-f2e8-3a1c-45c41ec7e0f3	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569c-f2e9-cdbe-b7c2a2de8e4a	000d0000-569c-f2e9-7902-46cd1241c831	\N	00090000-569c-f2e8-019b-901524379f9e	000b0000-569c-f2e8-252f-981fe64e3305	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569c-f2e9-0950-329bb1ba881c	000d0000-569c-f2e9-0df6-8ffb3666956b	00100000-569c-f2e8-30f3-85011f8e4564	00090000-569c-f2e8-4102-4b7a765260c9	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569c-f2e9-9397-79d65542bff6	000d0000-569c-f2e9-5dcb-eea7a991fd14	\N	00090000-569c-f2e8-8a73-e246c2938d10	000b0000-569c-f2e8-8f0d-c540a58deb78	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569c-f2e9-0edd-e11037b2ae12	000d0000-569c-f2e9-0df6-8ffb3666956b	00100000-569c-f2e8-9c37-491b8eef65bf	00090000-569c-f2e8-b638-f8ef06b7b669	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569c-f2e9-e740-ba12224ae0e7	000d0000-569c-f2e9-0df6-8ffb3666956b	00100000-569c-f2e8-6886-7106693bf434	00090000-569c-f2e8-c356-ca8f2bcea949	\N	0010	t	\N	2016-01-18	\N	16	f	f	t
000c0000-569c-f2e9-de92-596fefb2555b	000d0000-569c-f2e9-0df6-8ffb3666956b	00100000-569c-f2e8-cce8-dfbd4e32c906	00090000-569c-f2e8-b4e2-075786e0c632	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569c-f2e9-498c-8226bec33263	000d0000-569c-f2e9-0f37-0180e34bc588	00100000-569c-f2e8-68b1-4bcce7f5cd5f	00090000-569c-f2e8-3098-9e355fe3b352	000b0000-569c-f2e8-b94b-d7776b16611e	0012	t	\N	\N	\N	2	t	t	t
000c0000-569c-f2e9-012c-7f983253b48b	000d0000-569c-f2e9-b682-88551b6a6d1a	\N	00090000-569c-f2e8-8a73-e246c2938d10	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-439c-798bd0b3913b	000d0000-569c-f2e9-b682-88551b6a6d1a	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-ab3d-5ca77378d260	000d0000-569c-f2e9-8dc7-747bed2c453c	00100000-569c-f2e8-3aa1-47c72add5931	00090000-569c-f2e8-2e07-7fadc168f558	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-f328-d317b00d572c	000d0000-569c-f2e9-8dc7-747bed2c453c	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-835e-ec0c9b188ae3	000d0000-569c-f2e9-5b71-41948e583ae3	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-632b-0a430ba534b0	000d0000-569c-f2e9-5b71-41948e583ae3	\N	00090000-569c-f2e8-8a73-e246c2938d10	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-230a-2491afa0224b	000d0000-569c-f2e9-ba0b-85d0dd98aa0c	00100000-569c-f2e8-30f3-85011f8e4564	00090000-569c-f2e8-4102-4b7a765260c9	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-9525-e26a5d43f687	000d0000-569c-f2e9-ba0b-85d0dd98aa0c	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-64a7-16e9983e6a5e	000d0000-569c-f2e9-0a95-4392f49fed68	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-6348-21058b985ca6	000d0000-569c-f2e9-0a95-4392f49fed68	00100000-569c-f2e8-30f3-85011f8e4564	00090000-569c-f2e8-4102-4b7a765260c9	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-f5c3-831f81c5f4a9	000d0000-569c-f2e9-9d7a-04604df1a524	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-9cea-c7558aadbf23	000d0000-569c-f2e9-de33-395f213466dd	\N	00090000-569c-f2e8-8a73-e246c2938d10	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-c720-b2efb724c493	000d0000-569c-f2e9-1274-064dba9c4dd1	\N	00090000-569c-f2e8-8a73-e246c2938d10	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-c46e-38b6298b88b5	000d0000-569c-f2e9-1274-064dba9c4dd1	00100000-569c-f2e8-3aa1-47c72add5931	00090000-569c-f2e8-2e07-7fadc168f558	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-5c12-9a725391c3fb	000d0000-569c-f2e9-f356-8fb7097c03eb	\N	00090000-569c-f2e8-0340-49e0f6317af0	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569c-f2e9-d504-7d5614a8777a	000d0000-569c-f2e9-f356-8fb7097c03eb	\N	00090000-569c-f2e8-fc23-2c7b75db70a4	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-d7b3-386aa053753a	000d0000-569c-f2e9-ac90-641d4295b5cd	\N	00090000-569c-f2e8-8a73-e246c2938d10	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569c-f2e9-66f5-8cde8cc7d4aa	000d0000-569c-f2e9-ac90-641d4295b5cd	00100000-569c-f2e8-3aa1-47c72add5931	00090000-569c-f2e8-2e07-7fadc168f558	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569c-f2e9-da3a-14f1c8d3bb0d	000d0000-569c-f2e9-ac90-641d4295b5cd	\N	00090000-569c-f2e8-fc23-2c7b75db70a4	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569c-f2e9-1c95-ecbc9e70750a	000d0000-569c-f2e9-ac90-641d4295b5cd	\N	00090000-569c-f2e8-0340-49e0f6317af0	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569c-f2e9-c297-a12143835313	000d0000-569c-f2e9-e7c8-c5c997c5a0be	\N	00090000-569c-f2e8-8a73-e246c2938d10	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569c-f2e9-a033-8f737f04b863	000d0000-569c-f2e9-6f3e-0b4f9b740607	00100000-569c-f2e8-3aa1-47c72add5931	00090000-569c-f2e8-2e07-7fadc168f558	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569c-f2e9-99a4-e551f2832b1a	000d0000-569c-f2e9-6f3e-0b4f9b740607	\N	00090000-569c-f2e8-114f-6badab70e5ce	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 37519519)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 37518910)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 37519396)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569c-f2e8-bbc3-0710c0472574	00160000-569c-f2e8-0eff-efc6b02f3e9c	00090000-569c-f2e8-fc23-2c7b75db70a4	aizv	10	t
003d0000-569c-f2e8-9686-480c98d0d804	00160000-569c-f2e8-0eff-efc6b02f3e9c	00090000-569c-f2e8-78e7-9181232a9dfb	apri	14	t
003d0000-569c-f2e8-d50d-43f9fc16228f	00160000-569c-f2e8-09f7-9dcd7852f957	00090000-569c-f2e8-0340-49e0f6317af0	aizv	11	t
003d0000-569c-f2e8-16c6-b41ba1f0edc4	00160000-569c-f2e8-cf81-4930c7db159f	00090000-569c-f2e8-f70d-4fa02d281633	aizv	12	t
003d0000-569c-f2e8-8da0-c224de431075	00160000-569c-f2e8-0eff-efc6b02f3e9c	00090000-569c-f2e8-114f-6badab70e5ce	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 37519426)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569c-f2e8-0eff-efc6b02f3e9c	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569c-f2e8-09f7-9dcd7852f957	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569c-f2e8-cf81-4930c7db159f	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 37519838)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 37519232)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37519158)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569c-f2e9-9ac6-0cefc9360894	\N	00200000-569c-f2e9-31cd-96ac0c540d2e	\N	\N	\N	00220000-569c-f2e8-95f1-27b1353b80ce	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569c-f2e9-753c-10813cd87d83	\N	00200000-569c-f2e9-9e06-9822d6eefffd	\N	\N	\N	00220000-569c-f2e8-95f1-27b1353b80ce	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569c-f2e9-2248-02a7346266b4	\N	00200000-569c-f2e9-1a64-ae78789a5efd	\N	\N	\N	00220000-569c-f2e8-0822-16e144be7698	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569c-f2e9-dfbd-7b0b989dd08a	\N	00200000-569c-f2e9-71f9-6ce3e890ddb9	\N	\N	\N	00220000-569c-f2e8-37b6-976b8038f721	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569c-f2e9-daf6-0d1345b48313	\N	00200000-569c-f2e9-020b-bf1a740cb1cb	\N	\N	\N	00220000-569c-f2e8-0761-3857ccc15de7	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569c-f2e9-96b3-317c9a866976	001b0000-569c-f2e9-276a-75a8d99903f7	\N	\N	\N	\N	00220000-569c-f2e8-779f-7e0becd5d018	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 37519183)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37519188)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 37519760)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37519062)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569c-f2e5-6e46-da62e3aa688a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569c-f2e5-f9a4-cd36d61e8c4d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569c-f2e5-c395-36fdfb7ae5d6	AL	ALB	008	Albania 	Albanija	\N
00040000-569c-f2e5-ddc9-08cdcef505e1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569c-f2e5-62e5-64f0369dd913	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569c-f2e5-d67c-8e8f420fa20a	AD	AND	020	Andorra 	Andora	\N
00040000-569c-f2e5-a999-ea28fce95ef2	AO	AGO	024	Angola 	Angola	\N
00040000-569c-f2e5-8cb5-21e754165ec7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569c-f2e5-c977-89a951990647	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569c-f2e5-161c-8f7df537bd1c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-f2e5-6f0f-2b613a7f4d77	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569c-f2e5-fa06-deaa2927b561	AM	ARM	051	Armenia 	Armenija	\N
00040000-569c-f2e5-ef86-a0364381bc0d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569c-f2e5-14e3-2bb2cc78b925	AU	AUS	036	Australia 	Avstralija	\N
00040000-569c-f2e5-e0f9-6870f65e9b95	AT	AUT	040	Austria 	Avstrija	\N
00040000-569c-f2e5-8918-a2d1659670ef	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569c-f2e5-f728-2efbace42c19	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569c-f2e5-4be7-2303d86d150d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569c-f2e5-6478-b64d2e656303	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569c-f2e5-9866-5fa2200c9a2b	BB	BRB	052	Barbados 	Barbados	\N
00040000-569c-f2e5-3c58-1e17fa23a5da	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569c-f2e5-1788-b475516a5b60	BE	BEL	056	Belgium 	Belgija	\N
00040000-569c-f2e5-aae4-e195d5d4ced2	BZ	BLZ	084	Belize 	Belize	\N
00040000-569c-f2e5-a369-cf57ea787b4d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569c-f2e5-ba0e-95a11ffc2c48	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569c-f2e5-88a4-7b1674f90078	BT	BTN	064	Bhutan 	Butan	\N
00040000-569c-f2e5-fe17-ad03da73c7c7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569c-f2e5-1116-6fb8018fdc7c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569c-f2e5-4eff-0e012d5d230d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569c-f2e5-7b93-646a89563253	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569c-f2e5-6353-eff9f1c358ee	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569c-f2e5-f620-2fe473344b4d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569c-f2e5-141c-16e10b508cec	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569c-f2e5-4ea2-df4a89227fde	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569c-f2e5-9190-ce39d8acc3d8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569c-f2e5-eb09-c8cc49aa9329	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569c-f2e5-0832-86c204418ada	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569c-f2e5-ba2a-068118c944ac	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569c-f2e5-cf3b-0d79a60e473d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569c-f2e5-84b2-14d004238733	CA	CAN	124	Canada 	Kanada	\N
00040000-569c-f2e5-5ca9-e9ecfe580369	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569c-f2e5-82de-a34ba5e57a91	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569c-f2e5-2fb2-2fe238bb211b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569c-f2e5-8cc1-f5fc3c5f6069	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569c-f2e5-9a13-b976dab18d79	CL	CHL	152	Chile 	Čile	\N
00040000-569c-f2e5-8d27-d32f598496ae	CN	CHN	156	China 	Kitajska	\N
00040000-569c-f2e5-bd2c-0c1aa2dfb763	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569c-f2e5-60df-78bb06078b02	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569c-f2e5-3fd7-aee77ca7960e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569c-f2e5-97fe-c315489e181f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569c-f2e5-577e-cc5d183aa048	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569c-f2e5-ec8b-23057d464f84	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569c-f2e5-9346-6fd8f38887cd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569c-f2e5-2f3e-88dfe9c66254	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569c-f2e5-6205-4586169c3ef4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569c-f2e5-bcbc-34b94fe3487d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569c-f2e5-ce60-27e3fb07301a	CU	CUB	192	Cuba 	Kuba	\N
00040000-569c-f2e5-55a4-c8e5a2ad6156	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569c-f2e5-53fe-58875b79136d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569c-f2e5-9a51-c6f5203d9815	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569c-f2e5-3e3f-bfec8ffd3891	DK	DNK	208	Denmark 	Danska	\N
00040000-569c-f2e5-2274-da7d75d67f89	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569c-f2e5-7c6c-82630ac30a59	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-f2e5-40a4-8717a602e608	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569c-f2e5-5b45-2a8e18a48071	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569c-f2e5-2959-56b0d1cb3da6	EG	EGY	818	Egypt 	Egipt	\N
00040000-569c-f2e5-73d3-71e5eec449bb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569c-f2e5-b2d7-2e358bb51f2c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569c-f2e5-d1ad-75f3dcf83eec	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569c-f2e5-14f2-3a2c4599c0e5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569c-f2e5-e0db-a335a27bc1f4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569c-f2e5-ad0a-ca4151185654	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569c-f2e5-b3e3-efeba6d17d55	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569c-f2e5-e306-4bcf365a3229	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569c-f2e5-52fe-35c587121b2f	FI	FIN	246	Finland 	Finska	\N
00040000-569c-f2e5-fc15-44fa6893df03	FR	FRA	250	France 	Francija	\N
00040000-569c-f2e5-ead6-124abfcf1e89	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569c-f2e5-bc72-b50f47bfdf4c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569c-f2e5-a966-9ef39ffd6811	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569c-f2e5-74db-58ebc1d22768	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569c-f2e5-b5e3-8994587b3957	GA	GAB	266	Gabon 	Gabon	\N
00040000-569c-f2e5-728c-782777188cf7	GM	GMB	270	Gambia 	Gambija	\N
00040000-569c-f2e5-81e5-26b9a75f7e70	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569c-f2e5-8b5f-9cdddf43b711	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569c-f2e5-2769-e3f7624fdfd7	GH	GHA	288	Ghana 	Gana	\N
00040000-569c-f2e5-b82a-0b2d85f1f9b4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569c-f2e5-4eec-d5b47bef95a2	GR	GRC	300	Greece 	Grčija	\N
00040000-569c-f2e5-881c-84ac629bf0fc	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569c-f2e5-663e-4d40e0a45bdc	GD	GRD	308	Grenada 	Grenada	\N
00040000-569c-f2e5-142a-d06e68543aa7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569c-f2e5-e126-3ceb696fb4ff	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569c-f2e5-a04d-6d3be7e8f18d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569c-f2e5-7d9b-f84a63aa930a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569c-f2e5-8e4d-35574970f1cb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569c-f2e5-7a9b-c22109438612	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569c-f2e5-55a7-f801cdcbb483	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569c-f2e5-dc04-cb00226bd8fb	HT	HTI	332	Haiti 	Haiti	\N
00040000-569c-f2e5-ea2f-a020ca13b10a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569c-f2e5-01cb-377f447df076	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569c-f2e5-ce37-5d62bed118e8	HN	HND	340	Honduras 	Honduras	\N
00040000-569c-f2e5-0f82-233e9244cb6f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569c-f2e5-c7ac-1ead73d00ab4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569c-f2e5-07d5-4c2c5f7dca96	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569c-f2e5-88ef-e98b8ba9c06a	IN	IND	356	India 	Indija	\N
00040000-569c-f2e5-bc7b-996e37430c6a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569c-f2e5-284b-068b12699789	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569c-f2e5-e74f-9407815c8d95	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569c-f2e5-1bf7-a59ed6e1f20f	IE	IRL	372	Ireland 	Irska	\N
00040000-569c-f2e5-dcb9-5038859fe64f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569c-f2e5-d7e8-c5260f020c30	IL	ISR	376	Israel 	Izrael	\N
00040000-569c-f2e5-9dcd-a2fc5b6a25f8	IT	ITA	380	Italy 	Italija	\N
00040000-569c-f2e5-48be-869ba868e3d8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569c-f2e5-4adc-8b62cea9b330	JP	JPN	392	Japan 	Japonska	\N
00040000-569c-f2e5-635c-65f492593403	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569c-f2e5-1d0b-3fabd1cf8395	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569c-f2e5-9a43-4e1fd3a45431	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569c-f2e5-4059-0c8f8be40712	KE	KEN	404	Kenya 	Kenija	\N
00040000-569c-f2e5-d8ec-9bc4909d87dc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569c-f2e5-8e24-70e3ee5490ad	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569c-f2e5-e651-5608f1dbc5d0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569c-f2e5-95c8-7f898894cc49	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569c-f2e5-b17b-77e9c0e8610e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569c-f2e5-2892-6c983d3daca4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569c-f2e5-d270-ede277b61ded	LV	LVA	428	Latvia 	Latvija	\N
00040000-569c-f2e5-d214-b44f9a155534	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569c-f2e5-6812-4ce7ff2396d1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569c-f2e5-4486-f2e00cadc2b6	LR	LBR	430	Liberia 	Liberija	\N
00040000-569c-f2e5-e7d0-17fdf03fcb30	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569c-f2e5-a0c3-e7701b68cb0f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569c-f2e5-d4dc-54fa096c7a22	LT	LTU	440	Lithuania 	Litva	\N
00040000-569c-f2e5-84a2-fe454725c57a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569c-f2e5-b17d-d587217672a7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569c-f2e5-42cd-d572d88dcb19	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569c-f2e5-579d-6eb587ded7f9	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569c-f2e5-bdf9-12fc7cdf73a7	MW	MWI	454	Malawi 	Malavi	\N
00040000-569c-f2e5-a7cd-51c3dfc8a464	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569c-f2e5-b596-ba458a0e4789	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569c-f2e5-c98c-7fecd4c0d10f	ML	MLI	466	Mali 	Mali	\N
00040000-569c-f2e5-0932-4be055d16266	MT	MLT	470	Malta 	Malta	\N
00040000-569c-f2e5-0312-175fd7c1d458	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569c-f2e5-d228-255d147683b1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569c-f2e5-1db2-9b73ccd5f949	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569c-f2e5-ef96-125696d55640	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569c-f2e5-a30c-ebfdb9dc0f8c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569c-f2e5-a800-1c72ec3954c0	MX	MEX	484	Mexico 	Mehika	\N
00040000-569c-f2e5-4693-93409b652af7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569c-f2e5-e473-afc3a18de1f4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569c-f2e5-ba94-73fa354565cf	MC	MCO	492	Monaco 	Monako	\N
00040000-569c-f2e5-0e64-964b0efaae6c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569c-f2e5-d292-8d513988fcdb	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569c-f2e5-7d8a-dad8008c27bb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569c-f2e5-b5b6-df538a10e0ff	MA	MAR	504	Morocco 	Maroko	\N
00040000-569c-f2e5-3350-4a9d6da1d496	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569c-f2e5-e832-a688f9dbc048	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569c-f2e5-cf95-f9771cd98934	NA	NAM	516	Namibia 	Namibija	\N
00040000-569c-f2e5-dca9-197b6ad1033a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569c-f2e5-a003-02309356a143	NP	NPL	524	Nepal 	Nepal	\N
00040000-569c-f2e5-5485-a7bb10489cd3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569c-f2e5-e579-0bf27c63454b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569c-f2e5-7a02-78975ea16181	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569c-f2e5-2ac8-f7c01943f2cf	NE	NER	562	Niger 	Niger 	\N
00040000-569c-f2e5-8a49-97dcc9fa9758	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569c-f2e5-4b3e-1631043cc8bc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569c-f2e5-c107-8212fc2e208f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569c-f2e5-d3c9-e489cd0c4cc6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569c-f2e5-14fa-354b7dda18b5	NO	NOR	578	Norway 	Norveška	\N
00040000-569c-f2e5-c617-ffa1669aa6a3	OM	OMN	512	Oman 	Oman	\N
00040000-569c-f2e5-feec-b032966d8e30	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569c-f2e5-e1cf-c7eb0e7876a0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569c-f2e5-2a9c-873ea472a256	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569c-f2e5-9455-1af72f1b9410	PA	PAN	591	Panama 	Panama	\N
00040000-569c-f2e5-2e1e-973b9e444087	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569c-f2e5-1e8d-4301450a0d30	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569c-f2e5-f391-c2d4adab757d	PE	PER	604	Peru 	Peru	\N
00040000-569c-f2e5-9656-55668086059d	PH	PHL	608	Philippines 	Filipini	\N
00040000-569c-f2e5-48aa-9a74d8030a4d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569c-f2e5-61ad-76fbaeef7039	PL	POL	616	Poland 	Poljska	\N
00040000-569c-f2e5-95b0-78aa96f837a5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569c-f2e5-1c48-25f6804ff3da	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569c-f2e5-a025-b8e5d4b50ddb	QA	QAT	634	Qatar 	Katar	\N
00040000-569c-f2e5-797d-f73db18fef3b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569c-f2e5-f6a8-bfc979175973	RO	ROU	642	Romania 	Romunija	\N
00040000-569c-f2e5-dcbf-a2d50f823d4b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569c-f2e5-9eb3-3914cfa20afb	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569c-f2e5-d72c-95981d451082	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569c-f2e5-92e4-a18838a0ba15	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569c-f2e5-0913-b16f46e4c0f9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569c-f2e5-553a-99140780de25	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569c-f2e5-3038-cb255c0b3e1d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569c-f2e5-03a8-726b962f990e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569c-f2e5-3210-c079bbd9a856	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569c-f2e5-c473-0044b1c4be66	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569c-f2e5-f4e0-8cf2b3e17c7a	SM	SMR	674	San Marino 	San Marino	\N
00040000-569c-f2e5-ef70-913882d6a60d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569c-f2e5-e39e-3111e309d57a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569c-f2e5-fef8-5e1b5a75a4e2	SN	SEN	686	Senegal 	Senegal	\N
00040000-569c-f2e5-b543-6ad992ce0609	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569c-f2e5-fea5-2469f3c5f602	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569c-f2e5-e83e-0615e8c349a6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569c-f2e5-b1be-32f4ae8b2588	SG	SGP	702	Singapore 	Singapur	\N
00040000-569c-f2e5-d1cf-f1fbb45a040f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569c-f2e5-526d-cd0aec03ad01	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569c-f2e5-4427-06ea00fc60c1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569c-f2e5-cd97-f587e27d2a32	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569c-f2e5-8579-8bfd2b0f3cc1	SO	SOM	706	Somalia 	Somalija	\N
00040000-569c-f2e5-ed3c-3fa0068ba209	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569c-f2e5-a8e2-8edfae0ecd99	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569c-f2e5-a35e-68d4b610b11d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569c-f2e5-570e-19a2f47b70c7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569c-f2e5-55d3-fcc740eed893	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569c-f2e5-072b-88724b0938af	SD	SDN	729	Sudan 	Sudan	\N
00040000-569c-f2e5-8915-2646099ca11f	SR	SUR	740	Suriname 	Surinam	\N
00040000-569c-f2e5-25fd-c868e9a5bd64	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569c-f2e5-6dbb-54afee135ecc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569c-f2e5-a74a-e2a7ef19929d	SE	SWE	752	Sweden 	Švedska	\N
00040000-569c-f2e5-8fa7-6a91d83cf8d1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569c-f2e5-a5fd-adf4301f0b0b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569c-f2e5-b7ee-ceed46852b39	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569c-f2e5-140f-4073afc386cc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569c-f2e5-a208-08d364a94a5f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569c-f2e5-55bf-a9a84b1b8e19	TH	THA	764	Thailand 	Tajska	\N
00040000-569c-f2e5-258c-a809f6c9da45	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569c-f2e5-d28e-c9a2e00ce000	TG	TGO	768	Togo 	Togo	\N
00040000-569c-f2e5-bdfc-8472c3e50e78	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569c-f2e5-cf84-1d20028aafc7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569c-f2e5-da96-875a596d9c05	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569c-f2e5-92b8-d48cb300133d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569c-f2e5-dd45-1ec99b307bdc	TR	TUR	792	Turkey 	Turčija	\N
00040000-569c-f2e5-265e-24b30e4b5dd4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569c-f2e5-c77a-cc5b51e4a3fb	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-f2e5-9d20-024ebbb31efc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569c-f2e5-1218-e600d816f84b	UG	UGA	800	Uganda 	Uganda	\N
00040000-569c-f2e5-d157-b2fc3a092fa6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569c-f2e5-8b22-45e20f00c1e8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569c-f2e5-3f09-940f55f182cc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569c-f2e5-306b-65af606ec2a5	US	USA	840	United States 	Združene države Amerike	\N
00040000-569c-f2e5-f0f9-95f77be49635	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569c-f2e5-a9a6-131ba03b9446	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569c-f2e5-39f2-fc489bdf1a87	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569c-f2e5-ba1c-415593cae968	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569c-f2e5-5ba9-297065cfef90	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569c-f2e5-bac4-509d2b525dca	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569c-f2e5-598b-084a8ef0558e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-f2e5-a79b-ab5e9ab924f9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569c-f2e5-4fb6-a672ddbf2953	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569c-f2e5-b574-5bca0fc8b140	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569c-f2e5-11d8-0a7d3cd1a297	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569c-f2e5-8cd6-6144bf1dd887	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569c-f2e5-909a-030f81c11782	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 37519548)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569c-f2e9-7e9e-3353f16c462a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569c-f2e9-9806-24cce0fe3f10	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-f2e9-4511-765da8ba44fe	000e0000-569c-f2e8-ef51-c8c8b9089677	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-f2e5-429e-7770a5bf0be8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-f2e9-3d6d-cd5b1660bdf7	000e0000-569c-f2e8-6f3d-6cef02b3a29f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-f2e5-bc54-a53eaf515990	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-f2e9-6b7f-1ee63a486ddc	000e0000-569c-f2e8-e024-4038c3a9572f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-f2e5-429e-7770a5bf0be8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 37519354)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569c-f2e9-8cfd-b644c4aa7fc3	000e0000-569c-f2e8-6f3d-6cef02b3a29f	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569c-f2e5-5afd-4b1607c9c769
000d0000-569c-f2e9-7cb2-b4360a2168d7	000e0000-569c-f2e8-5e71-172153357dee	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-f2e5-9b29-35e5b51c3a8d
000d0000-569c-f2e9-e0bf-98561d34200c	000e0000-569c-f2e8-5e71-172153357dee	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-2ad0-5810ccbd705b	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-c0cb-c0cca976f3ae	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-f2e5-9b29-35e5b51c3a8d
000d0000-569c-f2e9-8af1-958a00aa446f	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-d031-86b594f2fa5c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-87eb-4ef125d6941d	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-6148-7bdab8ddb5c9	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569c-f2e5-85d4-37c7da63a36b
000d0000-569c-f2e9-e06f-5c3ff1b9abfe	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-0b69-d8fa77c90089	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569c-f2e5-5afd-4b1607c9c769
000d0000-569c-f2e9-b111-3625551bfb47	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-0eea-21db69b87ec2	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569c-f2e5-5afd-4b1607c9c769
000d0000-569c-f2e9-7902-46cd1241c831	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-cdbe-b7c2a2de8e4a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-f2e5-9b29-35e5b51c3a8d
000d0000-569c-f2e9-0df6-8ffb3666956b	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-0edd-e11037b2ae12	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569c-f2e5-9b29-35e5b51c3a8d
000d0000-569c-f2e9-5dcb-eea7a991fd14	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-9397-79d65542bff6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569c-f2e5-e9d5-7fa70df7d6b0
000d0000-569c-f2e9-0f37-0180e34bc588	000e0000-569c-f2e8-6f3d-6cef02b3a29f	000c0000-569c-f2e9-498c-8226bec33263	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569c-f2e5-9590-f811a72c848a
000d0000-569c-f2e9-b682-88551b6a6d1a	000e0000-569c-f2e8-d3e6-caaa178b3ca9	000c0000-569c-f2e9-012c-7f983253b48b	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-8dc7-747bed2c453c	000e0000-569c-f2e8-e960-3c0120176a1e	000c0000-569c-f2e9-ab3d-5ca77378d260	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-5b71-41948e583ae3	000e0000-569c-f2e8-e960-3c0120176a1e	000c0000-569c-f2e9-835e-ec0c9b188ae3	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-ba0b-85d0dd98aa0c	000e0000-569c-f2e8-e5b9-23570eb8b19e	000c0000-569c-f2e9-230a-2491afa0224b	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-0a95-4392f49fed68	000e0000-569c-f2e8-ff08-4ea6cc6212ab	000c0000-569c-f2e9-64a7-16e9983e6a5e	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-9d7a-04604df1a524	000e0000-569c-f2e8-1862-fd19d8412f0f	000c0000-569c-f2e9-f5c3-831f81c5f4a9	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-de33-395f213466dd	000e0000-569c-f2e8-7cef-907d610964cf	000c0000-569c-f2e9-9cea-c7558aadbf23	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-1274-064dba9c4dd1	000e0000-569c-f2e8-a8ba-bbebb5a8abdf	000c0000-569c-f2e9-c720-b2efb724c493	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-f356-8fb7097c03eb	000e0000-569c-f2e8-aa09-f132b67e4b4b	000c0000-569c-f2e9-5c12-9a725391c3fb	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-ac90-641d4295b5cd	000e0000-569c-f2e8-aa09-f132b67e4b4b	000c0000-569c-f2e9-d7b3-386aa053753a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-e7c8-c5c997c5a0be	000e0000-569c-f2e8-4eef-4ccd6dda1c43	000c0000-569c-f2e9-c297-a12143835313	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
000d0000-569c-f2e9-6f3e-0b4f9b740607	000e0000-569c-f2e8-4eef-4ccd6dda1c43	000c0000-569c-f2e9-a033-8f737f04b863	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569c-f2e5-c5a4-d8dbb88afaa7
\.


--
-- TOC entry 3163 (class 0 OID 37519132)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 37519102)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 37519079)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569c-f2e8-6c0c-1bbdd4705901	00080000-569c-f2e8-a324-48b4ee245ce7	00090000-569c-f2e8-c356-ca8f2bcea949	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 37519268)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 37519818)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569c-f2e8-76b1-ad38455b32b1	00010000-569c-f2e6-9ff2-ad8756ca5b6e	\N	Prva mapa	Root mapa	2016-01-18 15:12:56	2016-01-18 15:12:56	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 37519831)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 37519853)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34548309)
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
-- TOC entry 3181 (class 0 OID 37519293)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 37519036)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569c-f2e6-c911-f7db2bd096ff	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569c-f2e6-b7b6-b12e4def05ee	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569c-f2e6-7771-9af58a1024fc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569c-f2e6-b1f8-8c47f6c6aec1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569c-f2e6-9fa5-3726e3b2699c	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569c-f2e6-bc8a-450889506b95	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569c-f2e6-5d23-24ab77457db0	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569c-f2e6-9018-17f76ebe7473	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569c-f2e6-a1bc-68dbb8ceca08	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-f2e6-e052-99b67470f94d	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-f2e6-26d9-bbab1dd248d6	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569c-f2e6-0a30-29bd3e879acb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569c-f2e6-0030-a77ca13aea62	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569c-f2e6-31ca-250048a0a3f4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569c-f2e6-f8b8-dc356aa1cd50	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569c-f2e8-ee78-a62ffcb4469c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569c-f2e8-b177-573379542e72	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569c-f2e8-4c65-315b39a29ab5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569c-f2e8-73ba-a011d3bd8bd1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569c-f2e8-1239-f3b229b98076	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569c-f2ea-496d-266cb741843c	application.tenant.maticnopodjetje	string	s:36:"00080000-569c-f2ea-dc9a-3b959015cc27";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 37518936)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569c-f2e8-9d56-f3928310fe0d	00000000-569c-f2e8-ee78-a62ffcb4469c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569c-f2e8-bad2-5ee538ca6ce0	00000000-569c-f2e8-ee78-a62ffcb4469c	00010000-569c-f2e6-9ff2-ad8756ca5b6e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569c-f2e8-14bd-a766b3d2038a	00000000-569c-f2e8-b177-573379542e72	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 37519003)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569c-f2e8-ec21-c511eed44286	\N	00100000-569c-f2e8-68b1-4bcce7f5cd5f	00100000-569c-f2e8-3aa1-47c72add5931	01	Gledališče Nimbis
00410000-569c-f2e8-0be2-55a2c3d72449	00410000-569c-f2e8-ec21-c511eed44286	00100000-569c-f2e8-68b1-4bcce7f5cd5f	00100000-569c-f2e8-3aa1-47c72add5931	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 37518947)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569c-f2e8-3802-11b00d10a216	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569c-f2e8-30cb-82a507bb3cdd	00010000-569c-f2e8-7a73-c972c063ece9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569c-f2e8-2e07-7fadc168f558	00010000-569c-f2e8-6997-ca994ed441b8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569c-f2e8-b638-f8ef06b7b669	00010000-569c-f2e8-0d5e-a3ba38a664ed	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569c-f2e8-b361-190b9b69e00d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569c-f2e8-019b-901524379f9e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569c-f2e8-b4e2-075786e0c632	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569c-f2e8-4102-4b7a765260c9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569c-f2e8-c356-ca8f2bcea949	00010000-569c-f2e8-4687-007a3cf32a34	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569c-f2e8-3098-9e355fe3b352	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569c-f2e8-2d7d-bd5eb64654b9	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-f2e8-3a1c-45c41ec7e0f3	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569c-f2e8-8a73-e246c2938d10	00010000-569c-f2e8-1d38-c8187a2971b3	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-f2e8-fc23-2c7b75db70a4	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-f2e8-78e7-9181232a9dfb	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-f2e8-0340-49e0f6317af0	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-f2e8-f70d-4fa02d281633	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-f2e8-114f-6badab70e5ce	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-f2e8-c462-a77e84038e20	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-f2e8-f9b2-603b33a0a1b5	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-f2e8-8cd4-0dea3865ced2	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 37518882)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569c-f2e5-e837-cb29d686b08e	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569c-f2e5-6474-10becaa88687	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569c-f2e5-1770-6c5804a8e1e7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569c-f2e5-d64d-6be0bb7f41e2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569c-f2e5-6281-6fdf9562427c	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569c-f2e5-f338-6b411dacdf7c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569c-f2e5-f5e6-764629a65705	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569c-f2e5-b3aa-b500decbc151	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569c-f2e5-823f-a3fdfebbd262	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569c-f2e5-8f41-ca9f2f82706e	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569c-f2e5-af43-dfd4fa4bbb3e	Abonma-read	Abonma - branje	t
00030000-569c-f2e5-13e2-00e6f1d9e6bb	Abonma-write	Abonma - spreminjanje	t
00030000-569c-f2e5-9bdf-13b97e8357d6	Alternacija-read	Alternacija - branje	t
00030000-569c-f2e5-279b-666f4dfc740e	Alternacija-write	Alternacija - spreminjanje	t
00030000-569c-f2e5-2217-443199762b97	Arhivalija-read	Arhivalija - branje	t
00030000-569c-f2e5-353b-a6cd75cd7231	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569c-f2e5-f8c7-e290fd6da08f	AuthStorage-read	AuthStorage - branje	t
00030000-569c-f2e5-67fa-41ab9facfdd2	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569c-f2e5-9442-3d5835f2f95d	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569c-f2e5-cd3e-c1d865f8fbcb	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569c-f2e5-f55b-7091e707f389	Besedilo-read	Besedilo - branje	t
00030000-569c-f2e5-28e0-8b1787a08964	Besedilo-write	Besedilo - spreminjanje	t
00030000-569c-f2e5-32b3-c45b2a53aa74	Dodatek-read	Dodatek - branje	t
00030000-569c-f2e5-5206-0198782cbd34	Dodatek-write	Dodatek - spreminjanje	t
00030000-569c-f2e5-681e-a35e22a24fc4	Dogodek-read	Dogodek - branje	t
00030000-569c-f2e5-c6d6-cc6bad6e2264	Dogodek-write	Dogodek - spreminjanje	t
00030000-569c-f2e5-67a3-546c20f7f058	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569c-f2e5-906b-09c549de93f6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569c-f2e5-826c-1660ecf3c69d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569c-f2e5-dcef-2fddd14677c8	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569c-f2e5-dadd-fc7bb0eee0a8	DogodekTrait-read	DogodekTrait - branje	t
00030000-569c-f2e5-1ca4-253f5dd10560	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569c-f2e5-e88e-8f484caf8105	DrugiVir-read	DrugiVir - branje	t
00030000-569c-f2e5-9b65-22e6c26b7e38	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569c-f2e5-ab50-84880f67a0a8	Drzava-read	Drzava - branje	t
00030000-569c-f2e5-50fa-1404d9f6bd4b	Drzava-write	Drzava - spreminjanje	t
00030000-569c-f2e5-2849-9835315e4cba	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569c-f2e5-4bd6-f625a3d14f0c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569c-f2e5-5250-df01029b0dfa	Funkcija-read	Funkcija - branje	t
00030000-569c-f2e5-2556-8811b6e9106b	Funkcija-write	Funkcija - spreminjanje	t
00030000-569c-f2e5-6060-e8d933b0277c	Gostovanje-read	Gostovanje - branje	t
00030000-569c-f2e5-8eda-ba1af24a6d49	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569c-f2e5-5fe9-78b13525f714	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569c-f2e5-32c0-54193fbbfdc3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569c-f2e5-12c3-5609918b0aca	Kupec-read	Kupec - branje	t
00030000-569c-f2e5-b48a-d55fd34de2ae	Kupec-write	Kupec - spreminjanje	t
00030000-569c-f2e5-784f-d33d5bbfd2b1	NacinPlacina-read	NacinPlacina - branje	t
00030000-569c-f2e5-28c0-bcc6059b3ea1	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569c-f2e5-0f69-d6ac62479380	Option-read	Option - branje	t
00030000-569c-f2e5-9856-a0b474830273	Option-write	Option - spreminjanje	t
00030000-569c-f2e5-f5d7-1fc8b19ef3c2	OptionValue-read	OptionValue - branje	t
00030000-569c-f2e5-d2cc-bd591bfdd2dd	OptionValue-write	OptionValue - spreminjanje	t
00030000-569c-f2e5-e8a3-eb918a105270	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569c-f2e5-8be0-d2356907e5e9	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569c-f2e5-eba4-b27e10945082	Oseba-read	Oseba - branje	t
00030000-569c-f2e5-5485-63c71ec54a5a	Oseba-write	Oseba - spreminjanje	t
00030000-569c-f2e5-fe88-7a1cb756ded6	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569c-f2e5-fa6d-7ddaa9e822d0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569c-f2e5-8726-58537651108e	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569c-f2e5-5302-ebdb5cccc1f1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569c-f2e5-ace9-54f6f3c74ba0	Pogodba-read	Pogodba - branje	t
00030000-569c-f2e5-80ba-7dd8db1a8b0e	Pogodba-write	Pogodba - spreminjanje	t
00030000-569c-f2e5-89ce-6bb0001c27f0	Popa-read	Popa - branje	t
00030000-569c-f2e5-2e65-881f5c26d908	Popa-write	Popa - spreminjanje	t
00030000-569c-f2e5-8fbb-a85148cab214	Posta-read	Posta - branje	t
00030000-569c-f2e5-25dd-df0a4736035d	Posta-write	Posta - spreminjanje	t
00030000-569c-f2e5-cbbc-4ff47bcf4af5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569c-f2e5-90e6-6bb02edac7db	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569c-f2e5-60b1-e362c557b242	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569c-f2e5-24b7-e261cf0d3646	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569c-f2e5-600e-a9b4cc0e41c3	PostniNaslov-read	PostniNaslov - branje	t
00030000-569c-f2e5-4b03-fd6ca07ec64c	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569c-f2e5-a0af-05b996741e0e	Praznik-read	Praznik - branje	t
00030000-569c-f2e5-fcc1-e8246c4ef4df	Praznik-write	Praznik - spreminjanje	t
00030000-569c-f2e5-fa44-07531e52a5ba	Predstava-read	Predstava - branje	t
00030000-569c-f2e5-d9a1-9bb744286105	Predstava-write	Predstava - spreminjanje	t
00030000-569c-f2e5-37d7-ae18572656ba	Ura-read	Ura - branje	t
00030000-569c-f2e5-2dd3-eb9f7e95337c	Ura-write	Ura - spreminjanje	t
00030000-569c-f2e5-672f-32e83da32dde	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569c-f2e5-ebdb-f74f406b9382	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569c-f2e5-4771-d365bbba68ed	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569c-f2e5-819c-e0f661582e40	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569c-f2e5-8c81-68514541b959	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569c-f2e5-466c-396e81a97f3e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569c-f2e5-3ce6-9db9245d6e74	ProgramDela-read	ProgramDela - branje	t
00030000-569c-f2e5-7938-886032c6d8b1	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569c-f2e5-77ee-02d59c8ed53e	ProgramFestival-read	ProgramFestival - branje	t
00030000-569c-f2e5-38ce-ba054d365325	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569c-f2e5-0d91-90b58b669ade	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569c-f2e5-9ad6-8b5c84a63cc3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569c-f2e5-abb4-36f8e7b32875	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569c-f2e5-85ec-90fa7c65460e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569c-f2e5-877b-b70ab5bbb66e	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569c-f2e5-446f-e19d43b84bdc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569c-f2e5-bcff-4f845bc0cac1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569c-f2e5-b91b-b922f77aaaa2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569c-f2e5-debe-0f5f7a9a6dc5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569c-f2e5-f71b-a32d5dc1e324	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569c-f2e5-d5bb-788169449ad7	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569c-f2e5-ce4d-827acb93e8b6	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569c-f2e5-30f3-eaee601de030	ProgramRazno-read	ProgramRazno - branje	t
00030000-569c-f2e5-c6c4-c5aa0b96aca3	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569c-f2e5-a78f-28d36e8ef174	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569c-f2e5-fa62-3f0cd93ef080	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569c-f2e5-e4ed-a04dec9e5d9c	Prostor-read	Prostor - branje	t
00030000-569c-f2e5-4486-43305022725e	Prostor-write	Prostor - spreminjanje	t
00030000-569c-f2e5-b857-79e3d5891525	Racun-read	Racun - branje	t
00030000-569c-f2e5-b164-ac78e1b5cd41	Racun-write	Racun - spreminjanje	t
00030000-569c-f2e5-3eda-604206f242df	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569c-f2e5-b36c-d2eefd7a7ee5	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569c-f2e5-44d8-5b8abb222d30	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569c-f2e5-8654-32470f528b40	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569c-f2e5-2fde-06839f2a02b0	Rekvizit-read	Rekvizit - branje	t
00030000-569c-f2e5-6464-7cb26c59ca8f	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569c-f2e5-2af7-78a23957cd2f	Revizija-read	Revizija - branje	t
00030000-569c-f2e5-a254-6ebbee3d6805	Revizija-write	Revizija - spreminjanje	t
00030000-569c-f2e5-50be-e1460945b031	Rezervacija-read	Rezervacija - branje	t
00030000-569c-f2e5-2a0a-34c809b90b5b	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569c-f2e5-f5c2-32213563934f	SedezniRed-read	SedezniRed - branje	t
00030000-569c-f2e5-b9d9-cd4f2baaa1b7	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569c-f2e5-1142-8c601581e603	Sedez-read	Sedez - branje	t
00030000-569c-f2e5-cec1-124153d41b28	Sedez-write	Sedez - spreminjanje	t
00030000-569c-f2e5-098b-40919915e95b	Sezona-read	Sezona - branje	t
00030000-569c-f2e5-c23a-9b0dc3e0baf1	Sezona-write	Sezona - spreminjanje	t
00030000-569c-f2e5-fdae-10de08eb1d3a	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569c-f2e5-94e8-339a85955189	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569c-f2e5-dab8-af4ad1ffe070	Telefonska-read	Telefonska - branje	t
00030000-569c-f2e5-febe-3cb221f6d8e8	Telefonska-write	Telefonska - spreminjanje	t
00030000-569c-f2e5-4907-4bb256a95c5a	TerminStoritve-read	TerminStoritve - branje	t
00030000-569c-f2e5-02a7-c585081a6584	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569c-f2e5-92b8-4835b6d16090	TipDodatka-read	TipDodatka - branje	t
00030000-569c-f2e5-89cb-10878fe22f18	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569c-f2e5-dad2-5bda49ea5dd9	TipFunkcije-read	TipFunkcije - branje	t
00030000-569c-f2e5-2989-3eb6b3298661	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569c-f2e5-a937-25bd47955e70	TipPopa-read	TipPopa - branje	t
00030000-569c-f2e5-108a-09e50453d31b	TipPopa-write	TipPopa - spreminjanje	t
00030000-569c-f2e5-542c-f6e0ba7ac65d	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569c-f2e5-b403-2b46fcf8d003	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569c-f2e5-7f3b-98efa942a6ab	TipVaje-read	TipVaje - branje	t
00030000-569c-f2e5-fef1-dabb532efb26	TipVaje-write	TipVaje - spreminjanje	t
00030000-569c-f2e5-540d-7d3b65be383e	Trr-read	Trr - branje	t
00030000-569c-f2e5-05ef-9aee0ccdd140	Trr-write	Trr - spreminjanje	t
00030000-569c-f2e5-bbf8-d58e48b44543	Uprizoritev-read	Uprizoritev - branje	t
00030000-569c-f2e5-5711-6eada5c57222	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569c-f2e5-d55d-79355545a86b	Vaja-read	Vaja - branje	t
00030000-569c-f2e5-6549-e0025e47af67	Vaja-write	Vaja - spreminjanje	t
00030000-569c-f2e5-049b-5efc98b61409	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569c-f2e5-335c-cc604ddd10a8	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569c-f2e5-76dc-fc9539287069	VrstaStroska-read	VrstaStroska - branje	t
00030000-569c-f2e5-934d-18405723cb4d	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569c-f2e5-ee5a-4a6825200f8d	Zaposlitev-read	Zaposlitev - branje	t
00030000-569c-f2e5-f077-ff9913f27cfc	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569c-f2e5-8969-823f3ed21d00	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569c-f2e5-236b-0eb3e57773fc	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569c-f2e5-4d52-328271545aa6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569c-f2e5-8867-99429b80886e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569c-f2e5-748d-cedf042f3c52	Job-read	Branje opravil - samo zase - branje	t
00030000-569c-f2e5-6688-2aa3ca132ef8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569c-f2e5-5086-d338b526a38a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569c-f2e5-0c4c-f3f4741a7f75	Report-read	Report - branje	t
00030000-569c-f2e5-510b-d6b25aa4d35f	Report-write	Report - spreminjanje	t
00030000-569c-f2e5-3d02-70f95d5933af	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569c-f2e5-0229-47d236a33cf0	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569c-f2e5-5cd3-4d0b206515f0	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569c-f2e5-904c-d07a7ffa9ff6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569c-f2e5-ba8f-b5ebceb13a37	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569c-f2e5-f532-5a7c370f3f4f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569c-f2e5-1535-a31593aed500	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569c-f2e5-d2c7-76eb4a07787f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-f2e5-5fe2-3198a46cbba4	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-f2e5-96bf-b7cebebdf25f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-f2e5-4b3f-9abc55556689	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-f2e5-b5ee-048269eff498	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569c-f2e5-804d-b3cb717c34e5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569c-f2e5-7051-5fcb77328028	Datoteka-write	Datoteka - spreminjanje	t
00030000-569c-f2e5-60bd-1e1c7dcfb508	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 37518901)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569c-f2e5-e352-b56f79cc6ece	00030000-569c-f2e5-6474-10becaa88687
00020000-569c-f2e5-e352-b56f79cc6ece	00030000-569c-f2e5-e837-cb29d686b08e
00020000-569c-f2e5-6741-8eb584adef38	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e5-89d0-7369c5db1926	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e5-2fc0-93e687f3346b	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e5-2fc0-93e687f3346b	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e5-2fc0-93e687f3346b	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e5-2fc0-93e687f3346b	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e5-2fc0-93e687f3346b	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e5-2fc0-93e687f3346b	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-f077-ff9913f27cfc
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e5-f83f-da8690108534	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e5-5632-7c7487c17f76	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e5-5632-7c7487c17f76	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e5-5632-7c7487c17f76	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e5-8e0c-a4594a2adbf1	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e5-49ca-c5547053b1d1	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-49ca-c5547053b1d1	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e5-49ca-c5547053b1d1	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e5-49ca-c5547053b1d1	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e5-7892-052fac5adcad	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e5-7123-48299c96f262	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-2e65-881f5c26d908
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-32c0-54193fbbfdc3
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-466c-396e81a97f3e
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-33b4-0d48a29e4058	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-a724-d907d32a9a66	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-bbea-b392d2772cf6	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-bbea-b392d2772cf6	00030000-569c-f2e5-108a-09e50453d31b
00020000-569c-f2e6-ce96-26a3908dd103	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-df34-66a3957d856d	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-df34-66a3957d856d	00030000-569c-f2e5-25dd-df0a4736035d
00020000-569c-f2e6-a15b-a0e6fdaa1034	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-5069-c7f49c5f58b2	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-5069-c7f49c5f58b2	00030000-569c-f2e5-50fa-1404d9f6bd4b
00020000-569c-f2e6-5708-2dc4d3b422eb	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-4ec8-2ee425131ac6	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-4ec8-2ee425131ac6	00030000-569c-f2e5-8867-99429b80886e
00020000-569c-f2e6-252c-2744e4974c50	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-63b1-586dff7c4095	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-63b1-586dff7c4095	00030000-569c-f2e5-236b-0eb3e57773fc
00020000-569c-f2e6-9b97-0f1d095e0884	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-aaf3-cfc0e0f5f139	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-aaf3-cfc0e0f5f139	00030000-569c-f2e5-13e2-00e6f1d9e6bb
00020000-569c-f2e6-5027-fa09cbc608f9	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-bf6b-970968ff6ef2	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-bf6b-970968ff6ef2	00030000-569c-f2e5-4486-43305022725e
00020000-569c-f2e6-bf6b-970968ff6ef2	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-bf6b-970968ff6ef2	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-bf6b-970968ff6ef2	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e6-bf6b-970968ff6ef2	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-536d-928b2ad7c675	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-536d-928b2ad7c675	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-536d-928b2ad7c675	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-612a-f3cda48f5623	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-612a-f3cda48f5623	00030000-569c-f2e5-934d-18405723cb4d
00020000-569c-f2e6-b775-fa84dceda653	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-8be0-d2356907e5e9
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-968f-551ab4203651	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-375a-0a3d24949274	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-375a-0a3d24949274	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-375a-0a3d24949274	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-375a-0a3d24949274	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-375a-0a3d24949274	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-1a46-2dc7c49a9403	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-1a46-2dc7c49a9403	00030000-569c-f2e5-fef1-dabb532efb26
00020000-569c-f2e6-c328-690ecfab74e4	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-f5e6-764629a65705
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-b3aa-b500decbc151
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-3ce6-9db9245d6e74
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-7938-886032c6d8b1
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-77ee-02d59c8ed53e
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-38ce-ba054d365325
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-0d91-90b58b669ade
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-9ad6-8b5c84a63cc3
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-abb4-36f8e7b32875
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-85ec-90fa7c65460e
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-877b-b70ab5bbb66e
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-446f-e19d43b84bdc
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-bcff-4f845bc0cac1
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-b91b-b922f77aaaa2
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-debe-0f5f7a9a6dc5
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-f71b-a32d5dc1e324
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-d5bb-788169449ad7
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-ce4d-827acb93e8b6
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-30f3-eaee601de030
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-c6c4-c5aa0b96aca3
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-a78f-28d36e8ef174
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-fa62-3f0cd93ef080
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-819c-e0f661582e40
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-9b65-22e6c26b7e38
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-90e6-6bb02edac7db
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-6688-2aa3ca132ef8
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-e88e-8f484caf8105
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-4771-d365bbba68ed
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-cbbc-4ff47bcf4af5
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-748d-cedf042f3c52
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-b969-af2d0dd8a365	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-3ce6-9db9245d6e74
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-77ee-02d59c8ed53e
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-0d91-90b58b669ade
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-abb4-36f8e7b32875
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-877b-b70ab5bbb66e
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-bcff-4f845bc0cac1
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-debe-0f5f7a9a6dc5
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-d5bb-788169449ad7
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-30f3-eaee601de030
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-a78f-28d36e8ef174
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-4771-d365bbba68ed
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-e88e-8f484caf8105
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-cbbc-4ff47bcf4af5
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-748d-cedf042f3c52
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-47c9-51e420833c58	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-8f41-ca9f2f82706e
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-ec24-916675a89f01	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-1349-c6dab4173cb6	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-fe3f-30cf0370f836	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-80ba-7dd8db1a8b0e
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-63b0-80134bfa7d9e	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-3dc8-3acfe24753ae	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-7c92-5d041685dea4	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-c9d2-bfe87a4f023e	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-c9d2-bfe87a4f023e	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e6-c9d2-bfe87a4f023e	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-c9d2-bfe87a4f023e	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-6423-be588d1e8c29	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-6423-be588d1e8c29	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-e88e-8f484caf8105
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-9b65-22e6c26b7e38
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-8f41-ca9f2f82706e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-748d-cedf042f3c52
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-6688-2aa3ca132ef8
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-80ba-7dd8db1a8b0e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-cbbc-4ff47bcf4af5
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-90e6-6bb02edac7db
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-4771-d365bbba68ed
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-819c-e0f661582e40
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-f5e6-764629a65705
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-3ce6-9db9245d6e74
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-b3aa-b500decbc151
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-7938-886032c6d8b1
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-77ee-02d59c8ed53e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-38ce-ba054d365325
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-0d91-90b58b669ade
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-9ad6-8b5c84a63cc3
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-abb4-36f8e7b32875
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-85ec-90fa7c65460e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-877b-b70ab5bbb66e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-446f-e19d43b84bdc
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-bcff-4f845bc0cac1
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-b91b-b922f77aaaa2
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-debe-0f5f7a9a6dc5
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-f71b-a32d5dc1e324
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-d5bb-788169449ad7
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-ce4d-827acb93e8b6
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-30f3-eaee601de030
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-c6c4-c5aa0b96aca3
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-a78f-28d36e8ef174
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-fa62-3f0cd93ef080
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-8c20-edeef0a3c013	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-c93f-76f1826013ed	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-8f41-ca9f2f82706e
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-1f07-09e1481fb7e4	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-e88e-8f484caf8105
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-9b65-22e6c26b7e38
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-8f41-ca9f2f82706e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-748d-cedf042f3c52
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-6688-2aa3ca132ef8
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-32c0-54193fbbfdc3
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-80ba-7dd8db1a8b0e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-2e65-881f5c26d908
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-cbbc-4ff47bcf4af5
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-90e6-6bb02edac7db
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-4771-d365bbba68ed
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-819c-e0f661582e40
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-466c-396e81a97f3e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-f5e6-764629a65705
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-3ce6-9db9245d6e74
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-b3aa-b500decbc151
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-7938-886032c6d8b1
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-77ee-02d59c8ed53e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-38ce-ba054d365325
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-0d91-90b58b669ade
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-9ad6-8b5c84a63cc3
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-abb4-36f8e7b32875
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-85ec-90fa7c65460e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-877b-b70ab5bbb66e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-446f-e19d43b84bdc
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-bcff-4f845bc0cac1
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-b91b-b922f77aaaa2
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-debe-0f5f7a9a6dc5
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-f71b-a32d5dc1e324
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-d5bb-788169449ad7
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-ce4d-827acb93e8b6
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-30f3-eaee601de030
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-c6c4-c5aa0b96aca3
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-a78f-28d36e8ef174
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-fa62-3f0cd93ef080
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-f077-ff9913f27cfc
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-303f-23fe5d334c7e	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-8f41-ca9f2f82706e
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-32c0-54193fbbfdc3
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-2e65-881f5c26d908
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-466c-396e81a97f3e
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-f077-ff9913f27cfc
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-2a40-9dd08fd70c2a	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-75b6-1c2d15206e0b	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-e88e-8f484caf8105
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-9b65-22e6c26b7e38
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-748d-cedf042f3c52
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-6688-2aa3ca132ef8
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-32c0-54193fbbfdc3
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-8be0-d2356907e5e9
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-80ba-7dd8db1a8b0e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-2e65-881f5c26d908
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-cbbc-4ff47bcf4af5
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-90e6-6bb02edac7db
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-4771-d365bbba68ed
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-819c-e0f661582e40
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-466c-396e81a97f3e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-f5e6-764629a65705
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-3ce6-9db9245d6e74
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-b3aa-b500decbc151
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-7938-886032c6d8b1
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-77ee-02d59c8ed53e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-38ce-ba054d365325
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-0d91-90b58b669ade
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-9ad6-8b5c84a63cc3
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-abb4-36f8e7b32875
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-85ec-90fa7c65460e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-877b-b70ab5bbb66e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-446f-e19d43b84bdc
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-bcff-4f845bc0cac1
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-b91b-b922f77aaaa2
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-debe-0f5f7a9a6dc5
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-f71b-a32d5dc1e324
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-d5bb-788169449ad7
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-ce4d-827acb93e8b6
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-30f3-eaee601de030
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-c6c4-c5aa0b96aca3
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-a78f-28d36e8ef174
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-fa62-3f0cd93ef080
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-934d-18405723cb4d
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-f077-ff9913f27cfc
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e6-9196-e48d02b381db	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-e837-cb29d686b08e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-6474-10becaa88687
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-af43-dfd4fa4bbb3e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-13e2-00e6f1d9e6bb
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2217-443199762b97
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-353b-a6cd75cd7231
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f8c7-e290fd6da08f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-67fa-41ab9facfdd2
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-9442-3d5835f2f95d
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-cd3e-c1d865f8fbcb
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f55b-7091e707f389
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-28e0-8b1787a08964
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-681e-a35e22a24fc4
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-d64d-6be0bb7f41e2
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-67a3-546c20f7f058
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-906b-09c549de93f6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-826c-1660ecf3c69d
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-dcef-2fddd14677c8
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-dadd-fc7bb0eee0a8
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-1ca4-253f5dd10560
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-c6d6-cc6bad6e2264
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-e88e-8f484caf8105
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-9b65-22e6c26b7e38
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-ab50-84880f67a0a8
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-50fa-1404d9f6bd4b
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2849-9835315e4cba
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4bd6-f625a3d14f0c
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8f41-ca9f2f82706e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-6060-e8d933b0277c
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8eda-ba1af24a6d49
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5086-d338b526a38a
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-748d-cedf042f3c52
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-6688-2aa3ca132ef8
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5fe9-78b13525f714
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-32c0-54193fbbfdc3
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-12c3-5609918b0aca
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b48a-d55fd34de2ae
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-1535-a31593aed500
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f532-5a7c370f3f4f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-0229-47d236a33cf0
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5cd3-4d0b206515f0
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-904c-d07a7ffa9ff6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-ba8f-b5ebceb13a37
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-784f-d33d5bbfd2b1
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-28c0-bcc6059b3ea1
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-0f69-d6ac62479380
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f5d7-1fc8b19ef3c2
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-d2cc-bd591bfdd2dd
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-9856-a0b474830273
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-e8a3-eb918a105270
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8be0-d2356907e5e9
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fe88-7a1cb756ded6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fa6d-7ddaa9e822d0
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8726-58537651108e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5302-ebdb5cccc1f1
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-80ba-7dd8db1a8b0e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2e65-881f5c26d908
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8fbb-a85148cab214
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-cbbc-4ff47bcf4af5
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-90e6-6bb02edac7db
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-60b1-e362c557b242
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-24b7-e261cf0d3646
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-25dd-df0a4736035d
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-a0af-05b996741e0e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fcc1-e8246c4ef4df
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fa44-07531e52a5ba
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-d9a1-9bb744286105
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-672f-32e83da32dde
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-ebdb-f74f406b9382
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4771-d365bbba68ed
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-819c-e0f661582e40
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8c81-68514541b959
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-466c-396e81a97f3e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f5e6-764629a65705
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-3ce6-9db9245d6e74
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b3aa-b500decbc151
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-7938-886032c6d8b1
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-77ee-02d59c8ed53e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-38ce-ba054d365325
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-0d91-90b58b669ade
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-9ad6-8b5c84a63cc3
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-abb4-36f8e7b32875
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-85ec-90fa7c65460e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-877b-b70ab5bbb66e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-446f-e19d43b84bdc
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-bcff-4f845bc0cac1
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b91b-b922f77aaaa2
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-debe-0f5f7a9a6dc5
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f71b-a32d5dc1e324
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-d5bb-788169449ad7
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-ce4d-827acb93e8b6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-30f3-eaee601de030
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-c6c4-c5aa0b96aca3
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-a78f-28d36e8ef174
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fa62-3f0cd93ef080
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-e4ed-a04dec9e5d9c
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4486-43305022725e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b857-79e3d5891525
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b164-ac78e1b5cd41
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-3eda-604206f242df
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b36c-d2eefd7a7ee5
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-44d8-5b8abb222d30
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8654-32470f528b40
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2fde-06839f2a02b0
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-6464-7cb26c59ca8f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-0c4c-f3f4741a7f75
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-510b-d6b25aa4d35f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2af7-78a23957cd2f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-a254-6ebbee3d6805
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-50be-e1460945b031
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2a0a-34c809b90b5b
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f5c2-32213563934f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b9d9-cd4f2baaa1b7
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-1142-8c601581e603
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-cec1-124153d41b28
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-098b-40919915e95b
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-c23a-9b0dc3e0baf1
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-3d02-70f95d5933af
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4907-4bb256a95c5a
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-1770-6c5804a8e1e7
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-02a7-c585081a6584
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-dad2-5bda49ea5dd9
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-2989-3eb6b3298661
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-a937-25bd47955e70
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-108a-09e50453d31b
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-542c-f6e0ba7ac65d
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b403-2b46fcf8d003
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-7f3b-98efa942a6ab
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-fef1-dabb532efb26
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-d55d-79355545a86b
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-6549-e0025e47af67
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-049b-5efc98b61409
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-335c-cc604ddd10a8
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-76dc-fc9539287069
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-934d-18405723cb4d
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-804d-b3cb717c34e5
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-b5ee-048269eff498
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-f077-ff9913f27cfc
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8969-823f3ed21d00
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-236b-0eb3e57773fc
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-4d52-328271545aa6
00020000-569c-f2e8-ecbd-104004f0e769	00030000-569c-f2e5-8867-99429b80886e
00020000-569c-f2e8-c056-d8f11e4f762d	00030000-569c-f2e5-4b3f-9abc55556689
00020000-569c-f2e8-529f-bb71417d6a36	00030000-569c-f2e5-96bf-b7cebebdf25f
00020000-569c-f2e8-ac41-476d1b427e15	00030000-569c-f2e5-5711-6eada5c57222
00020000-569c-f2e8-d843-f133b7b0a766	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e8-3cbc-4683ed708597	00030000-569c-f2e5-5cd3-4d0b206515f0
00020000-569c-f2e8-010b-bc94191e619f	00030000-569c-f2e5-904c-d07a7ffa9ff6
00020000-569c-f2e8-4ed6-5af5c14d7871	00030000-569c-f2e5-ba8f-b5ebceb13a37
00020000-569c-f2e8-b8d5-9da7ea5ab954	00030000-569c-f2e5-0229-47d236a33cf0
00020000-569c-f2e8-323b-5e2fe171f501	00030000-569c-f2e5-1535-a31593aed500
00020000-569c-f2e8-d1b4-cdae1b6b5a8d	00030000-569c-f2e5-f532-5a7c370f3f4f
00020000-569c-f2e8-f2a8-f001c77f9231	00030000-569c-f2e5-5fe2-3198a46cbba4
00020000-569c-f2e8-7250-e5fdc757e7ad	00030000-569c-f2e5-d2c7-76eb4a07787f
00020000-569c-f2e8-1415-05d6bd01bcab	00030000-569c-f2e5-eba4-b27e10945082
00020000-569c-f2e8-402b-02ab14bbcb69	00030000-569c-f2e5-5485-63c71ec54a5a
00020000-569c-f2e8-58b1-715170058eec	00030000-569c-f2e5-6281-6fdf9562427c
00020000-569c-f2e8-5b38-ee0139ba490e	00030000-569c-f2e5-f338-6b411dacdf7c
00020000-569c-f2e8-4cbc-9bcbf4dec8ee	00030000-569c-f2e5-7051-5fcb77328028
00020000-569c-f2e8-f2b8-c8f85ac6f2d4	00030000-569c-f2e5-60bd-1e1c7dcfb508
00020000-569c-f2e8-ef62-14c2898d6561	00030000-569c-f2e5-89ce-6bb0001c27f0
00020000-569c-f2e8-ef62-14c2898d6561	00030000-569c-f2e5-2e65-881f5c26d908
00020000-569c-f2e8-ef62-14c2898d6561	00030000-569c-f2e5-bbf8-d58e48b44543
00020000-569c-f2e8-011b-2a4eb1c64260	00030000-569c-f2e5-540d-7d3b65be383e
00020000-569c-f2e8-086a-4deb9a59f0e3	00030000-569c-f2e5-05ef-9aee0ccdd140
00020000-569c-f2e8-2699-cf39880b3463	00030000-569c-f2e5-3d02-70f95d5933af
00020000-569c-f2e8-e230-b5560f1210a8	00030000-569c-f2e5-dab8-af4ad1ffe070
00020000-569c-f2e8-1c96-a84e0380c1f9	00030000-569c-f2e5-febe-3cb221f6d8e8
00020000-569c-f2e8-b715-27a6fa101252	00030000-569c-f2e5-600e-a9b4cc0e41c3
00020000-569c-f2e8-93ab-68218ca7b825	00030000-569c-f2e5-4b03-fd6ca07ec64c
00020000-569c-f2e8-57e5-d6d23a49a0cd	00030000-569c-f2e5-ee5a-4a6825200f8d
00020000-569c-f2e8-3eb6-7bb14a30daff	00030000-569c-f2e5-f077-ff9913f27cfc
00020000-569c-f2e8-3cb4-cb380158550b	00030000-569c-f2e5-ace9-54f6f3c74ba0
00020000-569c-f2e8-6857-77b864d99f7a	00030000-569c-f2e5-80ba-7dd8db1a8b0e
00020000-569c-f2e8-590d-b9920942e057	00030000-569c-f2e5-fdae-10de08eb1d3a
00020000-569c-f2e8-be68-28fd382ec0f0	00030000-569c-f2e5-94e8-339a85955189
00020000-569c-f2e8-0940-13ee85f378a9	00030000-569c-f2e5-9bdf-13b97e8357d6
00020000-569c-f2e8-759c-4d0dbee7b49e	00030000-569c-f2e5-279b-666f4dfc740e
00020000-569c-f2e8-0a34-48bd41b2b8d7	00030000-569c-f2e5-823f-a3fdfebbd262
00020000-569c-f2e8-1350-4f2a8dae9b73	00030000-569c-f2e5-5250-df01029b0dfa
00020000-569c-f2e8-8b30-f331946ba66d	00030000-569c-f2e5-2556-8811b6e9106b
00020000-569c-f2e8-c86f-c1dd54bf17d6	00030000-569c-f2e5-8f41-ca9f2f82706e
\.


--
-- TOC entry 3182 (class 0 OID 37519300)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 37519334)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 37519467)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569c-f2e8-1d0d-e1553676e6e6	00090000-569c-f2e8-3802-11b00d10a216	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569c-f2e8-252f-981fe64e3305	00090000-569c-f2e8-019b-901524379f9e	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569c-f2e8-8f0d-c540a58deb78	00090000-569c-f2e8-8a73-e246c2938d10	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569c-f2e8-b94b-d7776b16611e	00090000-569c-f2e8-3098-9e355fe3b352	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 37518983)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569c-f2e8-a324-48b4ee245ce7	\N	00040000-569c-f2e5-4427-06ea00fc60c1	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-620f-8b3c19ad04f0	\N	00040000-569c-f2e5-4427-06ea00fc60c1	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569c-f2e8-4c6c-708b5618be5e	\N	00040000-569c-f2e5-4427-06ea00fc60c1	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-3b9d-6fde6ee7eee9	\N	00040000-569c-f2e5-4427-06ea00fc60c1	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-527e-df2501531352	\N	00040000-569c-f2e5-4427-06ea00fc60c1	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-28d3-a78907499fa4	\N	00040000-569c-f2e5-6f0f-2b613a7f4d77	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-f770-df0ea0eeea30	\N	00040000-569c-f2e5-bcbc-34b94fe3487d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-9aae-e4dc08ccb767	\N	00040000-569c-f2e5-e0f9-6870f65e9b95	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2e8-7ccb-aa718d60c019	\N	00040000-569c-f2e5-8b5f-9cdddf43b711	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-f2ea-dc9a-3b959015cc27	\N	00040000-569c-f2e5-4427-06ea00fc60c1	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 37519028)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569c-f2e4-7a62-6f78f90d79e6	8341	Adlešiči
00050000-569c-f2e4-a3f4-006f14130397	5270	Ajdovščina
00050000-569c-f2e4-11c2-4cea5dc9263b	6280	Ankaran/Ancarano
00050000-569c-f2e4-868f-8669f5365d7e	9253	Apače
00050000-569c-f2e4-333f-82f702878a78	8253	Artiče
00050000-569c-f2e4-64ad-e09cacaa572b	4275	Begunje na Gorenjskem
00050000-569c-f2e4-1b52-7804f92e11d9	1382	Begunje pri Cerknici
00050000-569c-f2e4-1b8b-8c769718fd8c	9231	Beltinci
00050000-569c-f2e4-0419-295ff645bfb1	2234	Benedikt
00050000-569c-f2e4-47a5-9a64bc801b53	2345	Bistrica ob Dravi
00050000-569c-f2e4-dbc0-81443cf77546	3256	Bistrica ob Sotli
00050000-569c-f2e4-ac55-044a4d61f3a5	8259	Bizeljsko
00050000-569c-f2e4-5d8f-8821a2a94f84	1223	Blagovica
00050000-569c-f2e4-dded-d6132a8e86e2	8283	Blanca
00050000-569c-f2e4-4b35-21c77dec6f36	4260	Bled
00050000-569c-f2e4-abfc-62d86a2dd1ab	4273	Blejska Dobrava
00050000-569c-f2e4-0f6f-105200eb4295	9265	Bodonci
00050000-569c-f2e4-b081-e076c39bb34e	9222	Bogojina
00050000-569c-f2e4-90dd-8e11d89a9abf	4263	Bohinjska Bela
00050000-569c-f2e4-aa0f-69418510aa7e	4264	Bohinjska Bistrica
00050000-569c-f2e4-f116-fcf01680c97e	4265	Bohinjsko jezero
00050000-569c-f2e4-cb2b-63e04f8ad4da	1353	Borovnica
00050000-569c-f2e4-80ec-50850a4cc79c	8294	Boštanj
00050000-569c-f2e4-060d-d02ab0441d08	5230	Bovec
00050000-569c-f2e4-de9d-75b4762407e3	5295	Branik
00050000-569c-f2e4-9114-0559c546a589	3314	Braslovče
00050000-569c-f2e4-281b-80ca8a8c4159	5223	Breginj
00050000-569c-f2e4-144d-ebdd3559a922	8280	Brestanica
00050000-569c-f2e4-1f88-a5f0c76796f2	2354	Bresternica
00050000-569c-f2e4-b2e3-8979bb03c822	4243	Brezje
00050000-569c-f2e4-9417-626824140875	1351	Brezovica pri Ljubljani
00050000-569c-f2e4-d247-8a5370c9b56e	8250	Brežice
00050000-569c-f2e4-3bd1-c6e593883f5d	4210	Brnik - Aerodrom
00050000-569c-f2e4-a417-c31195acaa7c	8321	Brusnice
00050000-569c-f2e4-fa98-8e4095189fd1	3255	Buče
00050000-569c-f2e4-2bfa-1ba2811d1263	8276	Bučka 
00050000-569c-f2e4-ffed-b801dba318e7	9261	Cankova
00050000-569c-f2e4-7d91-ad79693e8724	3000	Celje 
00050000-569c-f2e4-99ff-95e21fb8351d	3001	Celje - poštni predali
00050000-569c-f2e4-6942-e27cd09e1833	4207	Cerklje na Gorenjskem
00050000-569c-f2e4-9af6-be3ca16cfccf	8263	Cerklje ob Krki
00050000-569c-f2e4-1162-bd180bbd79d3	1380	Cerknica
00050000-569c-f2e4-bf9e-b6462f74c2c8	5282	Cerkno
00050000-569c-f2e4-a49d-fb86fcc356b4	2236	Cerkvenjak
00050000-569c-f2e4-1ff7-8de391ddee51	2215	Ceršak
00050000-569c-f2e4-6768-7418e047e8c0	2326	Cirkovce
00050000-569c-f2e4-4654-078147919890	2282	Cirkulane
00050000-569c-f2e4-8653-651b836aa0f9	5273	Col
00050000-569c-f2e4-1267-171416561843	8251	Čatež ob Savi
00050000-569c-f2e4-73b2-254ec6f2d946	1413	Čemšenik
00050000-569c-f2e4-c93d-eb9e1c297f79	5253	Čepovan
00050000-569c-f2e4-5e33-e64993254458	9232	Črenšovci
00050000-569c-f2e4-ab3b-089fcf0b131d	2393	Črna na Koroškem
00050000-569c-f2e4-2bb5-938d4dd55465	6275	Črni Kal
00050000-569c-f2e4-ee7a-62cf3958d7eb	5274	Črni Vrh nad Idrijo
00050000-569c-f2e4-2539-8a91df30280e	5262	Črniče
00050000-569c-f2e4-7375-f938d6234e43	8340	Črnomelj
00050000-569c-f2e4-23d9-8de0b4aaf64f	6271	Dekani
00050000-569c-f2e4-0dfa-0a9950e6826c	5210	Deskle
00050000-569c-f2e4-d962-b5f9dc1df9a2	2253	Destrnik
00050000-569c-f2e4-688a-da19a7a111a0	6215	Divača
00050000-569c-f2e4-55db-2a7ce08d5d2d	1233	Dob
00050000-569c-f2e4-f7e1-0b0514d99416	3224	Dobje pri Planini
00050000-569c-f2e4-c3a5-dc8a74fa67c1	8257	Dobova
00050000-569c-f2e4-bd1f-5d3ec0c98c1b	1423	Dobovec
00050000-569c-f2e4-bbaa-06d26f1fe3e6	5263	Dobravlje
00050000-569c-f2e4-c340-730e90176746	3204	Dobrna
00050000-569c-f2e4-84f5-ab6440104040	8211	Dobrnič
00050000-569c-f2e4-1da3-e2849c24e18a	1356	Dobrova
00050000-569c-f2e4-b183-7558be7e11a2	9223	Dobrovnik/Dobronak 
00050000-569c-f2e4-5440-66fd1fbe88c8	5212	Dobrovo v Brdih
00050000-569c-f2e4-5f63-3573e09530f9	1431	Dol pri Hrastniku
00050000-569c-f2e4-4ffb-d216d6765092	1262	Dol pri Ljubljani
00050000-569c-f2e4-e0d4-6c2c0ef7cf44	1273	Dole pri Litiji
00050000-569c-f2e4-678e-0de9baa3f12c	1331	Dolenja vas
00050000-569c-f2e4-4d37-98fa3a7deb56	8350	Dolenjske Toplice
00050000-569c-f2e4-38ba-92771ed417ea	1230	Domžale
00050000-569c-f2e4-f779-e54e7fca7c74	2252	Dornava
00050000-569c-f2e4-df14-af275088a856	5294	Dornberk
00050000-569c-f2e4-bdc6-20291f3f49b4	1319	Draga
00050000-569c-f2e4-133e-5b831d1fe418	8343	Dragatuš
00050000-569c-f2e4-3cac-b041c3c74fb2	3222	Dramlje
00050000-569c-f2e4-94ef-4f50a64874eb	2370	Dravograd
00050000-569c-f2e4-19e3-e8d1ea0f5093	4203	Duplje
00050000-569c-f2e4-1145-930b8fb6e6cc	6221	Dutovlje
00050000-569c-f2e4-58e0-3ccf6ede2fc4	8361	Dvor
00050000-569c-f2e4-d71b-a078aa843069	2343	Fala
00050000-569c-f2e4-597e-8a99bafcdb3b	9208	Fokovci
00050000-569c-f2e4-6a9d-82f376710ca7	2313	Fram
00050000-569c-f2e4-8289-7116160e9ecb	3213	Frankolovo
00050000-569c-f2e4-18ee-58da79d655d6	1274	Gabrovka
00050000-569c-f2e4-b2af-9ee1690b5ba3	8254	Globoko
00050000-569c-f2e4-0b1b-c02e03af2aa0	5275	Godovič
00050000-569c-f2e4-7321-8ede675b5448	4204	Golnik
00050000-569c-f2e4-edda-3bb14cea6fbb	3303	Gomilsko
00050000-569c-f2e4-8082-1718c9b9708c	4224	Gorenja vas
00050000-569c-f2e4-3bbe-34e4905848ce	3263	Gorica pri Slivnici
00050000-569c-f2e4-86c8-bdd2db8a336e	2272	Gorišnica
00050000-569c-f2e4-697b-430a97d4f447	9250	Gornja Radgona
00050000-569c-f2e4-14e4-2781c50942bf	3342	Gornji Grad
00050000-569c-f2e4-a94e-abebf5da4851	4282	Gozd Martuljek
00050000-569c-f2e4-01e9-ccd3609843a7	6272	Gračišče
00050000-569c-f2e4-b928-b93b1989ffa9	9264	Grad
00050000-569c-f2e4-137a-1d9c363a6bf1	8332	Gradac
00050000-569c-f2e4-14f5-18371205f710	1384	Grahovo
00050000-569c-f2e4-108f-43c9deb34673	5242	Grahovo ob Bači
00050000-569c-f2e4-9a99-056b42f91aa7	5251	Grgar
00050000-569c-f2e4-a44e-ec65ac5d7123	3302	Griže
00050000-569c-f2e4-a963-5702398f03bc	3231	Grobelno
00050000-569c-f2e4-6665-e4ae171a7ab4	1290	Grosuplje
00050000-569c-f2e4-baca-67a4bbe17597	2288	Hajdina
00050000-569c-f2e4-3c04-007df29f752e	8362	Hinje
00050000-569c-f2e4-ebcc-6d86c03d27ca	2311	Hoče
00050000-569c-f2e4-ea35-7ea1198ff095	9205	Hodoš/Hodos
00050000-569c-f2e4-5b13-d79dfdddfa51	1354	Horjul
00050000-569c-f2e4-6f22-edbf954d72d3	1372	Hotedršica
00050000-569c-f2e4-533e-26df5909d060	1430	Hrastnik
00050000-569c-f2e4-beb3-43e26c35d3fe	6225	Hruševje
00050000-569c-f2e4-36cf-abf6dcd79409	4276	Hrušica
00050000-569c-f2e4-a765-422a259a403e	5280	Idrija
00050000-569c-f2e4-0460-2849c24e946c	1292	Ig
00050000-569c-f2e4-9ffd-3ff7cf54fb48	6250	Ilirska Bistrica
00050000-569c-f2e4-944b-58e8e66a26f8	6251	Ilirska Bistrica-Trnovo
00050000-569c-f2e4-d441-ce3e794c56f6	1295	Ivančna Gorica
00050000-569c-f2e4-9755-5354a304aef2	2259	Ivanjkovci
00050000-569c-f2e4-a9c1-b35e175ab649	1411	Izlake
00050000-569c-f2e4-f730-d300f577bcc7	6310	Izola/Isola
00050000-569c-f2e4-4631-7a7c0d55f3d5	2222	Jakobski Dol
00050000-569c-f2e4-2507-23c0227024ec	2221	Jarenina
00050000-569c-f2e4-cee0-6dec125db4e9	6254	Jelšane
00050000-569c-f2e4-bf41-b579c1b67b21	4270	Jesenice
00050000-569c-f2e4-b39b-c36926580dd1	8261	Jesenice na Dolenjskem
00050000-569c-f2e4-b4c5-c1bb4ba1e1fd	3273	Jurklošter
00050000-569c-f2e4-f764-8307eb7b669f	2223	Jurovski Dol
00050000-569c-f2e4-1c25-200eaff19497	2256	Juršinci
00050000-569c-f2e4-bc60-bbcfabd244d6	5214	Kal nad Kanalom
00050000-569c-f2e4-da8d-cd96260476a2	3233	Kalobje
00050000-569c-f2e4-36bb-9f5a7bde81e0	4246	Kamna Gorica
00050000-569c-f2e4-21db-6a1cbb6f4944	2351	Kamnica
00050000-569c-f2e4-e7ce-9968b9fefb78	1241	Kamnik
00050000-569c-f2e4-d519-d0a06e5c5907	5213	Kanal
00050000-569c-f2e4-cfde-5c6d7098221a	8258	Kapele
00050000-569c-f2e4-53f4-34d12d1e43ed	2362	Kapla
00050000-569c-f2e4-a18e-747b19ecf453	2325	Kidričevo
00050000-569c-f2e4-f011-199ef1172e69	1412	Kisovec
00050000-569c-f2e4-b1bd-968e2dd4d71b	6253	Knežak
00050000-569c-f2e4-af1f-7ce54ad3065c	5222	Kobarid
00050000-569c-f2e4-dea4-825108e1f236	9227	Kobilje
00050000-569c-f2e4-51d4-9ab154294406	1330	Kočevje
00050000-569c-f2e4-683a-f7016a364e79	1338	Kočevska Reka
00050000-569c-f2e4-4473-3e1f216e5576	2276	Kog
00050000-569c-f2e4-d423-54e51fec02d5	5211	Kojsko
00050000-569c-f2e4-4154-acfdc77ad93c	6223	Komen
00050000-569c-f2e4-4375-bbaa1a72b161	1218	Komenda
00050000-569c-f2e4-24db-958ddc76feff	6000	Koper/Capodistria 
00050000-569c-f2e4-5432-c2ccac1d7c70	6001	Koper/Capodistria - poštni predali
00050000-569c-f2e4-3053-467eef5518e5	8282	Koprivnica
00050000-569c-f2e4-e1f4-2d9b3b24ae0b	5296	Kostanjevica na Krasu
00050000-569c-f2e4-ba74-b37188ecd9dc	8311	Kostanjevica na Krki
00050000-569c-f2e4-5f61-a956d5d19c2f	1336	Kostel
00050000-569c-f2e4-df68-d438833b6407	6256	Košana
00050000-569c-f2e4-bbe2-ab155924f8f0	2394	Kotlje
00050000-569c-f2e4-50cf-e98895c137c5	6240	Kozina
00050000-569c-f2e4-32cd-877514b75ca6	3260	Kozje
00050000-569c-f2e4-20d4-8f222e892f0e	4000	Kranj 
00050000-569c-f2e4-1a54-ffdba99423df	4001	Kranj - poštni predali
00050000-569c-f2e4-f783-12c5da759302	4280	Kranjska Gora
00050000-569c-f2e4-26e7-4b61e7ca5e83	1281	Kresnice
00050000-569c-f2e4-adc8-cae03416bf1e	4294	Križe
00050000-569c-f2e4-d928-7c74d207ba33	9206	Križevci
00050000-569c-f2e4-0e36-76a164979b76	9242	Križevci pri Ljutomeru
00050000-569c-f2e4-9008-3a84ac79560c	1301	Krka
00050000-569c-f2e4-7fc5-41d8d0bb6f4b	8296	Krmelj
00050000-569c-f2e4-5780-f5813585f7a8	4245	Kropa
00050000-569c-f2e4-b7d9-b4f9e73b8664	8262	Krška vas
00050000-569c-f2e4-8cf4-75f911deb817	8270	Krško
00050000-569c-f2e4-3554-3bd2c4e61218	9263	Kuzma
00050000-569c-f2e4-2307-1961cb22ef07	2318	Laporje
00050000-569c-f2e4-8bd6-ed52d47d3a66	3270	Laško
00050000-569c-f2e4-77fb-b1984533848c	1219	Laze v Tuhinju
00050000-569c-f2e4-2c0c-e2509f7cb1a9	2230	Lenart v Slovenskih goricah
00050000-569c-f2e4-ddec-da3656db424c	9220	Lendava/Lendva
00050000-569c-f2e4-f31d-8ff4965b701f	4248	Lesce
00050000-569c-f2e4-3353-307f25b3f20d	3261	Lesično
00050000-569c-f2e4-5abd-c699273998eb	8273	Leskovec pri Krškem
00050000-569c-f2e4-1f30-4101a715a364	2372	Libeliče
00050000-569c-f2e4-512d-66470964e8f8	2341	Limbuš
00050000-569c-f2e4-2ffb-e88e7eaf13f9	1270	Litija
00050000-569c-f2e4-44d6-9dda0e4e133a	3202	Ljubečna
00050000-569c-f2e4-889b-3678fdce6a63	1000	Ljubljana 
00050000-569c-f2e4-e7bc-b0c271275f24	1001	Ljubljana - poštni predali
00050000-569c-f2e4-e96c-176fb5b70995	1231	Ljubljana - Črnuče
00050000-569c-f2e4-7912-b41c71a861c8	1261	Ljubljana - Dobrunje
00050000-569c-f2e4-0c70-d2a4cbbeff9d	1260	Ljubljana - Polje
00050000-569c-f2e4-dca7-1436d8395f10	1210	Ljubljana - Šentvid
00050000-569c-f2e4-c7aa-4be858ee611e	1211	Ljubljana - Šmartno
00050000-569c-f2e4-bda4-32a16fecc91f	3333	Ljubno ob Savinji
00050000-569c-f2e4-9e48-36af88b88c87	9240	Ljutomer
00050000-569c-f2e4-b8e9-2c7f03a91f7b	3215	Loče
00050000-569c-f2e4-efdd-1ea9466f730c	5231	Log pod Mangartom
00050000-569c-f2e4-22f6-7df17c02dc69	1358	Log pri Brezovici
00050000-569c-f2e4-4f54-456d8b03c507	1370	Logatec
00050000-569c-f2e4-ae08-60ca82259495	1371	Logatec
00050000-569c-f2e4-05fc-030429db930c	1434	Loka pri Zidanem Mostu
00050000-569c-f2e4-fe33-fc0bc6cc82f2	3223	Loka pri Žusmu
00050000-569c-f2e4-f3d8-af5d2fbb3cb6	6219	Lokev
00050000-569c-f2e4-3e24-d600bcac672d	1318	Loški Potok
00050000-569c-f2e4-bfec-81c7a1894519	2324	Lovrenc na Dravskem polju
00050000-569c-f2e4-2f16-30e2a4a85913	2344	Lovrenc na Pohorju
00050000-569c-f2e4-fea7-753b420d23ed	3334	Luče
00050000-569c-f2e4-4879-7dc4c145f1d7	1225	Lukovica
00050000-569c-f2e4-75f5-f01165656e7e	9202	Mačkovci
00050000-569c-f2e4-ef0b-c62c2970aaf7	2322	Majšperk
00050000-569c-f2e4-fa9f-b081db07e865	2321	Makole
00050000-569c-f2e4-4569-5875a084f138	9243	Mala Nedelja
00050000-569c-f2e4-c8b2-1277ba0975ac	2229	Malečnik
00050000-569c-f2e4-a489-790f1d271201	6273	Marezige
00050000-569c-f2e4-10cc-96731a775959	2000	Maribor 
00050000-569c-f2e4-e035-01b4599af8c0	2001	Maribor - poštni predali
00050000-569c-f2e4-70d0-5a929cfa694b	2206	Marjeta na Dravskem polju
00050000-569c-f2e4-9ea8-370666f194fd	2281	Markovci
00050000-569c-f2e4-e0eb-183c65d49f08	9221	Martjanci
00050000-569c-f2e4-87a7-eedb6b1d8461	6242	Materija
00050000-569c-f2e4-5679-9f0a9866cb0b	4211	Mavčiče
00050000-569c-f2e4-74b8-b87647414881	1215	Medvode
00050000-569c-f2e4-485e-2512361e32f8	1234	Mengeš
00050000-569c-f2e4-ba23-d764e5d2d9ab	8330	Metlika
00050000-569c-f2e4-2c11-4f1919acc294	2392	Mežica
00050000-569c-f2e4-cb88-86919100fc92	2204	Miklavž na Dravskem polju
00050000-569c-f2e4-6be0-bea4a7af4409	2275	Miklavž pri Ormožu
00050000-569c-f2e4-3c80-f4101b808c48	5291	Miren
00050000-569c-f2e4-c8a3-23cb2aa874cc	8233	Mirna
00050000-569c-f2e4-e024-41987f80958c	8216	Mirna Peč
00050000-569c-f2e4-6f68-64fe70d04a93	2382	Mislinja
00050000-569c-f2e4-3c70-5c3455b51797	4281	Mojstrana
00050000-569c-f2e4-af04-b92d1990b9df	8230	Mokronog
00050000-569c-f2e4-442c-ce3bc8646cd4	1251	Moravče
00050000-569c-f2e4-4285-b28db92072e1	9226	Moravske Toplice
00050000-569c-f2e4-8c93-a03490d41845	5216	Most na Soči
00050000-569c-f2e4-378e-97a88a94cce7	1221	Motnik
00050000-569c-f2e4-d695-e56a2675aedb	3330	Mozirje
00050000-569c-f2e4-009b-3e151f9e1fb4	9000	Murska Sobota 
00050000-569c-f2e4-9575-f2c7c6a2e17b	9001	Murska Sobota - poštni predali
00050000-569c-f2e4-5a0c-21d90258ffaa	2366	Muta
00050000-569c-f2e4-94ae-4438e4e39e1c	4202	Naklo
00050000-569c-f2e4-e59b-029466a5dff2	3331	Nazarje
00050000-569c-f2e4-d962-8efb51db0552	1357	Notranje Gorice
00050000-569c-f2e4-a61b-00f93c8bf007	3203	Nova Cerkev
00050000-569c-f2e4-8901-a7247efdabf0	5000	Nova Gorica 
00050000-569c-f2e4-315a-10a4999255ff	5001	Nova Gorica - poštni predali
00050000-569c-f2e4-236a-b1093ac04f30	1385	Nova vas
00050000-569c-f2e4-94d3-36cb4ed870b8	8000	Novo mesto
00050000-569c-f2e4-b03b-54160a3c64ca	8001	Novo mesto - poštni predali
00050000-569c-f2e4-c32c-3fd8e0c567c9	6243	Obrov
00050000-569c-f2e4-4369-5fc8759775a4	9233	Odranci
00050000-569c-f2e4-04e9-021b86d9b897	2317	Oplotnica
00050000-569c-f2e4-bede-590e836f7f8d	2312	Orehova vas
00050000-569c-f2e4-b0a7-5a561d2ac7aa	2270	Ormož
00050000-569c-f2e4-0e56-38fab0f37c1d	1316	Ortnek
00050000-569c-f2e4-11de-b0a4128c8918	1337	Osilnica
00050000-569c-f2e4-fe3b-c05a25bbe8e6	8222	Otočec
00050000-569c-f2e4-5592-15a755c31594	2361	Ožbalt
00050000-569c-f2e4-e3db-f09573d6b2a3	2231	Pernica
00050000-569c-f2e4-713e-39ab433fbddb	2211	Pesnica pri Mariboru
00050000-569c-f2e4-3224-b9c1e2a119c9	9203	Petrovci
00050000-569c-f2e4-e9de-bad42ce3e27d	3301	Petrovče
00050000-569c-f2e4-e8e3-d8b6c81942cb	6330	Piran/Pirano
00050000-569c-f2e4-e23c-acd66052ddfd	8255	Pišece
00050000-569c-f2e4-d960-f4bca54e4fe3	6257	Pivka
00050000-569c-f2e4-25a4-76439574d0ee	6232	Planina
00050000-569c-f2e4-9f0c-0a88152b0407	3225	Planina pri Sevnici
00050000-569c-f2e4-4805-bf8889a5e6a8	6276	Pobegi
00050000-569c-f2e4-dce0-801b079488d3	8312	Podbočje
00050000-569c-f2e4-03da-f2d656569063	5243	Podbrdo
00050000-569c-f2e4-6412-445d4c25082c	3254	Podčetrtek
00050000-569c-f2e4-b487-8c42b9757ce1	2273	Podgorci
00050000-569c-f2e4-beaf-dc9af03e4eef	6216	Podgorje
00050000-569c-f2e4-e9b4-1b7ac7b2db65	2381	Podgorje pri Slovenj Gradcu
00050000-569c-f2e4-e7ae-8cd468965084	6244	Podgrad
00050000-569c-f2e4-7ce3-cfe37f3db808	1414	Podkum
00050000-569c-f2e4-f60c-8342f63b2557	2286	Podlehnik
00050000-569c-f2e4-ebc2-08f624271cdf	5272	Podnanos
00050000-569c-f2e4-670a-38aa5a229d09	4244	Podnart
00050000-569c-f2e4-2dec-4fc0dfaf95ab	3241	Podplat
00050000-569c-f2e4-c0a2-0863f4097ca0	3257	Podsreda
00050000-569c-f2e4-e247-e7c9d65af097	2363	Podvelka
00050000-569c-f2e4-5d72-d863a9527845	2208	Pohorje
00050000-569c-f2e4-c959-41cb4c124068	2257	Polenšak
00050000-569c-f2e4-8fda-2cb3e193a5a8	1355	Polhov Gradec
00050000-569c-f2e4-3629-573bbfb30eb7	4223	Poljane nad Škofjo Loko
00050000-569c-f2e4-4096-49c721d5c961	2319	Poljčane
00050000-569c-f2e4-b53c-188684dc344a	1272	Polšnik
00050000-569c-f2e4-cb49-6224fd68b203	3313	Polzela
00050000-569c-f2e4-22f5-497c50a2048e	3232	Ponikva
00050000-569c-f2e4-ceca-4356437374f3	6320	Portorož/Portorose
00050000-569c-f2e4-bfda-b4d587577ea4	6230	Postojna
00050000-569c-f2e4-6d6e-e3a1b05a3cc6	2331	Pragersko
00050000-569c-f2e4-40cd-7f985b5e6cf8	3312	Prebold
00050000-569c-f2e4-043f-4e068f88310d	4205	Preddvor
00050000-569c-f2e4-7bb3-03b504c2816d	6255	Prem
00050000-569c-f2e4-bc2e-bdf263d0b851	1352	Preserje
00050000-569c-f2e4-d1b2-54f410518972	6258	Prestranek
00050000-569c-f2e4-6eee-4e3efa613b29	2391	Prevalje
00050000-569c-f2e4-f2f7-5dfc8ca9af7c	3262	Prevorje
00050000-569c-f2e4-2d45-53b4cce5e684	1276	Primskovo 
00050000-569c-f2e4-df22-69c52bdaaa7f	3253	Pristava pri Mestinju
00050000-569c-f2e4-ad5b-a7519eadef73	9207	Prosenjakovci/Partosfalva
00050000-569c-f2e4-6adb-2f51d1b6c497	5297	Prvačina
00050000-569c-f2e4-9d7e-c29a3af9155a	2250	Ptuj
00050000-569c-f2e4-282f-12ccb6f68d62	2323	Ptujska Gora
00050000-569c-f2e4-41da-4528d3b33f33	9201	Puconci
00050000-569c-f2e4-7153-ad92e7e86690	2327	Rače
00050000-569c-f2e4-69af-f51f335a0cc5	1433	Radeče
00050000-569c-f2e4-5504-c4a2bea49082	9252	Radenci
00050000-569c-f2e4-5c20-0204e4e84df0	2360	Radlje ob Dravi
00050000-569c-f2e4-599c-dfd43e35a542	1235	Radomlje
00050000-569c-f2e4-6810-4d25c97ba1fa	4240	Radovljica
00050000-569c-f2e4-91de-d269f9118dbb	8274	Raka
00050000-569c-f2e4-d354-7b2233bfe9f7	1381	Rakek
00050000-569c-f2e4-3069-aae30ea839aa	4283	Rateče - Planica
00050000-569c-f2e4-acd4-7271f7d48440	2390	Ravne na Koroškem
00050000-569c-f2e4-9fa9-594aad528bf7	9246	Razkrižje
00050000-569c-f2e4-84ff-56978b3927f2	3332	Rečica ob Savinji
00050000-569c-f2e4-356b-a844fff48883	5292	Renče
00050000-569c-f2e4-dda4-a09783139035	1310	Ribnica
00050000-569c-f2e4-9a25-eebcdac37f85	2364	Ribnica na Pohorju
00050000-569c-f2e4-4610-9d83a6b73a4a	3272	Rimske Toplice
00050000-569c-f2e4-ae56-139c4223bc75	1314	Rob
00050000-569c-f2e4-b0c4-85b811d2bfb8	5215	Ročinj
00050000-569c-f2e4-cd45-cd05695324dc	3250	Rogaška Slatina
00050000-569c-f2e4-1137-b4ef9d8efe96	9262	Rogašovci
00050000-569c-f2e4-168e-af8ee646e70a	3252	Rogatec
00050000-569c-f2e4-6cbf-2f2e8397115e	1373	Rovte
00050000-569c-f2e4-a3e6-f65fbdaa834e	2342	Ruše
00050000-569c-f2e4-5052-35db9f356162	1282	Sava
00050000-569c-f2e4-cf5d-a921c6c5013e	6333	Sečovlje/Sicciole
00050000-569c-f2e4-83bd-252e4f80ad6a	4227	Selca
00050000-569c-f2e4-3925-c5ab48732300	2352	Selnica ob Dravi
00050000-569c-f2e4-776e-f1ff5d379e15	8333	Semič
00050000-569c-f2e4-8e73-8fbe257506f5	8281	Senovo
00050000-569c-f2e4-af8c-7d0f4b2e10c2	6224	Senožeče
00050000-569c-f2e4-f72a-6ae8839c295e	8290	Sevnica
00050000-569c-f2e4-1439-254a5b2e2213	6210	Sežana
00050000-569c-f2e4-40bd-c1534878c475	2214	Sladki Vrh
00050000-569c-f2e4-fece-7978e465c389	5283	Slap ob Idrijci
00050000-569c-f2e4-74b8-ef821864127e	2380	Slovenj Gradec
00050000-569c-f2e4-ed0d-08582ad61c05	2310	Slovenska Bistrica
00050000-569c-f2e4-a097-420a4175fdc0	3210	Slovenske Konjice
00050000-569c-f2e4-5451-70b7f50bf85a	1216	Smlednik
00050000-569c-f2e4-de4e-c52c46eee400	5232	Soča
00050000-569c-f2e4-84b4-9a632802d09c	1317	Sodražica
00050000-569c-f2e4-594f-844b20ac950e	3335	Solčava
00050000-569c-f2e4-90c6-01ece8d1496f	5250	Solkan
00050000-569c-f2e4-358a-ef54762d9fca	4229	Sorica
00050000-569c-f2e4-bc79-29392f54d9cf	4225	Sovodenj
00050000-569c-f2e4-bf4c-fa38c8a5c8d6	5281	Spodnja Idrija
00050000-569c-f2e4-aa18-4834bcd1e364	2241	Spodnji Duplek
00050000-569c-f2e4-42e5-7b10ddbb4654	9245	Spodnji Ivanjci
00050000-569c-f2e4-2003-99b6341ca6a4	2277	Središče ob Dravi
00050000-569c-f2e4-683f-7d80d355191d	4267	Srednja vas v Bohinju
00050000-569c-f2e4-4ce7-59412d5116cd	8256	Sromlje 
00050000-569c-f2e4-c4b1-c78971514ba0	5224	Srpenica
00050000-569c-f2e4-dd73-2c4a8d6700ff	1242	Stahovica
00050000-569c-f2e4-5f14-44bb9c89606a	1332	Stara Cerkev
00050000-569c-f2e4-d737-47a18147d705	8342	Stari trg ob Kolpi
00050000-569c-f2e4-5bd5-07fe72a3e7c7	1386	Stari trg pri Ložu
00050000-569c-f2e4-865b-0b125cc6eff5	2205	Starše
00050000-569c-f2e4-0c5f-72559294995a	2289	Stoperce
00050000-569c-f2e4-20fb-1a3b52b66d05	8322	Stopiče
00050000-569c-f2e4-41e7-9883e2644235	3206	Stranice
00050000-569c-f2e4-178d-575b7340107f	8351	Straža
00050000-569c-f2e4-69ef-829f5aab0e38	1313	Struge
00050000-569c-f2e4-9e97-f8f11375663b	8293	Studenec
00050000-569c-f2e4-eb25-0361b92dfaa9	8331	Suhor
00050000-569c-f2e4-0533-e15f869189ba	2233	Sv. Ana v Slovenskih goricah
00050000-569c-f2e4-9d04-999960243ba0	2235	Sv. Trojica v Slovenskih goricah
00050000-569c-f2e4-d618-4dfd8cb800f8	2353	Sveti Duh na Ostrem Vrhu
00050000-569c-f2e4-9e1b-0f8a054e130b	9244	Sveti Jurij ob Ščavnici
00050000-569c-f2e4-11c3-1eb4746d7981	3264	Sveti Štefan
00050000-569c-f2e4-2511-a94df219c45d	2258	Sveti Tomaž
00050000-569c-f2e4-8a9d-75145685af26	9204	Šalovci
00050000-569c-f2e4-dddd-0d1cc4f411ce	5261	Šempas
00050000-569c-f2e4-9bf3-980133258532	5290	Šempeter pri Gorici
00050000-569c-f2e4-726e-2779fe6c5111	3311	Šempeter v Savinjski dolini
00050000-569c-f2e4-28b9-450615c90d94	4208	Šenčur
00050000-569c-f2e4-794d-28d70871641a	2212	Šentilj v Slovenskih goricah
00050000-569c-f2e4-62c7-7719827a9f43	8297	Šentjanž
00050000-569c-f2e4-8362-bfa8b103a13a	2373	Šentjanž pri Dravogradu
00050000-569c-f2e4-6096-8f862c6338b5	8310	Šentjernej
00050000-569c-f2e4-f71e-b36f14f60314	3230	Šentjur
00050000-569c-f2e4-7c29-3cde169613d0	3271	Šentrupert
00050000-569c-f2e4-31ff-b49993661301	8232	Šentrupert
00050000-569c-f2e4-f2ec-e2b3cc537ebe	1296	Šentvid pri Stični
00050000-569c-f2e4-1937-ff8d47ec0f7f	8275	Škocjan
00050000-569c-f2e4-13cf-bff42baa56f1	6281	Škofije
00050000-569c-f2e4-25f0-7a19804ecbef	4220	Škofja Loka
00050000-569c-f2e4-a597-6d12dcc36145	3211	Škofja vas
00050000-569c-f2e4-2220-f1950bf8a8f4	1291	Škofljica
00050000-569c-f2e4-e238-f6236c101e3c	6274	Šmarje
00050000-569c-f2e4-a206-21f1069c625f	1293	Šmarje - Sap
00050000-569c-f2e4-7d25-ede24e54e3d7	3240	Šmarje pri Jelšah
00050000-569c-f2e4-8a16-9b1e02a7799d	8220	Šmarješke Toplice
00050000-569c-f2e4-02ab-1e5c729e1077	2315	Šmartno na Pohorju
00050000-569c-f2e4-0b48-91a04dae17fb	3341	Šmartno ob Dreti
00050000-569c-f2e4-8057-d164cb74c732	3327	Šmartno ob Paki
00050000-569c-f2e4-01a1-18d8ba5fd1d7	1275	Šmartno pri Litiji
00050000-569c-f2e4-4c07-0d2a6b86ba7f	2383	Šmartno pri Slovenj Gradcu
00050000-569c-f2e4-1ffb-a90a9b98220e	3201	Šmartno v Rožni dolini
00050000-569c-f2e4-847a-494a846712c0	3325	Šoštanj
00050000-569c-f2e4-839d-f7cd40ca27e8	6222	Štanjel
00050000-569c-f2e4-c3b7-8bff32a931fc	3220	Štore
00050000-569c-f2e4-358a-cbd04dff08bf	3304	Tabor
00050000-569c-f2e4-838a-d1ed68381908	3221	Teharje
00050000-569c-f2e4-ceec-37c226e6e4dd	9251	Tišina
00050000-569c-f2e4-4ae0-7d08513a6536	5220	Tolmin
00050000-569c-f2e4-50a7-1fcf04f999f9	3326	Topolšica
00050000-569c-f2e4-5ea8-ef3760365eff	2371	Trbonje
00050000-569c-f2e4-c1d4-30a98fe9e65b	1420	Trbovlje
00050000-569c-f2e4-b6d3-1288f6e8c7e8	8231	Trebelno 
00050000-569c-f2e4-382e-369356f5ea44	8210	Trebnje
00050000-569c-f2e4-0366-a22ebe2776d3	5252	Trnovo pri Gorici
00050000-569c-f2e4-6478-4c3aa454bdd3	2254	Trnovska vas
00050000-569c-f2e4-16f5-f919c7a2556a	1222	Trojane
00050000-569c-f2e4-05ae-d0cc40255a87	1236	Trzin
00050000-569c-f2e4-1c6f-57df756bb094	4290	Tržič
00050000-569c-f2e4-7cf3-de518b078e8b	8295	Tržišče
00050000-569c-f2e4-08fe-eb72537eccc8	1311	Turjak
00050000-569c-f2e4-d1d7-4558357c8356	9224	Turnišče
00050000-569c-f2e4-9998-6b75baa19061	8323	Uršna sela
00050000-569c-f2e4-4156-f5407f40b12a	1252	Vače
00050000-569c-f2e4-ba5d-b2d63a53c32c	3320	Velenje 
00050000-569c-f2e4-93fb-834e9a0acbf1	3322	Velenje - poštni predali
00050000-569c-f2e4-aa8b-fc30176409b0	8212	Velika Loka
00050000-569c-f2e4-27b2-a10e5ddd7d4f	2274	Velika Nedelja
00050000-569c-f2e4-ddd4-3dc20ae09be5	9225	Velika Polana
00050000-569c-f2e4-3d09-014a2fe38dce	1315	Velike Lašče
00050000-569c-f2e4-a071-4a71a6729a93	8213	Veliki Gaber
00050000-569c-f2e4-c4e9-0f9e8810a8e5	9241	Veržej
00050000-569c-f2e4-6d52-e38b5b8efba2	1312	Videm - Dobrepolje
00050000-569c-f2e4-c59d-d66861cd89bd	2284	Videm pri Ptuju
00050000-569c-f2e4-1b79-1f1b61e62066	8344	Vinica
00050000-569c-f2e4-c7e6-26d33aed5af9	5271	Vipava
00050000-569c-f2e4-e0bf-ef0ea1ce68a4	4212	Visoko
00050000-569c-f2e4-8119-479800e82bff	1294	Višnja Gora
00050000-569c-f2e4-6334-54b6bceb1d8e	3205	Vitanje
00050000-569c-f2e4-43f2-ecc6946e7207	2255	Vitomarci
00050000-569c-f2e4-bfb0-21f5da86e1ab	1217	Vodice
00050000-569c-f2e4-b70d-f81ebe68bdab	3212	Vojnik\t
00050000-569c-f2e4-3b84-d1b5fa22d0db	5293	Volčja Draga
00050000-569c-f2e4-a319-da64deb4237c	2232	Voličina
00050000-569c-f2e4-795f-233ba54257e4	3305	Vransko
00050000-569c-f2e4-e3f8-44f88930245c	6217	Vremski Britof
00050000-569c-f2e4-327e-cd34ec5da647	1360	Vrhnika
00050000-569c-f2e4-83a9-fe9a7130e420	2365	Vuhred
00050000-569c-f2e4-2d7f-9e358e62c166	2367	Vuzenica
00050000-569c-f2e4-21b8-4432ac792ffd	8292	Zabukovje 
00050000-569c-f2e4-1d54-062322018be2	1410	Zagorje ob Savi
00050000-569c-f2e4-527c-01fbc44ffc6d	1303	Zagradec
00050000-569c-f2e4-84a4-1dfa6f4d0610	2283	Zavrč
00050000-569c-f2e4-67b8-9681a21d0f7e	8272	Zdole 
00050000-569c-f2e4-b7a7-ff00c44cd6fc	4201	Zgornja Besnica
00050000-569c-f2e4-2dd6-0d47969959f9	2242	Zgornja Korena
00050000-569c-f2e4-a4b0-41ac8f01b81c	2201	Zgornja Kungota
00050000-569c-f2e4-744c-9d15efc9cd14	2316	Zgornja Ložnica
00050000-569c-f2e4-cae5-ff20317d61dd	2314	Zgornja Polskava
00050000-569c-f2e4-5222-7ae2e75b7501	2213	Zgornja Velka
00050000-569c-f2e4-9681-a362f20962ae	4247	Zgornje Gorje
00050000-569c-f2e4-39c4-aff6bcad902a	4206	Zgornje Jezersko
00050000-569c-f2e4-cda7-a615df785861	2285	Zgornji Leskovec
00050000-569c-f2e4-ddbc-dca2e1fa43de	1432	Zidani Most
00050000-569c-f2e4-0465-56028cb54e65	3214	Zreče
00050000-569c-f2e4-612c-42f2ef54868d	4209	Žabnica
00050000-569c-f2e4-ed2c-49e8241f0878	3310	Žalec
00050000-569c-f2e4-1b89-e0558719304c	4228	Železniki
00050000-569c-f2e4-22e6-437dca3d69f2	2287	Žetale
00050000-569c-f2e4-7d08-584770d9c4df	4226	Žiri
00050000-569c-f2e4-e4c2-736a9cb4dcfa	4274	Žirovnica
00050000-569c-f2e4-220d-dd4928b93346	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 37519704)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 37519274)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 37519013)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569c-f2e8-e66a-a2bda8421956	00080000-569c-f2e8-a324-48b4ee245ce7	\N	00040000-569c-f2e5-4427-06ea00fc60c1	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569c-f2e8-0de4-c3c4d97dee3b	00080000-569c-f2e8-a324-48b4ee245ce7	\N	00040000-569c-f2e5-4427-06ea00fc60c1	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569c-f2e8-e757-3d9a0637bf78	00080000-569c-f2e8-620f-8b3c19ad04f0	\N	00040000-569c-f2e5-4427-06ea00fc60c1	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 37519150)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569c-f2e5-04d6-215a4cce3d50	novo leto	1	1	\N	t
00430000-569c-f2e5-142d-407fb1cf4808	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569c-f2e5-d862-9cc583ddae67	dan upora proti okupatorju	27	4	\N	t
00430000-569c-f2e5-d094-6a96a09ac07d	praznik dela	1	5	\N	t
00430000-569c-f2e5-c1a9-f0f6d6a2b0ca	praznik dela	2	5	\N	t
00430000-569c-f2e5-8a9b-225c664d75b9	dan Primoža Trubarja	8	6	\N	f
00430000-569c-f2e5-2d67-5a7a04f39a1f	dan državnosti	25	6	\N	t
00430000-569c-f2e5-28c3-213b176c4008	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569c-f2e5-e0b0-8757ca113c96	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569c-f2e5-8dfe-603715ce5731	dan suverenosti	25	10	\N	f
00430000-569c-f2e5-26a2-65890df7457f	dan spomina na mrtve	1	11	\N	t
00430000-569c-f2e5-c521-3fbf5b69e6db	dan Rudolfa Maistra	23	11	\N	f
00430000-569c-f2e5-a56d-f66b71c79c87	božič	25	12	\N	t
00430000-569c-f2e5-6410-3f3119b987f2	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569c-f2e5-aad0-aa73f36398f3	Marijino vnebovzetje	15	8	\N	t
00430000-569c-f2e5-bb90-6e7295beb842	dan reformacije	31	10	\N	t
00430000-569c-f2e5-7b0e-dd3b5a1dec3b	velikonočna nedelja	27	3	2016	t
00430000-569c-f2e5-546c-4a8d0db1a25f	velikonočna nedelja	16	4	2017	t
00430000-569c-f2e5-288a-62f559282b92	velikonočna nedelja	1	4	2018	t
00430000-569c-f2e5-d650-910f02dd2f80	velikonočna nedelja	21	4	2019	t
00430000-569c-f2e5-7b04-c810f51ca274	velikonočna nedelja	12	4	2020	t
00430000-569c-f2e5-f869-d5dfd583d805	velikonočna nedelja	4	4	2021	t
00430000-569c-f2e5-4d39-282df45ce449	velikonočna nedelja	17	4	2022	t
00430000-569c-f2e5-7b35-1470384003a3	velikonočna nedelja	9	4	2023	t
00430000-569c-f2e5-b03d-79ab8f6202ed	velikonočna nedelja	31	3	2024	t
00430000-569c-f2e5-2bc8-8d663d16a9fc	velikonočna nedelja	20	4	2025	t
00430000-569c-f2e5-a5e1-d8d12c333129	velikonočna nedelja	5	4	2026	t
00430000-569c-f2e5-def0-33fc9e665aaa	velikonočna nedelja	28	3	2027	t
00430000-569c-f2e5-148c-4c69623c5d9f	velikonočna nedelja	16	4	2028	t
00430000-569c-f2e5-f4b5-165617bbebb9	velikonočna nedelja	1	4	2029	t
00430000-569c-f2e5-481a-92d4e9f9902c	velikonočna nedelja	21	4	2030	t
00430000-569c-f2e5-e24d-23c0b64f4c4e	velikonočni ponedeljek	28	3	2016	t
00430000-569c-f2e5-2532-83c711effcd3	velikonočni ponedeljek	17	4	2017	t
00430000-569c-f2e5-1ea8-89497ef4214f	velikonočni ponedeljek	2	4	2018	t
00430000-569c-f2e5-5e0a-44027373cf2d	velikonočni ponedeljek	22	4	2019	t
00430000-569c-f2e5-59f1-f2a61bf63f88	velikonočni ponedeljek	13	4	2020	t
00430000-569c-f2e5-0eea-b832b6a4a48a	velikonočni ponedeljek	5	4	2021	t
00430000-569c-f2e5-f4e6-8a229186745b	velikonočni ponedeljek	18	4	2022	t
00430000-569c-f2e5-4290-3e0ebe8d54de	velikonočni ponedeljek	10	4	2023	t
00430000-569c-f2e5-f0a5-0adfbc38a30c	velikonočni ponedeljek	1	4	2024	t
00430000-569c-f2e5-2ead-47f405c0b01b	velikonočni ponedeljek	21	4	2025	t
00430000-569c-f2e5-64e6-a79ca0611d1a	velikonočni ponedeljek	6	4	2026	t
00430000-569c-f2e5-f3e6-b3ea9391abd7	velikonočni ponedeljek	29	3	2027	t
00430000-569c-f2e5-b84e-964368422bbd	velikonočni ponedeljek	17	4	2028	t
00430000-569c-f2e5-37ab-43e98b4badbc	velikonočni ponedeljek	2	4	2029	t
00430000-569c-f2e5-b5a2-7d9a0681c331	velikonočni ponedeljek	22	4	2030	t
00430000-569c-f2e5-d09d-6a8b7bea2310	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569c-f2e5-31ff-de305709743b	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569c-f2e5-64e7-4b32f5a913e5	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569c-f2e5-e18f-1a0e8428e6d6	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569c-f2e5-fe07-bc38f2bdd63f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569c-f2e5-c96a-1c36ac4a890f	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569c-f2e5-ddf1-d7c7c5afb633	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569c-f2e5-e70b-b1095ad26535	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569c-f2e5-847c-cede8f48fecc	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569c-f2e5-6ab2-0b86c2672b87	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569c-f2e5-5565-2f96d85227e8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569c-f2e5-e20a-056d30d0a299	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569c-f2e5-5fab-070744d01e6b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569c-f2e5-6648-e2fb1f1b9b72	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569c-f2e5-07dd-16c9d34ec7a0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 37519117)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569c-f2e9-276a-75a8d99903f7	000e0000-569c-f2e8-6f3d-6cef02b3a29f	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 37519125)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37519286)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 37519718)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 37519728)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569c-f2e8-bf19-02c1b1eb78f4	00080000-569c-f2e8-4c6c-708b5618be5e	0987	AK
00190000-569c-f2e8-0788-43dab4f79011	00080000-569c-f2e8-620f-8b3c19ad04f0	0989	AK
00190000-569c-f2e8-f47f-8c29ea5afd8f	00080000-569c-f2e8-3b9d-6fde6ee7eee9	0986	AK
00190000-569c-f2e8-dc5b-31533654d120	00080000-569c-f2e8-28d3-a78907499fa4	0984	AK
00190000-569c-f2e8-1e66-ea1e3fff62d1	00080000-569c-f2e8-f770-df0ea0eeea30	0983	AK
00190000-569c-f2e8-f3a5-856925fde5ff	00080000-569c-f2e8-9aae-e4dc08ccb767	0982	AK
00190000-569c-f2ea-8fa1-fb27f06e434f	00080000-569c-f2ea-dc9a-3b959015cc27	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 37519617)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569c-f2e9-b159-4d1994475dc7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 37519736)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 37519315)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569c-f2e8-779f-7e0becd5d018	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569c-f2e8-0822-16e144be7698	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569c-f2e8-37b6-976b8038f721	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569c-f2e8-1afd-ba231b4ce2b2	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569c-f2e8-95f1-27b1353b80ce	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569c-f2e8-0761-3857ccc15de7	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569c-f2e8-aa4c-4357dd9f899b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 37519259)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37519249)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 37519456)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 37519386)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37519091)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 37518853)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569c-f2ea-dc9a-3b959015cc27	00010000-569c-f2e6-bb05-b5c8ad8ee791	2016-01-18 15:12:58	INS	a:0:{}
2	App\\Entity\\Option	00000000-569c-f2ea-496d-266cb741843c	00010000-569c-f2e6-bb05-b5c8ad8ee791	2016-01-18 15:12:58	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569c-f2ea-8fa1-fb27f06e434f	00010000-569c-f2e6-bb05-b5c8ad8ee791	2016-01-18 15:12:58	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 37519328)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 37518891)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569c-f2e5-e352-b56f79cc6ece	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569c-f2e5-6741-8eb584adef38	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569c-f2e5-5910-210546006440	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569c-f2e5-b8a5-b3cbf7ba7485	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569c-f2e5-89d0-7369c5db1926	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569c-f2e5-2fc0-93e687f3346b	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569c-f2e5-f83f-da8690108534	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569c-f2e5-5632-7c7487c17f76	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569c-f2e5-8e0c-a4594a2adbf1	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-f2e5-49ca-c5547053b1d1	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-f2e5-7892-052fac5adcad	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-f2e5-7123-48299c96f262	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-f2e6-33b4-0d48a29e4058	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-f2e6-a724-d907d32a9a66	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-f2e6-bbea-b392d2772cf6	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-f2e6-ce96-26a3908dd103	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-f2e6-df34-66a3957d856d	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569c-f2e6-a15b-a0e6fdaa1034	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569c-f2e6-5069-c7f49c5f58b2	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569c-f2e6-5708-2dc4d3b422eb	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569c-f2e6-4ec8-2ee425131ac6	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-f2e6-252c-2744e4974c50	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-f2e6-63b1-586dff7c4095	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-f2e6-9b97-0f1d095e0884	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-f2e6-aaf3-cfc0e0f5f139	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569c-f2e6-5027-fa09cbc608f9	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569c-f2e6-bf6b-970968ff6ef2	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569c-f2e6-536d-928b2ad7c675	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569c-f2e6-612a-f3cda48f5623	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569c-f2e6-b775-fa84dceda653	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569c-f2e6-968f-551ab4203651	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-f2e6-375a-0a3d24949274	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-f2e6-1a46-2dc7c49a9403	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569c-f2e6-c328-690ecfab74e4	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569c-f2e6-b969-af2d0dd8a365	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569c-f2e6-47c9-51e420833c58	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569c-f2e6-ec24-916675a89f01	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-f2e6-1349-c6dab4173cb6	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-f2e6-fe3f-30cf0370f836	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569c-f2e6-63b0-80134bfa7d9e	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-f2e6-3dc8-3acfe24753ae	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-f2e6-7c92-5d041685dea4	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569c-f2e6-c9d2-bfe87a4f023e	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-f2e6-6423-be588d1e8c29	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-f2e6-8c20-edeef0a3c013	direktor	minimalne pravice za direktorja	t
00020000-569c-f2e6-c93f-76f1826013ed	arhivar	arhivar	t
00020000-569c-f2e6-1f07-09e1481fb7e4	dramaturg	dramaturg	t
00020000-569c-f2e6-303f-23fe5d334c7e	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569c-f2e6-2a40-9dd08fd70c2a	poslovni-sekretar	poslovni sekretar	t
00020000-569c-f2e6-75b6-1c2d15206e0b	vodja-tehnike	vodja tehnike	t
00020000-569c-f2e6-9196-e48d02b381db	racunovodja	računovodja	t
00020000-569c-f2e8-ecbd-104004f0e769	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569c-f2e8-c056-d8f11e4f762d	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-529f-bb71417d6a36	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-ac41-476d1b427e15	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-d843-f133b7b0a766	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-3cbc-4683ed708597	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-010b-bc94191e619f	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-4ed6-5af5c14d7871	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-b8d5-9da7ea5ab954	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-323b-5e2fe171f501	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-d1b4-cdae1b6b5a8d	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-f2a8-f001c77f9231	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-7250-e5fdc757e7ad	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-1415-05d6bd01bcab	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-402b-02ab14bbcb69	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-58b1-715170058eec	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-5b38-ee0139ba490e	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-4cbc-9bcbf4dec8ee	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-f2b8-c8f85ac6f2d4	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-ef62-14c2898d6561	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569c-f2e8-011b-2a4eb1c64260	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-086a-4deb9a59f0e3	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-2699-cf39880b3463	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-e230-b5560f1210a8	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-1c96-a84e0380c1f9	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-b715-27a6fa101252	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-93ab-68218ca7b825	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-57e5-d6d23a49a0cd	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-3eb6-7bb14a30daff	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-3cb4-cb380158550b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-6857-77b864d99f7a	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-590d-b9920942e057	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-be68-28fd382ec0f0	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-0940-13ee85f378a9	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-759c-4d0dbee7b49e	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-0a34-48bd41b2b8d7	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-1350-4f2a8dae9b73	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-8b30-f331946ba66d	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569c-f2e8-c86f-c1dd54bf17d6	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 37518875)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569c-f2e6-9ff2-ad8756ca5b6e	00020000-569c-f2e5-5910-210546006440
00010000-569c-f2e6-bb05-b5c8ad8ee791	00020000-569c-f2e5-5910-210546006440
00010000-569c-f2e8-2dd0-7b295e64acbd	00020000-569c-f2e8-ecbd-104004f0e769
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-c056-d8f11e4f762d
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-3cbc-4683ed708597
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-323b-5e2fe171f501
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-f2a8-f001c77f9231
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-1415-05d6bd01bcab
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-f2b8-c8f85ac6f2d4
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-ac41-476d1b427e15
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-011b-2a4eb1c64260
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-e230-b5560f1210a8
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-b715-27a6fa101252
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-57e5-d6d23a49a0cd
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-3cb4-cb380158550b
00010000-569c-f2e8-9e28-d19c37dd22a9	00020000-569c-f2e8-0940-13ee85f378a9
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-c056-d8f11e4f762d
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-529f-bb71417d6a36
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-ac41-476d1b427e15
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-d843-f133b7b0a766
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-1415-05d6bd01bcab
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-5b38-ee0139ba490e
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-011b-2a4eb1c64260
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-e230-b5560f1210a8
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-b715-27a6fa101252
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-57e5-d6d23a49a0cd
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-3cb4-cb380158550b
00010000-569c-f2e8-4386-ed790ed1b6b0	00020000-569c-f2e8-0940-13ee85f378a9
00010000-569c-f2e8-b2d9-3f4032a9a5ce	00020000-569c-f2e8-c056-d8f11e4f762d
00010000-569c-f2e8-b2d9-3f4032a9a5ce	00020000-569c-f2e8-529f-bb71417d6a36
00010000-569c-f2e8-b2d9-3f4032a9a5ce	00020000-569c-f2e8-ac41-476d1b427e15
00010000-569c-f2e8-b2d9-3f4032a9a5ce	00020000-569c-f2e8-d843-f133b7b0a766
00010000-569c-f2e8-b2d9-3f4032a9a5ce	00020000-569c-f2e8-f2a8-f001c77f9231
00010000-569c-f2e8-b2d9-3f4032a9a5ce	00020000-569c-f2e8-1415-05d6bd01bcab
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-529f-bb71417d6a36
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-010b-bc94191e619f
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-d1b4-cdae1b6b5a8d
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-7250-e5fdc757e7ad
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-f2a8-f001c77f9231
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-4cbc-9bcbf4dec8ee
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-1415-05d6bd01bcab
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-402b-02ab14bbcb69
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-011b-2a4eb1c64260
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-086a-4deb9a59f0e3
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-e230-b5560f1210a8
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-1c96-a84e0380c1f9
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-b715-27a6fa101252
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-93ab-68218ca7b825
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-57e5-d6d23a49a0cd
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-3eb6-7bb14a30daff
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-3cb4-cb380158550b
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-6857-77b864d99f7a
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-0940-13ee85f378a9
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-759c-4d0dbee7b49e
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-1350-4f2a8dae9b73
00010000-569c-f2e8-5056-ced9815014e4	00020000-569c-f2e8-8b30-f331946ba66d
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-529f-bb71417d6a36
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-010b-bc94191e619f
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-b8d5-9da7ea5ab954
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-d1b4-cdae1b6b5a8d
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-7250-e5fdc757e7ad
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-f2a8-f001c77f9231
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-4cbc-9bcbf4dec8ee
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-1415-05d6bd01bcab
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-402b-02ab14bbcb69
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-58b1-715170058eec
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-011b-2a4eb1c64260
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-086a-4deb9a59f0e3
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-2699-cf39880b3463
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-e230-b5560f1210a8
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-1c96-a84e0380c1f9
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-b715-27a6fa101252
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-93ab-68218ca7b825
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-57e5-d6d23a49a0cd
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-3eb6-7bb14a30daff
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-3cb4-cb380158550b
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-6857-77b864d99f7a
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-0940-13ee85f378a9
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-759c-4d0dbee7b49e
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-0a34-48bd41b2b8d7
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-1350-4f2a8dae9b73
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-8b30-f331946ba66d
00010000-569c-f2e8-2fd4-1fc83f4f8c43	00020000-569c-f2e8-c86f-c1dd54bf17d6
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-529f-bb71417d6a36
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-ac41-476d1b427e15
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-010b-bc94191e619f
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-4ed6-5af5c14d7871
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-b8d5-9da7ea5ab954
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-3cbc-4683ed708597
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-d1b4-cdae1b6b5a8d
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-7250-e5fdc757e7ad
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-f2a8-f001c77f9231
00010000-569c-f2e8-8cdf-4495633abc84	00020000-569c-f2e8-4cbc-9bcbf4dec8ee
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-c056-d8f11e4f762d
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-d843-f133b7b0a766
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-3cbc-4683ed708597
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-323b-5e2fe171f501
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-f2a8-f001c77f9231
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-1415-05d6bd01bcab
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-f2b8-c8f85ac6f2d4
00010000-569c-f2e8-b871-e8ca7cba418a	00020000-569c-f2e8-590d-b9920942e057
00010000-569c-f2e8-d8ae-19d1b6bbb2c4	00020000-569c-f2e8-ef62-14c2898d6561
00010000-569c-f2e8-4d83-6d22822d31ad	00020000-569c-f2e6-8c20-edeef0a3c013
00010000-569c-f2e8-d8ae-40cc7e452528	00020000-569c-f2e6-c93f-76f1826013ed
00010000-569c-f2e8-4326-7c7cce49282f	00020000-569c-f2e6-1f07-09e1481fb7e4
00010000-569c-f2e8-9230-0eaa347fd701	00020000-569c-f2e6-303f-23fe5d334c7e
00010000-569c-f2e8-5473-4b72dfc19182	00020000-569c-f2e6-2a40-9dd08fd70c2a
00010000-569c-f2e8-e68d-1a01079bb3ca	00020000-569c-f2e6-75b6-1c2d15206e0b
00010000-569c-f2e8-f1f9-c66fd06f64ed	00020000-569c-f2e6-9196-e48d02b381db
\.


--
-- TOC entry 3187 (class 0 OID 37519342)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 37519280)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37519203)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569c-f2e8-fa79-80fa55c2f903	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569c-f2e8-7268-0f7416b709e4	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569c-f2e8-c865-d4b524d75c8a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 37518840)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569c-f2e5-8cf1-cc3c001fa20d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569c-f2e5-f7e8-0537c7732953	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569c-f2e5-fb15-8d20a9188a07	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569c-f2e5-aa22-ac25a5842586	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569c-f2e5-8c03-004458230572	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 37518832)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569c-f2e5-4f54-12dcc18dbe39	00230000-569c-f2e5-aa22-ac25a5842586	popa
00240000-569c-f2e5-c7fb-9cd88f256b13	00230000-569c-f2e5-aa22-ac25a5842586	oseba
00240000-569c-f2e5-12b6-0cd10b7cac96	00230000-569c-f2e5-aa22-ac25a5842586	tippopa
00240000-569c-f2e5-df47-58edefd2c654	00230000-569c-f2e5-aa22-ac25a5842586	organizacijskaenota
00240000-569c-f2e5-8ac8-e7e64f5433ce	00230000-569c-f2e5-aa22-ac25a5842586	sezona
00240000-569c-f2e5-b0fe-0a6b5e576913	00230000-569c-f2e5-aa22-ac25a5842586	tipvaje
00240000-569c-f2e5-f67c-5d57ac2271b1	00230000-569c-f2e5-aa22-ac25a5842586	tipdodatka
00240000-569c-f2e5-369b-274410272da4	00230000-569c-f2e5-f7e8-0537c7732953	prostor
00240000-569c-f2e5-c812-ff88f6a464d6	00230000-569c-f2e5-aa22-ac25a5842586	besedilo
00240000-569c-f2e5-0a51-094c59cdb1c8	00230000-569c-f2e5-aa22-ac25a5842586	uprizoritev
00240000-569c-f2e5-7777-86ca75c29967	00230000-569c-f2e5-aa22-ac25a5842586	funkcija
00240000-569c-f2e5-3460-e2cccebf3538	00230000-569c-f2e5-aa22-ac25a5842586	tipfunkcije
00240000-569c-f2e5-fd62-9764d89e8fc0	00230000-569c-f2e5-aa22-ac25a5842586	alternacija
00240000-569c-f2e5-dc25-67f55b493ff5	00230000-569c-f2e5-8cf1-cc3c001fa20d	pogodba
00240000-569c-f2e5-057a-951a66cd270d	00230000-569c-f2e5-aa22-ac25a5842586	zaposlitev
00240000-569c-f2e5-aae8-a877d72e358d	00230000-569c-f2e5-aa22-ac25a5842586	zvrstuprizoritve
00240000-569c-f2e5-a4ca-b925cd40c075	00230000-569c-f2e5-8cf1-cc3c001fa20d	programdela
00240000-569c-f2e5-a2dc-c3c816716def	00230000-569c-f2e5-aa22-ac25a5842586	zapis
\.


--
-- TOC entry 3134 (class 0 OID 37518827)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ad7256c4-0cf7-499a-8af4-40f2c8e84e3a	00240000-569c-f2e5-4f54-12dcc18dbe39	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 37519403)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569c-f2e9-fa73-cfb931fe2a81	000e0000-569c-f2e8-6f3d-6cef02b3a29f	00080000-569c-f2e8-a324-48b4ee245ce7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569c-f2e5-9baf-0f76a8da178f
00270000-569c-f2e9-aca0-2ac4cb829326	000e0000-569c-f2e8-6f3d-6cef02b3a29f	00080000-569c-f2e8-a324-48b4ee245ce7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569c-f2e5-9baf-0f76a8da178f
\.


--
-- TOC entry 3150 (class 0 OID 37518975)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 37519222)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569c-f2e9-f7e7-4371760dca0b	00180000-569c-f2e9-9ac6-0cefc9360894	000c0000-569c-f2e9-c0cb-c0cca976f3ae	00090000-569c-f2e8-3802-11b00d10a216	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-f2e9-b674-966e2588b930	00180000-569c-f2e9-9ac6-0cefc9360894	000c0000-569c-f2e9-d031-86b594f2fa5c	00090000-569c-f2e8-3098-9e355fe3b352	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-f2e9-5c93-5a32ff7ad89e	00180000-569c-f2e9-9ac6-0cefc9360894	000c0000-569c-f2e9-6148-7bdab8ddb5c9	00090000-569c-f2e8-2e07-7fadc168f558	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-f2e9-6b88-e5c2210d0baa	00180000-569c-f2e9-9ac6-0cefc9360894	000c0000-569c-f2e9-0b69-d8fa77c90089	00090000-569c-f2e8-30cb-82a507bb3cdd	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-f2e9-a272-f9e17dcb2297	00180000-569c-f2e9-9ac6-0cefc9360894	000c0000-569c-f2e9-0eea-21db69b87ec2	00090000-569c-f2e8-3a1c-45c41ec7e0f3	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-f2e9-80e9-ea863a53ba12	00180000-569c-f2e9-96b3-317c9a866976	\N	00090000-569c-f2e8-3a1c-45c41ec7e0f3	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569c-f2e9-0c7f-1b8822b66cc6	00180000-569c-f2e9-2248-02a7346266b4	\N	00090000-569c-f2e8-3098-9e355fe3b352	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 37519239)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569c-f2e5-5f50-a679fbcb711c	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569c-f2e5-75b9-8b9c8f9edd4d	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569c-f2e5-c833-49dae9b34e13	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569c-f2e5-430d-ee7bccfa2f63	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569c-f2e5-5281-8fba826dfc0a	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569c-f2e5-6beb-6f364159f03b	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 37519444)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569c-f2e5-9590-f811a72c848a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569c-f2e5-f2c6-13a344aa6526	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569c-f2e5-285d-9cca4bd3fd82	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569c-f2e5-c5a4-d8dbb88afaa7	04	Režija	Režija	Režija	umetnik	30
000f0000-569c-f2e5-518c-5616f60723bf	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569c-f2e5-991c-f06694eec210	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569c-f2e5-0c7a-3dc34710298a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569c-f2e5-1fb4-e070779782d5	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569c-f2e5-487d-0c2fbd5b2deb	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569c-f2e5-daea-9cb48c4d1538	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569c-f2e5-e9d5-7fa70df7d6b0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569c-f2e5-76b6-ad96736b20d5	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569c-f2e5-3277-6da61228750a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569c-f2e5-8b3d-b5f80cf90320	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569c-f2e5-9b29-35e5b51c3a8d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569c-f2e5-3e05-459640a60e86	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569c-f2e5-5afd-4b1607c9c769	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569c-f2e5-85d4-37c7da63a36b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569c-f2e5-701b-93be438464af	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 37518926)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569c-f2e8-72c8-9fb5d6f20b16	0001	šola	osnovna ali srednja šola
00400000-569c-f2e8-b817-b04096400405	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569c-f2e8-6409-e52900a73dfc	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 37519748)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569c-f2e5-9c7c-8462e88f884e	01	Velika predstava	f	1.00	1.00
002b0000-569c-f2e5-bb80-5f179dd3a12e	02	Mala predstava	f	0.50	0.50
002b0000-569c-f2e5-f407-3ca29eff8583	03	Mala koprodukcija	t	0.40	1.00
002b0000-569c-f2e5-429e-7770a5bf0be8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569c-f2e5-bc54-a53eaf515990	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 37519193)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569c-f2e5-1112-6d8f20db0d81	0001	prva vaja	prva vaja
00420000-569c-f2e5-6935-da131a8d9462	0002	tehnična vaja	tehnična vaja
00420000-569c-f2e5-5fb7-bec647754e05	0003	lučna vaja	lučna vaja
00420000-569c-f2e5-b545-5eecc9875b46	0004	kostumska vaja	kostumska vaja
00420000-569c-f2e5-423b-2222ed3d6ed8	0005	foto vaja	foto vaja
00420000-569c-f2e5-e1d3-eb90f993acd8	0006	1. glavna vaja	1. glavna vaja
00420000-569c-f2e5-4e17-3f93cacaea87	0007	2. glavna vaja	2. glavna vaja
00420000-569c-f2e5-8c53-d8730fec6ab2	0008	1. generalka	1. generalka
00420000-569c-f2e5-19d3-41e09ca2cd09	0009	2. generalka	2. generalka
00420000-569c-f2e5-4262-b4620e4dda08	0010	odprta generalka	odprta generalka
00420000-569c-f2e5-7216-60dd43df48cc	0011	obnovitvena vaja	obnovitvena vaja
00420000-569c-f2e5-36a0-10a3becdea46	0012	italijanka	krajša "obnovitvena" vaja
00420000-569c-f2e5-28bd-7de3622de195	0013	pevska vaja	pevska vaja
00420000-569c-f2e5-47ff-adeff72007d7	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569c-f2e5-4145-166dc7a828ae	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569c-f2e5-75a0-9c669f7a1253	0016	orientacijska vaja	orientacijska vaja
00420000-569c-f2e5-34b8-1ca9a85d9013	0017	situacijska vaja	situacijska vaja
00420000-569c-f2e5-084d-d7f1deb7f7ec	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 37519048)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 37518862)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569c-f2e6-bb05-b5c8ad8ee791	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROeO9TDccx20e6.h4L86H8oTOUGhWiQsu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-6997-ca994ed441b8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-7a73-c972c063ece9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-4687-007a3cf32a34	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-1d38-c8187a2971b3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-0d5e-a3ba38a664ed	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-950f-5388d4c5ec36	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-815f-1a7c2f9cadc7	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-8019-52ed80e7d9ad	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-29a9-60e3220b997d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-2dd0-7b295e64acbd	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-f204-3042d12c1215	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-9e28-d19c37dd22a9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-4386-ed790ed1b6b0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-b2d9-3f4032a9a5ce	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-5056-ced9815014e4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-2fd4-1fc83f4f8c43	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-8cdf-4495633abc84	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-b871-e8ca7cba418a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-d8ae-19d1b6bbb2c4	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-4d83-6d22822d31ad	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-d8ae-40cc7e452528	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-4326-7c7cce49282f	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-9230-0eaa347fd701	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-5473-4b72dfc19182	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-e68d-1a01079bb3ca	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569c-f2e8-f1f9-c66fd06f64ed	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569c-f2e6-9ff2-ad8756ca5b6e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 37519494)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569c-f2e8-ef51-c8c8b9089677	00160000-569c-f2e8-0eff-efc6b02f3e9c	\N	00140000-569c-f2e5-0249-f04cd1dc8d63	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569c-f2e8-95f1-27b1353b80ce
000e0000-569c-f2e8-6f3d-6cef02b3a29f	00160000-569c-f2e8-cf81-4930c7db159f	\N	00140000-569c-f2e5-1188-0a2fff16f282	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569c-f2e8-0761-3857ccc15de7
000e0000-569c-f2e8-e024-4038c3a9572f	\N	\N	00140000-569c-f2e5-1188-0a2fff16f282	00190000-569c-f2e8-bf19-02c1b1eb78f4	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-f2e8-95f1-27b1353b80ce
000e0000-569c-f2e8-5cd9-2f7862da83a5	\N	\N	00140000-569c-f2e5-1188-0a2fff16f282	00190000-569c-f2e8-bf19-02c1b1eb78f4	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-f2e8-95f1-27b1353b80ce
000e0000-569c-f2e8-5e71-172153357dee	\N	\N	00140000-569c-f2e5-1188-0a2fff16f282	00190000-569c-f2e8-bf19-02c1b1eb78f4	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-2bce-68395fde1ef9	\N	\N	00140000-569c-f2e5-1188-0a2fff16f282	00190000-569c-f2e8-bf19-02c1b1eb78f4	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-d3e6-caaa178b3ca9	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-e960-3c0120176a1e	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-e5b9-23570eb8b19e	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-ff08-4ea6cc6212ab	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-1862-fd19d8412f0f	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-7cef-907d610964cf	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-a8ba-bbebb5a8abdf	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-aa09-f132b67e4b4b	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
000e0000-569c-f2e8-4eef-4ccd6dda1c43	\N	\N	00140000-569c-f2e5-5bde-a24bfd1c033a	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-f2e8-779f-7e0becd5d018
\.


--
-- TOC entry 3171 (class 0 OID 37519213)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 37519143)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569c-f2e9-31cd-96ac0c540d2e	\N	000e0000-569c-f2e8-6f3d-6cef02b3a29f	1
00200000-569c-f2e9-9e06-9822d6eefffd	\N	000e0000-569c-f2e8-6f3d-6cef02b3a29f	2
00200000-569c-f2e9-1a64-ae78789a5efd	\N	000e0000-569c-f2e8-6f3d-6cef02b3a29f	3
00200000-569c-f2e9-71f9-6ce3e890ddb9	\N	000e0000-569c-f2e8-6f3d-6cef02b3a29f	4
00200000-569c-f2e9-020b-bf1a740cb1cb	\N	000e0000-569c-f2e8-6f3d-6cef02b3a29f	5
\.


--
-- TOC entry 3183 (class 0 OID 37519307)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 37519417)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569c-f2e5-4fea-dadc289b52f2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569c-f2e5-32fe-a0f19e075d53	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569c-f2e5-75ed-bfa5a9251e71	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569c-f2e5-04d0-e901d48af886	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569c-f2e5-3bee-af94c4d209d9	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569c-f2e5-cd73-d5f26714a07c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569c-f2e5-94a0-691edd3280ad	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569c-f2e5-36ca-39970c256495	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569c-f2e5-9baf-0f76a8da178f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569c-f2e5-0e82-3ec0a2e1b313	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569c-f2e5-df91-4839d6aeeace	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569c-f2e5-2f65-fd217a8d59f1	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569c-f2e5-27dd-57a59715e9e5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569c-f2e5-b512-bf717178e614	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569c-f2e5-b1e1-1db32754180a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569c-f2e5-d55b-c77b85d415c0	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569c-f2e5-ac5a-d58a06a163e2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569c-f2e5-0e1e-a582acabb888	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569c-f2e5-3087-69d09cb641db	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569c-f2e5-ce66-b02cdacd93c6	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569c-f2e5-b1d5-f25e5bd30478	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569c-f2e5-8193-1fabe83cf9f2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569c-f2e5-d19e-7393ca1740e2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569c-f2e5-761b-726879c842cd	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569c-f2e5-ed4f-7c94b35f6fa3	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569c-f2e5-74fe-3da724ec3a60	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569c-f2e5-6304-74af5df295b2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569c-f2e5-7759-2b2d233086f5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 37519798)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 37519767)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 37519810)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 37519379)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569c-f2e8-68b1-4bcce7f5cd5f	00090000-569c-f2e8-3098-9e355fe3b352	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-f2e8-3aa1-47c72add5931	00090000-569c-f2e8-2e07-7fadc168f558	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-f2e8-30f3-85011f8e4564	00090000-569c-f2e8-4102-4b7a765260c9	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-f2e8-9c37-491b8eef65bf	00090000-569c-f2e8-b638-f8ef06b7b669	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-f2e8-6886-7106693bf434	00090000-569c-f2e8-c356-ca8f2bcea949	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-f2e8-cce8-dfbd4e32c906	00090000-569c-f2e8-b4e2-075786e0c632	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37519484)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569c-f2e5-0249-f04cd1dc8d63	01	Drama	drama (SURS 01)
00140000-569c-f2e5-aba7-1ebdfde6f4af	02	Opera	opera (SURS 02)
00140000-569c-f2e5-e50e-b59f33e92d08	03	Balet	balet (SURS 03)
00140000-569c-f2e5-2161-bcb10c40b618	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569c-f2e5-5bde-a24bfd1c033a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569c-f2e5-1188-0a2fff16f282	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569c-f2e5-6694-415fa82f4c84	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 37519369)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 37518925)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 37519542)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 37519533)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 37518916)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 37519400)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 37519442)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 37519851)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 37519236)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 37519172)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 37519187)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 37519192)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 37519765)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 37519074)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 37519611)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 37519365)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 37519141)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 37519112)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37519088)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 37519272)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 37519828)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 37519835)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 37519859)
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
-- TOC entry 2766 (class 2606 OID 37519299)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 37519046)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37518944)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 37519008)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 37518971)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 37518905)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 37518890)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 37519305)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 37519341)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 37519479)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 37518999)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37519034)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 37519716)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 37519278)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 37519024)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 37519157)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 37519129)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 37519122)
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
-- TOC entry 2764 (class 2606 OID 37519290)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 37519725)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 37519733)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 37519703)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 37519746)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 37519323)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 37519263)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 37519254)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 37519466)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 37519393)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 37519100)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 37518861)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 37519332)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 37518879)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 37518899)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 37519350)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 37519285)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 37519211)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37518849)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37518837)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37518831)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 37519413)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 37518980)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 37519228)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 37519246)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 37519453)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 37518933)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 37519758)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 37519200)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 37519059)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 37518874)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 37519512)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 37519219)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 37519147)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 37519313)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 37519425)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 37519808)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 37519792)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 37519816)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 37519383)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 37519492)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 37519377)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 37519181)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 37519182)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 37519180)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 37519179)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 37519178)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 37519414)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 37519415)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 37519416)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 37519830)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 37519829)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 37519001)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 37519002)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 37519306)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 37519796)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 37519795)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 37519797)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 37519794)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 37519793)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 37519292)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 37519291)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 37519148)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 37519149)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 37519366)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 37519368)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 37519367)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 37519090)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 37519089)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 37519747)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 37519481)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 37519482)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 37519483)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 37519817)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 37519517)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 37519514)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 37519518)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 37519516)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 37519515)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 37519061)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 37519060)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 37518974)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 37519333)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 37518906)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 37518907)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 37519353)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 37519352)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 37519351)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 37519011)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 37519010)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 37519012)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 37519123)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 37519124)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 37518839)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 37519258)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 37519256)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 37519255)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 37519257)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 37518880)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 37518881)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 37519314)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 37519852)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 37519402)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 37519401)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 37519860)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 37519861)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 37519279)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 37519394)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 37519395)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 37519616)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 37519615)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 37519612)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 37519613)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 37519614)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 37519026)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 37519025)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 37519027)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 37519327)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 37519326)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 37519726)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 37519727)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 37519546)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 37519547)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 37519544)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 37519545)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 37519237)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 37519238)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 37519384)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 37519385)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 37519220)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 37519267)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 37519266)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 37519264)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 37519265)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 37519534)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 37519101)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 37519115)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 37519114)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 37519113)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 37519116)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 37519142)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 37519130)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 37519131)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 37519717)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 37519766)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 37519836)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 37519837)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 37518946)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 37518945)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 37518981)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 37518982)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 37519231)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 37519230)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 37519229)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 37519174)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 37519177)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 37519173)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 37519176)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 37519175)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 37519000)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 37518934)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 37518935)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 37519075)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 37519077)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 37519076)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 37519078)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 37519273)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 37519480)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 37519513)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 37519454)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 37519455)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 37518972)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 37518973)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 37519247)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 37519248)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 37519378)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 37518850)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 37519047)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 37519009)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37518838)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 37519759)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 37519325)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 37519324)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 37519201)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 37519202)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 37519543)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 37519221)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 37519035)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 37519493)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 37519809)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 37519734)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 37519735)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 37519443)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 37519212)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 37518900)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 37520027)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 37520052)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 37520042)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 37520022)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 37520037)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 37520047)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 37520032)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2986 (class 2606 OID 37520237)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 37520242)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2984 (class 2606 OID 37520247)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 37520407)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3018 (class 2606 OID 37520402)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 37519917)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 37519922)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 37520152)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3012 (class 2606 OID 37520387)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 37520382)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3011 (class 2606 OID 37520392)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3014 (class 2606 OID 37520377)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3015 (class 2606 OID 37520372)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 37520147)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2966 (class 2606 OID 37520142)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 37520012)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 37520017)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 37520192)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 37520202)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 37520197)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 37519972)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 37519967)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 37520132)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 37520362)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2989 (class 2606 OID 37520252)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 37520257)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2987 (class 2606 OID 37520262)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 37520397)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2991 (class 2606 OID 37520282)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2994 (class 2606 OID 37520267)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2990 (class 2606 OID 37520287)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 37520277)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2993 (class 2606 OID 37520272)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 37519962)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 37519957)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 37519902)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 37519897)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 37520172)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 37519877)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 37519882)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2972 (class 2606 OID 37520187)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 37520182)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2974 (class 2606 OID 37520177)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 37519932)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 37519927)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 37519937)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 37519987)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 37519992)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 37519862)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 37520107)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 37520097)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 37520092)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 37520102)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 37519867)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 37519872)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 37520157)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 37520422)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 37520232)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 37520227)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3023 (class 2606 OID 37520427)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 37520432)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 37520137)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2981 (class 2606 OID 37520217)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 37520222)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 37520337)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 37520332)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3004 (class 2606 OID 37520317)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 37520322)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 37520327)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 37519947)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 37519942)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 37519952)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 37520167)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2970 (class 2606 OID 37520162)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 37520347)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 37520352)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 37520307)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2996 (class 2606 OID 37520312)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2999 (class 2606 OID 37520297)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2998 (class 2606 OID 37520302)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 37520082)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 37520087)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2979 (class 2606 OID 37520207)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 37520212)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 37520057)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 37520062)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 37520127)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 37520122)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 37520112)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 37520117)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 37520292)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 37519977)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 37519982)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 37520007)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 37519997)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 37520002)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 37520342)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 37520357)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 37520367)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3020 (class 2606 OID 37520412)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 37520417)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 37519892)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 37519887)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 37519907)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 37519912)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 37520077)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 37520072)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 37520067)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-18 15:13:00 CET

--
-- PostgreSQL database dump complete
--

