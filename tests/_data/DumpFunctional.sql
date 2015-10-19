--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-19 12:39:44 CEST

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
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22487750)
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
-- TOC entry 233 (class 1259 OID 22488347)
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
-- TOC entry 232 (class 1259 OID 22488330)
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
-- TOC entry 223 (class 1259 OID 22488207)
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
-- TOC entry 226 (class 1259 OID 22488237)
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
-- TOC entry 247 (class 1259 OID 22488618)
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
-- TOC entry 200 (class 1259 OID 22487987)
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
-- TOC entry 202 (class 1259 OID 22488018)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 22488544)
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
-- TOC entry 192 (class 1259 OID 22487893)
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
-- TOC entry 234 (class 1259 OID 22488360)
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
-- TOC entry 219 (class 1259 OID 22488161)
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
-- TOC entry 198 (class 1259 OID 22487966)
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
-- TOC entry 195 (class 1259 OID 22487933)
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
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 22487910)
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
-- TOC entry 208 (class 1259 OID 22488075)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 22488599)
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
-- TOC entry 246 (class 1259 OID 22488611)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 22488633)
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
-- TOC entry 212 (class 1259 OID 22488100)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22487867)
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
-- TOC entry 183 (class 1259 OID 22487769)
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
-- TOC entry 187 (class 1259 OID 22487833)
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
-- TOC entry 184 (class 1259 OID 22487780)
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
-- TOC entry 178 (class 1259 OID 22487724)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22487743)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 22488107)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 22488141)
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
-- TOC entry 229 (class 1259 OID 22488278)
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
-- TOC entry 186 (class 1259 OID 22487813)
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
-- TOC entry 189 (class 1259 OID 22487859)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22488489)
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
-- TOC entry 209 (class 1259 OID 22488081)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22487844)
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
-- TOC entry 196 (class 1259 OID 22487948)
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
-- TOC entry 197 (class 1259 OID 22487959)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 22488093)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 22488503)
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
-- TOC entry 238 (class 1259 OID 22488513)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22488428)
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
-- TOC entry 239 (class 1259 OID 22488521)
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
-- TOC entry 215 (class 1259 OID 22488122)
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
-- TOC entry 207 (class 1259 OID 22488066)
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
-- TOC entry 206 (class 1259 OID 22488056)
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
-- TOC entry 228 (class 1259 OID 22488267)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 22488197)
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
-- TOC entry 194 (class 1259 OID 22487922)
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
-- TOC entry 175 (class 1259 OID 22487695)
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
-- TOC entry 174 (class 1259 OID 22487693)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 22488135)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22487733)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22487717)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 22488149)
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
-- TOC entry 210 (class 1259 OID 22488087)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 22488033)
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
-- TOC entry 173 (class 1259 OID 22487682)
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
-- TOC entry 172 (class 1259 OID 22487674)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22487669)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 22488214)
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
-- TOC entry 185 (class 1259 OID 22487805)
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
-- TOC entry 205 (class 1259 OID 22488043)
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
-- TOC entry 227 (class 1259 OID 22488255)
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
-- TOC entry 182 (class 1259 OID 22487759)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 22488532)
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
-- TOC entry 203 (class 1259 OID 22488023)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22487879)
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
-- TOC entry 176 (class 1259 OID 22487704)
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
-- TOC entry 231 (class 1259 OID 22488305)
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
-- TOC entry 199 (class 1259 OID 22487977)
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
-- TOC entry 214 (class 1259 OID 22488114)
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
-- TOC entry 225 (class 1259 OID 22488228)
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
-- TOC entry 243 (class 1259 OID 22488579)
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
-- TOC entry 242 (class 1259 OID 22488551)
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
-- TOC entry 244 (class 1259 OID 22488591)
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
-- TOC entry 221 (class 1259 OID 22488186)
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
-- TOC entry 201 (class 1259 OID 22488012)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 22488295)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 22488176)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2219 (class 2604 OID 22487698)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3054 (class 0 OID 22487750)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5624-c86e-c0d0-da92bd82d465	10	30	Otroci	Abonma za otroke	200
000a0000-5624-c86e-63d1-cf6883a7c1ed	20	60	Mladina	Abonma za mladino	400
000a0000-5624-c86e-a7b9-2a8068327b25	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3106 (class 0 OID 22488347)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5624-c86e-cc6b-ac223a11d993	000d0000-5624-c86e-2229-fbfdf41833ac	\N	00090000-5624-c86e-daa0-5638ac8940ec	000b0000-5624-c86e-bf64-1a39eeb21afd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5624-c86e-2fc0-75b95f9a60cc	000d0000-5624-c86e-e949-ea70ea3b9735	00100000-5624-c86e-e775-b0deabce3970	00090000-5624-c86e-6451-64db2789af87	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5624-c86e-7438-e53bc6009438	000d0000-5624-c86e-3195-fe9d94e6ad6b	00100000-5624-c86e-34d0-9312eeed2c3e	00090000-5624-c86e-03e7-962308c0223c	\N	0003	t	\N	2015-10-19	\N	2	t	\N	f	f
000c0000-5624-c86e-d7ea-c914b42bd376	000d0000-5624-c86e-a963-529fc88f626b	\N	00090000-5624-c86e-6c13-fb54ecc2e111	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5624-c86e-3405-444c6e67ad5b	000d0000-5624-c86e-f0c0-c5b5d092f34e	\N	00090000-5624-c86e-720f-70e899b25550	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5624-c86e-a20c-2562f925248f	000d0000-5624-c86e-22c6-b4bc32d43c29	\N	00090000-5624-c86e-f97c-a86b9e27b849	000b0000-5624-c86e-abea-031a4bd2e6b0	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5624-c86e-cc03-215e752886d2	000d0000-5624-c86e-6860-94c012b7ff90	00100000-5624-c86e-9ad4-1f9ddad7d501	00090000-5624-c86e-71e9-5fb2a9dd0eab	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5624-c86e-0aff-88b024c07ed7	000d0000-5624-c86e-f99e-2e0f51708e3b	\N	00090000-5624-c86e-6cdd-995797cb0d5e	000b0000-5624-c86e-533b-1a8b5b584e79	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5624-c86e-c8da-d4b76abd6348	000d0000-5624-c86e-6860-94c012b7ff90	00100000-5624-c86e-76ab-dd25f0899fb3	00090000-5624-c86e-a246-4544e1e7287c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5624-c86e-954b-cee63192663a	000d0000-5624-c86e-6860-94c012b7ff90	00100000-5624-c86e-28bb-9d4daf7b6385	00090000-5624-c86e-981e-fe89c9c725c4	\N	0010	t	\N	2015-10-19	\N	16	f	\N	f	t
000c0000-5624-c86e-a31c-a7a456a00fc6	000d0000-5624-c86e-6860-94c012b7ff90	00100000-5624-c86e-d4b7-a1715fcbfda8	00090000-5624-c86e-9cdc-f93b23dab954	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5624-c86e-b426-4ab36159b5ac	000d0000-5624-c86e-9f65-bc9a464a2098	\N	00090000-5624-c86e-6451-64db2789af87	000b0000-5624-c86e-4ed3-0199bcc0904f	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3105 (class 0 OID 22488330)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 22488207)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5624-c86e-8d11-6440845b0d63	00160000-5624-c86e-e4cb-36af8ccecc12	00090000-5624-c86e-e5c2-2e8763c279d2	aizv	10	t
003d0000-5624-c86e-f15b-6494c62a13a6	00160000-5624-c86e-e4cb-36af8ccecc12	00090000-5624-c86e-16b8-75470f2d8530	apri	14	t
003d0000-5624-c86e-1282-6358ecfe2c92	00160000-5624-c86e-9c3c-7fb12d83acee	00090000-5624-c86e-03be-4701bc3e4b18	aizv	11	t
003d0000-5624-c86e-b323-03cd3e8ab8cc	00160000-5624-c86e-9d19-7e239c32fd08	00090000-5624-c86e-33f6-72d99b9b2e10	aizv	12	t
003d0000-5624-c86e-2bd9-54c0a15c2b56	00160000-5624-c86e-e4cb-36af8ccecc12	00090000-5624-c86e-7fcb-18c8857ef29b	apri	18	f
\.


--
-- TOC entry 3099 (class 0 OID 22488237)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5624-c86e-e4cb-36af8ccecc12	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5624-c86e-9c3c-7fb12d83acee	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5624-c86e-9d19-7e239c32fd08	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3120 (class 0 OID 22488618)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22487987)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5624-c86e-8785-143d7c671c47	\N	\N	00200000-5624-c86e-5e0f-86f4359b2d89	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5624-c86e-8291-9837cb143495	\N	\N	00200000-5624-c86e-1eb5-d8ea9276ef92	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5624-c86e-4c2e-c8eb9c55b60c	\N	\N	00200000-5624-c86e-b725-7ea18643997c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5624-c86e-9dc1-f8e805290907	\N	\N	00200000-5624-c86e-4929-376107331c76	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5624-c86e-014b-24d91a6453ff	\N	\N	00200000-5624-c86e-eb03-486085a33483	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3075 (class 0 OID 22488018)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 22488544)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 22487893)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5624-c86c-b924-09fa2c0c2d9a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5624-c86c-66cb-6f0e4de4714b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5624-c86c-3cfc-17a6e6f6957b	AL	ALB	008	Albania 	Albanija	\N
00040000-5624-c86c-6354-76fa60ee3d7e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5624-c86c-d2f8-2fcc36b0f78b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5624-c86c-53bb-b56d0010d424	AD	AND	020	Andorra 	Andora	\N
00040000-5624-c86c-c690-702a54dae21a	AO	AGO	024	Angola 	Angola	\N
00040000-5624-c86c-b10a-74d54e2aba73	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5624-c86c-4932-9e1c64cd3d61	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5624-c86c-1347-264826f0df48	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-c86c-d189-2982d019a8e2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5624-c86c-3a37-46234157992a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5624-c86c-7a42-ae0a4c27bf52	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5624-c86c-3221-a683aaef3b94	AU	AUS	036	Australia 	Avstralija	\N
00040000-5624-c86c-37ba-224521fb7591	AT	AUT	040	Austria 	Avstrija	\N
00040000-5624-c86c-b58e-832d121b42a7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5624-c86c-7f00-a3d3a3a5ae95	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5624-c86c-2929-1533f39ccdd1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5624-c86c-2c21-6209270d9b13	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5624-c86c-a4a6-9d9cd8997c7d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5624-c86c-2905-f216b2356bc9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5624-c86c-cd31-0becf4b269e1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5624-c86c-a86d-d6f8d7c7244e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5624-c86c-2f8b-eb2eedc93f9e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5624-c86c-b5ac-9458084b6130	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5624-c86c-5ce1-6ba207b827e3	BT	BTN	064	Bhutan 	Butan	\N
00040000-5624-c86c-4816-48b49bf1660b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5624-c86c-df90-ed9bfd59ac48	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5624-c86c-0156-cf373b4764fc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5624-c86c-7715-4044c18a02eb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5624-c86c-2822-b58116770988	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5624-c86c-3a12-eb49486ccf8f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5624-c86c-bd9f-1dbedb19eef6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5624-c86c-5307-61f70a343bf9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5624-c86c-d6ef-9482a0104baa	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5624-c86c-0391-5b07031a67ae	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5624-c86c-bfe5-70725a58df1b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5624-c86c-93d1-ac5853277ba9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5624-c86c-5521-35643fa4b8f5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5624-c86c-4d34-dcc1864b400a	CA	CAN	124	Canada 	Kanada	\N
00040000-5624-c86c-c6af-b4e480cdffa2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5624-c86c-2294-04c2f38371eb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5624-c86c-22b8-2e02eb59991e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5624-c86c-2eec-d96e9b504dea	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5624-c86c-5a4b-ef727ecdc593	CL	CHL	152	Chile 	Čile	\N
00040000-5624-c86c-a00b-3b1bae5b8802	CN	CHN	156	China 	Kitajska	\N
00040000-5624-c86c-7553-ee95fc136f2b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5624-c86c-e2f1-3714774ec8bc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5624-c86c-e531-751f4cc68b37	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5624-c86c-c3f0-bf7aa5675fac	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5624-c86c-bbec-559329fb07c3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5624-c86c-42eb-267da27a5aae	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5624-c86c-d2f0-c16a1f44cf04	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5624-c86c-525b-8cd67d5b04dd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5624-c86c-4be3-fc73af980a04	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5624-c86c-9c23-27fc596dc213	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5624-c86c-4157-1ae0f3172d45	CU	CUB	192	Cuba 	Kuba	\N
00040000-5624-c86c-d711-3bbf22bae33c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5624-c86c-e12a-a7ec59425b59	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5624-c86c-5f08-0b45665e1aef	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5624-c86c-2c29-24de04e653c7	DK	DNK	208	Denmark 	Danska	\N
00040000-5624-c86c-eeda-596a64656818	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5624-c86c-edd0-729349c11912	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-c86c-b6d4-97ebd50ad73a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5624-c86c-99c5-80c19ecf3f32	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5624-c86c-87f1-044f1bc9a276	EG	EGY	818	Egypt 	Egipt	\N
00040000-5624-c86c-b8e5-fcee062b8c35	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5624-c86c-337c-fe0f3e0c6ac3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5624-c86c-782d-e1f9d5b4cd7e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5624-c86c-eab1-3ccc3573e8cb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5624-c86c-19c8-f2b33441f7f7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5624-c86c-66f9-be69322ac84f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5624-c86c-a491-bc12d3ae2cc1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5624-c86c-975d-88c1a54bc350	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5624-c86c-0a4a-15f6149e0e90	FI	FIN	246	Finland 	Finska	\N
00040000-5624-c86c-bcaf-dd8f8aca4f05	FR	FRA	250	France 	Francija	\N
00040000-5624-c86c-2836-29c4de20fd0b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5624-c86c-68a2-2f3c6714fe5b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5624-c86c-9560-4b417523ffe5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5624-c86c-a938-099b9ae96970	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5624-c86c-353e-4161598aafcf	GA	GAB	266	Gabon 	Gabon	\N
00040000-5624-c86c-0e73-64e2e0f086c0	GM	GMB	270	Gambia 	Gambija	\N
00040000-5624-c86c-8c0e-a5676a34fa96	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5624-c86c-353b-ab589e06b144	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5624-c86c-0873-b06b5e5d9dd3	GH	GHA	288	Ghana 	Gana	\N
00040000-5624-c86c-51a8-09d7e0fcfa22	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5624-c86c-5d8e-40cb55193b55	GR	GRC	300	Greece 	Grčija	\N
00040000-5624-c86c-c5d0-8947c4a526c7	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5624-c86c-e3e6-86eba4a2a238	GD	GRD	308	Grenada 	Grenada	\N
00040000-5624-c86c-60f2-fd21349b5e7d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5624-c86c-18f5-bcd21754c5ef	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5624-c86c-8f0e-899f136b5a11	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5624-c86c-42f0-4e366d277cf6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5624-c86c-9c91-dfcefe2141b3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5624-c86c-47cf-470f1e9de72d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5624-c86c-6483-862bb6d80c95	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5624-c86c-1af7-3cde97c2777e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5624-c86c-c7ba-2b3f04530f6e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5624-c86c-7120-0fd3698d0cdd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5624-c86c-0a4d-c0802400fa09	HN	HND	340	Honduras 	Honduras	\N
00040000-5624-c86c-d0e4-564ff07b9403	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5624-c86c-1150-2fe6fa02e378	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5624-c86c-1e93-741951b96adf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5624-c86c-6190-944f96a0ef9b	IN	IND	356	India 	Indija	\N
00040000-5624-c86c-e4c0-f73215c37c4c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5624-c86c-0128-e9ded732cff6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5624-c86c-63f5-c0481b07c8bc	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5624-c86c-07b0-7f46241c70b0	IE	IRL	372	Ireland 	Irska	\N
00040000-5624-c86c-96c5-169417c094c7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5624-c86c-4b65-d0c8baae1632	IL	ISR	376	Israel 	Izrael	\N
00040000-5624-c86c-2b05-e81fb7e428cd	IT	ITA	380	Italy 	Italija	\N
00040000-5624-c86c-4e23-005396ad1db1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5624-c86c-1ec3-fcae61508d92	JP	JPN	392	Japan 	Japonska	\N
00040000-5624-c86c-78c9-8d808e0038e8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5624-c86c-cb48-12f48944f5ef	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5624-c86c-d223-834d5042c797	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5624-c86c-5d06-d309f261de58	KE	KEN	404	Kenya 	Kenija	\N
00040000-5624-c86c-1bc9-f6a9ca0c5447	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5624-c86c-d920-81f5ff44e0db	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5624-c86c-cdcd-9ff5d8295260	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5624-c86c-4f74-b4b5f2342d5d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5624-c86c-0dd2-3bc11e4ed3f4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5624-c86c-8519-487a9444a4c4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5624-c86c-36da-5c762a2db69d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5624-c86c-a0cf-e1c9574e197d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5624-c86c-7b4a-72641827c80b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5624-c86c-8835-526ce0bc1c72	LR	LBR	430	Liberia 	Liberija	\N
00040000-5624-c86c-108f-a3808b99e5ef	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5624-c86c-41d6-e51eb82a31d9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5624-c86c-9fd6-023bf15930d4	LT	LTU	440	Lithuania 	Litva	\N
00040000-5624-c86c-a20e-185a3ac4f096	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5624-c86c-9c0d-4458affba031	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5624-c86c-83eb-e93e132e9eb8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5624-c86c-e2a5-23d031f2f8a8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5624-c86c-8100-2cafebbb640b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5624-c86c-72cf-abef81eb1ee9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5624-c86c-e685-63804ec49b86	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5624-c86c-0078-b29e505c607f	ML	MLI	466	Mali 	Mali	\N
00040000-5624-c86c-43ba-2df1b882d4ea	MT	MLT	470	Malta 	Malta	\N
00040000-5624-c86c-207e-bb42b3d59734	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5624-c86c-b26f-bd4c264aed89	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5624-c86c-e5ca-802d3900ef1e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5624-c86c-f758-dfc53dae2e66	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5624-c86c-550d-d0f791df247b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5624-c86c-962c-53abfe5e9f5c	MX	MEX	484	Mexico 	Mehika	\N
00040000-5624-c86c-80c5-bc216ae6c804	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5624-c86c-4311-65edc1d68ea1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5624-c86c-cf6d-ed266898a216	MC	MCO	492	Monaco 	Monako	\N
00040000-5624-c86c-bcba-f6ef7fb6e217	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5624-c86c-7b7d-ec45ec61264b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5624-c86c-725c-8e9890d110c7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5624-c86c-6d93-287dd5d81765	MA	MAR	504	Morocco 	Maroko	\N
00040000-5624-c86c-dbd5-020b8b251168	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5624-c86c-7854-63bc714fde9f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5624-c86c-9b58-57037f3442ea	NA	NAM	516	Namibia 	Namibija	\N
00040000-5624-c86c-c900-8d6652ccebc0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5624-c86c-9a0a-3c8f22a59fde	NP	NPL	524	Nepal 	Nepal	\N
00040000-5624-c86c-8941-b3771eb077e8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5624-c86c-3ea5-c5b9c164fd3b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5624-c86c-5306-9615fe7ea1cd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5624-c86c-852b-9f21554b575a	NE	NER	562	Niger 	Niger 	\N
00040000-5624-c86c-0550-11ebe9e1df97	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5624-c86c-e019-91781f9b2a4c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5624-c86c-c072-d9a68218dd4a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5624-c86c-3d4d-d1f90284bdbf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5624-c86c-ead2-48d14bb77ff8	NO	NOR	578	Norway 	Norveška	\N
00040000-5624-c86c-cd84-641437934407	OM	OMN	512	Oman 	Oman	\N
00040000-5624-c86c-9cfe-dd65d529c4ce	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5624-c86c-af08-e1e44845206d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5624-c86c-1f73-09ad14791c93	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5624-c86c-ea3b-a7651a60733a	PA	PAN	591	Panama 	Panama	\N
00040000-5624-c86c-52a2-3f5f0a5d6f54	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5624-c86c-9601-a3d858c78bb6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5624-c86c-6f51-8b80ca1e1c52	PE	PER	604	Peru 	Peru	\N
00040000-5624-c86c-1a0a-ac0f9c9d4fad	PH	PHL	608	Philippines 	Filipini	\N
00040000-5624-c86c-9847-db6b4c50ff68	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5624-c86c-f2ca-6de36644811f	PL	POL	616	Poland 	Poljska	\N
00040000-5624-c86c-1249-f61bf4f74892	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5624-c86c-f2fc-c02c34bf613b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5624-c86c-b147-5f4e8f807b71	QA	QAT	634	Qatar 	Katar	\N
00040000-5624-c86c-7fe5-3c5d61083b78	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5624-c86c-89be-7d3dc7a5fc46	RO	ROU	642	Romania 	Romunija	\N
00040000-5624-c86c-6dfd-ca2f5c98c6fb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5624-c86c-99f1-a249b3155781	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5624-c86c-0169-1a07f38e90ab	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5624-c86c-fe1b-9cc9b527b14b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5624-c86c-d6d9-63980945bada	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5624-c86c-5d92-0a8e10ce60ec	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5624-c86c-d82d-b55ba604db1d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5624-c86c-c419-dc0b210d1800	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5624-c86c-ca76-f53797f61075	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5624-c86c-bcfd-4f1155bf741d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5624-c86c-5b56-6a851cc1dc65	SM	SMR	674	San Marino 	San Marino	\N
00040000-5624-c86c-a1be-615276453e92	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5624-c86c-c60b-062cbe986407	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5624-c86c-798c-a55633fb6a59	SN	SEN	686	Senegal 	Senegal	\N
00040000-5624-c86c-864f-e1a7fec4f1b2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5624-c86c-2fb5-0c0e2c965bf8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5624-c86c-6bc8-448f7f72c60d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5624-c86c-bbff-702dff72c7d4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5624-c86c-6624-9915cdc5190b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5624-c86c-12c9-b568e7693ea3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5624-c86c-0b63-a56d5be35aa1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5624-c86c-7beb-d11f53ad6a8e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5624-c86c-fecd-8299c593bd54	SO	SOM	706	Somalia 	Somalija	\N
00040000-5624-c86c-5b35-867b8b191aa3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5624-c86c-6043-646a37f5cf9c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5624-c86c-586e-aa4025b0e858	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5624-c86c-6503-89a271c50714	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5624-c86c-d923-ea45df67f5ea	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5624-c86c-7ed2-eeb79257c6cd	SD	SDN	729	Sudan 	Sudan	\N
00040000-5624-c86c-ca51-96b35d44fa54	SR	SUR	740	Suriname 	Surinam	\N
00040000-5624-c86c-2990-1b667779def6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5624-c86c-30fb-50b39e573e49	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5624-c86c-2bc7-67844a68fd02	SE	SWE	752	Sweden 	Švedska	\N
00040000-5624-c86c-6d06-580fa1f1da8b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5624-c86c-9020-0da6ed54a5a4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5624-c86c-bd86-9ccbe0c038c9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5624-c86c-ede9-75bf08900260	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5624-c86c-58d7-e72f842fe7dc	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5624-c86c-1b26-520a37c7d26b	TH	THA	764	Thailand 	Tajska	\N
00040000-5624-c86c-0d4d-261b369f6abd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5624-c86c-c22a-c55432e2f261	TG	TGO	768	Togo 	Togo	\N
00040000-5624-c86c-8745-8c9bcef419b9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5624-c86c-120e-2a8a8a1e07b2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5624-c86c-dc2b-5e26559ead98	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5624-c86c-cbf1-68e030fe47a9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5624-c86c-df18-ab75bc74cbd4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5624-c86c-6e71-c2eeb56755b7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5624-c86c-2c1c-23acac219c9e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-c86c-2df9-141fe15125bb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5624-c86c-6bf5-46343d93142a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5624-c86c-b8a0-2970b83a8b2b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5624-c86c-cad0-b5699194e172	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5624-c86c-7205-8b8a00b66e46	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5624-c86c-26e4-a66bf45080ed	US	USA	840	United States 	Združene države Amerike	\N
00040000-5624-c86c-76b0-f77f9b992997	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5624-c86c-2f16-076b14b269f6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5624-c86c-15de-4005cdd72868	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5624-c86c-d438-51ecd2a17f7f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5624-c86c-3b52-3c7542a841f6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5624-c86c-c017-52a11145b47e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5624-c86c-e3b5-fe1956bd2b2f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-c86c-606d-4e1a4f0e6c6e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5624-c86c-0258-d6e0de068711	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5624-c86c-eb0d-af3bf4d4723c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5624-c86c-caa1-f948db8935b4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5624-c86c-02b7-a9f7ccf2dc24	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5624-c86c-5398-4dd3992105a2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3107 (class 0 OID 22488360)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5624-c86e-3f1c-4038a4fbadd2	000e0000-5624-c86e-b979-e72c44f96b51	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-c86c-a6ff-9d704a37b044	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-c86e-3ee7-a4a5402392be	000e0000-5624-c86e-8807-7d56cdcb0eea	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-c86c-1aba-c25414087081	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-c86e-1098-1f02cc41e875	000e0000-5624-c86e-27b0-34d9d0fdaeee	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-c86c-a6ff-9d704a37b044	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-c86e-3459-53b2a20195d8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-c86e-c427-78349b492cb4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3092 (class 0 OID 22488161)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5624-c86e-2229-fbfdf41833ac	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-cc6b-ac223a11d993	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-c86c-cf4b-b269b19b46ce
000d0000-5624-c86e-e949-ea70ea3b9735	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-2fc0-75b95f9a60cc	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5624-c86c-7a83-8e807cd277f7
000d0000-5624-c86e-3195-fe9d94e6ad6b	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-7438-e53bc6009438	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5624-c86c-c288-2afe58d1c79c
000d0000-5624-c86e-a963-529fc88f626b	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-d7ea-c914b42bd376	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5624-c86c-f448-5aac619d7b8e
000d0000-5624-c86e-f0c0-c5b5d092f34e	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-3405-444c6e67ad5b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5624-c86c-f448-5aac619d7b8e
000d0000-5624-c86e-22c6-b4bc32d43c29	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-a20c-2562f925248f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-c86c-cf4b-b269b19b46ce
000d0000-5624-c86e-6860-94c012b7ff90	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-c8da-d4b76abd6348	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5624-c86c-cf4b-b269b19b46ce
000d0000-5624-c86e-f99e-2e0f51708e3b	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-0aff-88b024c07ed7	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5624-c86c-96f7-7e1ee1338577
000d0000-5624-c86e-9f65-bc9a464a2098	000e0000-5624-c86e-8807-7d56cdcb0eea	000c0000-5624-c86e-b426-4ab36159b5ac	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5624-c86c-8c96-042dcad93233
\.


--
-- TOC entry 3071 (class 0 OID 22487966)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22487933)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22487910)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5624-c86e-6bf4-d8499bfd76ae	00080000-5624-c86e-6456-2af6c4dcce0a	00090000-5624-c86e-981e-fe89c9c725c4	AK		igralka
\.


--
-- TOC entry 3081 (class 0 OID 22488075)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 22488599)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 22488611)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 22488633)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 22028081)
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
-- TOC entry 3085 (class 0 OID 22488100)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22487867)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5624-c86c-2972-e7338b4c02be	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5624-c86c-ef6b-4a5e4d7e5ac7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5624-c86c-caaa-a2778e7b7607	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5624-c86c-438a-9fac570b5f98	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5624-c86c-e4c8-267d9da0cc05	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5624-c86c-e4b3-ee0d50f29ecd	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5624-c86c-105a-973e9256c48d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5624-c86c-4421-141190a7f42b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-c86c-4d26-cf26e3acf5ae	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-c86c-9b40-46a3522d9108	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5624-c86c-01a6-ab86abcf07fd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5624-c86c-175f-e5c40163a3e2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5624-c86c-b0ff-20a385388d9f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5624-c86c-c830-398860c354e2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5624-c86c-0af9-f134c7f81d9e	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5624-c86e-aeea-5391bf56dcf8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5624-c86e-1596-92eb3c8c1993	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5624-c86e-2285-cbe5d20bd7ff	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5624-c86e-2fe3-f67749132702	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5624-c86e-f427-771a44974bd3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5624-c86f-7baa-99da808082d4	application.tenant.maticnopodjetje	string	s:36:"00080000-5624-c86f-4c11-1acec61624a7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3056 (class 0 OID 22487769)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5624-c86e-e46a-b5f36e5df75b	00000000-5624-c86e-aeea-5391bf56dcf8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5624-c86e-90e7-1f37bc15fd2d	00000000-5624-c86e-aeea-5391bf56dcf8	00010000-5624-c86c-d989-3fa37ca0f103	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5624-c86e-4370-f06c54f10190	00000000-5624-c86e-1596-92eb3c8c1993	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3060 (class 0 OID 22487833)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5624-c86e-2cc9-8829f32d821d	\N	00100000-5624-c86e-e775-b0deabce3970	00100000-5624-c86e-34d0-9312eeed2c3e	01	Gledališče Nimbis
00410000-5624-c86e-6b8f-5c9175ee7632	00410000-5624-c86e-2cc9-8829f32d821d	00100000-5624-c86e-e775-b0deabce3970	00100000-5624-c86e-34d0-9312eeed2c3e	02	Tehnika
\.


--
-- TOC entry 3057 (class 0 OID 22487780)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5624-c86e-daa0-5638ac8940ec	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5624-c86e-6c13-fb54ecc2e111	00010000-5624-c86e-dbad-35cfb15385a7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5624-c86e-03e7-962308c0223c	00010000-5624-c86e-6989-9e7957c5376e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5624-c86e-a246-4544e1e7287c	00010000-5624-c86e-f64d-f942f47f75cd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5624-c86e-80d6-4c31341fe926	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5624-c86e-f97c-a86b9e27b849	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5624-c86e-9cdc-f93b23dab954	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5624-c86e-71e9-5fb2a9dd0eab	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5624-c86e-981e-fe89c9c725c4	00010000-5624-c86e-e751-42eb50662cc4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5624-c86e-6451-64db2789af87	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5624-c86e-e221-1e4a411a6374	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-c86e-720f-70e899b25550	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5624-c86e-6cdd-995797cb0d5e	00010000-5624-c86e-f6cb-b133cce5c3ca	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-c86e-e5c2-2e8763c279d2	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-c86e-16b8-75470f2d8530	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-c86e-03be-4701bc3e4b18	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-c86e-33f6-72d99b9b2e10	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5624-c86e-7fcb-18c8857ef29b	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3051 (class 0 OID 22487724)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5624-c86c-b309-51f58cb11a73	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5624-c86c-a5ab-0fdc3c9b09a8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5624-c86c-44d1-b126c5e9abfa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5624-c86c-cffd-545f93f373dc	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5624-c86c-aac2-99284071e434	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5624-c86c-5caa-8c97f5316540	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5624-c86c-bf48-d49e01cd4422	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5624-c86c-b8e4-2ab6b987279f	Abonma-read	Abonma - branje	f
00030000-5624-c86c-21f0-261cf5d92f57	Abonma-write	Abonma - spreminjanje	f
00030000-5624-c86c-1418-75ebe3e4b2d0	Alternacija-read	Alternacija - branje	f
00030000-5624-c86c-5e81-815fce0d2d57	Alternacija-write	Alternacija - spreminjanje	f
00030000-5624-c86c-71b0-2cafd2779f48	Arhivalija-read	Arhivalija - branje	f
00030000-5624-c86c-9d68-3091f618a139	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5624-c86c-acf3-d8d8a2662092	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5624-c86c-12ef-ee29e5663968	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5624-c86c-4037-83bbcd2c6b0a	Besedilo-read	Besedilo - branje	f
00030000-5624-c86c-2da2-d63d80fa8c12	Besedilo-write	Besedilo - spreminjanje	f
00030000-5624-c86c-bad1-21f6f3ec66f0	DogodekIzven-read	DogodekIzven - branje	f
00030000-5624-c86c-770f-3c638d4995ef	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5624-c86c-af6e-99fc5172e1eb	Dogodek-read	Dogodek - branje	f
00030000-5624-c86c-b66c-796fcb1ad714	Dogodek-write	Dogodek - spreminjanje	f
00030000-5624-c86c-585b-ee561b828530	DrugiVir-read	DrugiVir - branje	f
00030000-5624-c86c-c81e-c2d77aff669e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5624-c86c-18e0-bad2dcd40bbe	Drzava-read	Drzava - branje	f
00030000-5624-c86c-7e6f-6a14d897b338	Drzava-write	Drzava - spreminjanje	f
00030000-5624-c86c-91db-e00fb6025a87	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5624-c86c-ed98-af44de2c4e3e	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5624-c86c-8fef-5552ff06566b	Funkcija-read	Funkcija - branje	f
00030000-5624-c86c-a31d-01793ae084ab	Funkcija-write	Funkcija - spreminjanje	f
00030000-5624-c86c-911c-f0f49507b5fb	Gostovanje-read	Gostovanje - branje	f
00030000-5624-c86c-cb5b-c899c7720ef0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5624-c86c-63bf-8fff9a75dca9	Gostujoca-read	Gostujoca - branje	f
00030000-5624-c86c-f167-b06b2211fe38	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5624-c86c-9cba-95beb6c7c50a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5624-c86c-3383-2747199e3e1b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5624-c86c-703b-13185faa53b5	Kupec-read	Kupec - branje	f
00030000-5624-c86c-9363-8a38bce44bfe	Kupec-write	Kupec - spreminjanje	f
00030000-5624-c86c-4444-331b52f72532	NacinPlacina-read	NacinPlacina - branje	f
00030000-5624-c86c-6f2d-7729fb20e77d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5624-c86c-7ad0-293878043642	Option-read	Option - branje	f
00030000-5624-c86c-7f7d-5a4a0be977c4	Option-write	Option - spreminjanje	f
00030000-5624-c86c-34d9-75bc415e3e71	OptionValue-read	OptionValue - branje	f
00030000-5624-c86c-7784-f02f15690604	OptionValue-write	OptionValue - spreminjanje	f
00030000-5624-c86c-a78d-72b2c633306e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5624-c86c-81ea-7569e7a03125	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5624-c86c-68dc-96a56e92c216	Oseba-read	Oseba - branje	f
00030000-5624-c86c-9736-fc38e5b8573c	Oseba-write	Oseba - spreminjanje	f
00030000-5624-c86c-7aca-64597de2e5ed	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5624-c86c-c919-9255253eec39	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5624-c86c-aedc-b0f73efb388b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5624-c86c-5c94-94fab813e7db	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5624-c86c-86e4-15c22124bfe9	Pogodba-read	Pogodba - branje	f
00030000-5624-c86c-4729-1baad71365e1	Pogodba-write	Pogodba - spreminjanje	f
00030000-5624-c86c-e969-92ee7e389a21	Popa-read	Popa - branje	f
00030000-5624-c86c-c9f7-62423c3bfe51	Popa-write	Popa - spreminjanje	f
00030000-5624-c86c-13f7-d758e0c5c0e7	Posta-read	Posta - branje	f
00030000-5624-c86c-b8c7-8349c6c199ba	Posta-write	Posta - spreminjanje	f
00030000-5624-c86c-883f-c03f0bd0ef1c	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5624-c86c-c08d-c73311d4b0d7	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5624-c86c-9323-51745cf38ae4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5624-c86c-a0a3-c1fcf8505ceb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5624-c86c-d42a-a3258eec80ad	PostniNaslov-read	PostniNaslov - branje	f
00030000-5624-c86c-97ea-03192ef8d6d8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5624-c86c-9d7a-5ae2eb0eb5ea	Predstava-read	Predstava - branje	f
00030000-5624-c86c-a990-f6804f2819e1	Predstava-write	Predstava - spreminjanje	f
00030000-5624-c86c-83cc-303969eb08e8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5624-c86c-f6f8-6308e6535410	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5624-c86c-b177-1f1fc700fcb6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5624-c86c-a972-20be7e8cac38	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5624-c86c-a739-098ce6ac0f3f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5624-c86c-ae46-242233dfb002	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5624-c86c-6de3-f1d1bb739c65	ProgramDela-read	ProgramDela - branje	f
00030000-5624-c86c-5928-79849b464089	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5624-c86c-3944-89290cbe0741	ProgramFestival-read	ProgramFestival - branje	f
00030000-5624-c86c-d2dc-b932a074abc7	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5624-c86c-fb92-f06f208eaefe	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5624-c86c-0576-10127052e888	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5624-c86c-2596-192f9838797a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5624-c86c-77a6-5ee38aa6b216	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5624-c86c-64e5-2e89f2d3d358	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5624-c86c-c0a1-451b4522f0fb	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5624-c86c-b16f-6bdca6275fa1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5624-c86c-85c7-6b4c98f00386	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5624-c86c-bdeb-d473f236dd07	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5624-c86c-4d2a-8cccd509e4c1	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5624-c86c-7207-8a5da9c406de	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5624-c86c-0d50-588620bf5d59	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5624-c86c-df06-72749a6d0d9d	ProgramRazno-read	ProgramRazno - branje	f
00030000-5624-c86c-bec4-1891e945c1f6	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5624-c86c-4be3-224b17f84bca	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5624-c86c-f16f-bd0dc098ed59	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5624-c86c-c93e-ef219cc4100e	Prostor-read	Prostor - branje	f
00030000-5624-c86c-4269-257721822536	Prostor-write	Prostor - spreminjanje	f
00030000-5624-c86c-0a0c-ac4f2ab03c0d	Racun-read	Racun - branje	f
00030000-5624-c86c-3f03-37835e18fd4d	Racun-write	Racun - spreminjanje	f
00030000-5624-c86c-6378-29f5d255da44	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5624-c86c-14ac-51302768745b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5624-c86c-5986-04a8e013520d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5624-c86c-2d7a-f2acf30676ca	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5624-c86c-9304-6eeb3368ca92	Rekvizit-read	Rekvizit - branje	f
00030000-5624-c86c-a5f0-1988b2a72e6b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5624-c86c-be9a-806f24c97580	Revizija-read	Revizija - branje	f
00030000-5624-c86c-5b90-bc716086e301	Revizija-write	Revizija - spreminjanje	f
00030000-5624-c86c-8a26-4d76296aade9	Rezervacija-read	Rezervacija - branje	f
00030000-5624-c86c-9c44-2cd7551859c2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5624-c86c-6f23-feacbd79e4ff	SedezniRed-read	SedezniRed - branje	f
00030000-5624-c86c-1e6b-6108a3b85f8d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5624-c86c-09cf-0171e459ddd6	Sedez-read	Sedez - branje	f
00030000-5624-c86c-9cb0-2484d31d9a0f	Sedez-write	Sedez - spreminjanje	f
00030000-5624-c86c-b05f-217fc770997a	Sezona-read	Sezona - branje	f
00030000-5624-c86c-fd27-36c571669446	Sezona-write	Sezona - spreminjanje	f
00030000-5624-c86c-757e-6afcd934d16a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5624-c86c-ee8b-f141f3fd079c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5624-c86c-fe6e-298645da6314	Stevilcenje-read	Stevilcenje - branje	f
00030000-5624-c86c-12e2-a86d20a5b3f3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5624-c86c-a9e5-f0b2c0df6694	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5624-c86c-53b1-3fcc75b75b79	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5624-c86c-9c63-376d31bc0740	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5624-c86c-8deb-51f27c406082	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5624-c86c-e6aa-ed2a7a447332	Telefonska-read	Telefonska - branje	f
00030000-5624-c86c-16e3-815eeee1b7ee	Telefonska-write	Telefonska - spreminjanje	f
00030000-5624-c86c-1daa-1fbb520a87d8	TerminStoritve-read	TerminStoritve - branje	f
00030000-5624-c86c-b9b5-5de6a93e6335	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5624-c86c-f865-9ce7e19135ee	TipFunkcije-read	TipFunkcije - branje	f
00030000-5624-c86c-4802-1dd3301e1d6c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5624-c86c-88c5-6f8bf35f5901	TipPopa-read	TipPopa - branje	f
00030000-5624-c86c-ad30-41e33f138045	TipPopa-write	TipPopa - spreminjanje	f
00030000-5624-c86c-e071-0f4f410cc960	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5624-c86c-97c3-5f5ea163615f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5624-c86c-716b-aa0457f4258b	TipVaje-read	TipVaje - branje	f
00030000-5624-c86c-455f-255123a0fddc	TipVaje-write	TipVaje - spreminjanje	f
00030000-5624-c86c-a2a5-5b848d8d93d5	Trr-read	Trr - branje	f
00030000-5624-c86c-0049-f7a7f1d039fb	Trr-write	Trr - spreminjanje	f
00030000-5624-c86c-e620-a7f426611c44	Uprizoritev-read	Uprizoritev - branje	f
00030000-5624-c86c-b074-477ea3ecf5f6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5624-c86c-ba3c-1ef950896088	Vaja-read	Vaja - branje	f
00030000-5624-c86c-7ddc-34c5668d7d1c	Vaja-write	Vaja - spreminjanje	f
00030000-5624-c86c-5c16-df8e9af69557	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5624-c86c-6442-97cb6fcb6fa9	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5624-c86c-322c-3822bdabc330	VrstaStroska-read	VrstaStroska - branje	f
00030000-5624-c86c-aa81-195cc2b109ff	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5624-c86c-bffc-ed678fc6f73f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5624-c86c-4ae6-09f5cb83eecb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5624-c86c-4dc1-0e2b88007099	Zasedenost-read	Zasedenost - branje	f
00030000-5624-c86c-f8b0-aea2561f4e33	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5624-c86c-59b1-7fcf46abb920	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5624-c86c-0bda-2bbf3f097ce9	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5624-c86c-9322-4e226cb6df32	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5624-c86c-9cf2-5e4d9ce1515a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5624-c86c-fbe0-1c4c1344f8b2	Job-read	Branje opravil - samo zase - branje	f
00030000-5624-c86c-e93a-f1e1c72706a1	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5624-c86c-c477-845c6aa7062b	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5624-c86c-02ac-48deaab3f20b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5624-c86c-ce47-05458dfaccd1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5624-c86c-3dd1-1ec4377e4f5c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5624-c86c-333b-10650005cff4	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5624-c86c-c8d1-713206335d84	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-c86c-dffc-1bebc27a4b4f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-c86c-ea55-a6652a4c2900	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-c86c-a06c-9712b5b5210d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-c86c-efb7-6ce6ecac9932	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5624-c86c-a477-c5def7261a3e	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5624-c86c-2488-2e668d37cf0d	Datoteka-write	Datoteka - spreminjanje	f
00030000-5624-c86c-4baa-0cde9a0330dc	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3053 (class 0 OID 22487743)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5624-c86c-f4fa-687a389de4c5	00030000-5624-c86c-a5ab-0fdc3c9b09a8
00020000-5624-c86c-97f0-6dfef83079d6	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-b8e4-2ab6b987279f
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-21f0-261cf5d92f57
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-1418-75ebe3e4b2d0
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-5e81-815fce0d2d57
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-71b0-2cafd2779f48
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-af6e-99fc5172e1eb
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-cffd-545f93f373dc
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-b66c-796fcb1ad714
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-7e6f-6a14d897b338
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-8fef-5552ff06566b
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-a31d-01793ae084ab
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-911c-f0f49507b5fb
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-cb5b-c899c7720ef0
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-63bf-8fff9a75dca9
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-f167-b06b2211fe38
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-9cba-95beb6c7c50a
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-3383-2747199e3e1b
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-7ad0-293878043642
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-34d9-75bc415e3e71
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-68dc-96a56e92c216
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-9736-fc38e5b8573c
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-e969-92ee7e389a21
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-c9f7-62423c3bfe51
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-13f7-d758e0c5c0e7
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-b8c7-8349c6c199ba
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-d42a-a3258eec80ad
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-97ea-03192ef8d6d8
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-9d7a-5ae2eb0eb5ea
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-a990-f6804f2819e1
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-a739-098ce6ac0f3f
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-ae46-242233dfb002
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-c93e-ef219cc4100e
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-4269-257721822536
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-5986-04a8e013520d
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-2d7a-f2acf30676ca
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-9304-6eeb3368ca92
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-a5f0-1988b2a72e6b
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-b05f-217fc770997a
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-fd27-36c571669446
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-f865-9ce7e19135ee
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-e620-a7f426611c44
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-b074-477ea3ecf5f6
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-ba3c-1ef950896088
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-7ddc-34c5668d7d1c
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-4dc1-0e2b88007099
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-f8b0-aea2561f4e33
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-59b1-7fcf46abb920
00020000-5624-c86c-bd8b-80b850ae7815	00030000-5624-c86c-9322-4e226cb6df32
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-b8e4-2ab6b987279f
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-71b0-2cafd2779f48
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-af6e-99fc5172e1eb
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-911c-f0f49507b5fb
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-63bf-8fff9a75dca9
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-9cba-95beb6c7c50a
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-3383-2747199e3e1b
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-7ad0-293878043642
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-34d9-75bc415e3e71
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-68dc-96a56e92c216
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-9736-fc38e5b8573c
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-e969-92ee7e389a21
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-13f7-d758e0c5c0e7
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-d42a-a3258eec80ad
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-97ea-03192ef8d6d8
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-9d7a-5ae2eb0eb5ea
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-c93e-ef219cc4100e
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-5986-04a8e013520d
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-9304-6eeb3368ca92
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-b05f-217fc770997a
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-e6aa-ed2a7a447332
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-16e3-815eeee1b7ee
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-a2a5-5b848d8d93d5
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-0049-f7a7f1d039fb
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-bffc-ed678fc6f73f
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-4ae6-09f5cb83eecb
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-59b1-7fcf46abb920
00020000-5624-c86c-1000-736fb6a41ac0	00030000-5624-c86c-9322-4e226cb6df32
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-b8e4-2ab6b987279f
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-1418-75ebe3e4b2d0
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-71b0-2cafd2779f48
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-9d68-3091f618a139
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-4037-83bbcd2c6b0a
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-bad1-21f6f3ec66f0
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-af6e-99fc5172e1eb
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-8fef-5552ff06566b
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-911c-f0f49507b5fb
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-63bf-8fff9a75dca9
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-9cba-95beb6c7c50a
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-7ad0-293878043642
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-34d9-75bc415e3e71
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-68dc-96a56e92c216
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-e969-92ee7e389a21
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-13f7-d758e0c5c0e7
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-9d7a-5ae2eb0eb5ea
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-a739-098ce6ac0f3f
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-c93e-ef219cc4100e
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-5986-04a8e013520d
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-9304-6eeb3368ca92
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-b05f-217fc770997a
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-f865-9ce7e19135ee
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-ba3c-1ef950896088
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-4dc1-0e2b88007099
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-59b1-7fcf46abb920
00020000-5624-c86c-b2ae-21c758320221	00030000-5624-c86c-9322-4e226cb6df32
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-b8e4-2ab6b987279f
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-21f0-261cf5d92f57
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-5e81-815fce0d2d57
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-71b0-2cafd2779f48
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-af6e-99fc5172e1eb
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-911c-f0f49507b5fb
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-63bf-8fff9a75dca9
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-7ad0-293878043642
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-34d9-75bc415e3e71
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-e969-92ee7e389a21
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-13f7-d758e0c5c0e7
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-9d7a-5ae2eb0eb5ea
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-c93e-ef219cc4100e
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-5986-04a8e013520d
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-9304-6eeb3368ca92
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-b05f-217fc770997a
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-f865-9ce7e19135ee
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-59b1-7fcf46abb920
00020000-5624-c86c-808e-78cdefd439b0	00030000-5624-c86c-9322-4e226cb6df32
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-b8e4-2ab6b987279f
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-71b0-2cafd2779f48
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-af6e-99fc5172e1eb
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-911c-f0f49507b5fb
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-63bf-8fff9a75dca9
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-7ad0-293878043642
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-34d9-75bc415e3e71
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-e969-92ee7e389a21
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-13f7-d758e0c5c0e7
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-9d7a-5ae2eb0eb5ea
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-c93e-ef219cc4100e
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-5986-04a8e013520d
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-9304-6eeb3368ca92
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-b05f-217fc770997a
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-1daa-1fbb520a87d8
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-44d1-b126c5e9abfa
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-f865-9ce7e19135ee
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-59b1-7fcf46abb920
00020000-5624-c86c-1e75-8faa87126d9e	00030000-5624-c86c-9322-4e226cb6df32
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b309-51f58cb11a73
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a5ab-0fdc3c9b09a8
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-44d1-b126c5e9abfa
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-cffd-545f93f373dc
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-aac2-99284071e434
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5caa-8c97f5316540
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-bf48-d49e01cd4422
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b8e4-2ab6b987279f
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-21f0-261cf5d92f57
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-1418-75ebe3e4b2d0
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5e81-815fce0d2d57
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-71b0-2cafd2779f48
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9d68-3091f618a139
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4037-83bbcd2c6b0a
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-2da2-d63d80fa8c12
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-bad1-21f6f3ec66f0
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-770f-3c638d4995ef
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-af6e-99fc5172e1eb
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b66c-796fcb1ad714
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-18e0-bad2dcd40bbe
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7e6f-6a14d897b338
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-585b-ee561b828530
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-c81e-c2d77aff669e
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-91db-e00fb6025a87
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-ed98-af44de2c4e3e
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-8fef-5552ff06566b
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a31d-01793ae084ab
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-911c-f0f49507b5fb
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-cb5b-c899c7720ef0
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-63bf-8fff9a75dca9
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-f167-b06b2211fe38
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9cba-95beb6c7c50a
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-3383-2747199e3e1b
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-703b-13185faa53b5
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9363-8a38bce44bfe
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4444-331b52f72532
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-6f2d-7729fb20e77d
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7ad0-293878043642
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7f7d-5a4a0be977c4
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-34d9-75bc415e3e71
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7784-f02f15690604
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-68dc-96a56e92c216
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9736-fc38e5b8573c
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7aca-64597de2e5ed
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-c919-9255253eec39
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-aedc-b0f73efb388b
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5c94-94fab813e7db
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-86e4-15c22124bfe9
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4729-1baad71365e1
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-e969-92ee7e389a21
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-c9f7-62423c3bfe51
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-13f7-d758e0c5c0e7
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b8c7-8349c6c199ba
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-883f-c03f0bd0ef1c
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-c08d-c73311d4b0d7
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9323-51745cf38ae4
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a0a3-c1fcf8505ceb
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-d42a-a3258eec80ad
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-97ea-03192ef8d6d8
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9d7a-5ae2eb0eb5ea
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a990-f6804f2819e1
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-83cc-303969eb08e8
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-f6f8-6308e6535410
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b177-1f1fc700fcb6
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a972-20be7e8cac38
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a739-098ce6ac0f3f
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-ae46-242233dfb002
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-6de3-f1d1bb739c65
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5928-79849b464089
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-3944-89290cbe0741
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-d2dc-b932a074abc7
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-fb92-f06f208eaefe
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-0576-10127052e888
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-2596-192f9838797a
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-77a6-5ee38aa6b216
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-64e5-2e89f2d3d358
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-c0a1-451b4522f0fb
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b16f-6bdca6275fa1
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-85c7-6b4c98f00386
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-bdeb-d473f236dd07
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4d2a-8cccd509e4c1
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7207-8a5da9c406de
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-0d50-588620bf5d59
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-df06-72749a6d0d9d
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-bec4-1891e945c1f6
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4be3-224b17f84bca
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-f16f-bd0dc098ed59
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-c93e-ef219cc4100e
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4269-257721822536
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-0a0c-ac4f2ab03c0d
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-3f03-37835e18fd4d
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-6378-29f5d255da44
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-14ac-51302768745b
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5986-04a8e013520d
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-2d7a-f2acf30676ca
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9304-6eeb3368ca92
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a5f0-1988b2a72e6b
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-be9a-806f24c97580
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5b90-bc716086e301
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-8a26-4d76296aade9
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9c44-2cd7551859c2
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-6f23-feacbd79e4ff
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-1e6b-6108a3b85f8d
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-09cf-0171e459ddd6
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9cb0-2484d31d9a0f
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b05f-217fc770997a
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-fd27-36c571669446
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-757e-6afcd934d16a
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-ee8b-f141f3fd079c
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-fe6e-298645da6314
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-12e2-a86d20a5b3f3
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a9e5-f0b2c0df6694
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-53b1-3fcc75b75b79
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9c63-376d31bc0740
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-8deb-51f27c406082
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-e6aa-ed2a7a447332
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-16e3-815eeee1b7ee
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-1daa-1fbb520a87d8
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b9b5-5de6a93e6335
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-f865-9ce7e19135ee
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4802-1dd3301e1d6c
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-e071-0f4f410cc960
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-97c3-5f5ea163615f
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-a2a5-5b848d8d93d5
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-0049-f7a7f1d039fb
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-e620-a7f426611c44
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-b074-477ea3ecf5f6
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-ba3c-1ef950896088
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-7ddc-34c5668d7d1c
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-5c16-df8e9af69557
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-6442-97cb6fcb6fa9
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-322c-3822bdabc330
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-aa81-195cc2b109ff
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-bffc-ed678fc6f73f
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4ae6-09f5cb83eecb
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-4dc1-0e2b88007099
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-f8b0-aea2561f4e33
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-59b1-7fcf46abb920
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-0bda-2bbf3f097ce9
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9322-4e226cb6df32
00020000-5624-c86e-6c45-4332796d7063	00030000-5624-c86c-9cf2-5e4d9ce1515a
\.


--
-- TOC entry 3086 (class 0 OID 22488107)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22488141)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 22488278)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5624-c86e-bf64-1a39eeb21afd	00090000-5624-c86e-daa0-5638ac8940ec	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5624-c86e-abea-031a4bd2e6b0	00090000-5624-c86e-f97c-a86b9e27b849	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5624-c86e-533b-1a8b5b584e79	00090000-5624-c86e-6cdd-995797cb0d5e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5624-c86e-4ed3-0199bcc0904f	00090000-5624-c86e-6451-64db2789af87	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3059 (class 0 OID 22487813)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5624-c86e-6456-2af6c4dcce0a	\N	00040000-5624-c86c-0b63-a56d5be35aa1	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-9ef1-33747bce09e9	\N	00040000-5624-c86c-0b63-a56d5be35aa1	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5624-c86e-9d48-fa2e73dccf2f	\N	00040000-5624-c86c-0b63-a56d5be35aa1	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-7957-7ade9521419c	\N	00040000-5624-c86c-0b63-a56d5be35aa1	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-5e23-4963e00b0987	\N	00040000-5624-c86c-0b63-a56d5be35aa1	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-bf35-ce36035aa47b	\N	00040000-5624-c86c-d189-2982d019a8e2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-f6c3-21e48d4b9963	\N	00040000-5624-c86c-9c23-27fc596dc213	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-8025-113994514e52	\N	00040000-5624-c86c-37ba-224521fb7591	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86e-f389-9766312a618a	\N	00040000-5624-c86c-353b-ab589e06b144	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-c86f-4c11-1acec61624a7	\N	00040000-5624-c86c-0b63-a56d5be35aa1	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3062 (class 0 OID 22487859)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5624-c86b-0655-613be04e0807	8341	Adlešiči
00050000-5624-c86b-587c-cbe87047df14	5270	Ajdovščina
00050000-5624-c86b-9eaa-30faf057584b	6280	Ankaran/Ancarano
00050000-5624-c86b-1f2d-00ea3736df09	9253	Apače
00050000-5624-c86b-20b9-51b776f5113c	8253	Artiče
00050000-5624-c86b-3330-1b7c047ec909	4275	Begunje na Gorenjskem
00050000-5624-c86b-1543-9331ef8db29b	1382	Begunje pri Cerknici
00050000-5624-c86b-d07d-ab7506cbc98f	9231	Beltinci
00050000-5624-c86b-d626-e714a7e1ee60	2234	Benedikt
00050000-5624-c86b-8efb-4277c1ee11b1	2345	Bistrica ob Dravi
00050000-5624-c86b-1003-400e3e085aac	3256	Bistrica ob Sotli
00050000-5624-c86b-7c50-2040e3fe77dd	8259	Bizeljsko
00050000-5624-c86b-568f-6091717fa909	1223	Blagovica
00050000-5624-c86b-1584-77f8da1dade5	8283	Blanca
00050000-5624-c86b-53ca-5aebec326e04	4260	Bled
00050000-5624-c86b-0e6d-2b80ea556745	4273	Blejska Dobrava
00050000-5624-c86b-dca3-2cfd3da420fd	9265	Bodonci
00050000-5624-c86b-75bd-13fd5bc52e68	9222	Bogojina
00050000-5624-c86b-2b2b-903e149d2d30	4263	Bohinjska Bela
00050000-5624-c86b-aaf9-76cf55807bcf	4264	Bohinjska Bistrica
00050000-5624-c86b-27d8-516add3c5a34	4265	Bohinjsko jezero
00050000-5624-c86b-d0cb-edccc2be60fb	1353	Borovnica
00050000-5624-c86b-6b4b-410598123f5b	8294	Boštanj
00050000-5624-c86b-789f-c6f422429ffc	5230	Bovec
00050000-5624-c86b-0000-113c45009351	5295	Branik
00050000-5624-c86b-24cc-b9fecb9633ab	3314	Braslovče
00050000-5624-c86b-0274-947c90947e05	5223	Breginj
00050000-5624-c86b-c62f-eac9e32037ca	8280	Brestanica
00050000-5624-c86b-9363-a705f58eb55e	2354	Bresternica
00050000-5624-c86b-1151-275898089506	4243	Brezje
00050000-5624-c86b-74fc-20bea7820507	1351	Brezovica pri Ljubljani
00050000-5624-c86b-8da2-04ed93240c6f	8250	Brežice
00050000-5624-c86b-fdd8-333334dd760c	4210	Brnik - Aerodrom
00050000-5624-c86b-8e22-c292fafd2510	8321	Brusnice
00050000-5624-c86b-3ec1-bb6de0c505a0	3255	Buče
00050000-5624-c86b-f3ca-ea1e2e3eb336	8276	Bučka 
00050000-5624-c86b-98c6-5deace388feb	9261	Cankova
00050000-5624-c86b-2715-fd648b17a758	3000	Celje 
00050000-5624-c86b-86fe-b34ef08a18ed	3001	Celje - poštni predali
00050000-5624-c86b-4649-daa525aed963	4207	Cerklje na Gorenjskem
00050000-5624-c86b-80e4-95fcb6874669	8263	Cerklje ob Krki
00050000-5624-c86b-899e-e7b2d12e89d1	1380	Cerknica
00050000-5624-c86b-8087-38a60512ca49	5282	Cerkno
00050000-5624-c86b-6f6c-102bc170d62f	2236	Cerkvenjak
00050000-5624-c86b-5294-ec425542c57e	2215	Ceršak
00050000-5624-c86b-754d-20dfa3eb88e9	2326	Cirkovce
00050000-5624-c86b-1a08-08489cda35cd	2282	Cirkulane
00050000-5624-c86b-e088-8fccc47879c8	5273	Col
00050000-5624-c86b-4dd1-fe96c4885100	8251	Čatež ob Savi
00050000-5624-c86b-32e4-0d95aef5062a	1413	Čemšenik
00050000-5624-c86b-33b8-e5ef9394e37d	5253	Čepovan
00050000-5624-c86b-3683-7d99fa8f4d6f	9232	Črenšovci
00050000-5624-c86b-40b3-9807a55c11bc	2393	Črna na Koroškem
00050000-5624-c86b-7247-a795625e1c49	6275	Črni Kal
00050000-5624-c86b-5d38-5b6a83cfeabf	5274	Črni Vrh nad Idrijo
00050000-5624-c86b-2732-6299ae78b7ce	5262	Črniče
00050000-5624-c86b-17aa-f0a4d00452d4	8340	Črnomelj
00050000-5624-c86b-c0aa-292dfd7c1c4d	6271	Dekani
00050000-5624-c86b-128b-46a1f9fde960	5210	Deskle
00050000-5624-c86b-5936-62483f4e2913	2253	Destrnik
00050000-5624-c86b-a4d5-fd0448060cd5	6215	Divača
00050000-5624-c86c-9b81-a295396f52eb	1233	Dob
00050000-5624-c86c-49e5-cfa483be9203	3224	Dobje pri Planini
00050000-5624-c86c-0323-e00b1e1a6d7e	8257	Dobova
00050000-5624-c86c-1a7b-2f1faf2b283f	1423	Dobovec
00050000-5624-c86c-03de-9de1ddd47d1a	5263	Dobravlje
00050000-5624-c86c-9af1-96ef50094541	3204	Dobrna
00050000-5624-c86c-bd48-af89eacef6d1	8211	Dobrnič
00050000-5624-c86c-169c-8d52fd2a6dd0	1356	Dobrova
00050000-5624-c86c-6e41-858840b2b315	9223	Dobrovnik/Dobronak 
00050000-5624-c86c-1d04-b5aadaa482c6	5212	Dobrovo v Brdih
00050000-5624-c86c-bd63-213d47a83d93	1431	Dol pri Hrastniku
00050000-5624-c86c-8a0e-d7c5cbb15640	1262	Dol pri Ljubljani
00050000-5624-c86c-35fb-11cbd9bf8019	1273	Dole pri Litiji
00050000-5624-c86c-ce04-da6c9128cb3d	1331	Dolenja vas
00050000-5624-c86c-664e-8ade392e41ea	8350	Dolenjske Toplice
00050000-5624-c86c-a24a-173ab19e2c90	1230	Domžale
00050000-5624-c86c-dd27-178fec91e797	2252	Dornava
00050000-5624-c86c-5b31-fe584076b298	5294	Dornberk
00050000-5624-c86c-686b-2aef4185e45f	1319	Draga
00050000-5624-c86c-3f7e-a9dc3fa5f246	8343	Dragatuš
00050000-5624-c86c-3f4e-520f56485b68	3222	Dramlje
00050000-5624-c86c-bd15-40a2a2c4d319	2370	Dravograd
00050000-5624-c86c-86d0-9a50dda9c1f3	4203	Duplje
00050000-5624-c86c-3b78-1302754f15a2	6221	Dutovlje
00050000-5624-c86c-601f-743a41c35b8f	8361	Dvor
00050000-5624-c86c-00a2-b4940c244d93	2343	Fala
00050000-5624-c86c-67e0-f91b777b72ba	9208	Fokovci
00050000-5624-c86c-65fd-f1ad2d8c09ff	2313	Fram
00050000-5624-c86c-eb40-e76fa17500d3	3213	Frankolovo
00050000-5624-c86c-5e1f-ad0b87db7e3a	1274	Gabrovka
00050000-5624-c86c-11c0-2e0d987f42c7	8254	Globoko
00050000-5624-c86c-b876-f4ca42c68a68	5275	Godovič
00050000-5624-c86c-10d1-c7f0e547406d	4204	Golnik
00050000-5624-c86c-a64e-7421211e568f	3303	Gomilsko
00050000-5624-c86c-4673-bf95a2e1caae	4224	Gorenja vas
00050000-5624-c86c-e5b7-eafc928a4f6d	3263	Gorica pri Slivnici
00050000-5624-c86c-5b0d-8dc966ea9a19	2272	Gorišnica
00050000-5624-c86c-422c-6f27bc3084fe	9250	Gornja Radgona
00050000-5624-c86c-635a-82003be893e2	3342	Gornji Grad
00050000-5624-c86c-7a0c-ca342fd25f72	4282	Gozd Martuljek
00050000-5624-c86c-ca8d-17bc341b4238	6272	Gračišče
00050000-5624-c86c-cf25-77b03e658291	9264	Grad
00050000-5624-c86c-4d2f-fd3f0589841e	8332	Gradac
00050000-5624-c86c-306b-48ceec7b8241	1384	Grahovo
00050000-5624-c86c-8a0e-8c6df001b574	5242	Grahovo ob Bači
00050000-5624-c86c-7411-f830e8654f2b	5251	Grgar
00050000-5624-c86c-7a77-3dcacb442760	3302	Griže
00050000-5624-c86c-3b2c-113f4cc54117	3231	Grobelno
00050000-5624-c86c-83d2-25df73ca85b9	1290	Grosuplje
00050000-5624-c86c-15d2-d19bab230bf0	2288	Hajdina
00050000-5624-c86c-86e3-eebd960732a3	8362	Hinje
00050000-5624-c86c-72a0-2fde65f2747e	2311	Hoče
00050000-5624-c86c-e434-e5e13a855c81	9205	Hodoš/Hodos
00050000-5624-c86c-05ef-91c30de11395	1354	Horjul
00050000-5624-c86c-e6de-c8985251b543	1372	Hotedršica
00050000-5624-c86c-4a02-6c344167175f	1430	Hrastnik
00050000-5624-c86c-cc0c-6cb14bc0d52e	6225	Hruševje
00050000-5624-c86c-68f8-3acbd3fde716	4276	Hrušica
00050000-5624-c86c-fd88-8b2a8137e777	5280	Idrija
00050000-5624-c86c-f0ae-0d8f564f8bda	1292	Ig
00050000-5624-c86c-0215-2b277449cb23	6250	Ilirska Bistrica
00050000-5624-c86c-34e2-4eb3ee656837	6251	Ilirska Bistrica-Trnovo
00050000-5624-c86c-3c38-b7a1cc22735e	1295	Ivančna Gorica
00050000-5624-c86c-f657-d84e418f2585	2259	Ivanjkovci
00050000-5624-c86c-bba5-0af4235a8e51	1411	Izlake
00050000-5624-c86c-e350-ce45de6462ff	6310	Izola/Isola
00050000-5624-c86c-f9cc-6c8cb62f6f59	2222	Jakobski Dol
00050000-5624-c86c-667f-0d926c686d57	2221	Jarenina
00050000-5624-c86c-4cf9-62f00e82e11f	6254	Jelšane
00050000-5624-c86c-8cdd-423a7426d0c3	4270	Jesenice
00050000-5624-c86c-f9e1-39d9c1db543c	8261	Jesenice na Dolenjskem
00050000-5624-c86c-6e4a-6e1cd1b37b5c	3273	Jurklošter
00050000-5624-c86c-dadd-42b7e13a3311	2223	Jurovski Dol
00050000-5624-c86c-d056-06f90b1d9bbb	2256	Juršinci
00050000-5624-c86c-b586-fc239949cb31	5214	Kal nad Kanalom
00050000-5624-c86c-5979-c2fbd8106c6d	3233	Kalobje
00050000-5624-c86c-d544-188eeade9705	4246	Kamna Gorica
00050000-5624-c86c-bf79-677f200f5bc9	2351	Kamnica
00050000-5624-c86c-224f-0bb0eda31e81	1241	Kamnik
00050000-5624-c86c-5341-acb9256c7e56	5213	Kanal
00050000-5624-c86c-d5d6-befa982547b5	8258	Kapele
00050000-5624-c86c-d497-5ba8528c44e5	2362	Kapla
00050000-5624-c86c-6c33-b78259d4035c	2325	Kidričevo
00050000-5624-c86c-7df7-4c67688bb684	1412	Kisovec
00050000-5624-c86c-7b49-624569232146	6253	Knežak
00050000-5624-c86c-03af-430b71db1248	5222	Kobarid
00050000-5624-c86c-2290-6bfd34041441	9227	Kobilje
00050000-5624-c86c-7058-5a700a026532	1330	Kočevje
00050000-5624-c86c-d2da-b7efa8b80640	1338	Kočevska Reka
00050000-5624-c86c-e4a4-3e8bc14bf40d	2276	Kog
00050000-5624-c86c-15cc-8d8fa32e0a0b	5211	Kojsko
00050000-5624-c86c-1f76-5550d132b943	6223	Komen
00050000-5624-c86c-9d2a-2cc9333c71c9	1218	Komenda
00050000-5624-c86c-54a5-f82a93723160	6000	Koper/Capodistria 
00050000-5624-c86c-e3b1-4889a354f793	6001	Koper/Capodistria - poštni predali
00050000-5624-c86c-045e-aad162f409d5	8282	Koprivnica
00050000-5624-c86c-2421-5fcba3c66d57	5296	Kostanjevica na Krasu
00050000-5624-c86c-0dbc-9af25a055ada	8311	Kostanjevica na Krki
00050000-5624-c86c-eacd-0ea1e674f8fe	1336	Kostel
00050000-5624-c86c-03b5-85c00dfc1a63	6256	Košana
00050000-5624-c86c-8fe5-533fa2a7da65	2394	Kotlje
00050000-5624-c86c-5c14-1618c9b90b1f	6240	Kozina
00050000-5624-c86c-bfe6-1c66374597c7	3260	Kozje
00050000-5624-c86c-68f9-17ad98d80b4d	4000	Kranj 
00050000-5624-c86c-28b8-708ca8c659f4	4001	Kranj - poštni predali
00050000-5624-c86c-e0cd-eeeaaa57c538	4280	Kranjska Gora
00050000-5624-c86c-06ea-aab159363ccc	1281	Kresnice
00050000-5624-c86c-f794-9b7f0f1bff05	4294	Križe
00050000-5624-c86c-a9d1-5514a80a8791	9206	Križevci
00050000-5624-c86c-4180-3cc683322f59	9242	Križevci pri Ljutomeru
00050000-5624-c86c-5d9f-348e30a411b6	1301	Krka
00050000-5624-c86c-3cb9-b27c92f2eb27	8296	Krmelj
00050000-5624-c86c-bafe-5b57a75ef88c	4245	Kropa
00050000-5624-c86c-3a99-5badfcd06477	8262	Krška vas
00050000-5624-c86c-f038-79a13cde97c0	8270	Krško
00050000-5624-c86c-2a26-63858b9f29b3	9263	Kuzma
00050000-5624-c86c-fd1b-a25770958bf4	2318	Laporje
00050000-5624-c86c-47f0-47025ba4597a	3270	Laško
00050000-5624-c86c-b227-dc15646c20b1	1219	Laze v Tuhinju
00050000-5624-c86c-3f12-fedec6d149f8	2230	Lenart v Slovenskih goricah
00050000-5624-c86c-3194-3b45723f1f49	9220	Lendava/Lendva
00050000-5624-c86c-33ba-89641b86c828	4248	Lesce
00050000-5624-c86c-95c4-ff460eedc383	3261	Lesično
00050000-5624-c86c-dfdc-bd6f6dc205f0	8273	Leskovec pri Krškem
00050000-5624-c86c-5132-5f95195e1c99	2372	Libeliče
00050000-5624-c86c-9be1-34fe213552c4	2341	Limbuš
00050000-5624-c86c-5818-119facc2e4c8	1270	Litija
00050000-5624-c86c-14bb-bcdd229abb52	3202	Ljubečna
00050000-5624-c86c-a5df-5dc6df54f296	1000	Ljubljana 
00050000-5624-c86c-654d-bcfb849a8065	1001	Ljubljana - poštni predali
00050000-5624-c86c-af99-09d6a9fb81b6	1231	Ljubljana - Črnuče
00050000-5624-c86c-8ad0-63100e7e5472	1261	Ljubljana - Dobrunje
00050000-5624-c86c-e62d-7140a5bf590c	1260	Ljubljana - Polje
00050000-5624-c86c-781d-c94809dc111c	1210	Ljubljana - Šentvid
00050000-5624-c86c-3d48-6c7a9eae13f8	1211	Ljubljana - Šmartno
00050000-5624-c86c-6b69-e46d42a5b5f9	3333	Ljubno ob Savinji
00050000-5624-c86c-7380-ea6a99c99e5f	9240	Ljutomer
00050000-5624-c86c-fdb9-3982afd982ee	3215	Loče
00050000-5624-c86c-7f7e-b8b8fc573b6a	5231	Log pod Mangartom
00050000-5624-c86c-2861-6b4d98652c04	1358	Log pri Brezovici
00050000-5624-c86c-9d83-5d525db3fd37	1370	Logatec
00050000-5624-c86c-2bbf-7af712b96506	1371	Logatec
00050000-5624-c86c-a1e2-792f20d02607	1434	Loka pri Zidanem Mostu
00050000-5624-c86c-b04f-f4b54ffe367e	3223	Loka pri Žusmu
00050000-5624-c86c-784b-b0f68f40a07c	6219	Lokev
00050000-5624-c86c-d148-fe88603cd9aa	1318	Loški Potok
00050000-5624-c86c-2f4f-55b33e41b0f3	2324	Lovrenc na Dravskem polju
00050000-5624-c86c-456e-7333da8951dc	2344	Lovrenc na Pohorju
00050000-5624-c86c-24bf-2ea3037e0ef3	3334	Luče
00050000-5624-c86c-764a-a070abfc1d04	1225	Lukovica
00050000-5624-c86c-3342-68c198fd02e3	9202	Mačkovci
00050000-5624-c86c-2c56-2156c0d23b78	2322	Majšperk
00050000-5624-c86c-b5f8-4f52700c2114	2321	Makole
00050000-5624-c86c-bc69-800b0f2d6d02	9243	Mala Nedelja
00050000-5624-c86c-d697-2656c4c8348e	2229	Malečnik
00050000-5624-c86c-a1c6-57764336edd1	6273	Marezige
00050000-5624-c86c-4120-bb23bcfdb1b4	2000	Maribor 
00050000-5624-c86c-a8de-91b0b0b5f765	2001	Maribor - poštni predali
00050000-5624-c86c-48e5-a4812bbf1b80	2206	Marjeta na Dravskem polju
00050000-5624-c86c-38e5-a9417aeb1d10	2281	Markovci
00050000-5624-c86c-d2fb-a28295d66582	9221	Martjanci
00050000-5624-c86c-b1aa-94876b025560	6242	Materija
00050000-5624-c86c-cb2f-ca2fe0a8eb24	4211	Mavčiče
00050000-5624-c86c-aa79-b780771248a6	1215	Medvode
00050000-5624-c86c-cd26-4bb0ce0363ce	1234	Mengeš
00050000-5624-c86c-089e-769f9167b79d	8330	Metlika
00050000-5624-c86c-04aa-6d5e859a66a0	2392	Mežica
00050000-5624-c86c-e9e6-16bed9b7aaae	2204	Miklavž na Dravskem polju
00050000-5624-c86c-9008-a904bf4b4175	2275	Miklavž pri Ormožu
00050000-5624-c86c-ca1f-8d7b3b554ec9	5291	Miren
00050000-5624-c86c-e24a-5e7f1152db6b	8233	Mirna
00050000-5624-c86c-b3a2-7be8b886dede	8216	Mirna Peč
00050000-5624-c86c-ec0e-08d2c3c22ba7	2382	Mislinja
00050000-5624-c86c-c83d-1de6b8c4c56a	4281	Mojstrana
00050000-5624-c86c-8a80-b36b1431bac2	8230	Mokronog
00050000-5624-c86c-dac6-8dff62576dec	1251	Moravče
00050000-5624-c86c-e407-180dc9cef6c2	9226	Moravske Toplice
00050000-5624-c86c-7d82-a77c91753026	5216	Most na Soči
00050000-5624-c86c-9182-e4eb0f5bb4d5	1221	Motnik
00050000-5624-c86c-e7dc-65333e8a4322	3330	Mozirje
00050000-5624-c86c-7526-ac316ddf68ed	9000	Murska Sobota 
00050000-5624-c86c-3d4a-7943e9e101c9	9001	Murska Sobota - poštni predali
00050000-5624-c86c-1ebb-79ed45d11dad	2366	Muta
00050000-5624-c86c-ccdc-cd0653f36bcf	4202	Naklo
00050000-5624-c86c-97b0-2b9243ce199f	3331	Nazarje
00050000-5624-c86c-998b-e78362115e15	1357	Notranje Gorice
00050000-5624-c86c-7848-630b3ffa5904	3203	Nova Cerkev
00050000-5624-c86c-dfae-271153b0d5f4	5000	Nova Gorica 
00050000-5624-c86c-c19f-2d2a44eb987a	5001	Nova Gorica - poštni predali
00050000-5624-c86c-b426-649623a50c31	1385	Nova vas
00050000-5624-c86c-eb28-88fd5e7ae150	8000	Novo mesto
00050000-5624-c86c-629b-09f0418fa561	8001	Novo mesto - poštni predali
00050000-5624-c86c-4468-fad8b6da0c53	6243	Obrov
00050000-5624-c86c-7d1f-6cc0e16f327f	9233	Odranci
00050000-5624-c86c-0978-57f59773307d	2317	Oplotnica
00050000-5624-c86c-b399-6d011ffd1dc1	2312	Orehova vas
00050000-5624-c86c-f1fe-fb10739e9383	2270	Ormož
00050000-5624-c86c-0d99-8e0c99bc9d2d	1316	Ortnek
00050000-5624-c86c-d8f9-1cf27a8a8a06	1337	Osilnica
00050000-5624-c86c-221a-783bd442a716	8222	Otočec
00050000-5624-c86c-e1d1-31da83741bad	2361	Ožbalt
00050000-5624-c86c-8d4a-cd6e009634fd	2231	Pernica
00050000-5624-c86c-8a6e-077d8205ca00	2211	Pesnica pri Mariboru
00050000-5624-c86c-e22e-efaa34980a38	9203	Petrovci
00050000-5624-c86c-0441-e01f525e02d3	3301	Petrovče
00050000-5624-c86c-9915-864adf7de459	6330	Piran/Pirano
00050000-5624-c86c-37f9-7112f624c4eb	8255	Pišece
00050000-5624-c86c-78e5-5fa40390cfaa	6257	Pivka
00050000-5624-c86c-5a1a-bb495141769c	6232	Planina
00050000-5624-c86c-10cd-bf1a6f3874e8	3225	Planina pri Sevnici
00050000-5624-c86c-3c4d-334cedc2adff	6276	Pobegi
00050000-5624-c86c-7fe8-c9717686fed0	8312	Podbočje
00050000-5624-c86c-639c-3ebd0f10ddea	5243	Podbrdo
00050000-5624-c86c-d4d6-989be8041065	3254	Podčetrtek
00050000-5624-c86c-8e33-72148625b14a	2273	Podgorci
00050000-5624-c86c-8f05-30b1f6e13109	6216	Podgorje
00050000-5624-c86c-9f66-e66811695c82	2381	Podgorje pri Slovenj Gradcu
00050000-5624-c86c-17b3-fc17b30b2eb5	6244	Podgrad
00050000-5624-c86c-65ec-8f5636c24d0d	1414	Podkum
00050000-5624-c86c-3588-61c8817eafbc	2286	Podlehnik
00050000-5624-c86c-4838-74bc1d313b5e	5272	Podnanos
00050000-5624-c86c-77ee-ff064df4026c	4244	Podnart
00050000-5624-c86c-6bdb-9ba84a1120f7	3241	Podplat
00050000-5624-c86c-e30c-016621651f01	3257	Podsreda
00050000-5624-c86c-a7ba-d8016ae964d2	2363	Podvelka
00050000-5624-c86c-7aef-62980e8decbe	2208	Pohorje
00050000-5624-c86c-0235-868a924ec2a8	2257	Polenšak
00050000-5624-c86c-1b06-65eb94006c00	1355	Polhov Gradec
00050000-5624-c86c-20da-f5370a8f9728	4223	Poljane nad Škofjo Loko
00050000-5624-c86c-d0ec-1ba80e44635d	2319	Poljčane
00050000-5624-c86c-b51c-5675efe8ea5a	1272	Polšnik
00050000-5624-c86c-59b5-17c5d191b3fe	3313	Polzela
00050000-5624-c86c-f3d6-de41c76fd67e	3232	Ponikva
00050000-5624-c86c-3675-c759262e07b6	6320	Portorož/Portorose
00050000-5624-c86c-12a7-18e8ab398352	6230	Postojna
00050000-5624-c86c-4d40-43f7224018de	2331	Pragersko
00050000-5624-c86c-d887-c8d6d5225a9f	3312	Prebold
00050000-5624-c86c-f8fc-618c60c6315b	4205	Preddvor
00050000-5624-c86c-4d41-06637e4c18aa	6255	Prem
00050000-5624-c86c-4480-60af5d83fe95	1352	Preserje
00050000-5624-c86c-62db-317d05adc3fc	6258	Prestranek
00050000-5624-c86c-8c7e-5d3228a75f6a	2391	Prevalje
00050000-5624-c86c-5aa2-0900c4bf22d0	3262	Prevorje
00050000-5624-c86c-53b8-978c39756059	1276	Primskovo 
00050000-5624-c86c-c317-b8d768ddb6dd	3253	Pristava pri Mestinju
00050000-5624-c86c-9e74-15f3521a0649	9207	Prosenjakovci/Partosfalva
00050000-5624-c86c-966e-73c9e720d7ff	5297	Prvačina
00050000-5624-c86c-9e02-ebf5316af4ed	2250	Ptuj
00050000-5624-c86c-8dbb-b14eb3a84d7e	2323	Ptujska Gora
00050000-5624-c86c-1508-bdf43e0e7b19	9201	Puconci
00050000-5624-c86c-1ba5-7d67744c6f50	2327	Rače
00050000-5624-c86c-7a29-3f7566a8928a	1433	Radeče
00050000-5624-c86c-503e-c3358e695872	9252	Radenci
00050000-5624-c86c-489c-6a45aaa55729	2360	Radlje ob Dravi
00050000-5624-c86c-afc1-660caec4b020	1235	Radomlje
00050000-5624-c86c-d34d-8cdc551b7c28	4240	Radovljica
00050000-5624-c86c-25f7-226845ed2a8d	8274	Raka
00050000-5624-c86c-8f65-bc17a8e78188	1381	Rakek
00050000-5624-c86c-a531-eea070c24f3c	4283	Rateče - Planica
00050000-5624-c86c-d52b-5a370b292450	2390	Ravne na Koroškem
00050000-5624-c86c-a5fe-90d9c4cd061b	9246	Razkrižje
00050000-5624-c86c-c280-11742f93d4eb	3332	Rečica ob Savinji
00050000-5624-c86c-9027-8f8dcd19d00a	5292	Renče
00050000-5624-c86c-d2b2-2ed50d76a349	1310	Ribnica
00050000-5624-c86c-5041-78a04a7e2616	2364	Ribnica na Pohorju
00050000-5624-c86c-1bb4-ac0504ff182e	3272	Rimske Toplice
00050000-5624-c86c-f960-7cb5c7fd66fe	1314	Rob
00050000-5624-c86c-7d32-8067f911d595	5215	Ročinj
00050000-5624-c86c-6aba-32f9b29a4ee2	3250	Rogaška Slatina
00050000-5624-c86c-1aeb-a33d31f8c959	9262	Rogašovci
00050000-5624-c86c-948c-5a5fb0116171	3252	Rogatec
00050000-5624-c86c-72fa-c769329a4feb	1373	Rovte
00050000-5624-c86c-9c97-99d651eb38e9	2342	Ruše
00050000-5624-c86c-9a89-e63d3b7628bc	1282	Sava
00050000-5624-c86c-e9f8-83a785e32307	6333	Sečovlje/Sicciole
00050000-5624-c86c-6b42-0260ba7fb36b	4227	Selca
00050000-5624-c86c-a852-2e73a7cea220	2352	Selnica ob Dravi
00050000-5624-c86c-4094-7066219382dc	8333	Semič
00050000-5624-c86c-1246-ab014505674a	8281	Senovo
00050000-5624-c86c-d5ba-ed1813a1ad8e	6224	Senožeče
00050000-5624-c86c-11fb-d38ac7e817e5	8290	Sevnica
00050000-5624-c86c-c77d-65db81a3b19c	6210	Sežana
00050000-5624-c86c-7fe3-ddadd2957f2b	2214	Sladki Vrh
00050000-5624-c86c-b072-adde6b5aaab2	5283	Slap ob Idrijci
00050000-5624-c86c-87ac-0e9ba4599621	2380	Slovenj Gradec
00050000-5624-c86c-12e5-43cbff18d7d0	2310	Slovenska Bistrica
00050000-5624-c86c-9194-534f94ab45d0	3210	Slovenske Konjice
00050000-5624-c86c-ce06-ccf30f30b33a	1216	Smlednik
00050000-5624-c86c-5e62-ac9064fca453	5232	Soča
00050000-5624-c86c-54eb-8aa3dd7ec3f6	1317	Sodražica
00050000-5624-c86c-da73-db58fa49a57a	3335	Solčava
00050000-5624-c86c-cbf0-5fbef2424b6b	5250	Solkan
00050000-5624-c86c-e9b7-1375cd8cd1ca	4229	Sorica
00050000-5624-c86c-88a0-5f9c271a78b1	4225	Sovodenj
00050000-5624-c86c-a003-305ea90b60a1	5281	Spodnja Idrija
00050000-5624-c86c-0ce4-2f7c9c2fb1eb	2241	Spodnji Duplek
00050000-5624-c86c-b87c-abcab8dcb495	9245	Spodnji Ivanjci
00050000-5624-c86c-c4dd-2efe2044df1c	2277	Središče ob Dravi
00050000-5624-c86c-40e5-52f10baeb414	4267	Srednja vas v Bohinju
00050000-5624-c86c-48c5-732a2f749abe	8256	Sromlje 
00050000-5624-c86c-a94d-f733397d0c1b	5224	Srpenica
00050000-5624-c86c-4759-c91167232e52	1242	Stahovica
00050000-5624-c86c-ebca-9f32a9fd086d	1332	Stara Cerkev
00050000-5624-c86c-2235-dfd5d3ab76df	8342	Stari trg ob Kolpi
00050000-5624-c86c-b9ac-e0938632624e	1386	Stari trg pri Ložu
00050000-5624-c86c-3141-bb88a9684be1	2205	Starše
00050000-5624-c86c-9020-575fe7ce6bba	2289	Stoperce
00050000-5624-c86c-01c5-549db5466447	8322	Stopiče
00050000-5624-c86c-80a3-d6bf41d3ce83	3206	Stranice
00050000-5624-c86c-ab6a-e5891c2f99ea	8351	Straža
00050000-5624-c86c-d3aa-45f228ceb68f	1313	Struge
00050000-5624-c86c-43a0-74951b9742fe	8293	Studenec
00050000-5624-c86c-2e9a-52917411538b	8331	Suhor
00050000-5624-c86c-d4cf-7196fbc8130f	2233	Sv. Ana v Slovenskih goricah
00050000-5624-c86c-0bc3-67ea1f491f73	2235	Sv. Trojica v Slovenskih goricah
00050000-5624-c86c-6ff7-cef6b1f7c53b	2353	Sveti Duh na Ostrem Vrhu
00050000-5624-c86c-b56f-902ac0a9e2b5	9244	Sveti Jurij ob Ščavnici
00050000-5624-c86c-bde4-704bf3f2712e	3264	Sveti Štefan
00050000-5624-c86c-dd7a-9bdf1089cf11	2258	Sveti Tomaž
00050000-5624-c86c-98ac-6687e64a0923	9204	Šalovci
00050000-5624-c86c-9267-b13956784d55	5261	Šempas
00050000-5624-c86c-c651-ec82de810100	5290	Šempeter pri Gorici
00050000-5624-c86c-d6a2-4f3182a2a876	3311	Šempeter v Savinjski dolini
00050000-5624-c86c-6169-130467c165ad	4208	Šenčur
00050000-5624-c86c-cd88-254098ad92c5	2212	Šentilj v Slovenskih goricah
00050000-5624-c86c-86ad-85c5350912e5	8297	Šentjanž
00050000-5624-c86c-3338-b7d8fb36608d	2373	Šentjanž pri Dravogradu
00050000-5624-c86c-e667-2070e7cb4a0d	8310	Šentjernej
00050000-5624-c86c-06d8-a8ccf8c9c6a3	3230	Šentjur
00050000-5624-c86c-fe3e-8c000cf84570	3271	Šentrupert
00050000-5624-c86c-c8f9-06c4d832033a	8232	Šentrupert
00050000-5624-c86c-e031-8f02523c8e1d	1296	Šentvid pri Stični
00050000-5624-c86c-e565-d17af1f4d40e	8275	Škocjan
00050000-5624-c86c-dd1e-6b79d00677b3	6281	Škofije
00050000-5624-c86c-26a5-a56d60d04d49	4220	Škofja Loka
00050000-5624-c86c-009c-87ef755fbf50	3211	Škofja vas
00050000-5624-c86c-84ae-b67ee0c6bd24	1291	Škofljica
00050000-5624-c86c-f184-4c4582e29ab8	6274	Šmarje
00050000-5624-c86c-9224-08928bdbd127	1293	Šmarje - Sap
00050000-5624-c86c-6142-018525e66dad	3240	Šmarje pri Jelšah
00050000-5624-c86c-90b6-2584a3304ec5	8220	Šmarješke Toplice
00050000-5624-c86c-0521-7df3f69f395a	2315	Šmartno na Pohorju
00050000-5624-c86c-c5df-ea7a3196e52a	3341	Šmartno ob Dreti
00050000-5624-c86c-52db-1b41369b28cc	3327	Šmartno ob Paki
00050000-5624-c86c-158a-a703b2da0d41	1275	Šmartno pri Litiji
00050000-5624-c86c-2e10-ffaffdec2f3d	2383	Šmartno pri Slovenj Gradcu
00050000-5624-c86c-cfab-4471ed13ba17	3201	Šmartno v Rožni dolini
00050000-5624-c86c-8486-dea1a76e33d7	3325	Šoštanj
00050000-5624-c86c-fccc-ecafd698c567	6222	Štanjel
00050000-5624-c86c-053c-0646406f846a	3220	Štore
00050000-5624-c86c-1f62-e72a31151562	3304	Tabor
00050000-5624-c86c-58a4-2b4632dc84c6	3221	Teharje
00050000-5624-c86c-218c-311aafd0bdaf	9251	Tišina
00050000-5624-c86c-f169-0afafeadf489	5220	Tolmin
00050000-5624-c86c-1fbf-dee67a66b7e0	3326	Topolšica
00050000-5624-c86c-d2e2-6caa8d615aa7	2371	Trbonje
00050000-5624-c86c-2b1a-adbe0d94d218	1420	Trbovlje
00050000-5624-c86c-bc60-1030eef7c987	8231	Trebelno 
00050000-5624-c86c-5246-2add0aca4de6	8210	Trebnje
00050000-5624-c86c-27f3-ee561d1c2f2f	5252	Trnovo pri Gorici
00050000-5624-c86c-7bc6-a1ba88429324	2254	Trnovska vas
00050000-5624-c86c-d69a-0706aaf005bf	1222	Trojane
00050000-5624-c86c-bd96-c5d599ef2e08	1236	Trzin
00050000-5624-c86c-7d97-3573bfb6a5a7	4290	Tržič
00050000-5624-c86c-ce27-e008dfe45e73	8295	Tržišče
00050000-5624-c86c-00ec-1f53f6614391	1311	Turjak
00050000-5624-c86c-7018-9b82a2032663	9224	Turnišče
00050000-5624-c86c-4ca6-cfd7b0f4d393	8323	Uršna sela
00050000-5624-c86c-28ec-7029445f3636	1252	Vače
00050000-5624-c86c-d7d3-8fd7074937e0	3320	Velenje 
00050000-5624-c86c-a549-13ec730cc970	3322	Velenje - poštni predali
00050000-5624-c86c-61fa-140482944527	8212	Velika Loka
00050000-5624-c86c-ee82-e5290842b973	2274	Velika Nedelja
00050000-5624-c86c-6649-08164cb78361	9225	Velika Polana
00050000-5624-c86c-fc5d-a7c34f8beda8	1315	Velike Lašče
00050000-5624-c86c-ae72-711aafa3b312	8213	Veliki Gaber
00050000-5624-c86c-9b42-c461b0e8606e	9241	Veržej
00050000-5624-c86c-9d3f-10d7fd08a1a0	1312	Videm - Dobrepolje
00050000-5624-c86c-2797-1ff070da3f6e	2284	Videm pri Ptuju
00050000-5624-c86c-f543-18b23a26b715	8344	Vinica
00050000-5624-c86c-1b4c-2c7a3306d186	5271	Vipava
00050000-5624-c86c-ceed-0fa56e23783c	4212	Visoko
00050000-5624-c86c-7a01-411136e7fbdb	1294	Višnja Gora
00050000-5624-c86c-9576-c4761f34946c	3205	Vitanje
00050000-5624-c86c-a7a5-1dda4373a4ea	2255	Vitomarci
00050000-5624-c86c-2f6a-8c49415a3678	1217	Vodice
00050000-5624-c86c-32ed-880251f6a631	3212	Vojnik\t
00050000-5624-c86c-4047-aec91ebdfe7f	5293	Volčja Draga
00050000-5624-c86c-455f-f00d6ddd5411	2232	Voličina
00050000-5624-c86c-880a-2d1ecac76cf0	3305	Vransko
00050000-5624-c86c-ed64-d2efbe44429b	6217	Vremski Britof
00050000-5624-c86c-fcd5-d6a91527aa9b	1360	Vrhnika
00050000-5624-c86c-108c-e426b8e43b11	2365	Vuhred
00050000-5624-c86c-84e7-d4746cb48651	2367	Vuzenica
00050000-5624-c86c-ff9b-87c444c66da6	8292	Zabukovje 
00050000-5624-c86c-3138-f9378cd57046	1410	Zagorje ob Savi
00050000-5624-c86c-e7e5-97c15aac3939	1303	Zagradec
00050000-5624-c86c-57b2-6f1e3f49031a	2283	Zavrč
00050000-5624-c86c-19b4-71076dca4f1b	8272	Zdole 
00050000-5624-c86c-10a0-1e51c3f23c23	4201	Zgornja Besnica
00050000-5624-c86c-aa67-2436c32f1151	2242	Zgornja Korena
00050000-5624-c86c-887a-cdb9bfe3b06a	2201	Zgornja Kungota
00050000-5624-c86c-04a9-df806c59041f	2316	Zgornja Ložnica
00050000-5624-c86c-e0e1-db99c9bf9d8e	2314	Zgornja Polskava
00050000-5624-c86c-0160-c448214c02b6	2213	Zgornja Velka
00050000-5624-c86c-6108-1e54a255df2d	4247	Zgornje Gorje
00050000-5624-c86c-154b-7e67c4125ca2	4206	Zgornje Jezersko
00050000-5624-c86c-8a3c-572007dfdf4c	2285	Zgornji Leskovec
00050000-5624-c86c-856f-4bea97b0d461	1432	Zidani Most
00050000-5624-c86c-14f9-4dd205d5213d	3214	Zreče
00050000-5624-c86c-db4d-b5669ae44edb	4209	Žabnica
00050000-5624-c86c-4f1a-166817219824	3310	Žalec
00050000-5624-c86c-a58f-82f2107c664d	4228	Železniki
00050000-5624-c86c-0a76-cff4c4206dc0	2287	Žetale
00050000-5624-c86c-e5b1-2890fe74ecdd	4226	Žiri
00050000-5624-c86c-1a9f-51e7a76c7da7	4274	Žirovnica
00050000-5624-c86c-73b8-ad6f2387caaf	8360	Žužemberk
\.


--
-- TOC entry 3109 (class 0 OID 22488489)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 22488081)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22487844)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5624-c86e-6761-497c2d875123	00080000-5624-c86e-6456-2af6c4dcce0a	\N	00040000-5624-c86c-0b63-a56d5be35aa1	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5624-c86e-fea5-3af0a76d615d	00080000-5624-c86e-6456-2af6c4dcce0a	\N	00040000-5624-c86c-0b63-a56d5be35aa1	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5624-c86e-dede-d04ca4b756e9	00080000-5624-c86e-9ef1-33747bce09e9	\N	00040000-5624-c86c-0b63-a56d5be35aa1	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3069 (class 0 OID 22487948)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22487959)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22488093)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22488503)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 22488513)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5624-c86e-5f99-19340f7bfd9d	00080000-5624-c86e-9d48-fa2e73dccf2f	0987	AK
00190000-5624-c86e-a8e7-a02ce5a339b9	00080000-5624-c86e-9ef1-33747bce09e9	0989	AK
00190000-5624-c86e-08f2-890522788f3d	00080000-5624-c86e-7957-7ade9521419c	0986	AK
00190000-5624-c86e-68a8-388360ede336	00080000-5624-c86e-bf35-ce36035aa47b	0984	AK
00190000-5624-c86e-70ae-b32c3e9e16e4	00080000-5624-c86e-f6c3-21e48d4b9963	0983	AK
00190000-5624-c86e-61fd-468a148a6920	00080000-5624-c86e-8025-113994514e52	0982	AK
00190000-5624-c86f-719b-5079936e460c	00080000-5624-c86f-4c11-1acec61624a7	1001	AK
\.


--
-- TOC entry 3108 (class 0 OID 22488428)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5624-c86e-5c56-1d060eaea1f6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3112 (class 0 OID 22488521)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 22488122)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5624-c86e-3928-1ad2f9d905cf	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5624-c86e-c8c6-b597f6a1a1e4	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5624-c86e-f3f1-c2ee68541e17	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5624-c86e-4a28-64dd0825f670	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5624-c86e-c160-6a8097ebcf7b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5624-c86e-985b-30f74ff278c2	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5624-c86e-1766-15a05ecb06d4	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3080 (class 0 OID 22488066)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22488056)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 22488267)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22488197)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22487922)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 22487695)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5624-c86f-4c11-1acec61624a7	00010000-5624-c86c-5779-f0ea23b7e2a2	2015-10-19 12:39:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-5624-c86f-7baa-99da808082d4	00010000-5624-c86c-5779-f0ea23b7e2a2	2015-10-19 12:39:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5624-c86f-719b-5079936e460c	00010000-5624-c86c-5779-f0ea23b7e2a2	2015-10-19 12:39:43	INS	a:0:{}
\.


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3089 (class 0 OID 22488135)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 22487733)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5624-c86c-f4fa-687a389de4c5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5624-c86c-97f0-6dfef83079d6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5624-c86c-d965-78fca9dfe130	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5624-c86c-b356-a2ecd504baee	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5624-c86c-bd8b-80b850ae7815	planer	Planer dogodkov v koledarju	t
00020000-5624-c86c-1000-736fb6a41ac0	kadrovska	Kadrovska služba	t
00020000-5624-c86c-b2ae-21c758320221	arhivar	Ažuriranje arhivalij	t
00020000-5624-c86c-808e-78cdefd439b0	igralec	Igralec	t
00020000-5624-c86c-1e75-8faa87126d9e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5624-c86e-6c45-4332796d7063	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3050 (class 0 OID 22487717)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5624-c86c-d989-3fa37ca0f103	00020000-5624-c86c-d965-78fca9dfe130
00010000-5624-c86c-5779-f0ea23b7e2a2	00020000-5624-c86c-d965-78fca9dfe130
00010000-5624-c86e-7fe0-37ebbe8886ef	00020000-5624-c86e-6c45-4332796d7063
\.


--
-- TOC entry 3091 (class 0 OID 22488149)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22488087)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22488033)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 22487682)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5624-c86c-aa39-fef25334719a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5624-c86c-c33e-045fdfdbe43c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5624-c86c-e1d1-bbafa4baa6eb	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5624-c86c-ba98-629c18c6968c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5624-c86c-8d78-4c7db42faaf5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3045 (class 0 OID 22487674)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5624-c86c-8537-ed70a24e0f39	00230000-5624-c86c-ba98-629c18c6968c	popa
00240000-5624-c86c-1405-5c75abc18979	00230000-5624-c86c-ba98-629c18c6968c	oseba
00240000-5624-c86c-e095-c9281645b323	00230000-5624-c86c-ba98-629c18c6968c	tippopa
00240000-5624-c86c-5779-10aeeddba238	00230000-5624-c86c-ba98-629c18c6968c	organizacijskaenota
00240000-5624-c86c-a480-e6335c971b73	00230000-5624-c86c-ba98-629c18c6968c	sezona
00240000-5624-c86c-29dd-1177cbd1690c	00230000-5624-c86c-ba98-629c18c6968c	tipvaje
00240000-5624-c86c-0e8b-52f08fbfa360	00230000-5624-c86c-c33e-045fdfdbe43c	prostor
00240000-5624-c86c-56a5-e4ee169f1c35	00230000-5624-c86c-ba98-629c18c6968c	besedilo
00240000-5624-c86c-7c8e-721fb5053bba	00230000-5624-c86c-ba98-629c18c6968c	uprizoritev
00240000-5624-c86c-ea7a-09c5baede33c	00230000-5624-c86c-ba98-629c18c6968c	funkcija
00240000-5624-c86c-150e-06284dba151e	00230000-5624-c86c-ba98-629c18c6968c	tipfunkcije
00240000-5624-c86c-f795-982f0eda3587	00230000-5624-c86c-ba98-629c18c6968c	alternacija
00240000-5624-c86c-a0f5-c43f516a14d5	00230000-5624-c86c-aa39-fef25334719a	pogodba
00240000-5624-c86c-db64-3cd53ed40ab4	00230000-5624-c86c-ba98-629c18c6968c	zaposlitev
00240000-5624-c86c-2c47-503fe9ad573e	00230000-5624-c86c-ba98-629c18c6968c	zvrstuprizoritve
00240000-5624-c86c-e062-01d892acdaa7	00230000-5624-c86c-aa39-fef25334719a	programdela
00240000-5624-c86c-78a9-b11b122653b3	00230000-5624-c86c-ba98-629c18c6968c	zapis
\.


--
-- TOC entry 3044 (class 0 OID 22487669)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ddf5a2a4-6e9c-4409-bb7d-4bac13c2b028	00240000-5624-c86c-8537-ed70a24e0f39	0	1001
\.


--
-- TOC entry 3097 (class 0 OID 22488214)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5624-c86e-89cb-bf4410a72079	000e0000-5624-c86e-8807-7d56cdcb0eea	00080000-5624-c86e-6456-2af6c4dcce0a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5624-c86c-4584-439cf164be91
00270000-5624-c86e-18e6-1e109973f23c	000e0000-5624-c86e-8807-7d56cdcb0eea	00080000-5624-c86e-6456-2af6c4dcce0a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5624-c86c-4584-439cf164be91
\.


--
-- TOC entry 3058 (class 0 OID 22487805)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22488043)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5624-c86e-dab6-59c0c8bdbcb0	00180000-5624-c86e-8785-143d7c671c47	000c0000-5624-c86e-cc6b-ac223a11d993	00090000-5624-c86e-981e-fe89c9c725c4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-c86e-fe15-45a006a9130a	00180000-5624-c86e-8785-143d7c671c47	000c0000-5624-c86e-2fc0-75b95f9a60cc	00090000-5624-c86e-6451-64db2789af87	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-c86e-ad4f-fa2eb2e99d71	00180000-5624-c86e-8785-143d7c671c47	000c0000-5624-c86e-7438-e53bc6009438	00090000-5624-c86e-03e7-962308c0223c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-c86e-6394-7f163d1f53df	00180000-5624-c86e-8785-143d7c671c47	000c0000-5624-c86e-d7ea-c914b42bd376	00090000-5624-c86e-6c13-fb54ecc2e111	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-c86e-5886-8d3bca1b65bd	00180000-5624-c86e-8785-143d7c671c47	000c0000-5624-c86e-3405-444c6e67ad5b	00090000-5624-c86e-720f-70e899b25550	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-c86e-b319-63abf92e88a0	00180000-5624-c86e-4c2e-c8eb9c55b60c	\N	00090000-5624-c86e-720f-70e899b25550	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 22488255)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5624-c86c-8c96-042dcad93233	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5624-c86c-29a7-13c66278a0c2	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5624-c86c-7d9a-16399587937b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5624-c86c-7a83-8e807cd277f7	04	Režija	Režija	Režija	umetnik	30
000f0000-5624-c86c-be97-f45eeacbd6ce	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5624-c86c-787d-488a799e8b21	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5624-c86c-01c4-79f9af36583b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5624-c86c-1489-f4f5f9097d6e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5624-c86c-2e8d-884858fb867b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5624-c86c-7ac9-bddbb9c94544	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5624-c86c-96f7-7e1ee1338577	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5624-c86c-7f59-cfd29a2b567b	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5624-c86c-de6c-a572b52ed413	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5624-c86c-fc9e-a50fd195da12	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5624-c86c-cf4b-b269b19b46ce	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5624-c86c-6edc-fcebbd1b3fb6	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5624-c86c-f448-5aac619d7b8e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5624-c86c-c288-2afe58d1c79c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3055 (class 0 OID 22487759)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5624-c86e-4308-fb150647794a	0001	šola	osnovna ali srednja šola
00400000-5624-c86e-52bc-0f93ec3a2d49	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5624-c86e-78d4-7271f0be13c0	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3113 (class 0 OID 22488532)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5624-c86c-a51b-ca8a588ed34f	01	Velika predstava	f	1.00	1.00
002b0000-5624-c86c-e0dc-94d528e6c8c0	02	Mala predstava	f	0.50	0.50
002b0000-5624-c86c-9556-5d7bff6425fa	03	Mala koprodukcija	t	0.40	1.00
002b0000-5624-c86c-a6ff-9d704a37b044	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5624-c86c-1aba-c25414087081	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3076 (class 0 OID 22488023)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5624-c86c-8eb2-f5148d349f0a	0001	prva vaja	prva vaja
00420000-5624-c86c-2964-ae32996fe1d9	0002	tehnična vaja	tehnična vaja
00420000-5624-c86c-8f55-eb8cfb8024de	0003	lučna vaja	lučna vaja
00420000-5624-c86c-9fed-6d55ce6d5d30	0004	kostumska vaja	kostumska vaja
00420000-5624-c86c-4cdc-37c106fcdaf8	0005	foto vaja	foto vaja
00420000-5624-c86c-b59f-23d1c6082472	0006	1. glavna vaja	1. glavna vaja
00420000-5624-c86c-a402-afba8ddff973	0007	2. glavna vaja	2. glavna vaja
00420000-5624-c86c-4210-777a5eaf72e3	0008	1. generalka	1. generalka
00420000-5624-c86c-19aa-95827064d3f2	0009	2. generalka	2. generalka
00420000-5624-c86c-8868-eedf6bc4b1bf	0010	odprta generalka	odprta generalka
00420000-5624-c86c-6676-09ff53ebe8fe	0011	obnovitvena vaja	obnovitvena vaja
00420000-5624-c86c-9bd5-25df77294af3	0012	pevska vaja	pevska vaja
00420000-5624-c86c-a900-1368f0d5c26a	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5624-c86c-ad30-0b5842c2db1e	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3064 (class 0 OID 22487879)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 22487704)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5624-c86c-5779-f0ea23b7e2a2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO62BcWrvtPcwqiMCr56z.Aun0FyM8pki	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5624-c86e-6989-9e7957c5376e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5624-c86e-dbad-35cfb15385a7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5624-c86e-e751-42eb50662cc4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5624-c86e-f6cb-b133cce5c3ca	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5624-c86e-f64d-f942f47f75cd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5624-c86e-59a3-3512d970c291	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5624-c86e-b076-2c48ddc43ab5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5624-c86e-680c-a1b98aac9637	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5624-c86e-b6bd-b289e6b7484f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5624-c86e-7fe0-37ebbe8886ef	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5624-c86c-d989-3fa37ca0f103	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3104 (class 0 OID 22488305)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5624-c86e-b979-e72c44f96b51	00160000-5624-c86e-e4cb-36af8ccecc12	\N	00140000-5624-c86c-6319-cd335933c9bd	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5624-c86e-c160-6a8097ebcf7b
000e0000-5624-c86e-8807-7d56cdcb0eea	00160000-5624-c86e-9d19-7e239c32fd08	\N	00140000-5624-c86c-f9f3-49ceb2c75d7b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5624-c86e-985b-30f74ff278c2
000e0000-5624-c86e-27b0-34d9d0fdaeee	\N	\N	00140000-5624-c86c-f9f3-49ceb2c75d7b	00190000-5624-c86e-5f99-19340f7bfd9d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-c86e-c160-6a8097ebcf7b
000e0000-5624-c86e-319c-d1d8596d1bc5	\N	\N	00140000-5624-c86c-f9f3-49ceb2c75d7b	00190000-5624-c86e-5f99-19340f7bfd9d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-c86e-c160-6a8097ebcf7b
000e0000-5624-c86e-4adb-8d324df8d953	\N	\N	00140000-5624-c86c-f9f3-49ceb2c75d7b	00190000-5624-c86e-5f99-19340f7bfd9d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-c86e-3928-1ad2f9d905cf
000e0000-5624-c86e-3f19-fac71539ef38	\N	\N	00140000-5624-c86c-f9f3-49ceb2c75d7b	00190000-5624-c86e-5f99-19340f7bfd9d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-c86e-3928-1ad2f9d905cf
\.


--
-- TOC entry 3072 (class 0 OID 22487977)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5624-c86e-5e0f-86f4359b2d89	\N	000e0000-5624-c86e-8807-7d56cdcb0eea	1	
00200000-5624-c86e-1eb5-d8ea9276ef92	\N	000e0000-5624-c86e-8807-7d56cdcb0eea	2	
00200000-5624-c86e-b725-7ea18643997c	\N	000e0000-5624-c86e-8807-7d56cdcb0eea	3	
00200000-5624-c86e-4929-376107331c76	\N	000e0000-5624-c86e-8807-7d56cdcb0eea	4	
00200000-5624-c86e-eb03-486085a33483	\N	000e0000-5624-c86e-8807-7d56cdcb0eea	5	
\.


--
-- TOC entry 3087 (class 0 OID 22488114)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 22488228)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5624-c86c-a399-20092aee82fd	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5624-c86c-a9c3-889efb004ae0	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5624-c86c-85da-35418e914890	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5624-c86c-3793-868217c53f9c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5624-c86c-4b8e-90e72979aca1	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5624-c86c-537c-be35459ca728	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5624-c86c-e033-9c099ea8d1a8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5624-c86c-3ec6-77ceeb4ee338	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5624-c86c-4584-439cf164be91	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5624-c86c-5b65-de347c6a4dd5	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5624-c86c-052d-94df492a202e	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5624-c86c-6844-8c58067bff34	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5624-c86c-0746-9f124425f02d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5624-c86c-9ef6-304a130d3c5c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5624-c86c-d50d-1bb8c7550f17	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5624-c86c-dfe4-40a7ea73dfd7	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5624-c86c-94f4-9f6547bba801	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5624-c86c-4848-5ea85f80f91b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5624-c86c-61ea-32a3bff41111	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5624-c86c-7c09-306f7a7c78bb	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5624-c86c-5de5-912f72863302	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5624-c86c-75a7-350c205be83a	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5624-c86c-6f29-80c74a2acf96	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5624-c86c-996b-d5176e2aa035	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5624-c86c-9999-d58d665c7eb6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5624-c86c-a2b0-be4d9077863e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5624-c86c-389b-5ddab08d16fe	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5624-c86c-8ed7-f754ea07b8fb	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3116 (class 0 OID 22488579)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 22488551)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 22488591)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 22488186)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5624-c86e-e775-b0deabce3970	00090000-5624-c86e-6451-64db2789af87	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-c86e-34d0-9312eeed2c3e	00090000-5624-c86e-03e7-962308c0223c	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-c86e-9ad4-1f9ddad7d501	00090000-5624-c86e-71e9-5fb2a9dd0eab	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-c86e-76ab-dd25f0899fb3	00090000-5624-c86e-a246-4544e1e7287c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-c86e-28bb-9d4daf7b6385	00090000-5624-c86e-981e-fe89c9c725c4	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-c86e-d4b7-a1715fcbfda8	00090000-5624-c86e-9cdc-f93b23dab954	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3074 (class 0 OID 22488012)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22488295)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5624-c86c-6319-cd335933c9bd	01	Drama	drama (SURS 01)
00140000-5624-c86c-e87e-321c9198db0e	02	Opera	opera (SURS 02)
00140000-5624-c86c-fa0f-967343bd94ed	03	Balet	balet (SURS 03)
00140000-5624-c86c-fcdf-41e43a46420c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5624-c86c-f034-04af3ecd8281	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5624-c86c-f9f3-49ceb2c75d7b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5624-c86c-5092-2a0ac5494238	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3093 (class 0 OID 22488176)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2547 (class 2606 OID 22487758)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 22488354)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 22488344)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 22488211)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 22488253)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 22488631)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 22488001)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 22488022)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22488549)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 22487905)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 22488422)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 22488172)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 22487975)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22487943)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 22487919)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 22488079)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 22488608)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 22488615)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2822 (class 2606 OID 22488639)
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
-- TOC entry 2679 (class 2606 OID 22488106)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 22487877)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 22487777)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 22487839)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 22487801)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22487747)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2538 (class 2606 OID 22487732)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 22488112)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 22488148)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 22488290)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 22487829)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 22487865)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 22488501)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 22488085)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22487855)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 22487963)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2613 (class 2606 OID 22487956)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22488097)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 22488510)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 22488518)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 22488488)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 22488530)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 22488130)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22488070)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22488061)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 22488277)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 22488204)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 22487931)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 22487703)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 22488139)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 22487721)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2540 (class 2606 OID 22487741)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22488157)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 22488092)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 22488041)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 22487691)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22487679)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 22487673)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 22488224)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22487810)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 22488052)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 22488264)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 22487766)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 22488542)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 22488030)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 22487890)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22487716)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 22488323)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 22487984)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 22488120)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 22488236)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 22488589)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 22488573)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22488597)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 22488194)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22488016)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22488303)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22488184)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 1259 OID 22488010)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2628 (class 1259 OID 22488011)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2629 (class 1259 OID 22488009)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2630 (class 1259 OID 22488008)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2631 (class 1259 OID 22488007)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2722 (class 1259 OID 22488225)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2723 (class 1259 OID 22488226)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2724 (class 1259 OID 22488227)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2808 (class 1259 OID 22488610)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2809 (class 1259 OID 22488609)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2565 (class 1259 OID 22487831)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2566 (class 1259 OID 22487832)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2680 (class 1259 OID 22488113)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2795 (class 1259 OID 22488577)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2796 (class 1259 OID 22488576)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2797 (class 1259 OID 22488578)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2798 (class 1259 OID 22488575)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2799 (class 1259 OID 22488574)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2674 (class 1259 OID 22488099)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2675 (class 1259 OID 22488098)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2621 (class 1259 OID 22487985)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2622 (class 1259 OID 22487986)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2704 (class 1259 OID 22488173)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 22488175)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2706 (class 1259 OID 22488174)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2597 (class 1259 OID 22487921)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 22487920)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 22488531)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2738 (class 1259 OID 22488292)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2739 (class 1259 OID 22488293)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2740 (class 1259 OID 22488294)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2805 (class 1259 OID 22488598)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2747 (class 1259 OID 22488328)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2748 (class 1259 OID 22488325)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2749 (class 1259 OID 22488329)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2750 (class 1259 OID 22488327)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2751 (class 1259 OID 22488326)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2587 (class 1259 OID 22487892)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 22487891)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 22487804)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2692 (class 1259 OID 22488140)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2542 (class 1259 OID 22487748)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 22487749)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2697 (class 1259 OID 22488160)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2698 (class 1259 OID 22488159)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2699 (class 1259 OID 22488158)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2570 (class 1259 OID 22487842)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2571 (class 1259 OID 22487841)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2572 (class 1259 OID 22487843)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2610 (class 1259 OID 22487957)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 22487958)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2522 (class 1259 OID 22487681)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2654 (class 1259 OID 22488065)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2655 (class 1259 OID 22488063)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2656 (class 1259 OID 22488062)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2657 (class 1259 OID 22488064)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2533 (class 1259 OID 22487722)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 22487723)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2683 (class 1259 OID 22488121)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2818 (class 1259 OID 22488632)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 22488213)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2721 (class 1259 OID 22488212)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2819 (class 1259 OID 22488640)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2820 (class 1259 OID 22488641)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2669 (class 1259 OID 22488086)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2714 (class 1259 OID 22488205)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2715 (class 1259 OID 22488206)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2768 (class 1259 OID 22488427)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2769 (class 1259 OID 22488426)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2770 (class 1259 OID 22488423)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 22488424)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2772 (class 1259 OID 22488425)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2576 (class 1259 OID 22487857)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 22487856)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2578 (class 1259 OID 22487858)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 22488134)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2687 (class 1259 OID 22488133)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22488511)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2779 (class 1259 OID 22488512)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2761 (class 1259 OID 22488358)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2762 (class 1259 OID 22488359)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2763 (class 1259 OID 22488356)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2764 (class 1259 OID 22488357)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2710 (class 1259 OID 22488195)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2711 (class 1259 OID 22488196)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2660 (class 1259 OID 22488074)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2661 (class 1259 OID 22488073)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2662 (class 1259 OID 22488071)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2663 (class 1259 OID 22488072)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2757 (class 1259 OID 22488346)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2758 (class 1259 OID 22488345)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 22487932)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2604 (class 1259 OID 22487946)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2605 (class 1259 OID 22487945)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2606 (class 1259 OID 22487944)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 22487947)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2620 (class 1259 OID 22487976)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 22487964)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2615 (class 1259 OID 22487965)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2775 (class 1259 OID 22488502)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2794 (class 1259 OID 22488550)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2812 (class 1259 OID 22488616)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2813 (class 1259 OID 22488617)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2552 (class 1259 OID 22487779)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2553 (class 1259 OID 22487778)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2561 (class 1259 OID 22487811)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 22487812)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 22488017)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 22488055)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 22488054)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 22488053)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 22488003)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2633 (class 1259 OID 22488004)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2634 (class 1259 OID 22488002)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2635 (class 1259 OID 22488006)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2636 (class 1259 OID 22488005)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 22487830)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2550 (class 1259 OID 22487767)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 22487768)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2593 (class 1259 OID 22487906)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 22487908)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2595 (class 1259 OID 22487907)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2596 (class 1259 OID 22487909)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2668 (class 1259 OID 22488080)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2743 (class 1259 OID 22488291)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2752 (class 1259 OID 22488324)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2734 (class 1259 OID 22488265)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22488266)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2559 (class 1259 OID 22487802)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 22487803)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2707 (class 1259 OID 22488185)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 22487692)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 22487878)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2575 (class 1259 OID 22487840)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 22487680)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2791 (class 1259 OID 22488543)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 22488132)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2691 (class 1259 OID 22488131)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 22488031)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 22488032)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2765 (class 1259 OID 22488355)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 22487866)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22488304)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2802 (class 1259 OID 22488590)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2784 (class 1259 OID 22488519)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2785 (class 1259 OID 22488520)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2731 (class 1259 OID 22488254)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2648 (class 1259 OID 22488042)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 22487742)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2860 (class 2606 OID 22488807)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2859 (class 2606 OID 22488812)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2855 (class 2606 OID 22488832)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2861 (class 2606 OID 22488802)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2857 (class 2606 OID 22488822)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2856 (class 2606 OID 22488827)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2858 (class 2606 OID 22488817)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 22489002)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2896 (class 2606 OID 22489007)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 22489012)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 22489177)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2930 (class 2606 OID 22489172)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 22488697)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2834 (class 2606 OID 22488702)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2878 (class 2606 OID 22488917)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 22489157)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2925 (class 2606 OID 22489152)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2923 (class 2606 OID 22489162)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2926 (class 2606 OID 22489147)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2927 (class 2606 OID 22489142)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2876 (class 2606 OID 22488912)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2877 (class 2606 OID 22488907)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2854 (class 2606 OID 22488792)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2853 (class 2606 OID 22488797)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 22488957)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2886 (class 2606 OID 22488967)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2887 (class 2606 OID 22488962)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2844 (class 2606 OID 22488752)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 22488747)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 22488897)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 22489132)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2900 (class 2606 OID 22489017)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 22489022)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2898 (class 2606 OID 22489027)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2928 (class 2606 OID 22489167)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2902 (class 2606 OID 22489047)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2905 (class 2606 OID 22489032)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2901 (class 2606 OID 22489052)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2903 (class 2606 OID 22489042)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2904 (class 2606 OID 22489037)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2842 (class 2606 OID 22488742)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 22488737)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2830 (class 2606 OID 22488682)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2831 (class 2606 OID 22488677)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 22488937)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 22488657)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 22488662)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2883 (class 2606 OID 22488952)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2884 (class 2606 OID 22488947)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2885 (class 2606 OID 22488942)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2837 (class 2606 OID 22488712)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2838 (class 2606 OID 22488707)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2836 (class 2606 OID 22488717)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2849 (class 2606 OID 22488767)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 22488772)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2823 (class 2606 OID 22488642)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2866 (class 2606 OID 22488872)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2868 (class 2606 OID 22488862)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2869 (class 2606 OID 22488857)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2867 (class 2606 OID 22488867)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 22488647)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2824 (class 2606 OID 22488652)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2879 (class 2606 OID 22488922)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 22489192)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 22488997)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 22488992)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2935 (class 2606 OID 22489197)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2934 (class 2606 OID 22489202)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2875 (class 2606 OID 22488902)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2892 (class 2606 OID 22488982)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2891 (class 2606 OID 22488987)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2912 (class 2606 OID 22489107)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 22489102)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2916 (class 2606 OID 22489087)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 22489092)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2914 (class 2606 OID 22489097)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 22488727)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2841 (class 2606 OID 22488722)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 22488732)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 22488932)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2881 (class 2606 OID 22488927)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 22489117)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2918 (class 2606 OID 22489122)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2909 (class 2606 OID 22489077)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 22489082)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2911 (class 2606 OID 22489067)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2910 (class 2606 OID 22489072)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2890 (class 2606 OID 22488972)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 22488977)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2870 (class 2606 OID 22488892)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2871 (class 2606 OID 22488887)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2873 (class 2606 OID 22488877)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2872 (class 2606 OID 22488882)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2906 (class 2606 OID 22489062)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2907 (class 2606 OID 22489057)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2846 (class 2606 OID 22488757)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2847 (class 2606 OID 22488762)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 22488787)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2851 (class 2606 OID 22488777)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2850 (class 2606 OID 22488782)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 22489112)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2920 (class 2606 OID 22489127)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 22489137)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2932 (class 2606 OID 22489182)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2931 (class 2606 OID 22489187)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2828 (class 2606 OID 22488672)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 22488667)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2833 (class 2606 OID 22488687)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2832 (class 2606 OID 22488692)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 22488837)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2863 (class 2606 OID 22488852)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2864 (class 2606 OID 22488847)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2865 (class 2606 OID 22488842)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-19 12:39:45 CEST

--
-- PostgreSQL database dump complete
--

