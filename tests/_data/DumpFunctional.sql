--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-29 09:11:57 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 250 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 23954478)
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
-- TOC entry 234 (class 1259 OID 23955086)
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
-- TOC entry 233 (class 1259 OID 23955069)
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
-- TOC entry 224 (class 1259 OID 23954946)
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
-- TOC entry 227 (class 1259 OID 23954976)
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
-- TOC entry 248 (class 1259 OID 23955357)
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
-- TOC entry 201 (class 1259 OID 23954726)
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
-- TOC entry 203 (class 1259 OID 23954757)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 23955283)
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
-- TOC entry 192 (class 1259 OID 23954623)
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
-- TOC entry 235 (class 1259 OID 23955099)
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
-- TOC entry 220 (class 1259 OID 23954900)
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
-- TOC entry 198 (class 1259 OID 23954697)
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
-- TOC entry 195 (class 1259 OID 23954663)
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
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 23954640)
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
-- TOC entry 209 (class 1259 OID 23954814)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 23955338)
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
-- TOC entry 247 (class 1259 OID 23955350)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 23955372)
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
-- TOC entry 170 (class 1259 OID 23562333)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23954839)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 23954597)
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
-- TOC entry 183 (class 1259 OID 23954497)
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
-- TOC entry 187 (class 1259 OID 23954564)
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
-- TOC entry 184 (class 1259 OID 23954508)
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
-- TOC entry 178 (class 1259 OID 23954452)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 23954471)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 23954846)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 23954880)
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
-- TOC entry 230 (class 1259 OID 23955017)
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
-- TOC entry 186 (class 1259 OID 23954544)
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
-- TOC entry 189 (class 1259 OID 23954589)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 23955228)
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
-- TOC entry 210 (class 1259 OID 23954820)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 23954574)
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
-- TOC entry 200 (class 1259 OID 23954718)
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
-- TOC entry 196 (class 1259 OID 23954678)
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
-- TOC entry 197 (class 1259 OID 23954690)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 23954832)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 23955242)
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
-- TOC entry 239 (class 1259 OID 23955252)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23955167)
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
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 240 (class 1259 OID 23955260)
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
-- TOC entry 216 (class 1259 OID 23954861)
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
-- TOC entry 208 (class 1259 OID 23954805)
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
-- TOC entry 207 (class 1259 OID 23954795)
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
-- TOC entry 229 (class 1259 OID 23955006)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 23954936)
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
-- TOC entry 194 (class 1259 OID 23954652)
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
-- TOC entry 175 (class 1259 OID 23954423)
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
-- TOC entry 174 (class 1259 OID 23954421)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 217 (class 1259 OID 23954874)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 23954461)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 23954445)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 23954888)
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
-- TOC entry 211 (class 1259 OID 23954826)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 23954772)
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
-- TOC entry 173 (class 1259 OID 23954410)
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
-- TOC entry 172 (class 1259 OID 23954402)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 23954397)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 23954953)
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
-- TOC entry 185 (class 1259 OID 23954536)
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
-- TOC entry 206 (class 1259 OID 23954782)
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
-- TOC entry 228 (class 1259 OID 23954994)
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
-- TOC entry 182 (class 1259 OID 23954487)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 23955271)
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
-- TOC entry 204 (class 1259 OID 23954762)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 23954609)
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
-- TOC entry 176 (class 1259 OID 23954432)
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
-- TOC entry 232 (class 1259 OID 23955044)
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
-- TOC entry 199 (class 1259 OID 23954708)
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
-- TOC entry 215 (class 1259 OID 23954853)
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
-- TOC entry 226 (class 1259 OID 23954967)
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
-- TOC entry 244 (class 1259 OID 23955318)
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
-- TOC entry 243 (class 1259 OID 23955290)
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
-- TOC entry 245 (class 1259 OID 23955330)
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
-- TOC entry 222 (class 1259 OID 23954925)
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
-- TOC entry 202 (class 1259 OID 23954751)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 23955034)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 23954915)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 23954426)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3065 (class 0 OID 23954478)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5631-d4c9-89e1-02754bc30824	10	30	Otroci	Abonma za otroke	200
000a0000-5631-d4c9-c3f4-930b100cf9d8	20	60	Mladina	Abonma za mladino	400
000a0000-5631-d4c9-9c69-bbcd24b17ae8	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3118 (class 0 OID 23955086)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5631-d4ca-4f3a-c47e43f50494	000d0000-5631-d4ca-1ede-a53129e33c63	\N	00090000-5631-d4ca-d80e-7e4928030d6e	000b0000-5631-d4ca-767a-ac7d409e748d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5631-d4ca-5b85-2e8e3fb0aaa1	000d0000-5631-d4ca-16a2-b1b2d3a99ffa	00100000-5631-d4ca-ed62-c8d3a90725b6	00090000-5631-d4ca-9694-3fcb13ce1afc	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5631-d4ca-58ba-a7a0b27cedf8	000d0000-5631-d4ca-e001-3df33bf911e1	00100000-5631-d4ca-f6fd-32c6e92e49ec	00090000-5631-d4ca-45e6-611813fd3605	\N	0003	t	\N	2015-10-29	\N	2	t	\N	f	f
000c0000-5631-d4ca-18c1-ad0213dfee3a	000d0000-5631-d4ca-08f8-8efd1747b2df	\N	00090000-5631-d4ca-2ed9-faaa9506a27d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5631-d4ca-1b20-aa85902838a5	000d0000-5631-d4ca-c24a-2ff3bc32f96e	\N	00090000-5631-d4ca-7f94-880dc1878a55	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5631-d4ca-512a-4cde57a649da	000d0000-5631-d4ca-c59d-2ac6a7d9729d	\N	00090000-5631-d4ca-73e5-f72377ca562c	000b0000-5631-d4ca-504e-0e9ceefb0396	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5631-d4ca-703f-c6608ce00c2e	000d0000-5631-d4ca-933e-ef674fdbab51	00100000-5631-d4ca-bdf3-73c81162c975	00090000-5631-d4ca-18e3-71c06d15f0f6	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5631-d4ca-7e9d-09ea87299b20	000d0000-5631-d4ca-3d3e-2d5f1795a538	\N	00090000-5631-d4ca-3101-4e938452c9b3	000b0000-5631-d4ca-4bce-3fd2d290bfd0	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5631-d4ca-b6bc-b28a2cf9a7a8	000d0000-5631-d4ca-933e-ef674fdbab51	00100000-5631-d4ca-bd21-0ab42832ac77	00090000-5631-d4ca-258b-7ee79f4ac0d4	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5631-d4ca-f0c0-1d42e2c75de6	000d0000-5631-d4ca-933e-ef674fdbab51	00100000-5631-d4ca-1764-07cf00b61519	00090000-5631-d4ca-ddab-1158e76bad27	\N	0010	t	\N	2015-10-29	\N	16	f	\N	f	t
000c0000-5631-d4ca-8d3b-cb4790680634	000d0000-5631-d4ca-933e-ef674fdbab51	00100000-5631-d4ca-40c5-9beb96f04161	00090000-5631-d4ca-660c-680d96ca44f3	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5631-d4ca-ddbf-c74d4a1b201d	000d0000-5631-d4ca-fd26-794cccf487f4	00100000-5631-d4ca-ed62-c8d3a90725b6	00090000-5631-d4ca-9694-3fcb13ce1afc	000b0000-5631-d4ca-ffd4-08b6fcd164a4	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3117 (class 0 OID 23955069)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23954946)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5631-d4ca-4893-dae1bf263067	00160000-5631-d4c9-22e7-e66da999b2f8	00090000-5631-d4ca-fa5d-a062480c1f7d	aizv	10	t
003d0000-5631-d4ca-632b-4455a33be039	00160000-5631-d4c9-22e7-e66da999b2f8	00090000-5631-d4ca-9be3-20c79956106c	apri	14	t
003d0000-5631-d4ca-795e-82e9177c3d2f	00160000-5631-d4c9-2580-54e4f5c300db	00090000-5631-d4ca-3b08-9dd83a945c7b	aizv	11	t
003d0000-5631-d4ca-7681-1aebe0d665c0	00160000-5631-d4c9-3867-aa059fa93a3a	00090000-5631-d4ca-c4a2-ece8a15f916f	aizv	12	t
003d0000-5631-d4ca-553c-26bdb185acd1	00160000-5631-d4c9-22e7-e66da999b2f8	00090000-5631-d4ca-c99d-0a7530d777ba	apri	18	f
\.


--
-- TOC entry 3111 (class 0 OID 23954976)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5631-d4c9-22e7-e66da999b2f8	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5631-d4c9-2580-54e4f5c300db	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5631-d4c9-3867-aa059fa93a3a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3132 (class 0 OID 23955357)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23954726)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5631-d4ca-a7b8-958f02dfbc74	\N	\N	00200000-5631-d4ca-6ef2-4d09371c5eed	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5631-d4ca-9a22-9ae9630acd1a	\N	\N	00200000-5631-d4ca-97b5-38f221b5298e	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5631-d4ca-4651-d59d64910ec2	\N	\N	00200000-5631-d4ca-9e66-6cc6364873c8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5631-d4ca-0f43-0c7e7a93d4b5	\N	\N	00200000-5631-d4ca-4d30-0b41f50479ee	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5631-d4ca-7327-164701e52b8a	\N	\N	00200000-5631-d4ca-2370-e0a032036592	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3087 (class 0 OID 23954757)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23955283)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 23954623)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5631-d4c7-d7ea-ccc3095b59ce	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5631-d4c7-21c3-e565aca9a29a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5631-d4c7-4ff8-bdcf4f0cef5c	AL	ALB	008	Albania 	Albanija	\N
00040000-5631-d4c7-7e52-a7ddef7e85f3	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5631-d4c7-822a-31b877665a34	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5631-d4c7-0f50-664285d4bb04	AD	AND	020	Andorra 	Andora	\N
00040000-5631-d4c7-9bb7-2d8091d033d8	AO	AGO	024	Angola 	Angola	\N
00040000-5631-d4c7-7ca0-e71dfc1b0a47	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5631-d4c7-3436-01fd69f6d040	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5631-d4c7-e123-485a58cb45fe	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5631-d4c7-2fbc-827ea50ddd69	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5631-d4c7-6e91-0dc548a18e67	AM	ARM	051	Armenia 	Armenija	\N
00040000-5631-d4c7-13bb-c752328394b8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5631-d4c7-9c2a-34cf37234994	AU	AUS	036	Australia 	Avstralija	\N
00040000-5631-d4c7-4155-6f3e48833477	AT	AUT	040	Austria 	Avstrija	\N
00040000-5631-d4c7-4386-bc59b587a195	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5631-d4c7-551e-d5ed6e7d9119	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5631-d4c7-61e1-75ec514bc8ff	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5631-d4c7-d87e-beef160a2d88	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5631-d4c7-9690-bb583c04a53a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5631-d4c7-e74c-903bf4dc1167	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5631-d4c7-f4b6-a014c7f98660	BE	BEL	056	Belgium 	Belgija	\N
00040000-5631-d4c7-a281-a48677dc0136	BZ	BLZ	084	Belize 	Belize	\N
00040000-5631-d4c7-83da-a0ccc8f30514	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5631-d4c7-8669-dc4c0146cfbb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5631-d4c7-e40c-14fc34e3c63d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5631-d4c7-6c78-9b067a9c97f7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5631-d4c7-0953-12948281987a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5631-d4c7-f171-407281e86736	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5631-d4c7-cee9-d16c772e73e3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5631-d4c7-d1c4-1fece0e386bd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5631-d4c7-84c5-c2f66391db9a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5631-d4c7-4659-43c030bd8f14	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5631-d4c7-7e8b-cc42f05735cf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5631-d4c7-bf1b-550370c9680b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5631-d4c7-d4e9-21ad7590c587	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5631-d4c7-82dd-c44887f1997d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5631-d4c7-d400-d3dac0bd098b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5631-d4c7-4655-34312c706ea3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5631-d4c7-7135-2ff921fcb467	CA	CAN	124	Canada 	Kanada	\N
00040000-5631-d4c7-5742-546505147ba0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5631-d4c7-f93c-5e73089d69d9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5631-d4c7-5f60-bdb6ade7adbb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5631-d4c7-c603-a99888dcda91	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5631-d4c7-89df-733007d36e3c	CL	CHL	152	Chile 	Čile	\N
00040000-5631-d4c7-70b9-6946fa39ac25	CN	CHN	156	China 	Kitajska	\N
00040000-5631-d4c7-b28c-853067aa1845	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5631-d4c7-2146-b9306c3a780b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5631-d4c7-b184-bf263a06747d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5631-d4c7-a6f7-854222b4d938	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5631-d4c7-ff5e-1b7089236ce0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5631-d4c7-cbd7-03a9f6cd7311	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5631-d4c7-7bab-2aab8aaa3e0c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5631-d4c7-a48a-204ebd565bdd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5631-d4c7-ecfe-3eced7930e7a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5631-d4c7-1add-ae18bef1cbc8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5631-d4c7-1338-127774957320	CU	CUB	192	Cuba 	Kuba	\N
00040000-5631-d4c7-1f34-41286a574284	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5631-d4c7-dc71-75fa2452252c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5631-d4c7-539a-e695c2a5a7db	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5631-d4c7-61ae-f3c7392d27ae	DK	DNK	208	Denmark 	Danska	\N
00040000-5631-d4c7-f543-c6c76009af6a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5631-d4c7-1a91-06031bef6039	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5631-d4c7-6cf1-2f99a627606c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5631-d4c7-63b8-697805cfabf9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5631-d4c7-2a9e-f0e2e81d4784	EG	EGY	818	Egypt 	Egipt	\N
00040000-5631-d4c7-f849-4c04a043d719	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5631-d4c7-5d35-d936abff4ac9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5631-d4c7-18a0-856d4fe89a5b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5631-d4c7-dd12-0cfdeb8ed64e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5631-d4c7-f759-c34ec7e05c22	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5631-d4c7-dace-299a99f5f525	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5631-d4c7-f451-9b60b22a7371	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5631-d4c7-27ab-6d8568a2d77e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5631-d4c7-206a-093474fdcc1d	FI	FIN	246	Finland 	Finska	\N
00040000-5631-d4c7-6d6b-dd012592c7ca	FR	FRA	250	France 	Francija	\N
00040000-5631-d4c7-d490-ad1b32c606c5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5631-d4c7-2978-9fab6d940ed1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5631-d4c7-8cb6-42001b2ab087	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5631-d4c7-fe32-3e6c85c22a6b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5631-d4c7-7572-d88927d95a79	GA	GAB	266	Gabon 	Gabon	\N
00040000-5631-d4c7-5b4b-02bf0c5dd88a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5631-d4c7-0037-843b8c54bbaf	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5631-d4c7-4a33-7c83f6ff6154	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5631-d4c7-551b-8df5724e21d2	GH	GHA	288	Ghana 	Gana	\N
00040000-5631-d4c7-7f58-a04e1e2e459f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5631-d4c7-d6a5-6bbe0324bfc9	GR	GRC	300	Greece 	Grčija	\N
00040000-5631-d4c7-913e-057167ef6ca3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5631-d4c7-6de7-decfa9b428e9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5631-d4c7-d4b0-c808e1a48896	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5631-d4c7-b9c3-efb11a70efa1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5631-d4c7-bbd6-f382d0bb5fd6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5631-d4c7-9b8f-8bab9ac44e35	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5631-d4c7-a387-ce0f4b73ef87	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5631-d4c7-1fc2-a2d33bf5cb65	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5631-d4c7-cd6a-9588eee2da62	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5631-d4c7-9084-3e2144ff54a9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5631-d4c7-cffa-87e260a47ae9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5631-d4c7-6a4b-0ba6e3724500	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5631-d4c7-6a77-7a6842640c2a	HN	HND	340	Honduras 	Honduras	\N
00040000-5631-d4c7-9de7-3f280da88869	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5631-d4c7-bc11-236371725cc1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5631-d4c7-ec38-69daeddecca2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5631-d4c7-2c5e-b3d013d62e65	IN	IND	356	India 	Indija	\N
00040000-5631-d4c7-2f3d-4e15ac8fd923	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5631-d4c7-602b-327790d24661	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5631-d4c7-efae-4c7f3f8b5c31	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5631-d4c7-5bb8-7ecf5f0c8cd8	IE	IRL	372	Ireland 	Irska	\N
00040000-5631-d4c7-5550-5665d0f5d82e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5631-d4c7-e021-0b53cadb4d4a	IL	ISR	376	Israel 	Izrael	\N
00040000-5631-d4c7-9a7f-46292bcf4a4b	IT	ITA	380	Italy 	Italija	\N
00040000-5631-d4c7-7ffc-ef65073866fb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5631-d4c7-cf69-e2d79afd0712	JP	JPN	392	Japan 	Japonska	\N
00040000-5631-d4c7-7fdc-93a2f7ac9054	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5631-d4c7-e230-816b148e2ef7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5631-d4c7-c0bf-aa35d892b83d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5631-d4c7-fc7e-c89a661c3d7e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5631-d4c7-d82e-de7398a90e55	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5631-d4c7-85e1-7b2c5aab5926	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5631-d4c7-3b63-acf8d0a93d15	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5631-d4c7-d958-1ae100f37ce0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5631-d4c7-b6ec-e5febf627553	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5631-d4c7-fc52-d217f3791f33	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5631-d4c7-00db-e1346443efed	LV	LVA	428	Latvia 	Latvija	\N
00040000-5631-d4c7-1ae3-d7b08e0abcae	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5631-d4c7-5846-903831ea81f8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5631-d4c7-e110-a8607230fb9e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5631-d4c7-fde2-8c26c47891cc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5631-d4c7-164e-77f45aba20e3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5631-d4c7-cb11-3a1aaf4d7fdf	LT	LTU	440	Lithuania 	Litva	\N
00040000-5631-d4c7-86cd-218f3a06e116	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5631-d4c7-a5b3-ac5c60bb13cb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5631-d4c7-85a3-0aabffae454f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5631-d4c7-8b96-2da11dec7c16	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5631-d4c7-23ab-113d01410bd7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5631-d4c7-b283-d52a5b586386	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5631-d4c7-d53c-2be8916bcb23	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5631-d4c7-f2af-ef1643c3c5fa	ML	MLI	466	Mali 	Mali	\N
00040000-5631-d4c7-e8d3-3a4723c8fd06	MT	MLT	470	Malta 	Malta	\N
00040000-5631-d4c7-a5f4-465aca109623	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5631-d4c7-767b-8039078ee5ab	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5631-d4c7-3fe2-2fff7157109d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5631-d4c7-3659-dd88c8b2447c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5631-d4c7-2f3a-4cbfcc7588c2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5631-d4c7-426f-d684e6b2a895	MX	MEX	484	Mexico 	Mehika	\N
00040000-5631-d4c7-414f-e4eb31a8dad9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5631-d4c7-65b1-57fa64a391a9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5631-d4c7-5132-cd140a0bb050	MC	MCO	492	Monaco 	Monako	\N
00040000-5631-d4c7-8ceb-02a8ac626ff2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5631-d4c7-554a-106ccd82ec21	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5631-d4c7-d45d-f949987114d8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5631-d4c7-13ab-046e3e96c1ca	MA	MAR	504	Morocco 	Maroko	\N
00040000-5631-d4c7-2a41-577f3013d902	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5631-d4c7-e11a-a084c93f9987	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5631-d4c7-b606-8bc0d37d83d6	NA	NAM	516	Namibia 	Namibija	\N
00040000-5631-d4c7-baf0-351f9c8231fb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5631-d4c7-f7f0-b0e454191acd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5631-d4c7-c05b-a8ed4c2c0d41	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5631-d4c7-e23c-76a92e66adfd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5631-d4c7-4fda-cd9717b0006c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5631-d4c7-e388-224c2814b043	NE	NER	562	Niger 	Niger 	\N
00040000-5631-d4c7-c16e-58d0095611c8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5631-d4c7-8624-66d23f6eb9b0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5631-d4c7-ab35-62233b146ecf	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5631-d4c7-2a89-2e5ec3c00b29	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5631-d4c7-37be-b2b0abc45ac1	NO	NOR	578	Norway 	Norveška	\N
00040000-5631-d4c7-222e-84b404c2d3db	OM	OMN	512	Oman 	Oman	\N
00040000-5631-d4c7-08c3-1dd6ec7b2938	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5631-d4c7-6d40-89f2217064a6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5631-d4c7-2bda-f79cbe2b3e42	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5631-d4c7-dd61-684ba9f08aac	PA	PAN	591	Panama 	Panama	\N
00040000-5631-d4c7-31fd-567aca917949	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5631-d4c7-b0b2-ecc36df152c7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5631-d4c7-eba3-2a7435528d44	PE	PER	604	Peru 	Peru	\N
00040000-5631-d4c7-a970-36efa947fc79	PH	PHL	608	Philippines 	Filipini	\N
00040000-5631-d4c7-e1f1-5f619a2086b5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5631-d4c7-5088-8381b273a15c	PL	POL	616	Poland 	Poljska	\N
00040000-5631-d4c7-0cc7-1ddcfe7f436f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5631-d4c7-e083-857e203ed5c8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5631-d4c7-3d1a-a8e1e013ce35	QA	QAT	634	Qatar 	Katar	\N
00040000-5631-d4c7-d82f-0031d7926f7f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5631-d4c7-39be-5874d8bf7990	RO	ROU	642	Romania 	Romunija	\N
00040000-5631-d4c7-07f0-3d5236cc91d1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5631-d4c7-a4a2-e6f57170e654	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5631-d4c7-a8f6-3a1b16c88cd0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5631-d4c7-cc8b-ea58fcaac328	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5631-d4c7-891b-6660d665eb2a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5631-d4c7-72a8-f921564c0126	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5631-d4c7-619b-3dadaa1bc140	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5631-d4c7-939b-f76d6326635a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5631-d4c7-c81a-b643b4803648	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5631-d4c7-14f9-4921f9793b22	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5631-d4c7-832b-d68aa6cc0519	SM	SMR	674	San Marino 	San Marino	\N
00040000-5631-d4c7-2559-0d05a2b2876a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5631-d4c7-0472-bbbad9de647f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5631-d4c7-fcec-565083e09446	SN	SEN	686	Senegal 	Senegal	\N
00040000-5631-d4c7-e120-5e75f814a5dc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5631-d4c7-4b0a-6beaa75bae20	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5631-d4c7-4850-53fdfe3d2248	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5631-d4c7-7d4d-bd1d12275739	SG	SGP	702	Singapore 	Singapur	\N
00040000-5631-d4c7-b6b8-a079b1ff27dd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5631-d4c7-5517-1bdde7f92e49	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5631-d4c7-4ef5-34b93d9b073c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5631-d4c7-9600-dc4f3d039322	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5631-d4c7-7b56-b2d02cc7e413	SO	SOM	706	Somalia 	Somalija	\N
00040000-5631-d4c7-17a6-103f1a26388d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5631-d4c7-c1b5-97c012024e18	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5631-d4c7-95cc-2954e7d6f4c5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5631-d4c7-f282-84a8024a9844	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5631-d4c7-5417-216615c972d2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5631-d4c7-5355-871152638eb3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5631-d4c7-00b9-43060edd88ce	SR	SUR	740	Suriname 	Surinam	\N
00040000-5631-d4c7-7c3f-edf5d022b892	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5631-d4c7-7976-7dfb9da6b7aa	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5631-d4c7-348f-ff1e54b76902	SE	SWE	752	Sweden 	Švedska	\N
00040000-5631-d4c7-1fe7-da3226db8701	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5631-d4c7-d207-166e72cd474c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5631-d4c7-1e16-f6da7f32c84c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5631-d4c7-f432-ad0308736fc3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5631-d4c7-b5dd-722907e08bf6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5631-d4c7-e00c-a188a5d9d06b	TH	THA	764	Thailand 	Tajska	\N
00040000-5631-d4c7-b6a1-658aa14bb7c3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5631-d4c7-db6a-28e2cf5b961d	TG	TGO	768	Togo 	Togo	\N
00040000-5631-d4c7-f453-ef75f3d195e5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5631-d4c7-0bf7-d3d80e3f0cf9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5631-d4c7-7be1-8d995263185f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5631-d4c7-490c-06c5d4f21665	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5631-d4c7-df3b-5f014fd770ad	TR	TUR	792	Turkey 	Turčija	\N
00040000-5631-d4c7-9cd5-071d18a41090	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5631-d4c7-787b-8bdf1cb25d87	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5631-d4c7-b205-6a079dd0e579	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5631-d4c7-1592-2ba3c838fd32	UG	UGA	800	Uganda 	Uganda	\N
00040000-5631-d4c7-70e7-3cfb66d71e24	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5631-d4c7-8c19-7b11b988bad1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5631-d4c7-30c5-5f05a45da68f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5631-d4c7-fec6-9848af3b3619	US	USA	840	United States 	Združene države Amerike	\N
00040000-5631-d4c7-ee7d-e757b9e898bb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5631-d4c7-ee06-222de91a60b6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5631-d4c7-513c-3472a9a4dcd8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5631-d4c7-6ed2-df4d8abf8166	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5631-d4c7-1734-b60d9d3a7606	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5631-d4c7-ac19-6071dbfab18a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5631-d4c7-c20e-f0587243c825	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5631-d4c7-3659-627ecfa3df79	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5631-d4c7-db95-729093ae5c3b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5631-d4c7-4431-62297b9b2934	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5631-d4c7-35f3-7ed6f4aefa49	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5631-d4c7-540b-cff5d1976992	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5631-d4c7-7084-e94c845b84c6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3119 (class 0 OID 23955099)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5631-d4ca-2833-c7d347dac3dc	000e0000-5631-d4ca-9df3-6640c69f03fb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5631-d4c7-5d33-20bcad53255c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5631-d4ca-a719-db1e97317bad	000e0000-5631-d4ca-d800-c2032a768bc4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5631-d4c7-6080-16108700487f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5631-d4ca-335e-f23e051037c4	000e0000-5631-d4ca-7ad1-7bdcb0d7c7b5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5631-d4c7-5d33-20bcad53255c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5631-d4ca-e7cd-43e17282536a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5631-d4ca-8f4a-08acda0c0afc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3104 (class 0 OID 23954900)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5631-d4ca-933e-ef674fdbab51	000e0000-5631-d4ca-d800-c2032a768bc4	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5631-d4c7-03ab-c5baa6781ef6
000d0000-5631-d4ca-1ede-a53129e33c63	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-4f3a-c47e43f50494	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5631-d4c7-03ab-c5baa6781ef6
000d0000-5631-d4ca-16a2-b1b2d3a99ffa	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-5b85-2e8e3fb0aaa1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5631-d4c7-8916-daaefcde5d47
000d0000-5631-d4ca-e001-3df33bf911e1	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-58ba-a7a0b27cedf8	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5631-d4c7-9802-a1c086978fed
000d0000-5631-d4ca-08f8-8efd1747b2df	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-18c1-ad0213dfee3a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5631-d4c7-cd4c-a3bd1f251a56
000d0000-5631-d4ca-c24a-2ff3bc32f96e	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-1b20-aa85902838a5	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5631-d4c7-cd4c-a3bd1f251a56
000d0000-5631-d4ca-c59d-2ac6a7d9729d	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-512a-4cde57a649da	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5631-d4c7-03ab-c5baa6781ef6
000d0000-5631-d4ca-3d3e-2d5f1795a538	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-7e9d-09ea87299b20	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5631-d4c7-fffa-72174588c69d
000d0000-5631-d4ca-fd26-794cccf487f4	000e0000-5631-d4ca-d800-c2032a768bc4	000c0000-5631-d4ca-ddbf-c74d4a1b201d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5631-d4c7-c8ff-dd365b2271df
\.


--
-- TOC entry 3082 (class 0 OID 23954697)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23954663)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 23954640)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5631-d4ca-eb2c-562725377855	00080000-5631-d4ca-22ad-9241408ece79	00090000-5631-d4ca-ddab-1158e76bad27	AK		igralka
\.


--
-- TOC entry 3093 (class 0 OID 23954814)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 23955338)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 23955350)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 23955372)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 23562333)
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
\.


--
-- TOC entry 3097 (class 0 OID 23954839)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23954597)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5631-d4c8-19d3-bdb0f8346d7c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5631-d4c8-3c62-ab626d195ef8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5631-d4c8-6f5d-27ad2b6aff60	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5631-d4c8-0fea-a15cfb4daaf9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5631-d4c8-229d-e6af808f3350	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5631-d4c8-39f2-ba173d5e18a3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5631-d4c8-1b51-156ea7e6e473	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5631-d4c8-50f0-4766f78d93f0	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5631-d4c8-0caa-640c958a15fb	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5631-d4c8-e1c6-8a00b999ec75	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5631-d4c8-587a-114b18a616c2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5631-d4c8-1853-282cdd8cb09b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5631-d4c8-7486-494be4f1bfbd	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5631-d4c8-a60b-4f2717b75a7d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5631-d4c8-c161-d879fdb77c73	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5631-d4c9-fec5-3c13a2f6f45d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5631-d4c9-ca2b-5f6ad6d00c1b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5631-d4c9-c89c-c91867e21364	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5631-d4c9-80d0-c20bfeb1eb4b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5631-d4c9-a18a-f3cdf64c7d90	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5631-d4cc-82b4-3a5a4bf275f5	application.tenant.maticnopodjetje	string	s:36:"00080000-5631-d4cc-8978-de875655f4d2";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3067 (class 0 OID 23954497)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5631-d4c9-2fbc-d6ff75776903	00000000-5631-d4c9-fec5-3c13a2f6f45d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5631-d4c9-8f5e-07b85ead0dcd	00000000-5631-d4c9-fec5-3c13a2f6f45d	00010000-5631-d4c8-3dff-ae5ced008880	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5631-d4c9-4a60-5f0cd2d0a5ca	00000000-5631-d4c9-ca2b-5f6ad6d00c1b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3071 (class 0 OID 23954564)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5631-d4ca-a501-6f9a236a9aa7	\N	00100000-5631-d4ca-ed62-c8d3a90725b6	00100000-5631-d4ca-f6fd-32c6e92e49ec	01	Gledališče Nimbis
00410000-5631-d4ca-c9cd-c2ef07c1b136	00410000-5631-d4ca-a501-6f9a236a9aa7	00100000-5631-d4ca-ed62-c8d3a90725b6	00100000-5631-d4ca-f6fd-32c6e92e49ec	02	Tehnika
\.


--
-- TOC entry 3068 (class 0 OID 23954508)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5631-d4ca-d80e-7e4928030d6e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5631-d4ca-2ed9-faaa9506a27d	00010000-5631-d4c9-8ed1-e04adb3b0860	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5631-d4ca-45e6-611813fd3605	00010000-5631-d4c9-b05d-13e9f57b01e7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5631-d4ca-258b-7ee79f4ac0d4	00010000-5631-d4ca-233a-9cbf4dae32c3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5631-d4ca-6940-0a8074da5d8c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5631-d4ca-73e5-f72377ca562c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5631-d4ca-660c-680d96ca44f3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5631-d4ca-18e3-71c06d15f0f6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5631-d4ca-ddab-1158e76bad27	00010000-5631-d4ca-064e-7072b9b263b9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5631-d4ca-9694-3fcb13ce1afc	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5631-d4ca-7ab5-8a1bb4b08ee4	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5631-d4ca-7f94-880dc1878a55	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5631-d4ca-3101-4e938452c9b3	00010000-5631-d4ca-3c78-243b206831ce	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5631-d4ca-fa5d-a062480c1f7d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5631-d4ca-9be3-20c79956106c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5631-d4ca-3b08-9dd83a945c7b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5631-d4ca-c4a2-ece8a15f916f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5631-d4ca-c99d-0a7530d777ba	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5631-d4ca-1589-bca39e495491	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5631-d4ca-9926-c2a5fb9cd5c0	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5631-d4ca-93ab-e5574f46252e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3062 (class 0 OID 23954452)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5631-d4c7-7f21-d9309b65dc1e	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5631-d4c7-df1d-a6e8e3e1c8f3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5631-d4c7-65f6-877fa5c6d617	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5631-d4c7-7cee-c3907d54e2d1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5631-d4c7-ff9a-dc631d3ed0c8	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5631-d4c7-9ac2-5b05395f686f	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5631-d4c7-6495-871b34acfea1	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5631-d4c7-ea46-0f6024d188f4	Abonma-read	Abonma - branje	t
00030000-5631-d4c7-a953-0ad556699c83	Abonma-write	Abonma - spreminjanje	t
00030000-5631-d4c7-840a-926894edfd41	Alternacija-read	Alternacija - branje	t
00030000-5631-d4c7-27d9-84051055cc40	Alternacija-write	Alternacija - spreminjanje	t
00030000-5631-d4c7-2d94-c9e2430fcd17	Arhivalija-read	Arhivalija - branje	t
00030000-5631-d4c7-0062-0ba0240f7947	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5631-d4c7-c673-1746b53dbf0e	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5631-d4c7-8030-93d0de2905b9	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5631-d4c7-006b-713d0a8d2178	Besedilo-read	Besedilo - branje	t
00030000-5631-d4c7-273b-3e2e350a63af	Besedilo-write	Besedilo - spreminjanje	t
00030000-5631-d4c7-4e7f-64ec1643f304	DogodekIzven-read	DogodekIzven - branje	t
00030000-5631-d4c7-374c-ce9453454725	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5631-d4c7-fbd4-36715e22e492	Dogodek-read	Dogodek - branje	t
00030000-5631-d4c7-5379-5abb9360fbe3	Dogodek-write	Dogodek - spreminjanje	t
00030000-5631-d4c7-9aae-6cefa958dca9	DrugiVir-read	DrugiVir - branje	t
00030000-5631-d4c7-9635-df17abe4e42a	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5631-d4c7-28f5-8b9284da903d	Drzava-read	Drzava - branje	t
00030000-5631-d4c7-3c66-29c00a8ed684	Drzava-write	Drzava - spreminjanje	t
00030000-5631-d4c7-cdda-0778a92a106f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5631-d4c7-7616-6f0fda33a78a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5631-d4c7-890d-fbdef9c159cf	Funkcija-read	Funkcija - branje	t
00030000-5631-d4c7-1db9-91a137b58f5f	Funkcija-write	Funkcija - spreminjanje	t
00030000-5631-d4c7-1c43-a7cef5c39cb6	Gostovanje-read	Gostovanje - branje	t
00030000-5631-d4c7-19a6-a68bc6613cda	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5631-d4c7-b217-27d2b054eb0e	Gostujoca-read	Gostujoca - branje	t
00030000-5631-d4c7-0bc6-d21da4b2b33b	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5631-d4c7-c22f-cd3509318016	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5631-d4c7-3b50-156627ea66b6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5631-d4c7-1740-1861b3f428ba	Kupec-read	Kupec - branje	t
00030000-5631-d4c7-423a-c282f82b85ae	Kupec-write	Kupec - spreminjanje	t
00030000-5631-d4c7-60a5-6484204f3604	NacinPlacina-read	NacinPlacina - branje	t
00030000-5631-d4c7-19a2-5cc89965039d	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5631-d4c7-4603-72e39597241a	Option-read	Option - branje	t
00030000-5631-d4c7-8e31-357eb59f7bbb	Option-write	Option - spreminjanje	t
00030000-5631-d4c7-c620-8f6ecea85355	OptionValue-read	OptionValue - branje	t
00030000-5631-d4c7-af7e-77ff65f79a9d	OptionValue-write	OptionValue - spreminjanje	t
00030000-5631-d4c7-5ccc-b455e1d38840	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5631-d4c7-17a4-0cd9a0af220e	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5631-d4c7-0e29-865d0b0f042a	Oseba-read	Oseba - branje	t
00030000-5631-d4c7-d6ad-1fef4c062a31	Oseba-write	Oseba - spreminjanje	t
00030000-5631-d4c7-b810-e2b207f39ff2	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5631-d4c7-0fc4-02785059641f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5631-d4c7-faf2-a879df3f180d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5631-d4c7-eed7-5738e830d7e1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5631-d4c7-784a-32b8dcae220f	Pogodba-read	Pogodba - branje	t
00030000-5631-d4c7-90a8-a36e19280703	Pogodba-write	Pogodba - spreminjanje	t
00030000-5631-d4c7-172c-bc2d2309e67e	Popa-read	Popa - branje	t
00030000-5631-d4c7-dc43-ffc21289d6fc	Popa-write	Popa - spreminjanje	t
00030000-5631-d4c7-7ec3-2075c97ce716	Posta-read	Posta - branje	t
00030000-5631-d4c7-37e9-0083b7e56c15	Posta-write	Posta - spreminjanje	t
00030000-5631-d4c7-63aa-a1029589ae8f	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5631-d4c7-00ef-dc8b22588498	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5631-d4c7-3980-d61859e906cb	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5631-d4c7-feb5-bafc22e9829e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5631-d4c7-67d7-7ef4965a33bf	PostniNaslov-read	PostniNaslov - branje	t
00030000-5631-d4c7-f929-ff973e8c539a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5631-d4c7-f477-9ad73a4ee161	Predstava-read	Predstava - branje	t
00030000-5631-d4c7-e2d9-fb680002f0ee	Predstava-write	Predstava - spreminjanje	t
00030000-5631-d4c7-d0c2-128cd08bbe23	Praznik-read	Praznik - branje	t
00030000-5631-d4c7-575e-e151898d2e41	Praznik-write	Praznik - spreminjanje	t
00030000-5631-d4c7-bce0-ac4be93e63d4	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5631-d4c7-b8e1-eec25dddabbf	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5631-d4c7-836f-01a6c62ce7bd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5631-d4c7-372c-39e8f8a584ec	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5631-d4c7-d4ca-b056c8c8ab7b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5631-d4c7-6472-d268fa50902a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5631-d4c7-a01e-8eacda372e0d	ProgramDela-read	ProgramDela - branje	t
00030000-5631-d4c7-5447-f23a9d732f16	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5631-d4c7-3da8-5d8dba0918a1	ProgramFestival-read	ProgramFestival - branje	t
00030000-5631-d4c7-ea4c-f7e53a084925	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5631-d4c7-e96d-8f4db09693c7	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5631-d4c7-8199-d1bfe0206288	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5631-d4c7-d5f4-c59672cc13b9	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5631-d4c7-7a1d-0d77d6d6658f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5631-d4c7-6be4-ffd11aaa52ff	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5631-d4c7-92cb-c470c9a59563	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5631-d4c7-3f93-ff874fd15367	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5631-d4c7-5821-99141d61fe33	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5631-d4c7-b04e-88c52e9a1dda	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5631-d4c7-bdb5-77961fc86753	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5631-d4c7-fe35-ebfd3507f553	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5631-d4c7-1b9d-ff12a08036ac	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5631-d4c7-c994-08a72b62e645	ProgramRazno-read	ProgramRazno - branje	t
00030000-5631-d4c7-59b4-77f7b04a88bf	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5631-d4c7-ec9e-150abb7002e4	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5631-d4c7-374f-10ffd1b68c09	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5631-d4c7-d894-e9a9387a5d88	Prostor-read	Prostor - branje	t
00030000-5631-d4c7-e2cd-bc6580737d24	Prostor-write	Prostor - spreminjanje	t
00030000-5631-d4c7-a825-1afa68af11b3	Racun-read	Racun - branje	t
00030000-5631-d4c7-d839-85971ec11263	Racun-write	Racun - spreminjanje	t
00030000-5631-d4c7-36b1-9ecd90f6a61f	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5631-d4c7-b4bc-44e42980e95f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5631-d4c7-b979-f70195ea2544	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5631-d4c7-d9a5-32b79e030ad3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5631-d4c7-720a-468eedb205a4	Rekvizit-read	Rekvizit - branje	t
00030000-5631-d4c7-b216-ff34e6c53f59	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5631-d4c7-e553-e533ffe2212e	Revizija-read	Revizija - branje	t
00030000-5631-d4c7-ca4a-4437f5bdf446	Revizija-write	Revizija - spreminjanje	t
00030000-5631-d4c7-da6f-f170528f2e37	Rezervacija-read	Rezervacija - branje	t
00030000-5631-d4c7-35c4-0a07db7343c7	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5631-d4c7-e505-a77fba55f0b7	SedezniRed-read	SedezniRed - branje	t
00030000-5631-d4c7-ca70-dc3088ff9f2a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5631-d4c7-85b2-8e400c092c28	Sedez-read	Sedez - branje	t
00030000-5631-d4c7-2449-fe8da0f77b44	Sedez-write	Sedez - spreminjanje	t
00030000-5631-d4c7-6a91-78d666352791	Sezona-read	Sezona - branje	t
00030000-5631-d4c7-1d94-ae1c647436a7	Sezona-write	Sezona - spreminjanje	t
00030000-5631-d4c7-0414-e461038736fd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5631-d4c7-f4e2-2e5b7d8b2c55	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5631-d4c7-60e2-e542ca5db61e	Stevilcenje-read	Stevilcenje - branje	t
00030000-5631-d4c7-1bd4-3f83379a0191	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5631-d4c7-0be4-0d1ffc561b7d	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5631-d4c7-8842-3604832550de	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5631-d4c7-763b-7fad307d04b9	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5631-d4c7-2a1c-ac1e2c0c13b4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5631-d4c7-8d9f-f17e44c0fa1f	Telefonska-read	Telefonska - branje	t
00030000-5631-d4c7-a0c8-f269693af512	Telefonska-write	Telefonska - spreminjanje	t
00030000-5631-d4c7-d6e6-6eaade410bb6	TerminStoritve-read	TerminStoritve - branje	t
00030000-5631-d4c7-456b-05f3e8ed64b0	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5631-d4c7-d59b-c407cee7d30e	TipFunkcije-read	TipFunkcije - branje	t
00030000-5631-d4c7-266b-7054224c4564	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5631-d4c7-43d9-ee85be59c89c	TipPopa-read	TipPopa - branje	t
00030000-5631-d4c7-04d8-f10e3c0e3166	TipPopa-write	TipPopa - spreminjanje	t
00030000-5631-d4c7-e23f-407d49749c0e	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5631-d4c7-782a-f74126cf24d1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5631-d4c7-862d-86c69156298d	TipVaje-read	TipVaje - branje	t
00030000-5631-d4c7-b2dc-88ebf8bb8073	TipVaje-write	TipVaje - spreminjanje	t
00030000-5631-d4c7-8acb-a33ff14e9dad	Trr-read	Trr - branje	t
00030000-5631-d4c7-2f0c-45ee8baf8696	Trr-write	Trr - spreminjanje	t
00030000-5631-d4c7-d1a4-becb7b6c1d0a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5631-d4c7-628b-0faa337ecaca	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5631-d4c7-9f7c-9100b6425340	Vaja-read	Vaja - branje	t
00030000-5631-d4c7-763b-e0ce28cd1a7a	Vaja-write	Vaja - spreminjanje	t
00030000-5631-d4c7-7b55-544ae58365fe	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5631-d4c7-fed8-e6a0c41c026e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5631-d4c7-d897-2f139d8861e7	VrstaStroska-read	VrstaStroska - branje	t
00030000-5631-d4c7-82c2-88caacfc2f00	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5631-d4c7-3dec-92f9cec2d9a4	Zaposlitev-read	Zaposlitev - branje	t
00030000-5631-d4c7-d135-464c2f760754	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5631-d4c7-1a4e-528a870dba72	Zasedenost-read	Zasedenost - branje	t
00030000-5631-d4c7-bd5a-b4fd0597f1be	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5631-d4c7-30fb-31b05c8aff6e	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5631-d4c7-7902-0d75c6f4792f	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5631-d4c7-74d6-1b950b040fb0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5631-d4c7-3830-f35370632cfa	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5631-d4c7-14f5-49b20c5b780e	Job-read	Branje opravil - samo zase - branje	t
00030000-5631-d4c7-acd4-aa816d277f8b	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5631-d4c7-35c6-93704345d80d	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5631-d4c7-77be-07db8c20d0d2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5631-d4c7-07f3-a0c89743ae31	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5631-d4c7-c8f7-eefe4adfe5ce	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5631-d4c7-f425-8930daebb33f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5631-d4c7-bd9b-8e5073559602	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5631-d4c7-baf7-3f9720a0f304	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5631-d4c7-59c2-5fe902dc38d0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5631-d4c7-6e6b-1b3d44affd1e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5631-d4c7-6583-9ac99f129318	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5631-d4c7-9d08-206043c2d9f9	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5631-d4c7-9019-e3d72758c591	Datoteka-write	Datoteka - spreminjanje	t
00030000-5631-d4c7-8933-a6dff7c33145	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3064 (class 0 OID 23954471)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5631-d4c7-5eba-d6c7c943c73c	00030000-5631-d4c7-df1d-a6e8e3e1c8f3
00020000-5631-d4c7-60be-6b21990773aa	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-ea46-0f6024d188f4
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-a953-0ad556699c83
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-840a-926894edfd41
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-27d9-84051055cc40
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-2d94-c9e2430fcd17
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-fbd4-36715e22e492
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-7cee-c3907d54e2d1
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-5379-5abb9360fbe3
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-3c66-29c00a8ed684
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-890d-fbdef9c159cf
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-1db9-91a137b58f5f
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-1c43-a7cef5c39cb6
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-19a6-a68bc6613cda
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-b217-27d2b054eb0e
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-0bc6-d21da4b2b33b
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-c22f-cd3509318016
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-3b50-156627ea66b6
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-4603-72e39597241a
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-c620-8f6ecea85355
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-0e29-865d0b0f042a
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-d6ad-1fef4c062a31
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-172c-bc2d2309e67e
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-dc43-ffc21289d6fc
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-7ec3-2075c97ce716
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-37e9-0083b7e56c15
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-67d7-7ef4965a33bf
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-f929-ff973e8c539a
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-f477-9ad73a4ee161
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-e2d9-fb680002f0ee
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-d4ca-b056c8c8ab7b
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-6472-d268fa50902a
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-d894-e9a9387a5d88
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-e2cd-bc6580737d24
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-b979-f70195ea2544
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-d9a5-32b79e030ad3
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-720a-468eedb205a4
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-b216-ff34e6c53f59
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-6a91-78d666352791
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-1d94-ae1c647436a7
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-d59b-c407cee7d30e
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-d1a4-becb7b6c1d0a
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-628b-0faa337ecaca
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-9f7c-9100b6425340
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-763b-e0ce28cd1a7a
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-1a4e-528a870dba72
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-bd5a-b4fd0597f1be
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-30fb-31b05c8aff6e
00020000-5631-d4c8-54f1-715e364ed014	00030000-5631-d4c7-74d6-1b950b040fb0
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-ea46-0f6024d188f4
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-2d94-c9e2430fcd17
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-fbd4-36715e22e492
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-1c43-a7cef5c39cb6
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-b217-27d2b054eb0e
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-c22f-cd3509318016
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-3b50-156627ea66b6
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-4603-72e39597241a
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-c620-8f6ecea85355
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-0e29-865d0b0f042a
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-d6ad-1fef4c062a31
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-172c-bc2d2309e67e
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-7ec3-2075c97ce716
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-67d7-7ef4965a33bf
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-f929-ff973e8c539a
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-f477-9ad73a4ee161
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-d894-e9a9387a5d88
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-b979-f70195ea2544
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-720a-468eedb205a4
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-6a91-78d666352791
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-8d9f-f17e44c0fa1f
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-a0c8-f269693af512
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-8acb-a33ff14e9dad
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-2f0c-45ee8baf8696
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-3dec-92f9cec2d9a4
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-d135-464c2f760754
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-30fb-31b05c8aff6e
00020000-5631-d4c8-08c0-b3629dfa5093	00030000-5631-d4c7-74d6-1b950b040fb0
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-ea46-0f6024d188f4
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-840a-926894edfd41
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-2d94-c9e2430fcd17
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-0062-0ba0240f7947
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-006b-713d0a8d2178
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-4e7f-64ec1643f304
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-fbd4-36715e22e492
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-890d-fbdef9c159cf
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-1c43-a7cef5c39cb6
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-b217-27d2b054eb0e
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-c22f-cd3509318016
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-4603-72e39597241a
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-c620-8f6ecea85355
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-0e29-865d0b0f042a
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-172c-bc2d2309e67e
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-7ec3-2075c97ce716
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-f477-9ad73a4ee161
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-d4ca-b056c8c8ab7b
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-d894-e9a9387a5d88
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-b979-f70195ea2544
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-720a-468eedb205a4
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-6a91-78d666352791
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-d59b-c407cee7d30e
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-9f7c-9100b6425340
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-1a4e-528a870dba72
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-30fb-31b05c8aff6e
00020000-5631-d4c8-b5c8-4a38dd183e38	00030000-5631-d4c7-74d6-1b950b040fb0
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-ea46-0f6024d188f4
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-a953-0ad556699c83
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-27d9-84051055cc40
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-2d94-c9e2430fcd17
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-fbd4-36715e22e492
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-1c43-a7cef5c39cb6
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-b217-27d2b054eb0e
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-4603-72e39597241a
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-c620-8f6ecea85355
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-172c-bc2d2309e67e
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-7ec3-2075c97ce716
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-f477-9ad73a4ee161
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-d894-e9a9387a5d88
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-b979-f70195ea2544
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-720a-468eedb205a4
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-6a91-78d666352791
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-d59b-c407cee7d30e
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-30fb-31b05c8aff6e
00020000-5631-d4c8-2b61-37a97498292b	00030000-5631-d4c7-74d6-1b950b040fb0
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-ea46-0f6024d188f4
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-2d94-c9e2430fcd17
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-fbd4-36715e22e492
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-1c43-a7cef5c39cb6
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-b217-27d2b054eb0e
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-4603-72e39597241a
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-c620-8f6ecea85355
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-172c-bc2d2309e67e
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-7ec3-2075c97ce716
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-f477-9ad73a4ee161
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-d894-e9a9387a5d88
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-b979-f70195ea2544
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-720a-468eedb205a4
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-6a91-78d666352791
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-d6e6-6eaade410bb6
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-65f6-877fa5c6d617
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-d59b-c407cee7d30e
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-30fb-31b05c8aff6e
00020000-5631-d4c8-0ca3-a56ea3ddc64d	00030000-5631-d4c7-74d6-1b950b040fb0
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7f21-d9309b65dc1e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-df1d-a6e8e3e1c8f3
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-ea46-0f6024d188f4
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-a953-0ad556699c83
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-840a-926894edfd41
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-27d9-84051055cc40
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-2d94-c9e2430fcd17
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-0062-0ba0240f7947
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-c673-1746b53dbf0e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-8030-93d0de2905b9
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-006b-713d0a8d2178
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-273b-3e2e350a63af
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-4e7f-64ec1643f304
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-374c-ce9453454725
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-fbd4-36715e22e492
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7cee-c3907d54e2d1
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-5379-5abb9360fbe3
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-9aae-6cefa958dca9
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-9635-df17abe4e42a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-28f5-8b9284da903d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3c66-29c00a8ed684
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-cdda-0778a92a106f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7616-6f0fda33a78a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-890d-fbdef9c159cf
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1db9-91a137b58f5f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1c43-a7cef5c39cb6
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-19a6-a68bc6613cda
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b217-27d2b054eb0e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-0bc6-d21da4b2b33b
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-c22f-cd3509318016
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3b50-156627ea66b6
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1740-1861b3f428ba
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-423a-c282f82b85ae
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-60a5-6484204f3604
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-19a2-5cc89965039d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-4603-72e39597241a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-c620-8f6ecea85355
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-af7e-77ff65f79a9d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-8e31-357eb59f7bbb
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-5ccc-b455e1d38840
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-17a4-0cd9a0af220e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-0e29-865d0b0f042a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-ff9a-dc631d3ed0c8
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d6ad-1fef4c062a31
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b810-e2b207f39ff2
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-0fc4-02785059641f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-faf2-a879df3f180d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-eed7-5738e830d7e1
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-784a-32b8dcae220f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-90a8-a36e19280703
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-172c-bc2d2309e67e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-dc43-ffc21289d6fc
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7ec3-2075c97ce716
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-63aa-a1029589ae8f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-00ef-dc8b22588498
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3980-d61859e906cb
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-feb5-bafc22e9829e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-37e9-0083b7e56c15
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-67d7-7ef4965a33bf
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-f929-ff973e8c539a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d0c2-128cd08bbe23
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-575e-e151898d2e41
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-f477-9ad73a4ee161
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-e2d9-fb680002f0ee
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-bce0-ac4be93e63d4
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b8e1-eec25dddabbf
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-836f-01a6c62ce7bd
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-372c-39e8f8a584ec
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d4ca-b056c8c8ab7b
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-6472-d268fa50902a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-9ac2-5b05395f686f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-a01e-8eacda372e0d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-6495-871b34acfea1
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-5447-f23a9d732f16
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3da8-5d8dba0918a1
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-ea4c-f7e53a084925
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-e96d-8f4db09693c7
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-8199-d1bfe0206288
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d5f4-c59672cc13b9
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7a1d-0d77d6d6658f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-6be4-ffd11aaa52ff
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-92cb-c470c9a59563
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3f93-ff874fd15367
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-5821-99141d61fe33
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b04e-88c52e9a1dda
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-bdb5-77961fc86753
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-fe35-ebfd3507f553
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1b9d-ff12a08036ac
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-c994-08a72b62e645
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-59b4-77f7b04a88bf
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-ec9e-150abb7002e4
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-374f-10ffd1b68c09
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d894-e9a9387a5d88
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-e2cd-bc6580737d24
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-a825-1afa68af11b3
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d839-85971ec11263
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-36b1-9ecd90f6a61f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b4bc-44e42980e95f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b979-f70195ea2544
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d9a5-32b79e030ad3
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-720a-468eedb205a4
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b216-ff34e6c53f59
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-e553-e533ffe2212e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-ca4a-4437f5bdf446
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-da6f-f170528f2e37
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-35c4-0a07db7343c7
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-e505-a77fba55f0b7
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-ca70-dc3088ff9f2a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-85b2-8e400c092c28
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-2449-fe8da0f77b44
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-6a91-78d666352791
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1d94-ae1c647436a7
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-0414-e461038736fd
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-f4e2-2e5b7d8b2c55
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-60e2-e542ca5db61e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-0be4-0d1ffc561b7d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-8842-3604832550de
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1bd4-3f83379a0191
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-763b-7fad307d04b9
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-2a1c-ac1e2c0c13b4
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-8d9f-f17e44c0fa1f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-a0c8-f269693af512
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d6e6-6eaade410bb6
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-65f6-877fa5c6d617
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-456b-05f3e8ed64b0
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d59b-c407cee7d30e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-266b-7054224c4564
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-43d9-ee85be59c89c
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-04d8-f10e3c0e3166
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-e23f-407d49749c0e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-782a-f74126cf24d1
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-862d-86c69156298d
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-b2dc-88ebf8bb8073
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-8acb-a33ff14e9dad
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-2f0c-45ee8baf8696
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d1a4-becb7b6c1d0a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-628b-0faa337ecaca
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-9f7c-9100b6425340
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-763b-e0ce28cd1a7a
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7b55-544ae58365fe
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-fed8-e6a0c41c026e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d897-2f139d8861e7
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-82c2-88caacfc2f00
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3dec-92f9cec2d9a4
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-d135-464c2f760754
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-1a4e-528a870dba72
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-bd5a-b4fd0597f1be
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-30fb-31b05c8aff6e
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-7902-0d75c6f4792f
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-74d6-1b950b040fb0
00020000-5631-d4c9-8856-a872b9ee2c1e	00030000-5631-d4c7-3830-f35370632cfa
\.


--
-- TOC entry 3098 (class 0 OID 23954846)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 23954880)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 23955017)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5631-d4ca-767a-ac7d409e748d	00090000-5631-d4ca-d80e-7e4928030d6e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5631-d4ca-504e-0e9ceefb0396	00090000-5631-d4ca-73e5-f72377ca562c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5631-d4ca-4bce-3fd2d290bfd0	00090000-5631-d4ca-3101-4e938452c9b3	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5631-d4ca-ffd4-08b6fcd164a4	00090000-5631-d4ca-9694-3fcb13ce1afc	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3070 (class 0 OID 23954544)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5631-d4ca-22ad-9241408ece79	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-cbcd-c771cefed060	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5631-d4ca-3b86-d4ba73075238	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-690f-72c37f29f6c5	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-9edc-6cbb24d45b42	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-0c85-aa4b77f3ef0c	\N	00040000-5631-d4c7-2fbc-827ea50ddd69	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-a040-2e06bc8a71af	\N	00040000-5631-d4c7-1add-ae18bef1cbc8	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-6d3b-23aba7b0779a	\N	00040000-5631-d4c7-4155-6f3e48833477	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4ca-fe0e-4bd1b8f1102b	\N	00040000-5631-d4c7-4a33-7c83f6ff6154	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5631-d4cc-8978-de875655f4d2	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3073 (class 0 OID 23954589)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5631-d4c6-695b-618312c100de	8341	Adlešiči
00050000-5631-d4c6-8bfa-27e72af22885	5270	Ajdovščina
00050000-5631-d4c6-cca4-877f91316e6e	6280	Ankaran/Ancarano
00050000-5631-d4c6-79bd-0d5c80d19934	9253	Apače
00050000-5631-d4c6-95ea-bc7fd362508e	8253	Artiče
00050000-5631-d4c6-ee67-9049d8a9f9c1	4275	Begunje na Gorenjskem
00050000-5631-d4c6-8741-02fcb0696165	1382	Begunje pri Cerknici
00050000-5631-d4c6-7f42-4e7f19600931	9231	Beltinci
00050000-5631-d4c6-f957-0eabe6481c48	2234	Benedikt
00050000-5631-d4c6-831c-023e2b1f9ddb	2345	Bistrica ob Dravi
00050000-5631-d4c6-6a19-a305c1a8dd69	3256	Bistrica ob Sotli
00050000-5631-d4c6-c1cc-1a3da4347b95	8259	Bizeljsko
00050000-5631-d4c6-5d65-3dc19345169b	1223	Blagovica
00050000-5631-d4c6-01c6-bd187a5b8a76	8283	Blanca
00050000-5631-d4c6-5e33-18e4e8aa3a8b	4260	Bled
00050000-5631-d4c6-48c3-178c6f2c92f9	4273	Blejska Dobrava
00050000-5631-d4c6-2969-7076391ce5ff	9265	Bodonci
00050000-5631-d4c6-b6fa-ee063c6c3a21	9222	Bogojina
00050000-5631-d4c6-f2d1-72127f2ef914	4263	Bohinjska Bela
00050000-5631-d4c6-919e-f4dc940da007	4264	Bohinjska Bistrica
00050000-5631-d4c6-4d33-74996024c0bf	4265	Bohinjsko jezero
00050000-5631-d4c6-4237-0829712d502c	1353	Borovnica
00050000-5631-d4c6-6823-b61f471245dd	8294	Boštanj
00050000-5631-d4c6-aff5-9184dfe8c52f	5230	Bovec
00050000-5631-d4c6-59b5-5c4380c7dcb6	5295	Branik
00050000-5631-d4c6-f8c5-0755ed51dd97	3314	Braslovče
00050000-5631-d4c6-ad12-bf4089308c4f	5223	Breginj
00050000-5631-d4c6-df2d-83be68dd9346	8280	Brestanica
00050000-5631-d4c6-0b0e-338812c863cf	2354	Bresternica
00050000-5631-d4c6-3560-37fa8978d254	4243	Brezje
00050000-5631-d4c6-d47a-fd4f77ac97a4	1351	Brezovica pri Ljubljani
00050000-5631-d4c6-b90c-9bfca85c0ee9	8250	Brežice
00050000-5631-d4c6-81ba-48499ca1571b	4210	Brnik - Aerodrom
00050000-5631-d4c6-e422-5f7b4f09b038	8321	Brusnice
00050000-5631-d4c6-8977-5423436f5f44	3255	Buče
00050000-5631-d4c6-329c-2435f3640f52	8276	Bučka 
00050000-5631-d4c6-5504-3f85c5942dfa	9261	Cankova
00050000-5631-d4c6-e728-d8d8fc7d1ce6	3000	Celje 
00050000-5631-d4c6-af68-f5d1c948c65d	3001	Celje - poštni predali
00050000-5631-d4c6-2719-d4889c1dc785	4207	Cerklje na Gorenjskem
00050000-5631-d4c6-63c0-344942973076	8263	Cerklje ob Krki
00050000-5631-d4c6-ca7f-545f517a6351	1380	Cerknica
00050000-5631-d4c6-1d28-2bc7cf369393	5282	Cerkno
00050000-5631-d4c6-6f99-b6f6f4488a51	2236	Cerkvenjak
00050000-5631-d4c6-9074-e3cd1ec17a24	2215	Ceršak
00050000-5631-d4c6-b715-5c7b41ed954c	2326	Cirkovce
00050000-5631-d4c6-f8d9-af4c9bd39e91	2282	Cirkulane
00050000-5631-d4c6-dbfb-0aaf9c71b52e	5273	Col
00050000-5631-d4c6-5908-b207aa0d0091	8251	Čatež ob Savi
00050000-5631-d4c6-79ac-f5fb7cbd7b4e	1413	Čemšenik
00050000-5631-d4c6-a263-2b5f487b3bfc	5253	Čepovan
00050000-5631-d4c6-3520-c8965f027d32	9232	Črenšovci
00050000-5631-d4c6-9cb6-42e90a0b65ba	2393	Črna na Koroškem
00050000-5631-d4c6-1807-a6647cee953c	6275	Črni Kal
00050000-5631-d4c6-bcc8-dd8f27d47df8	5274	Črni Vrh nad Idrijo
00050000-5631-d4c6-6660-dafc28488af5	5262	Črniče
00050000-5631-d4c6-0844-4c9b451e2a03	8340	Črnomelj
00050000-5631-d4c6-98f0-d1b3bd74505f	6271	Dekani
00050000-5631-d4c6-23fe-5513691004a0	5210	Deskle
00050000-5631-d4c6-5ed0-64a4dc2344dc	2253	Destrnik
00050000-5631-d4c6-fa63-29116042783d	6215	Divača
00050000-5631-d4c6-d48a-586454caf1b6	1233	Dob
00050000-5631-d4c6-3bc4-aab26632783d	3224	Dobje pri Planini
00050000-5631-d4c6-9af6-3f6606a757cf	8257	Dobova
00050000-5631-d4c6-cecc-c4d9dc433e0a	1423	Dobovec
00050000-5631-d4c6-94c4-058221a0e98f	5263	Dobravlje
00050000-5631-d4c6-b213-ffb3da79cc8e	3204	Dobrna
00050000-5631-d4c6-7b2b-8e0f4ca9644f	8211	Dobrnič
00050000-5631-d4c6-4459-e34d57be2fd8	1356	Dobrova
00050000-5631-d4c6-623d-61e4ee5adac9	9223	Dobrovnik/Dobronak 
00050000-5631-d4c6-b6b0-6c3ba18ffb94	5212	Dobrovo v Brdih
00050000-5631-d4c6-dc6c-a0bde328ce7b	1431	Dol pri Hrastniku
00050000-5631-d4c6-af23-52e003c4f95a	1262	Dol pri Ljubljani
00050000-5631-d4c6-8494-8396b22999db	1273	Dole pri Litiji
00050000-5631-d4c6-e027-00948dddb70a	1331	Dolenja vas
00050000-5631-d4c6-871c-90fac50a2c0e	8350	Dolenjske Toplice
00050000-5631-d4c6-9fe9-e7b34854fe34	1230	Domžale
00050000-5631-d4c6-da0a-9ed31215b9f0	2252	Dornava
00050000-5631-d4c6-0455-82a71d4b53e2	5294	Dornberk
00050000-5631-d4c6-6d1b-32ec55025721	1319	Draga
00050000-5631-d4c6-98b1-08089c394867	8343	Dragatuš
00050000-5631-d4c6-5aff-6e8a530d81f4	3222	Dramlje
00050000-5631-d4c6-77d5-e2252ba84df4	2370	Dravograd
00050000-5631-d4c6-7781-dbe882f3794d	4203	Duplje
00050000-5631-d4c6-6fd4-13bfa6637890	6221	Dutovlje
00050000-5631-d4c6-3f7a-3a9532c7ec42	8361	Dvor
00050000-5631-d4c6-93c2-499df791a6e7	2343	Fala
00050000-5631-d4c6-6d49-14ea1d97e68d	9208	Fokovci
00050000-5631-d4c6-dc56-ff637be01a46	2313	Fram
00050000-5631-d4c6-02cb-359608992e80	3213	Frankolovo
00050000-5631-d4c6-5554-615f493201e4	1274	Gabrovka
00050000-5631-d4c6-2d91-ca6b47305a40	8254	Globoko
00050000-5631-d4c6-b749-2052d242c8b9	5275	Godovič
00050000-5631-d4c6-7cec-ef168104d4c9	4204	Golnik
00050000-5631-d4c6-e41f-24e37c070c42	3303	Gomilsko
00050000-5631-d4c6-049c-9808307f808a	4224	Gorenja vas
00050000-5631-d4c6-ac3e-624bc084bbba	3263	Gorica pri Slivnici
00050000-5631-d4c6-379c-09624da56bf3	2272	Gorišnica
00050000-5631-d4c6-9b5d-02160cddd0fc	9250	Gornja Radgona
00050000-5631-d4c6-fcac-e1f545623e47	3342	Gornji Grad
00050000-5631-d4c6-7983-c87e9beecdf0	4282	Gozd Martuljek
00050000-5631-d4c6-d28a-682216b3ec9d	6272	Gračišče
00050000-5631-d4c6-8620-6c5da461e15c	9264	Grad
00050000-5631-d4c6-0d84-10bc6ef2a454	8332	Gradac
00050000-5631-d4c6-cf69-09a702f9bd43	1384	Grahovo
00050000-5631-d4c6-e1be-6919e35ef048	5242	Grahovo ob Bači
00050000-5631-d4c6-8838-c15f77e016e8	5251	Grgar
00050000-5631-d4c6-8350-d7b88f59e0e5	3302	Griže
00050000-5631-d4c6-2add-6e2842f6ca86	3231	Grobelno
00050000-5631-d4c6-15da-6a4c2cbcd7a5	1290	Grosuplje
00050000-5631-d4c6-f7b4-d6d39c36fb50	2288	Hajdina
00050000-5631-d4c6-1416-83609d4d19b9	8362	Hinje
00050000-5631-d4c6-5cc7-b9c7b47b440f	2311	Hoče
00050000-5631-d4c6-4840-bcbc2db43357	9205	Hodoš/Hodos
00050000-5631-d4c6-0b09-4b33e6ace9cf	1354	Horjul
00050000-5631-d4c6-47d7-797905cee3bb	1372	Hotedršica
00050000-5631-d4c6-c8f4-c091ded02860	1430	Hrastnik
00050000-5631-d4c6-a1e6-7f276a3fc14d	6225	Hruševje
00050000-5631-d4c6-f828-27c5997673a6	4276	Hrušica
00050000-5631-d4c6-0f35-25a526e04e8c	5280	Idrija
00050000-5631-d4c6-fea2-918518598b73	1292	Ig
00050000-5631-d4c6-4496-f56f05acfe44	6250	Ilirska Bistrica
00050000-5631-d4c6-90f6-520e533120ce	6251	Ilirska Bistrica-Trnovo
00050000-5631-d4c6-a0e2-9d60ed609fad	1295	Ivančna Gorica
00050000-5631-d4c6-17f4-2d4b1ed5742e	2259	Ivanjkovci
00050000-5631-d4c6-605c-64b28f92f786	1411	Izlake
00050000-5631-d4c6-6d26-0040dc51583d	6310	Izola/Isola
00050000-5631-d4c6-2be0-7b0a3c0f0288	2222	Jakobski Dol
00050000-5631-d4c6-7f2b-c569eb62cc26	2221	Jarenina
00050000-5631-d4c6-64ab-3f2ab24ca9f4	6254	Jelšane
00050000-5631-d4c6-b48e-4ce826830403	4270	Jesenice
00050000-5631-d4c6-58c9-2c135d998883	8261	Jesenice na Dolenjskem
00050000-5631-d4c6-4844-ff65330ef5ab	3273	Jurklošter
00050000-5631-d4c6-5e13-3cc54e9d361f	2223	Jurovski Dol
00050000-5631-d4c6-3586-d9dc9b220c82	2256	Juršinci
00050000-5631-d4c6-b1ed-a08c16b63b98	5214	Kal nad Kanalom
00050000-5631-d4c6-56b3-d67de5bb9e7e	3233	Kalobje
00050000-5631-d4c6-cd60-d8e5932b5fdd	4246	Kamna Gorica
00050000-5631-d4c6-a5d4-90b545fb2043	2351	Kamnica
00050000-5631-d4c6-5637-61feb4f57923	1241	Kamnik
00050000-5631-d4c6-8749-70c261455aad	5213	Kanal
00050000-5631-d4c6-0afd-03f21e26ec4e	8258	Kapele
00050000-5631-d4c6-2324-4f0cd72ae879	2362	Kapla
00050000-5631-d4c6-9951-8854f60362eb	2325	Kidričevo
00050000-5631-d4c6-0cb0-86af5b37a9f2	1412	Kisovec
00050000-5631-d4c6-f342-f0ab8ee60bb7	6253	Knežak
00050000-5631-d4c6-e28d-c71ef90eb506	5222	Kobarid
00050000-5631-d4c6-067e-af646a857d3e	9227	Kobilje
00050000-5631-d4c6-15d6-fd75f7bf2a20	1330	Kočevje
00050000-5631-d4c6-b14d-ffb91f5b4f2c	1338	Kočevska Reka
00050000-5631-d4c6-84e5-7c690062e578	2276	Kog
00050000-5631-d4c6-8605-f7695c6efa9c	5211	Kojsko
00050000-5631-d4c6-b2c6-6303ef528d29	6223	Komen
00050000-5631-d4c6-b179-ae8fe20edba5	1218	Komenda
00050000-5631-d4c6-57aa-dd32dc8e9c2f	6000	Koper/Capodistria 
00050000-5631-d4c6-6ea8-921ec7085ffa	6001	Koper/Capodistria - poštni predali
00050000-5631-d4c6-adcc-f4c3517ec326	8282	Koprivnica
00050000-5631-d4c6-0574-ffe40b800480	5296	Kostanjevica na Krasu
00050000-5631-d4c6-4ad7-bdb8e0eadcd6	8311	Kostanjevica na Krki
00050000-5631-d4c6-ab34-adf017fbc9d5	1336	Kostel
00050000-5631-d4c6-c0d0-00f45c07d5d1	6256	Košana
00050000-5631-d4c6-d0fb-8134e1a988c0	2394	Kotlje
00050000-5631-d4c6-28a5-f4edcffeb9ac	6240	Kozina
00050000-5631-d4c6-c0fc-9c4074181b48	3260	Kozje
00050000-5631-d4c6-1729-1e611a39c9ff	4000	Kranj 
00050000-5631-d4c6-2785-bc627766e1e7	4001	Kranj - poštni predali
00050000-5631-d4c6-37a7-a5e5f1d5dd40	4280	Kranjska Gora
00050000-5631-d4c6-974e-9bb71457548d	1281	Kresnice
00050000-5631-d4c6-2a9c-56d9402899f9	4294	Križe
00050000-5631-d4c6-b4d0-2d874470f25e	9206	Križevci
00050000-5631-d4c6-50d5-73d40fe0fc68	9242	Križevci pri Ljutomeru
00050000-5631-d4c6-4fe1-1614a86fae8d	1301	Krka
00050000-5631-d4c6-df4d-190ca1d3039b	8296	Krmelj
00050000-5631-d4c6-ccff-cbe3f63eb14f	4245	Kropa
00050000-5631-d4c6-f3c6-73886a3d6417	8262	Krška vas
00050000-5631-d4c7-0afe-09ca41a65cc1	8270	Krško
00050000-5631-d4c7-ee7a-21af62209d96	9263	Kuzma
00050000-5631-d4c7-0c83-93c88ef04997	2318	Laporje
00050000-5631-d4c7-e00b-4bb8aa320f75	3270	Laško
00050000-5631-d4c7-408d-7446fcd4a232	1219	Laze v Tuhinju
00050000-5631-d4c7-ac04-4f68312721ca	2230	Lenart v Slovenskih goricah
00050000-5631-d4c7-6af9-d74b2e072669	9220	Lendava/Lendva
00050000-5631-d4c7-722b-5947552630e1	4248	Lesce
00050000-5631-d4c7-a6ab-d1deff195b53	3261	Lesično
00050000-5631-d4c7-d918-a933a6f95f77	8273	Leskovec pri Krškem
00050000-5631-d4c7-2186-12d7daefa969	2372	Libeliče
00050000-5631-d4c7-aaa1-713f3819b12c	2341	Limbuš
00050000-5631-d4c7-f9af-cceeca1f66b3	1270	Litija
00050000-5631-d4c7-5d01-c4cd0ee5527a	3202	Ljubečna
00050000-5631-d4c7-eb9b-3570e446abb6	1000	Ljubljana 
00050000-5631-d4c7-f127-4c28e15fee00	1001	Ljubljana - poštni predali
00050000-5631-d4c7-44db-71ed33128ea7	1231	Ljubljana - Črnuče
00050000-5631-d4c7-c737-ae0e2ae7ff12	1261	Ljubljana - Dobrunje
00050000-5631-d4c7-aebb-de0f8198f5f2	1260	Ljubljana - Polje
00050000-5631-d4c7-929b-201be808049f	1210	Ljubljana - Šentvid
00050000-5631-d4c7-cc0d-e8325313fe86	1211	Ljubljana - Šmartno
00050000-5631-d4c7-e208-406514967cfb	3333	Ljubno ob Savinji
00050000-5631-d4c7-78b8-0c93c813831f	9240	Ljutomer
00050000-5631-d4c7-23d2-680002ed6ad2	3215	Loče
00050000-5631-d4c7-571f-60ad83370e8b	5231	Log pod Mangartom
00050000-5631-d4c7-5c12-ba91618c1f53	1358	Log pri Brezovici
00050000-5631-d4c7-fe18-27e53a388bcf	1370	Logatec
00050000-5631-d4c7-4d49-475e9417a64d	1371	Logatec
00050000-5631-d4c7-3a7b-b4c46e42b3c3	1434	Loka pri Zidanem Mostu
00050000-5631-d4c7-6ce0-bb75ceb19813	3223	Loka pri Žusmu
00050000-5631-d4c7-2b50-8abd41031d72	6219	Lokev
00050000-5631-d4c7-cf49-ceaa5779128e	1318	Loški Potok
00050000-5631-d4c7-1c00-53ae20b517de	2324	Lovrenc na Dravskem polju
00050000-5631-d4c7-fc74-f03f6fbedb82	2344	Lovrenc na Pohorju
00050000-5631-d4c7-b9db-3c1fe53bb1b7	3334	Luče
00050000-5631-d4c7-8c3c-d37a44e6a473	1225	Lukovica
00050000-5631-d4c7-a59f-66485be67d30	9202	Mačkovci
00050000-5631-d4c7-9d74-7acdb80ed01d	2322	Majšperk
00050000-5631-d4c7-fb6b-2e4ceb6045a3	2321	Makole
00050000-5631-d4c7-608c-fbe74eedd7c4	9243	Mala Nedelja
00050000-5631-d4c7-d48d-d5882988efdb	2229	Malečnik
00050000-5631-d4c7-f942-d5b061801388	6273	Marezige
00050000-5631-d4c7-2ab8-b2fd4428adce	2000	Maribor 
00050000-5631-d4c7-f7aa-fb7178b9dc7d	2001	Maribor - poštni predali
00050000-5631-d4c7-73b7-b8367e6b81db	2206	Marjeta na Dravskem polju
00050000-5631-d4c7-4afb-225a00aac197	2281	Markovci
00050000-5631-d4c7-a35f-9898d235dd2b	9221	Martjanci
00050000-5631-d4c7-e444-1594bcf86e19	6242	Materija
00050000-5631-d4c7-f754-9beccc599737	4211	Mavčiče
00050000-5631-d4c7-5f94-759c0b80f95d	1215	Medvode
00050000-5631-d4c7-084e-d5a39cb41849	1234	Mengeš
00050000-5631-d4c7-539c-f750c75c1cbc	8330	Metlika
00050000-5631-d4c7-dbfd-3cd6db781089	2392	Mežica
00050000-5631-d4c7-c2fb-3d558721245a	2204	Miklavž na Dravskem polju
00050000-5631-d4c7-be2e-0f93fb1aa65b	2275	Miklavž pri Ormožu
00050000-5631-d4c7-2d8d-1f80cc9749f3	5291	Miren
00050000-5631-d4c7-08ec-f8261b572851	8233	Mirna
00050000-5631-d4c7-9de5-37962497bf7d	8216	Mirna Peč
00050000-5631-d4c7-4897-ecdb08a728b0	2382	Mislinja
00050000-5631-d4c7-c26f-29590cb2da3a	4281	Mojstrana
00050000-5631-d4c7-f119-85d7c5c6e488	8230	Mokronog
00050000-5631-d4c7-23cb-1081a0029c14	1251	Moravče
00050000-5631-d4c7-16b1-0ffc59821159	9226	Moravske Toplice
00050000-5631-d4c7-e35a-c763fb004888	5216	Most na Soči
00050000-5631-d4c7-74fa-828c02eac837	1221	Motnik
00050000-5631-d4c7-f63d-935b80b5dd0a	3330	Mozirje
00050000-5631-d4c7-fdec-ae14f3cc02b2	9000	Murska Sobota 
00050000-5631-d4c7-a740-05f66c4b1831	9001	Murska Sobota - poštni predali
00050000-5631-d4c7-1440-80cbf3848808	2366	Muta
00050000-5631-d4c7-ad2c-542d7ad0fa79	4202	Naklo
00050000-5631-d4c7-0e42-f2f38ad9c0b1	3331	Nazarje
00050000-5631-d4c7-ec6a-a0d12438b47f	1357	Notranje Gorice
00050000-5631-d4c7-3634-2f4b520894b9	3203	Nova Cerkev
00050000-5631-d4c7-a2de-f65c4ad5cce8	5000	Nova Gorica 
00050000-5631-d4c7-ac1b-4d30401776fd	5001	Nova Gorica - poštni predali
00050000-5631-d4c7-392b-9162a3ca4d19	1385	Nova vas
00050000-5631-d4c7-5e6f-c61fd0221881	8000	Novo mesto
00050000-5631-d4c7-2e7c-e7d8b045b4ce	8001	Novo mesto - poštni predali
00050000-5631-d4c7-f404-64ce48fe16b4	6243	Obrov
00050000-5631-d4c7-e93e-c8527a14631c	9233	Odranci
00050000-5631-d4c7-dc78-93c6ec0a3c51	2317	Oplotnica
00050000-5631-d4c7-655d-3b66c7e96886	2312	Orehova vas
00050000-5631-d4c7-8613-c50522b34878	2270	Ormož
00050000-5631-d4c7-c5f1-da6348b0ef6c	1316	Ortnek
00050000-5631-d4c7-7421-1895bfb4fd58	1337	Osilnica
00050000-5631-d4c7-a1dc-40f7b7936a52	8222	Otočec
00050000-5631-d4c7-cf81-e07d8ee5ec14	2361	Ožbalt
00050000-5631-d4c7-944d-d76b33b39f7d	2231	Pernica
00050000-5631-d4c7-479b-9de61fb33d4f	2211	Pesnica pri Mariboru
00050000-5631-d4c7-2e00-8d11c74de9e5	9203	Petrovci
00050000-5631-d4c7-c2e3-4499c0a090f0	3301	Petrovče
00050000-5631-d4c7-1a6c-d51a84f31188	6330	Piran/Pirano
00050000-5631-d4c7-f905-944335668dd6	8255	Pišece
00050000-5631-d4c7-91dc-49b68b5bfcfb	6257	Pivka
00050000-5631-d4c7-4dd9-165b595ebfb5	6232	Planina
00050000-5631-d4c7-3739-80bf49357159	3225	Planina pri Sevnici
00050000-5631-d4c7-8af2-786ddefe8469	6276	Pobegi
00050000-5631-d4c7-a1e6-02f0f74f1905	8312	Podbočje
00050000-5631-d4c7-2a9b-5fad849d8374	5243	Podbrdo
00050000-5631-d4c7-bb08-3a5e35498eaf	3254	Podčetrtek
00050000-5631-d4c7-a00f-9cb731150453	2273	Podgorci
00050000-5631-d4c7-5814-bb5024fca851	6216	Podgorje
00050000-5631-d4c7-cde5-06016679e218	2381	Podgorje pri Slovenj Gradcu
00050000-5631-d4c7-6702-b832c758cd7e	6244	Podgrad
00050000-5631-d4c7-4bd0-1e4d6098905a	1414	Podkum
00050000-5631-d4c7-921d-a94bea1a84fb	2286	Podlehnik
00050000-5631-d4c7-8e22-19df24de35de	5272	Podnanos
00050000-5631-d4c7-5684-ce69053f89cc	4244	Podnart
00050000-5631-d4c7-a093-c265820c6b42	3241	Podplat
00050000-5631-d4c7-0b55-069e6bf3fcf9	3257	Podsreda
00050000-5631-d4c7-86b3-f3fa2ce4fbc4	2363	Podvelka
00050000-5631-d4c7-8121-7e9f74a8fb73	2208	Pohorje
00050000-5631-d4c7-d869-a9f0c875b3d6	2257	Polenšak
00050000-5631-d4c7-ee18-da4efaeb42c9	1355	Polhov Gradec
00050000-5631-d4c7-27cf-d4f4ffabdc56	4223	Poljane nad Škofjo Loko
00050000-5631-d4c7-85b2-9f503a90b3dc	2319	Poljčane
00050000-5631-d4c7-bb29-5dde6de14e10	1272	Polšnik
00050000-5631-d4c7-54fb-1133eb6af581	3313	Polzela
00050000-5631-d4c7-c4e5-543b3caa6533	3232	Ponikva
00050000-5631-d4c7-1203-eb63ec4e06e6	6320	Portorož/Portorose
00050000-5631-d4c7-75ac-87a49d262a6b	6230	Postojna
00050000-5631-d4c7-42f4-5d633fa40e44	2331	Pragersko
00050000-5631-d4c7-2aba-7ade645c1d0f	3312	Prebold
00050000-5631-d4c7-73b5-0d2a337ce270	4205	Preddvor
00050000-5631-d4c7-5b38-32f2acc533ac	6255	Prem
00050000-5631-d4c7-620b-2e03f402ce44	1352	Preserje
00050000-5631-d4c7-8fc0-ce909bf91624	6258	Prestranek
00050000-5631-d4c7-e143-64a7249ffed7	2391	Prevalje
00050000-5631-d4c7-06cd-72629e655434	3262	Prevorje
00050000-5631-d4c7-e96a-ec994b0b0876	1276	Primskovo 
00050000-5631-d4c7-667e-2522b4539f2f	3253	Pristava pri Mestinju
00050000-5631-d4c7-95a1-7fde0cd5e769	9207	Prosenjakovci/Partosfalva
00050000-5631-d4c7-34ce-e4b959a08347	5297	Prvačina
00050000-5631-d4c7-52e3-d332ca39169d	2250	Ptuj
00050000-5631-d4c7-cd45-a40a1524a1bf	2323	Ptujska Gora
00050000-5631-d4c7-642e-71aa01843eca	9201	Puconci
00050000-5631-d4c7-aa9e-811fdfb9c2a7	2327	Rače
00050000-5631-d4c7-b89f-8f9f5319c778	1433	Radeče
00050000-5631-d4c7-5d38-8202d78ab30a	9252	Radenci
00050000-5631-d4c7-391d-8ca10aee4765	2360	Radlje ob Dravi
00050000-5631-d4c7-5a77-8e6d47f0ca71	1235	Radomlje
00050000-5631-d4c7-3f43-6fbc3be9eaf6	4240	Radovljica
00050000-5631-d4c7-0cac-413b44b76dd4	8274	Raka
00050000-5631-d4c7-2550-8be3bd833afb	1381	Rakek
00050000-5631-d4c7-43e8-9d38a18a4272	4283	Rateče - Planica
00050000-5631-d4c7-0d58-89bb8decfd7a	2390	Ravne na Koroškem
00050000-5631-d4c7-7660-95b7969e6e9c	9246	Razkrižje
00050000-5631-d4c7-f0a5-89e737220e75	3332	Rečica ob Savinji
00050000-5631-d4c7-b87c-a8bc97aad58d	5292	Renče
00050000-5631-d4c7-d914-72b54679c1d9	1310	Ribnica
00050000-5631-d4c7-3b7e-fe7fc1c4361a	2364	Ribnica na Pohorju
00050000-5631-d4c7-8705-0c73a5b962b7	3272	Rimske Toplice
00050000-5631-d4c7-452b-08b993d820e0	1314	Rob
00050000-5631-d4c7-a325-9b2fafe0bb26	5215	Ročinj
00050000-5631-d4c7-2bdb-1ae3f9b5b14e	3250	Rogaška Slatina
00050000-5631-d4c7-2eab-15d108103209	9262	Rogašovci
00050000-5631-d4c7-038c-ddd52f7aaa8a	3252	Rogatec
00050000-5631-d4c7-2b49-56653a8fe607	1373	Rovte
00050000-5631-d4c7-f567-e8a70aa83762	2342	Ruše
00050000-5631-d4c7-3c50-f6741e5b683e	1282	Sava
00050000-5631-d4c7-579b-01fdf02edda1	6333	Sečovlje/Sicciole
00050000-5631-d4c7-0a54-93a9e8d62c88	4227	Selca
00050000-5631-d4c7-441a-2884f907e40a	2352	Selnica ob Dravi
00050000-5631-d4c7-569a-a1ca8dc70a39	8333	Semič
00050000-5631-d4c7-f65b-e1b7daaf540d	8281	Senovo
00050000-5631-d4c7-bfe0-233ea9050b44	6224	Senožeče
00050000-5631-d4c7-43cd-e6efde4fa1d0	8290	Sevnica
00050000-5631-d4c7-bf24-38ec7bfc5f9e	6210	Sežana
00050000-5631-d4c7-15f3-a94660d05636	2214	Sladki Vrh
00050000-5631-d4c7-e208-24a146c6a1f4	5283	Slap ob Idrijci
00050000-5631-d4c7-dc9b-641610755e81	2380	Slovenj Gradec
00050000-5631-d4c7-1a0e-2a17baacfeac	2310	Slovenska Bistrica
00050000-5631-d4c7-d128-4bd27db068e2	3210	Slovenske Konjice
00050000-5631-d4c7-7953-6d86df14d3f1	1216	Smlednik
00050000-5631-d4c7-2076-e02e85308e60	5232	Soča
00050000-5631-d4c7-b54b-416a38ba0564	1317	Sodražica
00050000-5631-d4c7-c55c-9e07a1e45257	3335	Solčava
00050000-5631-d4c7-a519-9f7169c4da98	5250	Solkan
00050000-5631-d4c7-8629-8bec9ae1912e	4229	Sorica
00050000-5631-d4c7-c2fb-e53b30867dea	4225	Sovodenj
00050000-5631-d4c7-9807-353b914ed10e	5281	Spodnja Idrija
00050000-5631-d4c7-f556-d9c4eb6487a2	2241	Spodnji Duplek
00050000-5631-d4c7-5248-cace0bfa40d4	9245	Spodnji Ivanjci
00050000-5631-d4c7-9486-33e06b264c06	2277	Središče ob Dravi
00050000-5631-d4c7-056c-0d740eefeff0	4267	Srednja vas v Bohinju
00050000-5631-d4c7-2b9d-4592ea323af0	8256	Sromlje 
00050000-5631-d4c7-6617-193c99952f14	5224	Srpenica
00050000-5631-d4c7-4704-a4c0a59a2fda	1242	Stahovica
00050000-5631-d4c7-f07d-88d8945c6188	1332	Stara Cerkev
00050000-5631-d4c7-3e19-bb4ac5fbc188	8342	Stari trg ob Kolpi
00050000-5631-d4c7-9961-04f5fdc707d2	1386	Stari trg pri Ložu
00050000-5631-d4c7-c29a-a4de65d59e39	2205	Starše
00050000-5631-d4c7-f8c2-2a671fb47ef9	2289	Stoperce
00050000-5631-d4c7-458a-ea112cb4f930	8322	Stopiče
00050000-5631-d4c7-a97e-bc7bd3ed4cab	3206	Stranice
00050000-5631-d4c7-9e6c-54f6735521fa	8351	Straža
00050000-5631-d4c7-1199-b347e0ab8004	1313	Struge
00050000-5631-d4c7-1057-b18becb1f383	8293	Studenec
00050000-5631-d4c7-f183-4153ae553164	8331	Suhor
00050000-5631-d4c7-6229-1b2e090f6b31	2233	Sv. Ana v Slovenskih goricah
00050000-5631-d4c7-71de-29354d94db19	2235	Sv. Trojica v Slovenskih goricah
00050000-5631-d4c7-baad-657189a9ab2a	2353	Sveti Duh na Ostrem Vrhu
00050000-5631-d4c7-111e-74ae8308e77d	9244	Sveti Jurij ob Ščavnici
00050000-5631-d4c7-2c74-4eabd6354ae4	3264	Sveti Štefan
00050000-5631-d4c7-8ef8-483694324609	2258	Sveti Tomaž
00050000-5631-d4c7-f057-803584456b46	9204	Šalovci
00050000-5631-d4c7-a793-ff328815e557	5261	Šempas
00050000-5631-d4c7-f6b0-fc8e63af93a0	5290	Šempeter pri Gorici
00050000-5631-d4c7-8392-ff10ccdd8be0	3311	Šempeter v Savinjski dolini
00050000-5631-d4c7-dfdf-9185f228ea2f	4208	Šenčur
00050000-5631-d4c7-7be1-b7cbae473576	2212	Šentilj v Slovenskih goricah
00050000-5631-d4c7-7e3c-73617b34192b	8297	Šentjanž
00050000-5631-d4c7-2431-734334b9d0f5	2373	Šentjanž pri Dravogradu
00050000-5631-d4c7-cfdc-74a3acfdf91c	8310	Šentjernej
00050000-5631-d4c7-0fef-98f77fde6208	3230	Šentjur
00050000-5631-d4c7-2cef-d74281c1535f	3271	Šentrupert
00050000-5631-d4c7-cae5-6f8d5cf9eef0	8232	Šentrupert
00050000-5631-d4c7-ea0a-ef759ad4bc97	1296	Šentvid pri Stični
00050000-5631-d4c7-53b8-1a03c9d1f522	8275	Škocjan
00050000-5631-d4c7-c0d3-73faf5285363	6281	Škofije
00050000-5631-d4c7-c053-84eaf86a4fc1	4220	Škofja Loka
00050000-5631-d4c7-922e-2a5148547132	3211	Škofja vas
00050000-5631-d4c7-1355-a484e4040418	1291	Škofljica
00050000-5631-d4c7-42d1-5f6d3a5c92b4	6274	Šmarje
00050000-5631-d4c7-5d0b-656b63e9d1f4	1293	Šmarje - Sap
00050000-5631-d4c7-8e6e-7dbb47515dce	3240	Šmarje pri Jelšah
00050000-5631-d4c7-f64a-d42047c38d13	8220	Šmarješke Toplice
00050000-5631-d4c7-51d1-8fbe8e0db2d6	2315	Šmartno na Pohorju
00050000-5631-d4c7-15db-364f2d502d0e	3341	Šmartno ob Dreti
00050000-5631-d4c7-893a-08efcc71b770	3327	Šmartno ob Paki
00050000-5631-d4c7-a4d6-33c5b5ebfd93	1275	Šmartno pri Litiji
00050000-5631-d4c7-b0e4-b40722c98a05	2383	Šmartno pri Slovenj Gradcu
00050000-5631-d4c7-ea75-9bcc7d8a4ff5	3201	Šmartno v Rožni dolini
00050000-5631-d4c7-e0b7-f1d32e45e188	3325	Šoštanj
00050000-5631-d4c7-3279-3b7a20319c0c	6222	Štanjel
00050000-5631-d4c7-6be2-4d2d0135ac8b	3220	Štore
00050000-5631-d4c7-afe8-922e86616614	3304	Tabor
00050000-5631-d4c7-d471-f73a658252e9	3221	Teharje
00050000-5631-d4c7-6faa-9f2a072e3327	9251	Tišina
00050000-5631-d4c7-f75b-46e50dcdc4c7	5220	Tolmin
00050000-5631-d4c7-9a66-65f66746f4e1	3326	Topolšica
00050000-5631-d4c7-46f1-6b2a1d023e0e	2371	Trbonje
00050000-5631-d4c7-2c33-c208aded9149	1420	Trbovlje
00050000-5631-d4c7-c8d8-bc3219267126	8231	Trebelno 
00050000-5631-d4c7-0dee-9441e1d50652	8210	Trebnje
00050000-5631-d4c7-4365-d32b90ebf424	5252	Trnovo pri Gorici
00050000-5631-d4c7-a662-322e83539679	2254	Trnovska vas
00050000-5631-d4c7-b9dd-ff541fcecdb4	1222	Trojane
00050000-5631-d4c7-860a-592709f23650	1236	Trzin
00050000-5631-d4c7-9d22-cca4cf55b60d	4290	Tržič
00050000-5631-d4c7-3ba4-161c44e97e17	8295	Tržišče
00050000-5631-d4c7-48f7-b1857b9336b2	1311	Turjak
00050000-5631-d4c7-fd54-1eedea9305be	9224	Turnišče
00050000-5631-d4c7-835a-22fb3574bbd6	8323	Uršna sela
00050000-5631-d4c7-bf9a-7aff37404336	1252	Vače
00050000-5631-d4c7-fc84-bf6a343f5ffc	3320	Velenje 
00050000-5631-d4c7-8c34-9df53bf8b312	3322	Velenje - poštni predali
00050000-5631-d4c7-ee6d-47e3e85cd800	8212	Velika Loka
00050000-5631-d4c7-5bb9-5c773628e4a1	2274	Velika Nedelja
00050000-5631-d4c7-10d5-c09502743965	9225	Velika Polana
00050000-5631-d4c7-bc9e-fa16c6e8874d	1315	Velike Lašče
00050000-5631-d4c7-6a18-4bafbe03ae85	8213	Veliki Gaber
00050000-5631-d4c7-199c-9c8ab2d6a57d	9241	Veržej
00050000-5631-d4c7-323c-cf4bf7937d40	1312	Videm - Dobrepolje
00050000-5631-d4c7-adad-39a342302442	2284	Videm pri Ptuju
00050000-5631-d4c7-96c4-d734633977dc	8344	Vinica
00050000-5631-d4c7-58b3-c904559111b2	5271	Vipava
00050000-5631-d4c7-d1ad-eec2fbfb030a	4212	Visoko
00050000-5631-d4c7-6624-a4c0d63f458a	1294	Višnja Gora
00050000-5631-d4c7-059c-92f09d927e8b	3205	Vitanje
00050000-5631-d4c7-63ad-3d3d24e9f3cd	2255	Vitomarci
00050000-5631-d4c7-671f-cbbdf456a702	1217	Vodice
00050000-5631-d4c7-3c03-78eb2d1a39e6	3212	Vojnik\t
00050000-5631-d4c7-a3f3-242ea6f562dd	5293	Volčja Draga
00050000-5631-d4c7-53a4-96f521110262	2232	Voličina
00050000-5631-d4c7-d6c7-5b5302bcf22f	3305	Vransko
00050000-5631-d4c7-71a3-e9c9d2b799cb	6217	Vremski Britof
00050000-5631-d4c7-1958-7972b9a99b2e	1360	Vrhnika
00050000-5631-d4c7-c94f-8317edd66d88	2365	Vuhred
00050000-5631-d4c7-04dd-5b74a3258b74	2367	Vuzenica
00050000-5631-d4c7-0185-e74a1ba8be4e	8292	Zabukovje 
00050000-5631-d4c7-b2e1-ab4a67a6c5ad	1410	Zagorje ob Savi
00050000-5631-d4c7-73de-6050e8267cd3	1303	Zagradec
00050000-5631-d4c7-569f-cb95f545b0ed	2283	Zavrč
00050000-5631-d4c7-52ca-80ca015eb989	8272	Zdole 
00050000-5631-d4c7-622b-94afc6f5f73c	4201	Zgornja Besnica
00050000-5631-d4c7-68bd-ace6b76d97c9	2242	Zgornja Korena
00050000-5631-d4c7-eff7-2f3f79cf3357	2201	Zgornja Kungota
00050000-5631-d4c7-5f48-132c97710826	2316	Zgornja Ložnica
00050000-5631-d4c7-37d1-d18f0e545166	2314	Zgornja Polskava
00050000-5631-d4c7-6510-de842f85e202	2213	Zgornja Velka
00050000-5631-d4c7-f8ed-66ab65b88350	4247	Zgornje Gorje
00050000-5631-d4c7-7ae4-300c4147a4eb	4206	Zgornje Jezersko
00050000-5631-d4c7-7483-1538523ed7cf	2285	Zgornji Leskovec
00050000-5631-d4c7-0f76-ab1805972583	1432	Zidani Most
00050000-5631-d4c7-36c7-09bd631346a5	3214	Zreče
00050000-5631-d4c7-08fe-3988e833bcfa	4209	Žabnica
00050000-5631-d4c7-a03d-f73ed0c503e1	3310	Žalec
00050000-5631-d4c7-8d3e-722080ff2c79	4228	Železniki
00050000-5631-d4c7-05eb-025a263bb2e3	2287	Žetale
00050000-5631-d4c7-d1db-a9bb93aa026a	4226	Žiri
00050000-5631-d4c7-58a9-08d0352075bf	4274	Žirovnica
00050000-5631-d4c7-d9bc-659f42b69321	8360	Žužemberk
\.


--
-- TOC entry 3121 (class 0 OID 23955228)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 23954820)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23954574)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5631-d4ca-cc33-9e8afd6ae4f2	00080000-5631-d4ca-22ad-9241408ece79	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5631-d4ca-d03d-35c71c662c48	00080000-5631-d4ca-22ad-9241408ece79	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5631-d4ca-b8a8-fe6b902403b8	00080000-5631-d4ca-cbcd-c771cefed060	\N	00040000-5631-d4c7-4ef5-34b93d9b073c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3084 (class 0 OID 23954718)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5631-d4c7-5348-8081be41a9cf	novo leto	1	1	\N	t
00430000-5631-d4c7-8403-686159e29921	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5631-d4c7-ef32-43b66ead74e1	dan upora proti okupatorju	27	4	\N	t
00430000-5631-d4c7-2362-f62fda2dd171	praznik dela	1	5	\N	t
00430000-5631-d4c7-7d38-234b227eaa65	praznik dela	2	5	\N	t
00430000-5631-d4c7-76d8-b5ed6326afc2	dan Primoža Trubarja	8	6	\N	f
00430000-5631-d4c7-ab64-614fc5bb5449	dan državnosti	25	6	\N	t
00430000-5631-d4c7-ca48-de93a257773d	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5631-d4c7-549e-ae6f5f522716	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5631-d4c7-df2f-e1b0b049f7a5	dan suverenosti	25	10	\N	f
00430000-5631-d4c7-6eff-45cbe4fa555e	dan spomina na mrtve	1	11	\N	t
00430000-5631-d4c7-154b-56385beb73bd	dan Rudolfa Maistra	23	11	\N	f
00430000-5631-d4c7-793e-9506c1836ef1	božič	25	12	\N	t
00430000-5631-d4c7-cca7-7dc5025386c5	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5631-d4c7-3dab-9c39fa71f431	Marijino vnebovzetje	15	8	\N	t
00430000-5631-d4c7-c5a2-0fc557641ec9	dan reformacije	31	10	\N	t
00430000-5631-d4c7-94c6-8ca6634123cc	velikonočna nedelja	27	3	2016	t
00430000-5631-d4c7-5a9e-d7d6aaa1ccd0	velikonočna nedelja	16	4	2017	t
00430000-5631-d4c7-42ec-487aad2678c7	velikonočna nedelja	1	4	2018	t
00430000-5631-d4c7-1663-c9ea8439bf9e	velikonočna nedelja	21	4	2019	t
00430000-5631-d4c7-904e-847ee2325694	velikonočna nedelja	12	4	2020	t
00430000-5631-d4c7-6a04-00a61f86e09d	velikonočna nedelja	4	4	2021	t
00430000-5631-d4c7-f88e-c07540a8b513	velikonočna nedelja	17	4	2022	t
00430000-5631-d4c7-0992-c6e9e88e4d4d	velikonočna nedelja	9	4	2023	t
00430000-5631-d4c7-ef34-53f549f1d35b	velikonočna nedelja	31	3	2024	t
00430000-5631-d4c7-39f2-ffedc21430b8	velikonočna nedelja	20	4	2025	t
00430000-5631-d4c7-5393-6f37e3482516	velikonočna nedelja	5	4	2026	t
00430000-5631-d4c7-49d2-a2ea49fd883a	velikonočna nedelja	28	3	2027	t
00430000-5631-d4c7-13dc-758351dbfa70	velikonočna nedelja	16	4	2028	t
00430000-5631-d4c7-0669-6801fe99f19b	velikonočna nedelja	1	4	2029	t
00430000-5631-d4c7-f236-5bfa9c09657d	velikonočna nedelja	21	4	2030	t
00430000-5631-d4c7-0dc6-5dc010586e80	velikonočni ponedeljek	28	3	2016	t
00430000-5631-d4c7-00dd-ffe0d50030bf	velikonočni ponedeljek	17	4	2017	t
00430000-5631-d4c7-8074-885ec2ddf218	velikonočni ponedeljek	2	4	2018	t
00430000-5631-d4c7-bfb3-aeed168f0a4b	velikonočni ponedeljek	22	4	2019	t
00430000-5631-d4c7-5b97-866f9d36827a	velikonočni ponedeljek	13	4	2020	t
00430000-5631-d4c7-1d65-c1444e07ff35	velikonočni ponedeljek	5	4	2021	t
00430000-5631-d4c7-0ec6-3c138875013b	velikonočni ponedeljek	18	4	2022	t
00430000-5631-d4c7-ebdc-7ce3770244ab	velikonočni ponedeljek	10	4	2023	t
00430000-5631-d4c7-6033-a67cc9d17586	velikonočni ponedeljek	1	4	2024	t
00430000-5631-d4c7-66fc-7eaa96a5c565	velikonočni ponedeljek	21	4	2025	t
00430000-5631-d4c7-48e8-1c9bfc828a7d	velikonočni ponedeljek	6	4	2026	t
00430000-5631-d4c7-9dd7-f7173fd83db8	velikonočni ponedeljek	29	3	2027	t
00430000-5631-d4c7-003a-f1a1ed2b8b93	velikonočni ponedeljek	17	4	2028	t
00430000-5631-d4c7-b807-e1a3c5f24240	velikonočni ponedeljek	2	4	2029	t
00430000-5631-d4c7-8256-ba4452479307	velikonočni ponedeljek	22	4	2030	t
00430000-5631-d4c7-a662-89e3ac6eb3b3	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5631-d4c7-ff28-442326b1f5be	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5631-d4c7-2929-0feae0619d06	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5631-d4c7-3362-66feb76ed94f	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5631-d4c7-066c-8e433d3b25c6	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5631-d4c7-aff4-313d314a905a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5631-d4c7-fee8-69d46267b966	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5631-d4c7-93e7-d553afbd0f5f	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5631-d4c7-9cae-216ab18230fb	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5631-d4c7-c27e-9f6cb8dbfe4b	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5631-d4c7-4ebe-65e95f6dcf0f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5631-d4c7-de79-054b3f12753e	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5631-d4c7-c364-df11f2d0dd09	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5631-d4c7-5fd1-d9425a11406f	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5631-d4c7-f971-302c97dca927	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3080 (class 0 OID 23954678)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 23954690)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23954832)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23955242)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23955252)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5631-d4ca-6d18-c2ed7cb8839c	00080000-5631-d4ca-3b86-d4ba73075238	0987	AK
00190000-5631-d4ca-fe31-dccbcf292742	00080000-5631-d4ca-cbcd-c771cefed060	0989	AK
00190000-5631-d4ca-c548-3b38327d7821	00080000-5631-d4ca-690f-72c37f29f6c5	0986	AK
00190000-5631-d4ca-a8e3-da292ba064d7	00080000-5631-d4ca-0c85-aa4b77f3ef0c	0984	AK
00190000-5631-d4ca-a7ab-b46ab3faa6d0	00080000-5631-d4ca-a040-2e06bc8a71af	0983	AK
00190000-5631-d4ca-05fc-c9da7f08d43b	00080000-5631-d4ca-6d3b-23aba7b0779a	0982	AK
00190000-5631-d4cc-3b8d-d216c4dfb615	00080000-5631-d4cc-8978-de875655f4d2	1001	AK
\.


--
-- TOC entry 3120 (class 0 OID 23955167)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5631-d4ca-61f7-283bfc51e32a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3124 (class 0 OID 23955260)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23954861)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5631-d4c9-e85f-a84c70346c45	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5631-d4c9-eae2-bad06f02db8b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5631-d4c9-1b7e-b0202954680f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5631-d4c9-b402-a92f0d631a75	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5631-d4c9-7bad-ba4010e7189b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5631-d4c9-2db0-3adb5df7f302	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5631-d4c9-f338-54d8c98d3543	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3092 (class 0 OID 23954805)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 23954795)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 23955006)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23954936)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23954652)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 23954423)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5631-d4cc-8978-de875655f4d2	00010000-5631-d4c8-42c1-f3932ba9e0a5	2015-10-29 09:11:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-5631-d4cc-82b4-3a5a4bf275f5	00010000-5631-d4c8-42c1-f3932ba9e0a5	2015-10-29 09:11:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5631-d4cc-3b8d-d216c4dfb615	00010000-5631-d4c8-42c1-f3932ba9e0a5	2015-10-29 09:11:56	INS	a:0:{}
\.


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3101 (class 0 OID 23954874)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 23954461)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5631-d4c7-5eba-d6c7c943c73c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5631-d4c7-60be-6b21990773aa	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5631-d4c7-0bb4-822e1c3f6419	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5631-d4c7-06eb-c1761ba0478b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5631-d4c8-54f1-715e364ed014	planer	Planer dogodkov v koledarju	t
00020000-5631-d4c8-08c0-b3629dfa5093	kadrovska	Kadrovska služba	t
00020000-5631-d4c8-b5c8-4a38dd183e38	arhivar	Ažuriranje arhivalij	t
00020000-5631-d4c8-2b61-37a97498292b	igralec	Igralec	t
00020000-5631-d4c8-0ca3-a56ea3ddc64d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5631-d4c9-8856-a872b9ee2c1e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3061 (class 0 OID 23954445)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5631-d4c8-3dff-ae5ced008880	00020000-5631-d4c7-0bb4-822e1c3f6419
00010000-5631-d4c8-42c1-f3932ba9e0a5	00020000-5631-d4c7-0bb4-822e1c3f6419
00010000-5631-d4ca-dd15-cfef180f2e27	00020000-5631-d4c9-8856-a872b9ee2c1e
\.


--
-- TOC entry 3103 (class 0 OID 23954888)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23954826)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23954772)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5631-d4c9-173d-d5bc96ae8f1e	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5631-d4c9-137a-b5f009ee4a1c	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5631-d4c9-3853-47f06f2b8f94	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3057 (class 0 OID 23954410)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5631-d4c7-0a0e-1172d5a97692	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5631-d4c7-5e60-b5daa302e856	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5631-d4c7-9cde-9293ef710dcc	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5631-d4c7-a871-5b233da566ce	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5631-d4c7-b2bb-5084bccb371d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3056 (class 0 OID 23954402)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5631-d4c7-aa25-a7dc25f9e32d	00230000-5631-d4c7-a871-5b233da566ce	popa
00240000-5631-d4c7-404c-db05ebe9e806	00230000-5631-d4c7-a871-5b233da566ce	oseba
00240000-5631-d4c7-1de1-563381c19bc8	00230000-5631-d4c7-a871-5b233da566ce	tippopa
00240000-5631-d4c7-188d-404e2de685c2	00230000-5631-d4c7-a871-5b233da566ce	organizacijskaenota
00240000-5631-d4c7-d688-05febb72b056	00230000-5631-d4c7-a871-5b233da566ce	sezona
00240000-5631-d4c7-d826-de2327aa6648	00230000-5631-d4c7-a871-5b233da566ce	tipvaje
00240000-5631-d4c7-a0a9-ecfc6251f7f0	00230000-5631-d4c7-5e60-b5daa302e856	prostor
00240000-5631-d4c7-24b7-d0f5cdf58bbb	00230000-5631-d4c7-a871-5b233da566ce	besedilo
00240000-5631-d4c7-c3e5-3d9855c995a6	00230000-5631-d4c7-a871-5b233da566ce	uprizoritev
00240000-5631-d4c7-f3cf-6e4a78951b5d	00230000-5631-d4c7-a871-5b233da566ce	funkcija
00240000-5631-d4c7-6a77-bae9a214c5f4	00230000-5631-d4c7-a871-5b233da566ce	tipfunkcije
00240000-5631-d4c7-0cfd-a1e989b17ec0	00230000-5631-d4c7-a871-5b233da566ce	alternacija
00240000-5631-d4c7-8259-ed9318b63eb3	00230000-5631-d4c7-0a0e-1172d5a97692	pogodba
00240000-5631-d4c7-6962-5e2d4905f2ab	00230000-5631-d4c7-a871-5b233da566ce	zaposlitev
00240000-5631-d4c7-2316-8846d7f96e9e	00230000-5631-d4c7-a871-5b233da566ce	zvrstuprizoritve
00240000-5631-d4c7-ceee-b653fdfd71de	00230000-5631-d4c7-0a0e-1172d5a97692	programdela
00240000-5631-d4c7-0e6f-7c6181ad5fc7	00230000-5631-d4c7-a871-5b233da566ce	zapis
\.


--
-- TOC entry 3055 (class 0 OID 23954397)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6783505f-ad19-4963-80b7-e54c54a156bb	00240000-5631-d4c7-aa25-a7dc25f9e32d	0	1001
\.


--
-- TOC entry 3109 (class 0 OID 23954953)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5631-d4ca-7f34-8b0bf87be54b	000e0000-5631-d4ca-d800-c2032a768bc4	00080000-5631-d4ca-22ad-9241408ece79	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5631-d4c7-5c63-ffbab9b1c671
00270000-5631-d4ca-1ab8-a41e7b400e9c	000e0000-5631-d4ca-d800-c2032a768bc4	00080000-5631-d4ca-22ad-9241408ece79	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5631-d4c7-5c63-ffbab9b1c671
\.


--
-- TOC entry 3069 (class 0 OID 23954536)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23954782)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5631-d4ca-ae26-e24dca94b9e9	00180000-5631-d4ca-a7b8-958f02dfbc74	000c0000-5631-d4ca-4f3a-c47e43f50494	00090000-5631-d4ca-d80e-7e4928030d6e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5631-d4ca-5c2b-d6427abc88b1	00180000-5631-d4ca-a7b8-958f02dfbc74	000c0000-5631-d4ca-5b85-2e8e3fb0aaa1	00090000-5631-d4ca-9694-3fcb13ce1afc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5631-d4ca-bb76-72bb35797c75	00180000-5631-d4ca-a7b8-958f02dfbc74	000c0000-5631-d4ca-58ba-a7a0b27cedf8	00090000-5631-d4ca-45e6-611813fd3605	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5631-d4ca-75de-2414f1ad49ee	00180000-5631-d4ca-a7b8-958f02dfbc74	000c0000-5631-d4ca-18c1-ad0213dfee3a	00090000-5631-d4ca-2ed9-faaa9506a27d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5631-d4ca-c366-49233d3e63be	00180000-5631-d4ca-a7b8-958f02dfbc74	000c0000-5631-d4ca-1b20-aa85902838a5	00090000-5631-d4ca-7f94-880dc1878a55	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5631-d4ca-c8eb-3142165d72aa	00180000-5631-d4ca-4651-d59d64910ec2	\N	00090000-5631-d4ca-7f94-880dc1878a55	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5631-d4ca-df43-b121bc92cd74	00180000-5631-d4ca-4651-d59d64910ec2	\N	00090000-5631-d4ca-9694-3fcb13ce1afc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3112 (class 0 OID 23954994)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5631-d4c7-c8ff-dd365b2271df	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5631-d4c7-dd83-e366e1468af8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5631-d4c7-c65f-989d562ee54e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5631-d4c7-8916-daaefcde5d47	04	Režija	Režija	Režija	umetnik	30
000f0000-5631-d4c7-e8d9-170cb2b9ce1e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5631-d4c7-fe25-3e8006709b07	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5631-d4c7-5f21-7400a7fad43d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5631-d4c7-049e-a7a1a46bc862	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5631-d4c7-c484-3f403ec2f4f5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5631-d4c7-ed48-d0cfde6e014b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5631-d4c7-fffa-72174588c69d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5631-d4c7-f7c1-fa02e85fff7d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5631-d4c7-5ac4-b77a0b627f8e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5631-d4c7-d28f-3dd24cc416fa	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5631-d4c7-03ab-c5baa6781ef6	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5631-d4c7-bbe0-67ded9d4225a	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5631-d4c7-cd4c-a3bd1f251a56	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5631-d4c7-9802-a1c086978fed	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3066 (class 0 OID 23954487)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5631-d4c9-1fb9-a282464b54db	0001	šola	osnovna ali srednja šola
00400000-5631-d4c9-15f3-db8e59210a45	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5631-d4c9-0203-3d07197dc8af	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3125 (class 0 OID 23955271)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5631-d4c7-0854-f44687f54b0a	01	Velika predstava	f	1.00	1.00
002b0000-5631-d4c7-c193-5f6e9919cd27	02	Mala predstava	f	0.50	0.50
002b0000-5631-d4c7-34bf-dcb902a03502	03	Mala koprodukcija	t	0.40	1.00
002b0000-5631-d4c7-5d33-20bcad53255c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5631-d4c7-6080-16108700487f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3088 (class 0 OID 23954762)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5631-d4c7-a558-ec58a213073c	0001	prva vaja	prva vaja
00420000-5631-d4c7-e5c9-f4d2c1bd5d5f	0002	tehnična vaja	tehnična vaja
00420000-5631-d4c7-6f21-bd417b5b6de2	0003	lučna vaja	lučna vaja
00420000-5631-d4c7-e2b2-079436e5b21f	0004	kostumska vaja	kostumska vaja
00420000-5631-d4c7-e724-c52995db2b54	0005	foto vaja	foto vaja
00420000-5631-d4c7-c589-e364a0b4630c	0006	1. glavna vaja	1. glavna vaja
00420000-5631-d4c7-4467-830e8243884b	0007	2. glavna vaja	2. glavna vaja
00420000-5631-d4c7-8cfd-f43b2f2247fc	0008	1. generalka	1. generalka
00420000-5631-d4c7-4759-91c82f28fa02	0009	2. generalka	2. generalka
00420000-5631-d4c7-5eb6-4eb596bef898	0010	odprta generalka	odprta generalka
00420000-5631-d4c7-0687-bd0131617d29	0011	obnovitvena vaja	obnovitvena vaja
00420000-5631-d4c7-3cbe-e1a9944f54c2	0012	pevska vaja	pevska vaja
00420000-5631-d4c7-8c62-77d29ce36f95	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5631-d4c7-2599-532d8121b955	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3075 (class 0 OID 23954609)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 23954432)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5631-d4c8-42c1-f3932ba9e0a5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROTVx9ZI/atbnCIaEMbaSdq3QP/QtU/fC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5631-d4c9-b05d-13e9f57b01e7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5631-d4c9-8ed1-e04adb3b0860	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-064e-7072b9b263b9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-3c78-243b206831ce	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-233a-9cbf4dae32c3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-101f-2b2e10ab47ce	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-365e-004421d94afe	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-2b90-fc114cffc99c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-6ba5-f26993821b4e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5631-d4ca-dd15-cfef180f2e27	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5631-d4c8-3dff-ae5ced008880	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3116 (class 0 OID 23955044)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5631-d4ca-9df3-6640c69f03fb	00160000-5631-d4c9-22e7-e66da999b2f8	\N	00140000-5631-d4c7-2e3a-6677b63c620f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5631-d4c9-7bad-ba4010e7189b
000e0000-5631-d4ca-d800-c2032a768bc4	00160000-5631-d4c9-3867-aa059fa93a3a	\N	00140000-5631-d4c7-8554-79bf6e97307a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5631-d4c9-2db0-3adb5df7f302
000e0000-5631-d4ca-7ad1-7bdcb0d7c7b5	\N	\N	00140000-5631-d4c7-8554-79bf6e97307a	00190000-5631-d4ca-6d18-c2ed7cb8839c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5631-d4c9-7bad-ba4010e7189b
000e0000-5631-d4ca-1ba8-426754627294	\N	\N	00140000-5631-d4c7-8554-79bf6e97307a	00190000-5631-d4ca-6d18-c2ed7cb8839c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5631-d4c9-7bad-ba4010e7189b
000e0000-5631-d4ca-98f7-15b800f2866d	\N	\N	00140000-5631-d4c7-8554-79bf6e97307a	00190000-5631-d4ca-6d18-c2ed7cb8839c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5631-d4c9-e85f-a84c70346c45
000e0000-5631-d4ca-026d-7d36556078ba	\N	\N	00140000-5631-d4c7-8554-79bf6e97307a	00190000-5631-d4ca-6d18-c2ed7cb8839c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5631-d4c9-e85f-a84c70346c45
\.


--
-- TOC entry 3083 (class 0 OID 23954708)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5631-d4ca-6ef2-4d09371c5eed	\N	000e0000-5631-d4ca-d800-c2032a768bc4	1	
00200000-5631-d4ca-97b5-38f221b5298e	\N	000e0000-5631-d4ca-d800-c2032a768bc4	2	
00200000-5631-d4ca-9e66-6cc6364873c8	\N	000e0000-5631-d4ca-d800-c2032a768bc4	3	
00200000-5631-d4ca-4d30-0b41f50479ee	\N	000e0000-5631-d4ca-d800-c2032a768bc4	4	
00200000-5631-d4ca-2370-e0a032036592	\N	000e0000-5631-d4ca-d800-c2032a768bc4	5	
\.


--
-- TOC entry 3099 (class 0 OID 23954853)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 23954967)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5631-d4c7-3aa3-6957f9ebc812	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5631-d4c7-e34c-e8087b483f1c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5631-d4c7-05b2-1a66b6ac85ad	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5631-d4c7-c644-1abc07cee46f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5631-d4c7-6e44-2a688e512322	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5631-d4c7-9fb4-c0c04db759af	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5631-d4c7-d72f-f4c42544e01b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5631-d4c7-fdac-7f5b4a75f5cd	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5631-d4c7-5c63-ffbab9b1c671	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5631-d4c7-223f-ccf9f1355d6a	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5631-d4c7-3116-75bb4fcf26e1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5631-d4c7-d577-112dc690cb49	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5631-d4c7-8efe-4e243e454715	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5631-d4c7-ebe2-84388278ea1c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5631-d4c7-44ee-90c281324b17	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5631-d4c7-714c-459be71b5330	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5631-d4c7-dc20-14a976139674	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5631-d4c7-4981-75fb014e37b8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5631-d4c7-2aee-58fa716fe79b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5631-d4c7-3a73-6b811dd06956	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5631-d4c7-be3c-1d42849095c0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5631-d4c7-2607-b126fa2132c0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5631-d4c7-ccfd-b94333bf4d87	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5631-d4c7-414f-fd7076a649ec	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5631-d4c7-24c8-8aaf849bb042	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5631-d4c7-18f8-17c6da0c0418	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5631-d4c7-8e9b-bdd12b0ec93f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5631-d4c7-f026-da6e81ebe6f6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3128 (class 0 OID 23955318)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 23955290)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 23955330)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23954925)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5631-d4ca-ed62-c8d3a90725b6	00090000-5631-d4ca-9694-3fcb13ce1afc	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5631-d4ca-f6fd-32c6e92e49ec	00090000-5631-d4ca-45e6-611813fd3605	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5631-d4ca-bdf3-73c81162c975	00090000-5631-d4ca-18e3-71c06d15f0f6	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5631-d4ca-bd21-0ab42832ac77	00090000-5631-d4ca-258b-7ee79f4ac0d4	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5631-d4ca-1764-07cf00b61519	00090000-5631-d4ca-ddab-1158e76bad27	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5631-d4ca-40c5-9beb96f04161	00090000-5631-d4ca-660c-680d96ca44f3	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3086 (class 0 OID 23954751)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23955034)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5631-d4c7-2e3a-6677b63c620f	01	Drama	drama (SURS 01)
00140000-5631-d4c7-6916-9fff1b81c3e9	02	Opera	opera (SURS 02)
00140000-5631-d4c7-7745-d3a1c18fdb62	03	Balet	balet (SURS 03)
00140000-5631-d4c7-d7a7-7cbabdc81090	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5631-d4c7-533a-11ceb0463eeb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5631-d4c7-8554-79bf6e97307a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5631-d4c7-19d1-0d92b193c2c0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3105 (class 0 OID 23954915)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2554 (class 2606 OID 23954486)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 23955093)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 23955083)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 23954950)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 23954992)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 23955370)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 23954740)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23954761)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 23955288)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 23954635)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 23955161)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23954911)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 23954706)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 23954673)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23954649)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23954818)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23955347)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 23955354)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2832 (class 2606 OID 23955378)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 23562337)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2689 (class 2606 OID 23954845)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 23954607)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23954505)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23954569)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23954532)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 23954475)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2545 (class 2606 OID 23954460)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 23954851)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 23954887)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 23955029)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23954560)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 23954595)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23955240)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23954824)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 23954585)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 23954725)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 23954694)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2621 (class 2606 OID 23954686)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 23954836)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 23955249)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 23955257)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23955227)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 23955269)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 23954869)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23954809)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23954800)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23955016)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 23954943)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23954661)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23954431)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 23954878)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 23954449)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2547 (class 2606 OID 23954469)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 23954896)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23954831)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23954780)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23954419)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23954407)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23954401)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 23954963)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 23954541)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23954791)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 23955003)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23954494)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 23955281)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 23954769)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 23954620)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 23954444)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23955062)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 23954715)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 23954859)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23954975)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 23955328)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23955312)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 23955336)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23954933)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 23954755)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 23955042)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 23954923)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 1259 OID 23954749)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2638 (class 1259 OID 23954750)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2639 (class 1259 OID 23954748)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2640 (class 1259 OID 23954747)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2641 (class 1259 OID 23954746)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2732 (class 1259 OID 23954964)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2733 (class 1259 OID 23954965)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2734 (class 1259 OID 23954966)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 23955349)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2819 (class 1259 OID 23955348)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2572 (class 1259 OID 23954562)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2573 (class 1259 OID 23954563)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23954852)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2805 (class 1259 OID 23955316)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2806 (class 1259 OID 23955315)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2807 (class 1259 OID 23955317)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2808 (class 1259 OID 23955314)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2809 (class 1259 OID 23955313)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2684 (class 1259 OID 23954838)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2685 (class 1259 OID 23954837)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 23954716)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2630 (class 1259 OID 23954717)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2714 (class 1259 OID 23954912)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2715 (class 1259 OID 23954914)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2716 (class 1259 OID 23954913)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2604 (class 1259 OID 23954651)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 23954650)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2796 (class 1259 OID 23955270)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2748 (class 1259 OID 23955031)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 23955032)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 23955033)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2815 (class 1259 OID 23955337)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2757 (class 1259 OID 23955067)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2758 (class 1259 OID 23955064)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2759 (class 1259 OID 23955068)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2760 (class 1259 OID 23955066)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2761 (class 1259 OID 23955065)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2594 (class 1259 OID 23954622)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 23954621)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 23954535)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2702 (class 1259 OID 23954879)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2549 (class 1259 OID 23954476)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2550 (class 1259 OID 23954477)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2707 (class 1259 OID 23954899)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2708 (class 1259 OID 23954898)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2709 (class 1259 OID 23954897)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2577 (class 1259 OID 23954572)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2578 (class 1259 OID 23954571)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2579 (class 1259 OID 23954573)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2617 (class 1259 OID 23954689)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2618 (class 1259 OID 23954687)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 23954688)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2529 (class 1259 OID 23954409)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2664 (class 1259 OID 23954804)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2665 (class 1259 OID 23954802)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2666 (class 1259 OID 23954801)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2667 (class 1259 OID 23954803)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 23954450)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2541 (class 1259 OID 23954451)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2693 (class 1259 OID 23954860)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2828 (class 1259 OID 23955371)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2730 (class 1259 OID 23954952)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 23954951)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2829 (class 1259 OID 23955379)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2830 (class 1259 OID 23955380)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2679 (class 1259 OID 23954825)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2724 (class 1259 OID 23954944)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2725 (class 1259 OID 23954945)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 23955166)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2779 (class 1259 OID 23955165)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2780 (class 1259 OID 23955162)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2781 (class 1259 OID 23955163)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2782 (class 1259 OID 23955164)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 23954587)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 23954586)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2585 (class 1259 OID 23954588)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2696 (class 1259 OID 23954873)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2697 (class 1259 OID 23954872)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2788 (class 1259 OID 23955250)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2789 (class 1259 OID 23955251)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2771 (class 1259 OID 23955097)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2772 (class 1259 OID 23955098)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2773 (class 1259 OID 23955095)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2774 (class 1259 OID 23955096)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2720 (class 1259 OID 23954934)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2721 (class 1259 OID 23954935)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2670 (class 1259 OID 23954813)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2671 (class 1259 OID 23954812)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2672 (class 1259 OID 23954810)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2673 (class 1259 OID 23954811)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2767 (class 1259 OID 23955085)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2768 (class 1259 OID 23955084)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2608 (class 1259 OID 23954662)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2611 (class 1259 OID 23954676)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2612 (class 1259 OID 23954675)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2613 (class 1259 OID 23954674)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 23954677)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2628 (class 1259 OID 23954707)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2622 (class 1259 OID 23954695)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2623 (class 1259 OID 23954696)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2785 (class 1259 OID 23955241)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2804 (class 1259 OID 23955289)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 23955355)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2823 (class 1259 OID 23955356)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2559 (class 1259 OID 23954507)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2560 (class 1259 OID 23954506)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2568 (class 1259 OID 23954542)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2569 (class 1259 OID 23954543)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2647 (class 1259 OID 23954756)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 23954794)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 23954793)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2661 (class 1259 OID 23954792)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 23954742)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2643 (class 1259 OID 23954743)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2644 (class 1259 OID 23954741)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2645 (class 1259 OID 23954745)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2646 (class 1259 OID 23954744)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2576 (class 1259 OID 23954561)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 23954495)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 23954496)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 23954636)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 23954638)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2602 (class 1259 OID 23954637)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2603 (class 1259 OID 23954639)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2678 (class 1259 OID 23954819)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2753 (class 1259 OID 23955030)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 23955063)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 23955004)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 23955005)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2566 (class 1259 OID 23954533)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 23954534)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2717 (class 1259 OID 23954924)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 23954420)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 23954608)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2582 (class 1259 OID 23954570)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 23954408)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2801 (class 1259 OID 23955282)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 23954871)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2701 (class 1259 OID 23954870)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 23954770)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 23954771)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2775 (class 1259 OID 23955094)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 23954596)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 23955043)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 23955329)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2794 (class 1259 OID 23955258)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 23955259)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 23954993)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2658 (class 1259 OID 23954781)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 23954470)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2867 (class 2606 OID 23955551)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2868 (class 2606 OID 23955556)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2872 (class 2606 OID 23955576)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2866 (class 2606 OID 23955546)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2870 (class 2606 OID 23955566)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2871 (class 2606 OID 23955571)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2869 (class 2606 OID 23955561)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2906 (class 2606 OID 23955746)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2907 (class 2606 OID 23955751)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2908 (class 2606 OID 23955756)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2941 (class 2606 OID 23955921)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2940 (class 2606 OID 23955916)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 23955436)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2845 (class 2606 OID 23955441)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2889 (class 2606 OID 23955661)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2937 (class 2606 OID 23955901)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2936 (class 2606 OID 23955896)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2938 (class 2606 OID 23955906)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2935 (class 2606 OID 23955891)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2934 (class 2606 OID 23955886)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2888 (class 2606 OID 23955656)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2887 (class 2606 OID 23955651)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2864 (class 2606 OID 23955536)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2865 (class 2606 OID 23955541)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 23955701)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 23955711)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2898 (class 2606 OID 23955706)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2855 (class 2606 OID 23955491)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 23955486)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 23955641)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 23955876)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2909 (class 2606 OID 23955761)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 23955766)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 23955771)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2939 (class 2606 OID 23955911)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2915 (class 2606 OID 23955791)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2912 (class 2606 OID 23955776)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2916 (class 2606 OID 23955796)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23955786)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2913 (class 2606 OID 23955781)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2853 (class 2606 OID 23955481)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 23955476)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 23955421)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2840 (class 2606 OID 23955416)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 23955681)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2836 (class 2606 OID 23955396)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2837 (class 2606 OID 23955401)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2896 (class 2606 OID 23955696)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2895 (class 2606 OID 23955691)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2894 (class 2606 OID 23955686)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2847 (class 2606 OID 23955451)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2846 (class 2606 OID 23955446)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2848 (class 2606 OID 23955456)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2860 (class 2606 OID 23955516)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2858 (class 2606 OID 23955506)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 23955511)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 23955381)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2880 (class 2606 OID 23955616)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2878 (class 2606 OID 23955606)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2877 (class 2606 OID 23955601)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2879 (class 2606 OID 23955611)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2834 (class 2606 OID 23955386)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 23955391)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2890 (class 2606 OID 23955666)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2944 (class 2606 OID 23955936)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2905 (class 2606 OID 23955741)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 23955736)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2945 (class 2606 OID 23955941)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2946 (class 2606 OID 23955946)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2886 (class 2606 OID 23955646)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2902 (class 2606 OID 23955726)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2903 (class 2606 OID 23955731)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2927 (class 2606 OID 23955851)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 23955846)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 23955831)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 23955836)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2925 (class 2606 OID 23955841)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2850 (class 2606 OID 23955466)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23955461)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2851 (class 2606 OID 23955471)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2892 (class 2606 OID 23955676)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 23955671)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 23955861)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2930 (class 2606 OID 23955866)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2921 (class 2606 OID 23955821)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2922 (class 2606 OID 23955826)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2919 (class 2606 OID 23955811)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2920 (class 2606 OID 23955816)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2900 (class 2606 OID 23955716)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 23955721)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2884 (class 2606 OID 23955636)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2883 (class 2606 OID 23955631)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2881 (class 2606 OID 23955621)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2882 (class 2606 OID 23955626)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2918 (class 2606 OID 23955806)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 23955801)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2856 (class 2606 OID 23955496)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2857 (class 2606 OID 23955501)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2863 (class 2606 OID 23955531)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 23955521)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2862 (class 2606 OID 23955526)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2928 (class 2606 OID 23955856)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2931 (class 2606 OID 23955871)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2933 (class 2606 OID 23955881)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2942 (class 2606 OID 23955926)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2943 (class 2606 OID 23955931)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2839 (class 2606 OID 23955411)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 23955406)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2842 (class 2606 OID 23955426)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 23955431)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 23955581)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2876 (class 2606 OID 23955596)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 23955591)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2874 (class 2606 OID 23955586)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-29 09:11:57 CET

--
-- PostgreSQL database dump complete
--

