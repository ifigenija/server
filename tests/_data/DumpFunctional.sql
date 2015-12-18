--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-18 13:00:59 CET

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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32848493)
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
-- TOC entry 237 (class 1259 OID 32849108)
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
-- TOC entry 236 (class 1259 OID 32849091)
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
-- TOC entry 182 (class 1259 OID 32848486)
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
-- TOC entry 181 (class 1259 OID 32848484)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 32848968)
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
-- TOC entry 230 (class 1259 OID 32848998)
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
-- TOC entry 251 (class 1259 OID 32849411)
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
-- TOC entry 203 (class 1259 OID 32848741)
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
-- TOC entry 205 (class 1259 OID 32848773)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32848778)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32849333)
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
-- TOC entry 194 (class 1259 OID 32848638)
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
-- TOC entry 238 (class 1259 OID 32849121)
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
-- TOC entry 223 (class 1259 OID 32848921)
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
-- TOC entry 200 (class 1259 OID 32848712)
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
-- TOC entry 197 (class 1259 OID 32848678)
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
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 32848655)
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
-- TOC entry 212 (class 1259 OID 32848835)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32849391)
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
-- TOC entry 250 (class 1259 OID 32849404)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32849426)
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
-- TOC entry 170 (class 1259 OID 32822013)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32848860)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32848612)
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
-- TOC entry 185 (class 1259 OID 32848512)
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
-- TOC entry 189 (class 1259 OID 32848579)
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
-- TOC entry 186 (class 1259 OID 32848523)
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
-- TOC entry 178 (class 1259 OID 32848458)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32848477)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32848867)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32848901)
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
-- TOC entry 233 (class 1259 OID 32849039)
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
-- TOC entry 188 (class 1259 OID 32848559)
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
-- TOC entry 191 (class 1259 OID 32848604)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32849277)
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
-- TOC entry 213 (class 1259 OID 32848841)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32848589)
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
-- TOC entry 202 (class 1259 OID 32848733)
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
-- TOC entry 198 (class 1259 OID 32848693)
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
-- TOC entry 199 (class 1259 OID 32848705)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32848853)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32849291)
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
-- TOC entry 242 (class 1259 OID 32849301)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32849190)
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
-- TOC entry 243 (class 1259 OID 32849309)
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
-- TOC entry 219 (class 1259 OID 32848882)
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
-- TOC entry 211 (class 1259 OID 32848826)
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
-- TOC entry 210 (class 1259 OID 32848816)
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
-- TOC entry 232 (class 1259 OID 32849028)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32848958)
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
-- TOC entry 196 (class 1259 OID 32848667)
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
-- TOC entry 175 (class 1259 OID 32848429)
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
-- TOC entry 174 (class 1259 OID 32848427)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 32848895)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32848467)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32848451)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32848909)
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
-- TOC entry 214 (class 1259 OID 32848847)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32848793)
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
-- TOC entry 173 (class 1259 OID 32848416)
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
-- TOC entry 172 (class 1259 OID 32848408)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32848403)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32848975)
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
-- TOC entry 187 (class 1259 OID 32848551)
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
-- TOC entry 209 (class 1259 OID 32848803)
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
-- TOC entry 231 (class 1259 OID 32849016)
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
-- TOC entry 184 (class 1259 OID 32848502)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32849321)
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
-- TOC entry 207 (class 1259 OID 32848783)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32848624)
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
-- TOC entry 176 (class 1259 OID 32848438)
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
-- TOC entry 235 (class 1259 OID 32849066)
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
-- TOC entry 201 (class 1259 OID 32848723)
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
-- TOC entry 218 (class 1259 OID 32848874)
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
-- TOC entry 229 (class 1259 OID 32848989)
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
-- TOC entry 247 (class 1259 OID 32849371)
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
-- TOC entry 246 (class 1259 OID 32849340)
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
-- TOC entry 248 (class 1259 OID 32849383)
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
-- TOC entry 225 (class 1259 OID 32848947)
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
-- TOC entry 204 (class 1259 OID 32848767)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32849056)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32848937)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32848489)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32848432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32848493)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5673-f578-3ef3-868cf693fae7	10	30	Otroci	Abonma za otroke	200
000a0000-5673-f578-d383-58fa69933ec0	20	60	Mladina	Abonma za mladino	400
000a0000-5673-f578-44c6-af08534dc9f8	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32849108)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5673-f578-9419-8c50944edf20	000d0000-5673-f578-cd54-ed6f5f3c6f5d	\N	00090000-5673-f578-72ce-19cebd79ca60	000b0000-5673-f578-63a3-295abb13e53b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5673-f578-d029-9ab3cd12b4d2	000d0000-5673-f578-64c1-04710bb45e9c	00100000-5673-f578-4dbb-a2274527ee86	00090000-5673-f578-511e-418edb6bf67b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5673-f578-f77b-72583fb86e64	000d0000-5673-f578-c37c-0b8842980ac3	00100000-5673-f578-883d-326eba2628cf	00090000-5673-f578-d4d1-feebf20b25e1	\N	0003	t	\N	2015-12-18	\N	2	t	\N	f	f
000c0000-5673-f578-6c7a-dd4c2679cf38	000d0000-5673-f578-836e-797fe75326ec	\N	00090000-5673-f578-45c1-7543c2489701	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5673-f578-180d-bb6af1c64149	000d0000-5673-f578-bf76-b7a1ba7ff671	\N	00090000-5673-f578-1af9-9c74fa87bd1c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5673-f578-5fd5-a3c422a139e5	000d0000-5673-f578-d2fa-e12536d546b6	\N	00090000-5673-f578-f4f3-6f78ed2a3cf8	000b0000-5673-f578-ae40-8bcce7f12de5	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5673-f578-d2d4-d50b74436e4f	000d0000-5673-f578-d5ad-eec22bd5fd5d	00100000-5673-f578-71d8-45e8585f573a	00090000-5673-f578-d533-1bb2d6f9d8ab	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5673-f578-bcd4-59115fe76b68	000d0000-5673-f578-93c9-837fe446c365	\N	00090000-5673-f578-523a-62735c3a0402	000b0000-5673-f578-d02b-e1f483572362	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5673-f578-b726-6a23ea158da0	000d0000-5673-f578-d5ad-eec22bd5fd5d	00100000-5673-f578-4dfb-50bed105b3fb	00090000-5673-f578-6dc2-a231819bc640	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5673-f578-d9a8-3a84a380e533	000d0000-5673-f578-d5ad-eec22bd5fd5d	00100000-5673-f578-a3d7-8de93d922178	00090000-5673-f578-891f-02148a7cf733	\N	0010	t	\N	2015-12-18	\N	16	f	\N	f	t
000c0000-5673-f578-3ab8-b839cdbbe691	000d0000-5673-f578-d5ad-eec22bd5fd5d	00100000-5673-f578-7370-f3d7d5b66b65	00090000-5673-f578-5e84-0ed03281839c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5673-f578-98d6-bfc73aec8dc5	000d0000-5673-f578-a5ba-c277809a00f4	00100000-5673-f578-4dbb-a2274527ee86	00090000-5673-f578-511e-418edb6bf67b	000b0000-5673-f578-b64f-2301689c138a	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32849091)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32848486)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 32848968)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5673-f578-0813-d059a24c9f77	00160000-5673-f577-9562-0248a4c4e86d	00090000-5673-f578-d75c-4d308bc3fbdd	aizv	10	t
003d0000-5673-f578-0628-ab53c70946d2	00160000-5673-f577-9562-0248a4c4e86d	00090000-5673-f578-80f3-d7da98b386e0	apri	14	t
003d0000-5673-f578-bcf3-5bc3dd5efcb1	00160000-5673-f577-7f3a-c75f6a0be2d6	00090000-5673-f578-9ed2-0a9527c78329	aizv	11	t
003d0000-5673-f578-fa4b-d154fd771c6b	00160000-5673-f577-ca5c-c579aa73a717	00090000-5673-f578-e15f-0cea0f37ad2c	aizv	12	t
003d0000-5673-f578-6e22-a807d4b5253a	00160000-5673-f577-9562-0248a4c4e86d	00090000-5673-f578-1b53-85475ad74f02	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32848998)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5673-f577-9562-0248a4c4e86d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5673-f577-7f3a-c75f6a0be2d6	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5673-f577-ca5c-c579aa73a717	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32849411)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32848741)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5673-f578-1f3e-a224a49f2f2f	\N	\N	00200000-5673-f578-d2e8-3fc4b444e76b	\N	\N	\N	00220000-5673-f577-42c7-50ce5bee285f	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5673-f578-4e89-6ac90f8ae85f	\N	\N	00200000-5673-f578-4592-c98c024080d5	\N	\N	\N	00220000-5673-f577-42c7-50ce5bee285f	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5673-f578-7163-70b0f0e3164e	\N	\N	00200000-5673-f578-b864-6b1ea2074a82	\N	\N	\N	00220000-5673-f577-0221-63685f182726	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5673-f578-cb0a-16e66cfeca61	\N	\N	00200000-5673-f578-6f5c-77aaa1665cb9	\N	\N	\N	00220000-5673-f577-4a1c-4bb46a95d76b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5673-f578-a54c-324181ee5740	\N	\N	00200000-5673-f578-869f-53b01dac1bd4	\N	\N	\N	00220000-5673-f577-0daf-7b7323d949cc	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32848773)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32848778)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32849333)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32848638)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5673-f575-66a6-c8a23924a4f7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5673-f575-f9d8-126a934d8d3c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5673-f575-3523-5799996c4301	AL	ALB	008	Albania 	Albanija	\N
00040000-5673-f575-8ee5-617b58c6eaae	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5673-f575-9f57-331a1e0ebe6d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5673-f575-5cb4-05ac2b70e443	AD	AND	020	Andorra 	Andora	\N
00040000-5673-f575-62ba-e7825b77ab68	AO	AGO	024	Angola 	Angola	\N
00040000-5673-f575-a575-4ba708333204	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5673-f575-7606-21469c233efa	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5673-f575-d002-99fc101bb1ab	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5673-f575-99a9-bca4b9d86936	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5673-f575-4bc2-2975b600d2cd	AM	ARM	051	Armenia 	Armenija	\N
00040000-5673-f575-d12b-60feb48b1072	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5673-f575-a8e6-508b9e4cddd7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5673-f575-1c64-85bb5011de86	AT	AUT	040	Austria 	Avstrija	\N
00040000-5673-f575-c81d-4fbf70677ca8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5673-f575-eab2-1636f44f698d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5673-f575-b063-0cccccdcb812	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5673-f575-d7b0-ce53b95175c1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5673-f575-179b-f6b48a4a3b20	BB	BRB	052	Barbados 	Barbados	\N
00040000-5673-f575-05d9-473c2f7b904a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5673-f575-2949-58507c439993	BE	BEL	056	Belgium 	Belgija	\N
00040000-5673-f575-9a3e-f2711a9c2102	BZ	BLZ	084	Belize 	Belize	\N
00040000-5673-f575-e769-cb730ed33888	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5673-f575-1fce-031eb980cec0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5673-f575-f3be-1525a6ad5e1c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5673-f575-3381-31fed3f9617d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5673-f575-8ab9-6985a7c0f0b2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5673-f575-d09c-35f148caa060	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5673-f575-b5b3-6c44cb6b83a9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5673-f575-285f-0aa59d6aee44	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5673-f575-f9f6-53add6d30bd8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5673-f575-ffbf-f5ca4b525fda	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5673-f575-4a15-598cb1beca63	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5673-f575-717a-0909ad87d3c9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5673-f575-a854-cba57e61876f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5673-f575-f78f-d9b4d5341445	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5673-f575-1d46-3f732bb01b31	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5673-f575-4c0c-e1340226d95b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5673-f575-a08e-af2dde5202c8	CA	CAN	124	Canada 	Kanada	\N
00040000-5673-f575-3a00-c936cc6f7b1e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5673-f575-23ee-d188acf1e190	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5673-f575-ecbd-9f0bc0485314	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5673-f575-c849-c71e56d7dc1b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5673-f575-f419-457622273588	CL	CHL	152	Chile 	Čile	\N
00040000-5673-f575-f3f4-627234d46f65	CN	CHN	156	China 	Kitajska	\N
00040000-5673-f575-22bf-1d5a593e655c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5673-f575-0c47-864aba7c1e98	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5673-f575-1367-dace0c053ef2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5673-f575-8f77-145d04071a4c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5673-f575-39f1-7d075c7170a2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5673-f575-998c-1b003841fba0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5673-f575-a7ee-2437239e20d6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5673-f575-33e1-7735d66a95c4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5673-f575-2e45-9c7726f34193	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5673-f575-4a0d-5e713870422b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5673-f575-ff9b-1fd61805b0e3	CU	CUB	192	Cuba 	Kuba	\N
00040000-5673-f575-a58d-01eafc330d29	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5673-f575-e229-2337c742cfd6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5673-f575-be71-3e96269bb91f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5673-f575-23de-00885b5e6bae	DK	DNK	208	Denmark 	Danska	\N
00040000-5673-f575-7868-d0c6a3281316	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5673-f575-4af1-83404973de5a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5673-f575-7542-4ac40f228e5a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5673-f575-f3df-f05eacd7d9f8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5673-f575-62f2-8f4e8550d636	EG	EGY	818	Egypt 	Egipt	\N
00040000-5673-f575-4b93-f4cd8728c31a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5673-f575-1fcf-68fef65dc892	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5673-f575-0c97-14be9ed31d71	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5673-f575-af6d-5d8bec0eba0b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5673-f575-f711-95398496654a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5673-f575-eb00-783bfb9247a7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5673-f575-3f3c-918c0ebe43ba	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5673-f575-47df-36841d49ccb2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5673-f575-5f24-913f1fee1e41	FI	FIN	246	Finland 	Finska	\N
00040000-5673-f575-2c7f-bd5cddb73e0f	FR	FRA	250	France 	Francija	\N
00040000-5673-f575-fdd9-faae95451e69	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5673-f575-97a7-b45c3c4c4732	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5673-f575-cd4f-d063ae8545ff	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5673-f575-aea3-f2b24ce04b7d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5673-f575-2c2b-69f5ef412192	GA	GAB	266	Gabon 	Gabon	\N
00040000-5673-f575-209a-c176dcd09f57	GM	GMB	270	Gambia 	Gambija	\N
00040000-5673-f575-f483-86704978006f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5673-f575-dd92-099b407048e0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5673-f575-9bb3-adfa4793654e	GH	GHA	288	Ghana 	Gana	\N
00040000-5673-f575-c88e-e3ecda93a7ec	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5673-f575-f8e1-4dca4a0830b8	GR	GRC	300	Greece 	Grčija	\N
00040000-5673-f575-31b3-877498dd8b35	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5673-f575-0e67-c8c71ab54509	GD	GRD	308	Grenada 	Grenada	\N
00040000-5673-f575-640b-7b098b88ebf0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5673-f575-a492-18ced680e8f2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5673-f575-5a1d-3f1d100fa44d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5673-f575-381b-1e7ef55a39aa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5673-f575-00a2-2ce2f3ff3422	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5673-f575-b0f5-5c9cd3c92d27	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5673-f575-3a7a-f0b455e76dda	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5673-f575-a222-b5da06c706f1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5673-f575-1620-6dcf8673e5ce	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5673-f575-1b89-c7c15a45ee41	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5673-f575-d838-f99d0088d2a4	HN	HND	340	Honduras 	Honduras	\N
00040000-5673-f575-7fc7-76634aae4c42	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5673-f575-9c35-0f3d9bff3d71	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5673-f575-b48a-616c37575886	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5673-f575-26cc-808bbd172360	IN	IND	356	India 	Indija	\N
00040000-5673-f575-9240-1b73d2bf3b16	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5673-f575-9b29-36b302166083	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5673-f575-feff-ba71acb8f13f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5673-f575-0297-4827fdafdf58	IE	IRL	372	Ireland 	Irska	\N
00040000-5673-f575-6342-4c7b3034ed29	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5673-f575-9831-9e573ed8ba2f	IL	ISR	376	Israel 	Izrael	\N
00040000-5673-f575-92f9-6423b6bce41e	IT	ITA	380	Italy 	Italija	\N
00040000-5673-f575-91ab-42a93c338dae	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5673-f575-5d50-0543f97d1e5f	JP	JPN	392	Japan 	Japonska	\N
00040000-5673-f575-5ded-904859d0e3bf	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5673-f575-4dce-cb2cfd121d64	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5673-f575-d54e-cc24a0a53328	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5673-f575-7439-14bdffde3123	KE	KEN	404	Kenya 	Kenija	\N
00040000-5673-f575-1db3-408cb6e3dbdb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5673-f575-1b41-ef08a7d9aa0e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5673-f575-06e3-e4098e39004d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5673-f575-8356-5382f05c5f71	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5673-f575-f7cf-a7793529ab24	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5673-f575-3c40-ae63a97cb6d7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5673-f575-d11a-b8ca91d787fd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5673-f575-fea7-bfc28f4dbe28	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5673-f575-2f2a-0a52bc8bfaa1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5673-f575-3776-8a398caa834b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5673-f575-9b53-6dfe09473731	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5673-f575-f767-7504a4453242	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5673-f575-f27e-e2661eb869c2	LT	LTU	440	Lithuania 	Litva	\N
00040000-5673-f575-0f1f-f1b2d2be2351	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5673-f575-e938-20d65b055bbc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5673-f575-2577-dfaea67ae3e0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5673-f575-232e-1455754c9dc0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5673-f575-9c54-29b43d6ac843	MW	MWI	454	Malawi 	Malavi	\N
00040000-5673-f575-b2ad-db050410459c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5673-f575-183e-f6dad909f414	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5673-f575-84e0-6e4ef48aa3c7	ML	MLI	466	Mali 	Mali	\N
00040000-5673-f575-da8b-bb0412a4a5fe	MT	MLT	470	Malta 	Malta	\N
00040000-5673-f575-2a6b-decc2190c029	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5673-f575-4637-05866c5f446c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5673-f575-64bb-bbc5420c4653	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5673-f575-9c5c-5e29df5bfd61	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5673-f575-a44f-b4b91237b8d9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5673-f575-d1d4-334f04f95047	MX	MEX	484	Mexico 	Mehika	\N
00040000-5673-f575-1bfc-c7835ef3e5cb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5673-f575-dead-b6b4b831e4d5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5673-f575-c8cb-d03e9fce52c6	MC	MCO	492	Monaco 	Monako	\N
00040000-5673-f575-43d2-70126f4bf96d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5673-f575-87d7-c8274465c333	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5673-f575-fb37-135ed3648fa4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5673-f575-1d61-402541662b9e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5673-f575-7eba-1f55757b6afe	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5673-f575-4e94-bb36871f7471	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5673-f575-3705-e50fc2fd9237	NA	NAM	516	Namibia 	Namibija	\N
00040000-5673-f575-2c26-a2ff58cd1eca	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5673-f575-fbcc-316f9ea7c479	NP	NPL	524	Nepal 	Nepal	\N
00040000-5673-f575-3ff2-d30be760a4b4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5673-f575-6a47-7bfa742b27c7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5673-f575-bdca-2499878887f8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5673-f575-c7e0-f7be7c2300e8	NE	NER	562	Niger 	Niger 	\N
00040000-5673-f575-7078-d07e16441620	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5673-f575-d364-1dbc107e7477	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5673-f575-70fb-19402d656332	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5673-f575-8db5-33567d91e980	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5673-f575-bcbd-f5c65042c93d	NO	NOR	578	Norway 	Norveška	\N
00040000-5673-f575-e506-b1c1fdacf198	OM	OMN	512	Oman 	Oman	\N
00040000-5673-f575-d44c-1126e4cb55bb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5673-f575-a120-1e6fc32844f2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5673-f575-2362-90f3755b6efc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5673-f575-1f28-fa0d9af1d1ce	PA	PAN	591	Panama 	Panama	\N
00040000-5673-f575-bd89-9ab123a48e9d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5673-f575-89f4-7971eeed9ca7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5673-f575-2b5b-93d6e3d18485	PE	PER	604	Peru 	Peru	\N
00040000-5673-f575-4151-f1eef9d590de	PH	PHL	608	Philippines 	Filipini	\N
00040000-5673-f575-a0ca-cc34e29cf319	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5673-f575-f5d9-e75d8e2c2e8f	PL	POL	616	Poland 	Poljska	\N
00040000-5673-f575-7ea0-8bb5329f965e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5673-f575-f8be-2d547e73df89	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5673-f575-d266-90c828f74bab	QA	QAT	634	Qatar 	Katar	\N
00040000-5673-f575-960e-f560bf871a8b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5673-f575-f9e9-e66e89dc4150	RO	ROU	642	Romania 	Romunija	\N
00040000-5673-f575-663f-b16c1b24de14	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5673-f575-c183-f93f715622e5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5673-f575-0492-29ddc73b82fd	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5673-f575-0ed8-2c734118bbc6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5673-f575-259a-9c4fc4116957	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5673-f575-98ab-6afa9b12c70a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5673-f575-ae00-07351ad5d5d2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5673-f575-e708-0be54da4f4d5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5673-f575-35eb-549db3881c21	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5673-f575-d469-46af20c3b57b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5673-f575-5101-e94414a312ff	SM	SMR	674	San Marino 	San Marino	\N
00040000-5673-f575-d6a2-b2ffd4fc3d2f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5673-f575-ac58-9e2f9fff85e6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5673-f575-785c-552ca91fc90b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5673-f575-f4ba-eda8924c24a1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5673-f575-1f3c-465f856baf91	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5673-f575-2abc-f5bece83351b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5673-f575-2368-286a785bee36	SG	SGP	702	Singapore 	Singapur	\N
00040000-5673-f575-cb38-e980ed69d417	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5673-f575-b66c-895950f14299	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5673-f575-d8c0-eb6bc5573627	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5673-f575-d349-e4118bc90206	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5673-f575-746c-04fad009d699	SO	SOM	706	Somalia 	Somalija	\N
00040000-5673-f575-2a63-b589872462a9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5673-f575-0f0d-0a8bdd562440	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5673-f575-b803-4b2f25f53d08	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5673-f575-a92d-ab1d7af6e82f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5673-f575-1123-6b6c1bf7c3e3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5673-f575-024d-0e74df2ab58c	SD	SDN	729	Sudan 	Sudan	\N
00040000-5673-f575-9ba2-423f9a95d169	SR	SUR	740	Suriname 	Surinam	\N
00040000-5673-f575-57ab-6e9f6936b949	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5673-f575-a0c5-b50adc063b21	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5673-f575-faf9-8de9bd4907d4	SE	SWE	752	Sweden 	Švedska	\N
00040000-5673-f575-2396-421e435c7991	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5673-f575-80ba-66233f8ae970	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5673-f575-dd65-31e4b851e2a9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5673-f575-bfbd-f4638bba0650	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5673-f575-9981-b06030a29622	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5673-f575-1ea2-30eac492887d	TH	THA	764	Thailand 	Tajska	\N
00040000-5673-f575-5385-83d5848286f2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5673-f575-d2ae-0783ba4d8453	TG	TGO	768	Togo 	Togo	\N
00040000-5673-f575-7fb7-3547ee76e495	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5673-f575-9076-bff338927f13	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5673-f575-7fde-5ceb4f39decc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5673-f575-905a-eb7cade34c4c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5673-f575-b6a4-fc84bacbd2bd	TR	TUR	792	Turkey 	Turčija	\N
00040000-5673-f575-3c64-8a4ccfafec20	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5673-f575-ac40-bee153122403	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5673-f575-efab-8884c4e64643	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5673-f575-e8c9-a545fb58bfd9	UG	UGA	800	Uganda 	Uganda	\N
00040000-5673-f575-aedf-d069f594599f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5673-f575-0f1d-35efefb012b5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5673-f575-5ae8-5065442d58d1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5673-f575-540a-06480ae8cb55	US	USA	840	United States 	Združene države Amerike	\N
00040000-5673-f575-fa56-3dea3aed44ae	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5673-f575-3dec-bf183ab67fbf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5673-f575-09de-0ea1d6a95eb7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5673-f575-c408-f2639fcee530	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5673-f575-c7b7-267ce8061236	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5673-f575-799f-1ac2d8ece855	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5673-f575-ca56-956d7a13a58b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5673-f575-06ae-5c8476b75be1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5673-f575-982b-2e823dcdd48a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5673-f575-a50b-9f554c471a41	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5673-f575-f832-73c0125b92a9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5673-f575-d220-9908b92ecc25	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5673-f575-b73a-ce449ddac0bc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32849121)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5673-f578-ff7b-ca354abaf239	000e0000-5673-f578-6345-70a8e68e9ca3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5673-f575-a870-9fea552215c2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5673-f578-6d99-7874141fff56	000e0000-5673-f578-8adb-e4ab41164a4a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5673-f575-96aa-9ad75bb18132	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5673-f578-d56c-17b46c19d89c	000e0000-5673-f578-3f22-8a55ec86fffa	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5673-f575-a870-9fea552215c2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5673-f578-6adf-2c9ca9c70e13	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5673-f578-00c1-275c7b4bbc44	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32848921)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5673-f578-cd54-ed6f5f3c6f5d	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-9419-8c50944edf20	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5673-f575-e5ab-2926b93832cb
000d0000-5673-f578-64c1-04710bb45e9c	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-d029-9ab3cd12b4d2	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5673-f575-70ec-5ffec945c11d
000d0000-5673-f578-c37c-0b8842980ac3	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-f77b-72583fb86e64	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5673-f575-2063-aec4198e16b5
000d0000-5673-f578-836e-797fe75326ec	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-6c7a-dd4c2679cf38	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5673-f575-09a5-0d357922325d
000d0000-5673-f578-bf76-b7a1ba7ff671	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-180d-bb6af1c64149	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5673-f575-09a5-0d357922325d
000d0000-5673-f578-d2fa-e12536d546b6	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-5fd5-a3c422a139e5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5673-f575-e5ab-2926b93832cb
000d0000-5673-f578-d5ad-eec22bd5fd5d	000e0000-5673-f578-8adb-e4ab41164a4a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5673-f575-e5ab-2926b93832cb
000d0000-5673-f578-93c9-837fe446c365	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-bcd4-59115fe76b68	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5673-f575-bf6d-23a9c04c3860
000d0000-5673-f578-a5ba-c277809a00f4	000e0000-5673-f578-8adb-e4ab41164a4a	000c0000-5673-f578-98d6-bfc73aec8dc5	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5673-f575-98ab-80e0de84aa8a
\.


--
-- TOC entry 3135 (class 0 OID 32848712)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32848678)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32848655)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5673-f578-4a22-d076165f0eed	00080000-5673-f578-441d-0d94e03857f6	00090000-5673-f578-891f-02148a7cf733	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32848835)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32849391)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5673-f578-c08a-cdef4ac2d8c9	00010000-5673-f576-084a-4fc2971e3079	\N	Prva mapa	Root mapa	2015-12-18 13:00:56	2015-12-18 13:00:56	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32849404)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32849426)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32822013)
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
\.


--
-- TOC entry 3151 (class 0 OID 32848860)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32848612)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5673-f576-9519-93689a7e69b2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5673-f576-dd2d-71775d98c8de	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5673-f576-ec2c-0484aeaf4d6d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5673-f576-d293-cb96132b0943	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5673-f576-cc1f-341871fe1a9b	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5673-f576-13f8-0a99ed169137	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5673-f576-110d-382e88cb458b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5673-f576-2362-7dcd51f49f20	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5673-f576-8d85-a21d3be2fe1d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5673-f576-06ec-4c6b47f5c821	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5673-f576-b46e-6f6947d43205	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5673-f576-9e63-8b170a6e94f5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5673-f576-62a8-1354544430d6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5673-f576-0932-e4b805249531	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5673-f577-85a7-404c29fa2e6f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5673-f577-24e2-ad204434d0a6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5673-f577-f79e-d0c747aab702	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5673-f577-ef24-73ff3e48ac9d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5673-f577-0a96-9ca968973326	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5673-f57a-3de2-ca176d299b38	application.tenant.maticnopodjetje	string	s:36:"00080000-5673-f57a-644b-f4a8d48ecc6a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32848512)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5673-f577-5b75-eae2cbbdba7d	00000000-5673-f577-85a7-404c29fa2e6f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5673-f577-9d56-52e55bb2b206	00000000-5673-f577-85a7-404c29fa2e6f	00010000-5673-f576-084a-4fc2971e3079	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5673-f577-e39d-40d0b93c9acb	00000000-5673-f577-24e2-ad204434d0a6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32848579)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5673-f578-6d66-fdae7de4e163	\N	00100000-5673-f578-4dbb-a2274527ee86	00100000-5673-f578-883d-326eba2628cf	01	Gledališče Nimbis
00410000-5673-f578-8055-f0879189ebbf	00410000-5673-f578-6d66-fdae7de4e163	00100000-5673-f578-4dbb-a2274527ee86	00100000-5673-f578-883d-326eba2628cf	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32848523)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5673-f578-72ce-19cebd79ca60	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5673-f578-45c1-7543c2489701	00010000-5673-f578-9e5e-c89639e45262	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5673-f578-d4d1-feebf20b25e1	00010000-5673-f578-9fdd-89a7ba31ab07	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5673-f578-6dc2-a231819bc640	00010000-5673-f578-7eba-d30c3e6abd4b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5673-f578-fe44-0b98b5da28ca	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5673-f578-f4f3-6f78ed2a3cf8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5673-f578-5e84-0ed03281839c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5673-f578-d533-1bb2d6f9d8ab	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5673-f578-891f-02148a7cf733	00010000-5673-f578-c813-57fedccaa407	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5673-f578-511e-418edb6bf67b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5673-f578-93fd-c313e9bcd602	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5673-f578-1af9-9c74fa87bd1c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5673-f578-523a-62735c3a0402	00010000-5673-f578-f127-8ba1bf2901e1	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5673-f578-d75c-4d308bc3fbdd	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5673-f578-80f3-d7da98b386e0	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5673-f578-9ed2-0a9527c78329	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5673-f578-e15f-0cea0f37ad2c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5673-f578-1b53-85475ad74f02	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5673-f578-784f-657da9d9ed56	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5673-f578-2e7f-f0a1d7d4cfcb	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5673-f578-25e7-1b0e97baab70	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32848458)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5673-f575-86ca-0d8a29192bfa	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5673-f575-8673-a788f752fb88	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5673-f575-40f5-5e32690f3e1f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5673-f575-a579-0b4879348c41	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5673-f575-8da6-512bbf5f1c6a	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5673-f575-415c-de71f425b9f6	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5673-f575-f5ea-17e5c5fff56c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5673-f575-8acc-c4cdc75d5ed4	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5673-f575-e7aa-f8959a2a3c9f	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5673-f575-c570-1fa3936ad6c9	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5673-f575-1a36-0a9dac11e491	Abonma-read	Abonma - branje	t
00030000-5673-f576-8fda-21c511ceb89f	Abonma-write	Abonma - spreminjanje	t
00030000-5673-f576-a638-118c2bbc5bc6	Alternacija-read	Alternacija - branje	t
00030000-5673-f576-d836-d3ab365caf68	Alternacija-write	Alternacija - spreminjanje	t
00030000-5673-f576-e361-5fc4fde11f57	Arhivalija-read	Arhivalija - branje	t
00030000-5673-f576-b897-fff25e778572	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5673-f576-86da-36ffdb1a2ee0	AuthStorage-read	AuthStorage - branje	t
00030000-5673-f576-f2b4-acdbd472f168	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5673-f576-7849-c8c56a2bed5b	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5673-f576-7183-389238b8157d	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5673-f576-7a25-145ed99c1c93	Besedilo-read	Besedilo - branje	t
00030000-5673-f576-c024-933beddfa548	Besedilo-write	Besedilo - spreminjanje	t
00030000-5673-f576-7b04-a4b92e52749f	Dogodek-read	Dogodek - branje	t
00030000-5673-f576-c73a-0ae4f4e47f51	Dogodek-write	Dogodek - spreminjanje	t
00030000-5673-f576-bf13-a83e80fe9036	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5673-f576-90c0-4794381bb69e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5673-f576-6a40-95b3e2dbb728	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5673-f576-52fb-64c642ef307c	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5673-f576-743e-7f755b91d8a2	DogodekTrait-read	DogodekTrait - branje	t
00030000-5673-f576-c475-65f4fa0a480f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5673-f576-3d03-9e80c29e3da3	DrugiVir-read	DrugiVir - branje	t
00030000-5673-f576-c5cf-7693df2e24a9	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5673-f576-9d4d-7dc1dae87b18	Drzava-read	Drzava - branje	t
00030000-5673-f576-9595-5cd5250d35d2	Drzava-write	Drzava - spreminjanje	t
00030000-5673-f576-4a20-39605b04ca52	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5673-f576-678f-418698921c78	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5673-f576-4364-f4411fd17045	Funkcija-read	Funkcija - branje	t
00030000-5673-f576-243c-84cab4b87c16	Funkcija-write	Funkcija - spreminjanje	t
00030000-5673-f576-f6d1-bbcf301ec9dd	Gostovanje-read	Gostovanje - branje	t
00030000-5673-f576-227b-f5a523053d36	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5673-f576-8f78-8d1820108ddb	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5673-f576-6548-3f0c615d3718	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5673-f576-e9ce-b27fa203cfd6	Kupec-read	Kupec - branje	t
00030000-5673-f576-a158-6c509cd263ff	Kupec-write	Kupec - spreminjanje	t
00030000-5673-f576-a167-696ab6aab9d7	NacinPlacina-read	NacinPlacina - branje	t
00030000-5673-f576-f644-d335a290af07	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5673-f576-b307-cf91128d2ab3	Option-read	Option - branje	t
00030000-5673-f576-d5d9-39665ca7a5c0	Option-write	Option - spreminjanje	t
00030000-5673-f576-8343-ab95b4c59388	OptionValue-read	OptionValue - branje	t
00030000-5673-f576-993a-c2394987f66d	OptionValue-write	OptionValue - spreminjanje	t
00030000-5673-f576-570d-b3caf8d5c9af	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5673-f576-bbd2-eda0534144d0	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5673-f576-e39d-7e312cd43bfe	Oseba-read	Oseba - branje	t
00030000-5673-f576-24c7-659cea68a2e4	Oseba-write	Oseba - spreminjanje	t
00030000-5673-f576-df0f-25ddf48e6960	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5673-f576-53bc-e7692b88ab22	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5673-f576-4444-70ae78c1ed82	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5673-f576-6434-33b6872849be	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5673-f576-2c2c-5604286c827d	Pogodba-read	Pogodba - branje	t
00030000-5673-f576-aad1-65355a3511e7	Pogodba-write	Pogodba - spreminjanje	t
00030000-5673-f576-0838-d8f3c13e5e6d	Popa-read	Popa - branje	t
00030000-5673-f576-cbdd-3be34367c659	Popa-write	Popa - spreminjanje	t
00030000-5673-f576-eb40-6dbd48048693	Posta-read	Posta - branje	t
00030000-5673-f576-68d0-c6c53f11247a	Posta-write	Posta - spreminjanje	t
00030000-5673-f576-1a23-5db3194b3c69	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5673-f576-0575-f1a624b565d8	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5673-f576-5d4b-c16f573e74a6	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5673-f576-76ee-58b157d62b33	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5673-f576-b53f-8a61b6ec16f2	PostniNaslov-read	PostniNaslov - branje	t
00030000-5673-f576-f150-8055301b0702	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5673-f576-d6ab-109873ae1d3e	Praznik-read	Praznik - branje	t
00030000-5673-f576-0ad0-399967d8d7e4	Praznik-write	Praznik - spreminjanje	t
00030000-5673-f576-7b45-35c83b7d0d2c	Predstava-read	Predstava - branje	t
00030000-5673-f576-3571-ef4cf2861d86	Predstava-write	Predstava - spreminjanje	t
00030000-5673-f576-9822-79ed1a6e2b17	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5673-f576-33eb-f5135a383490	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5673-f576-3e42-9b7bbaf654f3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5673-f576-5d23-8899d3257ec5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5673-f576-df5a-4d1ca1d84f61	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5673-f576-0979-10d95a767959	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5673-f576-4504-c2b791c1ba71	ProgramDela-read	ProgramDela - branje	t
00030000-5673-f576-aba7-74fd6ad4a8d7	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5673-f576-a493-d2e136c4787d	ProgramFestival-read	ProgramFestival - branje	t
00030000-5673-f576-f8bf-fec8371956a9	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5673-f576-454c-cc6ce3eef988	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5673-f576-1d24-dc5defc99fc9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5673-f576-e2ca-625f8fba7dce	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5673-f576-01a1-0aa67fd89200	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5673-f576-0605-01c265723688	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5673-f576-35ef-7480da6d5f20	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5673-f576-741d-c4f0705ad4de	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5673-f576-c3c4-ad8dc809e38a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5673-f576-220d-690532cdd864	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5673-f576-ad7c-5eb9631a9eec	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5673-f576-0e4a-20f0e7730e5a	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5673-f576-f77c-a96e95c8b955	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5673-f576-ef4a-5e0112429dac	ProgramRazno-read	ProgramRazno - branje	t
00030000-5673-f576-2d02-d81d8b7d8891	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5673-f576-39c3-7d6049dc77ea	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5673-f576-f742-91397a1047b9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5673-f576-808f-41430d6f9554	Prostor-read	Prostor - branje	t
00030000-5673-f576-59ce-2e2c498c60c1	Prostor-write	Prostor - spreminjanje	t
00030000-5673-f576-31a5-cd2157acd37e	Racun-read	Racun - branje	t
00030000-5673-f576-8b04-99fe3d24b3b2	Racun-write	Racun - spreminjanje	t
00030000-5673-f576-d3cf-f1f344ecc198	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5673-f576-f93a-41d45b8e5176	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5673-f576-ba5e-93d922666f5c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5673-f576-3c29-0745e68e5c2c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5673-f576-3205-13a12ee0ea46	Rekvizit-read	Rekvizit - branje	t
00030000-5673-f576-7730-9a105e49b7e1	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5673-f576-e466-e896983fc4dd	Revizija-read	Revizija - branje	t
00030000-5673-f576-f9d5-c19c8051201a	Revizija-write	Revizija - spreminjanje	t
00030000-5673-f576-4e72-24c9cfc93671	Rezervacija-read	Rezervacija - branje	t
00030000-5673-f576-56f9-18ca1c0b720e	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5673-f576-c28d-8836fd8e260e	SedezniRed-read	SedezniRed - branje	t
00030000-5673-f576-3f46-75e7bef69d6f	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5673-f576-6de3-0a6690b060c2	Sedez-read	Sedez - branje	t
00030000-5673-f576-d978-aa4dc33240a5	Sedez-write	Sedez - spreminjanje	t
00030000-5673-f576-d00c-e50685505192	Sezona-read	Sezona - branje	t
00030000-5673-f576-5eeb-4051d58c0366	Sezona-write	Sezona - spreminjanje	t
00030000-5673-f576-2395-8268f31dcfee	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5673-f576-09da-f8e5c914c9de	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5673-f576-6e43-3a729910c3ba	Telefonska-read	Telefonska - branje	t
00030000-5673-f576-4f75-93cd1bd08fff	Telefonska-write	Telefonska - spreminjanje	t
00030000-5673-f576-c4ac-3d5a55f173a7	TerminStoritve-read	TerminStoritve - branje	t
00030000-5673-f576-6f29-b3d77779b0f5	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5673-f576-50e7-f4057aa4094e	TipFunkcije-read	TipFunkcije - branje	t
00030000-5673-f576-f9ca-9863f6b899d2	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5673-f576-50fd-2cb816f17ae4	TipPopa-read	TipPopa - branje	t
00030000-5673-f576-ce1f-c86ad67031eb	TipPopa-write	TipPopa - spreminjanje	t
00030000-5673-f576-c0b9-c0123526e5ea	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5673-f576-9b1d-377913e57e10	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5673-f576-d74e-b15bbfcd7d01	TipVaje-read	TipVaje - branje	t
00030000-5673-f576-4976-f84db3527e57	TipVaje-write	TipVaje - spreminjanje	t
00030000-5673-f576-dc0e-6c35b2b7f35b	Trr-read	Trr - branje	t
00030000-5673-f576-a81b-64cc65f41bed	Trr-write	Trr - spreminjanje	t
00030000-5673-f576-64e6-b95de62ef075	Uprizoritev-read	Uprizoritev - branje	t
00030000-5673-f576-bcad-8437fd12d411	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5673-f576-864a-d76960f583e8	Vaja-read	Vaja - branje	t
00030000-5673-f576-e54e-23999ad78ede	Vaja-write	Vaja - spreminjanje	t
00030000-5673-f576-db3e-7636d5382979	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5673-f576-b923-b5d59af5ed36	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5673-f576-f99e-4a0bf02bcda8	VrstaStroska-read	VrstaStroska - branje	t
00030000-5673-f576-9a58-87ca27b726ad	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5673-f576-709d-8bed7091c3bc	Zaposlitev-read	Zaposlitev - branje	t
00030000-5673-f576-7083-c1cdf860bcd9	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5673-f576-e26c-934aba96d4ad	Zasedenost-read	Zasedenost - branje	t
00030000-5673-f576-62f2-d5fe29a07d12	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5673-f576-ff51-54a8f53487c5	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5673-f576-f86a-7b2162f3861c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5673-f576-4748-655d0dd0a78a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5673-f576-fa36-3b9b1892df5f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5673-f576-6ad9-2d50ddaa54a1	Job-read	Branje opravil - samo zase - branje	t
00030000-5673-f576-aa62-1cd20c1f27fe	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5673-f576-3e39-af17a8a5ff3e	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5673-f576-0738-7658204755a1	Report-read	Report - branje	t
00030000-5673-f576-79f1-9cd2d4fc09a7	Report-write	Report - spreminjanje	t
00030000-5673-f576-0098-1fb694e96d74	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5673-f576-b682-94c25f5300c5	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5673-f576-abc9-cb19ed27f4a1	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5673-f576-e6c1-fde74a0b3241	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5673-f576-f9ad-af1b10198400	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5673-f576-099c-a78a6f056313	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5673-f576-8f64-a697c9a3ca17	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5673-f576-7ca4-21de37a166db	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5673-f576-09ac-754af4bd986c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5673-f576-9247-46c62d598dfc	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5673-f576-60ba-cbe231ac64bd	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5673-f576-1244-8ca42324e5ab	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5673-f576-6247-7fa9b6724fa8	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5673-f576-dec9-f20142985d61	Datoteka-write	Datoteka - spreminjanje	t
00030000-5673-f576-5b13-f114dd3867bd	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32848477)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5673-f576-1e03-f344b0fd38d2	00030000-5673-f575-8673-a788f752fb88
00020000-5673-f576-1e03-f344b0fd38d2	00030000-5673-f575-86ca-0d8a29192bfa
00020000-5673-f576-b94f-9653f04c7ee9	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-7183-389238b8157d
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-c024-933beddfa548
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-8259-05031320d391	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-4740-823e558fea39	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-4740-823e558fea39	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-4740-823e558fea39	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-4740-823e558fea39	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-4740-823e558fea39	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-4740-823e558fea39	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f576-7083-c1cdf860bcd9
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-c90d-f71f3bf8bb2b	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-0114-05ce431f70e4	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-0114-05ce431f70e4	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-0114-05ce431f70e4	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-509f-37786dc8b930	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-0584-67d6370a1a7b	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-0584-67d6370a1a7b	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-0584-67d6370a1a7b	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-0584-67d6370a1a7b	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-f150-8055301b0702
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-e3b6-16e3453ec0c0	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-21d7-9d1c358c7fcc	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-f150-8055301b0702
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-cbdd-3be34367c659
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-6548-3f0c615d3718
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-0979-10d95a767959
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-0f54-8f6490c5c8b7	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-79aa-36cdffabcde2	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-9fca-d2c33bfa6cb0	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-9fca-d2c33bfa6cb0	00030000-5673-f576-ce1f-c86ad67031eb
00020000-5673-f576-048e-42c7c835cea1	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-a0c3-1d9c7921f1ba	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-a0c3-1d9c7921f1ba	00030000-5673-f576-68d0-c6c53f11247a
00020000-5673-f576-d660-ba5bf691abe7	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-99a2-d7a4377421f6	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-99a2-d7a4377421f6	00030000-5673-f576-9595-5cd5250d35d2
00020000-5673-f576-c13e-98971906103b	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-f215-0a0b90233204	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-f215-0a0b90233204	00030000-5673-f576-fa36-3b9b1892df5f
00020000-5673-f576-8130-478292856b38	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-fb91-1dd78906b65c	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-fb91-1dd78906b65c	00030000-5673-f576-f86a-7b2162f3861c
00020000-5673-f576-14e2-0a797ba844af	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-8d42-8d32e0bad183	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-8d42-8d32e0bad183	00030000-5673-f576-8fda-21c511ceb89f
00020000-5673-f576-d1ea-f0d46ef21700	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-dc28-61cd24ad7184	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-dc28-61cd24ad7184	00030000-5673-f576-59ce-2e2c498c60c1
00020000-5673-f576-dc28-61cd24ad7184	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-dc28-61cd24ad7184	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-dc28-61cd24ad7184	00030000-5673-f576-f150-8055301b0702
00020000-5673-f576-dc28-61cd24ad7184	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-2b0a-147b4e1c3083	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-2b0a-147b4e1c3083	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-2b0a-147b4e1c3083	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-9a20-0dcb69a4418f	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-9a20-0dcb69a4418f	00030000-5673-f576-9a58-87ca27b726ad
00020000-5673-f576-7a2c-ee3be9a13083	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-bbd2-eda0534144d0
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-bd89-8d4f25d04f2f	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-071c-5b34c9797a0e	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-071c-5b34c9797a0e	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-071c-5b34c9797a0e	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-071c-5b34c9797a0e	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-071c-5b34c9797a0e	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-64d2-a292e35c508f	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-64d2-a292e35c508f	00030000-5673-f576-4976-f84db3527e57
00020000-5673-f576-1b92-cc66f0d7decc	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f575-f5ea-17e5c5fff56c
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f575-8acc-c4cdc75d5ed4
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-4504-c2b791c1ba71
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-aba7-74fd6ad4a8d7
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-a493-d2e136c4787d
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-f8bf-fec8371956a9
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-454c-cc6ce3eef988
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-1d24-dc5defc99fc9
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-e2ca-625f8fba7dce
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-01a1-0aa67fd89200
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-0605-01c265723688
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-35ef-7480da6d5f20
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-741d-c4f0705ad4de
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-c3c4-ad8dc809e38a
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-220d-690532cdd864
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-ad7c-5eb9631a9eec
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-0e4a-20f0e7730e5a
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-f77c-a96e95c8b955
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-ef4a-5e0112429dac
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-2d02-d81d8b7d8891
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-39c3-7d6049dc77ea
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-f742-91397a1047b9
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-5d23-8899d3257ec5
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-c5cf-7693df2e24a9
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-0575-f1a624b565d8
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-aa62-1cd20c1f27fe
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-3d03-9e80c29e3da3
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-3e42-9b7bbaf654f3
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-1a23-5db3194b3c69
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-6ad9-2d50ddaa54a1
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-bdc3-5739f6099fea	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-4504-c2b791c1ba71
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-a493-d2e136c4787d
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-454c-cc6ce3eef988
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-e2ca-625f8fba7dce
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-0605-01c265723688
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-741d-c4f0705ad4de
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-220d-690532cdd864
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-0e4a-20f0e7730e5a
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-ef4a-5e0112429dac
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-39c3-7d6049dc77ea
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-3e42-9b7bbaf654f3
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-3d03-9e80c29e3da3
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-1a23-5db3194b3c69
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-6ad9-2d50ddaa54a1
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-f125-3dc4f372947b	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f575-c570-1fa3936ad6c9
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-2619-520a31b257b2	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-2229-091381a384e4	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-7795-80d8a326890c	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-aad1-65355a3511e7
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-286a-e37f67ff5a86	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-4df2-1627dd5c4286	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-cb37-5efc6222f451	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-a4e0-62d6322e20f1	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-a4e0-62d6322e20f1	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f576-a4e0-62d6322e20f1	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-a4e0-62d6322e20f1	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-f210-b6f220200b4e	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-f210-b6f220200b4e	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-7183-389238b8157d
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-c024-933beddfa548
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-3d03-9e80c29e3da3
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-c5cf-7693df2e24a9
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-c570-1fa3936ad6c9
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-6ad9-2d50ddaa54a1
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-aa62-1cd20c1f27fe
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-aad1-65355a3511e7
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-1a23-5db3194b3c69
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-0575-f1a624b565d8
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-3e42-9b7bbaf654f3
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-5d23-8899d3257ec5
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-f5ea-17e5c5fff56c
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-4504-c2b791c1ba71
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f575-8acc-c4cdc75d5ed4
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-aba7-74fd6ad4a8d7
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-a493-d2e136c4787d
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-f8bf-fec8371956a9
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-454c-cc6ce3eef988
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-1d24-dc5defc99fc9
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-e2ca-625f8fba7dce
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-01a1-0aa67fd89200
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-0605-01c265723688
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-35ef-7480da6d5f20
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-741d-c4f0705ad4de
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-c3c4-ad8dc809e38a
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-220d-690532cdd864
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-ad7c-5eb9631a9eec
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-0e4a-20f0e7730e5a
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-f77c-a96e95c8b955
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-ef4a-5e0112429dac
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-2d02-d81d8b7d8891
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-39c3-7d6049dc77ea
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-f742-91397a1047b9
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-b053-826919ef69f8	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-7183-389238b8157d
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-c024-933beddfa548
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-3180-129a03aade3c	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-a237-973831bbb555	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-a237-973831bbb555	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-7183-389238b8157d
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-c024-933beddfa548
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-a237-973831bbb555	00030000-5673-f575-c570-1fa3936ad6c9
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-a237-973831bbb555	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-a237-973831bbb555	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-7183-389238b8157d
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-c024-933beddfa548
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-3d03-9e80c29e3da3
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-c5cf-7693df2e24a9
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f575-c570-1fa3936ad6c9
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-6ad9-2d50ddaa54a1
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-aa62-1cd20c1f27fe
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-6548-3f0c615d3718
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-aad1-65355a3511e7
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-cbdd-3be34367c659
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-1a23-5db3194b3c69
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-0575-f1a624b565d8
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-f150-8055301b0702
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-3e42-9b7bbaf654f3
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-5d23-8899d3257ec5
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-0979-10d95a767959
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f575-f5ea-17e5c5fff56c
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-4504-c2b791c1ba71
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f575-8acc-c4cdc75d5ed4
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-aba7-74fd6ad4a8d7
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-a493-d2e136c4787d
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-f8bf-fec8371956a9
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-454c-cc6ce3eef988
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-1d24-dc5defc99fc9
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-e2ca-625f8fba7dce
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-01a1-0aa67fd89200
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-0605-01c265723688
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-35ef-7480da6d5f20
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-741d-c4f0705ad4de
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-c3c4-ad8dc809e38a
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-220d-690532cdd864
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-ad7c-5eb9631a9eec
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-0e4a-20f0e7730e5a
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-f77c-a96e95c8b955
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-ef4a-5e0112429dac
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-2d02-d81d8b7d8891
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-39c3-7d6049dc77ea
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-f742-91397a1047b9
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-7083-c1cdf860bcd9
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-2092-388ae947ba1a	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-7183-389238b8157d
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-c024-933beddfa548
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f575-c570-1fa3936ad6c9
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-6548-3f0c615d3718
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-cbdd-3be34367c659
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-f150-8055301b0702
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-0979-10d95a767959
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-7083-c1cdf860bcd9
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-94c1-cd90284a9e3f	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-6864-c929286bcc99	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-3d03-9e80c29e3da3
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-c5cf-7693df2e24a9
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-6ad9-2d50ddaa54a1
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-aa62-1cd20c1f27fe
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-6548-3f0c615d3718
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-bbd2-eda0534144d0
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-aad1-65355a3511e7
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-cbdd-3be34367c659
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-1a23-5db3194b3c69
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-0575-f1a624b565d8
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-f150-8055301b0702
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-3e42-9b7bbaf654f3
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-5d23-8899d3257ec5
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-0979-10d95a767959
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f575-f5ea-17e5c5fff56c
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-4504-c2b791c1ba71
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f575-8acc-c4cdc75d5ed4
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-aba7-74fd6ad4a8d7
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-a493-d2e136c4787d
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-f8bf-fec8371956a9
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-454c-cc6ce3eef988
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-1d24-dc5defc99fc9
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-e2ca-625f8fba7dce
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-01a1-0aa67fd89200
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-0605-01c265723688
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-35ef-7480da6d5f20
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-741d-c4f0705ad4de
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-c3c4-ad8dc809e38a
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-220d-690532cdd864
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-ad7c-5eb9631a9eec
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-0e4a-20f0e7730e5a
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-f77c-a96e95c8b955
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-ef4a-5e0112429dac
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-2d02-d81d8b7d8891
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-39c3-7d6049dc77ea
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-f742-91397a1047b9
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-9a58-87ca27b726ad
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-7083-c1cdf860bcd9
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f576-83dc-de8977d3a316	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-86ca-0d8a29192bfa
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-8673-a788f752fb88
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-1a36-0a9dac11e491
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-8fda-21c511ceb89f
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e361-5fc4fde11f57
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-b897-fff25e778572
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-86da-36ffdb1a2ee0
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f2b4-acdbd472f168
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7849-c8c56a2bed5b
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7183-389238b8157d
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7a25-145ed99c1c93
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c024-933beddfa548
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7b04-a4b92e52749f
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-a579-0b4879348c41
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-bf13-a83e80fe9036
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-90c0-4794381bb69e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6a40-95b3e2dbb728
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-52fb-64c642ef307c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-743e-7f755b91d8a2
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c475-65f4fa0a480f
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c73a-0ae4f4e47f51
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3d03-9e80c29e3da3
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c5cf-7693df2e24a9
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-9d4d-7dc1dae87b18
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-9595-5cd5250d35d2
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4a20-39605b04ca52
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-678f-418698921c78
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-c570-1fa3936ad6c9
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f6d1-bbcf301ec9dd
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-227b-f5a523053d36
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3e39-af17a8a5ff3e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6ad9-2d50ddaa54a1
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-aa62-1cd20c1f27fe
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-8f78-8d1820108ddb
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6548-3f0c615d3718
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e9ce-b27fa203cfd6
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-a158-6c509cd263ff
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-8f64-a697c9a3ca17
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-099c-a78a6f056313
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-b682-94c25f5300c5
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-abc9-cb19ed27f4a1
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e6c1-fde74a0b3241
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f9ad-af1b10198400
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-a167-696ab6aab9d7
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f644-d335a290af07
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-b307-cf91128d2ab3
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-8343-ab95b4c59388
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-993a-c2394987f66d
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d5d9-39665ca7a5c0
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-570d-b3caf8d5c9af
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-bbd2-eda0534144d0
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-df0f-25ddf48e6960
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-53bc-e7692b88ab22
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4444-70ae78c1ed82
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6434-33b6872849be
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-aad1-65355a3511e7
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-cbdd-3be34367c659
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-eb40-6dbd48048693
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-1a23-5db3194b3c69
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0575-f1a624b565d8
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-5d4b-c16f573e74a6
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-76ee-58b157d62b33
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-68d0-c6c53f11247a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f150-8055301b0702
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d6ab-109873ae1d3e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0ad0-399967d8d7e4
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7b45-35c83b7d0d2c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3571-ef4cf2861d86
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-9822-79ed1a6e2b17
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-33eb-f5135a383490
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3e42-9b7bbaf654f3
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-5d23-8899d3257ec5
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-df5a-4d1ca1d84f61
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0979-10d95a767959
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-f5ea-17e5c5fff56c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4504-c2b791c1ba71
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-8acc-c4cdc75d5ed4
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-aba7-74fd6ad4a8d7
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-a493-d2e136c4787d
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f8bf-fec8371956a9
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-454c-cc6ce3eef988
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-1d24-dc5defc99fc9
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e2ca-625f8fba7dce
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-01a1-0aa67fd89200
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0605-01c265723688
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-35ef-7480da6d5f20
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-741d-c4f0705ad4de
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c3c4-ad8dc809e38a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-220d-690532cdd864
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-ad7c-5eb9631a9eec
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0e4a-20f0e7730e5a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f77c-a96e95c8b955
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-ef4a-5e0112429dac
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-2d02-d81d8b7d8891
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-39c3-7d6049dc77ea
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f742-91397a1047b9
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-808f-41430d6f9554
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-59ce-2e2c498c60c1
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-31a5-cd2157acd37e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-8b04-99fe3d24b3b2
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d3cf-f1f344ecc198
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f93a-41d45b8e5176
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-ba5e-93d922666f5c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3c29-0745e68e5c2c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3205-13a12ee0ea46
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7730-9a105e49b7e1
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0738-7658204755a1
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-79f1-9cd2d4fc09a7
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e466-e896983fc4dd
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f9d5-c19c8051201a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4e72-24c9cfc93671
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-56f9-18ca1c0b720e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c28d-8836fd8e260e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-3f46-75e7bef69d6f
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6de3-0a6690b060c2
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d978-aa4dc33240a5
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d00c-e50685505192
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-5eeb-4051d58c0366
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-0098-1fb694e96d74
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c4ac-3d5a55f173a7
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f575-40f5-5e32690f3e1f
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6f29-b3d77779b0f5
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-50e7-f4057aa4094e
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f9ca-9863f6b899d2
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-50fd-2cb816f17ae4
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-ce1f-c86ad67031eb
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-c0b9-c0123526e5ea
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-9b1d-377913e57e10
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-d74e-b15bbfcd7d01
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4976-f84db3527e57
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-864a-d76960f583e8
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e54e-23999ad78ede
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-db3e-7636d5382979
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-b923-b5d59af5ed36
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f99e-4a0bf02bcda8
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-9a58-87ca27b726ad
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-6247-7fa9b6724fa8
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-1244-8ca42324e5ab
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-7083-c1cdf860bcd9
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-e26c-934aba96d4ad
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-62f2-d5fe29a07d12
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-ff51-54a8f53487c5
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-f86a-7b2162f3861c
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-4748-655d0dd0a78a
00020000-5673-f578-4a05-6ee60120efa7	00030000-5673-f576-fa36-3b9b1892df5f
00020000-5673-f578-1670-fbdea071b9d4	00030000-5673-f576-60ba-cbe231ac64bd
00020000-5673-f578-cdf1-bc453ba23726	00030000-5673-f576-9247-46c62d598dfc
00020000-5673-f578-fd96-fe1406ad4460	00030000-5673-f576-bcad-8437fd12d411
00020000-5673-f578-1404-3a2eb9c59284	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f578-025c-cd5974178cf2	00030000-5673-f576-abc9-cb19ed27f4a1
00020000-5673-f578-b1aa-4e9512a317ea	00030000-5673-f576-e6c1-fde74a0b3241
00020000-5673-f578-51aa-5c751774e587	00030000-5673-f576-f9ad-af1b10198400
00020000-5673-f578-42c6-4d95870719e2	00030000-5673-f576-b682-94c25f5300c5
00020000-5673-f578-affd-6d5c7e0dd2a3	00030000-5673-f576-8f64-a697c9a3ca17
00020000-5673-f578-11de-e489bad029ac	00030000-5673-f576-099c-a78a6f056313
00020000-5673-f578-2968-8dfe6162f346	00030000-5673-f576-09ac-754af4bd986c
00020000-5673-f578-1a98-12654d1ccea8	00030000-5673-f576-7ca4-21de37a166db
00020000-5673-f578-6a99-9e7e8a7a10c5	00030000-5673-f576-e39d-7e312cd43bfe
00020000-5673-f578-3025-aa2e918baae1	00030000-5673-f576-24c7-659cea68a2e4
00020000-5673-f578-3b2f-0f2a3eeafc10	00030000-5673-f575-8da6-512bbf5f1c6a
00020000-5673-f578-b22e-ce814897694b	00030000-5673-f575-415c-de71f425b9f6
00020000-5673-f578-aad7-cf2f70f2c13e	00030000-5673-f576-dec9-f20142985d61
00020000-5673-f578-e7f1-da697a56effb	00030000-5673-f576-5b13-f114dd3867bd
00020000-5673-f578-a09a-321702d63c62	00030000-5673-f576-0838-d8f3c13e5e6d
00020000-5673-f578-a09a-321702d63c62	00030000-5673-f576-cbdd-3be34367c659
00020000-5673-f578-a09a-321702d63c62	00030000-5673-f576-64e6-b95de62ef075
00020000-5673-f578-5e22-51c8df9f7b5f	00030000-5673-f576-dc0e-6c35b2b7f35b
00020000-5673-f578-7748-730241fa5acf	00030000-5673-f576-a81b-64cc65f41bed
00020000-5673-f578-e3b8-3d79cc4af2ba	00030000-5673-f576-0098-1fb694e96d74
00020000-5673-f578-4c17-a5c2d1456bef	00030000-5673-f576-6e43-3a729910c3ba
00020000-5673-f578-e81c-95a5ec23f579	00030000-5673-f576-4f75-93cd1bd08fff
00020000-5673-f578-b638-0dd0cde96c46	00030000-5673-f576-b53f-8a61b6ec16f2
00020000-5673-f578-6dc6-6580375b8a31	00030000-5673-f576-f150-8055301b0702
00020000-5673-f578-a18c-2957a470e885	00030000-5673-f576-709d-8bed7091c3bc
00020000-5673-f578-5773-e168a7695f89	00030000-5673-f576-7083-c1cdf860bcd9
00020000-5673-f578-7735-4d1b4b5b5af2	00030000-5673-f576-2c2c-5604286c827d
00020000-5673-f578-a179-0ff19d7791ec	00030000-5673-f576-aad1-65355a3511e7
00020000-5673-f578-10d2-8a4972dd26d8	00030000-5673-f576-2395-8268f31dcfee
00020000-5673-f578-af8f-8a358474d19b	00030000-5673-f576-09da-f8e5c914c9de
00020000-5673-f578-3ff2-f8e12229c057	00030000-5673-f576-a638-118c2bbc5bc6
00020000-5673-f578-675d-0e8ea3faaf30	00030000-5673-f576-d836-d3ab365caf68
00020000-5673-f578-7360-1fc8cca9c7b2	00030000-5673-f575-e7aa-f8959a2a3c9f
00020000-5673-f578-46a3-8902a94521de	00030000-5673-f576-4364-f4411fd17045
00020000-5673-f578-51e3-26aea9080d48	00030000-5673-f576-243c-84cab4b87c16
00020000-5673-f578-c8d4-7a086c9e33f6	00030000-5673-f575-c570-1fa3936ad6c9
\.


--
-- TOC entry 3152 (class 0 OID 32848867)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32848901)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32849039)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5673-f578-63a3-295abb13e53b	00090000-5673-f578-72ce-19cebd79ca60	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5673-f578-ae40-8bcce7f12de5	00090000-5673-f578-f4f3-6f78ed2a3cf8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5673-f578-d02b-e1f483572362	00090000-5673-f578-523a-62735c3a0402	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5673-f578-b64f-2301689c138a	00090000-5673-f578-511e-418edb6bf67b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32848559)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5673-f578-441d-0d94e03857f6	\N	00040000-5673-f575-d8c0-eb6bc5573627	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-ef1c-86b8cca22fbb	\N	00040000-5673-f575-d8c0-eb6bc5573627	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5673-f578-07d5-9f53f1dbf57f	\N	00040000-5673-f575-d8c0-eb6bc5573627	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-1795-2f321dc02f91	\N	00040000-5673-f575-d8c0-eb6bc5573627	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-edfe-be0adfaac2ad	\N	00040000-5673-f575-d8c0-eb6bc5573627	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-9e44-f8d3c3eea702	\N	00040000-5673-f575-99a9-bca4b9d86936	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-f917-8b71cd7a06b2	\N	00040000-5673-f575-4a0d-5e713870422b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-f33b-c35a7ea40f53	\N	00040000-5673-f575-1c64-85bb5011de86	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f578-7ff2-b1183f02cdb6	\N	00040000-5673-f575-dd92-099b407048e0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5673-f57a-644b-f4a8d48ecc6a	\N	00040000-5673-f575-d8c0-eb6bc5573627	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32848604)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5673-f575-b013-16a295912bf7	8341	Adlešiči
00050000-5673-f575-6bf9-0742cc3f426e	5270	Ajdovščina
00050000-5673-f575-75bb-6d2466e92e6f	6280	Ankaran/Ancarano
00050000-5673-f575-80eb-ccdc01ec5350	9253	Apače
00050000-5673-f575-dda6-3364c4e37004	8253	Artiče
00050000-5673-f575-0fbb-95ffbeeb2aed	4275	Begunje na Gorenjskem
00050000-5673-f575-d4b1-3a3aef0d8b01	1382	Begunje pri Cerknici
00050000-5673-f575-7f72-01ae0151a329	9231	Beltinci
00050000-5673-f575-3877-18c647729510	2234	Benedikt
00050000-5673-f575-6198-dd1ff8cdf969	2345	Bistrica ob Dravi
00050000-5673-f575-f7a2-499727a94ed6	3256	Bistrica ob Sotli
00050000-5673-f575-7fdd-b626af715902	8259	Bizeljsko
00050000-5673-f575-f44a-c9635b579f7d	1223	Blagovica
00050000-5673-f575-ac20-1acbebb21293	8283	Blanca
00050000-5673-f575-c3a3-ee6c00bc760a	4260	Bled
00050000-5673-f575-d751-917b08dd332d	4273	Blejska Dobrava
00050000-5673-f575-75bc-9a9b02bebcb8	9265	Bodonci
00050000-5673-f575-8ed6-87964ba1e8bd	9222	Bogojina
00050000-5673-f575-7942-43557371b8df	4263	Bohinjska Bela
00050000-5673-f575-1d75-ee02fdd0fdf3	4264	Bohinjska Bistrica
00050000-5673-f575-6a5c-07addc2a8d35	4265	Bohinjsko jezero
00050000-5673-f575-ba1f-b5e514b00d90	1353	Borovnica
00050000-5673-f575-16f3-91149b31bf5c	8294	Boštanj
00050000-5673-f575-38a8-f928169b4148	5230	Bovec
00050000-5673-f575-6b1f-3d71417f4182	5295	Branik
00050000-5673-f575-b137-3b8fea2947c0	3314	Braslovče
00050000-5673-f575-abdc-4347d854cae4	5223	Breginj
00050000-5673-f575-c09e-e9030b54d816	8280	Brestanica
00050000-5673-f575-128b-db3693d5ebe9	2354	Bresternica
00050000-5673-f575-cc5a-b10ca53c0482	4243	Brezje
00050000-5673-f575-e921-84b6f9ad1488	1351	Brezovica pri Ljubljani
00050000-5673-f575-5834-fe064a94d405	8250	Brežice
00050000-5673-f575-34ff-8319d33d65d3	4210	Brnik - Aerodrom
00050000-5673-f575-beac-8d729b88cbb5	8321	Brusnice
00050000-5673-f575-e019-36b279097e1d	3255	Buče
00050000-5673-f575-730e-b22f3323b857	8276	Bučka 
00050000-5673-f575-2e8f-227aa9da06cb	9261	Cankova
00050000-5673-f575-aeba-503b68cf1552	3000	Celje 
00050000-5673-f575-919e-b39e8c41d340	3001	Celje - poštni predali
00050000-5673-f575-e229-da6c9017ab3e	4207	Cerklje na Gorenjskem
00050000-5673-f575-c064-d65b208ea531	8263	Cerklje ob Krki
00050000-5673-f575-9955-e1a4e891b19a	1380	Cerknica
00050000-5673-f575-f38d-b8401a43a9c5	5282	Cerkno
00050000-5673-f575-507d-969ca52cb4f2	2236	Cerkvenjak
00050000-5673-f575-3af8-8eda96d1a722	2215	Ceršak
00050000-5673-f575-db90-21e89fd93534	2326	Cirkovce
00050000-5673-f575-bf24-3b066004031e	2282	Cirkulane
00050000-5673-f575-d532-78780fa51082	5273	Col
00050000-5673-f575-7a65-646df0d1c11d	8251	Čatež ob Savi
00050000-5673-f575-9159-bb670a42bb3c	1413	Čemšenik
00050000-5673-f575-6c4c-57efd4942284	5253	Čepovan
00050000-5673-f575-2836-c8443fd0dd62	9232	Črenšovci
00050000-5673-f575-320d-9e6b8c60f46c	2393	Črna na Koroškem
00050000-5673-f575-76a2-5ef99ad3fc3a	6275	Črni Kal
00050000-5673-f575-464a-a4437267fad5	5274	Črni Vrh nad Idrijo
00050000-5673-f575-b41b-35ba18a1b12a	5262	Črniče
00050000-5673-f575-f910-675e415d7411	8340	Črnomelj
00050000-5673-f575-4b59-1b5f76a95c9c	6271	Dekani
00050000-5673-f575-6266-0af66186ea60	5210	Deskle
00050000-5673-f575-2b5d-e586b208a106	2253	Destrnik
00050000-5673-f575-0ec5-81a23aa08963	6215	Divača
00050000-5673-f575-3511-93a892a272d7	1233	Dob
00050000-5673-f575-7dde-cfc1fc4456d6	3224	Dobje pri Planini
00050000-5673-f575-2c4d-56968e01b39f	8257	Dobova
00050000-5673-f575-654f-cdbca24bd146	1423	Dobovec
00050000-5673-f575-0d4d-08f9ec14f480	5263	Dobravlje
00050000-5673-f575-317e-d4e5a8adabf8	3204	Dobrna
00050000-5673-f575-cb64-af27f3d09ec2	8211	Dobrnič
00050000-5673-f575-07ba-56dc1776eebb	1356	Dobrova
00050000-5673-f575-de25-18f9119fdfe9	9223	Dobrovnik/Dobronak 
00050000-5673-f575-0e8d-21efa36dc7e1	5212	Dobrovo v Brdih
00050000-5673-f575-d741-81b7190ef86b	1431	Dol pri Hrastniku
00050000-5673-f575-8a04-5bef67659d79	1262	Dol pri Ljubljani
00050000-5673-f575-2786-66474f351800	1273	Dole pri Litiji
00050000-5673-f575-1946-2e1e80d124ed	1331	Dolenja vas
00050000-5673-f575-aa69-0c632fb7179c	8350	Dolenjske Toplice
00050000-5673-f575-28d6-6b61837a1173	1230	Domžale
00050000-5673-f575-38fc-36d9e8989c2c	2252	Dornava
00050000-5673-f575-1827-bacb4d10126e	5294	Dornberk
00050000-5673-f575-e3f3-60e4cfea7e1d	1319	Draga
00050000-5673-f575-3321-5285abf77a67	8343	Dragatuš
00050000-5673-f575-6b82-0a791b3e6b0c	3222	Dramlje
00050000-5673-f575-a7d4-8d6d69cbc510	2370	Dravograd
00050000-5673-f575-fa46-7a686a4fc0da	4203	Duplje
00050000-5673-f575-89d0-3597eadda10e	6221	Dutovlje
00050000-5673-f575-23b4-343bdea6fa2b	8361	Dvor
00050000-5673-f575-51d5-a0aaf4388470	2343	Fala
00050000-5673-f575-2f2b-febb9f1b32bd	9208	Fokovci
00050000-5673-f575-fa7e-afaa7eb74d9e	2313	Fram
00050000-5673-f575-e93c-fb09537438c0	3213	Frankolovo
00050000-5673-f575-bf52-7e2c367e8f24	1274	Gabrovka
00050000-5673-f575-a5f7-0d7d529daa7d	8254	Globoko
00050000-5673-f575-6523-763b5a349c53	5275	Godovič
00050000-5673-f575-e3a6-3a40fcc807ab	4204	Golnik
00050000-5673-f575-9521-67c56f5f1890	3303	Gomilsko
00050000-5673-f575-9ef3-b631d036db0b	4224	Gorenja vas
00050000-5673-f575-8439-bd70be6ad7cd	3263	Gorica pri Slivnici
00050000-5673-f575-2430-3c2e70b1867d	2272	Gorišnica
00050000-5673-f575-e886-53c6d6c9a6ea	9250	Gornja Radgona
00050000-5673-f575-a97f-dc9d598e3036	3342	Gornji Grad
00050000-5673-f575-80b1-f8b8c0e82b8c	4282	Gozd Martuljek
00050000-5673-f575-19d7-c58e674bc4c1	6272	Gračišče
00050000-5673-f575-57d2-18a6cd27afdf	9264	Grad
00050000-5673-f575-5b3b-01419185e7d5	8332	Gradac
00050000-5673-f575-f4d0-4080d2520a74	1384	Grahovo
00050000-5673-f575-57eb-808574a391e6	5242	Grahovo ob Bači
00050000-5673-f575-85e7-d87fc2162a74	5251	Grgar
00050000-5673-f575-2a7c-6dae82e60737	3302	Griže
00050000-5673-f575-66a1-bcb2f0b86738	3231	Grobelno
00050000-5673-f575-31cf-1b576adccd08	1290	Grosuplje
00050000-5673-f575-2636-1cfbbeaa2382	2288	Hajdina
00050000-5673-f575-db69-cfef7a435bde	8362	Hinje
00050000-5673-f575-9315-2e66d3d08fb7	2311	Hoče
00050000-5673-f575-0dcf-382a889c1d26	9205	Hodoš/Hodos
00050000-5673-f575-3484-c21375443c5f	1354	Horjul
00050000-5673-f575-786c-a26d751a78f5	1372	Hotedršica
00050000-5673-f575-cc7b-005201139218	1430	Hrastnik
00050000-5673-f575-8227-e60b83fd2e19	6225	Hruševje
00050000-5673-f575-41c8-38e513952d2e	4276	Hrušica
00050000-5673-f575-dca3-c58ef6550de8	5280	Idrija
00050000-5673-f575-5ec4-e13f084a2415	1292	Ig
00050000-5673-f575-58b3-f1c098a117c1	6250	Ilirska Bistrica
00050000-5673-f575-0818-f6516eb12493	6251	Ilirska Bistrica-Trnovo
00050000-5673-f575-b9db-48fb2bbc4e63	1295	Ivančna Gorica
00050000-5673-f575-abe9-d047ec775fa6	2259	Ivanjkovci
00050000-5673-f575-a057-4a808c25642e	1411	Izlake
00050000-5673-f575-471f-f92cb75f5b43	6310	Izola/Isola
00050000-5673-f575-988c-7c7d670fc310	2222	Jakobski Dol
00050000-5673-f575-e5a2-4c08cbb5ddae	2221	Jarenina
00050000-5673-f575-e807-1d68d01eab0a	6254	Jelšane
00050000-5673-f575-3b73-8ad5af1df85a	4270	Jesenice
00050000-5673-f575-e596-5e5749fd7875	8261	Jesenice na Dolenjskem
00050000-5673-f575-06eb-4f95457fcfd2	3273	Jurklošter
00050000-5673-f575-95f1-74cd4c62a041	2223	Jurovski Dol
00050000-5673-f575-1862-d800595bdbd7	2256	Juršinci
00050000-5673-f575-0327-88d11b22648e	5214	Kal nad Kanalom
00050000-5673-f575-2f7f-8054eec148cf	3233	Kalobje
00050000-5673-f575-f45b-23a4e9f5683b	4246	Kamna Gorica
00050000-5673-f575-96f4-c7fda446e9f3	2351	Kamnica
00050000-5673-f575-b87c-06e3f46ce72b	1241	Kamnik
00050000-5673-f575-a082-05113e061258	5213	Kanal
00050000-5673-f575-2f05-7aeedac0158c	8258	Kapele
00050000-5673-f575-50ed-693365bd1103	2362	Kapla
00050000-5673-f575-9fe5-f8c5ce741632	2325	Kidričevo
00050000-5673-f575-b5d1-982890344429	1412	Kisovec
00050000-5673-f575-5f0f-47021def5318	6253	Knežak
00050000-5673-f575-7366-095bd84ab7e0	5222	Kobarid
00050000-5673-f575-90ab-be0d263e81fd	9227	Kobilje
00050000-5673-f575-8769-7a9b57bb77cc	1330	Kočevje
00050000-5673-f575-963a-f37f65b0684b	1338	Kočevska Reka
00050000-5673-f575-34d8-80de9dc1f4ef	2276	Kog
00050000-5673-f575-c960-7b5dabca5de4	5211	Kojsko
00050000-5673-f575-ce83-fea16bb54f05	6223	Komen
00050000-5673-f575-d484-c65fa777c818	1218	Komenda
00050000-5673-f575-c3bc-77cdcb756351	6000	Koper/Capodistria 
00050000-5673-f575-acb6-858eb7728108	6001	Koper/Capodistria - poštni predali
00050000-5673-f575-bacc-0f4a0ced7274	8282	Koprivnica
00050000-5673-f575-03ee-0e8fe1dbc113	5296	Kostanjevica na Krasu
00050000-5673-f575-81fc-1a1ec5edc7cf	8311	Kostanjevica na Krki
00050000-5673-f575-b149-ea5717a19a5f	1336	Kostel
00050000-5673-f575-ff3b-af8c35032ec1	6256	Košana
00050000-5673-f575-e956-f07673e35c72	2394	Kotlje
00050000-5673-f575-d162-e2d243ed4e59	6240	Kozina
00050000-5673-f575-302c-dd870c28697e	3260	Kozje
00050000-5673-f575-45df-9b5287ed4ee4	4000	Kranj 
00050000-5673-f575-c511-f3e8c5423b4a	4001	Kranj - poštni predali
00050000-5673-f575-b67f-51fe42d910d0	4280	Kranjska Gora
00050000-5673-f575-5db8-61274d49507c	1281	Kresnice
00050000-5673-f575-5872-2c98085e6887	4294	Križe
00050000-5673-f575-aab9-0ce008149c8d	9206	Križevci
00050000-5673-f575-33df-6a083291baa1	9242	Križevci pri Ljutomeru
00050000-5673-f575-af36-1dde11f5a270	1301	Krka
00050000-5673-f575-3573-ca61b4d9795c	8296	Krmelj
00050000-5673-f575-56bb-393e6acbd63c	4245	Kropa
00050000-5673-f575-0806-15216e9d0554	8262	Krška vas
00050000-5673-f575-f6f2-4a50e1d374c0	8270	Krško
00050000-5673-f575-8d63-c7c1d7c6f63f	9263	Kuzma
00050000-5673-f575-9476-aa607edea3e7	2318	Laporje
00050000-5673-f575-2780-271af2ac58e6	3270	Laško
00050000-5673-f575-cee9-e5330b94d195	1219	Laze v Tuhinju
00050000-5673-f575-9d11-9d641ad37875	2230	Lenart v Slovenskih goricah
00050000-5673-f575-b962-84d9f6d440fb	9220	Lendava/Lendva
00050000-5673-f575-51f3-ef0543a23f40	4248	Lesce
00050000-5673-f575-b4d4-5e620c3e765a	3261	Lesično
00050000-5673-f575-d1be-89eabf500647	8273	Leskovec pri Krškem
00050000-5673-f575-20ca-51c46a28359c	2372	Libeliče
00050000-5673-f575-01be-ac7c6f74f232	2341	Limbuš
00050000-5673-f575-8c0d-988528719579	1270	Litija
00050000-5673-f575-c934-da2b094f20fa	3202	Ljubečna
00050000-5673-f575-94aa-0ee826083b4a	1000	Ljubljana 
00050000-5673-f575-57a9-7ab38fe236db	1001	Ljubljana - poštni predali
00050000-5673-f575-acd9-935a2dec89d2	1231	Ljubljana - Črnuče
00050000-5673-f575-ecaa-030e3957163e	1261	Ljubljana - Dobrunje
00050000-5673-f575-733f-43c87f77a19e	1260	Ljubljana - Polje
00050000-5673-f575-e7b6-8c8b96d7828d	1210	Ljubljana - Šentvid
00050000-5673-f575-b8fa-f3ef559a381e	1211	Ljubljana - Šmartno
00050000-5673-f575-bd59-c0e6fa2a0489	3333	Ljubno ob Savinji
00050000-5673-f575-6196-9196df434ce7	9240	Ljutomer
00050000-5673-f575-ad1d-962c79a13447	3215	Loče
00050000-5673-f575-9641-18043c925056	5231	Log pod Mangartom
00050000-5673-f575-e191-5b00a7da2bd0	1358	Log pri Brezovici
00050000-5673-f575-ad8e-2884a3942c18	1370	Logatec
00050000-5673-f575-3929-0043eab0bd1a	1371	Logatec
00050000-5673-f575-3364-da0dcb7703f2	1434	Loka pri Zidanem Mostu
00050000-5673-f575-5a81-88e10ff57ca6	3223	Loka pri Žusmu
00050000-5673-f575-d35c-8335809de674	6219	Lokev
00050000-5673-f575-20ec-dd7d3d52b9d6	1318	Loški Potok
00050000-5673-f575-4a04-341f2c120a6e	2324	Lovrenc na Dravskem polju
00050000-5673-f575-9353-f0d011b9621e	2344	Lovrenc na Pohorju
00050000-5673-f575-2b7f-fa9cd96d7a49	3334	Luče
00050000-5673-f575-1ed6-bb6c54a1c083	1225	Lukovica
00050000-5673-f575-4cd7-74873b46dbb5	9202	Mačkovci
00050000-5673-f575-6bb1-df6f5064dabd	2322	Majšperk
00050000-5673-f575-0e36-000511a22cf2	2321	Makole
00050000-5673-f575-9979-de737cf68b30	9243	Mala Nedelja
00050000-5673-f575-9235-fd080cb8497d	2229	Malečnik
00050000-5673-f575-647b-916bc06f54ea	6273	Marezige
00050000-5673-f575-a6c4-ef005676410d	2000	Maribor 
00050000-5673-f575-01f2-7595dfc90894	2001	Maribor - poštni predali
00050000-5673-f575-b1d5-7bb9291a0a94	2206	Marjeta na Dravskem polju
00050000-5673-f575-2541-e9f1cdba0c09	2281	Markovci
00050000-5673-f575-909d-5200ae31cc48	9221	Martjanci
00050000-5673-f575-cf49-51e0a5247ac6	6242	Materija
00050000-5673-f575-2e0f-5e4c8268288f	4211	Mavčiče
00050000-5673-f575-a158-b265952d722a	1215	Medvode
00050000-5673-f575-c9ec-e3f1907cd28a	1234	Mengeš
00050000-5673-f575-e4f5-527f60fa2774	8330	Metlika
00050000-5673-f575-19eb-004cd30650fa	2392	Mežica
00050000-5673-f575-f32d-bb953514a6a9	2204	Miklavž na Dravskem polju
00050000-5673-f575-fd7e-55f396454a7a	2275	Miklavž pri Ormožu
00050000-5673-f575-b509-8a45c8939ae4	5291	Miren
00050000-5673-f575-69eb-d1894acf927c	8233	Mirna
00050000-5673-f575-b837-55d58f0db899	8216	Mirna Peč
00050000-5673-f575-a535-71a0a428fd9c	2382	Mislinja
00050000-5673-f575-6dd3-77fcf7b333ff	4281	Mojstrana
00050000-5673-f575-3048-cfce07a60097	8230	Mokronog
00050000-5673-f575-401a-99ebf9737e64	1251	Moravče
00050000-5673-f575-c2bf-089ea8ab9ba8	9226	Moravske Toplice
00050000-5673-f575-aa01-c353658bf5a2	5216	Most na Soči
00050000-5673-f575-651b-d7c2b5043d73	1221	Motnik
00050000-5673-f575-8fec-a578b63a09f6	3330	Mozirje
00050000-5673-f575-b547-59922a96ee8e	9000	Murska Sobota 
00050000-5673-f575-7885-c25a60b4ec91	9001	Murska Sobota - poštni predali
00050000-5673-f575-42e1-e31201ce0396	2366	Muta
00050000-5673-f575-9472-d6570e3b3c00	4202	Naklo
00050000-5673-f575-56b4-f455f7b15af9	3331	Nazarje
00050000-5673-f575-9980-77c1b3501393	1357	Notranje Gorice
00050000-5673-f575-77ad-5be2dbe861ac	3203	Nova Cerkev
00050000-5673-f575-bbe4-54420b14541f	5000	Nova Gorica 
00050000-5673-f575-d15f-5275edfff6f9	5001	Nova Gorica - poštni predali
00050000-5673-f575-7a31-189bbe1ab51d	1385	Nova vas
00050000-5673-f575-f984-cb1f6cbe6862	8000	Novo mesto
00050000-5673-f575-f683-eb43a2895d6a	8001	Novo mesto - poštni predali
00050000-5673-f575-499a-0e2c9458a5eb	6243	Obrov
00050000-5673-f575-411a-c89d32df7b1c	9233	Odranci
00050000-5673-f575-0218-fb6675ed990e	2317	Oplotnica
00050000-5673-f575-058e-a35c2cd81a40	2312	Orehova vas
00050000-5673-f575-2e0d-6caa4e6065a5	2270	Ormož
00050000-5673-f575-bcdf-a464f056d6d4	1316	Ortnek
00050000-5673-f575-e12e-b25e7f1b20d9	1337	Osilnica
00050000-5673-f575-77a9-5d15778caeb9	8222	Otočec
00050000-5673-f575-90aa-a046a9c86829	2361	Ožbalt
00050000-5673-f575-aeb6-860a8094fe4f	2231	Pernica
00050000-5673-f575-ee64-b4617bf11875	2211	Pesnica pri Mariboru
00050000-5673-f575-1920-f8ab7e3bc07d	9203	Petrovci
00050000-5673-f575-2b2c-09320f585b21	3301	Petrovče
00050000-5673-f575-6c4d-dc38e85e66d7	6330	Piran/Pirano
00050000-5673-f575-f673-4fa45c2238d8	8255	Pišece
00050000-5673-f575-c6e3-1f1e4c6c03a7	6257	Pivka
00050000-5673-f575-c6c2-c781853a7c6e	6232	Planina
00050000-5673-f575-78ea-e38801e10b84	3225	Planina pri Sevnici
00050000-5673-f575-e576-7e3b5d680b47	6276	Pobegi
00050000-5673-f575-88c7-0485f546c00d	8312	Podbočje
00050000-5673-f575-d780-d03eb05050e4	5243	Podbrdo
00050000-5673-f575-6c7f-7d914c063f38	3254	Podčetrtek
00050000-5673-f575-b735-dd3f8ba03edf	2273	Podgorci
00050000-5673-f575-4854-3d0ef174d3f1	6216	Podgorje
00050000-5673-f575-2195-6c2ca3a3ae4b	2381	Podgorje pri Slovenj Gradcu
00050000-5673-f575-0f63-b416c2a7224b	6244	Podgrad
00050000-5673-f575-5d47-5c99c6b3533e	1414	Podkum
00050000-5673-f575-9d52-7f0d330db527	2286	Podlehnik
00050000-5673-f575-ca00-9e42e7a4129a	5272	Podnanos
00050000-5673-f575-8e0f-bbb9080a42cb	4244	Podnart
00050000-5673-f575-10ab-5358c51f2369	3241	Podplat
00050000-5673-f575-18ec-db2062db44ec	3257	Podsreda
00050000-5673-f575-5289-6b87dfeb6d72	2363	Podvelka
00050000-5673-f575-8f82-9924c616f278	2208	Pohorje
00050000-5673-f575-fbc5-908efd1fa10a	2257	Polenšak
00050000-5673-f575-2c68-8d3d9a70039b	1355	Polhov Gradec
00050000-5673-f575-df5a-219030ba1c9c	4223	Poljane nad Škofjo Loko
00050000-5673-f575-16a8-f99fa8537d8c	2319	Poljčane
00050000-5673-f575-5c7e-44dbace5f085	1272	Polšnik
00050000-5673-f575-9ac2-d6913e3d9a35	3313	Polzela
00050000-5673-f575-3d71-e5e550d5cd29	3232	Ponikva
00050000-5673-f575-2b19-72dabb1a20cb	6320	Portorož/Portorose
00050000-5673-f575-9f21-f40289cdbfb6	6230	Postojna
00050000-5673-f575-33ff-88b303a1ef73	2331	Pragersko
00050000-5673-f575-7a26-4c1de896afe0	3312	Prebold
00050000-5673-f575-e975-09c1a568ed68	4205	Preddvor
00050000-5673-f575-63ff-ced7ae1c0a88	6255	Prem
00050000-5673-f575-6136-2ced973e206b	1352	Preserje
00050000-5673-f575-e397-2854c9a91088	6258	Prestranek
00050000-5673-f575-f978-837f29d2e446	2391	Prevalje
00050000-5673-f575-6b91-ed7e94b21a0b	3262	Prevorje
00050000-5673-f575-2fe4-44595fa4d96c	1276	Primskovo 
00050000-5673-f575-2d97-52d19cfdf4bb	3253	Pristava pri Mestinju
00050000-5673-f575-7bc1-f008dda79f15	9207	Prosenjakovci/Partosfalva
00050000-5673-f575-43d6-9c8a6743cb6f	5297	Prvačina
00050000-5673-f575-69c8-b504534138fb	2250	Ptuj
00050000-5673-f575-be2e-231f8081afbb	2323	Ptujska Gora
00050000-5673-f575-2552-f0a9b15f29af	9201	Puconci
00050000-5673-f575-863a-5a4d105f41eb	2327	Rače
00050000-5673-f575-2fed-ecef9a426ee3	1433	Radeče
00050000-5673-f575-3bdc-a63392e234e7	9252	Radenci
00050000-5673-f575-548b-7ae889cb6b6d	2360	Radlje ob Dravi
00050000-5673-f575-38c1-3957e7fa20bd	1235	Radomlje
00050000-5673-f575-9d72-e4b5a3617173	4240	Radovljica
00050000-5673-f575-bc43-21874575f626	8274	Raka
00050000-5673-f575-61f5-ca0cc1aa06b5	1381	Rakek
00050000-5673-f575-c23e-28b944de99b3	4283	Rateče - Planica
00050000-5673-f575-c3a1-b89b2c310035	2390	Ravne na Koroškem
00050000-5673-f575-953e-530223478019	9246	Razkrižje
00050000-5673-f575-a1c4-915536babfc3	3332	Rečica ob Savinji
00050000-5673-f575-cdd9-fa493b2e2cea	5292	Renče
00050000-5673-f575-9eb8-e2e0c3fba4cd	1310	Ribnica
00050000-5673-f575-978c-a1e3254e8892	2364	Ribnica na Pohorju
00050000-5673-f575-fcf4-0d6632a19a94	3272	Rimske Toplice
00050000-5673-f575-9817-033150b7a26c	1314	Rob
00050000-5673-f575-5bb1-04917276b4b3	5215	Ročinj
00050000-5673-f575-f52f-163b144014ca	3250	Rogaška Slatina
00050000-5673-f575-1738-d4fe642d91e0	9262	Rogašovci
00050000-5673-f575-4af9-8132083fee0d	3252	Rogatec
00050000-5673-f575-92d5-10695e9b0613	1373	Rovte
00050000-5673-f575-a00d-9db3cd7f7d39	2342	Ruše
00050000-5673-f575-f1a8-c9ba4e38b944	1282	Sava
00050000-5673-f575-1c31-105e0bb06c8f	6333	Sečovlje/Sicciole
00050000-5673-f575-3e5b-0a8b8f7ef8f4	4227	Selca
00050000-5673-f575-a4d4-3377e5017a77	2352	Selnica ob Dravi
00050000-5673-f575-d32d-0702fb012d3d	8333	Semič
00050000-5673-f575-bdc1-d360384e1676	8281	Senovo
00050000-5673-f575-b556-2428fea19da8	6224	Senožeče
00050000-5673-f575-390f-ca60a530f7a8	8290	Sevnica
00050000-5673-f575-444e-9d946700fad2	6210	Sežana
00050000-5673-f575-a2e2-9933d2f77172	2214	Sladki Vrh
00050000-5673-f575-32c5-99b3dd314707	5283	Slap ob Idrijci
00050000-5673-f575-c67a-8a248153ddd7	2380	Slovenj Gradec
00050000-5673-f575-6eb4-dce89c3f0a66	2310	Slovenska Bistrica
00050000-5673-f575-d417-c7d8e69a8c10	3210	Slovenske Konjice
00050000-5673-f575-83cb-1daef4933e2f	1216	Smlednik
00050000-5673-f575-807a-6f6fa431c202	5232	Soča
00050000-5673-f575-6360-ff274161c2c0	1317	Sodražica
00050000-5673-f575-7e48-8c12bead6173	3335	Solčava
00050000-5673-f575-d01b-cc8fbf0198e5	5250	Solkan
00050000-5673-f575-4b01-44d992ae4b3e	4229	Sorica
00050000-5673-f575-e513-5ec77ef22f9e	4225	Sovodenj
00050000-5673-f575-da29-3d519dfe7d66	5281	Spodnja Idrija
00050000-5673-f575-78ad-37fd9c7ca343	2241	Spodnji Duplek
00050000-5673-f575-09b9-512be64fc0e8	9245	Spodnji Ivanjci
00050000-5673-f575-9b8f-73f9fe475e18	2277	Središče ob Dravi
00050000-5673-f575-313d-6325cb5a207d	4267	Srednja vas v Bohinju
00050000-5673-f575-089f-3a4be5a290ef	8256	Sromlje 
00050000-5673-f575-e2f6-72901ef9eef8	5224	Srpenica
00050000-5673-f575-dff8-2a70cc53465d	1242	Stahovica
00050000-5673-f575-6332-0cc6921b1b15	1332	Stara Cerkev
00050000-5673-f575-bb9c-6063b5eb7220	8342	Stari trg ob Kolpi
00050000-5673-f575-5877-0447dfdaa625	1386	Stari trg pri Ložu
00050000-5673-f575-bcc2-83853c65bafe	2205	Starše
00050000-5673-f575-d0f5-d7f8538f3983	2289	Stoperce
00050000-5673-f575-0a6d-e3106f28f11d	8322	Stopiče
00050000-5673-f575-6dc3-0ea5c80dfe6a	3206	Stranice
00050000-5673-f575-46b9-4302fe72dbbf	8351	Straža
00050000-5673-f575-aa14-023dd06f5b9d	1313	Struge
00050000-5673-f575-5ef8-04b67c280fa3	8293	Studenec
00050000-5673-f575-016a-e1875d8cdfd3	8331	Suhor
00050000-5673-f575-513c-8b7ec11b5c98	2233	Sv. Ana v Slovenskih goricah
00050000-5673-f575-fbc3-030fe844e3e8	2235	Sv. Trojica v Slovenskih goricah
00050000-5673-f575-87c7-e71a111b92a8	2353	Sveti Duh na Ostrem Vrhu
00050000-5673-f575-319c-b80a6c32e377	9244	Sveti Jurij ob Ščavnici
00050000-5673-f575-433d-1c9fdf8ea82c	3264	Sveti Štefan
00050000-5673-f575-1055-6414bb43e568	2258	Sveti Tomaž
00050000-5673-f575-76a6-aa38c3d1059e	9204	Šalovci
00050000-5673-f575-d883-48dc9404f332	5261	Šempas
00050000-5673-f575-81c6-87252ddea1af	5290	Šempeter pri Gorici
00050000-5673-f575-5986-6e1b05da5c1a	3311	Šempeter v Savinjski dolini
00050000-5673-f575-fc85-8ce3100b8cc5	4208	Šenčur
00050000-5673-f575-d698-e33f46d253dc	2212	Šentilj v Slovenskih goricah
00050000-5673-f575-a6eb-59c846b507bc	8297	Šentjanž
00050000-5673-f575-da3f-3ed4ddeb223f	2373	Šentjanž pri Dravogradu
00050000-5673-f575-fc60-e0a2e625b617	8310	Šentjernej
00050000-5673-f575-2999-1b900cdace58	3230	Šentjur
00050000-5673-f575-1695-87f5aa3092a4	3271	Šentrupert
00050000-5673-f575-6f5e-02cf3e9dc659	8232	Šentrupert
00050000-5673-f575-333c-eb611ef15761	1296	Šentvid pri Stični
00050000-5673-f575-7aa4-3f5c4c04d555	8275	Škocjan
00050000-5673-f575-4d0d-806afc58ae76	6281	Škofije
00050000-5673-f575-9633-f4913336537c	4220	Škofja Loka
00050000-5673-f575-6006-479ff8409e9d	3211	Škofja vas
00050000-5673-f575-2431-82974518faf0	1291	Škofljica
00050000-5673-f575-285d-cb737b00e449	6274	Šmarje
00050000-5673-f575-109f-b94abaf0e28a	1293	Šmarje - Sap
00050000-5673-f575-f001-dca2c30d4490	3240	Šmarje pri Jelšah
00050000-5673-f575-e746-3f65e1edcd02	8220	Šmarješke Toplice
00050000-5673-f575-f4be-a841561f6e6d	2315	Šmartno na Pohorju
00050000-5673-f575-e797-0f438ca4ea24	3341	Šmartno ob Dreti
00050000-5673-f575-014a-5fa7b552b003	3327	Šmartno ob Paki
00050000-5673-f575-92c0-b8385aa5d580	1275	Šmartno pri Litiji
00050000-5673-f575-3fcc-7b9fbcb0bfab	2383	Šmartno pri Slovenj Gradcu
00050000-5673-f575-94ff-969e7fb5e08b	3201	Šmartno v Rožni dolini
00050000-5673-f575-e7fc-6d7a48dbe398	3325	Šoštanj
00050000-5673-f575-20ce-af5f30a6ab7c	6222	Štanjel
00050000-5673-f575-668c-d9e0118713a8	3220	Štore
00050000-5673-f575-c892-55e5822e5a5e	3304	Tabor
00050000-5673-f575-a3e9-1fb5ab4d35ef	3221	Teharje
00050000-5673-f575-92d8-b31a843e7210	9251	Tišina
00050000-5673-f575-8e6d-f9a0c9abc34f	5220	Tolmin
00050000-5673-f575-d6f6-c7bcbd27c6d7	3326	Topolšica
00050000-5673-f575-11ef-7b70a1497f3d	2371	Trbonje
00050000-5673-f575-9768-2372475dcfa3	1420	Trbovlje
00050000-5673-f575-9843-bbd542d682e3	8231	Trebelno 
00050000-5673-f575-e894-7e0af02b1846	8210	Trebnje
00050000-5673-f575-9875-d290d50a196d	5252	Trnovo pri Gorici
00050000-5673-f575-a80c-6aa6c5e99954	2254	Trnovska vas
00050000-5673-f575-c63d-e7d3dd021039	1222	Trojane
00050000-5673-f575-3dc1-dc30c0599699	1236	Trzin
00050000-5673-f575-b9a0-eaa93f437a17	4290	Tržič
00050000-5673-f575-3e2a-116cb872371a	8295	Tržišče
00050000-5673-f575-3b93-7eb92dab9af1	1311	Turjak
00050000-5673-f575-9750-8a460a122b06	9224	Turnišče
00050000-5673-f575-986c-721bcfcec719	8323	Uršna sela
00050000-5673-f575-1ce2-3eb4c40d9561	1252	Vače
00050000-5673-f575-0ad0-1b78655c7745	3320	Velenje 
00050000-5673-f575-697a-5b55486eea35	3322	Velenje - poštni predali
00050000-5673-f575-5120-07aa363c4b6b	8212	Velika Loka
00050000-5673-f575-6d6d-f4cb1d9523d1	2274	Velika Nedelja
00050000-5673-f575-9e4b-cef1004b516d	9225	Velika Polana
00050000-5673-f575-ffcb-d673c8e6bac8	1315	Velike Lašče
00050000-5673-f575-48db-a61180b7f534	8213	Veliki Gaber
00050000-5673-f575-f153-99d1d36bb23e	9241	Veržej
00050000-5673-f575-946a-340445067a69	1312	Videm - Dobrepolje
00050000-5673-f575-87b4-220c8111f759	2284	Videm pri Ptuju
00050000-5673-f575-6341-14a466f084db	8344	Vinica
00050000-5673-f575-a9ce-811872dc0651	5271	Vipava
00050000-5673-f575-9ad7-1a1d9c218399	4212	Visoko
00050000-5673-f575-12ea-30bc337b1d68	1294	Višnja Gora
00050000-5673-f575-c661-d9bf068750c3	3205	Vitanje
00050000-5673-f575-066f-d46e4c28c469	2255	Vitomarci
00050000-5673-f575-e008-bf2a7b3b3181	1217	Vodice
00050000-5673-f575-3789-37ba0a09ecb0	3212	Vojnik\t
00050000-5673-f575-e6dd-68459173c48b	5293	Volčja Draga
00050000-5673-f575-70df-01e5e2e54b08	2232	Voličina
00050000-5673-f575-20bc-d2b6c5435ee5	3305	Vransko
00050000-5673-f575-7de7-77d078ccd101	6217	Vremski Britof
00050000-5673-f575-8bf8-ec1c61cda3f8	1360	Vrhnika
00050000-5673-f575-2fa5-aaa0c336c31e	2365	Vuhred
00050000-5673-f575-f9b1-dcc6fd0adb37	2367	Vuzenica
00050000-5673-f575-5e62-ef72d9ce7782	8292	Zabukovje 
00050000-5673-f575-856d-bc5e34cd6667	1410	Zagorje ob Savi
00050000-5673-f575-4553-707533beaf91	1303	Zagradec
00050000-5673-f575-9526-0e0e44dce684	2283	Zavrč
00050000-5673-f575-b2cf-30c2716126ef	8272	Zdole 
00050000-5673-f575-481d-908d0632cbf2	4201	Zgornja Besnica
00050000-5673-f575-e00d-9390345d7333	2242	Zgornja Korena
00050000-5673-f575-0e84-d9b0f3baa977	2201	Zgornja Kungota
00050000-5673-f575-676f-98d3322a6768	2316	Zgornja Ložnica
00050000-5673-f575-3511-eb72035073c1	2314	Zgornja Polskava
00050000-5673-f575-44ca-c41bd339df51	2213	Zgornja Velka
00050000-5673-f575-9b24-59372b5b4bef	4247	Zgornje Gorje
00050000-5673-f575-1bcf-560038ffe849	4206	Zgornje Jezersko
00050000-5673-f575-ea76-7aa396b7b342	2285	Zgornji Leskovec
00050000-5673-f575-80da-613ce5d8de8d	1432	Zidani Most
00050000-5673-f575-06ad-f007d65d6aed	3214	Zreče
00050000-5673-f575-bfd4-4a76a78c1c34	4209	Žabnica
00050000-5673-f575-aa3f-4716f1c2caa6	3310	Žalec
00050000-5673-f575-6bed-a8e015c49407	4228	Železniki
00050000-5673-f575-3bff-320b8581aa65	2287	Žetale
00050000-5673-f575-8300-dd640e73ea9b	4226	Žiri
00050000-5673-f575-5e91-66f9f737def1	4274	Žirovnica
00050000-5673-f575-ad0b-52f4dc452686	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32849277)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32848841)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32848589)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5673-f578-a15a-52c4a4be40e1	00080000-5673-f578-441d-0d94e03857f6	\N	00040000-5673-f575-d8c0-eb6bc5573627	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5673-f578-d931-17b4d94b2aeb	00080000-5673-f578-441d-0d94e03857f6	\N	00040000-5673-f575-d8c0-eb6bc5573627	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5673-f578-2f1d-6f0730c2201a	00080000-5673-f578-ef1c-86b8cca22fbb	\N	00040000-5673-f575-d8c0-eb6bc5573627	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32848733)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5673-f575-5590-5eaa3f6909b6	novo leto	1	1	\N	t
00430000-5673-f575-cf9f-c527f7d06b0c	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5673-f575-61be-bdedef0c0b30	dan upora proti okupatorju	27	4	\N	t
00430000-5673-f575-e354-f457f7a30260	praznik dela	1	5	\N	t
00430000-5673-f575-4a26-ced22236d143	praznik dela	2	5	\N	t
00430000-5673-f575-f647-60d1de88fea1	dan Primoža Trubarja	8	6	\N	f
00430000-5673-f575-d5c0-0e20afb36247	dan državnosti	25	6	\N	t
00430000-5673-f575-df89-fd50ac709d5f	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5673-f575-8e40-8290c81631b9	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5673-f575-4373-65664c84c695	dan suverenosti	25	10	\N	f
00430000-5673-f575-bd17-da83cbd8c710	dan spomina na mrtve	1	11	\N	t
00430000-5673-f575-6af5-23e9f4b3903a	dan Rudolfa Maistra	23	11	\N	f
00430000-5673-f575-6c55-4fafedb3dba7	božič	25	12	\N	t
00430000-5673-f575-998c-4b1ffd52f01d	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5673-f575-a8f6-b64e5c31129b	Marijino vnebovzetje	15	8	\N	t
00430000-5673-f575-a0eb-acaf6034bab3	dan reformacije	31	10	\N	t
00430000-5673-f575-1b0d-e2ef4e06c84c	velikonočna nedelja	27	3	2016	t
00430000-5673-f575-2652-e63ebd713fd3	velikonočna nedelja	16	4	2017	t
00430000-5673-f575-5a1a-ee5e8c38f7b1	velikonočna nedelja	1	4	2018	t
00430000-5673-f575-bbee-a434a713f628	velikonočna nedelja	21	4	2019	t
00430000-5673-f575-fc68-736df3d01f4d	velikonočna nedelja	12	4	2020	t
00430000-5673-f575-dddd-9f8f90b0c568	velikonočna nedelja	4	4	2021	t
00430000-5673-f575-a544-2e8073f1e9e1	velikonočna nedelja	17	4	2022	t
00430000-5673-f575-7017-14b499bd25d3	velikonočna nedelja	9	4	2023	t
00430000-5673-f575-a6a9-84fe0e82e154	velikonočna nedelja	31	3	2024	t
00430000-5673-f575-b223-d56d8cd7af44	velikonočna nedelja	20	4	2025	t
00430000-5673-f575-200e-9bf2becce30d	velikonočna nedelja	5	4	2026	t
00430000-5673-f575-0db7-1e79e5bdd7d2	velikonočna nedelja	28	3	2027	t
00430000-5673-f575-dd41-2ed9e5cd93c5	velikonočna nedelja	16	4	2028	t
00430000-5673-f575-4368-4e715768c511	velikonočna nedelja	1	4	2029	t
00430000-5673-f575-b6c3-85b74ba6f835	velikonočna nedelja	21	4	2030	t
00430000-5673-f575-34b2-356c7dc2eea4	velikonočni ponedeljek	28	3	2016	t
00430000-5673-f575-f086-a01d7cd73df3	velikonočni ponedeljek	17	4	2017	t
00430000-5673-f575-38ab-3cafcdb74fb9	velikonočni ponedeljek	2	4	2018	t
00430000-5673-f575-589d-2533cc031094	velikonočni ponedeljek	22	4	2019	t
00430000-5673-f575-7879-752349e5e218	velikonočni ponedeljek	13	4	2020	t
00430000-5673-f575-92ad-062bb3da3ba5	velikonočni ponedeljek	5	4	2021	t
00430000-5673-f575-9dea-4fa13fb10c67	velikonočni ponedeljek	18	4	2022	t
00430000-5673-f575-9d67-ddb483b4ae70	velikonočni ponedeljek	10	4	2023	t
00430000-5673-f575-c3bc-29c3ec16f0b5	velikonočni ponedeljek	1	4	2024	t
00430000-5673-f575-4500-baee1e81ec58	velikonočni ponedeljek	21	4	2025	t
00430000-5673-f575-fdf1-e3a761273ad5	velikonočni ponedeljek	6	4	2026	t
00430000-5673-f575-86e4-cd49e0a8ad54	velikonočni ponedeljek	29	3	2027	t
00430000-5673-f575-0666-8ee0a65162f1	velikonočni ponedeljek	17	4	2028	t
00430000-5673-f575-5154-812ebfe29f61	velikonočni ponedeljek	2	4	2029	t
00430000-5673-f575-3e44-c6c8e109aa52	velikonočni ponedeljek	22	4	2030	t
00430000-5673-f575-1986-d1a447c0bd85	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5673-f575-4581-d04facd2e5b6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5673-f575-f248-9f9bf2098342	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5673-f575-0a71-890ea9d4f20e	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5673-f575-1125-7426dd497a26	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5673-f575-0485-21a33e3ab3d1	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5673-f575-a824-d13030f9fdd0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5673-f575-68b6-6849a67024b9	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5673-f575-708c-d88eaa994af7	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5673-f575-4199-ea84da7dfa1f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5673-f575-729a-20a55e04513f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5673-f575-05bf-253ca197e828	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5673-f575-a0cd-c9fd756c47e1	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5673-f575-6fd1-488b92953446	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5673-f575-f1bd-e55dbd9417b0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32848693)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32848705)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32848853)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32849291)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32849301)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5673-f578-0feb-1c69984cd73c	00080000-5673-f578-07d5-9f53f1dbf57f	0987	AK
00190000-5673-f578-e169-e4e6c9bfe536	00080000-5673-f578-ef1c-86b8cca22fbb	0989	AK
00190000-5673-f578-83a7-95661f364884	00080000-5673-f578-1795-2f321dc02f91	0986	AK
00190000-5673-f578-821e-be6888fc3a42	00080000-5673-f578-9e44-f8d3c3eea702	0984	AK
00190000-5673-f578-7eb6-732bb699bff4	00080000-5673-f578-f917-8b71cd7a06b2	0983	AK
00190000-5673-f578-fbc9-3dce8f11c659	00080000-5673-f578-f33b-c35a7ea40f53	0982	AK
00190000-5673-f57a-3862-3919a499e1ed	00080000-5673-f57a-644b-f4a8d48ecc6a	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32849190)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5673-f578-f982-33802df20451	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32849309)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32848882)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5673-f577-363d-4efcd88f7eb1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5673-f577-0221-63685f182726	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5673-f577-4a1c-4bb46a95d76b	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5673-f577-6fc8-5cb41562bd31	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5673-f577-42c7-50ce5bee285f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5673-f577-0daf-7b7323d949cc	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5673-f577-7e5f-623a80b3afca	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32848826)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32848816)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32849028)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32848958)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32848667)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32848429)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5673-f57a-644b-f4a8d48ecc6a	00010000-5673-f576-6aef-384e56d64d45	2015-12-18 13:00:58	INS	a:0:{}
2	App\\Entity\\Option	00000000-5673-f57a-3de2-ca176d299b38	00010000-5673-f576-6aef-384e56d64d45	2015-12-18 13:00:58	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5673-f57a-3862-3919a499e1ed	00010000-5673-f576-6aef-384e56d64d45	2015-12-18 13:00:58	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32848895)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32848467)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5673-f576-1e03-f344b0fd38d2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5673-f576-b94f-9653f04c7ee9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5673-f576-0045-c7f346539170	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5673-f576-c832-63be44f29c8c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5673-f576-8259-05031320d391	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5673-f576-4740-823e558fea39	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5673-f576-c90d-f71f3bf8bb2b	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5673-f576-0114-05ce431f70e4	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5673-f576-509f-37786dc8b930	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5673-f576-0584-67d6370a1a7b	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5673-f576-e3b6-16e3453ec0c0	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5673-f576-21d7-9d1c358c7fcc	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5673-f576-0f54-8f6490c5c8b7	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5673-f576-79aa-36cdffabcde2	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5673-f576-9fca-d2c33bfa6cb0	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5673-f576-048e-42c7c835cea1	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5673-f576-a0c3-1d9c7921f1ba	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5673-f576-d660-ba5bf691abe7	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5673-f576-99a2-d7a4377421f6	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5673-f576-c13e-98971906103b	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5673-f576-f215-0a0b90233204	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5673-f576-8130-478292856b38	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5673-f576-fb91-1dd78906b65c	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5673-f576-14e2-0a797ba844af	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5673-f576-8d42-8d32e0bad183	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5673-f576-d1ea-f0d46ef21700	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5673-f576-dc28-61cd24ad7184	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5673-f576-2b0a-147b4e1c3083	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5673-f576-9a20-0dcb69a4418f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5673-f576-7a2c-ee3be9a13083	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5673-f576-bd89-8d4f25d04f2f	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5673-f576-071c-5b34c9797a0e	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5673-f576-64d2-a292e35c508f	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5673-f576-1b92-cc66f0d7decc	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5673-f576-bdc3-5739f6099fea	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5673-f576-f125-3dc4f372947b	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5673-f576-2619-520a31b257b2	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5673-f576-2229-091381a384e4	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5673-f576-7795-80d8a326890c	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5673-f576-286a-e37f67ff5a86	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5673-f576-4df2-1627dd5c4286	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5673-f576-cb37-5efc6222f451	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5673-f576-a4e0-62d6322e20f1	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5673-f576-f210-b6f220200b4e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5673-f576-b053-826919ef69f8	direktor	minimalne pravice za direktorja	t
00020000-5673-f576-3180-129a03aade3c	arhivar	arhivar	t
00020000-5673-f576-a237-973831bbb555	dramaturg	dramaturg	t
00020000-5673-f576-2092-388ae947ba1a	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5673-f576-94c1-cd90284a9e3f	poslovni-sekretar	poslovni sekretar	t
00020000-5673-f576-6864-c929286bcc99	vodja-tehnike	vodja tehnike	t
00020000-5673-f576-83dc-de8977d3a316	racunovodja	računovodja	t
00020000-5673-f578-4a05-6ee60120efa7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5673-f578-1670-fbdea071b9d4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-cdf1-bc453ba23726	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-fd96-fe1406ad4460	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-1404-3a2eb9c59284	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-025c-cd5974178cf2	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-b1aa-4e9512a317ea	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-51aa-5c751774e587	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5673-f578-42c6-4d95870719e2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5673-f578-affd-6d5c7e0dd2a3	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-11de-e489bad029ac	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-2968-8dfe6162f346	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-1a98-12654d1ccea8	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-6a99-9e7e8a7a10c5	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-3025-aa2e918baae1	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-3b2f-0f2a3eeafc10	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-b22e-ce814897694b	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-aad7-cf2f70f2c13e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-e7f1-da697a56effb	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-a09a-321702d63c62	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5673-f578-5e22-51c8df9f7b5f	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-7748-730241fa5acf	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-e3b8-3d79cc4af2ba	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-4c17-a5c2d1456bef	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-e81c-95a5ec23f579	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-b638-0dd0cde96c46	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-6dc6-6580375b8a31	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-a18c-2957a470e885	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-5773-e168a7695f89	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-7735-4d1b4b5b5af2	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-a179-0ff19d7791ec	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-10d2-8a4972dd26d8	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-af8f-8a358474d19b	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-3ff2-f8e12229c057	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-675d-0e8ea3faaf30	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-7360-1fc8cca9c7b2	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5673-f578-46a3-8902a94521de	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5673-f578-51e3-26aea9080d48	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5673-f578-c8d4-7a086c9e33f6	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32848451)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5673-f576-084a-4fc2971e3079	00020000-5673-f576-0045-c7f346539170
00010000-5673-f576-6aef-384e56d64d45	00020000-5673-f576-0045-c7f346539170
00010000-5673-f578-a07e-92eb47bfd385	00020000-5673-f578-4a05-6ee60120efa7
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-1670-fbdea071b9d4
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-025c-cd5974178cf2
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-affd-6d5c7e0dd2a3
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-2968-8dfe6162f346
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-6a99-9e7e8a7a10c5
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-e7f1-da697a56effb
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-fd96-fe1406ad4460
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-5e22-51c8df9f7b5f
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-4c17-a5c2d1456bef
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-b638-0dd0cde96c46
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-a18c-2957a470e885
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-7735-4d1b4b5b5af2
00010000-5673-f578-7e40-483864dd9b7d	00020000-5673-f578-3ff2-f8e12229c057
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-1670-fbdea071b9d4
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-cdf1-bc453ba23726
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-fd96-fe1406ad4460
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-1404-3a2eb9c59284
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-6a99-9e7e8a7a10c5
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-b22e-ce814897694b
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-5e22-51c8df9f7b5f
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-4c17-a5c2d1456bef
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-b638-0dd0cde96c46
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-a18c-2957a470e885
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-7735-4d1b4b5b5af2
00010000-5673-f578-047e-63d0179a7733	00020000-5673-f578-3ff2-f8e12229c057
00010000-5673-f578-a1b9-677f6c64b6f2	00020000-5673-f578-1670-fbdea071b9d4
00010000-5673-f578-a1b9-677f6c64b6f2	00020000-5673-f578-cdf1-bc453ba23726
00010000-5673-f578-a1b9-677f6c64b6f2	00020000-5673-f578-fd96-fe1406ad4460
00010000-5673-f578-a1b9-677f6c64b6f2	00020000-5673-f578-1404-3a2eb9c59284
00010000-5673-f578-a1b9-677f6c64b6f2	00020000-5673-f578-2968-8dfe6162f346
00010000-5673-f578-a1b9-677f6c64b6f2	00020000-5673-f578-6a99-9e7e8a7a10c5
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-cdf1-bc453ba23726
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-b1aa-4e9512a317ea
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-11de-e489bad029ac
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-1a98-12654d1ccea8
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-2968-8dfe6162f346
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-aad7-cf2f70f2c13e
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-6a99-9e7e8a7a10c5
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-3025-aa2e918baae1
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-5e22-51c8df9f7b5f
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-7748-730241fa5acf
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-4c17-a5c2d1456bef
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-e81c-95a5ec23f579
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-b638-0dd0cde96c46
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-6dc6-6580375b8a31
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-a18c-2957a470e885
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-5773-e168a7695f89
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-7735-4d1b4b5b5af2
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-a179-0ff19d7791ec
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-3ff2-f8e12229c057
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-675d-0e8ea3faaf30
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-46a3-8902a94521de
00010000-5673-f578-5585-8b9c8ffc9245	00020000-5673-f578-51e3-26aea9080d48
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-cdf1-bc453ba23726
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-b1aa-4e9512a317ea
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-42c6-4d95870719e2
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-11de-e489bad029ac
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-1a98-12654d1ccea8
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-2968-8dfe6162f346
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-aad7-cf2f70f2c13e
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-6a99-9e7e8a7a10c5
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-3025-aa2e918baae1
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-3b2f-0f2a3eeafc10
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-5e22-51c8df9f7b5f
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-7748-730241fa5acf
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-e3b8-3d79cc4af2ba
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-4c17-a5c2d1456bef
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-e81c-95a5ec23f579
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-b638-0dd0cde96c46
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-6dc6-6580375b8a31
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-a18c-2957a470e885
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-5773-e168a7695f89
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-7735-4d1b4b5b5af2
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-a179-0ff19d7791ec
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-3ff2-f8e12229c057
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-675d-0e8ea3faaf30
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-7360-1fc8cca9c7b2
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-46a3-8902a94521de
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-51e3-26aea9080d48
00010000-5673-f578-05a8-de36018031af	00020000-5673-f578-c8d4-7a086c9e33f6
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-cdf1-bc453ba23726
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-fd96-fe1406ad4460
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-b1aa-4e9512a317ea
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-51aa-5c751774e587
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-42c6-4d95870719e2
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-025c-cd5974178cf2
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-11de-e489bad029ac
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-1a98-12654d1ccea8
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-2968-8dfe6162f346
00010000-5673-f578-ce72-bc20be404c33	00020000-5673-f578-aad7-cf2f70f2c13e
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-1670-fbdea071b9d4
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-1404-3a2eb9c59284
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-025c-cd5974178cf2
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-affd-6d5c7e0dd2a3
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-2968-8dfe6162f346
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-6a99-9e7e8a7a10c5
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-e7f1-da697a56effb
00010000-5673-f578-adbc-1e5029cc2f86	00020000-5673-f578-10d2-8a4972dd26d8
00010000-5673-f578-08b7-1057c3f4c914	00020000-5673-f578-a09a-321702d63c62
00010000-5673-f578-0819-3524fc27fa26	00020000-5673-f576-b053-826919ef69f8
00010000-5673-f578-d7b6-e36735e30fa6	00020000-5673-f576-3180-129a03aade3c
00010000-5673-f578-11b3-7e7083d44721	00020000-5673-f576-a237-973831bbb555
00010000-5673-f578-d7a9-0947d9bfe057	00020000-5673-f576-2092-388ae947ba1a
00010000-5673-f578-eb9e-3760e50f692f	00020000-5673-f576-94c1-cd90284a9e3f
00010000-5673-f578-5747-c57d058e29cc	00020000-5673-f576-6864-c929286bcc99
00010000-5673-f578-50ee-06294277dcb0	00020000-5673-f576-83dc-de8977d3a316
\.


--
-- TOC entry 3157 (class 0 OID 32848909)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32848847)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32848793)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5673-f578-7e21-5ae41d8c3fe8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5673-f578-0b54-34f406644569	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5673-f578-5ea8-66b92e654725	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32848416)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5673-f575-e33a-8d90b8806e47	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5673-f575-7882-30c92d2959ae	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5673-f575-a56b-584eed5db497	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5673-f575-d76b-a781d3f3f237	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5673-f575-2b7e-9f37391433e6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32848408)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5673-f575-b368-29e2c099b96f	00230000-5673-f575-d76b-a781d3f3f237	popa
00240000-5673-f575-3af5-eeaf246f8f4c	00230000-5673-f575-d76b-a781d3f3f237	oseba
00240000-5673-f575-719b-91a90099b53c	00230000-5673-f575-d76b-a781d3f3f237	tippopa
00240000-5673-f575-e4cc-38f539933ed7	00230000-5673-f575-d76b-a781d3f3f237	organizacijskaenota
00240000-5673-f575-0d14-a6da4d17c89d	00230000-5673-f575-d76b-a781d3f3f237	sezona
00240000-5673-f575-6445-0e773966a878	00230000-5673-f575-d76b-a781d3f3f237	tipvaje
00240000-5673-f575-2d02-af661f5a55b6	00230000-5673-f575-7882-30c92d2959ae	prostor
00240000-5673-f575-f79e-148ec1053b35	00230000-5673-f575-d76b-a781d3f3f237	besedilo
00240000-5673-f575-f119-78e4072164fa	00230000-5673-f575-d76b-a781d3f3f237	uprizoritev
00240000-5673-f575-216a-94659a4f49f1	00230000-5673-f575-d76b-a781d3f3f237	funkcija
00240000-5673-f575-934e-73f9a68b8e8b	00230000-5673-f575-d76b-a781d3f3f237	tipfunkcije
00240000-5673-f575-f1b5-58dca5ce077e	00230000-5673-f575-d76b-a781d3f3f237	alternacija
00240000-5673-f575-91d4-0d035e553d82	00230000-5673-f575-e33a-8d90b8806e47	pogodba
00240000-5673-f575-30ff-662f4c3d7410	00230000-5673-f575-d76b-a781d3f3f237	zaposlitev
00240000-5673-f575-5d77-c258091d68b8	00230000-5673-f575-d76b-a781d3f3f237	zvrstuprizoritve
00240000-5673-f575-1474-897aa900a821	00230000-5673-f575-e33a-8d90b8806e47	programdela
00240000-5673-f575-f61a-f3f8c9bce0d9	00230000-5673-f575-d76b-a781d3f3f237	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32848403)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1a607909-5710-4696-b35c-01ee524e08f0	00240000-5673-f575-b368-29e2c099b96f	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32848975)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5673-f578-413f-9b5bed50a941	000e0000-5673-f578-8adb-e4ab41164a4a	00080000-5673-f578-441d-0d94e03857f6	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5673-f575-4bbb-9b267c7eed4c
00270000-5673-f578-0e5b-0eeddb53e465	000e0000-5673-f578-8adb-e4ab41164a4a	00080000-5673-f578-441d-0d94e03857f6	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5673-f575-4bbb-9b267c7eed4c
\.


--
-- TOC entry 3122 (class 0 OID 32848551)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32848803)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5673-f578-1f18-ff44edba7621	00180000-5673-f578-1f3e-a224a49f2f2f	000c0000-5673-f578-9419-8c50944edf20	00090000-5673-f578-72ce-19cebd79ca60	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5673-f578-3c33-ba462c366111	00180000-5673-f578-1f3e-a224a49f2f2f	000c0000-5673-f578-d029-9ab3cd12b4d2	00090000-5673-f578-511e-418edb6bf67b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5673-f578-79cd-0283a7420393	00180000-5673-f578-1f3e-a224a49f2f2f	000c0000-5673-f578-f77b-72583fb86e64	00090000-5673-f578-d4d1-feebf20b25e1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5673-f578-54a2-eae929876bb2	00180000-5673-f578-1f3e-a224a49f2f2f	000c0000-5673-f578-6c7a-dd4c2679cf38	00090000-5673-f578-45c1-7543c2489701	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5673-f578-03b8-0671bd79d4b0	00180000-5673-f578-1f3e-a224a49f2f2f	000c0000-5673-f578-180d-bb6af1c64149	00090000-5673-f578-1af9-9c74fa87bd1c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5673-f578-d54b-5b8f5e4b1fa2	00180000-5673-f578-7163-70b0f0e3164e	\N	00090000-5673-f578-1af9-9c74fa87bd1c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5673-f578-07d9-03b6636d298b	00180000-5673-f578-7163-70b0f0e3164e	\N	00090000-5673-f578-511e-418edb6bf67b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32849016)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5673-f575-98ab-80e0de84aa8a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5673-f575-fb35-b84615c2c0b5	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5673-f575-b0f8-28799dfceb33	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5673-f575-70ec-5ffec945c11d	04	Režija	Režija	Režija	umetnik	30
000f0000-5673-f575-7f71-86475a8906ea	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5673-f575-645c-1db8b50e423b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5673-f575-88a6-052a517e1f50	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5673-f575-d154-2a9c3287c6b6	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5673-f575-7342-fa70f5ee0aa4	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5673-f575-547e-7dd26747340b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5673-f575-bf6d-23a9c04c3860	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5673-f575-3a6d-b5b30e4732b9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5673-f575-dcdc-67b35b4e9e8a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5673-f575-7c77-ebff0ce861a1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5673-f575-e5ab-2926b93832cb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5673-f575-2f41-1f86c88c48e9	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5673-f575-09a5-0d357922325d	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5673-f575-2063-aec4198e16b5	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32848502)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5673-f577-9a75-8b1e72c59b20	0001	šola	osnovna ali srednja šola
00400000-5673-f577-40ba-9a295c453712	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5673-f577-7f43-ddb6d5d79824	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32849321)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5673-f575-9f94-fef773a54ccb	01	Velika predstava	f	1.00	1.00
002b0000-5673-f575-e853-01c51ca02632	02	Mala predstava	f	0.50	0.50
002b0000-5673-f575-35d3-123ff6c58ec0	03	Mala koprodukcija	t	0.40	1.00
002b0000-5673-f575-a870-9fea552215c2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5673-f575-96aa-9ad75bb18132	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32848783)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5673-f575-be4f-a4243747d93f	0001	prva vaja	prva vaja
00420000-5673-f575-e0bc-7e27550699da	0002	tehnična vaja	tehnična vaja
00420000-5673-f575-8437-a26d4cfa74d6	0003	lučna vaja	lučna vaja
00420000-5673-f575-6b31-849d95936101	0004	kostumska vaja	kostumska vaja
00420000-5673-f575-6a79-93b618404c9d	0005	foto vaja	foto vaja
00420000-5673-f575-b88a-2faa0b85915b	0006	1. glavna vaja	1. glavna vaja
00420000-5673-f575-3db3-8ca5f7bce0c9	0007	2. glavna vaja	2. glavna vaja
00420000-5673-f575-0068-2ed278ca3027	0008	1. generalka	1. generalka
00420000-5673-f575-9401-2d6230796df4	0009	2. generalka	2. generalka
00420000-5673-f575-579a-642c8b3de6d8	0010	odprta generalka	odprta generalka
00420000-5673-f575-8a5f-b5426126582f	0011	obnovitvena vaja	obnovitvena vaja
00420000-5673-f575-3a21-6027c786a977	0012	italijanka	krajša "obnovitvena" vaja
00420000-5673-f575-4c14-32ec195ec1e7	0013	pevska vaja	pevska vaja
00420000-5673-f575-937a-9a96d52277a4	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5673-f575-860e-0bc1171c3e98	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32848624)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32848438)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5673-f576-6aef-384e56d64d45	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROdY6njS/Yp33KNCwU736whYI3WSNtwrm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5673-f578-9fdd-89a7ba31ab07	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5673-f578-9e5e-c89639e45262	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5673-f578-c813-57fedccaa407	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5673-f578-f127-8ba1bf2901e1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5673-f578-7eba-d30c3e6abd4b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5673-f578-23a8-1c6dacf931b0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5673-f578-4a1a-1e141a9426a0	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5673-f578-3328-ba4771509186	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5673-f578-f78a-c4bbe070f7f3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5673-f578-a07e-92eb47bfd385	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5673-f578-877a-f741f8957ad7	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5673-f578-7e40-483864dd9b7d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5673-f578-047e-63d0179a7733	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5673-f578-a1b9-677f6c64b6f2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5673-f578-5585-8b9c8ffc9245	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5673-f578-05a8-de36018031af	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5673-f578-ce72-bc20be404c33	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5673-f578-adbc-1e5029cc2f86	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5673-f578-08b7-1057c3f4c914	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5673-f578-0819-3524fc27fa26	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5673-f578-d7b6-e36735e30fa6	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5673-f578-11b3-7e7083d44721	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5673-f578-d7a9-0947d9bfe057	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5673-f578-eb9e-3760e50f692f	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5673-f578-5747-c57d058e29cc	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5673-f578-50ee-06294277dcb0	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5673-f576-084a-4fc2971e3079	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32849066)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5673-f578-6345-70a8e68e9ca3	00160000-5673-f577-9562-0248a4c4e86d	\N	00140000-5673-f575-6e37-28e4a92ff6ea	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5673-f577-42c7-50ce5bee285f
000e0000-5673-f578-8adb-e4ab41164a4a	00160000-5673-f577-ca5c-c579aa73a717	\N	00140000-5673-f575-79fd-283baf4872a9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5673-f577-0daf-7b7323d949cc
000e0000-5673-f578-3f22-8a55ec86fffa	\N	\N	00140000-5673-f575-79fd-283baf4872a9	00190000-5673-f578-0feb-1c69984cd73c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5673-f577-42c7-50ce5bee285f
000e0000-5673-f578-da82-eab96ff45fc4	\N	\N	00140000-5673-f575-79fd-283baf4872a9	00190000-5673-f578-0feb-1c69984cd73c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5673-f577-42c7-50ce5bee285f
000e0000-5673-f578-a3d2-0bae7d37d8cb	\N	\N	00140000-5673-f575-79fd-283baf4872a9	00190000-5673-f578-0feb-1c69984cd73c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5673-f577-363d-4efcd88f7eb1
000e0000-5673-f578-2034-17f4ced40446	\N	\N	00140000-5673-f575-79fd-283baf4872a9	00190000-5673-f578-0feb-1c69984cd73c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5673-f577-363d-4efcd88f7eb1
\.


--
-- TOC entry 3136 (class 0 OID 32848723)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5673-f578-d2e8-3fc4b444e76b	\N	000e0000-5673-f578-8adb-e4ab41164a4a	1	
00200000-5673-f578-4592-c98c024080d5	\N	000e0000-5673-f578-8adb-e4ab41164a4a	2	
00200000-5673-f578-b864-6b1ea2074a82	\N	000e0000-5673-f578-8adb-e4ab41164a4a	3	
00200000-5673-f578-6f5c-77aaa1665cb9	\N	000e0000-5673-f578-8adb-e4ab41164a4a	4	
00200000-5673-f578-869f-53b01dac1bd4	\N	000e0000-5673-f578-8adb-e4ab41164a4a	5	
\.


--
-- TOC entry 3153 (class 0 OID 32848874)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32848989)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5673-f575-9ded-a15d06baa10a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5673-f575-bae9-ed9f38bfd915	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5673-f575-7a7c-dd0400baa48b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5673-f575-4079-496cd36dd243	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5673-f575-f890-aec7166d4d20	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5673-f575-3185-fac4059c856f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5673-f575-e5e1-221d01dd0963	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5673-f575-9c79-66fc8051494e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5673-f575-4bbb-9b267c7eed4c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5673-f575-f827-9a8161b25a91	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5673-f575-9688-942faf832bb2	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5673-f575-5a73-d2c5604dd463	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5673-f575-2732-51878ec3a70e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5673-f575-093d-873d6c152a24	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5673-f575-f401-ab7f9e856835	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5673-f575-d819-e33031637049	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5673-f575-e7b6-15507396a090	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5673-f575-803f-7331205303fd	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5673-f575-34b7-e958f5a28336	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5673-f575-aea4-b5d1091122c4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5673-f575-a559-2497d5f4f53a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5673-f575-7dfa-af09a789364e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5673-f575-7bd9-45da0039a1b7	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5673-f575-4b4a-23c41e5c1af5	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5673-f575-2ced-069240493935	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5673-f575-25a7-9719af192221	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5673-f575-71a8-1711e23c4e83	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5673-f575-cbac-31867aab0520	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32849371)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32849340)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32849383)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32848947)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5673-f578-4dbb-a2274527ee86	00090000-5673-f578-511e-418edb6bf67b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5673-f578-883d-326eba2628cf	00090000-5673-f578-d4d1-feebf20b25e1	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5673-f578-71d8-45e8585f573a	00090000-5673-f578-d533-1bb2d6f9d8ab	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5673-f578-4dfb-50bed105b3fb	00090000-5673-f578-6dc2-a231819bc640	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5673-f578-a3d7-8de93d922178	00090000-5673-f578-891f-02148a7cf733	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5673-f578-7370-f3d7d5b66b65	00090000-5673-f578-5e84-0ed03281839c	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32848767)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32849056)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5673-f575-6e37-28e4a92ff6ea	01	Drama	drama (SURS 01)
00140000-5673-f575-860d-2b8b0393bb43	02	Opera	opera (SURS 02)
00140000-5673-f575-d56b-d987f42a9fe9	03	Balet	balet (SURS 03)
00140000-5673-f575-3167-fa4834e4480b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5673-f575-3f67-e671d4080b9e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5673-f575-79fd-283baf4872a9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5673-f575-5253-3cc252b03d2f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32848937)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32848501)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32849115)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32849105)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32848492)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32848972)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32849014)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32849424)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32848755)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32848777)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32848782)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32849338)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32848650)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32849184)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32848933)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32848721)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32848688)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32848664)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32848839)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32849401)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32849408)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32849432)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32822017)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32848866)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32848622)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32848520)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32848584)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32848547)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32848481)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32848466)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32848872)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32848908)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32849051)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32848575)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32848610)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32849289)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32848845)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32848600)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32848740)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32848709)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32848701)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32848857)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32849298)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32849306)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32849276)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32849319)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32848890)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32848830)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32848821)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32849038)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32848965)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32848676)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32848437)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32848899)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32848455)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32848475)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32848917)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32848852)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32848801)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32848425)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32848413)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32848407)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32848985)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32848556)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32848812)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32849025)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32848509)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32849331)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32848790)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32848635)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32848450)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32849084)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32848730)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32848880)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32848997)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32849381)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32849365)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32849389)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32848955)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32848771)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32849064)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32848945)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32848765)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32848766)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32848764)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32848763)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32848762)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32848986)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32848987)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32848988)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32849403)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32849402)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32848577)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32848578)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32848873)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32849369)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32849368)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32849370)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32849367)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32849366)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32848859)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32848858)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32848731)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32848732)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32848934)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32848936)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32848935)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32848666)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32848665)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32849320)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32849053)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32849054)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32849055)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32849390)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32849089)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32849086)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32849090)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32849088)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32849087)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32848637)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32848636)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32848550)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32848900)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32848482)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32848483)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32848920)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32848919)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32848918)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32848587)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32848586)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32848588)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32848704)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32848702)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32848703)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32848415)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32848825)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32848823)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32848822)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32848824)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32848456)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32848457)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32848881)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32849425)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32848974)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32848973)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32849433)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32849434)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32848846)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32848966)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32848967)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32849189)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32849188)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32849185)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32849186)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32849187)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32848602)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32848601)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32848603)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32848894)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32848893)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32849299)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32849300)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32849119)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32849120)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32849117)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32849118)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32848956)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32848957)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32848834)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32848833)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32848831)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32848832)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32849107)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32849106)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32848677)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32848691)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32848690)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32848689)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32848692)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32848722)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32848710)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32848711)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32849290)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32849339)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32849409)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32849410)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32848522)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32848521)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32848557)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32848558)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32848772)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32848815)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32848814)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32848813)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32848757)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32848758)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32848761)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32848756)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32848760)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32848759)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32848576)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32848510)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32848511)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32848651)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32848653)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32848652)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32848654)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32848840)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32849052)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32849085)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32849026)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32849027)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32848548)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32848549)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32848946)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32848426)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32848623)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32848585)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32848414)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32849332)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32848892)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32848891)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32848791)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32848792)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32849116)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32848611)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32849065)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32849382)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32849307)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32849308)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32849015)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32848802)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32848476)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 32849605)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 32849610)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 32849635)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 32849625)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 32849600)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 32849620)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 32849630)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 32849615)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 32849805)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32849810)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 32849815)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 32849980)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 32849975)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 32849490)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 32849495)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32849720)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 32849960)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32849955)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32849965)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 32849950)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 32849945)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 32849715)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 32849710)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 32849590)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 32849595)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32849760)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32849770)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32849765)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 32849545)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 32849540)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32849700)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32849935)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 32849820)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32849825)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 32849830)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32849970)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 32849850)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 32849835)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 32849855)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32849845)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 32849840)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 32849535)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 32849530)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 32849475)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 32849470)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32849740)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 32849450)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 32849455)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 32849755)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32849750)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 32849745)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32849505)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 32849500)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 32849510)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 32849570)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 32849560)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32849565)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32849435)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 32849675)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 32849665)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 32849660)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 32849670)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 32849440)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32849445)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32849725)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32849995)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 32849800)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 32849795)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 32850000)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 32850005)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32849705)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 32849785)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 32849790)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 32849910)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32849905)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 32849890)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 32849895)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32849900)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32849520)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 32849515)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 32849525)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 32849735)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 32849730)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 32849920)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 32849925)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 32849880)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 32849885)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 32849870)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 32849875)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 32849775)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 32849780)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 32849695)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 32849690)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 32849680)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 32849685)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 32849865)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 32849860)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32849550)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32849555)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32849585)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 32849575)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 32849580)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32849915)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32849930)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32849940)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 32849985)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 32849990)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 32849465)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 32849460)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 32849480)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32849485)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32849640)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 32849655)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32849650)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 32849645)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-18 13:00:59 CET

--
-- PostgreSQL database dump complete
--

