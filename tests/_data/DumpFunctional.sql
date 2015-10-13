--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-13 11:03:13 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 245 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21739034)
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
-- TOC entry 229 (class 1259 OID 21739591)
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
-- TOC entry 228 (class 1259 OID 21739574)
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
-- TOC entry 219 (class 1259 OID 21739451)
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
-- TOC entry 222 (class 1259 OID 21739481)
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
-- TOC entry 243 (class 1259 OID 21739862)
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
-- TOC entry 197 (class 1259 OID 21739242)
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
-- TOC entry 199 (class 1259 OID 21739273)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21739788)
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
-- TOC entry 190 (class 1259 OID 21739155)
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
-- TOC entry 230 (class 1259 OID 21739604)
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
-- TOC entry 215 (class 1259 OID 21739406)
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
-- TOC entry 195 (class 1259 OID 21739221)
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
-- TOC entry 193 (class 1259 OID 21739195)
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
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21739172)
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
-- TOC entry 204 (class 1259 OID 21739320)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21739843)
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
-- TOC entry 242 (class 1259 OID 21739855)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21739877)
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
-- TOC entry 170 (class 1259 OID 21729914)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21739345)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21739129)
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
-- TOC entry 182 (class 1259 OID 21739043)
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
-- TOC entry 183 (class 1259 OID 21739054)
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
-- TOC entry 178 (class 1259 OID 21739008)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21739027)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21739352)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21739386)
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
-- TOC entry 225 (class 1259 OID 21739522)
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
-- TOC entry 185 (class 1259 OID 21739087)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
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
-- TOC entry 187 (class 1259 OID 21739121)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21739733)
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
-- TOC entry 205 (class 1259 OID 21739326)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21739106)
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
-- TOC entry 194 (class 1259 OID 21739210)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 21739338)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21739747)
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
-- TOC entry 234 (class 1259 OID 21739757)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21739672)
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
-- TOC entry 235 (class 1259 OID 21739765)
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
-- TOC entry 211 (class 1259 OID 21739367)
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
-- TOC entry 203 (class 1259 OID 21739311)
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
-- TOC entry 202 (class 1259 OID 21739301)
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
-- TOC entry 224 (class 1259 OID 21739511)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21739441)
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
-- TOC entry 192 (class 1259 OID 21739184)
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
-- TOC entry 175 (class 1259 OID 21738979)
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
-- TOC entry 174 (class 1259 OID 21738977)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21739380)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21739017)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21739001)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21739394)
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
-- TOC entry 206 (class 1259 OID 21739332)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21739278)
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
-- TOC entry 173 (class 1259 OID 21738966)
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
-- TOC entry 172 (class 1259 OID 21738958)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21738953)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21739458)
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
-- TOC entry 184 (class 1259 OID 21739079)
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
-- TOC entry 201 (class 1259 OID 21739288)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 223 (class 1259 OID 21739499)
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
-- TOC entry 236 (class 1259 OID 21739776)
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
-- TOC entry 189 (class 1259 OID 21739141)
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
-- TOC entry 176 (class 1259 OID 21738988)
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
-- TOC entry 227 (class 1259 OID 21739549)
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
-- TOC entry 196 (class 1259 OID 21739232)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 210 (class 1259 OID 21739359)
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
-- TOC entry 221 (class 1259 OID 21739472)
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
-- TOC entry 239 (class 1259 OID 21739823)
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
-- TOC entry 238 (class 1259 OID 21739795)
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
-- TOC entry 240 (class 1259 OID 21739835)
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
-- TOC entry 217 (class 1259 OID 21739431)
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
    jenastopajoci boolean
);


--
-- TOC entry 198 (class 1259 OID 21739267)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21739539)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21739421)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21738982)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3006 (class 0 OID 21739034)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21739591)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561c-c8ce-af08-7e3a5acbac33	000d0000-561c-c8ce-11ce-ba551b07b27f	\N	00090000-561c-c8ce-9c36-7793868ac059	000b0000-561c-c8ce-5131-55a06a1ecd7d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561c-c8ce-5eb1-33c5a325f1de	000d0000-561c-c8ce-aed8-19c8aa8b198c	00100000-561c-c8ce-2134-9078a44c94c2	00090000-561c-c8ce-4b11-050610f558be	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561c-c8ce-4d28-78020e243698	000d0000-561c-c8ce-1f9f-af5ca0ff3220	00100000-561c-c8ce-9775-fa8984bf9761	00090000-561c-c8ce-830f-e1d445dffcc8	\N	0003	t	\N	2015-10-13	\N	2	t	\N	f	f
000c0000-561c-c8ce-6a35-6da5a6178c4c	000d0000-561c-c8ce-15dc-c325844bf0b8	\N	00090000-561c-c8ce-b406-dace54cd148e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561c-c8ce-7413-78a30b780be3	000d0000-561c-c8ce-eb00-62b35c94ad76	\N	00090000-561c-c8ce-1fa8-dff13d856fba	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561c-c8ce-8bcb-e9330af6a6fd	000d0000-561c-c8ce-611f-21068c71eeef	\N	00090000-561c-c8ce-e42d-6c45c16b1b97	000b0000-561c-c8ce-9228-d03ca213be17	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561c-c8ce-8a82-2476d1da8b06	000d0000-561c-c8ce-ef1c-0c0e455e2091	00100000-561c-c8ce-60b3-1e8f1c8b16f6	00090000-561c-c8ce-df17-ef7aa9900e88	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561c-c8ce-3ec6-29b444d6eff6	000d0000-561c-c8ce-890e-d8408d331818	\N	00090000-561c-c8ce-b45a-11970367ad4d	000b0000-561c-c8ce-82cc-631822e9b2e4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561c-c8ce-c958-40bd9ea52244	000d0000-561c-c8ce-ef1c-0c0e455e2091	00100000-561c-c8ce-52ed-9e45ed2ba64b	00090000-561c-c8ce-b61c-f3b7b5f41614	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561c-c8ce-3f60-78d2d72e13cb	000d0000-561c-c8ce-ef1c-0c0e455e2091	00100000-561c-c8ce-82c3-d9ce4d8d3be8	00090000-561c-c8ce-4d38-1f7118fdf7df	\N	0010	t	\N	2015-10-13	\N	16	f	\N	f	t
000c0000-561c-c8ce-d3dd-d8503ec8471a	000d0000-561c-c8ce-ef1c-0c0e455e2091	00100000-561c-c8ce-4c8b-a37e0aae667f	00090000-561c-c8ce-ef03-3108ab987ae8	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561c-c8ce-c344-2baf91533613	000d0000-561c-c8ce-304d-a88411e4cd74	\N	00090000-561c-c8ce-4b11-050610f558be	000b0000-561c-c8ce-4957-acae24208b6a	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3053 (class 0 OID 21739574)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 21739451)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561c-c8ce-dffa-afc18a46ee94	00160000-561c-c8ce-3a84-311d4d261dd1	00090000-561c-c8ce-3ea3-bee720fda193	aizv	10	t
003d0000-561c-c8ce-9cae-43a59ddccc21	00160000-561c-c8ce-3a84-311d4d261dd1	00090000-561c-c8ce-c164-00cb4eb493a9	apri	14	t
003d0000-561c-c8ce-ec66-6f283d3e3f08	00160000-561c-c8ce-6644-bbdc7c84a51c	00090000-561c-c8ce-d636-04abcbc7b426	aizv	11	t
003d0000-561c-c8ce-6b94-e259e7b5f6be	00160000-561c-c8ce-896f-199adbceea9b	00090000-561c-c8ce-303d-bd786ddba855	aizv	12	t
003d0000-561c-c8ce-c319-285394ab9280	00160000-561c-c8ce-3a84-311d4d261dd1	00090000-561c-c8ce-bac9-72a90df9b34c	apri	18	f
\.


--
-- TOC entry 3047 (class 0 OID 21739481)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561c-c8ce-3a84-311d4d261dd1	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561c-c8ce-6644-bbdc7c84a51c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561c-c8ce-896f-199adbceea9b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3068 (class 0 OID 21739862)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21739242)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561c-c8ce-4f2c-439a584cd1d1	\N	\N	00200000-561c-c8ce-dc1d-1af84bbb22b2	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561c-c8ce-3e3d-4a2df9242b63	\N	\N	00200000-561c-c8ce-c971-3ca7c88e32c6	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561c-c8ce-2128-db8c99a449d8	\N	\N	00200000-561c-c8ce-2f08-5ab0fb594980	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561c-c8ce-7ef8-e58811ed9314	\N	\N	00200000-561c-c8ce-7f5a-eb00448483c5	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561c-c8ce-4391-c6d560cc5928	\N	\N	00200000-561c-c8ce-d7ce-c41a5a1a62a8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3024 (class 0 OID 21739273)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 21739788)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21739155)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561c-c8cc-a261-f7c071ed5fd7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561c-c8cc-a69e-caac567051f9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561c-c8cc-3344-23bd2f74b319	AL	ALB	008	Albania 	Albanija	\N
00040000-561c-c8cc-502e-bf6229b9bd5e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561c-c8cc-ed75-2ff266609f22	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561c-c8cc-a391-693d63a87103	AD	AND	020	Andorra 	Andora	\N
00040000-561c-c8cc-d44f-d4a39c4b2ba1	AO	AGO	024	Angola 	Angola	\N
00040000-561c-c8cc-98c2-d242be965a05	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561c-c8cc-012a-1c4effa65879	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561c-c8cc-d81f-29e248f6bb1a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561c-c8cc-c468-4ea30cf2f174	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561c-c8cc-a5b0-6b15079f8f49	AM	ARM	051	Armenia 	Armenija	\N
00040000-561c-c8cc-5a42-1d43e2174253	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561c-c8cc-e0c8-dabdb5481b9e	AU	AUS	036	Australia 	Avstralija	\N
00040000-561c-c8cc-e61d-cc6e587f70d2	AT	AUT	040	Austria 	Avstrija	\N
00040000-561c-c8cc-73c5-60fb751eeb2f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561c-c8cc-98f8-73ad0dc47882	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561c-c8cc-ea4a-1dbd2f7e5112	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561c-c8cc-b82e-51af4d363bb1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561c-c8cc-18c2-272d398e49ba	BB	BRB	052	Barbados 	Barbados	\N
00040000-561c-c8cc-1822-2b4a609a4060	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561c-c8cc-6aa8-4a880fda0a9e	BE	BEL	056	Belgium 	Belgija	\N
00040000-561c-c8cc-856e-fb759cca58a5	BZ	BLZ	084	Belize 	Belize	\N
00040000-561c-c8cc-c8ef-f87d5184a0cd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561c-c8cc-3a13-a9d55fa9de0e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561c-c8cc-2ca5-96007be62ce1	BT	BTN	064	Bhutan 	Butan	\N
00040000-561c-c8cc-f667-91ac18bf21d3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561c-c8cc-9d94-aa1659c64313	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561c-c8cc-699d-3aed9324cc53	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561c-c8cc-d4bf-ba5b8a36e76a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561c-c8cc-9066-1f00006e25fc	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561c-c8cc-140c-e0496374362e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561c-c8cc-50e2-5320324aa01c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561c-c8cc-c9d3-d85361dc091a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561c-c8cc-4d21-958c8cb749eb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561c-c8cc-1526-caba5c33b0bc	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561c-c8cc-d2c0-c3ccb91c9c26	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561c-c8cc-0206-97ec83049bf8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561c-c8cc-d8a4-cd18ae749ffb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561c-c8cc-13b5-5f4f0bfa205d	CA	CAN	124	Canada 	Kanada	\N
00040000-561c-c8cc-ff02-33f2b654d55c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561c-c8cc-e386-bb47d6b19057	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561c-c8cc-395d-5b3b93c5802b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561c-c8cc-0db6-ac68f24ca468	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561c-c8cc-9039-358c3bc34c5c	CL	CHL	152	Chile 	Čile	\N
00040000-561c-c8cc-87cf-992f12574693	CN	CHN	156	China 	Kitajska	\N
00040000-561c-c8cc-02f6-c38d96e517bc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561c-c8cc-bf49-94b439857694	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561c-c8cc-9e0a-5cb2d7552243	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561c-c8cc-edbf-5610bb31dbe7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561c-c8cc-83bb-d0df80e3ff86	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561c-c8cc-b47f-3b9786a31e1b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561c-c8cc-890f-ac3778448653	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561c-c8cc-25bd-74d848d44c00	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561c-c8cc-948f-fbb08d6a5ed0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561c-c8cc-4fe1-7904f6152000	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561c-c8cc-2bb3-1a2430ce13a8	CU	CUB	192	Cuba 	Kuba	\N
00040000-561c-c8cc-2bf1-9728b1e80013	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561c-c8cc-fa54-4a72b918419f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561c-c8cc-2bb1-8bd9b367f3b6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561c-c8cc-0851-fc76a4b8d857	DK	DNK	208	Denmark 	Danska	\N
00040000-561c-c8cc-82f9-645a912e203d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561c-c8cc-65f9-54e25c5888b0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561c-c8cc-17cc-556a1884a0b3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561c-c8cc-3503-b40e13dc6d64	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561c-c8cc-5b0d-3faa7a354a93	EG	EGY	818	Egypt 	Egipt	\N
00040000-561c-c8cc-0782-11df197efff5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561c-c8cc-1a83-5b7783bdc74f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561c-c8cc-d21c-67e80b395eb6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561c-c8cc-4842-582dc7d6f626	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561c-c8cc-4a93-99920ba2853a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561c-c8cc-9a01-4fc1bbea790a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561c-c8cc-8762-59b2598a2214	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561c-c8cc-d8e0-c40f571e976e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561c-c8cc-3132-b85875c683c8	FI	FIN	246	Finland 	Finska	\N
00040000-561c-c8cc-64d3-c7ee04fcfd4e	FR	FRA	250	France 	Francija	\N
00040000-561c-c8cc-34ed-1b2e18671115	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561c-c8cc-3918-202b8106de36	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561c-c8cc-7f14-1213db19926d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561c-c8cc-dc87-5482c4c153d8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561c-c8cc-e3cf-8eab5a3b4fbb	GA	GAB	266	Gabon 	Gabon	\N
00040000-561c-c8cc-dc6f-36b4745d11f3	GM	GMB	270	Gambia 	Gambija	\N
00040000-561c-c8cc-df02-e0f7cfbd4d5d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561c-c8cc-fd1d-6e56b59ec7bb	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561c-c8cc-3f09-ee475de2576b	GH	GHA	288	Ghana 	Gana	\N
00040000-561c-c8cc-92e7-cce81e69b49c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561c-c8cc-9547-d14ecfa5cf65	GR	GRC	300	Greece 	Grčija	\N
00040000-561c-c8cc-24cb-243077ecfe0e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561c-c8cc-c247-bc708ffa40cc	GD	GRD	308	Grenada 	Grenada	\N
00040000-561c-c8cc-7ac1-63ba34442672	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561c-c8cc-a22e-38d50aab49f5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561c-c8cc-8d9a-bd90c0314df0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561c-c8cc-cb60-42e5e764a342	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561c-c8cc-7895-dc34316663a6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561c-c8cc-bcae-a24cc4b146c1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561c-c8cc-9654-d0793d9872dd	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561c-c8cc-1be7-620b794efe94	HT	HTI	332	Haiti 	Haiti	\N
00040000-561c-c8cc-d7de-fb0a6cd6f680	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561c-c8cc-fece-144f152222d4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561c-c8cc-f15f-82dd9c96fa4a	HN	HND	340	Honduras 	Honduras	\N
00040000-561c-c8cc-2dbd-2f63fb0b5eca	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561c-c8cc-715a-33944020f801	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561c-c8cc-7faf-6131c3017c71	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561c-c8cc-200f-d53eb1c3d99f	IN	IND	356	India 	Indija	\N
00040000-561c-c8cc-06d8-97e9193c1e43	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561c-c8cc-c671-729383aee6cd	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561c-c8cc-7eb7-a505ea12b680	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561c-c8cc-cd6c-10c9aa1b05d8	IE	IRL	372	Ireland 	Irska	\N
00040000-561c-c8cc-cd1a-3d3598be1ceb	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561c-c8cc-7d58-0cbbe062b8bb	IL	ISR	376	Israel 	Izrael	\N
00040000-561c-c8cc-143b-bd814052c412	IT	ITA	380	Italy 	Italija	\N
00040000-561c-c8cc-5adf-d0bd64bf816a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561c-c8cc-c182-80d019d4840c	JP	JPN	392	Japan 	Japonska	\N
00040000-561c-c8cc-38ce-38ff2fefe9ee	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561c-c8cc-8219-7137ff8de451	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561c-c8cc-70e0-a2fb20591712	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561c-c8cc-0b9b-aab28530cfe5	KE	KEN	404	Kenya 	Kenija	\N
00040000-561c-c8cc-ca2b-afbe78e8510b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561c-c8cc-3b24-709bfbcf19d0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561c-c8cc-36df-faeb72313998	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561c-c8cc-e352-36e6a07bb550	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561c-c8cc-2816-a07d540e4f3b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561c-c8cc-6975-391f595538b5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561c-c8cc-b063-5974d54d6a4d	LV	LVA	428	Latvia 	Latvija	\N
00040000-561c-c8cc-17c5-31614f5305b5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561c-c8cc-f59f-2048ceb6eb52	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561c-c8cc-c9d1-e2446182fada	LR	LBR	430	Liberia 	Liberija	\N
00040000-561c-c8cc-4ad8-e6c22194bf03	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561c-c8cc-6c4e-3fde39c024dd	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561c-c8cc-d7a0-697d65c27aa0	LT	LTU	440	Lithuania 	Litva	\N
00040000-561c-c8cc-8183-c57b181878af	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561c-c8cc-e4c8-39b1d921d3be	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561c-c8cc-6149-0c6370b3049f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561c-c8cc-9e69-befb43b89e76	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561c-c8cc-bbcf-98b8b0cb7d43	MW	MWI	454	Malawi 	Malavi	\N
00040000-561c-c8cc-fb24-8398458ac0a6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561c-c8cc-c074-f2ef1d834809	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561c-c8cc-33be-20bf79278fe1	ML	MLI	466	Mali 	Mali	\N
00040000-561c-c8cc-9de5-1cd5ef2458b4	MT	MLT	470	Malta 	Malta	\N
00040000-561c-c8cc-34c8-cedab2854afa	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561c-c8cc-62d0-2ef2839e39f9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561c-c8cc-83ee-15d39c4b31a4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561c-c8cc-d279-cd2f1d888a0f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561c-c8cc-87af-cacba20fbe19	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561c-c8cc-00b2-2d28911bf3c5	MX	MEX	484	Mexico 	Mehika	\N
00040000-561c-c8cc-5efc-e194ab6af98e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561c-c8cc-2bd3-9274ca0190e2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561c-c8cc-39a6-3f5385e1f6ba	MC	MCO	492	Monaco 	Monako	\N
00040000-561c-c8cc-dc1e-9c8e8444f1c4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561c-c8cc-5310-c99b8104f4cc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561c-c8cc-44eb-9d1aa5e59101	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561c-c8cc-8d5a-3a4709c99a4e	MA	MAR	504	Morocco 	Maroko	\N
00040000-561c-c8cc-cc4e-60957432cd7c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561c-c8cc-aeca-0d40d38016e6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561c-c8cc-e599-99fa5aec2785	NA	NAM	516	Namibia 	Namibija	\N
00040000-561c-c8cc-dd03-dc9592e57d4d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561c-c8cc-3962-729f6f015545	NP	NPL	524	Nepal 	Nepal	\N
00040000-561c-c8cc-4d18-378214a2631d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561c-c8cc-92c4-7d5570debea8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561c-c8cc-04cd-7d5f462de7eb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561c-c8cc-c177-f8a13e479d01	NE	NER	562	Niger 	Niger 	\N
00040000-561c-c8cc-f5a4-67adc07445ed	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561c-c8cc-5048-04e34c0fc3c6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561c-c8cc-6b14-7a5a4565b2a1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561c-c8cc-7cc7-add7b4017a92	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561c-c8cc-ebb0-98fcf7ea49f5	NO	NOR	578	Norway 	Norveška	\N
00040000-561c-c8cc-d032-6e5b61010933	OM	OMN	512	Oman 	Oman	\N
00040000-561c-c8cc-44dd-ae1ddb62d591	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561c-c8cc-d5d1-69554303bee5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561c-c8cc-299b-a76d7239cb4e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561c-c8cc-08da-4c47ed29c054	PA	PAN	591	Panama 	Panama	\N
00040000-561c-c8cc-b3f8-f4aa49f9f91a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561c-c8cc-4b92-e50c1636cf4d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561c-c8cc-5da5-570304182d7b	PE	PER	604	Peru 	Peru	\N
00040000-561c-c8cc-62aa-eeae4b08c3f6	PH	PHL	608	Philippines 	Filipini	\N
00040000-561c-c8cc-0b6c-e1fee82a4c66	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561c-c8cc-d3f6-5c20f6c8146c	PL	POL	616	Poland 	Poljska	\N
00040000-561c-c8cc-389b-88ff5fb95bdb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561c-c8cc-d335-9721eefa6828	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561c-c8cc-61bc-2e410bd182e7	QA	QAT	634	Qatar 	Katar	\N
00040000-561c-c8cc-5d7a-6d029a678c93	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561c-c8cc-d7a3-051d7ac77307	RO	ROU	642	Romania 	Romunija	\N
00040000-561c-c8cc-db32-d18e56fc57d1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561c-c8cc-a56e-189baaf6f0ce	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561c-c8cc-59f1-de2355ac6496	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561c-c8cc-e866-b39db353f189	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561c-c8cc-a805-7b09ebdd8233	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561c-c8cc-fcd6-4158580bc620	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561c-c8cc-9c89-881484f5c14f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561c-c8cc-2425-2cb7dfc11f2f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561c-c8cc-f2ec-ae0ba09e1eb6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561c-c8cc-5d4b-5a5aea127fca	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561c-c8cc-4977-fbf20bb17825	SM	SMR	674	San Marino 	San Marino	\N
00040000-561c-c8cc-e5b7-6610af44cdea	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561c-c8cc-42cb-b6c774455d0e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561c-c8cc-e8d6-3b215da75a4d	SN	SEN	686	Senegal 	Senegal	\N
00040000-561c-c8cc-1297-b3c6f6612716	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561c-c8cc-165b-127f5cf3dc30	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561c-c8cc-9f8e-d0483415015f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561c-c8cc-3d86-9b92a4f268d4	SG	SGP	702	Singapore 	Singapur	\N
00040000-561c-c8cc-6da6-9c862bc13080	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561c-c8cc-e7b3-07e0bd275569	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561c-c8cc-81fb-870e9ce6b62a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561c-c8cc-72d3-558fecf8407f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561c-c8cc-deab-60a981a6068f	SO	SOM	706	Somalia 	Somalija	\N
00040000-561c-c8cc-8f64-3ced38bf7302	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561c-c8cc-c9d7-5c487eaf769e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561c-c8cc-b711-48069523353a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561c-c8cc-2207-32d3e27c016c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561c-c8cc-4c93-34af40426a97	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561c-c8cc-b437-6939b94e6694	SD	SDN	729	Sudan 	Sudan	\N
00040000-561c-c8cc-3107-970eb4c5d77d	SR	SUR	740	Suriname 	Surinam	\N
00040000-561c-c8cc-d689-ba9a7928576c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561c-c8cc-3d92-6bf06e86fffe	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561c-c8cc-232f-e8d5ca276803	SE	SWE	752	Sweden 	Švedska	\N
00040000-561c-c8cc-edaa-44965cc36929	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561c-c8cc-fd7a-cfc0002e3d16	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561c-c8cc-dc86-ca4efe39f40e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561c-c8cc-56b9-370fb6155bd9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561c-c8cc-a245-6d5df51d10ba	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561c-c8cc-ca65-de44ef4b659d	TH	THA	764	Thailand 	Tajska	\N
00040000-561c-c8cc-2244-93d8b0e839c2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561c-c8cc-3922-04bab4ca9d90	TG	TGO	768	Togo 	Togo	\N
00040000-561c-c8cc-3f8f-f012960f8405	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561c-c8cc-7aaf-d9d7dd176719	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561c-c8cc-d31a-a7e73eb67545	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561c-c8cc-79e3-3e53e9f88160	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561c-c8cc-020d-31a29a1c4337	TR	TUR	792	Turkey 	Turčija	\N
00040000-561c-c8cc-e4bc-fb65acfd6645	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561c-c8cc-1259-f4a13401f4d8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561c-c8cc-6c5f-7072cb6c3056	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561c-c8cc-dae2-80a707f3c8ae	UG	UGA	800	Uganda 	Uganda	\N
00040000-561c-c8cc-d9d7-38af67b69f7d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561c-c8cc-d25c-9d020231b288	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561c-c8cc-43ef-fd292377c377	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561c-c8cc-685b-f51e7408df98	US	USA	840	United States 	Združene države Amerike	\N
00040000-561c-c8cc-d546-486a01680bea	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561c-c8cc-747b-98d392606e00	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561c-c8cc-59b7-fcacffdeacbb	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561c-c8cc-6395-0a4e4c0db79b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561c-c8cc-27d2-037966f13e36	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561c-c8cc-e7b6-99516d6d1447	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561c-c8cc-7292-cf5f9b2ea607	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561c-c8cc-0eed-877b383338c9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561c-c8cc-8f4b-60163f191845	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561c-c8cc-ee9c-015b1f4ba277	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561c-c8cc-8bb3-f47c2cbbef7b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561c-c8cc-aaf2-24e89a63dbf6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561c-c8cc-ccc6-a7d1639168eb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3055 (class 0 OID 21739604)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561c-c8ce-c1aa-2060cf7db326	000e0000-561c-c8ce-3e22-5965d9272087	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-c8cc-f129-73e8bd64ab01	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561c-c8ce-2968-8d84f9e1c111	000e0000-561c-c8ce-6a08-7c7503620b26	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-c8cc-17c5-00d7e3252b25	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561c-c8ce-c5ac-040b1b605ce9	000e0000-561c-c8ce-6af8-1a95e2638b72	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-c8cc-f129-73e8bd64ab01	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561c-c8ce-4b8d-b5793e64f689	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561c-c8ce-9cfd-c3ffca6cc546	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21739406)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561c-c8ce-11ce-ba551b07b27f	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-af08-7e3a5acbac33	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561c-c8cc-c4e8-4e582df2c75e
000d0000-561c-c8ce-aed8-19c8aa8b198c	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-5eb1-33c5a325f1de	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561c-c8cc-7465-ea8d835b3301
000d0000-561c-c8ce-1f9f-af5ca0ff3220	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-4d28-78020e243698	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561c-c8cc-91fb-db4ddbcb7aa2
000d0000-561c-c8ce-15dc-c325844bf0b8	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-6a35-6da5a6178c4c	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561c-c8cc-b89e-339347b02665
000d0000-561c-c8ce-eb00-62b35c94ad76	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-7413-78a30b780be3	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561c-c8cc-b89e-339347b02665
000d0000-561c-c8ce-611f-21068c71eeef	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-8bcb-e9330af6a6fd	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561c-c8cc-c4e8-4e582df2c75e
000d0000-561c-c8ce-ef1c-0c0e455e2091	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-c958-40bd9ea52244	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561c-c8cc-c4e8-4e582df2c75e
000d0000-561c-c8ce-890e-d8408d331818	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-3ec6-29b444d6eff6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561c-c8cc-09ee-17748dd1505b
000d0000-561c-c8ce-304d-a88411e4cd74	000e0000-561c-c8ce-6a08-7c7503620b26	000c0000-561c-c8ce-c344-2baf91533613	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561c-c8cc-d1f2-4f9100b15c70
\.


--
-- TOC entry 3020 (class 0 OID 21739221)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21739195)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21739172)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561c-c8ce-01b4-181afc65636a	00080000-561c-c8ce-1f7a-888a8ed7e6ae	00090000-561c-c8ce-4d38-1f7118fdf7df	AK		igralka
\.


--
-- TOC entry 3029 (class 0 OID 21739320)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 21739843)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 21739855)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 21739877)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 21729914)
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
\.


--
-- TOC entry 3033 (class 0 OID 21739345)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21739129)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561c-c8cd-4c21-fddfcca6d703	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561c-c8cd-7d6a-66491ad4ba54	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561c-c8cd-a4f2-6608a2a939d6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561c-c8cd-df0e-689397103649	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561c-c8cd-7d62-5f6c5a91e345	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561c-c8cd-3a98-659e46c92547	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561c-c8cd-f0dd-d6015e71124c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561c-c8cd-8e5f-d3574f1e6602	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561c-c8cd-4889-92665bf59cc7	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561c-c8cd-2694-2d58a68cb16f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561c-c8cd-1d7b-318cb0cc512d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561c-c8cd-f859-7926d2396b8e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561c-c8cd-29cd-8b2d458f3d49	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561c-c8cd-b9d7-9d9a3ecef168	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561c-c8cd-1a26-38d428661658	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561c-c8ce-fd1e-c9de3182f371	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561c-c8ce-7091-0c53edaeed72	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561c-c8ce-9771-bb640bfc9b20	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561c-c8ce-f066-e287ec7cffd7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561c-c8ce-ab54-bf9372c13718	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561c-c8cf-6899-f7723fce05c5	application.tenant.maticnopodjetje	string	s:36:"00080000-561c-c8cf-6475-ae9937ad7bf3";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3007 (class 0 OID 21739043)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561c-c8ce-163a-65b5c02b6579	00000000-561c-c8ce-fd1e-c9de3182f371	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561c-c8ce-232d-db8bca9b89ba	00000000-561c-c8ce-fd1e-c9de3182f371	00010000-561c-c8cd-b4f4-23a48b1576e4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561c-c8ce-1b12-65f511830a69	00000000-561c-c8ce-7091-0c53edaeed72	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3008 (class 0 OID 21739054)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561c-c8ce-9c36-7793868ac059	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561c-c8ce-b406-dace54cd148e	00010000-561c-c8ce-6830-71954ae6b923	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561c-c8ce-830f-e1d445dffcc8	00010000-561c-c8ce-77e3-63b2bd8d2840	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561c-c8ce-b61c-f3b7b5f41614	00010000-561c-c8ce-5c08-b92a4a3ffb46	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561c-c8ce-bbaf-3c050ef0c26e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561c-c8ce-e42d-6c45c16b1b97	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561c-c8ce-ef03-3108ab987ae8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561c-c8ce-df17-ef7aa9900e88	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561c-c8ce-4d38-1f7118fdf7df	00010000-561c-c8ce-3518-8ddc558d1d31	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561c-c8ce-4b11-050610f558be	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561c-c8ce-50eb-e79b5e156972	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561c-c8ce-1fa8-dff13d856fba	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561c-c8ce-b45a-11970367ad4d	00010000-561c-c8ce-1ba5-c53eea48f04c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561c-c8ce-3ea3-bee720fda193	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-c8ce-c164-00cb4eb493a9	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-c8ce-d636-04abcbc7b426	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-c8ce-303d-bd786ddba855	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561c-c8ce-bac9-72a90df9b34c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 21739008)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561c-c8cc-031c-e80f27118e57	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561c-c8cc-3b32-a48d9191fb6c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561c-c8cc-38b1-0f4427354e44	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561c-c8cc-8355-4cbe15fa6bda	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561c-c8cc-9dda-8871a5f04c39	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561c-c8cc-ed43-7e0391a9984c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561c-c8cc-bf89-7f7bde4f8646	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561c-c8cc-5923-e16e449853a6	Abonma-read	Abonma - branje	f
00030000-561c-c8cc-b856-1e2c7f1bb16f	Abonma-write	Abonma - spreminjanje	f
00030000-561c-c8cc-cdee-59fcb86ecb3b	Alternacija-read	Alternacija - branje	f
00030000-561c-c8cc-bd18-8d4e177b235a	Alternacija-write	Alternacija - spreminjanje	f
00030000-561c-c8cc-62d5-f40eb6c1ca9c	Arhivalija-read	Arhivalija - branje	f
00030000-561c-c8cc-e807-ea7c93a702b3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561c-c8cc-6da5-d097ead2a019	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561c-c8cc-4fbf-1adb76e0bb16	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561c-c8cc-0dd8-a1c4f60efd6d	Besedilo-read	Besedilo - branje	f
00030000-561c-c8cc-ebde-6637064a1c6c	Besedilo-write	Besedilo - spreminjanje	f
00030000-561c-c8cc-6a34-450bfe0e5c67	DogodekIzven-read	DogodekIzven - branje	f
00030000-561c-c8cc-116c-1269e96422d7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561c-c8cc-a10d-17d6b68944ab	Dogodek-read	Dogodek - branje	f
00030000-561c-c8cc-d62a-09e960dda786	Dogodek-write	Dogodek - spreminjanje	f
00030000-561c-c8cc-bcad-95271d6db7ea	DrugiVir-read	DrugiVir - branje	f
00030000-561c-c8cc-0731-fa43d017c801	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561c-c8cc-de8f-3a19d3a1e9a3	Drzava-read	Drzava - branje	f
00030000-561c-c8cc-8a8c-5cea80436c19	Drzava-write	Drzava - spreminjanje	f
00030000-561c-c8cc-765d-0e87282f66b0	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561c-c8cc-3aa9-03dade49a9b2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561c-c8cc-f00f-068e1494becb	Funkcija-read	Funkcija - branje	f
00030000-561c-c8cc-f5f9-12d829924500	Funkcija-write	Funkcija - spreminjanje	f
00030000-561c-c8cc-1fc8-7f294713c315	Gostovanje-read	Gostovanje - branje	f
00030000-561c-c8cc-436d-1202d3dd0fa0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561c-c8cc-4e47-9425f75e53d0	Gostujoca-read	Gostujoca - branje	f
00030000-561c-c8cc-5a28-eb3e7de36e40	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561c-c8cc-cdd4-c8f26ccdf335	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561c-c8cc-5506-bd2e3b9655d4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561c-c8cc-55e3-d9a6a8988f37	Kupec-read	Kupec - branje	f
00030000-561c-c8cc-ebe3-4740d163c628	Kupec-write	Kupec - spreminjanje	f
00030000-561c-c8cc-1fbd-f0baf5da0e6c	NacinPlacina-read	NacinPlacina - branje	f
00030000-561c-c8cc-e567-03ba3cdd3579	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561c-c8cc-f2a2-e0492e976599	Option-read	Option - branje	f
00030000-561c-c8cc-b7df-dc50d800b6ec	Option-write	Option - spreminjanje	f
00030000-561c-c8cc-7d79-69245751b7b8	OptionValue-read	OptionValue - branje	f
00030000-561c-c8cc-b35e-d04ae4e50a43	OptionValue-write	OptionValue - spreminjanje	f
00030000-561c-c8cc-9d11-47378889789e	Oseba-read	Oseba - branje	f
00030000-561c-c8cc-348b-9e3b0f39a195	Oseba-write	Oseba - spreminjanje	f
00030000-561c-c8cc-eda2-69eba67224ff	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561c-c8cc-928e-b8fbbacf1405	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561c-c8cc-3dbc-a9c75a4e0bb6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561c-c8cc-6294-d5dd2750fd51	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561c-c8cc-3294-e9ece0df621b	Pogodba-read	Pogodba - branje	f
00030000-561c-c8cc-22ae-96ffd4efbd04	Pogodba-write	Pogodba - spreminjanje	f
00030000-561c-c8cc-8c6c-b4c97f9f92b4	Popa-read	Popa - branje	f
00030000-561c-c8cc-be75-6f04c1369471	Popa-write	Popa - spreminjanje	f
00030000-561c-c8cc-4d95-e7da26562ddf	Posta-read	Posta - branje	f
00030000-561c-c8cc-6e8c-ffdd43983274	Posta-write	Posta - spreminjanje	f
00030000-561c-c8cc-3367-f5ec5de4a54e	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561c-c8cc-1ba4-4513679cbab6	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561c-c8cc-dae1-4e6fd9bde2ed	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561c-c8cc-1f91-656ee91b2407	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561c-c8cc-e04d-212fa9347fe0	PostniNaslov-read	PostniNaslov - branje	f
00030000-561c-c8cc-1018-aec3a20e618f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561c-c8cc-f7a1-3cf58ea8a0fe	Predstava-read	Predstava - branje	f
00030000-561c-c8cc-6587-7047c208a63f	Predstava-write	Predstava - spreminjanje	f
00030000-561c-c8cc-d341-96015d19d658	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561c-c8cc-17ce-8997469a7399	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561c-c8cc-ad1f-a035f823ece8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561c-c8cc-9caa-f10cce323883	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561c-c8cc-8389-93c23d02c7a6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561c-c8cc-7dd5-f4b2642611fe	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561c-c8cc-c821-8346d1bd8cc1	ProgramDela-read	ProgramDela - branje	f
00030000-561c-c8cc-dd2f-9887644324d7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561c-c8cc-20c3-f271a8193772	ProgramFestival-read	ProgramFestival - branje	f
00030000-561c-c8cc-b380-6f991a9a419b	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561c-c8cc-282b-2fcc5198ed31	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561c-c8cc-600e-1e7ce922e3a9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561c-c8cc-027a-54cd8d72ae32	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561c-c8cc-4caf-d0df5c7aba6f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561c-c8cc-ae2d-612ab6d34433	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561c-c8cc-632b-66154e812c2a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561c-c8cc-74ab-a5aa790f9756	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561c-c8cc-b2a6-0139bdc08824	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561c-c8cc-0dd0-233f1d64f862	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561c-c8cc-2205-c1eaf1e1c03d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561c-c8cc-9284-296823d4e487	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561c-c8cc-5064-3d5fb779d33e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561c-c8cc-c8eb-428a57b9cdad	ProgramRazno-read	ProgramRazno - branje	f
00030000-561c-c8cc-3aba-0e1bcad17f19	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561c-c8cc-d323-34285c43736a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561c-c8cc-9dc0-44528a9e629e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561c-c8cc-ac37-bd486af8f277	Prostor-read	Prostor - branje	f
00030000-561c-c8cc-e134-326e56216825	Prostor-write	Prostor - spreminjanje	f
00030000-561c-c8cc-311c-e725f9c26622	Racun-read	Racun - branje	f
00030000-561c-c8cc-82df-cce335112f1b	Racun-write	Racun - spreminjanje	f
00030000-561c-c8cc-093b-70a304247b6b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561c-c8cc-9d3c-0964b2e51fea	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561c-c8cc-ad6a-d604a3d97d32	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561c-c8cc-3d56-1da433063eb2	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561c-c8cc-8c01-b9806fbd4ada	Rekvizit-read	Rekvizit - branje	f
00030000-561c-c8cc-0d69-8823c07572a6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561c-c8cc-824b-78f290033e9a	Revizija-read	Revizija - branje	f
00030000-561c-c8cc-e311-a86959386134	Revizija-write	Revizija - spreminjanje	f
00030000-561c-c8cc-1570-b85350a617e3	Rezervacija-read	Rezervacija - branje	f
00030000-561c-c8cc-9b75-42a1d7b369b8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561c-c8cc-f530-cd516e3db017	SedezniRed-read	SedezniRed - branje	f
00030000-561c-c8cc-0a60-4e8e75c73e49	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561c-c8cc-0773-043e644183a1	Sedez-read	Sedez - branje	f
00030000-561c-c8cc-537c-820fd99c0ac9	Sedez-write	Sedez - spreminjanje	f
00030000-561c-c8cc-8758-3db940adbddb	Sezona-read	Sezona - branje	f
00030000-561c-c8cc-46e2-bca4f7a74fb9	Sezona-write	Sezona - spreminjanje	f
00030000-561c-c8cc-b550-7ff3bc00cdd0	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561c-c8cc-7cc7-a9aa20474c53	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561c-c8cc-b836-daff5a02b8f5	Stevilcenje-read	Stevilcenje - branje	f
00030000-561c-c8cc-312a-5fb6988a3d85	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561c-c8cc-9777-b0b6c46a7636	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561c-c8cc-d397-b628100b545a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561c-c8cc-63c5-1ee94bddd327	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561c-c8cc-fe40-22d4cb72379a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561c-c8cc-7b5a-ef7345d13902	Telefonska-read	Telefonska - branje	f
00030000-561c-c8cc-6e27-a5ec2e836679	Telefonska-write	Telefonska - spreminjanje	f
00030000-561c-c8cc-ac71-e937bd0e9d74	TerminStoritve-read	TerminStoritve - branje	f
00030000-561c-c8cc-9eeb-d14c4fd74b2d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561c-c8cc-59f2-7c6f4e53628a	TipFunkcije-read	TipFunkcije - branje	f
00030000-561c-c8cc-1edd-92c2cc982277	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561c-c8cc-e008-4e47d11d916d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561c-c8cc-ed6f-44b650beae49	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561c-c8cc-1933-2a7955b89a14	Trr-read	Trr - branje	f
00030000-561c-c8cc-df45-03afc8dafa25	Trr-write	Trr - spreminjanje	f
00030000-561c-c8cc-72d2-c60f443481b8	Uprizoritev-read	Uprizoritev - branje	f
00030000-561c-c8cc-948e-a66eee728141	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561c-c8cc-a1d9-c142ed7d75af	Vaja-read	Vaja - branje	f
00030000-561c-c8cc-ca40-8978d287fe87	Vaja-write	Vaja - spreminjanje	f
00030000-561c-c8cc-26a1-ad7c2de49e79	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561c-c8cc-d794-050b784c6417	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561c-c8cc-8085-9ecb192b4f50	VrstaStroska-read	VrstaStroska - branje	f
00030000-561c-c8cc-87ef-7efb008daf43	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561c-c8cc-c191-c67c970c8640	Zaposlitev-read	Zaposlitev - branje	f
00030000-561c-c8cc-2e08-224093a2de9d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561c-c8cc-253e-d0d2605aec6d	Zasedenost-read	Zasedenost - branje	f
00030000-561c-c8cc-f647-3f310b2f43a5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561c-c8cc-6ee2-db7b37a6e543	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561c-c8cc-1485-c295412794cb	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561c-c8cc-4b35-40dca35568dc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561c-c8cc-df1a-f9352006da24	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561c-c8cc-9203-e20ffadca7b6	Job-read	Branje opravil - samo zase - branje	f
00030000-561c-c8cc-fbe3-35d9f2759f3d	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561c-c8cc-a8b4-dd81eaa064e4	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561c-c8cc-0a6b-71956fc0731c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561c-c8cc-e326-ecb6944e0d78	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561c-c8cc-a809-59dbcd22c2c2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561c-c8cc-b6f4-e7a8c2da2ee3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561c-c8cc-1a32-699f564c681f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561c-c8cc-7ef7-94df1962d667	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561c-c8cc-e332-bd885cc9f6d0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561c-c8cc-cf8b-51845bbde7bb	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561c-c8cc-be15-4719bcc41e5d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561c-c8cc-ef2c-85902e9245bf	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561c-c8cc-0fb0-ff5015d0c170	Datoteka-write	Datoteka - spreminjanje	f
00030000-561c-c8cc-9719-677356c82aae	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3005 (class 0 OID 21739027)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561c-c8cc-11c7-ed228bb0f580	00030000-561c-c8cc-3b32-a48d9191fb6c
00020000-561c-c8cc-7b2f-8f5959b5f715	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-5923-e16e449853a6
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-b856-1e2c7f1bb16f
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-cdee-59fcb86ecb3b
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-bd18-8d4e177b235a
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-62d5-f40eb6c1ca9c
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-a10d-17d6b68944ab
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-8355-4cbe15fa6bda
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-d62a-09e960dda786
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-8a8c-5cea80436c19
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-f00f-068e1494becb
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-f5f9-12d829924500
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-1fc8-7f294713c315
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-436d-1202d3dd0fa0
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-4e47-9425f75e53d0
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-5a28-eb3e7de36e40
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-cdd4-c8f26ccdf335
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-5506-bd2e3b9655d4
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-f2a2-e0492e976599
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-7d79-69245751b7b8
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-9d11-47378889789e
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-348b-9e3b0f39a195
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-8c6c-b4c97f9f92b4
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-be75-6f04c1369471
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-4d95-e7da26562ddf
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-6e8c-ffdd43983274
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-e04d-212fa9347fe0
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-1018-aec3a20e618f
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-f7a1-3cf58ea8a0fe
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-6587-7047c208a63f
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-8389-93c23d02c7a6
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-7dd5-f4b2642611fe
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-ac37-bd486af8f277
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-e134-326e56216825
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-ad6a-d604a3d97d32
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-3d56-1da433063eb2
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-8c01-b9806fbd4ada
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-0d69-8823c07572a6
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-8758-3db940adbddb
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-46e2-bca4f7a74fb9
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-59f2-7c6f4e53628a
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-72d2-c60f443481b8
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-948e-a66eee728141
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-a1d9-c142ed7d75af
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-ca40-8978d287fe87
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-253e-d0d2605aec6d
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-f647-3f310b2f43a5
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-6ee2-db7b37a6e543
00020000-561c-c8cc-1dfa-6c83b1990a5b	00030000-561c-c8cc-4b35-40dca35568dc
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-5923-e16e449853a6
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-62d5-f40eb6c1ca9c
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-a10d-17d6b68944ab
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-1fc8-7f294713c315
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-4e47-9425f75e53d0
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-cdd4-c8f26ccdf335
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-5506-bd2e3b9655d4
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-f2a2-e0492e976599
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-7d79-69245751b7b8
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-9d11-47378889789e
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-348b-9e3b0f39a195
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-8c6c-b4c97f9f92b4
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-4d95-e7da26562ddf
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-e04d-212fa9347fe0
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-1018-aec3a20e618f
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-f7a1-3cf58ea8a0fe
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-ac37-bd486af8f277
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-ad6a-d604a3d97d32
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-8c01-b9806fbd4ada
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-8758-3db940adbddb
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-7b5a-ef7345d13902
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-6e27-a5ec2e836679
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-1933-2a7955b89a14
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-df45-03afc8dafa25
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-c191-c67c970c8640
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-2e08-224093a2de9d
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-6ee2-db7b37a6e543
00020000-561c-c8cc-79be-47c70046dce2	00030000-561c-c8cc-4b35-40dca35568dc
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-5923-e16e449853a6
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-cdee-59fcb86ecb3b
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-62d5-f40eb6c1ca9c
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-e807-ea7c93a702b3
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-0dd8-a1c4f60efd6d
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-6a34-450bfe0e5c67
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-a10d-17d6b68944ab
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-f00f-068e1494becb
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-1fc8-7f294713c315
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-4e47-9425f75e53d0
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-cdd4-c8f26ccdf335
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-f2a2-e0492e976599
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-7d79-69245751b7b8
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-9d11-47378889789e
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-8c6c-b4c97f9f92b4
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-4d95-e7da26562ddf
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-f7a1-3cf58ea8a0fe
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-8389-93c23d02c7a6
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-ac37-bd486af8f277
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-ad6a-d604a3d97d32
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-8c01-b9806fbd4ada
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-8758-3db940adbddb
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-59f2-7c6f4e53628a
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-a1d9-c142ed7d75af
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-253e-d0d2605aec6d
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-6ee2-db7b37a6e543
00020000-561c-c8cc-4f1f-b5a797c2af62	00030000-561c-c8cc-4b35-40dca35568dc
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-5923-e16e449853a6
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-b856-1e2c7f1bb16f
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-bd18-8d4e177b235a
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-62d5-f40eb6c1ca9c
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-a10d-17d6b68944ab
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-1fc8-7f294713c315
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-4e47-9425f75e53d0
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-f2a2-e0492e976599
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-7d79-69245751b7b8
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-8c6c-b4c97f9f92b4
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-4d95-e7da26562ddf
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-f7a1-3cf58ea8a0fe
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-ac37-bd486af8f277
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-ad6a-d604a3d97d32
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-8c01-b9806fbd4ada
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-8758-3db940adbddb
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-59f2-7c6f4e53628a
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-6ee2-db7b37a6e543
00020000-561c-c8cc-9ebd-207ce69beaa1	00030000-561c-c8cc-4b35-40dca35568dc
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-5923-e16e449853a6
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-62d5-f40eb6c1ca9c
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-a10d-17d6b68944ab
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-1fc8-7f294713c315
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-4e47-9425f75e53d0
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-f2a2-e0492e976599
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-7d79-69245751b7b8
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-8c6c-b4c97f9f92b4
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-4d95-e7da26562ddf
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-f7a1-3cf58ea8a0fe
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-ac37-bd486af8f277
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-ad6a-d604a3d97d32
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-8c01-b9806fbd4ada
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-8758-3db940adbddb
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-ac71-e937bd0e9d74
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-38b1-0f4427354e44
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-59f2-7c6f4e53628a
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-6ee2-db7b37a6e543
00020000-561c-c8cc-8381-0f89bb12ab7a	00030000-561c-c8cc-4b35-40dca35568dc
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-031c-e80f27118e57
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3b32-a48d9191fb6c
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-38b1-0f4427354e44
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8355-4cbe15fa6bda
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9dda-8871a5f04c39
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ed43-7e0391a9984c
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-bf89-7f7bde4f8646
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-5923-e16e449853a6
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b856-1e2c7f1bb16f
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-cdee-59fcb86ecb3b
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-bd18-8d4e177b235a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-62d5-f40eb6c1ca9c
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-e807-ea7c93a702b3
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-0dd8-a1c4f60efd6d
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ebde-6637064a1c6c
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-6a34-450bfe0e5c67
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-116c-1269e96422d7
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-a10d-17d6b68944ab
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-d62a-09e960dda786
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-de8f-3a19d3a1e9a3
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8a8c-5cea80436c19
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-bcad-95271d6db7ea
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-0731-fa43d017c801
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-765d-0e87282f66b0
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3aa9-03dade49a9b2
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-f00f-068e1494becb
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-f5f9-12d829924500
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1fc8-7f294713c315
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-436d-1202d3dd0fa0
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-4e47-9425f75e53d0
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-5a28-eb3e7de36e40
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-cdd4-c8f26ccdf335
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-5506-bd2e3b9655d4
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-55e3-d9a6a8988f37
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ebe3-4740d163c628
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1fbd-f0baf5da0e6c
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-e567-03ba3cdd3579
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-f2a2-e0492e976599
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b7df-dc50d800b6ec
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-7d79-69245751b7b8
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b35e-d04ae4e50a43
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9d11-47378889789e
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-348b-9e3b0f39a195
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-eda2-69eba67224ff
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-928e-b8fbbacf1405
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3dbc-a9c75a4e0bb6
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-6294-d5dd2750fd51
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3294-e9ece0df621b
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-22ae-96ffd4efbd04
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8c6c-b4c97f9f92b4
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-be75-6f04c1369471
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-4d95-e7da26562ddf
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-6e8c-ffdd43983274
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3367-f5ec5de4a54e
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1ba4-4513679cbab6
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-dae1-4e6fd9bde2ed
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1f91-656ee91b2407
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-e04d-212fa9347fe0
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1018-aec3a20e618f
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-f7a1-3cf58ea8a0fe
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-6587-7047c208a63f
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-d341-96015d19d658
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-17ce-8997469a7399
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ad1f-a035f823ece8
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9caa-f10cce323883
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8389-93c23d02c7a6
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-7dd5-f4b2642611fe
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-c821-8346d1bd8cc1
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-dd2f-9887644324d7
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-20c3-f271a8193772
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b380-6f991a9a419b
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-282b-2fcc5198ed31
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-600e-1e7ce922e3a9
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-027a-54cd8d72ae32
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-4caf-d0df5c7aba6f
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ae2d-612ab6d34433
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-632b-66154e812c2a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-74ab-a5aa790f9756
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b2a6-0139bdc08824
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-0dd0-233f1d64f862
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-2205-c1eaf1e1c03d
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9284-296823d4e487
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-5064-3d5fb779d33e
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-c8eb-428a57b9cdad
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3aba-0e1bcad17f19
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-d323-34285c43736a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9dc0-44528a9e629e
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ac37-bd486af8f277
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-e134-326e56216825
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-311c-e725f9c26622
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-82df-cce335112f1b
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-093b-70a304247b6b
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9d3c-0964b2e51fea
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ad6a-d604a3d97d32
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-3d56-1da433063eb2
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8c01-b9806fbd4ada
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-0d69-8823c07572a6
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-824b-78f290033e9a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-e311-a86959386134
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1570-b85350a617e3
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9b75-42a1d7b369b8
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-f530-cd516e3db017
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-0a60-4e8e75c73e49
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-0773-043e644183a1
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-537c-820fd99c0ac9
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8758-3db940adbddb
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-46e2-bca4f7a74fb9
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b550-7ff3bc00cdd0
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-7cc7-a9aa20474c53
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-b836-daff5a02b8f5
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-312a-5fb6988a3d85
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9777-b0b6c46a7636
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-d397-b628100b545a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-63c5-1ee94bddd327
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-fe40-22d4cb72379a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-7b5a-ef7345d13902
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-6e27-a5ec2e836679
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ac71-e937bd0e9d74
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-9eeb-d14c4fd74b2d
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-59f2-7c6f4e53628a
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1edd-92c2cc982277
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-e008-4e47d11d916d
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ed6f-44b650beae49
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1933-2a7955b89a14
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-df45-03afc8dafa25
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-72d2-c60f443481b8
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-948e-a66eee728141
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-a1d9-c142ed7d75af
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-ca40-8978d287fe87
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-26a1-ad7c2de49e79
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-d794-050b784c6417
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-8085-9ecb192b4f50
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-87ef-7efb008daf43
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-c191-c67c970c8640
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-2e08-224093a2de9d
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-253e-d0d2605aec6d
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-f647-3f310b2f43a5
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-6ee2-db7b37a6e543
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-1485-c295412794cb
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-4b35-40dca35568dc
00020000-561c-c8ce-71f9-ad2e6b18e40e	00030000-561c-c8cc-df1a-f9352006da24
\.


--
-- TOC entry 3034 (class 0 OID 21739352)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21739386)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21739522)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561c-c8ce-5131-55a06a1ecd7d	00090000-561c-c8ce-9c36-7793868ac059	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561c-c8ce-9228-d03ca213be17	00090000-561c-c8ce-e42d-6c45c16b1b97	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561c-c8ce-82cc-631822e9b2e4	00090000-561c-c8ce-b45a-11970367ad4d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561c-c8ce-4957-acae24208b6a	00090000-561c-c8ce-4b11-050610f558be	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3010 (class 0 OID 21739087)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561c-c8ce-1f7a-888a8ed7e6ae	00040000-561c-c8cc-81fb-870e9ce6b62a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-b4c4-0ec777af1e1b	00040000-561c-c8cc-81fb-870e9ce6b62a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561c-c8ce-8ac7-bb994c084f3c	00040000-561c-c8cc-81fb-870e9ce6b62a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-57b0-0e93344c49a0	00040000-561c-c8cc-81fb-870e9ce6b62a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-19af-946a288c9a10	00040000-561c-c8cc-81fb-870e9ce6b62a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-e805-2d487718db6f	00040000-561c-c8cc-c468-4ea30cf2f174	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-0d5c-3c52bf0d9043	00040000-561c-c8cc-4fe1-7904f6152000	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-62de-aaa6f5a8cd22	00040000-561c-c8cc-e61d-cc6e587f70d2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8ce-e042-486e74169ae2	00040000-561c-c8cc-fd1d-6e56b59ec7bb	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-c8cf-6475-ae9937ad7bf3	00040000-561c-c8cc-81fb-870e9ce6b62a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3012 (class 0 OID 21739121)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561c-c8cc-5548-1191b50281cb	8341	Adlešiči
00050000-561c-c8cc-9c44-9beb35df72a2	5270	Ajdovščina
00050000-561c-c8cc-9a77-55527084ec32	6280	Ankaran/Ancarano
00050000-561c-c8cc-cef9-bfbd604ad4d6	9253	Apače
00050000-561c-c8cc-9701-10552a09b365	8253	Artiče
00050000-561c-c8cc-754b-0a8c25cfa210	4275	Begunje na Gorenjskem
00050000-561c-c8cc-5a1e-772561d153d2	1382	Begunje pri Cerknici
00050000-561c-c8cc-a1e8-dda3deb61645	9231	Beltinci
00050000-561c-c8cc-67ad-2a5f25e40055	2234	Benedikt
00050000-561c-c8cc-0da8-988dd3bc9406	2345	Bistrica ob Dravi
00050000-561c-c8cc-012b-c7e1009fa9b6	3256	Bistrica ob Sotli
00050000-561c-c8cc-06be-ef56ad947c76	8259	Bizeljsko
00050000-561c-c8cc-5118-22007c6d75ae	1223	Blagovica
00050000-561c-c8cc-7b45-221de312aac2	8283	Blanca
00050000-561c-c8cc-c6ce-26cf2d0677b8	4260	Bled
00050000-561c-c8cc-404a-090ff7a68413	4273	Blejska Dobrava
00050000-561c-c8cc-99af-34e9b933545b	9265	Bodonci
00050000-561c-c8cc-22f2-8ef2273df250	9222	Bogojina
00050000-561c-c8cc-c73f-9fdd53e12005	4263	Bohinjska Bela
00050000-561c-c8cc-8b2c-12a25930abd9	4264	Bohinjska Bistrica
00050000-561c-c8cc-e276-5d46fa9897c3	4265	Bohinjsko jezero
00050000-561c-c8cc-bdb0-6355270f8e8e	1353	Borovnica
00050000-561c-c8cc-b508-caf1470e3712	8294	Boštanj
00050000-561c-c8cc-8904-98b6322c5a16	5230	Bovec
00050000-561c-c8cc-0678-11a9cbe4d9c4	5295	Branik
00050000-561c-c8cc-ba1c-62917ae20625	3314	Braslovče
00050000-561c-c8cc-ca3a-fc26a4350a4d	5223	Breginj
00050000-561c-c8cc-9efd-bd13fc5a7aab	8280	Brestanica
00050000-561c-c8cc-2334-f74521253af4	2354	Bresternica
00050000-561c-c8cc-48ff-6a51cfb1208d	4243	Brezje
00050000-561c-c8cc-29f0-747f0dc5e136	1351	Brezovica pri Ljubljani
00050000-561c-c8cc-ca2f-3fe4ec4140c3	8250	Brežice
00050000-561c-c8cc-1dcf-4c50fd3304df	4210	Brnik - Aerodrom
00050000-561c-c8cc-cbdd-d9cdfd715613	8321	Brusnice
00050000-561c-c8cc-2842-dc97c90f70ef	3255	Buče
00050000-561c-c8cc-23aa-921c47946fb2	8276	Bučka 
00050000-561c-c8cc-eb39-4c94236c75f3	9261	Cankova
00050000-561c-c8cc-54ae-4d791559c99f	3000	Celje 
00050000-561c-c8cc-e718-62d3cb43020c	3001	Celje - poštni predali
00050000-561c-c8cc-203b-d50131d747e2	4207	Cerklje na Gorenjskem
00050000-561c-c8cc-4711-3d75e08fca71	8263	Cerklje ob Krki
00050000-561c-c8cc-0d51-5cf7643ca638	1380	Cerknica
00050000-561c-c8cc-8ec2-0f3be76b88fc	5282	Cerkno
00050000-561c-c8cc-b49b-f0e9e39f4c63	2236	Cerkvenjak
00050000-561c-c8cc-3307-09944cca7d5b	2215	Ceršak
00050000-561c-c8cc-a7f3-70ded832e882	2326	Cirkovce
00050000-561c-c8cc-6acb-156962bd681d	2282	Cirkulane
00050000-561c-c8cc-7779-4e07a0cb1c0d	5273	Col
00050000-561c-c8cc-12ba-d45dcf600d07	8251	Čatež ob Savi
00050000-561c-c8cc-651d-aabdd2104951	1413	Čemšenik
00050000-561c-c8cc-931e-e4caa813de57	5253	Čepovan
00050000-561c-c8cc-90e2-118dd8b04ee4	9232	Črenšovci
00050000-561c-c8cc-e672-bd916c681b1c	2393	Črna na Koroškem
00050000-561c-c8cc-e7a9-3a627950d797	6275	Črni Kal
00050000-561c-c8cc-0f86-09b339ae6868	5274	Črni Vrh nad Idrijo
00050000-561c-c8cc-51e9-f787a56c07bf	5262	Črniče
00050000-561c-c8cc-97c4-4049daf622e6	8340	Črnomelj
00050000-561c-c8cc-4f54-0b9645e2b276	6271	Dekani
00050000-561c-c8cc-3596-8bfa6a0d9eaf	5210	Deskle
00050000-561c-c8cc-a289-cf21c2e2e6b7	2253	Destrnik
00050000-561c-c8cc-04eb-6a25d94f2cc3	6215	Divača
00050000-561c-c8cc-bdd8-a28abbc56a95	1233	Dob
00050000-561c-c8cc-8c42-bb4b66ec798f	3224	Dobje pri Planini
00050000-561c-c8cc-c213-78bb1390a444	8257	Dobova
00050000-561c-c8cc-be87-acd6a24f2397	1423	Dobovec
00050000-561c-c8cc-8590-da70322df5aa	5263	Dobravlje
00050000-561c-c8cc-daf6-271fd192882d	3204	Dobrna
00050000-561c-c8cc-a405-1b64fa671c9f	8211	Dobrnič
00050000-561c-c8cc-b28d-35585390015a	1356	Dobrova
00050000-561c-c8cc-2c06-95514282c8e2	9223	Dobrovnik/Dobronak 
00050000-561c-c8cc-ce1e-40b63c37ae58	5212	Dobrovo v Brdih
00050000-561c-c8cc-2cf1-2ceee2554cc5	1431	Dol pri Hrastniku
00050000-561c-c8cc-3df9-0c8c27661fcf	1262	Dol pri Ljubljani
00050000-561c-c8cc-cd06-3228ce2cc742	1273	Dole pri Litiji
00050000-561c-c8cc-9d8b-7cd9531b455b	1331	Dolenja vas
00050000-561c-c8cc-7c86-dd75a3919330	8350	Dolenjske Toplice
00050000-561c-c8cc-0e5b-4e6dbfe6944e	1230	Domžale
00050000-561c-c8cc-a41f-ae76129c22c8	2252	Dornava
00050000-561c-c8cc-1ff4-e0ad47db94a7	5294	Dornberk
00050000-561c-c8cc-3687-daafd17ccfee	1319	Draga
00050000-561c-c8cc-f291-36a8efffb12c	8343	Dragatuš
00050000-561c-c8cc-150b-7f1c3d933e93	3222	Dramlje
00050000-561c-c8cc-7e4d-d8042670135f	2370	Dravograd
00050000-561c-c8cc-df75-53754154c2e8	4203	Duplje
00050000-561c-c8cc-0626-d577d1466e9b	6221	Dutovlje
00050000-561c-c8cc-c75f-100efd528bed	8361	Dvor
00050000-561c-c8cc-96a9-3ff47bca17fd	2343	Fala
00050000-561c-c8cc-3520-a2cd1c40e74c	9208	Fokovci
00050000-561c-c8cc-cd1a-e697a3ac6dde	2313	Fram
00050000-561c-c8cc-eea6-518f3bef476d	3213	Frankolovo
00050000-561c-c8cc-bb5e-b111eae2013d	1274	Gabrovka
00050000-561c-c8cc-1173-6b9e2caf5824	8254	Globoko
00050000-561c-c8cc-7506-3f5b560716b0	5275	Godovič
00050000-561c-c8cc-50c8-b5600e08138d	4204	Golnik
00050000-561c-c8cc-922f-6fc6487f4592	3303	Gomilsko
00050000-561c-c8cc-c77f-b3df0aa7fdb8	4224	Gorenja vas
00050000-561c-c8cc-0de6-c801676718b3	3263	Gorica pri Slivnici
00050000-561c-c8cc-19f4-0fbe52d759d7	2272	Gorišnica
00050000-561c-c8cc-a300-f9dc031f7e7f	9250	Gornja Radgona
00050000-561c-c8cc-913e-ad16af71a437	3342	Gornji Grad
00050000-561c-c8cc-461b-4244edf64d1c	4282	Gozd Martuljek
00050000-561c-c8cc-3059-f19630508544	6272	Gračišče
00050000-561c-c8cc-a5ef-68dcaff489c3	9264	Grad
00050000-561c-c8cc-0105-b98d1710595a	8332	Gradac
00050000-561c-c8cc-6397-a65d3085f2d2	1384	Grahovo
00050000-561c-c8cc-1c20-8129eb6da390	5242	Grahovo ob Bači
00050000-561c-c8cc-24ca-9c469c36a510	5251	Grgar
00050000-561c-c8cc-f224-493a1d6f9d4a	3302	Griže
00050000-561c-c8cc-01ee-a22c182451bc	3231	Grobelno
00050000-561c-c8cc-798a-7b6d6f480fcf	1290	Grosuplje
00050000-561c-c8cc-1c56-a37da170d125	2288	Hajdina
00050000-561c-c8cc-ead2-d9ce97570cfc	8362	Hinje
00050000-561c-c8cc-c652-f13e09122c7f	2311	Hoče
00050000-561c-c8cc-8878-d7e5bbf69be9	9205	Hodoš/Hodos
00050000-561c-c8cc-566b-67295494299f	1354	Horjul
00050000-561c-c8cc-3c0a-6ba13b866e32	1372	Hotedršica
00050000-561c-c8cc-61e6-62c38cc22359	1430	Hrastnik
00050000-561c-c8cc-fe87-dd675dec9436	6225	Hruševje
00050000-561c-c8cc-e506-abde3e2c117f	4276	Hrušica
00050000-561c-c8cc-bf9f-554032ad0ac8	5280	Idrija
00050000-561c-c8cc-d9cf-e532fe5be3e0	1292	Ig
00050000-561c-c8cc-beeb-7e5f27aa41ac	6250	Ilirska Bistrica
00050000-561c-c8cc-64e4-506645fe631f	6251	Ilirska Bistrica-Trnovo
00050000-561c-c8cc-9628-dd15e8702579	1295	Ivančna Gorica
00050000-561c-c8cc-8646-23fa4f8b3b1b	2259	Ivanjkovci
00050000-561c-c8cc-9051-35d74bbf8bf2	1411	Izlake
00050000-561c-c8cc-760b-8ed9f189eb47	6310	Izola/Isola
00050000-561c-c8cc-cb99-ed1131b0ebdd	2222	Jakobski Dol
00050000-561c-c8cc-b625-71b63c3e6852	2221	Jarenina
00050000-561c-c8cc-786c-ce2b0219965e	6254	Jelšane
00050000-561c-c8cc-ee93-41fb162529b6	4270	Jesenice
00050000-561c-c8cc-cc60-84dc9161f6ca	8261	Jesenice na Dolenjskem
00050000-561c-c8cc-d550-144799596a4a	3273	Jurklošter
00050000-561c-c8cc-9980-16956e887153	2223	Jurovski Dol
00050000-561c-c8cc-8530-b85e38718520	2256	Juršinci
00050000-561c-c8cc-fd40-672556c8cdfc	5214	Kal nad Kanalom
00050000-561c-c8cc-f5a8-9003ed885439	3233	Kalobje
00050000-561c-c8cc-8023-a5c14a3d30fd	4246	Kamna Gorica
00050000-561c-c8cc-be10-214b9b84ee31	2351	Kamnica
00050000-561c-c8cc-08b5-0bab9997de7a	1241	Kamnik
00050000-561c-c8cc-bb6c-5e11e71b9776	5213	Kanal
00050000-561c-c8cc-f2e8-a81eb66dcf0e	8258	Kapele
00050000-561c-c8cc-0262-f8e73fc717db	2362	Kapla
00050000-561c-c8cc-3803-83153f77fcfa	2325	Kidričevo
00050000-561c-c8cc-b84c-3a1fb5d7a949	1412	Kisovec
00050000-561c-c8cc-101d-a5be95e79159	6253	Knežak
00050000-561c-c8cc-58e1-5a836a4f218e	5222	Kobarid
00050000-561c-c8cc-d572-05099f76af3e	9227	Kobilje
00050000-561c-c8cc-4ac3-6d2489234f1b	1330	Kočevje
00050000-561c-c8cc-e723-a8a932a0279b	1338	Kočevska Reka
00050000-561c-c8cc-351e-fd2b58404e40	2276	Kog
00050000-561c-c8cc-e77a-85064aa98a50	5211	Kojsko
00050000-561c-c8cc-3061-cfcbc2b416c0	6223	Komen
00050000-561c-c8cc-6e64-d9024aa1d604	1218	Komenda
00050000-561c-c8cc-48b2-265a41eddc55	6000	Koper/Capodistria 
00050000-561c-c8cc-679e-99b623c63c3d	6001	Koper/Capodistria - poštni predali
00050000-561c-c8cc-4692-e85725ac0b18	8282	Koprivnica
00050000-561c-c8cc-2fbc-ae17457d1996	5296	Kostanjevica na Krasu
00050000-561c-c8cc-4fca-9de016b801b3	8311	Kostanjevica na Krki
00050000-561c-c8cc-bcd4-a68453eb4587	1336	Kostel
00050000-561c-c8cc-370b-16a0a6f09db3	6256	Košana
00050000-561c-c8cc-a383-34d5e52c18ef	2394	Kotlje
00050000-561c-c8cc-22c9-0496ed54166d	6240	Kozina
00050000-561c-c8cc-bd7d-4f831f438540	3260	Kozje
00050000-561c-c8cc-6e2d-c636ca35d411	4000	Kranj 
00050000-561c-c8cc-019e-c64235d8d870	4001	Kranj - poštni predali
00050000-561c-c8cc-7026-56466bd2f398	4280	Kranjska Gora
00050000-561c-c8cc-1422-d0b91a0d990e	1281	Kresnice
00050000-561c-c8cc-675e-f6667b020c7d	4294	Križe
00050000-561c-c8cc-9d9f-3dea15c37787	9206	Križevci
00050000-561c-c8cc-ac67-0b850a50f8b7	9242	Križevci pri Ljutomeru
00050000-561c-c8cc-3be6-f66aa80b5ffc	1301	Krka
00050000-561c-c8cc-fb3f-e4e500c80ea6	8296	Krmelj
00050000-561c-c8cc-dbc4-743ff69659d5	4245	Kropa
00050000-561c-c8cc-2c03-ff68d5554697	8262	Krška vas
00050000-561c-c8cc-15b9-572f3217bc52	8270	Krško
00050000-561c-c8cc-f16d-972546508780	9263	Kuzma
00050000-561c-c8cc-c791-216ab161db90	2318	Laporje
00050000-561c-c8cc-22d3-30ce24742b57	3270	Laško
00050000-561c-c8cc-78e3-18d2174347bb	1219	Laze v Tuhinju
00050000-561c-c8cc-45c5-d45e0de1a189	2230	Lenart v Slovenskih goricah
00050000-561c-c8cc-fdbf-789331584a01	9220	Lendava/Lendva
00050000-561c-c8cc-a641-ec39b0b98b9f	4248	Lesce
00050000-561c-c8cc-c85c-d4337814f563	3261	Lesično
00050000-561c-c8cc-fd85-2bac8dc4306a	8273	Leskovec pri Krškem
00050000-561c-c8cc-a21d-fae60f479b12	2372	Libeliče
00050000-561c-c8cc-992f-5828ee8acfc4	2341	Limbuš
00050000-561c-c8cc-0b91-d8e460a82fc9	1270	Litija
00050000-561c-c8cc-3370-c5221727affe	3202	Ljubečna
00050000-561c-c8cc-71d5-d53ea17f9012	1000	Ljubljana 
00050000-561c-c8cc-a77f-a019f5ca888c	1001	Ljubljana - poštni predali
00050000-561c-c8cc-5ead-f2c9affd8ae0	1231	Ljubljana - Črnuče
00050000-561c-c8cc-59e5-7133954518e7	1261	Ljubljana - Dobrunje
00050000-561c-c8cc-9bbb-b2ec6622b4f1	1260	Ljubljana - Polje
00050000-561c-c8cc-3bf2-d4c408f0bb6c	1210	Ljubljana - Šentvid
00050000-561c-c8cc-daa6-403828bb84ec	1211	Ljubljana - Šmartno
00050000-561c-c8cc-d0fe-f5c9f9ba7d13	3333	Ljubno ob Savinji
00050000-561c-c8cc-01ee-3b76ba2854f2	9240	Ljutomer
00050000-561c-c8cc-9e0c-d110041a4ca1	3215	Loče
00050000-561c-c8cc-af64-530bb43579dd	5231	Log pod Mangartom
00050000-561c-c8cc-487e-47d66901c70e	1358	Log pri Brezovici
00050000-561c-c8cc-fd97-7f5125c6c2fa	1370	Logatec
00050000-561c-c8cc-8879-e8de74c40a82	1371	Logatec
00050000-561c-c8cc-c46c-a34d4eda68e2	1434	Loka pri Zidanem Mostu
00050000-561c-c8cc-42d8-d37c75406e7f	3223	Loka pri Žusmu
00050000-561c-c8cc-d285-a757845462d1	6219	Lokev
00050000-561c-c8cc-ce44-16da3ad92690	1318	Loški Potok
00050000-561c-c8cc-5f1f-80f66967e33f	2324	Lovrenc na Dravskem polju
00050000-561c-c8cc-60df-eeb6e95d084c	2344	Lovrenc na Pohorju
00050000-561c-c8cc-9fb4-c6700d4cde02	3334	Luče
00050000-561c-c8cc-3c06-90fba6b1b7d5	1225	Lukovica
00050000-561c-c8cc-f6c8-69936667a3a2	9202	Mačkovci
00050000-561c-c8cc-6413-aa9e638387fa	2322	Majšperk
00050000-561c-c8cc-212a-d83c93114c2c	2321	Makole
00050000-561c-c8cc-35e1-80b1a9529cb4	9243	Mala Nedelja
00050000-561c-c8cc-63f1-aabf7bd2f070	2229	Malečnik
00050000-561c-c8cc-dc2b-9fc04774879e	6273	Marezige
00050000-561c-c8cc-761a-20d281d7cb46	2000	Maribor 
00050000-561c-c8cc-c5aa-90ba97e2f0dc	2001	Maribor - poštni predali
00050000-561c-c8cc-f1e3-6718fff729f4	2206	Marjeta na Dravskem polju
00050000-561c-c8cc-164a-a9d78ac8d9fd	2281	Markovci
00050000-561c-c8cc-693f-1ed1932dbdd5	9221	Martjanci
00050000-561c-c8cc-c2f9-d7e4ba3581fc	6242	Materija
00050000-561c-c8cc-8a45-5f792923f600	4211	Mavčiče
00050000-561c-c8cc-0294-fc7a803889c2	1215	Medvode
00050000-561c-c8cc-432d-3f1c7ccec105	1234	Mengeš
00050000-561c-c8cc-5217-f57d4b676c5d	8330	Metlika
00050000-561c-c8cc-ef20-5f6ba0013705	2392	Mežica
00050000-561c-c8cc-4e21-0c13b76e8ffe	2204	Miklavž na Dravskem polju
00050000-561c-c8cc-789a-955717166d96	2275	Miklavž pri Ormožu
00050000-561c-c8cc-0fb8-e50016159b1c	5291	Miren
00050000-561c-c8cc-f8a6-6d56db74e9ae	8233	Mirna
00050000-561c-c8cc-7a7f-ea22a3611c45	8216	Mirna Peč
00050000-561c-c8cc-0c9e-bad04d25383a	2382	Mislinja
00050000-561c-c8cc-5c84-919baf5393fb	4281	Mojstrana
00050000-561c-c8cc-c43d-5b93b94205a9	8230	Mokronog
00050000-561c-c8cc-357e-1bff5f9d18c5	1251	Moravče
00050000-561c-c8cc-8fa2-aa8d916fb3e6	9226	Moravske Toplice
00050000-561c-c8cc-a806-0b03a4227675	5216	Most na Soči
00050000-561c-c8cc-b7f8-940f2ee1c4e4	1221	Motnik
00050000-561c-c8cc-a680-2508db42d948	3330	Mozirje
00050000-561c-c8cc-338c-a6f5c97de94c	9000	Murska Sobota 
00050000-561c-c8cc-ecbf-d49ea745fd39	9001	Murska Sobota - poštni predali
00050000-561c-c8cc-b22b-307d983a678d	2366	Muta
00050000-561c-c8cc-9d6e-b2241f8c953c	4202	Naklo
00050000-561c-c8cc-f441-0801fc98783f	3331	Nazarje
00050000-561c-c8cc-e25a-ecb5a12c8a90	1357	Notranje Gorice
00050000-561c-c8cc-6ce9-033bae7052b1	3203	Nova Cerkev
00050000-561c-c8cc-87d1-f904deea2aa4	5000	Nova Gorica 
00050000-561c-c8cc-0092-9d6662da6bf5	5001	Nova Gorica - poštni predali
00050000-561c-c8cc-2081-f0f9371e3d29	1385	Nova vas
00050000-561c-c8cc-3c6d-4351fda099d5	8000	Novo mesto
00050000-561c-c8cc-8b10-690a5e90c6ec	8001	Novo mesto - poštni predali
00050000-561c-c8cc-7e6d-3b5bd549a76d	6243	Obrov
00050000-561c-c8cc-b7ad-e3f21ef47a7f	9233	Odranci
00050000-561c-c8cc-202d-fb38a4f1f230	2317	Oplotnica
00050000-561c-c8cc-b5b9-fe7c2ba39a49	2312	Orehova vas
00050000-561c-c8cc-8b7c-676abcaa80e9	2270	Ormož
00050000-561c-c8cc-aa2e-34efd53b0b02	1316	Ortnek
00050000-561c-c8cc-8f4a-854ae1e60841	1337	Osilnica
00050000-561c-c8cc-71ff-6e18a3b7554e	8222	Otočec
00050000-561c-c8cc-595d-2e91b1fde1ed	2361	Ožbalt
00050000-561c-c8cc-a314-b28ff409afee	2231	Pernica
00050000-561c-c8cc-0aae-e87c6f0f7274	2211	Pesnica pri Mariboru
00050000-561c-c8cc-9224-5de5c9ceb1c6	9203	Petrovci
00050000-561c-c8cc-82dc-90631d70ceea	3301	Petrovče
00050000-561c-c8cc-cb4a-c62be55c58f7	6330	Piran/Pirano
00050000-561c-c8cc-6926-58869fbe477a	8255	Pišece
00050000-561c-c8cc-8ff1-33dcd99f01c1	6257	Pivka
00050000-561c-c8cc-b88e-85ba0f690987	6232	Planina
00050000-561c-c8cc-26db-9a74ad4f6632	3225	Planina pri Sevnici
00050000-561c-c8cc-8b71-7d0154f4c9ec	6276	Pobegi
00050000-561c-c8cc-ede3-523b27ed5ad8	8312	Podbočje
00050000-561c-c8cc-1c75-b568a0789a88	5243	Podbrdo
00050000-561c-c8cc-c7d6-d53554f5bd96	3254	Podčetrtek
00050000-561c-c8cc-cd4f-b7a3a3bd0c95	2273	Podgorci
00050000-561c-c8cc-466f-472347ee52cb	6216	Podgorje
00050000-561c-c8cc-eec2-eb6bd499a8fc	2381	Podgorje pri Slovenj Gradcu
00050000-561c-c8cc-3da4-fb906037c124	6244	Podgrad
00050000-561c-c8cc-6f4f-b30bb309eb53	1414	Podkum
00050000-561c-c8cc-c39d-873f3f3bfa32	2286	Podlehnik
00050000-561c-c8cc-567a-f27d91a7aa4e	5272	Podnanos
00050000-561c-c8cc-4c57-b5951c762391	4244	Podnart
00050000-561c-c8cc-ed04-8552c156fc79	3241	Podplat
00050000-561c-c8cc-512f-74eea86fcc0e	3257	Podsreda
00050000-561c-c8cc-86e1-9b8b7082ce68	2363	Podvelka
00050000-561c-c8cc-5c13-216dcf643c4e	2208	Pohorje
00050000-561c-c8cc-b57a-4c848de6e81f	2257	Polenšak
00050000-561c-c8cc-a6bc-db8246efcd1a	1355	Polhov Gradec
00050000-561c-c8cc-b12b-15dacdc6e301	4223	Poljane nad Škofjo Loko
00050000-561c-c8cc-db97-3d7c0b861545	2319	Poljčane
00050000-561c-c8cc-de51-d4ba04d60707	1272	Polšnik
00050000-561c-c8cc-f426-0a0fec25f046	3313	Polzela
00050000-561c-c8cc-c128-1f46de380bdf	3232	Ponikva
00050000-561c-c8cc-9591-4ab5505e3c97	6320	Portorož/Portorose
00050000-561c-c8cc-2b9b-7143a6c1193e	6230	Postojna
00050000-561c-c8cc-c0d0-90e8e8e3d117	2331	Pragersko
00050000-561c-c8cc-2c7f-8d4e03355c0f	3312	Prebold
00050000-561c-c8cc-6e05-c50d8d533fb3	4205	Preddvor
00050000-561c-c8cc-6b6c-0d0453fe9a41	6255	Prem
00050000-561c-c8cc-dfbc-a2eaf94e242f	1352	Preserje
00050000-561c-c8cc-36d4-9ff97c56e360	6258	Prestranek
00050000-561c-c8cc-6eee-0707b29866e5	2391	Prevalje
00050000-561c-c8cc-00a5-7184474a5adf	3262	Prevorje
00050000-561c-c8cc-f3e9-dac4b4a7c292	1276	Primskovo 
00050000-561c-c8cc-07ea-326617d3b5aa	3253	Pristava pri Mestinju
00050000-561c-c8cc-b91b-7c145232f49a	9207	Prosenjakovci/Partosfalva
00050000-561c-c8cc-f7b0-07b3e2377dc2	5297	Prvačina
00050000-561c-c8cc-27f7-41111e5160bd	2250	Ptuj
00050000-561c-c8cc-9d01-7fe71a19c5d0	2323	Ptujska Gora
00050000-561c-c8cc-457c-693f7e19c1bc	9201	Puconci
00050000-561c-c8cc-90b0-a411fc85ec68	2327	Rače
00050000-561c-c8cc-fadc-73320c2f1665	1433	Radeče
00050000-561c-c8cc-b2a9-271efd3a8b05	9252	Radenci
00050000-561c-c8cc-41a5-3faba20f0d8c	2360	Radlje ob Dravi
00050000-561c-c8cc-8ae9-91f337011dfa	1235	Radomlje
00050000-561c-c8cc-a37d-c6c06d0c5bfb	4240	Radovljica
00050000-561c-c8cc-0a84-fff138a63c17	8274	Raka
00050000-561c-c8cc-69c4-ed3df21332db	1381	Rakek
00050000-561c-c8cc-ba0f-3710c389a685	4283	Rateče - Planica
00050000-561c-c8cc-75fe-7378fab3c153	2390	Ravne na Koroškem
00050000-561c-c8cc-3fa5-ab04a98ff787	9246	Razkrižje
00050000-561c-c8cc-3b71-254800a864e7	3332	Rečica ob Savinji
00050000-561c-c8cc-60cb-b12da84e424a	5292	Renče
00050000-561c-c8cc-2c56-642a59460c4c	1310	Ribnica
00050000-561c-c8cc-42b8-a2b98d679aae	2364	Ribnica na Pohorju
00050000-561c-c8cc-cea2-97e3a93c681a	3272	Rimske Toplice
00050000-561c-c8cc-7ff1-0e87378f5522	1314	Rob
00050000-561c-c8cc-1571-3a141ff9787f	5215	Ročinj
00050000-561c-c8cc-aa42-b30148c8e0b4	3250	Rogaška Slatina
00050000-561c-c8cc-8233-47ef7f27790c	9262	Rogašovci
00050000-561c-c8cc-a5d7-9eb9b4dbeea8	3252	Rogatec
00050000-561c-c8cc-3253-3196bbc169b7	1373	Rovte
00050000-561c-c8cc-fdc0-4785f2781664	2342	Ruše
00050000-561c-c8cc-c734-1499bdb7850e	1282	Sava
00050000-561c-c8cc-37b1-fe52f4bad833	6333	Sečovlje/Sicciole
00050000-561c-c8cc-674e-9d074222f802	4227	Selca
00050000-561c-c8cc-9388-29726929d0d8	2352	Selnica ob Dravi
00050000-561c-c8cc-1224-82981405d9a2	8333	Semič
00050000-561c-c8cc-5246-d0f9e667a3ad	8281	Senovo
00050000-561c-c8cc-2c9f-c01e2bcf6f30	6224	Senožeče
00050000-561c-c8cc-f564-ffe2a5eceb83	8290	Sevnica
00050000-561c-c8cc-a463-fcab7efbd6a7	6210	Sežana
00050000-561c-c8cc-56cc-94ae0914f30b	2214	Sladki Vrh
00050000-561c-c8cc-4500-166ce8655603	5283	Slap ob Idrijci
00050000-561c-c8cc-93fb-eb6730767f21	2380	Slovenj Gradec
00050000-561c-c8cc-4876-2125d2f0d7a9	2310	Slovenska Bistrica
00050000-561c-c8cc-4cef-3a853162463d	3210	Slovenske Konjice
00050000-561c-c8cc-44f2-0e53555f51c5	1216	Smlednik
00050000-561c-c8cc-7c25-04274d3efd0d	5232	Soča
00050000-561c-c8cc-7d97-ee2f250e0a24	1317	Sodražica
00050000-561c-c8cc-b2b9-6a32dd8bc934	3335	Solčava
00050000-561c-c8cc-d8ab-b2d63755106e	5250	Solkan
00050000-561c-c8cc-2f18-43da3100af5a	4229	Sorica
00050000-561c-c8cc-ec79-49e3d55c2d18	4225	Sovodenj
00050000-561c-c8cc-af21-8b6d51dadca4	5281	Spodnja Idrija
00050000-561c-c8cc-2d3f-cfac1bcc17ee	2241	Spodnji Duplek
00050000-561c-c8cc-3d90-c6de538dfb3f	9245	Spodnji Ivanjci
00050000-561c-c8cc-6040-c5cc2452bacc	2277	Središče ob Dravi
00050000-561c-c8cc-af0f-abb69b455cf6	4267	Srednja vas v Bohinju
00050000-561c-c8cc-f2ce-fc7ce38ff6c4	8256	Sromlje 
00050000-561c-c8cc-6d7b-dd206098a2ef	5224	Srpenica
00050000-561c-c8cc-5e7b-67bbb332b901	1242	Stahovica
00050000-561c-c8cc-f1dc-4181a4787956	1332	Stara Cerkev
00050000-561c-c8cc-1647-419e53e8f485	8342	Stari trg ob Kolpi
00050000-561c-c8cc-08d8-d9b3c5cf50f7	1386	Stari trg pri Ložu
00050000-561c-c8cc-796e-a0b120f83432	2205	Starše
00050000-561c-c8cc-94ba-5188e548771a	2289	Stoperce
00050000-561c-c8cc-38f6-3759bdde3c13	8322	Stopiče
00050000-561c-c8cc-111f-2af356616898	3206	Stranice
00050000-561c-c8cc-17ad-1bed9b6ec2c1	8351	Straža
00050000-561c-c8cc-294a-c92e0dabcf05	1313	Struge
00050000-561c-c8cc-5ea3-ba551cdfc25c	8293	Studenec
00050000-561c-c8cc-3da3-27ef611a8418	8331	Suhor
00050000-561c-c8cc-600f-d3f1708c7cc2	2233	Sv. Ana v Slovenskih goricah
00050000-561c-c8cc-7693-d254a44b15fb	2235	Sv. Trojica v Slovenskih goricah
00050000-561c-c8cc-480a-43aeb7f420a6	2353	Sveti Duh na Ostrem Vrhu
00050000-561c-c8cc-85a0-1fb57ad891c8	9244	Sveti Jurij ob Ščavnici
00050000-561c-c8cc-7823-ff9c13caf874	3264	Sveti Štefan
00050000-561c-c8cc-b791-aa2a76e9313a	2258	Sveti Tomaž
00050000-561c-c8cc-2471-d02d0d910790	9204	Šalovci
00050000-561c-c8cc-bcb1-c98e8f567c23	5261	Šempas
00050000-561c-c8cc-af86-e774b78fa463	5290	Šempeter pri Gorici
00050000-561c-c8cc-b7aa-65b3d0ca44a6	3311	Šempeter v Savinjski dolini
00050000-561c-c8cc-6ab7-54d4346e45c4	4208	Šenčur
00050000-561c-c8cc-3b8f-52940f0baf7f	2212	Šentilj v Slovenskih goricah
00050000-561c-c8cc-b321-6e97a21db7ae	8297	Šentjanž
00050000-561c-c8cc-004b-d61f44977d00	2373	Šentjanž pri Dravogradu
00050000-561c-c8cc-a2ca-61c62fd52ae3	8310	Šentjernej
00050000-561c-c8cc-30bd-d278f76b29ac	3230	Šentjur
00050000-561c-c8cc-8124-4b3db9f6c4be	3271	Šentrupert
00050000-561c-c8cc-5415-bd76b7a0288c	8232	Šentrupert
00050000-561c-c8cc-dfd6-5372ed23707c	1296	Šentvid pri Stični
00050000-561c-c8cc-c96b-917791c8f05e	8275	Škocjan
00050000-561c-c8cc-a0de-1db1f2342a68	6281	Škofije
00050000-561c-c8cc-c8f4-e0f15d58a0bf	4220	Škofja Loka
00050000-561c-c8cc-c58b-d7c5ee2e26dc	3211	Škofja vas
00050000-561c-c8cc-c8df-92445dfb4355	1291	Škofljica
00050000-561c-c8cc-5977-853bf612d0e7	6274	Šmarje
00050000-561c-c8cc-8a53-1700afd6065b	1293	Šmarje - Sap
00050000-561c-c8cc-770f-cd7c55c5459d	3240	Šmarje pri Jelšah
00050000-561c-c8cc-e52b-51429562c6cb	8220	Šmarješke Toplice
00050000-561c-c8cc-a0ff-67423a3f3201	2315	Šmartno na Pohorju
00050000-561c-c8cc-57a2-540e717a5f2d	3341	Šmartno ob Dreti
00050000-561c-c8cc-c6d3-1afee5253d15	3327	Šmartno ob Paki
00050000-561c-c8cc-f215-01a2f225da95	1275	Šmartno pri Litiji
00050000-561c-c8cc-6b6c-60c5b52f906a	2383	Šmartno pri Slovenj Gradcu
00050000-561c-c8cc-226d-6804143fbeb5	3201	Šmartno v Rožni dolini
00050000-561c-c8cc-81c1-558031ebe221	3325	Šoštanj
00050000-561c-c8cc-da39-c76de6e06968	6222	Štanjel
00050000-561c-c8cc-7b82-52008bdb7dfd	3220	Štore
00050000-561c-c8cc-f8ff-699fc71dad93	3304	Tabor
00050000-561c-c8cc-72d0-86468b1133c1	3221	Teharje
00050000-561c-c8cc-8bb7-a6b45ec372bf	9251	Tišina
00050000-561c-c8cc-e262-fc3616fe6906	5220	Tolmin
00050000-561c-c8cc-b4a7-2124674c8da7	3326	Topolšica
00050000-561c-c8cc-f225-553e76a58a34	2371	Trbonje
00050000-561c-c8cc-125f-ba2eb9eeed0f	1420	Trbovlje
00050000-561c-c8cc-3d53-49d2d9644602	8231	Trebelno 
00050000-561c-c8cc-8a69-7c33940ec59a	8210	Trebnje
00050000-561c-c8cc-2c83-813bac31fed8	5252	Trnovo pri Gorici
00050000-561c-c8cc-c3eb-82180be170e3	2254	Trnovska vas
00050000-561c-c8cc-1557-7f4cdffbebc4	1222	Trojane
00050000-561c-c8cc-a484-151a18ed8072	1236	Trzin
00050000-561c-c8cc-020d-d8fd71944171	4290	Tržič
00050000-561c-c8cc-a205-3be53fb79a9f	8295	Tržišče
00050000-561c-c8cc-d6fc-7754dcec6367	1311	Turjak
00050000-561c-c8cc-f908-d0a812103608	9224	Turnišče
00050000-561c-c8cc-29d4-3dbdf91cf77b	8323	Uršna sela
00050000-561c-c8cc-4064-2548483d7499	1252	Vače
00050000-561c-c8cc-8505-c4c9a97c6dd1	3320	Velenje 
00050000-561c-c8cc-eddf-5bf5c7952732	3322	Velenje - poštni predali
00050000-561c-c8cc-a9b7-50a27adf9446	8212	Velika Loka
00050000-561c-c8cc-f39a-f6413a3b982d	2274	Velika Nedelja
00050000-561c-c8cc-a703-0a1a927496ba	9225	Velika Polana
00050000-561c-c8cc-d225-3c8b61c519af	1315	Velike Lašče
00050000-561c-c8cc-7ff1-e354534ec251	8213	Veliki Gaber
00050000-561c-c8cc-8ac6-fdf46c25e446	9241	Veržej
00050000-561c-c8cc-b462-3244deec0d39	1312	Videm - Dobrepolje
00050000-561c-c8cc-54c3-3bb3df52ce2e	2284	Videm pri Ptuju
00050000-561c-c8cc-d4f2-02bb2390c699	8344	Vinica
00050000-561c-c8cc-e1cf-c40c166b766e	5271	Vipava
00050000-561c-c8cc-a0a7-eca422d569bb	4212	Visoko
00050000-561c-c8cc-8ce2-0eb2cd054ade	1294	Višnja Gora
00050000-561c-c8cc-1154-12cb025db161	3205	Vitanje
00050000-561c-c8cc-fa3b-e8b4fee1e1e6	2255	Vitomarci
00050000-561c-c8cc-4506-d14e16630c4a	1217	Vodice
00050000-561c-c8cc-969d-5977a7606bc1	3212	Vojnik\t
00050000-561c-c8cc-1c84-5ebccb0146de	5293	Volčja Draga
00050000-561c-c8cc-a576-e67085927f53	2232	Voličina
00050000-561c-c8cc-36c7-7dbb13cd6206	3305	Vransko
00050000-561c-c8cc-9733-9b64d65c565a	6217	Vremski Britof
00050000-561c-c8cc-8e28-b31df4be64a5	1360	Vrhnika
00050000-561c-c8cc-3752-b20b9e727226	2365	Vuhred
00050000-561c-c8cc-0088-0c97a8453dac	2367	Vuzenica
00050000-561c-c8cc-a672-a26b0fc31d79	8292	Zabukovje 
00050000-561c-c8cc-9f0d-590d9d1db2d5	1410	Zagorje ob Savi
00050000-561c-c8cc-3106-82cc7bf77dbb	1303	Zagradec
00050000-561c-c8cc-f080-b2b0b15ccdaf	2283	Zavrč
00050000-561c-c8cc-5130-65e513ec46f3	8272	Zdole 
00050000-561c-c8cc-45b9-06407f72cebd	4201	Zgornja Besnica
00050000-561c-c8cc-5072-f917ee15657d	2242	Zgornja Korena
00050000-561c-c8cc-207b-578e0815e1a6	2201	Zgornja Kungota
00050000-561c-c8cc-49f1-fe84b4ff7776	2316	Zgornja Ložnica
00050000-561c-c8cc-076e-7699eaff2229	2314	Zgornja Polskava
00050000-561c-c8cc-aac3-2d566d484d36	2213	Zgornja Velka
00050000-561c-c8cc-4b84-c0e5613d7b85	4247	Zgornje Gorje
00050000-561c-c8cc-a295-ffeb0cb0887e	4206	Zgornje Jezersko
00050000-561c-c8cc-f7e2-332d3c76858d	2285	Zgornji Leskovec
00050000-561c-c8cc-5c47-4e2495abeba7	1432	Zidani Most
00050000-561c-c8cc-b7b3-b4056c88e8d0	3214	Zreče
00050000-561c-c8cc-4af1-dab512b3cd19	4209	Žabnica
00050000-561c-c8cc-9a5e-e277066c6f02	3310	Žalec
00050000-561c-c8cc-3831-b343ffeea688	4228	Železniki
00050000-561c-c8cc-16f1-b56ed84cb8c5	2287	Žetale
00050000-561c-c8cc-ff20-ce587098ba06	4226	Žiri
00050000-561c-c8cc-e2ff-1155cfe39a16	4274	Žirovnica
00050000-561c-c8cc-8c37-1d3eda0f6210	8360	Žužemberk
\.


--
-- TOC entry 3057 (class 0 OID 21739733)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21739326)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21739106)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561c-c8ce-358f-3d4fe7093b76	00080000-561c-c8ce-1f7a-888a8ed7e6ae	\N	00040000-561c-c8cc-81fb-870e9ce6b62a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561c-c8ce-8657-7f0255c4d58f	00080000-561c-c8ce-1f7a-888a8ed7e6ae	\N	00040000-561c-c8cc-81fb-870e9ce6b62a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561c-c8ce-73f6-56e09cec5351	00080000-561c-c8ce-b4c4-0ec777af1e1b	\N	00040000-561c-c8cc-81fb-870e9ce6b62a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3019 (class 0 OID 21739210)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21739338)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 21739747)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 21739757)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561c-c8ce-b095-71c9bb49caa6	00080000-561c-c8ce-8ac7-bb994c084f3c	0987	AK
00190000-561c-c8ce-e15b-ed9f6288efde	00080000-561c-c8ce-b4c4-0ec777af1e1b	0989	AK
00190000-561c-c8ce-c127-6652efce8b8e	00080000-561c-c8ce-57b0-0e93344c49a0	0986	AK
00190000-561c-c8ce-6598-07f80ecdb7a5	00080000-561c-c8ce-e805-2d487718db6f	0984	AK
00190000-561c-c8ce-9dd3-70196110744e	00080000-561c-c8ce-0d5c-3c52bf0d9043	0983	AK
00190000-561c-c8ce-8780-b200875d2ad0	00080000-561c-c8ce-62de-aaa6f5a8cd22	0982	AK
00190000-561c-c8cf-3bc3-720ae4a5034f	00080000-561c-c8cf-6475-ae9937ad7bf3	1001	AK
\.


--
-- TOC entry 3056 (class 0 OID 21739672)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561c-c8ce-8e0e-3b5f326f63fc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3060 (class 0 OID 21739765)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21739367)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561c-c8ce-6917-844790619a2f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561c-c8ce-8a41-6232706ee197	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561c-c8ce-8582-fd068f6184f7	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561c-c8ce-c651-9ce7c28ed0c8	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561c-c8ce-933c-cda05ccb986f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561c-c8ce-4b95-ee1c4aa17cda	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561c-c8ce-afbd-dc3636d62954	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3028 (class 0 OID 21739311)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21739301)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 21739511)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21739441)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21739184)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21738979)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561c-c8cf-6475-ae9937ad7bf3	00010000-561c-c8cd-ba95-6b34ca4161ee	2015-10-13 11:03:11	INS	a:0:{}
2	App\\Entity\\Option	00000000-561c-c8cf-6899-f7723fce05c5	00010000-561c-c8cd-ba95-6b34ca4161ee	2015-10-13 11:03:11	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561c-c8cf-3bc3-720ae4a5034f	00010000-561c-c8cd-ba95-6b34ca4161ee	2015-10-13 11:03:11	INS	a:0:{}
\.


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3037 (class 0 OID 21739380)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21739017)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561c-c8cc-11c7-ed228bb0f580	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561c-c8cc-7b2f-8f5959b5f715	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561c-c8cc-2b9a-03d53a7d21c6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561c-c8cc-356e-cf63d1cf7dbe	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561c-c8cc-1dfa-6c83b1990a5b	planer	Planer dogodkov v koledarju	t
00020000-561c-c8cc-79be-47c70046dce2	kadrovska	Kadrovska služba	t
00020000-561c-c8cc-4f1f-b5a797c2af62	arhivar	Ažuriranje arhivalij	t
00020000-561c-c8cc-9ebd-207ce69beaa1	igralec	Igralec	t
00020000-561c-c8cc-8381-0f89bb12ab7a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561c-c8ce-71f9-ad2e6b18e40e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3002 (class 0 OID 21739001)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561c-c8cd-b4f4-23a48b1576e4	00020000-561c-c8cc-2b9a-03d53a7d21c6
00010000-561c-c8cd-ba95-6b34ca4161ee	00020000-561c-c8cc-2b9a-03d53a7d21c6
00010000-561c-c8ce-17a6-ee29bd536835	00020000-561c-c8ce-71f9-ad2e6b18e40e
\.


--
-- TOC entry 3039 (class 0 OID 21739394)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21739332)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21739278)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21738966)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561c-c8cc-11cc-d03b96b8ef66	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561c-c8cc-c5fd-8d2bef0a6dbe	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561c-c8cc-7758-9e6d8e5de7fe	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561c-c8cc-65c6-24324d247ce1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561c-c8cc-ba2a-11ac60582617	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2997 (class 0 OID 21738958)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561c-c8cc-0a60-3747d43241f8	00230000-561c-c8cc-65c6-24324d247ce1	popa
00240000-561c-c8cc-e374-91d988a72172	00230000-561c-c8cc-65c6-24324d247ce1	oseba
00240000-561c-c8cc-36a8-5bd8068e7e95	00230000-561c-c8cc-65c6-24324d247ce1	sezona
00240000-561c-c8cc-8c2d-ca40f647c642	00230000-561c-c8cc-c5fd-8d2bef0a6dbe	prostor
00240000-561c-c8cc-7331-51b7e8c50cb8	00230000-561c-c8cc-65c6-24324d247ce1	besedilo
00240000-561c-c8cc-6353-74c52cf04e8c	00230000-561c-c8cc-65c6-24324d247ce1	uprizoritev
00240000-561c-c8cc-9644-4548113af8c2	00230000-561c-c8cc-65c6-24324d247ce1	funkcija
00240000-561c-c8cc-721e-33fa68f02e04	00230000-561c-c8cc-65c6-24324d247ce1	tipfunkcije
00240000-561c-c8cc-1674-f131cb1ee016	00230000-561c-c8cc-65c6-24324d247ce1	alternacija
00240000-561c-c8cc-9efa-c6fd6f2a7029	00230000-561c-c8cc-11cc-d03b96b8ef66	pogodba
00240000-561c-c8cc-80f0-9821564e2e0b	00230000-561c-c8cc-65c6-24324d247ce1	zaposlitev
00240000-561c-c8cc-7710-53215296f5a8	00230000-561c-c8cc-65c6-24324d247ce1	zvrstuprizoritve
00240000-561c-c8cc-669f-2e218eca130b	00230000-561c-c8cc-11cc-d03b96b8ef66	programdela
00240000-561c-c8cc-7aac-b151a5c6505f	00230000-561c-c8cc-65c6-24324d247ce1	zapis
\.


--
-- TOC entry 2996 (class 0 OID 21738953)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5d07aaf3-64e1-4112-987a-5079bc044fa3	00240000-561c-c8cc-0a60-3747d43241f8	0	1001
\.


--
-- TOC entry 3045 (class 0 OID 21739458)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561c-c8ce-fbd6-5705a59008b4	000e0000-561c-c8ce-6a08-7c7503620b26	00080000-561c-c8ce-1f7a-888a8ed7e6ae	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561c-c8cc-4d8f-3beabd656fdb
00270000-561c-c8ce-d6d7-a6a45c235dd1	000e0000-561c-c8ce-6a08-7c7503620b26	00080000-561c-c8ce-1f7a-888a8ed7e6ae	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561c-c8cc-4d8f-3beabd656fdb
\.


--
-- TOC entry 3009 (class 0 OID 21739079)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21739288)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561c-c8ce-4c11-07a0ec63a888	00180000-561c-c8ce-4f2c-439a584cd1d1	000c0000-561c-c8ce-af08-7e3a5acbac33	00090000-561c-c8ce-4d38-1f7118fdf7df	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-c8ce-8549-043903af3900	00180000-561c-c8ce-4f2c-439a584cd1d1	000c0000-561c-c8ce-5eb1-33c5a325f1de	00090000-561c-c8ce-4b11-050610f558be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-c8ce-e97d-4c4047683fdc	00180000-561c-c8ce-4f2c-439a584cd1d1	000c0000-561c-c8ce-4d28-78020e243698	00090000-561c-c8ce-830f-e1d445dffcc8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-c8ce-4044-e1bbac407890	00180000-561c-c8ce-4f2c-439a584cd1d1	000c0000-561c-c8ce-6a35-6da5a6178c4c	00090000-561c-c8ce-b406-dace54cd148e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-c8ce-66d2-e91bf2f83954	00180000-561c-c8ce-4f2c-439a584cd1d1	000c0000-561c-c8ce-7413-78a30b780be3	00090000-561c-c8ce-1fa8-dff13d856fba	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-c8ce-1dd2-1a432cbbddb2	00180000-561c-c8ce-2128-db8c99a449d8	\N	00090000-561c-c8ce-1fa8-dff13d856fba	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3048 (class 0 OID 21739499)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561c-c8cc-d1f2-4f9100b15c70	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561c-c8cc-827d-0222bc059341	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561c-c8cc-c7a0-f7765dfdb2df	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561c-c8cc-7465-ea8d835b3301	04	Režija	Režija	Režija	umetnik	30
000f0000-561c-c8cc-1a30-7a518eab849c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561c-c8cc-876d-8a844fccc978	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561c-c8cc-ce6d-ffc1cbbf3b6b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561c-c8cc-8261-8e05e5bb4bd4	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561c-c8cc-d6e1-028718ef70e7	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561c-c8cc-f93b-f5d8b2816145	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561c-c8cc-09ee-17748dd1505b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561c-c8cc-fbce-e6371ad6a07c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561c-c8cc-9034-b065a0aad36f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561c-c8cc-56ee-5c64f17da528	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561c-c8cc-c4e8-4e582df2c75e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561c-c8cc-0a20-fe7f445bb47a	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561c-c8cc-b89e-339347b02665	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561c-c8cc-91fb-db4ddbcb7aa2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3061 (class 0 OID 21739776)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561c-c8cc-9791-e75752aefab8	01	Velika predstava	f	1.00	1.00
002b0000-561c-c8cc-56a6-dd45f42181aa	02	Mala predstava	f	0.50	0.50
002b0000-561c-c8cc-0b3f-4512a3bd50dc	03	Mala koprodukcija	t	0.40	1.00
002b0000-561c-c8cc-f129-73e8bd64ab01	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561c-c8cc-17c5-00d7e3252b25	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3014 (class 0 OID 21739141)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21738988)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561c-c8cd-ba95-6b34ca4161ee	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROrAMnBDJ.HNJRTTcG7mVJgIMNZFxEHVO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-77e3-63b2bd8d2840	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-6830-71954ae6b923	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-3518-8ddc558d1d31	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-1ba5-c53eea48f04c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-5c08-b92a4a3ffb46	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-4a5a-f3381f2a3516	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-8f0b-a9e82a7c9b5a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-e469-b30f310b553f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-1b6f-ec16630fc7ee	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561c-c8ce-17a6-ee29bd536835	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561c-c8cd-b4f4-23a48b1576e4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 21739549)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561c-c8ce-3e22-5965d9272087	00160000-561c-c8ce-3a84-311d4d261dd1	\N	00140000-561c-c8cc-c098-695bab149d64	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561c-c8ce-933c-cda05ccb986f
000e0000-561c-c8ce-6a08-7c7503620b26	00160000-561c-c8ce-896f-199adbceea9b	\N	00140000-561c-c8cc-484e-36ad4d5e24a3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561c-c8ce-4b95-ee1c4aa17cda
000e0000-561c-c8ce-6af8-1a95e2638b72	\N	\N	00140000-561c-c8cc-484e-36ad4d5e24a3	00190000-561c-c8ce-b095-71c9bb49caa6	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561c-c8ce-933c-cda05ccb986f
000e0000-561c-c8ce-ea9a-6298670e7c4a	\N	\N	00140000-561c-c8cc-484e-36ad4d5e24a3	00190000-561c-c8ce-b095-71c9bb49caa6	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561c-c8ce-933c-cda05ccb986f
000e0000-561c-c8ce-9159-40d9c96cfcc9	\N	\N	00140000-561c-c8cc-484e-36ad4d5e24a3	00190000-561c-c8ce-b095-71c9bb49caa6	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561c-c8ce-6917-844790619a2f
000e0000-561c-c8ce-2f60-781ad9247f26	\N	\N	00140000-561c-c8cc-484e-36ad4d5e24a3	00190000-561c-c8ce-b095-71c9bb49caa6	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561c-c8ce-6917-844790619a2f
\.


--
-- TOC entry 3021 (class 0 OID 21739232)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561c-c8ce-dc1d-1af84bbb22b2	000e0000-561c-c8ce-6a08-7c7503620b26	\N	1	
00200000-561c-c8ce-c971-3ca7c88e32c6	000e0000-561c-c8ce-6a08-7c7503620b26	\N	2	
00200000-561c-c8ce-2f08-5ab0fb594980	000e0000-561c-c8ce-6a08-7c7503620b26	\N	3	
00200000-561c-c8ce-7f5a-eb00448483c5	000e0000-561c-c8ce-6a08-7c7503620b26	\N	4	
00200000-561c-c8ce-d7ce-c41a5a1a62a8	000e0000-561c-c8ce-6a08-7c7503620b26	\N	5	
\.


--
-- TOC entry 3035 (class 0 OID 21739359)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21739472)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561c-c8cc-4abb-8e7e76e40d7d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561c-c8cc-b40c-0c2285542d32	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561c-c8cc-e5a5-8538d23c5e67	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561c-c8cc-d782-29b9cf9fc217	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561c-c8cc-d4ec-8eb596631471	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561c-c8cc-5b86-a51f506d1f39	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561c-c8cc-d227-ceb47892f2f3	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561c-c8cc-5600-e4e9ed8ae56d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561c-c8cc-4d8f-3beabd656fdb	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561c-c8cc-bf71-ed1ed00b3d78	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561c-c8cc-0e27-82f13462ccb8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561c-c8cc-8179-120cb0586799	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561c-c8cc-0586-7b170de7c2c9	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561c-c8cc-3eb2-775dcb734116	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561c-c8cc-f9d5-90bbcff644d7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561c-c8cc-4642-35d7be00aecb	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561c-c8cc-96aa-3a3ec2e30f7d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561c-c8cc-5c87-857fa51be5ce	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561c-c8cc-02ac-5ee976910dfb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561c-c8cc-7efd-59295d86f150	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561c-c8cc-a668-444dd8d8f171	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561c-c8cc-dbb1-6319313b92f4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561c-c8cc-f3c9-0427656a13d3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561c-c8cc-5e8d-a98988b6af71	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561c-c8cc-2cbb-0e3ced2cfc17	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561c-c8cc-76d8-2df505c996ab	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561c-c8cc-6d36-1fd322c39bd9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561c-c8cc-b9ec-ba8ea0f942db	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3064 (class 0 OID 21739823)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 21739795)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 21739835)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21739431)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561c-c8ce-2134-9078a44c94c2	00090000-561c-c8ce-4b11-050610f558be	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-c8ce-9775-fa8984bf9761	00090000-561c-c8ce-830f-e1d445dffcc8	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-c8ce-60b3-1e8f1c8b16f6	00090000-561c-c8ce-df17-ef7aa9900e88	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-c8ce-52ed-9e45ed2ba64b	00090000-561c-c8ce-b61c-f3b7b5f41614	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-c8ce-82c3-d9ce4d8d3be8	00090000-561c-c8ce-4d38-1f7118fdf7df	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-c8ce-4c8b-a37e0aae667f	00090000-561c-c8ce-ef03-3108ab987ae8	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3023 (class 0 OID 21739267)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21739539)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561c-c8cc-c098-695bab149d64	01	Drama	drama (SURS 01)
00140000-561c-c8cc-1ce1-cf35fbcac049	02	Opera	opera (SURS 02)
00140000-561c-c8cc-d840-d7592f077c6e	03	Balet	balet (SURS 03)
00140000-561c-c8cc-2593-64246a3ca2f5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561c-c8cc-a23c-968ac47cb74a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561c-c8cc-484e-36ad4d5e24a3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561c-c8cc-c439-0a33905caff7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3041 (class 0 OID 21739421)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2528 (class 2606 OID 21739042)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 21739598)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21739588)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21739455)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21739497)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 21739875)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21739256)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21739277)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 21739793)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21739167)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21739666)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21739417)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21739230)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21739205)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 21739181)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21739324)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 21739852)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 21739859)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2782 (class 2606 OID 21739883)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21729918)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2640 (class 2606 OID 21739351)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 21739139)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21739051)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21739075)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21739031)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2519 (class 2606 OID 21739016)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21739357)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21739393)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21739534)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21739103)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 21739127)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21739745)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 21739330)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21739117)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 21739218)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21739342)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21739754)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 21739762)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 21739732)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21739774)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21739375)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21739315)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21739306)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 21739521)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21739448)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21739193)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 21738987)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 21739384)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21739005)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2521 (class 2606 OID 21739025)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21739402)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21739337)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21739286)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21738975)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21738963)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 21738957)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 21739468)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21739084)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21739297)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 21739508)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21739786)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21739152)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 21739000)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21739567)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 21739240)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 21739365)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21739480)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 21739833)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 21739817)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 21739841)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21739439)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 21739271)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 21739547)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 21739429)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 1259 OID 21739265)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2593 (class 1259 OID 21739266)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2594 (class 1259 OID 21739264)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2595 (class 1259 OID 21739263)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2596 (class 1259 OID 21739262)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2682 (class 1259 OID 21739469)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2683 (class 1259 OID 21739470)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2684 (class 1259 OID 21739471)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2768 (class 1259 OID 21739854)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2769 (class 1259 OID 21739853)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2542 (class 1259 OID 21739105)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2641 (class 1259 OID 21739358)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2755 (class 1259 OID 21739821)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2756 (class 1259 OID 21739820)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2757 (class 1259 OID 21739822)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2758 (class 1259 OID 21739819)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2759 (class 1259 OID 21739818)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2635 (class 1259 OID 21739344)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 21739343)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2587 (class 1259 OID 21739241)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 21739418)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 21739420)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 21739419)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2567 (class 1259 OID 21739183)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 21739182)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2746 (class 1259 OID 21739775)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2698 (class 1259 OID 21739536)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 21739537)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2700 (class 1259 OID 21739538)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2765 (class 1259 OID 21739842)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2707 (class 1259 OID 21739572)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2708 (class 1259 OID 21739569)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2709 (class 1259 OID 21739573)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2710 (class 1259 OID 21739571)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2711 (class 1259 OID 21739570)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2557 (class 1259 OID 21739154)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 21739153)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 21739078)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 21739385)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 21739032)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2524 (class 1259 OID 21739033)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 21739405)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 21739404)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 21739403)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 21739219)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 21739220)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2503 (class 1259 OID 21738965)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2615 (class 1259 OID 21739310)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2616 (class 1259 OID 21739308)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2617 (class 1259 OID 21739307)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2618 (class 1259 OID 21739309)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 21739006)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2515 (class 1259 OID 21739007)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2644 (class 1259 OID 21739366)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2778 (class 1259 OID 21739876)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2680 (class 1259 OID 21739457)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 21739456)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2779 (class 1259 OID 21739884)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2780 (class 1259 OID 21739885)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2630 (class 1259 OID 21739331)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 21739449)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 21739450)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 21739671)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2729 (class 1259 OID 21739670)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2730 (class 1259 OID 21739667)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2731 (class 1259 OID 21739668)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2732 (class 1259 OID 21739669)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2546 (class 1259 OID 21739119)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 21739118)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2548 (class 1259 OID 21739120)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2647 (class 1259 OID 21739379)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2648 (class 1259 OID 21739378)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2738 (class 1259 OID 21739755)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 21739756)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2721 (class 1259 OID 21739602)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 21739603)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2723 (class 1259 OID 21739600)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2724 (class 1259 OID 21739601)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 21739440)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 21739319)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2622 (class 1259 OID 21739318)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2623 (class 1259 OID 21739316)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2624 (class 1259 OID 21739317)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2717 (class 1259 OID 21739590)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 21739589)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21739194)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2574 (class 1259 OID 21739208)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2575 (class 1259 OID 21739207)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2576 (class 1259 OID 21739206)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2577 (class 1259 OID 21739209)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2586 (class 1259 OID 21739231)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 21739746)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2754 (class 1259 OID 21739794)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2772 (class 1259 OID 21739860)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2773 (class 1259 OID 21739861)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2529 (class 1259 OID 21739053)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 21739052)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2538 (class 1259 OID 21739085)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21739086)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 21739272)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 21739300)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 21739299)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2612 (class 1259 OID 21739298)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 21739258)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2598 (class 1259 OID 21739259)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2599 (class 1259 OID 21739257)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2600 (class 1259 OID 21739261)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2601 (class 1259 OID 21739260)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2545 (class 1259 OID 21739104)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 21739168)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 21739170)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2565 (class 1259 OID 21739169)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2566 (class 1259 OID 21739171)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2629 (class 1259 OID 21739325)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 21739535)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 21739568)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 21739509)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2695 (class 1259 OID 21739510)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2536 (class 1259 OID 21739076)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21739077)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 21739430)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 21738976)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 21739140)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2506 (class 1259 OID 21738964)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2751 (class 1259 OID 21739787)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 21739377)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 21739376)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2725 (class 1259 OID 21739599)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2553 (class 1259 OID 21739128)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 21739548)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 21739834)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2744 (class 1259 OID 21739763)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 21739764)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21739498)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2609 (class 1259 OID 21739287)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 21739026)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2813 (class 2606 OID 21740016)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2812 (class 2606 OID 21740021)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2808 (class 2606 OID 21740041)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2814 (class 2606 OID 21740011)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2810 (class 2606 OID 21740031)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2809 (class 2606 OID 21740036)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2811 (class 2606 OID 21740026)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2849 (class 2606 OID 21740206)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2848 (class 2606 OID 21740211)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21740216)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2881 (class 2606 OID 21740381)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2882 (class 2606 OID 21740376)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21739941)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 21740126)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2876 (class 2606 OID 21740361)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 21740356)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2875 (class 2606 OID 21740366)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 21740351)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2879 (class 2606 OID 21740346)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2829 (class 2606 OID 21740121)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2830 (class 2606 OID 21740116)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2807 (class 2606 OID 21740006)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21740166)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2839 (class 2606 OID 21740176)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2840 (class 2606 OID 21740171)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2800 (class 2606 OID 21739976)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 2606 OID 21739971)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2827 (class 2606 OID 21740106)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 21740336)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 21740221)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 21740226)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 21740231)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2880 (class 2606 OID 21740371)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2854 (class 2606 OID 21740251)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2857 (class 2606 OID 21740236)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2853 (class 2606 OID 21740256)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2855 (class 2606 OID 21740246)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2856 (class 2606 OID 21740241)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2798 (class 2606 OID 21739966)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 21739961)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 21739926)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2791 (class 2606 OID 21739921)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 21740146)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2787 (class 2606 OID 21739901)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2786 (class 2606 OID 21739906)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2836 (class 2606 OID 21740161)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2837 (class 2606 OID 21740156)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2838 (class 2606 OID 21740151)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2805 (class 2606 OID 21739991)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 21739996)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 21739886)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2819 (class 2606 OID 21740081)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2821 (class 2606 OID 21740071)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2822 (class 2606 OID 21740066)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2820 (class 2606 OID 21740076)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2785 (class 2606 OID 21739891)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 21739896)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2832 (class 2606 OID 21740131)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2885 (class 2606 OID 21740396)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 21740201)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 21740196)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2887 (class 2606 OID 21740401)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2886 (class 2606 OID 21740406)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 21740111)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2844 (class 2606 OID 21740186)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2843 (class 2606 OID 21740191)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2864 (class 2606 OID 21740311)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2865 (class 2606 OID 21740306)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 21740291)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2867 (class 2606 OID 21740296)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2866 (class 2606 OID 21740301)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2796 (class 2606 OID 21739951)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21739946)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 21739956)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 21740141)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2834 (class 2606 OID 21740136)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 21740321)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2870 (class 2606 OID 21740326)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2861 (class 2606 OID 21740281)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2860 (class 2606 OID 21740286)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2863 (class 2606 OID 21740271)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2862 (class 2606 OID 21740276)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 21740181)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2823 (class 2606 OID 21740101)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2824 (class 2606 OID 21740096)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2826 (class 2606 OID 21740086)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2825 (class 2606 OID 21740091)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2858 (class 2606 OID 21740266)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 21740261)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2802 (class 2606 OID 21739981)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2803 (class 2606 OID 21739986)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21740001)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2869 (class 2606 OID 21740316)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2872 (class 2606 OID 21740331)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 21740341)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2884 (class 2606 OID 21740386)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2883 (class 2606 OID 21740391)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 21739916)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 21739911)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2793 (class 2606 OID 21739931)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 21739936)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21740046)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 21740061)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21740056)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2818 (class 2606 OID 21740051)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-13 11:03:13 CEST

--
-- PostgreSQL database dump complete
--

