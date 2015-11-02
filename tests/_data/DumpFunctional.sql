--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-02 15:22:08 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 252 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 252
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 24721899)
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
-- TOC entry 236 (class 1259 OID 24722507)
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
-- TOC entry 235 (class 1259 OID 24722490)
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
-- TOC entry 182 (class 1259 OID 24721892)
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
-- TOC entry 181 (class 1259 OID 24721890)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 226 (class 1259 OID 24722367)
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
-- TOC entry 229 (class 1259 OID 24722397)
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
-- TOC entry 250 (class 1259 OID 24722794)
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
-- TOC entry 203 (class 1259 OID 24722147)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
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
-- TOC entry 205 (class 1259 OID 24722178)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 24722720)
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
-- TOC entry 194 (class 1259 OID 24722044)
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
-- TOC entry 237 (class 1259 OID 24722520)
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
-- TOC entry 222 (class 1259 OID 24722321)
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
-- TOC entry 200 (class 1259 OID 24722118)
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
-- TOC entry 197 (class 1259 OID 24722084)
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
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 24722061)
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
-- TOC entry 211 (class 1259 OID 24722235)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 248 (class 1259 OID 24722775)
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
-- TOC entry 249 (class 1259 OID 24722787)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 24722809)
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
-- TOC entry 170 (class 1259 OID 24507014)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24722260)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 24722018)
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
-- TOC entry 185 (class 1259 OID 24721918)
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
-- TOC entry 189 (class 1259 OID 24721985)
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
-- TOC entry 186 (class 1259 OID 24721929)
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
-- TOC entry 178 (class 1259 OID 24721864)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 24721883)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 24722267)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 24722301)
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
-- TOC entry 232 (class 1259 OID 24722438)
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
-- TOC entry 188 (class 1259 OID 24721965)
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
-- TOC entry 191 (class 1259 OID 24722010)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 24722665)
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
-- TOC entry 212 (class 1259 OID 24722241)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 24721995)
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
-- TOC entry 202 (class 1259 OID 24722139)
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
-- TOC entry 198 (class 1259 OID 24722099)
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
-- TOC entry 199 (class 1259 OID 24722111)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 24722253)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 24722679)
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
-- TOC entry 241 (class 1259 OID 24722689)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 24722588)
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
-- TOC entry 242 (class 1259 OID 24722697)
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
-- TOC entry 218 (class 1259 OID 24722282)
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
-- TOC entry 210 (class 1259 OID 24722226)
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
-- TOC entry 209 (class 1259 OID 24722216)
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
-- TOC entry 231 (class 1259 OID 24722427)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 24722357)
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
-- TOC entry 196 (class 1259 OID 24722073)
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
-- TOC entry 175 (class 1259 OID 24721835)
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
-- TOC entry 174 (class 1259 OID 24721833)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 219 (class 1259 OID 24722295)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 24721873)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 24721857)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24722309)
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
-- TOC entry 213 (class 1259 OID 24722247)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 24722193)
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
-- TOC entry 173 (class 1259 OID 24721822)
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
-- TOC entry 172 (class 1259 OID 24721814)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 24721809)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 227 (class 1259 OID 24722374)
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
-- TOC entry 187 (class 1259 OID 24721957)
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
-- TOC entry 208 (class 1259 OID 24722203)
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
-- TOC entry 230 (class 1259 OID 24722415)
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
-- TOC entry 184 (class 1259 OID 24721908)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 243 (class 1259 OID 24722708)
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
-- TOC entry 206 (class 1259 OID 24722183)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 24722030)
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
-- TOC entry 176 (class 1259 OID 24721844)
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
-- TOC entry 234 (class 1259 OID 24722465)
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
-- TOC entry 201 (class 1259 OID 24722129)
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
-- TOC entry 217 (class 1259 OID 24722274)
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
-- TOC entry 228 (class 1259 OID 24722388)
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
-- TOC entry 246 (class 1259 OID 24722755)
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
-- TOC entry 245 (class 1259 OID 24722727)
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
-- TOC entry 247 (class 1259 OID 24722767)
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
-- TOC entry 224 (class 1259 OID 24722346)
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
-- TOC entry 204 (class 1259 OID 24722172)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 233 (class 1259 OID 24722455)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 223 (class 1259 OID 24722336)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2238 (class 2604 OID 24721895)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 24721838)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3093 (class 0 OID 24721899)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5637-718d-db8a-02b6514e9c2d	10	30	Otroci	Abonma za otroke	200
000a0000-5637-718d-619a-51db266152a1	20	60	Mladina	Abonma za mladino	400
000a0000-5637-718d-364e-91425547e417	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3146 (class 0 OID 24722507)
-- Dependencies: 236
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5637-718d-78c2-6de594011d09	000d0000-5637-718d-8f84-320a5b90411e	\N	00090000-5637-718d-0f16-4d0977b3a81b	000b0000-5637-718d-1b87-9a86db94ec8b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5637-718d-4e6e-49a91e8ad696	000d0000-5637-718d-3bb2-44ed84509a6c	00100000-5637-718d-7df8-e640898436bd	00090000-5637-718d-ad3e-d64b84ab61c2	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5637-718d-e535-c02ad2ac8f92	000d0000-5637-718d-4260-fdf7643e5abb	00100000-5637-718d-a3b0-5905fc2d4dae	00090000-5637-718d-5a7f-a002282491e0	\N	0003	t	\N	2015-11-02	\N	2	t	\N	f	f
000c0000-5637-718d-a631-6b6810bb64e1	000d0000-5637-718d-7987-882bb2abb4ce	\N	00090000-5637-718d-e345-4beac6374c26	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5637-718d-4d3e-301150e93e88	000d0000-5637-718d-a9ef-255e23127f91	\N	00090000-5637-718d-d93a-447f9245d110	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5637-718d-b2c7-c0eaceb44e66	000d0000-5637-718d-9140-36dd38ce32c0	\N	00090000-5637-718d-dcfb-0aed8e3eb57a	000b0000-5637-718d-70af-5bb3c95a804a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5637-718d-1664-cbff0bcc6585	000d0000-5637-718d-8aab-293835fed067	00100000-5637-718d-f806-ae2b0a0faf49	00090000-5637-718d-8842-6a16874c2514	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5637-718d-ab31-ea71a1704496	000d0000-5637-718d-24b6-62f40fa078cc	\N	00090000-5637-718d-12d1-348cda69f1cb	000b0000-5637-718d-d962-aac965b5f7d9	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5637-718d-2c23-debd92b17396	000d0000-5637-718d-8aab-293835fed067	00100000-5637-718d-5db4-127f6d179772	00090000-5637-718d-4394-708c2204a466	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5637-718e-a970-05cb8f6bf40b	000d0000-5637-718d-8aab-293835fed067	00100000-5637-718d-baf7-2547792ff05f	00090000-5637-718d-5763-e76957fb7127	\N	0010	t	\N	2015-11-02	\N	16	f	\N	f	t
000c0000-5637-718e-1a7d-68760e4309ff	000d0000-5637-718d-8aab-293835fed067	00100000-5637-718d-3602-c7a0292c19f6	00090000-5637-718d-89c5-5f43441c6d7f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5637-718e-3210-051553264724	000d0000-5637-718d-b025-0e0a9a506a58	00100000-5637-718d-7df8-e640898436bd	00090000-5637-718d-ad3e-d64b84ab61c2	000b0000-5637-718d-8a1f-8e6bf03f3e4f	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3145 (class 0 OID 24722490)
-- Dependencies: 235
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 24721892)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3136 (class 0 OID 24722367)
-- Dependencies: 226
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5637-718d-4663-631d7debbab6	00160000-5637-718d-30ba-2a5da54cb5b7	00090000-5637-718d-588c-af46b25638dc	aizv	10	t
003d0000-5637-718d-a5fb-df0aa629fddd	00160000-5637-718d-30ba-2a5da54cb5b7	00090000-5637-718d-e685-33d010cc658c	apri	14	t
003d0000-5637-718d-9a05-d76faf630c31	00160000-5637-718d-f8f6-93f0b7147848	00090000-5637-718d-5204-56f9cd659814	aizv	11	t
003d0000-5637-718d-a0b7-392bd047102a	00160000-5637-718d-c332-16c2924aa761	00090000-5637-718d-151c-4470df0f6719	aizv	12	t
003d0000-5637-718d-f3cb-24d896e5be0c	00160000-5637-718d-30ba-2a5da54cb5b7	00090000-5637-718d-dc9b-bcca192964df	apri	18	f
\.


--
-- TOC entry 3139 (class 0 OID 24722397)
-- Dependencies: 229
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5637-718d-30ba-2a5da54cb5b7	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5637-718d-f8f6-93f0b7147848	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5637-718d-c332-16c2924aa761	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3160 (class 0 OID 24722794)
-- Dependencies: 250
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 24722147)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5637-718d-f065-fe6f434f005b	\N	\N	00200000-5637-718d-97d4-9501535f32cf	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5637-718d-668a-29748ade5593	\N	\N	00200000-5637-718d-58b9-990aefffbfe8	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5637-718d-0634-b244a19ef740	\N	\N	00200000-5637-718d-3346-618be41e0a57	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5637-718d-32a5-2a69b5549652	\N	\N	00200000-5637-718d-3eb0-753c520ddf8c	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5637-718d-cb8d-fe15a8c2c97c	\N	\N	00200000-5637-718d-ee5f-9c98806e558d	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3115 (class 0 OID 24722178)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 24722720)
-- Dependencies: 244
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 24722044)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5637-718b-f24e-5f27373c28c1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5637-718b-874c-9026def0c6df	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5637-718b-ba23-1321b0298ac5	AL	ALB	008	Albania 	Albanija	\N
00040000-5637-718b-6a08-abb0752ac51d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5637-718b-7437-ea2c2e1ff3c5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5637-718b-e48e-bb8bc61c200d	AD	AND	020	Andorra 	Andora	\N
00040000-5637-718b-3689-7678935b7c6a	AO	AGO	024	Angola 	Angola	\N
00040000-5637-718b-564c-d856d469ec51	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5637-718b-5f41-b1e8dd171e67	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5637-718b-059f-eba824c47b7c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5637-718b-e307-c692a353fabb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5637-718b-0038-13a1aab9a995	AM	ARM	051	Armenia 	Armenija	\N
00040000-5637-718b-657e-c62a02599094	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5637-718b-22ff-661094671dea	AU	AUS	036	Australia 	Avstralija	\N
00040000-5637-718b-43c4-717a750c963c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5637-718b-650c-3282f9192e17	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5637-718b-8fdb-4483b2366da1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5637-718b-bd05-6f856cef7fed	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5637-718b-f84f-d46b8d3d38e6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5637-718b-b437-f74b49ead215	BB	BRB	052	Barbados 	Barbados	\N
00040000-5637-718b-5101-36b204b4b1e8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5637-718b-1545-48e3598f0834	BE	BEL	056	Belgium 	Belgija	\N
00040000-5637-718b-2358-9eb987ccfde1	BZ	BLZ	084	Belize 	Belize	\N
00040000-5637-718b-47cb-2a5a0b9a9da1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5637-718b-2a61-4ecd87c146fe	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5637-718b-170f-daa10120a6b1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5637-718b-6085-2a1a5a25cb74	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5637-718b-c54d-ebfbb82f20d1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5637-718b-b680-d095aba6630a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5637-718b-fd27-5d91609d1a86	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5637-718b-25f3-d198e5fc18e8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5637-718b-a534-d1e4b860633a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5637-718b-de60-707020c95a58	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5637-718b-ec69-9a978d360ae1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5637-718b-186e-548c2bfa0db1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5637-718b-3063-f0b7c61eb56e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5637-718b-2773-651b0491d314	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5637-718b-f763-f9ca0c7846af	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5637-718b-4948-2621fb8c86a0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5637-718b-1d6b-f2318a5719b9	CA	CAN	124	Canada 	Kanada	\N
00040000-5637-718b-8306-6f06c8ede5eb	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5637-718b-652a-cae256f6af00	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5637-718b-31f5-6b625b666e77	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5637-718b-870a-fb77f8f01d1e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5637-718b-947c-4c7cd9a618cf	CL	CHL	152	Chile 	Čile	\N
00040000-5637-718b-63b4-1bfb7476ef3c	CN	CHN	156	China 	Kitajska	\N
00040000-5637-718b-b3c9-66b7135d1d24	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5637-718b-948c-7adc3bbd92c9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5637-718b-da24-2c98c9dc7690	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5637-718b-e91e-e81345eeb237	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5637-718b-8dee-31df30f21062	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5637-718b-4e0e-a78ef580071e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5637-718b-0cbb-182e63477090	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5637-718b-6d5e-4cfbc22faacb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5637-718b-09ed-e45cbc012e50	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5637-718b-ced6-e30c81f87322	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5637-718b-5d69-0dc11162cc7c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5637-718b-211f-c6e95afe669a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5637-718b-3c6b-da3c3eee82ba	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5637-718b-fd54-15f0a261ff65	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5637-718b-4d11-a24c4648f245	DK	DNK	208	Denmark 	Danska	\N
00040000-5637-718b-9358-9844ae16d9cd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5637-718b-19e4-c1f791507af4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5637-718b-ab9d-7b61d78cde37	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5637-718b-7a6c-d09bcbc94adb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5637-718b-10f4-f2edd5200d67	EG	EGY	818	Egypt 	Egipt	\N
00040000-5637-718b-e3e6-bf13a01e6760	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5637-718b-0317-14a97a7af360	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5637-718b-3a20-8a4ce83e5f91	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5637-718b-c9c4-45dce5fd7484	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5637-718b-15c5-630f73687f81	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5637-718b-db69-08728fba7bd0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5637-718b-ac51-96f3f0ee84cf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5637-718b-7a5e-4c3a48c31860	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5637-718b-dc64-db9ab22c8e03	FI	FIN	246	Finland 	Finska	\N
00040000-5637-718b-ba65-3efbbc897b72	FR	FRA	250	France 	Francija	\N
00040000-5637-718b-aa95-108d3bdc94a9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5637-718b-106e-6aa98a94dfb7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5637-718b-aa1d-bdf4d1671135	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5637-718b-29ee-6b58c69c3cdf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5637-718b-752a-8abc42a7cc1e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5637-718b-fbac-4e96806adce1	GM	GMB	270	Gambia 	Gambija	\N
00040000-5637-718b-8c67-afd45e0b51fa	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5637-718b-17ab-965310a7b1ed	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5637-718b-542c-0314da05c92c	GH	GHA	288	Ghana 	Gana	\N
00040000-5637-718b-6d8a-9a120c7877a7	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5637-718b-5145-8cdc7378b861	GR	GRC	300	Greece 	Grčija	\N
00040000-5637-718b-6490-14dd62fb2a6a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5637-718b-b8bb-ac790338eb3f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5637-718b-7440-670c79b41830	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5637-718b-3c05-f03648795a50	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5637-718b-cba3-c6ce0624ae27	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5637-718b-b383-c12ed250a7b3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5637-718b-bed0-5a6c0709fb27	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5637-718b-3779-3273e5823370	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5637-718b-7ca0-2d91bef75b9c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5637-718b-0cad-e64ece09cfb3	HT	HTI	332	Haiti 	Haiti	\N
00040000-5637-718b-d6a1-40770cfe2287	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5637-718b-5c70-981ea4a1fe9f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5637-718b-4bfb-601bfa89554c	HN	HND	340	Honduras 	Honduras	\N
00040000-5637-718b-574c-c16f7a59f31c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5637-718b-1c2b-f49f0f68f4bd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5637-718b-8cde-c60bb751c435	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5637-718b-6b4c-ae03af40b326	IN	IND	356	India 	Indija	\N
00040000-5637-718b-dd66-935778b5a0d5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5637-718b-266d-99d5a63b0e37	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5637-718b-df0f-8c5338e7fbf7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5637-718b-2513-53a262c03992	IE	IRL	372	Ireland 	Irska	\N
00040000-5637-718b-137b-551b3f33340d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5637-718b-4e48-f2166fcf344d	IL	ISR	376	Israel 	Izrael	\N
00040000-5637-718b-fc0e-79576579ec49	IT	ITA	380	Italy 	Italija	\N
00040000-5637-718b-21f5-cd1d7a80f7f0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5637-718b-ef07-30773ba2d675	JP	JPN	392	Japan 	Japonska	\N
00040000-5637-718b-701e-a4168f3ac7f7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5637-718b-46ac-985c77d75b9f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5637-718b-7bf9-2855cb40e26a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5637-718b-12a6-3c54ec209c73	KE	KEN	404	Kenya 	Kenija	\N
00040000-5637-718b-1ba8-729ddb0fa724	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5637-718b-6d0e-61f3f5be35f9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5637-718b-fb83-cd10d61894b6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5637-718b-6fd5-3d581fb4d0c8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5637-718b-8461-916de535c7e7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5637-718b-f68d-dc0a3dabf642	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5637-718b-7cb5-ecea04e4fd3a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5637-718b-5f5f-e3b74d4dc315	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5637-718b-6206-472938db4bad	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5637-718b-010b-69a332c1cb86	LR	LBR	430	Liberia 	Liberija	\N
00040000-5637-718b-46f2-6c08039627a2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5637-718b-0caa-4ff3a4bda1c8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5637-718b-3c09-9c3d104ac533	LT	LTU	440	Lithuania 	Litva	\N
00040000-5637-718b-8b85-cb3eb28272d3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5637-718b-6347-32befa8c099e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5637-718b-aed5-8d05fc7251b0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5637-718b-78a7-20d7401fe562	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5637-718b-e77b-cd0df39cca88	MW	MWI	454	Malawi 	Malavi	\N
00040000-5637-718b-415c-15c5e6842b2d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5637-718b-0d0f-6a6236b74e4a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5637-718b-2847-68bf8c8998bc	ML	MLI	466	Mali 	Mali	\N
00040000-5637-718b-4413-fbbbeca3a036	MT	MLT	470	Malta 	Malta	\N
00040000-5637-718b-dcbc-1ebb9c013bdf	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5637-718b-a87d-8959d1ee2f3b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5637-718b-8572-1a1407c729aa	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5637-718b-2a68-791eacc03357	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5637-718b-226e-0cd38ce60e27	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5637-718b-9c8d-2a2bfbacb036	MX	MEX	484	Mexico 	Mehika	\N
00040000-5637-718b-d457-fa8eff30cc61	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5637-718b-032e-c785c79b7fad	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5637-718b-1042-75914e7a6841	MC	MCO	492	Monaco 	Monako	\N
00040000-5637-718b-1a71-30c9644fe4cf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5637-718b-34aa-ef354e816070	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5637-718b-f8b4-39e427349447	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5637-718b-b606-e68b50a25348	MA	MAR	504	Morocco 	Maroko	\N
00040000-5637-718b-bada-5947bc43e931	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5637-718b-491e-865ed8f00160	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5637-718b-b478-4c8485bb4085	NA	NAM	516	Namibia 	Namibija	\N
00040000-5637-718b-3f50-0cfd0e2fe2e7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5637-718b-1265-3149f13de089	NP	NPL	524	Nepal 	Nepal	\N
00040000-5637-718b-62b8-21b2544c5ac3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5637-718b-86e8-6d3b12710c50	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5637-718b-4c5b-da4ef13bcf5d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5637-718b-5d26-84f6852a20cb	NE	NER	562	Niger 	Niger 	\N
00040000-5637-718b-3d41-f5c4c6b5cf99	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5637-718b-e4af-67178a067054	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5637-718b-c527-7c4871ef33a4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5637-718b-7c9a-606bcc6e31e4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5637-718b-e489-ad757e322dce	NO	NOR	578	Norway 	Norveška	\N
00040000-5637-718b-653a-fa0d1e47eb91	OM	OMN	512	Oman 	Oman	\N
00040000-5637-718b-8c80-bdf5c1b67a8d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5637-718b-7842-5f2795b9b665	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5637-718b-07aa-5813a952a688	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5637-718b-95dc-5cd1d23e0838	PA	PAN	591	Panama 	Panama	\N
00040000-5637-718b-15a6-dcefd087436c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5637-718b-9fa2-36130f6309af	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5637-718b-da37-4d1021d46c3a	PE	PER	604	Peru 	Peru	\N
00040000-5637-718b-c242-0860d623d953	PH	PHL	608	Philippines 	Filipini	\N
00040000-5637-718b-45e0-ef96f1798105	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5637-718b-2737-d5d6178e646c	PL	POL	616	Poland 	Poljska	\N
00040000-5637-718b-66be-aa50a2f47df5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5637-718b-8520-c2284b51efb4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5637-718b-ced6-66eb2bc8c0b6	QA	QAT	634	Qatar 	Katar	\N
00040000-5637-718b-8a9c-20fd0a166b6b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5637-718b-f84c-4c94c5509230	RO	ROU	642	Romania 	Romunija	\N
00040000-5637-718b-8909-92514619e0a0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5637-718b-392b-aaa549732953	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5637-718b-e9cf-5360d1cfef6b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5637-718b-9210-1371a9206ca0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5637-718b-fbbb-b5f3c39675e1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5637-718b-d497-3e0ed4c80291	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5637-718b-40cf-a212f681d9cc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5637-718b-c30d-953e390d4f2e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5637-718b-45ed-9ab274808e7e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5637-718b-5e88-e6eb8d0dba85	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5637-718b-4706-aeff83337329	SM	SMR	674	San Marino 	San Marino	\N
00040000-5637-718b-ed89-5fa7c87d3985	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5637-718b-c6ba-d2c8e686fc16	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5637-718b-91dd-a2a5ce06312e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5637-718b-2ac4-85700c2d419f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5637-718b-1496-93d976c80960	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5637-718b-fef3-65000e1be204	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5637-718b-aa8b-a2e7bd4052bc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5637-718b-a823-d0d473fc1bdd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5637-718b-67b7-0b5de98f298e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5637-718b-561f-80619179a268	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5637-718b-15e4-cda356ab101c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5637-718b-2b2d-c02280d81e21	SO	SOM	706	Somalia 	Somalija	\N
00040000-5637-718b-5f09-b9c86a114438	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5637-718b-7a1c-02f789129513	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5637-718b-949e-713ffdb69102	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5637-718b-18ac-bdf9ddce93e1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5637-718b-4a80-1ef731503ff1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5637-718b-e227-ad5d8c4861f2	SD	SDN	729	Sudan 	Sudan	\N
00040000-5637-718b-aaa2-52679db3fab2	SR	SUR	740	Suriname 	Surinam	\N
00040000-5637-718b-ab57-dd5290b1a143	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5637-718b-2157-a86f63da5c10	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5637-718b-f7b7-085ef0ce4ebb	SE	SWE	752	Sweden 	Švedska	\N
00040000-5637-718b-9085-d941722c5c98	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5637-718b-2530-d24beea14837	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5637-718b-4229-9352032b33aa	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5637-718b-7c43-d8c0574bcff0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5637-718b-b5a0-cb638182c6bb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5637-718b-2221-7c0c99a858c7	TH	THA	764	Thailand 	Tajska	\N
00040000-5637-718b-2042-0c7fefcc4b74	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5637-718b-3a55-df82c78dd0d1	TG	TGO	768	Togo 	Togo	\N
00040000-5637-718b-d3d3-0952aa762920	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5637-718b-87d7-bb0d51639276	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5637-718b-a43b-191cf5b2d5bb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5637-718b-1d8e-84512f56c799	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5637-718b-728a-da09290028bb	TR	TUR	792	Turkey 	Turčija	\N
00040000-5637-718b-6aef-ccc9d8251419	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5637-718b-bef0-6cad6aadd91e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5637-718b-5466-50d1b1a9e226	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5637-718b-6db7-5787c97802ca	UG	UGA	800	Uganda 	Uganda	\N
00040000-5637-718b-48ce-7c51398e2fbc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5637-718b-d943-f83701c1202f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5637-718b-5769-abdc70e19817	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5637-718b-7ece-e4ebded98084	US	USA	840	United States 	Združene države Amerike	\N
00040000-5637-718b-bb66-ed370bde1e62	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5637-718b-2e1c-15005c3434dc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5637-718b-35a9-f6d607b35470	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5637-718b-5d87-9d163219cacf	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5637-718b-a02a-d6298ad43992	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5637-718b-d2e7-03df18b16be6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5637-718b-cec2-c1ee5dd0f7b6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5637-718b-a696-4744cb33b21a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5637-718b-6b5e-8047c1115574	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5637-718b-de38-372f2ab7b1ea	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5637-718b-5f33-493361d25f31	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5637-718b-d58f-fc8e1398ccb1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5637-718b-516b-8ffba072e09f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3147 (class 0 OID 24722520)
-- Dependencies: 237
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5637-718d-31e2-759271be22a3	000e0000-5637-718d-6402-fb30b671e13b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5637-718b-93a6-d5b92736d774	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5637-718d-d45e-29153ed4a8cc	000e0000-5637-718d-294d-c16996f08972	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5637-718b-0bf1-2722b7bf299a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5637-718d-6839-b67c3c0054fc	000e0000-5637-718d-818d-c7fc74053142	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5637-718b-93a6-d5b92736d774	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5637-718d-c988-ae15ccda1d61	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5637-718d-52c4-3337d241fad7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3132 (class 0 OID 24722321)
-- Dependencies: 222
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5637-718d-8aab-293835fed067	000e0000-5637-718d-294d-c16996f08972	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5637-718b-216a-3760dc6955cb
000d0000-5637-718d-8f84-320a5b90411e	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-78c2-6de594011d09	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5637-718b-216a-3760dc6955cb
000d0000-5637-718d-3bb2-44ed84509a6c	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-4e6e-49a91e8ad696	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5637-718b-8c2a-5389c3338a69
000d0000-5637-718d-4260-fdf7643e5abb	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-e535-c02ad2ac8f92	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5637-718b-9055-3405da45f8a8
000d0000-5637-718d-7987-882bb2abb4ce	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-a631-6b6810bb64e1	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5637-718b-d6ad-3ad24ddf3470
000d0000-5637-718d-a9ef-255e23127f91	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-4d3e-301150e93e88	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5637-718b-d6ad-3ad24ddf3470
000d0000-5637-718d-9140-36dd38ce32c0	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-b2c7-c0eaceb44e66	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5637-718b-216a-3760dc6955cb
000d0000-5637-718d-24b6-62f40fa078cc	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718d-ab31-ea71a1704496	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5637-718b-2ce8-6106e59a73e9
000d0000-5637-718d-b025-0e0a9a506a58	000e0000-5637-718d-294d-c16996f08972	000c0000-5637-718e-3210-051553264724	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5637-718b-30bf-e7a4744ae470
\.


--
-- TOC entry 3110 (class 0 OID 24722118)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 24722084)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 24722061)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5637-718d-2114-7f265b46f0e9	00080000-5637-718d-526b-cb305a929105	00090000-5637-718d-5763-e76957fb7127	AK		igralka
\.


--
-- TOC entry 3121 (class 0 OID 24722235)
-- Dependencies: 211
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 24722775)
-- Dependencies: 248
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 24722787)
-- Dependencies: 249
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 24722809)
-- Dependencies: 251
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 24507014)
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
\.


--
-- TOC entry 3125 (class 0 OID 24722260)
-- Dependencies: 215
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 24722018)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5637-718c-4891-a5b3f218db35	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5637-718c-eb6d-122cb0def931	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5637-718c-2a8a-335835ae0869	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5637-718c-5d34-96d35c29d81e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5637-718c-c781-3d6f0c86fe06	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5637-718c-3703-d6a24913b512	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5637-718c-05aa-30d675cd81bf	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5637-718c-91a8-ce4fcae76e43	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5637-718c-f7d1-23323d99e95b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5637-718c-03ad-67d6fcfbab9a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5637-718c-153f-9406f82c0611	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5637-718c-0472-80763810b901	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5637-718c-b13b-50253b431af9	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5637-718c-045a-623e0811c432	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5637-718c-2614-76ec9e60c633	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5637-718d-b28e-17febe8de244	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5637-718d-508d-d01685b1fe1c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5637-718d-bded-bc79d1a2867d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5637-718d-69a7-dd22a1e75144	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5637-718d-27ef-f96e94a0e781	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5637-718f-c79e-7dc883be1a50	application.tenant.maticnopodjetje	string	s:36:"00080000-5637-718f-167b-202b3386f811";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3095 (class 0 OID 24721918)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5637-718d-d530-7608fcf12850	00000000-5637-718d-b28e-17febe8de244	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5637-718d-64b3-bf2a9dc52960	00000000-5637-718d-b28e-17febe8de244	00010000-5637-718c-5585-47fa92caeda1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5637-718d-0f03-1f9ab7f30aef	00000000-5637-718d-508d-d01685b1fe1c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3099 (class 0 OID 24721985)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5637-718d-be0e-eca8c0d00663	\N	00100000-5637-718d-7df8-e640898436bd	00100000-5637-718d-a3b0-5905fc2d4dae	01	Gledališče Nimbis
00410000-5637-718d-6d47-2366b34af76e	00410000-5637-718d-be0e-eca8c0d00663	00100000-5637-718d-7df8-e640898436bd	00100000-5637-718d-a3b0-5905fc2d4dae	02	Tehnika
\.


--
-- TOC entry 3096 (class 0 OID 24721929)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5637-718d-0f16-4d0977b3a81b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5637-718d-e345-4beac6374c26	00010000-5637-718d-1ae4-696807591c0a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5637-718d-5a7f-a002282491e0	00010000-5637-718d-a352-82309267f331	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5637-718d-4394-708c2204a466	00010000-5637-718d-32f5-68ebc21125b2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5637-718d-e419-98409051a75d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5637-718d-dcfb-0aed8e3eb57a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5637-718d-89c5-5f43441c6d7f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5637-718d-8842-6a16874c2514	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5637-718d-5763-e76957fb7127	00010000-5637-718d-336f-dfa40d3b688f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5637-718d-ad3e-d64b84ab61c2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5637-718d-4c4e-139d95a2874a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5637-718d-d93a-447f9245d110	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5637-718d-12d1-348cda69f1cb	00010000-5637-718d-3602-05de98377792	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5637-718d-588c-af46b25638dc	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-718d-e685-33d010cc658c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-718d-5204-56f9cd659814	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-718d-151c-4470df0f6719	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5637-718d-dc9b-bcca192964df	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5637-718d-3ba7-a1088104ee8a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-718d-2ab5-52b10b7ffa3e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5637-718d-e75f-8ac430a9864d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3088 (class 0 OID 24721864)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5637-718b-a9dc-1752bccaceab	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5637-718b-6879-a957d6c6b5d8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5637-718b-f4d9-e704b350923c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5637-718b-9a7b-de7f16cdaaed	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5637-718b-5c3e-8ecc5eabca05	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5637-718b-52ab-2f6e84eaa87a	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5637-718b-e4b7-87e0594fefb1	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5637-718b-7e70-0784aea7d2c9	Abonma-read	Abonma - branje	t
00030000-5637-718b-274d-bad1cff61552	Abonma-write	Abonma - spreminjanje	t
00030000-5637-718b-ba3f-d05b86b786b4	Alternacija-read	Alternacija - branje	t
00030000-5637-718b-b974-46a29a9a1039	Alternacija-write	Alternacija - spreminjanje	t
00030000-5637-718b-6bd4-b26c77b04a6e	Arhivalija-read	Arhivalija - branje	t
00030000-5637-718b-e478-6b425cdff216	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5637-718b-6523-b7f669bdded4	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5637-718b-8395-9d35f62f6f91	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5637-718b-3093-6305805be19e	Besedilo-read	Besedilo - branje	t
00030000-5637-718b-4025-7135c4af83a4	Besedilo-write	Besedilo - spreminjanje	t
00030000-5637-718b-e8cb-e840e61d59d6	DogodekIzven-read	DogodekIzven - branje	t
00030000-5637-718b-09bc-78a11cdcbedc	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5637-718b-b57c-25cf08aa9f6d	Dogodek-read	Dogodek - branje	t
00030000-5637-718b-d277-df082c3f91dd	Dogodek-write	Dogodek - spreminjanje	t
00030000-5637-718b-eb29-904caad35493	DrugiVir-read	DrugiVir - branje	t
00030000-5637-718b-fdeb-d1de801cfb30	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5637-718b-d1ba-c45ca22816b2	Drzava-read	Drzava - branje	t
00030000-5637-718b-b223-9557768ad301	Drzava-write	Drzava - spreminjanje	t
00030000-5637-718b-fafb-a219dc10d82a	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5637-718b-89e7-34170cda393b	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5637-718b-712e-64cd87e958ef	Funkcija-read	Funkcija - branje	t
00030000-5637-718b-9566-2ca1fc9f49eb	Funkcija-write	Funkcija - spreminjanje	t
00030000-5637-718b-0e39-809bf71cc851	Gostovanje-read	Gostovanje - branje	t
00030000-5637-718b-8492-cb27de5f932e	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5637-718b-2291-a3242b192f6a	Gostujoca-read	Gostujoca - branje	t
00030000-5637-718b-fcd3-79246bd8ee8b	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5637-718b-a565-f9a07753f4c1	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5637-718b-618a-e9ecd835d08e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5637-718b-cf80-3b08abea7331	Kupec-read	Kupec - branje	t
00030000-5637-718b-6f9b-6b9a04c03e2a	Kupec-write	Kupec - spreminjanje	t
00030000-5637-718b-e743-572d26a62631	NacinPlacina-read	NacinPlacina - branje	t
00030000-5637-718b-837d-610fe86afb70	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5637-718b-b3f2-638f15f28736	Option-read	Option - branje	t
00030000-5637-718b-77cf-85b5ca73d176	Option-write	Option - spreminjanje	t
00030000-5637-718b-836b-9aa259123f6e	OptionValue-read	OptionValue - branje	t
00030000-5637-718b-0c34-4a84946e6742	OptionValue-write	OptionValue - spreminjanje	t
00030000-5637-718b-daac-59cabec0357b	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5637-718b-cd7d-ca412ec86172	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5637-718b-2ccb-c0d2206aa7ce	Oseba-read	Oseba - branje	t
00030000-5637-718b-0953-14c43ec29be4	Oseba-write	Oseba - spreminjanje	t
00030000-5637-718b-a288-98584d89d6d6	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5637-718b-c850-ded33b0eb7dc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5637-718b-ed92-db002413b525	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5637-718b-0410-49e18ba8acf1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5637-718b-d01c-9e169aab7a22	Pogodba-read	Pogodba - branje	t
00030000-5637-718b-f181-57afb9043c5a	Pogodba-write	Pogodba - spreminjanje	t
00030000-5637-718b-c63a-fba185f29fde	Popa-read	Popa - branje	t
00030000-5637-718b-8e83-faae724c75e3	Popa-write	Popa - spreminjanje	t
00030000-5637-718b-71d2-1a5f4ec23b32	Posta-read	Posta - branje	t
00030000-5637-718b-7aef-8f10ce60be78	Posta-write	Posta - spreminjanje	t
00030000-5637-718b-9da6-f6af3b1b1e0e	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5637-718b-87c2-e307f494133a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5637-718b-d9a8-945d8b5789b0	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5637-718b-bc8c-8c054348667c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5637-718b-19d1-e30fb7959c91	PostniNaslov-read	PostniNaslov - branje	t
00030000-5637-718b-1837-6ca8a8da8d2a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5637-718b-fcc0-5c021289c6f3	Predstava-read	Predstava - branje	t
00030000-5637-718b-5cf1-d87cec263422	Predstava-write	Predstava - spreminjanje	t
00030000-5637-718b-d82c-515cc683bbcf	Praznik-read	Praznik - branje	t
00030000-5637-718b-a7fb-de22b7aa9a46	Praznik-write	Praznik - spreminjanje	t
00030000-5637-718b-5883-67bb3357545c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5637-718b-045c-f4644b1b77cd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5637-718b-642c-c6f41e022853	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5637-718b-8013-bbbb7041e2ae	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5637-718b-5ddd-2b297baee682	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5637-718b-ae41-abd6e30728b3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5637-718b-180b-60f5a1c23f18	ProgramDela-read	ProgramDela - branje	t
00030000-5637-718b-1b7d-2fcf33821982	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5637-718b-3582-9ca7da176527	ProgramFestival-read	ProgramFestival - branje	t
00030000-5637-718b-00ab-9d991c5a56b3	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5637-718b-d28d-a01ac5595846	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5637-718b-b203-805269da8e84	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5637-718b-3786-95d5d81be55b	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5637-718b-a3d8-e3004582442d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5637-718b-ab60-3bd2b37226f2	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5637-718b-5c40-b4037256a985	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5637-718b-f251-c48a049d90f7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5637-718b-13ce-a9110ab4e30e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5637-718b-b479-07b88e8b75e5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5637-718b-c168-bdf6f8dc43d0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5637-718b-3e7c-d85b51a5a10d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5637-718b-1eec-e5502155d508	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5637-718b-0b66-3791bd7e7593	ProgramRazno-read	ProgramRazno - branje	t
00030000-5637-718b-3722-bc3d4bef2eb9	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5637-718b-379b-8087af465b8f	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5637-718b-aa46-c0ed1c610ccd	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5637-718b-ce5b-6da0a8ad5ad3	Prostor-read	Prostor - branje	t
00030000-5637-718b-5202-6c41a6374c32	Prostor-write	Prostor - spreminjanje	t
00030000-5637-718b-dc8c-7cc3e864464c	Racun-read	Racun - branje	t
00030000-5637-718b-aaaa-5ec4a63f7646	Racun-write	Racun - spreminjanje	t
00030000-5637-718b-66a6-2705767656d4	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5637-718b-23a9-c4cb17867bd9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5637-718b-3348-4c937ccd3916	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5637-718b-9eff-b8930d1b8220	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5637-718b-5f64-178a4fa687e2	Rekvizit-read	Rekvizit - branje	t
00030000-5637-718b-4e34-ad9a926b7096	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5637-718b-d28d-019a67ca3bbc	Revizija-read	Revizija - branje	t
00030000-5637-718b-f021-aa580df63c8e	Revizija-write	Revizija - spreminjanje	t
00030000-5637-718b-0d6d-5464c6245c3e	Rezervacija-read	Rezervacija - branje	t
00030000-5637-718b-4a24-df61488b8bb2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5637-718b-585c-858e2c331bc0	SedezniRed-read	SedezniRed - branje	t
00030000-5637-718b-1054-87e10c10c871	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5637-718b-27ea-00d94f1f4963	Sedez-read	Sedez - branje	t
00030000-5637-718b-d448-2846d391cc2e	Sedez-write	Sedez - spreminjanje	t
00030000-5637-718b-42e8-595ea74f95d7	Sezona-read	Sezona - branje	t
00030000-5637-718b-0a81-1be6c0f85766	Sezona-write	Sezona - spreminjanje	t
00030000-5637-718b-8f1c-6aa2485975d3	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5637-718b-e1fc-b048a9658c4f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5637-718b-4d08-712bc81bbab8	Stevilcenje-read	Stevilcenje - branje	t
00030000-5637-718b-fc8f-2a8fe8500514	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5637-718b-94fb-7ef37ad71cda	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5637-718b-595e-c5b9c643c6f8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5637-718b-fc3c-4fad73b931b3	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5637-718b-ffca-c824cc3e6f89	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5637-718b-d184-6dc1b880e43d	Telefonska-read	Telefonska - branje	t
00030000-5637-718b-1343-38bc80f5a187	Telefonska-write	Telefonska - spreminjanje	t
00030000-5637-718b-e9f0-9b6e29e416bc	TerminStoritve-read	TerminStoritve - branje	t
00030000-5637-718b-7814-33d09a01aa15	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5637-718b-de3d-cd743b64a79d	TipFunkcije-read	TipFunkcije - branje	t
00030000-5637-718b-a501-4175077fdf0d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5637-718b-07ec-00afc7ce53e4	TipPopa-read	TipPopa - branje	t
00030000-5637-718b-0efc-7b4317587fc6	TipPopa-write	TipPopa - spreminjanje	t
00030000-5637-718b-ae31-9b532006d3c6	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5637-718b-1c7b-86cf4fbc18be	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5637-718b-a51b-c95a2a552d54	TipVaje-read	TipVaje - branje	t
00030000-5637-718b-2d7c-8eb1a7d07e3b	TipVaje-write	TipVaje - spreminjanje	t
00030000-5637-718b-658b-14374c67cee0	Trr-read	Trr - branje	t
00030000-5637-718b-e9f9-a7652e3226f8	Trr-write	Trr - spreminjanje	t
00030000-5637-718b-cf59-bcee8b3d7c5a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5637-718b-7f6d-44958f4518de	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5637-718b-2437-d469ac60a1c9	Vaja-read	Vaja - branje	t
00030000-5637-718b-3c56-de690594d89a	Vaja-write	Vaja - spreminjanje	t
00030000-5637-718b-3a8d-f93c1c130b14	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5637-718b-f06d-8513889a64fb	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5637-718b-0ddc-a9f91f40aa82	VrstaStroska-read	VrstaStroska - branje	t
00030000-5637-718b-3725-2d7d6ffe8a22	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5637-718b-2d93-77ff1da7d575	Zaposlitev-read	Zaposlitev - branje	t
00030000-5637-718b-1c5c-74829d0edf18	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5637-718b-c368-c1176a1dfa17	Zasedenost-read	Zasedenost - branje	t
00030000-5637-718b-e729-9b88a3ac1b2b	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5637-718b-848f-7e0b9406951d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5637-718b-6a90-4816bd4c3c3c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5637-718b-c99a-0d8a95f8066b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5637-718b-9764-660c3d8b9de1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5637-718b-8fc8-63e70b4a6788	Job-read	Branje opravil - samo zase - branje	t
00030000-5637-718b-21fe-d4de5ea6fb49	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5637-718b-aafd-a27c6bff8c59	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5637-718b-a6c8-75ce115b2b06	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5637-718b-c344-1d445fb5b65c	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5637-718b-891d-345bbdfa34e2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5637-718b-a030-f2e3da8a5822	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5637-718b-0017-6740e159b6b1	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5637-718b-fdeb-2f868caa5e03	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5637-718b-2ca2-4973644f6c69	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5637-718b-4694-5ce6e08840bf	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5637-718b-e10d-8f4fa979f5fd	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5637-718b-b760-5a3c8d6a8237	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5637-718b-4d53-3486fc68bd6d	Datoteka-write	Datoteka - spreminjanje	t
00030000-5637-718b-82d2-80609243f77b	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3090 (class 0 OID 24721883)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5637-718c-d254-42376df8b793	00030000-5637-718b-6879-a957d6c6b5d8
00020000-5637-718c-19ee-2944df0ee57b	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-7e70-0784aea7d2c9
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-274d-bad1cff61552
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-ba3f-d05b86b786b4
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-b974-46a29a9a1039
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-6bd4-b26c77b04a6e
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-b57c-25cf08aa9f6d
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-9a7b-de7f16cdaaed
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-d277-df082c3f91dd
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-b223-9557768ad301
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-712e-64cd87e958ef
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-9566-2ca1fc9f49eb
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-0e39-809bf71cc851
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-8492-cb27de5f932e
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-2291-a3242b192f6a
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-fcd3-79246bd8ee8b
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-a565-f9a07753f4c1
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-618a-e9ecd835d08e
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-b3f2-638f15f28736
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-836b-9aa259123f6e
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-2ccb-c0d2206aa7ce
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-0953-14c43ec29be4
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-c63a-fba185f29fde
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-8e83-faae724c75e3
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-71d2-1a5f4ec23b32
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-7aef-8f10ce60be78
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-19d1-e30fb7959c91
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-1837-6ca8a8da8d2a
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-fcc0-5c021289c6f3
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-5cf1-d87cec263422
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-5ddd-2b297baee682
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-ae41-abd6e30728b3
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-ce5b-6da0a8ad5ad3
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-5202-6c41a6374c32
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-3348-4c937ccd3916
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-9eff-b8930d1b8220
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-5f64-178a4fa687e2
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-4e34-ad9a926b7096
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-42e8-595ea74f95d7
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-0a81-1be6c0f85766
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-de3d-cd743b64a79d
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-cf59-bcee8b3d7c5a
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-7f6d-44958f4518de
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-2437-d469ac60a1c9
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-3c56-de690594d89a
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-c368-c1176a1dfa17
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-e729-9b88a3ac1b2b
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-848f-7e0b9406951d
00020000-5637-718c-4371-5f71fdee9109	00030000-5637-718b-c99a-0d8a95f8066b
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-7e70-0784aea7d2c9
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-6bd4-b26c77b04a6e
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-b57c-25cf08aa9f6d
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-0e39-809bf71cc851
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-2291-a3242b192f6a
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-a565-f9a07753f4c1
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-618a-e9ecd835d08e
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-b3f2-638f15f28736
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-836b-9aa259123f6e
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-2ccb-c0d2206aa7ce
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-0953-14c43ec29be4
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-c63a-fba185f29fde
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-71d2-1a5f4ec23b32
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-19d1-e30fb7959c91
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-1837-6ca8a8da8d2a
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-fcc0-5c021289c6f3
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-ce5b-6da0a8ad5ad3
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-3348-4c937ccd3916
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-5f64-178a4fa687e2
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-42e8-595ea74f95d7
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-d184-6dc1b880e43d
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-1343-38bc80f5a187
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-658b-14374c67cee0
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-e9f9-a7652e3226f8
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-2d93-77ff1da7d575
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-1c5c-74829d0edf18
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-848f-7e0b9406951d
00020000-5637-718c-dea7-fa2e37febacf	00030000-5637-718b-c99a-0d8a95f8066b
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-7e70-0784aea7d2c9
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-ba3f-d05b86b786b4
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-6bd4-b26c77b04a6e
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-e478-6b425cdff216
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-3093-6305805be19e
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-e8cb-e840e61d59d6
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-b57c-25cf08aa9f6d
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-712e-64cd87e958ef
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-0e39-809bf71cc851
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-2291-a3242b192f6a
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-a565-f9a07753f4c1
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-b3f2-638f15f28736
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-836b-9aa259123f6e
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-2ccb-c0d2206aa7ce
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-c63a-fba185f29fde
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-71d2-1a5f4ec23b32
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-fcc0-5c021289c6f3
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-5ddd-2b297baee682
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-ce5b-6da0a8ad5ad3
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-3348-4c937ccd3916
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-5f64-178a4fa687e2
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-42e8-595ea74f95d7
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-de3d-cd743b64a79d
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-2437-d469ac60a1c9
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-c368-c1176a1dfa17
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-848f-7e0b9406951d
00020000-5637-718c-a966-1ed3c44ccc11	00030000-5637-718b-c99a-0d8a95f8066b
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-7e70-0784aea7d2c9
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-274d-bad1cff61552
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-b974-46a29a9a1039
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-6bd4-b26c77b04a6e
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-b57c-25cf08aa9f6d
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-0e39-809bf71cc851
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-2291-a3242b192f6a
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-b3f2-638f15f28736
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-836b-9aa259123f6e
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-c63a-fba185f29fde
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-71d2-1a5f4ec23b32
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-fcc0-5c021289c6f3
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-ce5b-6da0a8ad5ad3
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-3348-4c937ccd3916
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-5f64-178a4fa687e2
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-42e8-595ea74f95d7
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-de3d-cd743b64a79d
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-848f-7e0b9406951d
00020000-5637-718c-f80c-5f7df06dbe6b	00030000-5637-718b-c99a-0d8a95f8066b
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-7e70-0784aea7d2c9
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-6bd4-b26c77b04a6e
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-b57c-25cf08aa9f6d
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-0e39-809bf71cc851
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-2291-a3242b192f6a
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-b3f2-638f15f28736
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-836b-9aa259123f6e
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-c63a-fba185f29fde
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-71d2-1a5f4ec23b32
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-fcc0-5c021289c6f3
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-ce5b-6da0a8ad5ad3
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-3348-4c937ccd3916
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-5f64-178a4fa687e2
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-42e8-595ea74f95d7
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-e9f0-9b6e29e416bc
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-f4d9-e704b350923c
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-de3d-cd743b64a79d
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-848f-7e0b9406951d
00020000-5637-718c-bb48-98e3798b2106	00030000-5637-718b-c99a-0d8a95f8066b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a9dc-1752bccaceab
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-6879-a957d6c6b5d8
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-7e70-0784aea7d2c9
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-274d-bad1cff61552
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ba3f-d05b86b786b4
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-b974-46a29a9a1039
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-6bd4-b26c77b04a6e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e478-6b425cdff216
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-6523-b7f669bdded4
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-8395-9d35f62f6f91
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3093-6305805be19e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-4025-7135c4af83a4
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e8cb-e840e61d59d6
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-09bc-78a11cdcbedc
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-b57c-25cf08aa9f6d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-9a7b-de7f16cdaaed
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d277-df082c3f91dd
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-eb29-904caad35493
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-fdeb-d1de801cfb30
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d1ba-c45ca22816b2
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-b223-9557768ad301
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-fafb-a219dc10d82a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-89e7-34170cda393b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-712e-64cd87e958ef
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-9566-2ca1fc9f49eb
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0e39-809bf71cc851
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-8492-cb27de5f932e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-2291-a3242b192f6a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-fcd3-79246bd8ee8b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a565-f9a07753f4c1
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-618a-e9ecd835d08e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-cf80-3b08abea7331
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-6f9b-6b9a04c03e2a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e743-572d26a62631
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-837d-610fe86afb70
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-b3f2-638f15f28736
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-836b-9aa259123f6e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0c34-4a84946e6742
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-77cf-85b5ca73d176
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-daac-59cabec0357b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-cd7d-ca412ec86172
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-2ccb-c0d2206aa7ce
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5c3e-8ecc5eabca05
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0953-14c43ec29be4
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a288-98584d89d6d6
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-c850-ded33b0eb7dc
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ed92-db002413b525
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0410-49e18ba8acf1
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d01c-9e169aab7a22
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-f181-57afb9043c5a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-c63a-fba185f29fde
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-8e83-faae724c75e3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-71d2-1a5f4ec23b32
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-9da6-f6af3b1b1e0e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-87c2-e307f494133a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d9a8-945d8b5789b0
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-bc8c-8c054348667c
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-7aef-8f10ce60be78
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-19d1-e30fb7959c91
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1837-6ca8a8da8d2a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d82c-515cc683bbcf
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a7fb-de22b7aa9a46
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-fcc0-5c021289c6f3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5cf1-d87cec263422
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5883-67bb3357545c
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-045c-f4644b1b77cd
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-642c-c6f41e022853
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-8013-bbbb7041e2ae
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5ddd-2b297baee682
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ae41-abd6e30728b3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-52ab-2f6e84eaa87a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-180b-60f5a1c23f18
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e4b7-87e0594fefb1
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1b7d-2fcf33821982
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3582-9ca7da176527
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-00ab-9d991c5a56b3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d28d-a01ac5595846
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-b203-805269da8e84
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3786-95d5d81be55b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a3d8-e3004582442d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ab60-3bd2b37226f2
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5c40-b4037256a985
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-f251-c48a049d90f7
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-13ce-a9110ab4e30e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-b479-07b88e8b75e5
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-c168-bdf6f8dc43d0
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3e7c-d85b51a5a10d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1eec-e5502155d508
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0b66-3791bd7e7593
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3722-bc3d4bef2eb9
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-379b-8087af465b8f
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-aa46-c0ed1c610ccd
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ce5b-6da0a8ad5ad3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5202-6c41a6374c32
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-dc8c-7cc3e864464c
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-aaaa-5ec4a63f7646
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-66a6-2705767656d4
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-23a9-c4cb17867bd9
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3348-4c937ccd3916
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-9eff-b8930d1b8220
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-5f64-178a4fa687e2
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-4e34-ad9a926b7096
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d28d-019a67ca3bbc
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-f021-aa580df63c8e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0d6d-5464c6245c3e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-4a24-df61488b8bb2
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-585c-858e2c331bc0
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1054-87e10c10c871
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-27ea-00d94f1f4963
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d448-2846d391cc2e
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-42e8-595ea74f95d7
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0a81-1be6c0f85766
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-8f1c-6aa2485975d3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e1fc-b048a9658c4f
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-4d08-712bc81bbab8
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-94fb-7ef37ad71cda
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-595e-c5b9c643c6f8
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-fc8f-2a8fe8500514
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-fc3c-4fad73b931b3
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ffca-c824cc3e6f89
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-d184-6dc1b880e43d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1343-38bc80f5a187
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e9f0-9b6e29e416bc
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-f4d9-e704b350923c
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-7814-33d09a01aa15
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-de3d-cd743b64a79d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a501-4175077fdf0d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-07ec-00afc7ce53e4
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0efc-7b4317587fc6
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-ae31-9b532006d3c6
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1c7b-86cf4fbc18be
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-a51b-c95a2a552d54
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-2d7c-8eb1a7d07e3b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-658b-14374c67cee0
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e9f9-a7652e3226f8
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-cf59-bcee8b3d7c5a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-7f6d-44958f4518de
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-2437-d469ac60a1c9
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3c56-de690594d89a
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3a8d-f93c1c130b14
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-f06d-8513889a64fb
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-0ddc-a9f91f40aa82
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-3725-2d7d6ffe8a22
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-2d93-77ff1da7d575
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-1c5c-74829d0edf18
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-c368-c1176a1dfa17
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-e729-9b88a3ac1b2b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-848f-7e0b9406951d
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-6a90-4816bd4c3c3c
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-c99a-0d8a95f8066b
00020000-5637-718d-5013-c4afd5d9a523	00030000-5637-718b-9764-660c3d8b9de1
\.


--
-- TOC entry 3126 (class 0 OID 24722267)
-- Dependencies: 216
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 24722301)
-- Dependencies: 220
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 24722438)
-- Dependencies: 232
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5637-718d-1b87-9a86db94ec8b	00090000-5637-718d-0f16-4d0977b3a81b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5637-718d-70af-5bb3c95a804a	00090000-5637-718d-dcfb-0aed8e3eb57a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5637-718d-d962-aac965b5f7d9	00090000-5637-718d-12d1-348cda69f1cb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5637-718d-8a1f-8e6bf03f3e4f	00090000-5637-718d-ad3e-d64b84ab61c2	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3098 (class 0 OID 24721965)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5637-718d-526b-cb305a929105	\N	00040000-5637-718b-561f-80619179a268	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-1a69-5dd59c07b8fd	\N	00040000-5637-718b-561f-80619179a268	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5637-718d-ca0f-f407cb6ed957	\N	00040000-5637-718b-561f-80619179a268	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-f321-bddf9130452c	\N	00040000-5637-718b-561f-80619179a268	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-9fc8-49884ed8787d	\N	00040000-5637-718b-561f-80619179a268	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-b268-20fdc13736a0	\N	00040000-5637-718b-e307-c692a353fabb	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-f408-c69d8e3b808b	\N	00040000-5637-718b-ced6-e30c81f87322	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-2d7a-e148a56a28d6	\N	00040000-5637-718b-43c4-717a750c963c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718d-4ae8-8dce5deafba8	\N	00040000-5637-718b-17ab-965310a7b1ed	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5637-718f-167b-202b3386f811	\N	00040000-5637-718b-561f-80619179a268	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3101 (class 0 OID 24722010)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5637-718b-9472-6d44b98bddf2	8341	Adlešiči
00050000-5637-718b-3856-bf1eb5e75e34	5270	Ajdovščina
00050000-5637-718b-345c-031c9fc9e54f	6280	Ankaran/Ancarano
00050000-5637-718b-5f47-36b2030912a5	9253	Apače
00050000-5637-718b-bde5-b015845742be	8253	Artiče
00050000-5637-718b-d2ee-22a835f291cf	4275	Begunje na Gorenjskem
00050000-5637-718b-70d3-414386c9a20b	1382	Begunje pri Cerknici
00050000-5637-718b-1e7a-1f2a74f7bf27	9231	Beltinci
00050000-5637-718b-e8d5-5c5de6ce8230	2234	Benedikt
00050000-5637-718b-030b-e756375a21e2	2345	Bistrica ob Dravi
00050000-5637-718b-2b19-9069582ca1e6	3256	Bistrica ob Sotli
00050000-5637-718b-7b7c-31ac2a91ac5c	8259	Bizeljsko
00050000-5637-718b-42b9-cf26f55a9708	1223	Blagovica
00050000-5637-718b-8396-ddd993712b3f	8283	Blanca
00050000-5637-718b-d07e-5d6acf37f810	4260	Bled
00050000-5637-718b-10f9-7f5da5cc3af9	4273	Blejska Dobrava
00050000-5637-718b-fa87-64badc78e494	9265	Bodonci
00050000-5637-718b-5490-186dbffae177	9222	Bogojina
00050000-5637-718b-36f6-dbc15f941a81	4263	Bohinjska Bela
00050000-5637-718b-a3ed-e8f485350b39	4264	Bohinjska Bistrica
00050000-5637-718b-a00e-33d66328d966	4265	Bohinjsko jezero
00050000-5637-718b-299c-c09eb0a8d9e2	1353	Borovnica
00050000-5637-718b-2fbb-40b8c5800c1b	8294	Boštanj
00050000-5637-718b-b7e0-f6da840d64b5	5230	Bovec
00050000-5637-718b-2774-599f9a0b4136	5295	Branik
00050000-5637-718b-20da-04e41f36a79b	3314	Braslovče
00050000-5637-718b-7f29-612f68749472	5223	Breginj
00050000-5637-718b-58c2-875273a1f71f	8280	Brestanica
00050000-5637-718b-9f8e-0ff476258569	2354	Bresternica
00050000-5637-718b-ed8f-81163350207f	4243	Brezje
00050000-5637-718b-1008-84ac4e0ec470	1351	Brezovica pri Ljubljani
00050000-5637-718b-1d24-fe058472ba10	8250	Brežice
00050000-5637-718b-b004-e20898e3c1d2	4210	Brnik - Aerodrom
00050000-5637-718b-1903-15a939e792ce	8321	Brusnice
00050000-5637-718b-08ce-2287c738166c	3255	Buče
00050000-5637-718b-53d5-41a4c38aee7e	8276	Bučka 
00050000-5637-718b-d098-7877f2144c4c	9261	Cankova
00050000-5637-718b-ca3d-5793f48b9653	3000	Celje 
00050000-5637-718b-547c-080082ba942e	3001	Celje - poštni predali
00050000-5637-718b-b638-fc86f69272b4	4207	Cerklje na Gorenjskem
00050000-5637-718b-3742-ac3ac646b7dd	8263	Cerklje ob Krki
00050000-5637-718b-cd85-65747182c1f2	1380	Cerknica
00050000-5637-718b-180e-66d6dd15673a	5282	Cerkno
00050000-5637-718b-4a37-069fa7a7b662	2236	Cerkvenjak
00050000-5637-718b-995e-78fcea7ab591	2215	Ceršak
00050000-5637-718b-e691-9988b7365eb7	2326	Cirkovce
00050000-5637-718b-1b44-097b51ad76e3	2282	Cirkulane
00050000-5637-718b-0b20-a1697596e6e7	5273	Col
00050000-5637-718b-59f6-32fe16652f6c	8251	Čatež ob Savi
00050000-5637-718b-0407-73151d23d305	1413	Čemšenik
00050000-5637-718b-b724-da922fe17753	5253	Čepovan
00050000-5637-718b-7198-2da3e4cb5668	9232	Črenšovci
00050000-5637-718b-c2ad-ec47332bf08f	2393	Črna na Koroškem
00050000-5637-718b-c67b-73b5509c8e8a	6275	Črni Kal
00050000-5637-718b-8966-ce85455da29f	5274	Črni Vrh nad Idrijo
00050000-5637-718b-88cd-9cc08e1cf626	5262	Črniče
00050000-5637-718b-7e67-504d78c1b374	8340	Črnomelj
00050000-5637-718b-f48b-f1801b641f77	6271	Dekani
00050000-5637-718b-260d-78f7fc6b1958	5210	Deskle
00050000-5637-718b-22ec-ec4c132892bb	2253	Destrnik
00050000-5637-718b-9e3a-68ce7ca09cf7	6215	Divača
00050000-5637-718b-145d-bb2997017c4f	1233	Dob
00050000-5637-718b-a806-5e6ff8e697fa	3224	Dobje pri Planini
00050000-5637-718b-fc21-96f9dd97ca50	8257	Dobova
00050000-5637-718b-d045-83725a0894c7	1423	Dobovec
00050000-5637-718b-e411-af0eb2226e4f	5263	Dobravlje
00050000-5637-718b-53d7-cc8eca29a016	3204	Dobrna
00050000-5637-718b-c97e-8865d3035c45	8211	Dobrnič
00050000-5637-718b-1702-7d1683d19b98	1356	Dobrova
00050000-5637-718b-912f-4ac02beb3456	9223	Dobrovnik/Dobronak 
00050000-5637-718b-bcb0-00f0d30806e8	5212	Dobrovo v Brdih
00050000-5637-718b-4f03-c2e6c0664c0f	1431	Dol pri Hrastniku
00050000-5637-718b-ade0-3e88a31c210e	1262	Dol pri Ljubljani
00050000-5637-718b-6c0c-1b7c2fde2adc	1273	Dole pri Litiji
00050000-5637-718b-b99b-d75e21075d2d	1331	Dolenja vas
00050000-5637-718b-1ef8-7804c9f4975e	8350	Dolenjske Toplice
00050000-5637-718b-4819-9710e03e2f83	1230	Domžale
00050000-5637-718b-d1ea-95ea920f5088	2252	Dornava
00050000-5637-718b-73c4-3e6d71169879	5294	Dornberk
00050000-5637-718b-b0d1-947bf5f9d48b	1319	Draga
00050000-5637-718b-f768-6d3e6a722aac	8343	Dragatuš
00050000-5637-718b-bbd6-737a936489a8	3222	Dramlje
00050000-5637-718b-45e6-ab1b8de1bfea	2370	Dravograd
00050000-5637-718b-c4ad-968505e9fa17	4203	Duplje
00050000-5637-718b-e7de-515e282529aa	6221	Dutovlje
00050000-5637-718b-7514-cb6fc300948d	8361	Dvor
00050000-5637-718b-175c-d587ad8d0c3a	2343	Fala
00050000-5637-718b-2dc6-581de8fbc176	9208	Fokovci
00050000-5637-718b-713f-c7a74837927e	2313	Fram
00050000-5637-718b-9ad6-7b391ba98f46	3213	Frankolovo
00050000-5637-718b-2897-685f24906ef9	1274	Gabrovka
00050000-5637-718b-b70e-a6e679221ff9	8254	Globoko
00050000-5637-718b-8a8d-8aefd531e7ed	5275	Godovič
00050000-5637-718b-29eb-0f765e5abe0d	4204	Golnik
00050000-5637-718b-14b6-8a400b24a9ad	3303	Gomilsko
00050000-5637-718b-6c64-a97702e058a3	4224	Gorenja vas
00050000-5637-718b-fb1f-80a2ab4260bf	3263	Gorica pri Slivnici
00050000-5637-718b-058d-227f1276b7e9	2272	Gorišnica
00050000-5637-718b-7b11-8c76784f91e8	9250	Gornja Radgona
00050000-5637-718b-e04c-59a7f78e11c2	3342	Gornji Grad
00050000-5637-718b-31d4-5ca6465cbc9e	4282	Gozd Martuljek
00050000-5637-718b-416d-011bdf6bce47	6272	Gračišče
00050000-5637-718b-97af-c636b6f2574b	9264	Grad
00050000-5637-718b-5c23-13f69ec6d48b	8332	Gradac
00050000-5637-718b-b821-c4951ff6d1c6	1384	Grahovo
00050000-5637-718b-7191-6af957e5215d	5242	Grahovo ob Bači
00050000-5637-718b-4706-23693e9783af	5251	Grgar
00050000-5637-718b-bdb8-be7da1bc7e71	3302	Griže
00050000-5637-718b-0030-dfe708340321	3231	Grobelno
00050000-5637-718b-899b-3a4866f68b58	1290	Grosuplje
00050000-5637-718b-f0c6-f08b5518d953	2288	Hajdina
00050000-5637-718b-c202-cb8d67cba82d	8362	Hinje
00050000-5637-718b-ee2d-a08ea77fb96e	2311	Hoče
00050000-5637-718b-63e5-3620afe650cd	9205	Hodoš/Hodos
00050000-5637-718b-24b6-c50bfe154d07	1354	Horjul
00050000-5637-718b-57a7-093edc12bdd6	1372	Hotedršica
00050000-5637-718b-8df6-a63ec9453c54	1430	Hrastnik
00050000-5637-718b-4a17-f3f7dc390b64	6225	Hruševje
00050000-5637-718b-347d-dd9e2c467d8a	4276	Hrušica
00050000-5637-718b-7d1c-605fbecf8c31	5280	Idrija
00050000-5637-718b-f2ce-374b27b6eed9	1292	Ig
00050000-5637-718b-482a-05b6a795301f	6250	Ilirska Bistrica
00050000-5637-718b-23de-ddc52682a65d	6251	Ilirska Bistrica-Trnovo
00050000-5637-718b-7968-600d2acfbaf3	1295	Ivančna Gorica
00050000-5637-718b-9cd9-e7bea0d1a55d	2259	Ivanjkovci
00050000-5637-718b-d586-a98188b6a542	1411	Izlake
00050000-5637-718b-8ab2-dc53a4af89aa	6310	Izola/Isola
00050000-5637-718b-d116-82e7dfda2a84	2222	Jakobski Dol
00050000-5637-718b-7d73-7dc989bb1deb	2221	Jarenina
00050000-5637-718b-6860-fc5924ee4a94	6254	Jelšane
00050000-5637-718b-0b32-217aada3fdc8	4270	Jesenice
00050000-5637-718b-b4d2-a9871918dafc	8261	Jesenice na Dolenjskem
00050000-5637-718b-e309-008eb323756e	3273	Jurklošter
00050000-5637-718b-9de0-2b0e3807e16e	2223	Jurovski Dol
00050000-5637-718b-a6ad-f4cdc6eee404	2256	Juršinci
00050000-5637-718b-86e9-510de3905978	5214	Kal nad Kanalom
00050000-5637-718b-245c-2a68ee926dd0	3233	Kalobje
00050000-5637-718b-51d0-03e7d84411fb	4246	Kamna Gorica
00050000-5637-718b-4c99-ee65d3e73939	2351	Kamnica
00050000-5637-718b-ff44-e5a185d424cb	1241	Kamnik
00050000-5637-718b-733b-b0fc65942077	5213	Kanal
00050000-5637-718b-22fd-8a3ff62a2224	8258	Kapele
00050000-5637-718b-bb2e-2f576cfda387	2362	Kapla
00050000-5637-718b-e265-2441a50eb1ad	2325	Kidričevo
00050000-5637-718b-0e6a-670316b6d9b1	1412	Kisovec
00050000-5637-718b-066d-6f9c16d00a15	6253	Knežak
00050000-5637-718b-321b-489cec06fb59	5222	Kobarid
00050000-5637-718b-fe26-0d0c45f56ec1	9227	Kobilje
00050000-5637-718b-70e9-9085b804b222	1330	Kočevje
00050000-5637-718b-42f6-e8c3b311e110	1338	Kočevska Reka
00050000-5637-718b-d970-5a618d259398	2276	Kog
00050000-5637-718b-9260-7c09c42c66d1	5211	Kojsko
00050000-5637-718b-7852-dc2d3f959ff9	6223	Komen
00050000-5637-718b-d48c-285d16d38ee2	1218	Komenda
00050000-5637-718b-52e6-ff79c8e5ed7d	6000	Koper/Capodistria 
00050000-5637-718b-0fcc-220c917b1136	6001	Koper/Capodistria - poštni predali
00050000-5637-718b-8de6-c778a890030b	8282	Koprivnica
00050000-5637-718b-37b3-e217e2180461	5296	Kostanjevica na Krasu
00050000-5637-718b-e97f-fef6941081c8	8311	Kostanjevica na Krki
00050000-5637-718b-ee5f-53a0d6b4a6ce	1336	Kostel
00050000-5637-718b-b563-5082d9cd4c48	6256	Košana
00050000-5637-718b-d3eb-46f0db948009	2394	Kotlje
00050000-5637-718b-b3da-748620493f5e	6240	Kozina
00050000-5637-718b-eb6b-1eb9e375541f	3260	Kozje
00050000-5637-718b-57b0-6ddb349ecba5	4000	Kranj 
00050000-5637-718b-8a86-08a769393a18	4001	Kranj - poštni predali
00050000-5637-718b-c4d1-e70c3ad8e370	4280	Kranjska Gora
00050000-5637-718b-b018-c015448a6e06	1281	Kresnice
00050000-5637-718b-0a41-44a5c66fa133	4294	Križe
00050000-5637-718b-3fa0-ce8b69a3dbf8	9206	Križevci
00050000-5637-718b-27a4-e3534d27ea1a	9242	Križevci pri Ljutomeru
00050000-5637-718b-1f3d-429f0e17dffb	1301	Krka
00050000-5637-718b-d8d2-2cf51edf0308	8296	Krmelj
00050000-5637-718b-7995-d0cb07a63fa7	4245	Kropa
00050000-5637-718b-5e6a-8f3d9753014e	8262	Krška vas
00050000-5637-718b-8b5b-057b23224dc6	8270	Krško
00050000-5637-718b-9673-be9f61903ad0	9263	Kuzma
00050000-5637-718b-88da-dd56e81bf1cd	2318	Laporje
00050000-5637-718b-f287-f8fe0a869f72	3270	Laško
00050000-5637-718b-6c6e-ac4c487b1b2a	1219	Laze v Tuhinju
00050000-5637-718b-f38a-a748888f1915	2230	Lenart v Slovenskih goricah
00050000-5637-718b-eb03-b065584da08a	9220	Lendava/Lendva
00050000-5637-718b-d066-5f20cf2bcd17	4248	Lesce
00050000-5637-718b-8595-8f9e3d8121db	3261	Lesično
00050000-5637-718b-d7ca-6db3a2c32055	8273	Leskovec pri Krškem
00050000-5637-718b-2efd-bb3960754395	2372	Libeliče
00050000-5637-718b-adb9-58006e74c1db	2341	Limbuš
00050000-5637-718b-33c7-08b88b42f4fe	1270	Litija
00050000-5637-718b-69f4-b4d6f005f416	3202	Ljubečna
00050000-5637-718b-16f2-858d48dd360d	1000	Ljubljana 
00050000-5637-718b-91ff-dd769339c04a	1001	Ljubljana - poštni predali
00050000-5637-718b-4143-faeab649c573	1231	Ljubljana - Črnuče
00050000-5637-718b-627f-3adab938b9af	1261	Ljubljana - Dobrunje
00050000-5637-718b-4fb4-038631bebedb	1260	Ljubljana - Polje
00050000-5637-718b-fa82-276b67865bb1	1210	Ljubljana - Šentvid
00050000-5637-718b-b0c9-015cbbbad279	1211	Ljubljana - Šmartno
00050000-5637-718b-caa0-eafde5632f8c	3333	Ljubno ob Savinji
00050000-5637-718b-f035-5c13dc3ec8d8	9240	Ljutomer
00050000-5637-718b-f35a-cee6b62fedf1	3215	Loče
00050000-5637-718b-d646-78419ba8b290	5231	Log pod Mangartom
00050000-5637-718b-393a-872e84a087f1	1358	Log pri Brezovici
00050000-5637-718b-c36c-0579b8a6938c	1370	Logatec
00050000-5637-718b-8ac7-6cea7bca6df8	1371	Logatec
00050000-5637-718b-6c78-234bd3f1d100	1434	Loka pri Zidanem Mostu
00050000-5637-718b-6af2-bedab0cbdb6c	3223	Loka pri Žusmu
00050000-5637-718b-e77e-6cc5586ef568	6219	Lokev
00050000-5637-718b-f63b-22e677e618dd	1318	Loški Potok
00050000-5637-718b-9793-444d2067b6c3	2324	Lovrenc na Dravskem polju
00050000-5637-718b-8bb4-84f8f035d7fa	2344	Lovrenc na Pohorju
00050000-5637-718b-d4f4-689933a68e1a	3334	Luče
00050000-5637-718b-23a6-8a8373f218e6	1225	Lukovica
00050000-5637-718b-63f2-81062c8af08a	9202	Mačkovci
00050000-5637-718b-4cb6-10012800627e	2322	Majšperk
00050000-5637-718b-89fe-00d963cc16eb	2321	Makole
00050000-5637-718b-d0b7-f45f718ef059	9243	Mala Nedelja
00050000-5637-718b-e1a1-11815ab6addb	2229	Malečnik
00050000-5637-718b-4edf-619d4de684cc	6273	Marezige
00050000-5637-718b-3b24-60ec4673a3d9	2000	Maribor 
00050000-5637-718b-0b29-4e56aab2af0c	2001	Maribor - poštni predali
00050000-5637-718b-e7bc-a26723c5e0f5	2206	Marjeta na Dravskem polju
00050000-5637-718b-da95-f334ecd9b095	2281	Markovci
00050000-5637-718b-96f9-0a1f0dc9366f	9221	Martjanci
00050000-5637-718b-f5c3-53c5c6bf61d1	6242	Materija
00050000-5637-718b-70f7-ec244891b8c9	4211	Mavčiče
00050000-5637-718b-dd83-93b33e6166a1	1215	Medvode
00050000-5637-718b-ba09-31e652e3a849	1234	Mengeš
00050000-5637-718b-5134-c5780fe00f29	8330	Metlika
00050000-5637-718b-dc85-00446e83e813	2392	Mežica
00050000-5637-718b-1701-fbcb33e64fa5	2204	Miklavž na Dravskem polju
00050000-5637-718b-653c-5542f0ca87b1	2275	Miklavž pri Ormožu
00050000-5637-718b-feac-5c1afc737725	5291	Miren
00050000-5637-718b-3030-4823494b01df	8233	Mirna
00050000-5637-718b-da87-67792f6657ba	8216	Mirna Peč
00050000-5637-718b-729c-b8e82968678b	2382	Mislinja
00050000-5637-718b-1afa-354ab8e22c28	4281	Mojstrana
00050000-5637-718b-a79a-0ec43b4b88b5	8230	Mokronog
00050000-5637-718b-471d-aa57ac8833c8	1251	Moravče
00050000-5637-718b-d965-8dab70d508fa	9226	Moravske Toplice
00050000-5637-718b-5637-4fd5e59e6ed4	5216	Most na Soči
00050000-5637-718b-b8cb-2d8541d929c0	1221	Motnik
00050000-5637-718b-0774-daae5999ac87	3330	Mozirje
00050000-5637-718b-9847-08d1a73e9e79	9000	Murska Sobota 
00050000-5637-718b-570d-407741f1e3db	9001	Murska Sobota - poštni predali
00050000-5637-718b-06e2-c1ed6ed6671d	2366	Muta
00050000-5637-718b-7bab-7711ae2f1df7	4202	Naklo
00050000-5637-718b-5a2f-df626013a3c6	3331	Nazarje
00050000-5637-718b-7119-26b8ebb76207	1357	Notranje Gorice
00050000-5637-718b-2bdc-f13dd39b9f8f	3203	Nova Cerkev
00050000-5637-718b-4dd7-76ba68f5a3c5	5000	Nova Gorica 
00050000-5637-718b-3cc0-9de78d2eb1ad	5001	Nova Gorica - poštni predali
00050000-5637-718b-8274-a40e0be8764e	1385	Nova vas
00050000-5637-718b-aeb3-bee7c15c1cb5	8000	Novo mesto
00050000-5637-718b-f04b-7e5c7eef13f4	8001	Novo mesto - poštni predali
00050000-5637-718b-ec28-78b63d158f87	6243	Obrov
00050000-5637-718b-a1c9-77b5bdcb969e	9233	Odranci
00050000-5637-718b-4c81-efb1b03e5440	2317	Oplotnica
00050000-5637-718b-a165-85d15b152cf0	2312	Orehova vas
00050000-5637-718b-6868-753c00d53c05	2270	Ormož
00050000-5637-718b-a6dd-c94d9776fc6b	1316	Ortnek
00050000-5637-718b-ad49-7ec460385b4c	1337	Osilnica
00050000-5637-718b-3038-287ee9ef1cfc	8222	Otočec
00050000-5637-718b-4538-2bc5f91123fe	2361	Ožbalt
00050000-5637-718b-f115-a5efc231b950	2231	Pernica
00050000-5637-718b-5493-350da7527c69	2211	Pesnica pri Mariboru
00050000-5637-718b-0993-81b9a70e4c1e	9203	Petrovci
00050000-5637-718b-2325-35efabbbc0a1	3301	Petrovče
00050000-5637-718b-b21e-a1ac3be755d0	6330	Piran/Pirano
00050000-5637-718b-1411-baaf690b27a3	8255	Pišece
00050000-5637-718b-d731-ac7176f376be	6257	Pivka
00050000-5637-718b-c2f8-34a29bd13b18	6232	Planina
00050000-5637-718b-1238-443745ec8ed0	3225	Planina pri Sevnici
00050000-5637-718b-50c5-cb2ecb6a401f	6276	Pobegi
00050000-5637-718b-bdbe-826d817442b2	8312	Podbočje
00050000-5637-718b-4e95-5b1f467911b4	5243	Podbrdo
00050000-5637-718b-142d-ec33ad39c2b8	3254	Podčetrtek
00050000-5637-718b-0b3a-0daa387d5bf6	2273	Podgorci
00050000-5637-718b-2def-f82bbecfadaf	6216	Podgorje
00050000-5637-718b-fae2-589a9437490c	2381	Podgorje pri Slovenj Gradcu
00050000-5637-718b-d821-d3e356a6e23f	6244	Podgrad
00050000-5637-718b-ffc2-e970c3fe11b0	1414	Podkum
00050000-5637-718b-e4ab-fde4e882dcf3	2286	Podlehnik
00050000-5637-718b-5b99-88172c4512dd	5272	Podnanos
00050000-5637-718b-f140-8a588c017a01	4244	Podnart
00050000-5637-718b-f3de-af1619087136	3241	Podplat
00050000-5637-718b-d666-ada42fa5f93a	3257	Podsreda
00050000-5637-718b-a8d5-bc733cbcef41	2363	Podvelka
00050000-5637-718b-42a2-e70cb9f54cff	2208	Pohorje
00050000-5637-718b-1d3d-7b950d9c7d5a	2257	Polenšak
00050000-5637-718b-418e-165a43033956	1355	Polhov Gradec
00050000-5637-718b-efef-53803ae87dae	4223	Poljane nad Škofjo Loko
00050000-5637-718b-7bfd-6fd36205ede4	2319	Poljčane
00050000-5637-718b-e0b4-0329d7b99b94	1272	Polšnik
00050000-5637-718b-896e-c8e4e68df1d8	3313	Polzela
00050000-5637-718b-0b24-a63fde1ffaf2	3232	Ponikva
00050000-5637-718b-d730-f7d542c55c03	6320	Portorož/Portorose
00050000-5637-718b-806b-17b9bc3745c5	6230	Postojna
00050000-5637-718b-e5e4-2f3674e5442f	2331	Pragersko
00050000-5637-718b-4a88-ad66c76d91e7	3312	Prebold
00050000-5637-718b-c0de-9d52ef2bba9b	4205	Preddvor
00050000-5637-718b-83af-8611e2c4ad99	6255	Prem
00050000-5637-718b-035e-716b542feeaf	1352	Preserje
00050000-5637-718b-b55c-388d98e9f5b9	6258	Prestranek
00050000-5637-718b-1a93-12c578b0a006	2391	Prevalje
00050000-5637-718b-03c8-d9abc4040510	3262	Prevorje
00050000-5637-718b-8a76-3a62055047ba	1276	Primskovo 
00050000-5637-718b-f5a5-1b9b3491dc64	3253	Pristava pri Mestinju
00050000-5637-718b-c0f1-59b528cd620e	9207	Prosenjakovci/Partosfalva
00050000-5637-718b-fa1f-b90ce810f0ca	5297	Prvačina
00050000-5637-718b-c636-3d8c52efa985	2250	Ptuj
00050000-5637-718b-bbab-43e7e36d89ef	2323	Ptujska Gora
00050000-5637-718b-740c-c24e79164d50	9201	Puconci
00050000-5637-718b-097f-c0a8fc608f5e	2327	Rače
00050000-5637-718b-ba41-6e118fa019f5	1433	Radeče
00050000-5637-718b-d606-e0bf56b5954e	9252	Radenci
00050000-5637-718b-5999-b4e2f36a14a4	2360	Radlje ob Dravi
00050000-5637-718b-077c-1edd14e7452a	1235	Radomlje
00050000-5637-718b-5774-33ed0f9ba9ea	4240	Radovljica
00050000-5637-718b-af1d-c0c6c477d2cf	8274	Raka
00050000-5637-718b-8228-c3c945db6c81	1381	Rakek
00050000-5637-718b-3466-02be21e4f99b	4283	Rateče - Planica
00050000-5637-718b-14bb-1b1bfdabe7f3	2390	Ravne na Koroškem
00050000-5637-718b-1c66-801276b2e5b7	9246	Razkrižje
00050000-5637-718b-b711-8f3aea1173b6	3332	Rečica ob Savinji
00050000-5637-718b-f272-884fc5a75aeb	5292	Renče
00050000-5637-718b-98bf-3802309c1466	1310	Ribnica
00050000-5637-718b-cf4e-5631d6e72564	2364	Ribnica na Pohorju
00050000-5637-718b-6e81-ecd15bf95105	3272	Rimske Toplice
00050000-5637-718b-b316-17758100c14b	1314	Rob
00050000-5637-718b-9855-9d3777247064	5215	Ročinj
00050000-5637-718b-7152-f3b9b1599e0d	3250	Rogaška Slatina
00050000-5637-718b-2fa4-2301148a2f2c	9262	Rogašovci
00050000-5637-718b-d0f1-a829540e4905	3252	Rogatec
00050000-5637-718b-515d-859893415f1f	1373	Rovte
00050000-5637-718b-cc49-40b1913544d7	2342	Ruše
00050000-5637-718b-fb5e-a0d97025b2fe	1282	Sava
00050000-5637-718b-5eef-74fb3ca873eb	6333	Sečovlje/Sicciole
00050000-5637-718b-8654-1c0808d5b84b	4227	Selca
00050000-5637-718b-b0c7-7623ee783383	2352	Selnica ob Dravi
00050000-5637-718b-ff57-37433dc6e126	8333	Semič
00050000-5637-718b-20f7-4061dca5cdcf	8281	Senovo
00050000-5637-718b-be91-2011e97df504	6224	Senožeče
00050000-5637-718b-d460-761e7ff32b69	8290	Sevnica
00050000-5637-718b-d069-9e296e28e595	6210	Sežana
00050000-5637-718b-d3a8-4b1f83a0437c	2214	Sladki Vrh
00050000-5637-718b-7f5e-7381131be17e	5283	Slap ob Idrijci
00050000-5637-718b-1eb8-7614f6d7a30e	2380	Slovenj Gradec
00050000-5637-718b-3b6e-625f679c6316	2310	Slovenska Bistrica
00050000-5637-718b-779a-586087676d6c	3210	Slovenske Konjice
00050000-5637-718b-d2ce-023a7ec3c41b	1216	Smlednik
00050000-5637-718b-1c56-4a1b2bcbcdb6	5232	Soča
00050000-5637-718b-0840-c02a61661fbf	1317	Sodražica
00050000-5637-718b-a700-80b7fe9959aa	3335	Solčava
00050000-5637-718b-12d4-3c0aa0fa202c	5250	Solkan
00050000-5637-718b-626a-d573979032c2	4229	Sorica
00050000-5637-718b-d360-98bb5d8c4222	4225	Sovodenj
00050000-5637-718b-636c-3e8f15836d36	5281	Spodnja Idrija
00050000-5637-718b-e0ef-07e26b0a5f74	2241	Spodnji Duplek
00050000-5637-718b-b250-ef4ad133649f	9245	Spodnji Ivanjci
00050000-5637-718b-abe0-eb22cea2cf3e	2277	Središče ob Dravi
00050000-5637-718b-c005-645a3ae1bcb6	4267	Srednja vas v Bohinju
00050000-5637-718b-abfb-e0db23013b1b	8256	Sromlje 
00050000-5637-718b-84b4-fee1ef2056b9	5224	Srpenica
00050000-5637-718b-c078-739668da86a9	1242	Stahovica
00050000-5637-718b-d584-666fa7b48ae7	1332	Stara Cerkev
00050000-5637-718b-6913-2670ac1bc0ca	8342	Stari trg ob Kolpi
00050000-5637-718b-4fcf-91e48788d521	1386	Stari trg pri Ložu
00050000-5637-718b-28a0-8aded9a559d6	2205	Starše
00050000-5637-718b-5fdd-17e58fe43a0a	2289	Stoperce
00050000-5637-718b-1565-29f7a40c6a67	8322	Stopiče
00050000-5637-718b-3495-48d2e1fb674c	3206	Stranice
00050000-5637-718b-de4b-ce5e9ed7e0ca	8351	Straža
00050000-5637-718b-27da-321e9dcef58e	1313	Struge
00050000-5637-718b-5200-45d3d884ca15	8293	Studenec
00050000-5637-718b-d338-6d919006f02f	8331	Suhor
00050000-5637-718b-b565-5e70e52cd1d1	2233	Sv. Ana v Slovenskih goricah
00050000-5637-718b-c5e1-771ac69c083d	2235	Sv. Trojica v Slovenskih goricah
00050000-5637-718b-47d7-19f68662c5fa	2353	Sveti Duh na Ostrem Vrhu
00050000-5637-718b-21ae-ef7ded183880	9244	Sveti Jurij ob Ščavnici
00050000-5637-718b-0fbb-1d6196ec7781	3264	Sveti Štefan
00050000-5637-718b-6af1-774dc597e5d2	2258	Sveti Tomaž
00050000-5637-718b-6feb-9beb41545d81	9204	Šalovci
00050000-5637-718b-6ab8-d80ab2c96184	5261	Šempas
00050000-5637-718b-c77e-a01662596994	5290	Šempeter pri Gorici
00050000-5637-718b-993a-25420460b708	3311	Šempeter v Savinjski dolini
00050000-5637-718b-9b04-907337b07435	4208	Šenčur
00050000-5637-718b-7c58-e783bf433b7b	2212	Šentilj v Slovenskih goricah
00050000-5637-718b-b082-b9676d5800d8	8297	Šentjanž
00050000-5637-718b-f6b3-f43cbc3a7c78	2373	Šentjanž pri Dravogradu
00050000-5637-718b-4ac0-b1c4ec393d0c	8310	Šentjernej
00050000-5637-718b-df5b-54ef3140af9a	3230	Šentjur
00050000-5637-718b-6af1-fdc2fbb2232e	3271	Šentrupert
00050000-5637-718b-dad4-17d0a225b37a	8232	Šentrupert
00050000-5637-718b-2d2b-ad38032f41fc	1296	Šentvid pri Stični
00050000-5637-718b-c637-8ce6391346ac	8275	Škocjan
00050000-5637-718b-01d8-df0d4704116e	6281	Škofije
00050000-5637-718b-61b5-234c5ce4d72a	4220	Škofja Loka
00050000-5637-718b-2342-b34ea14a41e3	3211	Škofja vas
00050000-5637-718b-c5d6-0fec03827f65	1291	Škofljica
00050000-5637-718b-8952-183b7f2d4363	6274	Šmarje
00050000-5637-718b-6be8-4659e17b6608	1293	Šmarje - Sap
00050000-5637-718b-dd18-912fd5e92c25	3240	Šmarje pri Jelšah
00050000-5637-718b-73a3-db51f43ad266	8220	Šmarješke Toplice
00050000-5637-718b-e3d0-fbee2f120a01	2315	Šmartno na Pohorju
00050000-5637-718b-db31-1532076c93a7	3341	Šmartno ob Dreti
00050000-5637-718b-3704-1a3d5bfc5efc	3327	Šmartno ob Paki
00050000-5637-718b-a27e-93559e2ff47e	1275	Šmartno pri Litiji
00050000-5637-718b-f6ca-9ef08b94fedf	2383	Šmartno pri Slovenj Gradcu
00050000-5637-718b-3c78-670fdf512699	3201	Šmartno v Rožni dolini
00050000-5637-718b-098c-36875f3a7f5d	3325	Šoštanj
00050000-5637-718b-1d78-a1dce982408e	6222	Štanjel
00050000-5637-718b-4d05-77a0fc938ac4	3220	Štore
00050000-5637-718b-f63e-d6488b356fd0	3304	Tabor
00050000-5637-718b-23d1-f35c64653452	3221	Teharje
00050000-5637-718b-e52f-7304afeed3e7	9251	Tišina
00050000-5637-718b-51f2-90fe35ffb033	5220	Tolmin
00050000-5637-718b-5ec2-a5164b8fb727	3326	Topolšica
00050000-5637-718b-10a9-05afe0172cbc	2371	Trbonje
00050000-5637-718b-b875-3b1bfb18eb92	1420	Trbovlje
00050000-5637-718b-2e31-9e04571a6c49	8231	Trebelno 
00050000-5637-718b-bdbc-081dd4505951	8210	Trebnje
00050000-5637-718b-75f9-252dd34dc970	5252	Trnovo pri Gorici
00050000-5637-718b-ab06-6f7deb7bfff5	2254	Trnovska vas
00050000-5637-718b-3e9d-7eaaca254e9f	1222	Trojane
00050000-5637-718b-9acf-cb373cc8fc2a	1236	Trzin
00050000-5637-718b-4fa4-f256ad25177b	4290	Tržič
00050000-5637-718b-fd11-c9953e56e893	8295	Tržišče
00050000-5637-718b-2ed9-797f2ebfa3d5	1311	Turjak
00050000-5637-718b-753e-d05f9f50f197	9224	Turnišče
00050000-5637-718b-2b71-ec4378a7b69c	8323	Uršna sela
00050000-5637-718b-aa3d-4e39c569dd51	1252	Vače
00050000-5637-718b-78a2-f3a703b2d656	3320	Velenje 
00050000-5637-718b-d85d-1db9590f61b3	3322	Velenje - poštni predali
00050000-5637-718b-1bba-002cd9ff9a4b	8212	Velika Loka
00050000-5637-718b-78cd-cc84889b8f75	2274	Velika Nedelja
00050000-5637-718b-3813-6dbda002c0e6	9225	Velika Polana
00050000-5637-718b-5a57-b04950fd7ca0	1315	Velike Lašče
00050000-5637-718b-377b-7386afade81d	8213	Veliki Gaber
00050000-5637-718b-b834-2eb6d9bad613	9241	Veržej
00050000-5637-718b-02c5-55ad88c9c79e	1312	Videm - Dobrepolje
00050000-5637-718b-2d96-5598f52cd4bf	2284	Videm pri Ptuju
00050000-5637-718b-397d-de597b535cf3	8344	Vinica
00050000-5637-718b-44f9-432a8bddc86e	5271	Vipava
00050000-5637-718b-3d64-b3194a9bc4a4	4212	Visoko
00050000-5637-718b-ff8d-39e0a46a1bfc	1294	Višnja Gora
00050000-5637-718b-1ea3-ecd62de30efd	3205	Vitanje
00050000-5637-718b-6515-8edfbbd25c7d	2255	Vitomarci
00050000-5637-718b-5788-b9aa4beef0f0	1217	Vodice
00050000-5637-718b-1990-915c3a6fc955	3212	Vojnik\t
00050000-5637-718b-36de-e5085dc5da44	5293	Volčja Draga
00050000-5637-718b-5b4b-bf58cd8fd95b	2232	Voličina
00050000-5637-718b-86a4-d4e4c6bb2652	3305	Vransko
00050000-5637-718b-b0ed-9f4bbbaca2bc	6217	Vremski Britof
00050000-5637-718b-b9f1-2acad936f8dd	1360	Vrhnika
00050000-5637-718b-0bf5-8b770fc308be	2365	Vuhred
00050000-5637-718b-cc61-f9607d49ed35	2367	Vuzenica
00050000-5637-718b-edac-65ea9c9b37a1	8292	Zabukovje 
00050000-5637-718b-2a4f-a75cd48d861f	1410	Zagorje ob Savi
00050000-5637-718b-aa9f-9e409fcb64c6	1303	Zagradec
00050000-5637-718b-4d97-d529a4db5a69	2283	Zavrč
00050000-5637-718b-da05-f654a361b8a7	8272	Zdole 
00050000-5637-718b-e3ef-4ad5c653770a	4201	Zgornja Besnica
00050000-5637-718b-baab-b686338ee3b5	2242	Zgornja Korena
00050000-5637-718b-1d69-a969a260205f	2201	Zgornja Kungota
00050000-5637-718b-e451-b71b3eb020ca	2316	Zgornja Ložnica
00050000-5637-718b-3019-c1e4808934cf	2314	Zgornja Polskava
00050000-5637-718b-b122-dae9f7b89cd1	2213	Zgornja Velka
00050000-5637-718b-c6b5-d800a06940c5	4247	Zgornje Gorje
00050000-5637-718b-d612-252955404a5d	4206	Zgornje Jezersko
00050000-5637-718b-4afd-7fd1a41a11c1	2285	Zgornji Leskovec
00050000-5637-718b-8a84-9ff1b211211e	1432	Zidani Most
00050000-5637-718b-09ec-75c548bb05db	3214	Zreče
00050000-5637-718b-e270-1184b8fdb904	4209	Žabnica
00050000-5637-718b-0015-1cd9a160431a	3310	Žalec
00050000-5637-718b-e654-8d5fb1d4bab3	4228	Železniki
00050000-5637-718b-ec81-6ca1a6696636	2287	Žetale
00050000-5637-718b-2226-e5bb3514e04f	4226	Žiri
00050000-5637-718b-5295-0a5e73868fb9	4274	Žirovnica
00050000-5637-718b-b34a-d2c9d029bd1e	8360	Žužemberk
\.


--
-- TOC entry 3149 (class 0 OID 24722665)
-- Dependencies: 239
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 24722241)
-- Dependencies: 212
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 24721995)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5637-718d-0314-58154255ffc7	00080000-5637-718d-526b-cb305a929105	\N	00040000-5637-718b-561f-80619179a268	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5637-718d-b9a4-2b0280fe35fc	00080000-5637-718d-526b-cb305a929105	\N	00040000-5637-718b-561f-80619179a268	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5637-718d-7abd-465f6b8460c6	00080000-5637-718d-1a69-5dd59c07b8fd	\N	00040000-5637-718b-561f-80619179a268	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3112 (class 0 OID 24722139)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5637-718b-8427-7e51d0bf70f4	novo leto	1	1	\N	t
00430000-5637-718b-94a7-558700da0394	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5637-718b-c0e6-4655b840bc78	dan upora proti okupatorju	27	4	\N	t
00430000-5637-718b-b41f-576e655b2c8a	praznik dela	1	5	\N	t
00430000-5637-718b-1e8b-5bbd3c67e306	praznik dela	2	5	\N	t
00430000-5637-718b-28eb-07d587cf6599	dan Primoža Trubarja	8	6	\N	f
00430000-5637-718b-3f0a-70d31ada5e5b	dan državnosti	25	6	\N	t
00430000-5637-718b-9bea-4569108a0bb8	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5637-718b-771d-850abe1cb076	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5637-718b-bbd8-22f97b206432	dan suverenosti	25	10	\N	f
00430000-5637-718b-c137-152cb8c44458	dan spomina na mrtve	1	11	\N	t
00430000-5637-718b-4d17-8538044614f2	dan Rudolfa Maistra	23	11	\N	f
00430000-5637-718b-9ff7-4602990e7707	božič	25	12	\N	t
00430000-5637-718b-2d69-245090910dbc	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5637-718b-a92e-6f5fb7e4650e	Marijino vnebovzetje	15	8	\N	t
00430000-5637-718b-f955-b1cb6fd2bd1b	dan reformacije	31	10	\N	t
00430000-5637-718b-5bf0-f6b15a1a5820	velikonočna nedelja	27	3	2016	t
00430000-5637-718b-c557-0cf14a443deb	velikonočna nedelja	16	4	2017	t
00430000-5637-718b-1189-2bfcac818186	velikonočna nedelja	1	4	2018	t
00430000-5637-718b-0a4c-8ea0cd932ffa	velikonočna nedelja	21	4	2019	t
00430000-5637-718b-3f92-6eb7291ad4e0	velikonočna nedelja	12	4	2020	t
00430000-5637-718b-2d1d-60faed9aebf0	velikonočna nedelja	4	4	2021	t
00430000-5637-718b-82a5-6e27239c957b	velikonočna nedelja	17	4	2022	t
00430000-5637-718b-9558-4a810c08c652	velikonočna nedelja	9	4	2023	t
00430000-5637-718b-75ee-aeab7c28d7cc	velikonočna nedelja	31	3	2024	t
00430000-5637-718b-8743-1f4dbc8eeaca	velikonočna nedelja	20	4	2025	t
00430000-5637-718b-0c1d-12fe36dde122	velikonočna nedelja	5	4	2026	t
00430000-5637-718b-045a-86b659fedc68	velikonočna nedelja	28	3	2027	t
00430000-5637-718b-2d97-65081c348b2d	velikonočna nedelja	16	4	2028	t
00430000-5637-718b-dd01-ca50fa7f231f	velikonočna nedelja	1	4	2029	t
00430000-5637-718b-6cf7-a7cded3eabec	velikonočna nedelja	21	4	2030	t
00430000-5637-718b-95a5-92751de8092e	velikonočni ponedeljek	28	3	2016	t
00430000-5637-718b-0b6a-ed05812ed2df	velikonočni ponedeljek	17	4	2017	t
00430000-5637-718b-c245-ed86685f1f1a	velikonočni ponedeljek	2	4	2018	t
00430000-5637-718b-7bdf-38e7a2354409	velikonočni ponedeljek	22	4	2019	t
00430000-5637-718b-9054-7ca015d019bb	velikonočni ponedeljek	13	4	2020	t
00430000-5637-718b-54f0-3e604f5de075	velikonočni ponedeljek	5	4	2021	t
00430000-5637-718b-34c5-14ca3bb23717	velikonočni ponedeljek	18	4	2022	t
00430000-5637-718b-524b-5e8bc1ca5985	velikonočni ponedeljek	10	4	2023	t
00430000-5637-718b-1b38-fde39c6073c7	velikonočni ponedeljek	1	4	2024	t
00430000-5637-718b-d5c6-0f3262a33f24	velikonočni ponedeljek	21	4	2025	t
00430000-5637-718b-19a4-2cf63e6b78aa	velikonočni ponedeljek	6	4	2026	t
00430000-5637-718b-a48b-3af1b4aba9f9	velikonočni ponedeljek	29	3	2027	t
00430000-5637-718b-f644-7ac991f1ebb8	velikonočni ponedeljek	17	4	2028	t
00430000-5637-718b-8690-9da0fc71abb7	velikonočni ponedeljek	2	4	2029	t
00430000-5637-718b-be30-e9e8a49611ec	velikonočni ponedeljek	22	4	2030	t
00430000-5637-718b-230d-f88598450c3f	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5637-718b-cc83-3e4cebf30cee	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5637-718b-c2c4-79b76a3f6435	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5637-718b-1f7a-6103df5d8eb8	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5637-718b-a7cd-cac629674043	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5637-718b-ba00-dfcc48aff819	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5637-718b-4756-12fd17a46ebe	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5637-718b-43fa-623c9ba28300	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5637-718b-afd8-5244a829be38	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5637-718b-b0ef-990953288ba7	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5637-718b-7b35-0ac2d371201a	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5637-718b-1b2f-c54ad26dcace	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5637-718b-a9c4-aa3b123955d8	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5637-718b-30ec-0a8a5e6dbc1b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5637-718b-295c-4df797a82eb8	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3108 (class 0 OID 24722099)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 24722111)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 24722253)
-- Dependencies: 214
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 24722679)
-- Dependencies: 240
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 24722689)
-- Dependencies: 241
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5637-718d-5d6d-a4fc130a90aa	00080000-5637-718d-ca0f-f407cb6ed957	0987	AK
00190000-5637-718d-3fb8-91450c86db2c	00080000-5637-718d-1a69-5dd59c07b8fd	0989	AK
00190000-5637-718d-515e-d58e55934ae5	00080000-5637-718d-f321-bddf9130452c	0986	AK
00190000-5637-718d-191f-d2bec35ac59c	00080000-5637-718d-b268-20fdc13736a0	0984	AK
00190000-5637-718d-c46a-f1fac4d5666e	00080000-5637-718d-f408-c69d8e3b808b	0983	AK
00190000-5637-718d-5399-116ee4d0afb3	00080000-5637-718d-2d7a-e148a56a28d6	0982	AK
00190000-5637-718f-9ffb-c88e9fc54abd	00080000-5637-718f-167b-202b3386f811	1001	AK
\.


--
-- TOC entry 3148 (class 0 OID 24722588)
-- Dependencies: 238
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5637-718d-a5d1-85b5dea81404	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3152 (class 0 OID 24722697)
-- Dependencies: 242
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 24722282)
-- Dependencies: 218
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5637-718d-c801-a84188efd13d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5637-718d-0cb6-4edf867b4c96	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5637-718d-13a5-8b04c41d1d08	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5637-718d-37cb-733afc9854ac	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5637-718d-9d61-733c119b0044	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5637-718d-eb02-6ca4fce9886f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5637-718d-fb59-265a9ffca004	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3120 (class 0 OID 24722226)
-- Dependencies: 210
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 24722216)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 24722427)
-- Dependencies: 231
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 24722357)
-- Dependencies: 225
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 24722073)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 24721835)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5637-718f-167b-202b3386f811	00010000-5637-718c-818b-285d76b734db	2015-11-02 15:22:07	INS	a:0:{}
2	App\\Entity\\Option	00000000-5637-718f-c79e-7dc883be1a50	00010000-5637-718c-818b-285d76b734db	2015-11-02 15:22:07	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5637-718f-9ffb-c88e9fc54abd	00010000-5637-718c-818b-285d76b734db	2015-11-02 15:22:07	INS	a:0:{}
\.


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3129 (class 0 OID 24722295)
-- Dependencies: 219
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 24721873)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5637-718c-d254-42376df8b793	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5637-718c-19ee-2944df0ee57b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5637-718c-6964-f51d1e6498ed	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5637-718c-09c8-c969bd1906a8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5637-718c-4371-5f71fdee9109	planer	Planer dogodkov v koledarju	t
00020000-5637-718c-dea7-fa2e37febacf	kadrovska	Kadrovska služba	t
00020000-5637-718c-a966-1ed3c44ccc11	arhivar	Ažuriranje arhivalij	t
00020000-5637-718c-f80c-5f7df06dbe6b	igralec	Igralec	t
00020000-5637-718c-bb48-98e3798b2106	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5637-718d-5013-c4afd5d9a523	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3087 (class 0 OID 24721857)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5637-718c-5585-47fa92caeda1	00020000-5637-718c-6964-f51d1e6498ed
00010000-5637-718c-818b-285d76b734db	00020000-5637-718c-6964-f51d1e6498ed
00010000-5637-718d-9226-b12fbc0360d0	00020000-5637-718d-5013-c4afd5d9a523
\.


--
-- TOC entry 3131 (class 0 OID 24722309)
-- Dependencies: 221
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 24722247)
-- Dependencies: 213
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 24722193)
-- Dependencies: 207
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5637-718d-50f2-a6b4376f50c4	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5637-718d-ab2d-0ffbd88a8096	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5637-718d-c374-ea0187d1b67c	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3083 (class 0 OID 24721822)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5637-718b-92df-3bd06effe565	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5637-718b-bbea-8f8c8a20cd34	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5637-718b-18bf-75fe623e48c8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5637-718b-23f4-5a5ded230190	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5637-718b-3e91-a7ef1814510a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3082 (class 0 OID 24721814)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5637-718b-b19a-46460cfe2c42	00230000-5637-718b-23f4-5a5ded230190	popa
00240000-5637-718b-1f6f-bd6a754e9df8	00230000-5637-718b-23f4-5a5ded230190	oseba
00240000-5637-718b-c90f-25ec259af353	00230000-5637-718b-23f4-5a5ded230190	tippopa
00240000-5637-718b-4f5a-d49cd77a5e58	00230000-5637-718b-23f4-5a5ded230190	organizacijskaenota
00240000-5637-718b-47db-074496da8adc	00230000-5637-718b-23f4-5a5ded230190	sezona
00240000-5637-718b-ca6a-c0e1335242e7	00230000-5637-718b-23f4-5a5ded230190	tipvaje
00240000-5637-718b-99e0-9788e13bf959	00230000-5637-718b-bbea-8f8c8a20cd34	prostor
00240000-5637-718b-00fc-fd2ffd67a85d	00230000-5637-718b-23f4-5a5ded230190	besedilo
00240000-5637-718b-49a7-fb82d043fbf0	00230000-5637-718b-23f4-5a5ded230190	uprizoritev
00240000-5637-718b-ac2f-e9cb5541c262	00230000-5637-718b-23f4-5a5ded230190	funkcija
00240000-5637-718b-6f7e-069056fd8b21	00230000-5637-718b-23f4-5a5ded230190	tipfunkcije
00240000-5637-718b-a9a4-e65bf6e08a3a	00230000-5637-718b-23f4-5a5ded230190	alternacija
00240000-5637-718b-3f94-402cc9fdf44a	00230000-5637-718b-92df-3bd06effe565	pogodba
00240000-5637-718b-1903-85b883a9db14	00230000-5637-718b-23f4-5a5ded230190	zaposlitev
00240000-5637-718b-a911-e9e1552642b4	00230000-5637-718b-23f4-5a5ded230190	zvrstuprizoritve
00240000-5637-718b-bed6-5a04356dc3da	00230000-5637-718b-92df-3bd06effe565	programdela
00240000-5637-718b-e287-92f664e3ad4b	00230000-5637-718b-23f4-5a5ded230190	zapis
\.


--
-- TOC entry 3081 (class 0 OID 24721809)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
20003afa-902d-4f87-b075-3a67cf670e5a	00240000-5637-718b-b19a-46460cfe2c42	0	1001
\.


--
-- TOC entry 3137 (class 0 OID 24722374)
-- Dependencies: 227
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5637-718d-2523-97ad3291b9ac	000e0000-5637-718d-294d-c16996f08972	00080000-5637-718d-526b-cb305a929105	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5637-718b-ace0-de4bdf4c054f
00270000-5637-718d-6557-7f8523292c42	000e0000-5637-718d-294d-c16996f08972	00080000-5637-718d-526b-cb305a929105	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5637-718b-ace0-de4bdf4c054f
\.


--
-- TOC entry 3097 (class 0 OID 24721957)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 24722203)
-- Dependencies: 208
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5637-718e-8083-7a94d7ae1336	00180000-5637-718d-f065-fe6f434f005b	000c0000-5637-718d-78c2-6de594011d09	00090000-5637-718d-0f16-4d0977b3a81b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-718e-e21d-a5ac366659eb	00180000-5637-718d-f065-fe6f434f005b	000c0000-5637-718d-4e6e-49a91e8ad696	00090000-5637-718d-ad3e-d64b84ab61c2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-718e-10b1-cb6e7cdedd3e	00180000-5637-718d-f065-fe6f434f005b	000c0000-5637-718d-e535-c02ad2ac8f92	00090000-5637-718d-5a7f-a002282491e0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-718e-aa97-5a7b3c08a791	00180000-5637-718d-f065-fe6f434f005b	000c0000-5637-718d-a631-6b6810bb64e1	00090000-5637-718d-e345-4beac6374c26	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-718e-6208-dfb72922c881	00180000-5637-718d-f065-fe6f434f005b	000c0000-5637-718d-4d3e-301150e93e88	00090000-5637-718d-d93a-447f9245d110	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5637-718e-197e-8949e871d54b	00180000-5637-718d-0634-b244a19ef740	\N	00090000-5637-718d-d93a-447f9245d110	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5637-718e-ab77-4774d7b1fbf1	00180000-5637-718d-0634-b244a19ef740	\N	00090000-5637-718d-ad3e-d64b84ab61c2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3140 (class 0 OID 24722415)
-- Dependencies: 230
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5637-718b-30bf-e7a4744ae470	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5637-718b-7bf8-b51f217e391d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5637-718b-55bd-cea866125c1a	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5637-718b-8c2a-5389c3338a69	04	Režija	Režija	Režija	umetnik	30
000f0000-5637-718b-787b-5e0e41d5a784	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5637-718b-381b-663863c643bb	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5637-718b-1809-36a01d6115a6	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5637-718b-16bf-cd0748dce73c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5637-718b-e4f4-bfb2efb05ca5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5637-718b-91b9-7012d061d079	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5637-718b-2ce8-6106e59a73e9	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5637-718b-7989-a4fefdb677c2	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5637-718b-91f3-1b781a0cdf75	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5637-718b-aaed-a45c777c46c9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5637-718b-216a-3760dc6955cb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5637-718b-51b9-726952109eee	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5637-718b-d6ad-3ad24ddf3470	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5637-718b-9055-3405da45f8a8	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3094 (class 0 OID 24721908)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5637-718d-5383-7750f6e34c27	0001	šola	osnovna ali srednja šola
00400000-5637-718d-34d2-d41567ace9ed	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5637-718d-5b7f-bf121fda70fb	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3153 (class 0 OID 24722708)
-- Dependencies: 243
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5637-718b-37dc-6c0ea2cc5afa	01	Velika predstava	f	1.00	1.00
002b0000-5637-718b-5321-a7d3ea0acfde	02	Mala predstava	f	0.50	0.50
002b0000-5637-718b-957e-42f195f030ac	03	Mala koprodukcija	t	0.40	1.00
002b0000-5637-718b-93a6-d5b92736d774	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5637-718b-0bf1-2722b7bf299a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3116 (class 0 OID 24722183)
-- Dependencies: 206
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5637-718b-ba05-47a11752a313	0001	prva vaja	prva vaja
00420000-5637-718b-8500-75e1e3a3d658	0002	tehnična vaja	tehnična vaja
00420000-5637-718b-b1da-843c10271d4c	0003	lučna vaja	lučna vaja
00420000-5637-718b-ff46-84c7643d734a	0004	kostumska vaja	kostumska vaja
00420000-5637-718b-0651-fafa8b91353c	0005	foto vaja	foto vaja
00420000-5637-718b-7c0e-3425566c945b	0006	1. glavna vaja	1. glavna vaja
00420000-5637-718b-c62f-07761285d551	0007	2. glavna vaja	2. glavna vaja
00420000-5637-718b-5760-62d3fa62c0fa	0008	1. generalka	1. generalka
00420000-5637-718b-1567-4c8122b26207	0009	2. generalka	2. generalka
00420000-5637-718b-c8f7-4cb2b8a9cf28	0010	odprta generalka	odprta generalka
00420000-5637-718b-02d0-6c1c7772443a	0011	obnovitvena vaja	obnovitvena vaja
00420000-5637-718b-c097-08a0c06b0311	0012	pevska vaja	pevska vaja
00420000-5637-718b-f592-b3ff99c46c3c	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5637-718b-b833-81ff4795198a	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3103 (class 0 OID 24722030)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 24721844)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5637-718c-818b-285d76b734db	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROPjnGfVrkn0yCkAVAqoIzCUhUlY/tnly	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5637-718d-a352-82309267f331	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5637-718d-1ae4-696807591c0a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5637-718d-336f-dfa40d3b688f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5637-718d-3602-05de98377792	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5637-718d-32f5-68ebc21125b2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5637-718d-fe47-a4e510bb2422	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5637-718d-c646-70012303d7b3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5637-718d-86ff-bed8264df902	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5637-718d-90ce-af0b3aaf56e8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5637-718d-9226-b12fbc0360d0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5637-718c-5585-47fa92caeda1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 24722465)
-- Dependencies: 234
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5637-718d-6402-fb30b671e13b	00160000-5637-718d-30ba-2a5da54cb5b7	\N	00140000-5637-718b-3bce-7c7e67f5b96c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5637-718d-9d61-733c119b0044
000e0000-5637-718d-294d-c16996f08972	00160000-5637-718d-c332-16c2924aa761	\N	00140000-5637-718b-f2a3-c4aa798e4024	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5637-718d-eb02-6ca4fce9886f
000e0000-5637-718d-818d-c7fc74053142	\N	\N	00140000-5637-718b-f2a3-c4aa798e4024	00190000-5637-718d-5d6d-a4fc130a90aa	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5637-718d-9d61-733c119b0044
000e0000-5637-718d-270c-b3c2e251d0b4	\N	\N	00140000-5637-718b-f2a3-c4aa798e4024	00190000-5637-718d-5d6d-a4fc130a90aa	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5637-718d-9d61-733c119b0044
000e0000-5637-718d-ad88-6202d979a40b	\N	\N	00140000-5637-718b-f2a3-c4aa798e4024	00190000-5637-718d-5d6d-a4fc130a90aa	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5637-718d-c801-a84188efd13d
000e0000-5637-718d-ccb2-cc9caad65000	\N	\N	00140000-5637-718b-f2a3-c4aa798e4024	00190000-5637-718d-5d6d-a4fc130a90aa	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5637-718d-c801-a84188efd13d
\.


--
-- TOC entry 3111 (class 0 OID 24722129)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5637-718d-97d4-9501535f32cf	\N	000e0000-5637-718d-294d-c16996f08972	1	
00200000-5637-718d-58b9-990aefffbfe8	\N	000e0000-5637-718d-294d-c16996f08972	2	
00200000-5637-718d-3346-618be41e0a57	\N	000e0000-5637-718d-294d-c16996f08972	3	
00200000-5637-718d-3eb0-753c520ddf8c	\N	000e0000-5637-718d-294d-c16996f08972	4	
00200000-5637-718d-ee5f-9c98806e558d	\N	000e0000-5637-718d-294d-c16996f08972	5	
\.


--
-- TOC entry 3127 (class 0 OID 24722274)
-- Dependencies: 217
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 24722388)
-- Dependencies: 228
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5637-718b-4953-a49b8e48b1fd	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5637-718b-c626-8f674725e569	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5637-718b-9967-0e1e1df0e966	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5637-718b-4afd-fcbdefed0cff	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5637-718b-5b91-dffe13cf03ce	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5637-718b-e635-881343b10daa	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5637-718b-6a4d-9a1349e15052	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5637-718b-bb8a-159210feade5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5637-718b-ace0-de4bdf4c054f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5637-718b-d6dd-8270791a0ade	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5637-718b-73a8-c341e40fb254	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5637-718b-5154-301970806599	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5637-718b-80ff-1dbdcc53a70f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5637-718b-da8e-cbc946d65109	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5637-718b-eb2a-f49a005a0cff	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5637-718b-f85d-a04df86e92ae	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5637-718b-3af9-b8403f8c6505	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5637-718b-853c-025245fe2457	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5637-718b-0f1d-acbe93094f1d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5637-718b-615a-b5e6fc6cb42b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5637-718b-60d2-7985d7ffec37	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5637-718b-20b1-76659f45ea9b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5637-718b-e12f-ef0a5f18ccf4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5637-718b-a670-b411ee2b21a5	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5637-718b-4e90-a0215210dbb1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5637-718b-4e96-5201fb726512	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5637-718b-b644-94d71ca6db10	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5637-718b-4994-212c970f6639	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3156 (class 0 OID 24722755)
-- Dependencies: 246
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 24722727)
-- Dependencies: 245
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 24722767)
-- Dependencies: 247
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 24722346)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5637-718d-7df8-e640898436bd	00090000-5637-718d-ad3e-d64b84ab61c2	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-718d-a3b0-5905fc2d4dae	00090000-5637-718d-5a7f-a002282491e0	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-718d-f806-ae2b0a0faf49	00090000-5637-718d-8842-6a16874c2514	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-718d-5db4-127f6d179772	00090000-5637-718d-4394-708c2204a466	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-718d-baf7-2547792ff05f	00090000-5637-718d-5763-e76957fb7127	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5637-718d-3602-c7a0292c19f6	00090000-5637-718d-89c5-5f43441c6d7f	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3114 (class 0 OID 24722172)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 24722455)
-- Dependencies: 233
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5637-718b-3bce-7c7e67f5b96c	01	Drama	drama (SURS 01)
00140000-5637-718b-8234-e8c20d7b05e1	02	Opera	opera (SURS 02)
00140000-5637-718b-b98f-815318b46e42	03	Balet	balet (SURS 03)
00140000-5637-718b-7a87-2acf91e67054	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5637-718b-9113-3f8edfa376b0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5637-718b-f2a3-c4aa798e4024	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5637-718b-a91f-699d06f3198a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3133 (class 0 OID 24722336)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2580 (class 2606 OID 24721907)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 24722514)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 24722504)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 24721898)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 24722371)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 24722413)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 24722807)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 24722161)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 24722182)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 24722725)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 24722056)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 24722582)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 24722332)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 24722127)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 24722094)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 24722070)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 24722239)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 24722784)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 24722791)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2858 (class 2606 OID 24722815)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 24507018)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2715 (class 2606 OID 24722266)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 24722028)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 24721926)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 24721990)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 24721953)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 24721887)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2569 (class 2606 OID 24721872)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 24722272)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 24722308)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 24722450)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 24721981)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 24722016)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 24722677)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 24722245)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 24722006)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 24722146)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 24722115)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2647 (class 2606 OID 24722107)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 24722257)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 24722686)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 24722694)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24722664)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 24722706)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 24722290)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 24722230)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 24722221)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 24722437)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24722364)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 24722082)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 24721843)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 24722299)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 24721861)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2571 (class 2606 OID 24721881)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24722317)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 24722252)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 24722201)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 24721831)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 24721819)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 24721813)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 24722384)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 24721962)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 24722212)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 24722424)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 24721915)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 24722718)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 24722190)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 24722041)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 24721856)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 24722483)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 24722136)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 24722280)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 24722396)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 24722765)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 24722749)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 24722773)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 24722354)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 24722176)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 24722463)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 24722344)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 1259 OID 24722170)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2664 (class 1259 OID 24722171)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2665 (class 1259 OID 24722169)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2666 (class 1259 OID 24722168)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2667 (class 1259 OID 24722167)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2758 (class 1259 OID 24722385)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2759 (class 1259 OID 24722386)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 24722387)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2844 (class 1259 OID 24722786)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2845 (class 1259 OID 24722785)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2598 (class 1259 OID 24721983)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2599 (class 1259 OID 24721984)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2716 (class 1259 OID 24722273)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2831 (class 1259 OID 24722753)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2832 (class 1259 OID 24722752)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2833 (class 1259 OID 24722754)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2834 (class 1259 OID 24722751)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2835 (class 1259 OID 24722750)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2710 (class 1259 OID 24722259)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 24722258)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2655 (class 1259 OID 24722137)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2656 (class 1259 OID 24722138)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2740 (class 1259 OID 24722333)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 24722335)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2742 (class 1259 OID 24722334)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2630 (class 1259 OID 24722072)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 24722071)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2822 (class 1259 OID 24722707)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2774 (class 1259 OID 24722452)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2775 (class 1259 OID 24722453)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2776 (class 1259 OID 24722454)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2841 (class 1259 OID 24722774)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2783 (class 1259 OID 24722488)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2784 (class 1259 OID 24722485)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2785 (class 1259 OID 24722489)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2786 (class 1259 OID 24722487)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2787 (class 1259 OID 24722486)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2620 (class 1259 OID 24722043)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 24722042)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 24721956)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2728 (class 1259 OID 24722300)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2573 (class 1259 OID 24721888)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2574 (class 1259 OID 24721889)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2733 (class 1259 OID 24722320)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2734 (class 1259 OID 24722319)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2735 (class 1259 OID 24722318)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 24721993)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2604 (class 1259 OID 24721992)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2605 (class 1259 OID 24721994)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2643 (class 1259 OID 24722110)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2644 (class 1259 OID 24722108)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 24722109)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2553 (class 1259 OID 24721821)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2690 (class 1259 OID 24722225)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2691 (class 1259 OID 24722223)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2692 (class 1259 OID 24722222)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2693 (class 1259 OID 24722224)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2564 (class 1259 OID 24721862)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 24721863)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2719 (class 1259 OID 24722281)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2854 (class 1259 OID 24722808)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2756 (class 1259 OID 24722373)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 24722372)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2855 (class 1259 OID 24722816)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 24722817)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2705 (class 1259 OID 24722246)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2750 (class 1259 OID 24722365)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2751 (class 1259 OID 24722366)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 24722587)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2805 (class 1259 OID 24722586)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2806 (class 1259 OID 24722583)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 24722584)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2808 (class 1259 OID 24722585)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2609 (class 1259 OID 24722008)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 24722007)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2611 (class 1259 OID 24722009)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2722 (class 1259 OID 24722294)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2723 (class 1259 OID 24722293)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 24722687)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2815 (class 1259 OID 24722688)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2797 (class 1259 OID 24722518)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 24722519)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2799 (class 1259 OID 24722516)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2800 (class 1259 OID 24722517)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2746 (class 1259 OID 24722355)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 24722356)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2696 (class 1259 OID 24722234)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2697 (class 1259 OID 24722233)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 24722231)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2699 (class 1259 OID 24722232)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2793 (class 1259 OID 24722506)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 24722505)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2634 (class 1259 OID 24722083)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2637 (class 1259 OID 24722097)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2638 (class 1259 OID 24722096)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2639 (class 1259 OID 24722095)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2640 (class 1259 OID 24722098)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2654 (class 1259 OID 24722128)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2648 (class 1259 OID 24722116)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2649 (class 1259 OID 24722117)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2811 (class 1259 OID 24722678)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2830 (class 1259 OID 24722726)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2848 (class 1259 OID 24722792)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2849 (class 1259 OID 24722793)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2585 (class 1259 OID 24721928)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 24721927)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2594 (class 1259 OID 24721963)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 24721964)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 24722177)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2685 (class 1259 OID 24722215)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2686 (class 1259 OID 24722214)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2687 (class 1259 OID 24722213)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2668 (class 1259 OID 24722163)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2669 (class 1259 OID 24722164)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2670 (class 1259 OID 24722162)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2671 (class 1259 OID 24722166)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2672 (class 1259 OID 24722165)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2602 (class 1259 OID 24721982)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 24721916)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 24721917)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2626 (class 1259 OID 24722057)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 24722059)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2628 (class 1259 OID 24722058)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2629 (class 1259 OID 24722060)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2704 (class 1259 OID 24722240)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 24722451)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2788 (class 1259 OID 24722484)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 24722425)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 24722426)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2592 (class 1259 OID 24721954)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 24721955)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2743 (class 1259 OID 24722345)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 24721832)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 24722029)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2608 (class 1259 OID 24721991)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 24721820)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2827 (class 1259 OID 24722719)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 24722292)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2727 (class 1259 OID 24722291)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 24722191)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 24722192)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2801 (class 1259 OID 24722515)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 24722017)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 24722464)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2838 (class 1259 OID 24722766)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2820 (class 1259 OID 24722695)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 24722696)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2767 (class 1259 OID 24722414)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2684 (class 1259 OID 24722202)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 24721882)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2897 (class 2606 OID 24722988)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2896 (class 2606 OID 24722993)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2892 (class 2606 OID 24723013)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2898 (class 2606 OID 24722983)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2894 (class 2606 OID 24723003)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2893 (class 2606 OID 24723008)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2895 (class 2606 OID 24722998)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2934 (class 2606 OID 24723183)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2933 (class 2606 OID 24723188)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 24723193)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 24723358)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2967 (class 2606 OID 24723353)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 24722873)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2870 (class 2606 OID 24722878)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2915 (class 2606 OID 24723098)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2961 (class 2606 OID 24723338)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2962 (class 2606 OID 24723333)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2960 (class 2606 OID 24723343)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2963 (class 2606 OID 24723328)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2964 (class 2606 OID 24723323)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2913 (class 2606 OID 24723093)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2914 (class 2606 OID 24723088)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2891 (class 2606 OID 24722973)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2890 (class 2606 OID 24722978)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2925 (class 2606 OID 24723138)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 24723148)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2924 (class 2606 OID 24723143)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2880 (class 2606 OID 24722928)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 24722923)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 24723078)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 24723313)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 24723198)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2936 (class 2606 OID 24723203)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2935 (class 2606 OID 24723208)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2965 (class 2606 OID 24723348)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2939 (class 2606 OID 24723228)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2942 (class 2606 OID 24723213)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2938 (class 2606 OID 24723233)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2940 (class 2606 OID 24723223)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2941 (class 2606 OID 24723218)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2878 (class 2606 OID 24722918)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 24722913)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2866 (class 2606 OID 24722858)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2867 (class 2606 OID 24722853)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2919 (class 2606 OID 24723118)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2863 (class 2606 OID 24722833)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2862 (class 2606 OID 24722838)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 24723133)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2921 (class 2606 OID 24723128)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2922 (class 2606 OID 24723123)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2873 (class 2606 OID 24722888)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2874 (class 2606 OID 24722883)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2872 (class 2606 OID 24722893)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 24722953)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 24722943)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 24722948)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2859 (class 2606 OID 24722818)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2903 (class 2606 OID 24723053)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2905 (class 2606 OID 24723043)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2906 (class 2606 OID 24723038)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2904 (class 2606 OID 24723048)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2861 (class 2606 OID 24722823)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 24722828)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2916 (class 2606 OID 24723103)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2970 (class 2606 OID 24723373)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 24723178)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 24723173)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2972 (class 2606 OID 24723378)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 24723383)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2912 (class 2606 OID 24723083)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2929 (class 2606 OID 24723163)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2928 (class 2606 OID 24723168)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2949 (class 2606 OID 24723288)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 24723283)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2953 (class 2606 OID 24723268)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 24723273)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2951 (class 2606 OID 24723278)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2876 (class 2606 OID 24722903)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2877 (class 2606 OID 24722898)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2875 (class 2606 OID 24722908)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2917 (class 2606 OID 24723113)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 24723108)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2956 (class 2606 OID 24723298)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2955 (class 2606 OID 24723303)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2946 (class 2606 OID 24723258)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 24723263)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2948 (class 2606 OID 24723248)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2947 (class 2606 OID 24723253)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 24723153)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 24723158)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2907 (class 2606 OID 24723073)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2908 (class 2606 OID 24723068)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2910 (class 2606 OID 24723058)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2909 (class 2606 OID 24723063)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2943 (class 2606 OID 24723243)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 24723238)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 24722933)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2883 (class 2606 OID 24722938)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 24722968)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2888 (class 2606 OID 24722958)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 24722963)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2954 (class 2606 OID 24723293)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2957 (class 2606 OID 24723308)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2959 (class 2606 OID 24723318)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 24723363)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 24723368)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2864 (class 2606 OID 24722848)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 24722843)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2869 (class 2606 OID 24722863)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 24722868)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 24723018)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 24723033)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 24723028)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2902 (class 2606 OID 24723023)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-02 15:22:08 CET

--
-- PostgreSQL database dump complete
--

