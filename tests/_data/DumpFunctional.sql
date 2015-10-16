--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-16 14:53:26 CEST

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
-- TOC entry 181 (class 1259 OID 22341106)
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
-- TOC entry 232 (class 1259 OID 22341696)
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
-- TOC entry 231 (class 1259 OID 22341679)
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
-- TOC entry 222 (class 1259 OID 22341556)
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
-- TOC entry 225 (class 1259 OID 22341586)
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
-- TOC entry 246 (class 1259 OID 22341967)
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
-- TOC entry 199 (class 1259 OID 22341336)
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
-- TOC entry 201 (class 1259 OID 22341367)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 22341893)
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
-- TOC entry 192 (class 1259 OID 22341249)
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
-- TOC entry 233 (class 1259 OID 22341709)
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
-- TOC entry 218 (class 1259 OID 22341510)
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
-- TOC entry 197 (class 1259 OID 22341315)
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
-- TOC entry 195 (class 1259 OID 22341289)
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
-- TOC entry 193 (class 1259 OID 22341266)
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
-- TOC entry 207 (class 1259 OID 22341424)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 244 (class 1259 OID 22341948)
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
-- TOC entry 245 (class 1259 OID 22341960)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 22341982)
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
-- TOC entry 211 (class 1259 OID 22341449)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22341223)
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
-- TOC entry 183 (class 1259 OID 22341125)
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
-- TOC entry 187 (class 1259 OID 22341189)
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
-- TOC entry 184 (class 1259 OID 22341136)
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
-- TOC entry 178 (class 1259 OID 22341080)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22341099)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22341456)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 22341490)
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
-- TOC entry 228 (class 1259 OID 22341627)
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
-- TOC entry 186 (class 1259 OID 22341169)
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
-- TOC entry 189 (class 1259 OID 22341215)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22341838)
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
-- TOC entry 208 (class 1259 OID 22341430)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22341200)
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
-- TOC entry 196 (class 1259 OID 22341304)
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
-- TOC entry 210 (class 1259 OID 22341442)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 22341852)
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
-- TOC entry 237 (class 1259 OID 22341862)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 22341777)
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
-- TOC entry 238 (class 1259 OID 22341870)
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
-- TOC entry 214 (class 1259 OID 22341471)
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
-- TOC entry 206 (class 1259 OID 22341415)
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
-- TOC entry 205 (class 1259 OID 22341405)
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
-- TOC entry 227 (class 1259 OID 22341616)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 22341546)
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
-- TOC entry 194 (class 1259 OID 22341278)
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
-- TOC entry 175 (class 1259 OID 22341051)
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
-- TOC entry 174 (class 1259 OID 22341049)
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
-- TOC entry 215 (class 1259 OID 22341484)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22341089)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22341073)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 22341498)
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
-- TOC entry 209 (class 1259 OID 22341436)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 22341382)
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
-- TOC entry 173 (class 1259 OID 22341038)
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
-- TOC entry 172 (class 1259 OID 22341030)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22341025)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 223 (class 1259 OID 22341563)
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
-- TOC entry 185 (class 1259 OID 22341161)
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
-- TOC entry 204 (class 1259 OID 22341392)
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
-- TOC entry 226 (class 1259 OID 22341604)
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
-- TOC entry 182 (class 1259 OID 22341115)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 239 (class 1259 OID 22341881)
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
-- TOC entry 202 (class 1259 OID 22341372)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22341235)
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
-- TOC entry 176 (class 1259 OID 22341060)
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
-- TOC entry 230 (class 1259 OID 22341654)
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
-- TOC entry 198 (class 1259 OID 22341326)
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
-- TOC entry 213 (class 1259 OID 22341463)
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
-- TOC entry 224 (class 1259 OID 22341577)
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
-- TOC entry 242 (class 1259 OID 22341928)
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
-- TOC entry 241 (class 1259 OID 22341900)
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
-- TOC entry 243 (class 1259 OID 22341940)
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
-- TOC entry 220 (class 1259 OID 22341535)
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
-- TOC entry 200 (class 1259 OID 22341361)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 229 (class 1259 OID 22341644)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 219 (class 1259 OID 22341525)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2215 (class 2604 OID 22341054)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3044 (class 0 OID 22341106)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22341696)
-- Dependencies: 232
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5620-f344-76dd-ed314602d195	000d0000-5620-f343-89ec-9bfd0cec29ee	\N	00090000-5620-f343-106a-c922a02c2a74	000b0000-5620-f343-9fc0-545221312004	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5620-f344-f545-9cf1ff1f9a5c	000d0000-5620-f343-f8ee-a80f4d3b3227	00100000-5620-f343-3dd1-447775154e98	00090000-5620-f343-1a14-c78ee07292fb	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5620-f344-ee7d-416093917b72	000d0000-5620-f343-51eb-f680394772a8	00100000-5620-f343-e4f9-7290ce2fe292	00090000-5620-f343-85cf-b1fc15249e46	\N	0003	t	\N	2015-10-16	\N	2	t	\N	f	f
000c0000-5620-f344-abcb-708889f0d580	000d0000-5620-f343-fddb-2f04e68bd522	\N	00090000-5620-f343-b0a3-e6c5c7f017c3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5620-f344-c33c-f2323725ec8b	000d0000-5620-f343-84e8-b73b579d943c	\N	00090000-5620-f343-7ef0-45e1f051e183	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5620-f344-9d1d-af21a4ea28ce	000d0000-5620-f343-e906-bbc20001c184	\N	00090000-5620-f343-e61b-ca7479860c63	000b0000-5620-f343-a726-50b591b26f33	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5620-f344-3d0b-5b42be576222	000d0000-5620-f343-64f2-5644f4c30ecb	00100000-5620-f343-e160-0e95390cbefd	00090000-5620-f343-4cc4-4f11c936f1a2	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5620-f344-1010-dd93f21cc832	000d0000-5620-f343-a300-79a80fe46c53	\N	00090000-5620-f343-c1d8-f6bf09c153a6	000b0000-5620-f343-0652-ab9c8e16aef8	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5620-f344-f075-1f5dc21b7bca	000d0000-5620-f343-64f2-5644f4c30ecb	00100000-5620-f343-1e14-01a0059141ee	00090000-5620-f343-62e4-a04074f2235c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5620-f344-5980-b7aaa20fb72c	000d0000-5620-f343-64f2-5644f4c30ecb	00100000-5620-f343-5fbf-20fa4fedde64	00090000-5620-f343-1037-999e531f3886	\N	0010	t	\N	2015-10-16	\N	16	f	\N	f	t
000c0000-5620-f344-37a0-f057a29192c8	000d0000-5620-f343-64f2-5644f4c30ecb	00100000-5620-f343-be67-bd8fbbfdb2d9	00090000-5620-f343-f704-1391ad190f5c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5620-f344-d502-09eadac16c90	000d0000-5620-f343-3146-df4eb126941e	\N	00090000-5620-f343-1a14-c78ee07292fb	000b0000-5620-f343-35c5-db3b0da8ea42	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3094 (class 0 OID 22341679)
-- Dependencies: 231
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22341556)
-- Dependencies: 222
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5620-f343-680f-506d49c5ec66	00160000-5620-f343-813f-a7b3c8b1657d	00090000-5620-f343-8dde-3bb361d29695	aizv	10	t
003d0000-5620-f343-0f64-bca2289d4425	00160000-5620-f343-813f-a7b3c8b1657d	00090000-5620-f343-3a7a-4c6f8e4f6a39	apri	14	t
003d0000-5620-f343-6dc6-4cce8925e78a	00160000-5620-f343-32fe-41ef9e5e4f30	00090000-5620-f343-e38f-fc5918cbd1a3	aizv	11	t
003d0000-5620-f343-8c41-605d60bcd240	00160000-5620-f343-d225-6710198b4372	00090000-5620-f343-76e0-e2ffde329ee1	aizv	12	t
003d0000-5620-f343-9eaa-0464a54e7adf	00160000-5620-f343-813f-a7b3c8b1657d	00090000-5620-f343-ce84-185723a1cba9	apri	18	f
\.


--
-- TOC entry 3088 (class 0 OID 22341586)
-- Dependencies: 225
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5620-f343-813f-a7b3c8b1657d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5620-f343-32fe-41ef9e5e4f30	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5620-f343-d225-6710198b4372	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3109 (class 0 OID 22341967)
-- Dependencies: 246
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22341336)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5620-f343-9fc9-d67370fba877	\N	\N	00200000-5620-f343-2b96-8ee1f3845f78	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5620-f343-d2ef-706f461e2152	\N	\N	00200000-5620-f343-629c-dab406e9899a	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5620-f343-cb6d-334a4e789fac	\N	\N	00200000-5620-f343-2a3c-56a7899c3d40	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5620-f343-ea26-808717033e9f	\N	\N	00200000-5620-f343-a0ef-ddda3e52b9fa	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5620-f343-d43c-549c9b1fccdd	\N	\N	00200000-5620-f343-be80-2784da86952d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3064 (class 0 OID 22341367)
-- Dependencies: 201
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22341893)
-- Dependencies: 240
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22341249)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5620-f341-8ef4-f482bea6db68	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5620-f341-348e-df09344b9506	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5620-f341-ce9a-b629ca436d68	AL	ALB	008	Albania 	Albanija	\N
00040000-5620-f341-b01b-1c78b67ce4eb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5620-f341-14ad-905f88b5d23c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5620-f341-2aa1-c4e011fea5ab	AD	AND	020	Andorra 	Andora	\N
00040000-5620-f341-5971-b2004e1a2e3e	AO	AGO	024	Angola 	Angola	\N
00040000-5620-f341-b228-c89c43f3efd8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5620-f341-064d-9fd707c4dedb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5620-f341-5315-a60a827f2fe1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-f341-edb5-a955ca83bd99	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5620-f341-6c75-4556cc62d81b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5620-f341-f49a-ff2944c09bb1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5620-f341-4361-5717f7dc4154	AU	AUS	036	Australia 	Avstralija	\N
00040000-5620-f341-297f-169b95f0f3bf	AT	AUT	040	Austria 	Avstrija	\N
00040000-5620-f341-e0b2-8e3ede8a6b87	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5620-f341-6f15-11dcd1e50aef	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5620-f341-ce64-eee5089d4def	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5620-f341-7752-1506b4fdb1a8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5620-f341-c6c5-60060b6a662a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5620-f341-5f81-70dc276172f7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5620-f341-4d0f-e137898bc5b5	BE	BEL	056	Belgium 	Belgija	\N
00040000-5620-f341-03f2-af02418730b1	BZ	BLZ	084	Belize 	Belize	\N
00040000-5620-f341-1151-23f7ba6efba8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5620-f341-c3b5-8fdc7eb55d45	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5620-f341-cbce-cbd02a59c1fe	BT	BTN	064	Bhutan 	Butan	\N
00040000-5620-f341-f112-2c9f8fc7418c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5620-f341-6b07-c146d05d8fd1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5620-f341-bff7-ef5bcf68182d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5620-f341-0439-7f725f2dd24a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5620-f341-15cf-be94b2452a7f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5620-f341-6ea5-8cbb8bf3bd4b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5620-f341-155e-d1579c28fd28	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5620-f341-f394-c5f7f18165d1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5620-f341-878a-9de03f328553	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5620-f341-e9ba-6072c36402b9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5620-f341-0ac3-5c2f29875e72	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5620-f341-6eb2-1e103016f518	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5620-f341-176f-6c92874586fd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5620-f341-66a8-85bb331b9774	CA	CAN	124	Canada 	Kanada	\N
00040000-5620-f341-4e22-95bd84242914	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5620-f341-9551-1c9148798062	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5620-f341-89b8-2e707b1e42c1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5620-f341-2dee-26ed59182099	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5620-f341-7a24-a0b9a62bbde0	CL	CHL	152	Chile 	Čile	\N
00040000-5620-f341-38c6-7fd8b15fc99a	CN	CHN	156	China 	Kitajska	\N
00040000-5620-f341-b2ed-0f1d69444b3d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5620-f341-5e08-78b0e42c5311	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5620-f341-773f-9d953a9731d3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5620-f341-bd0c-ad08c175989f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5620-f341-4adf-f78be8693078	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5620-f341-85d8-d20d340665cd	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5620-f341-be1f-0499fefa178b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5620-f341-4209-cce7981303e6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5620-f341-0fd6-5bb70e47df5a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5620-f341-b2f4-ebbe4d4f6e23	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5620-f341-7842-f6f7aefebeeb	CU	CUB	192	Cuba 	Kuba	\N
00040000-5620-f341-02b6-5fe4f33bb5b6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5620-f341-df67-d5b2171aa78a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5620-f341-4db3-ee22d21a90d9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5620-f341-177f-f9f2482ad29d	DK	DNK	208	Denmark 	Danska	\N
00040000-5620-f341-7a89-d852e2948d87	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5620-f341-14c5-9b61bfd822ad	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-f341-ea64-b2d8c0de113c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5620-f341-06b4-f3d1a29407b4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5620-f341-981c-0acf3a156103	EG	EGY	818	Egypt 	Egipt	\N
00040000-5620-f341-a079-57f9e23b92cc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5620-f341-4b36-3952c51df3ab	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5620-f341-15f8-02a4b2cbe996	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5620-f341-a684-30d37af563e2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5620-f341-41ff-f9e9adadb0ff	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5620-f341-b23f-3c132f6184f9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5620-f341-0e53-a907f6356582	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5620-f341-1cf0-77e44243732a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5620-f341-a769-0861d2df92f2	FI	FIN	246	Finland 	Finska	\N
00040000-5620-f341-9cc9-e7574b0aa2ad	FR	FRA	250	France 	Francija	\N
00040000-5620-f341-616c-143b1c2c4d18	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5620-f341-0eea-3394ba7ee811	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5620-f341-9c78-459f40f18480	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5620-f341-72d7-40e35fbb5616	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5620-f341-2999-ecf68927dd6f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5620-f341-7d48-47de790f358f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5620-f341-2e3a-ad025423c07c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5620-f341-3a3b-9ecac15c6e2b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5620-f341-712a-a6c9753ed417	GH	GHA	288	Ghana 	Gana	\N
00040000-5620-f341-138f-92de2d6dcd81	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5620-f341-6324-37e4caee1c7d	GR	GRC	300	Greece 	Grčija	\N
00040000-5620-f341-f7ee-d6a644046a1e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5620-f341-edca-cd1b3d94799d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5620-f341-6d7c-60af2dca64f5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5620-f341-15fe-f791ff249e0f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5620-f341-3a87-e9a9bb887212	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5620-f341-e223-450a2ba36f20	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5620-f341-ec1a-393707931e8c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5620-f341-ad31-289b33072cf9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5620-f341-b3b4-3a9c2bf2f286	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5620-f341-1065-137dfa6cccff	HT	HTI	332	Haiti 	Haiti	\N
00040000-5620-f341-dc8a-d062a3034154	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5620-f341-a1b4-6cbc4d6c8f96	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5620-f341-ac8c-7ca99476bacc	HN	HND	340	Honduras 	Honduras	\N
00040000-5620-f341-9ac2-1940ec8420a0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5620-f341-e7da-0c06152a7f16	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5620-f341-e336-4e9d9795eaaa	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5620-f341-3e72-bc8a69caba8e	IN	IND	356	India 	Indija	\N
00040000-5620-f341-4419-b181504c4260	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5620-f341-837c-21061e0c9560	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5620-f341-c1b2-53c2cae7bb31	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5620-f341-7c62-2806e565a9e2	IE	IRL	372	Ireland 	Irska	\N
00040000-5620-f341-2f08-77a273fc97f0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5620-f341-e299-bd0de5aee9e1	IL	ISR	376	Israel 	Izrael	\N
00040000-5620-f341-1d71-2df72da1fbcf	IT	ITA	380	Italy 	Italija	\N
00040000-5620-f341-1126-e05c374ce2d7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5620-f341-64c6-311361203759	JP	JPN	392	Japan 	Japonska	\N
00040000-5620-f341-416a-3a94dc57e8a1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5620-f341-3e6b-1bb6a168e99f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5620-f341-e491-5752c9f8263c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5620-f341-f370-379e8deda40b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5620-f341-2bcb-5fa943e1c6e0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5620-f341-eb67-eacdfa02e55f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5620-f341-e218-624bf7a4e1d1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5620-f341-9cbb-27f58614ff1d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5620-f341-dacb-7411b3560877	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5620-f341-677c-d286f4d819bd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5620-f341-cc91-aa0eae355106	LV	LVA	428	Latvia 	Latvija	\N
00040000-5620-f341-3e8c-1e60112882bb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5620-f341-d6d7-cf6328887ce9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5620-f341-9dec-bd66c5dad2a0	LR	LBR	430	Liberia 	Liberija	\N
00040000-5620-f341-c3a2-4956141df047	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5620-f341-35cc-aa587f6df617	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5620-f341-907c-a0616bd3429c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5620-f341-0a20-1f528dc73fd1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5620-f341-43a2-8047c18b5ebf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5620-f341-2028-101e96868bbf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5620-f341-bef9-7f769d597376	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5620-f341-f6cb-b2beadd69b89	MW	MWI	454	Malawi 	Malavi	\N
00040000-5620-f341-46b2-0731b89156e2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5620-f341-c3e9-e54439849166	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5620-f341-07f9-aa2524f445a2	ML	MLI	466	Mali 	Mali	\N
00040000-5620-f341-7fd8-99f22e819a66	MT	MLT	470	Malta 	Malta	\N
00040000-5620-f341-b972-78625b6b7c2f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5620-f341-b10a-47e2a7ec6428	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5620-f341-c069-86848dc4e557	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5620-f341-2365-61e50c505a36	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5620-f341-f3c8-02be5286c29a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5620-f341-5be8-da4d8cd9825e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5620-f341-7dd7-ae69a7bc9280	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5620-f341-ccbd-56eac99a33f9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5620-f341-76a8-a8e6a18ab0c0	MC	MCO	492	Monaco 	Monako	\N
00040000-5620-f341-e07c-b01a8e02971a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5620-f341-b022-c6ad1697cf8c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5620-f341-9ce0-ba6577baa2b4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5620-f341-39ea-5c16ea2f6149	MA	MAR	504	Morocco 	Maroko	\N
00040000-5620-f341-6184-cc9006441265	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5620-f341-c206-11667d3683e1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5620-f341-9e18-1804b97bbc51	NA	NAM	516	Namibia 	Namibija	\N
00040000-5620-f341-367a-6ebec3dd2136	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5620-f341-0be6-a0d44ca0572c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5620-f341-5aa1-5e1658cb2a2e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5620-f341-4503-dd2fbc5ec164	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5620-f341-75f3-796e7dafb4d3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5620-f341-6d8d-4e1dc1a2be95	NE	NER	562	Niger 	Niger 	\N
00040000-5620-f341-955e-0c392e86f76b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5620-f341-2a32-2a1892026415	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5620-f341-8dc3-a94b78aa4975	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5620-f341-425f-c3efc93c804b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5620-f341-35e0-e8447561f23a	NO	NOR	578	Norway 	Norveška	\N
00040000-5620-f341-b65e-363a67fb483e	OM	OMN	512	Oman 	Oman	\N
00040000-5620-f341-b2ab-2123dd82c390	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5620-f341-5f90-49fcadd68e5b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5620-f341-44c9-f459d433cacf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5620-f341-38ae-ed0c436c039f	PA	PAN	591	Panama 	Panama	\N
00040000-5620-f341-a4e0-f65531b23ea6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5620-f341-5e36-306c152b178a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5620-f341-c5d2-4d06422ab33c	PE	PER	604	Peru 	Peru	\N
00040000-5620-f341-7b86-a1ea155b82b9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5620-f341-b163-e1028902ff4c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5620-f341-326b-cb58cb3e4b77	PL	POL	616	Poland 	Poljska	\N
00040000-5620-f341-3ad1-509c5b2b5c60	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5620-f341-b562-60605fa4f709	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5620-f341-98df-aaab4e6b7826	QA	QAT	634	Qatar 	Katar	\N
00040000-5620-f341-2f03-6171e31c8fdc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5620-f341-df64-d9bd9b1b0508	RO	ROU	642	Romania 	Romunija	\N
00040000-5620-f341-969c-92a53a2ff027	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5620-f341-354e-306497d56475	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5620-f341-b319-031b7f7bd456	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5620-f341-f8dc-658b38f99891	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5620-f341-ae58-dea56fec4359	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5620-f341-8f04-30203f6f27e2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5620-f341-5b07-5e380a013cbb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5620-f341-9942-d582241a1157	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5620-f341-0f2e-c7c2fb938c65	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5620-f341-fd34-385736900b3c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5620-f341-80c5-8b02ca0fdff3	SM	SMR	674	San Marino 	San Marino	\N
00040000-5620-f341-9645-f361194f6658	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5620-f341-663e-26ed32282c3f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5620-f341-727f-97a0f5c32f85	SN	SEN	686	Senegal 	Senegal	\N
00040000-5620-f341-6642-90a44052b466	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5620-f341-759d-0c7b9fdc199d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5620-f341-e9d3-c88f9f51a9bd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5620-f341-d9da-02650a6e3ba3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5620-f341-80b4-6bfde7e273a4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5620-f341-e970-526f3414cc49	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5620-f341-6a40-b3898a82c5b4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5620-f341-8c26-8af6d8de9a5f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5620-f341-30c9-d15a28d474c0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5620-f341-c673-f42af30e2f83	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5620-f341-0db0-bfa9860721c4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5620-f341-0da6-30ecf8b62e78	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5620-f341-f7a7-9fb9d4a3df30	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5620-f341-5621-6466d89bb1ad	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5620-f341-d8a4-4aceedb1319f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5620-f341-cf6f-f6e41823bcb5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5620-f341-b5f0-010e4c07f8e1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5620-f341-426c-13a67f0cd12c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5620-f341-e62d-99194cd91d4a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5620-f341-259e-74329ef7e0bf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5620-f341-b720-507b3bd7f83a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5620-f341-3138-fc9513d87362	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5620-f341-aa62-1ff7fa6f7d18	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5620-f341-60dd-d9be2564231e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5620-f341-b7c8-f6d90e156644	TH	THA	764	Thailand 	Tajska	\N
00040000-5620-f341-05ae-6e173e05335f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5620-f341-558b-c09d63146842	TG	TGO	768	Togo 	Togo	\N
00040000-5620-f341-5cc4-bbb7e22a7283	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5620-f341-531d-ed3f570d32cd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5620-f341-f7ac-b23b024a7328	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5620-f341-5814-ba7d8a6a4f5c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5620-f341-5de4-fd47f06ad02b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5620-f341-b84b-0dd984724823	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5620-f341-0171-7eb62dc904e6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-f341-8b9c-bc7d6b7608a0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5620-f341-7918-90262845a264	UG	UGA	800	Uganda 	Uganda	\N
00040000-5620-f341-e95c-a855eec2c99c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5620-f341-639d-f8d2999a2e96	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5620-f341-3d76-b15a28df98bb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5620-f341-6ecc-12fb85ee62b6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5620-f341-9e70-eded5545f46d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5620-f341-2d1d-67d741f899a7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5620-f341-d9e4-711f82ed3bd3	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5620-f341-4e63-512b7fe6f4d8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5620-f341-6fe0-394d4a4f04b1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5620-f341-253f-8342508ed723	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5620-f341-3b5a-3984d5796ad5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-f341-6d15-313485569f04	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5620-f341-2a20-ec59e0e266c2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5620-f341-683a-f9a2afc269ae	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5620-f341-e443-6fa056a8c7d5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5620-f341-2842-761239e1f275	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5620-f341-34f6-443118f573da	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3096 (class 0 OID 22341709)
-- Dependencies: 233
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5620-f343-59d0-08abac116305	000e0000-5620-f343-cf25-cb01baad5e3c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-f341-85cd-220f023127fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-f343-dcc0-c122295c0a34	000e0000-5620-f343-c1ce-12e8f14f7801	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-f341-d493-41090e1a5ee4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-f343-cc10-9b779bf9fb02	000e0000-5620-f343-c62a-003d7900f8b3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-f341-85cd-220f023127fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-f344-5f6b-1f053f18c23b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-f344-1a25-abea900e6e73	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3081 (class 0 OID 22341510)
-- Dependencies: 218
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5620-f343-89ec-9bfd0cec29ee	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-76dd-ed314602d195	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-f341-a923-ebed227d90c1
000d0000-5620-f343-f8ee-a80f4d3b3227	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-f545-9cf1ff1f9a5c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5620-f341-75e9-4fe5380e0e0d
000d0000-5620-f343-51eb-f680394772a8	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-ee7d-416093917b72	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5620-f341-a4d6-e59d92b363c8
000d0000-5620-f343-fddb-2f04e68bd522	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-abcb-708889f0d580	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5620-f341-1f4f-b8d2fe2b1db5
000d0000-5620-f343-84e8-b73b579d943c	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-c33c-f2323725ec8b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5620-f341-1f4f-b8d2fe2b1db5
000d0000-5620-f343-e906-bbc20001c184	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-9d1d-af21a4ea28ce	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-f341-a923-ebed227d90c1
000d0000-5620-f343-64f2-5644f4c30ecb	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-f075-1f5dc21b7bca	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5620-f341-a923-ebed227d90c1
000d0000-5620-f343-a300-79a80fe46c53	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-1010-dd93f21cc832	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5620-f341-b386-2699de551251
000d0000-5620-f343-3146-df4eb126941e	000e0000-5620-f343-c1ce-12e8f14f7801	000c0000-5620-f344-d502-09eadac16c90	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5620-f341-a696-1749cb9f1986
\.


--
-- TOC entry 3060 (class 0 OID 22341315)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22341289)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22341266)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5620-f343-40ae-24227503a70d	00080000-5620-f343-97c7-a1ec0c07d792	00090000-5620-f343-1037-999e531f3886	AK		igralka
\.


--
-- TOC entry 3070 (class 0 OID 22341424)
-- Dependencies: 207
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22341948)
-- Dependencies: 244
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 22341960)
-- Dependencies: 245
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22341982)
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
-- TOC entry 3074 (class 0 OID 22341449)
-- Dependencies: 211
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 22341223)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5620-f342-74dc-ef768b463595	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5620-f342-19ad-b13ff7460af6	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5620-f342-1ce9-b2685d587917	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5620-f342-f63f-01ba90ffec64	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5620-f342-315d-9ada6d4adf6e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5620-f342-cd14-227cbe4738c3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5620-f342-5329-bd61a4dc78fa	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5620-f342-6629-020b4b034cb6	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-f342-0ab9-9191654cfe08	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-f342-59cc-1a1a0d3d9dfd	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5620-f342-761a-b9586ada1448	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5620-f342-2b9e-5a58fe775a1d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5620-f342-e1ac-02533307a351	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5620-f342-9000-af5b97d011a7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5620-f342-bca8-9e6d1dc28c1a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5620-f343-b124-e9f0cf6253e0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5620-f343-fb3b-6611852380d1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5620-f343-ccf3-e3d437b50604	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5620-f343-0b3a-9850c9e5ffef	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5620-f343-40e5-538adbe0774c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5620-f345-700d-cfbb9df493c4	application.tenant.maticnopodjetje	string	s:36:"00080000-5620-f345-dd5c-c07daefc3695";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3046 (class 0 OID 22341125)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5620-f343-72e9-ec17c79e7d1b	00000000-5620-f343-b124-e9f0cf6253e0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5620-f343-98a8-33da1c7acd75	00000000-5620-f343-b124-e9f0cf6253e0	00010000-5620-f342-3c28-d77f9eba42a9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5620-f343-b35c-5339f764cb1c	00000000-5620-f343-fb3b-6611852380d1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3050 (class 0 OID 22341189)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 22341136)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5620-f343-106a-c922a02c2a74	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5620-f343-b0a3-e6c5c7f017c3	00010000-5620-f343-f233-54b4ec2a6193	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5620-f343-85cf-b1fc15249e46	00010000-5620-f343-9901-9a045ab0ed23	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5620-f343-62e4-a04074f2235c	00010000-5620-f343-30d2-e19520df1653	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5620-f343-f464-3b55ad5dfbd3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5620-f343-e61b-ca7479860c63	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5620-f343-f704-1391ad190f5c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5620-f343-4cc4-4f11c936f1a2	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5620-f343-1037-999e531f3886	00010000-5620-f343-3209-a142e11d672a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5620-f343-1a14-c78ee07292fb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5620-f343-44c7-d69bce1395d8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-f343-7ef0-45e1f051e183	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5620-f343-c1d8-f6bf09c153a6	00010000-5620-f343-06a2-7cebf7c007eb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-f343-8dde-3bb361d29695	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-f343-3a7a-4c6f8e4f6a39	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-f343-e38f-fc5918cbd1a3	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-f343-76e0-e2ffde329ee1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5620-f343-ce84-185723a1cba9	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 22341080)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5620-f341-3c0f-f112ab70a804	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5620-f341-0d4e-ea05bae5f85e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5620-f341-6aa0-7ba8d32f22b7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5620-f341-3144-8189c0292d81	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5620-f341-7e52-f7fb319fa5f7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5620-f341-5d33-f2799fabb7f3	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5620-f341-a9f1-194d5e0cfaf3	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5620-f341-c096-606dddc7ab68	Abonma-read	Abonma - branje	f
00030000-5620-f341-fddd-cb2522a05ea3	Abonma-write	Abonma - spreminjanje	f
00030000-5620-f341-c9b4-0d84659c356d	Alternacija-read	Alternacija - branje	f
00030000-5620-f341-1245-1143087d4824	Alternacija-write	Alternacija - spreminjanje	f
00030000-5620-f341-2a77-1b93bd871178	Arhivalija-read	Arhivalija - branje	f
00030000-5620-f341-a71a-5d0d719ba5fd	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5620-f341-8884-af10030de21b	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5620-f341-bbe1-9b32423d1ab8	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5620-f341-c5e2-2ef768b3e11e	Besedilo-read	Besedilo - branje	f
00030000-5620-f341-104e-c847b35f3494	Besedilo-write	Besedilo - spreminjanje	f
00030000-5620-f341-5a5c-70e8d5d8d45a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5620-f341-294d-94a99f20c4d8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5620-f341-6249-8112e89b352a	Dogodek-read	Dogodek - branje	f
00030000-5620-f341-cfb1-2a33be1485a3	Dogodek-write	Dogodek - spreminjanje	f
00030000-5620-f341-6da2-2928c62954d0	DrugiVir-read	DrugiVir - branje	f
00030000-5620-f341-9c0d-389848c6e820	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5620-f341-a274-7d709fccabf8	Drzava-read	Drzava - branje	f
00030000-5620-f341-65de-70ec364fd380	Drzava-write	Drzava - spreminjanje	f
00030000-5620-f341-1d7e-60c6c99027ef	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5620-f341-c7d7-2ce606eacc9c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5620-f341-33e9-562b2c647b26	Funkcija-read	Funkcija - branje	f
00030000-5620-f341-5205-20bbbf765f57	Funkcija-write	Funkcija - spreminjanje	f
00030000-5620-f341-3c41-0b61f15bd8b0	Gostovanje-read	Gostovanje - branje	f
00030000-5620-f341-787d-9348d9d13328	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5620-f341-b90a-9e589b148bd3	Gostujoca-read	Gostujoca - branje	f
00030000-5620-f341-a5da-266289d89e98	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5620-f341-f45d-f92182213591	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5620-f341-3b7b-b15341e8fb11	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5620-f341-6e6b-774e39ab1767	Kupec-read	Kupec - branje	f
00030000-5620-f341-3bde-c59ca2bc0ecc	Kupec-write	Kupec - spreminjanje	f
00030000-5620-f341-f7ea-c8cc85f5bc3b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5620-f341-070a-48b940749f33	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5620-f341-5c47-ca8f7850ebd4	Option-read	Option - branje	f
00030000-5620-f341-9af4-0f27426cc9fb	Option-write	Option - spreminjanje	f
00030000-5620-f341-150f-5238dab6a4ca	OptionValue-read	OptionValue - branje	f
00030000-5620-f341-34ef-a744726e0199	OptionValue-write	OptionValue - spreminjanje	f
00030000-5620-f341-178d-70e9d9c2d1bf	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5620-f341-9509-73b44828fd85	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5620-f341-5852-c67703b21ed7	Oseba-read	Oseba - branje	f
00030000-5620-f341-80e9-6fd0dd1f746b	Oseba-write	Oseba - spreminjanje	f
00030000-5620-f341-6182-de8b0be0c0c9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5620-f341-bbd5-ea7d15a96bb7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5620-f341-64f3-b1e0394e6f96	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5620-f341-527f-38c8d4f42edc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5620-f341-cad7-26f3c84e3fdf	Pogodba-read	Pogodba - branje	f
00030000-5620-f341-4a30-e0df7e0c4bef	Pogodba-write	Pogodba - spreminjanje	f
00030000-5620-f341-394b-62fc3072d6bc	Popa-read	Popa - branje	f
00030000-5620-f341-cd0e-eba5607291f3	Popa-write	Popa - spreminjanje	f
00030000-5620-f341-3e9c-2d4f1f07457a	Posta-read	Posta - branje	f
00030000-5620-f341-b08d-a77d16892abb	Posta-write	Posta - spreminjanje	f
00030000-5620-f341-20ef-3e85e9faa829	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5620-f341-3203-3347376c388a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5620-f341-8cd0-3271b3d4a4a4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5620-f341-f2f6-e9fda460cb85	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5620-f341-0d1d-6a7de69c4273	PostniNaslov-read	PostniNaslov - branje	f
00030000-5620-f341-593e-acdb431cc860	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5620-f341-4337-c36e575e57ee	Predstava-read	Predstava - branje	f
00030000-5620-f341-60ad-c065cec164d3	Predstava-write	Predstava - spreminjanje	f
00030000-5620-f341-1c54-044b7c10a461	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5620-f341-777b-88ab8343e065	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5620-f341-c8f9-6bd7a94d9cf5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5620-f341-2a72-2494e6064f92	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5620-f341-4abb-7a5a0f16cb85	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5620-f341-dc7b-5fb84e335fa1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5620-f341-cdab-dfd91b5aebc4	ProgramDela-read	ProgramDela - branje	f
00030000-5620-f341-10be-0180b68bc3c3	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5620-f341-ed33-c9594cc38ccb	ProgramFestival-read	ProgramFestival - branje	f
00030000-5620-f341-5cdf-2de67d8ac7f0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5620-f341-1340-033268e8b645	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5620-f341-fd29-c03a66ba5b55	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5620-f341-8eff-db4eb480b6de	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5620-f341-393a-d136bd8bbc58	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5620-f341-10e8-2c02517125a9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5620-f341-54c9-537f7620ac92	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5620-f341-0a61-2d707d31230c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5620-f341-84c4-f25aa8613e26	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5620-f341-5e2f-a0afce9ce1c0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5620-f341-205c-57d1af22fdb8	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5620-f341-1335-ceb4cf4cd1f2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5620-f341-1747-5d78db52814b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5620-f341-288e-fa3fdc41c856	ProgramRazno-read	ProgramRazno - branje	f
00030000-5620-f341-5d31-bede8373eebe	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5620-f341-51a0-11d112f62a91	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5620-f341-dbeb-d53866b182a4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5620-f341-1014-185bda8cad29	Prostor-read	Prostor - branje	f
00030000-5620-f341-d01c-2d3554227b89	Prostor-write	Prostor - spreminjanje	f
00030000-5620-f341-0637-16b8436760ad	Racun-read	Racun - branje	f
00030000-5620-f341-d462-490d4a78ad57	Racun-write	Racun - spreminjanje	f
00030000-5620-f341-e9e4-46f656910199	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5620-f341-49ee-684f01e01f26	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5620-f341-9c70-4ec039a4c149	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5620-f341-4be9-9b6787e6a07d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5620-f341-b4e8-e8933c08639d	Rekvizit-read	Rekvizit - branje	f
00030000-5620-f341-48f9-bdbc5c15d858	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5620-f341-e787-5c52b50a1d40	Revizija-read	Revizija - branje	f
00030000-5620-f341-0b32-ceedb4deddd6	Revizija-write	Revizija - spreminjanje	f
00030000-5620-f341-ab4d-3186bc93f191	Rezervacija-read	Rezervacija - branje	f
00030000-5620-f341-e4bd-367199b77eb1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5620-f341-484d-9b232e440861	SedezniRed-read	SedezniRed - branje	f
00030000-5620-f341-72e2-c7b8ef34b112	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5620-f341-96fd-9384bb6e9f8d	Sedez-read	Sedez - branje	f
00030000-5620-f341-2306-d7a5baace0fd	Sedez-write	Sedez - spreminjanje	f
00030000-5620-f341-0f56-b91fd23a2a1a	Sezona-read	Sezona - branje	f
00030000-5620-f341-f374-1b291f680308	Sezona-write	Sezona - spreminjanje	f
00030000-5620-f341-17e9-9b4b53b1b220	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5620-f341-4c11-d9aa8cda9473	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5620-f341-a0a4-ac9771ae791e	Stevilcenje-read	Stevilcenje - branje	f
00030000-5620-f341-f049-63b90f573e28	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5620-f341-d48b-c475812e99f6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5620-f341-cc72-d61a823ce7eb	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5620-f341-be72-b645fcc8c669	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5620-f341-08d9-98a559764250	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5620-f341-05e3-56b5fd27ef96	Telefonska-read	Telefonska - branje	f
00030000-5620-f341-c57c-8ed475a3d52c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5620-f341-2d24-aed892def94e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5620-f341-43dc-54877354dcb7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5620-f341-96e5-68439b5cea8f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5620-f341-a77d-8ac117ddb699	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5620-f341-d062-2c99e3c7ddcd	TipPopa-read	TipPopa - branje	f
00030000-5620-f341-670e-7f3b68741f21	TipPopa-write	TipPopa - spreminjanje	f
00030000-5620-f341-1831-9a615162561a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5620-f341-6cf1-986329641901	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5620-f341-f035-3b3ac2296d83	TipVaje-read	TipVaje - branje	f
00030000-5620-f341-39f2-cd4cf6e2dfda	TipVaje-write	TipVaje - spreminjanje	f
00030000-5620-f341-afd5-c399b818f9a8	Trr-read	Trr - branje	f
00030000-5620-f341-c0bf-47da37b1bd92	Trr-write	Trr - spreminjanje	f
00030000-5620-f341-b879-798a90674c37	Uprizoritev-read	Uprizoritev - branje	f
00030000-5620-f341-42b1-5d813384bf61	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5620-f341-de39-a2a10fd608d0	Vaja-read	Vaja - branje	f
00030000-5620-f341-2757-1edf2955eb66	Vaja-write	Vaja - spreminjanje	f
00030000-5620-f341-2bb5-247b92f2ba2e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5620-f341-a0af-87a24f76a59d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5620-f341-ceb6-d6401513a2f0	VrstaStroska-read	VrstaStroska - branje	f
00030000-5620-f341-75a0-739046b92fe6	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5620-f341-b460-c2651cc846c6	Zaposlitev-read	Zaposlitev - branje	f
00030000-5620-f341-7a41-26c7a46f5ad8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5620-f341-4c93-79c24a7701f0	Zasedenost-read	Zasedenost - branje	f
00030000-5620-f341-2359-9319e98718a3	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5620-f341-1238-8bc8981528ed	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5620-f341-994f-abc79bcb4082	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5620-f341-8060-34eddec4da42	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5620-f341-e9cf-d2d6672fd284	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5620-f341-fe0e-65d409263b39	Job-read	Branje opravil - samo zase - branje	f
00030000-5620-f341-bd42-6ef5513de279	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5620-f341-2de4-1d96d96d647d	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5620-f341-8509-d2196f731466	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5620-f341-9219-b1f4da7304a7	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5620-f341-981b-90b5d042a28e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5620-f341-2e8e-797ef4599048	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5620-f341-811b-f3d694000591	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-f341-7262-b758d455edc5	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-f341-7864-e5fd638e9f60	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-f341-0cf8-f456fbb9315d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-f341-5efc-c6ea6b9a94df	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5620-f341-37b5-b829dec09079	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5620-f341-bea8-ac28ac0383bb	Datoteka-write	Datoteka - spreminjanje	f
00030000-5620-f341-b8f3-d91786baf23c	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3043 (class 0 OID 22341099)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5620-f341-d862-c779340ba07a	00030000-5620-f341-0d4e-ea05bae5f85e
00020000-5620-f341-f052-9bd05753c963	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-c096-606dddc7ab68
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-fddd-cb2522a05ea3
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-c9b4-0d84659c356d
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-1245-1143087d4824
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-2a77-1b93bd871178
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-6249-8112e89b352a
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-3144-8189c0292d81
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-cfb1-2a33be1485a3
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-65de-70ec364fd380
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-33e9-562b2c647b26
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-5205-20bbbf765f57
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-3c41-0b61f15bd8b0
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-787d-9348d9d13328
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-b90a-9e589b148bd3
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-a5da-266289d89e98
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-f45d-f92182213591
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-3b7b-b15341e8fb11
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-5c47-ca8f7850ebd4
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-150f-5238dab6a4ca
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-5852-c67703b21ed7
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-80e9-6fd0dd1f746b
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-394b-62fc3072d6bc
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-cd0e-eba5607291f3
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-3e9c-2d4f1f07457a
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-b08d-a77d16892abb
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-0d1d-6a7de69c4273
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-593e-acdb431cc860
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-4337-c36e575e57ee
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-60ad-c065cec164d3
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-4abb-7a5a0f16cb85
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-dc7b-5fb84e335fa1
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-1014-185bda8cad29
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-d01c-2d3554227b89
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-9c70-4ec039a4c149
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-4be9-9b6787e6a07d
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-b4e8-e8933c08639d
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-48f9-bdbc5c15d858
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-0f56-b91fd23a2a1a
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-f374-1b291f680308
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-96e5-68439b5cea8f
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-b879-798a90674c37
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-42b1-5d813384bf61
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-de39-a2a10fd608d0
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-2757-1edf2955eb66
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-4c93-79c24a7701f0
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-2359-9319e98718a3
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-1238-8bc8981528ed
00020000-5620-f342-1efd-7dcc7188eb8d	00030000-5620-f341-8060-34eddec4da42
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-c096-606dddc7ab68
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-2a77-1b93bd871178
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-6249-8112e89b352a
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-3c41-0b61f15bd8b0
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-b90a-9e589b148bd3
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-f45d-f92182213591
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-3b7b-b15341e8fb11
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-5c47-ca8f7850ebd4
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-150f-5238dab6a4ca
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-5852-c67703b21ed7
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-80e9-6fd0dd1f746b
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-394b-62fc3072d6bc
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-3e9c-2d4f1f07457a
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-0d1d-6a7de69c4273
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-593e-acdb431cc860
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-4337-c36e575e57ee
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-1014-185bda8cad29
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-9c70-4ec039a4c149
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-b4e8-e8933c08639d
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-0f56-b91fd23a2a1a
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-05e3-56b5fd27ef96
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-c57c-8ed475a3d52c
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-afd5-c399b818f9a8
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-c0bf-47da37b1bd92
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-b460-c2651cc846c6
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-7a41-26c7a46f5ad8
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-1238-8bc8981528ed
00020000-5620-f342-67ac-dc0cbeb126c1	00030000-5620-f341-8060-34eddec4da42
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-c096-606dddc7ab68
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-c9b4-0d84659c356d
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-2a77-1b93bd871178
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-a71a-5d0d719ba5fd
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-c5e2-2ef768b3e11e
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-5a5c-70e8d5d8d45a
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-6249-8112e89b352a
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-33e9-562b2c647b26
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-3c41-0b61f15bd8b0
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-b90a-9e589b148bd3
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-f45d-f92182213591
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-5c47-ca8f7850ebd4
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-150f-5238dab6a4ca
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-5852-c67703b21ed7
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-394b-62fc3072d6bc
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-3e9c-2d4f1f07457a
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-4337-c36e575e57ee
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-4abb-7a5a0f16cb85
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-1014-185bda8cad29
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-9c70-4ec039a4c149
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-b4e8-e8933c08639d
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-0f56-b91fd23a2a1a
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-96e5-68439b5cea8f
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-de39-a2a10fd608d0
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-4c93-79c24a7701f0
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-1238-8bc8981528ed
00020000-5620-f342-939d-2360ff990c73	00030000-5620-f341-8060-34eddec4da42
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-c096-606dddc7ab68
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-fddd-cb2522a05ea3
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-1245-1143087d4824
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-2a77-1b93bd871178
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-6249-8112e89b352a
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-3c41-0b61f15bd8b0
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-b90a-9e589b148bd3
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-5c47-ca8f7850ebd4
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-150f-5238dab6a4ca
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-394b-62fc3072d6bc
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-3e9c-2d4f1f07457a
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-4337-c36e575e57ee
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-1014-185bda8cad29
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-9c70-4ec039a4c149
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-b4e8-e8933c08639d
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-0f56-b91fd23a2a1a
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-96e5-68439b5cea8f
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-1238-8bc8981528ed
00020000-5620-f342-c4b0-06b61f622b57	00030000-5620-f341-8060-34eddec4da42
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-c096-606dddc7ab68
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-2a77-1b93bd871178
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-6249-8112e89b352a
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-3c41-0b61f15bd8b0
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-b90a-9e589b148bd3
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-5c47-ca8f7850ebd4
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-150f-5238dab6a4ca
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-394b-62fc3072d6bc
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-3e9c-2d4f1f07457a
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-4337-c36e575e57ee
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-1014-185bda8cad29
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-9c70-4ec039a4c149
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-b4e8-e8933c08639d
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-0f56-b91fd23a2a1a
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-2d24-aed892def94e
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-6aa0-7ba8d32f22b7
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-96e5-68439b5cea8f
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-1238-8bc8981528ed
00020000-5620-f342-32f5-7c06f6d73020	00030000-5620-f341-8060-34eddec4da42
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3c0f-f112ab70a804
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-0d4e-ea05bae5f85e
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-6aa0-7ba8d32f22b7
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3144-8189c0292d81
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-7e52-f7fb319fa5f7
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5d33-f2799fabb7f3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a9f1-194d5e0cfaf3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c096-606dddc7ab68
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-fddd-cb2522a05ea3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c9b4-0d84659c356d
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1245-1143087d4824
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2a77-1b93bd871178
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a71a-5d0d719ba5fd
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c5e2-2ef768b3e11e
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-104e-c847b35f3494
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5a5c-70e8d5d8d45a
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-294d-94a99f20c4d8
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-6249-8112e89b352a
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-cfb1-2a33be1485a3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a274-7d709fccabf8
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-65de-70ec364fd380
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-6da2-2928c62954d0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-9c0d-389848c6e820
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1d7e-60c6c99027ef
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c7d7-2ce606eacc9c
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-33e9-562b2c647b26
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5205-20bbbf765f57
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3c41-0b61f15bd8b0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-787d-9348d9d13328
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-b90a-9e589b148bd3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a5da-266289d89e98
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-f45d-f92182213591
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3b7b-b15341e8fb11
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-6e6b-774e39ab1767
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3bde-c59ca2bc0ecc
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-f7ea-c8cc85f5bc3b
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-070a-48b940749f33
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5c47-ca8f7850ebd4
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-9af4-0f27426cc9fb
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-150f-5238dab6a4ca
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-34ef-a744726e0199
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5852-c67703b21ed7
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-80e9-6fd0dd1f746b
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-6182-de8b0be0c0c9
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-bbd5-ea7d15a96bb7
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-64f3-b1e0394e6f96
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-527f-38c8d4f42edc
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-cad7-26f3c84e3fdf
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-4a30-e0df7e0c4bef
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-394b-62fc3072d6bc
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-cd0e-eba5607291f3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3e9c-2d4f1f07457a
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-b08d-a77d16892abb
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-20ef-3e85e9faa829
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-3203-3347376c388a
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-8cd0-3271b3d4a4a4
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-f2f6-e9fda460cb85
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-0d1d-6a7de69c4273
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-593e-acdb431cc860
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-4337-c36e575e57ee
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-60ad-c065cec164d3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1c54-044b7c10a461
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-777b-88ab8343e065
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c8f9-6bd7a94d9cf5
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2a72-2494e6064f92
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-4abb-7a5a0f16cb85
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-dc7b-5fb84e335fa1
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-cdab-dfd91b5aebc4
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-10be-0180b68bc3c3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-ed33-c9594cc38ccb
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5cdf-2de67d8ac7f0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1340-033268e8b645
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-fd29-c03a66ba5b55
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-8eff-db4eb480b6de
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-393a-d136bd8bbc58
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-10e8-2c02517125a9
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-54c9-537f7620ac92
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-0a61-2d707d31230c
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-84c4-f25aa8613e26
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5e2f-a0afce9ce1c0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-205c-57d1af22fdb8
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1335-ceb4cf4cd1f2
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1747-5d78db52814b
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-288e-fa3fdc41c856
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-5d31-bede8373eebe
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-51a0-11d112f62a91
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-dbeb-d53866b182a4
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1014-185bda8cad29
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-d01c-2d3554227b89
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-0637-16b8436760ad
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-d462-490d4a78ad57
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-e9e4-46f656910199
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-49ee-684f01e01f26
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-9c70-4ec039a4c149
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-4be9-9b6787e6a07d
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-b4e8-e8933c08639d
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-48f9-bdbc5c15d858
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-e787-5c52b50a1d40
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-0b32-ceedb4deddd6
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-ab4d-3186bc93f191
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-e4bd-367199b77eb1
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-484d-9b232e440861
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-72e2-c7b8ef34b112
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-96fd-9384bb6e9f8d
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2306-d7a5baace0fd
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-0f56-b91fd23a2a1a
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-f374-1b291f680308
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-17e9-9b4b53b1b220
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-4c11-d9aa8cda9473
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a0a4-ac9771ae791e
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-f049-63b90f573e28
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-d48b-c475812e99f6
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-cc72-d61a823ce7eb
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-be72-b645fcc8c669
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-08d9-98a559764250
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-05e3-56b5fd27ef96
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c57c-8ed475a3d52c
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2d24-aed892def94e
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-43dc-54877354dcb7
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-96e5-68439b5cea8f
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a77d-8ac117ddb699
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1831-9a615162561a
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-6cf1-986329641901
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-afd5-c399b818f9a8
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-c0bf-47da37b1bd92
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-b879-798a90674c37
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-42b1-5d813384bf61
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-de39-a2a10fd608d0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2757-1edf2955eb66
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2bb5-247b92f2ba2e
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-a0af-87a24f76a59d
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-ceb6-d6401513a2f0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-75a0-739046b92fe6
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-b460-c2651cc846c6
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-7a41-26c7a46f5ad8
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-4c93-79c24a7701f0
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-2359-9319e98718a3
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-1238-8bc8981528ed
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-994f-abc79bcb4082
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-8060-34eddec4da42
00020000-5620-f343-9d7f-5e1a46d52303	00030000-5620-f341-e9cf-d2d6672fd284
\.


--
-- TOC entry 3075 (class 0 OID 22341456)
-- Dependencies: 212
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22341490)
-- Dependencies: 216
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22341627)
-- Dependencies: 228
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5620-f343-9fc0-545221312004	00090000-5620-f343-106a-c922a02c2a74	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5620-f343-a726-50b591b26f33	00090000-5620-f343-e61b-ca7479860c63	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5620-f343-0652-ab9c8e16aef8	00090000-5620-f343-c1d8-f6bf09c153a6	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5620-f343-35c5-db3b0da8ea42	00090000-5620-f343-1a14-c78ee07292fb	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3049 (class 0 OID 22341169)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5620-f343-97c7-a1ec0c07d792	\N	00040000-5620-f341-6a40-b3898a82c5b4	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-62f0-412088aa7cd1	\N	00040000-5620-f341-6a40-b3898a82c5b4	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5620-f343-276a-1c250fd832ac	\N	00040000-5620-f341-6a40-b3898a82c5b4	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-3ff8-d6b8518e3fba	\N	00040000-5620-f341-6a40-b3898a82c5b4	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-616a-302dd7c62fd9	\N	00040000-5620-f341-6a40-b3898a82c5b4	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-b1a3-f20ff9b40639	\N	00040000-5620-f341-edb5-a955ca83bd99	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-d25a-0fe97f887163	\N	00040000-5620-f341-b2f4-ebbe4d4f6e23	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-02c4-1c6d79200ceb	\N	00040000-5620-f341-297f-169b95f0f3bf	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f343-f52a-e23973b3e121	\N	00040000-5620-f341-3a3b-9ecac15c6e2b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-f345-dd5c-c07daefc3695	\N	00040000-5620-f341-6a40-b3898a82c5b4	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3052 (class 0 OID 22341215)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5620-f341-9733-3b14291011a7	8341	Adlešiči
00050000-5620-f341-5416-cff3f6f45b9b	5270	Ajdovščina
00050000-5620-f341-cd80-96be86049610	6280	Ankaran/Ancarano
00050000-5620-f341-d7f3-8b576366ba57	9253	Apače
00050000-5620-f341-4b72-fed3648dfa72	8253	Artiče
00050000-5620-f341-3476-ee1190bc131f	4275	Begunje na Gorenjskem
00050000-5620-f341-9e37-488b92d3d41b	1382	Begunje pri Cerknici
00050000-5620-f341-c531-bf9f3a5f13ac	9231	Beltinci
00050000-5620-f341-4c19-934128a2ed5b	2234	Benedikt
00050000-5620-f341-cfb2-4fb241f541e2	2345	Bistrica ob Dravi
00050000-5620-f341-c376-30d82c8625cc	3256	Bistrica ob Sotli
00050000-5620-f341-1572-6435f534e241	8259	Bizeljsko
00050000-5620-f341-5349-8b1f26b899ef	1223	Blagovica
00050000-5620-f341-fe97-1401ca3e199f	8283	Blanca
00050000-5620-f341-e7f4-97c308ebc3e2	4260	Bled
00050000-5620-f341-e589-da792fed24e4	4273	Blejska Dobrava
00050000-5620-f341-a518-9ae6cea2ce47	9265	Bodonci
00050000-5620-f341-36cb-700e79c2475d	9222	Bogojina
00050000-5620-f341-9103-3be956931cfe	4263	Bohinjska Bela
00050000-5620-f341-2b38-8e05a19bbc8b	4264	Bohinjska Bistrica
00050000-5620-f341-c870-96dea8171e09	4265	Bohinjsko jezero
00050000-5620-f341-8571-d09498689694	1353	Borovnica
00050000-5620-f341-ef69-ae49e665ed13	8294	Boštanj
00050000-5620-f341-060d-a8c3ee78dbbb	5230	Bovec
00050000-5620-f341-d08b-4d59b583355f	5295	Branik
00050000-5620-f341-653e-3739a65ad6a6	3314	Braslovče
00050000-5620-f341-f383-332630b28d47	5223	Breginj
00050000-5620-f341-f485-9d97486a331b	8280	Brestanica
00050000-5620-f341-6357-4a7c779dc1f2	2354	Bresternica
00050000-5620-f341-ce24-4b53862c171b	4243	Brezje
00050000-5620-f341-4a93-ff6937244c07	1351	Brezovica pri Ljubljani
00050000-5620-f341-5a5a-2eebc745673e	8250	Brežice
00050000-5620-f341-28ad-0b609c32e4ef	4210	Brnik - Aerodrom
00050000-5620-f341-8f7c-4975a25eebc3	8321	Brusnice
00050000-5620-f341-9c91-d366609b32ef	3255	Buče
00050000-5620-f341-c583-9ef40aed1dd7	8276	Bučka 
00050000-5620-f341-2972-d3ae2b06de67	9261	Cankova
00050000-5620-f341-349d-53c303405328	3000	Celje 
00050000-5620-f341-15ef-02858871bdc4	3001	Celje - poštni predali
00050000-5620-f341-7121-7d76c4c32149	4207	Cerklje na Gorenjskem
00050000-5620-f341-4ab5-e5d8cdbe6bb3	8263	Cerklje ob Krki
00050000-5620-f341-699b-6efe7fa2b4c7	1380	Cerknica
00050000-5620-f341-5012-66c85e4027b8	5282	Cerkno
00050000-5620-f341-584c-6561192d95d4	2236	Cerkvenjak
00050000-5620-f341-067c-102541bb1888	2215	Ceršak
00050000-5620-f341-57bc-03ca80798762	2326	Cirkovce
00050000-5620-f341-4e33-1c47380d839e	2282	Cirkulane
00050000-5620-f341-129b-800a0dc59883	5273	Col
00050000-5620-f341-82de-e6ad3609dfef	8251	Čatež ob Savi
00050000-5620-f341-9912-41a3a66c26a3	1413	Čemšenik
00050000-5620-f341-6757-052c4e52a359	5253	Čepovan
00050000-5620-f341-2978-a62878611892	9232	Črenšovci
00050000-5620-f341-2fb1-6d86cce96f16	2393	Črna na Koroškem
00050000-5620-f341-2741-58a04e57ac3e	6275	Črni Kal
00050000-5620-f341-c647-a3b60b43abe8	5274	Črni Vrh nad Idrijo
00050000-5620-f341-b49c-24aac57e633e	5262	Črniče
00050000-5620-f341-d0ca-1774dd8ba3e3	8340	Črnomelj
00050000-5620-f341-ee07-d899688aa4a9	6271	Dekani
00050000-5620-f341-98e1-1ae89fd564e7	5210	Deskle
00050000-5620-f341-53bc-af2939b1b3a5	2253	Destrnik
00050000-5620-f341-25a8-71be0d5fc7e6	6215	Divača
00050000-5620-f341-c8b0-9c138d6ffe9a	1233	Dob
00050000-5620-f341-27ac-e3fb46a01ffe	3224	Dobje pri Planini
00050000-5620-f341-e842-a7e32d12dd16	8257	Dobova
00050000-5620-f341-cda9-64cd976b9315	1423	Dobovec
00050000-5620-f341-e0d9-229a9a95da37	5263	Dobravlje
00050000-5620-f341-570b-849fd9fc1ac7	3204	Dobrna
00050000-5620-f341-10a4-1666953988dd	8211	Dobrnič
00050000-5620-f341-362a-f53c6443ed51	1356	Dobrova
00050000-5620-f341-8cda-1a783722e6a1	9223	Dobrovnik/Dobronak 
00050000-5620-f341-fb44-4cb8d38c70f1	5212	Dobrovo v Brdih
00050000-5620-f341-0b9e-b2ead48363c6	1431	Dol pri Hrastniku
00050000-5620-f341-993e-3a02ad043f7d	1262	Dol pri Ljubljani
00050000-5620-f341-afd4-9c517ab09499	1273	Dole pri Litiji
00050000-5620-f341-2bf5-a02840927c88	1331	Dolenja vas
00050000-5620-f341-a9a7-ac653a4f2a64	8350	Dolenjske Toplice
00050000-5620-f341-2fd0-d1a84d490fea	1230	Domžale
00050000-5620-f341-281e-5f4ea19e4481	2252	Dornava
00050000-5620-f341-4478-f7d4b643bd49	5294	Dornberk
00050000-5620-f341-5250-6cc074062012	1319	Draga
00050000-5620-f341-3757-9eb43571a2cd	8343	Dragatuš
00050000-5620-f341-1e1a-1c5b11809c5a	3222	Dramlje
00050000-5620-f341-5532-a510158d4ae6	2370	Dravograd
00050000-5620-f341-b0f8-474791316c9f	4203	Duplje
00050000-5620-f341-5994-fd87e56dc0b4	6221	Dutovlje
00050000-5620-f341-bba8-85704d385637	8361	Dvor
00050000-5620-f341-83b0-fe381d35d612	2343	Fala
00050000-5620-f341-ba3a-f6a6b40a4796	9208	Fokovci
00050000-5620-f341-6fcf-fb2de00afe3f	2313	Fram
00050000-5620-f341-91bb-be349a706baf	3213	Frankolovo
00050000-5620-f341-c93c-eb8973b28e38	1274	Gabrovka
00050000-5620-f341-00c8-ebc043fc44f4	8254	Globoko
00050000-5620-f341-e3d5-545764eaf92e	5275	Godovič
00050000-5620-f341-6de1-47c350257b67	4204	Golnik
00050000-5620-f341-9ea7-66408b943d75	3303	Gomilsko
00050000-5620-f341-dbaf-2dfb97b3fba8	4224	Gorenja vas
00050000-5620-f341-5393-88b86e9f66be	3263	Gorica pri Slivnici
00050000-5620-f341-a47c-b0eb6fac6b5c	2272	Gorišnica
00050000-5620-f341-6c7d-587573f5b35f	9250	Gornja Radgona
00050000-5620-f341-db2a-989545d70578	3342	Gornji Grad
00050000-5620-f341-9aa2-b6178e528501	4282	Gozd Martuljek
00050000-5620-f341-405a-b815653b0710	6272	Gračišče
00050000-5620-f341-d00b-dbb84272fb02	9264	Grad
00050000-5620-f341-bb05-c0baf72579bc	8332	Gradac
00050000-5620-f341-bb20-984fefde9a2b	1384	Grahovo
00050000-5620-f341-a14c-0cce26d5a89e	5242	Grahovo ob Bači
00050000-5620-f341-1e1b-2f9964ef5333	5251	Grgar
00050000-5620-f341-d79d-5c319b6c36c1	3302	Griže
00050000-5620-f341-b2d9-ec32aec3e83b	3231	Grobelno
00050000-5620-f341-b89c-c9759794c407	1290	Grosuplje
00050000-5620-f341-feef-e51ce01cdef1	2288	Hajdina
00050000-5620-f341-754a-efcfd279ef6b	8362	Hinje
00050000-5620-f341-5ba9-9e6b9f7ddeaa	2311	Hoče
00050000-5620-f341-fe00-4144296f0425	9205	Hodoš/Hodos
00050000-5620-f341-7a3d-a98754989e6f	1354	Horjul
00050000-5620-f341-b01e-67fbeabcaf3b	1372	Hotedršica
00050000-5620-f341-ca3a-cd03360a70e9	1430	Hrastnik
00050000-5620-f341-9164-4a460b923891	6225	Hruševje
00050000-5620-f341-1bcd-e6fd371b93d7	4276	Hrušica
00050000-5620-f341-48a5-410c7d6580d3	5280	Idrija
00050000-5620-f341-b812-24a39c5927e6	1292	Ig
00050000-5620-f341-dc10-fb3cd005c93f	6250	Ilirska Bistrica
00050000-5620-f341-44d8-9a67db7c5cc5	6251	Ilirska Bistrica-Trnovo
00050000-5620-f341-bb23-94692b8fa219	1295	Ivančna Gorica
00050000-5620-f341-1030-076f400036ac	2259	Ivanjkovci
00050000-5620-f341-84bb-61a5fda13240	1411	Izlake
00050000-5620-f341-a980-5a13c40ceb7d	6310	Izola/Isola
00050000-5620-f341-1825-2651c5233e36	2222	Jakobski Dol
00050000-5620-f341-e8f7-f5092283f24b	2221	Jarenina
00050000-5620-f341-0484-4a8412452700	6254	Jelšane
00050000-5620-f341-9ec2-3b001faf8e96	4270	Jesenice
00050000-5620-f341-a7c8-3c8e3c5e172b	8261	Jesenice na Dolenjskem
00050000-5620-f341-e61b-93c972554bc6	3273	Jurklošter
00050000-5620-f341-c0ee-de5a60d1f35c	2223	Jurovski Dol
00050000-5620-f341-b753-a9a7c71a4a0b	2256	Juršinci
00050000-5620-f341-290b-5f8adb4e6ac0	5214	Kal nad Kanalom
00050000-5620-f341-76ca-06115df55d9e	3233	Kalobje
00050000-5620-f341-b9c5-ea0578ce50a4	4246	Kamna Gorica
00050000-5620-f341-97a3-32c2e6881d62	2351	Kamnica
00050000-5620-f341-6085-b5e567f06d7e	1241	Kamnik
00050000-5620-f341-277b-9b666e7cbf4a	5213	Kanal
00050000-5620-f341-0f14-c7fd40604956	8258	Kapele
00050000-5620-f341-2197-14d288f0657d	2362	Kapla
00050000-5620-f341-ba96-4cd543581192	2325	Kidričevo
00050000-5620-f341-66bc-ab581b7c7a95	1412	Kisovec
00050000-5620-f341-a6c2-04a76b1d2ed9	6253	Knežak
00050000-5620-f341-39b4-208271af9a7e	5222	Kobarid
00050000-5620-f341-a05a-97626942b18c	9227	Kobilje
00050000-5620-f341-3ba2-e0e7d7251c3a	1330	Kočevje
00050000-5620-f341-91b8-d770ddeaa2cc	1338	Kočevska Reka
00050000-5620-f341-6ed9-fa53fc573944	2276	Kog
00050000-5620-f341-a172-ca868696d97d	5211	Kojsko
00050000-5620-f341-668c-0888314d4272	6223	Komen
00050000-5620-f341-3979-93667316483b	1218	Komenda
00050000-5620-f341-27c1-88a36fd17c08	6000	Koper/Capodistria 
00050000-5620-f341-35bb-16294d7ebabe	6001	Koper/Capodistria - poštni predali
00050000-5620-f341-8b45-f29e9bc7d608	8282	Koprivnica
00050000-5620-f341-4e28-61af423a4429	5296	Kostanjevica na Krasu
00050000-5620-f341-bdb9-780e7f2f2ef3	8311	Kostanjevica na Krki
00050000-5620-f341-e7c5-8ca98b94b2de	1336	Kostel
00050000-5620-f341-988c-23df8c8568a0	6256	Košana
00050000-5620-f341-1929-e9baef15f8c5	2394	Kotlje
00050000-5620-f341-1153-2a46a8d632db	6240	Kozina
00050000-5620-f341-8fdd-8057796a218a	3260	Kozje
00050000-5620-f341-fdb2-01194bdf3995	4000	Kranj 
00050000-5620-f341-46b6-f08180346047	4001	Kranj - poštni predali
00050000-5620-f341-2994-4e84afe78220	4280	Kranjska Gora
00050000-5620-f341-98ac-5f87b66ca4ae	1281	Kresnice
00050000-5620-f341-632d-f5fcb6405d90	4294	Križe
00050000-5620-f341-8c0b-b369dd0e1859	9206	Križevci
00050000-5620-f341-4e25-b7db0451520c	9242	Križevci pri Ljutomeru
00050000-5620-f341-5cfa-55381e9cc02b	1301	Krka
00050000-5620-f341-a29b-34e7e319e6a3	8296	Krmelj
00050000-5620-f341-9d63-b58b72a3e380	4245	Kropa
00050000-5620-f341-679c-a538786a4ebe	8262	Krška vas
00050000-5620-f341-fba4-a49970e4d6e3	8270	Krško
00050000-5620-f341-f95f-fec6cde14d79	9263	Kuzma
00050000-5620-f341-8faf-626c51453284	2318	Laporje
00050000-5620-f341-8517-1efc6b100ad9	3270	Laško
00050000-5620-f341-2b26-24c7f34276b4	1219	Laze v Tuhinju
00050000-5620-f341-45cb-f06fc2419a16	2230	Lenart v Slovenskih goricah
00050000-5620-f341-f412-ebff094f548b	9220	Lendava/Lendva
00050000-5620-f341-7b2d-9e964e8bc48f	4248	Lesce
00050000-5620-f341-c6a3-f283a2a4bee7	3261	Lesično
00050000-5620-f341-37e0-a0e0b8f592f3	8273	Leskovec pri Krškem
00050000-5620-f341-d334-65e50676f010	2372	Libeliče
00050000-5620-f341-4300-63d18be37ad7	2341	Limbuš
00050000-5620-f341-22e2-08226a48bb1c	1270	Litija
00050000-5620-f341-200b-678994fbac08	3202	Ljubečna
00050000-5620-f341-fd08-5dfcd331ce99	1000	Ljubljana 
00050000-5620-f341-981f-c2ca3ed4d187	1001	Ljubljana - poštni predali
00050000-5620-f341-670e-bf76e7ff938b	1231	Ljubljana - Črnuče
00050000-5620-f341-91f0-579e2d4e2c0b	1261	Ljubljana - Dobrunje
00050000-5620-f341-89a1-1dac4b9815fc	1260	Ljubljana - Polje
00050000-5620-f341-0f3b-a154521b7405	1210	Ljubljana - Šentvid
00050000-5620-f341-0d86-8ca32c6e4b74	1211	Ljubljana - Šmartno
00050000-5620-f341-22f3-adf54b5a745a	3333	Ljubno ob Savinji
00050000-5620-f341-329b-8e73f34de8d5	9240	Ljutomer
00050000-5620-f341-b720-cb0b02e85cdd	3215	Loče
00050000-5620-f341-5daf-7a2f7f8b5451	5231	Log pod Mangartom
00050000-5620-f341-c117-8af73f8a0faf	1358	Log pri Brezovici
00050000-5620-f341-7143-bc5337e92c26	1370	Logatec
00050000-5620-f341-bf76-d96653f296b4	1371	Logatec
00050000-5620-f341-892d-aeeb0b6094d1	1434	Loka pri Zidanem Mostu
00050000-5620-f341-f421-1dd64a0b4994	3223	Loka pri Žusmu
00050000-5620-f341-d5b9-8f73a52ea2fd	6219	Lokev
00050000-5620-f341-adb1-4389a013647c	1318	Loški Potok
00050000-5620-f341-3f45-1b372b5a7de3	2324	Lovrenc na Dravskem polju
00050000-5620-f341-fd13-c430aa1d35b6	2344	Lovrenc na Pohorju
00050000-5620-f341-b71d-b396ef0eedcd	3334	Luče
00050000-5620-f341-0b93-bdd1024074ec	1225	Lukovica
00050000-5620-f341-5382-a9ad11d84029	9202	Mačkovci
00050000-5620-f341-b749-627229faf417	2322	Majšperk
00050000-5620-f341-e510-90234ae77340	2321	Makole
00050000-5620-f341-f93d-c0f3b196e919	9243	Mala Nedelja
00050000-5620-f341-2edd-2fd2ea01b520	2229	Malečnik
00050000-5620-f341-049d-9e98fd7ee4ed	6273	Marezige
00050000-5620-f341-7614-9d090737216a	2000	Maribor 
00050000-5620-f341-0568-7b57be91547f	2001	Maribor - poštni predali
00050000-5620-f341-e8d5-25f32c67067b	2206	Marjeta na Dravskem polju
00050000-5620-f341-ba9f-81e09539f21e	2281	Markovci
00050000-5620-f341-7002-05d0d857663d	9221	Martjanci
00050000-5620-f341-daab-71a5b5a42263	6242	Materija
00050000-5620-f341-9636-fbd41c6d6fb0	4211	Mavčiče
00050000-5620-f341-d949-25ac9a133661	1215	Medvode
00050000-5620-f341-af26-2528e2b5a47d	1234	Mengeš
00050000-5620-f341-5bd7-b014f88f2603	8330	Metlika
00050000-5620-f341-f224-91f3731e1189	2392	Mežica
00050000-5620-f341-6443-99c6603ea92a	2204	Miklavž na Dravskem polju
00050000-5620-f341-b61d-73162b521052	2275	Miklavž pri Ormožu
00050000-5620-f341-33b2-24ec8bf79a42	5291	Miren
00050000-5620-f341-5c4b-4ea8070944be	8233	Mirna
00050000-5620-f341-7f1d-fad53f4d7b5a	8216	Mirna Peč
00050000-5620-f341-4f70-e2184c30c28d	2382	Mislinja
00050000-5620-f341-ac08-802f7b47d737	4281	Mojstrana
00050000-5620-f341-bc48-2e89e6b25eee	8230	Mokronog
00050000-5620-f341-0921-d5bb6767534a	1251	Moravče
00050000-5620-f341-7b45-99ce8e114773	9226	Moravske Toplice
00050000-5620-f341-102f-bfda8037f7e9	5216	Most na Soči
00050000-5620-f341-3fcb-25955367860d	1221	Motnik
00050000-5620-f341-8615-d0af360ba82e	3330	Mozirje
00050000-5620-f341-66be-95f2992906f3	9000	Murska Sobota 
00050000-5620-f341-8210-825d95b568ac	9001	Murska Sobota - poštni predali
00050000-5620-f341-c363-56b22f564782	2366	Muta
00050000-5620-f341-1810-2bfa1deb581b	4202	Naklo
00050000-5620-f341-0f0f-7401afc6a099	3331	Nazarje
00050000-5620-f341-1105-80b198d415c5	1357	Notranje Gorice
00050000-5620-f341-8ef2-cb5de1e789ed	3203	Nova Cerkev
00050000-5620-f341-728a-06a015c70674	5000	Nova Gorica 
00050000-5620-f341-22ec-ad8c1a3aef08	5001	Nova Gorica - poštni predali
00050000-5620-f341-c40c-a89533ad5d77	1385	Nova vas
00050000-5620-f341-e5a0-57d3b28295ca	8000	Novo mesto
00050000-5620-f341-0eb9-668992af539e	8001	Novo mesto - poštni predali
00050000-5620-f341-fcb7-f639b8a5700f	6243	Obrov
00050000-5620-f341-878a-414d5095ae6a	9233	Odranci
00050000-5620-f341-af5d-976009212d9a	2317	Oplotnica
00050000-5620-f341-fd85-ea12e3548975	2312	Orehova vas
00050000-5620-f341-ca22-751f57d71ae0	2270	Ormož
00050000-5620-f341-e014-dabb93dfdbf8	1316	Ortnek
00050000-5620-f341-172b-234c5fedf348	1337	Osilnica
00050000-5620-f341-b6c1-a08d97e0dcdd	8222	Otočec
00050000-5620-f341-d576-de4090bb5de8	2361	Ožbalt
00050000-5620-f341-b7c6-b2ea99434754	2231	Pernica
00050000-5620-f341-1ad4-75df8e4d0b93	2211	Pesnica pri Mariboru
00050000-5620-f341-b1c7-fb56a8138eb5	9203	Petrovci
00050000-5620-f341-5819-0d34579f85c1	3301	Petrovče
00050000-5620-f341-fbe0-a038a996bc79	6330	Piran/Pirano
00050000-5620-f341-f87e-5459dc3195ac	8255	Pišece
00050000-5620-f341-2c26-0f7bf38ad915	6257	Pivka
00050000-5620-f341-998a-deebcf23af3f	6232	Planina
00050000-5620-f341-9908-6bd0e37e4c8d	3225	Planina pri Sevnici
00050000-5620-f341-f14b-464fdd447fe2	6276	Pobegi
00050000-5620-f341-dcc8-7f3e42e7e05a	8312	Podbočje
00050000-5620-f341-c710-b016665c232f	5243	Podbrdo
00050000-5620-f341-799f-315334cf8ce7	3254	Podčetrtek
00050000-5620-f341-625e-609c917961ab	2273	Podgorci
00050000-5620-f341-7924-c0364f8e29d3	6216	Podgorje
00050000-5620-f341-c2cd-5cf19c9b46fd	2381	Podgorje pri Slovenj Gradcu
00050000-5620-f341-c98b-250ebfa74656	6244	Podgrad
00050000-5620-f341-0ff1-454440bcb705	1414	Podkum
00050000-5620-f341-1137-13e4b55be4af	2286	Podlehnik
00050000-5620-f341-af87-3643cfddd041	5272	Podnanos
00050000-5620-f341-64c3-0c2b324e91d7	4244	Podnart
00050000-5620-f341-e2ad-f1978ba2e973	3241	Podplat
00050000-5620-f341-7cf9-17090bce9a58	3257	Podsreda
00050000-5620-f341-b2d2-8450082df7cb	2363	Podvelka
00050000-5620-f341-1e00-67a3075fa372	2208	Pohorje
00050000-5620-f341-52f0-8145be6b69f9	2257	Polenšak
00050000-5620-f341-560e-7bc323a160c6	1355	Polhov Gradec
00050000-5620-f341-4e5c-093784d0c8fa	4223	Poljane nad Škofjo Loko
00050000-5620-f341-377d-f1b1600a7e19	2319	Poljčane
00050000-5620-f341-bdb2-59192895cfb6	1272	Polšnik
00050000-5620-f341-e21f-2e1ea0dc789e	3313	Polzela
00050000-5620-f341-08c8-d92639772801	3232	Ponikva
00050000-5620-f341-fc09-62dcda6f5a31	6320	Portorož/Portorose
00050000-5620-f341-52aa-8ca3fe12c32f	6230	Postojna
00050000-5620-f341-ba3a-1eb31d14e4d1	2331	Pragersko
00050000-5620-f341-186a-496bff91a1b5	3312	Prebold
00050000-5620-f341-46ba-5d4394e9e5ca	4205	Preddvor
00050000-5620-f341-023d-5fcf958aef50	6255	Prem
00050000-5620-f341-cde1-78c21c183626	1352	Preserje
00050000-5620-f341-3494-dc1cec34d864	6258	Prestranek
00050000-5620-f341-4206-7a6f1866d770	2391	Prevalje
00050000-5620-f341-930b-9d9136c3263c	3262	Prevorje
00050000-5620-f341-5282-d77c2fa89230	1276	Primskovo 
00050000-5620-f341-38e1-81319376f3ad	3253	Pristava pri Mestinju
00050000-5620-f341-f4b0-44ddbb54a418	9207	Prosenjakovci/Partosfalva
00050000-5620-f341-249f-3094f9890e57	5297	Prvačina
00050000-5620-f341-3b4f-36016c6477a8	2250	Ptuj
00050000-5620-f341-ff85-a0cc1fa7d0f4	2323	Ptujska Gora
00050000-5620-f341-311d-afba549c3fe4	9201	Puconci
00050000-5620-f341-e6dc-0afd93646546	2327	Rače
00050000-5620-f341-4e4e-93c90a018aa4	1433	Radeče
00050000-5620-f341-9166-e96b2e84b7c2	9252	Radenci
00050000-5620-f341-7358-e948b088dbdd	2360	Radlje ob Dravi
00050000-5620-f341-8dc0-b3286f5b1ddc	1235	Radomlje
00050000-5620-f341-49de-54e67ebcb6e9	4240	Radovljica
00050000-5620-f341-294e-6c060ddf15a4	8274	Raka
00050000-5620-f341-3cca-e38360588210	1381	Rakek
00050000-5620-f341-343f-09647eda710e	4283	Rateče - Planica
00050000-5620-f341-19fb-ff942b8969d8	2390	Ravne na Koroškem
00050000-5620-f341-372e-a6d4f12c4b7d	9246	Razkrižje
00050000-5620-f341-f9a3-93ecd5b6cc30	3332	Rečica ob Savinji
00050000-5620-f341-368c-a4a99ddc42a6	5292	Renče
00050000-5620-f341-5b02-53edaae68612	1310	Ribnica
00050000-5620-f341-d757-72640c692579	2364	Ribnica na Pohorju
00050000-5620-f341-5163-d55ecb906a54	3272	Rimske Toplice
00050000-5620-f341-7839-f03cfa02f4d1	1314	Rob
00050000-5620-f341-e8c5-2e9726b23ee3	5215	Ročinj
00050000-5620-f341-c48f-7ffc75d2e9ec	3250	Rogaška Slatina
00050000-5620-f341-52ef-24033f1de474	9262	Rogašovci
00050000-5620-f341-1465-f19126492991	3252	Rogatec
00050000-5620-f341-647d-80de795884df	1373	Rovte
00050000-5620-f341-f619-9b2c1b692da6	2342	Ruše
00050000-5620-f341-86e2-7ab2cef0c720	1282	Sava
00050000-5620-f341-6416-4a2acac6e1e6	6333	Sečovlje/Sicciole
00050000-5620-f341-b474-86bacb5d3849	4227	Selca
00050000-5620-f341-ed96-444bafbb6775	2352	Selnica ob Dravi
00050000-5620-f341-6fc6-d7697dfa946f	8333	Semič
00050000-5620-f341-12f0-5fd8cbae95f1	8281	Senovo
00050000-5620-f341-8c12-408862a6ae43	6224	Senožeče
00050000-5620-f341-fe06-d68a9bd1708f	8290	Sevnica
00050000-5620-f341-ba53-084b6a4dfb97	6210	Sežana
00050000-5620-f341-cbd6-838c03203ff9	2214	Sladki Vrh
00050000-5620-f341-352d-a6ef88c3669a	5283	Slap ob Idrijci
00050000-5620-f341-cceb-9b1a2542bbfe	2380	Slovenj Gradec
00050000-5620-f341-c48e-c45943255378	2310	Slovenska Bistrica
00050000-5620-f341-0601-80e87c7b7dfc	3210	Slovenske Konjice
00050000-5620-f341-bb90-53b04a1900f5	1216	Smlednik
00050000-5620-f341-72be-509bc790649f	5232	Soča
00050000-5620-f341-734f-45f2b0a9a503	1317	Sodražica
00050000-5620-f341-efd4-b7ab2cf87492	3335	Solčava
00050000-5620-f341-b133-4ea6f26ce06b	5250	Solkan
00050000-5620-f341-675b-52de8cce15dd	4229	Sorica
00050000-5620-f341-fbf0-8342933c3bfb	4225	Sovodenj
00050000-5620-f341-37bb-0413c5f890fe	5281	Spodnja Idrija
00050000-5620-f341-4116-2fa20d58b98a	2241	Spodnji Duplek
00050000-5620-f341-2b9a-15cf4a9a22a8	9245	Spodnji Ivanjci
00050000-5620-f341-4e39-7188da2b5068	2277	Središče ob Dravi
00050000-5620-f341-b116-6795e85b2a7a	4267	Srednja vas v Bohinju
00050000-5620-f341-f351-58538d9bb083	8256	Sromlje 
00050000-5620-f341-6c68-f3c116b5f688	5224	Srpenica
00050000-5620-f341-f023-acdf1c612086	1242	Stahovica
00050000-5620-f341-3095-6eab411b0ca6	1332	Stara Cerkev
00050000-5620-f341-ba9b-14bb2e46c435	8342	Stari trg ob Kolpi
00050000-5620-f341-8f5b-b074e6a27f22	1386	Stari trg pri Ložu
00050000-5620-f341-a105-92ab735ed446	2205	Starše
00050000-5620-f341-f3d1-bd45a020f2a2	2289	Stoperce
00050000-5620-f341-c9cf-7127e6fb91cd	8322	Stopiče
00050000-5620-f341-9939-ec41f5b76dba	3206	Stranice
00050000-5620-f341-5659-37bd557bd931	8351	Straža
00050000-5620-f341-4448-aa39cbbf74f7	1313	Struge
00050000-5620-f341-b63c-ce35fdd880ac	8293	Studenec
00050000-5620-f341-5417-fe2028c881de	8331	Suhor
00050000-5620-f341-00e4-8f37fed257c0	2233	Sv. Ana v Slovenskih goricah
00050000-5620-f341-ac34-f989ccb5f478	2235	Sv. Trojica v Slovenskih goricah
00050000-5620-f341-9b06-fdcddee5ac11	2353	Sveti Duh na Ostrem Vrhu
00050000-5620-f341-c115-1bbf97e27f7c	9244	Sveti Jurij ob Ščavnici
00050000-5620-f341-ef35-d4e16bf01a30	3264	Sveti Štefan
00050000-5620-f341-f3b3-6b1cb4ca4fdc	2258	Sveti Tomaž
00050000-5620-f341-6690-c849874bfb48	9204	Šalovci
00050000-5620-f341-3de1-13f7f165d2cc	5261	Šempas
00050000-5620-f341-1af3-869049470e93	5290	Šempeter pri Gorici
00050000-5620-f341-ee00-9b4bf0116f22	3311	Šempeter v Savinjski dolini
00050000-5620-f341-9c32-9f181e6063ea	4208	Šenčur
00050000-5620-f341-8606-3134644d467c	2212	Šentilj v Slovenskih goricah
00050000-5620-f341-63a3-7bb43afbddd2	8297	Šentjanž
00050000-5620-f341-034c-32f5fa41a313	2373	Šentjanž pri Dravogradu
00050000-5620-f341-a859-8d23a4822bc7	8310	Šentjernej
00050000-5620-f341-bef7-0ed33598e662	3230	Šentjur
00050000-5620-f341-4026-9fe8c8fe56d0	3271	Šentrupert
00050000-5620-f341-6be3-981c02443f9e	8232	Šentrupert
00050000-5620-f341-28b3-b703552f5d74	1296	Šentvid pri Stični
00050000-5620-f341-6d83-42c632b2ea82	8275	Škocjan
00050000-5620-f341-c86f-43a285ae26ed	6281	Škofije
00050000-5620-f341-3600-5a6bd913aafc	4220	Škofja Loka
00050000-5620-f341-3aef-dac25a4cb9c9	3211	Škofja vas
00050000-5620-f341-b2b4-0a770fd1f6d4	1291	Škofljica
00050000-5620-f341-0e69-c6053e78e76c	6274	Šmarje
00050000-5620-f341-b268-6c5040ca547f	1293	Šmarje - Sap
00050000-5620-f341-3cf1-2818f1985778	3240	Šmarje pri Jelšah
00050000-5620-f341-3058-9f8af3abd261	8220	Šmarješke Toplice
00050000-5620-f341-8d6a-5d93f76c09ec	2315	Šmartno na Pohorju
00050000-5620-f341-79e3-5fd069fa4732	3341	Šmartno ob Dreti
00050000-5620-f341-1d60-d2fc235fd04f	3327	Šmartno ob Paki
00050000-5620-f341-181c-6191d7f5c13e	1275	Šmartno pri Litiji
00050000-5620-f341-2d43-ab0cdaafe06d	2383	Šmartno pri Slovenj Gradcu
00050000-5620-f341-8023-aa9229ef35f1	3201	Šmartno v Rožni dolini
00050000-5620-f341-7509-5ee8c7d219bf	3325	Šoštanj
00050000-5620-f341-aea2-7f8265b01e77	6222	Štanjel
00050000-5620-f341-c756-c10b2312e8cb	3220	Štore
00050000-5620-f341-26e4-6a62db61ba7f	3304	Tabor
00050000-5620-f341-d52f-c3cd45947ab6	3221	Teharje
00050000-5620-f341-329b-100acc8adec9	9251	Tišina
00050000-5620-f341-248a-523e6b591e53	5220	Tolmin
00050000-5620-f341-b8c3-35e8c13499c6	3326	Topolšica
00050000-5620-f341-09df-cc8381f44120	2371	Trbonje
00050000-5620-f341-3793-fe58bc7b7643	1420	Trbovlje
00050000-5620-f341-4c96-e3dcb7f8f9ee	8231	Trebelno 
00050000-5620-f341-35be-aecc3087574a	8210	Trebnje
00050000-5620-f341-6fc1-e5890c9d6e06	5252	Trnovo pri Gorici
00050000-5620-f341-1c83-e1a9c85a05f2	2254	Trnovska vas
00050000-5620-f341-324f-c0c419565964	1222	Trojane
00050000-5620-f341-5a63-1bde21784f5b	1236	Trzin
00050000-5620-f341-46b6-d59c5cd98a3e	4290	Tržič
00050000-5620-f341-eceb-41cb3681bf4b	8295	Tržišče
00050000-5620-f341-4172-111a46db8527	1311	Turjak
00050000-5620-f341-49f4-36d1ab253e25	9224	Turnišče
00050000-5620-f341-59cf-439fe2f3f30f	8323	Uršna sela
00050000-5620-f341-ad3c-1f0c1850b774	1252	Vače
00050000-5620-f341-0de5-23efe8a9ddae	3320	Velenje 
00050000-5620-f341-5559-d6ac2f55c755	3322	Velenje - poštni predali
00050000-5620-f341-769d-24282a018748	8212	Velika Loka
00050000-5620-f341-ecd5-51291e165560	2274	Velika Nedelja
00050000-5620-f341-e88b-6c75001e6bc4	9225	Velika Polana
00050000-5620-f341-9ccb-c1b3dbc6bdf7	1315	Velike Lašče
00050000-5620-f341-e15c-74d4bf385802	8213	Veliki Gaber
00050000-5620-f341-de8b-9f0f540ce3a5	9241	Veržej
00050000-5620-f341-1773-f103a965df83	1312	Videm - Dobrepolje
00050000-5620-f341-c9aa-cc93a01d1930	2284	Videm pri Ptuju
00050000-5620-f341-b4fb-ce8eddf58d0d	8344	Vinica
00050000-5620-f341-df87-7a716078c371	5271	Vipava
00050000-5620-f341-aca4-861e66735ced	4212	Visoko
00050000-5620-f341-354a-b1f75cc9de55	1294	Višnja Gora
00050000-5620-f341-4f2e-3dc9c12e7f45	3205	Vitanje
00050000-5620-f341-da4c-12d7a58f134b	2255	Vitomarci
00050000-5620-f341-9fdb-f0b3993b0a0c	1217	Vodice
00050000-5620-f341-75b2-e5020559d004	3212	Vojnik\t
00050000-5620-f341-9286-0d533f37146e	5293	Volčja Draga
00050000-5620-f341-2db1-4894a4b8cffa	2232	Voličina
00050000-5620-f341-c8ac-8019cc249332	3305	Vransko
00050000-5620-f341-177f-d1cc4a13cc7e	6217	Vremski Britof
00050000-5620-f341-a45d-9ee31a81ca70	1360	Vrhnika
00050000-5620-f341-ef25-54d36c8ea5ab	2365	Vuhred
00050000-5620-f341-5c91-4e19c89f912f	2367	Vuzenica
00050000-5620-f341-62a0-7d51c0b82bdf	8292	Zabukovje 
00050000-5620-f341-0e8f-6fa0a35a6b98	1410	Zagorje ob Savi
00050000-5620-f341-1f28-a49d8b840334	1303	Zagradec
00050000-5620-f341-d7e4-00fcc02b24c8	2283	Zavrč
00050000-5620-f341-16ff-413fe5dd3bbb	8272	Zdole 
00050000-5620-f341-ec1b-b215ab522567	4201	Zgornja Besnica
00050000-5620-f341-552f-98c043721cb6	2242	Zgornja Korena
00050000-5620-f341-56d1-e12791ced61b	2201	Zgornja Kungota
00050000-5620-f341-36fe-007fba2a33ff	2316	Zgornja Ložnica
00050000-5620-f341-1905-9e1f5ccf2cf8	2314	Zgornja Polskava
00050000-5620-f341-a4f8-b1df4e1a5ba3	2213	Zgornja Velka
00050000-5620-f341-6251-eaa47e3e2a03	4247	Zgornje Gorje
00050000-5620-f341-be29-11c4cd5a27dc	4206	Zgornje Jezersko
00050000-5620-f341-5966-87a6157fb8dc	2285	Zgornji Leskovec
00050000-5620-f341-e591-e299c76613c6	1432	Zidani Most
00050000-5620-f341-02f8-0e3d06128d15	3214	Zreče
00050000-5620-f341-f998-a3fe5e5d54f1	4209	Žabnica
00050000-5620-f341-f172-77f094f0ea91	3310	Žalec
00050000-5620-f341-a037-b05b9f23e07b	4228	Železniki
00050000-5620-f341-2119-4f2f8f8d08b3	2287	Žetale
00050000-5620-f341-128a-d6dc2d432001	4226	Žiri
00050000-5620-f341-2de8-a6fce8c0c000	4274	Žirovnica
00050000-5620-f341-12d4-6ede45fae4d2	8360	Žužemberk
\.


--
-- TOC entry 3098 (class 0 OID 22341838)
-- Dependencies: 235
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22341430)
-- Dependencies: 208
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22341200)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5620-f343-d0f6-9ca64cebe911	00080000-5620-f343-97c7-a1ec0c07d792	\N	00040000-5620-f341-6a40-b3898a82c5b4	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5620-f343-2860-14d7b28b2564	00080000-5620-f343-97c7-a1ec0c07d792	\N	00040000-5620-f341-6a40-b3898a82c5b4	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5620-f343-2ec9-fcb1ce794a44	00080000-5620-f343-62f0-412088aa7cd1	\N	00040000-5620-f341-6a40-b3898a82c5b4	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3059 (class 0 OID 22341304)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22341442)
-- Dependencies: 210
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22341852)
-- Dependencies: 236
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22341862)
-- Dependencies: 237
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5620-f343-d851-da0bb6b6dc57	00080000-5620-f343-276a-1c250fd832ac	0987	AK
00190000-5620-f343-fc54-67ee0fdd51cb	00080000-5620-f343-62f0-412088aa7cd1	0989	AK
00190000-5620-f343-368a-3d0b1c83a192	00080000-5620-f343-3ff8-d6b8518e3fba	0986	AK
00190000-5620-f343-c053-8228d797d101	00080000-5620-f343-b1a3-f20ff9b40639	0984	AK
00190000-5620-f343-33df-9ac729528f52	00080000-5620-f343-d25a-0fe97f887163	0983	AK
00190000-5620-f343-6417-10bbfc9515dc	00080000-5620-f343-02c4-1c6d79200ceb	0982	AK
00190000-5620-f345-b4ac-611bfe71749b	00080000-5620-f345-dd5c-c07daefc3695	1001	AK
\.


--
-- TOC entry 3097 (class 0 OID 22341777)
-- Dependencies: 234
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5620-f343-d163-36cf60611336	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 22341870)
-- Dependencies: 238
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22341471)
-- Dependencies: 214
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5620-f343-756a-c5adaad4bb98	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5620-f343-2a6b-00de12231f35	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5620-f343-2972-e014ad0c16e8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5620-f343-dc18-a986fd95cb65	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5620-f343-c76c-7989c6e644e2	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5620-f343-b756-574968be0c04	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5620-f343-eed8-5c60a10064cb	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3069 (class 0 OID 22341415)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22341405)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22341616)
-- Dependencies: 227
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22341546)
-- Dependencies: 221
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22341278)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22341051)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5620-f345-dd5c-c07daefc3695	00010000-5620-f342-cb8f-f342b4cea361	2015-10-16 14:53:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-5620-f345-700d-cfbb9df493c4	00010000-5620-f342-cb8f-f342b4cea361	2015-10-16 14:53:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5620-f345-b4ac-611bfe71749b	00010000-5620-f342-cb8f-f342b4cea361	2015-10-16 14:53:25	INS	a:0:{}
\.


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3078 (class 0 OID 22341484)
-- Dependencies: 215
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 22341089)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5620-f341-d862-c779340ba07a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5620-f341-f052-9bd05753c963	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5620-f341-6650-4bef7cfd6162	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5620-f341-47b0-e200e28761c2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5620-f342-1efd-7dcc7188eb8d	planer	Planer dogodkov v koledarju	t
00020000-5620-f342-67ac-dc0cbeb126c1	kadrovska	Kadrovska služba	t
00020000-5620-f342-939d-2360ff990c73	arhivar	Ažuriranje arhivalij	t
00020000-5620-f342-c4b0-06b61f622b57	igralec	Igralec	t
00020000-5620-f342-32f5-7c06f6d73020	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5620-f343-9d7f-5e1a46d52303	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3040 (class 0 OID 22341073)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5620-f342-3c28-d77f9eba42a9	00020000-5620-f341-6650-4bef7cfd6162
00010000-5620-f342-cb8f-f342b4cea361	00020000-5620-f341-6650-4bef7cfd6162
00010000-5620-f343-caa0-10e5e5abfd8b	00020000-5620-f343-9d7f-5e1a46d52303
\.


--
-- TOC entry 3080 (class 0 OID 22341498)
-- Dependencies: 217
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22341436)
-- Dependencies: 209
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22341382)
-- Dependencies: 203
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 22341038)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5620-f341-330e-c387a20254c6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5620-f341-1857-3e482bee2f14	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5620-f341-29e4-0d7e7ef65926	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5620-f341-1180-7fc74ee631d4	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5620-f341-1ff4-ee399af2b777	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3035 (class 0 OID 22341030)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5620-f341-77af-e9e4ba62fcca	00230000-5620-f341-1180-7fc74ee631d4	popa
00240000-5620-f341-bf98-2387c0851df0	00230000-5620-f341-1180-7fc74ee631d4	oseba
00240000-5620-f341-6656-6f00329a5e9c	00230000-5620-f341-1180-7fc74ee631d4	tippopa
00240000-5620-f341-84be-0efd92a871bf	00230000-5620-f341-1180-7fc74ee631d4	organizacijskaenota
00240000-5620-f341-aa94-5089f1d118cf	00230000-5620-f341-1180-7fc74ee631d4	sezona
00240000-5620-f341-557b-9274f3dc45c7	00230000-5620-f341-1180-7fc74ee631d4	tipvaje
00240000-5620-f341-91ae-1790a87905d8	00230000-5620-f341-1857-3e482bee2f14	prostor
00240000-5620-f341-9adc-2b1ab7e1851b	00230000-5620-f341-1180-7fc74ee631d4	besedilo
00240000-5620-f341-de02-6dcaa3e1395d	00230000-5620-f341-1180-7fc74ee631d4	uprizoritev
00240000-5620-f341-535e-84c063267063	00230000-5620-f341-1180-7fc74ee631d4	funkcija
00240000-5620-f341-3a7b-ec97678c5ec7	00230000-5620-f341-1180-7fc74ee631d4	tipfunkcije
00240000-5620-f341-490f-3d3a62d1933f	00230000-5620-f341-1180-7fc74ee631d4	alternacija
00240000-5620-f341-20dc-142305afaf4f	00230000-5620-f341-330e-c387a20254c6	pogodba
00240000-5620-f341-5fb1-5b68cc6dd538	00230000-5620-f341-1180-7fc74ee631d4	zaposlitev
00240000-5620-f341-f802-0b5bf3ff5a8a	00230000-5620-f341-1180-7fc74ee631d4	zvrstuprizoritve
00240000-5620-f341-badf-868609bb9e62	00230000-5620-f341-330e-c387a20254c6	programdela
00240000-5620-f341-a0aa-4b1847077430	00230000-5620-f341-1180-7fc74ee631d4	zapis
\.


--
-- TOC entry 3034 (class 0 OID 22341025)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
31b964a7-0ee5-4fd2-bd49-f40c3299dc87	00240000-5620-f341-77af-e9e4ba62fcca	0	1001
\.


--
-- TOC entry 3086 (class 0 OID 22341563)
-- Dependencies: 223
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5620-f343-4469-ac96555f5363	000e0000-5620-f343-c1ce-12e8f14f7801	00080000-5620-f343-97c7-a1ec0c07d792	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5620-f341-8cd6-696188d188c0
00270000-5620-f343-6118-e90bb52a2d69	000e0000-5620-f343-c1ce-12e8f14f7801	00080000-5620-f343-97c7-a1ec0c07d792	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5620-f341-8cd6-696188d188c0
\.


--
-- TOC entry 3048 (class 0 OID 22341161)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22341392)
-- Dependencies: 204
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5620-f344-7924-72c4b313c3e7	00180000-5620-f343-9fc9-d67370fba877	000c0000-5620-f344-76dd-ed314602d195	00090000-5620-f343-1037-999e531f3886	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-f344-5a07-fed61f00306d	00180000-5620-f343-9fc9-d67370fba877	000c0000-5620-f344-f545-9cf1ff1f9a5c	00090000-5620-f343-1a14-c78ee07292fb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-f344-0a2b-e2a3b385ae40	00180000-5620-f343-9fc9-d67370fba877	000c0000-5620-f344-ee7d-416093917b72	00090000-5620-f343-85cf-b1fc15249e46	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-f344-997b-7276ca46f4ab	00180000-5620-f343-9fc9-d67370fba877	000c0000-5620-f344-abcb-708889f0d580	00090000-5620-f343-b0a3-e6c5c7f017c3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-f344-413c-8027af91a8b0	00180000-5620-f343-9fc9-d67370fba877	000c0000-5620-f344-c33c-f2323725ec8b	00090000-5620-f343-7ef0-45e1f051e183	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-f344-4c6d-037c2d83d316	00180000-5620-f343-cb6d-334a4e789fac	\N	00090000-5620-f343-7ef0-45e1f051e183	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3089 (class 0 OID 22341604)
-- Dependencies: 226
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5620-f341-a696-1749cb9f1986	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5620-f341-1f22-c2daef4ac259	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5620-f341-0536-0b94767bd179	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5620-f341-75e9-4fe5380e0e0d	04	Režija	Režija	Režija	umetnik	30
000f0000-5620-f341-e0f4-baa02fd38a60	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5620-f341-0f63-547e9fec133a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5620-f341-a1c9-a3ad5fdfa9c4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5620-f341-4753-0db3590d64e5	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5620-f341-ac77-68de1d34c924	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5620-f341-1dd5-0ee49aec1fdf	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5620-f341-b386-2699de551251	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5620-f341-09fe-7634bd4a07f9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5620-f341-2ec6-a5bb8066a574	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5620-f341-290b-29842827394c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5620-f341-a923-ebed227d90c1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5620-f341-a439-1f92b84b9773	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5620-f341-1f4f-b8d2fe2b1db5	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5620-f341-a4d6-e59d92b363c8	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3045 (class 0 OID 22341115)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5620-f343-ff20-4bdcf5202609	0001	šola	osnovna ali srednja šola
00400000-5620-f343-8606-bf483b10430a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5620-f343-82c1-62be39ca80a7	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3102 (class 0 OID 22341881)
-- Dependencies: 239
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5620-f341-a5c1-2dec9cd11c8f	01	Velika predstava	f	1.00	1.00
002b0000-5620-f341-dbe0-1afd62fd5ca7	02	Mala predstava	f	0.50	0.50
002b0000-5620-f341-17c3-012ae65b7125	03	Mala koprodukcija	t	0.40	1.00
002b0000-5620-f341-85cd-220f023127fe	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5620-f341-d493-41090e1a5ee4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3065 (class 0 OID 22341372)
-- Dependencies: 202
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5620-f341-d987-dfd75549a201	0001	prva vaja	prva vaja
00420000-5620-f341-48da-ec8a9d5fa01a	0002	tehnična vaja	tehnična vaja
00420000-5620-f341-896d-2c3fcfdea01d	0003	lučna vaja	lučna vaja
00420000-5620-f341-bb23-d42e6607d917	0004	kostumska vaja	kostumska vaja
00420000-5620-f341-cf56-6fc4be61b868	0005	foto vaja	foto vaja
00420000-5620-f341-c26a-ddd9908c0fdd	0006	1. glavna vaja	1. glavna vaja
00420000-5620-f341-c465-2669980b1134	0007	2. glavna vaja	2. glavna vaja
00420000-5620-f341-82e3-c6cf7108a8a6	0008	1. generalka	1. generalka
00420000-5620-f341-f8ec-f2fdcebd8bce	0009	2. generalka	2. generalka
00420000-5620-f341-166f-dc930dbd7458	0010	odprta generalka	odprta generalka
00420000-5620-f341-1b1b-b0eb214198af	0011	obnovitvena vaja	obnovitvena vaja
00420000-5620-f341-246c-6d88f37df700	0012	pevska vaja	pevska vaja
00420000-5620-f341-8aef-698c80b15dd7	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5620-f341-1d50-bbde0678db55	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3054 (class 0 OID 22341235)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 22341060)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5620-f342-cb8f-f342b4cea361	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROUhVaeMIthMPSf51OUK.UfNhJ.T/UNC2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5620-f343-9901-9a045ab0ed23	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5620-f343-f233-54b4ec2a6193	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5620-f343-3209-a142e11d672a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5620-f343-06a2-7cebf7c007eb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5620-f343-30d2-e19520df1653	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5620-f343-b708-732f79f31dc5	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5620-f343-65b5-710a244f5be0	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5620-f343-3bad-b942c5beed49	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5620-f343-d258-5ce86fbfad73	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5620-f343-caa0-10e5e5abfd8b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5620-f342-3c28-d77f9eba42a9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3093 (class 0 OID 22341654)
-- Dependencies: 230
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5620-f343-cf25-cb01baad5e3c	00160000-5620-f343-813f-a7b3c8b1657d	\N	00140000-5620-f341-b7ac-2016fc00b8f2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5620-f343-c76c-7989c6e644e2
000e0000-5620-f343-c1ce-12e8f14f7801	00160000-5620-f343-d225-6710198b4372	\N	00140000-5620-f341-85bb-dadb92e4386c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5620-f343-b756-574968be0c04
000e0000-5620-f343-c62a-003d7900f8b3	\N	\N	00140000-5620-f341-85bb-dadb92e4386c	00190000-5620-f343-d851-da0bb6b6dc57	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-f343-c76c-7989c6e644e2
000e0000-5620-f343-6431-a0beed1e51bb	\N	\N	00140000-5620-f341-85bb-dadb92e4386c	00190000-5620-f343-d851-da0bb6b6dc57	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-f343-c76c-7989c6e644e2
000e0000-5620-f343-13e3-cd26a9418a33	\N	\N	00140000-5620-f341-85bb-dadb92e4386c	00190000-5620-f343-d851-da0bb6b6dc57	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-f343-756a-c5adaad4bb98
000e0000-5620-f343-853c-ca56c93c7cd3	\N	\N	00140000-5620-f341-85bb-dadb92e4386c	00190000-5620-f343-d851-da0bb6b6dc57	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-f343-756a-c5adaad4bb98
\.


--
-- TOC entry 3061 (class 0 OID 22341326)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5620-f343-2b96-8ee1f3845f78	\N	000e0000-5620-f343-c1ce-12e8f14f7801	1	
00200000-5620-f343-629c-dab406e9899a	\N	000e0000-5620-f343-c1ce-12e8f14f7801	2	
00200000-5620-f343-2a3c-56a7899c3d40	\N	000e0000-5620-f343-c1ce-12e8f14f7801	3	
00200000-5620-f343-a0ef-ddda3e52b9fa	\N	000e0000-5620-f343-c1ce-12e8f14f7801	4	
00200000-5620-f343-be80-2784da86952d	\N	000e0000-5620-f343-c1ce-12e8f14f7801	5	
\.


--
-- TOC entry 3076 (class 0 OID 22341463)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 22341577)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5620-f341-fe20-b07f40186acc	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5620-f341-fae2-6a3e41407fff	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5620-f341-084d-2e3e4b1a983f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5620-f341-5fe6-86ca11eb9536	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5620-f341-5382-f5b79bc7e540	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5620-f341-f0eb-f80387a1da06	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5620-f341-d05e-7ecf7ff5e903	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5620-f341-5838-d03feae7bb30	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5620-f341-8cd6-696188d188c0	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5620-f341-770d-ca0a7f695054	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5620-f341-7663-8c47ce964c6b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5620-f341-91c0-f9a8f67c74c3	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5620-f341-4509-973b57f5ba68	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5620-f341-6f35-e441c21fc76a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5620-f341-5777-e65cd8a7045a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5620-f341-ec69-7b5a37bc5872	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5620-f341-76e6-5a34c46d82aa	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5620-f341-3ea1-ead695af4097	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5620-f341-b05d-4bb283c9b264	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5620-f341-20aa-5ca4afb8ebf4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5620-f341-ffd9-e7e04fe926df	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5620-f341-3c7c-44677916afe5	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5620-f341-931a-25a512e8b63a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5620-f341-b343-b25edb1f1d38	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5620-f341-fb84-b9c81f4f6d90	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5620-f341-074a-0e3c7a19a238	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5620-f341-445e-c7a86d140f44	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5620-f341-a332-02f5aa3a34c3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3105 (class 0 OID 22341928)
-- Dependencies: 242
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22341900)
-- Dependencies: 241
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22341940)
-- Dependencies: 243
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22341535)
-- Dependencies: 220
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5620-f343-3dd1-447775154e98	00090000-5620-f343-1a14-c78ee07292fb	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-f343-e4f9-7290ce2fe292	00090000-5620-f343-85cf-b1fc15249e46	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-f343-e160-0e95390cbefd	00090000-5620-f343-4cc4-4f11c936f1a2	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-f343-1e14-01a0059141ee	00090000-5620-f343-62e4-a04074f2235c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-f343-5fbf-20fa4fedde64	00090000-5620-f343-1037-999e531f3886	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-f343-be67-bd8fbbfdb2d9	00090000-5620-f343-f704-1391ad190f5c	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3063 (class 0 OID 22341361)
-- Dependencies: 200
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22341644)
-- Dependencies: 229
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5620-f341-b7ac-2016fc00b8f2	01	Drama	drama (SURS 01)
00140000-5620-f341-d3b3-f43b5edbf83f	02	Opera	opera (SURS 02)
00140000-5620-f341-7131-075422ad2c45	03	Balet	balet (SURS 03)
00140000-5620-f341-75c7-9e00f2989a52	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5620-f341-6a7a-cdabbf756669	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5620-f341-85bb-dadb92e4386c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5620-f341-b4a2-e439cc9cef46	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3082 (class 0 OID 22341525)
-- Dependencies: 219
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2543 (class 2606 OID 22341114)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 22341703)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 22341693)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22341560)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 22341602)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 22341980)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22341350)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22341371)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22341898)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 22341261)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 22341771)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22341521)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 22341324)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 22341299)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 22341275)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22341428)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 22341957)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22341964)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2814 (class 2606 OID 22341988)
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
-- TOC entry 2671 (class 2606 OID 22341455)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 22341233)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 22341133)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22341195)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22341157)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22341103)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2534 (class 2606 OID 22341088)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22341461)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 22341497)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22341639)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22341185)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 22341221)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 22341850)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 22341434)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 22341211)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22341312)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 22341446)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 22341859)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22341867)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22341837)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 22341879)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22341479)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 22341419)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22341410)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22341626)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22341553)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 22341287)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 22341059)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22341488)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22341077)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2536 (class 2606 OID 22341097)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 22341506)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22341441)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22341390)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 22341047)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 22341035)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 22341029)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22341573)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22341166)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 22341401)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22341613)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22341122)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22341891)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 22341379)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 22341246)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 22341072)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22341672)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22341333)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22341469)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22341585)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 22341938)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22341922)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 22341946)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 22341543)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22341365)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22341652)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22341533)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 1259 OID 22341359)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2620 (class 1259 OID 22341360)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2621 (class 1259 OID 22341358)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2622 (class 1259 OID 22341357)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2623 (class 1259 OID 22341356)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2714 (class 1259 OID 22341574)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2715 (class 1259 OID 22341575)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 22341576)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 22341959)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2801 (class 1259 OID 22341958)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2561 (class 1259 OID 22341187)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2562 (class 1259 OID 22341188)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2672 (class 1259 OID 22341462)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2787 (class 1259 OID 22341926)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2788 (class 1259 OID 22341925)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 22341927)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2790 (class 1259 OID 22341924)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2791 (class 1259 OID 22341923)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2666 (class 1259 OID 22341448)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2667 (class 1259 OID 22341447)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2613 (class 1259 OID 22341334)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2614 (class 1259 OID 22341335)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 22341522)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 22341524)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2698 (class 1259 OID 22341523)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2593 (class 1259 OID 22341277)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 22341276)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22341880)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2730 (class 1259 OID 22341641)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 22341642)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22341643)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2797 (class 1259 OID 22341947)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2739 (class 1259 OID 22341677)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2740 (class 1259 OID 22341674)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2741 (class 1259 OID 22341678)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2742 (class 1259 OID 22341676)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2743 (class 1259 OID 22341675)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2583 (class 1259 OID 22341248)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 22341247)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2552 (class 1259 OID 22341160)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2684 (class 1259 OID 22341489)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2538 (class 1259 OID 22341104)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2539 (class 1259 OID 22341105)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2689 (class 1259 OID 22341509)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 22341508)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2691 (class 1259 OID 22341507)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2566 (class 1259 OID 22341198)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2567 (class 1259 OID 22341197)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2568 (class 1259 OID 22341199)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2606 (class 1259 OID 22341313)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 22341314)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 22341037)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2646 (class 1259 OID 22341414)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2647 (class 1259 OID 22341412)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2648 (class 1259 OID 22341411)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2649 (class 1259 OID 22341413)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2529 (class 1259 OID 22341078)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 22341079)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2675 (class 1259 OID 22341470)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2810 (class 1259 OID 22341981)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2712 (class 1259 OID 22341562)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2713 (class 1259 OID 22341561)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2811 (class 1259 OID 22341989)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2812 (class 1259 OID 22341990)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2661 (class 1259 OID 22341435)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2706 (class 1259 OID 22341554)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2707 (class 1259 OID 22341555)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 22341776)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2761 (class 1259 OID 22341775)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2762 (class 1259 OID 22341772)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 22341773)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2764 (class 1259 OID 22341774)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2572 (class 1259 OID 22341213)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2573 (class 1259 OID 22341212)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2574 (class 1259 OID 22341214)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 22341483)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2679 (class 1259 OID 22341482)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2770 (class 1259 OID 22341860)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2771 (class 1259 OID 22341861)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2753 (class 1259 OID 22341707)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 22341708)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2755 (class 1259 OID 22341705)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2756 (class 1259 OID 22341706)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2702 (class 1259 OID 22341544)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2703 (class 1259 OID 22341545)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2652 (class 1259 OID 22341423)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2653 (class 1259 OID 22341422)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 22341420)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2655 (class 1259 OID 22341421)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2749 (class 1259 OID 22341695)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 22341694)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 22341288)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2600 (class 1259 OID 22341302)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2601 (class 1259 OID 22341301)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2602 (class 1259 OID 22341300)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 22341303)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2612 (class 1259 OID 22341325)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 22341851)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2786 (class 1259 OID 22341899)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2804 (class 1259 OID 22341965)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2805 (class 1259 OID 22341966)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2548 (class 1259 OID 22341135)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2549 (class 1259 OID 22341134)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2557 (class 1259 OID 22341167)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 22341168)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2629 (class 1259 OID 22341366)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 22341404)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 22341403)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2643 (class 1259 OID 22341402)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 22341352)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2625 (class 1259 OID 22341353)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2626 (class 1259 OID 22341351)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2627 (class 1259 OID 22341355)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2628 (class 1259 OID 22341354)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2565 (class 1259 OID 22341186)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22341123)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 22341124)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2589 (class 1259 OID 22341262)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 22341264)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2591 (class 1259 OID 22341263)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2592 (class 1259 OID 22341265)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2660 (class 1259 OID 22341429)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 22341640)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22341673)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 22341614)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 22341615)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2555 (class 1259 OID 22341158)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 22341159)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2699 (class 1259 OID 22341534)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 22341048)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 22341234)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 22341196)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 22341036)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2783 (class 1259 OID 22341892)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 22341481)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2683 (class 1259 OID 22341480)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 22341380)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 22341381)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2757 (class 1259 OID 22341704)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 22341222)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22341653)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 22341939)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2776 (class 1259 OID 22341868)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 22341869)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2723 (class 1259 OID 22341603)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2640 (class 1259 OID 22341391)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 22341098)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2850 (class 2606 OID 22342146)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2849 (class 2606 OID 22342151)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2845 (class 2606 OID 22342171)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2851 (class 2606 OID 22342141)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2847 (class 2606 OID 22342161)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2846 (class 2606 OID 22342166)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2848 (class 2606 OID 22342156)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2887 (class 2606 OID 22342341)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2886 (class 2606 OID 22342346)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 22342351)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 22342516)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2920 (class 2606 OID 22342511)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 22342046)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2826 (class 2606 OID 22342051)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 22342256)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2914 (class 2606 OID 22342496)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 22342491)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2913 (class 2606 OID 22342501)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 22342486)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2917 (class 2606 OID 22342481)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2866 (class 2606 OID 22342251)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2867 (class 2606 OID 22342246)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2844 (class 2606 OID 22342131)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2843 (class 2606 OID 22342136)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 22342296)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2876 (class 2606 OID 22342306)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2877 (class 2606 OID 22342301)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2836 (class 2606 OID 22342101)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 22342096)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 22342236)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 22342471)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2890 (class 2606 OID 22342356)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 22342361)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 22342366)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2918 (class 2606 OID 22342506)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2892 (class 2606 OID 22342386)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2895 (class 2606 OID 22342371)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2891 (class 2606 OID 22342391)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2893 (class 2606 OID 22342381)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2894 (class 2606 OID 22342376)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2834 (class 2606 OID 22342091)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2835 (class 2606 OID 22342086)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2822 (class 2606 OID 22342031)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2823 (class 2606 OID 22342026)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 22342276)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2819 (class 2606 OID 22342006)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2818 (class 2606 OID 22342011)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2873 (class 2606 OID 22342291)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2874 (class 2606 OID 22342286)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2875 (class 2606 OID 22342281)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2829 (class 2606 OID 22342061)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 22342056)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2828 (class 2606 OID 22342066)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2841 (class 2606 OID 22342116)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 22342121)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 22341991)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2856 (class 2606 OID 22342211)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2858 (class 2606 OID 22342201)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2859 (class 2606 OID 22342196)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2857 (class 2606 OID 22342206)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2817 (class 2606 OID 22341996)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 22342001)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 22342261)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2923 (class 2606 OID 22342531)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 22342336)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 22342331)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2925 (class 2606 OID 22342536)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2924 (class 2606 OID 22342541)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2865 (class 2606 OID 22342241)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2882 (class 2606 OID 22342321)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2881 (class 2606 OID 22342326)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2902 (class 2606 OID 22342446)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 22342441)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2906 (class 2606 OID 22342426)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2905 (class 2606 OID 22342431)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2904 (class 2606 OID 22342436)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2832 (class 2606 OID 22342076)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 22342071)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 22342081)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2870 (class 2606 OID 22342271)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2871 (class 2606 OID 22342266)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 22342456)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 22342461)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2899 (class 2606 OID 22342416)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2898 (class 2606 OID 22342421)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2901 (class 2606 OID 22342406)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2900 (class 2606 OID 22342411)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2880 (class 2606 OID 22342311)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 22342316)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2860 (class 2606 OID 22342231)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2861 (class 2606 OID 22342226)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2863 (class 2606 OID 22342216)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2862 (class 2606 OID 22342221)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2896 (class 2606 OID 22342401)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22342396)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2838 (class 2606 OID 22342106)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2839 (class 2606 OID 22342111)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 22342126)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2907 (class 2606 OID 22342451)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2910 (class 2606 OID 22342466)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2912 (class 2606 OID 22342476)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2922 (class 2606 OID 22342521)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2921 (class 2606 OID 22342526)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 22342021)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2821 (class 2606 OID 22342016)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2825 (class 2606 OID 22342036)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 22342041)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 22342176)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 22342191)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 22342186)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2855 (class 2606 OID 22342181)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-16 14:53:26 CEST

--
-- PostgreSQL database dump complete
--

