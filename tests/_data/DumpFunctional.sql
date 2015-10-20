--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-20 09:57:40 CEST

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
-- TOC entry 181 (class 1259 OID 22662847)
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
-- TOC entry 234 (class 1259 OID 22663455)
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
-- TOC entry 233 (class 1259 OID 22663438)
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
-- TOC entry 224 (class 1259 OID 22663315)
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
-- TOC entry 227 (class 1259 OID 22663345)
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
-- TOC entry 248 (class 1259 OID 22663727)
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
-- TOC entry 201 (class 1259 OID 22663095)
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
-- TOC entry 203 (class 1259 OID 22663126)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 22663652)
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
-- TOC entry 192 (class 1259 OID 22662990)
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
-- TOC entry 235 (class 1259 OID 22663468)
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
-- TOC entry 220 (class 1259 OID 22663269)
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
-- TOC entry 198 (class 1259 OID 22663064)
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
-- TOC entry 195 (class 1259 OID 22663030)
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
-- TOC entry 193 (class 1259 OID 22663007)
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
-- TOC entry 209 (class 1259 OID 22663183)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 22663708)
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
-- TOC entry 247 (class 1259 OID 22663720)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 22663742)
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
-- TOC entry 170 (class 1259 OID 22028081)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 22663208)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22662964)
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
-- TOC entry 183 (class 1259 OID 22662866)
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
-- TOC entry 187 (class 1259 OID 22662930)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(2) DEFAULT NULL::character varying,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 22662877)
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
-- TOC entry 178 (class 1259 OID 22662821)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22662840)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 22663215)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 22663249)
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
-- TOC entry 230 (class 1259 OID 22663386)
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
-- TOC entry 186 (class 1259 OID 22662910)
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
-- TOC entry 189 (class 1259 OID 22662956)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 22663597)
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
-- TOC entry 210 (class 1259 OID 22663189)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22662941)
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
-- TOC entry 200 (class 1259 OID 22663085)
-- Name: praznik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE praznik (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date,
    aktivna boolean
);


--
-- TOC entry 196 (class 1259 OID 22663045)
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
-- TOC entry 197 (class 1259 OID 22663057)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22663201)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 22663611)
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
-- TOC entry 239 (class 1259 OID 22663621)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22663536)
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
-- TOC entry 240 (class 1259 OID 22663629)
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
-- TOC entry 216 (class 1259 OID 22663230)
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
-- TOC entry 208 (class 1259 OID 22663174)
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
-- TOC entry 207 (class 1259 OID 22663164)
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
-- TOC entry 229 (class 1259 OID 22663375)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 22663305)
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
-- TOC entry 194 (class 1259 OID 22663019)
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
-- TOC entry 175 (class 1259 OID 22662792)
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
-- TOC entry 174 (class 1259 OID 22662790)
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
-- TOC entry 217 (class 1259 OID 22663243)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22662830)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22662814)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 22663257)
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
-- TOC entry 211 (class 1259 OID 22663195)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 22663141)
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
-- TOC entry 173 (class 1259 OID 22662779)
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
-- TOC entry 172 (class 1259 OID 22662771)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22662766)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 22663322)
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
-- TOC entry 185 (class 1259 OID 22662902)
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
-- TOC entry 206 (class 1259 OID 22663151)
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
-- TOC entry 228 (class 1259 OID 22663363)
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
-- TOC entry 182 (class 1259 OID 22662856)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 22663640)
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
-- TOC entry 204 (class 1259 OID 22663131)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22662976)
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
-- TOC entry 176 (class 1259 OID 22662801)
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
-- TOC entry 232 (class 1259 OID 22663413)
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
-- TOC entry 199 (class 1259 OID 22663075)
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
-- TOC entry 215 (class 1259 OID 22663222)
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
-- TOC entry 226 (class 1259 OID 22663336)
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
-- TOC entry 244 (class 1259 OID 22663688)
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
-- TOC entry 243 (class 1259 OID 22663659)
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
-- TOC entry 245 (class 1259 OID 22663700)
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
-- TOC entry 222 (class 1259 OID 22663294)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
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
-- TOC entry 202 (class 1259 OID 22663120)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 22663403)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 22663284)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 22662795)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3065 (class 0 OID 22662847)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5625-f3f1-faaa-9a29996b0c56	10	30	Otroci	Abonma za otroke	200
000a0000-5625-f3f1-6587-782c4546fd0b	20	60	Mladina	Abonma za mladino	400
000a0000-5625-f3f1-da59-381562974856	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3118 (class 0 OID 22663455)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5625-f3f1-ed67-ed095ebff461	000d0000-5625-f3f1-821e-61bc6620e866	\N	00090000-5625-f3f1-7424-c80e6f512719	000b0000-5625-f3f1-ec94-eb08deb1156d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5625-f3f1-4ad3-a5b2241d90db	000d0000-5625-f3f1-d2c9-8ae62e1a4403	00100000-5625-f3f1-8f8d-eef21a87b516	00090000-5625-f3f1-512c-1dd4dc295b72	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5625-f3f1-09c4-75f3593b33a0	000d0000-5625-f3f1-41d8-9bedef28fbb8	00100000-5625-f3f1-659f-9c628828d736	00090000-5625-f3f1-abfd-7ea854035bab	\N	0003	t	\N	2015-10-20	\N	2	t	\N	f	f
000c0000-5625-f3f1-921c-5efe30a2dbf9	000d0000-5625-f3f1-66d6-54b69e027cf6	\N	00090000-5625-f3f1-f3a3-4853e69c140a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5625-f3f1-49a2-1523b1ef95de	000d0000-5625-f3f1-a21f-66d2bf9e7b76	\N	00090000-5625-f3f1-8dcd-cbd9d3a293c5	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5625-f3f1-a805-6ec30a79770e	000d0000-5625-f3f1-6a80-afdd27419e4a	\N	00090000-5625-f3f1-d0a2-f01df4ca8ae1	000b0000-5625-f3f1-c84e-017d04195399	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5625-f3f1-4c18-3dff2906085c	000d0000-5625-f3f1-0f38-f120f1ced38b	00100000-5625-f3f1-55b7-f9ae16d44d87	00090000-5625-f3f1-af11-8890315cfff3	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5625-f3f1-52f9-74a7a8bd6715	000d0000-5625-f3f1-7c21-902eec21d26e	\N	00090000-5625-f3f1-80e8-61ce1e265864	000b0000-5625-f3f1-3eab-02281b70ffa4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5625-f3f1-06c0-98a0585745fa	000d0000-5625-f3f1-0f38-f120f1ced38b	00100000-5625-f3f1-3553-765fbc5c76bb	00090000-5625-f3f1-d87a-02ad2c855492	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5625-f3f1-7fa7-f1a096799754	000d0000-5625-f3f1-0f38-f120f1ced38b	00100000-5625-f3f1-c1b2-5f1a109c8b7e	00090000-5625-f3f1-9b00-2cdd970802b4	\N	0010	t	\N	2015-10-20	\N	16	f	\N	f	t
000c0000-5625-f3f1-0f43-18ce3393e2af	000d0000-5625-f3f1-0f38-f120f1ced38b	00100000-5625-f3f1-8363-77ccc34be8f0	00090000-5625-f3f1-4e21-c62badc7b9ae	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5625-f3f1-206a-08f417f3d90c	000d0000-5625-f3f1-5c55-5a984a9b04fd	\N	00090000-5625-f3f1-512c-1dd4dc295b72	000b0000-5625-f3f1-d0ec-3e0adfc0ee6d	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3117 (class 0 OID 22663438)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 22663315)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5625-f3f1-7552-45716ad1e3a6	00160000-5625-f3f1-e31e-e70226530607	00090000-5625-f3f1-afee-9d49ff9e6387	aizv	10	t
003d0000-5625-f3f1-870e-b351c5be032d	00160000-5625-f3f1-e31e-e70226530607	00090000-5625-f3f1-0de5-55f2b430624c	apri	14	t
003d0000-5625-f3f1-8edf-c318656bbb1c	00160000-5625-f3f1-36d4-33bf8ea3eb8d	00090000-5625-f3f1-dae1-4f38aaf21e6f	aizv	11	t
003d0000-5625-f3f1-b196-2080d2b65de1	00160000-5625-f3f1-79fd-7aa7a9a4a529	00090000-5625-f3f1-15b7-92f8d6811bf7	aizv	12	t
003d0000-5625-f3f1-348d-e531f4017983	00160000-5625-f3f1-e31e-e70226530607	00090000-5625-f3f1-4b31-1d3dfc3f93d8	apri	18	f
\.


--
-- TOC entry 3111 (class 0 OID 22663345)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5625-f3f1-e31e-e70226530607	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5625-f3f1-36d4-33bf8ea3eb8d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5625-f3f1-79fd-7aa7a9a4a529	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3132 (class 0 OID 22663727)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22663095)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5625-f3f1-3fe8-5f6e2035d9e7	\N	\N	00200000-5625-f3f1-e29c-55b6221ef690	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5625-f3f1-9346-81a047c9531a	\N	\N	00200000-5625-f3f1-a329-e05b0972aab4	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5625-f3f1-a83c-32a723f7e56d	\N	\N	00200000-5625-f3f1-18e8-3b6cecd06287	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5625-f3f1-51f2-f581d8ee1609	\N	\N	00200000-5625-f3f1-d7ad-744a087abf54	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5625-f3f1-0c9d-3b92350d784d	\N	\N	00200000-5625-f3f1-a246-72ce8b2e2209	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3087 (class 0 OID 22663126)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 22663652)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 22662990)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5625-f3ef-7f0a-250444a5b1a3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5625-f3ef-d985-5e6e61f48c6a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5625-f3ef-28e8-b977f4a00fbe	AL	ALB	008	Albania 	Albanija	\N
00040000-5625-f3ef-32fa-8f38a1468b06	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5625-f3ef-6114-dca19b027789	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5625-f3ef-1dcb-0b5071c1da21	AD	AND	020	Andorra 	Andora	\N
00040000-5625-f3ef-8002-ce7db915ad07	AO	AGO	024	Angola 	Angola	\N
00040000-5625-f3ef-9ebf-bfb719a42013	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5625-f3ef-75b0-752c8325b537	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5625-f3ef-fb19-502f3b85ea54	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5625-f3ef-8529-f7e77cd00e96	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5625-f3ef-b92c-c2faf7e5f7cf	AM	ARM	051	Armenia 	Armenija	\N
00040000-5625-f3ef-527d-5516c900277b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5625-f3ef-9724-aa9639e113fe	AU	AUS	036	Australia 	Avstralija	\N
00040000-5625-f3ef-50c8-08e5b1e7ea6e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5625-f3ef-645c-4d152e3c3c70	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5625-f3ef-8579-e42b28987bc7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5625-f3ef-0cc4-8570daecf902	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5625-f3ef-2a47-a2b9c37ec0ce	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5625-f3ef-8d73-c1ff958e4730	BB	BRB	052	Barbados 	Barbados	\N
00040000-5625-f3ef-38a8-7624372b5d03	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5625-f3ef-e874-942aa7518167	BE	BEL	056	Belgium 	Belgija	\N
00040000-5625-f3ef-ea47-1423bd910620	BZ	BLZ	084	Belize 	Belize	\N
00040000-5625-f3ef-b45a-f5e2887aea7a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5625-f3ef-d083-565921f8ae32	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5625-f3ef-1211-eec8797990bb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5625-f3ef-3f8d-019ebc31287f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5625-f3ef-3858-3630c619f656	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5625-f3ef-0c1b-1fa390135b6b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5625-f3ef-2160-c7d8263726fd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5625-f3ef-6ce5-b10a2608d6d4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5625-f3ef-0b19-a49e10fd9c24	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5625-f3ef-dd62-19c976084ea9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5625-f3ef-1aa7-a46f235cf6d6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5625-f3ef-076d-d19e7d49b8f0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5625-f3ef-5e56-f1061f43782b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5625-f3ef-da2e-0a4efb202462	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5625-f3ef-5948-92e059309f61	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5625-f3ef-70a2-ac68d9f7bf62	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5625-f3ef-1027-095a4100063f	CA	CAN	124	Canada 	Kanada	\N
00040000-5625-f3ef-57f5-67287d67b1a6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5625-f3ef-37a4-f0e2ccbf10ce	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5625-f3ef-2d07-40f6df7730bf	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5625-f3ef-918d-105a7e6d8bdb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5625-f3ef-e5ff-4326b9c0b425	CL	CHL	152	Chile 	Čile	\N
00040000-5625-f3ef-2761-df581e033f80	CN	CHN	156	China 	Kitajska	\N
00040000-5625-f3ef-2c11-b7b82e7de8fa	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5625-f3ef-c672-25401fd7840e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5625-f3ef-43c1-9f0b79fb66aa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5625-f3ef-4346-1d66f22b08e4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5625-f3ef-b69e-e4aff4a33cb6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5625-f3ef-38b6-55ac2cdccd00	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5625-f3ef-d14f-879940fd4c2b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5625-f3ef-a013-9b93584a7807	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5625-f3ef-780a-747c3cc58460	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5625-f3ef-20ce-e04d3e2eefef	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5625-f3ef-0383-69d6cf904d51	CU	CUB	192	Cuba 	Kuba	\N
00040000-5625-f3ef-d237-eed578641a40	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5625-f3ef-5adb-015554800e9a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5625-f3ef-6cd6-0c178fd560cb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5625-f3ef-9258-db0dd7567167	DK	DNK	208	Denmark 	Danska	\N
00040000-5625-f3ef-07b5-d89c0ebafe69	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5625-f3ef-c58e-6ee827ddc5b7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5625-f3ef-9d33-9901caa09ca4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5625-f3ef-45d4-922eb39c7af9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5625-f3ef-9a0e-56780c1e1c55	EG	EGY	818	Egypt 	Egipt	\N
00040000-5625-f3ef-d778-18ca492c0703	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5625-f3ef-981a-f84f3ff34526	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5625-f3ef-2f16-7fe505b71774	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5625-f3ef-f687-f8ce400a4dbf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5625-f3ef-c59e-cd26ce9a8752	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5625-f3ef-6d24-5b152516dc8c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5625-f3ef-a5fc-1488374cf74c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5625-f3ef-8fa8-3fa04642980a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5625-f3ef-63e0-ebfc71232a23	FI	FIN	246	Finland 	Finska	\N
00040000-5625-f3ef-e584-24ef341619d1	FR	FRA	250	France 	Francija	\N
00040000-5625-f3ef-bdff-e83ad444af45	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5625-f3ef-6519-9f95bbfb18b8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5625-f3ef-96e7-8e27c4e90568	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5625-f3ef-32c1-597a268fd341	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5625-f3ef-6d77-189602f897ee	GA	GAB	266	Gabon 	Gabon	\N
00040000-5625-f3ef-6dc4-16fd2d4d018f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5625-f3ef-433a-11a10b47ba18	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5625-f3ef-6bb4-997175e914da	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5625-f3ef-33df-78815e8c73d1	GH	GHA	288	Ghana 	Gana	\N
00040000-5625-f3ef-9dec-682801e8be78	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5625-f3ef-09a0-05464f00a747	GR	GRC	300	Greece 	Grčija	\N
00040000-5625-f3ef-803e-4a0f9ff99791	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5625-f3ef-bb5b-d2eb48f3df31	GD	GRD	308	Grenada 	Grenada	\N
00040000-5625-f3ef-9efe-760c0b2f63bc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5625-f3ef-49ad-d0022ba7b8f8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5625-f3ef-0de0-684289dabd0d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5625-f3ef-03f0-69493f3b0991	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5625-f3ef-ea07-27a19f428dfc	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5625-f3ef-43da-ad40ce57dc85	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5625-f3ef-6304-85ad0f3e618a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5625-f3ef-d094-f734d0d4638a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5625-f3ef-064c-409e7b83c42f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5625-f3ef-f50e-d1508bb10664	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5625-f3ef-9557-629fd75501d8	HN	HND	340	Honduras 	Honduras	\N
00040000-5625-f3ef-a68b-2392204ed411	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5625-f3ef-a7df-17fecdd9e70d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5625-f3ef-9fde-713927013d3c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5625-f3ef-0c0b-9647818c426b	IN	IND	356	India 	Indija	\N
00040000-5625-f3ef-71ce-7fe8cf4a298e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5625-f3ef-d405-6ccaeac18a4f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5625-f3ef-0785-7c0214a1e0a8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5625-f3ef-20a1-6d7b71d64e88	IE	IRL	372	Ireland 	Irska	\N
00040000-5625-f3ef-3041-8353b0a365f8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5625-f3ef-d0bc-c7b0ab643e9f	IL	ISR	376	Israel 	Izrael	\N
00040000-5625-f3ef-d953-132482a70dc5	IT	ITA	380	Italy 	Italija	\N
00040000-5625-f3ef-68ec-6f35964cdac3	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5625-f3ef-cc75-2a69d833cf9e	JP	JPN	392	Japan 	Japonska	\N
00040000-5625-f3ef-cc53-fa2bf40cbd5e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5625-f3ef-913d-124600a2bcd7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5625-f3ef-e71e-735796b01f9c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5625-f3ef-2d94-d6607e385b4c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5625-f3ef-dd03-3c7650e41adb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5625-f3ef-c6e7-785e9b93d115	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5625-f3ef-031f-e28b253d1232	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5625-f3ef-394b-f687a44d5215	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5625-f3ef-2611-b17e86b9ac90	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5625-f3ef-4ca8-9928a537c686	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5625-f3ef-0d47-3c033c8771b8	LV	LVA	428	Latvia 	Latvija	\N
00040000-5625-f3ef-e1d7-360abf48e48e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5625-f3ef-267c-838d0f1d3747	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5625-f3ef-70e5-2840d2c853b8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5625-f3ef-fc06-67988687e778	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5625-f3ef-ff9b-ba3804c1b9bc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5625-f3ef-3e4c-bc1281d8f84b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5625-f3ef-6d34-4e5cc0c3e6de	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5625-f3ef-a40c-5394b0263b1d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5625-f3ef-d4a3-5810c09746ca	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5625-f3ef-7599-ebcedcd3afe3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5625-f3ef-10cc-af9027e1472b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5625-f3ef-5d76-97b1a78cdaa1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5625-f3ef-d94a-91165aa003c6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5625-f3ef-89ec-d51165b9e1ff	ML	MLI	466	Mali 	Mali	\N
00040000-5625-f3ef-4af5-7445d6bc9dc1	MT	MLT	470	Malta 	Malta	\N
00040000-5625-f3ef-dd0b-345dd82799ff	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5625-f3ef-5a00-1365ba0452b3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5625-f3ef-60d0-908bfd0cd58f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5625-f3ef-15f2-2209a1e5ab8b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5625-f3ef-eb71-b359c924913f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5625-f3ef-4534-c3aa14fa1a48	MX	MEX	484	Mexico 	Mehika	\N
00040000-5625-f3ef-bcf7-761df35523aa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5625-f3ef-8cfb-f092972d7efb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5625-f3ef-2853-a17af9a6e8b7	MC	MCO	492	Monaco 	Monako	\N
00040000-5625-f3ef-bd89-c052d90700b9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5625-f3ef-f0e7-8673da9f2611	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5625-f3ef-de76-70088e605ca0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5625-f3ef-4b42-67543e29a642	MA	MAR	504	Morocco 	Maroko	\N
00040000-5625-f3ef-afbb-50a4d2cc2478	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5625-f3ef-6cc9-e7d3d591ed67	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5625-f3ef-794a-902ffbedf901	NA	NAM	516	Namibia 	Namibija	\N
00040000-5625-f3ef-5975-6ee1945dae4d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5625-f3ef-8f0d-e93d59069ef9	NP	NPL	524	Nepal 	Nepal	\N
00040000-5625-f3ef-8cbb-94351fd3e31e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5625-f3ef-35b0-da2ced12b4ec	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5625-f3ef-b8eb-d29cdf2caec0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5625-f3ef-1f4f-562e8d063006	NE	NER	562	Niger 	Niger 	\N
00040000-5625-f3ef-9dcf-270a363c379c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5625-f3ef-706a-ecba27f63f90	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5625-f3ef-dbb1-0d4e5d702416	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5625-f3ef-9153-32b79e777fcd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5625-f3ef-9b0f-ea56624f975e	NO	NOR	578	Norway 	Norveška	\N
00040000-5625-f3ef-a1c5-313c3b362de7	OM	OMN	512	Oman 	Oman	\N
00040000-5625-f3ef-a27f-97db139b771e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5625-f3ef-3510-1711981bdb0d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5625-f3ef-a5d7-13bfa7064ece	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5625-f3ef-e0b3-9b444fd8cf20	PA	PAN	591	Panama 	Panama	\N
00040000-5625-f3ef-edf9-4a18c7352e32	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5625-f3ef-fea8-3b3917c6510f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5625-f3ef-6cf1-16bfa551b2ca	PE	PER	604	Peru 	Peru	\N
00040000-5625-f3ef-a65a-5a749c326f43	PH	PHL	608	Philippines 	Filipini	\N
00040000-5625-f3ef-eb8e-0fdefd00603c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5625-f3ef-0090-1f76a6129d91	PL	POL	616	Poland 	Poljska	\N
00040000-5625-f3ef-4637-5e81d281842c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5625-f3ef-cedb-8f408f3c295d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5625-f3ef-754a-74011604f71f	QA	QAT	634	Qatar 	Katar	\N
00040000-5625-f3ef-7c77-0e256fc17aa0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5625-f3ef-d050-4abae0da06d5	RO	ROU	642	Romania 	Romunija	\N
00040000-5625-f3ef-1aad-06a749e4b835	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5625-f3ef-07af-122f3969e205	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5625-f3ef-08d4-5b670d821d2b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5625-f3ef-5f05-1050386f6874	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5625-f3ef-0687-faf04723f185	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5625-f3ef-83c4-717623b75de0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5625-f3ef-358b-fc76eb353dda	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5625-f3ef-fda5-f8a1f19d0c97	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5625-f3ef-89dd-dc1922874181	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5625-f3ef-087b-4ec41172feaa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5625-f3ef-f814-4c382df023b1	SM	SMR	674	San Marino 	San Marino	\N
00040000-5625-f3ef-a2fc-94722c280afc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5625-f3ef-1b50-8602088d8e55	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5625-f3ef-d91f-ebca40bd7b99	SN	SEN	686	Senegal 	Senegal	\N
00040000-5625-f3ef-f147-2e15875d15b0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5625-f3ef-5e55-a87d0981aeb2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5625-f3ef-77b2-55bbab4adfa8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5625-f3ef-adbf-67362a9eb66c	SG	SGP	702	Singapore 	Singapur	\N
00040000-5625-f3ef-50fa-94198103a2fa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5625-f3ef-100e-b983d3c5f527	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5625-f3ef-8b1f-d311c8b11137	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5625-f3ef-d92d-c88029217122	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5625-f3ef-7d53-dfc60a01d462	SO	SOM	706	Somalia 	Somalija	\N
00040000-5625-f3ef-2613-36f0842fb036	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5625-f3ef-cbc8-90096241dabf	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5625-f3ef-149b-7c150b06d491	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5625-f3ef-de25-2130992d2096	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5625-f3ef-072f-1d73920c6c6d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5625-f3ef-a275-ce317d4dea03	SD	SDN	729	Sudan 	Sudan	\N
00040000-5625-f3ef-a3d3-c7961e4ec617	SR	SUR	740	Suriname 	Surinam	\N
00040000-5625-f3ef-b468-3e546861643c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5625-f3ef-4007-17a9de57a9a6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5625-f3ef-718c-0b85eb351160	SE	SWE	752	Sweden 	Švedska	\N
00040000-5625-f3ef-4fe4-377c11f7a5f5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5625-f3ef-29e3-958a2ad09ada	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5625-f3ef-727a-ec4a5b0a9de0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5625-f3ef-03a0-cba41dc5b086	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5625-f3ef-47a0-5606ab2e7b63	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5625-f3ef-167a-43f50a684eaf	TH	THA	764	Thailand 	Tajska	\N
00040000-5625-f3ef-53ae-aaee47da477a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5625-f3ef-806a-a04e2d2dc701	TG	TGO	768	Togo 	Togo	\N
00040000-5625-f3ef-8b82-d756ebeb9770	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5625-f3ef-a663-4fa64a19db41	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5625-f3ef-11a1-fbc16a812245	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5625-f3ef-56a1-5452b884a0ff	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5625-f3ef-33cf-d1a8d70cd7e3	TR	TUR	792	Turkey 	Turčija	\N
00040000-5625-f3ef-d824-aa5b36344b19	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5625-f3ef-aed7-046c207d5cb5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5625-f3ef-3888-2f2c2f204830	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5625-f3ef-bff6-47ddf6f4cd04	UG	UGA	800	Uganda 	Uganda	\N
00040000-5625-f3ef-1612-872c06f84d8e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5625-f3ef-471c-e4b636cc388c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5625-f3ef-78f7-83047af53470	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5625-f3ef-409b-7c2c8f9dbb2f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5625-f3ef-dda0-5d9ff0f9ed89	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5625-f3ef-42ae-42c9f2d17f2c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5625-f3ef-4292-ba5ae1cbf1d9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5625-f3ef-c8df-4a33d2af5831	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5625-f3ef-2dbb-39586c005b62	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5625-f3ef-eb9f-a7afb8ebba96	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5625-f3ef-7dc5-b1ff3834eeba	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5625-f3ef-b4c2-eeb288984b8f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5625-f3ef-6b31-35a566551e78	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5625-f3ef-ef14-b92de31b898f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5625-f3ef-1718-f044687fdd9c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5625-f3ef-3246-2e2d58e71719	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5625-f3ef-9cf8-b53e772d6a44	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3119 (class 0 OID 22663468)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5625-f3f1-fcf7-484c2471985e	000e0000-5625-f3f1-be16-447f22b8e988	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5625-f3ef-e940-53862cc25021	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5625-f3f1-9403-2100f7ea6ce2	000e0000-5625-f3f1-5e93-c1dbb083074c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5625-f3ef-6084-8302bd30bc2f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5625-f3f1-e291-df678a88cd3b	000e0000-5625-f3f1-8003-4b7511ffc391	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5625-f3ef-e940-53862cc25021	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5625-f3f1-c124-a111ee753f1a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5625-f3f1-6d3c-9de59378267d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3104 (class 0 OID 22663269)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5625-f3f1-821e-61bc6620e866	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-ed67-ed095ebff461	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5625-f3ef-96c9-f137b19bfa5d
000d0000-5625-f3f1-d2c9-8ae62e1a4403	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-4ad3-a5b2241d90db	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5625-f3ef-7896-4bcc85aacffb
000d0000-5625-f3f1-41d8-9bedef28fbb8	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-09c4-75f3593b33a0	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5625-f3ef-714c-599fa6ce551a
000d0000-5625-f3f1-66d6-54b69e027cf6	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-921c-5efe30a2dbf9	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5625-f3ef-c3c9-e0006db10a4f
000d0000-5625-f3f1-a21f-66d2bf9e7b76	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-49a2-1523b1ef95de	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5625-f3ef-c3c9-e0006db10a4f
000d0000-5625-f3f1-6a80-afdd27419e4a	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-a805-6ec30a79770e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5625-f3ef-96c9-f137b19bfa5d
000d0000-5625-f3f1-0f38-f120f1ced38b	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-06c0-98a0585745fa	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5625-f3ef-96c9-f137b19bfa5d
000d0000-5625-f3f1-7c21-902eec21d26e	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-52f9-74a7a8bd6715	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5625-f3ef-8efa-d84605a51c93
000d0000-5625-f3f1-5c55-5a984a9b04fd	000e0000-5625-f3f1-5e93-c1dbb083074c	000c0000-5625-f3f1-206a-08f417f3d90c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5625-f3ef-cbf2-320cf682b7a5
\.


--
-- TOC entry 3082 (class 0 OID 22663064)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22663030)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22663007)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5625-f3f1-8cd0-d712fba87e0a	00080000-5625-f3f1-f4ba-36c95972ff6e	00090000-5625-f3f1-9b00-2cdd970802b4	AK		igralka
\.


--
-- TOC entry 3093 (class 0 OID 22663183)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 22663708)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 22663720)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 22663742)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 22028081)
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
\.


--
-- TOC entry 3097 (class 0 OID 22663208)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22662964)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5625-f3f0-928e-21868a0b48d8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5625-f3f0-54b9-bd3a976e13a5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5625-f3f0-207c-6fb953da8e26	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5625-f3f0-2e7b-87dbcb49647c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5625-f3f0-ae4c-578c679f06f0	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5625-f3f0-9a8a-68b3c4348a0e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5625-f3f0-f8c9-95fc965f6cde	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5625-f3f0-4112-0180f395940d	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5625-f3f0-63d3-b19e23600b4c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5625-f3f0-7b33-3dfe6e07f4bf	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5625-f3f0-b082-a160969dec09	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5625-f3f0-31ef-624c2761db0d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5625-f3f0-d52a-7f6c4c9bd539	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5625-f3f0-750c-8e914dae1a02	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5625-f3f0-98a2-7a590bd2e826	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5625-f3f1-0fde-a47145e65c43	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5625-f3f1-a99b-95dd791e24b6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5625-f3f1-ee2e-0c19a090ea19	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5625-f3f1-d2b8-50e1150b98d1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5625-f3f1-8f42-8f103261d9ff	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5625-f3f3-9341-72ce2bc96bb9	application.tenant.maticnopodjetje	string	s:36:"00080000-5625-f3f3-f51c-cf0db3fba1ef";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3067 (class 0 OID 22662866)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5625-f3f1-6488-a9cf94ab8ea3	00000000-5625-f3f1-0fde-a47145e65c43	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5625-f3f1-2f37-2dd6c20c9310	00000000-5625-f3f1-0fde-a47145e65c43	00010000-5625-f3f0-87ba-f10a4b1ee9af	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5625-f3f1-901f-c039c2297888	00000000-5625-f3f1-a99b-95dd791e24b6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3071 (class 0 OID 22662930)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5625-f3f1-ce00-c0ac7caa7735	\N	00100000-5625-f3f1-8f8d-eef21a87b516	00100000-5625-f3f1-659f-9c628828d736	01	Gledališče Nimbis
00410000-5625-f3f1-cdb3-eda041bf553c	00410000-5625-f3f1-ce00-c0ac7caa7735	00100000-5625-f3f1-8f8d-eef21a87b516	00100000-5625-f3f1-659f-9c628828d736	02	Tehnika
\.


--
-- TOC entry 3068 (class 0 OID 22662877)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5625-f3f1-7424-c80e6f512719	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5625-f3f1-f3a3-4853e69c140a	00010000-5625-f3f1-226c-a6692830e8bc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5625-f3f1-abfd-7ea854035bab	00010000-5625-f3f1-4ab2-5dfc8f8dd138	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5625-f3f1-d87a-02ad2c855492	00010000-5625-f3f1-8fe9-0720a762127b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5625-f3f1-0a06-bc5d75e5f6fa	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5625-f3f1-d0a2-f01df4ca8ae1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5625-f3f1-4e21-c62badc7b9ae	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5625-f3f1-af11-8890315cfff3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5625-f3f1-9b00-2cdd970802b4	00010000-5625-f3f1-b6ba-c1b5aeb26ba0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5625-f3f1-512c-1dd4dc295b72	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5625-f3f1-c37f-1e194662ae6e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5625-f3f1-8dcd-cbd9d3a293c5	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5625-f3f1-80e8-61ce1e265864	00010000-5625-f3f1-9f60-c4e9c0e43d42	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5625-f3f1-afee-9d49ff9e6387	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5625-f3f1-0de5-55f2b430624c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5625-f3f1-dae1-4f38aaf21e6f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5625-f3f1-15b7-92f8d6811bf7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5625-f3f1-4b31-1d3dfc3f93d8	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3062 (class 0 OID 22662821)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5625-f3ef-6855-2966b4e6bdb8	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5625-f3ef-67c4-f9b66b2749e3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5625-f3ef-1aab-14285835ac93	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5625-f3ef-a9a8-4f14e35bc760	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5625-f3ef-cb94-1b290f97a8ef	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5625-f3ef-e803-8f6b78b20370	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5625-f3ef-aace-21da7cf15438	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5625-f3ef-9962-b1d900d5a9d3	Abonma-read	Abonma - branje	f
00030000-5625-f3ef-b602-96183a2138d3	Abonma-write	Abonma - spreminjanje	f
00030000-5625-f3ef-1d4f-b52ece3316ab	Alternacija-read	Alternacija - branje	f
00030000-5625-f3ef-01e6-ff900dc22ada	Alternacija-write	Alternacija - spreminjanje	f
00030000-5625-f3ef-7e14-6be1c09a792d	Arhivalija-read	Arhivalija - branje	f
00030000-5625-f3ef-8d4c-2a00239b9323	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5625-f3ef-30a7-67d024369fc1	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5625-f3ef-4a68-7f2a9d4b3f60	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5625-f3ef-09ad-fd895a9e2072	Besedilo-read	Besedilo - branje	f
00030000-5625-f3ef-5123-16b3ec1efa1a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5625-f3ef-f670-2bffa235d531	DogodekIzven-read	DogodekIzven - branje	f
00030000-5625-f3ef-823b-3188065909a7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5625-f3ef-38e3-96ad863a9bbc	Dogodek-read	Dogodek - branje	f
00030000-5625-f3ef-24f9-00af07a36b35	Dogodek-write	Dogodek - spreminjanje	f
00030000-5625-f3ef-aa74-4932e40dbf25	DrugiVir-read	DrugiVir - branje	f
00030000-5625-f3ef-7419-65b3746c6a60	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5625-f3ef-b0a6-b4ef380fdb30	Drzava-read	Drzava - branje	f
00030000-5625-f3ef-a5d0-a8c04fe0dee1	Drzava-write	Drzava - spreminjanje	f
00030000-5625-f3ef-4b3f-06ddf22cc696	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5625-f3ef-0aa1-47aa14fa4de0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5625-f3ef-85a1-8c8328d89f95	Funkcija-read	Funkcija - branje	f
00030000-5625-f3ef-1e22-e92aec75cdfe	Funkcija-write	Funkcija - spreminjanje	f
00030000-5625-f3ef-172b-88f43b7b6109	Gostovanje-read	Gostovanje - branje	f
00030000-5625-f3ef-725c-f15d0e4018ab	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5625-f3ef-1779-bce91a2d1add	Gostujoca-read	Gostujoca - branje	f
00030000-5625-f3ef-f000-6773760c440a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5625-f3ef-0ae4-4696aeb5d8e0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5625-f3ef-651a-cd2467ee9c3f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5625-f3ef-c212-f14dec32b250	Kupec-read	Kupec - branje	f
00030000-5625-f3ef-23dc-fb55eff33428	Kupec-write	Kupec - spreminjanje	f
00030000-5625-f3ef-a5f0-071572d77a6d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5625-f3ef-4712-e8b0147d3351	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5625-f3ef-0769-056079083531	Option-read	Option - branje	f
00030000-5625-f3ef-291c-0fdbdfb5d556	Option-write	Option - spreminjanje	f
00030000-5625-f3ef-9c17-d888f6de6b14	OptionValue-read	OptionValue - branje	f
00030000-5625-f3ef-626b-7406b9534c68	OptionValue-write	OptionValue - spreminjanje	f
00030000-5625-f3ef-f5a4-4cab11246cd1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5625-f3ef-1143-90a973144ab7	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5625-f3ef-dad2-094f5c277e72	Oseba-read	Oseba - branje	f
00030000-5625-f3ef-2e2a-8e1827981990	Oseba-write	Oseba - spreminjanje	f
00030000-5625-f3ef-c33f-71a209012e3c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5625-f3ef-06e2-d178c52e7bb4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5625-f3ef-9127-08fc339d0369	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5625-f3ef-565d-6262446a693c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5625-f3ef-b6d4-a794c75971f6	Pogodba-read	Pogodba - branje	f
00030000-5625-f3ef-e238-e9305028ef8d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5625-f3ef-4cfd-f005ba289ae3	Popa-read	Popa - branje	f
00030000-5625-f3ef-1b8b-caa511d51769	Popa-write	Popa - spreminjanje	f
00030000-5625-f3ef-174a-24a7d73e0871	Posta-read	Posta - branje	f
00030000-5625-f3ef-5850-a9e2856fae88	Posta-write	Posta - spreminjanje	f
00030000-5625-f3ef-244e-4d2fff860f79	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5625-f3ef-25d1-31632c5c3588	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5625-f3ef-3932-bdc3fcaa648b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5625-f3ef-297d-e5bf88078b2e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5625-f3ef-6aef-21edf2fe0d3e	PostniNaslov-read	PostniNaslov - branje	f
00030000-5625-f3ef-ae00-9929e91dce2e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5625-f3ef-3538-a2129072e681	Predstava-read	Predstava - branje	f
00030000-5625-f3ef-e239-027bff9b2d4d	Predstava-write	Predstava - spreminjanje	f
00030000-5625-f3ef-f85e-f769f5ec125b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5625-f3ef-cbe8-bdb9fd28169a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5625-f3ef-a9f1-f767dfb595ab	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5625-f3ef-4f9f-1788c033bd16	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5625-f3ef-4a9e-9e9157f3e0c4	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5625-f3ef-8781-a95419fa2025	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5625-f3ef-f611-94c9c2908378	ProgramDela-read	ProgramDela - branje	f
00030000-5625-f3ef-8388-1b82776a84f9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5625-f3ef-7900-3f5b0d134933	ProgramFestival-read	ProgramFestival - branje	f
00030000-5625-f3ef-3352-2f84dd005805	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5625-f3ef-56dd-d0a51d086926	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5625-f3ef-2245-fe1f14f1ff15	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5625-f3ef-827c-c6ad683ca93d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5625-f3ef-e4c1-c72513004f82	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5625-f3ef-3413-5d44b67914a9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5625-f3ef-f225-9d1d27bf8235	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5625-f3ef-5b7e-9fc301874f11	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5625-f3ef-3775-ca0f57bddc55	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5625-f3ef-2150-ef0a31c537d8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5625-f3ef-da98-449b447bc5ab	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5625-f3ef-50d7-57047470a10a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5625-f3ef-711c-3a2a10c09282	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5625-f3ef-d51f-88653ada4591	ProgramRazno-read	ProgramRazno - branje	f
00030000-5625-f3ef-ad2d-68a32de53050	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5625-f3ef-35c1-f72bdbcb8a61	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5625-f3ef-14a5-0afcfdf8ea78	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5625-f3ef-9b53-95f1cbd487ae	Prostor-read	Prostor - branje	f
00030000-5625-f3ef-8328-5e79e3370261	Prostor-write	Prostor - spreminjanje	f
00030000-5625-f3ef-1325-f8445531402b	Racun-read	Racun - branje	f
00030000-5625-f3ef-49f1-f35eade757c3	Racun-write	Racun - spreminjanje	f
00030000-5625-f3ef-935f-a1bf6c7a5d98	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5625-f3ef-63bf-ffe93f49126c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5625-f3ef-ef2b-5c3bca774e03	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5625-f3ef-f015-80eca3738142	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5625-f3ef-f91a-6b662d5e736c	Rekvizit-read	Rekvizit - branje	f
00030000-5625-f3ef-f647-3c23f9975ff2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5625-f3ef-8873-2ca7e3368a87	Revizija-read	Revizija - branje	f
00030000-5625-f3ef-b107-8cf0be70b321	Revizija-write	Revizija - spreminjanje	f
00030000-5625-f3ef-30a8-e52378c93d88	Rezervacija-read	Rezervacija - branje	f
00030000-5625-f3ef-6e4b-a9c399a0fa80	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5625-f3ef-f17a-b2025bf89048	SedezniRed-read	SedezniRed - branje	f
00030000-5625-f3ef-5050-d6cf5b5aa8f0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5625-f3ef-afda-4da52060575e	Sedez-read	Sedez - branje	f
00030000-5625-f3ef-7768-82af9e7037e7	Sedez-write	Sedez - spreminjanje	f
00030000-5625-f3ef-55fa-afd79b0be921	Sezona-read	Sezona - branje	f
00030000-5625-f3ef-4c6e-732e9af2b1c7	Sezona-write	Sezona - spreminjanje	f
00030000-5625-f3ef-3aec-573cd1faa115	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5625-f3ef-f6ad-6cc78ea01bfe	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5625-f3ef-5cc9-4bbda9e80119	Stevilcenje-read	Stevilcenje - branje	f
00030000-5625-f3ef-ab7c-b5e4c1d901c6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5625-f3ef-c10e-7da51e497a3b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5625-f3ef-eaf5-1755dad0e9f6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5625-f3ef-832b-8ef3957ead1b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5625-f3ef-1245-98b31de97b72	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5625-f3ef-e993-12256f26b4b9	Telefonska-read	Telefonska - branje	f
00030000-5625-f3ef-146e-6360509499aa	Telefonska-write	Telefonska - spreminjanje	f
00030000-5625-f3ef-6e8c-f0063a0f9ba2	TerminStoritve-read	TerminStoritve - branje	f
00030000-5625-f3ef-9ae4-c06805b998c3	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5625-f3ef-8f5b-aa82eaf947a2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5625-f3ef-2916-bd22a1c3412e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5625-f3ef-63bd-d1e4a9e7da38	TipPopa-read	TipPopa - branje	f
00030000-5625-f3ef-0dfe-9cfcdaac5d13	TipPopa-write	TipPopa - spreminjanje	f
00030000-5625-f3ef-b4de-4aeee13ff70e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5625-f3ef-8baa-bb0381000e66	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5625-f3ef-d448-fcd76b1531c9	TipVaje-read	TipVaje - branje	f
00030000-5625-f3ef-462a-553a63713526	TipVaje-write	TipVaje - spreminjanje	f
00030000-5625-f3ef-66ad-bc4cfed7e7ae	Trr-read	Trr - branje	f
00030000-5625-f3ef-f1da-be2732fc1b05	Trr-write	Trr - spreminjanje	f
00030000-5625-f3ef-3ae5-de901ad02bee	Uprizoritev-read	Uprizoritev - branje	f
00030000-5625-f3ef-3f4e-ef5500fc6683	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5625-f3ef-0c1f-b2c431521e99	Vaja-read	Vaja - branje	f
00030000-5625-f3ef-5278-78faf914ab54	Vaja-write	Vaja - spreminjanje	f
00030000-5625-f3ef-2770-0ffa2f3c1102	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5625-f3ef-27fd-4645dbb805cb	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5625-f3ef-c9ae-1717bc6ed572	VrstaStroska-read	VrstaStroska - branje	f
00030000-5625-f3ef-a519-4ed40c62d300	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5625-f3ef-c53f-98f990e530dd	Zaposlitev-read	Zaposlitev - branje	f
00030000-5625-f3ef-54f9-9c6cf4ab764a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5625-f3ef-31d8-27bd3ce43294	Zasedenost-read	Zasedenost - branje	f
00030000-5625-f3ef-7be1-ea451df0c974	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5625-f3ef-95b1-ff7a8e74f6a8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5625-f3ef-b913-3287594286ad	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5625-f3ef-4a0f-8146833346d5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5625-f3ef-e2e6-359fa60965da	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5625-f3ef-e007-8e86faff5ef8	Job-read	Branje opravil - samo zase - branje	f
00030000-5625-f3ef-fa82-cf3c9ea72c95	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5625-f3ef-2b64-f7905da71f6a	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5625-f3ef-375e-2be29bdf31f1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5625-f3ef-3686-d37987fc1b4c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5625-f3ef-2c23-18e3e6f7df1b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5625-f3ef-286d-1bc300cd8bf5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5625-f3ef-3f0a-811861ef438d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5625-f3ef-3d8e-b0731bef7b43	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5625-f3ef-da30-55bc5826c73f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5625-f3ef-81b4-afe1fa73309c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5625-f3ef-9a08-cdda0bba6d6d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5625-f3ef-3827-17122cc67bd9	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5625-f3ef-d7a2-91dad0d93fe1	Datoteka-write	Datoteka - spreminjanje	f
00030000-5625-f3ef-ed8b-8d6fa4c94482	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3064 (class 0 OID 22662840)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5625-f3ef-27ec-d900014b3316	00030000-5625-f3ef-67c4-f9b66b2749e3
00020000-5625-f3ef-b99e-df9a83f58dbf	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-9962-b1d900d5a9d3
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-b602-96183a2138d3
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-1d4f-b52ece3316ab
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-01e6-ff900dc22ada
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-7e14-6be1c09a792d
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-38e3-96ad863a9bbc
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-a9a8-4f14e35bc760
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-24f9-00af07a36b35
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-a5d0-a8c04fe0dee1
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-85a1-8c8328d89f95
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-1e22-e92aec75cdfe
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-172b-88f43b7b6109
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-725c-f15d0e4018ab
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-1779-bce91a2d1add
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-f000-6773760c440a
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-0ae4-4696aeb5d8e0
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-651a-cd2467ee9c3f
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-0769-056079083531
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-9c17-d888f6de6b14
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-dad2-094f5c277e72
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-2e2a-8e1827981990
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-4cfd-f005ba289ae3
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-1b8b-caa511d51769
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-174a-24a7d73e0871
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-5850-a9e2856fae88
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-6aef-21edf2fe0d3e
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-ae00-9929e91dce2e
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-3538-a2129072e681
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-e239-027bff9b2d4d
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-4a9e-9e9157f3e0c4
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-8781-a95419fa2025
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-9b53-95f1cbd487ae
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-8328-5e79e3370261
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-ef2b-5c3bca774e03
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-f015-80eca3738142
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-f91a-6b662d5e736c
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-f647-3c23f9975ff2
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-55fa-afd79b0be921
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-4c6e-732e9af2b1c7
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-8f5b-aa82eaf947a2
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-3ae5-de901ad02bee
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-3f4e-ef5500fc6683
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-0c1f-b2c431521e99
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-5278-78faf914ab54
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-31d8-27bd3ce43294
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-7be1-ea451df0c974
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-95b1-ff7a8e74f6a8
00020000-5625-f3ef-3225-9cd72563252e	00030000-5625-f3ef-4a0f-8146833346d5
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-9962-b1d900d5a9d3
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-7e14-6be1c09a792d
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-38e3-96ad863a9bbc
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-172b-88f43b7b6109
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-1779-bce91a2d1add
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-0ae4-4696aeb5d8e0
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-651a-cd2467ee9c3f
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-0769-056079083531
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-9c17-d888f6de6b14
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-dad2-094f5c277e72
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-2e2a-8e1827981990
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-4cfd-f005ba289ae3
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-174a-24a7d73e0871
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-6aef-21edf2fe0d3e
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-ae00-9929e91dce2e
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-3538-a2129072e681
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-9b53-95f1cbd487ae
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-ef2b-5c3bca774e03
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-f91a-6b662d5e736c
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-55fa-afd79b0be921
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-e993-12256f26b4b9
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-146e-6360509499aa
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-66ad-bc4cfed7e7ae
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-f1da-be2732fc1b05
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-c53f-98f990e530dd
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-54f9-9c6cf4ab764a
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-95b1-ff7a8e74f6a8
00020000-5625-f3ef-e042-42c55c9c1e27	00030000-5625-f3ef-4a0f-8146833346d5
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-9962-b1d900d5a9d3
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-1d4f-b52ece3316ab
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-7e14-6be1c09a792d
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-8d4c-2a00239b9323
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-09ad-fd895a9e2072
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-f670-2bffa235d531
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-38e3-96ad863a9bbc
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-85a1-8c8328d89f95
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-172b-88f43b7b6109
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-1779-bce91a2d1add
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-0ae4-4696aeb5d8e0
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-0769-056079083531
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-9c17-d888f6de6b14
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-dad2-094f5c277e72
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-4cfd-f005ba289ae3
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-174a-24a7d73e0871
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-3538-a2129072e681
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-4a9e-9e9157f3e0c4
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-9b53-95f1cbd487ae
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-ef2b-5c3bca774e03
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-f91a-6b662d5e736c
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-55fa-afd79b0be921
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-8f5b-aa82eaf947a2
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-0c1f-b2c431521e99
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-31d8-27bd3ce43294
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-95b1-ff7a8e74f6a8
00020000-5625-f3ef-e222-641729d2441b	00030000-5625-f3ef-4a0f-8146833346d5
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-9962-b1d900d5a9d3
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-b602-96183a2138d3
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-01e6-ff900dc22ada
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-7e14-6be1c09a792d
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-38e3-96ad863a9bbc
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-172b-88f43b7b6109
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-1779-bce91a2d1add
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-0769-056079083531
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-9c17-d888f6de6b14
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-4cfd-f005ba289ae3
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-174a-24a7d73e0871
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-3538-a2129072e681
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-9b53-95f1cbd487ae
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-ef2b-5c3bca774e03
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-f91a-6b662d5e736c
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-55fa-afd79b0be921
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-8f5b-aa82eaf947a2
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-95b1-ff7a8e74f6a8
00020000-5625-f3f0-be5c-427a51d0bfef	00030000-5625-f3ef-4a0f-8146833346d5
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-9962-b1d900d5a9d3
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-7e14-6be1c09a792d
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-38e3-96ad863a9bbc
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-172b-88f43b7b6109
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-1779-bce91a2d1add
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-0769-056079083531
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-9c17-d888f6de6b14
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-4cfd-f005ba289ae3
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-174a-24a7d73e0871
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-3538-a2129072e681
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-9b53-95f1cbd487ae
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-ef2b-5c3bca774e03
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-f91a-6b662d5e736c
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-55fa-afd79b0be921
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-6e8c-f0063a0f9ba2
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-1aab-14285835ac93
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-8f5b-aa82eaf947a2
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-95b1-ff7a8e74f6a8
00020000-5625-f3f0-287a-391c0e519b98	00030000-5625-f3ef-4a0f-8146833346d5
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-6855-2966b4e6bdb8
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-67c4-f9b66b2749e3
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1aab-14285835ac93
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-a9a8-4f14e35bc760
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-cb94-1b290f97a8ef
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-e803-8f6b78b20370
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-aace-21da7cf15438
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-9962-b1d900d5a9d3
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-b602-96183a2138d3
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1d4f-b52ece3316ab
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-01e6-ff900dc22ada
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-7e14-6be1c09a792d
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8d4c-2a00239b9323
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-09ad-fd895a9e2072
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-5123-16b3ec1efa1a
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f670-2bffa235d531
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-823b-3188065909a7
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-38e3-96ad863a9bbc
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-24f9-00af07a36b35
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-b0a6-b4ef380fdb30
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-a5d0-a8c04fe0dee1
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-aa74-4932e40dbf25
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-7419-65b3746c6a60
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4b3f-06ddf22cc696
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-0aa1-47aa14fa4de0
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-85a1-8c8328d89f95
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1e22-e92aec75cdfe
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-172b-88f43b7b6109
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-725c-f15d0e4018ab
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1779-bce91a2d1add
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f000-6773760c440a
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-0ae4-4696aeb5d8e0
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-651a-cd2467ee9c3f
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-c212-f14dec32b250
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-23dc-fb55eff33428
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-a5f0-071572d77a6d
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4712-e8b0147d3351
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-0769-056079083531
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-291c-0fdbdfb5d556
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-9c17-d888f6de6b14
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-626b-7406b9534c68
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-dad2-094f5c277e72
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-2e2a-8e1827981990
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-c33f-71a209012e3c
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-06e2-d178c52e7bb4
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-9127-08fc339d0369
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-565d-6262446a693c
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-b6d4-a794c75971f6
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-e238-e9305028ef8d
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4cfd-f005ba289ae3
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1b8b-caa511d51769
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-174a-24a7d73e0871
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-5850-a9e2856fae88
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-244e-4d2fff860f79
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-25d1-31632c5c3588
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3932-bdc3fcaa648b
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-297d-e5bf88078b2e
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-6aef-21edf2fe0d3e
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-ae00-9929e91dce2e
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3538-a2129072e681
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-e239-027bff9b2d4d
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f85e-f769f5ec125b
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-cbe8-bdb9fd28169a
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-a9f1-f767dfb595ab
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4f9f-1788c033bd16
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4a9e-9e9157f3e0c4
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8781-a95419fa2025
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f611-94c9c2908378
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8388-1b82776a84f9
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-7900-3f5b0d134933
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3352-2f84dd005805
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-56dd-d0a51d086926
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-2245-fe1f14f1ff15
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-827c-c6ad683ca93d
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-e4c1-c72513004f82
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3413-5d44b67914a9
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f225-9d1d27bf8235
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-5b7e-9fc301874f11
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3775-ca0f57bddc55
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-2150-ef0a31c537d8
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-da98-449b447bc5ab
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-50d7-57047470a10a
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-711c-3a2a10c09282
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-d51f-88653ada4591
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-ad2d-68a32de53050
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-35c1-f72bdbcb8a61
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-14a5-0afcfdf8ea78
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-9b53-95f1cbd487ae
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8328-5e79e3370261
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1325-f8445531402b
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-49f1-f35eade757c3
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-935f-a1bf6c7a5d98
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-63bf-ffe93f49126c
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-ef2b-5c3bca774e03
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f015-80eca3738142
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f91a-6b662d5e736c
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f647-3c23f9975ff2
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8873-2ca7e3368a87
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-b107-8cf0be70b321
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-30a8-e52378c93d88
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-6e4b-a9c399a0fa80
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f17a-b2025bf89048
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-5050-d6cf5b5aa8f0
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-afda-4da52060575e
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-7768-82af9e7037e7
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-55fa-afd79b0be921
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4c6e-732e9af2b1c7
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3aec-573cd1faa115
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f6ad-6cc78ea01bfe
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-5cc9-4bbda9e80119
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-ab7c-b5e4c1d901c6
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-c10e-7da51e497a3b
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-eaf5-1755dad0e9f6
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-832b-8ef3957ead1b
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-1245-98b31de97b72
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-e993-12256f26b4b9
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-146e-6360509499aa
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-6e8c-f0063a0f9ba2
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-9ae4-c06805b998c3
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8f5b-aa82eaf947a2
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-2916-bd22a1c3412e
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-b4de-4aeee13ff70e
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-8baa-bb0381000e66
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-66ad-bc4cfed7e7ae
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-f1da-be2732fc1b05
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3ae5-de901ad02bee
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-3f4e-ef5500fc6683
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-0c1f-b2c431521e99
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-5278-78faf914ab54
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-2770-0ffa2f3c1102
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-27fd-4645dbb805cb
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-c9ae-1717bc6ed572
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-a519-4ed40c62d300
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-c53f-98f990e530dd
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-54f9-9c6cf4ab764a
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-31d8-27bd3ce43294
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-7be1-ea451df0c974
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-95b1-ff7a8e74f6a8
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-b913-3287594286ad
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-4a0f-8146833346d5
00020000-5625-f3f1-c7f8-c50f4f848a7c	00030000-5625-f3ef-e2e6-359fa60965da
\.


--
-- TOC entry 3098 (class 0 OID 22663215)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 22663249)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 22663386)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5625-f3f1-ec94-eb08deb1156d	00090000-5625-f3f1-7424-c80e6f512719	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5625-f3f1-c84e-017d04195399	00090000-5625-f3f1-d0a2-f01df4ca8ae1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5625-f3f1-3eab-02281b70ffa4	00090000-5625-f3f1-80e8-61ce1e265864	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5625-f3f1-d0ec-3e0adfc0ee6d	00090000-5625-f3f1-512c-1dd4dc295b72	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3070 (class 0 OID 22662910)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5625-f3f1-f4ba-36c95972ff6e	\N	00040000-5625-f3ef-8b1f-d311c8b11137	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-34c3-9561ae6af9ad	\N	00040000-5625-f3ef-8b1f-d311c8b11137	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5625-f3f1-5574-cd150f3dad51	\N	00040000-5625-f3ef-8b1f-d311c8b11137	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-d09d-0f232ed8d7eb	\N	00040000-5625-f3ef-8b1f-d311c8b11137	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-7491-0a2b33b90359	\N	00040000-5625-f3ef-8b1f-d311c8b11137	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-0e25-7b9922917dbd	\N	00040000-5625-f3ef-8529-f7e77cd00e96	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-00db-1f1ca92e31ad	\N	00040000-5625-f3ef-20ce-e04d3e2eefef	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-a2b4-b6d69517fe80	\N	00040000-5625-f3ef-50c8-08e5b1e7ea6e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f1-c986-c95f3273da5b	\N	00040000-5625-f3ef-6bb4-997175e914da	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-f3f3-f51c-cf0db3fba1ef	\N	00040000-5625-f3ef-8b1f-d311c8b11137	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3073 (class 0 OID 22662956)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5625-f3ef-54d0-3a373f712121	8341	Adlešiči
00050000-5625-f3ef-dbb2-3acc5951bd67	5270	Ajdovščina
00050000-5625-f3ef-f916-a36cd9c99448	6280	Ankaran/Ancarano
00050000-5625-f3ef-b032-fa17ea1b896e	9253	Apače
00050000-5625-f3ef-275a-d7233051934d	8253	Artiče
00050000-5625-f3ef-b289-075d1fd576c5	4275	Begunje na Gorenjskem
00050000-5625-f3ef-ae73-aaf8e9d1b388	1382	Begunje pri Cerknici
00050000-5625-f3ef-5063-8626bfbd53fb	9231	Beltinci
00050000-5625-f3ef-fff8-1efea1eccda4	2234	Benedikt
00050000-5625-f3ef-5e6e-d81f9a5b8b7c	2345	Bistrica ob Dravi
00050000-5625-f3ef-f620-470b9acd9bff	3256	Bistrica ob Sotli
00050000-5625-f3ef-764e-5d2e5f4b6cdf	8259	Bizeljsko
00050000-5625-f3ef-347c-3a6316520af4	1223	Blagovica
00050000-5625-f3ef-6bbf-301c27f609fc	8283	Blanca
00050000-5625-f3ef-9877-365d28187f22	4260	Bled
00050000-5625-f3ef-89e8-c1eaae57d4b3	4273	Blejska Dobrava
00050000-5625-f3ef-75fd-5797992e206d	9265	Bodonci
00050000-5625-f3ef-2786-efa1e714a559	9222	Bogojina
00050000-5625-f3ef-69ec-7bc5570d92a9	4263	Bohinjska Bela
00050000-5625-f3ef-635e-84d53507849b	4264	Bohinjska Bistrica
00050000-5625-f3ef-3180-c8df30899d8d	4265	Bohinjsko jezero
00050000-5625-f3ef-5ad2-ef8bb4f2df9f	1353	Borovnica
00050000-5625-f3ef-8981-eda18064efb2	8294	Boštanj
00050000-5625-f3ef-83cc-a10b3a6c4d63	5230	Bovec
00050000-5625-f3ef-cf3a-f3033ef902bf	5295	Branik
00050000-5625-f3ef-f40c-0b0fcd410038	3314	Braslovče
00050000-5625-f3ef-b2ce-8258448fadac	5223	Breginj
00050000-5625-f3ef-a66c-6600cd11f761	8280	Brestanica
00050000-5625-f3ef-334d-288f8c4432e1	2354	Bresternica
00050000-5625-f3ef-9bc5-e63fd053d971	4243	Brezje
00050000-5625-f3ef-762f-b696b94bcd61	1351	Brezovica pri Ljubljani
00050000-5625-f3ef-50d8-457aec05c9e7	8250	Brežice
00050000-5625-f3ef-c828-35b92c1c5d95	4210	Brnik - Aerodrom
00050000-5625-f3ef-d4fb-ccc4e35875f1	8321	Brusnice
00050000-5625-f3ef-f156-c41c39e45eac	3255	Buče
00050000-5625-f3ef-de91-97ed9d4c1777	8276	Bučka 
00050000-5625-f3ef-17b7-5867dd9d6571	9261	Cankova
00050000-5625-f3ef-1402-e4b0b0137230	3000	Celje 
00050000-5625-f3ef-f323-fb4ff54a93ac	3001	Celje - poštni predali
00050000-5625-f3ef-84b2-3b248ffe365a	4207	Cerklje na Gorenjskem
00050000-5625-f3ef-c36f-c7682173a433	8263	Cerklje ob Krki
00050000-5625-f3ef-3926-965606034491	1380	Cerknica
00050000-5625-f3ef-2ea9-7840d1b7987b	5282	Cerkno
00050000-5625-f3ef-d828-97c2c3473fdd	2236	Cerkvenjak
00050000-5625-f3ef-b35e-464791d97196	2215	Ceršak
00050000-5625-f3ef-df81-bf8d2c711d81	2326	Cirkovce
00050000-5625-f3ef-2b4d-31e20bce019f	2282	Cirkulane
00050000-5625-f3ef-5546-615c4fce863f	5273	Col
00050000-5625-f3ef-61ce-535f95a28833	8251	Čatež ob Savi
00050000-5625-f3ef-edec-5d46e1ca6642	1413	Čemšenik
00050000-5625-f3ef-0ce8-79946c65eee1	5253	Čepovan
00050000-5625-f3ef-3315-6a3844938233	9232	Črenšovci
00050000-5625-f3ef-a33c-595d727ebf8f	2393	Črna na Koroškem
00050000-5625-f3ef-08cf-eca65f60b07f	6275	Črni Kal
00050000-5625-f3ef-3942-7e417fe18ec1	5274	Črni Vrh nad Idrijo
00050000-5625-f3ef-b4ed-4c30948a7927	5262	Črniče
00050000-5625-f3ef-860d-ce0ed84af3d2	8340	Črnomelj
00050000-5625-f3ef-54ea-6d6b64cf60be	6271	Dekani
00050000-5625-f3ef-ff3e-9e2f6495b8aa	5210	Deskle
00050000-5625-f3ef-a3e4-bc65d4b033c2	2253	Destrnik
00050000-5625-f3ef-96db-9f397c636fa1	6215	Divača
00050000-5625-f3ef-016e-b4b4480a1bed	1233	Dob
00050000-5625-f3ef-1864-874bc8a66ad5	3224	Dobje pri Planini
00050000-5625-f3ef-25e3-20c9060210b7	8257	Dobova
00050000-5625-f3ef-1ebd-1c92a9d5c626	1423	Dobovec
00050000-5625-f3ef-e556-bf9bddbc304e	5263	Dobravlje
00050000-5625-f3ef-67d0-83db99a71c20	3204	Dobrna
00050000-5625-f3ef-ee4d-3fc36f16a9f1	8211	Dobrnič
00050000-5625-f3ef-4ee4-89796129b944	1356	Dobrova
00050000-5625-f3ef-abf9-aec0326291ac	9223	Dobrovnik/Dobronak 
00050000-5625-f3ef-311f-25d5511fec75	5212	Dobrovo v Brdih
00050000-5625-f3ef-31ef-880e6c558d31	1431	Dol pri Hrastniku
00050000-5625-f3ef-eb91-7606290acf1b	1262	Dol pri Ljubljani
00050000-5625-f3ef-bdfc-741603840538	1273	Dole pri Litiji
00050000-5625-f3ef-50d3-366d5f5e2025	1331	Dolenja vas
00050000-5625-f3ef-cc93-2013bfa53939	8350	Dolenjske Toplice
00050000-5625-f3ef-dcc6-5c5d4330d556	1230	Domžale
00050000-5625-f3ef-2e13-ec4e6e139967	2252	Dornava
00050000-5625-f3ef-4d4f-bc45f5cfb270	5294	Dornberk
00050000-5625-f3ef-5f00-a2f3c3a3f298	1319	Draga
00050000-5625-f3ef-bfda-31f6fded04eb	8343	Dragatuš
00050000-5625-f3ef-d91b-756e07660a77	3222	Dramlje
00050000-5625-f3ef-0dd4-af91a80265f3	2370	Dravograd
00050000-5625-f3ef-d40f-6ad41ef39ede	4203	Duplje
00050000-5625-f3ef-35f8-872f16ad48ab	6221	Dutovlje
00050000-5625-f3ef-6b8d-954e3beb1e17	8361	Dvor
00050000-5625-f3ef-2655-dc4199a4d71a	2343	Fala
00050000-5625-f3ef-8958-7c2b2eb40a5d	9208	Fokovci
00050000-5625-f3ef-36ce-5261bb295f7a	2313	Fram
00050000-5625-f3ef-55de-8c7f98f330d1	3213	Frankolovo
00050000-5625-f3ef-faf4-19987d4ee9ce	1274	Gabrovka
00050000-5625-f3ef-a5c3-f63b2f314761	8254	Globoko
00050000-5625-f3ef-838e-f575d08c3582	5275	Godovič
00050000-5625-f3ef-5759-550365044fa3	4204	Golnik
00050000-5625-f3ef-5f28-3ee569e71946	3303	Gomilsko
00050000-5625-f3ef-6d16-442ce5ffa5cb	4224	Gorenja vas
00050000-5625-f3ef-9e89-7efdb0f7c981	3263	Gorica pri Slivnici
00050000-5625-f3ef-7f3e-f21a2c84598a	2272	Gorišnica
00050000-5625-f3ef-fd60-06993c3e60dd	9250	Gornja Radgona
00050000-5625-f3ef-5aa4-fb7ca5b595ce	3342	Gornji Grad
00050000-5625-f3ef-65c1-9081ed3bbbfe	4282	Gozd Martuljek
00050000-5625-f3ef-c890-bdd9af736305	6272	Gračišče
00050000-5625-f3ef-4549-a4e991228aa0	9264	Grad
00050000-5625-f3ef-5be8-11fc6cc75c13	8332	Gradac
00050000-5625-f3ef-90c5-31ac0f5388c4	1384	Grahovo
00050000-5625-f3ef-efd3-114271fc9287	5242	Grahovo ob Bači
00050000-5625-f3ef-b70b-5a4f89da4c82	5251	Grgar
00050000-5625-f3ef-84c7-026cbb3ad59a	3302	Griže
00050000-5625-f3ef-d0b5-a3a52557614a	3231	Grobelno
00050000-5625-f3ef-14cc-691ff8ba5fcc	1290	Grosuplje
00050000-5625-f3ef-eb71-46555d1454c2	2288	Hajdina
00050000-5625-f3ef-ff98-39232ae28c02	8362	Hinje
00050000-5625-f3ef-7264-d2b54655c9f1	2311	Hoče
00050000-5625-f3ef-248b-6c70a1ba5010	9205	Hodoš/Hodos
00050000-5625-f3ef-e786-9b3287f5a1cf	1354	Horjul
00050000-5625-f3ef-21ca-74757ca241ec	1372	Hotedršica
00050000-5625-f3ef-0f76-3bdc6316c0cb	1430	Hrastnik
00050000-5625-f3ef-69de-9d7775fda4a6	6225	Hruševje
00050000-5625-f3ef-ea3d-a40bf09cb6f0	4276	Hrušica
00050000-5625-f3ef-f1c5-46c1f4ceee0f	5280	Idrija
00050000-5625-f3ef-9fe5-58f0ebf1629c	1292	Ig
00050000-5625-f3ef-a104-8cf646b9b4fa	6250	Ilirska Bistrica
00050000-5625-f3ef-30a3-719eacfce090	6251	Ilirska Bistrica-Trnovo
00050000-5625-f3ef-dfa4-5da62f8b3613	1295	Ivančna Gorica
00050000-5625-f3ef-c5af-91ebfa3af62f	2259	Ivanjkovci
00050000-5625-f3ef-3ca2-f999fc81e31f	1411	Izlake
00050000-5625-f3ef-7a4c-8fa83775f2f1	6310	Izola/Isola
00050000-5625-f3ef-0232-8e4bed1f1c01	2222	Jakobski Dol
00050000-5625-f3ef-1f81-405515d151d7	2221	Jarenina
00050000-5625-f3ef-2b34-d6bc9bdb1a00	6254	Jelšane
00050000-5625-f3ef-eec9-f934e87e3b25	4270	Jesenice
00050000-5625-f3ef-ea80-7f29ca4e742d	8261	Jesenice na Dolenjskem
00050000-5625-f3ef-59a7-388b733a413e	3273	Jurklošter
00050000-5625-f3ef-34b0-0ef733d1867e	2223	Jurovski Dol
00050000-5625-f3ef-0bc2-8b2396615679	2256	Juršinci
00050000-5625-f3ef-97cb-95766e86ac1d	5214	Kal nad Kanalom
00050000-5625-f3ef-8e6a-dd23caca465d	3233	Kalobje
00050000-5625-f3ef-1538-fd50096c08c4	4246	Kamna Gorica
00050000-5625-f3ef-84c7-b1ecd096c189	2351	Kamnica
00050000-5625-f3ef-3220-4c01e5d75d5a	1241	Kamnik
00050000-5625-f3ef-c4fc-ebfbe8239699	5213	Kanal
00050000-5625-f3ef-4c9a-4f1270452347	8258	Kapele
00050000-5625-f3ef-b4d0-4dfdbd3f7b89	2362	Kapla
00050000-5625-f3ef-5e94-48d2163b9ebe	2325	Kidričevo
00050000-5625-f3ef-8a00-155005e38b2a	1412	Kisovec
00050000-5625-f3ef-4546-75a19a761c90	6253	Knežak
00050000-5625-f3ef-e3b0-212111dbc856	5222	Kobarid
00050000-5625-f3ef-d86a-08597bb4c25f	9227	Kobilje
00050000-5625-f3ef-49cb-5797df7422b5	1330	Kočevje
00050000-5625-f3ef-fb1c-c1b3347ef95b	1338	Kočevska Reka
00050000-5625-f3ef-9ed6-5b370ca5f72b	2276	Kog
00050000-5625-f3ef-66ac-45c665de9ab2	5211	Kojsko
00050000-5625-f3ef-8037-01988461ce56	6223	Komen
00050000-5625-f3ef-e4d2-8e3980eb7c15	1218	Komenda
00050000-5625-f3ef-97db-73660acf0598	6000	Koper/Capodistria 
00050000-5625-f3ef-7deb-09d817bb764d	6001	Koper/Capodistria - poštni predali
00050000-5625-f3ef-570e-631c50b1c95b	8282	Koprivnica
00050000-5625-f3ef-b170-df62832895a1	5296	Kostanjevica na Krasu
00050000-5625-f3ef-2337-c5550984edaa	8311	Kostanjevica na Krki
00050000-5625-f3ef-96df-2f1dff080afe	1336	Kostel
00050000-5625-f3ef-8eed-5c485c870c93	6256	Košana
00050000-5625-f3ef-a6ac-05e60a9a1daf	2394	Kotlje
00050000-5625-f3ef-67ef-4a7cb17c0089	6240	Kozina
00050000-5625-f3ef-d904-ea9ec5dfb5d3	3260	Kozje
00050000-5625-f3ef-8eee-f7393e2e778f	4000	Kranj 
00050000-5625-f3ef-b5da-90eb8d1b0e07	4001	Kranj - poštni predali
00050000-5625-f3ef-b22c-df24707f5eb6	4280	Kranjska Gora
00050000-5625-f3ef-ea66-106bca188ebf	1281	Kresnice
00050000-5625-f3ef-6332-80f86554cd62	4294	Križe
00050000-5625-f3ef-b256-888164fbf3ad	9206	Križevci
00050000-5625-f3ef-f2aa-03f483056063	9242	Križevci pri Ljutomeru
00050000-5625-f3ef-856c-2f57e408bf54	1301	Krka
00050000-5625-f3ef-2167-04565e763057	8296	Krmelj
00050000-5625-f3ef-ec32-925fe0d5c7bf	4245	Kropa
00050000-5625-f3ef-e516-52f5805768b7	8262	Krška vas
00050000-5625-f3ef-0b31-5478c8aeb1a0	8270	Krško
00050000-5625-f3ef-868b-246b418e7946	9263	Kuzma
00050000-5625-f3ef-2c7c-61971ebf6e1e	2318	Laporje
00050000-5625-f3ef-102e-5548f0f75fa2	3270	Laško
00050000-5625-f3ef-7ec3-9bbc6af4e19f	1219	Laze v Tuhinju
00050000-5625-f3ef-f57b-34d19084a2d9	2230	Lenart v Slovenskih goricah
00050000-5625-f3ef-33b2-d6b450a8a2b2	9220	Lendava/Lendva
00050000-5625-f3ef-7bdd-c0e190dad7fe	4248	Lesce
00050000-5625-f3ef-7776-451135cb3210	3261	Lesično
00050000-5625-f3ef-0212-8965ee7886e7	8273	Leskovec pri Krškem
00050000-5625-f3ef-3f0e-f4fac4bd8810	2372	Libeliče
00050000-5625-f3ef-f30c-f2b82ffcbe2e	2341	Limbuš
00050000-5625-f3ef-f6ed-8cc64f579539	1270	Litija
00050000-5625-f3ef-53df-d4966588ba59	3202	Ljubečna
00050000-5625-f3ef-2b15-06c7ba5f0153	1000	Ljubljana 
00050000-5625-f3ef-7e58-801cdef57a2f	1001	Ljubljana - poštni predali
00050000-5625-f3ef-d790-b37f2bdb4ee7	1231	Ljubljana - Črnuče
00050000-5625-f3ef-8fe5-a6f90745ec5a	1261	Ljubljana - Dobrunje
00050000-5625-f3ef-a733-bc9312182d1c	1260	Ljubljana - Polje
00050000-5625-f3ef-0d60-032a544df4c3	1210	Ljubljana - Šentvid
00050000-5625-f3ef-0d05-7cc2716f14b3	1211	Ljubljana - Šmartno
00050000-5625-f3ef-d536-a2e167833266	3333	Ljubno ob Savinji
00050000-5625-f3ef-32c8-5cd7a3888140	9240	Ljutomer
00050000-5625-f3ef-e609-b38c0ac40676	3215	Loče
00050000-5625-f3ef-307b-88459ce0bd9d	5231	Log pod Mangartom
00050000-5625-f3ef-dfcd-cbd6cb906ab7	1358	Log pri Brezovici
00050000-5625-f3ef-09ab-f64ccf9bbecf	1370	Logatec
00050000-5625-f3ef-04c8-9fe6fa9ef04b	1371	Logatec
00050000-5625-f3ef-9e15-05775cf5036b	1434	Loka pri Zidanem Mostu
00050000-5625-f3ef-f3b4-4a08a92ec9eb	3223	Loka pri Žusmu
00050000-5625-f3ef-5af1-aa907ec8b1e1	6219	Lokev
00050000-5625-f3ef-27b6-34d7618e7663	1318	Loški Potok
00050000-5625-f3ef-b853-7aad54e847dd	2324	Lovrenc na Dravskem polju
00050000-5625-f3ef-4533-50b6be95a9db	2344	Lovrenc na Pohorju
00050000-5625-f3ef-4699-a96860fa70a2	3334	Luče
00050000-5625-f3ef-4845-8284148499bf	1225	Lukovica
00050000-5625-f3ef-1fe4-f5a0bf297470	9202	Mačkovci
00050000-5625-f3ef-eee2-2a1adeba1a74	2322	Majšperk
00050000-5625-f3ef-6b86-30908df4f1d7	2321	Makole
00050000-5625-f3ef-a35d-0021f7aa0e47	9243	Mala Nedelja
00050000-5625-f3ef-d77c-f0381e838ab3	2229	Malečnik
00050000-5625-f3ef-5f0f-26244dbaa5f5	6273	Marezige
00050000-5625-f3ef-80b6-6958b9fdba83	2000	Maribor 
00050000-5625-f3ef-e412-438d969e68f3	2001	Maribor - poštni predali
00050000-5625-f3ef-330e-8a33ffa86e36	2206	Marjeta na Dravskem polju
00050000-5625-f3ef-cc63-a8a79abde273	2281	Markovci
00050000-5625-f3ef-0ec1-cd976bb3975f	9221	Martjanci
00050000-5625-f3ef-1a9b-3d36ce05fa3d	6242	Materija
00050000-5625-f3ef-d046-42991f7e0cfb	4211	Mavčiče
00050000-5625-f3ef-5fb0-6b268e69fcf9	1215	Medvode
00050000-5625-f3ef-3ba3-ba020184161a	1234	Mengeš
00050000-5625-f3ef-bb31-6cc3237a0076	8330	Metlika
00050000-5625-f3ef-31dc-4ee49b4aebc3	2392	Mežica
00050000-5625-f3ef-1bf3-23685427ee4f	2204	Miklavž na Dravskem polju
00050000-5625-f3ef-344b-49287237043e	2275	Miklavž pri Ormožu
00050000-5625-f3ef-6ff1-114d1635cfdd	5291	Miren
00050000-5625-f3ef-5943-aaaf774c42ad	8233	Mirna
00050000-5625-f3ef-2eab-371d49a27734	8216	Mirna Peč
00050000-5625-f3ef-228a-6584711074a5	2382	Mislinja
00050000-5625-f3ef-98a9-9fe298725dc1	4281	Mojstrana
00050000-5625-f3ef-98e9-5637b113e2c9	8230	Mokronog
00050000-5625-f3ef-f539-65cb34e3d045	1251	Moravče
00050000-5625-f3ef-9223-52b873139443	9226	Moravske Toplice
00050000-5625-f3ef-b519-b517c4d20e19	5216	Most na Soči
00050000-5625-f3ef-7fef-226335ddc35c	1221	Motnik
00050000-5625-f3ef-56ed-6bc8e98dbccd	3330	Mozirje
00050000-5625-f3ef-8d80-1609f93e6c6f	9000	Murska Sobota 
00050000-5625-f3ef-8769-e0af1cdcf337	9001	Murska Sobota - poštni predali
00050000-5625-f3ef-5de2-dc1900ccd457	2366	Muta
00050000-5625-f3ef-2870-fb3bd2bde38a	4202	Naklo
00050000-5625-f3ef-e759-e5cb5eb7839f	3331	Nazarje
00050000-5625-f3ef-57a7-b903131b8408	1357	Notranje Gorice
00050000-5625-f3ef-73f2-fb572b28540f	3203	Nova Cerkev
00050000-5625-f3ef-153f-7b8d2e160351	5000	Nova Gorica 
00050000-5625-f3ef-85d8-8d3d39f47f10	5001	Nova Gorica - poštni predali
00050000-5625-f3ef-09ff-46311b68b370	1385	Nova vas
00050000-5625-f3ef-66a4-bcf286bf520e	8000	Novo mesto
00050000-5625-f3ef-bf32-d47b8b61c3ca	8001	Novo mesto - poštni predali
00050000-5625-f3ef-1597-8e3af5b4142c	6243	Obrov
00050000-5625-f3ef-c5e1-c2d5ebf1d0d2	9233	Odranci
00050000-5625-f3ef-02cb-e4ef2ec10b8f	2317	Oplotnica
00050000-5625-f3ef-cf83-680da8445ec3	2312	Orehova vas
00050000-5625-f3ef-8e36-7fb59492545c	2270	Ormož
00050000-5625-f3ef-c27e-87b6e0c93b6b	1316	Ortnek
00050000-5625-f3ef-4a90-38f563509393	1337	Osilnica
00050000-5625-f3ef-17ba-971aee03c46e	8222	Otočec
00050000-5625-f3ef-c1ec-9270009a1791	2361	Ožbalt
00050000-5625-f3ef-b298-92c36d30caaa	2231	Pernica
00050000-5625-f3ef-51df-3318c046a205	2211	Pesnica pri Mariboru
00050000-5625-f3ef-86f6-181794f9d414	9203	Petrovci
00050000-5625-f3ef-3ac0-0492066113a7	3301	Petrovče
00050000-5625-f3ef-3fd4-205183ac0f67	6330	Piran/Pirano
00050000-5625-f3ef-5544-9cc34bf79afa	8255	Pišece
00050000-5625-f3ef-6aea-317ab28bc5fd	6257	Pivka
00050000-5625-f3ef-8eb1-e3951b1c0fe1	6232	Planina
00050000-5625-f3ef-6d2e-22bfbc3961f7	3225	Planina pri Sevnici
00050000-5625-f3ef-7e0f-bd833da5868d	6276	Pobegi
00050000-5625-f3ef-7f5c-a260db24416c	8312	Podbočje
00050000-5625-f3ef-6335-a157b6cd4f84	5243	Podbrdo
00050000-5625-f3ef-ed89-b54817055ce2	3254	Podčetrtek
00050000-5625-f3ef-b6cd-1ce694602177	2273	Podgorci
00050000-5625-f3ef-cd5f-4c2baaeb0976	6216	Podgorje
00050000-5625-f3ef-d3e6-7b012c7d3a4f	2381	Podgorje pri Slovenj Gradcu
00050000-5625-f3ef-c587-feeaecad7e7c	6244	Podgrad
00050000-5625-f3ef-3585-783053310d38	1414	Podkum
00050000-5625-f3ef-ee82-2dd558674562	2286	Podlehnik
00050000-5625-f3ef-f2b4-0edb2bdcbae2	5272	Podnanos
00050000-5625-f3ef-e553-e530f59561ff	4244	Podnart
00050000-5625-f3ef-e0e5-55dc7379c4ea	3241	Podplat
00050000-5625-f3ef-5acb-edf9da841786	3257	Podsreda
00050000-5625-f3ef-0611-e1cb4e1d8262	2363	Podvelka
00050000-5625-f3ef-0e82-3f4b229daeaa	2208	Pohorje
00050000-5625-f3ef-3a82-ba491eb94467	2257	Polenšak
00050000-5625-f3ef-f708-2e2fe0ea3e57	1355	Polhov Gradec
00050000-5625-f3ef-aa1e-009406431c36	4223	Poljane nad Škofjo Loko
00050000-5625-f3ef-1e69-027f1640ebfd	2319	Poljčane
00050000-5625-f3ef-66e5-a3293d96ec0a	1272	Polšnik
00050000-5625-f3ef-7eba-5923c12c15a9	3313	Polzela
00050000-5625-f3ef-5f3d-ebf1e1f7075d	3232	Ponikva
00050000-5625-f3ef-ccbf-1da5032247f7	6320	Portorož/Portorose
00050000-5625-f3ef-7396-f3a69c35e4af	6230	Postojna
00050000-5625-f3ef-00d6-a5fd646bc348	2331	Pragersko
00050000-5625-f3ef-0b58-bfa0fb25f019	3312	Prebold
00050000-5625-f3ef-4a76-f7726fb06a96	4205	Preddvor
00050000-5625-f3ef-b226-495adc32a3db	6255	Prem
00050000-5625-f3ef-e661-7ff19221a018	1352	Preserje
00050000-5625-f3ef-ec59-497fb10bd190	6258	Prestranek
00050000-5625-f3ef-4fef-77db7379eba2	2391	Prevalje
00050000-5625-f3ef-d909-79b04d597a0a	3262	Prevorje
00050000-5625-f3ef-dc53-d89f5e841c5a	1276	Primskovo 
00050000-5625-f3ef-36ed-0300f5436044	3253	Pristava pri Mestinju
00050000-5625-f3ef-4382-c3b3a35abbbe	9207	Prosenjakovci/Partosfalva
00050000-5625-f3ef-3d0b-d87fd3784331	5297	Prvačina
00050000-5625-f3ef-fc0e-d2f5f168bc8d	2250	Ptuj
00050000-5625-f3ef-54ed-04f3c972761c	2323	Ptujska Gora
00050000-5625-f3ef-c6b4-9d38e6c8750d	9201	Puconci
00050000-5625-f3ef-a04b-a73f9d7a4f08	2327	Rače
00050000-5625-f3ef-17e5-eb5a588ba788	1433	Radeče
00050000-5625-f3ef-24df-735ac760159e	9252	Radenci
00050000-5625-f3ef-17c0-4ada79dc77fe	2360	Radlje ob Dravi
00050000-5625-f3ef-5371-713b29055e6e	1235	Radomlje
00050000-5625-f3ef-77dc-a83260139792	4240	Radovljica
00050000-5625-f3ef-60e8-6559a93ba4c9	8274	Raka
00050000-5625-f3ef-2362-d26e0859995e	1381	Rakek
00050000-5625-f3ef-ddbe-5dd2e4ce5864	4283	Rateče - Planica
00050000-5625-f3ef-72b4-208648d9c672	2390	Ravne na Koroškem
00050000-5625-f3ef-3060-a6f5c4c7c4be	9246	Razkrižje
00050000-5625-f3ef-f221-726b67c79175	3332	Rečica ob Savinji
00050000-5625-f3ef-717f-48069b3e1a69	5292	Renče
00050000-5625-f3ef-09bb-be3c493d3655	1310	Ribnica
00050000-5625-f3ef-c95d-0130e947e8a6	2364	Ribnica na Pohorju
00050000-5625-f3ef-5883-70dc292dc6d9	3272	Rimske Toplice
00050000-5625-f3ef-2477-07bc20a10b57	1314	Rob
00050000-5625-f3ef-41c3-29f62c7798d3	5215	Ročinj
00050000-5625-f3ef-3387-617c0ebf2828	3250	Rogaška Slatina
00050000-5625-f3ef-4fd0-a091474c2265	9262	Rogašovci
00050000-5625-f3ef-7f2d-d13a9fbc9e30	3252	Rogatec
00050000-5625-f3ef-96c3-8cdd256acbe6	1373	Rovte
00050000-5625-f3ef-1d19-7eb9aca61546	2342	Ruše
00050000-5625-f3ef-84e4-e2601dc1c138	1282	Sava
00050000-5625-f3ef-369a-5f809c916802	6333	Sečovlje/Sicciole
00050000-5625-f3ef-1605-624503d4159a	4227	Selca
00050000-5625-f3ef-ef1f-4a10cc09f7ba	2352	Selnica ob Dravi
00050000-5625-f3ef-6ce9-6b6c591b568c	8333	Semič
00050000-5625-f3ef-b76a-674b247a9d19	8281	Senovo
00050000-5625-f3ef-9a47-a68e7c0e4081	6224	Senožeče
00050000-5625-f3ef-53b1-ab8362561a61	8290	Sevnica
00050000-5625-f3ef-8736-d4b4240d390b	6210	Sežana
00050000-5625-f3ef-ad18-947942a8082c	2214	Sladki Vrh
00050000-5625-f3ef-9624-b1e10ccd0cab	5283	Slap ob Idrijci
00050000-5625-f3ef-61d4-29215220fe41	2380	Slovenj Gradec
00050000-5625-f3ef-6621-11fea641a780	2310	Slovenska Bistrica
00050000-5625-f3ef-0ce5-f975e67b613c	3210	Slovenske Konjice
00050000-5625-f3ef-f1c1-3221b3575b90	1216	Smlednik
00050000-5625-f3ef-7f54-0b2b1ad32c29	5232	Soča
00050000-5625-f3ef-2517-dbff1c3c820a	1317	Sodražica
00050000-5625-f3ef-5658-a7f068a7eaa3	3335	Solčava
00050000-5625-f3ef-5d36-e941f5040128	5250	Solkan
00050000-5625-f3ef-af45-1c8b9a654995	4229	Sorica
00050000-5625-f3ef-1737-d71f79884246	4225	Sovodenj
00050000-5625-f3ef-67c1-7e5918c394ea	5281	Spodnja Idrija
00050000-5625-f3ef-ba51-d872af61969e	2241	Spodnji Duplek
00050000-5625-f3ef-7c84-ef4d0d613ba6	9245	Spodnji Ivanjci
00050000-5625-f3ef-f55c-197440fe0711	2277	Središče ob Dravi
00050000-5625-f3ef-0dfd-6fefe8a3f7b0	4267	Srednja vas v Bohinju
00050000-5625-f3ef-915e-6a5def32a93c	8256	Sromlje 
00050000-5625-f3ef-9bd8-7c619e4ac6a2	5224	Srpenica
00050000-5625-f3ef-a551-2d3316c519a3	1242	Stahovica
00050000-5625-f3ef-7466-7542b0d5f23d	1332	Stara Cerkev
00050000-5625-f3ef-da72-ee5c9286b5bd	8342	Stari trg ob Kolpi
00050000-5625-f3ef-47bb-c29f5fe5b0e9	1386	Stari trg pri Ložu
00050000-5625-f3ef-2b5e-922740870bb5	2205	Starše
00050000-5625-f3ef-8e6f-e888930d6e4b	2289	Stoperce
00050000-5625-f3ef-d42c-1f72f6cd7cab	8322	Stopiče
00050000-5625-f3ef-028e-e7cc022d0158	3206	Stranice
00050000-5625-f3ef-f52a-478f42f764d1	8351	Straža
00050000-5625-f3ef-963c-ecd6717cbde3	1313	Struge
00050000-5625-f3ef-8e4f-970dfdf09e4a	8293	Studenec
00050000-5625-f3ef-af8a-b1fa5aed7c4e	8331	Suhor
00050000-5625-f3ef-d557-cc807921d1c2	2233	Sv. Ana v Slovenskih goricah
00050000-5625-f3ef-e4fb-4fe4daac3c14	2235	Sv. Trojica v Slovenskih goricah
00050000-5625-f3ef-9b47-a6bb5bd4dbf7	2353	Sveti Duh na Ostrem Vrhu
00050000-5625-f3ef-3660-2e04f64c41c3	9244	Sveti Jurij ob Ščavnici
00050000-5625-f3ef-ffc1-779e0a140bd2	3264	Sveti Štefan
00050000-5625-f3ef-5822-cf668f3bc3f1	2258	Sveti Tomaž
00050000-5625-f3ef-a7d4-0628b05ef383	9204	Šalovci
00050000-5625-f3ef-cae8-3c99f4aa681c	5261	Šempas
00050000-5625-f3ef-4348-dfb1d2d230ba	5290	Šempeter pri Gorici
00050000-5625-f3ef-0ac2-d8e68e36b2ac	3311	Šempeter v Savinjski dolini
00050000-5625-f3ef-1bee-9dc3b87497c8	4208	Šenčur
00050000-5625-f3ef-78ce-264b6ad225f4	2212	Šentilj v Slovenskih goricah
00050000-5625-f3ef-4178-67db7eed78f3	8297	Šentjanž
00050000-5625-f3ef-2da4-2abb7f0a0b3e	2373	Šentjanž pri Dravogradu
00050000-5625-f3ef-cb94-b5b320183811	8310	Šentjernej
00050000-5625-f3ef-81d6-3c04a74cf8b3	3230	Šentjur
00050000-5625-f3ef-2ddb-a65d9dd435cd	3271	Šentrupert
00050000-5625-f3ef-0427-8d35dbefdb76	8232	Šentrupert
00050000-5625-f3ef-291e-97eab36f827e	1296	Šentvid pri Stični
00050000-5625-f3ef-d9e7-cb97fd844961	8275	Škocjan
00050000-5625-f3ef-ab16-c23e1984c57e	6281	Škofije
00050000-5625-f3ef-62a1-b8a14d179cc1	4220	Škofja Loka
00050000-5625-f3ef-6550-2b0070f5725c	3211	Škofja vas
00050000-5625-f3ef-8edb-a93e393ff40e	1291	Škofljica
00050000-5625-f3ef-8841-026f3f888feb	6274	Šmarje
00050000-5625-f3ef-384b-b56b0c985474	1293	Šmarje - Sap
00050000-5625-f3ef-1a5a-9dc899ac3193	3240	Šmarje pri Jelšah
00050000-5625-f3ef-1cf3-e94dcd2f5bc7	8220	Šmarješke Toplice
00050000-5625-f3ef-d194-7f82fde92bbc	2315	Šmartno na Pohorju
00050000-5625-f3ef-ab09-6c397cc1710a	3341	Šmartno ob Dreti
00050000-5625-f3ef-a44b-64796f3d000f	3327	Šmartno ob Paki
00050000-5625-f3ef-08e7-827d068b3b91	1275	Šmartno pri Litiji
00050000-5625-f3ef-1710-6c5c5a6d52eb	2383	Šmartno pri Slovenj Gradcu
00050000-5625-f3ef-f260-fe31fc78b918	3201	Šmartno v Rožni dolini
00050000-5625-f3ef-f886-919c1879773e	3325	Šoštanj
00050000-5625-f3ef-717c-bff1881506fb	6222	Štanjel
00050000-5625-f3ef-2d81-4807fb3db3a1	3220	Štore
00050000-5625-f3ef-7480-37115038ca60	3304	Tabor
00050000-5625-f3ef-b414-81b4a1a8659d	3221	Teharje
00050000-5625-f3ef-a829-006af76a475f	9251	Tišina
00050000-5625-f3ef-7b3d-513003632184	5220	Tolmin
00050000-5625-f3ef-2ee2-78ccd070897e	3326	Topolšica
00050000-5625-f3ef-55db-a53bdc5c5ef9	2371	Trbonje
00050000-5625-f3ef-d1bc-2844da2a4f9f	1420	Trbovlje
00050000-5625-f3ef-859f-899f5cdc8833	8231	Trebelno 
00050000-5625-f3ef-b31e-eb7c8ebf1f1f	8210	Trebnje
00050000-5625-f3ef-2df5-25d606ff688d	5252	Trnovo pri Gorici
00050000-5625-f3ef-4910-0949d143a8ed	2254	Trnovska vas
00050000-5625-f3ef-fcd6-94bd5233b892	1222	Trojane
00050000-5625-f3ef-4296-a511d1072b12	1236	Trzin
00050000-5625-f3ef-7b9e-2db39fa806e8	4290	Tržič
00050000-5625-f3ef-5dec-fda94b463084	8295	Tržišče
00050000-5625-f3ef-153d-7bc0fd34df7d	1311	Turjak
00050000-5625-f3ef-daaa-1e6aee5f2e25	9224	Turnišče
00050000-5625-f3ef-21d7-9d0006e3ee07	8323	Uršna sela
00050000-5625-f3ef-148c-195532ca7844	1252	Vače
00050000-5625-f3ef-8242-f1817a23a65c	3320	Velenje 
00050000-5625-f3ef-0d2e-ba222afded7e	3322	Velenje - poštni predali
00050000-5625-f3ef-6053-359da6b11681	8212	Velika Loka
00050000-5625-f3ef-8749-2fd5c58723d6	2274	Velika Nedelja
00050000-5625-f3ef-56b1-544022c317f9	9225	Velika Polana
00050000-5625-f3ef-ffea-6a3dd1c137c7	1315	Velike Lašče
00050000-5625-f3ef-d49b-7ef98c5013e0	8213	Veliki Gaber
00050000-5625-f3ef-da0a-38f7b8c8fc91	9241	Veržej
00050000-5625-f3ef-7de9-2f998aded805	1312	Videm - Dobrepolje
00050000-5625-f3ef-2cbe-3c6c7ee43d87	2284	Videm pri Ptuju
00050000-5625-f3ef-7e8d-635ff56f355e	8344	Vinica
00050000-5625-f3ef-1c50-8369a796098d	5271	Vipava
00050000-5625-f3ef-00db-4cc7d5d71a54	4212	Visoko
00050000-5625-f3ef-3cbb-55aff42df2c4	1294	Višnja Gora
00050000-5625-f3ef-c6f7-d0eb3b9532fe	3205	Vitanje
00050000-5625-f3ef-3a62-57c44d997dd9	2255	Vitomarci
00050000-5625-f3ef-bd3a-5a09c0e5f205	1217	Vodice
00050000-5625-f3ef-8950-f61b7a1be6c8	3212	Vojnik\t
00050000-5625-f3ef-5ae9-eec1e4fcd744	5293	Volčja Draga
00050000-5625-f3ef-0bdb-6c8984880c61	2232	Voličina
00050000-5625-f3ef-707e-dc28682ec54d	3305	Vransko
00050000-5625-f3ef-7447-62da42700766	6217	Vremski Britof
00050000-5625-f3ef-331e-bb7352a91c9e	1360	Vrhnika
00050000-5625-f3ef-7bb3-537d058d8b3d	2365	Vuhred
00050000-5625-f3ef-0d7a-1ea7b3d6c55a	2367	Vuzenica
00050000-5625-f3ef-e57c-53bcbd4947d1	8292	Zabukovje 
00050000-5625-f3ef-90a8-b7d4def9cf96	1410	Zagorje ob Savi
00050000-5625-f3ef-86ae-c94d9807b4ba	1303	Zagradec
00050000-5625-f3ef-38a7-6fa8039da63a	2283	Zavrč
00050000-5625-f3ef-c80c-6b0709d9cf22	8272	Zdole 
00050000-5625-f3ef-24ce-37d942cfc103	4201	Zgornja Besnica
00050000-5625-f3ef-7145-5e550bd03528	2242	Zgornja Korena
00050000-5625-f3ef-4b24-0dccedaef8c9	2201	Zgornja Kungota
00050000-5625-f3ef-61d6-9c215055c58f	2316	Zgornja Ložnica
00050000-5625-f3ef-8582-b20f4005b65e	2314	Zgornja Polskava
00050000-5625-f3ef-01b4-2525358c4a36	2213	Zgornja Velka
00050000-5625-f3ef-b329-926c668986d6	4247	Zgornje Gorje
00050000-5625-f3ef-633c-c799871c62c7	4206	Zgornje Jezersko
00050000-5625-f3ef-a17f-c40e57fff328	2285	Zgornji Leskovec
00050000-5625-f3ef-8a03-b1ed6a2908de	1432	Zidani Most
00050000-5625-f3ef-1799-f068f8a902ee	3214	Zreče
00050000-5625-f3ef-d184-c98bc45d710e	4209	Žabnica
00050000-5625-f3ef-b55d-7eac5f45b434	3310	Žalec
00050000-5625-f3ef-3198-ec0348d0db55	4228	Železniki
00050000-5625-f3ef-c96c-d22d5087c225	2287	Žetale
00050000-5625-f3ef-4091-9cca85bce86e	4226	Žiri
00050000-5625-f3ef-567d-42601b09c9b3	4274	Žirovnica
00050000-5625-f3ef-a31a-11daf2d9a9d5	8360	Žužemberk
\.


--
-- TOC entry 3121 (class 0 OID 22663597)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 22663189)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22662941)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5625-f3f1-b98f-48df3bd62cf5	00080000-5625-f3f1-f4ba-36c95972ff6e	\N	00040000-5625-f3ef-8b1f-d311c8b11137	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5625-f3f1-f6e1-75d5fd8c90a7	00080000-5625-f3f1-f4ba-36c95972ff6e	\N	00040000-5625-f3ef-8b1f-d311c8b11137	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5625-f3f1-b8e6-a761a0fdce30	00080000-5625-f3f1-34c3-9561ae6af9ad	\N	00040000-5625-f3ef-8b1f-d311c8b11137	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3084 (class 0 OID 22663085)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 22663045)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 22663057)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 22663201)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 22663611)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 22663621)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5625-f3f1-6d2a-94b9bb954193	00080000-5625-f3f1-5574-cd150f3dad51	0987	AK
00190000-5625-f3f1-fcb3-d12dc477bb0c	00080000-5625-f3f1-34c3-9561ae6af9ad	0989	AK
00190000-5625-f3f1-b99f-4bbf3b589b57	00080000-5625-f3f1-d09d-0f232ed8d7eb	0986	AK
00190000-5625-f3f1-3e0e-0d7fffe250fc	00080000-5625-f3f1-0e25-7b9922917dbd	0984	AK
00190000-5625-f3f1-524e-02d39246c808	00080000-5625-f3f1-00db-1f1ca92e31ad	0983	AK
00190000-5625-f3f1-1178-56783d8d2272	00080000-5625-f3f1-a2b4-b6d69517fe80	0982	AK
00190000-5625-f3f3-83bd-cbf3f038b20b	00080000-5625-f3f3-f51c-cf0db3fba1ef	1001	AK
\.


--
-- TOC entry 3120 (class 0 OID 22663536)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5625-f3f1-e408-4dcb98ad2c28	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3124 (class 0 OID 22663629)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22663230)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5625-f3f1-baef-b49fb3d168ed	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5625-f3f1-1301-b5a58e45f0b8	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5625-f3f1-8cfe-168677557d08	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5625-f3f1-52ae-30db6bc85f32	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5625-f3f1-14d0-8a64b31f791e	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5625-f3f1-a151-94978330f8e2	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5625-f3f1-aa46-6503d97c629d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3092 (class 0 OID 22663174)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22663164)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 22663375)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22663305)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22663019)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 22662792)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5625-f3f3-f51c-cf0db3fba1ef	00010000-5625-f3f0-06ce-f33322e93cdf	2015-10-20 09:57:39	INS	a:0:{}
2	App\\Entity\\Option	00000000-5625-f3f3-9341-72ce2bc96bb9	00010000-5625-f3f0-06ce-f33322e93cdf	2015-10-20 09:57:39	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5625-f3f3-83bd-cbf3f038b20b	00010000-5625-f3f0-06ce-f33322e93cdf	2015-10-20 09:57:39	INS	a:0:{}
\.


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3101 (class 0 OID 22663243)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22662830)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5625-f3ef-27ec-d900014b3316	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5625-f3ef-b99e-df9a83f58dbf	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5625-f3ef-ae14-15182988113b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5625-f3ef-5841-2a3317d02952	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5625-f3ef-3225-9cd72563252e	planer	Planer dogodkov v koledarju	t
00020000-5625-f3ef-e042-42c55c9c1e27	kadrovska	Kadrovska služba	t
00020000-5625-f3ef-e222-641729d2441b	arhivar	Ažuriranje arhivalij	t
00020000-5625-f3f0-be5c-427a51d0bfef	igralec	Igralec	t
00020000-5625-f3f0-287a-391c0e519b98	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5625-f3f1-c7f8-c50f4f848a7c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3061 (class 0 OID 22662814)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5625-f3f0-87ba-f10a4b1ee9af	00020000-5625-f3ef-ae14-15182988113b
00010000-5625-f3f0-06ce-f33322e93cdf	00020000-5625-f3ef-ae14-15182988113b
00010000-5625-f3f1-a2ad-40f27e0b7779	00020000-5625-f3f1-c7f8-c50f4f848a7c
\.


--
-- TOC entry 3103 (class 0 OID 22663257)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22663195)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 22663141)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5625-f3f1-b0d5-a32313ee8f05	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5625-f3f1-73d2-2e0e6db3c9d6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5625-f3f1-2e09-1e07f40c2236	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3057 (class 0 OID 22662779)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5625-f3ef-7194-84f6e9389791	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5625-f3ef-3f1e-d6c224d6894f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5625-f3ef-e932-8559705f230c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5625-f3ef-0671-4176fc904229	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5625-f3ef-9008-b72761519307	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3056 (class 0 OID 22662771)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5625-f3ef-d850-c86c1e988075	00230000-5625-f3ef-0671-4176fc904229	popa
00240000-5625-f3ef-5e0b-773593ba8acc	00230000-5625-f3ef-0671-4176fc904229	oseba
00240000-5625-f3ef-d203-1a85eecf7576	00230000-5625-f3ef-0671-4176fc904229	tippopa
00240000-5625-f3ef-90f2-036c3e9d3bff	00230000-5625-f3ef-0671-4176fc904229	organizacijskaenota
00240000-5625-f3ef-2329-50c7e579f606	00230000-5625-f3ef-0671-4176fc904229	sezona
00240000-5625-f3ef-02bf-bf7b508f098a	00230000-5625-f3ef-0671-4176fc904229	tipvaje
00240000-5625-f3ef-c032-7a60c82beecb	00230000-5625-f3ef-3f1e-d6c224d6894f	prostor
00240000-5625-f3ef-d2e2-715b034ea180	00230000-5625-f3ef-0671-4176fc904229	besedilo
00240000-5625-f3ef-d99c-abe90defd93b	00230000-5625-f3ef-0671-4176fc904229	uprizoritev
00240000-5625-f3ef-39fd-08ac0f75cb68	00230000-5625-f3ef-0671-4176fc904229	funkcija
00240000-5625-f3ef-8c95-ee44e8dea117	00230000-5625-f3ef-0671-4176fc904229	tipfunkcije
00240000-5625-f3ef-f721-cea79aa4ac42	00230000-5625-f3ef-0671-4176fc904229	alternacija
00240000-5625-f3ef-8087-e82e4c6c1d1a	00230000-5625-f3ef-7194-84f6e9389791	pogodba
00240000-5625-f3ef-ed2a-3e5386025b9e	00230000-5625-f3ef-0671-4176fc904229	zaposlitev
00240000-5625-f3ef-711f-2380d1492c89	00230000-5625-f3ef-0671-4176fc904229	zvrstuprizoritve
00240000-5625-f3ef-3d7d-d57c9c37c461	00230000-5625-f3ef-7194-84f6e9389791	programdela
00240000-5625-f3ef-ad01-fd4a826ea220	00230000-5625-f3ef-0671-4176fc904229	zapis
\.


--
-- TOC entry 3055 (class 0 OID 22662766)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
81284a0e-7008-4825-8506-eda97e5b2046	00240000-5625-f3ef-d850-c86c1e988075	0	1001
\.


--
-- TOC entry 3109 (class 0 OID 22663322)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5625-f3f1-83c4-d426aee5af63	000e0000-5625-f3f1-5e93-c1dbb083074c	00080000-5625-f3f1-f4ba-36c95972ff6e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5625-f3ef-6688-799cfd315202
00270000-5625-f3f1-d4a4-fad843a354b1	000e0000-5625-f3f1-5e93-c1dbb083074c	00080000-5625-f3f1-f4ba-36c95972ff6e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5625-f3ef-6688-799cfd315202
\.


--
-- TOC entry 3069 (class 0 OID 22662902)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22663151)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5625-f3f1-a0ed-9cc654add709	00180000-5625-f3f1-3fe8-5f6e2035d9e7	000c0000-5625-f3f1-ed67-ed095ebff461	00090000-5625-f3f1-7424-c80e6f512719	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-f3f1-c88a-a622c41f1dfd	00180000-5625-f3f1-3fe8-5f6e2035d9e7	000c0000-5625-f3f1-4ad3-a5b2241d90db	00090000-5625-f3f1-512c-1dd4dc295b72	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-f3f1-1905-bc586e9256ba	00180000-5625-f3f1-3fe8-5f6e2035d9e7	000c0000-5625-f3f1-09c4-75f3593b33a0	00090000-5625-f3f1-abfd-7ea854035bab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-f3f1-20d0-42af94163c6f	00180000-5625-f3f1-3fe8-5f6e2035d9e7	000c0000-5625-f3f1-921c-5efe30a2dbf9	00090000-5625-f3f1-f3a3-4853e69c140a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-f3f1-99ba-84ecf340df61	00180000-5625-f3f1-3fe8-5f6e2035d9e7	000c0000-5625-f3f1-49a2-1523b1ef95de	00090000-5625-f3f1-8dcd-cbd9d3a293c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-f3f1-c9a5-135f3ebf51a4	00180000-5625-f3f1-a83c-32a723f7e56d	\N	00090000-5625-f3f1-8dcd-cbd9d3a293c5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5625-f3f1-7cc3-f09a8ffdef38	00180000-5625-f3f1-a83c-32a723f7e56d	\N	00090000-5625-f3f1-512c-1dd4dc295b72	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3112 (class 0 OID 22663363)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5625-f3ef-cbf2-320cf682b7a5	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5625-f3ef-4ec6-e82406889db6	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5625-f3ef-f83d-473327b67da4	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5625-f3ef-7896-4bcc85aacffb	04	Režija	Režija	Režija	umetnik	30
000f0000-5625-f3ef-4cfd-8e395ce0c3d0	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5625-f3ef-767e-1ae36cef9bfa	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5625-f3ef-fd65-b40e9cd0fad2	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5625-f3ef-6b7b-aeae31f661d4	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5625-f3ef-a3b3-573231696f3c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5625-f3ef-bdd0-df9a4bcbfbc5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5625-f3ef-8efa-d84605a51c93	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5625-f3ef-dd5a-7fb1e290c199	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5625-f3ef-96d5-fd45868b5d1e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5625-f3ef-e670-7311db61b3c3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5625-f3ef-96c9-f137b19bfa5d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5625-f3ef-5d4b-634e3c657214	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5625-f3ef-c3c9-e0006db10a4f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5625-f3ef-714c-599fa6ce551a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3066 (class 0 OID 22662856)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5625-f3f1-2455-57e5aab79a95	0001	šola	osnovna ali srednja šola
00400000-5625-f3f1-ba5c-b1c721672f28	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5625-f3f1-1e8e-a0b48f905b73	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3125 (class 0 OID 22663640)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5625-f3ef-192f-d09bf5ec3824	01	Velika predstava	f	1.00	1.00
002b0000-5625-f3ef-5c4d-08bf10f86b1d	02	Mala predstava	f	0.50	0.50
002b0000-5625-f3ef-6117-45894f3541ff	03	Mala koprodukcija	t	0.40	1.00
002b0000-5625-f3ef-e940-53862cc25021	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5625-f3ef-6084-8302bd30bc2f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3088 (class 0 OID 22663131)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5625-f3ef-f572-23844b6cdcb8	0001	prva vaja	prva vaja
00420000-5625-f3ef-1196-68d828f64021	0002	tehnična vaja	tehnična vaja
00420000-5625-f3ef-5b7a-c3daa0e260c3	0003	lučna vaja	lučna vaja
00420000-5625-f3ef-16cb-a0e9a270a011	0004	kostumska vaja	kostumska vaja
00420000-5625-f3ef-72b1-f3af9eab19f9	0005	foto vaja	foto vaja
00420000-5625-f3ef-33bb-e2fa08b6a189	0006	1. glavna vaja	1. glavna vaja
00420000-5625-f3ef-20b1-788a2e4925b9	0007	2. glavna vaja	2. glavna vaja
00420000-5625-f3ef-8cab-eb115a0c41fb	0008	1. generalka	1. generalka
00420000-5625-f3ef-b13d-2bc01a508f75	0009	2. generalka	2. generalka
00420000-5625-f3ef-bf95-f3575067e8ee	0010	odprta generalka	odprta generalka
00420000-5625-f3ef-b3ed-258c293a56ae	0011	obnovitvena vaja	obnovitvena vaja
00420000-5625-f3ef-f1fd-312e266e7744	0012	pevska vaja	pevska vaja
00420000-5625-f3ef-a173-d3d17e736709	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5625-f3ef-fd3e-c09dbc170448	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3075 (class 0 OID 22662976)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 22662801)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5625-f3f0-06ce-f33322e93cdf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROt5a.g2ecooSRD2Nrg66IRjRKRCDC3v6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-4ab2-5dfc8f8dd138	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-226c-a6692830e8bc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-b6ba-c1b5aeb26ba0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-9f60-c4e9c0e43d42	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-8fe9-0720a762127b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-c603-c0c2a47752ff	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-ff9e-58974cb7ea80	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-61bd-da1737e6126e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-1b77-f15e60cbe342	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5625-f3f1-a2ad-40f27e0b7779	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5625-f3f0-87ba-f10a4b1ee9af	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3116 (class 0 OID 22663413)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5625-f3f1-be16-447f22b8e988	00160000-5625-f3f1-e31e-e70226530607	\N	00140000-5625-f3ef-9e55-e0c31713ce8e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5625-f3f1-14d0-8a64b31f791e
000e0000-5625-f3f1-5e93-c1dbb083074c	00160000-5625-f3f1-79fd-7aa7a9a4a529	\N	00140000-5625-f3ef-4061-0732083c011b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5625-f3f1-a151-94978330f8e2
000e0000-5625-f3f1-8003-4b7511ffc391	\N	\N	00140000-5625-f3ef-4061-0732083c011b	00190000-5625-f3f1-6d2a-94b9bb954193	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5625-f3f1-14d0-8a64b31f791e
000e0000-5625-f3f1-f457-c59075a22ccd	\N	\N	00140000-5625-f3ef-4061-0732083c011b	00190000-5625-f3f1-6d2a-94b9bb954193	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5625-f3f1-14d0-8a64b31f791e
000e0000-5625-f3f1-e36b-6a3a3bf7d354	\N	\N	00140000-5625-f3ef-4061-0732083c011b	00190000-5625-f3f1-6d2a-94b9bb954193	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5625-f3f1-baef-b49fb3d168ed
000e0000-5625-f3f1-290f-bf34d456a856	\N	\N	00140000-5625-f3ef-4061-0732083c011b	00190000-5625-f3f1-6d2a-94b9bb954193	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5625-f3f1-baef-b49fb3d168ed
\.


--
-- TOC entry 3083 (class 0 OID 22663075)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5625-f3f1-e29c-55b6221ef690	\N	000e0000-5625-f3f1-5e93-c1dbb083074c	1	
00200000-5625-f3f1-a329-e05b0972aab4	\N	000e0000-5625-f3f1-5e93-c1dbb083074c	2	
00200000-5625-f3f1-18e8-3b6cecd06287	\N	000e0000-5625-f3f1-5e93-c1dbb083074c	3	
00200000-5625-f3f1-d7ad-744a087abf54	\N	000e0000-5625-f3f1-5e93-c1dbb083074c	4	
00200000-5625-f3f1-a246-72ce8b2e2209	\N	000e0000-5625-f3f1-5e93-c1dbb083074c	5	
\.


--
-- TOC entry 3099 (class 0 OID 22663222)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22663336)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5625-f3ef-a58d-c027602cfa6f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5625-f3ef-2f3c-a2006b81ed00	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5625-f3ef-c3b0-24fd380612c1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5625-f3ef-238d-6ad451f42b3d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5625-f3ef-314e-cb78986abae0	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5625-f3ef-b32f-13fd68b19e0a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5625-f3ef-ac1d-52973f2fe32c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5625-f3ef-3579-c26fdd302ca6	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5625-f3ef-6688-799cfd315202	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5625-f3ef-73fb-5f77af2071eb	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5625-f3ef-d877-e5a852301859	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5625-f3ef-984c-5e4543423f37	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5625-f3ef-ac9b-76daaaa0acdc	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5625-f3ef-fc8d-b9d95b21eff9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5625-f3ef-d95f-672144a2c8e1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5625-f3ef-c42a-b9fdfdd3b13e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5625-f3ef-7314-24211478d20b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5625-f3ef-4252-d278b0211f18	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5625-f3ef-3b12-2c1167588419	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5625-f3ef-7be8-5a64a65861ef	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5625-f3ef-4193-04e54f14b74e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5625-f3ef-9b00-8b5b4c2eb04f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5625-f3ef-5065-7d30bcdbd70c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5625-f3ef-e314-275150ec2def	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5625-f3ef-e879-4785b22bae3f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5625-f3ef-588c-bfe5586b97ee	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5625-f3ef-b772-62b303885577	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5625-f3ef-d8dd-5f3c438c3f9a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3128 (class 0 OID 22663688)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 22663659)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 22663700)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22663294)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5625-f3f1-8f8d-eef21a87b516	00090000-5625-f3f1-512c-1dd4dc295b72	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-f3f1-659f-9c628828d736	00090000-5625-f3f1-abfd-7ea854035bab	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-f3f1-55b7-f9ae16d44d87	00090000-5625-f3f1-af11-8890315cfff3	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-f3f1-3553-765fbc5c76bb	00090000-5625-f3f1-d87a-02ad2c855492	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-f3f1-c1b2-5f1a109c8b7e	00090000-5625-f3f1-9b00-2cdd970802b4	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-f3f1-8363-77ccc34be8f0	00090000-5625-f3f1-4e21-c62badc7b9ae	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3086 (class 0 OID 22663120)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 22663403)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5625-f3ef-9e55-e0c31713ce8e	01	Drama	drama (SURS 01)
00140000-5625-f3ef-454a-c9db4af1fd8b	02	Opera	opera (SURS 02)
00140000-5625-f3ef-eae0-b73c573ca204	03	Balet	balet (SURS 03)
00140000-5625-f3ef-f281-fd004243659e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5625-f3ef-7bca-6ac766e4655d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5625-f3ef-4061-0732083c011b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5625-f3ef-d947-feaf863bae68	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3105 (class 0 OID 22663284)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2553 (class 2606 OID 22662855)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 22663462)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22663452)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22663319)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 22663361)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 22663740)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 22663109)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22663130)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 22663657)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 22663002)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 22663530)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 22663280)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 22663073)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 22663040)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 22663016)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22663187)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 22663717)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 22663724)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2832 (class 2606 OID 22663748)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2689 (class 2606 OID 22663214)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 22662974)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 22662874)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22662936)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22662898)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 22662844)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2544 (class 2606 OID 22662829)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 22663220)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 22663256)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 22663398)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 22662926)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 22662962)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 22663609)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22663193)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 22662952)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22663093)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 22663061)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2620 (class 2606 OID 22663053)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 22663205)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 22663618)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22663626)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 22663596)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 22663638)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 22663238)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 22663178)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 22663169)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 22663385)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 22663312)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22663028)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 22662800)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 22663247)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 22662818)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2546 (class 2606 OID 22662838)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22663265)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 22663200)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 22663149)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 22662788)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 22662776)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 22662770)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 22663332)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22662907)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 22663160)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 22663372)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 22662863)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 22663650)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 22663138)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 22662987)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 22662813)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 22663431)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22663082)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22663228)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22663344)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 22663698)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 22663681)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 22663706)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 22663302)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 22663124)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 22663411)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 22663292)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 1259 OID 22663118)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2638 (class 1259 OID 22663119)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2639 (class 1259 OID 22663117)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2640 (class 1259 OID 22663116)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2641 (class 1259 OID 22663115)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2732 (class 1259 OID 22663333)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2733 (class 1259 OID 22663334)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2734 (class 1259 OID 22663335)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 22663719)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2819 (class 1259 OID 22663718)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2571 (class 1259 OID 22662928)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2572 (class 1259 OID 22662929)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 22663221)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2805 (class 1259 OID 22663686)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2806 (class 1259 OID 22663685)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2807 (class 1259 OID 22663687)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2808 (class 1259 OID 22663684)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2809 (class 1259 OID 22663682)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2684 (class 1259 OID 22663207)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2685 (class 1259 OID 22663206)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2628 (class 1259 OID 22663083)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2629 (class 1259 OID 22663084)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2714 (class 1259 OID 22663281)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2715 (class 1259 OID 22663283)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2716 (class 1259 OID 22663282)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2603 (class 1259 OID 22663018)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2604 (class 1259 OID 22663017)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2796 (class 1259 OID 22663639)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2748 (class 1259 OID 22663400)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 22663401)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 22663402)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2815 (class 1259 OID 22663707)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2757 (class 1259 OID 22663436)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2758 (class 1259 OID 22663433)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2759 (class 1259 OID 22663437)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2760 (class 1259 OID 22663435)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2761 (class 1259 OID 22663434)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2593 (class 1259 OID 22662989)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 22662988)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2562 (class 1259 OID 22662901)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2702 (class 1259 OID 22663248)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2548 (class 1259 OID 22662845)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 22662846)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2707 (class 1259 OID 22663268)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2708 (class 1259 OID 22663267)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2709 (class 1259 OID 22663266)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2576 (class 1259 OID 22662939)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2577 (class 1259 OID 22662938)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2578 (class 1259 OID 22662940)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2616 (class 1259 OID 22663056)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2617 (class 1259 OID 22663054)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2618 (class 1259 OID 22663055)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2528 (class 1259 OID 22662778)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2664 (class 1259 OID 22663173)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2665 (class 1259 OID 22663171)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2666 (class 1259 OID 22663170)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2667 (class 1259 OID 22663172)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2539 (class 1259 OID 22662819)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2540 (class 1259 OID 22662820)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2693 (class 1259 OID 22663229)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2828 (class 1259 OID 22663741)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2730 (class 1259 OID 22663321)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 22663320)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2829 (class 1259 OID 22663749)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2830 (class 1259 OID 22663750)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2679 (class 1259 OID 22663194)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2724 (class 1259 OID 22663313)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2725 (class 1259 OID 22663314)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 22663535)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2779 (class 1259 OID 22663534)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2780 (class 1259 OID 22663531)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2781 (class 1259 OID 22663532)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2782 (class 1259 OID 22663533)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2582 (class 1259 OID 22662954)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2583 (class 1259 OID 22662953)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2584 (class 1259 OID 22662955)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2696 (class 1259 OID 22663242)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2697 (class 1259 OID 22663241)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2788 (class 1259 OID 22663619)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2789 (class 1259 OID 22663620)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2771 (class 1259 OID 22663466)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2772 (class 1259 OID 22663467)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2773 (class 1259 OID 22663464)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2774 (class 1259 OID 22663465)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2720 (class 1259 OID 22663303)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2721 (class 1259 OID 22663304)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2670 (class 1259 OID 22663182)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2671 (class 1259 OID 22663181)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2672 (class 1259 OID 22663179)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2673 (class 1259 OID 22663180)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2767 (class 1259 OID 22663454)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2768 (class 1259 OID 22663453)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 22663029)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2610 (class 1259 OID 22663043)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2611 (class 1259 OID 22663042)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2612 (class 1259 OID 22663041)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2613 (class 1259 OID 22663044)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2627 (class 1259 OID 22663074)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2621 (class 1259 OID 22663062)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2622 (class 1259 OID 22663063)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2785 (class 1259 OID 22663610)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2804 (class 1259 OID 22663658)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 22663725)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2823 (class 1259 OID 22663726)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2558 (class 1259 OID 22662876)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2559 (class 1259 OID 22662875)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2567 (class 1259 OID 22662908)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 22662909)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2647 (class 1259 OID 22663125)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 22663163)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 22663162)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2661 (class 1259 OID 22663161)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 22663111)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2643 (class 1259 OID 22663112)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2644 (class 1259 OID 22663110)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2645 (class 1259 OID 22663114)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2646 (class 1259 OID 22663113)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2575 (class 1259 OID 22662927)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 22662864)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 22662865)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2599 (class 1259 OID 22663003)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 22663005)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2601 (class 1259 OID 22663004)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2602 (class 1259 OID 22663006)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2678 (class 1259 OID 22663188)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2753 (class 1259 OID 22663399)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 22663432)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22663373)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 22663374)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2565 (class 1259 OID 22662899)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 22662900)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2717 (class 1259 OID 22663293)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 22662789)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 22662975)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2581 (class 1259 OID 22662937)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 22662777)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2634 (class 1259 OID 22663094)
-- Name: uniq_74950a12559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_74950a12559828a3 ON praznik USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 22663651)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 22663240)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2701 (class 1259 OID 22663239)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 22663139)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 22663140)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2775 (class 1259 OID 22663463)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 22662963)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 22663412)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 22663699)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2794 (class 1259 OID 22663627)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 22663628)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 22663362)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2658 (class 1259 OID 22663150)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 22662839)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2867 (class 2606 OID 22663921)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2868 (class 2606 OID 22663926)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2872 (class 2606 OID 22663946)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2866 (class 2606 OID 22663916)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2870 (class 2606 OID 22663936)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2871 (class 2606 OID 22663941)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2869 (class 2606 OID 22663931)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2906 (class 2606 OID 22664116)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2907 (class 2606 OID 22664121)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2908 (class 2606 OID 22664126)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2941 (class 2606 OID 22664291)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2940 (class 2606 OID 22664286)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 22663806)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2845 (class 2606 OID 22663811)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2889 (class 2606 OID 22664031)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2937 (class 2606 OID 22664271)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2936 (class 2606 OID 22664266)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2938 (class 2606 OID 22664276)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2935 (class 2606 OID 22664261)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2934 (class 2606 OID 22664256)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2888 (class 2606 OID 22664026)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2887 (class 2606 OID 22664021)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2864 (class 2606 OID 22663906)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2865 (class 2606 OID 22663911)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22664071)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 22664081)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2898 (class 2606 OID 22664076)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2855 (class 2606 OID 22663861)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 22663856)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 22664011)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 22664246)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2909 (class 2606 OID 22664131)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 22664136)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 22664141)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2939 (class 2606 OID 22664281)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2915 (class 2606 OID 22664161)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2912 (class 2606 OID 22664146)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2916 (class 2606 OID 22664166)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 22664156)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2913 (class 2606 OID 22664151)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2853 (class 2606 OID 22663851)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 22663846)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 22663791)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2840 (class 2606 OID 22663786)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 22664051)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2836 (class 2606 OID 22663766)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2837 (class 2606 OID 22663771)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2896 (class 2606 OID 22664066)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2895 (class 2606 OID 22664061)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2894 (class 2606 OID 22664056)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2847 (class 2606 OID 22663821)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2846 (class 2606 OID 22663816)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2848 (class 2606 OID 22663826)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2860 (class 2606 OID 22663886)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2858 (class 2606 OID 22663876)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 22663881)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 22663751)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2880 (class 2606 OID 22663986)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2878 (class 2606 OID 22663976)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2877 (class 2606 OID 22663971)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2879 (class 2606 OID 22663981)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2834 (class 2606 OID 22663756)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 22663761)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2890 (class 2606 OID 22664036)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2944 (class 2606 OID 22664306)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2905 (class 2606 OID 22664111)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 22664106)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2945 (class 2606 OID 22664311)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2946 (class 2606 OID 22664316)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2886 (class 2606 OID 22664016)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2902 (class 2606 OID 22664096)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2903 (class 2606 OID 22664101)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2927 (class 2606 OID 22664221)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 22664216)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 22664201)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 22664206)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2925 (class 2606 OID 22664211)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2850 (class 2606 OID 22663836)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 22663831)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2851 (class 2606 OID 22663841)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2892 (class 2606 OID 22664046)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 22664041)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 22664231)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2930 (class 2606 OID 22664236)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2921 (class 2606 OID 22664191)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2922 (class 2606 OID 22664196)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2919 (class 2606 OID 22664181)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2920 (class 2606 OID 22664186)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2900 (class 2606 OID 22664086)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 22664091)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2884 (class 2606 OID 22664006)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2883 (class 2606 OID 22664001)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2881 (class 2606 OID 22663991)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2882 (class 2606 OID 22663996)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2918 (class 2606 OID 22664176)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 22664171)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2856 (class 2606 OID 22663866)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2857 (class 2606 OID 22663871)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2863 (class 2606 OID 22663901)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 22663891)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2862 (class 2606 OID 22663896)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2928 (class 2606 OID 22664226)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2931 (class 2606 OID 22664241)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2933 (class 2606 OID 22664251)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2942 (class 2606 OID 22664296)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2943 (class 2606 OID 22664301)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2839 (class 2606 OID 22663781)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 22663776)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2842 (class 2606 OID 22663796)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 22663801)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 22663951)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2876 (class 2606 OID 22663966)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 22663961)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2874 (class 2606 OID 22663956)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-20 09:57:40 CEST

--
-- PostgreSQL database dump complete
--

