--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-19 10:22:12 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 248 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 248
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22399950)
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
-- TOC entry 232 (class 1259 OID 22400540)
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
-- TOC entry 231 (class 1259 OID 22400523)
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
-- TOC entry 222 (class 1259 OID 22400400)
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
-- TOC entry 225 (class 1259 OID 22400430)
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
-- TOC entry 246 (class 1259 OID 22400811)
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
-- TOC entry 199 (class 1259 OID 22400180)
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
-- TOC entry 201 (class 1259 OID 22400211)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 22400737)
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
-- TOC entry 192 (class 1259 OID 22400093)
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
-- TOC entry 233 (class 1259 OID 22400553)
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
-- TOC entry 218 (class 1259 OID 22400354)
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
-- TOC entry 197 (class 1259 OID 22400159)
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
-- TOC entry 195 (class 1259 OID 22400133)
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
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22400110)
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
-- TOC entry 207 (class 1259 OID 22400268)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 244 (class 1259 OID 22400792)
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
-- TOC entry 245 (class 1259 OID 22400804)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 22400826)
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
-- TOC entry 211 (class 1259 OID 22400293)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22400067)
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
-- TOC entry 183 (class 1259 OID 22399969)
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
-- TOC entry 187 (class 1259 OID 22400033)
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
-- TOC entry 184 (class 1259 OID 22399980)
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
-- TOC entry 178 (class 1259 OID 22399924)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22399943)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22400300)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 22400334)
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
-- TOC entry 228 (class 1259 OID 22400471)
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
-- TOC entry 186 (class 1259 OID 22400013)
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
-- TOC entry 189 (class 1259 OID 22400059)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22400682)
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
-- TOC entry 208 (class 1259 OID 22400274)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22400044)
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
-- TOC entry 196 (class 1259 OID 22400148)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 210 (class 1259 OID 22400286)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 22400696)
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
-- TOC entry 237 (class 1259 OID 22400706)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 22400621)
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
-- TOC entry 238 (class 1259 OID 22400714)
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
-- TOC entry 214 (class 1259 OID 22400315)
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
-- TOC entry 206 (class 1259 OID 22400259)
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
-- TOC entry 205 (class 1259 OID 22400249)
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
-- TOC entry 227 (class 1259 OID 22400460)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 22400390)
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
-- TOC entry 194 (class 1259 OID 22400122)
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
-- TOC entry 175 (class 1259 OID 22399895)
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
-- TOC entry 174 (class 1259 OID 22399893)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 215 (class 1259 OID 22400328)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22399933)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22399917)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 22400342)
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
-- TOC entry 209 (class 1259 OID 22400280)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 22400226)
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
-- TOC entry 173 (class 1259 OID 22399882)
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
-- TOC entry 172 (class 1259 OID 22399874)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22399869)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 223 (class 1259 OID 22400407)
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
-- TOC entry 185 (class 1259 OID 22400005)
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
-- TOC entry 204 (class 1259 OID 22400236)
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
-- TOC entry 226 (class 1259 OID 22400448)
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
-- TOC entry 182 (class 1259 OID 22399959)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 239 (class 1259 OID 22400725)
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
-- TOC entry 202 (class 1259 OID 22400216)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22400079)
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
-- TOC entry 176 (class 1259 OID 22399904)
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
-- TOC entry 230 (class 1259 OID 22400498)
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
-- TOC entry 198 (class 1259 OID 22400170)
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
-- TOC entry 213 (class 1259 OID 22400307)
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
-- TOC entry 224 (class 1259 OID 22400421)
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
-- TOC entry 242 (class 1259 OID 22400772)
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
-- TOC entry 241 (class 1259 OID 22400744)
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
-- TOC entry 243 (class 1259 OID 22400784)
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
-- TOC entry 220 (class 1259 OID 22400379)
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
-- TOC entry 200 (class 1259 OID 22400205)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 229 (class 1259 OID 22400488)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 219 (class 1259 OID 22400369)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2215 (class 2604 OID 22399898)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3044 (class 0 OID 22399950)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22400540)
-- Dependencies: 232
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5624-a831-3f91-8c4f0592961c	000d0000-5624-a831-1db9-2bd9ccc66c82	\N	00090000-5624-a831-6691-88caab415552	000b0000-5624-a831-c40b-88f6b56572fd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5624-a831-c690-f5960f839d2d	000d0000-5624-a831-238f-988ce491a50c	00100000-5624-a831-13b8-1c60ba5221eb	00090000-5624-a831-8dbf-17a7edcf669f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5624-a831-7b79-0ba20cf7cb56	000d0000-5624-a831-621c-18c92d29e9a5	00100000-5624-a831-8e45-1dc0da506290	00090000-5624-a831-f3a9-7b6a8ee66f95	\N	0003	t	\N	2015-10-19	\N	2	t	\N	f	f
000c0000-5624-a831-9452-22382bf4b3c5	000d0000-5624-a831-c29e-c492140882ff	\N	00090000-5624-a831-f863-26c70d843e3d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5624-a831-d486-cfecf64e5777	000d0000-5624-a831-d734-12c551f06aee	\N	00090000-5624-a831-626c-ca6b0fb78549	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5624-a831-e97a-372ffc8a9c3d	000d0000-5624-a831-e548-0eba96177215	\N	00090000-5624-a831-09b3-d491628c2c83	000b0000-5624-a831-9a72-21b3b308d1b6	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5624-a831-826d-1a2daa668222	000d0000-5624-a831-e071-cde4674e966c	00100000-5624-a831-3bee-1d84a6189ffe	00090000-5624-a831-f097-29aa4647dc24	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5624-a831-a024-e243dbf43ddb	000d0000-5624-a831-e287-88bc98144b45	\N	00090000-5624-a831-ab94-a2c0138f34e1	000b0000-5624-a831-f0ec-612303ec7650	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5624-a831-fde5-3a869ee72be2	000d0000-5624-a831-e071-cde4674e966c	00100000-5624-a831-48a7-584ddb54afcd	00090000-5624-a831-bbd6-4c2738a634e9	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5624-a831-80c5-1553e382beb3	000d0000-5624-a831-e071-cde4674e966c	00100000-5624-a831-7080-1907e6624bd3	00090000-5624-a831-1389-019cfdc6d775	\N	0010	t	\N	2015-10-19	\N	16	f	\N	f	t
000c0000-5624-a831-c317-4a6a02e2bc21	000d0000-5624-a831-e071-cde4674e966c	00100000-5624-a831-aa41-a51734cd4364	00090000-5624-a831-38b8-89bf3cdd8ccb	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5624-a831-f8c9-bed6a7a3b348	000d0000-5624-a831-792e-ffa7d2ca2868	\N	00090000-5624-a831-8dbf-17a7edcf669f	000b0000-5624-a831-a840-3ba3d6773f50	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3094 (class 0 OID 22400523)
-- Dependencies: 231
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22400400)
-- Dependencies: 222
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5624-a831-d200-35f8fe9f338a	00160000-5624-a831-0638-b4f522fd8188	00090000-5624-a831-44a5-b736f3d7c762	aizv	10	t
003d0000-5624-a831-b906-f3358a5c7f39	00160000-5624-a831-0638-b4f522fd8188	00090000-5624-a831-e9de-98ab80e56e0d	apri	14	t
003d0000-5624-a831-2b5f-e89d6ee050e9	00160000-5624-a831-f765-0b1378180265	00090000-5624-a831-68ef-585dc2f5cb26	aizv	11	t
003d0000-5624-a831-6e43-ead7839305d3	00160000-5624-a831-0dd3-348510fb01a8	00090000-5624-a831-609c-0aeffdf2988f	aizv	12	t
003d0000-5624-a831-4938-caa17818ebe1	00160000-5624-a831-0638-b4f522fd8188	00090000-5624-a831-94ad-a6fba66b5d8a	apri	18	f
\.


--
-- TOC entry 3088 (class 0 OID 22400430)
-- Dependencies: 225
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5624-a831-0638-b4f522fd8188	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5624-a831-f765-0b1378180265	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5624-a831-0dd3-348510fb01a8	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3109 (class 0 OID 22400811)
-- Dependencies: 246
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22400180)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5624-a831-12f2-bb31fee1572a	\N	\N	00200000-5624-a831-b54c-fb46d2e25304	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5624-a831-0feb-4c803c940b2a	\N	\N	00200000-5624-a831-a7f0-986c541f9e8b	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5624-a831-65de-372b9445cf2a	\N	\N	00200000-5624-a831-f624-282fdc90a4ce	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5624-a831-cab0-11bc14cb0312	\N	\N	00200000-5624-a831-edfc-74223fbe2ce1	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5624-a831-d5d8-a63f5edc150a	\N	\N	00200000-5624-a831-a745-2e0e269386ff	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3064 (class 0 OID 22400211)
-- Dependencies: 201
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22400737)
-- Dependencies: 240
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22400093)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5624-a82f-b0f2-a9cd76dd5d1d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5624-a82f-ff5a-2be81cd44ec9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5624-a82f-78e9-e708434f013a	AL	ALB	008	Albania 	Albanija	\N
00040000-5624-a82f-8693-d46ea778636c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5624-a82f-5329-a9c4930e3023	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5624-a82f-6aaf-c3f2c8a1dd19	AD	AND	020	Andorra 	Andora	\N
00040000-5624-a82f-a360-92e9205d716d	AO	AGO	024	Angola 	Angola	\N
00040000-5624-a82f-f772-4908a73776a3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5624-a82f-9728-44f5c8b421b9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5624-a82f-2081-fe0c86a14f8d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-a82f-78f0-8024d6e10e1c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5624-a82f-7810-b14ce01c31fe	AM	ARM	051	Armenia 	Armenija	\N
00040000-5624-a82f-0a26-8bb4ccd60659	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5624-a82f-d466-c02361d750f7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5624-a82f-12aa-78f029d6b894	AT	AUT	040	Austria 	Avstrija	\N
00040000-5624-a82f-fd93-73b3662d1322	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5624-a82f-276f-12557a03dd10	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5624-a82f-ce27-6a013a8580e1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5624-a82f-98c5-9204eec9f4dc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5624-a82f-67b9-92e07354c9b6	BB	BRB	052	Barbados 	Barbados	\N
00040000-5624-a82f-50f5-5e7415f85be9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5624-a82f-6de4-eb4a7f3bbc90	BE	BEL	056	Belgium 	Belgija	\N
00040000-5624-a82f-69a7-00b743caac3b	BZ	BLZ	084	Belize 	Belize	\N
00040000-5624-a82f-1483-ec6d9321fed8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5624-a82f-4ccb-11559cf5f2b4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5624-a82f-070c-0167305dbae4	BT	BTN	064	Bhutan 	Butan	\N
00040000-5624-a82f-203d-6158ab9c8237	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5624-a82f-b326-7eaf78ba3e5a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5624-a82f-1b09-37b0db7852dd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5624-a82f-e0e7-70651b5672cd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5624-a82f-49f9-c9c12803da5c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5624-a82f-0779-658be6f146da	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5624-a82f-b0dd-78f3c987d4ab	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5624-a82f-7627-6f0e1799aa9f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5624-a82f-35ae-83a5b1c9a495	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5624-a82f-366f-b83c51cb47d6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5624-a82f-14a3-f7ad9f31cfdd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5624-a82f-6fc4-74902a8d674b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5624-a82f-e826-927490f4e8bb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5624-a82f-155d-175bbbb3ca20	CA	CAN	124	Canada 	Kanada	\N
00040000-5624-a82f-dc3a-de0b62751804	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5624-a82f-9a9a-a43deab8bddb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5624-a82f-38b6-681719ab12d0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5624-a82f-5605-7fffec9a5ea2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5624-a82f-6a90-c5deb16b9551	CL	CHL	152	Chile 	Čile	\N
00040000-5624-a82f-992f-10d866d06d12	CN	CHN	156	China 	Kitajska	\N
00040000-5624-a82f-a6dd-d11f617604c9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5624-a82f-f3ea-45a8f4cf4f72	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5624-a82f-2a80-fc006c83b52b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5624-a82f-cc13-588a55aafebe	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5624-a82f-65af-cf4a77dcd310	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5624-a82f-a903-4ab73ab54ad6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5624-a82f-a7fa-b3090026c10e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5624-a82f-c8af-e21cc997a862	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5624-a82f-c23e-e79567edd678	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5624-a82f-f49c-88a62c9ad93e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5624-a82f-0421-3ffe24ee9f88	CU	CUB	192	Cuba 	Kuba	\N
00040000-5624-a82f-e624-b98a32e0933a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5624-a82f-e084-cbaa7f5cc2bf	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5624-a82f-8b3f-d02a11248002	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5624-a82f-4638-3c1e89bdcf98	DK	DNK	208	Denmark 	Danska	\N
00040000-5624-a82f-5c22-acb3bbc89c48	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5624-a82f-8e73-d9da8d25d2ee	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-a82f-ab17-2e1a5295ea62	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5624-a82f-b90a-bbb41fb5e504	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5624-a82f-ccad-5f80eb4f2f33	EG	EGY	818	Egypt 	Egipt	\N
00040000-5624-a82f-44ba-ea82bcc3968d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5624-a82f-f7c2-5fbdd1e92cb6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5624-a82f-4749-d09a972e4442	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5624-a82f-b51d-79fae181838e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5624-a82f-89af-0c14b36f3380	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5624-a82f-0a1a-36f7c1ba186d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5624-a82f-c565-9512d181ea03	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5624-a82f-df4c-e2fd0811c5cf	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5624-a82f-c1de-8a83d7534e06	FI	FIN	246	Finland 	Finska	\N
00040000-5624-a82f-7cfc-b74b41cf9c32	FR	FRA	250	France 	Francija	\N
00040000-5624-a82f-b0f8-74fab3b1f20c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5624-a82f-b483-9ab978761e4a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5624-a82f-8ece-07d96d4f1c30	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5624-a82f-ff0d-2169cdd4b6ea	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5624-a82f-4bcf-60fada7bbd4e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5624-a82f-09db-da6faec673de	GM	GMB	270	Gambia 	Gambija	\N
00040000-5624-a82f-31a2-631fa447a3af	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5624-a82f-1487-664ac268e2fa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5624-a82f-3c72-d0f65c9c1fb7	GH	GHA	288	Ghana 	Gana	\N
00040000-5624-a82f-aaeb-167350ed3eac	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5624-a82f-53c2-b267cc87d516	GR	GRC	300	Greece 	Grčija	\N
00040000-5624-a82f-a66f-b4ee3c7dd02c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5624-a82f-db63-e9767b1e4f73	GD	GRD	308	Grenada 	Grenada	\N
00040000-5624-a82f-6a2c-42b546c83b7b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5624-a82f-5c14-75bec75a5af7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5624-a82f-7e66-3e3bd3a03c53	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5624-a82f-2b5c-21900ccc8c57	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5624-a82f-054f-70677c558453	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5624-a82f-0925-45fae0284e35	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5624-a82f-dd8b-adc1244999bc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5624-a82f-2eac-9a891528a9eb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5624-a82f-bbe0-d003611a3ece	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5624-a82f-c31c-0bcb7366789d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5624-a82f-656a-87dc3b52da38	HN	HND	340	Honduras 	Honduras	\N
00040000-5624-a82f-aecd-cefe59eadf89	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5624-a82f-5d68-cbde22797f87	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5624-a82f-2768-651d52f0ef04	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5624-a82f-1985-b988b6f15561	IN	IND	356	India 	Indija	\N
00040000-5624-a82f-f236-3961b02da4b3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5624-a82f-952f-c2fe2a7f8681	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5624-a82f-9004-b56e02f5cdf9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5624-a82f-7ef9-67af3303f1c5	IE	IRL	372	Ireland 	Irska	\N
00040000-5624-a82f-dad6-135fc69a7938	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5624-a82f-dd29-faa3106ddcb4	IL	ISR	376	Israel 	Izrael	\N
00040000-5624-a82f-5f88-02e8e8fcbb53	IT	ITA	380	Italy 	Italija	\N
00040000-5624-a82f-6ff5-a73f4ed705ac	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5624-a82f-cfba-65a11bfa982a	JP	JPN	392	Japan 	Japonska	\N
00040000-5624-a82f-a0f4-c33b124af3ff	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5624-a82f-9775-cdc1c30917e1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5624-a82f-a32b-6ae1b4756e16	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5624-a82f-0c3d-d27168b7857d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5624-a82f-bee8-eb94b04a8267	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5624-a82f-c389-89477fbeb5ea	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5624-a82f-ab74-901c36289350	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5624-a82f-2c70-e1d8b9f31971	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5624-a82f-79ee-276312f6b0ac	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5624-a82f-904d-c88382b4a842	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5624-a82f-2479-982472cfd964	LV	LVA	428	Latvia 	Latvija	\N
00040000-5624-a82f-09ba-dbd0ba8cc1fb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5624-a82f-7b91-140825748fda	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5624-a82f-e822-c8ba04b04bb0	LR	LBR	430	Liberia 	Liberija	\N
00040000-5624-a82f-cade-1636d5b56471	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5624-a82f-e4fd-c945c71d2aa0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5624-a82f-c28f-9cbf6156b835	LT	LTU	440	Lithuania 	Litva	\N
00040000-5624-a82f-ef9e-2310d3f4d204	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5624-a82f-b518-4a008c94f980	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5624-a82f-bf02-cafd4a8ad946	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5624-a82f-ffd9-c150d9f7f1fa	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5624-a82f-baf1-efa7a6e78de6	MW	MWI	454	Malawi 	Malavi	\N
00040000-5624-a82f-a1f8-4dca545e3d15	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5624-a82f-a050-cedafb92f9bb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5624-a82f-d433-588ae48063c0	ML	MLI	466	Mali 	Mali	\N
00040000-5624-a82f-f71b-5bfa3182cab0	MT	MLT	470	Malta 	Malta	\N
00040000-5624-a82f-1054-e7c7ee85079c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5624-a82f-2106-9c645a77a553	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5624-a82f-d438-3329c2b254bf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5624-a82f-f52a-097e2d5aa346	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5624-a82f-f092-115c0a422684	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5624-a82f-038e-9da2305e722f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5624-a82f-ed3f-57308a5c4afb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5624-a82f-6ac7-db185a743c15	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5624-a82f-1c94-de79e22c076d	MC	MCO	492	Monaco 	Monako	\N
00040000-5624-a82f-cb4a-79a705808796	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5624-a82f-ae3f-173d37987bb3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5624-a82f-052b-81130faef142	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5624-a82f-7612-81d04ac0fc29	MA	MAR	504	Morocco 	Maroko	\N
00040000-5624-a82f-06cd-e4709ad60605	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5624-a82f-ba95-ea07e7d66e2b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5624-a82f-8fdb-06416de6fad2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5624-a82f-fee9-16beb08cbcc1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5624-a82f-2acb-6c0de9739785	NP	NPL	524	Nepal 	Nepal	\N
00040000-5624-a82f-8916-81d47673d198	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5624-a82f-1ca0-c6236f5d027d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5624-a82f-bae7-044a268939f9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5624-a82f-1e02-e9946d119b24	NE	NER	562	Niger 	Niger 	\N
00040000-5624-a82f-d40a-4a88f7b987c3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5624-a82f-dcf4-8dcef055402e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5624-a82f-ad7d-12449032ed97	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5624-a82f-d64a-3fdeb9ee32dc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5624-a82f-e799-e1b03fda2e51	NO	NOR	578	Norway 	Norveška	\N
00040000-5624-a82f-e989-8c9ed73e4707	OM	OMN	512	Oman 	Oman	\N
00040000-5624-a82f-c0d4-b0de689b0476	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5624-a82f-e006-7d9447e04838	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5624-a82f-0e7d-e61bc8d27b35	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5624-a82f-bc0b-2acd7baa0d0e	PA	PAN	591	Panama 	Panama	\N
00040000-5624-a82f-7575-36993e65b5f8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5624-a82f-59a9-92b66ee051ca	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5624-a82f-2bab-b1b6a681b9fe	PE	PER	604	Peru 	Peru	\N
00040000-5624-a82f-38d9-593039c3faba	PH	PHL	608	Philippines 	Filipini	\N
00040000-5624-a82f-ab78-d1345aff9dea	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5624-a82f-45f6-8bd500598850	PL	POL	616	Poland 	Poljska	\N
00040000-5624-a82f-3807-ae0d9c4fbb82	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5624-a82f-e454-8e14759e1513	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5624-a82f-61b6-10338391d13d	QA	QAT	634	Qatar 	Katar	\N
00040000-5624-a82f-3350-1437618e4827	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5624-a82f-1106-ae6582f70d31	RO	ROU	642	Romania 	Romunija	\N
00040000-5624-a82f-9dc6-8937556533f7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5624-a82f-9df2-cb1261f36503	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5624-a82f-a685-32cf69a6fd8b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5624-a82f-d551-7632546c2ce4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5624-a82f-9c16-0b0d380ee1d4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5624-a82f-eb7b-5a1bedf82289	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5624-a82f-7fb9-a62b2f628950	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5624-a82f-2fd7-3bdbecae99db	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5624-a82f-5664-0703fcb836c6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5624-a82f-5a60-bd995836e2df	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5624-a82f-31d6-3ec6393d6d7a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5624-a82f-9a94-68936ac4cefd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5624-a82f-be97-95f78be3ca8f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5624-a82f-e25f-8bcc29363ded	SN	SEN	686	Senegal 	Senegal	\N
00040000-5624-a82f-3a54-577ad76619df	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5624-a82f-b072-c056767aba43	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5624-a82f-1c55-735fbf24b000	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5624-a82f-476d-4279ee8f390f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5624-a82f-3650-eef614b84f5d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5624-a82f-9dcc-4ae01142e1c1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5624-a82f-ebdf-8d2fe8912185	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5624-a82f-3df5-c040858b28b8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5624-a82f-d624-cbffa57d42bf	SO	SOM	706	Somalia 	Somalija	\N
00040000-5624-a82f-b91e-a5f6c41ac3c1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5624-a82f-cc17-c3904d50b7c2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5624-a82f-f2ae-5886921dd78a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5624-a82f-a35f-469f6b07e184	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5624-a82f-8741-e71fca2d4dd1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5624-a82f-0001-069a17e9791f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5624-a82f-e42a-0b0ca15d37e5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5624-a82f-4800-79346e67d7c7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5624-a82f-b64f-103a6b814bcd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5624-a82f-7a1f-a342feea5987	SE	SWE	752	Sweden 	Švedska	\N
00040000-5624-a82f-47c2-6398b7a8d779	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5624-a82f-72e0-cb9ba5cbf97e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5624-a82f-68d8-e791d585067c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5624-a82f-932f-8b56b5788d8c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5624-a82f-c946-5e65d238b765	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5624-a82f-a87d-fea29e84419a	TH	THA	764	Thailand 	Tajska	\N
00040000-5624-a82f-1dc4-e8b1a021a3e5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5624-a82f-d167-f4e7ad88bf3c	TG	TGO	768	Togo 	Togo	\N
00040000-5624-a82f-3577-b3e6353d8532	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5624-a82f-70ee-71d368b57783	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5624-a82f-296e-865a17cc705e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5624-a82f-46c3-e619b512b86e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5624-a82f-d943-ad058282eff9	TR	TUR	792	Turkey 	Turčija	\N
00040000-5624-a82f-0229-ea6ca844ae70	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5624-a82f-365e-8661d268cb3c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-a82f-2161-3d40c9067c33	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5624-a82f-89ab-2733a26a0038	UG	UGA	800	Uganda 	Uganda	\N
00040000-5624-a82f-c937-6c841e2004d7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5624-a82f-07a9-824a32552a5f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5624-a82f-218c-77822f12c15f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5624-a82f-6a34-dbfe6425c9f4	US	USA	840	United States 	Združene države Amerike	\N
00040000-5624-a82f-fffe-a2ced504b949	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5624-a82f-ed88-bebfed98fa9c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5624-a82f-a9fb-b696ecf9a797	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5624-a82f-d062-c9e2f5cf4caa	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5624-a82f-1cda-b05d7900e6bd	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5624-a82f-af30-95280ed65106	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5624-a82f-ccc0-115df77eaf11	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-a82f-0ff1-c84f3dc0f318	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5624-a82f-65d7-59e76a183032	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5624-a82f-e26e-aa15d1259998	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5624-a82f-900a-c829b31a8cc1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5624-a82f-d05d-247d570721c2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5624-a82f-a82b-3445f09fc4ae	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3096 (class 0 OID 22400553)
-- Dependencies: 233
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5624-a831-5d6a-2e3e4c63fbbd	000e0000-5624-a831-5d15-4ffb9491a381	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-a82f-4135-07dff793f1f7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-a831-e874-00b81bf213b7	000e0000-5624-a831-2ecf-0f4da77b9201	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-a82f-3285-2e5874a09815	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-a831-2580-7f1f297f50d3	000e0000-5624-a831-d56f-3883d12fdbdc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-a82f-4135-07dff793f1f7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-a831-a4e1-bd9566d2e8e1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-a831-6ccd-3ef1b42d3132	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3081 (class 0 OID 22400354)
-- Dependencies: 218
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5624-a831-1db9-2bd9ccc66c82	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-3f91-8c4f0592961c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-a82f-a91e-19ca2cf6e75e
000d0000-5624-a831-238f-988ce491a50c	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-c690-f5960f839d2d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5624-a82f-1c9a-43d3d1cf004e
000d0000-5624-a831-621c-18c92d29e9a5	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-7b79-0ba20cf7cb56	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5624-a82f-bcde-0fe289854fe3
000d0000-5624-a831-c29e-c492140882ff	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-9452-22382bf4b3c5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5624-a82f-fbea-2d3372f2370e
000d0000-5624-a831-d734-12c551f06aee	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-d486-cfecf64e5777	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5624-a82f-fbea-2d3372f2370e
000d0000-5624-a831-e548-0eba96177215	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-e97a-372ffc8a9c3d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-a82f-a91e-19ca2cf6e75e
000d0000-5624-a831-e071-cde4674e966c	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-fde5-3a869ee72be2	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5624-a82f-a91e-19ca2cf6e75e
000d0000-5624-a831-e287-88bc98144b45	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-a024-e243dbf43ddb	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5624-a82f-f6a1-1a81fb6324b1
000d0000-5624-a831-792e-ffa7d2ca2868	000e0000-5624-a831-2ecf-0f4da77b9201	000c0000-5624-a831-f8c9-bed6a7a3b348	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5624-a82f-0fd5-ad222a1b81da
\.


--
-- TOC entry 3060 (class 0 OID 22400159)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22400133)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22400110)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5624-a831-e0f2-624ca3135a9a	00080000-5624-a831-e54f-12a88712a31c	00090000-5624-a831-1389-019cfdc6d775	AK		igralka
\.


--
-- TOC entry 3070 (class 0 OID 22400268)
-- Dependencies: 207
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22400792)
-- Dependencies: 244
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 22400804)
-- Dependencies: 245
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22400826)
-- Dependencies: 247
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 22028081)
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
-- TOC entry 3074 (class 0 OID 22400293)
-- Dependencies: 211
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 22400067)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5624-a830-49f4-4eb90a1dbb15	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5624-a830-20b4-467670c802b2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5624-a830-a22d-5e443d569792	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5624-a830-a09b-35aa0511b873	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5624-a830-bec6-71bb28f0c931	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5624-a830-fd4a-e5758dc33fda	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5624-a830-755e-4f559cbac8c1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5624-a830-f555-251f72754935	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-a830-e3e6-58d45dca662e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-a830-1c72-8e7d9a61f2b6	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5624-a830-cba8-668b498fac3c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5624-a830-323d-6548e2719459	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5624-a830-d621-cf4e9c28f2aa	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5624-a830-4bcf-4d1df9fced40	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5624-a830-7fcf-9f6cecb33903	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5624-a831-d763-af4a71dd1d1e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5624-a831-5894-9306bf80b461	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5624-a831-6678-e0d111fbcb03	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5624-a831-e95f-81cae958eb23	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5624-a831-b8da-2e1e76f897b1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5624-a832-0518-5455f014b945	application.tenant.maticnopodjetje	string	s:36:"00080000-5624-a832-22fd-c1d7b2d86f31";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3046 (class 0 OID 22399969)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5624-a831-9984-ceb3137bdf87	00000000-5624-a831-d763-af4a71dd1d1e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5624-a831-d6a1-ea64fbce42bd	00000000-5624-a831-d763-af4a71dd1d1e	00010000-5624-a830-d54a-481eff2e1262	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5624-a831-2d2b-8cca47297926	00000000-5624-a831-5894-9306bf80b461	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3050 (class 0 OID 22400033)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5624-a831-3ab0-af2344d8e5f2	\N	00100000-5624-a831-13b8-1c60ba5221eb	00100000-5624-a831-8e45-1dc0da506290	01	Gledališče Nimbis
00410000-5624-a831-6c83-d7d851539cde	00410000-5624-a831-3ab0-af2344d8e5f2	00100000-5624-a831-13b8-1c60ba5221eb	00100000-5624-a831-8e45-1dc0da506290	02	Tehnika
\.


--
-- TOC entry 3047 (class 0 OID 22399980)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5624-a831-6691-88caab415552	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5624-a831-f863-26c70d843e3d	00010000-5624-a831-986b-2d7aa7e88496	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5624-a831-f3a9-7b6a8ee66f95	00010000-5624-a831-0449-282720e000a2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5624-a831-bbd6-4c2738a634e9	00010000-5624-a831-ab5d-0bd0313a9d36	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5624-a831-ce59-9e5417e8f3ff	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5624-a831-09b3-d491628c2c83	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5624-a831-38b8-89bf3cdd8ccb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5624-a831-f097-29aa4647dc24	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5624-a831-1389-019cfdc6d775	00010000-5624-a831-eb0f-e343cc2565b9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5624-a831-8dbf-17a7edcf669f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5624-a831-29e1-9181a843841f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-a831-626c-ca6b0fb78549	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5624-a831-ab94-a2c0138f34e1	00010000-5624-a831-3ccb-d01e460522d6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-a831-44a5-b736f3d7c762	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-a831-e9de-98ab80e56e0d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-a831-68ef-585dc2f5cb26	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-a831-609c-0aeffdf2988f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5624-a831-94ad-a6fba66b5d8a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 22399924)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5624-a82f-a52d-33d9da74d847	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5624-a82f-bad1-00c7a14e0a6f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5624-a82f-5a86-72d9ce405e44	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5624-a82f-013c-e4a7c9db2f1a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5624-a82f-3319-ca33dd4e7748	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5624-a82f-94c3-69126ecf1e23	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5624-a82f-1ddf-41b10e64fd1e	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5624-a82f-a09c-44941bd75103	Abonma-read	Abonma - branje	f
00030000-5624-a82f-eea2-8942ee00235d	Abonma-write	Abonma - spreminjanje	f
00030000-5624-a82f-14ab-91ef2ac92c4b	Alternacija-read	Alternacija - branje	f
00030000-5624-a82f-e975-f44fd089c6df	Alternacija-write	Alternacija - spreminjanje	f
00030000-5624-a82f-2f51-d39d9019e44b	Arhivalija-read	Arhivalija - branje	f
00030000-5624-a82f-8f4a-bc5fce778572	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5624-a82f-efbf-4993a600676b	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5624-a82f-4e6e-0e36d78f9ddd	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5624-a82f-26ca-57c2ff66a04c	Besedilo-read	Besedilo - branje	f
00030000-5624-a82f-d15b-932313667709	Besedilo-write	Besedilo - spreminjanje	f
00030000-5624-a82f-a561-58e9d00f89ed	DogodekIzven-read	DogodekIzven - branje	f
00030000-5624-a82f-1202-dad2ca5ce84d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5624-a82f-fbf8-093dbd556ded	Dogodek-read	Dogodek - branje	f
00030000-5624-a82f-fa5f-e81347d2ef68	Dogodek-write	Dogodek - spreminjanje	f
00030000-5624-a82f-3cf6-7f7739d1bcf7	DrugiVir-read	DrugiVir - branje	f
00030000-5624-a82f-9fa6-b7ad22d5aa2c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5624-a82f-bff6-849b04b3ff6c	Drzava-read	Drzava - branje	f
00030000-5624-a82f-e6c0-bb256ef09b69	Drzava-write	Drzava - spreminjanje	f
00030000-5624-a82f-5b9e-bdc7d2f613f1	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5624-a82f-1339-febdce70ce27	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5624-a82f-428b-c9e15e7d57a4	Funkcija-read	Funkcija - branje	f
00030000-5624-a82f-4a81-b6989287fe29	Funkcija-write	Funkcija - spreminjanje	f
00030000-5624-a82f-714a-d419be57c730	Gostovanje-read	Gostovanje - branje	f
00030000-5624-a82f-27b2-a9e6140657e4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5624-a82f-18df-29b3480d7c7b	Gostujoca-read	Gostujoca - branje	f
00030000-5624-a82f-ba98-5c01d5272a7c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5624-a82f-57a4-b0df221fcb39	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5624-a82f-a171-568238425d74	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5624-a82f-9d58-cd35e7190385	Kupec-read	Kupec - branje	f
00030000-5624-a82f-8e4f-4aa07d57c37c	Kupec-write	Kupec - spreminjanje	f
00030000-5624-a82f-4538-ec5df8cfc90b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5624-a82f-c574-8e8cb7c5e32d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5624-a82f-338f-59a4f61b3302	Option-read	Option - branje	f
00030000-5624-a82f-ba5a-444281b11c51	Option-write	Option - spreminjanje	f
00030000-5624-a82f-dc91-94c135114218	OptionValue-read	OptionValue - branje	f
00030000-5624-a82f-e083-839f4a3d7573	OptionValue-write	OptionValue - spreminjanje	f
00030000-5624-a82f-2a7e-351e075882ac	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5624-a82f-7ee6-10c31fbf38ef	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5624-a82f-9c0b-a0e31fc094a3	Oseba-read	Oseba - branje	f
00030000-5624-a82f-d7e8-694b838f3d25	Oseba-write	Oseba - spreminjanje	f
00030000-5624-a82f-d5cb-af324ebb5887	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5624-a82f-d5c6-aeb821103900	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5624-a82f-6d3c-198cea4be546	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5624-a82f-7812-99cf5517cdfd	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5624-a82f-cc90-37990e7cf851	Pogodba-read	Pogodba - branje	f
00030000-5624-a82f-b43d-b2d89b9d4ebe	Pogodba-write	Pogodba - spreminjanje	f
00030000-5624-a82f-5e43-35b3d3b6d21b	Popa-read	Popa - branje	f
00030000-5624-a82f-7a42-2b68593ff7c5	Popa-write	Popa - spreminjanje	f
00030000-5624-a82f-b2b1-5e6d71a6e487	Posta-read	Posta - branje	f
00030000-5624-a82f-3286-3eaef1f8bbc1	Posta-write	Posta - spreminjanje	f
00030000-5624-a82f-5557-6abae6755c00	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5624-a82f-83e1-c2b5800ea020	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5624-a82f-b6f6-fecab013b68f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5624-a82f-a44d-1049d1343db0	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5624-a82f-b21e-ce7b3f557b75	PostniNaslov-read	PostniNaslov - branje	f
00030000-5624-a82f-8191-9adf0a344dd5	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5624-a82f-984e-d4db024ac401	Predstava-read	Predstava - branje	f
00030000-5624-a82f-b1cf-e43be9d443b5	Predstava-write	Predstava - spreminjanje	f
00030000-5624-a82f-ae38-d97057b6a4f1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5624-a82f-a094-8126ecaa64c0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5624-a82f-771b-8126d24d50a3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5624-a82f-1b91-d0a53176d23b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5624-a82f-a6c5-d06792908dcf	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5624-a82f-c4de-056513c390d8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5624-a82f-3976-ca2373141962	ProgramDela-read	ProgramDela - branje	f
00030000-5624-a82f-3fe4-e4323670f932	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5624-a82f-64cb-b6a2cf24cedf	ProgramFestival-read	ProgramFestival - branje	f
00030000-5624-a82f-07bf-7002478afa21	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5624-a82f-e339-78e1f685238f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5624-a82f-1356-f18342bf0405	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5624-a82f-1595-c01ce0258119	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5624-a82f-b096-52c4d4aa0da6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5624-a82f-589a-fb1e0c3ba0fb	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5624-a82f-854d-24275c5ce1d1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5624-a82f-643b-f3b277deabfc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5624-a82f-1aa7-e56c1c829df2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5624-a82f-35e7-ced7bd631909	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5624-a82f-f444-3fadacd677ab	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5624-a82f-8dda-64e16c5155b9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5624-a82f-a55d-bb55c72b0bc0	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5624-a82f-10d4-5339f5c47454	ProgramRazno-read	ProgramRazno - branje	f
00030000-5624-a82f-a171-f21ab95cdc0a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5624-a82f-2844-005948325e0d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5624-a82f-b490-9e450ba598ca	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5624-a82f-9496-a66be7e107eb	Prostor-read	Prostor - branje	f
00030000-5624-a82f-5439-17244d4d8fbb	Prostor-write	Prostor - spreminjanje	f
00030000-5624-a82f-fb94-98077140ef5f	Racun-read	Racun - branje	f
00030000-5624-a82f-0087-5d179c38807a	Racun-write	Racun - spreminjanje	f
00030000-5624-a82f-972f-29e85d74491b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5624-a82f-9461-e61db9d7c4b7	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5624-a82f-80cc-467d49b5d9c4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5624-a82f-49ff-9f55da02c702	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5624-a82f-4969-d3333d710dbc	Rekvizit-read	Rekvizit - branje	f
00030000-5624-a82f-ee99-de167ce89526	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5624-a82f-0aeb-538a14e66f54	Revizija-read	Revizija - branje	f
00030000-5624-a82f-7502-ed0b81c6f9c8	Revizija-write	Revizija - spreminjanje	f
00030000-5624-a82f-3bda-ec91fdfc226d	Rezervacija-read	Rezervacija - branje	f
00030000-5624-a82f-f991-209cfabc27ff	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5624-a82f-d95d-0c199b0242aa	SedezniRed-read	SedezniRed - branje	f
00030000-5624-a82f-e3f7-4d0eeef89771	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5624-a82f-1453-eef4fbe0f5c8	Sedez-read	Sedez - branje	f
00030000-5624-a82f-9f7b-c9b4281a4eda	Sedez-write	Sedez - spreminjanje	f
00030000-5624-a82f-6abf-e0bb1cb1deb4	Sezona-read	Sezona - branje	f
00030000-5624-a82f-c307-edf5e2d6f54a	Sezona-write	Sezona - spreminjanje	f
00030000-5624-a82f-6951-7701e26600ff	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5624-a82f-311c-d637cd47229d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5624-a82f-88be-2a72b8ba84e0	Stevilcenje-read	Stevilcenje - branje	f
00030000-5624-a82f-3346-332865a6762d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5624-a82f-a59a-8166583bce7f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5624-a82f-812b-76617c013710	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5624-a82f-9482-5a2118f371e3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5624-a82f-0212-6c9e3f4a5021	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5624-a82f-2474-38d4630d5a5a	Telefonska-read	Telefonska - branje	f
00030000-5624-a82f-b4f6-af9f6166fa93	Telefonska-write	Telefonska - spreminjanje	f
00030000-5624-a82f-c33c-3aba4594a02b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5624-a82f-b18e-d981b1d10260	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5624-a82f-e9a1-5167c409a9ca	TipFunkcije-read	TipFunkcije - branje	f
00030000-5624-a82f-03ab-2fa76716d34d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5624-a82f-71b0-e3984f599739	TipPopa-read	TipPopa - branje	f
00030000-5624-a82f-b78b-563e997c7315	TipPopa-write	TipPopa - spreminjanje	f
00030000-5624-a82f-1175-d44afe2dbd90	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5624-a82f-3593-48955b393693	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5624-a82f-bd71-b3a8324e1e53	TipVaje-read	TipVaje - branje	f
00030000-5624-a82f-c8d6-53b0e6b770dd	TipVaje-write	TipVaje - spreminjanje	f
00030000-5624-a82f-9b65-f97c622da6cb	Trr-read	Trr - branje	f
00030000-5624-a82f-5d2b-2b35a53132ed	Trr-write	Trr - spreminjanje	f
00030000-5624-a82f-0fc1-87bb1f00cc52	Uprizoritev-read	Uprizoritev - branje	f
00030000-5624-a82f-2a8b-986c2c5e45c7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5624-a82f-0d46-e6be74cef0d4	Vaja-read	Vaja - branje	f
00030000-5624-a82f-021a-9266a8b628f2	Vaja-write	Vaja - spreminjanje	f
00030000-5624-a82f-3897-3179eee3b9b7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5624-a82f-a8ee-097202cb6a8e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5624-a82f-f0e0-f65d5631341c	VrstaStroska-read	VrstaStroska - branje	f
00030000-5624-a82f-200b-52fe3c04fa5b	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5624-a82f-9bcc-3da83f609b0a	Zaposlitev-read	Zaposlitev - branje	f
00030000-5624-a82f-2916-cb3bdfdf887d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5624-a82f-bd55-5ec4251f286a	Zasedenost-read	Zasedenost - branje	f
00030000-5624-a82f-9843-d01af9086f61	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5624-a82f-411e-4180914918bb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5624-a82f-f4c9-21a83b889bcf	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5624-a82f-ed62-bca4caa44ed8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5624-a82f-a949-c36a52111438	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5624-a82f-c069-9eedd8466e84	Job-read	Branje opravil - samo zase - branje	f
00030000-5624-a82f-7a8a-f883ce5e15b3	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5624-a82f-f8fa-4ccd819d7b81	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5624-a82f-3014-a3b3d3d80820	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5624-a82f-6edd-f28d64d16c0d	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5624-a82f-a3e2-b34adfed6593	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5624-a82f-d5bb-efdcbc9d2a6b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5624-a82f-cf72-a8f31293a19f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-a82f-9fdd-7402f71dae72	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-a82f-8051-b636ec189add	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-a82f-d483-3e12084be0d1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-a82f-d781-980627caf2e0	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5624-a82f-4873-bbda75728740	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5624-a82f-8130-5108056c915b	Datoteka-write	Datoteka - spreminjanje	f
00030000-5624-a82f-272e-8a497456f08d	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3043 (class 0 OID 22399943)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5624-a82f-de6a-5b530e823fa4	00030000-5624-a82f-bad1-00c7a14e0a6f
00020000-5624-a82f-6c97-396f0f7b0c22	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-a09c-44941bd75103
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-eea2-8942ee00235d
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-14ab-91ef2ac92c4b
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-e975-f44fd089c6df
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-2f51-d39d9019e44b
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-fbf8-093dbd556ded
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-013c-e4a7c9db2f1a
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-fa5f-e81347d2ef68
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-e6c0-bb256ef09b69
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-428b-c9e15e7d57a4
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-4a81-b6989287fe29
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-714a-d419be57c730
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-27b2-a9e6140657e4
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-18df-29b3480d7c7b
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-ba98-5c01d5272a7c
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-57a4-b0df221fcb39
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-a171-568238425d74
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-338f-59a4f61b3302
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-dc91-94c135114218
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-9c0b-a0e31fc094a3
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-d7e8-694b838f3d25
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-5e43-35b3d3b6d21b
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-7a42-2b68593ff7c5
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-b2b1-5e6d71a6e487
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-3286-3eaef1f8bbc1
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-b21e-ce7b3f557b75
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-8191-9adf0a344dd5
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-984e-d4db024ac401
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-b1cf-e43be9d443b5
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-a6c5-d06792908dcf
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-c4de-056513c390d8
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-9496-a66be7e107eb
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-5439-17244d4d8fbb
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-80cc-467d49b5d9c4
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-49ff-9f55da02c702
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-4969-d3333d710dbc
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-ee99-de167ce89526
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-6abf-e0bb1cb1deb4
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-c307-edf5e2d6f54a
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-e9a1-5167c409a9ca
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-0fc1-87bb1f00cc52
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-2a8b-986c2c5e45c7
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-0d46-e6be74cef0d4
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-021a-9266a8b628f2
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-bd55-5ec4251f286a
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-9843-d01af9086f61
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-411e-4180914918bb
00020000-5624-a830-d1df-7e332d17a1df	00030000-5624-a82f-ed62-bca4caa44ed8
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-a09c-44941bd75103
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-2f51-d39d9019e44b
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-fbf8-093dbd556ded
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-714a-d419be57c730
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-18df-29b3480d7c7b
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-57a4-b0df221fcb39
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-a171-568238425d74
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-338f-59a4f61b3302
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-dc91-94c135114218
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-9c0b-a0e31fc094a3
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-d7e8-694b838f3d25
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-5e43-35b3d3b6d21b
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-b2b1-5e6d71a6e487
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-b21e-ce7b3f557b75
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-8191-9adf0a344dd5
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-984e-d4db024ac401
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-9496-a66be7e107eb
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-80cc-467d49b5d9c4
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-4969-d3333d710dbc
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-6abf-e0bb1cb1deb4
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-2474-38d4630d5a5a
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-b4f6-af9f6166fa93
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-9b65-f97c622da6cb
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-5d2b-2b35a53132ed
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-9bcc-3da83f609b0a
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-2916-cb3bdfdf887d
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-411e-4180914918bb
00020000-5624-a830-c42c-182467da9593	00030000-5624-a82f-ed62-bca4caa44ed8
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-a09c-44941bd75103
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-14ab-91ef2ac92c4b
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-2f51-d39d9019e44b
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-8f4a-bc5fce778572
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-26ca-57c2ff66a04c
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-a561-58e9d00f89ed
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-fbf8-093dbd556ded
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-428b-c9e15e7d57a4
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-714a-d419be57c730
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-18df-29b3480d7c7b
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-57a4-b0df221fcb39
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-338f-59a4f61b3302
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-dc91-94c135114218
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-9c0b-a0e31fc094a3
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-5e43-35b3d3b6d21b
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-b2b1-5e6d71a6e487
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-984e-d4db024ac401
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-a6c5-d06792908dcf
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-9496-a66be7e107eb
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-80cc-467d49b5d9c4
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-4969-d3333d710dbc
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-6abf-e0bb1cb1deb4
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-e9a1-5167c409a9ca
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-0d46-e6be74cef0d4
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-bd55-5ec4251f286a
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-411e-4180914918bb
00020000-5624-a830-b68b-7429b031168d	00030000-5624-a82f-ed62-bca4caa44ed8
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-a09c-44941bd75103
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-eea2-8942ee00235d
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-e975-f44fd089c6df
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-2f51-d39d9019e44b
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-fbf8-093dbd556ded
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-714a-d419be57c730
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-18df-29b3480d7c7b
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-338f-59a4f61b3302
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-dc91-94c135114218
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-5e43-35b3d3b6d21b
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-b2b1-5e6d71a6e487
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-984e-d4db024ac401
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-9496-a66be7e107eb
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-80cc-467d49b5d9c4
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-4969-d3333d710dbc
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-6abf-e0bb1cb1deb4
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-e9a1-5167c409a9ca
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-411e-4180914918bb
00020000-5624-a830-108a-94ebf3339495	00030000-5624-a82f-ed62-bca4caa44ed8
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-a09c-44941bd75103
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-2f51-d39d9019e44b
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-fbf8-093dbd556ded
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-714a-d419be57c730
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-18df-29b3480d7c7b
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-338f-59a4f61b3302
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-dc91-94c135114218
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-5e43-35b3d3b6d21b
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-b2b1-5e6d71a6e487
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-984e-d4db024ac401
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-9496-a66be7e107eb
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-80cc-467d49b5d9c4
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-4969-d3333d710dbc
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-6abf-e0bb1cb1deb4
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-c33c-3aba4594a02b
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-5a86-72d9ce405e44
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-e9a1-5167c409a9ca
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-411e-4180914918bb
00020000-5624-a830-2da4-eddfd8a55420	00030000-5624-a82f-ed62-bca4caa44ed8
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a52d-33d9da74d847
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-bad1-00c7a14e0a6f
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-5a86-72d9ce405e44
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-013c-e4a7c9db2f1a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3319-ca33dd4e7748
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-94c3-69126ecf1e23
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1ddf-41b10e64fd1e
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a09c-44941bd75103
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-eea2-8942ee00235d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-14ab-91ef2ac92c4b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-e975-f44fd089c6df
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-2f51-d39d9019e44b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-8f4a-bc5fce778572
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-26ca-57c2ff66a04c
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-d15b-932313667709
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a561-58e9d00f89ed
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1202-dad2ca5ce84d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-fbf8-093dbd556ded
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-fa5f-e81347d2ef68
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-bff6-849b04b3ff6c
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-e6c0-bb256ef09b69
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3cf6-7f7739d1bcf7
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9fa6-b7ad22d5aa2c
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-5b9e-bdc7d2f613f1
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1339-febdce70ce27
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-428b-c9e15e7d57a4
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-4a81-b6989287fe29
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-714a-d419be57c730
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-27b2-a9e6140657e4
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-18df-29b3480d7c7b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-ba98-5c01d5272a7c
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-57a4-b0df221fcb39
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a171-568238425d74
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9d58-cd35e7190385
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-8e4f-4aa07d57c37c
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-4538-ec5df8cfc90b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-c574-8e8cb7c5e32d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-338f-59a4f61b3302
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-ba5a-444281b11c51
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-dc91-94c135114218
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-e083-839f4a3d7573
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9c0b-a0e31fc094a3
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-d7e8-694b838f3d25
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-d5cb-af324ebb5887
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-d5c6-aeb821103900
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-6d3c-198cea4be546
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-7812-99cf5517cdfd
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-cc90-37990e7cf851
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b43d-b2d89b9d4ebe
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-5e43-35b3d3b6d21b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-7a42-2b68593ff7c5
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b2b1-5e6d71a6e487
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3286-3eaef1f8bbc1
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-5557-6abae6755c00
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-83e1-c2b5800ea020
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b6f6-fecab013b68f
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a44d-1049d1343db0
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b21e-ce7b3f557b75
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-8191-9adf0a344dd5
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-984e-d4db024ac401
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b1cf-e43be9d443b5
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-ae38-d97057b6a4f1
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a094-8126ecaa64c0
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-771b-8126d24d50a3
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1b91-d0a53176d23b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a6c5-d06792908dcf
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-c4de-056513c390d8
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3976-ca2373141962
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3fe4-e4323670f932
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-64cb-b6a2cf24cedf
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-07bf-7002478afa21
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-e339-78e1f685238f
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1356-f18342bf0405
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1595-c01ce0258119
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b096-52c4d4aa0da6
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-589a-fb1e0c3ba0fb
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-854d-24275c5ce1d1
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-643b-f3b277deabfc
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1aa7-e56c1c829df2
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-35e7-ced7bd631909
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-f444-3fadacd677ab
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-8dda-64e16c5155b9
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a55d-bb55c72b0bc0
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-10d4-5339f5c47454
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a171-f21ab95cdc0a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-2844-005948325e0d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b490-9e450ba598ca
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9496-a66be7e107eb
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-5439-17244d4d8fbb
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-fb94-98077140ef5f
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-0087-5d179c38807a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-972f-29e85d74491b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9461-e61db9d7c4b7
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-80cc-467d49b5d9c4
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-49ff-9f55da02c702
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-4969-d3333d710dbc
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-ee99-de167ce89526
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-0aeb-538a14e66f54
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-7502-ed0b81c6f9c8
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3bda-ec91fdfc226d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-f991-209cfabc27ff
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-d95d-0c199b0242aa
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-e3f7-4d0eeef89771
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1453-eef4fbe0f5c8
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9f7b-c9b4281a4eda
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-6abf-e0bb1cb1deb4
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-c307-edf5e2d6f54a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-6951-7701e26600ff
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-311c-d637cd47229d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-88be-2a72b8ba84e0
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3346-332865a6762d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a59a-8166583bce7f
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-812b-76617c013710
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9482-5a2118f371e3
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-0212-6c9e3f4a5021
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-2474-38d4630d5a5a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b4f6-af9f6166fa93
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-c33c-3aba4594a02b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-b18e-d981b1d10260
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-e9a1-5167c409a9ca
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-03ab-2fa76716d34d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-1175-d44afe2dbd90
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3593-48955b393693
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9b65-f97c622da6cb
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-5d2b-2b35a53132ed
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-0fc1-87bb1f00cc52
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-2a8b-986c2c5e45c7
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-0d46-e6be74cef0d4
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-021a-9266a8b628f2
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-3897-3179eee3b9b7
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a8ee-097202cb6a8e
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-f0e0-f65d5631341c
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-200b-52fe3c04fa5b
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9bcc-3da83f609b0a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-2916-cb3bdfdf887d
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-bd55-5ec4251f286a
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-9843-d01af9086f61
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-411e-4180914918bb
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-f4c9-21a83b889bcf
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-ed62-bca4caa44ed8
00020000-5624-a831-eb41-7594f86e7eda	00030000-5624-a82f-a949-c36a52111438
\.


--
-- TOC entry 3075 (class 0 OID 22400300)
-- Dependencies: 212
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22400334)
-- Dependencies: 216
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22400471)
-- Dependencies: 228
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5624-a831-c40b-88f6b56572fd	00090000-5624-a831-6691-88caab415552	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5624-a831-9a72-21b3b308d1b6	00090000-5624-a831-09b3-d491628c2c83	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5624-a831-f0ec-612303ec7650	00090000-5624-a831-ab94-a2c0138f34e1	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5624-a831-a840-3ba3d6773f50	00090000-5624-a831-8dbf-17a7edcf669f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3049 (class 0 OID 22400013)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5624-a831-e54f-12a88712a31c	\N	00040000-5624-a82f-ebdf-8d2fe8912185	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-826a-e6a9ff0cae85	\N	00040000-5624-a82f-ebdf-8d2fe8912185	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5624-a831-17ef-5a1818f7efe2	\N	00040000-5624-a82f-ebdf-8d2fe8912185	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-7b20-d45559b5a2be	\N	00040000-5624-a82f-ebdf-8d2fe8912185	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-c040-d8a45bec6090	\N	00040000-5624-a82f-ebdf-8d2fe8912185	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-ae60-33fb8a978c03	\N	00040000-5624-a82f-78f0-8024d6e10e1c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-0b17-f88519c9497b	\N	00040000-5624-a82f-f49c-88a62c9ad93e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-e79f-fdd8d9466171	\N	00040000-5624-a82f-12aa-78f029d6b894	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a831-390e-fac590dfc8d6	\N	00040000-5624-a82f-1487-664ac268e2fa	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-a832-22fd-c1d7b2d86f31	\N	00040000-5624-a82f-ebdf-8d2fe8912185	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3052 (class 0 OID 22400059)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5624-a82f-3fee-ff88d47dd36a	8341	Adlešiči
00050000-5624-a82f-467d-629b526494d3	5270	Ajdovščina
00050000-5624-a82f-af5a-7c252cdc0959	6280	Ankaran/Ancarano
00050000-5624-a82f-bb69-aa81205ec779	9253	Apače
00050000-5624-a82f-5a49-f3e82200ac0d	8253	Artiče
00050000-5624-a82f-8e44-62c75e1ac544	4275	Begunje na Gorenjskem
00050000-5624-a82f-23a9-83c891f08e60	1382	Begunje pri Cerknici
00050000-5624-a82f-bdb9-9fe42b85944b	9231	Beltinci
00050000-5624-a82f-7fe4-f491ef864712	2234	Benedikt
00050000-5624-a82f-b61f-5abe6f94f922	2345	Bistrica ob Dravi
00050000-5624-a82f-6ade-f0cd5e4ed237	3256	Bistrica ob Sotli
00050000-5624-a82f-3e18-cd965bcf823a	8259	Bizeljsko
00050000-5624-a82f-a4ac-e048456c7245	1223	Blagovica
00050000-5624-a82f-dfdb-6b1e927404b0	8283	Blanca
00050000-5624-a82f-2246-9c333fb1922d	4260	Bled
00050000-5624-a82f-2c00-ea6c34184bc2	4273	Blejska Dobrava
00050000-5624-a82f-5881-76459f781486	9265	Bodonci
00050000-5624-a82f-75d5-ae3466af9dbd	9222	Bogojina
00050000-5624-a82f-881c-85095e45df1d	4263	Bohinjska Bela
00050000-5624-a82f-0122-f713f4eac52e	4264	Bohinjska Bistrica
00050000-5624-a82f-ef9b-13596e0a473c	4265	Bohinjsko jezero
00050000-5624-a82f-ade2-f8a3a57abdc6	1353	Borovnica
00050000-5624-a82f-8afd-f55833d0b3b6	8294	Boštanj
00050000-5624-a82f-1d6d-0e347a4eeb71	5230	Bovec
00050000-5624-a82f-11d0-8ef015e59a97	5295	Branik
00050000-5624-a82f-ca0e-418dfab7ea81	3314	Braslovče
00050000-5624-a82f-5fa1-903bc1402ff8	5223	Breginj
00050000-5624-a82f-7614-cd5987a09f3f	8280	Brestanica
00050000-5624-a82f-026a-2fff45910b8c	2354	Bresternica
00050000-5624-a82f-d2f1-ea8e39842fcf	4243	Brezje
00050000-5624-a82f-20fb-a425c297fe46	1351	Brezovica pri Ljubljani
00050000-5624-a82f-73aa-cffb7160a99f	8250	Brežice
00050000-5624-a82f-ceab-d69a584cfa69	4210	Brnik - Aerodrom
00050000-5624-a82f-415f-159ccc8c360a	8321	Brusnice
00050000-5624-a82f-8ab0-50f47776d34e	3255	Buče
00050000-5624-a82f-b37c-052423253b94	8276	Bučka 
00050000-5624-a82f-521d-391509624f1d	9261	Cankova
00050000-5624-a82f-8560-343fea34d1c9	3000	Celje 
00050000-5624-a82f-65af-b19a3f81f370	3001	Celje - poštni predali
00050000-5624-a82f-c487-08d87507e518	4207	Cerklje na Gorenjskem
00050000-5624-a82f-ded7-6845adb80ff1	8263	Cerklje ob Krki
00050000-5624-a82f-a2a8-b3956993d56e	1380	Cerknica
00050000-5624-a82f-5733-f3da44dde710	5282	Cerkno
00050000-5624-a82f-a415-5d37f317d64a	2236	Cerkvenjak
00050000-5624-a82f-a046-5c2d4130b59f	2215	Ceršak
00050000-5624-a82f-7ee6-f0c25a8fc645	2326	Cirkovce
00050000-5624-a82f-298a-6644c8f70975	2282	Cirkulane
00050000-5624-a82f-5e93-d2138c86078a	5273	Col
00050000-5624-a82f-1bd5-1efdb106c424	8251	Čatež ob Savi
00050000-5624-a82f-80e8-cc859daf029c	1413	Čemšenik
00050000-5624-a82f-74a6-b572c536431a	5253	Čepovan
00050000-5624-a82f-0447-63c13ba51542	9232	Črenšovci
00050000-5624-a82f-3b2e-f15776f69994	2393	Črna na Koroškem
00050000-5624-a82f-8201-36171ca2fe53	6275	Črni Kal
00050000-5624-a82f-08c8-d1737cc9c27a	5274	Črni Vrh nad Idrijo
00050000-5624-a82f-47b1-4fc5dd08e623	5262	Črniče
00050000-5624-a82f-8593-1cc0abf08dad	8340	Črnomelj
00050000-5624-a82f-4df2-bcca7447a174	6271	Dekani
00050000-5624-a82f-fc73-75f1b01467f1	5210	Deskle
00050000-5624-a82f-2a6a-b6ae11d64d0e	2253	Destrnik
00050000-5624-a82f-1298-9f60a655d17d	6215	Divača
00050000-5624-a82f-7c54-44eff90046e8	1233	Dob
00050000-5624-a82f-1649-fe88561e99c3	3224	Dobje pri Planini
00050000-5624-a82f-3370-7e7d512b32b4	8257	Dobova
00050000-5624-a82f-fd27-935f286ae7b1	1423	Dobovec
00050000-5624-a82f-425f-674d2496993a	5263	Dobravlje
00050000-5624-a82f-3a11-fadff0c32606	3204	Dobrna
00050000-5624-a82f-8768-4cb516c34a92	8211	Dobrnič
00050000-5624-a82f-614d-2a5fe7fa92d2	1356	Dobrova
00050000-5624-a82f-f46d-2861e0ddb153	9223	Dobrovnik/Dobronak 
00050000-5624-a82f-7004-3485a5ad8e88	5212	Dobrovo v Brdih
00050000-5624-a82f-e7ee-c173e1067a69	1431	Dol pri Hrastniku
00050000-5624-a82f-bdd4-5eb1cf5955aa	1262	Dol pri Ljubljani
00050000-5624-a82f-ce74-3bc320a14f96	1273	Dole pri Litiji
00050000-5624-a82f-7b0a-7f78ef00fdfd	1331	Dolenja vas
00050000-5624-a82f-4697-b98072b2e424	8350	Dolenjske Toplice
00050000-5624-a82f-6cfa-f4c4c21ce476	1230	Domžale
00050000-5624-a82f-77c1-e88793fe19c2	2252	Dornava
00050000-5624-a82f-7a4b-94a91a85c896	5294	Dornberk
00050000-5624-a82f-2d9e-789b183c94ec	1319	Draga
00050000-5624-a82f-18af-2ffbc5ef3bda	8343	Dragatuš
00050000-5624-a82f-9867-a59bed66d578	3222	Dramlje
00050000-5624-a82f-da0a-78e2e60ca43c	2370	Dravograd
00050000-5624-a82f-5853-83df76c2073f	4203	Duplje
00050000-5624-a82f-4359-3c2cf5de5604	6221	Dutovlje
00050000-5624-a82f-f856-ee4b30c5ab6b	8361	Dvor
00050000-5624-a82f-5228-b5040eef860f	2343	Fala
00050000-5624-a82f-ad71-e040573f9975	9208	Fokovci
00050000-5624-a82f-8815-d8f2d9ce9a22	2313	Fram
00050000-5624-a82f-21ce-e22ebb336b4d	3213	Frankolovo
00050000-5624-a82f-c57d-b21b737c866c	1274	Gabrovka
00050000-5624-a82f-379c-6174504cf97b	8254	Globoko
00050000-5624-a82f-c404-a4a1f1bff0fd	5275	Godovič
00050000-5624-a82f-4dc0-1a774af7342e	4204	Golnik
00050000-5624-a82f-db43-465dc93dc76c	3303	Gomilsko
00050000-5624-a82f-053c-4f4647514f15	4224	Gorenja vas
00050000-5624-a82f-b347-5fffeefd08d1	3263	Gorica pri Slivnici
00050000-5624-a82f-0e24-561a5c08f758	2272	Gorišnica
00050000-5624-a82f-bc12-4390f32b48d6	9250	Gornja Radgona
00050000-5624-a82f-8b4d-5834faaf52e2	3342	Gornji Grad
00050000-5624-a82f-0bd5-b2519d4c46f7	4282	Gozd Martuljek
00050000-5624-a82f-be41-188a79272f53	6272	Gračišče
00050000-5624-a82f-ae19-0c1ab665b6b2	9264	Grad
00050000-5624-a82f-3d73-e3c94cfe24a9	8332	Gradac
00050000-5624-a82f-7db7-7ea5aace2e5f	1384	Grahovo
00050000-5624-a82f-fdb9-8f56c7a29715	5242	Grahovo ob Bači
00050000-5624-a82f-4b08-e290b09390e2	5251	Grgar
00050000-5624-a82f-be9d-e59bb818e0a7	3302	Griže
00050000-5624-a82f-ef98-0fae4bb2dac5	3231	Grobelno
00050000-5624-a82f-22e9-e29e7d75d3e4	1290	Grosuplje
00050000-5624-a82f-cafd-ab4ef2a10bc2	2288	Hajdina
00050000-5624-a82f-a6d0-2b58be63306b	8362	Hinje
00050000-5624-a82f-ad3a-5c7bbce5ad91	2311	Hoče
00050000-5624-a82f-bbb5-8b2177e313a0	9205	Hodoš/Hodos
00050000-5624-a82f-0014-ee511a30a811	1354	Horjul
00050000-5624-a82f-f6e0-1394b662de8e	1372	Hotedršica
00050000-5624-a82f-a053-456c565cb56a	1430	Hrastnik
00050000-5624-a82f-3f9b-7dc554a70a12	6225	Hruševje
00050000-5624-a82f-ebb7-04102b6ccaa3	4276	Hrušica
00050000-5624-a82f-b0c4-2cd3b314c903	5280	Idrija
00050000-5624-a82f-78bf-aa2dd2e1e0f0	1292	Ig
00050000-5624-a82f-f10f-34d5ed4d65b5	6250	Ilirska Bistrica
00050000-5624-a82f-3529-22e02b3d034d	6251	Ilirska Bistrica-Trnovo
00050000-5624-a82f-c85d-fab51fc470dc	1295	Ivančna Gorica
00050000-5624-a82f-7c86-aa61c8c904a6	2259	Ivanjkovci
00050000-5624-a82f-386b-175e01658388	1411	Izlake
00050000-5624-a82f-f896-fd1a03fd5ead	6310	Izola/Isola
00050000-5624-a82f-e44b-b9aa7cbec843	2222	Jakobski Dol
00050000-5624-a82f-6090-863799b1bdef	2221	Jarenina
00050000-5624-a82f-ebe6-af6935e8e216	6254	Jelšane
00050000-5624-a82f-5758-ce3f1d79fc4a	4270	Jesenice
00050000-5624-a82f-8a53-752c9790ecbb	8261	Jesenice na Dolenjskem
00050000-5624-a82f-5479-89a64de5355c	3273	Jurklošter
00050000-5624-a82f-834c-08a4e9911cde	2223	Jurovski Dol
00050000-5624-a82f-45e5-ec79bbb5b4ce	2256	Juršinci
00050000-5624-a82f-9b90-d4a57d9269af	5214	Kal nad Kanalom
00050000-5624-a82f-205e-73ad17dedaa6	3233	Kalobje
00050000-5624-a82f-88ba-4fe7d19d5a39	4246	Kamna Gorica
00050000-5624-a82f-f874-9772f7bd0762	2351	Kamnica
00050000-5624-a82f-c077-fadd2b02e9a9	1241	Kamnik
00050000-5624-a82f-fc51-e1dbd2b99ee2	5213	Kanal
00050000-5624-a82f-961f-faa3fd97d652	8258	Kapele
00050000-5624-a82f-5ebc-83625164d2fe	2362	Kapla
00050000-5624-a82f-3ff8-b0c832de7c70	2325	Kidričevo
00050000-5624-a82f-7efe-cbed5a8594b9	1412	Kisovec
00050000-5624-a82f-1a5e-ee19a85173ad	6253	Knežak
00050000-5624-a82f-7aaa-500b7d8a8e1c	5222	Kobarid
00050000-5624-a82f-b321-731f58887d32	9227	Kobilje
00050000-5624-a82f-cfc5-ed8c8bde8252	1330	Kočevje
00050000-5624-a82f-0157-4307d051d844	1338	Kočevska Reka
00050000-5624-a82f-0c95-4f71159ad6bd	2276	Kog
00050000-5624-a82f-9190-2507a62e730d	5211	Kojsko
00050000-5624-a82f-20d7-851a2517f27f	6223	Komen
00050000-5624-a82f-bd1c-90a12a05c610	1218	Komenda
00050000-5624-a82f-a8b6-add23f23a7ef	6000	Koper/Capodistria 
00050000-5624-a82f-9170-d20e31c19278	6001	Koper/Capodistria - poštni predali
00050000-5624-a82f-4248-d8b101f5a4b9	8282	Koprivnica
00050000-5624-a82f-2a8f-40b7a966503a	5296	Kostanjevica na Krasu
00050000-5624-a82f-e803-bc834c1811d7	8311	Kostanjevica na Krki
00050000-5624-a82f-b1e7-bac5929eeac3	1336	Kostel
00050000-5624-a82f-c504-1404ff1f602c	6256	Košana
00050000-5624-a82f-ba01-97c89f71227e	2394	Kotlje
00050000-5624-a82f-5a15-10c554908e45	6240	Kozina
00050000-5624-a82f-598e-0052294600c7	3260	Kozje
00050000-5624-a82f-0e14-75f97bcd42fa	4000	Kranj 
00050000-5624-a82f-1e70-591186293904	4001	Kranj - poštni predali
00050000-5624-a82f-893a-48497353213f	4280	Kranjska Gora
00050000-5624-a82f-0f7c-73e5a5b48e75	1281	Kresnice
00050000-5624-a82f-b582-603892aab64a	4294	Križe
00050000-5624-a82f-b4ea-bf7127d586c5	9206	Križevci
00050000-5624-a82f-b561-09416fedeefc	9242	Križevci pri Ljutomeru
00050000-5624-a82f-7e54-5e2e970e5bf4	1301	Krka
00050000-5624-a82f-df23-f96c2a18a95c	8296	Krmelj
00050000-5624-a82f-8af0-ec124bfac923	4245	Kropa
00050000-5624-a82f-438a-11e5626c32ca	8262	Krška vas
00050000-5624-a82f-1aba-c388977760ec	8270	Krško
00050000-5624-a82f-446b-cdde2869679a	9263	Kuzma
00050000-5624-a82f-3eea-88f3806edfa6	2318	Laporje
00050000-5624-a82f-996f-bded02c86f33	3270	Laško
00050000-5624-a82f-d3d8-0a5c53b2333c	1219	Laze v Tuhinju
00050000-5624-a82f-9bbe-3c19781f6982	2230	Lenart v Slovenskih goricah
00050000-5624-a82f-9138-a729c8dc2cdd	9220	Lendava/Lendva
00050000-5624-a82f-e838-4487d6501f15	4248	Lesce
00050000-5624-a82f-8118-6d5e2b6343e3	3261	Lesično
00050000-5624-a82f-4b5a-cbd017ed249f	8273	Leskovec pri Krškem
00050000-5624-a82f-ecb3-e2350a08b564	2372	Libeliče
00050000-5624-a82f-236f-583c88bf4470	2341	Limbuš
00050000-5624-a82f-084a-e59b8e19fca9	1270	Litija
00050000-5624-a82f-8551-ec8311f80d8e	3202	Ljubečna
00050000-5624-a82f-1c14-ccd548db985a	1000	Ljubljana 
00050000-5624-a82f-9778-4b6d7c0aa186	1001	Ljubljana - poštni predali
00050000-5624-a82f-84fc-8e66fb421b1e	1231	Ljubljana - Črnuče
00050000-5624-a82f-0043-529e625b9aa1	1261	Ljubljana - Dobrunje
00050000-5624-a82f-0a5f-3701ef1ab56b	1260	Ljubljana - Polje
00050000-5624-a82f-aa54-b94708e221e4	1210	Ljubljana - Šentvid
00050000-5624-a82f-fbff-dd62359944be	1211	Ljubljana - Šmartno
00050000-5624-a82f-be9d-413595eda27f	3333	Ljubno ob Savinji
00050000-5624-a82f-5b60-dc6a41408cf3	9240	Ljutomer
00050000-5624-a82f-f15c-be39af9592ad	3215	Loče
00050000-5624-a82f-8933-b39f4c9a2c2e	5231	Log pod Mangartom
00050000-5624-a82f-1780-ea1810b8acbe	1358	Log pri Brezovici
00050000-5624-a82f-48fb-efb4fbb444f8	1370	Logatec
00050000-5624-a82f-84d0-6444c45fa819	1371	Logatec
00050000-5624-a82f-b113-f4ce8b768325	1434	Loka pri Zidanem Mostu
00050000-5624-a82f-9d47-27ca032b92de	3223	Loka pri Žusmu
00050000-5624-a82f-2c48-09c35317c4d1	6219	Lokev
00050000-5624-a82f-4022-1feb6df3b386	1318	Loški Potok
00050000-5624-a82f-539f-662de72f8c15	2324	Lovrenc na Dravskem polju
00050000-5624-a82f-e9f6-7f49df86c96d	2344	Lovrenc na Pohorju
00050000-5624-a82f-33ba-3d921b96963f	3334	Luče
00050000-5624-a82f-fca9-432d074268fe	1225	Lukovica
00050000-5624-a82f-0f3e-778f6586ab05	9202	Mačkovci
00050000-5624-a82f-1549-300f277e8b13	2322	Majšperk
00050000-5624-a82f-e395-301f08055864	2321	Makole
00050000-5624-a82f-de3e-141513757ccf	9243	Mala Nedelja
00050000-5624-a82f-b070-69a8f010d77a	2229	Malečnik
00050000-5624-a82f-c9c1-f315200a5bbb	6273	Marezige
00050000-5624-a82f-73ee-936aab00bbaa	2000	Maribor 
00050000-5624-a82f-0dae-5d0cc0d14747	2001	Maribor - poštni predali
00050000-5624-a82f-f912-81358beb78e9	2206	Marjeta na Dravskem polju
00050000-5624-a82f-9ac0-ca584c649f1d	2281	Markovci
00050000-5624-a82f-b945-63371fa90692	9221	Martjanci
00050000-5624-a82f-04cc-0d1677580d65	6242	Materija
00050000-5624-a82f-3472-c58fc0767394	4211	Mavčiče
00050000-5624-a82f-de0d-4166dc778356	1215	Medvode
00050000-5624-a82f-b7b3-aed3e7e8e7ea	1234	Mengeš
00050000-5624-a82f-d519-3ea566a8cdf1	8330	Metlika
00050000-5624-a82f-d839-2e9f73fe56a7	2392	Mežica
00050000-5624-a82f-8d2b-15bae155431d	2204	Miklavž na Dravskem polju
00050000-5624-a82f-2cf2-de6e1aa62c55	2275	Miklavž pri Ormožu
00050000-5624-a82f-77ec-4400622b8d29	5291	Miren
00050000-5624-a82f-2f69-bff789d504ee	8233	Mirna
00050000-5624-a82f-6965-992d05735ee7	8216	Mirna Peč
00050000-5624-a82f-8e72-da66a7e0fe5f	2382	Mislinja
00050000-5624-a82f-d94c-e9be4718168b	4281	Mojstrana
00050000-5624-a82f-4816-13a22afe2b5c	8230	Mokronog
00050000-5624-a82f-1e0a-53c87c03b843	1251	Moravče
00050000-5624-a82f-f031-733afa86e72e	9226	Moravske Toplice
00050000-5624-a82f-6b7c-4df46010bdab	5216	Most na Soči
00050000-5624-a82f-39e7-2c0d8ecf3bb2	1221	Motnik
00050000-5624-a82f-ff6f-2dc4fdd77ee1	3330	Mozirje
00050000-5624-a82f-d7e5-22ce2a54a412	9000	Murska Sobota 
00050000-5624-a82f-5d7a-9883ff7b4301	9001	Murska Sobota - poštni predali
00050000-5624-a82f-3459-6c783492a0bb	2366	Muta
00050000-5624-a82f-3c47-4ca4bc058745	4202	Naklo
00050000-5624-a82f-f248-e455882154bf	3331	Nazarje
00050000-5624-a82f-7a38-7f954d6ee4f8	1357	Notranje Gorice
00050000-5624-a82f-b518-6440881edfd5	3203	Nova Cerkev
00050000-5624-a82f-5fd8-742710b77e58	5000	Nova Gorica 
00050000-5624-a82f-a797-04f19e4e3fe6	5001	Nova Gorica - poštni predali
00050000-5624-a82f-973e-b751e7478f5a	1385	Nova vas
00050000-5624-a82f-a55a-2143671cb23b	8000	Novo mesto
00050000-5624-a82f-7235-1239a8ff697a	8001	Novo mesto - poštni predali
00050000-5624-a82f-2e9d-d5f918bac7a7	6243	Obrov
00050000-5624-a82f-4389-113532bd423c	9233	Odranci
00050000-5624-a82f-9fc3-c62c1281b056	2317	Oplotnica
00050000-5624-a82f-584b-2f9f95386d2a	2312	Orehova vas
00050000-5624-a82f-7c08-587e55d9d08a	2270	Ormož
00050000-5624-a82f-194e-83d333142d5c	1316	Ortnek
00050000-5624-a82f-2159-883dae3c79b6	1337	Osilnica
00050000-5624-a82f-14d1-1bed1db97be5	8222	Otočec
00050000-5624-a82f-f72d-f6135eda5d43	2361	Ožbalt
00050000-5624-a82f-f64a-7a68f7cd824c	2231	Pernica
00050000-5624-a82f-583c-e7d602259058	2211	Pesnica pri Mariboru
00050000-5624-a82f-3f84-08b94036fc43	9203	Petrovci
00050000-5624-a82f-c1ad-ce472d823f96	3301	Petrovče
00050000-5624-a82f-7a8d-8251f7007c08	6330	Piran/Pirano
00050000-5624-a82f-b50a-95a865711a77	8255	Pišece
00050000-5624-a82f-6d0b-49c9c87e4078	6257	Pivka
00050000-5624-a82f-dd96-0decfd87ebec	6232	Planina
00050000-5624-a82f-4454-aefd7510067c	3225	Planina pri Sevnici
00050000-5624-a82f-a923-a52ed56f7cd1	6276	Pobegi
00050000-5624-a82f-5f5d-491a9ec2e6ab	8312	Podbočje
00050000-5624-a82f-3d52-15e72bcd2fa0	5243	Podbrdo
00050000-5624-a82f-3db9-998c1636b4ef	3254	Podčetrtek
00050000-5624-a82f-e6aa-995980c1e75a	2273	Podgorci
00050000-5624-a82f-3dac-f55f0e15f90c	6216	Podgorje
00050000-5624-a82f-87f4-566b8c21c585	2381	Podgorje pri Slovenj Gradcu
00050000-5624-a82f-eed1-4189f08808a1	6244	Podgrad
00050000-5624-a82f-f0b5-f6cf21b4d536	1414	Podkum
00050000-5624-a82f-8ecf-948ad193470a	2286	Podlehnik
00050000-5624-a82f-2ddb-3ab85bdc8376	5272	Podnanos
00050000-5624-a82f-59f8-0c9c728d6be5	4244	Podnart
00050000-5624-a82f-8def-c58d8c5861a7	3241	Podplat
00050000-5624-a82f-11a1-8c662483868d	3257	Podsreda
00050000-5624-a82f-1be1-2eb531cfd96e	2363	Podvelka
00050000-5624-a82f-27c3-6120c41e5039	2208	Pohorje
00050000-5624-a82f-7e4b-c8ed3925bd60	2257	Polenšak
00050000-5624-a82f-f31a-2391e8318f86	1355	Polhov Gradec
00050000-5624-a82f-b8ab-81b41de246eb	4223	Poljane nad Škofjo Loko
00050000-5624-a82f-1435-50d12064a36f	2319	Poljčane
00050000-5624-a82f-b9b8-84b2bc09d38e	1272	Polšnik
00050000-5624-a82f-1d5f-7e1ece8127cc	3313	Polzela
00050000-5624-a82f-9f51-041deed4ac55	3232	Ponikva
00050000-5624-a82f-087d-aa607f14768f	6320	Portorož/Portorose
00050000-5624-a82f-36b2-3bc5d0aea024	6230	Postojna
00050000-5624-a82f-05bf-dd55fe599595	2331	Pragersko
00050000-5624-a82f-e719-52c50e204f68	3312	Prebold
00050000-5624-a82f-5372-c42a59695354	4205	Preddvor
00050000-5624-a82f-7414-f8108c3f3de1	6255	Prem
00050000-5624-a82f-bbd0-6211783b1abb	1352	Preserje
00050000-5624-a82f-77dd-87eb62ab138b	6258	Prestranek
00050000-5624-a82f-13de-6f2f65d74593	2391	Prevalje
00050000-5624-a82f-eec8-87552b269d28	3262	Prevorje
00050000-5624-a82f-e34e-b71c9bc61896	1276	Primskovo 
00050000-5624-a82f-6bd2-c53dff8dd58f	3253	Pristava pri Mestinju
00050000-5624-a82f-b12e-b0d656ce0039	9207	Prosenjakovci/Partosfalva
00050000-5624-a82f-d4a2-eceaa338e28e	5297	Prvačina
00050000-5624-a82f-a1e0-17920c3247de	2250	Ptuj
00050000-5624-a82f-e83d-315c956b4650	2323	Ptujska Gora
00050000-5624-a82f-f4a9-aa295ca03f2f	9201	Puconci
00050000-5624-a82f-54cd-7622fc71a57d	2327	Rače
00050000-5624-a82f-bab6-10006c1cb52e	1433	Radeče
00050000-5624-a82f-ea70-0fc799a20573	9252	Radenci
00050000-5624-a82f-8b95-91a0cc2e0055	2360	Radlje ob Dravi
00050000-5624-a82f-7e2f-f392e35b6867	1235	Radomlje
00050000-5624-a82f-124c-21b658cbc370	4240	Radovljica
00050000-5624-a82f-2a71-ef7bb951806c	8274	Raka
00050000-5624-a82f-ea9e-7e8c5b5db901	1381	Rakek
00050000-5624-a82f-652a-59429d4dff30	4283	Rateče - Planica
00050000-5624-a82f-34fb-026dc99cf0aa	2390	Ravne na Koroškem
00050000-5624-a82f-6c2d-d9eb07bfcbdf	9246	Razkrižje
00050000-5624-a82f-301d-f2985d1c706c	3332	Rečica ob Savinji
00050000-5624-a82f-6bf5-e61249fe7801	5292	Renče
00050000-5624-a82f-c970-c4944fd6869b	1310	Ribnica
00050000-5624-a82f-ae15-dd2191fced1a	2364	Ribnica na Pohorju
00050000-5624-a82f-da9f-05cd8223226e	3272	Rimske Toplice
00050000-5624-a82f-bb93-bb46d9bf9a54	1314	Rob
00050000-5624-a82f-98a7-5ec220c56bbe	5215	Ročinj
00050000-5624-a82f-7707-0b0a9e65ea88	3250	Rogaška Slatina
00050000-5624-a82f-b993-30cab8f818aa	9262	Rogašovci
00050000-5624-a82f-28b1-6cc761c55e4d	3252	Rogatec
00050000-5624-a82f-24c7-0b9b73b7204a	1373	Rovte
00050000-5624-a82f-e7a0-da3e41352417	2342	Ruše
00050000-5624-a82f-0082-788793b8be85	1282	Sava
00050000-5624-a82f-446c-7d94a4c94ed3	6333	Sečovlje/Sicciole
00050000-5624-a82f-17f5-3b277c44f405	4227	Selca
00050000-5624-a82f-84e4-612560f62dfb	2352	Selnica ob Dravi
00050000-5624-a82f-881a-1fbc40e6ee3c	8333	Semič
00050000-5624-a82f-94ea-002288af16c9	8281	Senovo
00050000-5624-a82f-3cf0-138b13c4a4b8	6224	Senožeče
00050000-5624-a82f-783d-6315b42e6787	8290	Sevnica
00050000-5624-a82f-c2d5-b4483d2c8753	6210	Sežana
00050000-5624-a82f-74ed-a77487e641e1	2214	Sladki Vrh
00050000-5624-a82f-33e7-28d233fe270f	5283	Slap ob Idrijci
00050000-5624-a82f-f1c1-c59c1ec886b3	2380	Slovenj Gradec
00050000-5624-a82f-6327-26bbb5d6ee44	2310	Slovenska Bistrica
00050000-5624-a82f-217b-7fad57dc1456	3210	Slovenske Konjice
00050000-5624-a82f-f4f3-f9dc6a3dfb2a	1216	Smlednik
00050000-5624-a82f-bda5-db912007fcc0	5232	Soča
00050000-5624-a82f-d16b-ac7f1f053b6b	1317	Sodražica
00050000-5624-a82f-ee3f-4da6e4883963	3335	Solčava
00050000-5624-a82f-099d-cdcdd14456ae	5250	Solkan
00050000-5624-a82f-da78-3d55e7bce958	4229	Sorica
00050000-5624-a82f-aaff-58fffa009d55	4225	Sovodenj
00050000-5624-a82f-54f6-d92e4ae274b9	5281	Spodnja Idrija
00050000-5624-a82f-2604-a7f51dda0172	2241	Spodnji Duplek
00050000-5624-a82f-e9c8-0843c027f9f8	9245	Spodnji Ivanjci
00050000-5624-a82f-5be7-c302c93e0473	2277	Središče ob Dravi
00050000-5624-a82f-6a8f-ea42cb581bb4	4267	Srednja vas v Bohinju
00050000-5624-a82f-7109-6f274071c6e2	8256	Sromlje 
00050000-5624-a82f-a70e-f7a247d37039	5224	Srpenica
00050000-5624-a82f-e948-2ed2584c378b	1242	Stahovica
00050000-5624-a82f-23e3-c4170dbbc3cb	1332	Stara Cerkev
00050000-5624-a82f-4110-b3c2f7dc0ccd	8342	Stari trg ob Kolpi
00050000-5624-a82f-6fe5-ffd921722451	1386	Stari trg pri Ložu
00050000-5624-a82f-aa6c-a4c4c9ff5927	2205	Starše
00050000-5624-a82f-13c8-6c6871a19dc7	2289	Stoperce
00050000-5624-a82f-33c5-ed466c47373b	8322	Stopiče
00050000-5624-a82f-c3ba-a32e29b70a24	3206	Stranice
00050000-5624-a82f-a5ce-bb17689a3095	8351	Straža
00050000-5624-a82f-6b0d-a917ed8703b1	1313	Struge
00050000-5624-a82f-204b-8a5eaf3b602c	8293	Studenec
00050000-5624-a82f-b3ba-84264ca20ef7	8331	Suhor
00050000-5624-a82f-204a-22ddf7fb05e7	2233	Sv. Ana v Slovenskih goricah
00050000-5624-a82f-20cd-9e761eee2f09	2235	Sv. Trojica v Slovenskih goricah
00050000-5624-a82f-e37c-777c2bfd600a	2353	Sveti Duh na Ostrem Vrhu
00050000-5624-a82f-eb00-4d45c9b36ec2	9244	Sveti Jurij ob Ščavnici
00050000-5624-a82f-e7c3-46ccec3f1902	3264	Sveti Štefan
00050000-5624-a82f-5730-a9f4c9767146	2258	Sveti Tomaž
00050000-5624-a82f-51fa-a2b606b80fca	9204	Šalovci
00050000-5624-a82f-a4ae-d69499b448fd	5261	Šempas
00050000-5624-a82f-74b4-cf277de821ba	5290	Šempeter pri Gorici
00050000-5624-a82f-45e6-d8f0fb552482	3311	Šempeter v Savinjski dolini
00050000-5624-a82f-7845-7e45e19074fc	4208	Šenčur
00050000-5624-a82f-5258-03239fc0307a	2212	Šentilj v Slovenskih goricah
00050000-5624-a82f-7f31-e2771ebfc432	8297	Šentjanž
00050000-5624-a82f-1706-116e7633ef76	2373	Šentjanž pri Dravogradu
00050000-5624-a82f-cd89-103362dbb2fe	8310	Šentjernej
00050000-5624-a82f-00c9-a739197a8415	3230	Šentjur
00050000-5624-a82f-e0a8-00902604ef26	3271	Šentrupert
00050000-5624-a82f-7faf-5afcce765c42	8232	Šentrupert
00050000-5624-a82f-b2e1-ba10977a449d	1296	Šentvid pri Stični
00050000-5624-a82f-999a-face545127df	8275	Škocjan
00050000-5624-a82f-4fbe-bc45f705f3cb	6281	Škofije
00050000-5624-a82f-a3bc-711102030843	4220	Škofja Loka
00050000-5624-a82f-b518-33f8a72d32df	3211	Škofja vas
00050000-5624-a82f-cea6-e09a2cd1e6cd	1291	Škofljica
00050000-5624-a82f-68d5-cb7da1a19be9	6274	Šmarje
00050000-5624-a82f-d661-633def960cb5	1293	Šmarje - Sap
00050000-5624-a82f-6c8a-c5bb98be2102	3240	Šmarje pri Jelšah
00050000-5624-a82f-3a3b-a368059075c2	8220	Šmarješke Toplice
00050000-5624-a82f-5e6e-9c87366f9838	2315	Šmartno na Pohorju
00050000-5624-a82f-3ec9-5713bdc8124c	3341	Šmartno ob Dreti
00050000-5624-a82f-aac7-dc85ae151867	3327	Šmartno ob Paki
00050000-5624-a82f-3619-4cc3b56de1e1	1275	Šmartno pri Litiji
00050000-5624-a82f-3b08-c2a85c335ca1	2383	Šmartno pri Slovenj Gradcu
00050000-5624-a82f-4bf5-df9335980b64	3201	Šmartno v Rožni dolini
00050000-5624-a82f-cb89-76e748eb594d	3325	Šoštanj
00050000-5624-a82f-eb9c-1da2556d45c4	6222	Štanjel
00050000-5624-a82f-c0d3-7ea5f2514042	3220	Štore
00050000-5624-a82f-d363-5a644ecf6926	3304	Tabor
00050000-5624-a82f-dac1-85578b9865a8	3221	Teharje
00050000-5624-a82f-957d-ef7cdfa7fea1	9251	Tišina
00050000-5624-a82f-30f4-2037b9904dc5	5220	Tolmin
00050000-5624-a82f-ae38-78489166876b	3326	Topolšica
00050000-5624-a82f-1e32-d0a28897dfc3	2371	Trbonje
00050000-5624-a82f-a453-cdc9c04309f3	1420	Trbovlje
00050000-5624-a82f-d22d-0f97d8c80e19	8231	Trebelno 
00050000-5624-a82f-8140-15d6d03e00fe	8210	Trebnje
00050000-5624-a82f-793e-a2d072fcf446	5252	Trnovo pri Gorici
00050000-5624-a82f-2c30-4db099dddd90	2254	Trnovska vas
00050000-5624-a82f-5d4b-aa41335f4b71	1222	Trojane
00050000-5624-a82f-ac4d-f4aa5ea51335	1236	Trzin
00050000-5624-a82f-b64e-ee1bec4c7cb6	4290	Tržič
00050000-5624-a82f-bb2e-782e9665ab64	8295	Tržišče
00050000-5624-a82f-6026-2230296c5211	1311	Turjak
00050000-5624-a82f-2852-4fcd2b66e8bc	9224	Turnišče
00050000-5624-a82f-4238-ea1c40c48527	8323	Uršna sela
00050000-5624-a82f-8d0b-2350b53aa4d4	1252	Vače
00050000-5624-a82f-9ebc-9e6f9c23d35e	3320	Velenje 
00050000-5624-a82f-3795-8f3efd2a174f	3322	Velenje - poštni predali
00050000-5624-a82f-60cc-ea327757414f	8212	Velika Loka
00050000-5624-a82f-1ed0-81d0e8b9e5d3	2274	Velika Nedelja
00050000-5624-a82f-a0fa-eff3c0716b35	9225	Velika Polana
00050000-5624-a82f-8985-b4ba2c30c6ad	1315	Velike Lašče
00050000-5624-a82f-732d-862a49850bab	8213	Veliki Gaber
00050000-5624-a82f-a2ef-c9e0bc04a891	9241	Veržej
00050000-5624-a82f-7129-85f90731ca7e	1312	Videm - Dobrepolje
00050000-5624-a82f-a287-a5409b2cad5f	2284	Videm pri Ptuju
00050000-5624-a82f-dad4-3906bccc7b75	8344	Vinica
00050000-5624-a82f-d7dd-625093718738	5271	Vipava
00050000-5624-a82f-8998-057d7edd4787	4212	Visoko
00050000-5624-a82f-263b-29109fd3b974	1294	Višnja Gora
00050000-5624-a82f-6abd-3b10e9168158	3205	Vitanje
00050000-5624-a82f-4479-592a6b76c357	2255	Vitomarci
00050000-5624-a82f-070c-3ca77b3a328c	1217	Vodice
00050000-5624-a82f-22e6-9d53ad8e522f	3212	Vojnik\t
00050000-5624-a82f-25de-85756465c429	5293	Volčja Draga
00050000-5624-a82f-f600-3c928c52139c	2232	Voličina
00050000-5624-a82f-1128-ddde883ac923	3305	Vransko
00050000-5624-a82f-f9f6-69ec4bc72e63	6217	Vremski Britof
00050000-5624-a82f-bbd5-554e0a7fe75d	1360	Vrhnika
00050000-5624-a82f-a1ee-dd9a45aa1cfd	2365	Vuhred
00050000-5624-a82f-7e13-fd4e5b4e014f	2367	Vuzenica
00050000-5624-a82f-9751-03b6f64f0fb2	8292	Zabukovje 
00050000-5624-a82f-63da-5d405641eb90	1410	Zagorje ob Savi
00050000-5624-a82f-5867-19a5609f8322	1303	Zagradec
00050000-5624-a82f-6208-dd3e475c0b18	2283	Zavrč
00050000-5624-a82f-1f89-9adbe6eeb760	8272	Zdole 
00050000-5624-a82f-cc8c-b884e6107cad	4201	Zgornja Besnica
00050000-5624-a82f-3dc0-7d2d73587765	2242	Zgornja Korena
00050000-5624-a82f-a6eb-4b2f0010fa89	2201	Zgornja Kungota
00050000-5624-a82f-39c3-3fb768672c7f	2316	Zgornja Ložnica
00050000-5624-a82f-0b5d-ce9a18878e0b	2314	Zgornja Polskava
00050000-5624-a82f-6c6a-8a2c82569e9d	2213	Zgornja Velka
00050000-5624-a82f-c45f-1539270308f1	4247	Zgornje Gorje
00050000-5624-a82f-9e3c-45a03e7db06e	4206	Zgornje Jezersko
00050000-5624-a82f-f416-655c820724dc	2285	Zgornji Leskovec
00050000-5624-a82f-dbfa-613e4474ea3f	1432	Zidani Most
00050000-5624-a82f-172f-c8a0ab5a23e2	3214	Zreče
00050000-5624-a82f-f009-709de51a2cdd	4209	Žabnica
00050000-5624-a82f-0be8-ce35b87c490b	3310	Žalec
00050000-5624-a82f-8006-99ab39fb2e62	4228	Železniki
00050000-5624-a82f-dc48-9ed0928ea727	2287	Žetale
00050000-5624-a82f-687c-2a64e777757e	4226	Žiri
00050000-5624-a82f-9324-5d1b756c8be0	4274	Žirovnica
00050000-5624-a82f-a2c3-76b3ecce2464	8360	Žužemberk
\.


--
-- TOC entry 3098 (class 0 OID 22400682)
-- Dependencies: 235
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22400274)
-- Dependencies: 208
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22400044)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5624-a831-c3be-aec3f42f7cd2	00080000-5624-a831-e54f-12a88712a31c	\N	00040000-5624-a82f-ebdf-8d2fe8912185	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5624-a831-7544-fd521d23901c	00080000-5624-a831-e54f-12a88712a31c	\N	00040000-5624-a82f-ebdf-8d2fe8912185	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5624-a831-12a6-9d5051046602	00080000-5624-a831-826a-e6a9ff0cae85	\N	00040000-5624-a82f-ebdf-8d2fe8912185	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3059 (class 0 OID 22400148)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22400286)
-- Dependencies: 210
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22400696)
-- Dependencies: 236
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22400706)
-- Dependencies: 237
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5624-a831-158e-eb2b2e99c37b	00080000-5624-a831-17ef-5a1818f7efe2	0987	AK
00190000-5624-a831-4b77-802430cf055d	00080000-5624-a831-826a-e6a9ff0cae85	0989	AK
00190000-5624-a831-3d3f-f376d3b41856	00080000-5624-a831-7b20-d45559b5a2be	0986	AK
00190000-5624-a831-570d-a2dc14a5c3da	00080000-5624-a831-ae60-33fb8a978c03	0984	AK
00190000-5624-a831-b640-6c9814a105ca	00080000-5624-a831-0b17-f88519c9497b	0983	AK
00190000-5624-a831-a2ee-60e9ae489bec	00080000-5624-a831-e79f-fdd8d9466171	0982	AK
00190000-5624-a832-91f5-5ee8cbc9dfaa	00080000-5624-a832-22fd-c1d7b2d86f31	1001	AK
\.


--
-- TOC entry 3097 (class 0 OID 22400621)
-- Dependencies: 234
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5624-a831-3a2a-6906bb57d64b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 22400714)
-- Dependencies: 238
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22400315)
-- Dependencies: 214
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5624-a831-eced-480188d4b380	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5624-a831-c101-5456964cb22c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5624-a831-7836-9798068898af	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5624-a831-78db-729a983c55c2	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5624-a831-a51e-1d33d34c347a	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5624-a831-8dc2-c5c79837df76	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5624-a831-1b75-d5d7ff477e04	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3069 (class 0 OID 22400259)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22400249)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22400460)
-- Dependencies: 227
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22400390)
-- Dependencies: 221
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22400122)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22399895)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5624-a832-22fd-c1d7b2d86f31	00010000-5624-a830-2355-c82def4fc3b5	2015-10-19 10:22:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-5624-a832-0518-5455f014b945	00010000-5624-a830-2355-c82def4fc3b5	2015-10-19 10:22:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5624-a832-91f5-5ee8cbc9dfaa	00010000-5624-a830-2355-c82def4fc3b5	2015-10-19 10:22:10	INS	a:0:{}
\.


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3078 (class 0 OID 22400328)
-- Dependencies: 215
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 22399933)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5624-a82f-de6a-5b530e823fa4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5624-a82f-6c97-396f0f7b0c22	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5624-a82f-746c-c6e09bbe09c9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5624-a82f-caa2-591f2169cfb6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5624-a830-d1df-7e332d17a1df	planer	Planer dogodkov v koledarju	t
00020000-5624-a830-c42c-182467da9593	kadrovska	Kadrovska služba	t
00020000-5624-a830-b68b-7429b031168d	arhivar	Ažuriranje arhivalij	t
00020000-5624-a830-108a-94ebf3339495	igralec	Igralec	t
00020000-5624-a830-2da4-eddfd8a55420	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5624-a831-eb41-7594f86e7eda	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3040 (class 0 OID 22399917)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5624-a830-d54a-481eff2e1262	00020000-5624-a82f-746c-c6e09bbe09c9
00010000-5624-a830-2355-c82def4fc3b5	00020000-5624-a82f-746c-c6e09bbe09c9
00010000-5624-a831-df2f-4e1536c9dd48	00020000-5624-a831-eb41-7594f86e7eda
\.


--
-- TOC entry 3080 (class 0 OID 22400342)
-- Dependencies: 217
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22400280)
-- Dependencies: 209
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22400226)
-- Dependencies: 203
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 22399882)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5624-a82f-e80f-4975d8adb5c2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5624-a82f-89d5-fbd903e45b4c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5624-a82f-26bd-e4a99c2bc92d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5624-a82f-4a2a-48527aa08b90	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5624-a82f-d175-08df550c0e49	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3035 (class 0 OID 22399874)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5624-a82f-cbf1-ed627571bb01	00230000-5624-a82f-4a2a-48527aa08b90	popa
00240000-5624-a82f-f19f-36f2f8b7f32c	00230000-5624-a82f-4a2a-48527aa08b90	oseba
00240000-5624-a82f-7cc4-af992874d7ae	00230000-5624-a82f-4a2a-48527aa08b90	tippopa
00240000-5624-a82f-a802-aa2f4ca5204f	00230000-5624-a82f-4a2a-48527aa08b90	organizacijskaenota
00240000-5624-a82f-b54b-d426acc7fd53	00230000-5624-a82f-4a2a-48527aa08b90	sezona
00240000-5624-a82f-867f-79cc4550709c	00230000-5624-a82f-4a2a-48527aa08b90	tipvaje
00240000-5624-a82f-3200-79e88bd20946	00230000-5624-a82f-89d5-fbd903e45b4c	prostor
00240000-5624-a82f-0d72-c4faf3b98836	00230000-5624-a82f-4a2a-48527aa08b90	besedilo
00240000-5624-a82f-afe3-b9278f476413	00230000-5624-a82f-4a2a-48527aa08b90	uprizoritev
00240000-5624-a82f-d673-280475e10c99	00230000-5624-a82f-4a2a-48527aa08b90	funkcija
00240000-5624-a82f-b5ae-257d6a5bbfe6	00230000-5624-a82f-4a2a-48527aa08b90	tipfunkcije
00240000-5624-a82f-e347-ffadaa517587	00230000-5624-a82f-4a2a-48527aa08b90	alternacija
00240000-5624-a82f-bf80-4b3eb9e79cf9	00230000-5624-a82f-e80f-4975d8adb5c2	pogodba
00240000-5624-a82f-ba21-733dccd3ffac	00230000-5624-a82f-4a2a-48527aa08b90	zaposlitev
00240000-5624-a82f-da58-ed10fe4e77ed	00230000-5624-a82f-4a2a-48527aa08b90	zvrstuprizoritve
00240000-5624-a82f-b95a-2172db878410	00230000-5624-a82f-e80f-4975d8adb5c2	programdela
00240000-5624-a82f-ceef-27cc5789b904	00230000-5624-a82f-4a2a-48527aa08b90	zapis
\.


--
-- TOC entry 3034 (class 0 OID 22399869)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
880060cf-f90d-4ea5-8d26-2e6f4e91d581	00240000-5624-a82f-cbf1-ed627571bb01	0	1001
\.


--
-- TOC entry 3086 (class 0 OID 22400407)
-- Dependencies: 223
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5624-a831-700e-85b64785ea61	000e0000-5624-a831-2ecf-0f4da77b9201	00080000-5624-a831-e54f-12a88712a31c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5624-a82f-5970-5c31658b14e2
00270000-5624-a831-93e1-8f65813e1f26	000e0000-5624-a831-2ecf-0f4da77b9201	00080000-5624-a831-e54f-12a88712a31c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5624-a82f-5970-5c31658b14e2
\.


--
-- TOC entry 3048 (class 0 OID 22400005)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22400236)
-- Dependencies: 204
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5624-a831-c9fa-00a9eef38ab9	00180000-5624-a831-12f2-bb31fee1572a	000c0000-5624-a831-3f91-8c4f0592961c	00090000-5624-a831-1389-019cfdc6d775	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-a831-339c-45b1eceb609e	00180000-5624-a831-12f2-bb31fee1572a	000c0000-5624-a831-c690-f5960f839d2d	00090000-5624-a831-8dbf-17a7edcf669f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-a831-dade-21c111fe28da	00180000-5624-a831-12f2-bb31fee1572a	000c0000-5624-a831-7b79-0ba20cf7cb56	00090000-5624-a831-f3a9-7b6a8ee66f95	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-a831-bde2-533a1b5ae48d	00180000-5624-a831-12f2-bb31fee1572a	000c0000-5624-a831-9452-22382bf4b3c5	00090000-5624-a831-f863-26c70d843e3d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-a831-e73d-c1e8207f1cf0	00180000-5624-a831-12f2-bb31fee1572a	000c0000-5624-a831-d486-cfecf64e5777	00090000-5624-a831-626c-ca6b0fb78549	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-a831-e3cc-1e392c3264a1	00180000-5624-a831-65de-372b9445cf2a	\N	00090000-5624-a831-626c-ca6b0fb78549	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3089 (class 0 OID 22400448)
-- Dependencies: 226
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5624-a82f-0fd5-ad222a1b81da	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5624-a82f-d35e-21f1f96c0e02	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5624-a82f-5fcc-db1246efa7e0	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5624-a82f-1c9a-43d3d1cf004e	04	Režija	Režija	Režija	umetnik	30
000f0000-5624-a82f-86f6-1df533f97d07	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5624-a82f-7688-75e610068417	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5624-a82f-fbc9-533ac3221573	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5624-a82f-f25f-d3dc15727fc0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5624-a82f-6294-246e7c8de57d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5624-a82f-f190-1ad4935b9860	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5624-a82f-f6a1-1a81fb6324b1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5624-a82f-db13-945a351b52f5	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5624-a82f-cffd-6ba1f0a03dfc	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5624-a82f-43bc-3f63231ceade	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5624-a82f-a91e-19ca2cf6e75e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5624-a82f-483c-e9b903e3dc32	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5624-a82f-fbea-2d3372f2370e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5624-a82f-bcde-0fe289854fe3	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3045 (class 0 OID 22399959)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5624-a831-616d-8c1813820342	0001	šola	osnovna ali srednja šola
00400000-5624-a831-7c5e-f79a61c2d902	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5624-a831-4e95-46c05d11a308	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3102 (class 0 OID 22400725)
-- Dependencies: 239
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5624-a82f-dd9a-3b1247f00092	01	Velika predstava	f	1.00	1.00
002b0000-5624-a82f-748f-16d5ab53d96e	02	Mala predstava	f	0.50	0.50
002b0000-5624-a82f-e52b-636645d29623	03	Mala koprodukcija	t	0.40	1.00
002b0000-5624-a82f-4135-07dff793f1f7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5624-a82f-3285-2e5874a09815	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3065 (class 0 OID 22400216)
-- Dependencies: 202
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5624-a82f-506a-e23e9971449e	0001	prva vaja	prva vaja
00420000-5624-a82f-9c49-d4ccb55ebd4e	0002	tehnična vaja	tehnična vaja
00420000-5624-a82f-cec1-5c40f9140db8	0003	lučna vaja	lučna vaja
00420000-5624-a82f-e1da-b71c9eef7a18	0004	kostumska vaja	kostumska vaja
00420000-5624-a82f-0531-47f627276d28	0005	foto vaja	foto vaja
00420000-5624-a82f-bcd8-e2f5f7fb852f	0006	1. glavna vaja	1. glavna vaja
00420000-5624-a82f-25b4-003af2f107ef	0007	2. glavna vaja	2. glavna vaja
00420000-5624-a82f-d5ea-e41f55500f0b	0008	1. generalka	1. generalka
00420000-5624-a82f-2667-f5aa9300f6db	0009	2. generalka	2. generalka
00420000-5624-a82f-b9ed-3f731a4d7e8d	0010	odprta generalka	odprta generalka
00420000-5624-a82f-6b5c-5a69724df5b1	0011	obnovitvena vaja	obnovitvena vaja
00420000-5624-a82f-898b-d0b9aa59f766	0012	pevska vaja	pevska vaja
00420000-5624-a82f-e23e-ee3c60d2d411	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5624-a82f-55fc-95ccc0348096	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3054 (class 0 OID 22400079)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 22399904)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5624-a830-2355-c82def4fc3b5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROz3EQTyEpiPbjfd17XpLFM1HD2CI2kqW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5624-a831-0449-282720e000a2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5624-a831-986b-2d7aa7e88496	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5624-a831-eb0f-e343cc2565b9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5624-a831-3ccb-d01e460522d6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5624-a831-ab5d-0bd0313a9d36	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5624-a831-01c2-64cdb0e65d16	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5624-a831-d161-20addddb1145	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5624-a831-334c-f3a47d26981f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5624-a831-fdb4-f28901c67e54	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5624-a831-df2f-4e1536c9dd48	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5624-a830-d54a-481eff2e1262	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3093 (class 0 OID 22400498)
-- Dependencies: 230
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5624-a831-5d15-4ffb9491a381	00160000-5624-a831-0638-b4f522fd8188	\N	00140000-5624-a82f-36e6-dcb2a83e4e67	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5624-a831-a51e-1d33d34c347a
000e0000-5624-a831-2ecf-0f4da77b9201	00160000-5624-a831-0dd3-348510fb01a8	\N	00140000-5624-a82f-0feb-2eb4c50ea3ad	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5624-a831-8dc2-c5c79837df76
000e0000-5624-a831-d56f-3883d12fdbdc	\N	\N	00140000-5624-a82f-0feb-2eb4c50ea3ad	00190000-5624-a831-158e-eb2b2e99c37b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-a831-a51e-1d33d34c347a
000e0000-5624-a831-4f96-6bea45f65daf	\N	\N	00140000-5624-a82f-0feb-2eb4c50ea3ad	00190000-5624-a831-158e-eb2b2e99c37b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-a831-a51e-1d33d34c347a
000e0000-5624-a831-5f56-43aaf151b9e9	\N	\N	00140000-5624-a82f-0feb-2eb4c50ea3ad	00190000-5624-a831-158e-eb2b2e99c37b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-a831-eced-480188d4b380
000e0000-5624-a831-1f47-acb5271976b5	\N	\N	00140000-5624-a82f-0feb-2eb4c50ea3ad	00190000-5624-a831-158e-eb2b2e99c37b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-a831-eced-480188d4b380
\.


--
-- TOC entry 3061 (class 0 OID 22400170)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5624-a831-b54c-fb46d2e25304	\N	000e0000-5624-a831-2ecf-0f4da77b9201	1	
00200000-5624-a831-a7f0-986c541f9e8b	\N	000e0000-5624-a831-2ecf-0f4da77b9201	2	
00200000-5624-a831-f624-282fdc90a4ce	\N	000e0000-5624-a831-2ecf-0f4da77b9201	3	
00200000-5624-a831-edfc-74223fbe2ce1	\N	000e0000-5624-a831-2ecf-0f4da77b9201	4	
00200000-5624-a831-a745-2e0e269386ff	\N	000e0000-5624-a831-2ecf-0f4da77b9201	5	
\.


--
-- TOC entry 3076 (class 0 OID 22400307)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 22400421)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5624-a82f-92b9-ce29a24944e0	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5624-a82f-7c09-99748495c0f3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5624-a82f-ae3e-2a5c7d4099bb	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5624-a82f-76ee-336641853a0b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5624-a82f-95b5-4398da964c2a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5624-a82f-e792-e9d11bfe0ab2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5624-a82f-a1fe-a92ec3af968e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5624-a82f-e586-da1bcf2bc314	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5624-a82f-5970-5c31658b14e2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5624-a82f-c5a4-f0c67cd43ba5	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5624-a82f-abf4-1d8da98942db	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5624-a82f-c563-f0bf024a9792	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5624-a82f-2bc6-17443d7f467c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5624-a82f-6fdb-d19fac087cb0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5624-a82f-7fd1-c644dc81e8ad	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5624-a82f-13ff-26dfec3b09d4	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5624-a82f-6e6d-63c2f44aa201	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5624-a82f-920f-6acd9d9f1d57	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5624-a82f-125d-d923b1fceee8	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5624-a82f-0f9d-82dc925cef20	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5624-a82f-075a-309e8968413f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5624-a82f-36ac-a412107ed3ff	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5624-a82f-1570-845745a1db5f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5624-a82f-d834-0384a52ea7b4	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5624-a82f-bc2e-a09dd4ef6a70	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5624-a82f-6d59-5d06dfe3c8a9	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5624-a82f-0a1a-3532fd1360dc	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5624-a82f-eb17-972a128c0a49	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3105 (class 0 OID 22400772)
-- Dependencies: 242
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22400744)
-- Dependencies: 241
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22400784)
-- Dependencies: 243
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22400379)
-- Dependencies: 220
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5624-a831-13b8-1c60ba5221eb	00090000-5624-a831-8dbf-17a7edcf669f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-a831-8e45-1dc0da506290	00090000-5624-a831-f3a9-7b6a8ee66f95	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-a831-3bee-1d84a6189ffe	00090000-5624-a831-f097-29aa4647dc24	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-a831-48a7-584ddb54afcd	00090000-5624-a831-bbd6-4c2738a634e9	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-a831-7080-1907e6624bd3	00090000-5624-a831-1389-019cfdc6d775	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-a831-aa41-a51734cd4364	00090000-5624-a831-38b8-89bf3cdd8ccb	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3063 (class 0 OID 22400205)
-- Dependencies: 200
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22400488)
-- Dependencies: 229
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5624-a82f-36e6-dcb2a83e4e67	01	Drama	drama (SURS 01)
00140000-5624-a82f-3e1b-814419423cfc	02	Opera	opera (SURS 02)
00140000-5624-a82f-db60-6090de977019	03	Balet	balet (SURS 03)
00140000-5624-a82f-1f1b-7ce32f0eefed	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5624-a82f-0478-782a1fb19541	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5624-a82f-0feb-2eb4c50ea3ad	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5624-a82f-0ac0-64988b202037	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3082 (class 0 OID 22400369)
-- Dependencies: 219
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2543 (class 2606 OID 22399958)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 22400547)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 22400537)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22400404)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 22400446)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 22400824)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22400194)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22400215)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22400742)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 22400105)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 22400615)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22400365)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 22400168)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 22400143)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 22400119)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22400272)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 22400801)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22400808)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2814 (class 2606 OID 22400832)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2671 (class 2606 OID 22400299)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 22400077)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 22399977)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22400039)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22400001)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22399947)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2534 (class 2606 OID 22399932)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22400305)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 22400341)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22400483)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22400029)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 22400065)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 22400694)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 22400278)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 22400055)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22400156)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 22400290)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 22400703)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22400711)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22400681)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 22400723)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22400323)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 22400263)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22400254)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22400470)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22400397)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 22400131)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 22399903)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22400332)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22399921)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2536 (class 2606 OID 22399941)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 22400350)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22400285)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22400234)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 22399891)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 22399879)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 22399873)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22400417)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22400010)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 22400245)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22400457)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22399966)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22400735)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 22400223)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 22400090)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 22399916)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22400516)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22400177)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22400313)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22400429)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 22400782)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22400766)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 22400790)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 22400387)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22400209)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22400496)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22400377)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 1259 OID 22400203)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2620 (class 1259 OID 22400204)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2621 (class 1259 OID 22400202)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2622 (class 1259 OID 22400201)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2623 (class 1259 OID 22400200)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2714 (class 1259 OID 22400418)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2715 (class 1259 OID 22400419)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 22400420)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 22400803)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2801 (class 1259 OID 22400802)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2561 (class 1259 OID 22400031)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2562 (class 1259 OID 22400032)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2672 (class 1259 OID 22400306)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2787 (class 1259 OID 22400770)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2788 (class 1259 OID 22400769)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 22400771)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2790 (class 1259 OID 22400768)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2791 (class 1259 OID 22400767)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2666 (class 1259 OID 22400292)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2667 (class 1259 OID 22400291)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2613 (class 1259 OID 22400178)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2614 (class 1259 OID 22400179)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 22400366)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 22400368)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2698 (class 1259 OID 22400367)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2593 (class 1259 OID 22400121)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 22400120)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22400724)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2730 (class 1259 OID 22400485)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 22400486)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22400487)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2797 (class 1259 OID 22400791)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2739 (class 1259 OID 22400521)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2740 (class 1259 OID 22400518)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2741 (class 1259 OID 22400522)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2742 (class 1259 OID 22400520)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2743 (class 1259 OID 22400519)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2583 (class 1259 OID 22400092)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 22400091)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2552 (class 1259 OID 22400004)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2684 (class 1259 OID 22400333)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2538 (class 1259 OID 22399948)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2539 (class 1259 OID 22399949)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2689 (class 1259 OID 22400353)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 22400352)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2691 (class 1259 OID 22400351)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2566 (class 1259 OID 22400042)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2567 (class 1259 OID 22400041)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2568 (class 1259 OID 22400043)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2606 (class 1259 OID 22400157)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 22400158)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 22399881)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2646 (class 1259 OID 22400258)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2647 (class 1259 OID 22400256)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2648 (class 1259 OID 22400255)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2649 (class 1259 OID 22400257)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2529 (class 1259 OID 22399922)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 22399923)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2675 (class 1259 OID 22400314)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2810 (class 1259 OID 22400825)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2712 (class 1259 OID 22400406)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2713 (class 1259 OID 22400405)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2811 (class 1259 OID 22400833)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2812 (class 1259 OID 22400834)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2661 (class 1259 OID 22400279)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2706 (class 1259 OID 22400398)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2707 (class 1259 OID 22400399)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 22400620)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2761 (class 1259 OID 22400619)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2762 (class 1259 OID 22400616)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 22400617)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2764 (class 1259 OID 22400618)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2572 (class 1259 OID 22400057)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2573 (class 1259 OID 22400056)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2574 (class 1259 OID 22400058)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 22400327)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2679 (class 1259 OID 22400326)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2770 (class 1259 OID 22400704)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2771 (class 1259 OID 22400705)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2753 (class 1259 OID 22400551)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 22400552)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2755 (class 1259 OID 22400549)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2756 (class 1259 OID 22400550)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2702 (class 1259 OID 22400388)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2703 (class 1259 OID 22400389)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2652 (class 1259 OID 22400267)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2653 (class 1259 OID 22400266)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 22400264)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2655 (class 1259 OID 22400265)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2749 (class 1259 OID 22400539)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 22400538)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 22400132)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2600 (class 1259 OID 22400146)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2601 (class 1259 OID 22400145)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2602 (class 1259 OID 22400144)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 22400147)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2612 (class 1259 OID 22400169)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 22400695)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2786 (class 1259 OID 22400743)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2804 (class 1259 OID 22400809)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2805 (class 1259 OID 22400810)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2548 (class 1259 OID 22399979)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2549 (class 1259 OID 22399978)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2557 (class 1259 OID 22400011)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 22400012)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2629 (class 1259 OID 22400210)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 22400248)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 22400247)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2643 (class 1259 OID 22400246)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 22400196)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2625 (class 1259 OID 22400197)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2626 (class 1259 OID 22400195)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2627 (class 1259 OID 22400199)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2628 (class 1259 OID 22400198)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2565 (class 1259 OID 22400030)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22399967)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 22399968)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2589 (class 1259 OID 22400106)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 22400108)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2591 (class 1259 OID 22400107)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2592 (class 1259 OID 22400109)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2660 (class 1259 OID 22400273)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 22400484)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22400517)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 22400458)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 22400459)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2555 (class 1259 OID 22400002)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 22400003)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2699 (class 1259 OID 22400378)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 22399892)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 22400078)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 22400040)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 22399880)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2783 (class 1259 OID 22400736)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 22400325)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2683 (class 1259 OID 22400324)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 22400224)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 22400225)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2757 (class 1259 OID 22400548)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 22400066)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22400497)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 22400783)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2776 (class 1259 OID 22400712)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 22400713)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2723 (class 1259 OID 22400447)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2640 (class 1259 OID 22400235)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 22399942)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2850 (class 2606 OID 22400990)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2849 (class 2606 OID 22400995)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2845 (class 2606 OID 22401015)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2851 (class 2606 OID 22400985)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2847 (class 2606 OID 22401005)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2846 (class 2606 OID 22401010)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2848 (class 2606 OID 22401000)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2887 (class 2606 OID 22401185)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2886 (class 2606 OID 22401190)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 22401195)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 22401360)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2920 (class 2606 OID 22401355)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 22400890)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2826 (class 2606 OID 22400895)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 22401100)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2914 (class 2606 OID 22401340)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 22401335)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2913 (class 2606 OID 22401345)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 22401330)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2917 (class 2606 OID 22401325)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2866 (class 2606 OID 22401095)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2867 (class 2606 OID 22401090)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2844 (class 2606 OID 22400975)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2843 (class 2606 OID 22400980)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 22401140)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2876 (class 2606 OID 22401150)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2877 (class 2606 OID 22401145)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2836 (class 2606 OID 22400945)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 22400940)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 22401080)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 22401315)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2890 (class 2606 OID 22401200)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 22401205)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 22401210)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2918 (class 2606 OID 22401350)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2892 (class 2606 OID 22401230)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2895 (class 2606 OID 22401215)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2891 (class 2606 OID 22401235)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2893 (class 2606 OID 22401225)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2894 (class 2606 OID 22401220)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2834 (class 2606 OID 22400935)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2835 (class 2606 OID 22400930)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2822 (class 2606 OID 22400875)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2823 (class 2606 OID 22400870)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 22401120)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2819 (class 2606 OID 22400850)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2818 (class 2606 OID 22400855)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2873 (class 2606 OID 22401135)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2874 (class 2606 OID 22401130)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2875 (class 2606 OID 22401125)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2829 (class 2606 OID 22400905)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 22400900)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2828 (class 2606 OID 22400910)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2841 (class 2606 OID 22400960)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 22400965)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 22400835)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2856 (class 2606 OID 22401055)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2858 (class 2606 OID 22401045)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2859 (class 2606 OID 22401040)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2857 (class 2606 OID 22401050)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2817 (class 2606 OID 22400840)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 22400845)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 22401105)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2923 (class 2606 OID 22401375)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 22401180)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 22401175)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2925 (class 2606 OID 22401380)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2924 (class 2606 OID 22401385)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2865 (class 2606 OID 22401085)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2882 (class 2606 OID 22401165)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2881 (class 2606 OID 22401170)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2902 (class 2606 OID 22401290)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 22401285)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2906 (class 2606 OID 22401270)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2905 (class 2606 OID 22401275)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2904 (class 2606 OID 22401280)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2832 (class 2606 OID 22400920)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 22400915)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 22400925)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2870 (class 2606 OID 22401115)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2871 (class 2606 OID 22401110)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 22401300)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 22401305)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2899 (class 2606 OID 22401260)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2898 (class 2606 OID 22401265)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2901 (class 2606 OID 22401250)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2900 (class 2606 OID 22401255)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2880 (class 2606 OID 22401155)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 22401160)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2860 (class 2606 OID 22401075)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2861 (class 2606 OID 22401070)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2863 (class 2606 OID 22401060)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2862 (class 2606 OID 22401065)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2896 (class 2606 OID 22401245)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22401240)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2838 (class 2606 OID 22400950)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2839 (class 2606 OID 22400955)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 22400970)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2907 (class 2606 OID 22401295)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2910 (class 2606 OID 22401310)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2912 (class 2606 OID 22401320)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2922 (class 2606 OID 22401365)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2921 (class 2606 OID 22401370)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 22400865)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2821 (class 2606 OID 22400860)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2825 (class 2606 OID 22400880)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 22400885)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 22401020)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 22401035)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 22401030)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2855 (class 2606 OID 22401025)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-19 10:22:12 CEST

--
-- PostgreSQL database dump complete
--

