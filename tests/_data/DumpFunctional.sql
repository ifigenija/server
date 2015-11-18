--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-18 09:36:34 CET

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
-- TOC entry 183 (class 1259 OID 27983919)
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
-- TOC entry 237 (class 1259 OID 27984533)
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
-- TOC entry 236 (class 1259 OID 27984516)
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
-- TOC entry 182 (class 1259 OID 27983912)
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
-- TOC entry 181 (class 1259 OID 27983910)
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
-- TOC entry 227 (class 1259 OID 27984393)
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
-- TOC entry 230 (class 1259 OID 27984423)
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
-- TOC entry 251 (class 1259 OID 27984824)
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
-- TOC entry 203 (class 1259 OID 27984167)
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
-- TOC entry 205 (class 1259 OID 27984199)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 27984204)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 27984746)
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
-- TOC entry 194 (class 1259 OID 27984064)
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
-- TOC entry 238 (class 1259 OID 27984546)
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
-- TOC entry 223 (class 1259 OID 27984347)
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
-- TOC entry 200 (class 1259 OID 27984138)
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
-- TOC entry 197 (class 1259 OID 27984104)
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
-- TOC entry 195 (class 1259 OID 27984081)
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
-- TOC entry 212 (class 1259 OID 27984261)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 27984804)
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
-- TOC entry 250 (class 1259 OID 27984817)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 27984839)
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
-- TOC entry 216 (class 1259 OID 27984286)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 27984038)
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
-- TOC entry 185 (class 1259 OID 27983938)
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
-- TOC entry 189 (class 1259 OID 27984005)
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
-- TOC entry 186 (class 1259 OID 27983949)
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
-- TOC entry 178 (class 1259 OID 27983884)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 27983903)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 27984293)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 27984327)
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
-- TOC entry 233 (class 1259 OID 27984464)
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
-- TOC entry 188 (class 1259 OID 27983985)
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
-- TOC entry 191 (class 1259 OID 27984030)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 27984691)
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
-- TOC entry 213 (class 1259 OID 27984267)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 27984015)
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
-- TOC entry 202 (class 1259 OID 27984159)
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
-- TOC entry 198 (class 1259 OID 27984119)
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
-- TOC entry 199 (class 1259 OID 27984131)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 27984279)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 27984705)
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
-- TOC entry 242 (class 1259 OID 27984715)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 27984614)
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
-- TOC entry 243 (class 1259 OID 27984723)
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
-- TOC entry 219 (class 1259 OID 27984308)
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
-- TOC entry 211 (class 1259 OID 27984252)
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
-- TOC entry 210 (class 1259 OID 27984242)
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
-- TOC entry 232 (class 1259 OID 27984453)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 27984383)
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
-- TOC entry 196 (class 1259 OID 27984093)
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
-- TOC entry 175 (class 1259 OID 27983855)
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
-- TOC entry 174 (class 1259 OID 27983853)
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
-- TOC entry 220 (class 1259 OID 27984321)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 27983893)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 27983877)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 27984335)
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
-- TOC entry 214 (class 1259 OID 27984273)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 27984219)
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
-- TOC entry 173 (class 1259 OID 27983842)
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
-- TOC entry 172 (class 1259 OID 27983834)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 27983829)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 27984400)
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
-- TOC entry 187 (class 1259 OID 27983977)
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
-- TOC entry 209 (class 1259 OID 27984229)
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
-- TOC entry 231 (class 1259 OID 27984441)
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
-- TOC entry 184 (class 1259 OID 27983928)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 27984734)
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
-- TOC entry 207 (class 1259 OID 27984209)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 27984050)
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
-- TOC entry 176 (class 1259 OID 27983864)
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
-- TOC entry 235 (class 1259 OID 27984491)
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
-- TOC entry 201 (class 1259 OID 27984149)
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
-- TOC entry 218 (class 1259 OID 27984300)
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
-- TOC entry 229 (class 1259 OID 27984414)
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
-- TOC entry 247 (class 1259 OID 27984784)
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
-- TOC entry 246 (class 1259 OID 27984753)
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
-- TOC entry 248 (class 1259 OID 27984796)
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
-- TOC entry 225 (class 1259 OID 27984372)
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
-- TOC entry 204 (class 1259 OID 27984193)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 27984481)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 27984362)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 27983915)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 27983858)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 27983919)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564c-388f-d75d-ea3bf8750061	10	30	Otroci	Abonma za otroke	200
000a0000-564c-388f-4da1-24011a0ab494	20	60	Mladina	Abonma za mladino	400
000a0000-564c-388f-a2d3-5caa5f3f2475	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 27984533)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564c-388f-34e8-6cff764448a2	000d0000-564c-388f-f5ca-89d665a651e4	\N	00090000-564c-388f-7980-c2ec525f6b91	000b0000-564c-388f-36a8-90c9a4983ed0	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564c-388f-e32e-c2e2bf654be4	000d0000-564c-388f-85b4-c3fd58092a92	00100000-564c-388f-ceb5-4fd136cd9079	00090000-564c-388f-8c60-0d0807a238f1	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564c-388f-44f4-a3c40c383760	000d0000-564c-388f-6e2a-95878494e6dc	00100000-564c-388f-8082-2cc00c3a4076	00090000-564c-388f-34b2-49d53a953576	\N	0003	t	\N	2015-11-18	\N	2	t	\N	f	f
000c0000-564c-388f-7c5b-3e7cf06124e8	000d0000-564c-388f-9d9a-b11ef6e5f991	\N	00090000-564c-388f-0bac-3d929fb187c1	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564c-388f-6c8e-4a5c7ca8c34e	000d0000-564c-388f-3a59-2dabf72f64e8	\N	00090000-564c-388f-b044-9bb25641bfa0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564c-388f-2f33-8eeb2bde15a7	000d0000-564c-388f-f60d-02c3986ac462	\N	00090000-564c-388f-7078-dfc0a44bbbd6	000b0000-564c-388f-cd82-8d02c6b6cb18	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564c-388f-648a-dc67899ef5a9	000d0000-564c-388f-52b2-c1b8d9f1e6f7	00100000-564c-388f-bb38-2491cf07d8b6	00090000-564c-388f-1587-879a62a762d6	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564c-388f-0e43-729387a0656e	000d0000-564c-388f-aab7-0bb330ae5567	\N	00090000-564c-388f-6f51-34a1b5a1660c	000b0000-564c-388f-c0fc-1fcf9919acd4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564c-388f-3595-309c9b52d14c	000d0000-564c-388f-52b2-c1b8d9f1e6f7	00100000-564c-388f-6c4c-efa45a02a164	00090000-564c-388f-1627-deeb89c6f393	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564c-388f-6088-c52a6bd6f2bf	000d0000-564c-388f-52b2-c1b8d9f1e6f7	00100000-564c-388f-ddc6-08a82edb640d	00090000-564c-388f-deeb-a6c880916268	\N	0010	t	\N	2015-11-18	\N	16	f	\N	f	t
000c0000-564c-388f-2fa7-417154866983	000d0000-564c-388f-52b2-c1b8d9f1e6f7	00100000-564c-388f-b5f8-df9e9b22aa09	00090000-564c-388f-22fc-eb43cf9c5531	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564c-388f-00ba-05aa5aa18a34	000d0000-564c-388f-2245-bb954617c9b1	00100000-564c-388f-ceb5-4fd136cd9079	00090000-564c-388f-8c60-0d0807a238f1	000b0000-564c-388f-8e44-c20ab73dc6f3	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 27984516)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 27983912)
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
-- TOC entry 3149 (class 0 OID 27984393)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564c-388f-2c45-f193a049421a	00160000-564c-388e-196e-be5f52877092	00090000-564c-388f-3ed8-7438fd8da34f	aizv	10	t
003d0000-564c-388f-ccfe-595bd94e6f2c	00160000-564c-388e-196e-be5f52877092	00090000-564c-388f-872a-e11f784c2de0	apri	14	t
003d0000-564c-388f-58bc-9e4a31b41771	00160000-564c-388e-f255-3c184decc692	00090000-564c-388f-b82c-ff1b4a7aa42a	aizv	11	t
003d0000-564c-388f-8fe1-202be51b854e	00160000-564c-388e-515c-a84e56047a80	00090000-564c-388f-cc3b-6df10ae7f9b2	aizv	12	t
003d0000-564c-388f-e4f4-0de60c7f56a8	00160000-564c-388e-196e-be5f52877092	00090000-564c-388f-f604-008aa7a8a081	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 27984423)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564c-388e-196e-be5f52877092	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564c-388e-f255-3c184decc692	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564c-388e-515c-a84e56047a80	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 27984824)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 27984167)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564c-388f-4de6-9cfcf1bfb432	\N	\N	00200000-564c-388f-c27b-0a0bc87bc83d	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564c-388f-cbdc-b18c56787574	\N	\N	00200000-564c-388f-9da2-ae3fa678d7e2	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564c-388f-ba16-9525862edf7f	\N	\N	00200000-564c-388f-a89b-c4072bf34b8f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564c-388f-7949-4a5126b401f5	\N	\N	00200000-564c-388f-881d-cc9c20d832db	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564c-388f-54fd-3c8484a93321	\N	\N	00200000-564c-388f-22f3-4c738e0b9312	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 27984199)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 27984204)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 27984746)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 27984064)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564c-388d-6c18-b829dc1f2d4e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564c-388d-1d73-767ef31e44e1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564c-388d-0777-65deae8e9a1e	AL	ALB	008	Albania 	Albanija	\N
00040000-564c-388d-9a06-67c56dddeeca	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564c-388d-0252-edc508888f7c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564c-388d-1fd5-dd2ba2a8677c	AD	AND	020	Andorra 	Andora	\N
00040000-564c-388d-6eb1-4d38aebf3383	AO	AGO	024	Angola 	Angola	\N
00040000-564c-388d-10ee-a70bbdffa63e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564c-388d-53d7-d4622a839381	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564c-388d-d8a5-081cbaca59a8	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564c-388d-89d8-1206da109728	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564c-388d-abd1-2bcaa440533f	AM	ARM	051	Armenia 	Armenija	\N
00040000-564c-388d-2682-c214353f7bb3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564c-388d-0d3a-5f1bd3784447	AU	AUS	036	Australia 	Avstralija	\N
00040000-564c-388d-a323-7f8df5e7862f	AT	AUT	040	Austria 	Avstrija	\N
00040000-564c-388d-7803-f4437800dc39	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564c-388d-a17b-a3cd0b96ef87	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564c-388d-284c-2f69ea9ba523	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564c-388d-3ba8-66b697db0539	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564c-388d-d19f-16a4df631fe3	BB	BRB	052	Barbados 	Barbados	\N
00040000-564c-388d-6f4b-2d3aa2de5b82	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564c-388d-ddd6-e37955f28841	BE	BEL	056	Belgium 	Belgija	\N
00040000-564c-388d-6e73-c08bb66c8aed	BZ	BLZ	084	Belize 	Belize	\N
00040000-564c-388d-cebe-24e627466d27	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564c-388d-26af-d75a4f898657	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564c-388d-43bc-a4573235c8ec	BT	BTN	064	Bhutan 	Butan	\N
00040000-564c-388d-d057-966e488c231c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564c-388d-7b12-7429d9f2a494	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564c-388d-248e-6f4593e91644	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564c-388d-73c3-846f79e7fdb6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564c-388d-08e5-a146786f461a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564c-388d-383a-1df7a59a37cd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564c-388d-c879-d83efd51a832	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564c-388d-cd31-37e9e95293e8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564c-388d-6e4b-919179df2355	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564c-388d-90a4-509bb6e34338	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564c-388d-3b2a-1d0a9bb993bd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564c-388d-9ab6-f078028be8b6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564c-388d-9390-987a4cfb73c4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564c-388d-ca0e-fb054d145ebc	CA	CAN	124	Canada 	Kanada	\N
00040000-564c-388d-f5a9-56656d224a25	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564c-388d-c7fa-9a17a2d295d0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564c-388d-a4b6-cacd9a7b29da	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564c-388d-e242-2a132d3f3fc2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564c-388d-3b4b-fadab51d730c	CL	CHL	152	Chile 	Čile	\N
00040000-564c-388d-8026-158b9e43e38f	CN	CHN	156	China 	Kitajska	\N
00040000-564c-388d-8b7e-9dc06f2aea16	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564c-388d-9809-354268c62bc4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564c-388d-c74b-15bd85a79b1f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564c-388d-c8f4-188447176d48	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564c-388d-f2a3-073951dac308	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564c-388d-c133-ccdd62a51ac6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564c-388d-6786-e6c51b70f77a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564c-388d-5480-85996cbde3a9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564c-388d-a5af-f75edbea2f86	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564c-388d-5411-96f3c96ccba6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564c-388d-9e6e-e4969903dfee	CU	CUB	192	Cuba 	Kuba	\N
00040000-564c-388d-c3cc-f20ccb41fa66	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564c-388d-95a9-4d8d1c4290d0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564c-388d-82aa-371b8cf5bacd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564c-388d-e039-f1ec5fa69f6f	DK	DNK	208	Denmark 	Danska	\N
00040000-564c-388d-b38d-8f85de8dc835	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564c-388d-5608-3efaebe186cb	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564c-388d-94f2-e9b865b1a228	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564c-388d-55cf-b87951e15c0b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564c-388d-c07c-5263a92caddf	EG	EGY	818	Egypt 	Egipt	\N
00040000-564c-388d-95a0-df904b5d3247	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564c-388d-0abd-90f4683c7e27	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564c-388d-351a-1062a698fa04	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564c-388d-cfe6-42c2a0209994	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564c-388d-c091-8ab04b54262d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564c-388d-3a63-efee32465395	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564c-388d-8b3e-df27d9563b49	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564c-388d-8ab5-1303cbb20e5d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564c-388d-72c4-c74969d4af4a	FI	FIN	246	Finland 	Finska	\N
00040000-564c-388d-baa8-58c954c0bae5	FR	FRA	250	France 	Francija	\N
00040000-564c-388d-f691-75833cd97838	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564c-388d-e685-8a14e77c5702	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564c-388d-d06a-a567827c82db	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564c-388d-b201-355d76913f46	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564c-388d-c02f-ffcf3edcc4fb	GA	GAB	266	Gabon 	Gabon	\N
00040000-564c-388d-9a9e-ddac732dffa4	GM	GMB	270	Gambia 	Gambija	\N
00040000-564c-388d-c4cc-661544911d87	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564c-388d-181a-4ee1cd9c4a82	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564c-388d-cb35-9b6610737126	GH	GHA	288	Ghana 	Gana	\N
00040000-564c-388d-10a6-a496a043ad2d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564c-388d-5330-e9814eeeca52	GR	GRC	300	Greece 	Grčija	\N
00040000-564c-388d-8191-c0292f1828e8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564c-388d-843b-eb9ae0355868	GD	GRD	308	Grenada 	Grenada	\N
00040000-564c-388d-de18-ba70c55cdb0a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564c-388d-150d-460a4cd36eac	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564c-388d-50be-e805dcb024ba	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564c-388d-8745-3ef396e2dbf2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564c-388d-d7d5-cef6e5c038ec	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564c-388d-7316-7cdd7a7b5b88	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564c-388d-5194-436cc4189264	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564c-388d-bfe2-3e13ed67b825	HT	HTI	332	Haiti 	Haiti	\N
00040000-564c-388d-1a8d-b5853e44bbfe	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564c-388d-0009-f3ad21e4fc31	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564c-388d-ee1b-80064638edea	HN	HND	340	Honduras 	Honduras	\N
00040000-564c-388d-5f8b-b3d2cf7948b4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564c-388d-3522-007095f7bb87	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564c-388d-c5e7-e70515684730	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564c-388d-aae2-73ff8bea22e6	IN	IND	356	India 	Indija	\N
00040000-564c-388d-3240-f7e4a12abd80	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564c-388d-33fc-bcd20f6df39a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564c-388d-1fc7-7196fa41590e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564c-388d-9495-47ab3a9fe7cd	IE	IRL	372	Ireland 	Irska	\N
00040000-564c-388d-eee6-7d067745923e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564c-388d-1951-584e98746c26	IL	ISR	376	Israel 	Izrael	\N
00040000-564c-388d-d72c-f8b99d199499	IT	ITA	380	Italy 	Italija	\N
00040000-564c-388d-3a42-24c844a491de	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564c-388d-3b57-59753366432f	JP	JPN	392	Japan 	Japonska	\N
00040000-564c-388d-3fc1-77855d45db6f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564c-388d-84c7-0f3e8b7d21c3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564c-388d-10a1-87c37696877f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564c-388d-e8c8-8f7b5952ed4b	KE	KEN	404	Kenya 	Kenija	\N
00040000-564c-388d-10d3-d106de39ef29	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564c-388d-1a75-68517ee5d66c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564c-388d-d0ca-c0a8f86e35ae	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564c-388d-718e-9f6c7375e9cc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564c-388d-4e3b-9034a1e810ec	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564c-388d-6c12-10f2e3622bfd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564c-388d-1332-d4680dccb7d6	LV	LVA	428	Latvia 	Latvija	\N
00040000-564c-388d-bb6d-c9fefbaf2d95	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564c-388d-e3c7-7988f2c2c08f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564c-388d-212e-e3022febd7f7	LR	LBR	430	Liberia 	Liberija	\N
00040000-564c-388d-3379-a38a97934f01	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564c-388d-2851-aa77e4936bba	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564c-388d-8ccd-ad1bb77b7613	LT	LTU	440	Lithuania 	Litva	\N
00040000-564c-388d-8797-26da2e2865b8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564c-388d-e9e5-6ffd8f9fa125	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564c-388d-736f-ed7f75a26845	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564c-388d-5710-f48cfbabc16a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564c-388d-b641-fc8741c3856c	MW	MWI	454	Malawi 	Malavi	\N
00040000-564c-388d-8645-c80e7ca686bb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564c-388d-8ef3-177ea6580735	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564c-388d-366e-501db752ce39	ML	MLI	466	Mali 	Mali	\N
00040000-564c-388d-b5c6-382be8c32dae	MT	MLT	470	Malta 	Malta	\N
00040000-564c-388d-2edc-c52d05359f5b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564c-388d-4132-381100992318	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564c-388d-fc82-2ee676ff1c41	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564c-388d-8963-b19a70fbcfa0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564c-388d-aca6-d9373e94f0a1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564c-388d-77a0-50d9dcbd4e6d	MX	MEX	484	Mexico 	Mehika	\N
00040000-564c-388d-e18a-4b0908d2d8cb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564c-388d-335e-550793b5d8bc	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564c-388d-54c0-9b293b073456	MC	MCO	492	Monaco 	Monako	\N
00040000-564c-388d-ef77-eebda51ae318	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564c-388d-2606-a7cb1408a89e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564c-388d-0f17-283871be6af5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564c-388d-38a4-3ba051e45eab	MA	MAR	504	Morocco 	Maroko	\N
00040000-564c-388d-9f55-dbf85fe33064	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564c-388d-af33-cf12645fdae8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564c-388d-c862-78b05119db57	NA	NAM	516	Namibia 	Namibija	\N
00040000-564c-388d-0b06-ceb51e639b44	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564c-388d-6ba0-2bed6849452f	NP	NPL	524	Nepal 	Nepal	\N
00040000-564c-388d-b095-c34262c497a3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564c-388d-8571-8905eec4172d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564c-388d-058e-bdbf0dcb074d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564c-388d-3030-af9b2d082e04	NE	NER	562	Niger 	Niger 	\N
00040000-564c-388d-0e25-43594d8d0c03	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564c-388d-631a-4584d2e97a11	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564c-388d-a1ba-f500ea449ec5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564c-388d-c521-5e7380b550bc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564c-388d-8f63-cb25aa0ba827	NO	NOR	578	Norway 	Norveška	\N
00040000-564c-388d-b909-18337dce6855	OM	OMN	512	Oman 	Oman	\N
00040000-564c-388d-85cf-3fc3c0994f01	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564c-388d-ec45-d66d0146dc9b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564c-388d-d2a4-52d10919ccd0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564c-388d-deb3-e2dbb8745b89	PA	PAN	591	Panama 	Panama	\N
00040000-564c-388d-ef02-ba1e3cec40d8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564c-388d-72ca-facb330fe232	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564c-388d-d183-891000d75a8d	PE	PER	604	Peru 	Peru	\N
00040000-564c-388d-3cfc-dac9acca81ba	PH	PHL	608	Philippines 	Filipini	\N
00040000-564c-388d-f990-a435b7418084	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564c-388d-677b-1a619f99b632	PL	POL	616	Poland 	Poljska	\N
00040000-564c-388d-f542-65984022bb45	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564c-388d-5e91-cc8178092f60	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564c-388d-f4f9-0d362877fa94	QA	QAT	634	Qatar 	Katar	\N
00040000-564c-388d-d056-5c81a500c974	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564c-388d-f37b-3ca409749198	RO	ROU	642	Romania 	Romunija	\N
00040000-564c-388d-7291-48cc7dd12ee2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564c-388d-a195-75d7d5ddad4a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564c-388d-ad9d-00ba332314c9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564c-388d-30f7-248be12c08ec	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564c-388d-26b4-5ed07d10e52c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564c-388d-6036-0939ad06c8ab	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564c-388d-6b64-17e8573e1182	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564c-388d-07fe-aa0d382d5b51	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564c-388d-aa2f-cceb30f565e9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564c-388d-e70b-40e065c04953	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564c-388d-2aa3-8aa9d7a1cc80	SM	SMR	674	San Marino 	San Marino	\N
00040000-564c-388d-9402-451df24a90ba	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564c-388d-af61-06f1a0760bad	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564c-388d-81b6-7f4072ab2689	SN	SEN	686	Senegal 	Senegal	\N
00040000-564c-388d-6a50-3be1a02c06e3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564c-388d-f79f-bfa718b98653	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564c-388d-37f9-056449c4793b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564c-388d-b775-7d926032f225	SG	SGP	702	Singapore 	Singapur	\N
00040000-564c-388d-3e78-79ff84e6e715	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564c-388d-37fc-3852d48aa159	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564c-388d-04de-2bb87a7a7a43	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564c-388d-37d2-4d594b069dcb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564c-388d-efa8-7df09a1bacab	SO	SOM	706	Somalia 	Somalija	\N
00040000-564c-388d-40fd-5bb4aa63b4ad	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564c-388d-b311-7eeb58e0f840	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564c-388d-543b-5fc35c48229b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564c-388d-2314-5da682951d48	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564c-388d-fa7a-2ad6e2b014a0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564c-388d-dd5c-2efd4b1b3fe9	SD	SDN	729	Sudan 	Sudan	\N
00040000-564c-388d-dba6-62e740d2817e	SR	SUR	740	Suriname 	Surinam	\N
00040000-564c-388d-3835-b758ece41e47	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564c-388d-dca8-267e626130f5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564c-388d-820d-9202b9271c73	SE	SWE	752	Sweden 	Švedska	\N
00040000-564c-388d-536a-86bc0aa84a27	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564c-388d-bdf7-15344863c6cd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564c-388d-b074-fd88ad6df73c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564c-388d-6452-d0f19da2c760	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564c-388d-6585-e604959b30de	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564c-388d-e734-ff3b10ce486d	TH	THA	764	Thailand 	Tajska	\N
00040000-564c-388d-cf36-0ca856cb7598	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564c-388d-6d48-9aaeee42943b	TG	TGO	768	Togo 	Togo	\N
00040000-564c-388d-c5d5-1f4b0a58547f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564c-388d-da5c-253e6c4063f3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564c-388d-5fd0-468ff47bcbc5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564c-388d-0282-6239e82516c0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564c-388d-ea13-d830ac3f00b0	TR	TUR	792	Turkey 	Turčija	\N
00040000-564c-388d-8812-f67d2d0de6e5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564c-388d-e2d3-6c310b6aba3d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564c-388d-0dba-c63c758ee9a2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564c-388d-7304-80f18f3e0136	UG	UGA	800	Uganda 	Uganda	\N
00040000-564c-388d-54cb-82184cdbb665	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564c-388d-e788-27dc48c5cc25	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564c-388d-fc30-3c5f836be5be	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564c-388d-9a4e-49daf2b350ee	US	USA	840	United States 	Združene države Amerike	\N
00040000-564c-388d-afd6-44c8407bd2ff	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564c-388d-d3fa-f97d27a89b73	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564c-388d-6f5a-1d10de08e9f2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564c-388d-d7b2-c5f05f6bc379	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564c-388d-e934-4b155ecc0d43	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564c-388d-40b0-d8e50ae4f87f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564c-388d-8668-36d0d0cf68e8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564c-388d-f571-4cfeacd14371	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564c-388d-207a-c93df1b6c7e7	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564c-388d-f585-b63f1b663261	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564c-388d-be6a-2dbef1516f79	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564c-388d-8a3b-94b47e6fe994	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564c-388d-1bc0-6ee6a0febb0d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 27984546)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564c-388f-5574-d1abeb264fa2	000e0000-564c-388f-405e-0d41512f7496	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-388c-b432-1999f8bb85ac	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564c-388f-4ad1-611e9985f436	000e0000-564c-388f-509c-25f8b5470ba2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-388c-696d-763a11e336a3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564c-388f-9599-78ea25de8c3c	000e0000-564c-388f-c071-a3ab95b9eafb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-388c-b432-1999f8bb85ac	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564c-388f-29f7-62ab97e62dc1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564c-388f-a1c9-d79cdffe9eda	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 27984347)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564c-388f-52b2-c1b8d9f1e6f7	000e0000-564c-388f-509c-25f8b5470ba2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564c-388c-2930-53beb0767a92
000d0000-564c-388f-f5ca-89d665a651e4	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-34e8-6cff764448a2	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564c-388c-2930-53beb0767a92
000d0000-564c-388f-85b4-c3fd58092a92	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-e32e-c2e2bf654be4	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564c-388c-ea74-5ba6b08cda28
000d0000-564c-388f-6e2a-95878494e6dc	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-44f4-a3c40c383760	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564c-388c-ee58-c085fb9adcd1
000d0000-564c-388f-9d9a-b11ef6e5f991	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-7c5b-3e7cf06124e8	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564c-388c-2e88-e479bff4c7d2
000d0000-564c-388f-3a59-2dabf72f64e8	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-6c8e-4a5c7ca8c34e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564c-388c-2e88-e479bff4c7d2
000d0000-564c-388f-f60d-02c3986ac462	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-2f33-8eeb2bde15a7	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564c-388c-2930-53beb0767a92
000d0000-564c-388f-aab7-0bb330ae5567	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-0e43-729387a0656e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564c-388c-294d-863d40233a7a
000d0000-564c-388f-2245-bb954617c9b1	000e0000-564c-388f-509c-25f8b5470ba2	000c0000-564c-388f-00ba-05aa5aa18a34	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564c-388c-6030-cf0c59c4bdbb
\.


--
-- TOC entry 3122 (class 0 OID 27984138)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 27984104)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 27984081)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564c-388f-e984-90f11ed8964a	00080000-564c-388f-cb73-43a58838cf10	00090000-564c-388f-deeb-a6c880916268	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 27984261)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 27984804)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564c-388f-aa6e-0eb340b64d17	00010000-564c-388d-0756-5752bee6212a	\N	Prva mapa	Root mapa	2015-11-18 09:36:31	2015-11-18 09:36:31	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 27984817)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 27984839)
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
-- TOC entry 3138 (class 0 OID 27984286)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 27984038)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564c-388d-2790-d70e20899cc1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564c-388d-21e0-584a85ee22c0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564c-388d-89fc-aa59e4b01677	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564c-388d-cabf-9dcc617f2a03	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564c-388d-0857-f98c02aca87a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564c-388d-4b32-28e1c961fbc8	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564c-388d-30eb-9a07638f1c5e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564c-388d-e0a7-b673ac857acc	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564c-388d-02ec-0d0274ad9056	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564c-388d-37da-2a5fe1675637	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564c-388d-a505-29aaf49d0074	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564c-388d-9914-d75d99ee6ef2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564c-388d-9216-ef38e6ef1b58	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564c-388d-75c2-2bfbe18f7c6c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564c-388f-fa88-8e6046f7f550	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564c-388f-544e-b9792365b334	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564c-388f-9603-40ae09cb4750	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564c-388f-d64e-6aaf1a0cbb8f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564c-388f-826f-0dfcb0dde2e2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564c-3891-a934-dc44afc7d7ec	application.tenant.maticnopodjetje	string	s:36:"00080000-564c-3891-7e7d-0d79a72311b6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 27983938)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564c-388f-3360-81dd770f67f6	00000000-564c-388f-fa88-8e6046f7f550	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564c-388f-8436-d6e52fc7bacf	00000000-564c-388f-fa88-8e6046f7f550	00010000-564c-388d-0756-5752bee6212a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564c-388f-bb30-c9bffea13ae9	00000000-564c-388f-544e-b9792365b334	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 27984005)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564c-388f-8407-3463788818bf	\N	00100000-564c-388f-ceb5-4fd136cd9079	00100000-564c-388f-8082-2cc00c3a4076	01	Gledališče Nimbis
00410000-564c-388f-b882-7755a534d371	00410000-564c-388f-8407-3463788818bf	00100000-564c-388f-ceb5-4fd136cd9079	00100000-564c-388f-8082-2cc00c3a4076	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 27983949)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564c-388f-7980-c2ec525f6b91	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564c-388f-0bac-3d929fb187c1	00010000-564c-388f-f743-08ab34b5dcef	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564c-388f-34b2-49d53a953576	00010000-564c-388f-6206-c2efd30311e9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564c-388f-1627-deeb89c6f393	00010000-564c-388f-f9c2-09edfec1cd50	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564c-388f-b2c8-4de37048704c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564c-388f-7078-dfc0a44bbbd6	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564c-388f-22fc-eb43cf9c5531	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564c-388f-1587-879a62a762d6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564c-388f-deeb-a6c880916268	00010000-564c-388f-d761-16daa3023d30	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564c-388f-8c60-0d0807a238f1	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564c-388f-6105-69dd52daae34	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564c-388f-b044-9bb25641bfa0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564c-388f-6f51-34a1b5a1660c	00010000-564c-388f-2134-cbcf6a4576f4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564c-388f-3ed8-7438fd8da34f	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-388f-872a-e11f784c2de0	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-388f-b82c-ff1b4a7aa42a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-388f-cc3b-6df10ae7f9b2	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564c-388f-f604-008aa7a8a081	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564c-388f-bd74-311a281a9e6c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-388f-813e-dcd12bc02f93	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-388f-394d-95bd9bf9a90e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 27983884)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564c-388d-d8a4-4505217eb5dc	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564c-388d-cd05-9f7332fc7ff2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564c-388d-8d0d-c10955fdf18f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564c-388d-d452-7226f2494bb9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564c-388d-0625-3245178ff3aa	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564c-388d-aa10-7c20af9b2948	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564c-388d-2473-af53e857f60f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564c-388d-6656-b53760f782d1	Abonma-read	Abonma - branje	t
00030000-564c-388d-27b9-96763895ef81	Abonma-write	Abonma - spreminjanje	t
00030000-564c-388d-8877-633693f35d72	Alternacija-read	Alternacija - branje	t
00030000-564c-388d-b24e-d3f3f152a732	Alternacija-write	Alternacija - spreminjanje	t
00030000-564c-388d-0651-580b8a9ceb5d	Arhivalija-read	Arhivalija - branje	t
00030000-564c-388d-9cea-1223bc2b9177	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564c-388d-352e-dfd4735bd859	AuthStorage-read	AuthStorage - branje	t
00030000-564c-388d-f5c5-9cfbdf0cc396	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564c-388d-ef55-42906e8cd0ea	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564c-388d-6c07-a5256bd74877	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564c-388d-8102-755e5e466938	Besedilo-read	Besedilo - branje	t
00030000-564c-388d-001e-07c48caf11cd	Besedilo-write	Besedilo - spreminjanje	t
00030000-564c-388d-7fde-9e5078e1268a	Dogodek-read	Dogodek - branje	t
00030000-564c-388d-36ad-5a60d0c10f94	Dogodek-write	Dogodek - spreminjanje	t
00030000-564c-388d-9e5a-8e2d0d81c8bb	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564c-388d-bc86-fe7185e3b928	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564c-388d-3e29-6ea8d95deac8	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564c-388d-8a65-fb0bf70c6e2e	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564c-388d-0dd5-bbfb00ae3c17	DogodekTrait-read	DogodekTrait - branje	t
00030000-564c-388d-af7d-6a7f505d21ca	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564c-388d-2d59-e74cb8d1a5c3	DrugiVir-read	DrugiVir - branje	t
00030000-564c-388d-4eb3-5cb6e8ba1672	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564c-388d-7a7c-9f353cd5a416	Drzava-read	Drzava - branje	t
00030000-564c-388d-7d5c-0922c6975157	Drzava-write	Drzava - spreminjanje	t
00030000-564c-388d-5f82-1d62531c8152	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564c-388d-ec09-683ef7230ea6	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564c-388d-6619-41cd4c4ba248	Funkcija-read	Funkcija - branje	t
00030000-564c-388d-e54d-b7f5029fae92	Funkcija-write	Funkcija - spreminjanje	t
00030000-564c-388d-1bec-7bf62caa8bfe	Gostovanje-read	Gostovanje - branje	t
00030000-564c-388d-8940-16407b8cf6c4	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564c-388d-bed7-6648ac1406c2	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564c-388d-563a-2c69d372861a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564c-388d-d7d2-9931a24796b2	Kupec-read	Kupec - branje	t
00030000-564c-388d-c9ca-6e838ae71d67	Kupec-write	Kupec - spreminjanje	t
00030000-564c-388d-f65d-87eddae01328	NacinPlacina-read	NacinPlacina - branje	t
00030000-564c-388d-588b-2f1504241c24	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564c-388d-f479-f20211c516dc	Option-read	Option - branje	t
00030000-564c-388d-e581-98b90e5f1ef5	Option-write	Option - spreminjanje	t
00030000-564c-388d-6bb6-66021a709eef	OptionValue-read	OptionValue - branje	t
00030000-564c-388d-1e4a-6bd11305d810	OptionValue-write	OptionValue - spreminjanje	t
00030000-564c-388d-9591-3b0cd95ef085	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564c-388d-df94-d9be16968e78	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564c-388d-c465-4cbfb6c85640	Oseba-read	Oseba - branje	t
00030000-564c-388d-2c8d-9c1d4e4a7f2e	Oseba-write	Oseba - spreminjanje	t
00030000-564c-388d-8dc9-9b470097b313	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564c-388d-1bb5-0c924abbf96d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564c-388d-5ce0-b97061bbcf5d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564c-388d-5caa-c93be48c1bef	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564c-388d-6cf0-ebca06eafbad	Pogodba-read	Pogodba - branje	t
00030000-564c-388d-3353-ec7dc36f5250	Pogodba-write	Pogodba - spreminjanje	t
00030000-564c-388d-6cf4-fc2e311b1b81	Popa-read	Popa - branje	t
00030000-564c-388d-cd5d-e0ac51ec0791	Popa-write	Popa - spreminjanje	t
00030000-564c-388d-15b7-6b3ec6b3b132	Posta-read	Posta - branje	t
00030000-564c-388d-b790-791963d2a1c4	Posta-write	Posta - spreminjanje	t
00030000-564c-388d-eff2-96d8a7f942e3	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564c-388d-ac92-b08431258ca0	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564c-388d-f4c1-480287b1702a	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564c-388d-04ba-ab4f131911f2	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564c-388d-8534-7a227d202497	PostniNaslov-read	PostniNaslov - branje	t
00030000-564c-388d-bb8d-ae539b6631a6	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564c-388d-117a-26e9fe05c11c	Praznik-read	Praznik - branje	t
00030000-564c-388d-b568-7b788da9182e	Praznik-write	Praznik - spreminjanje	t
00030000-564c-388d-c474-0d86dbb6879f	Predstava-read	Predstava - branje	t
00030000-564c-388d-ba02-c09c952cca99	Predstava-write	Predstava - spreminjanje	t
00030000-564c-388d-d64c-c36735129bf0	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564c-388d-217a-eaf7c090da6c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564c-388d-d721-a3195719a072	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564c-388d-fae6-805c5dc4ed6f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564c-388d-c133-23dc1a58279e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564c-388d-be63-2064206d50d8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564c-388d-1ef4-ce7f0a6fedd3	ProgramDela-read	ProgramDela - branje	t
00030000-564c-388d-ddc5-485586c7be65	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564c-388d-71a3-93633e316db1	ProgramFestival-read	ProgramFestival - branje	t
00030000-564c-388d-615f-3605fee0514a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564c-388d-314c-71f2ed7719d4	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564c-388d-48bc-ff453d2fcca8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564c-388d-07bf-24e0975f48b1	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564c-388d-7222-c03f515bb651	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564c-388d-b7cb-33b7ad567c53	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564c-388d-ede4-75408950428f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564c-388d-a02c-c5643eea25f2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564c-388d-31c4-6456c73460ec	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564c-388d-1720-94c4c94bbdc2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564c-388d-aba7-9d52cba049cc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564c-388d-2b5a-0d65ef9ad634	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564c-388d-2680-20fda4de7c1d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564c-388d-cc6e-ec8c365627e6	ProgramRazno-read	ProgramRazno - branje	t
00030000-564c-388d-320e-ebcbd0d52232	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564c-388d-ed37-e22a23a8055a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564c-388d-c731-41c8c0b3890a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564c-388d-acd7-793e7cd35c57	Prostor-read	Prostor - branje	t
00030000-564c-388d-c6ad-ba6114ff48e0	Prostor-write	Prostor - spreminjanje	t
00030000-564c-388d-d9f4-6ed0fd131193	Racun-read	Racun - branje	t
00030000-564c-388d-3884-7a37b26dce70	Racun-write	Racun - spreminjanje	t
00030000-564c-388d-f0cd-fa2fa0c7cdf6	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564c-388d-c5d0-239e78634a3c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564c-388d-de57-41e86cb9f027	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564c-388d-cf25-3b6dd3db1ba8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564c-388d-5368-df89939e5535	Rekvizit-read	Rekvizit - branje	t
00030000-564c-388d-2002-943c8f15324d	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564c-388d-62ab-cc195101faf9	Revizija-read	Revizija - branje	t
00030000-564c-388d-1c6f-7d81e73edea3	Revizija-write	Revizija - spreminjanje	t
00030000-564c-388d-8ee2-2e70450fd3b2	Rezervacija-read	Rezervacija - branje	t
00030000-564c-388d-615f-2f7b6b786a09	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564c-388d-c0dc-606d9ef825fd	SedezniRed-read	SedezniRed - branje	t
00030000-564c-388d-81ff-11c0cc297b1b	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564c-388d-3f1f-4ab0dd3e2a81	Sedez-read	Sedez - branje	t
00030000-564c-388d-978a-35f5cde44ace	Sedez-write	Sedez - spreminjanje	t
00030000-564c-388d-16ee-1c7de32f4f95	Sezona-read	Sezona - branje	t
00030000-564c-388d-eff1-5774cc19d4a3	Sezona-write	Sezona - spreminjanje	t
00030000-564c-388d-09f2-e2e68dcdd5a8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564c-388d-3917-35220332775b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564c-388d-b5c6-cb8d65ffcd93	Stevilcenje-read	Stevilcenje - branje	t
00030000-564c-388d-38e8-e59d7bd2d20b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564c-388d-a38b-27c5bdd8b99f	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564c-388d-0027-b9f93127fa3b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564c-388d-74a5-51b40f4adf5d	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564c-388d-09cc-da0d9ba64ec8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564c-388d-86a0-02f91a56f838	Telefonska-read	Telefonska - branje	t
00030000-564c-388d-f129-50dda7eaa596	Telefonska-write	Telefonska - spreminjanje	t
00030000-564c-388d-5334-816bf220b48f	TerminStoritve-read	TerminStoritve - branje	t
00030000-564c-388d-4def-e37ab825cabd	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564c-388d-f2a0-aadfcddc1082	TipFunkcije-read	TipFunkcije - branje	t
00030000-564c-388d-7550-d66500b9cde0	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564c-388d-eddf-0913a96c954e	TipPopa-read	TipPopa - branje	t
00030000-564c-388d-f2ee-9121076fc1d5	TipPopa-write	TipPopa - spreminjanje	t
00030000-564c-388d-37d6-6a1974b8b833	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564c-388d-1353-261ea0a944bf	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564c-388d-05d8-87ecc6267e5d	TipVaje-read	TipVaje - branje	t
00030000-564c-388d-774f-f087100c1344	TipVaje-write	TipVaje - spreminjanje	t
00030000-564c-388d-44d5-cac37438ca6a	Trr-read	Trr - branje	t
00030000-564c-388d-a956-d2ba9b9c9bf1	Trr-write	Trr - spreminjanje	t
00030000-564c-388d-7c60-64f5e71be628	Uprizoritev-read	Uprizoritev - branje	t
00030000-564c-388d-f105-2590ab5a5b4a	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564c-388d-8c30-36c9a4bfd088	Vaja-read	Vaja - branje	t
00030000-564c-388d-4021-22724b9c2587	Vaja-write	Vaja - spreminjanje	t
00030000-564c-388d-08f9-977341c5ff56	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564c-388d-3620-82d3478218d7	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564c-388d-d125-01f9338bebc6	VrstaStroska-read	VrstaStroska - branje	t
00030000-564c-388d-9e21-de53767dd877	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564c-388d-1130-9263bd8101bd	Zaposlitev-read	Zaposlitev - branje	t
00030000-564c-388d-0f7d-6a9285021e07	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564c-388d-85cc-3e5a6ed8b8de	Zasedenost-read	Zasedenost - branje	t
00030000-564c-388d-725b-a330365e0e88	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564c-388d-d16a-9b43f8ca3c89	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564c-388d-19df-20a9a7cd054d	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564c-388d-025f-7126347dbdc6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564c-388d-eef2-1cc064a3bba0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564c-388d-0ecc-d681b8d4b1ca	Job-read	Branje opravil - samo zase - branje	t
00030000-564c-388d-aba5-f1c6ad77e845	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564c-388d-7913-a54728a257c0	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564c-388d-417c-adb63a66f473	Report-read	Report - branje	t
00030000-564c-388d-a3bd-aa4db2cd89f7	Report-write	Report - spreminjanje	t
00030000-564c-388d-3272-5c25e5a9ffa0	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564c-388d-f9c9-1c983dc660ac	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564c-388d-fe4c-c1abd100cd4a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564c-388d-5655-97e47db14c7d	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564c-388d-5320-db1877c26411	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564c-388d-e245-215bb7db1f75	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564c-388d-e979-96727794520a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564c-388d-cdd7-8fd193810789	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564c-388d-a9ce-91169349634e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564c-388d-e317-dc58e9380e28	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564c-388d-6885-5ec97ba39e17	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564c-388d-6553-caa0e888822f	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564c-388d-b047-32a7d080f451	Datoteka-write	Datoteka - spreminjanje	t
00030000-564c-388d-d284-61a2f6a09ba9	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 27983903)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564c-388d-3412-4d02fd60dd33	00030000-564c-388d-cd05-9f7332fc7ff2
00020000-564c-388d-b292-d5b34dfe41be	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-6656-b53760f782d1
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-27b9-96763895ef81
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-8877-633693f35d72
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-b24e-d3f3f152a732
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-0651-580b8a9ceb5d
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-7fde-9e5078e1268a
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-d452-7226f2494bb9
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-36ad-5a60d0c10f94
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-7d5c-0922c6975157
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-6619-41cd4c4ba248
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-e54d-b7f5029fae92
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-1bec-7bf62caa8bfe
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-8940-16407b8cf6c4
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-bed7-6648ac1406c2
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-563a-2c69d372861a
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-f479-f20211c516dc
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-6bb6-66021a709eef
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-c465-4cbfb6c85640
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-2c8d-9c1d4e4a7f2e
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-6cf4-fc2e311b1b81
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-cd5d-e0ac51ec0791
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-15b7-6b3ec6b3b132
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-b790-791963d2a1c4
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-8534-7a227d202497
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-bb8d-ae539b6631a6
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-c474-0d86dbb6879f
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-ba02-c09c952cca99
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-c133-23dc1a58279e
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-be63-2064206d50d8
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-acd7-793e7cd35c57
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-c6ad-ba6114ff48e0
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-de57-41e86cb9f027
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-cf25-3b6dd3db1ba8
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-5368-df89939e5535
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-2002-943c8f15324d
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-16ee-1c7de32f4f95
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-eff1-5774cc19d4a3
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-f2a0-aadfcddc1082
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-7c60-64f5e71be628
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-f105-2590ab5a5b4a
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-8c30-36c9a4bfd088
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-4021-22724b9c2587
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-85cc-3e5a6ed8b8de
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-725b-a330365e0e88
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-d16a-9b43f8ca3c89
00020000-564c-388d-fe4f-ee9be01e8756	00030000-564c-388d-025f-7126347dbdc6
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-6656-b53760f782d1
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-0651-580b8a9ceb5d
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-7fde-9e5078e1268a
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-1bec-7bf62caa8bfe
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-bed7-6648ac1406c2
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-563a-2c69d372861a
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-f479-f20211c516dc
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-6bb6-66021a709eef
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-c465-4cbfb6c85640
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-2c8d-9c1d4e4a7f2e
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-6cf4-fc2e311b1b81
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-15b7-6b3ec6b3b132
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-8534-7a227d202497
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-bb8d-ae539b6631a6
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-c474-0d86dbb6879f
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-acd7-793e7cd35c57
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-de57-41e86cb9f027
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-5368-df89939e5535
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-16ee-1c7de32f4f95
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-86a0-02f91a56f838
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-f129-50dda7eaa596
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-44d5-cac37438ca6a
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-a956-d2ba9b9c9bf1
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-1130-9263bd8101bd
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-0f7d-6a9285021e07
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-d16a-9b43f8ca3c89
00020000-564c-388d-51ce-e9f95874a61f	00030000-564c-388d-025f-7126347dbdc6
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-6656-b53760f782d1
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-8877-633693f35d72
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-0651-580b8a9ceb5d
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-9cea-1223bc2b9177
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-8102-755e5e466938
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-9e5a-8e2d0d81c8bb
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-7fde-9e5078e1268a
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-6619-41cd4c4ba248
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-1bec-7bf62caa8bfe
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-bed7-6648ac1406c2
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-f479-f20211c516dc
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-6bb6-66021a709eef
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-c465-4cbfb6c85640
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-6cf4-fc2e311b1b81
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-15b7-6b3ec6b3b132
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-c474-0d86dbb6879f
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-c133-23dc1a58279e
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-acd7-793e7cd35c57
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-de57-41e86cb9f027
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-5368-df89939e5535
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-16ee-1c7de32f4f95
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-f2a0-aadfcddc1082
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-8c30-36c9a4bfd088
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-85cc-3e5a6ed8b8de
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-d16a-9b43f8ca3c89
00020000-564c-388d-5e82-13de2ae723a2	00030000-564c-388d-025f-7126347dbdc6
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-6656-b53760f782d1
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-27b9-96763895ef81
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-b24e-d3f3f152a732
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-0651-580b8a9ceb5d
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-7fde-9e5078e1268a
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-1bec-7bf62caa8bfe
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-f479-f20211c516dc
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-6bb6-66021a709eef
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-6cf4-fc2e311b1b81
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-15b7-6b3ec6b3b132
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-c474-0d86dbb6879f
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-acd7-793e7cd35c57
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-de57-41e86cb9f027
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-5368-df89939e5535
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-16ee-1c7de32f4f95
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-f2a0-aadfcddc1082
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-d16a-9b43f8ca3c89
00020000-564c-388d-4495-add23777042c	00030000-564c-388d-025f-7126347dbdc6
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-6656-b53760f782d1
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-0651-580b8a9ceb5d
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-7fde-9e5078e1268a
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-1bec-7bf62caa8bfe
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-f479-f20211c516dc
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-6bb6-66021a709eef
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-6cf4-fc2e311b1b81
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-15b7-6b3ec6b3b132
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-c474-0d86dbb6879f
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-acd7-793e7cd35c57
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-de57-41e86cb9f027
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-5368-df89939e5535
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-16ee-1c7de32f4f95
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-5334-816bf220b48f
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-8d0d-c10955fdf18f
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-f2a0-aadfcddc1082
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-d16a-9b43f8ca3c89
00020000-564c-388d-c3fd-39c5c5ebf0af	00030000-564c-388d-025f-7126347dbdc6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d8a4-4505217eb5dc
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-cd05-9f7332fc7ff2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-6656-b53760f782d1
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-27b9-96763895ef81
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8877-633693f35d72
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-b24e-d3f3f152a732
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-0651-580b8a9ceb5d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-9cea-1223bc2b9177
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ef55-42906e8cd0ea
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-6c07-a5256bd74877
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8102-755e5e466938
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-001e-07c48caf11cd
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-9e5a-8e2d0d81c8bb
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-bc86-fe7185e3b928
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-7fde-9e5078e1268a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d452-7226f2494bb9
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-36ad-5a60d0c10f94
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-2d59-e74cb8d1a5c3
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-4eb3-5cb6e8ba1672
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-7a7c-9f353cd5a416
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-7d5c-0922c6975157
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-5f82-1d62531c8152
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ec09-683ef7230ea6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-6619-41cd4c4ba248
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-e54d-b7f5029fae92
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1bec-7bf62caa8bfe
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8940-16407b8cf6c4
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-bed7-6648ac1406c2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-563a-2c69d372861a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d7d2-9931a24796b2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c9ca-6e838ae71d67
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f65d-87eddae01328
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-588b-2f1504241c24
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f479-f20211c516dc
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-6bb6-66021a709eef
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1e4a-6bd11305d810
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-e581-98b90e5f1ef5
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-9591-3b0cd95ef085
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-df94-d9be16968e78
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c465-4cbfb6c85640
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-0625-3245178ff3aa
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-2c8d-9c1d4e4a7f2e
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8dc9-9b470097b313
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1bb5-0c924abbf96d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-5ce0-b97061bbcf5d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-5caa-c93be48c1bef
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-6cf0-ebca06eafbad
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-3353-ec7dc36f5250
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-6cf4-fc2e311b1b81
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-cd5d-e0ac51ec0791
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-15b7-6b3ec6b3b132
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-eff2-96d8a7f942e3
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ac92-b08431258ca0
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f4c1-480287b1702a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-04ba-ab4f131911f2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-b790-791963d2a1c4
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8534-7a227d202497
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-bb8d-ae539b6631a6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-117a-26e9fe05c11c
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-b568-7b788da9182e
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c474-0d86dbb6879f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ba02-c09c952cca99
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d64c-c36735129bf0
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-217a-eaf7c090da6c
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d721-a3195719a072
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-fae6-805c5dc4ed6f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c133-23dc1a58279e
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-be63-2064206d50d8
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-aa10-7c20af9b2948
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1ef4-ce7f0a6fedd3
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-2473-af53e857f60f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ddc5-485586c7be65
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-71a3-93633e316db1
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-615f-3605fee0514a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-314c-71f2ed7719d4
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-48bc-ff453d2fcca8
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-07bf-24e0975f48b1
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-7222-c03f515bb651
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-b7cb-33b7ad567c53
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ede4-75408950428f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-a02c-c5643eea25f2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-31c4-6456c73460ec
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1720-94c4c94bbdc2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-aba7-9d52cba049cc
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-2b5a-0d65ef9ad634
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-2680-20fda4de7c1d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-cc6e-ec8c365627e6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-320e-ebcbd0d52232
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-ed37-e22a23a8055a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c731-41c8c0b3890a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-acd7-793e7cd35c57
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c6ad-ba6114ff48e0
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d9f4-6ed0fd131193
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-3884-7a37b26dce70
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f0cd-fa2fa0c7cdf6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c5d0-239e78634a3c
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-de57-41e86cb9f027
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-cf25-3b6dd3db1ba8
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-5368-df89939e5535
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-2002-943c8f15324d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-62ab-cc195101faf9
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1c6f-7d81e73edea3
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8ee2-2e70450fd3b2
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-615f-2f7b6b786a09
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-c0dc-606d9ef825fd
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-81ff-11c0cc297b1b
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-3f1f-4ab0dd3e2a81
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-978a-35f5cde44ace
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-16ee-1c7de32f4f95
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-eff1-5774cc19d4a3
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-09f2-e2e68dcdd5a8
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-3917-35220332775b
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-b5c6-cb8d65ffcd93
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-a38b-27c5bdd8b99f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-0027-b9f93127fa3b
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-38e8-e59d7bd2d20b
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-74a5-51b40f4adf5d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-09cc-da0d9ba64ec8
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-86a0-02f91a56f838
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f129-50dda7eaa596
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-5334-816bf220b48f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8d0d-c10955fdf18f
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-4def-e37ab825cabd
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f2a0-aadfcddc1082
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-7550-d66500b9cde0
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-eddf-0913a96c954e
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f2ee-9121076fc1d5
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-37d6-6a1974b8b833
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1353-261ea0a944bf
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-05d8-87ecc6267e5d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-774f-f087100c1344
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-44d5-cac37438ca6a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-a956-d2ba9b9c9bf1
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-7c60-64f5e71be628
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-f105-2590ab5a5b4a
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-8c30-36c9a4bfd088
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-4021-22724b9c2587
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-08f9-977341c5ff56
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-3620-82d3478218d7
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d125-01f9338bebc6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-9e21-de53767dd877
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-1130-9263bd8101bd
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-0f7d-6a9285021e07
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-85cc-3e5a6ed8b8de
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-725b-a330365e0e88
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-d16a-9b43f8ca3c89
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-19df-20a9a7cd054d
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-025f-7126347dbdc6
00020000-564c-388f-1d22-e660e40e513a	00030000-564c-388d-eef2-1cc064a3bba0
00020000-564c-388f-9cdd-a6d11abb1fa1	00030000-564c-388d-e317-dc58e9380e28
00020000-564c-388f-d0ee-f3bb63013ca6	00030000-564c-388d-a9ce-91169349634e
00020000-564c-388f-9075-efa0644c6b10	00030000-564c-388d-f105-2590ab5a5b4a
00020000-564c-388f-48cc-ea02df9861e4	00030000-564c-388d-7c60-64f5e71be628
00020000-564c-388f-9ec2-8bdcb74ea730	00030000-564c-388d-f9c9-1c983dc660ac
00020000-564c-388f-e0ce-8f81de3846b4	00030000-564c-388d-fe4c-c1abd100cd4a
00020000-564c-388f-f900-baccd0f8f0f0	00030000-564c-388d-5655-97e47db14c7d
00020000-564c-388f-b09a-3aae426f672a	00030000-564c-388d-3272-5c25e5a9ffa0
00020000-564c-388f-1abd-e316663f73a3	00030000-564c-388d-e245-215bb7db1f75
00020000-564c-388f-93ee-d0b198f85037	00030000-564c-388d-5320-db1877c26411
00020000-564c-388f-81bd-c70c2222bebe	00030000-564c-388d-cdd7-8fd193810789
00020000-564c-388f-017c-ade99c2c7246	00030000-564c-388d-e979-96727794520a
00020000-564c-388f-cf5b-e10dfcab4bf4	00030000-564c-388d-2c8d-9c1d4e4a7f2e
00020000-564c-388f-ed76-a5e980f34dd7	00030000-564c-388d-c465-4cbfb6c85640
00020000-564c-388f-1b90-ec33c4f70668	00030000-564c-388d-b047-32a7d080f451
00020000-564c-388f-8dc4-94e72c2d31b9	00030000-564c-388d-d284-61a2f6a09ba9
\.


--
-- TOC entry 3139 (class 0 OID 27984293)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 27984327)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 27984464)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564c-388f-36a8-90c9a4983ed0	00090000-564c-388f-7980-c2ec525f6b91	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564c-388f-cd82-8d02c6b6cb18	00090000-564c-388f-7078-dfc0a44bbbd6	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564c-388f-c0fc-1fcf9919acd4	00090000-564c-388f-6f51-34a1b5a1660c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564c-388f-8e44-c20ab73dc6f3	00090000-564c-388f-8c60-0d0807a238f1	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 27983985)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564c-388f-cb73-43a58838cf10	\N	00040000-564c-388d-04de-2bb87a7a7a43	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-e6fe-319829e4a25e	\N	00040000-564c-388d-04de-2bb87a7a7a43	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564c-388f-c9b7-3543e55dc9bd	\N	00040000-564c-388d-04de-2bb87a7a7a43	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-5c17-a26beac9c8cd	\N	00040000-564c-388d-04de-2bb87a7a7a43	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-ea6b-5ea508f89046	\N	00040000-564c-388d-04de-2bb87a7a7a43	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-2f01-57f1200cfaa3	\N	00040000-564c-388d-89d8-1206da109728	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-c088-9fc43f0aed11	\N	00040000-564c-388d-5411-96f3c96ccba6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-f56c-0034c59c77c7	\N	00040000-564c-388d-a323-7f8df5e7862f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-388f-9cb2-b70df39442c0	\N	00040000-564c-388d-181a-4ee1cd9c4a82	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-3891-7e7d-0d79a72311b6	\N	00040000-564c-388d-04de-2bb87a7a7a43	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 27984030)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564c-388c-4dab-f15a652141d3	8341	Adlešiči
00050000-564c-388c-4a26-5e148b8f566b	5270	Ajdovščina
00050000-564c-388c-2459-0b7f8f05ba27	6280	Ankaran/Ancarano
00050000-564c-388c-8c7a-2eee314179f1	9253	Apače
00050000-564c-388c-ab74-fa63dff02d6a	8253	Artiče
00050000-564c-388c-3595-218f74917b12	4275	Begunje na Gorenjskem
00050000-564c-388c-1e99-01093324c86e	1382	Begunje pri Cerknici
00050000-564c-388c-4c8d-b224ea00a948	9231	Beltinci
00050000-564c-388c-8b4c-f4cf1aa7ae21	2234	Benedikt
00050000-564c-388c-99a2-929300522646	2345	Bistrica ob Dravi
00050000-564c-388c-0d6a-d64c80893924	3256	Bistrica ob Sotli
00050000-564c-388c-b497-a065595c2a4d	8259	Bizeljsko
00050000-564c-388c-00c3-ea2267956407	1223	Blagovica
00050000-564c-388c-e653-c1c1d69efd7e	8283	Blanca
00050000-564c-388c-cabe-93520077fcab	4260	Bled
00050000-564c-388c-378b-e70411321812	4273	Blejska Dobrava
00050000-564c-388c-64d4-b678d988dd8f	9265	Bodonci
00050000-564c-388c-aac2-6465435a620b	9222	Bogojina
00050000-564c-388c-3f55-1d851bc627c4	4263	Bohinjska Bela
00050000-564c-388c-729d-303539fc4cd8	4264	Bohinjska Bistrica
00050000-564c-388c-10a7-d447d956c525	4265	Bohinjsko jezero
00050000-564c-388c-227d-586d39be6045	1353	Borovnica
00050000-564c-388c-1b66-1f60519b83ec	8294	Boštanj
00050000-564c-388c-029b-bdb2b47c499f	5230	Bovec
00050000-564c-388c-1bb1-25a0e0ee871a	5295	Branik
00050000-564c-388c-d9fa-80fdd72e7e40	3314	Braslovče
00050000-564c-388c-8afc-13d00a7b2f8c	5223	Breginj
00050000-564c-388c-e5d9-08761ee374f3	8280	Brestanica
00050000-564c-388c-a2ff-40abd4873b86	2354	Bresternica
00050000-564c-388c-8cb0-b004242215b9	4243	Brezje
00050000-564c-388c-08b3-03cd63f48173	1351	Brezovica pri Ljubljani
00050000-564c-388c-dc82-66a407e0156d	8250	Brežice
00050000-564c-388c-103f-086821280507	4210	Brnik - Aerodrom
00050000-564c-388c-7f09-e7b25044a117	8321	Brusnice
00050000-564c-388c-f752-5598e3dc3209	3255	Buče
00050000-564c-388c-3b94-7ea29549bb2f	8276	Bučka 
00050000-564c-388c-26e7-77ecd2437edc	9261	Cankova
00050000-564c-388c-bebf-663faac7663a	3000	Celje 
00050000-564c-388c-319c-69ac861b8539	3001	Celje - poštni predali
00050000-564c-388c-5097-af75bedeed1e	4207	Cerklje na Gorenjskem
00050000-564c-388c-8d45-1fe6783c2f4b	8263	Cerklje ob Krki
00050000-564c-388c-cc83-2ab1422b5ddd	1380	Cerknica
00050000-564c-388c-0995-4ed6fb238169	5282	Cerkno
00050000-564c-388c-5c6f-645ee919b32d	2236	Cerkvenjak
00050000-564c-388c-23c5-63360f1b6482	2215	Ceršak
00050000-564c-388c-0bb3-7cde0299027a	2326	Cirkovce
00050000-564c-388c-62a3-aba006347a82	2282	Cirkulane
00050000-564c-388c-64c6-9b2a16b0bb71	5273	Col
00050000-564c-388c-ea32-6666eed72081	8251	Čatež ob Savi
00050000-564c-388c-065d-7561e3c331e3	1413	Čemšenik
00050000-564c-388c-9fb8-0bf47a202e69	5253	Čepovan
00050000-564c-388c-23f6-e52c60231bd5	9232	Črenšovci
00050000-564c-388c-e654-697b635d1b72	2393	Črna na Koroškem
00050000-564c-388c-34f4-39e15ce8c244	6275	Črni Kal
00050000-564c-388c-8ee8-115626c5c621	5274	Črni Vrh nad Idrijo
00050000-564c-388c-c9fa-c78495afc2fd	5262	Črniče
00050000-564c-388c-879b-dfb94ccf65af	8340	Črnomelj
00050000-564c-388c-6cd4-2e217e9cf547	6271	Dekani
00050000-564c-388c-3f81-1f7892b45503	5210	Deskle
00050000-564c-388c-59d1-c7ae72eaf027	2253	Destrnik
00050000-564c-388c-232d-f46175a514ee	6215	Divača
00050000-564c-388c-2d63-34e3cf6bd627	1233	Dob
00050000-564c-388c-b163-11c5d2aaf187	3224	Dobje pri Planini
00050000-564c-388c-7d6f-96c9c51e1665	8257	Dobova
00050000-564c-388c-0c07-76d4962df00f	1423	Dobovec
00050000-564c-388c-a64f-c4381a45062f	5263	Dobravlje
00050000-564c-388c-16de-06e42ad48ae4	3204	Dobrna
00050000-564c-388c-3b49-f9515c49c1cf	8211	Dobrnič
00050000-564c-388c-00c0-501608beaa79	1356	Dobrova
00050000-564c-388c-cdcf-c5b35ceea73d	9223	Dobrovnik/Dobronak 
00050000-564c-388c-5d28-44dac0632308	5212	Dobrovo v Brdih
00050000-564c-388c-94cb-d1b03e00bc0a	1431	Dol pri Hrastniku
00050000-564c-388c-8b34-11ba41bf413f	1262	Dol pri Ljubljani
00050000-564c-388c-11bc-c4d3d661c786	1273	Dole pri Litiji
00050000-564c-388c-e9a7-0eadc1452a06	1331	Dolenja vas
00050000-564c-388c-4b09-32a8e33ce6dd	8350	Dolenjske Toplice
00050000-564c-388c-7903-5b419f4cf3f4	1230	Domžale
00050000-564c-388c-db9d-66a8a8115db0	2252	Dornava
00050000-564c-388c-f3c2-d64b816eb596	5294	Dornberk
00050000-564c-388c-02e6-c767d7945e0c	1319	Draga
00050000-564c-388c-666f-e5d12517f204	8343	Dragatuš
00050000-564c-388c-d4d1-18e5157d5e57	3222	Dramlje
00050000-564c-388c-e5d2-66635a2eddf3	2370	Dravograd
00050000-564c-388c-4387-55c3b5dbd752	4203	Duplje
00050000-564c-388c-d3bd-b5051d04e552	6221	Dutovlje
00050000-564c-388c-daba-e390fe44e1a3	8361	Dvor
00050000-564c-388c-1cf9-c92126fdcb7b	2343	Fala
00050000-564c-388c-ab68-d3ea1ab0bb9b	9208	Fokovci
00050000-564c-388c-c409-bf06b728ad43	2313	Fram
00050000-564c-388c-fe82-0abdc7a719c9	3213	Frankolovo
00050000-564c-388c-f859-cfe266fa7c8b	1274	Gabrovka
00050000-564c-388c-7fae-2066b7b2eec5	8254	Globoko
00050000-564c-388c-c205-cf2cd9806300	5275	Godovič
00050000-564c-388c-98d9-0baeefc0f318	4204	Golnik
00050000-564c-388c-1443-eb97bc782915	3303	Gomilsko
00050000-564c-388c-5ecf-03a9145f4ca9	4224	Gorenja vas
00050000-564c-388c-92dd-208166efd680	3263	Gorica pri Slivnici
00050000-564c-388c-a90a-1d93b26b328f	2272	Gorišnica
00050000-564c-388c-27c7-ed572e31e09c	9250	Gornja Radgona
00050000-564c-388c-34e7-0285c4b5383a	3342	Gornji Grad
00050000-564c-388c-5b5d-20b597a1a265	4282	Gozd Martuljek
00050000-564c-388c-8999-0d14e7343c51	6272	Gračišče
00050000-564c-388c-2e88-23ff63d0b6ff	9264	Grad
00050000-564c-388c-d352-b4e02338d1ae	8332	Gradac
00050000-564c-388c-4dc9-f7a3cdf12c0a	1384	Grahovo
00050000-564c-388c-be53-5654a2216611	5242	Grahovo ob Bači
00050000-564c-388c-b7b0-9fcecbae1264	5251	Grgar
00050000-564c-388c-c6ef-32ab4bcbfe50	3302	Griže
00050000-564c-388c-f0a7-7387d42381b3	3231	Grobelno
00050000-564c-388c-321e-a8fe92e6a31b	1290	Grosuplje
00050000-564c-388c-f179-b9af3c62dab2	2288	Hajdina
00050000-564c-388c-cea7-30039551556b	8362	Hinje
00050000-564c-388c-6660-c78c43f7189c	2311	Hoče
00050000-564c-388c-3144-e0d1db83d1f9	9205	Hodoš/Hodos
00050000-564c-388c-9cc9-4e6a03a27071	1354	Horjul
00050000-564c-388c-7c78-51274b551da8	1372	Hotedršica
00050000-564c-388c-5ec1-dafb250e2ce0	1430	Hrastnik
00050000-564c-388c-131d-3b637cfa38de	6225	Hruševje
00050000-564c-388c-a524-cc0d4a42657c	4276	Hrušica
00050000-564c-388c-e700-19b58ffc0428	5280	Idrija
00050000-564c-388c-1aa4-6c03a6d641a0	1292	Ig
00050000-564c-388c-5f08-5645e91cc751	6250	Ilirska Bistrica
00050000-564c-388c-29b6-ec1128d8ef9e	6251	Ilirska Bistrica-Trnovo
00050000-564c-388c-4ce7-037829321c29	1295	Ivančna Gorica
00050000-564c-388c-4868-267940e8156a	2259	Ivanjkovci
00050000-564c-388c-a873-5a5b435db3f0	1411	Izlake
00050000-564c-388c-f58e-bb5669469dc3	6310	Izola/Isola
00050000-564c-388c-c690-ab331815ffba	2222	Jakobski Dol
00050000-564c-388c-3f1d-55cba37af8c7	2221	Jarenina
00050000-564c-388c-af90-50c156273f78	6254	Jelšane
00050000-564c-388c-b2f4-03c04c03e1de	4270	Jesenice
00050000-564c-388c-1a5a-0bedd15adc6c	8261	Jesenice na Dolenjskem
00050000-564c-388c-3bfc-93c50d738d82	3273	Jurklošter
00050000-564c-388c-dd66-fd4dd3b64bff	2223	Jurovski Dol
00050000-564c-388c-dcb4-dc355ff7d649	2256	Juršinci
00050000-564c-388c-5e08-e931d653b0d4	5214	Kal nad Kanalom
00050000-564c-388c-ddf5-29e639aad7a6	3233	Kalobje
00050000-564c-388c-cdaa-2e3d0f1af9f4	4246	Kamna Gorica
00050000-564c-388c-2cb9-0861b6601da8	2351	Kamnica
00050000-564c-388c-274e-bb5a95a595b0	1241	Kamnik
00050000-564c-388c-1937-1cf9c7989d92	5213	Kanal
00050000-564c-388c-3786-cfcea329e1b4	8258	Kapele
00050000-564c-388c-0bbb-7aaa7b94ddbf	2362	Kapla
00050000-564c-388c-0eb6-09c8b043d954	2325	Kidričevo
00050000-564c-388c-bc2d-17fb075b119a	1412	Kisovec
00050000-564c-388c-f7f2-4908857f3acd	6253	Knežak
00050000-564c-388c-ee17-90b426441105	5222	Kobarid
00050000-564c-388c-22c7-630c5c120290	9227	Kobilje
00050000-564c-388c-352f-65c4a57d7872	1330	Kočevje
00050000-564c-388c-d00c-bb721b8fd196	1338	Kočevska Reka
00050000-564c-388c-14e5-7c6332b12d24	2276	Kog
00050000-564c-388c-5a4e-cb99b9754334	5211	Kojsko
00050000-564c-388c-a27b-9f68bb6e3d1e	6223	Komen
00050000-564c-388c-3959-d5828b709d2f	1218	Komenda
00050000-564c-388c-eadb-8fb1c3585982	6000	Koper/Capodistria 
00050000-564c-388c-7684-bf60b62c8676	6001	Koper/Capodistria - poštni predali
00050000-564c-388c-c3b4-284fed2f5455	8282	Koprivnica
00050000-564c-388c-a128-23e56db11bf8	5296	Kostanjevica na Krasu
00050000-564c-388c-4616-4e214e3854e9	8311	Kostanjevica na Krki
00050000-564c-388c-bcc6-06673f3243f3	1336	Kostel
00050000-564c-388c-9235-6273ce4807a7	6256	Košana
00050000-564c-388c-16b5-3eba58c0f3c5	2394	Kotlje
00050000-564c-388c-87f0-fb8b834a68d2	6240	Kozina
00050000-564c-388c-b7ca-ac68dc100caf	3260	Kozje
00050000-564c-388c-3c21-b3fa461f259d	4000	Kranj 
00050000-564c-388c-f7e4-97bcee89aa76	4001	Kranj - poštni predali
00050000-564c-388c-c655-f91d6fe45515	4280	Kranjska Gora
00050000-564c-388c-8a45-200a8c331140	1281	Kresnice
00050000-564c-388c-e1e1-d103a686d9e2	4294	Križe
00050000-564c-388c-7c8b-eabd940a1e8b	9206	Križevci
00050000-564c-388c-e8de-12fd4dc1fa4e	9242	Križevci pri Ljutomeru
00050000-564c-388c-e58f-c7e77a9f1620	1301	Krka
00050000-564c-388c-263a-6586656cf1c1	8296	Krmelj
00050000-564c-388c-f78b-d2a4def11f39	4245	Kropa
00050000-564c-388c-dca0-7f456d1f4523	8262	Krška vas
00050000-564c-388c-ea8f-03b1ce2d7f12	8270	Krško
00050000-564c-388c-fad5-5148b81cfa75	9263	Kuzma
00050000-564c-388c-b5b3-c46f958a4496	2318	Laporje
00050000-564c-388c-fcf5-f7ec3a0a095b	3270	Laško
00050000-564c-388c-c899-2cb8a1b1407f	1219	Laze v Tuhinju
00050000-564c-388c-4a26-98c08f92fa3e	2230	Lenart v Slovenskih goricah
00050000-564c-388c-bd01-cc2515bc6cb4	9220	Lendava/Lendva
00050000-564c-388c-6517-bd1b891b974a	4248	Lesce
00050000-564c-388c-f989-49d1996d6806	3261	Lesično
00050000-564c-388c-7786-ae8968f60717	8273	Leskovec pri Krškem
00050000-564c-388c-e6e8-7054c3ba019d	2372	Libeliče
00050000-564c-388c-9bed-83a314b6a5bb	2341	Limbuš
00050000-564c-388c-25e2-8eb497e4ef0f	1270	Litija
00050000-564c-388c-729e-92ed9083c837	3202	Ljubečna
00050000-564c-388c-80b7-d05077196b02	1000	Ljubljana 
00050000-564c-388c-b7e1-0377c46accfc	1001	Ljubljana - poštni predali
00050000-564c-388c-6da9-cdf0995b8424	1231	Ljubljana - Črnuče
00050000-564c-388c-90e5-42ace38b841a	1261	Ljubljana - Dobrunje
00050000-564c-388c-ce4c-d4c5f87e68e0	1260	Ljubljana - Polje
00050000-564c-388c-15b9-53ab80580446	1210	Ljubljana - Šentvid
00050000-564c-388c-c08f-80b80e852fc4	1211	Ljubljana - Šmartno
00050000-564c-388c-1585-6090b3a59f95	3333	Ljubno ob Savinji
00050000-564c-388c-2fde-cce898187ed3	9240	Ljutomer
00050000-564c-388c-264e-8f6603e9adad	3215	Loče
00050000-564c-388c-f0f9-e98cff4d3e22	5231	Log pod Mangartom
00050000-564c-388c-f4f3-4165dd48470f	1358	Log pri Brezovici
00050000-564c-388c-0e44-027167ec05d7	1370	Logatec
00050000-564c-388c-dc04-7a687dfdf159	1371	Logatec
00050000-564c-388c-44b4-e353f7f07b7f	1434	Loka pri Zidanem Mostu
00050000-564c-388c-d42d-2665b4247faf	3223	Loka pri Žusmu
00050000-564c-388c-9958-2965d2ceabb4	6219	Lokev
00050000-564c-388c-0b2e-dbbbeb351126	1318	Loški Potok
00050000-564c-388c-1d53-85236a0d8257	2324	Lovrenc na Dravskem polju
00050000-564c-388c-d56b-f48c04238afc	2344	Lovrenc na Pohorju
00050000-564c-388c-bc4a-196954d39f8b	3334	Luče
00050000-564c-388c-1d99-7b003ca13d96	1225	Lukovica
00050000-564c-388c-a03c-d24c35a53ce3	9202	Mačkovci
00050000-564c-388c-1dee-691301559fb3	2322	Majšperk
00050000-564c-388c-7c0b-1772e315bb25	2321	Makole
00050000-564c-388c-bc5e-727d9badcdf3	9243	Mala Nedelja
00050000-564c-388c-3283-ad90790f8f35	2229	Malečnik
00050000-564c-388c-937d-5ddce0f7fe6d	6273	Marezige
00050000-564c-388c-2805-62dfabe9962c	2000	Maribor 
00050000-564c-388c-e370-308aefe0eea2	2001	Maribor - poštni predali
00050000-564c-388c-731c-cacddd9aca9f	2206	Marjeta na Dravskem polju
00050000-564c-388c-f5f1-4657f546f07a	2281	Markovci
00050000-564c-388c-522f-69cb3c37c0ea	9221	Martjanci
00050000-564c-388c-b6c7-850752995ea6	6242	Materija
00050000-564c-388c-a680-12e77c09aecb	4211	Mavčiče
00050000-564c-388c-28f0-e528e7c6c354	1215	Medvode
00050000-564c-388c-7ad7-d174ccbe6815	1234	Mengeš
00050000-564c-388c-832a-f3eecb5460c2	8330	Metlika
00050000-564c-388c-4b07-b77d76db93e2	2392	Mežica
00050000-564c-388c-92ba-f1216dc4d779	2204	Miklavž na Dravskem polju
00050000-564c-388c-16a8-3b179d725478	2275	Miklavž pri Ormožu
00050000-564c-388c-4e34-3d6fb87c40df	5291	Miren
00050000-564c-388c-5a8c-855688d0d6ec	8233	Mirna
00050000-564c-388c-bc17-56bf6b9c043d	8216	Mirna Peč
00050000-564c-388c-0594-689facb87d77	2382	Mislinja
00050000-564c-388c-9215-0fc3ce73436f	4281	Mojstrana
00050000-564c-388c-72e0-b50d9cc48f53	8230	Mokronog
00050000-564c-388c-7492-44bb5bf4eec1	1251	Moravče
00050000-564c-388c-cda9-833293deaf09	9226	Moravske Toplice
00050000-564c-388c-1404-e2d186480549	5216	Most na Soči
00050000-564c-388c-9de8-2cdbb37f4a34	1221	Motnik
00050000-564c-388c-6bc5-66e7ec4262a6	3330	Mozirje
00050000-564c-388c-8248-b2cb646da78f	9000	Murska Sobota 
00050000-564c-388c-d415-17680d862ae7	9001	Murska Sobota - poštni predali
00050000-564c-388c-3d85-78aa9a57a12d	2366	Muta
00050000-564c-388c-6151-3479f2ed88e2	4202	Naklo
00050000-564c-388c-2455-16651c8d8f6e	3331	Nazarje
00050000-564c-388c-eb62-4c6a1d63c623	1357	Notranje Gorice
00050000-564c-388c-e065-9384564b3428	3203	Nova Cerkev
00050000-564c-388c-f23c-b934906180b9	5000	Nova Gorica 
00050000-564c-388c-ea37-ab66b08c7347	5001	Nova Gorica - poštni predali
00050000-564c-388c-b6c2-d87a5be6c3c9	1385	Nova vas
00050000-564c-388c-a6f6-ed695de8a014	8000	Novo mesto
00050000-564c-388c-1213-2d5022d6f4f3	8001	Novo mesto - poštni predali
00050000-564c-388c-7b62-7befc166a35f	6243	Obrov
00050000-564c-388c-cf27-ca7ea3172499	9233	Odranci
00050000-564c-388c-1c3b-9d279dff1a47	2317	Oplotnica
00050000-564c-388c-5fcb-e7de5bcbf6a2	2312	Orehova vas
00050000-564c-388c-60c6-f371876f8a00	2270	Ormož
00050000-564c-388c-7e9e-cda5cdf2fa27	1316	Ortnek
00050000-564c-388c-6212-f4d6d8587ca2	1337	Osilnica
00050000-564c-388c-eefd-7b68e81ceb70	8222	Otočec
00050000-564c-388c-a65b-e79685aeaa57	2361	Ožbalt
00050000-564c-388c-d855-d001fa88cd80	2231	Pernica
00050000-564c-388c-fd12-ec87c95b153b	2211	Pesnica pri Mariboru
00050000-564c-388c-2056-8cb1004ea7f5	9203	Petrovci
00050000-564c-388c-fdd6-0fcc250d789c	3301	Petrovče
00050000-564c-388c-1795-2a791510efc4	6330	Piran/Pirano
00050000-564c-388c-8d19-00d60cd3c123	8255	Pišece
00050000-564c-388c-bf94-0f8836301f5f	6257	Pivka
00050000-564c-388c-8d50-eab4cc77d0b7	6232	Planina
00050000-564c-388c-394a-7fce277213a8	3225	Planina pri Sevnici
00050000-564c-388c-7f13-f9abc1f6b7ee	6276	Pobegi
00050000-564c-388c-aa6c-0b44ef498d68	8312	Podbočje
00050000-564c-388c-da50-3487b0ffb9d2	5243	Podbrdo
00050000-564c-388c-6234-a68c5185c79d	3254	Podčetrtek
00050000-564c-388c-1869-7ebd99e1158f	2273	Podgorci
00050000-564c-388c-9954-6f546450d61d	6216	Podgorje
00050000-564c-388c-8ca8-45f7cb16bf24	2381	Podgorje pri Slovenj Gradcu
00050000-564c-388c-4f40-26ad01fe3869	6244	Podgrad
00050000-564c-388c-70a8-1a5b64a42a94	1414	Podkum
00050000-564c-388c-cb50-3f49bbbe2777	2286	Podlehnik
00050000-564c-388c-fe9e-081e793d5397	5272	Podnanos
00050000-564c-388c-e745-526c710e728b	4244	Podnart
00050000-564c-388c-c87e-c5106cba8c1e	3241	Podplat
00050000-564c-388c-6492-9c7d049b9ad4	3257	Podsreda
00050000-564c-388c-2813-5e468afc5ab4	2363	Podvelka
00050000-564c-388c-e74e-07010ea36a47	2208	Pohorje
00050000-564c-388c-036b-73f80a7c345a	2257	Polenšak
00050000-564c-388c-5772-7e89112e98d6	1355	Polhov Gradec
00050000-564c-388c-dd0a-7aae3e42bdf9	4223	Poljane nad Škofjo Loko
00050000-564c-388c-d573-e8d63535307e	2319	Poljčane
00050000-564c-388c-a017-c94f08065701	1272	Polšnik
00050000-564c-388c-89dd-14d2bff0ce6f	3313	Polzela
00050000-564c-388c-aecd-7c913dc608a6	3232	Ponikva
00050000-564c-388c-c64f-6aa1ae7794b3	6320	Portorož/Portorose
00050000-564c-388c-c3bc-f35bac60f6a6	6230	Postojna
00050000-564c-388c-a417-38b12c27ea39	2331	Pragersko
00050000-564c-388c-9dd5-67613f740a9d	3312	Prebold
00050000-564c-388c-4875-925f8bb6f14a	4205	Preddvor
00050000-564c-388c-7501-af18b9056001	6255	Prem
00050000-564c-388c-de87-77ad7112447f	1352	Preserje
00050000-564c-388c-b40f-70357534ce75	6258	Prestranek
00050000-564c-388c-c88b-3ceb3cd326b4	2391	Prevalje
00050000-564c-388c-3da7-24421ac83617	3262	Prevorje
00050000-564c-388c-f679-450e68d27c4a	1276	Primskovo 
00050000-564c-388c-bfe8-fc386a9945f3	3253	Pristava pri Mestinju
00050000-564c-388c-da43-a4059759baaa	9207	Prosenjakovci/Partosfalva
00050000-564c-388c-e21c-3de4ea0f2619	5297	Prvačina
00050000-564c-388c-0719-3a0a69b78160	2250	Ptuj
00050000-564c-388c-f0b7-e71b42c91f0c	2323	Ptujska Gora
00050000-564c-388c-8e40-fb3a575b5088	9201	Puconci
00050000-564c-388c-69b9-bc04eadc8cdb	2327	Rače
00050000-564c-388c-5094-de0cc652e173	1433	Radeče
00050000-564c-388c-43b7-592d6810a28c	9252	Radenci
00050000-564c-388c-4558-03dadca68484	2360	Radlje ob Dravi
00050000-564c-388c-eae5-446a428a9917	1235	Radomlje
00050000-564c-388c-7a71-d89a1a792f3a	4240	Radovljica
00050000-564c-388c-38b5-b53cd3a1ee98	8274	Raka
00050000-564c-388c-56fb-38e7b9f6944c	1381	Rakek
00050000-564c-388c-79c9-837c9ee79f03	4283	Rateče - Planica
00050000-564c-388c-6bda-5572032af3e7	2390	Ravne na Koroškem
00050000-564c-388c-97d1-3f72f9be385c	9246	Razkrižje
00050000-564c-388c-3d59-efebb26d456f	3332	Rečica ob Savinji
00050000-564c-388c-d33d-bcf1fa5507ab	5292	Renče
00050000-564c-388c-af57-d7f8830cbf5e	1310	Ribnica
00050000-564c-388c-e78e-7d107f0f4c15	2364	Ribnica na Pohorju
00050000-564c-388c-e0fe-6594d9b7bffe	3272	Rimske Toplice
00050000-564c-388c-1c0d-32b349ed4f16	1314	Rob
00050000-564c-388c-601b-7ab00a8bc433	5215	Ročinj
00050000-564c-388c-d65c-e0d8818442e1	3250	Rogaška Slatina
00050000-564c-388c-abc0-67c7e2c42ad7	9262	Rogašovci
00050000-564c-388c-a2c8-b44e057ec522	3252	Rogatec
00050000-564c-388c-f418-6052e0483559	1373	Rovte
00050000-564c-388c-b21a-b613243d2532	2342	Ruše
00050000-564c-388c-18b2-a3fcfc529603	1282	Sava
00050000-564c-388c-4231-2448c009317d	6333	Sečovlje/Sicciole
00050000-564c-388c-d52b-6634fe72cfff	4227	Selca
00050000-564c-388c-0d27-5065ac1096e7	2352	Selnica ob Dravi
00050000-564c-388c-3b54-79ddd193a8ae	8333	Semič
00050000-564c-388c-d4c6-b82857165101	8281	Senovo
00050000-564c-388c-7740-1da30c0ac30e	6224	Senožeče
00050000-564c-388c-5ad3-56c5655a676d	8290	Sevnica
00050000-564c-388c-3204-c8272cf4bc21	6210	Sežana
00050000-564c-388c-e5cb-9a228e735c8d	2214	Sladki Vrh
00050000-564c-388c-5867-b86c0223689d	5283	Slap ob Idrijci
00050000-564c-388c-44a5-e6fc6e4ef1fb	2380	Slovenj Gradec
00050000-564c-388c-8889-fcda49fc60ba	2310	Slovenska Bistrica
00050000-564c-388c-f91d-cc86508a18b6	3210	Slovenske Konjice
00050000-564c-388c-e125-44bcd92d5da6	1216	Smlednik
00050000-564c-388c-6fb1-2b409145aa5c	5232	Soča
00050000-564c-388c-0d93-b79df8ee83c9	1317	Sodražica
00050000-564c-388c-795c-6abc13e6cece	3335	Solčava
00050000-564c-388c-6c0e-b8cf86583336	5250	Solkan
00050000-564c-388c-5073-c4cc96558749	4229	Sorica
00050000-564c-388c-e978-9ab95df94aa5	4225	Sovodenj
00050000-564c-388c-1d26-765c9bf37964	5281	Spodnja Idrija
00050000-564c-388c-b4d4-44638b64b1ed	2241	Spodnji Duplek
00050000-564c-388c-43c4-2b93d407ff98	9245	Spodnji Ivanjci
00050000-564c-388c-3a1a-1261cc598bb3	2277	Središče ob Dravi
00050000-564c-388c-72f7-6261ebdad324	4267	Srednja vas v Bohinju
00050000-564c-388c-b1af-b71c70ca53f2	8256	Sromlje 
00050000-564c-388c-ce2e-ffc05c6bf6ef	5224	Srpenica
00050000-564c-388c-11d7-e6652295b523	1242	Stahovica
00050000-564c-388c-b23c-e143433e4da5	1332	Stara Cerkev
00050000-564c-388c-befd-1ad3402de18c	8342	Stari trg ob Kolpi
00050000-564c-388c-5e0c-1f467c870bd8	1386	Stari trg pri Ložu
00050000-564c-388c-3bf5-125b73f1835b	2205	Starše
00050000-564c-388c-2e3e-5592ea2557a7	2289	Stoperce
00050000-564c-388c-2ae0-a8bc027a558f	8322	Stopiče
00050000-564c-388c-ae09-9bb653488d49	3206	Stranice
00050000-564c-388c-fc64-902fa565ef8f	8351	Straža
00050000-564c-388c-1c4e-79ba17943e3d	1313	Struge
00050000-564c-388c-c92a-6baf05408ad8	8293	Studenec
00050000-564c-388c-fffe-2014345b9731	8331	Suhor
00050000-564c-388c-bb37-00dfa0249a40	2233	Sv. Ana v Slovenskih goricah
00050000-564c-388c-0a94-9952f8107fce	2235	Sv. Trojica v Slovenskih goricah
00050000-564c-388c-ff6d-206163774f41	2353	Sveti Duh na Ostrem Vrhu
00050000-564c-388c-d047-fd0d55d09df7	9244	Sveti Jurij ob Ščavnici
00050000-564c-388c-e7de-5ea284f83cdc	3264	Sveti Štefan
00050000-564c-388c-31ed-a2cec09358d5	2258	Sveti Tomaž
00050000-564c-388c-4058-c5c14c973091	9204	Šalovci
00050000-564c-388c-c2e6-a45b82e1aa68	5261	Šempas
00050000-564c-388c-939b-31dcb04794e5	5290	Šempeter pri Gorici
00050000-564c-388c-5653-c3ed4c64c96b	3311	Šempeter v Savinjski dolini
00050000-564c-388c-111c-03cd92849ba7	4208	Šenčur
00050000-564c-388c-8aa0-4e5c62e9d552	2212	Šentilj v Slovenskih goricah
00050000-564c-388c-fca5-428bc4cc73d1	8297	Šentjanž
00050000-564c-388c-03eb-fd2e0e1bc36d	2373	Šentjanž pri Dravogradu
00050000-564c-388c-4f52-26c3153ed7b7	8310	Šentjernej
00050000-564c-388c-2108-199f6e83e95b	3230	Šentjur
00050000-564c-388c-f942-102c48ae613d	3271	Šentrupert
00050000-564c-388c-7780-945bfdd3815a	8232	Šentrupert
00050000-564c-388c-fab1-e40e4e73c60d	1296	Šentvid pri Stični
00050000-564c-388c-9449-75a554100c94	8275	Škocjan
00050000-564c-388c-b169-9da1bf53d589	6281	Škofije
00050000-564c-388c-1fc7-af0b8ddffa2d	4220	Škofja Loka
00050000-564c-388c-3a77-1e6e65e78dbe	3211	Škofja vas
00050000-564c-388c-d458-305125dd1cd3	1291	Škofljica
00050000-564c-388c-b08e-2741fded7432	6274	Šmarje
00050000-564c-388c-b3e5-f6574e91a5bc	1293	Šmarje - Sap
00050000-564c-388c-6d90-4121d55736da	3240	Šmarje pri Jelšah
00050000-564c-388c-fe9c-b511aab0d37e	8220	Šmarješke Toplice
00050000-564c-388c-ff43-6808e1ee1688	2315	Šmartno na Pohorju
00050000-564c-388c-c427-27155daa6181	3341	Šmartno ob Dreti
00050000-564c-388c-6e80-15462e8886d3	3327	Šmartno ob Paki
00050000-564c-388c-d89e-55d4160ca54d	1275	Šmartno pri Litiji
00050000-564c-388c-86de-b9be22765424	2383	Šmartno pri Slovenj Gradcu
00050000-564c-388c-6d8b-43902f34a8f9	3201	Šmartno v Rožni dolini
00050000-564c-388c-4134-05b1cddda098	3325	Šoštanj
00050000-564c-388c-b343-a1fef505623a	6222	Štanjel
00050000-564c-388c-9205-e0bd5b8296a3	3220	Štore
00050000-564c-388c-c74a-bdaf0c9ac5a1	3304	Tabor
00050000-564c-388c-c62d-d714740a3223	3221	Teharje
00050000-564c-388c-5e1d-3d2f61a04396	9251	Tišina
00050000-564c-388c-b1af-672d12801b18	5220	Tolmin
00050000-564c-388c-3a39-77c47b486488	3326	Topolšica
00050000-564c-388c-9722-70e0d3e9b46e	2371	Trbonje
00050000-564c-388c-e874-effd30602fd0	1420	Trbovlje
00050000-564c-388c-0e5c-15da60d23947	8231	Trebelno 
00050000-564c-388c-ddfa-418c666e819d	8210	Trebnje
00050000-564c-388c-b375-b633222cf64b	5252	Trnovo pri Gorici
00050000-564c-388c-09ee-bf1d374ac2c2	2254	Trnovska vas
00050000-564c-388c-c490-8f38a6fb7740	1222	Trojane
00050000-564c-388c-6856-96bf3489ffd8	1236	Trzin
00050000-564c-388c-1c44-356f51b38853	4290	Tržič
00050000-564c-388c-cedc-da3857b3ca8b	8295	Tržišče
00050000-564c-388c-dee6-0830242c0c6c	1311	Turjak
00050000-564c-388c-2b75-81abdba69f64	9224	Turnišče
00050000-564c-388c-8002-269a00d70399	8323	Uršna sela
00050000-564c-388c-9a89-263ed4fde4ce	1252	Vače
00050000-564c-388c-4303-cb08b6353b07	3320	Velenje 
00050000-564c-388c-120e-206e18250b3e	3322	Velenje - poštni predali
00050000-564c-388c-d5f4-8f71188a7fa8	8212	Velika Loka
00050000-564c-388c-716c-b1f6dbcbe600	2274	Velika Nedelja
00050000-564c-388c-ce85-ecae4feae14e	9225	Velika Polana
00050000-564c-388c-4173-285be5e23894	1315	Velike Lašče
00050000-564c-388c-43ea-4a7360c1a8f3	8213	Veliki Gaber
00050000-564c-388c-9324-75b5b92b1bdf	9241	Veržej
00050000-564c-388c-01fb-4ad666ee5750	1312	Videm - Dobrepolje
00050000-564c-388c-8631-bac9fad8cca8	2284	Videm pri Ptuju
00050000-564c-388c-ddc6-e3970260a809	8344	Vinica
00050000-564c-388c-0252-269cfb367813	5271	Vipava
00050000-564c-388c-cbc5-cfbca13316be	4212	Visoko
00050000-564c-388c-11ed-a28321845685	1294	Višnja Gora
00050000-564c-388c-6fd0-b5a7ff580bc7	3205	Vitanje
00050000-564c-388c-1b22-4f3a7ee52a6f	2255	Vitomarci
00050000-564c-388c-5e38-91da3258f16b	1217	Vodice
00050000-564c-388c-e03b-97cd493905a5	3212	Vojnik\t
00050000-564c-388c-1aa2-8d3a3b8775dd	5293	Volčja Draga
00050000-564c-388c-e32e-1ef02eeb0dcd	2232	Voličina
00050000-564c-388c-8e0c-e4815a3a44d9	3305	Vransko
00050000-564c-388c-9fbd-3161ea1764c2	6217	Vremski Britof
00050000-564c-388c-445c-2fa932b214d7	1360	Vrhnika
00050000-564c-388c-ba3d-49c78f5cc704	2365	Vuhred
00050000-564c-388c-00e8-0d9f700b51ce	2367	Vuzenica
00050000-564c-388c-6247-b589eb2dc316	8292	Zabukovje 
00050000-564c-388c-3eb3-fc0e19221cc7	1410	Zagorje ob Savi
00050000-564c-388c-a281-f8375bdcd3db	1303	Zagradec
00050000-564c-388c-941b-350e3f221a78	2283	Zavrč
00050000-564c-388c-a398-01900afec2fa	8272	Zdole 
00050000-564c-388c-4cc3-bc1a69bf4dd8	4201	Zgornja Besnica
00050000-564c-388c-0d34-0ed0370ea4cd	2242	Zgornja Korena
00050000-564c-388c-4b79-8b51520acf8e	2201	Zgornja Kungota
00050000-564c-388c-8711-65086b6a39e5	2316	Zgornja Ložnica
00050000-564c-388c-9b99-6944b2f1e6a2	2314	Zgornja Polskava
00050000-564c-388c-9662-ec02be1d88ed	2213	Zgornja Velka
00050000-564c-388c-7a8d-0ec9cab55ee8	4247	Zgornje Gorje
00050000-564c-388c-1c9e-d101b329c5dc	4206	Zgornje Jezersko
00050000-564c-388c-93f5-4cebf6cb2664	2285	Zgornji Leskovec
00050000-564c-388c-4f03-a61845f75f16	1432	Zidani Most
00050000-564c-388c-4e0a-3adf9c498c91	3214	Zreče
00050000-564c-388c-b1d4-060f4f5b8b29	4209	Žabnica
00050000-564c-388c-806c-6480f4b03d06	3310	Žalec
00050000-564c-388c-6d5b-79a20083e998	4228	Železniki
00050000-564c-388c-856a-0321b60d13ed	2287	Žetale
00050000-564c-388c-f272-032c9283fe48	4226	Žiri
00050000-564c-388c-3e44-233ea3ac8d39	4274	Žirovnica
00050000-564c-388c-6221-cffcc9f206fd	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 27984691)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 27984267)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 27984015)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564c-388f-234a-5fb39d7e085e	00080000-564c-388f-cb73-43a58838cf10	\N	00040000-564c-388d-04de-2bb87a7a7a43	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564c-388f-c9db-1bc8a0ebf7b4	00080000-564c-388f-cb73-43a58838cf10	\N	00040000-564c-388d-04de-2bb87a7a7a43	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564c-388f-2aa6-3dcb577c6d18	00080000-564c-388f-e6fe-319829e4a25e	\N	00040000-564c-388d-04de-2bb87a7a7a43	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 27984159)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564c-388d-c442-ced50228f184	novo leto	1	1	\N	t
00430000-564c-388d-6bec-1d395284c901	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564c-388d-08dd-5e3492865daf	dan upora proti okupatorju	27	4	\N	t
00430000-564c-388d-3d54-cf0f049b3ef3	praznik dela	1	5	\N	t
00430000-564c-388d-1f74-c391f83e322d	praznik dela	2	5	\N	t
00430000-564c-388d-e019-70637d6be3f1	dan Primoža Trubarja	8	6	\N	f
00430000-564c-388d-c225-916414149648	dan državnosti	25	6	\N	t
00430000-564c-388d-7678-7cc9524c32f5	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564c-388d-f0ff-b47b7655103c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564c-388d-7432-a29f66055c9f	dan suverenosti	25	10	\N	f
00430000-564c-388d-0720-dde45d1b4d91	dan spomina na mrtve	1	11	\N	t
00430000-564c-388d-e753-6d6d9b63d14a	dan Rudolfa Maistra	23	11	\N	f
00430000-564c-388d-05f1-ae70aee979e6	božič	25	12	\N	t
00430000-564c-388d-2d0a-151a25428493	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564c-388d-740b-c98f7cd97000	Marijino vnebovzetje	15	8	\N	t
00430000-564c-388d-5311-bb67d9dc6d5a	dan reformacije	31	10	\N	t
00430000-564c-388d-f626-3c749ffe1085	velikonočna nedelja	27	3	2016	t
00430000-564c-388d-9042-818b934757ce	velikonočna nedelja	16	4	2017	t
00430000-564c-388d-108a-7d05fd8881da	velikonočna nedelja	1	4	2018	t
00430000-564c-388d-e382-0d781a8d6696	velikonočna nedelja	21	4	2019	t
00430000-564c-388d-088e-3728985a5c4c	velikonočna nedelja	12	4	2020	t
00430000-564c-388d-8224-76d2f03e1abc	velikonočna nedelja	4	4	2021	t
00430000-564c-388d-07d4-06abae275791	velikonočna nedelja	17	4	2022	t
00430000-564c-388d-39ae-8ad9abefd5f3	velikonočna nedelja	9	4	2023	t
00430000-564c-388d-2b2f-20e44c28b655	velikonočna nedelja	31	3	2024	t
00430000-564c-388d-0e71-9a656f09315b	velikonočna nedelja	20	4	2025	t
00430000-564c-388d-304a-070d51f2e604	velikonočna nedelja	5	4	2026	t
00430000-564c-388d-6df2-cfbff229b8a2	velikonočna nedelja	28	3	2027	t
00430000-564c-388d-3e7e-735441b6637d	velikonočna nedelja	16	4	2028	t
00430000-564c-388d-e448-7edd842b95e1	velikonočna nedelja	1	4	2029	t
00430000-564c-388d-275c-a91db29676e9	velikonočna nedelja	21	4	2030	t
00430000-564c-388d-9eba-2867093dd3fc	velikonočni ponedeljek	28	3	2016	t
00430000-564c-388d-bebb-223dcf652156	velikonočni ponedeljek	17	4	2017	t
00430000-564c-388d-c517-ffe241f75c79	velikonočni ponedeljek	2	4	2018	t
00430000-564c-388d-7f3b-010d785b0b01	velikonočni ponedeljek	22	4	2019	t
00430000-564c-388d-1416-17d77231e84e	velikonočni ponedeljek	13	4	2020	t
00430000-564c-388d-6c97-19d1e2827e8f	velikonočni ponedeljek	5	4	2021	t
00430000-564c-388d-ff80-dd2e3e0b13d1	velikonočni ponedeljek	18	4	2022	t
00430000-564c-388d-2f04-2ab061b04945	velikonočni ponedeljek	10	4	2023	t
00430000-564c-388d-f38e-6493509706e4	velikonočni ponedeljek	1	4	2024	t
00430000-564c-388d-a723-30c0599e4203	velikonočni ponedeljek	21	4	2025	t
00430000-564c-388d-ebe7-b32fe2786132	velikonočni ponedeljek	6	4	2026	t
00430000-564c-388d-05e8-5ce8a3130e20	velikonočni ponedeljek	29	3	2027	t
00430000-564c-388d-13cd-74df4150098f	velikonočni ponedeljek	17	4	2028	t
00430000-564c-388d-13ab-8c88ec8d892a	velikonočni ponedeljek	2	4	2029	t
00430000-564c-388d-36b1-1ae4d7f498ce	velikonočni ponedeljek	22	4	2030	t
00430000-564c-388d-aed5-b02f8359d461	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564c-388d-1510-57c62d488641	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564c-388d-18af-7b686b039669	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564c-388d-3e3d-0b25d22a2704	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564c-388d-6050-d6165d491135	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564c-388d-2b23-621a4a8ad70c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564c-388d-534b-2a73341101e8	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564c-388d-3d83-07820b856c06	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564c-388d-cee2-5b271a3cd7cc	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564c-388d-c1a4-444b7e3086fa	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564c-388d-d2dd-e1fc5f718c57	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564c-388d-ce28-26fe450385ee	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564c-388d-e71d-e20c870d1849	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564c-388d-a90f-d4d3167a0228	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564c-388d-7770-f9a021e03be7	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 27984119)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 27984131)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 27984279)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 27984705)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 27984715)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564c-388f-5a62-311f0a4f01f9	00080000-564c-388f-c9b7-3543e55dc9bd	0987	AK
00190000-564c-388f-4574-71b56ff7e78a	00080000-564c-388f-e6fe-319829e4a25e	0989	AK
00190000-564c-388f-9220-291c39e28649	00080000-564c-388f-5c17-a26beac9c8cd	0986	AK
00190000-564c-388f-5ed7-fb371bb03481	00080000-564c-388f-2f01-57f1200cfaa3	0984	AK
00190000-564c-388f-6ebe-8d5495a2af75	00080000-564c-388f-c088-9fc43f0aed11	0983	AK
00190000-564c-388f-652f-660a392f0af8	00080000-564c-388f-f56c-0034c59c77c7	0982	AK
00190000-564c-3891-af0c-24db53070691	00080000-564c-3891-7e7d-0d79a72311b6	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 27984614)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564c-388f-d6a5-51f562649675	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 27984723)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 27984308)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564c-388e-2f9b-119a45a5e4a7	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564c-388e-6143-88c82093c9b0	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564c-388e-4a35-25ebd170efba	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564c-388e-d488-48da12b85a22	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564c-388e-15d4-27b839a603fb	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564c-388f-f7f2-e05291f013bb	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564c-388f-f40a-c4ef85d1d336	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 27984252)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 27984242)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 27984453)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 27984383)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 27984093)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 27983855)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564c-3891-7e7d-0d79a72311b6	00010000-564c-388d-fab0-67d8d7457e4f	2015-11-18 09:36:33	INS	a:0:{}
2	App\\Entity\\Option	00000000-564c-3891-a934-dc44afc7d7ec	00010000-564c-388d-fab0-67d8d7457e4f	2015-11-18 09:36:33	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564c-3891-af0c-24db53070691	00010000-564c-388d-fab0-67d8d7457e4f	2015-11-18 09:36:33	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 27984321)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 27983893)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564c-388d-3412-4d02fd60dd33	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564c-388d-b292-d5b34dfe41be	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564c-388d-f413-ad180a62371a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564c-388d-1aee-804ac00e7a72	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564c-388d-fe4f-ee9be01e8756	planer	Planer dogodkov v koledarju	t
00020000-564c-388d-51ce-e9f95874a61f	kadrovska	Kadrovska služba	t
00020000-564c-388d-5e82-13de2ae723a2	arhivar	Ažuriranje arhivalij	t
00020000-564c-388d-4495-add23777042c	igralec	Igralec	t
00020000-564c-388d-c3fd-39c5c5ebf0af	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564c-388f-1d22-e660e40e513a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564c-388f-9cdd-a6d11abb1fa1	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564c-388f-d0ee-f3bb63013ca6	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-9075-efa0644c6b10	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-48cc-ea02df9861e4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564c-388f-9ec2-8bdcb74ea730	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564c-388f-e0ce-8f81de3846b4	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-f900-baccd0f8f0f0	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564c-388f-b09a-3aae426f672a	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564c-388f-1abd-e316663f73a3	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564c-388f-93ee-d0b198f85037	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-81bd-c70c2222bebe	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564c-388f-017c-ade99c2c7246	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-cf5b-e10dfcab4bf4	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-ed76-a5e980f34dd7	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564c-388f-1b90-ec33c4f70668	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564c-388f-8dc4-94e72c2d31b9	Datoteka-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 27983877)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564c-388d-0756-5752bee6212a	00020000-564c-388d-f413-ad180a62371a
00010000-564c-388d-fab0-67d8d7457e4f	00020000-564c-388d-f413-ad180a62371a
00010000-564c-388f-7e5a-22e22d08fa32	00020000-564c-388f-1d22-e660e40e513a
00010000-564c-388f-f7de-b229ee695c1e	00020000-564c-388f-9cdd-a6d11abb1fa1
00010000-564c-388f-f7de-b229ee695c1e	00020000-564c-388f-9ec2-8bdcb74ea730
00010000-564c-388f-f7de-b229ee695c1e	00020000-564c-388f-1abd-e316663f73a3
00010000-564c-388f-f7de-b229ee695c1e	00020000-564c-388f-81bd-c70c2222bebe
00010000-564c-388f-f7de-b229ee695c1e	00020000-564c-388f-ed76-a5e980f34dd7
00010000-564c-388f-f7de-b229ee695c1e	00020000-564c-388f-8dc4-94e72c2d31b9
00010000-564c-388f-3be6-95abec681518	00020000-564c-388f-d0ee-f3bb63013ca6
00010000-564c-388f-3be6-95abec681518	00020000-564c-388f-e0ce-8f81de3846b4
00010000-564c-388f-3be6-95abec681518	00020000-564c-388f-93ee-d0b198f85037
00010000-564c-388f-3be6-95abec681518	00020000-564c-388f-017c-ade99c2c7246
00010000-564c-388f-3be6-95abec681518	00020000-564c-388f-1b90-ec33c4f70668
00010000-564c-388f-fd8f-5a82c371ca48	00020000-564c-388f-d0ee-f3bb63013ca6
00010000-564c-388f-fd8f-5a82c371ca48	00020000-564c-388f-e0ce-8f81de3846b4
00010000-564c-388f-fd8f-5a82c371ca48	00020000-564c-388f-b09a-3aae426f672a
00010000-564c-388f-fd8f-5a82c371ca48	00020000-564c-388f-93ee-d0b198f85037
00010000-564c-388f-fd8f-5a82c371ca48	00020000-564c-388f-017c-ade99c2c7246
00010000-564c-388f-fd8f-5a82c371ca48	00020000-564c-388f-1b90-ec33c4f70668
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-d0ee-f3bb63013ca6
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-9075-efa0644c6b10
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-e0ce-8f81de3846b4
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-f900-baccd0f8f0f0
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-b09a-3aae426f672a
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-9ec2-8bdcb74ea730
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-93ee-d0b198f85037
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-017c-ade99c2c7246
00010000-564c-388f-42f5-50c5efec4a23	00020000-564c-388f-1b90-ec33c4f70668
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-9cdd-a6d11abb1fa1
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-48cc-ea02df9861e4
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-9ec2-8bdcb74ea730
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-1abd-e316663f73a3
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-81bd-c70c2222bebe
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-ed76-a5e980f34dd7
00010000-564c-388f-8aae-01432fb4ea68	00020000-564c-388f-8dc4-94e72c2d31b9
\.


--
-- TOC entry 3144 (class 0 OID 27984335)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 27984273)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 27984219)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564c-388f-8097-b1e521b3e5b8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564c-388f-6e26-faf9421a0795	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564c-388f-018a-81af706fcdec	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 27983842)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564c-388c-fbee-15a159295cfb	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564c-388c-f7db-a5bcb38d576c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564c-388c-fa26-6981961317c8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564c-388c-f3cd-c13fe54b9ce8	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564c-388c-91bb-544a76729d63	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 27983834)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564c-388c-54fb-e02f4c7cc159	00230000-564c-388c-f3cd-c13fe54b9ce8	popa
00240000-564c-388d-bc7c-b149f80804cb	00230000-564c-388c-f3cd-c13fe54b9ce8	oseba
00240000-564c-388d-80d5-5604a0161d4a	00230000-564c-388c-f3cd-c13fe54b9ce8	tippopa
00240000-564c-388d-9419-c2c109d9c9fe	00230000-564c-388c-f3cd-c13fe54b9ce8	organizacijskaenota
00240000-564c-388d-1de9-bbb75d049798	00230000-564c-388c-f3cd-c13fe54b9ce8	sezona
00240000-564c-388d-edc9-5dac07b190ec	00230000-564c-388c-f3cd-c13fe54b9ce8	tipvaje
00240000-564c-388d-7425-3b974be29dda	00230000-564c-388c-f7db-a5bcb38d576c	prostor
00240000-564c-388d-a1d6-b0f856ca1d78	00230000-564c-388c-f3cd-c13fe54b9ce8	besedilo
00240000-564c-388d-5bc7-4e4cd868fbc8	00230000-564c-388c-f3cd-c13fe54b9ce8	uprizoritev
00240000-564c-388d-97e9-cc58527fbd03	00230000-564c-388c-f3cd-c13fe54b9ce8	funkcija
00240000-564c-388d-cb2f-98ec97d5e2ad	00230000-564c-388c-f3cd-c13fe54b9ce8	tipfunkcije
00240000-564c-388d-1103-5fdca4f936b0	00230000-564c-388c-f3cd-c13fe54b9ce8	alternacija
00240000-564c-388d-ca98-bdd5e81b8b2d	00230000-564c-388c-fbee-15a159295cfb	pogodba
00240000-564c-388d-06b3-a17a4ffd30df	00230000-564c-388c-f3cd-c13fe54b9ce8	zaposlitev
00240000-564c-388d-dcb2-6464f919628b	00230000-564c-388c-f3cd-c13fe54b9ce8	zvrstuprizoritve
00240000-564c-388d-1985-894c22a9073a	00230000-564c-388c-fbee-15a159295cfb	programdela
00240000-564c-388d-dc99-6a38ebeb81d3	00230000-564c-388c-f3cd-c13fe54b9ce8	zapis
\.


--
-- TOC entry 3093 (class 0 OID 27983829)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
aa0da98a-8d1e-493c-b671-5819c77ff971	00240000-564c-388c-54fb-e02f4c7cc159	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 27984400)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564c-388f-050b-a8bf172152ce	000e0000-564c-388f-509c-25f8b5470ba2	00080000-564c-388f-cb73-43a58838cf10	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564c-388d-6895-8d1bcf23759b
00270000-564c-388f-4e0d-3997afafdfdd	000e0000-564c-388f-509c-25f8b5470ba2	00080000-564c-388f-cb73-43a58838cf10	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564c-388d-6895-8d1bcf23759b
\.


--
-- TOC entry 3109 (class 0 OID 27983977)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 27984229)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564c-388f-b953-86444e72d479	00180000-564c-388f-4de6-9cfcf1bfb432	000c0000-564c-388f-34e8-6cff764448a2	00090000-564c-388f-7980-c2ec525f6b91	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-388f-04dd-8df0f1c5b810	00180000-564c-388f-4de6-9cfcf1bfb432	000c0000-564c-388f-e32e-c2e2bf654be4	00090000-564c-388f-8c60-0d0807a238f1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-388f-45fb-2ca954173ce7	00180000-564c-388f-4de6-9cfcf1bfb432	000c0000-564c-388f-44f4-a3c40c383760	00090000-564c-388f-34b2-49d53a953576	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-388f-9e2d-884e2361b55a	00180000-564c-388f-4de6-9cfcf1bfb432	000c0000-564c-388f-7c5b-3e7cf06124e8	00090000-564c-388f-0bac-3d929fb187c1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-388f-8941-ded5bbf39603	00180000-564c-388f-4de6-9cfcf1bfb432	000c0000-564c-388f-6c8e-4a5c7ca8c34e	00090000-564c-388f-b044-9bb25641bfa0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-388f-c83b-11aec95d844c	00180000-564c-388f-ba16-9525862edf7f	\N	00090000-564c-388f-b044-9bb25641bfa0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564c-388f-f0e3-5608c9ff0714	00180000-564c-388f-ba16-9525862edf7f	\N	00090000-564c-388f-8c60-0d0807a238f1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 27984441)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564c-388c-6030-cf0c59c4bdbb	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564c-388c-416c-7748e2897fd0	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564c-388c-73ce-3cb26ab7aaf0	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564c-388c-ea74-5ba6b08cda28	04	Režija	Režija	Režija	umetnik	30
000f0000-564c-388c-ac6f-17bc0ce623cb	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564c-388c-f795-cc4a73937480	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564c-388c-4510-7bfb41379b1a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564c-388c-13cd-40b787ec1f8d	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564c-388c-3e68-e9d22cbb07c1	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564c-388c-adb5-632e82e71f5f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564c-388c-294d-863d40233a7a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564c-388c-cace-3ffdcb7785b0	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564c-388c-8026-b62335fd23f0	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564c-388c-195f-cce19f7bf148	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564c-388c-2930-53beb0767a92	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564c-388c-eaab-b3192cd12c0e	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564c-388c-2e88-e479bff4c7d2	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564c-388c-ee58-c085fb9adcd1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 27983928)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564c-388f-f9f0-1471dbbab05e	0001	šola	osnovna ali srednja šola
00400000-564c-388f-a3fe-017b73d0f461	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564c-388f-9a57-c5507c1ac421	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 27984734)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564c-388c-d6f4-500f44becffe	01	Velika predstava	f	1.00	1.00
002b0000-564c-388c-3fc3-2dde171b76f9	02	Mala predstava	f	0.50	0.50
002b0000-564c-388c-281b-3cc9ce0f1f98	03	Mala koprodukcija	t	0.40	1.00
002b0000-564c-388c-b432-1999f8bb85ac	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564c-388c-696d-763a11e336a3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 27984209)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564c-388c-8827-51100b1a3376	0001	prva vaja	prva vaja
00420000-564c-388c-ec25-e6078dd3f526	0002	tehnična vaja	tehnična vaja
00420000-564c-388c-2cea-31cd7ce251a2	0003	lučna vaja	lučna vaja
00420000-564c-388c-a71a-7406b41b3b48	0004	kostumska vaja	kostumska vaja
00420000-564c-388c-aa2c-02899b4bf4fd	0005	foto vaja	foto vaja
00420000-564c-388c-1bc7-d1a2b8a6f2cb	0006	1. glavna vaja	1. glavna vaja
00420000-564c-388c-74ac-a67c066b7371	0007	2. glavna vaja	2. glavna vaja
00420000-564c-388c-a8da-c336c3a5c002	0008	1. generalka	1. generalka
00420000-564c-388c-6832-b2ca26bd9e86	0009	2. generalka	2. generalka
00420000-564c-388c-a198-f86d95dc8466	0010	odprta generalka	odprta generalka
00420000-564c-388c-029a-949849fddd84	0011	obnovitvena vaja	obnovitvena vaja
00420000-564c-388c-f1e6-b75f5352623a	0012	pevska vaja	pevska vaja
00420000-564c-388c-389d-f722991ebffd	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564c-388c-f4bf-4e9ecffa4ac1	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 27984050)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 27983864)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564c-388d-fab0-67d8d7457e4f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROSbUqUtaY5pleGElcJPVR3ISHf/wirU2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564c-388f-6206-c2efd30311e9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564c-388f-f743-08ab34b5dcef	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564c-388f-d761-16daa3023d30	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564c-388f-2134-cbcf6a4576f4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564c-388f-f9c2-09edfec1cd50	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564c-388f-8891-c03493285fc4	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564c-388f-5e9f-cb3ca3214365	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564c-388f-81b7-916041276cc6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564c-388f-a0d9-57e1dd998c46	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564c-388f-7e5a-22e22d08fa32	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564c-388f-cba0-7905eac9c0f2	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564c-388f-f7de-b229ee695c1e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564c-388f-3be6-95abec681518	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564c-388f-fd8f-5a82c371ca48	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564c-388f-42f5-50c5efec4a23	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564c-388f-8aae-01432fb4ea68	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564c-388d-0756-5752bee6212a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 27984491)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564c-388f-405e-0d41512f7496	00160000-564c-388e-196e-be5f52877092	\N	00140000-564c-388d-01e9-faa00692accd	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564c-388e-15d4-27b839a603fb
000e0000-564c-388f-509c-25f8b5470ba2	00160000-564c-388e-515c-a84e56047a80	\N	00140000-564c-388d-b60f-4deaef43e2db	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564c-388f-f7f2-e05291f013bb
000e0000-564c-388f-c071-a3ab95b9eafb	\N	\N	00140000-564c-388d-b60f-4deaef43e2db	00190000-564c-388f-5a62-311f0a4f01f9	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564c-388e-15d4-27b839a603fb
000e0000-564c-388f-ed27-216e6082a927	\N	\N	00140000-564c-388d-b60f-4deaef43e2db	00190000-564c-388f-5a62-311f0a4f01f9	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564c-388e-15d4-27b839a603fb
000e0000-564c-388f-9345-c5286fa9a4d1	\N	\N	00140000-564c-388d-b60f-4deaef43e2db	00190000-564c-388f-5a62-311f0a4f01f9	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564c-388e-2f9b-119a45a5e4a7
000e0000-564c-388f-2ace-5cd922ddb129	\N	\N	00140000-564c-388d-b60f-4deaef43e2db	00190000-564c-388f-5a62-311f0a4f01f9	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564c-388e-2f9b-119a45a5e4a7
\.


--
-- TOC entry 3123 (class 0 OID 27984149)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564c-388f-c27b-0a0bc87bc83d	\N	000e0000-564c-388f-509c-25f8b5470ba2	1	
00200000-564c-388f-9da2-ae3fa678d7e2	\N	000e0000-564c-388f-509c-25f8b5470ba2	2	
00200000-564c-388f-a89b-c4072bf34b8f	\N	000e0000-564c-388f-509c-25f8b5470ba2	3	
00200000-564c-388f-881d-cc9c20d832db	\N	000e0000-564c-388f-509c-25f8b5470ba2	4	
00200000-564c-388f-22f3-4c738e0b9312	\N	000e0000-564c-388f-509c-25f8b5470ba2	5	
\.


--
-- TOC entry 3140 (class 0 OID 27984300)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 27984414)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564c-388d-0c59-3ce1a436078f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564c-388d-9cc9-2a8ae4e80ee8	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564c-388d-bb26-e1af63bb649f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564c-388d-b295-621852c3784a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564c-388d-40ca-4ba26ebf66ed	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564c-388d-a9f7-c10427eb1d8a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564c-388d-bf6a-23e2775cddb4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564c-388d-41d8-3a6c9ea7432d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564c-388d-6895-8d1bcf23759b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564c-388d-1d1a-ef09d7cf4091	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564c-388d-002f-e896a5decf35	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564c-388d-1aeb-ad248832740d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564c-388d-0294-896224d111f4	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564c-388d-f5ef-9ae8bf066437	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564c-388d-4b44-b154ab54d63e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564c-388d-ebdb-4a82e9e7fd76	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564c-388d-9944-c8c8c20a959d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564c-388d-4ebd-64caafd8d758	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564c-388d-126d-a5f890a71a5a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564c-388d-ef34-5e252fd55f68	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564c-388d-3caf-2e207c0df7cb	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564c-388d-130b-cc8a90fe6d4d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564c-388d-8c5f-a6e210dbd519	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564c-388d-0aee-204e1316e11d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564c-388d-7629-5cbc518fb922	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564c-388d-4056-029bdaf59272	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564c-388d-9ce1-62ac413f9733	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564c-388d-75c7-d767a371f8e6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 27984784)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 27984753)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 27984796)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 27984372)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564c-388f-ceb5-4fd136cd9079	00090000-564c-388f-8c60-0d0807a238f1	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-388f-8082-2cc00c3a4076	00090000-564c-388f-34b2-49d53a953576	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-388f-bb38-2491cf07d8b6	00090000-564c-388f-1587-879a62a762d6	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-388f-6c4c-efa45a02a164	00090000-564c-388f-1627-deeb89c6f393	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-388f-ddc6-08a82edb640d	00090000-564c-388f-deeb-a6c880916268	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-388f-b5f8-df9e9b22aa09	00090000-564c-388f-22fc-eb43cf9c5531	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 27984193)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 27984481)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564c-388d-01e9-faa00692accd	01	Drama	drama (SURS 01)
00140000-564c-388d-939b-ce6586e23d24	02	Opera	opera (SURS 02)
00140000-564c-388d-9f94-a6d82cc32113	03	Balet	balet (SURS 03)
00140000-564c-388d-1f6d-b4bdaafcc5f6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564c-388d-71ba-9f6206a1fdb4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564c-388d-b60f-4deaef43e2db	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564c-388d-8258-b5ec0d4f3e02	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 27984362)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 27983927)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 27984540)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 27984530)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 27983918)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 27984397)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 27984439)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 27984837)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 27984181)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 27984203)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 27984208)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 27984751)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 27984076)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 27984608)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 27984358)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 27984147)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 27984114)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 27984090)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 27984265)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 27984814)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 27984821)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 27984845)
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
-- TOC entry 2726 (class 2606 OID 27984292)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 27984048)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 27983946)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 27984010)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 27983973)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 27983907)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 27983892)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 27984298)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 27984334)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 27984476)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 27984001)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 27984036)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 27984703)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 27984271)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 27984026)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 27984166)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 27984135)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 27984127)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 27984283)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 27984712)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 27984720)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 27984690)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 27984732)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 27984316)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 27984256)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 27984247)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 27984463)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 27984390)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 27984102)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 27983863)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 27984325)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 27983881)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 27983901)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 27984343)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 27984278)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 27984227)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 27983851)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 27983839)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 27983833)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 27984410)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 27983982)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 27984238)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 27984450)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 27983935)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 27984744)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 27984216)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 27984061)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 27983876)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 27984509)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 27984156)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 27984306)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 27984422)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 27984794)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 27984778)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 27984802)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 27984380)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 27984197)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 27984489)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 27984370)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 27984191)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 27984192)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 27984190)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 27984189)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 27984188)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 27984411)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 27984412)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 27984413)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 27984816)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 27984815)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 27984003)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 27984004)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 27984299)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 27984782)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 27984781)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 27984783)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 27984780)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 27984779)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 27984285)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 27984284)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 27984157)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 27984158)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 27984359)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 27984361)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 27984360)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 27984092)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 27984091)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 27984733)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 27984478)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 27984479)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 27984480)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 27984803)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 27984514)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 27984511)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 27984515)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 27984513)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 27984512)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 27984063)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 27984062)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 27983976)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 27984326)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 27983908)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 27983909)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 27984346)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 27984345)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 27984344)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 27984013)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 27984012)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 27984014)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 27984130)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 27984128)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 27984129)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 27983841)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 27984251)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 27984249)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 27984248)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 27984250)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 27983882)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 27983883)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 27984307)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 27984838)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 27984399)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 27984398)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 27984846)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 27984847)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 27984272)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 27984391)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 27984392)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 27984613)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 27984612)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 27984609)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 27984610)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 27984611)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 27984028)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 27984027)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 27984029)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 27984320)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 27984319)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 27984713)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 27984714)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 27984544)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 27984545)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 27984542)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 27984543)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 27984381)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 27984382)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 27984260)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 27984259)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 27984257)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 27984258)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 27984532)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 27984531)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 27984103)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 27984117)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 27984116)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 27984115)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 27984118)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 27984148)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 27984136)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 27984137)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 27984704)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 27984752)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 27984822)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 27984823)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 27983948)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 27983947)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 27983983)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 27983984)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 27984198)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 27984241)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 27984240)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 27984239)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 27984183)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 27984184)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 27984187)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 27984182)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 27984186)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 27984185)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 27984002)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 27983936)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 27983937)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 27984077)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 27984079)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 27984078)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 27984080)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 27984266)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 27984477)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 27984510)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 27984451)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 27984452)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 27983974)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 27983975)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 27984371)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 27983852)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 27984049)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 27984011)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 27983840)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 27984745)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 27984318)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 27984317)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 27984217)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 27984218)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 27984541)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 27984037)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 27984490)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 27984795)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 27984721)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 27984722)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 27984440)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 27984228)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 27983902)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2904 (class 2606 OID 27985018)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2905 (class 2606 OID 27985023)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2910 (class 2606 OID 27985048)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2908 (class 2606 OID 27985038)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2903 (class 2606 OID 27985013)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2907 (class 2606 OID 27985033)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2909 (class 2606 OID 27985043)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 27985028)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 27985218)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 27985223)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 27985228)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 27985393)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 27985388)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 27984903)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2882 (class 2606 OID 27984908)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 27985133)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 27985373)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 27985368)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2976 (class 2606 OID 27985378)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 27985363)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 27985358)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2926 (class 2606 OID 27985128)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 27985123)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 27985003)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2902 (class 2606 OID 27985008)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 27985173)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 27985183)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 27985178)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2892 (class 2606 OID 27984958)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 27984953)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 27985113)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 27985348)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2947 (class 2606 OID 27985233)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 27985238)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 27985243)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 27985383)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 27985263)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 27985248)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2954 (class 2606 OID 27985268)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 27985258)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2951 (class 2606 OID 27985253)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2890 (class 2606 OID 27984948)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 27984943)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2878 (class 2606 OID 27984888)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 27984883)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 27985153)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 27984863)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2874 (class 2606 OID 27984868)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 27985168)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 27985163)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2932 (class 2606 OID 27985158)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 27984918)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2883 (class 2606 OID 27984913)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 27984923)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 27984983)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 27984973)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 27984978)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 27984848)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2918 (class 2606 OID 27985088)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 27985078)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2915 (class 2606 OID 27985073)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2917 (class 2606 OID 27985083)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 27984853)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 27984858)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 27985138)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 27985408)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2943 (class 2606 OID 27985213)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 27985208)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 27985413)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2984 (class 2606 OID 27985418)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 27985118)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 27985198)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2941 (class 2606 OID 27985203)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 27985323)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 27985318)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 27985303)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2962 (class 2606 OID 27985308)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 27985313)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 27984933)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 27984928)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 27984938)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 27985148)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 27985143)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 27985333)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2968 (class 2606 OID 27985338)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2959 (class 2606 OID 27985293)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2960 (class 2606 OID 27985298)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2957 (class 2606 OID 27985283)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 27985288)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 27985188)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 27985193)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 27985108)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2921 (class 2606 OID 27985103)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2919 (class 2606 OID 27985093)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 27985098)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2956 (class 2606 OID 27985278)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 27985273)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 27984963)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 27984968)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 27984998)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 27984988)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2899 (class 2606 OID 27984993)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 27985328)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 27985343)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 27985353)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 27985398)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2981 (class 2606 OID 27985403)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2876 (class 2606 OID 27984878)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 27984873)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 27984893)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2880 (class 2606 OID 27984898)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 27985053)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 27985068)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 27985063)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2912 (class 2606 OID 27985058)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-18 09:36:34 CET

--
-- PostgreSQL database dump complete
--

