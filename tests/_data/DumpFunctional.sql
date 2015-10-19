--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-19 17:30:25 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 249 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22658200)
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
-- TOC entry 233 (class 1259 OID 22658798)
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
-- TOC entry 232 (class 1259 OID 22658781)
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
-- TOC entry 223 (class 1259 OID 22658658)
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
-- TOC entry 226 (class 1259 OID 22658688)
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
-- TOC entry 247 (class 1259 OID 22659069)
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
-- TOC entry 200 (class 1259 OID 22658438)
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
-- TOC entry 202 (class 1259 OID 22658469)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 22658995)
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
-- TOC entry 192 (class 1259 OID 22658343)
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
-- TOC entry 234 (class 1259 OID 22658811)
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
-- TOC entry 219 (class 1259 OID 22658612)
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
-- TOC entry 198 (class 1259 OID 22658417)
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
-- TOC entry 195 (class 1259 OID 22658383)
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
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22658360)
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
-- TOC entry 208 (class 1259 OID 22658526)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 22659050)
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
-- TOC entry 246 (class 1259 OID 22659062)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 22659084)
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
-- TOC entry 212 (class 1259 OID 22658551)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22658317)
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
-- TOC entry 183 (class 1259 OID 22658219)
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
-- TOC entry 187 (class 1259 OID 22658283)
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
-- TOC entry 184 (class 1259 OID 22658230)
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
-- TOC entry 178 (class 1259 OID 22658174)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22658193)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 22658558)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 22658592)
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
-- TOC entry 229 (class 1259 OID 22658729)
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
-- TOC entry 186 (class 1259 OID 22658263)
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
-- TOC entry 189 (class 1259 OID 22658309)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22658940)
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
-- TOC entry 209 (class 1259 OID 22658532)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22658294)
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
-- TOC entry 196 (class 1259 OID 22658398)
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
-- TOC entry 197 (class 1259 OID 22658410)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 22658544)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 22658954)
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
-- TOC entry 238 (class 1259 OID 22658964)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22658879)
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
-- TOC entry 239 (class 1259 OID 22658972)
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
-- TOC entry 215 (class 1259 OID 22658573)
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
-- TOC entry 207 (class 1259 OID 22658517)
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
-- TOC entry 206 (class 1259 OID 22658507)
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
-- TOC entry 228 (class 1259 OID 22658718)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 22658648)
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
-- TOC entry 194 (class 1259 OID 22658372)
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
-- TOC entry 175 (class 1259 OID 22658145)
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
-- TOC entry 174 (class 1259 OID 22658143)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 22658586)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22658183)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22658167)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 22658600)
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
-- TOC entry 210 (class 1259 OID 22658538)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 22658484)
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
-- TOC entry 173 (class 1259 OID 22658132)
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
-- TOC entry 172 (class 1259 OID 22658124)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22658119)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 22658665)
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
-- TOC entry 185 (class 1259 OID 22658255)
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
-- TOC entry 205 (class 1259 OID 22658494)
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
-- TOC entry 227 (class 1259 OID 22658706)
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
-- TOC entry 182 (class 1259 OID 22658209)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 22658983)
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
-- TOC entry 203 (class 1259 OID 22658474)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22658329)
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
-- TOC entry 176 (class 1259 OID 22658154)
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
-- TOC entry 231 (class 1259 OID 22658756)
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
-- TOC entry 199 (class 1259 OID 22658428)
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
-- TOC entry 214 (class 1259 OID 22658565)
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
-- TOC entry 225 (class 1259 OID 22658679)
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
-- TOC entry 243 (class 1259 OID 22659030)
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
-- TOC entry 242 (class 1259 OID 22659002)
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
-- TOC entry 244 (class 1259 OID 22659042)
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
-- TOC entry 221 (class 1259 OID 22658637)
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
-- TOC entry 201 (class 1259 OID 22658463)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 22658746)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 22658627)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2219 (class 2604 OID 22658148)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3056 (class 0 OID 22658200)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5625-0c8e-9b48-0c48ace9a740	10	30	Otroci	Abonma za otroke	200
000a0000-5625-0c8e-4efc-356fe3d44fac	20	60	Mladina	Abonma za mladino	400
000a0000-5625-0c8e-bb2d-b62707e7a0b4	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3108 (class 0 OID 22658798)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5625-0c8e-08b9-6536b5a3a230	000d0000-5625-0c8e-fe52-4f13c796f173	\N	00090000-5625-0c8e-e1e6-ba372200a4a8	000b0000-5625-0c8e-0d56-f3b27f4dc913	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5625-0c8e-098c-ff9f5cbcc2b0	000d0000-5625-0c8e-2a85-de20cc3138eb	00100000-5625-0c8e-f78c-008cb000de9e	00090000-5625-0c8e-9b2d-bd8245ae7d42	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5625-0c8e-27e1-152a7caadd4b	000d0000-5625-0c8e-5f11-9192ea6ab146	00100000-5625-0c8e-91f2-34acf2b3517a	00090000-5625-0c8e-5106-71a52594121e	\N	0003	t	\N	2015-10-19	\N	2	t	\N	f	f
000c0000-5625-0c8e-479c-37bfdbbcaf8d	000d0000-5625-0c8e-711b-7aef14b1b650	\N	00090000-5625-0c8e-348d-f4552aecf757	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5625-0c8e-f7bb-8a81356a8e1f	000d0000-5625-0c8e-a1ee-e9c9c5a3ce85	\N	00090000-5625-0c8e-4484-92c4beb0d6e3	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5625-0c8e-a72c-d623068c2297	000d0000-5625-0c8e-890e-f2fe42f5aeed	\N	00090000-5625-0c8e-9c51-52493a851941	000b0000-5625-0c8e-61c4-889788ff11ac	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5625-0c8e-9e32-460ee0632416	000d0000-5625-0c8e-48e7-873646f40055	00100000-5625-0c8e-c806-9b74275203b7	00090000-5625-0c8e-5058-398e89e0aadf	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5625-0c8e-15f1-3cf791eb23dc	000d0000-5625-0c8e-6bdf-4a0e8a2d6ae2	\N	00090000-5625-0c8e-e27f-a309b188b52f	000b0000-5625-0c8e-5b67-e84c71d47093	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5625-0c8e-c7c1-b8c0c0d0bf40	000d0000-5625-0c8e-48e7-873646f40055	00100000-5625-0c8e-fbfb-16d843ff3568	00090000-5625-0c8e-858a-caac5f4c91d3	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5625-0c8e-8e75-c630a5c7661a	000d0000-5625-0c8e-48e7-873646f40055	00100000-5625-0c8e-b8e3-86421fe16ceb	00090000-5625-0c8e-47e0-e7f604f32ba2	\N	0010	t	\N	2015-10-19	\N	16	f	\N	f	t
000c0000-5625-0c8e-0408-1b3eab4d3382	000d0000-5625-0c8e-48e7-873646f40055	00100000-5625-0c8e-0f5e-3292f43a8b94	00090000-5625-0c8e-5e7b-a18f59da6668	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5625-0c8e-b348-550b412d632f	000d0000-5625-0c8e-983c-eae7e6a09e5f	\N	00090000-5625-0c8e-9b2d-bd8245ae7d42	000b0000-5625-0c8e-7849-f5e23f873ee2	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3107 (class 0 OID 22658781)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 22658658)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5625-0c8e-0d75-67bfdfc794ed	00160000-5625-0c8e-e912-af47b2593a28	00090000-5625-0c8e-36ba-19b214e726c5	aizv	10	t
003d0000-5625-0c8e-1220-78e8e53be379	00160000-5625-0c8e-e912-af47b2593a28	00090000-5625-0c8e-91c5-daa6ab9b8857	apri	14	t
003d0000-5625-0c8e-fd04-47b568ee5812	00160000-5625-0c8e-5953-0b622ccb56fb	00090000-5625-0c8e-0415-1fd6987977cc	aizv	11	t
003d0000-5625-0c8e-d4a5-3c3cf9874713	00160000-5625-0c8e-9b50-8e520e7f85d7	00090000-5625-0c8e-6495-7f2c6cfb486b	aizv	12	t
003d0000-5625-0c8e-035b-fe1e0b041b50	00160000-5625-0c8e-e912-af47b2593a28	00090000-5625-0c8e-2c80-1a463f7a4e2f	apri	18	f
\.


--
-- TOC entry 3101 (class 0 OID 22658688)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5625-0c8e-e912-af47b2593a28	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5625-0c8e-5953-0b622ccb56fb	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5625-0c8e-9b50-8e520e7f85d7	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3122 (class 0 OID 22659069)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 22658438)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5625-0c8e-41f6-b9cc9bb43095	\N	\N	00200000-5625-0c8e-cd53-67911239df37	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5625-0c8e-dc8f-f60f8dfdc3bb	\N	\N	00200000-5625-0c8e-02de-5931acf4be6b	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5625-0c8e-143d-babbb31b6db9	\N	\N	00200000-5625-0c8e-ceea-7df2d467329c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5625-0c8e-d695-ee46deb90b2c	\N	\N	00200000-5625-0c8e-0cb7-dd2cba99d6c4	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5625-0c8e-df40-03064dc4a353	\N	\N	00200000-5625-0c8e-8c35-bd744fe95798	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3077 (class 0 OID 22658469)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 22658995)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22658343)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5625-0c8c-4a6e-c9f5c5ee0394	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5625-0c8c-6f5c-d0dc4cdc4a0d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5625-0c8c-5266-d78a0afe093c	AL	ALB	008	Albania 	Albanija	\N
00040000-5625-0c8c-5740-7fb37093d1e2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5625-0c8c-3e46-c4bf25f5b32d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5625-0c8c-7761-3463a9ea5764	AD	AND	020	Andorra 	Andora	\N
00040000-5625-0c8c-8699-7112524ef5e4	AO	AGO	024	Angola 	Angola	\N
00040000-5625-0c8c-4ad9-23220b74f58b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5625-0c8c-deaa-117be0db9f2a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5625-0c8c-eda5-eacf6579ae54	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5625-0c8c-3ab2-da8344bb12aa	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5625-0c8c-7d31-255fdfbed520	AM	ARM	051	Armenia 	Armenija	\N
00040000-5625-0c8c-e7c4-92bfbbfa6737	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5625-0c8c-a9eb-5655b26a803c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5625-0c8c-14ac-1ef18ced996e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5625-0c8c-6dd1-7af1943b344c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5625-0c8c-63df-98de9f60e37a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5625-0c8c-1a9d-69e423205edd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5625-0c8c-01bc-c344778264d1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5625-0c8c-d90c-8413add6d631	BB	BRB	052	Barbados 	Barbados	\N
00040000-5625-0c8c-af27-45caf4828a15	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5625-0c8c-a551-418fd84fe7c2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5625-0c8c-890e-e8a992550c25	BZ	BLZ	084	Belize 	Belize	\N
00040000-5625-0c8c-d83f-20418729592a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5625-0c8c-8064-ac416baa16df	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5625-0c8c-e1c6-502d67fa5421	BT	BTN	064	Bhutan 	Butan	\N
00040000-5625-0c8c-8cf9-60d568ee9ffa	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5625-0c8c-2127-18920ad05622	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5625-0c8c-89ff-35a0a668534e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5625-0c8c-7b03-6de7db81a5a9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5625-0c8c-d814-acae5cb9330f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5625-0c8c-728c-74ed69745e52	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5625-0c8c-bc03-99555d6b19fe	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5625-0c8c-b9ce-b3fdda6f1421	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5625-0c8c-77d3-8bd68bc643ba	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5625-0c8c-c057-23524a1438e0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5625-0c8c-d5bf-df08d2c190ae	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5625-0c8c-578c-2a961daf3af9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5625-0c8c-6b95-9bca26c717b6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5625-0c8c-bae1-032860f90114	CA	CAN	124	Canada 	Kanada	\N
00040000-5625-0c8c-2518-57012f386b24	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5625-0c8c-cc15-062aff750681	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5625-0c8c-899c-010eae6bdf3e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5625-0c8c-6251-4ee3e1b811e2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5625-0c8c-5ad4-7f55f35bc1d6	CL	CHL	152	Chile 	Čile	\N
00040000-5625-0c8c-2f50-a5581654d968	CN	CHN	156	China 	Kitajska	\N
00040000-5625-0c8c-77b0-af64d4e3e130	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5625-0c8c-03fc-8fd0fe643d69	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5625-0c8c-de8f-a1bd9b359423	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5625-0c8c-019e-7042a316e336	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5625-0c8c-f1b0-fa428b1dc3ac	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5625-0c8c-fa28-5724cc295b33	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5625-0c8c-54b7-21b25b99f21b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5625-0c8c-7b3c-6afe14218b07	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5625-0c8c-439f-fc4d02c8d70e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5625-0c8c-1078-dcd0806eb848	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5625-0c8c-9cac-2b479320c2da	CU	CUB	192	Cuba 	Kuba	\N
00040000-5625-0c8c-4898-bc26debf4491	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5625-0c8c-9a3f-287ee62a97db	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5625-0c8c-e323-cb00aac7368d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5625-0c8c-c677-12acadf1c974	DK	DNK	208	Denmark 	Danska	\N
00040000-5625-0c8c-29b0-0d68b75f9875	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5625-0c8c-bc6c-a127c7689108	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5625-0c8c-cc23-7cd94a42054e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5625-0c8c-8e23-c06ba7d55894	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5625-0c8c-e955-245eb0fea3ac	EG	EGY	818	Egypt 	Egipt	\N
00040000-5625-0c8c-315d-adee921c7447	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5625-0c8c-b1a2-d6f17826f54f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5625-0c8c-5cdb-8c3a8405b8d8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5625-0c8c-a7cb-8cbce0834c61	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5625-0c8c-ff37-6887efeac69c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5625-0c8c-7a2b-d2c69d5f944a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5625-0c8c-08c0-07c28b27b1b5	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5625-0c8c-8ee2-2908a2c3876c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5625-0c8c-ab0d-85a2c6a0eb67	FI	FIN	246	Finland 	Finska	\N
00040000-5625-0c8c-ace1-7fb823c24bb6	FR	FRA	250	France 	Francija	\N
00040000-5625-0c8c-cc3f-3e647ce679a7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5625-0c8c-f930-7741060a6c50	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5625-0c8c-fedd-e84c2ff65c81	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5625-0c8c-1d65-21d388ad6da6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5625-0c8c-4ce4-4d86d9714c2c	GA	GAB	266	Gabon 	Gabon	\N
00040000-5625-0c8c-4581-5afa07c00e9e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5625-0c8c-d2d9-89b08c3b7153	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5625-0c8c-4297-15a2cdb99c00	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5625-0c8c-d6c8-cdba9e046f15	GH	GHA	288	Ghana 	Gana	\N
00040000-5625-0c8c-0651-239a140e9719	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5625-0c8c-bfe7-00b1b5708fab	GR	GRC	300	Greece 	Grčija	\N
00040000-5625-0c8c-fca9-60ef9dda46e5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5625-0c8c-5ced-4aee319d34b3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5625-0c8c-38ba-e2071baef3be	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5625-0c8c-13aa-956d4a62fd5c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5625-0c8c-dbbd-5a3013d450d4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5625-0c8c-1a8f-1d9dcfcde70c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5625-0c8c-3620-2788e9694ecb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5625-0c8c-57f7-34dc4e6a4a43	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5625-0c8c-b85f-3d17f0d7a198	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5625-0c8c-b8aa-2779ea2a4d20	HT	HTI	332	Haiti 	Haiti	\N
00040000-5625-0c8c-cd97-2a2221ca7ad3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5625-0c8c-dbce-51bb4498bfc3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5625-0c8c-e1ab-009d374ab171	HN	HND	340	Honduras 	Honduras	\N
00040000-5625-0c8c-1e16-7d5649cd9634	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5625-0c8c-e822-810dd1805332	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5625-0c8c-5e0f-d8d5bc70a1d4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5625-0c8c-41aa-88c29bd4d460	IN	IND	356	India 	Indija	\N
00040000-5625-0c8c-e91e-bd16e7ce33df	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5625-0c8c-1a67-c932d60f0200	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5625-0c8c-0d13-717d12594908	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5625-0c8c-b2b6-2a3b72da66d7	IE	IRL	372	Ireland 	Irska	\N
00040000-5625-0c8c-f6cc-46da768a01bc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5625-0c8c-27fc-a98d6b9e7181	IL	ISR	376	Israel 	Izrael	\N
00040000-5625-0c8c-3697-2804427a10fc	IT	ITA	380	Italy 	Italija	\N
00040000-5625-0c8c-e180-c6eb36b03965	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5625-0c8c-cf77-6dc048a6787b	JP	JPN	392	Japan 	Japonska	\N
00040000-5625-0c8c-c148-1e2989c0f62f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5625-0c8c-3036-46455202d3b4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5625-0c8c-9a95-a2cefa828d11	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5625-0c8c-b8bb-2e1e073856f7	KE	KEN	404	Kenya 	Kenija	\N
00040000-5625-0c8c-d9d2-a0084e579cad	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5625-0c8c-27a3-b3f2e8bc8335	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5625-0c8c-3526-9203a3a8c9d7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5625-0c8c-cef4-4d7ab575cd18	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5625-0c8c-4cbc-9476613bd25d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5625-0c8c-1b56-df43ff50ab27	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5625-0c8c-b35c-654c02a01c14	LV	LVA	428	Latvia 	Latvija	\N
00040000-5625-0c8c-df4e-01f0fceb5f95	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5625-0c8c-845d-734979cbde4d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5625-0c8c-9471-f59de2805f7f	LR	LBR	430	Liberia 	Liberija	\N
00040000-5625-0c8c-3900-73e8182a45da	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5625-0c8c-a8c2-9bf903245a73	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5625-0c8c-445a-a7d0e7769c2e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5625-0c8c-a7b4-9c3f9ab551b4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5625-0c8c-aa10-0bc726f4f0c6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5625-0c8c-4c02-8d581ff8986c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5625-0c8c-7da5-83d497e34655	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5625-0c8c-9b6b-79a70dbb176b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5625-0c8c-3a1f-55f8a15a02e1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5625-0c8c-7998-b980a495b37b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5625-0c8c-cf31-86947a531dac	ML	MLI	466	Mali 	Mali	\N
00040000-5625-0c8c-6d21-5a8a283e1c25	MT	MLT	470	Malta 	Malta	\N
00040000-5625-0c8c-2780-5408f228a75b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5625-0c8c-638c-f2d21970c401	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5625-0c8c-86e4-50700bc58cb6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5625-0c8c-da9d-f86b3cd2cdfa	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5625-0c8c-d0dd-6b25af566624	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5625-0c8c-137e-10e5060894be	MX	MEX	484	Mexico 	Mehika	\N
00040000-5625-0c8c-f6d2-dc58fc293056	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5625-0c8c-a092-3bf4e577ec73	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5625-0c8c-eb35-3fe05c562dc7	MC	MCO	492	Monaco 	Monako	\N
00040000-5625-0c8c-48ae-606b4a157198	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5625-0c8c-2c49-8e6772910d91	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5625-0c8c-e76f-eaa8c6315692	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5625-0c8c-7e00-feeea87603fc	MA	MAR	504	Morocco 	Maroko	\N
00040000-5625-0c8c-913c-5a64b22525c6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5625-0c8c-ea8d-b0666ddb4c0e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5625-0c8c-447d-e621663fb93f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5625-0c8c-849f-48a71b450c9e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5625-0c8c-ff35-4eccb110d8ff	NP	NPL	524	Nepal 	Nepal	\N
00040000-5625-0c8c-e982-0fa74e2c66a3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5625-0c8c-8c0e-477598ebd086	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5625-0c8c-fe24-eb498b945fff	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5625-0c8c-654f-dae40ee7769c	NE	NER	562	Niger 	Niger 	\N
00040000-5625-0c8c-d97e-4484658e76b0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5625-0c8c-f612-54e2275242a1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5625-0c8c-54a0-e1568fb63376	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5625-0c8c-a36a-16cbd1bc5542	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5625-0c8c-6f79-e691c5847b55	NO	NOR	578	Norway 	Norveška	\N
00040000-5625-0c8c-4cf2-224116ecd048	OM	OMN	512	Oman 	Oman	\N
00040000-5625-0c8c-d6fe-e234e5e958aa	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5625-0c8c-ce7a-489d49097524	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5625-0c8c-6b5e-83bc5093d242	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5625-0c8c-6e92-669fd583f003	PA	PAN	591	Panama 	Panama	\N
00040000-5625-0c8c-f4ae-387d84fae076	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5625-0c8c-e570-ba0dbe7480ee	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5625-0c8c-69a7-adfa1af9b015	PE	PER	604	Peru 	Peru	\N
00040000-5625-0c8c-3e6c-06cda937cc52	PH	PHL	608	Philippines 	Filipini	\N
00040000-5625-0c8c-44ad-fbaf17c7f78e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5625-0c8c-c382-b769aa403101	PL	POL	616	Poland 	Poljska	\N
00040000-5625-0c8c-2442-901258063762	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5625-0c8c-7584-4a68e831a3cb	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5625-0c8c-8590-54e2a774e255	QA	QAT	634	Qatar 	Katar	\N
00040000-5625-0c8c-cb57-8830aac1d6a0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5625-0c8c-87d9-f548c3596fe0	RO	ROU	642	Romania 	Romunija	\N
00040000-5625-0c8c-4853-88340c2c83f3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5625-0c8c-a5ce-6f2ee5eb7d87	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5625-0c8c-3edd-b8bc2f841842	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5625-0c8c-8ca4-9df3cc9855ed	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5625-0c8c-5fa8-6c8092f84a87	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5625-0c8c-c66b-f71e8950a48c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5625-0c8c-90d4-2e111fffde55	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5625-0c8c-ce1b-09c61fb74ee5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5625-0c8c-4257-2046cc3bff04	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5625-0c8c-89bd-a7d2ffca0b0d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5625-0c8c-ac3a-6059b8c72bb0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5625-0c8c-279f-cc710b1a27f9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5625-0c8c-9482-0d8d13fbf9da	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5625-0c8c-1e67-421b533e8442	SN	SEN	686	Senegal 	Senegal	\N
00040000-5625-0c8c-5bcf-aaf58b01aa23	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5625-0c8c-cb85-40c8a9b086f8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5625-0c8c-c9d3-8ad273f01813	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5625-0c8c-93bd-8a76bc7433c0	SG	SGP	702	Singapore 	Singapur	\N
00040000-5625-0c8c-eefe-c825f5ea3428	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5625-0c8c-9f56-c740a656a8e1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5625-0c8c-c32b-e6d03a002e1d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5625-0c8c-6b06-57891b887bd5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5625-0c8c-588e-d47221e75742	SO	SOM	706	Somalia 	Somalija	\N
00040000-5625-0c8c-df3b-111d163aead3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5625-0c8c-fc09-fb2043d759d6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5625-0c8c-0035-aab7c160e31c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5625-0c8c-ecb5-36a50e600b85	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5625-0c8c-1419-32dcec0274c6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5625-0c8c-4b1a-76a43bf190b2	SD	SDN	729	Sudan 	Sudan	\N
00040000-5625-0c8c-5aee-a5f337f7aabf	SR	SUR	740	Suriname 	Surinam	\N
00040000-5625-0c8c-e9bc-add34b076b2b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5625-0c8c-2f50-3afe4a996450	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5625-0c8c-3b81-b66d5c5c636f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5625-0c8c-7cda-8f517e084967	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5625-0c8c-63a6-06d22163ec84	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5625-0c8c-8728-960f8b2ad12e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5625-0c8c-d479-22f05ace40ea	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5625-0c8c-d732-4b3018a1c265	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5625-0c8c-5c33-5b2967295ad8	TH	THA	764	Thailand 	Tajska	\N
00040000-5625-0c8c-707c-ab2361be8fab	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5625-0c8c-11bb-d23db9aacc3e	TG	TGO	768	Togo 	Togo	\N
00040000-5625-0c8c-b8ff-0abb1d2aff2b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5625-0c8c-9bfc-4fb8adc0d6c3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5625-0c8c-2c1a-13f59b730ce9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5625-0c8c-ffb3-5f19983afa26	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5625-0c8c-be5f-eed3f2560716	TR	TUR	792	Turkey 	Turčija	\N
00040000-5625-0c8c-0c72-e930f9ac99e3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5625-0c8c-ac5d-25d6bafd89a6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5625-0c8c-3281-2fcf4c199c91	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5625-0c8c-2ae4-60eed46f39d0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5625-0c8c-e5bf-0d16bc7e9571	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5625-0c8c-7e6c-4eb3ee141d46	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5625-0c8c-08a3-1a29e6c73e45	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5625-0c8c-0be2-58ae314385f6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5625-0c8c-ac7f-afd787b8aa8e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5625-0c8c-16df-c2e354b3c06f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5625-0c8c-badb-ad55929ef7be	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5625-0c8c-ea74-c21f7757daad	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5625-0c8c-b56d-e75b66b02b4c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5625-0c8c-edf0-38a6e8c4bb2d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5625-0c8c-370c-9439d5dfc89d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5625-0c8c-bac6-56433319f1e2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5625-0c8c-d8b3-ae3f5797e334	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5625-0c8c-73cc-6794fad71fcf	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5625-0c8c-452d-99f84d3c138a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5625-0c8c-1ea9-4e8bc1ad55a9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5625-0c8c-d3d7-160b2ce69375	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3109 (class 0 OID 22658811)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5625-0c8e-d753-79e79b55bb2e	000e0000-5625-0c8e-966f-886d27c2b0ef	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5625-0c8c-a779-127bb8ebad66	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5625-0c8e-81d3-b9b125ab727e	000e0000-5625-0c8e-1352-04ffab0e7ea8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5625-0c8c-2242-07caeac8d08e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5625-0c8e-06a3-7448404557e5	000e0000-5625-0c8e-df06-0c89b91bf252	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5625-0c8c-a779-127bb8ebad66	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5625-0c8e-ef30-01a2beb4195e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5625-0c8e-165f-9ffd76040d59	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3094 (class 0 OID 22658612)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5625-0c8e-fe52-4f13c796f173	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-08b9-6536b5a3a230	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5625-0c8c-8374-d195f983c058
000d0000-5625-0c8e-2a85-de20cc3138eb	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-098c-ff9f5cbcc2b0	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5625-0c8c-36ff-8a11511e0359
000d0000-5625-0c8e-5f11-9192ea6ab146	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-27e1-152a7caadd4b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5625-0c8c-f1b3-bb5c939b931c
000d0000-5625-0c8e-711b-7aef14b1b650	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-479c-37bfdbbcaf8d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5625-0c8c-fbcb-5089c94b27a1
000d0000-5625-0c8e-a1ee-e9c9c5a3ce85	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-f7bb-8a81356a8e1f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5625-0c8c-fbcb-5089c94b27a1
000d0000-5625-0c8e-890e-f2fe42f5aeed	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-a72c-d623068c2297	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5625-0c8c-8374-d195f983c058
000d0000-5625-0c8e-48e7-873646f40055	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-c7c1-b8c0c0d0bf40	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5625-0c8c-8374-d195f983c058
000d0000-5625-0c8e-6bdf-4a0e8a2d6ae2	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-15f1-3cf791eb23dc	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5625-0c8c-927a-bfffde5ba384
000d0000-5625-0c8e-983c-eae7e6a09e5f	000e0000-5625-0c8e-1352-04ffab0e7ea8	000c0000-5625-0c8e-b348-550b412d632f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5625-0c8c-93d2-be98306e9928
\.


--
-- TOC entry 3073 (class 0 OID 22658417)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22658383)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22658360)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5625-0c8e-f381-db724ec5ca53	00080000-5625-0c8e-b268-789929fd3bce	00090000-5625-0c8e-47e0-e7f604f32ba2	AK		igralka
\.


--
-- TOC entry 3083 (class 0 OID 22658526)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 22659050)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 22659062)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 22659084)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 22028081)
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
-- TOC entry 3087 (class 0 OID 22658551)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 22658317)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5625-0c8c-343a-4276a2a95af6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5625-0c8c-c862-7256c2721eb9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5625-0c8c-8328-59d8545017e7	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5625-0c8c-5d78-f2be15a3fdd3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5625-0c8c-b816-f255ca13ffb2	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5625-0c8c-d8b7-6104351d405e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5625-0c8c-6d9e-ecbebf93a59b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5625-0c8c-693b-16fac2f219a3	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5625-0c8c-4ff8-c981790b34d5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5625-0c8c-7011-ae0233990322	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5625-0c8c-63ed-56aa5107cedb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5625-0c8c-7cbe-877a88e6f0c5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5625-0c8c-a370-89919685ba88	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5625-0c8c-cb76-171ca91ec8b8	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5625-0c8c-a224-4e490ecbb191	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5625-0c8e-d160-a15c99b34349	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5625-0c8e-d636-96fb9c502f40	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5625-0c8e-e61b-8c9480405182	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5625-0c8e-ce0b-4ff3a3ec999e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5625-0c8e-bb43-324fa7b5cd1f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5625-0c8f-25e3-f35c3cf1e89f	application.tenant.maticnopodjetje	string	s:36:"00080000-5625-0c8f-0c50-615814b342f3";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3058 (class 0 OID 22658219)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5625-0c8e-42fc-d839e55c0e6e	00000000-5625-0c8e-d160-a15c99b34349	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5625-0c8e-ce99-4626907d5440	00000000-5625-0c8e-d160-a15c99b34349	00010000-5625-0c8c-d2ec-0f057849de70	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5625-0c8e-334b-ccd84616beb5	00000000-5625-0c8e-d636-96fb9c502f40	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3062 (class 0 OID 22658283)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5625-0c8e-0c22-a39b22ad6d4e	\N	00100000-5625-0c8e-f78c-008cb000de9e	00100000-5625-0c8e-91f2-34acf2b3517a	01	Gledališče Nimbis
00410000-5625-0c8e-3e43-8ac58d649e1b	00410000-5625-0c8e-0c22-a39b22ad6d4e	00100000-5625-0c8e-f78c-008cb000de9e	00100000-5625-0c8e-91f2-34acf2b3517a	02	Tehnika
\.


--
-- TOC entry 3059 (class 0 OID 22658230)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5625-0c8e-e1e6-ba372200a4a8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5625-0c8e-348d-f4552aecf757	00010000-5625-0c8e-00fe-5bcf599345fe	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5625-0c8e-5106-71a52594121e	00010000-5625-0c8e-8765-46dda10ad7c6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5625-0c8e-858a-caac5f4c91d3	00010000-5625-0c8e-8265-370b70dc99fd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5625-0c8e-ced9-0a8d456b42f5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5625-0c8e-9c51-52493a851941	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5625-0c8e-5e7b-a18f59da6668	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5625-0c8e-5058-398e89e0aadf	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5625-0c8e-47e0-e7f604f32ba2	00010000-5625-0c8e-7a93-1d9a6156a237	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5625-0c8e-9b2d-bd8245ae7d42	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5625-0c8e-7203-486baeaa3e0f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5625-0c8e-4484-92c4beb0d6e3	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5625-0c8e-e27f-a309b188b52f	00010000-5625-0c8e-12d5-453870eefed5	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5625-0c8e-36ba-19b214e726c5	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5625-0c8e-91c5-daa6ab9b8857	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5625-0c8e-0415-1fd6987977cc	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5625-0c8e-6495-7f2c6cfb486b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5625-0c8e-2c80-1a463f7a4e2f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3053 (class 0 OID 22658174)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5625-0c8c-4f64-b130277b35cf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5625-0c8c-1de8-56f8cdd8a8cb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5625-0c8c-a4f1-2168575f6c2b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5625-0c8c-c5a2-bc880000115f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5625-0c8c-da1d-31eae3bc42f2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5625-0c8c-921b-3ab00496ff4e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5625-0c8c-147e-fdfb1be351bb	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5625-0c8c-dc75-4bf4d3526f90	Abonma-read	Abonma - branje	f
00030000-5625-0c8c-4291-06e09873baa7	Abonma-write	Abonma - spreminjanje	f
00030000-5625-0c8c-d38f-2eecd431e0cd	Alternacija-read	Alternacija - branje	f
00030000-5625-0c8c-4454-7432bef97be8	Alternacija-write	Alternacija - spreminjanje	f
00030000-5625-0c8c-a19c-0d6d460262ae	Arhivalija-read	Arhivalija - branje	f
00030000-5625-0c8c-be39-e54d2c4238ce	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5625-0c8c-2b75-340c9ef085f6	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5625-0c8c-3782-ed4391491c25	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5625-0c8c-0f23-b729741a1bad	Besedilo-read	Besedilo - branje	f
00030000-5625-0c8c-4c3f-919d4f80668d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5625-0c8c-8de1-77332b6cc0e3	DogodekIzven-read	DogodekIzven - branje	f
00030000-5625-0c8c-3262-561b495007fe	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5625-0c8c-a2db-12d4c05195c8	Dogodek-read	Dogodek - branje	f
00030000-5625-0c8c-2aa0-0ab32d93655f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5625-0c8c-7d85-9b55d3a6a05d	DrugiVir-read	DrugiVir - branje	f
00030000-5625-0c8c-bec5-4b624e342157	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5625-0c8c-7a08-d579d1aab589	Drzava-read	Drzava - branje	f
00030000-5625-0c8c-0726-baa01c8c1b79	Drzava-write	Drzava - spreminjanje	f
00030000-5625-0c8c-ae16-a829904170df	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5625-0c8c-a599-6c472c692f15	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5625-0c8c-f139-ad32a80ebf70	Funkcija-read	Funkcija - branje	f
00030000-5625-0c8c-d57a-04f40832955f	Funkcija-write	Funkcija - spreminjanje	f
00030000-5625-0c8c-7f74-ab6fbbea3699	Gostovanje-read	Gostovanje - branje	f
00030000-5625-0c8c-6345-196909eddac5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5625-0c8c-27b9-c5a6f975ef6f	Gostujoca-read	Gostujoca - branje	f
00030000-5625-0c8c-1dda-0ea972abac05	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5625-0c8c-06a3-f6fa923752eb	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5625-0c8c-feff-c016642fc5ac	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5625-0c8c-fc02-916c39d0620c	Kupec-read	Kupec - branje	f
00030000-5625-0c8c-c32b-11c057e3ce24	Kupec-write	Kupec - spreminjanje	f
00030000-5625-0c8c-1fba-668b7bbd4907	NacinPlacina-read	NacinPlacina - branje	f
00030000-5625-0c8c-0d1a-fbac545680bf	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5625-0c8c-2bf1-73d8b832cba6	Option-read	Option - branje	f
00030000-5625-0c8c-4eb8-e9127c6815ca	Option-write	Option - spreminjanje	f
00030000-5625-0c8c-ec10-d6bf39712324	OptionValue-read	OptionValue - branje	f
00030000-5625-0c8c-f3f8-aa44fe07f0f8	OptionValue-write	OptionValue - spreminjanje	f
00030000-5625-0c8c-3e1d-e102e06ac613	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5625-0c8c-a27e-81e4961e63a7	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5625-0c8c-74bb-0c200b7dd9fa	Oseba-read	Oseba - branje	f
00030000-5625-0c8c-e948-6a375519bb19	Oseba-write	Oseba - spreminjanje	f
00030000-5625-0c8c-ea4c-9fd84086bd06	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5625-0c8c-c16a-220f622f83ae	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5625-0c8c-f864-3f2e8394cc42	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5625-0c8c-c7e6-2c1211ad24c0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5625-0c8c-1468-2e6c804606df	Pogodba-read	Pogodba - branje	f
00030000-5625-0c8c-13a6-1ac5a34ea7b6	Pogodba-write	Pogodba - spreminjanje	f
00030000-5625-0c8c-7c46-399791e864a3	Popa-read	Popa - branje	f
00030000-5625-0c8c-b50f-ce371db4c822	Popa-write	Popa - spreminjanje	f
00030000-5625-0c8c-2ad3-3464472225e7	Posta-read	Posta - branje	f
00030000-5625-0c8c-11d6-7be8e64305e6	Posta-write	Posta - spreminjanje	f
00030000-5625-0c8c-5f32-0266ce273e32	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5625-0c8c-efcd-b2fbd9c6fa5f	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5625-0c8c-e089-e1063de04b9a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5625-0c8c-8fb8-bfacb587ca27	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5625-0c8c-cbf6-02eb0a0224d9	PostniNaslov-read	PostniNaslov - branje	f
00030000-5625-0c8c-c2e9-3b240db173d3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5625-0c8c-3218-14b84c06369d	Predstava-read	Predstava - branje	f
00030000-5625-0c8c-2d41-b2c860208e49	Predstava-write	Predstava - spreminjanje	f
00030000-5625-0c8c-ce63-7782aa2a9ef7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5625-0c8c-b80b-9da40c0770b9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5625-0c8c-dc34-01a783ad8479	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5625-0c8c-3625-9e71afd0934a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5625-0c8c-6160-38244aafbb29	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5625-0c8c-7e36-0303b92d96d4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5625-0c8c-e3e7-3861efc5de7c	ProgramDela-read	ProgramDela - branje	f
00030000-5625-0c8c-a120-fbff6c00fa37	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5625-0c8c-0049-90f7f0481a7d	ProgramFestival-read	ProgramFestival - branje	f
00030000-5625-0c8c-8df0-8b5a8731b361	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5625-0c8c-2b3a-d541528bad4c	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5625-0c8c-b3ca-ba87bbdb0aa7	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5625-0c8c-4e33-190a52741926	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5625-0c8c-01ab-735f32a87f12	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5625-0c8c-cbd0-89fb3f133394	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5625-0c8c-ea66-fe9dff25521b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5625-0c8c-37fa-b58fdebaa77f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5625-0c8c-5a29-d6c981e3c15b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5625-0c8c-5601-f1ee4335772b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5625-0c8c-f4d5-211980064868	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5625-0c8c-5577-f173d67a5cbb	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5625-0c8c-6aa7-93f2527e6f30	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5625-0c8c-9c65-73c4d3984837	ProgramRazno-read	ProgramRazno - branje	f
00030000-5625-0c8c-b100-5fb27a3efb4e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5625-0c8c-361f-36297a4aca73	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5625-0c8c-ffa7-ee3fbcabbe42	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5625-0c8c-8059-c6ff8e30115b	Prostor-read	Prostor - branje	f
00030000-5625-0c8c-3949-02ba5da482f5	Prostor-write	Prostor - spreminjanje	f
00030000-5625-0c8c-dd90-c752186c723f	Racun-read	Racun - branje	f
00030000-5625-0c8c-6b7b-f8dd0876885e	Racun-write	Racun - spreminjanje	f
00030000-5625-0c8c-2c84-fedcc11ce792	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5625-0c8c-3f15-7e7d35d27693	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5625-0c8c-b7d6-8bbd5a4faa02	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5625-0c8c-b1ec-d501b94c73b5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5625-0c8c-2ccc-efcc2de666a6	Rekvizit-read	Rekvizit - branje	f
00030000-5625-0c8c-50fe-dc0133e8e799	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5625-0c8c-79ab-71dfdfb766c8	Revizija-read	Revizija - branje	f
00030000-5625-0c8c-0eb6-4390db070be8	Revizija-write	Revizija - spreminjanje	f
00030000-5625-0c8c-4741-42eb95d2112f	Rezervacija-read	Rezervacija - branje	f
00030000-5625-0c8c-935b-cae2c1c2fa04	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5625-0c8c-f8f0-e40e79813af6	SedezniRed-read	SedezniRed - branje	f
00030000-5625-0c8c-dfc8-e67db8b401d1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5625-0c8c-901e-e37d396d1174	Sedez-read	Sedez - branje	f
00030000-5625-0c8c-88d9-ca8478097f03	Sedez-write	Sedez - spreminjanje	f
00030000-5625-0c8c-a6b8-72fa6c603c3b	Sezona-read	Sezona - branje	f
00030000-5625-0c8c-97ef-496467c8a58c	Sezona-write	Sezona - spreminjanje	f
00030000-5625-0c8c-23d9-78d0577913d2	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5625-0c8c-c924-849df98b32a8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5625-0c8c-f51f-e2db2e234e6a	Stevilcenje-read	Stevilcenje - branje	f
00030000-5625-0c8c-36db-6161b394d29d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5625-0c8c-76e8-a79a6f247e5d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5625-0c8c-a553-46a5e284bb23	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5625-0c8c-d541-09e723e8499e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5625-0c8c-56fe-f681e94b5907	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5625-0c8c-a886-a47b597e68f9	Telefonska-read	Telefonska - branje	f
00030000-5625-0c8c-88bb-1a4db826cf26	Telefonska-write	Telefonska - spreminjanje	f
00030000-5625-0c8c-e1f2-4cb4a17c246e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5625-0c8c-33fb-0c98fcc3c70a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5625-0c8c-3a2b-b3f7a71c8f06	TipFunkcije-read	TipFunkcije - branje	f
00030000-5625-0c8c-2eb2-59b5d7f79316	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5625-0c8c-fdbc-3af7ca7208f9	TipPopa-read	TipPopa - branje	f
00030000-5625-0c8c-eca4-b64c1b6ed51e	TipPopa-write	TipPopa - spreminjanje	f
00030000-5625-0c8c-43d6-8d258f1dbf96	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5625-0c8c-28ff-755e76676d02	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5625-0c8c-80c2-8af3ce6c3a75	TipVaje-read	TipVaje - branje	f
00030000-5625-0c8c-642b-dd1b97f4b1ed	TipVaje-write	TipVaje - spreminjanje	f
00030000-5625-0c8c-9149-7cc68f1cfd47	Trr-read	Trr - branje	f
00030000-5625-0c8c-7892-f0a0e085e94d	Trr-write	Trr - spreminjanje	f
00030000-5625-0c8c-b2cf-235c9c4796bb	Uprizoritev-read	Uprizoritev - branje	f
00030000-5625-0c8c-b5e9-98604ff54b54	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5625-0c8c-30ad-97922dc10f4c	Vaja-read	Vaja - branje	f
00030000-5625-0c8c-415c-f95c8f4da537	Vaja-write	Vaja - spreminjanje	f
00030000-5625-0c8c-6d32-a95f32f08183	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5625-0c8c-e566-ee432cf2eb8e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5625-0c8c-6a50-ace7480e258b	VrstaStroska-read	VrstaStroska - branje	f
00030000-5625-0c8c-2f68-e5ccacfb639f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5625-0c8c-3a73-e86bc68cd475	Zaposlitev-read	Zaposlitev - branje	f
00030000-5625-0c8c-317b-1e00073e2d1a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5625-0c8c-fbb2-968689a04b76	Zasedenost-read	Zasedenost - branje	f
00030000-5625-0c8c-77fb-b9663a11f973	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5625-0c8c-d75e-fbbd408c16e2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5625-0c8c-cb1d-dfbba56a49c1	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5625-0c8c-4d07-d82112f0f5ff	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5625-0c8c-be3c-28f30d2b6fca	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5625-0c8c-f6b2-91c98e616277	Job-read	Branje opravil - samo zase - branje	f
00030000-5625-0c8c-3ad4-e637242d4def	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5625-0c8c-9563-e6384c278644	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5625-0c8c-db3b-af0a53b72d27	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5625-0c8c-c1d1-082db5ce27cd	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5625-0c8c-9c5e-a5a90263b77b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5625-0c8c-86f6-7cbdd196f457	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5625-0c8c-8723-306a63928592	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5625-0c8c-a3e7-2bc35e2bbabe	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5625-0c8c-acb4-c8958790f32c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5625-0c8c-c035-e786aea1598c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5625-0c8c-bb1b-00a082a9c903	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5625-0c8c-497c-66902a0e7204	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5625-0c8c-0c18-5646e3f51dfb	Datoteka-write	Datoteka - spreminjanje	f
00030000-5625-0c8c-98df-c5d6e23148db	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3055 (class 0 OID 22658193)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5625-0c8c-5284-320d7e69ac43	00030000-5625-0c8c-1de8-56f8cdd8a8cb
00020000-5625-0c8c-05ba-99190187f07b	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-dc75-4bf4d3526f90
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-4291-06e09873baa7
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-d38f-2eecd431e0cd
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-4454-7432bef97be8
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-a19c-0d6d460262ae
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-a2db-12d4c05195c8
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-c5a2-bc880000115f
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-2aa0-0ab32d93655f
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-0726-baa01c8c1b79
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-f139-ad32a80ebf70
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-d57a-04f40832955f
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-7f74-ab6fbbea3699
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-6345-196909eddac5
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-27b9-c5a6f975ef6f
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-1dda-0ea972abac05
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-06a3-f6fa923752eb
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-feff-c016642fc5ac
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-2bf1-73d8b832cba6
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-ec10-d6bf39712324
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-74bb-0c200b7dd9fa
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-e948-6a375519bb19
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-7c46-399791e864a3
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-b50f-ce371db4c822
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-2ad3-3464472225e7
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-11d6-7be8e64305e6
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-cbf6-02eb0a0224d9
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-c2e9-3b240db173d3
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-3218-14b84c06369d
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-2d41-b2c860208e49
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-6160-38244aafbb29
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-7e36-0303b92d96d4
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-8059-c6ff8e30115b
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-3949-02ba5da482f5
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-b7d6-8bbd5a4faa02
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-b1ec-d501b94c73b5
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-2ccc-efcc2de666a6
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-50fe-dc0133e8e799
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-a6b8-72fa6c603c3b
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-97ef-496467c8a58c
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-3a2b-b3f7a71c8f06
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-b2cf-235c9c4796bb
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-b5e9-98604ff54b54
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-30ad-97922dc10f4c
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-415c-f95c8f4da537
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-fbb2-968689a04b76
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-77fb-b9663a11f973
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-d75e-fbbd408c16e2
00020000-5625-0c8c-fdbf-4eabaf64f18c	00030000-5625-0c8c-4d07-d82112f0f5ff
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-dc75-4bf4d3526f90
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-a19c-0d6d460262ae
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-a2db-12d4c05195c8
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-7f74-ab6fbbea3699
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-27b9-c5a6f975ef6f
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-06a3-f6fa923752eb
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-feff-c016642fc5ac
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-2bf1-73d8b832cba6
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-ec10-d6bf39712324
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-74bb-0c200b7dd9fa
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-e948-6a375519bb19
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-7c46-399791e864a3
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-2ad3-3464472225e7
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-cbf6-02eb0a0224d9
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-c2e9-3b240db173d3
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-3218-14b84c06369d
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-8059-c6ff8e30115b
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-b7d6-8bbd5a4faa02
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-2ccc-efcc2de666a6
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-a6b8-72fa6c603c3b
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-a886-a47b597e68f9
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-88bb-1a4db826cf26
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-9149-7cc68f1cfd47
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-7892-f0a0e085e94d
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-3a73-e86bc68cd475
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-317b-1e00073e2d1a
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-d75e-fbbd408c16e2
00020000-5625-0c8c-aee7-6e7b814e8362	00030000-5625-0c8c-4d07-d82112f0f5ff
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-dc75-4bf4d3526f90
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-d38f-2eecd431e0cd
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-a19c-0d6d460262ae
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-be39-e54d2c4238ce
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-0f23-b729741a1bad
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-8de1-77332b6cc0e3
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-a2db-12d4c05195c8
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-f139-ad32a80ebf70
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-7f74-ab6fbbea3699
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-27b9-c5a6f975ef6f
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-06a3-f6fa923752eb
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-2bf1-73d8b832cba6
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-ec10-d6bf39712324
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-74bb-0c200b7dd9fa
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-7c46-399791e864a3
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-2ad3-3464472225e7
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-3218-14b84c06369d
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-6160-38244aafbb29
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-8059-c6ff8e30115b
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-b7d6-8bbd5a4faa02
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-2ccc-efcc2de666a6
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-a6b8-72fa6c603c3b
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-3a2b-b3f7a71c8f06
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-30ad-97922dc10f4c
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-fbb2-968689a04b76
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-d75e-fbbd408c16e2
00020000-5625-0c8c-0a44-19a341a91e14	00030000-5625-0c8c-4d07-d82112f0f5ff
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-dc75-4bf4d3526f90
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-4291-06e09873baa7
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-4454-7432bef97be8
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-a19c-0d6d460262ae
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-a2db-12d4c05195c8
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-7f74-ab6fbbea3699
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-27b9-c5a6f975ef6f
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-2bf1-73d8b832cba6
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-ec10-d6bf39712324
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-7c46-399791e864a3
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-2ad3-3464472225e7
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-3218-14b84c06369d
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-8059-c6ff8e30115b
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-b7d6-8bbd5a4faa02
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-2ccc-efcc2de666a6
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-a6b8-72fa6c603c3b
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-3a2b-b3f7a71c8f06
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-d75e-fbbd408c16e2
00020000-5625-0c8c-fc3e-af764cb467de	00030000-5625-0c8c-4d07-d82112f0f5ff
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-dc75-4bf4d3526f90
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-a19c-0d6d460262ae
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-a2db-12d4c05195c8
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-7f74-ab6fbbea3699
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-27b9-c5a6f975ef6f
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-2bf1-73d8b832cba6
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-ec10-d6bf39712324
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-7c46-399791e864a3
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-2ad3-3464472225e7
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-3218-14b84c06369d
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-8059-c6ff8e30115b
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-b7d6-8bbd5a4faa02
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-2ccc-efcc2de666a6
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-a6b8-72fa6c603c3b
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-e1f2-4cb4a17c246e
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-a4f1-2168575f6c2b
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-3a2b-b3f7a71c8f06
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-d75e-fbbd408c16e2
00020000-5625-0c8c-899d-ac581bcc5fbc	00030000-5625-0c8c-4d07-d82112f0f5ff
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4f64-b130277b35cf
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-1de8-56f8cdd8a8cb
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a4f1-2168575f6c2b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-c5a2-bc880000115f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-da1d-31eae3bc42f2
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-921b-3ab00496ff4e
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-147e-fdfb1be351bb
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-dc75-4bf4d3526f90
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4291-06e09873baa7
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-d38f-2eecd431e0cd
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4454-7432bef97be8
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a19c-0d6d460262ae
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-be39-e54d2c4238ce
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-0f23-b729741a1bad
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4c3f-919d4f80668d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-8de1-77332b6cc0e3
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3262-561b495007fe
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a2db-12d4c05195c8
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2aa0-0ab32d93655f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-7a08-d579d1aab589
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-0726-baa01c8c1b79
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-7d85-9b55d3a6a05d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-bec5-4b624e342157
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-ae16-a829904170df
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a599-6c472c692f15
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-f139-ad32a80ebf70
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-d57a-04f40832955f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-7f74-ab6fbbea3699
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-6345-196909eddac5
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-27b9-c5a6f975ef6f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-1dda-0ea972abac05
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-06a3-f6fa923752eb
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-feff-c016642fc5ac
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-fc02-916c39d0620c
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-c32b-11c057e3ce24
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-1fba-668b7bbd4907
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-0d1a-fbac545680bf
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2bf1-73d8b832cba6
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4eb8-e9127c6815ca
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-ec10-d6bf39712324
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-f3f8-aa44fe07f0f8
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-74bb-0c200b7dd9fa
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-e948-6a375519bb19
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-ea4c-9fd84086bd06
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-c16a-220f622f83ae
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-f864-3f2e8394cc42
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-c7e6-2c1211ad24c0
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-1468-2e6c804606df
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-13a6-1ac5a34ea7b6
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-7c46-399791e864a3
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b50f-ce371db4c822
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2ad3-3464472225e7
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-11d6-7be8e64305e6
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-5f32-0266ce273e32
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-efcd-b2fbd9c6fa5f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-e089-e1063de04b9a
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-8fb8-bfacb587ca27
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-cbf6-02eb0a0224d9
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-c2e9-3b240db173d3
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3218-14b84c06369d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2d41-b2c860208e49
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-ce63-7782aa2a9ef7
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b80b-9da40c0770b9
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-dc34-01a783ad8479
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3625-9e71afd0934a
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-6160-38244aafbb29
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-7e36-0303b92d96d4
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-e3e7-3861efc5de7c
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a120-fbff6c00fa37
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-0049-90f7f0481a7d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-8df0-8b5a8731b361
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2b3a-d541528bad4c
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b3ca-ba87bbdb0aa7
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4e33-190a52741926
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-01ab-735f32a87f12
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-cbd0-89fb3f133394
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-ea66-fe9dff25521b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-37fa-b58fdebaa77f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-5a29-d6c981e3c15b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-5601-f1ee4335772b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-f4d5-211980064868
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-5577-f173d67a5cbb
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-6aa7-93f2527e6f30
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-9c65-73c4d3984837
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b100-5fb27a3efb4e
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-361f-36297a4aca73
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-ffa7-ee3fbcabbe42
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-8059-c6ff8e30115b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3949-02ba5da482f5
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-dd90-c752186c723f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-6b7b-f8dd0876885e
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2c84-fedcc11ce792
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3f15-7e7d35d27693
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b7d6-8bbd5a4faa02
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b1ec-d501b94c73b5
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2ccc-efcc2de666a6
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-50fe-dc0133e8e799
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-79ab-71dfdfb766c8
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-0eb6-4390db070be8
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4741-42eb95d2112f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-935b-cae2c1c2fa04
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-f8f0-e40e79813af6
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-dfc8-e67db8b401d1
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-901e-e37d396d1174
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-88d9-ca8478097f03
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a6b8-72fa6c603c3b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-97ef-496467c8a58c
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-23d9-78d0577913d2
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-c924-849df98b32a8
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-f51f-e2db2e234e6a
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-36db-6161b394d29d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-76e8-a79a6f247e5d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a553-46a5e284bb23
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-d541-09e723e8499e
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-56fe-f681e94b5907
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-a886-a47b597e68f9
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-88bb-1a4db826cf26
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-e1f2-4cb4a17c246e
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-33fb-0c98fcc3c70a
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3a2b-b3f7a71c8f06
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2eb2-59b5d7f79316
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-43d6-8d258f1dbf96
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-28ff-755e76676d02
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-9149-7cc68f1cfd47
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-7892-f0a0e085e94d
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b2cf-235c9c4796bb
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-b5e9-98604ff54b54
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-30ad-97922dc10f4c
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-415c-f95c8f4da537
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-6d32-a95f32f08183
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-e566-ee432cf2eb8e
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-6a50-ace7480e258b
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-2f68-e5ccacfb639f
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-3a73-e86bc68cd475
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-317b-1e00073e2d1a
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-fbb2-968689a04b76
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-77fb-b9663a11f973
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-d75e-fbbd408c16e2
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-cb1d-dfbba56a49c1
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-4d07-d82112f0f5ff
00020000-5625-0c8e-929e-2e2dc60e7534	00030000-5625-0c8c-be3c-28f30d2b6fca
\.


--
-- TOC entry 3088 (class 0 OID 22658558)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22658592)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22658729)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5625-0c8e-0d56-f3b27f4dc913	00090000-5625-0c8e-e1e6-ba372200a4a8	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5625-0c8e-61c4-889788ff11ac	00090000-5625-0c8e-9c51-52493a851941	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5625-0c8e-5b67-e84c71d47093	00090000-5625-0c8e-e27f-a309b188b52f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5625-0c8e-7849-f5e23f873ee2	00090000-5625-0c8e-9b2d-bd8245ae7d42	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3061 (class 0 OID 22658263)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5625-0c8e-b268-789929fd3bce	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-1dc7-5e9dd9e3ff54	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5625-0c8e-3718-ea2ac0e03bab	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-cc6f-713498462ed3	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-7c21-38ac4a5f181e	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-78e2-bb067f571505	\N	00040000-5625-0c8c-3ab2-da8344bb12aa	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-4199-e9813c8a722a	\N	00040000-5625-0c8c-1078-dcd0806eb848	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-b613-3865b9b9410d	\N	00040000-5625-0c8c-14ac-1ef18ced996e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8e-bf27-4d28fc109521	\N	00040000-5625-0c8c-4297-15a2cdb99c00	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5625-0c8f-0c50-615814b342f3	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3064 (class 0 OID 22658309)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5625-0c8b-8eca-41a8bf1510c2	8341	Adlešiči
00050000-5625-0c8b-9665-7cc6c0a1ae19	5270	Ajdovščina
00050000-5625-0c8b-de7b-ea4991401ca9	6280	Ankaran/Ancarano
00050000-5625-0c8b-a7a6-548dbb6f45d3	9253	Apače
00050000-5625-0c8b-dc7a-dfd4b146e0ae	8253	Artiče
00050000-5625-0c8b-5200-b80b408a2703	4275	Begunje na Gorenjskem
00050000-5625-0c8b-5ec2-044dd87f0b14	1382	Begunje pri Cerknici
00050000-5625-0c8b-34dd-f4e0d9c867d1	9231	Beltinci
00050000-5625-0c8b-f7b1-d7562f35a193	2234	Benedikt
00050000-5625-0c8b-dd29-d01ae285a736	2345	Bistrica ob Dravi
00050000-5625-0c8b-8281-df1cbd1d5c65	3256	Bistrica ob Sotli
00050000-5625-0c8b-6eb0-22cc37ad459e	8259	Bizeljsko
00050000-5625-0c8b-f2f1-861fd63805f2	1223	Blagovica
00050000-5625-0c8b-e4b5-25526e88e289	8283	Blanca
00050000-5625-0c8b-7a07-e84114eb5d26	4260	Bled
00050000-5625-0c8b-170a-86ab7bbd9480	4273	Blejska Dobrava
00050000-5625-0c8b-4e01-9ec28840b995	9265	Bodonci
00050000-5625-0c8b-19e7-5f380c3086dc	9222	Bogojina
00050000-5625-0c8b-4eb2-7461d69582aa	4263	Bohinjska Bela
00050000-5625-0c8b-6c1f-da3286e9017c	4264	Bohinjska Bistrica
00050000-5625-0c8b-b6f1-db0111c272f1	4265	Bohinjsko jezero
00050000-5625-0c8b-25fb-8d0e5863ae26	1353	Borovnica
00050000-5625-0c8b-5d16-54b257485fb2	8294	Boštanj
00050000-5625-0c8b-2597-009b76e51b18	5230	Bovec
00050000-5625-0c8b-6547-8754575b0d2d	5295	Branik
00050000-5625-0c8b-baad-7793e2953bcc	3314	Braslovče
00050000-5625-0c8b-4449-27fba75b9ddb	5223	Breginj
00050000-5625-0c8b-8822-34ada642e156	8280	Brestanica
00050000-5625-0c8b-8823-4e52419fd270	2354	Bresternica
00050000-5625-0c8b-d639-4065cd793131	4243	Brezje
00050000-5625-0c8b-b37b-32dc5b4fae6d	1351	Brezovica pri Ljubljani
00050000-5625-0c8b-46a8-f29fedd5f91b	8250	Brežice
00050000-5625-0c8b-17be-f695ec60265a	4210	Brnik - Aerodrom
00050000-5625-0c8b-808c-e2a89dc61db1	8321	Brusnice
00050000-5625-0c8b-84d2-c3879fbe8e9a	3255	Buče
00050000-5625-0c8b-18a4-c40761988440	8276	Bučka 
00050000-5625-0c8b-2139-0f17eb233354	9261	Cankova
00050000-5625-0c8b-0d50-11befcce77d0	3000	Celje 
00050000-5625-0c8b-8525-68aba4490cf3	3001	Celje - poštni predali
00050000-5625-0c8b-86b1-811d4d03aa2a	4207	Cerklje na Gorenjskem
00050000-5625-0c8b-e7aa-71e0bcdab199	8263	Cerklje ob Krki
00050000-5625-0c8b-00c1-f1a0f1ce397e	1380	Cerknica
00050000-5625-0c8b-c609-84f22eba9974	5282	Cerkno
00050000-5625-0c8b-8c8e-f0fc1fa30461	2236	Cerkvenjak
00050000-5625-0c8b-2ae9-a19e099b7630	2215	Ceršak
00050000-5625-0c8b-e9fd-c81df5a7107e	2326	Cirkovce
00050000-5625-0c8b-8af4-ecb79ca4b2c1	2282	Cirkulane
00050000-5625-0c8b-fa92-451edeeaa042	5273	Col
00050000-5625-0c8b-0e4d-4f44638a223a	8251	Čatež ob Savi
00050000-5625-0c8b-ce8f-6ee06d702469	1413	Čemšenik
00050000-5625-0c8b-362d-b817f8a58001	5253	Čepovan
00050000-5625-0c8b-48b8-0c7199e7689b	9232	Črenšovci
00050000-5625-0c8b-8c90-acec14fd90e9	2393	Črna na Koroškem
00050000-5625-0c8b-3dd0-b5beb8573841	6275	Črni Kal
00050000-5625-0c8b-e5bf-83134ec69196	5274	Črni Vrh nad Idrijo
00050000-5625-0c8b-fbdf-f06a7957a1c2	5262	Črniče
00050000-5625-0c8b-821b-c539a1ef6e67	8340	Črnomelj
00050000-5625-0c8b-fab4-583b9c02e784	6271	Dekani
00050000-5625-0c8b-ef70-13960d1aa478	5210	Deskle
00050000-5625-0c8b-2fbb-4b69e1cc7121	2253	Destrnik
00050000-5625-0c8b-7f38-2aeba6f03ee2	6215	Divača
00050000-5625-0c8b-cadc-60cd22406ace	1233	Dob
00050000-5625-0c8b-b946-1761fbc5da5b	3224	Dobje pri Planini
00050000-5625-0c8b-46e2-5cee6be154f5	8257	Dobova
00050000-5625-0c8b-a2c0-eb4dac1673fd	1423	Dobovec
00050000-5625-0c8b-5993-b2ab668f01b0	5263	Dobravlje
00050000-5625-0c8b-8b10-6c5d7b102933	3204	Dobrna
00050000-5625-0c8b-976b-ecfdfeb248ed	8211	Dobrnič
00050000-5625-0c8b-7e7d-764dbfb0e3e1	1356	Dobrova
00050000-5625-0c8b-f132-afc838d46070	9223	Dobrovnik/Dobronak 
00050000-5625-0c8b-59c6-833d3ec1cc3f	5212	Dobrovo v Brdih
00050000-5625-0c8b-6c87-bedc56204eab	1431	Dol pri Hrastniku
00050000-5625-0c8b-06a8-3ecb503c59a0	1262	Dol pri Ljubljani
00050000-5625-0c8b-b623-821cfcb603af	1273	Dole pri Litiji
00050000-5625-0c8b-14f5-b181584acc64	1331	Dolenja vas
00050000-5625-0c8b-862e-793186cad133	8350	Dolenjske Toplice
00050000-5625-0c8b-3f9e-2b1e42ef8e06	1230	Domžale
00050000-5625-0c8b-1590-2198812af1c8	2252	Dornava
00050000-5625-0c8b-da2c-b9cd5790a69f	5294	Dornberk
00050000-5625-0c8b-74a2-cb2c5dc51119	1319	Draga
00050000-5625-0c8b-6e96-156f56ecd4ca	8343	Dragatuš
00050000-5625-0c8b-b10a-7cf5f8ef4716	3222	Dramlje
00050000-5625-0c8b-ceb0-975a7a762a9f	2370	Dravograd
00050000-5625-0c8b-33cd-7185fee4934f	4203	Duplje
00050000-5625-0c8b-bdf4-e6f49e877e74	6221	Dutovlje
00050000-5625-0c8b-fe6a-b272ca0e73b8	8361	Dvor
00050000-5625-0c8b-12c8-a77c573cf20e	2343	Fala
00050000-5625-0c8b-d02b-e02e5d9f1ed1	9208	Fokovci
00050000-5625-0c8b-d566-dd85eff81f3d	2313	Fram
00050000-5625-0c8b-5d04-519e2b003866	3213	Frankolovo
00050000-5625-0c8b-90b1-fe34af2cd5ff	1274	Gabrovka
00050000-5625-0c8b-66e5-b8da4c11cc5f	8254	Globoko
00050000-5625-0c8b-3c8b-51b568185926	5275	Godovič
00050000-5625-0c8b-7889-9d29c6a4c797	4204	Golnik
00050000-5625-0c8b-ff0a-becdcb0cdef6	3303	Gomilsko
00050000-5625-0c8b-1e67-fd50958df127	4224	Gorenja vas
00050000-5625-0c8b-5d19-8a4f0a963aa6	3263	Gorica pri Slivnici
00050000-5625-0c8b-5f8a-06f587b56f48	2272	Gorišnica
00050000-5625-0c8b-0824-176ebde70aaa	9250	Gornja Radgona
00050000-5625-0c8b-8fba-3d6b94c723ca	3342	Gornji Grad
00050000-5625-0c8b-32b2-63e0f0d38a10	4282	Gozd Martuljek
00050000-5625-0c8b-5e57-7fefc4647ab2	6272	Gračišče
00050000-5625-0c8b-d30f-b43fbc718941	9264	Grad
00050000-5625-0c8b-dd4e-be8b8f213405	8332	Gradac
00050000-5625-0c8b-5c1b-4ce644ed3250	1384	Grahovo
00050000-5625-0c8b-0d86-aaafd3bf520a	5242	Grahovo ob Bači
00050000-5625-0c8b-19f4-84e7637dde4c	5251	Grgar
00050000-5625-0c8b-8f44-bbcf519624fd	3302	Griže
00050000-5625-0c8b-4ae5-6f3c6520de9b	3231	Grobelno
00050000-5625-0c8b-2a73-78a10c97624d	1290	Grosuplje
00050000-5625-0c8b-1f33-a3d052dba42b	2288	Hajdina
00050000-5625-0c8b-828e-a96c40a8f0c0	8362	Hinje
00050000-5625-0c8b-7169-f782b6de2f06	2311	Hoče
00050000-5625-0c8b-a45d-01aa472ffc27	9205	Hodoš/Hodos
00050000-5625-0c8b-11b7-8c95662c2bc3	1354	Horjul
00050000-5625-0c8b-c1a5-89cdfc3039ac	1372	Hotedršica
00050000-5625-0c8b-d5b4-ebb4779b78a2	1430	Hrastnik
00050000-5625-0c8b-eb6f-9ba9a7d48929	6225	Hruševje
00050000-5625-0c8b-29a6-af4a7853a0b2	4276	Hrušica
00050000-5625-0c8b-3818-3148dc2d9cd7	5280	Idrija
00050000-5625-0c8b-bf63-14f2456c3138	1292	Ig
00050000-5625-0c8b-ad4c-0e3cadf8f297	6250	Ilirska Bistrica
00050000-5625-0c8b-0ba7-40e02e09e453	6251	Ilirska Bistrica-Trnovo
00050000-5625-0c8b-3871-7f2b5e9bf6d7	1295	Ivančna Gorica
00050000-5625-0c8b-edc8-35097259f53d	2259	Ivanjkovci
00050000-5625-0c8b-450d-205c8f8afa5b	1411	Izlake
00050000-5625-0c8b-e726-225a62c2f1c9	6310	Izola/Isola
00050000-5625-0c8b-adcf-96e24cd5846f	2222	Jakobski Dol
00050000-5625-0c8b-f941-860e189976cb	2221	Jarenina
00050000-5625-0c8b-fc76-e44406a8c3db	6254	Jelšane
00050000-5625-0c8b-cdf3-1389f9952510	4270	Jesenice
00050000-5625-0c8b-6645-2c3b32ffa105	8261	Jesenice na Dolenjskem
00050000-5625-0c8b-40da-e22849b6bfa3	3273	Jurklošter
00050000-5625-0c8b-a1b4-9e1ad372fb61	2223	Jurovski Dol
00050000-5625-0c8b-9d57-c059c6c312cc	2256	Juršinci
00050000-5625-0c8b-2caa-5b106f61da67	5214	Kal nad Kanalom
00050000-5625-0c8b-a0b5-74c21848218f	3233	Kalobje
00050000-5625-0c8b-0f17-5c5e92d66e57	4246	Kamna Gorica
00050000-5625-0c8b-f3b6-13437465a3da	2351	Kamnica
00050000-5625-0c8b-2aed-3ddeb3dde57e	1241	Kamnik
00050000-5625-0c8b-3c34-7f15bc5779a3	5213	Kanal
00050000-5625-0c8b-6d81-46a18730054a	8258	Kapele
00050000-5625-0c8b-f6a9-414f5bf44af8	2362	Kapla
00050000-5625-0c8b-6c5e-29b4e011d0c3	2325	Kidričevo
00050000-5625-0c8b-8779-a9f35ba01754	1412	Kisovec
00050000-5625-0c8b-46a7-32921d46ed42	6253	Knežak
00050000-5625-0c8b-9cbb-04ecef317e5d	5222	Kobarid
00050000-5625-0c8b-8c21-44ce78a16127	9227	Kobilje
00050000-5625-0c8b-87a4-b5325223e927	1330	Kočevje
00050000-5625-0c8b-1d08-d6bbb27f0f12	1338	Kočevska Reka
00050000-5625-0c8b-cd74-4aab641c5da9	2276	Kog
00050000-5625-0c8b-8911-7cafa305350c	5211	Kojsko
00050000-5625-0c8b-5221-c459b427e34e	6223	Komen
00050000-5625-0c8b-2924-f8c7635d5fa9	1218	Komenda
00050000-5625-0c8b-61ab-daf7f55d991b	6000	Koper/Capodistria 
00050000-5625-0c8b-eee9-bdd79e6b8b99	6001	Koper/Capodistria - poštni predali
00050000-5625-0c8b-217b-49bb5f26a0d8	8282	Koprivnica
00050000-5625-0c8b-1960-0b691742ca10	5296	Kostanjevica na Krasu
00050000-5625-0c8b-b114-98fd2218bcc2	8311	Kostanjevica na Krki
00050000-5625-0c8b-8b78-3627200abf29	1336	Kostel
00050000-5625-0c8b-0819-20390aef0960	6256	Košana
00050000-5625-0c8b-9ced-5a877bf22af1	2394	Kotlje
00050000-5625-0c8b-f266-56ccbbb238e6	6240	Kozina
00050000-5625-0c8b-23c1-a7eed0752706	3260	Kozje
00050000-5625-0c8b-2293-3e59aa2608fd	4000	Kranj 
00050000-5625-0c8b-6e95-97461a64cfee	4001	Kranj - poštni predali
00050000-5625-0c8b-4db5-80731e3fb963	4280	Kranjska Gora
00050000-5625-0c8b-7f58-8041767d9acf	1281	Kresnice
00050000-5625-0c8b-b5bc-59454d69041b	4294	Križe
00050000-5625-0c8b-5c71-ab8965344deb	9206	Križevci
00050000-5625-0c8b-5980-cac3dfe0ced1	9242	Križevci pri Ljutomeru
00050000-5625-0c8b-caab-953cc2ff943b	1301	Krka
00050000-5625-0c8b-4904-545eada81af0	8296	Krmelj
00050000-5625-0c8b-e12b-cc934cf90d58	4245	Kropa
00050000-5625-0c8b-ad84-f44dadaf77a4	8262	Krška vas
00050000-5625-0c8b-4419-6be447efc8cc	8270	Krško
00050000-5625-0c8b-90a1-5fff3309c851	9263	Kuzma
00050000-5625-0c8b-ebb8-926298a44ce7	2318	Laporje
00050000-5625-0c8b-59c2-e6a66c39070b	3270	Laško
00050000-5625-0c8b-7c8d-1e72f5b8ae3b	1219	Laze v Tuhinju
00050000-5625-0c8b-ce5c-616e6dc0dcfc	2230	Lenart v Slovenskih goricah
00050000-5625-0c8b-95a3-4159c653d804	9220	Lendava/Lendva
00050000-5625-0c8b-1dbf-0ad02998f7ca	4248	Lesce
00050000-5625-0c8b-cf36-995fd1f6a0e5	3261	Lesično
00050000-5625-0c8b-db11-69c2c784510f	8273	Leskovec pri Krškem
00050000-5625-0c8b-7993-01667ce7193d	2372	Libeliče
00050000-5625-0c8b-4b28-73944653d52c	2341	Limbuš
00050000-5625-0c8b-3938-586564969bc7	1270	Litija
00050000-5625-0c8b-eccf-458ab34e077d	3202	Ljubečna
00050000-5625-0c8b-8799-13ea22780370	1000	Ljubljana 
00050000-5625-0c8b-9268-84f575b559c2	1001	Ljubljana - poštni predali
00050000-5625-0c8b-2ba4-aaaeb1fda4ee	1231	Ljubljana - Črnuče
00050000-5625-0c8b-078d-b3c8682cdbc8	1261	Ljubljana - Dobrunje
00050000-5625-0c8b-c88d-453c858fed3a	1260	Ljubljana - Polje
00050000-5625-0c8b-0a16-026cf2c0d756	1210	Ljubljana - Šentvid
00050000-5625-0c8b-b944-dbdcf5a43fe5	1211	Ljubljana - Šmartno
00050000-5625-0c8b-0193-fb914847c129	3333	Ljubno ob Savinji
00050000-5625-0c8b-44ff-6da993461517	9240	Ljutomer
00050000-5625-0c8b-0193-38e756eacd62	3215	Loče
00050000-5625-0c8b-82f8-209290b64e49	5231	Log pod Mangartom
00050000-5625-0c8b-a32b-94e98f333d7f	1358	Log pri Brezovici
00050000-5625-0c8b-61b0-d25fc00e7fd0	1370	Logatec
00050000-5625-0c8b-7e60-5e0e328af32b	1371	Logatec
00050000-5625-0c8b-1252-517d6e933bb9	1434	Loka pri Zidanem Mostu
00050000-5625-0c8b-b32c-a03482d6fd6b	3223	Loka pri Žusmu
00050000-5625-0c8b-63ef-e04cb3b63d23	6219	Lokev
00050000-5625-0c8b-9ef4-2a981b679553	1318	Loški Potok
00050000-5625-0c8b-63c4-2b58423a2bb1	2324	Lovrenc na Dravskem polju
00050000-5625-0c8b-2416-2787647ee2b7	2344	Lovrenc na Pohorju
00050000-5625-0c8b-1b2d-248d1f1371ab	3334	Luče
00050000-5625-0c8b-206a-0dfd9c60df5d	1225	Lukovica
00050000-5625-0c8b-b68a-bc07c1add488	9202	Mačkovci
00050000-5625-0c8b-2de9-b36706ee922c	2322	Majšperk
00050000-5625-0c8b-94d4-12c5dafc08c7	2321	Makole
00050000-5625-0c8b-388c-f6dd79544da0	9243	Mala Nedelja
00050000-5625-0c8b-2c6b-97ee80d09f4e	2229	Malečnik
00050000-5625-0c8b-59fc-40388fb3f5e8	6273	Marezige
00050000-5625-0c8b-85f1-42256d89d32e	2000	Maribor 
00050000-5625-0c8b-de65-7f4f879a46ce	2001	Maribor - poštni predali
00050000-5625-0c8b-8528-7ecf75f5dcf6	2206	Marjeta na Dravskem polju
00050000-5625-0c8b-c373-73a176cac653	2281	Markovci
00050000-5625-0c8b-1141-80b7cff497ba	9221	Martjanci
00050000-5625-0c8b-3885-0a5fb1c23add	6242	Materija
00050000-5625-0c8b-a235-9e24c6903213	4211	Mavčiče
00050000-5625-0c8b-d021-c625d19d63e3	1215	Medvode
00050000-5625-0c8b-5bbf-fe89cd1897d8	1234	Mengeš
00050000-5625-0c8b-f009-255ae1f8c49b	8330	Metlika
00050000-5625-0c8b-ae20-a6182d418af4	2392	Mežica
00050000-5625-0c8b-3e0a-d91b817e1f4f	2204	Miklavž na Dravskem polju
00050000-5625-0c8b-a004-f4f80702d0b7	2275	Miklavž pri Ormožu
00050000-5625-0c8b-7f0a-02ed5b10b687	5291	Miren
00050000-5625-0c8b-5b7b-bfbccb4d1620	8233	Mirna
00050000-5625-0c8b-2432-fad9dfc6cce9	8216	Mirna Peč
00050000-5625-0c8b-815b-49d2c855cb54	2382	Mislinja
00050000-5625-0c8b-bb0b-2e19cbb5d716	4281	Mojstrana
00050000-5625-0c8b-db02-f8280750c278	8230	Mokronog
00050000-5625-0c8b-d933-b8f2903e7ab2	1251	Moravče
00050000-5625-0c8b-c1c4-61b66c7dc124	9226	Moravske Toplice
00050000-5625-0c8b-8c9e-d6d7d9b5c033	5216	Most na Soči
00050000-5625-0c8b-2f71-7cbeceb0e877	1221	Motnik
00050000-5625-0c8b-0eec-7a7bf795965b	3330	Mozirje
00050000-5625-0c8b-fcde-1a148341a7bb	9000	Murska Sobota 
00050000-5625-0c8b-9d2d-2f5f0b0ca4d8	9001	Murska Sobota - poštni predali
00050000-5625-0c8b-09e7-f7f3d203233b	2366	Muta
00050000-5625-0c8b-15fa-61538d9a6620	4202	Naklo
00050000-5625-0c8b-34d8-9906a9174b08	3331	Nazarje
00050000-5625-0c8b-c233-545189111e13	1357	Notranje Gorice
00050000-5625-0c8b-67a5-3b632b37bfc2	3203	Nova Cerkev
00050000-5625-0c8b-00e2-b1effd062eff	5000	Nova Gorica 
00050000-5625-0c8b-26a5-6b702cfbf910	5001	Nova Gorica - poštni predali
00050000-5625-0c8b-22d9-d47251d4a2fb	1385	Nova vas
00050000-5625-0c8b-943b-1d5980336d16	8000	Novo mesto
00050000-5625-0c8b-7c8f-5dd3523eaef8	8001	Novo mesto - poštni predali
00050000-5625-0c8b-b2fe-d5f699322c37	6243	Obrov
00050000-5625-0c8b-140b-30f6e464b85e	9233	Odranci
00050000-5625-0c8b-63b2-9b9bc196e03d	2317	Oplotnica
00050000-5625-0c8b-fecc-056856b6aaab	2312	Orehova vas
00050000-5625-0c8b-11b9-de1bf9677212	2270	Ormož
00050000-5625-0c8b-ea21-57c6b651cabe	1316	Ortnek
00050000-5625-0c8b-5e75-4629395ce620	1337	Osilnica
00050000-5625-0c8b-6c17-0774fd0f4414	8222	Otočec
00050000-5625-0c8b-95ee-3c3f95caef06	2361	Ožbalt
00050000-5625-0c8b-4175-727fb699bcae	2231	Pernica
00050000-5625-0c8b-673d-532a2a901693	2211	Pesnica pri Mariboru
00050000-5625-0c8b-1fb2-bccefbfc61bc	9203	Petrovci
00050000-5625-0c8b-9a42-c00aa676e41e	3301	Petrovče
00050000-5625-0c8b-5255-cf84910e1ee5	6330	Piran/Pirano
00050000-5625-0c8b-acb0-efe8396bb5a1	8255	Pišece
00050000-5625-0c8b-a08c-9b4c74d6f03b	6257	Pivka
00050000-5625-0c8b-6adc-4ae531c4767e	6232	Planina
00050000-5625-0c8b-352f-0b68c5ed070c	3225	Planina pri Sevnici
00050000-5625-0c8b-972e-0a1eea330b2d	6276	Pobegi
00050000-5625-0c8b-16d6-6043df5fc0ef	8312	Podbočje
00050000-5625-0c8b-c995-071e527dd75f	5243	Podbrdo
00050000-5625-0c8b-9c3a-a94dde035f67	3254	Podčetrtek
00050000-5625-0c8b-2ee1-dd79fe898439	2273	Podgorci
00050000-5625-0c8b-57fb-2b94461b6bb0	6216	Podgorje
00050000-5625-0c8b-5e94-27353bcf553c	2381	Podgorje pri Slovenj Gradcu
00050000-5625-0c8b-194d-a438db524796	6244	Podgrad
00050000-5625-0c8b-6b2b-a48d838fe8e1	1414	Podkum
00050000-5625-0c8b-6c1a-2c690a2308f9	2286	Podlehnik
00050000-5625-0c8b-f86d-dba9e9c4c624	5272	Podnanos
00050000-5625-0c8b-e98a-21659b98e1a0	4244	Podnart
00050000-5625-0c8b-2f1f-f4c8db13e7fd	3241	Podplat
00050000-5625-0c8b-3bc7-c7c08cfd7a5c	3257	Podsreda
00050000-5625-0c8b-4330-3d672524d9a5	2363	Podvelka
00050000-5625-0c8b-2753-fa61c3d13340	2208	Pohorje
00050000-5625-0c8b-db70-3ec88d72c1cc	2257	Polenšak
00050000-5625-0c8b-f314-7de29a51abb9	1355	Polhov Gradec
00050000-5625-0c8b-a0bc-cf65da854fd2	4223	Poljane nad Škofjo Loko
00050000-5625-0c8b-72db-f8934ec0a8b3	2319	Poljčane
00050000-5625-0c8b-19e3-f838831c9777	1272	Polšnik
00050000-5625-0c8b-e188-63f7f067fd56	3313	Polzela
00050000-5625-0c8b-7df7-650d33ca8bb4	3232	Ponikva
00050000-5625-0c8b-625f-6f6ea05962fa	6320	Portorož/Portorose
00050000-5625-0c8b-0832-97194d765e38	6230	Postojna
00050000-5625-0c8b-7775-36a0b731f16c	2331	Pragersko
00050000-5625-0c8b-f719-80b4c7e0f80a	3312	Prebold
00050000-5625-0c8b-0ff2-912e1be000f1	4205	Preddvor
00050000-5625-0c8b-5a98-c51c05988b70	6255	Prem
00050000-5625-0c8b-8952-82b695173d92	1352	Preserje
00050000-5625-0c8b-88b2-70a17b17dec6	6258	Prestranek
00050000-5625-0c8b-386c-eab5ed4493d2	2391	Prevalje
00050000-5625-0c8b-67df-bf13984df0e2	3262	Prevorje
00050000-5625-0c8b-5999-770d714c2391	1276	Primskovo 
00050000-5625-0c8b-f5d8-b5e54246610a	3253	Pristava pri Mestinju
00050000-5625-0c8b-5386-63f3ddbee804	9207	Prosenjakovci/Partosfalva
00050000-5625-0c8b-5e0c-2ffc7e34e16c	5297	Prvačina
00050000-5625-0c8b-69b8-f71394bbd210	2250	Ptuj
00050000-5625-0c8b-c256-6d33d1e96a1b	2323	Ptujska Gora
00050000-5625-0c8b-869e-229a20925f68	9201	Puconci
00050000-5625-0c8b-f550-5e902de23b21	2327	Rače
00050000-5625-0c8b-f886-c6fd55d2e931	1433	Radeče
00050000-5625-0c8b-2cac-e4e0d6e1a733	9252	Radenci
00050000-5625-0c8b-75ac-13e403a63595	2360	Radlje ob Dravi
00050000-5625-0c8b-eee1-fe542fa903f7	1235	Radomlje
00050000-5625-0c8b-8a69-d295c2321288	4240	Radovljica
00050000-5625-0c8b-9f1c-0841f7c68c4b	8274	Raka
00050000-5625-0c8b-a396-1983ab4ff865	1381	Rakek
00050000-5625-0c8b-3ea5-a0803fa54876	4283	Rateče - Planica
00050000-5625-0c8b-7b7b-3d570995c622	2390	Ravne na Koroškem
00050000-5625-0c8b-1d3e-83bc737ce248	9246	Razkrižje
00050000-5625-0c8b-9d10-1b8a16044f2e	3332	Rečica ob Savinji
00050000-5625-0c8b-c7d2-e66b24948bda	5292	Renče
00050000-5625-0c8b-fb8b-7cdf71995f37	1310	Ribnica
00050000-5625-0c8b-5ee7-e53b82cdd774	2364	Ribnica na Pohorju
00050000-5625-0c8b-41e2-aab3dd889f59	3272	Rimske Toplice
00050000-5625-0c8b-d9a8-82dfd018a335	1314	Rob
00050000-5625-0c8b-46e4-ba72992f94c0	5215	Ročinj
00050000-5625-0c8b-9179-031ae783aadf	3250	Rogaška Slatina
00050000-5625-0c8b-32c1-73ee9d70a0e1	9262	Rogašovci
00050000-5625-0c8b-40dc-af1ba04361f7	3252	Rogatec
00050000-5625-0c8b-c17f-9dc905de363d	1373	Rovte
00050000-5625-0c8b-7aeb-60d3d4f6d323	2342	Ruše
00050000-5625-0c8b-8528-54104f0e82de	1282	Sava
00050000-5625-0c8b-90b0-c6be4bd2e06c	6333	Sečovlje/Sicciole
00050000-5625-0c8b-3e7b-29f98202adf2	4227	Selca
00050000-5625-0c8b-528d-66c3ecfeac0a	2352	Selnica ob Dravi
00050000-5625-0c8b-5970-27e77628db36	8333	Semič
00050000-5625-0c8b-b5f8-7c5c34a28c20	8281	Senovo
00050000-5625-0c8b-fd6e-78633b001d61	6224	Senožeče
00050000-5625-0c8b-1c46-bd8f050adf89	8290	Sevnica
00050000-5625-0c8b-1b8a-fb774741f3a3	6210	Sežana
00050000-5625-0c8b-fc42-ccf38d4dfcc3	2214	Sladki Vrh
00050000-5625-0c8b-f5d1-e84391863659	5283	Slap ob Idrijci
00050000-5625-0c8b-3d25-472b1e2680af	2380	Slovenj Gradec
00050000-5625-0c8b-26fb-6357c636afb8	2310	Slovenska Bistrica
00050000-5625-0c8b-a270-f6ad5ff5a223	3210	Slovenske Konjice
00050000-5625-0c8b-79a5-3f3f91391c2f	1216	Smlednik
00050000-5625-0c8b-da55-3d12b7a5efc5	5232	Soča
00050000-5625-0c8b-2206-90e37efe1dae	1317	Sodražica
00050000-5625-0c8b-9952-0ba6aecf0bfe	3335	Solčava
00050000-5625-0c8b-909a-2d18c81ffcc1	5250	Solkan
00050000-5625-0c8b-76f0-2ec75756b14b	4229	Sorica
00050000-5625-0c8b-e2c1-dc07c408784a	4225	Sovodenj
00050000-5625-0c8b-b7a2-f98457c23b6b	5281	Spodnja Idrija
00050000-5625-0c8b-ea61-6b79c9344e2f	2241	Spodnji Duplek
00050000-5625-0c8b-b239-c82da4beae7a	9245	Spodnji Ivanjci
00050000-5625-0c8b-d8b4-3030e062e474	2277	Središče ob Dravi
00050000-5625-0c8b-da33-1a9478a6719a	4267	Srednja vas v Bohinju
00050000-5625-0c8b-9b86-09e5def3c93f	8256	Sromlje 
00050000-5625-0c8b-7135-a3a71435501e	5224	Srpenica
00050000-5625-0c8b-62e3-6504fa79972f	1242	Stahovica
00050000-5625-0c8b-2724-62f4a3dc1082	1332	Stara Cerkev
00050000-5625-0c8b-71d0-a57d7e7e5033	8342	Stari trg ob Kolpi
00050000-5625-0c8b-a087-8a46f1a3846c	1386	Stari trg pri Ložu
00050000-5625-0c8b-6794-504ade302f34	2205	Starše
00050000-5625-0c8b-517b-0dc261c235b6	2289	Stoperce
00050000-5625-0c8b-4e06-4a0172c00144	8322	Stopiče
00050000-5625-0c8b-084e-e8593c791c7c	3206	Stranice
00050000-5625-0c8b-4b88-13897a506a79	8351	Straža
00050000-5625-0c8b-8785-e2efa3c33e23	1313	Struge
00050000-5625-0c8b-4b59-f9253b907922	8293	Studenec
00050000-5625-0c8b-bb47-87ded0926e83	8331	Suhor
00050000-5625-0c8b-0a3e-0965a64e7d35	2233	Sv. Ana v Slovenskih goricah
00050000-5625-0c8b-a8e0-bae28427d2cd	2235	Sv. Trojica v Slovenskih goricah
00050000-5625-0c8b-4cbb-d8d1adebd41e	2353	Sveti Duh na Ostrem Vrhu
00050000-5625-0c8b-22dd-6c2df40810a6	9244	Sveti Jurij ob Ščavnici
00050000-5625-0c8b-11d3-ca7d78096d86	3264	Sveti Štefan
00050000-5625-0c8b-ebb8-5f4cc2039104	2258	Sveti Tomaž
00050000-5625-0c8b-f2d7-ac15c591dd1d	9204	Šalovci
00050000-5625-0c8b-576e-7d43948d40be	5261	Šempas
00050000-5625-0c8b-00c2-ca432731662b	5290	Šempeter pri Gorici
00050000-5625-0c8b-9ad0-34fe44c4feda	3311	Šempeter v Savinjski dolini
00050000-5625-0c8b-1b5b-2488ec4dbf34	4208	Šenčur
00050000-5625-0c8b-fba9-38eb1ee7b67f	2212	Šentilj v Slovenskih goricah
00050000-5625-0c8b-556c-454cbddc5e7c	8297	Šentjanž
00050000-5625-0c8b-7295-d96e5690350a	2373	Šentjanž pri Dravogradu
00050000-5625-0c8b-6091-4eed698a0b03	8310	Šentjernej
00050000-5625-0c8b-3f26-32e305fba438	3230	Šentjur
00050000-5625-0c8b-ec22-8336c0175b6a	3271	Šentrupert
00050000-5625-0c8b-227f-7e85dfb3dc81	8232	Šentrupert
00050000-5625-0c8b-addf-6c6055450b8d	1296	Šentvid pri Stični
00050000-5625-0c8b-03b9-317c2a5b7de5	8275	Škocjan
00050000-5625-0c8b-2585-592964a959bb	6281	Škofije
00050000-5625-0c8b-47ce-99f730069a24	4220	Škofja Loka
00050000-5625-0c8b-fbf7-c41c1130d1da	3211	Škofja vas
00050000-5625-0c8b-4628-8bb4e6fc7bc9	1291	Škofljica
00050000-5625-0c8b-6609-f5b99a8764a8	6274	Šmarje
00050000-5625-0c8b-ddfa-837a247c4ec1	1293	Šmarje - Sap
00050000-5625-0c8b-60cc-de78c9dcdb2e	3240	Šmarje pri Jelšah
00050000-5625-0c8b-4593-d9e80fc6dc15	8220	Šmarješke Toplice
00050000-5625-0c8b-42f2-eb1e51439464	2315	Šmartno na Pohorju
00050000-5625-0c8b-c88b-a839d54ced57	3341	Šmartno ob Dreti
00050000-5625-0c8b-f9fb-70cce6eadd15	3327	Šmartno ob Paki
00050000-5625-0c8b-951f-a2f0921f481a	1275	Šmartno pri Litiji
00050000-5625-0c8b-a04c-2b7a612b99ac	2383	Šmartno pri Slovenj Gradcu
00050000-5625-0c8b-c9f4-34b86e8cb2b2	3201	Šmartno v Rožni dolini
00050000-5625-0c8b-7f06-8e3dc2068fc4	3325	Šoštanj
00050000-5625-0c8b-487b-4619b550fed7	6222	Štanjel
00050000-5625-0c8b-44c1-0cbefe8aaf15	3220	Štore
00050000-5625-0c8b-8a32-24629ca580f4	3304	Tabor
00050000-5625-0c8b-c0c9-1fa2bf16c3e6	3221	Teharje
00050000-5625-0c8b-f2b4-3f680e9ad935	9251	Tišina
00050000-5625-0c8b-f4a7-61ac976510f8	5220	Tolmin
00050000-5625-0c8b-6484-be3210db1187	3326	Topolšica
00050000-5625-0c8b-4c06-1edbac02f2bc	2371	Trbonje
00050000-5625-0c8b-db47-f5afbdb5d460	1420	Trbovlje
00050000-5625-0c8b-62dc-01b448a30f68	8231	Trebelno 
00050000-5625-0c8b-8bd9-59e5d4c67728	8210	Trebnje
00050000-5625-0c8b-ede2-0966ba386820	5252	Trnovo pri Gorici
00050000-5625-0c8b-3a1f-582048bc27c3	2254	Trnovska vas
00050000-5625-0c8b-18cd-9b5a5c06f90c	1222	Trojane
00050000-5625-0c8b-c2c8-5136cb900f14	1236	Trzin
00050000-5625-0c8b-0aff-8308ef76d7a0	4290	Tržič
00050000-5625-0c8b-1175-b088bceea3d5	8295	Tržišče
00050000-5625-0c8b-8875-e1fe90776d56	1311	Turjak
00050000-5625-0c8b-4fec-92abffd4cf21	9224	Turnišče
00050000-5625-0c8b-5fab-c547a7627e5f	8323	Uršna sela
00050000-5625-0c8b-270d-6d684f15450c	1252	Vače
00050000-5625-0c8b-a9b1-8be788822814	3320	Velenje 
00050000-5625-0c8b-4b9c-24b49020f98e	3322	Velenje - poštni predali
00050000-5625-0c8b-e9e9-5a731a94a7e9	8212	Velika Loka
00050000-5625-0c8b-ac1d-b96166e5314f	2274	Velika Nedelja
00050000-5625-0c8b-e61c-67bf3be28c52	9225	Velika Polana
00050000-5625-0c8b-6888-8153425cdcdc	1315	Velike Lašče
00050000-5625-0c8b-b17a-1149411b83de	8213	Veliki Gaber
00050000-5625-0c8b-f966-819b3c3be390	9241	Veržej
00050000-5625-0c8b-be72-965ec06d83d8	1312	Videm - Dobrepolje
00050000-5625-0c8b-c366-f7d912732d72	2284	Videm pri Ptuju
00050000-5625-0c8b-5678-3335e3882323	8344	Vinica
00050000-5625-0c8b-56d0-d0b2876addff	5271	Vipava
00050000-5625-0c8b-afbc-241f58f21466	4212	Visoko
00050000-5625-0c8b-f43f-c7584c138451	1294	Višnja Gora
00050000-5625-0c8b-7e54-37f602e72cd8	3205	Vitanje
00050000-5625-0c8b-a2e3-7426e8462a26	2255	Vitomarci
00050000-5625-0c8b-7bca-680f6edd7881	1217	Vodice
00050000-5625-0c8b-b24e-9b3850fbf993	3212	Vojnik\t
00050000-5625-0c8b-a5ff-12608e20b758	5293	Volčja Draga
00050000-5625-0c8b-8f18-eb6412bb33c9	2232	Voličina
00050000-5625-0c8b-8b43-15f52e2127f6	3305	Vransko
00050000-5625-0c8b-3ea5-e7a1049b3470	6217	Vremski Britof
00050000-5625-0c8b-db2f-8055ba3dc166	1360	Vrhnika
00050000-5625-0c8b-1d9c-f2bdf2cb982f	2365	Vuhred
00050000-5625-0c8b-5015-8094f762ec92	2367	Vuzenica
00050000-5625-0c8b-4d8b-6f097eacf1df	8292	Zabukovje 
00050000-5625-0c8b-6444-f9d3a154ea2b	1410	Zagorje ob Savi
00050000-5625-0c8b-727e-22e43aefb844	1303	Zagradec
00050000-5625-0c8b-4e49-55ebe2db0202	2283	Zavrč
00050000-5625-0c8b-ee3b-73f242d63cb2	8272	Zdole 
00050000-5625-0c8b-a2b2-2aec6ecfc54b	4201	Zgornja Besnica
00050000-5625-0c8b-be83-a992ed800db2	2242	Zgornja Korena
00050000-5625-0c8b-9b98-75729b77443c	2201	Zgornja Kungota
00050000-5625-0c8b-917c-e64bb5e96680	2316	Zgornja Ložnica
00050000-5625-0c8b-837a-43a0607796c6	2314	Zgornja Polskava
00050000-5625-0c8b-1efb-216b94af9b38	2213	Zgornja Velka
00050000-5625-0c8b-4071-84f41a170e91	4247	Zgornje Gorje
00050000-5625-0c8b-1453-57087fefd884	4206	Zgornje Jezersko
00050000-5625-0c8b-3320-2e1adab611db	2285	Zgornji Leskovec
00050000-5625-0c8b-99b0-d17d92041303	1432	Zidani Most
00050000-5625-0c8b-0059-14a0e4702c72	3214	Zreče
00050000-5625-0c8b-5a70-dbeacb1bfb14	4209	Žabnica
00050000-5625-0c8b-dd1b-b80eb74150ac	3310	Žalec
00050000-5625-0c8b-15c6-75a158f5fd24	4228	Železniki
00050000-5625-0c8b-8051-ddc1f34f09c2	2287	Žetale
00050000-5625-0c8b-0a63-9d1a2490bbc8	4226	Žiri
00050000-5625-0c8b-73b0-7db3aa87931b	4274	Žirovnica
00050000-5625-0c8b-177e-32ca04170dce	8360	Žužemberk
\.


--
-- TOC entry 3111 (class 0 OID 22658940)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22658532)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22658294)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5625-0c8e-e6e3-6b52ffde44e4	00080000-5625-0c8e-b268-789929fd3bce	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5625-0c8e-f51b-a206c51940a2	00080000-5625-0c8e-b268-789929fd3bce	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5625-0c8e-95eb-704102328736	00080000-5625-0c8e-1dc7-5e9dd9e3ff54	\N	00040000-5625-0c8c-c32b-e6d03a002e1d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3071 (class 0 OID 22658398)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22658410)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 22658544)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 22658954)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 22658964)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5625-0c8e-b302-06e8b0351cb7	00080000-5625-0c8e-3718-ea2ac0e03bab	0987	AK
00190000-5625-0c8e-2ec5-fee311eac0e2	00080000-5625-0c8e-1dc7-5e9dd9e3ff54	0989	AK
00190000-5625-0c8e-ee4b-1d2d9617e743	00080000-5625-0c8e-cc6f-713498462ed3	0986	AK
00190000-5625-0c8e-7fb9-c948a8cce54c	00080000-5625-0c8e-78e2-bb067f571505	0984	AK
00190000-5625-0c8e-0e4a-6a59a8755356	00080000-5625-0c8e-4199-e9813c8a722a	0983	AK
00190000-5625-0c8e-2fa7-041955bf4d8f	00080000-5625-0c8e-b613-3865b9b9410d	0982	AK
00190000-5625-0c8f-83ee-b82360cf6892	00080000-5625-0c8f-0c50-615814b342f3	1001	AK
\.


--
-- TOC entry 3110 (class 0 OID 22658879)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5625-0c8e-ab7c-b076e332cdf7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3114 (class 0 OID 22658972)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22658573)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5625-0c8e-c8e5-c95335f4b632	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5625-0c8e-1b8c-70b536b72e7d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5625-0c8e-a981-a0798306c938	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5625-0c8e-7565-f710d9aad60b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5625-0c8e-ba2c-d6a0e17f133a	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5625-0c8e-f1b8-7ec2499d14d2	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5625-0c8e-5e5c-ae6c2dc7417d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3082 (class 0 OID 22658517)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 22658507)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22658718)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 22658648)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 22658372)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 22658145)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5625-0c8f-0c50-615814b342f3	00010000-5625-0c8c-d204-8015baf1ddfe	2015-10-19 17:30:23	INS	a:0:{}
2	App\\Entity\\Option	00000000-5625-0c8f-25e3-f35c3cf1e89f	00010000-5625-0c8c-d204-8015baf1ddfe	2015-10-19 17:30:23	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5625-0c8f-83ee-b82360cf6892	00010000-5625-0c8c-d204-8015baf1ddfe	2015-10-19 17:30:23	INS	a:0:{}
\.


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3091 (class 0 OID 22658586)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 22658183)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5625-0c8c-5284-320d7e69ac43	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5625-0c8c-05ba-99190187f07b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5625-0c8c-8543-64900c3b8d7d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5625-0c8c-a229-1d15702ad7bf	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5625-0c8c-fdbf-4eabaf64f18c	planer	Planer dogodkov v koledarju	t
00020000-5625-0c8c-aee7-6e7b814e8362	kadrovska	Kadrovska služba	t
00020000-5625-0c8c-0a44-19a341a91e14	arhivar	Ažuriranje arhivalij	t
00020000-5625-0c8c-fc3e-af764cb467de	igralec	Igralec	t
00020000-5625-0c8c-899d-ac581bcc5fbc	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5625-0c8e-929e-2e2dc60e7534	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3052 (class 0 OID 22658167)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5625-0c8c-d2ec-0f057849de70	00020000-5625-0c8c-8543-64900c3b8d7d
00010000-5625-0c8c-d204-8015baf1ddfe	00020000-5625-0c8c-8543-64900c3b8d7d
00010000-5625-0c8e-3232-cea00a963ba2	00020000-5625-0c8e-929e-2e2dc60e7534
\.


--
-- TOC entry 3093 (class 0 OID 22658600)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22658538)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22658484)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5625-0c8e-f224-b3d31193ce39	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5625-0c8e-0946-05348967b825	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5625-0c8e-6f6e-ba557cde4047	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3048 (class 0 OID 22658132)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5625-0c8c-78d5-9279daf002fc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5625-0c8c-abfb-d65848774903	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5625-0c8c-b3f6-0b8715ec30f6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5625-0c8c-70a0-d0a31f9928f6	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5625-0c8c-1514-88ccb6d8d9ac	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3047 (class 0 OID 22658124)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5625-0c8c-fd44-6f9b66e467ab	00230000-5625-0c8c-70a0-d0a31f9928f6	popa
00240000-5625-0c8c-1033-bbb44c12c93e	00230000-5625-0c8c-70a0-d0a31f9928f6	oseba
00240000-5625-0c8c-67cf-79e9eae289dc	00230000-5625-0c8c-70a0-d0a31f9928f6	tippopa
00240000-5625-0c8c-188c-d8f9b317ebc1	00230000-5625-0c8c-70a0-d0a31f9928f6	organizacijskaenota
00240000-5625-0c8c-084d-cad8a7afca3f	00230000-5625-0c8c-70a0-d0a31f9928f6	sezona
00240000-5625-0c8c-cb43-fa6c7d47c12e	00230000-5625-0c8c-70a0-d0a31f9928f6	tipvaje
00240000-5625-0c8c-7571-d0e41fd6ff43	00230000-5625-0c8c-abfb-d65848774903	prostor
00240000-5625-0c8c-d04b-c2e0797f8f71	00230000-5625-0c8c-70a0-d0a31f9928f6	besedilo
00240000-5625-0c8c-c9ba-7fd80d33c603	00230000-5625-0c8c-70a0-d0a31f9928f6	uprizoritev
00240000-5625-0c8c-39b7-a878b6792556	00230000-5625-0c8c-70a0-d0a31f9928f6	funkcija
00240000-5625-0c8c-1011-a15795503fe8	00230000-5625-0c8c-70a0-d0a31f9928f6	tipfunkcije
00240000-5625-0c8c-3316-3b58b8a9b3ab	00230000-5625-0c8c-70a0-d0a31f9928f6	alternacija
00240000-5625-0c8c-a10a-81925a5f0fe6	00230000-5625-0c8c-78d5-9279daf002fc	pogodba
00240000-5625-0c8c-9fbb-bf7201e53598	00230000-5625-0c8c-70a0-d0a31f9928f6	zaposlitev
00240000-5625-0c8c-d032-d7e00d83a397	00230000-5625-0c8c-70a0-d0a31f9928f6	zvrstuprizoritve
00240000-5625-0c8c-472e-0aa533dd4748	00230000-5625-0c8c-78d5-9279daf002fc	programdela
00240000-5625-0c8c-89ad-c3202c9163ef	00230000-5625-0c8c-70a0-d0a31f9928f6	zapis
\.


--
-- TOC entry 3046 (class 0 OID 22658119)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
c0fd4376-405a-4c61-bffb-d8f79b75214d	00240000-5625-0c8c-fd44-6f9b66e467ab	0	1001
\.


--
-- TOC entry 3099 (class 0 OID 22658665)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5625-0c8e-8601-855342df5b83	000e0000-5625-0c8e-1352-04ffab0e7ea8	00080000-5625-0c8e-b268-789929fd3bce	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5625-0c8c-4a5d-9139d96907fe
00270000-5625-0c8e-a5b5-050a25d40d26	000e0000-5625-0c8e-1352-04ffab0e7ea8	00080000-5625-0c8e-b268-789929fd3bce	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5625-0c8c-4a5d-9139d96907fe
\.


--
-- TOC entry 3060 (class 0 OID 22658255)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 22658494)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5625-0c8e-b670-64644411994e	00180000-5625-0c8e-41f6-b9cc9bb43095	000c0000-5625-0c8e-08b9-6536b5a3a230	00090000-5625-0c8e-e1e6-ba372200a4a8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-0c8e-eb8e-821b938cc7db	00180000-5625-0c8e-41f6-b9cc9bb43095	000c0000-5625-0c8e-098c-ff9f5cbcc2b0	00090000-5625-0c8e-9b2d-bd8245ae7d42	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-0c8e-e21d-d2d4ccbf3126	00180000-5625-0c8e-41f6-b9cc9bb43095	000c0000-5625-0c8e-27e1-152a7caadd4b	00090000-5625-0c8e-5106-71a52594121e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-0c8e-62c1-eebdc1a19b71	00180000-5625-0c8e-41f6-b9cc9bb43095	000c0000-5625-0c8e-479c-37bfdbbcaf8d	00090000-5625-0c8e-348d-f4552aecf757	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-0c8e-03cd-5fd5aff88bac	00180000-5625-0c8e-41f6-b9cc9bb43095	000c0000-5625-0c8e-f7bb-8a81356a8e1f	00090000-5625-0c8e-4484-92c4beb0d6e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5625-0c8e-32ac-b64e9aeb9a18	00180000-5625-0c8e-143d-babbb31b6db9	\N	00090000-5625-0c8e-4484-92c4beb0d6e3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5625-0c8e-175c-c842a1809ca6	00180000-5625-0c8e-143d-babbb31b6db9	\N	00090000-5625-0c8e-9b2d-bd8245ae7d42	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3102 (class 0 OID 22658706)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5625-0c8c-93d2-be98306e9928	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5625-0c8c-d90e-d244bc7608a6	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5625-0c8c-21e7-77d769aa89d9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5625-0c8c-36ff-8a11511e0359	04	Režija	Režija	Režija	umetnik	30
000f0000-5625-0c8c-2d94-a0a5a96c8250	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5625-0c8c-604e-20d7db906797	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5625-0c8c-d3c2-3bbbd259c382	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5625-0c8c-d14c-d9a8a037e251	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5625-0c8c-58b3-eabbd545b7b1	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5625-0c8c-7730-c258e91e5399	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5625-0c8c-927a-bfffde5ba384	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5625-0c8c-ef18-793c42e82b8c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5625-0c8c-2fdc-65f82fb20f73	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5625-0c8c-3070-84978320e4be	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5625-0c8c-8374-d195f983c058	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5625-0c8c-3518-31dc02702d83	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5625-0c8c-fbcb-5089c94b27a1	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5625-0c8c-f1b3-bb5c939b931c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3057 (class 0 OID 22658209)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5625-0c8e-6580-44168400e0f0	0001	šola	osnovna ali srednja šola
00400000-5625-0c8e-c438-3876166ea403	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5625-0c8e-f763-98141d4d9c07	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3115 (class 0 OID 22658983)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5625-0c8c-bbfc-56edcca42d6d	01	Velika predstava	f	1.00	1.00
002b0000-5625-0c8c-ba4f-e70a77436ad7	02	Mala predstava	f	0.50	0.50
002b0000-5625-0c8c-0df7-6b941a8806ce	03	Mala koprodukcija	t	0.40	1.00
002b0000-5625-0c8c-a779-127bb8ebad66	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5625-0c8c-2242-07caeac8d08e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3078 (class 0 OID 22658474)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5625-0c8c-cdd5-53cc8f86dd37	0001	prva vaja	prva vaja
00420000-5625-0c8c-4eec-9ada49c8397a	0002	tehnična vaja	tehnična vaja
00420000-5625-0c8c-6832-33d7f692544b	0003	lučna vaja	lučna vaja
00420000-5625-0c8c-e335-c5a299ac156e	0004	kostumska vaja	kostumska vaja
00420000-5625-0c8c-e848-1ea30325988e	0005	foto vaja	foto vaja
00420000-5625-0c8c-490a-1efeba17c7bf	0006	1. glavna vaja	1. glavna vaja
00420000-5625-0c8c-d620-e64ac7a7c0b1	0007	2. glavna vaja	2. glavna vaja
00420000-5625-0c8c-c60c-a4f3ecbd7b8d	0008	1. generalka	1. generalka
00420000-5625-0c8c-7bc3-95986a2ca415	0009	2. generalka	2. generalka
00420000-5625-0c8c-b2e4-6d63c4e9bd22	0010	odprta generalka	odprta generalka
00420000-5625-0c8c-87a7-42c071de36e0	0011	obnovitvena vaja	obnovitvena vaja
00420000-5625-0c8c-642e-eae1432633fd	0012	pevska vaja	pevska vaja
00420000-5625-0c8c-1df8-5a3cf1e10d1b	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5625-0c8c-62dc-20a5a988f9a8	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3066 (class 0 OID 22658329)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22658154)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5625-0c8c-d204-8015baf1ddfe	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROcVe4kkjimIRHDn0OAOD6311yRS57CFO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-8765-46dda10ad7c6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-00fe-5bcf599345fe	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-7a93-1d9a6156a237	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-12d5-453870eefed5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-8265-370b70dc99fd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-9c86-bb3280f74fb2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-324f-3e36f403e473	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-5842-cbfeb1e18819	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-235b-1241c4d84522	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5625-0c8e-3232-cea00a963ba2	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5625-0c8c-d2ec-0f057849de70	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3106 (class 0 OID 22658756)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5625-0c8e-966f-886d27c2b0ef	00160000-5625-0c8e-e912-af47b2593a28	\N	00140000-5625-0c8c-ab7a-6ff747b9033d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5625-0c8e-ba2c-d6a0e17f133a
000e0000-5625-0c8e-1352-04ffab0e7ea8	00160000-5625-0c8e-9b50-8e520e7f85d7	\N	00140000-5625-0c8c-2c76-698daf3d13c8	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5625-0c8e-f1b8-7ec2499d14d2
000e0000-5625-0c8e-df06-0c89b91bf252	\N	\N	00140000-5625-0c8c-2c76-698daf3d13c8	00190000-5625-0c8e-b302-06e8b0351cb7	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5625-0c8e-ba2c-d6a0e17f133a
000e0000-5625-0c8e-098a-cb868290b161	\N	\N	00140000-5625-0c8c-2c76-698daf3d13c8	00190000-5625-0c8e-b302-06e8b0351cb7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5625-0c8e-ba2c-d6a0e17f133a
000e0000-5625-0c8e-a6ed-d7a4090dc542	\N	\N	00140000-5625-0c8c-2c76-698daf3d13c8	00190000-5625-0c8e-b302-06e8b0351cb7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5625-0c8e-c8e5-c95335f4b632
000e0000-5625-0c8e-67af-9af4f2ae2fb2	\N	\N	00140000-5625-0c8c-2c76-698daf3d13c8	00190000-5625-0c8e-b302-06e8b0351cb7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5625-0c8e-c8e5-c95335f4b632
\.


--
-- TOC entry 3074 (class 0 OID 22658428)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5625-0c8e-cd53-67911239df37	\N	000e0000-5625-0c8e-1352-04ffab0e7ea8	1	
00200000-5625-0c8e-02de-5931acf4be6b	\N	000e0000-5625-0c8e-1352-04ffab0e7ea8	2	
00200000-5625-0c8e-ceea-7df2d467329c	\N	000e0000-5625-0c8e-1352-04ffab0e7ea8	3	
00200000-5625-0c8e-0cb7-dd2cba99d6c4	\N	000e0000-5625-0c8e-1352-04ffab0e7ea8	4	
00200000-5625-0c8e-8c35-bd744fe95798	\N	000e0000-5625-0c8e-1352-04ffab0e7ea8	5	
\.


--
-- TOC entry 3089 (class 0 OID 22658565)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22658679)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5625-0c8c-5afa-b3a9da6d42b4	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5625-0c8c-d3fc-ed23179bbb65	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5625-0c8c-c241-d8c38d713260	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5625-0c8c-05aa-d5210d687fd5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5625-0c8c-8e8d-c1a47f09fb4b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5625-0c8c-5c02-2a1b225323fe	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5625-0c8c-a165-ea14aec9137c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5625-0c8c-7e03-64cbc9c67cea	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5625-0c8c-4a5d-9139d96907fe	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5625-0c8c-b703-de3dd8d6e919	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5625-0c8c-8521-9ace4be4376d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5625-0c8c-5fd4-03aad2b7b9d7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5625-0c8c-43f8-c425fb74f7ce	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5625-0c8c-4731-a35d16431e0c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5625-0c8c-7b10-9152a22426cf	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5625-0c8c-4aab-41c444ff9780	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5625-0c8c-ac4d-287c8947e14c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5625-0c8c-c457-e5d4c896c3fa	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5625-0c8c-e9d0-de7f3cf2241e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5625-0c8c-a1ff-bf5af4367c94	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5625-0c8c-c788-36e7f71d173c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5625-0c8c-fa3a-a55e48c03938	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5625-0c8c-8431-2a33dcc3f4bf	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5625-0c8c-3582-20b56801cd97	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5625-0c8c-d89e-ce8a61d10ee6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5625-0c8c-0a36-901a6081e63a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5625-0c8c-0d12-193b1cbaf0f3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5625-0c8c-5f41-ce2257dd3851	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3118 (class 0 OID 22659030)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 22659002)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 22659042)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 22658637)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5625-0c8e-f78c-008cb000de9e	00090000-5625-0c8e-9b2d-bd8245ae7d42	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-0c8e-91f2-34acf2b3517a	00090000-5625-0c8e-5106-71a52594121e	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-0c8e-c806-9b74275203b7	00090000-5625-0c8e-5058-398e89e0aadf	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-0c8e-fbfb-16d843ff3568	00090000-5625-0c8e-858a-caac5f4c91d3	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-0c8e-b8e3-86421fe16ceb	00090000-5625-0c8e-47e0-e7f604f32ba2	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5625-0c8e-0f5e-3292f43a8b94	00090000-5625-0c8e-5e7b-a18f59da6668	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3076 (class 0 OID 22658463)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 22658746)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5625-0c8c-ab7a-6ff747b9033d	01	Drama	drama (SURS 01)
00140000-5625-0c8c-d735-98f778173e67	02	Opera	opera (SURS 02)
00140000-5625-0c8c-dc3f-3a264e4c0d26	03	Balet	balet (SURS 03)
00140000-5625-0c8c-f316-452d99df04fd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5625-0c8c-e1a8-d8c6fa743b5f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5625-0c8c-2c76-698daf3d13c8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5625-0c8c-85cd-5c79179e1ad0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3095 (class 0 OID 22658627)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2547 (class 2606 OID 22658208)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 22658805)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 22658795)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22658662)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 22658704)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 22659082)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 22658452)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 22658473)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 22659000)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 22658355)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 22658873)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 22658623)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 22658426)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22658393)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 22658369)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 22658530)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 22659059)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 22659066)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2823 (class 2606 OID 22659090)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 22028085)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2680 (class 2606 OID 22658557)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 22658327)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 22658227)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 22658289)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 22658251)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22658197)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2538 (class 2606 OID 22658182)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 22658563)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 22658599)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 22658741)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 22658279)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 22658315)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 22658952)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 22658536)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22658305)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22658414)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2614 (class 2606 OID 22658406)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 22658548)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22658961)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 22658969)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22658939)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 22658981)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 22658581)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 22658521)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 22658512)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22658728)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22658655)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 22658381)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 22658153)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22658590)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 22658171)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2540 (class 2606 OID 22658191)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 22658608)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22658543)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 22658492)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 22658141)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22658129)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 22658123)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 22658675)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22658260)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 22658503)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22658715)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 22658216)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 22658993)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 22658481)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 22658340)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22658166)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 22658774)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 22658435)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22658571)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22658687)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 22659040)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 22659024)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 22659048)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 22658645)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 22658467)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 22658754)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 22658635)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 1259 OID 22658461)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2629 (class 1259 OID 22658462)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2630 (class 1259 OID 22658460)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2631 (class 1259 OID 22658459)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2632 (class 1259 OID 22658458)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2723 (class 1259 OID 22658676)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2724 (class 1259 OID 22658677)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2725 (class 1259 OID 22658678)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2809 (class 1259 OID 22659061)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2810 (class 1259 OID 22659060)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2565 (class 1259 OID 22658281)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2566 (class 1259 OID 22658282)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2681 (class 1259 OID 22658564)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2796 (class 1259 OID 22659028)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2797 (class 1259 OID 22659027)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2798 (class 1259 OID 22659029)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2799 (class 1259 OID 22659026)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2800 (class 1259 OID 22659025)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2675 (class 1259 OID 22658550)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 22658549)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2622 (class 1259 OID 22658436)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2623 (class 1259 OID 22658437)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 22658624)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 22658626)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2707 (class 1259 OID 22658625)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2597 (class 1259 OID 22658371)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 22658370)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 22658982)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2739 (class 1259 OID 22658743)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2740 (class 1259 OID 22658744)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 22658745)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2806 (class 1259 OID 22659049)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2748 (class 1259 OID 22658779)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2749 (class 1259 OID 22658776)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2750 (class 1259 OID 22658780)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2751 (class 1259 OID 22658778)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2752 (class 1259 OID 22658777)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2587 (class 1259 OID 22658342)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 22658341)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 22658254)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2693 (class 1259 OID 22658591)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2542 (class 1259 OID 22658198)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 22658199)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2698 (class 1259 OID 22658611)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2699 (class 1259 OID 22658610)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2700 (class 1259 OID 22658609)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2570 (class 1259 OID 22658292)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2571 (class 1259 OID 22658291)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2572 (class 1259 OID 22658293)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2610 (class 1259 OID 22658409)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2611 (class 1259 OID 22658407)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 22658408)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2522 (class 1259 OID 22658131)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2655 (class 1259 OID 22658516)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2656 (class 1259 OID 22658514)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2657 (class 1259 OID 22658513)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2658 (class 1259 OID 22658515)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2533 (class 1259 OID 22658172)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 22658173)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2684 (class 1259 OID 22658572)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2819 (class 1259 OID 22659083)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2721 (class 1259 OID 22658664)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 22658663)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2820 (class 1259 OID 22659091)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2821 (class 1259 OID 22659092)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2670 (class 1259 OID 22658537)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2715 (class 1259 OID 22658656)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2716 (class 1259 OID 22658657)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2769 (class 1259 OID 22658878)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2770 (class 1259 OID 22658877)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2771 (class 1259 OID 22658874)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 22658875)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2773 (class 1259 OID 22658876)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2576 (class 1259 OID 22658307)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 22658306)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2578 (class 1259 OID 22658308)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 22658585)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2688 (class 1259 OID 22658584)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 22658962)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2780 (class 1259 OID 22658963)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2762 (class 1259 OID 22658809)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2763 (class 1259 OID 22658810)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2764 (class 1259 OID 22658807)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2765 (class 1259 OID 22658808)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2711 (class 1259 OID 22658646)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 22658647)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2661 (class 1259 OID 22658525)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2662 (class 1259 OID 22658524)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 22658522)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2664 (class 1259 OID 22658523)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2758 (class 1259 OID 22658797)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2759 (class 1259 OID 22658796)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 22658382)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2604 (class 1259 OID 22658396)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2605 (class 1259 OID 22658395)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2606 (class 1259 OID 22658394)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 22658397)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2621 (class 1259 OID 22658427)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 22658415)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2616 (class 1259 OID 22658416)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2776 (class 1259 OID 22658953)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2795 (class 1259 OID 22659001)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2813 (class 1259 OID 22659067)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2814 (class 1259 OID 22659068)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2552 (class 1259 OID 22658229)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2553 (class 1259 OID 22658228)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2561 (class 1259 OID 22658261)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 22658262)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 22658468)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 22658506)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 22658505)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2652 (class 1259 OID 22658504)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 22658454)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2634 (class 1259 OID 22658455)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2635 (class 1259 OID 22658453)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2636 (class 1259 OID 22658457)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2637 (class 1259 OID 22658456)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 22658280)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2550 (class 1259 OID 22658217)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 22658218)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2593 (class 1259 OID 22658356)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 22658358)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2595 (class 1259 OID 22658357)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2596 (class 1259 OID 22658359)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2669 (class 1259 OID 22658531)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 22658742)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2753 (class 1259 OID 22658775)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22658716)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22658717)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2559 (class 1259 OID 22658252)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 22658253)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2708 (class 1259 OID 22658636)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 22658142)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 22658328)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2575 (class 1259 OID 22658290)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 22658130)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2792 (class 1259 OID 22658994)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 22658583)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2692 (class 1259 OID 22658582)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 22658482)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 22658483)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2766 (class 1259 OID 22658806)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 22658316)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 22658755)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2803 (class 1259 OID 22659041)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2785 (class 1259 OID 22658970)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2786 (class 1259 OID 22658971)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22658705)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2649 (class 1259 OID 22658493)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 22658192)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2862 (class 2606 OID 22659263)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2861 (class 2606 OID 22659268)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2857 (class 2606 OID 22659288)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2863 (class 2606 OID 22659258)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2859 (class 2606 OID 22659278)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2858 (class 2606 OID 22659283)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2860 (class 2606 OID 22659273)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2899 (class 2606 OID 22659458)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2898 (class 2606 OID 22659463)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22659468)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2931 (class 2606 OID 22659633)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2932 (class 2606 OID 22659628)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 22659148)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2835 (class 2606 OID 22659153)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 22659373)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2926 (class 2606 OID 22659613)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 22659608)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2925 (class 2606 OID 22659618)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 22659603)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2929 (class 2606 OID 22659598)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2878 (class 2606 OID 22659368)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2879 (class 2606 OID 22659363)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2856 (class 2606 OID 22659248)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2855 (class 2606 OID 22659253)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2890 (class 2606 OID 22659413)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 22659423)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2889 (class 2606 OID 22659418)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2845 (class 2606 OID 22659203)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 22659198)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 22659353)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 22659588)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2902 (class 2606 OID 22659473)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 22659478)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2900 (class 2606 OID 22659483)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2930 (class 2606 OID 22659623)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2904 (class 2606 OID 22659503)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2907 (class 2606 OID 22659488)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 22659508)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2905 (class 2606 OID 22659498)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2906 (class 2606 OID 22659493)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2843 (class 2606 OID 22659193)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2844 (class 2606 OID 22659188)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 22659133)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2832 (class 2606 OID 22659128)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 22659393)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2828 (class 2606 OID 22659108)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2827 (class 2606 OID 22659113)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2885 (class 2606 OID 22659408)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2886 (class 2606 OID 22659403)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2887 (class 2606 OID 22659398)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2838 (class 2606 OID 22659163)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2839 (class 2606 OID 22659158)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2837 (class 2606 OID 22659168)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2849 (class 2606 OID 22659228)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 22659218)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 22659223)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2824 (class 2606 OID 22659093)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2868 (class 2606 OID 22659328)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2870 (class 2606 OID 22659318)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2871 (class 2606 OID 22659313)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2869 (class 2606 OID 22659323)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 22659098)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2825 (class 2606 OID 22659103)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2881 (class 2606 OID 22659378)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 22659648)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 22659453)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2896 (class 2606 OID 22659448)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2937 (class 2606 OID 22659653)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2936 (class 2606 OID 22659658)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2877 (class 2606 OID 22659358)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2894 (class 2606 OID 22659438)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2893 (class 2606 OID 22659443)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2914 (class 2606 OID 22659563)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2915 (class 2606 OID 22659558)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2918 (class 2606 OID 22659543)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 22659548)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2916 (class 2606 OID 22659553)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 22659178)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2842 (class 2606 OID 22659173)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 22659183)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2882 (class 2606 OID 22659388)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2883 (class 2606 OID 22659383)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 22659573)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2920 (class 2606 OID 22659578)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2911 (class 2606 OID 22659533)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 22659538)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2913 (class 2606 OID 22659523)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2912 (class 2606 OID 22659528)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2892 (class 2606 OID 22659428)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 22659433)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2872 (class 2606 OID 22659348)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2873 (class 2606 OID 22659343)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2875 (class 2606 OID 22659333)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2874 (class 2606 OID 22659338)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2908 (class 2606 OID 22659518)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 22659513)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2847 (class 2606 OID 22659208)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2848 (class 2606 OID 22659213)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 22659243)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2853 (class 2606 OID 22659233)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2852 (class 2606 OID 22659238)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2919 (class 2606 OID 22659568)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2922 (class 2606 OID 22659583)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 22659593)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2934 (class 2606 OID 22659638)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2933 (class 2606 OID 22659643)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2829 (class 2606 OID 22659123)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2830 (class 2606 OID 22659118)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2834 (class 2606 OID 22659138)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 22659143)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 22659293)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2865 (class 2606 OID 22659308)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2866 (class 2606 OID 22659303)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2867 (class 2606 OID 22659298)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-19 17:30:25 CEST

--
-- PostgreSQL database dump complete
--

