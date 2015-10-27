--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-27 13:08:09 CET

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
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 23529181)
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
-- TOC entry 233 (class 1259 OID 23529789)
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
-- TOC entry 232 (class 1259 OID 23529772)
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
-- TOC entry 223 (class 1259 OID 23529649)
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
-- TOC entry 226 (class 1259 OID 23529679)
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
-- TOC entry 247 (class 1259 OID 23530060)
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
-- TOC entry 200 (class 1259 OID 23529429)
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
-- TOC entry 202 (class 1259 OID 23529460)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23529986)
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
-- TOC entry 191 (class 1259 OID 23529326)
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
-- TOC entry 234 (class 1259 OID 23529802)
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
-- TOC entry 219 (class 1259 OID 23529603)
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
-- TOC entry 197 (class 1259 OID 23529400)
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
-- TOC entry 194 (class 1259 OID 23529366)
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
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 23529343)
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
-- TOC entry 208 (class 1259 OID 23529517)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23530041)
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
-- TOC entry 246 (class 1259 OID 23530053)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23530075)
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
-- TOC entry 212 (class 1259 OID 23529542)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23529300)
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
-- TOC entry 182 (class 1259 OID 23529200)
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
-- TOC entry 186 (class 1259 OID 23529267)
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
-- TOC entry 183 (class 1259 OID 23529211)
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
-- TOC entry 177 (class 1259 OID 23529155)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23529174)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23529549)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23529583)
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
-- TOC entry 229 (class 1259 OID 23529720)
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
-- TOC entry 185 (class 1259 OID 23529247)
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
-- TOC entry 188 (class 1259 OID 23529292)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23529931)
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
-- TOC entry 209 (class 1259 OID 23529523)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23529277)
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
-- TOC entry 199 (class 1259 OID 23529421)
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
-- TOC entry 195 (class 1259 OID 23529381)
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
-- TOC entry 196 (class 1259 OID 23529393)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23529535)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23529945)
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
-- TOC entry 238 (class 1259 OID 23529955)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23529870)
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
-- TOC entry 239 (class 1259 OID 23529963)
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
-- TOC entry 215 (class 1259 OID 23529564)
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
-- TOC entry 207 (class 1259 OID 23529508)
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
-- TOC entry 206 (class 1259 OID 23529498)
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
-- TOC entry 228 (class 1259 OID 23529709)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23529639)
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
-- TOC entry 193 (class 1259 OID 23529355)
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
-- TOC entry 174 (class 1259 OID 23529126)
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
-- TOC entry 173 (class 1259 OID 23529124)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 23529577)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23529164)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23529148)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23529591)
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
-- TOC entry 210 (class 1259 OID 23529529)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23529475)
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
-- TOC entry 172 (class 1259 OID 23529113)
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
-- TOC entry 171 (class 1259 OID 23529105)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23529100)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23529656)
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
-- TOC entry 184 (class 1259 OID 23529239)
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
-- TOC entry 205 (class 1259 OID 23529485)
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
-- TOC entry 227 (class 1259 OID 23529697)
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
-- TOC entry 181 (class 1259 OID 23529190)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23529974)
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
-- TOC entry 203 (class 1259 OID 23529465)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23529312)
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
-- TOC entry 175 (class 1259 OID 23529135)
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
-- TOC entry 231 (class 1259 OID 23529747)
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
-- TOC entry 198 (class 1259 OID 23529411)
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
-- TOC entry 214 (class 1259 OID 23529556)
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
-- TOC entry 225 (class 1259 OID 23529670)
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
-- TOC entry 243 (class 1259 OID 23530021)
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
-- TOC entry 242 (class 1259 OID 23529993)
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
-- TOC entry 244 (class 1259 OID 23530033)
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
-- TOC entry 221 (class 1259 OID 23529628)
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
-- TOC entry 201 (class 1259 OID 23529454)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23529737)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23529618)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23529129)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3058 (class 0 OID 23529181)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-562f-6926-c994-9a3df0ae5423	10	30	Otroci	Abonma za otroke	200
000a0000-562f-6926-2bf3-2da49f742839	20	60	Mladina	Abonma za mladino	400
000a0000-562f-6926-5778-d2d3f957b517	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3111 (class 0 OID 23529789)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-562f-6926-669a-833e835f3847	000d0000-562f-6926-6fae-1d263b13636f	\N	00090000-562f-6926-d819-ac8267624107	000b0000-562f-6926-d1a3-77280e92e2bd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-562f-6926-77f0-bef324c29d2c	000d0000-562f-6926-5fad-d2e0317d4bad	00100000-562f-6926-a402-0726f0407f0e	00090000-562f-6926-5c27-86316fb0fcac	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-562f-6926-83e4-3e777d5bb204	000d0000-562f-6926-d656-96a460d6f57e	00100000-562f-6926-6a03-5f00c2939a0f	00090000-562f-6926-13c1-d4daa44412f5	\N	0003	t	\N	2015-10-27	\N	2	t	\N	f	f
000c0000-562f-6926-00e1-a3269112c1ca	000d0000-562f-6926-345b-eed42170a946	\N	00090000-562f-6926-6d0a-bb2523c6f239	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-562f-6926-1852-d9dbcd716dbe	000d0000-562f-6926-e40c-892b74df2356	\N	00090000-562f-6926-eaac-0a881b895e02	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-562f-6926-0e25-b8e33c53f93d	000d0000-562f-6926-ead1-0842a20c135f	\N	00090000-562f-6926-80ed-ad51ab4d87a3	000b0000-562f-6926-b254-c9e51ffa50a1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-562f-6926-0b46-3d60e0f41077	000d0000-562f-6926-897d-f15a03c26e91	00100000-562f-6926-11a9-afaf78b46154	00090000-562f-6926-fb3d-7f12137d36af	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-562f-6926-973c-db34d8ccc037	000d0000-562f-6926-f1d5-7ee7fecb37c1	\N	00090000-562f-6926-b535-b09c2d8b1f58	000b0000-562f-6926-15a5-cd80edfcc18e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-562f-6926-eef9-43fa38f60f2b	000d0000-562f-6926-897d-f15a03c26e91	00100000-562f-6926-9a44-91cee0125e7b	00090000-562f-6926-7add-40e491f080a0	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-562f-6926-ffe6-b8a34922c8c3	000d0000-562f-6926-897d-f15a03c26e91	00100000-562f-6926-8d39-516f23509db7	00090000-562f-6926-22d7-01778667912f	\N	0010	t	\N	2015-10-27	\N	16	f	\N	f	t
000c0000-562f-6926-4f34-e8143ed5f01e	000d0000-562f-6926-897d-f15a03c26e91	00100000-562f-6926-18d1-483066e083e3	00090000-562f-6926-e633-8c851d74384f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-562f-6926-7c30-987356c7d2fc	000d0000-562f-6926-15d3-27ea130ecf58	00100000-562f-6926-a402-0726f0407f0e	00090000-562f-6926-5c27-86316fb0fcac	000b0000-562f-6926-5dd4-0a8f889adcfd	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3110 (class 0 OID 23529772)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 23529649)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-562f-6926-f4a8-ac574e1117e0	00160000-562f-6926-f150-b51fc981075b	00090000-562f-6926-074c-6e40bf8a5913	aizv	10	t
003d0000-562f-6926-cf0c-50b5d3735cd4	00160000-562f-6926-f150-b51fc981075b	00090000-562f-6926-abb3-551cccb152d2	apri	14	t
003d0000-562f-6926-5be9-5de708387927	00160000-562f-6926-0c5f-b52a4dc28d7e	00090000-562f-6926-d9dc-3a3c954d5dfd	aizv	11	t
003d0000-562f-6926-62d9-b48fece1abf3	00160000-562f-6926-0da1-3311a5098b16	00090000-562f-6926-bac2-a0f4a4dfcb4e	aizv	12	t
003d0000-562f-6926-e9dd-d595ed04a033	00160000-562f-6926-f150-b51fc981075b	00090000-562f-6926-6c93-4e7908edf113	apri	18	f
\.


--
-- TOC entry 3104 (class 0 OID 23529679)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-562f-6926-f150-b51fc981075b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-562f-6926-0c5f-b52a4dc28d7e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-562f-6926-0da1-3311a5098b16	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3125 (class 0 OID 23530060)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23529429)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-562f-6926-fcc3-cce1f0950b53	\N	\N	00200000-562f-6926-3454-0b64ea5267da	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-562f-6926-1f2a-240264ab05c5	\N	\N	00200000-562f-6926-3772-0c84cfd51ab1	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-562f-6926-05b2-cd6bd31c831e	\N	\N	00200000-562f-6926-5033-57f2b283e869	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-562f-6926-6e50-cc7806e92b1d	\N	\N	00200000-562f-6926-caaa-eb6eb967b172	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-562f-6926-057e-5003c3571440	\N	\N	00200000-562f-6926-1558-ca75e15acb0c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3080 (class 0 OID 23529460)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23529986)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23529326)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-562f-6924-4033-b643b7bb3570	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-562f-6924-09d4-9256d2caa225	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-562f-6924-a46d-53c2f85cb1d4	AL	ALB	008	Albania 	Albanija	\N
00040000-562f-6924-ee70-06682f6107f9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-562f-6924-41c3-0a13087a8018	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-562f-6924-4150-42d1a1705794	AD	AND	020	Andorra 	Andora	\N
00040000-562f-6924-316e-07594265ec9b	AO	AGO	024	Angola 	Angola	\N
00040000-562f-6924-5736-5cea729d899e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-562f-6924-1995-07cdae841913	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-562f-6924-35a8-97a02c699c8f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-562f-6924-4ca2-8c9058bc3dec	AR	ARG	032	Argentina 	Argenitna	\N
00040000-562f-6924-d408-0a19f25becd5	AM	ARM	051	Armenia 	Armenija	\N
00040000-562f-6924-60b8-0cde87604472	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-562f-6924-fc43-285c69ac32c2	AU	AUS	036	Australia 	Avstralija	\N
00040000-562f-6924-35a7-9d7209fced8e	AT	AUT	040	Austria 	Avstrija	\N
00040000-562f-6924-fbc3-8402418e80aa	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-562f-6924-31e5-ac32e01eb8d0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-562f-6924-4ec8-ab347c1fdfab	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-562f-6924-2038-24d2b5438550	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-562f-6924-568c-cad69f4a5e54	BB	BRB	052	Barbados 	Barbados	\N
00040000-562f-6924-a214-4dcccedb69b3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-562f-6924-b9d9-d44c43785243	BE	BEL	056	Belgium 	Belgija	\N
00040000-562f-6924-a60e-744e9ea22553	BZ	BLZ	084	Belize 	Belize	\N
00040000-562f-6924-8352-166dd90df8de	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-562f-6924-2d7f-ef3ec8f3d47d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-562f-6924-c368-9807648bda65	BT	BTN	064	Bhutan 	Butan	\N
00040000-562f-6924-d108-08c4daed702c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-562f-6924-be1b-38fae793fd0b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-562f-6924-2bf4-e8f5f38cbf23	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-562f-6924-4ae9-505c098715ba	BW	BWA	072	Botswana 	Bocvana	\N
00040000-562f-6924-6fcb-07ba98cfd8ae	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-562f-6924-2dca-7d5870ab7c54	BR	BRA	076	Brazil 	Brazilija	\N
00040000-562f-6924-3345-ed8b33e83f66	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-562f-6924-e0e8-8f69e361030c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-562f-6924-1bc3-d735383a47c3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-562f-6924-9a28-2bfcfc270d23	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-562f-6924-1857-5ba7022f316b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-562f-6924-fe14-ddf8a171439d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-562f-6924-35bb-d20cb3575238	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-562f-6924-2593-2ac5d6f841fb	CA	CAN	124	Canada 	Kanada	\N
00040000-562f-6924-9771-73d2fa3bf31c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-562f-6924-0a3e-a16c961348df	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-562f-6924-8802-7f062bcadecf	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-562f-6924-2351-a2cba6036d36	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-562f-6924-748e-b78b2493450c	CL	CHL	152	Chile 	Čile	\N
00040000-562f-6924-2657-1d5c9906c913	CN	CHN	156	China 	Kitajska	\N
00040000-562f-6924-f3c0-d5d0ba7f430d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-562f-6924-cace-5705b52e5a3e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-562f-6924-3b21-7bb8f3add463	CO	COL	170	Colombia 	Kolumbija	\N
00040000-562f-6924-13de-04bbe5a2f6d8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-562f-6924-4411-3721ff6fec59	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-562f-6924-0e02-dd8173e3ce57	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-562f-6924-c190-460df1792fe7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-562f-6924-8696-e04bb2174cab	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-562f-6924-0fae-698985ae7f0b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-562f-6924-e717-39563787ed00	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-562f-6924-8631-618299a998ea	CU	CUB	192	Cuba 	Kuba	\N
00040000-562f-6924-f216-1b7445927f4b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-562f-6924-e9bb-acd5800ac2d7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-562f-6924-59bc-35ce9bde5d0b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-562f-6924-50c0-333020c8a118	DK	DNK	208	Denmark 	Danska	\N
00040000-562f-6924-a004-115a13390372	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-562f-6924-e6f0-097dffb4d171	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-562f-6924-3049-bd992d96cfd0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-562f-6924-7df8-ca2d8c10dfeb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-562f-6924-4a60-d6eeab4e1e6a	EG	EGY	818	Egypt 	Egipt	\N
00040000-562f-6924-428e-5bd3f073d215	SV	SLV	222	El Salvador 	Salvador	\N
00040000-562f-6924-096f-253dea465082	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-562f-6924-92f0-f5dd03411b4e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-562f-6924-18b5-179bb7309e7f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-562f-6924-60ed-17be0de07d28	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-562f-6924-dd5f-82edfa62a406	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-562f-6924-3d93-ef1307e64803	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-562f-6924-ed46-8a6c48dcb6e7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-562f-6924-5c19-7aedc2b10a03	FI	FIN	246	Finland 	Finska	\N
00040000-562f-6924-5134-20c7e706a6ae	FR	FRA	250	France 	Francija	\N
00040000-562f-6924-6de6-24ca5c4eb021	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-562f-6924-41a3-f94595c64f8e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-562f-6924-1856-79d6d31fccc5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-562f-6924-c3e3-cdbcd7e43a82	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-562f-6924-b33a-07f9110d590c	GA	GAB	266	Gabon 	Gabon	\N
00040000-562f-6924-6ed6-f303718c92cc	GM	GMB	270	Gambia 	Gambija	\N
00040000-562f-6924-9d5f-c64e59733f07	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-562f-6924-a3db-eadcea44fe05	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-562f-6924-6527-17ac67dba956	GH	GHA	288	Ghana 	Gana	\N
00040000-562f-6924-8d36-133bd0a41f6f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-562f-6924-b6bd-6babe417f614	GR	GRC	300	Greece 	Grčija	\N
00040000-562f-6924-9bcc-5711cf8b5af4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-562f-6924-736a-549d08521b7c	GD	GRD	308	Grenada 	Grenada	\N
00040000-562f-6924-8166-44397c50342d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-562f-6924-b8de-86f63c4743ef	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-562f-6924-b01d-d5b7451757d3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-562f-6924-0a92-5ea6171d75e1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-562f-6924-6490-00ce6bc5f40a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-562f-6924-14da-f393f707fc6a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-562f-6924-40c4-0df9e996a6e4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-562f-6924-de19-7e289b758b2e	HT	HTI	332	Haiti 	Haiti	\N
00040000-562f-6924-93e9-5b6e22b31635	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-562f-6924-b419-9fec058cd2f1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-562f-6924-df0d-0de4e5fd6993	HN	HND	340	Honduras 	Honduras	\N
00040000-562f-6924-a50b-bbbb91d4de0a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-562f-6924-3ef6-d0f7073f9e57	HU	HUN	348	Hungary 	Madžarska	\N
00040000-562f-6924-583d-0b301112b07a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-562f-6924-33d5-1d898bb65094	IN	IND	356	India 	Indija	\N
00040000-562f-6924-4da8-591a511e08e9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-562f-6924-026f-8cb39059e314	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-562f-6924-83fa-6c1bd1cbed7e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-562f-6924-2fb4-495906e37c05	IE	IRL	372	Ireland 	Irska	\N
00040000-562f-6924-a0ac-9148edcbf7fa	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-562f-6924-75ed-3f6627ed26f3	IL	ISR	376	Israel 	Izrael	\N
00040000-562f-6924-0543-0832ff314bd3	IT	ITA	380	Italy 	Italija	\N
00040000-562f-6924-12e2-52ad42dcd108	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-562f-6924-cec1-8cd3786f9cac	JP	JPN	392	Japan 	Japonska	\N
00040000-562f-6924-3bbc-5c265c26482f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-562f-6924-e504-60f90599d037	JO	JOR	400	Jordan 	Jordanija	\N
00040000-562f-6924-e111-4548b46b8599	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-562f-6924-0a67-366076d37b0f	KE	KEN	404	Kenya 	Kenija	\N
00040000-562f-6924-c061-48606efad8f3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-562f-6924-aef7-bd1b9e51e99a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-562f-6924-910c-154d6f5516c5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-562f-6924-838c-9689e86f2780	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-562f-6924-9110-15e6dfa1cbdd	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-562f-6924-a5ef-934c115d41b1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-562f-6924-ed54-f1e315c83de6	LV	LVA	428	Latvia 	Latvija	\N
00040000-562f-6924-d8a5-4aa9a0e74cac	LB	LBN	422	Lebanon 	Libanon	\N
00040000-562f-6924-dbeb-19da843fbd54	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-562f-6924-5f73-2b4b370e252c	LR	LBR	430	Liberia 	Liberija	\N
00040000-562f-6924-28a5-41692b020517	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-562f-6924-52e4-30269ef76d2a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-562f-6924-2b67-7cf4873cdc07	LT	LTU	440	Lithuania 	Litva	\N
00040000-562f-6924-f592-d90062448cdb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-562f-6924-1176-c587e470f0b9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-562f-6924-00bb-d7f40a75bf80	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-562f-6924-1b39-db4481fa2181	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-562f-6924-80a3-feda9324bcde	MW	MWI	454	Malawi 	Malavi	\N
00040000-562f-6924-3fb7-ee29043aab57	MY	MYS	458	Malaysia 	Malezija	\N
00040000-562f-6924-ee21-c94a29897760	MV	MDV	462	Maldives 	Maldivi	\N
00040000-562f-6924-6782-70ad1a85b783	ML	MLI	466	Mali 	Mali	\N
00040000-562f-6924-6780-53856fc6fea0	MT	MLT	470	Malta 	Malta	\N
00040000-562f-6924-e1d2-9a7f68127212	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-562f-6924-d8e8-60662860deab	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-562f-6924-49cb-061db0042a44	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-562f-6924-4bab-de576c57a8b3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-562f-6924-5617-4dfbb8ef1bde	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-562f-6924-78d9-43dc7205f6f4	MX	MEX	484	Mexico 	Mehika	\N
00040000-562f-6924-8afc-fd07bdbad6af	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-562f-6924-1caf-732e7d36ed10	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-562f-6924-6a88-ddb31a66e370	MC	MCO	492	Monaco 	Monako	\N
00040000-562f-6924-6670-051f7a46bb3f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-562f-6924-add8-4ff16bb8943d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-562f-6924-720b-6d376b63eda2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-562f-6924-2864-337e282a1c6e	MA	MAR	504	Morocco 	Maroko	\N
00040000-562f-6924-95ce-6910094cbd16	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-562f-6924-a529-735668b8a5df	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-562f-6924-518f-45da919655a5	NA	NAM	516	Namibia 	Namibija	\N
00040000-562f-6924-03c2-338669c95c2c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-562f-6924-559d-6ea7c827f74b	NP	NPL	524	Nepal 	Nepal	\N
00040000-562f-6924-401f-f5037a51b704	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-562f-6924-73c8-3e8a69f80be2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-562f-6924-6f9b-969cea4940fa	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-562f-6924-356c-23dc3913d93b	NE	NER	562	Niger 	Niger 	\N
00040000-562f-6924-b5d2-977fabced2db	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-562f-6924-5b0e-a8a6a2ca0b1b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-562f-6924-5eac-011c49438d0e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-562f-6924-f0c1-48a4345dd1b7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-562f-6924-c75a-eb52751f904c	NO	NOR	578	Norway 	Norveška	\N
00040000-562f-6924-f7d1-6871f1e2a2a2	OM	OMN	512	Oman 	Oman	\N
00040000-562f-6924-7658-f544ebf280c1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-562f-6924-0bcf-b0a636920bbf	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-562f-6924-01fa-0e740f99f5a2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-562f-6924-f35b-963528728f64	PA	PAN	591	Panama 	Panama	\N
00040000-562f-6924-b387-994c6e4a3dd1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-562f-6924-ebc5-c6b09a6c8a19	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-562f-6924-381b-235e25756bea	PE	PER	604	Peru 	Peru	\N
00040000-562f-6924-11b8-a66cbcd0d149	PH	PHL	608	Philippines 	Filipini	\N
00040000-562f-6924-bffa-9d3d5c658698	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-562f-6924-0038-091890deb769	PL	POL	616	Poland 	Poljska	\N
00040000-562f-6924-1b10-13b1f995c99d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-562f-6924-cf59-2ccb3a15351f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-562f-6924-3d84-aa6c4afcd5cc	QA	QAT	634	Qatar 	Katar	\N
00040000-562f-6924-286f-295215d9b084	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-562f-6924-fd36-2902ac47931e	RO	ROU	642	Romania 	Romunija	\N
00040000-562f-6924-6169-7cae0e32e515	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-562f-6924-2f93-0cc0eeccbc7d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-562f-6924-13bd-f68f6df57a99	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-562f-6924-c926-b6da027101c9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-562f-6924-8bc6-0d318b40c860	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-562f-6924-f963-d0bf4c205ab2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-562f-6924-3988-6ddc6ed25e24	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-562f-6924-d03d-0e4b54954b67	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-562f-6924-869c-fba8e78ffe29	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-562f-6924-6c4d-27379c2ef23b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-562f-6924-8607-ae2f0ede77da	SM	SMR	674	San Marino 	San Marino	\N
00040000-562f-6924-41f3-93953d8a33b4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-562f-6924-e6b8-3a8a7c3cccc6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-562f-6924-4abc-f92007e9480e	SN	SEN	686	Senegal 	Senegal	\N
00040000-562f-6924-d9a0-0ba372d80b14	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-562f-6924-084a-791534d6b97a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-562f-6924-f6c4-b7bfe50c21d5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-562f-6924-f8be-05182c839c2b	SG	SGP	702	Singapore 	Singapur	\N
00040000-562f-6924-496f-11b378bb5ac6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-562f-6924-120f-fd2f52e17fe3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-562f-6924-fa40-5ab6de8773f5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-562f-6924-58f3-ae3997a6ee0b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-562f-6924-9de9-e8d59d9624e7	SO	SOM	706	Somalia 	Somalija	\N
00040000-562f-6924-a671-149e8969002c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-562f-6924-0d56-5db66b5471b8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-562f-6924-b7ee-74a208fb0e0b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-562f-6924-8d9f-d750be4fb66f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-562f-6924-6609-22aa59c44af2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-562f-6924-e7f0-ac3a5ef9c85b	SD	SDN	729	Sudan 	Sudan	\N
00040000-562f-6924-7fb1-bad34fbb2196	SR	SUR	740	Suriname 	Surinam	\N
00040000-562f-6924-aa5d-d239614a86a6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-562f-6924-1134-a124d0eb5499	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-562f-6924-fed4-9a77a528200a	SE	SWE	752	Sweden 	Švedska	\N
00040000-562f-6924-ae53-779424308b6c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-562f-6924-0a17-34631b7819bb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-562f-6924-0739-92d6d0bced6d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-562f-6924-80f5-1313f020e92f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-562f-6924-25d7-f84829a9ad3a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-562f-6924-6910-f61d85ccf230	TH	THA	764	Thailand 	Tajska	\N
00040000-562f-6924-95af-2b134959e311	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-562f-6924-0b66-2b3ed54c089e	TG	TGO	768	Togo 	Togo	\N
00040000-562f-6924-35d5-556b02e8d09c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-562f-6924-307d-4b3203fbc70e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-562f-6924-ef48-6c2446863dc9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-562f-6924-3c96-cf5e90bccc94	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-562f-6924-f777-01afe67103a8	TR	TUR	792	Turkey 	Turčija	\N
00040000-562f-6924-54ff-5fc52cfbc62b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-562f-6924-a8f9-d81a5008f7ef	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562f-6924-b56d-095ce0ae166e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-562f-6924-78e9-5f23473cc9f9	UG	UGA	800	Uganda 	Uganda	\N
00040000-562f-6924-50bf-f77d05c0338a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-562f-6924-e7e6-01cbf87ad66b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-562f-6924-fcdf-c6cac3f23dac	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-562f-6924-f266-5f3b7e474c7f	US	USA	840	United States 	Združene države Amerike	\N
00040000-562f-6924-a835-f9d1e1921e77	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-562f-6924-3a00-c3b5a92c804f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-562f-6924-b0f1-ef6104e86a92	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-562f-6924-2ad2-3d4786daebc1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-562f-6924-b6be-9024defb196c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-562f-6924-f5f6-62f3f2057061	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-562f-6924-1821-dd16f444c2d8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562f-6924-26ca-322bd23b4e11	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-562f-6924-f3f2-89a950d5e63c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-562f-6924-8834-3df30d3ec8a0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-562f-6924-98a3-6a11728b2056	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-562f-6924-088e-4333821550b5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-562f-6924-0034-fe6610a81d94	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3112 (class 0 OID 23529802)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-562f-6926-f514-ca24062baaca	000e0000-562f-6926-0900-03add9556ed7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-6923-b507-f2a81771f7a6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562f-6926-0f81-b7e24b01196c	000e0000-562f-6926-0949-bd255f035143	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-6923-c710-375519792f7d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562f-6926-0bae-f950b36152c5	000e0000-562f-6926-89bb-0bb73ee00d25	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-6923-b507-f2a81771f7a6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562f-6926-0ea3-a759ac33d1a5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562f-6926-6379-6483f54074d3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3097 (class 0 OID 23529603)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-562f-6926-897d-f15a03c26e91	000e0000-562f-6926-0949-bd255f035143	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-562f-6924-2120-4ee3e9df02ca
000d0000-562f-6926-6fae-1d263b13636f	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-669a-833e835f3847	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-562f-6924-2120-4ee3e9df02ca
000d0000-562f-6926-5fad-d2e0317d4bad	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-77f0-bef324c29d2c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-562f-6924-49cb-56ed35e792e8
000d0000-562f-6926-d656-96a460d6f57e	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-83e4-3e777d5bb204	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-562f-6924-d80d-ba24ce0c4fe6
000d0000-562f-6926-345b-eed42170a946	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-00e1-a3269112c1ca	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-562f-6924-3d07-123d60129378
000d0000-562f-6926-e40c-892b74df2356	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-1852-d9dbcd716dbe	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-562f-6924-3d07-123d60129378
000d0000-562f-6926-ead1-0842a20c135f	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-0e25-b8e33c53f93d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-562f-6924-2120-4ee3e9df02ca
000d0000-562f-6926-f1d5-7ee7fecb37c1	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-973c-db34d8ccc037	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-562f-6924-eda1-5d5cf1c1e233
000d0000-562f-6926-15d3-27ea130ecf58	000e0000-562f-6926-0949-bd255f035143	000c0000-562f-6926-7c30-987356c7d2fc	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-562f-6924-fdd6-9e8faf5bb7c8
\.


--
-- TOC entry 3075 (class 0 OID 23529400)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23529366)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 23529343)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-562f-6926-c071-6f0c74f3780a	00080000-562f-6926-8b38-c152454d27f1	00090000-562f-6926-22d7-01778667912f	AK		igralka
\.


--
-- TOC entry 3086 (class 0 OID 23529517)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23530041)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23530053)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23530075)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23529542)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23529300)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-562f-6924-df5d-5245c6c83900	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-562f-6924-9f1a-b693dbea1318	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-562f-6924-043f-d6ab275f8826	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-562f-6924-127e-ac998757c08c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-562f-6924-af47-9899987dcc7b	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-562f-6924-f42a-ee2ba2e7b7a1	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-562f-6924-bf3f-8ca90831ddfd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-562f-6924-4092-e0031ddf3128	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562f-6924-c6d8-27db3c45bc4e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562f-6924-b2ff-a7a2bb077aec	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-562f-6924-b3c1-d53d6d5109a2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-562f-6924-bee3-5f7c249f1da7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-562f-6924-4de1-73a405df6988	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-562f-6924-5b71-28fa4ada1ab5	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-562f-6924-b395-4071ff287b06	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-562f-6926-5f72-ef5eea5c687d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-562f-6926-1c9d-6bf325de5b47	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-562f-6926-8f83-0efb32288c00	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-562f-6926-ca7c-7d85208992a8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-562f-6926-26ff-5627792c99a1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-562f-6928-568d-e68aaf644eb9	application.tenant.maticnopodjetje	string	s:36:"00080000-562f-6928-6e22-66526a272df1";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3060 (class 0 OID 23529200)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-562f-6926-410a-1bb24fce6548	00000000-562f-6926-5f72-ef5eea5c687d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-562f-6926-6fca-04fa36949c41	00000000-562f-6926-5f72-ef5eea5c687d	00010000-562f-6924-dc61-9bf33b3f806c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-562f-6926-d91f-67e4d3ddd0e5	00000000-562f-6926-1c9d-6bf325de5b47	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3064 (class 0 OID 23529267)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-562f-6926-bafe-5a46f7ef9776	\N	00100000-562f-6926-a402-0726f0407f0e	00100000-562f-6926-6a03-5f00c2939a0f	01	Gledališče Nimbis
00410000-562f-6926-ce47-c7ea9d3ddf28	00410000-562f-6926-bafe-5a46f7ef9776	00100000-562f-6926-a402-0726f0407f0e	00100000-562f-6926-6a03-5f00c2939a0f	02	Tehnika
\.


--
-- TOC entry 3061 (class 0 OID 23529211)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-562f-6926-d819-ac8267624107	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-562f-6926-6d0a-bb2523c6f239	00010000-562f-6926-038d-cf5427c4117d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-562f-6926-13c1-d4daa44412f5	00010000-562f-6926-c2aa-a14c5b10d2c4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-562f-6926-7add-40e491f080a0	00010000-562f-6926-c9b7-32de2dfe2e44	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-562f-6926-4eb5-331c165dad35	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-562f-6926-80ed-ad51ab4d87a3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-562f-6926-e633-8c851d74384f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-562f-6926-fb3d-7f12137d36af	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-562f-6926-22d7-01778667912f	00010000-562f-6926-82ac-83c1b23150f5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-562f-6926-5c27-86316fb0fcac	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-562f-6926-3672-ee57ca29da39	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562f-6926-eaac-0a881b895e02	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-562f-6926-b535-b09c2d8b1f58	00010000-562f-6926-7a83-4b3d7f7ddc86	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562f-6926-074c-6e40bf8a5913	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-6926-abb3-551cccb152d2	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-6926-d9dc-3a3c954d5dfd	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-6926-bac2-a0f4a4dfcb4e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562f-6926-6c93-4e7908edf113	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562f-6926-8805-88f4834b9353	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-6926-ba08-37d2b9bcda95	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-6926-f43f-747b67526cf6	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3055 (class 0 OID 23529155)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-562f-6924-6ec3-831953ee0b39	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-562f-6924-a354-ed724a02b710	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-562f-6924-bb53-a8a1c3d58424	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-562f-6924-7b8a-9edf9a78e43d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-562f-6924-8a11-75688f8acd4c	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-562f-6924-5e47-22bccbc42883	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-562f-6924-8134-0130b8343d8a	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-562f-6924-1939-550c0b64571c	Abonma-read	Abonma - branje	t
00030000-562f-6924-a773-e22a69ff233a	Abonma-write	Abonma - spreminjanje	t
00030000-562f-6924-2c0d-0f7dc87e7568	Alternacija-read	Alternacija - branje	t
00030000-562f-6924-73dc-19f0a75988d6	Alternacija-write	Alternacija - spreminjanje	t
00030000-562f-6924-5a34-6b55e7730101	Arhivalija-read	Arhivalija - branje	t
00030000-562f-6924-0cf1-104d9668d3e6	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-562f-6924-15bd-434380951283	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-562f-6924-998e-2902e8961b5b	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-562f-6924-6fa2-7cec7cc88535	Besedilo-read	Besedilo - branje	t
00030000-562f-6924-7b83-1e022d37e081	Besedilo-write	Besedilo - spreminjanje	t
00030000-562f-6924-24d8-14f89893a192	DogodekIzven-read	DogodekIzven - branje	t
00030000-562f-6924-aa69-377d13f3ac54	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-562f-6924-23b1-f14e3082bd64	Dogodek-read	Dogodek - branje	t
00030000-562f-6924-8d57-0e0e7af532af	Dogodek-write	Dogodek - spreminjanje	t
00030000-562f-6924-ea0f-5c2dea1fc457	DrugiVir-read	DrugiVir - branje	t
00030000-562f-6924-51b7-c53a4eaaa71b	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-562f-6924-9e7c-95a4fac0d9fb	Drzava-read	Drzava - branje	t
00030000-562f-6924-451b-480db75e484b	Drzava-write	Drzava - spreminjanje	t
00030000-562f-6924-2f8d-9a09dac57c6e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-562f-6924-fd74-92cccdc674b8	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-562f-6924-60f2-47fe66ae3fbc	Funkcija-read	Funkcija - branje	t
00030000-562f-6924-3fd0-7571978bc028	Funkcija-write	Funkcija - spreminjanje	t
00030000-562f-6924-429e-914c7b0d0a2a	Gostovanje-read	Gostovanje - branje	t
00030000-562f-6924-755e-916b6113c16b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-562f-6924-4b2f-c84be3298489	Gostujoca-read	Gostujoca - branje	t
00030000-562f-6924-febb-4300f8f89894	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-562f-6924-d3c1-061fa281aae8	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-562f-6924-5b1a-5d49b1a15f7a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-562f-6924-5b63-a3b82868c8bf	Kupec-read	Kupec - branje	t
00030000-562f-6924-7c1f-b13d479ffb15	Kupec-write	Kupec - spreminjanje	t
00030000-562f-6924-2b6a-4877bb4c9ca4	NacinPlacina-read	NacinPlacina - branje	t
00030000-562f-6924-2d24-80a45f6d9e35	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-562f-6924-47c0-9db4ba2f42ef	Option-read	Option - branje	t
00030000-562f-6924-46a8-d60aa1ca799d	Option-write	Option - spreminjanje	t
00030000-562f-6924-4904-496bf8a98b34	OptionValue-read	OptionValue - branje	t
00030000-562f-6924-dde5-51fc8326f045	OptionValue-write	OptionValue - spreminjanje	t
00030000-562f-6924-c096-9fd9bf2aec63	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-562f-6924-e5d6-019bb5648990	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-562f-6924-f79e-baf90bc3dd01	Oseba-read	Oseba - branje	t
00030000-562f-6924-0185-ede20e6268b0	Oseba-write	Oseba - spreminjanje	t
00030000-562f-6924-74bb-33fceebcb59e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-562f-6924-a8ef-1f65dacafcfd	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-562f-6924-917e-1c699c7f49d8	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-562f-6924-6149-57e4fe7d769e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-562f-6924-4d7a-a679cb7f31c7	Pogodba-read	Pogodba - branje	t
00030000-562f-6924-db9e-04bba88a42c2	Pogodba-write	Pogodba - spreminjanje	t
00030000-562f-6924-34b8-f820512501a1	Popa-read	Popa - branje	t
00030000-562f-6924-d195-3b7998900b75	Popa-write	Popa - spreminjanje	t
00030000-562f-6924-8c77-433364a19b54	Posta-read	Posta - branje	t
00030000-562f-6924-2ba6-5350146b2ad5	Posta-write	Posta - spreminjanje	t
00030000-562f-6924-0bbb-2eb6e3962549	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-562f-6924-f648-4ff13d703a7e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-562f-6924-bd96-c96f3ccbfa04	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-562f-6924-335a-e758a3f29ad3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-562f-6924-6b32-f2cff5dacf45	PostniNaslov-read	PostniNaslov - branje	t
00030000-562f-6924-e57a-8445ee6e2b2e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-562f-6924-d9eb-4a76922f34dc	Predstava-read	Predstava - branje	t
00030000-562f-6924-21c1-d8d529d7c4c2	Predstava-write	Predstava - spreminjanje	t
00030000-562f-6924-fdd4-cd4d17714620	Praznik-read	Praznik - branje	t
00030000-562f-6924-19a4-8a2f4d1f9e2a	Praznik-write	Praznik - spreminjanje	t
00030000-562f-6924-d02a-2f24b0f526a9	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-562f-6924-66c1-cc32a4d683c3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-562f-6924-2f2e-b96a395b7e24	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-562f-6924-b452-1fa8384e46c4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-562f-6924-f77f-54788a09b91d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-562f-6924-9e59-0c259c7fdafd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-562f-6924-54f3-e4c2e02744b4	ProgramDela-read	ProgramDela - branje	t
00030000-562f-6924-9191-b841cf13d6df	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-562f-6924-1d9e-c9ba8e3e4893	ProgramFestival-read	ProgramFestival - branje	t
00030000-562f-6924-ad27-fe518cf60ff2	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-562f-6924-f728-6d5472737663	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-562f-6924-7417-f90fe1845c31	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-562f-6924-58a2-8b6990969c0d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-562f-6924-f8e8-573ec2dffa74	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-562f-6924-be6c-c1d3fbc8d4ca	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-562f-6924-c10a-b76761185da1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-562f-6924-24ac-73d18812415a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-562f-6924-6338-af23580779b7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-562f-6924-32b1-51d4f23c697f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-562f-6924-f1e8-ef5f432e7a39	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-562f-6924-1c1f-060a76ab556d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-562f-6924-9254-27b8f0f45ca0	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-562f-6924-de8c-d2ad89e0a50d	ProgramRazno-read	ProgramRazno - branje	t
00030000-562f-6924-0a77-688bd6645ad4	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-562f-6924-fd46-dd6d139df2f4	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-562f-6924-40b5-bc3a7f0d1391	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-562f-6924-cd09-c3ba6959c61b	Prostor-read	Prostor - branje	t
00030000-562f-6924-07bc-d0d78336d8b3	Prostor-write	Prostor - spreminjanje	t
00030000-562f-6924-e81d-cc160d1f148a	Racun-read	Racun - branje	t
00030000-562f-6924-8030-b4580f0edb42	Racun-write	Racun - spreminjanje	t
00030000-562f-6924-b61d-a15692df4bc0	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-562f-6924-3545-7f8d48d8b1ab	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-562f-6924-451d-6922a8eb2bb5	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-562f-6924-c501-fd2fb0b8090d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-562f-6924-5d61-7df799cbd48a	Rekvizit-read	Rekvizit - branje	t
00030000-562f-6924-cd14-11ad9ee5df8c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-562f-6924-1c19-ca8d453363de	Revizija-read	Revizija - branje	t
00030000-562f-6924-d135-16f0de93a51c	Revizija-write	Revizija - spreminjanje	t
00030000-562f-6924-047f-33e76863fd7e	Rezervacija-read	Rezervacija - branje	t
00030000-562f-6924-1333-9b12c9eb9cd2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-562f-6924-a912-69362e4bfba7	SedezniRed-read	SedezniRed - branje	t
00030000-562f-6924-8260-73efb8d82877	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-562f-6924-8446-b4d4bc2f9d8a	Sedez-read	Sedez - branje	t
00030000-562f-6924-1f1e-819a84dd1029	Sedez-write	Sedez - spreminjanje	t
00030000-562f-6924-a05d-0406d9c44147	Sezona-read	Sezona - branje	t
00030000-562f-6924-54a4-24f3b616b4c1	Sezona-write	Sezona - spreminjanje	t
00030000-562f-6924-3e15-3e929a8612dc	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-562f-6924-bf2c-803d56390816	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-562f-6924-4b36-bd3670e8cde7	Stevilcenje-read	Stevilcenje - branje	t
00030000-562f-6924-4127-95e54005b02d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-562f-6924-943f-a4ec86e20d8a	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-562f-6924-01ea-d98f3d8db85f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-562f-6924-f000-33caf00661bb	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-562f-6924-2af5-b4253d297919	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-562f-6924-a91a-46e4f958ca75	Telefonska-read	Telefonska - branje	t
00030000-562f-6924-b09d-bf652b3226fb	Telefonska-write	Telefonska - spreminjanje	t
00030000-562f-6924-cd2c-437c7ffd6c43	TerminStoritve-read	TerminStoritve - branje	t
00030000-562f-6924-33ef-ac71d85e64d2	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-562f-6924-86df-757f04d53159	TipFunkcije-read	TipFunkcije - branje	t
00030000-562f-6924-8e60-99a9ef215666	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-562f-6924-347c-8cf125b7d2e6	TipPopa-read	TipPopa - branje	t
00030000-562f-6924-cc4a-489191114b3d	TipPopa-write	TipPopa - spreminjanje	t
00030000-562f-6924-3d44-3066123f3786	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-562f-6924-e0eb-e32838e452c6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-562f-6924-7418-485c7d9ea3e0	TipVaje-read	TipVaje - branje	t
00030000-562f-6924-828e-1e1d2815eefa	TipVaje-write	TipVaje - spreminjanje	t
00030000-562f-6924-57f6-fd0276577b5f	Trr-read	Trr - branje	t
00030000-562f-6924-409f-b361b540cc48	Trr-write	Trr - spreminjanje	t
00030000-562f-6924-779a-60b2b736816a	Uprizoritev-read	Uprizoritev - branje	t
00030000-562f-6924-ddff-1d08c6e53812	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-562f-6924-5771-0df55b7c40d2	Vaja-read	Vaja - branje	t
00030000-562f-6924-dcf5-8ee189858efd	Vaja-write	Vaja - spreminjanje	t
00030000-562f-6924-5f3a-541186d65843	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-562f-6924-c3a5-25890bfb57c0	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-562f-6924-13db-ef5de93d166a	VrstaStroska-read	VrstaStroska - branje	t
00030000-562f-6924-8a6f-9345f230522f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-562f-6924-ea22-c76f76c4cb95	Zaposlitev-read	Zaposlitev - branje	t
00030000-562f-6924-452a-07c28f39cc84	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-562f-6924-10d8-033d6b670dd9	Zasedenost-read	Zasedenost - branje	t
00030000-562f-6924-9f5d-08122ae89cb3	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-562f-6924-f2dd-922efd71610d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-562f-6924-725c-b02cefbd086b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-562f-6924-163b-e04ca32ba925	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-562f-6924-363b-788b1d26c5c9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-562f-6924-508e-53bd2d6658a5	Job-read	Branje opravil - samo zase - branje	t
00030000-562f-6924-34cf-ffe57d485758	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-562f-6924-175a-9303d373b9ec	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-562f-6924-fc3c-571326c847ad	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-562f-6924-5123-848cc3ea1065	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-562f-6924-4b13-8baa4c1c57cd	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-562f-6924-19f2-e328729e70a5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-562f-6924-8710-6e0741be21fa	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-562f-6924-f3dd-8e6539fe653a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-562f-6924-e077-376df38ef9cd	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562f-6924-cf3b-c5d020833509	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562f-6924-39ff-b8f26171dd24	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-562f-6924-80e5-18f891003e60	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-562f-6924-2e80-a2a03848c441	Datoteka-write	Datoteka - spreminjanje	t
00030000-562f-6924-b891-ad2fc20e8188	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3057 (class 0 OID 23529174)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-562f-6924-fb40-91f52f441e22	00030000-562f-6924-a354-ed724a02b710
00020000-562f-6924-0fce-367c674644f3	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-1939-550c0b64571c
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-a773-e22a69ff233a
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-2c0d-0f7dc87e7568
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-73dc-19f0a75988d6
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-5a34-6b55e7730101
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-23b1-f14e3082bd64
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-7b8a-9edf9a78e43d
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-8d57-0e0e7af532af
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-451b-480db75e484b
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-60f2-47fe66ae3fbc
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-3fd0-7571978bc028
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-429e-914c7b0d0a2a
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-755e-916b6113c16b
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-4b2f-c84be3298489
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-febb-4300f8f89894
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-d3c1-061fa281aae8
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-5b1a-5d49b1a15f7a
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-47c0-9db4ba2f42ef
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-4904-496bf8a98b34
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-f79e-baf90bc3dd01
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-0185-ede20e6268b0
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-34b8-f820512501a1
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-d195-3b7998900b75
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-8c77-433364a19b54
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-2ba6-5350146b2ad5
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-6b32-f2cff5dacf45
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-e57a-8445ee6e2b2e
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-d9eb-4a76922f34dc
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-21c1-d8d529d7c4c2
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-f77f-54788a09b91d
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-9e59-0c259c7fdafd
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-cd09-c3ba6959c61b
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-07bc-d0d78336d8b3
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-451d-6922a8eb2bb5
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-c501-fd2fb0b8090d
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-5d61-7df799cbd48a
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-cd14-11ad9ee5df8c
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-a05d-0406d9c44147
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-54a4-24f3b616b4c1
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-86df-757f04d53159
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-779a-60b2b736816a
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-ddff-1d08c6e53812
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-5771-0df55b7c40d2
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-dcf5-8ee189858efd
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-10d8-033d6b670dd9
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-9f5d-08122ae89cb3
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-f2dd-922efd71610d
00020000-562f-6924-684b-5cb2c2620e88	00030000-562f-6924-163b-e04ca32ba925
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-1939-550c0b64571c
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-5a34-6b55e7730101
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-23b1-f14e3082bd64
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-429e-914c7b0d0a2a
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-4b2f-c84be3298489
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-d3c1-061fa281aae8
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-5b1a-5d49b1a15f7a
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-47c0-9db4ba2f42ef
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-4904-496bf8a98b34
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-f79e-baf90bc3dd01
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-0185-ede20e6268b0
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-34b8-f820512501a1
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-8c77-433364a19b54
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-6b32-f2cff5dacf45
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-e57a-8445ee6e2b2e
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-d9eb-4a76922f34dc
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-cd09-c3ba6959c61b
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-451d-6922a8eb2bb5
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-5d61-7df799cbd48a
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-a05d-0406d9c44147
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-a91a-46e4f958ca75
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-b09d-bf652b3226fb
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-57f6-fd0276577b5f
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-409f-b361b540cc48
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-ea22-c76f76c4cb95
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-452a-07c28f39cc84
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-f2dd-922efd71610d
00020000-562f-6924-82e8-5908c3fc8924	00030000-562f-6924-163b-e04ca32ba925
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-1939-550c0b64571c
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-2c0d-0f7dc87e7568
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-5a34-6b55e7730101
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-0cf1-104d9668d3e6
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-6fa2-7cec7cc88535
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-24d8-14f89893a192
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-23b1-f14e3082bd64
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-60f2-47fe66ae3fbc
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-429e-914c7b0d0a2a
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-4b2f-c84be3298489
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-d3c1-061fa281aae8
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-47c0-9db4ba2f42ef
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-4904-496bf8a98b34
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-f79e-baf90bc3dd01
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-34b8-f820512501a1
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-8c77-433364a19b54
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-d9eb-4a76922f34dc
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-f77f-54788a09b91d
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-cd09-c3ba6959c61b
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-451d-6922a8eb2bb5
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-5d61-7df799cbd48a
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-a05d-0406d9c44147
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-86df-757f04d53159
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-5771-0df55b7c40d2
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-10d8-033d6b670dd9
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-f2dd-922efd71610d
00020000-562f-6924-a8a0-da44d3be211f	00030000-562f-6924-163b-e04ca32ba925
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-1939-550c0b64571c
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-a773-e22a69ff233a
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-73dc-19f0a75988d6
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-5a34-6b55e7730101
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-23b1-f14e3082bd64
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-429e-914c7b0d0a2a
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-4b2f-c84be3298489
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-47c0-9db4ba2f42ef
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-4904-496bf8a98b34
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-34b8-f820512501a1
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-8c77-433364a19b54
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-d9eb-4a76922f34dc
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-cd09-c3ba6959c61b
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-451d-6922a8eb2bb5
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-5d61-7df799cbd48a
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-a05d-0406d9c44147
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-86df-757f04d53159
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-f2dd-922efd71610d
00020000-562f-6924-9701-56111c858610	00030000-562f-6924-163b-e04ca32ba925
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-1939-550c0b64571c
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-5a34-6b55e7730101
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-23b1-f14e3082bd64
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-429e-914c7b0d0a2a
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-4b2f-c84be3298489
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-47c0-9db4ba2f42ef
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-4904-496bf8a98b34
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-34b8-f820512501a1
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-8c77-433364a19b54
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-d9eb-4a76922f34dc
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-cd09-c3ba6959c61b
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-451d-6922a8eb2bb5
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-5d61-7df799cbd48a
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-a05d-0406d9c44147
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-cd2c-437c7ffd6c43
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-bb53-a8a1c3d58424
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-86df-757f04d53159
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-f2dd-922efd71610d
00020000-562f-6924-fa72-276b98784c20	00030000-562f-6924-163b-e04ca32ba925
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-6ec3-831953ee0b39
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-a354-ed724a02b710
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-1939-550c0b64571c
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-a773-e22a69ff233a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2c0d-0f7dc87e7568
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-73dc-19f0a75988d6
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5a34-6b55e7730101
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-0cf1-104d9668d3e6
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-15bd-434380951283
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-998e-2902e8961b5b
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-6fa2-7cec7cc88535
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-7b83-1e022d37e081
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-24d8-14f89893a192
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-aa69-377d13f3ac54
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-23b1-f14e3082bd64
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-7b8a-9edf9a78e43d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8d57-0e0e7af532af
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-ea0f-5c2dea1fc457
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-51b7-c53a4eaaa71b
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-9e7c-95a4fac0d9fb
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-451b-480db75e484b
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2f8d-9a09dac57c6e
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-fd74-92cccdc674b8
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-60f2-47fe66ae3fbc
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-3fd0-7571978bc028
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-429e-914c7b0d0a2a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-755e-916b6113c16b
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-4b2f-c84be3298489
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-febb-4300f8f89894
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-d3c1-061fa281aae8
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5b1a-5d49b1a15f7a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5b63-a3b82868c8bf
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-7c1f-b13d479ffb15
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2b6a-4877bb4c9ca4
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2d24-80a45f6d9e35
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-47c0-9db4ba2f42ef
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-4904-496bf8a98b34
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-dde5-51fc8326f045
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-46a8-d60aa1ca799d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-c096-9fd9bf2aec63
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-e5d6-019bb5648990
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f79e-baf90bc3dd01
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8a11-75688f8acd4c
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-0185-ede20e6268b0
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-74bb-33fceebcb59e
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-a8ef-1f65dacafcfd
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-917e-1c699c7f49d8
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-6149-57e4fe7d769e
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-4d7a-a679cb7f31c7
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-db9e-04bba88a42c2
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-34b8-f820512501a1
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-d195-3b7998900b75
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8c77-433364a19b54
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-0bbb-2eb6e3962549
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f648-4ff13d703a7e
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-bd96-c96f3ccbfa04
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-335a-e758a3f29ad3
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2ba6-5350146b2ad5
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-6b32-f2cff5dacf45
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-e57a-8445ee6e2b2e
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-fdd4-cd4d17714620
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-19a4-8a2f4d1f9e2a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-d9eb-4a76922f34dc
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-21c1-d8d529d7c4c2
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-d02a-2f24b0f526a9
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-66c1-cc32a4d683c3
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2f2e-b96a395b7e24
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-b452-1fa8384e46c4
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f77f-54788a09b91d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-9e59-0c259c7fdafd
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5e47-22bccbc42883
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-54f3-e4c2e02744b4
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8134-0130b8343d8a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-9191-b841cf13d6df
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-1d9e-c9ba8e3e4893
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-ad27-fe518cf60ff2
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f728-6d5472737663
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-7417-f90fe1845c31
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-58a2-8b6990969c0d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f8e8-573ec2dffa74
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-be6c-c1d3fbc8d4ca
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-c10a-b76761185da1
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-24ac-73d18812415a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-6338-af23580779b7
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-32b1-51d4f23c697f
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f1e8-ef5f432e7a39
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-1c1f-060a76ab556d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-9254-27b8f0f45ca0
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-de8c-d2ad89e0a50d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-0a77-688bd6645ad4
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-fd46-dd6d139df2f4
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-40b5-bc3a7f0d1391
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-cd09-c3ba6959c61b
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-07bc-d0d78336d8b3
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-e81d-cc160d1f148a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8030-b4580f0edb42
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-b61d-a15692df4bc0
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-3545-7f8d48d8b1ab
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-451d-6922a8eb2bb5
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-c501-fd2fb0b8090d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5d61-7df799cbd48a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-cd14-11ad9ee5df8c
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-1c19-ca8d453363de
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-d135-16f0de93a51c
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-047f-33e76863fd7e
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-1333-9b12c9eb9cd2
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-a912-69362e4bfba7
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8260-73efb8d82877
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8446-b4d4bc2f9d8a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-1f1e-819a84dd1029
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-a05d-0406d9c44147
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-54a4-24f3b616b4c1
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-3e15-3e929a8612dc
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-bf2c-803d56390816
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-4b36-bd3670e8cde7
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-943f-a4ec86e20d8a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-01ea-d98f3d8db85f
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-4127-95e54005b02d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f000-33caf00661bb
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-2af5-b4253d297919
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-a91a-46e4f958ca75
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-b09d-bf652b3226fb
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-cd2c-437c7ffd6c43
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-bb53-a8a1c3d58424
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-33ef-ac71d85e64d2
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-86df-757f04d53159
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8e60-99a9ef215666
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-347c-8cf125b7d2e6
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-cc4a-489191114b3d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-3d44-3066123f3786
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-e0eb-e32838e452c6
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-7418-485c7d9ea3e0
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-828e-1e1d2815eefa
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-57f6-fd0276577b5f
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-409f-b361b540cc48
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-779a-60b2b736816a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-ddff-1d08c6e53812
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5771-0df55b7c40d2
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-dcf5-8ee189858efd
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-5f3a-541186d65843
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-c3a5-25890bfb57c0
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-13db-ef5de93d166a
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-8a6f-9345f230522f
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-ea22-c76f76c4cb95
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-452a-07c28f39cc84
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-10d8-033d6b670dd9
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-9f5d-08122ae89cb3
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-f2dd-922efd71610d
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-725c-b02cefbd086b
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-163b-e04ca32ba925
00020000-562f-6926-e84d-0b45e2513c2e	00030000-562f-6924-363b-788b1d26c5c9
\.


--
-- TOC entry 3091 (class 0 OID 23529549)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23529583)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23529720)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-562f-6926-d1a3-77280e92e2bd	00090000-562f-6926-d819-ac8267624107	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-562f-6926-b254-c9e51ffa50a1	00090000-562f-6926-80ed-ad51ab4d87a3	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-562f-6926-15a5-cd80edfcc18e	00090000-562f-6926-b535-b09c2d8b1f58	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-562f-6926-5dd4-0a8f889adcfd	00090000-562f-6926-5c27-86316fb0fcac	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3063 (class 0 OID 23529247)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-562f-6926-8b38-c152454d27f1	\N	00040000-562f-6924-fa40-5ab6de8773f5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-1eed-7433e9dac32b	\N	00040000-562f-6924-fa40-5ab6de8773f5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-562f-6926-e7ab-99cc9e101104	\N	00040000-562f-6924-fa40-5ab6de8773f5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-9c9d-1223dcb2a6a7	\N	00040000-562f-6924-fa40-5ab6de8773f5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-8a48-7df376fe4453	\N	00040000-562f-6924-fa40-5ab6de8773f5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-9954-d52962b38eeb	\N	00040000-562f-6924-4ca2-8c9058bc3dec	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-12b3-c13fd5dbec06	\N	00040000-562f-6924-e717-39563787ed00	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-8a49-05cbdb5d6519	\N	00040000-562f-6924-35a7-9d7209fced8e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6926-ace3-f4d7eabffe09	\N	00040000-562f-6924-a3db-eadcea44fe05	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-6928-6e22-66526a272df1	\N	00040000-562f-6924-fa40-5ab6de8773f5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3066 (class 0 OID 23529292)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-562f-6923-5e72-bdca867569b6	8341	Adlešiči
00050000-562f-6923-7a28-9088f00ddb5d	5270	Ajdovščina
00050000-562f-6923-997f-d365b4f8faae	6280	Ankaran/Ancarano
00050000-562f-6923-cdfd-7672afbc186f	9253	Apače
00050000-562f-6923-119b-8e69a839f463	8253	Artiče
00050000-562f-6923-11bd-15facf4516d1	4275	Begunje na Gorenjskem
00050000-562f-6923-2335-07cc87d8afc1	1382	Begunje pri Cerknici
00050000-562f-6923-0796-8736c40f5a3c	9231	Beltinci
00050000-562f-6923-031c-7d7bb1f58a9d	2234	Benedikt
00050000-562f-6923-65b9-cafa29cdd7f3	2345	Bistrica ob Dravi
00050000-562f-6923-ddad-19fad7c3a964	3256	Bistrica ob Sotli
00050000-562f-6923-af63-1e513c5c9a37	8259	Bizeljsko
00050000-562f-6923-04c0-e931525ca12c	1223	Blagovica
00050000-562f-6923-7abd-58fabee471fa	8283	Blanca
00050000-562f-6923-f06f-738b3f53faee	4260	Bled
00050000-562f-6923-9154-4982d180fad7	4273	Blejska Dobrava
00050000-562f-6923-4cc3-706624805f41	9265	Bodonci
00050000-562f-6923-6dbe-e45c687276d7	9222	Bogojina
00050000-562f-6923-e52d-45804ac84f25	4263	Bohinjska Bela
00050000-562f-6923-08cd-64512f42220e	4264	Bohinjska Bistrica
00050000-562f-6923-313f-6d871794f344	4265	Bohinjsko jezero
00050000-562f-6923-21a3-84beb6a40c9f	1353	Borovnica
00050000-562f-6923-3779-d529cae9c261	8294	Boštanj
00050000-562f-6923-7ad0-d3a48dad1cfd	5230	Bovec
00050000-562f-6923-877b-320c21fe070e	5295	Branik
00050000-562f-6923-be4e-868150829d05	3314	Braslovče
00050000-562f-6923-d7be-c528d7b17c6f	5223	Breginj
00050000-562f-6923-3b2f-c5752eb308df	8280	Brestanica
00050000-562f-6923-a69a-67558c7cefc8	2354	Bresternica
00050000-562f-6923-da3e-f574daa64b38	4243	Brezje
00050000-562f-6923-b0d5-564c9749e167	1351	Brezovica pri Ljubljani
00050000-562f-6923-a9c2-ef3dcfe3dc3f	8250	Brežice
00050000-562f-6923-6102-ccb5e1064973	4210	Brnik - Aerodrom
00050000-562f-6923-839b-8bf0b5239bef	8321	Brusnice
00050000-562f-6923-7f74-a2e45e1a0079	3255	Buče
00050000-562f-6923-c25b-58e44f5d5801	8276	Bučka 
00050000-562f-6923-9f4e-6ea16994ce57	9261	Cankova
00050000-562f-6923-992f-b1a8baab3b32	3000	Celje 
00050000-562f-6923-fe8a-c8b4fc10e0f3	3001	Celje - poštni predali
00050000-562f-6923-5511-1c50e28011c4	4207	Cerklje na Gorenjskem
00050000-562f-6923-e6be-ee91bdc7de26	8263	Cerklje ob Krki
00050000-562f-6923-13f1-e9d1ec624479	1380	Cerknica
00050000-562f-6923-4e77-dc5c25f9db80	5282	Cerkno
00050000-562f-6923-7db1-0d7ce8c3019f	2236	Cerkvenjak
00050000-562f-6923-a174-2344fb4e6166	2215	Ceršak
00050000-562f-6923-9111-c4732a0f7a8b	2326	Cirkovce
00050000-562f-6923-e3f1-30e1c7cfacc3	2282	Cirkulane
00050000-562f-6923-92c4-4b7443f00aed	5273	Col
00050000-562f-6923-7850-64c174220529	8251	Čatež ob Savi
00050000-562f-6923-06e3-f91d9c7ca187	1413	Čemšenik
00050000-562f-6923-bd91-09cd9c178340	5253	Čepovan
00050000-562f-6923-3600-68c3f4e918f6	9232	Črenšovci
00050000-562f-6923-aba2-0115e1111ade	2393	Črna na Koroškem
00050000-562f-6923-97a4-3658e8305f23	6275	Črni Kal
00050000-562f-6923-3ed0-36aa983c953b	5274	Črni Vrh nad Idrijo
00050000-562f-6923-9bc0-e27fccbd3b7b	5262	Črniče
00050000-562f-6923-95c3-29fa366fa227	8340	Črnomelj
00050000-562f-6923-15e3-7ca2cee19452	6271	Dekani
00050000-562f-6923-27e2-24a26357fe6f	5210	Deskle
00050000-562f-6923-69f5-2421f1883791	2253	Destrnik
00050000-562f-6923-43d0-1a1f6ed0479d	6215	Divača
00050000-562f-6923-6557-08ac0af11a66	1233	Dob
00050000-562f-6923-4d6b-51a3755a23a2	3224	Dobje pri Planini
00050000-562f-6923-7583-403015a4f48b	8257	Dobova
00050000-562f-6923-7118-421be13fbc7a	1423	Dobovec
00050000-562f-6923-6e0c-105f6d589fb8	5263	Dobravlje
00050000-562f-6923-1ccd-998b0f55a6ab	3204	Dobrna
00050000-562f-6923-28ed-3b5599ab05bf	8211	Dobrnič
00050000-562f-6923-aa48-c62708ae571c	1356	Dobrova
00050000-562f-6923-613b-6c4086d54a03	9223	Dobrovnik/Dobronak 
00050000-562f-6923-a5f2-7eee5bcaa32c	5212	Dobrovo v Brdih
00050000-562f-6923-75c0-252c3dce09e9	1431	Dol pri Hrastniku
00050000-562f-6923-52c1-ec7ce0d6aee0	1262	Dol pri Ljubljani
00050000-562f-6923-76be-2ce12170bc48	1273	Dole pri Litiji
00050000-562f-6923-5c3b-80d0b143b778	1331	Dolenja vas
00050000-562f-6923-356d-d8b5607b0c94	8350	Dolenjske Toplice
00050000-562f-6923-dc1c-1ecc78a71e44	1230	Domžale
00050000-562f-6923-c6f1-ca64ef43bdfb	2252	Dornava
00050000-562f-6923-01d3-abae9640c9fe	5294	Dornberk
00050000-562f-6923-7726-8505dda0f309	1319	Draga
00050000-562f-6923-f0da-a5916b1b6ada	8343	Dragatuš
00050000-562f-6923-fe34-054a9b0e1c61	3222	Dramlje
00050000-562f-6923-5fdc-596609e4b3ed	2370	Dravograd
00050000-562f-6923-162d-2a9b92e7230f	4203	Duplje
00050000-562f-6923-fcc6-92b64896ea90	6221	Dutovlje
00050000-562f-6923-3ab6-5fbc14d1e775	8361	Dvor
00050000-562f-6923-3995-af4033c65374	2343	Fala
00050000-562f-6923-398c-9855229fbdf2	9208	Fokovci
00050000-562f-6923-dbe6-aa1a0220bf94	2313	Fram
00050000-562f-6923-746c-28e358374cd3	3213	Frankolovo
00050000-562f-6923-45da-785c793c8645	1274	Gabrovka
00050000-562f-6923-2ae1-b6591c9ac20a	8254	Globoko
00050000-562f-6923-e629-109d9acc86bc	5275	Godovič
00050000-562f-6923-99b6-470e3e23c36d	4204	Golnik
00050000-562f-6923-ae04-f7439808f42d	3303	Gomilsko
00050000-562f-6923-1e4c-8a34841a7a79	4224	Gorenja vas
00050000-562f-6923-009a-2987c23cddfe	3263	Gorica pri Slivnici
00050000-562f-6923-09a8-7f18ed654c21	2272	Gorišnica
00050000-562f-6923-5a2f-42b5474e00e8	9250	Gornja Radgona
00050000-562f-6923-86ea-937033336403	3342	Gornji Grad
00050000-562f-6923-1656-9b44feee4638	4282	Gozd Martuljek
00050000-562f-6923-63c6-34f35c5e6854	6272	Gračišče
00050000-562f-6923-f107-8ccf51a34dc3	9264	Grad
00050000-562f-6923-6504-917e0e9a8b67	8332	Gradac
00050000-562f-6923-0e06-17e7f0dec0ba	1384	Grahovo
00050000-562f-6923-2a73-cc7a037b3dc9	5242	Grahovo ob Bači
00050000-562f-6923-cc89-df4b728c6b57	5251	Grgar
00050000-562f-6923-667d-6350707591c6	3302	Griže
00050000-562f-6923-f900-c2a954f2c4c1	3231	Grobelno
00050000-562f-6923-4212-05dca9b215a9	1290	Grosuplje
00050000-562f-6923-5aeb-344f90b3431b	2288	Hajdina
00050000-562f-6923-0203-313faeaefc5a	8362	Hinje
00050000-562f-6923-d71e-cf7f0a61c7c7	2311	Hoče
00050000-562f-6923-97ea-6642f543c354	9205	Hodoš/Hodos
00050000-562f-6923-b05b-23759af81585	1354	Horjul
00050000-562f-6923-1036-f5b5e6bdf446	1372	Hotedršica
00050000-562f-6923-d53f-3c3559ea6919	1430	Hrastnik
00050000-562f-6923-f9f8-4a8baef641ad	6225	Hruševje
00050000-562f-6923-5137-1b0f1135bd21	4276	Hrušica
00050000-562f-6923-1b48-eaf019b5a66f	5280	Idrija
00050000-562f-6923-6fcf-0cdb3e7fee41	1292	Ig
00050000-562f-6923-a23f-e201f7303243	6250	Ilirska Bistrica
00050000-562f-6923-0337-721cca16b51e	6251	Ilirska Bistrica-Trnovo
00050000-562f-6923-58cb-f221a5186696	1295	Ivančna Gorica
00050000-562f-6923-bf69-f676e276ca6a	2259	Ivanjkovci
00050000-562f-6923-7134-3343461dfe45	1411	Izlake
00050000-562f-6923-8f4c-292440f28289	6310	Izola/Isola
00050000-562f-6923-13ea-152fa27f9fd0	2222	Jakobski Dol
00050000-562f-6923-68e8-aa47bc7f100b	2221	Jarenina
00050000-562f-6923-5324-f72a6d220405	6254	Jelšane
00050000-562f-6923-ff21-90da5eb73b39	4270	Jesenice
00050000-562f-6923-27ff-4e46ea910602	8261	Jesenice na Dolenjskem
00050000-562f-6923-d586-bf13cecc93aa	3273	Jurklošter
00050000-562f-6923-f8e6-208d0b9a75d9	2223	Jurovski Dol
00050000-562f-6923-d9ee-4d402f77ce58	2256	Juršinci
00050000-562f-6923-4b32-5f98078f42ec	5214	Kal nad Kanalom
00050000-562f-6923-f3e9-9b1a951ae0ba	3233	Kalobje
00050000-562f-6923-a7af-2703aa86258f	4246	Kamna Gorica
00050000-562f-6923-d149-4f4dd6382130	2351	Kamnica
00050000-562f-6923-f463-6ae321849a39	1241	Kamnik
00050000-562f-6923-9517-d10f902ec573	5213	Kanal
00050000-562f-6923-39f2-9e80333bb4d0	8258	Kapele
00050000-562f-6923-b1b4-0ea1f64c9cdc	2362	Kapla
00050000-562f-6923-00d9-af2996856153	2325	Kidričevo
00050000-562f-6923-fa38-26ea967a4cce	1412	Kisovec
00050000-562f-6923-7818-3e2b9338acd6	6253	Knežak
00050000-562f-6923-25a8-e4a8fcfddad0	5222	Kobarid
00050000-562f-6923-979f-7ccadb3d3513	9227	Kobilje
00050000-562f-6923-65b6-7ccbb2cd66cf	1330	Kočevje
00050000-562f-6923-ddf8-d16e230ef630	1338	Kočevska Reka
00050000-562f-6923-f9ed-f0db8ef7ccca	2276	Kog
00050000-562f-6923-498d-ac383f46e5fe	5211	Kojsko
00050000-562f-6923-3b85-cb813d6bc315	6223	Komen
00050000-562f-6923-3f58-26a77adee87c	1218	Komenda
00050000-562f-6923-7ced-562fa45d3282	6000	Koper/Capodistria 
00050000-562f-6923-2c43-7f5062c55810	6001	Koper/Capodistria - poštni predali
00050000-562f-6923-b78e-7c5b0fd5bd1c	8282	Koprivnica
00050000-562f-6923-3df7-797cdcd85ea0	5296	Kostanjevica na Krasu
00050000-562f-6923-8c0a-ffd5b5bdc97f	8311	Kostanjevica na Krki
00050000-562f-6923-34c9-2444a39889e7	1336	Kostel
00050000-562f-6923-c662-3ccca9965dc8	6256	Košana
00050000-562f-6923-28bf-667fe738ba7d	2394	Kotlje
00050000-562f-6923-e60b-bf6f5252d9ef	6240	Kozina
00050000-562f-6923-6424-7e0cf7da4367	3260	Kozje
00050000-562f-6923-45e1-a40712568ff7	4000	Kranj 
00050000-562f-6923-8525-d11d24fa6c31	4001	Kranj - poštni predali
00050000-562f-6923-f486-03a3a057dc08	4280	Kranjska Gora
00050000-562f-6923-86e9-fc80b10586be	1281	Kresnice
00050000-562f-6923-6948-8a090aa9b209	4294	Križe
00050000-562f-6923-a9ec-d983cb369980	9206	Križevci
00050000-562f-6923-0047-c4498f4871a2	9242	Križevci pri Ljutomeru
00050000-562f-6923-4a11-e04238dc6937	1301	Krka
00050000-562f-6923-8a15-9e210359342e	8296	Krmelj
00050000-562f-6923-ad65-e9602d36f6b1	4245	Kropa
00050000-562f-6923-18f7-6a916f8d8c43	8262	Krška vas
00050000-562f-6923-dfa9-7731f4871a8e	8270	Krško
00050000-562f-6923-003a-6b396745f822	9263	Kuzma
00050000-562f-6923-2566-4c26fb5374f6	2318	Laporje
00050000-562f-6923-79ff-15d227d38014	3270	Laško
00050000-562f-6923-c1bc-f13dde3b1798	1219	Laze v Tuhinju
00050000-562f-6923-0671-fd6e45346261	2230	Lenart v Slovenskih goricah
00050000-562f-6923-bd56-ac28c4281386	9220	Lendava/Lendva
00050000-562f-6923-74be-aa20d8fb4a5e	4248	Lesce
00050000-562f-6923-fa92-87273b9ca137	3261	Lesično
00050000-562f-6923-b3b6-1d3ba561c022	8273	Leskovec pri Krškem
00050000-562f-6923-7a5b-8d2e91aad6d5	2372	Libeliče
00050000-562f-6923-2113-d95431694737	2341	Limbuš
00050000-562f-6923-4357-9325399e5e50	1270	Litija
00050000-562f-6923-6a04-a9787d16865c	3202	Ljubečna
00050000-562f-6923-89fe-e1512a9332be	1000	Ljubljana 
00050000-562f-6923-6613-fbec42efc024	1001	Ljubljana - poštni predali
00050000-562f-6923-397d-abc510af6369	1231	Ljubljana - Črnuče
00050000-562f-6923-6663-c5b0c3966d92	1261	Ljubljana - Dobrunje
00050000-562f-6923-34ce-1a53b875742d	1260	Ljubljana - Polje
00050000-562f-6923-9e4f-77d70d466012	1210	Ljubljana - Šentvid
00050000-562f-6923-55e9-f2343dd72b05	1211	Ljubljana - Šmartno
00050000-562f-6923-e84e-7a7d30df8a87	3333	Ljubno ob Savinji
00050000-562f-6923-2fe5-c1429a9e17a4	9240	Ljutomer
00050000-562f-6923-56da-f9191574771c	3215	Loče
00050000-562f-6923-5421-5108c820a490	5231	Log pod Mangartom
00050000-562f-6923-006d-f1269213ed2c	1358	Log pri Brezovici
00050000-562f-6923-efb3-c69a5f18aa8b	1370	Logatec
00050000-562f-6923-24fa-fd2b05ccd229	1371	Logatec
00050000-562f-6923-7c3c-0a44ee052150	1434	Loka pri Zidanem Mostu
00050000-562f-6923-63d7-a43d7b6ec51d	3223	Loka pri Žusmu
00050000-562f-6923-790a-d280ef8b5f75	6219	Lokev
00050000-562f-6923-5e38-5398f75e7148	1318	Loški Potok
00050000-562f-6923-2f99-072ad204098f	2324	Lovrenc na Dravskem polju
00050000-562f-6923-a709-7ff5b2bec32f	2344	Lovrenc na Pohorju
00050000-562f-6923-778c-0be49c2054b1	3334	Luče
00050000-562f-6923-e531-cf0bc9b29091	1225	Lukovica
00050000-562f-6923-c6cc-14d7f96e2f3c	9202	Mačkovci
00050000-562f-6923-403b-b7e501993d5c	2322	Majšperk
00050000-562f-6923-aff1-9ea9dbff2ce7	2321	Makole
00050000-562f-6923-f25f-9667b99fa96b	9243	Mala Nedelja
00050000-562f-6923-01b1-6698ce27ba8b	2229	Malečnik
00050000-562f-6923-4853-e04780325e9a	6273	Marezige
00050000-562f-6923-e8a1-47d0cf5b8997	2000	Maribor 
00050000-562f-6923-bcee-ccd324aef234	2001	Maribor - poštni predali
00050000-562f-6923-8427-721951b8df21	2206	Marjeta na Dravskem polju
00050000-562f-6923-238b-6eb1ec5ce2da	2281	Markovci
00050000-562f-6923-2de1-451d5e10484c	9221	Martjanci
00050000-562f-6923-f102-3950151356ac	6242	Materija
00050000-562f-6923-5f1a-724d96ed7414	4211	Mavčiče
00050000-562f-6923-7cd2-9b2a64772bb4	1215	Medvode
00050000-562f-6923-5c29-8bb7d9bd71f6	1234	Mengeš
00050000-562f-6923-47f2-6c91b48514af	8330	Metlika
00050000-562f-6923-9082-2aa8c17034ec	2392	Mežica
00050000-562f-6923-0262-b2c62f982972	2204	Miklavž na Dravskem polju
00050000-562f-6923-9648-8c74c9ed12be	2275	Miklavž pri Ormožu
00050000-562f-6923-c671-dcb87a9d4262	5291	Miren
00050000-562f-6923-563e-7378a11c187c	8233	Mirna
00050000-562f-6923-ed0d-22e2046b8840	8216	Mirna Peč
00050000-562f-6923-ab04-b979009e29ff	2382	Mislinja
00050000-562f-6923-05b8-fc8f51486d9e	4281	Mojstrana
00050000-562f-6923-fa0e-172380af701b	8230	Mokronog
00050000-562f-6923-c7c5-d5ed6be08d7a	1251	Moravče
00050000-562f-6923-a178-d18d6b00284b	9226	Moravske Toplice
00050000-562f-6923-f29a-8ffbf9243ee3	5216	Most na Soči
00050000-562f-6923-f8bb-3f7ca397c3dd	1221	Motnik
00050000-562f-6923-cc1a-2bac4539b4ce	3330	Mozirje
00050000-562f-6923-8718-b475ec730900	9000	Murska Sobota 
00050000-562f-6923-5803-1bd178e9a4d3	9001	Murska Sobota - poštni predali
00050000-562f-6923-412b-446cc56cbf65	2366	Muta
00050000-562f-6923-31b7-aed00d35dbb5	4202	Naklo
00050000-562f-6923-1ce6-f692d81ffa04	3331	Nazarje
00050000-562f-6923-1c02-0c18ce529706	1357	Notranje Gorice
00050000-562f-6923-0df8-39c536914d1e	3203	Nova Cerkev
00050000-562f-6923-07d5-71e70045e69c	5000	Nova Gorica 
00050000-562f-6923-10fc-84480c78ff1a	5001	Nova Gorica - poštni predali
00050000-562f-6923-83bd-f0d9c869be1c	1385	Nova vas
00050000-562f-6923-b567-26ad9d5b974b	8000	Novo mesto
00050000-562f-6923-4330-28e68531f393	8001	Novo mesto - poštni predali
00050000-562f-6923-73af-f0feaa0aa0a7	6243	Obrov
00050000-562f-6923-e7ae-00748cbf69cb	9233	Odranci
00050000-562f-6923-04b4-ec8a8406aa67	2317	Oplotnica
00050000-562f-6923-1131-1a14621278e5	2312	Orehova vas
00050000-562f-6923-617a-5d10a523f009	2270	Ormož
00050000-562f-6923-e875-4ec442f5e722	1316	Ortnek
00050000-562f-6923-b2eb-2704cce7acdb	1337	Osilnica
00050000-562f-6923-7560-d9f60964b9cc	8222	Otočec
00050000-562f-6923-8b5e-ff7f8a7ff8bd	2361	Ožbalt
00050000-562f-6923-37ac-1a4f45a82de1	2231	Pernica
00050000-562f-6923-f85a-c20532e86599	2211	Pesnica pri Mariboru
00050000-562f-6923-7dd7-6e5571b1ca83	9203	Petrovci
00050000-562f-6923-1c86-450d798c9467	3301	Petrovče
00050000-562f-6923-0b3b-c1974b5cf82a	6330	Piran/Pirano
00050000-562f-6923-e162-999c496f671e	8255	Pišece
00050000-562f-6923-4734-b5642c87e658	6257	Pivka
00050000-562f-6923-3a74-6555e5e03346	6232	Planina
00050000-562f-6923-a16e-7f5cf89e8414	3225	Planina pri Sevnici
00050000-562f-6923-63a1-5115fb800287	6276	Pobegi
00050000-562f-6923-878e-ecd6f3d39827	8312	Podbočje
00050000-562f-6923-2ee2-0dd81eea56f6	5243	Podbrdo
00050000-562f-6923-b30d-7bd9075da1db	3254	Podčetrtek
00050000-562f-6923-4c28-6ae871d6373d	2273	Podgorci
00050000-562f-6923-126e-503982590c69	6216	Podgorje
00050000-562f-6923-5269-4a6bab2f9f49	2381	Podgorje pri Slovenj Gradcu
00050000-562f-6923-7e42-7aec2479a391	6244	Podgrad
00050000-562f-6923-e43d-cc3b846f14b9	1414	Podkum
00050000-562f-6923-2a7f-ac02d88e68a4	2286	Podlehnik
00050000-562f-6923-38af-8b7670425a40	5272	Podnanos
00050000-562f-6923-5947-c0156feb283f	4244	Podnart
00050000-562f-6923-2f70-d00348b82770	3241	Podplat
00050000-562f-6923-7412-aa0dfda58d4a	3257	Podsreda
00050000-562f-6923-149a-f1966da982ef	2363	Podvelka
00050000-562f-6923-7a6b-27fb29b770df	2208	Pohorje
00050000-562f-6923-2d59-797738d32250	2257	Polenšak
00050000-562f-6923-02bf-f69c8d2fa714	1355	Polhov Gradec
00050000-562f-6923-1984-61f731c9fa9b	4223	Poljane nad Škofjo Loko
00050000-562f-6923-239c-da18aa7af778	2319	Poljčane
00050000-562f-6923-da27-6f9ec5ccc393	1272	Polšnik
00050000-562f-6923-dc71-3528f1ccb243	3313	Polzela
00050000-562f-6923-d355-260de6f40688	3232	Ponikva
00050000-562f-6923-2fe2-b20aa29cb0fe	6320	Portorož/Portorose
00050000-562f-6923-6db5-992522ce19a4	6230	Postojna
00050000-562f-6923-f1ac-bbd40e8084d9	2331	Pragersko
00050000-562f-6923-79ce-a48bad464162	3312	Prebold
00050000-562f-6923-b599-f644ce864cf3	4205	Preddvor
00050000-562f-6923-6313-981aeabf3086	6255	Prem
00050000-562f-6923-26dd-105bf147d881	1352	Preserje
00050000-562f-6923-f9c5-b9cdb58e86d8	6258	Prestranek
00050000-562f-6923-86c6-db1154bdf4e6	2391	Prevalje
00050000-562f-6923-9132-1f60fac49622	3262	Prevorje
00050000-562f-6923-456d-a9ee397cfbf3	1276	Primskovo 
00050000-562f-6923-90bf-9e2d2d8a4e61	3253	Pristava pri Mestinju
00050000-562f-6923-618d-5601db2bff8d	9207	Prosenjakovci/Partosfalva
00050000-562f-6923-521e-88d366a1afb6	5297	Prvačina
00050000-562f-6923-06a1-f7a12fbdc9d5	2250	Ptuj
00050000-562f-6923-1476-c253195b7fc3	2323	Ptujska Gora
00050000-562f-6923-7f0a-56a5a7fc5e00	9201	Puconci
00050000-562f-6923-ca9c-d2b559e86ece	2327	Rače
00050000-562f-6923-62d4-14e151b090cf	1433	Radeče
00050000-562f-6923-0d3e-e9cf46a34f9c	9252	Radenci
00050000-562f-6923-0adc-206bd3e8281c	2360	Radlje ob Dravi
00050000-562f-6923-461a-d150f9c03a8b	1235	Radomlje
00050000-562f-6923-dfc5-3b45b4e4561e	4240	Radovljica
00050000-562f-6923-1900-cce6deb466b6	8274	Raka
00050000-562f-6923-8c20-30a619eb6a3f	1381	Rakek
00050000-562f-6923-111a-130d8541952e	4283	Rateče - Planica
00050000-562f-6923-958b-7644d69e97a4	2390	Ravne na Koroškem
00050000-562f-6923-e692-66103b17a6a4	9246	Razkrižje
00050000-562f-6923-f3bb-cc4262b785ff	3332	Rečica ob Savinji
00050000-562f-6923-10ca-c92f8bc9de9a	5292	Renče
00050000-562f-6923-a1ed-47a44c0737be	1310	Ribnica
00050000-562f-6923-9cd4-6aae0dbc7d69	2364	Ribnica na Pohorju
00050000-562f-6923-a0cf-1350a56c73db	3272	Rimske Toplice
00050000-562f-6923-ef1d-2ab5a312a473	1314	Rob
00050000-562f-6923-e71f-e9c553852ebc	5215	Ročinj
00050000-562f-6923-ac3c-e069b650ac1a	3250	Rogaška Slatina
00050000-562f-6923-4478-0b71923c4953	9262	Rogašovci
00050000-562f-6923-efa5-9593fc11171e	3252	Rogatec
00050000-562f-6923-8460-fa55e336a75d	1373	Rovte
00050000-562f-6923-6266-e3375339197b	2342	Ruše
00050000-562f-6923-0d55-8e4bc72851f7	1282	Sava
00050000-562f-6923-7ebb-3b2e332a5ae2	6333	Sečovlje/Sicciole
00050000-562f-6923-1bfb-62cde7167142	4227	Selca
00050000-562f-6923-376a-a7f958b5929b	2352	Selnica ob Dravi
00050000-562f-6923-c4fe-e01435c61dfe	8333	Semič
00050000-562f-6923-a575-1d0674ab4d23	8281	Senovo
00050000-562f-6923-012c-301d850bee50	6224	Senožeče
00050000-562f-6923-9112-7bdfba21642c	8290	Sevnica
00050000-562f-6923-f8d9-fc87a59cf9e8	6210	Sežana
00050000-562f-6923-7292-a37e3f7567a9	2214	Sladki Vrh
00050000-562f-6923-8e2f-5106d179e67f	5283	Slap ob Idrijci
00050000-562f-6923-6d94-0bd8b6e6cb44	2380	Slovenj Gradec
00050000-562f-6923-55e5-acc04e87f205	2310	Slovenska Bistrica
00050000-562f-6923-d2da-ca3c2b03d547	3210	Slovenske Konjice
00050000-562f-6923-6cc7-ea120f2b1bec	1216	Smlednik
00050000-562f-6923-cb64-d58b21ddb6c7	5232	Soča
00050000-562f-6923-9a13-1da504d9a990	1317	Sodražica
00050000-562f-6923-e4ae-2b687583f114	3335	Solčava
00050000-562f-6923-62ac-3ee56e71c13d	5250	Solkan
00050000-562f-6923-893d-f80df62dd316	4229	Sorica
00050000-562f-6923-3977-6722f0e7d2ba	4225	Sovodenj
00050000-562f-6923-53f1-39cad626ca2e	5281	Spodnja Idrija
00050000-562f-6923-7ff2-a283f6cdf7aa	2241	Spodnji Duplek
00050000-562f-6923-f8c2-5bd0f70c629f	9245	Spodnji Ivanjci
00050000-562f-6923-b1a8-c4932c2d2be3	2277	Središče ob Dravi
00050000-562f-6923-9620-6aeb734e5672	4267	Srednja vas v Bohinju
00050000-562f-6923-dfce-2e33240ff044	8256	Sromlje 
00050000-562f-6923-dbeb-f4df7fd1b526	5224	Srpenica
00050000-562f-6923-1648-1d4a00a24e62	1242	Stahovica
00050000-562f-6923-471d-b2a863c30e6f	1332	Stara Cerkev
00050000-562f-6923-ac76-c52844a4ddca	8342	Stari trg ob Kolpi
00050000-562f-6923-b613-85cbb2e149d6	1386	Stari trg pri Ložu
00050000-562f-6923-3f4e-6e4608f329bc	2205	Starše
00050000-562f-6923-3e81-96d701207d7f	2289	Stoperce
00050000-562f-6923-7a87-07a83d6dfd1c	8322	Stopiče
00050000-562f-6923-dc3b-cd872cdf05ff	3206	Stranice
00050000-562f-6923-f588-3d17af79ef83	8351	Straža
00050000-562f-6923-0732-c157f428288b	1313	Struge
00050000-562f-6923-f2ac-960b1dac67e3	8293	Studenec
00050000-562f-6923-d15c-ee10950cfb5e	8331	Suhor
00050000-562f-6923-0b7c-cbf9a3f02f73	2233	Sv. Ana v Slovenskih goricah
00050000-562f-6923-c7e0-b3d125369c07	2235	Sv. Trojica v Slovenskih goricah
00050000-562f-6923-3ea5-558d28855420	2353	Sveti Duh na Ostrem Vrhu
00050000-562f-6923-76dc-dcab65838cf5	9244	Sveti Jurij ob Ščavnici
00050000-562f-6923-58c7-242b7b302138	3264	Sveti Štefan
00050000-562f-6923-f652-19f931553015	2258	Sveti Tomaž
00050000-562f-6923-170c-34b095be5ea4	9204	Šalovci
00050000-562f-6923-21fa-78ace4ca35bf	5261	Šempas
00050000-562f-6923-2ea8-4efd6b2a7748	5290	Šempeter pri Gorici
00050000-562f-6923-6b26-aa35602871df	3311	Šempeter v Savinjski dolini
00050000-562f-6923-4e09-9af02a435a57	4208	Šenčur
00050000-562f-6923-2c1a-94fd6d784892	2212	Šentilj v Slovenskih goricah
00050000-562f-6923-5a93-77651fd22a92	8297	Šentjanž
00050000-562f-6923-e62d-e8265af97e73	2373	Šentjanž pri Dravogradu
00050000-562f-6923-06a5-a3972b8f4712	8310	Šentjernej
00050000-562f-6923-f387-2646eaf40648	3230	Šentjur
00050000-562f-6923-0843-cc0db5d9a03d	3271	Šentrupert
00050000-562f-6923-7ec2-7ad8feb03b1f	8232	Šentrupert
00050000-562f-6923-202a-d6a997ceab7a	1296	Šentvid pri Stični
00050000-562f-6923-676f-9f4eebf8ac66	8275	Škocjan
00050000-562f-6923-d2bd-ed5fe1d2f2b5	6281	Škofije
00050000-562f-6923-f7af-e9567b3d9175	4220	Škofja Loka
00050000-562f-6923-9fe2-2315ed4c7c93	3211	Škofja vas
00050000-562f-6923-c4a0-544e7028de11	1291	Škofljica
00050000-562f-6923-d50e-8610cb77fae1	6274	Šmarje
00050000-562f-6923-b74c-875b1611224c	1293	Šmarje - Sap
00050000-562f-6923-acbd-6afdad8f6cc5	3240	Šmarje pri Jelšah
00050000-562f-6923-014c-853678c33146	8220	Šmarješke Toplice
00050000-562f-6923-3222-c9818e7042e2	2315	Šmartno na Pohorju
00050000-562f-6923-29d9-2447ef77d93c	3341	Šmartno ob Dreti
00050000-562f-6923-776d-dce4379a8a70	3327	Šmartno ob Paki
00050000-562f-6923-6fe0-5eef80775963	1275	Šmartno pri Litiji
00050000-562f-6923-abd5-91f663357c90	2383	Šmartno pri Slovenj Gradcu
00050000-562f-6923-061e-ff606ec7fb6c	3201	Šmartno v Rožni dolini
00050000-562f-6923-d570-7f01fd996bd0	3325	Šoštanj
00050000-562f-6923-3356-83d39abb2641	6222	Štanjel
00050000-562f-6923-0ceb-b1bacf80d9bc	3220	Štore
00050000-562f-6923-aa1f-72d9533116cf	3304	Tabor
00050000-562f-6923-1586-1e53c5ec6a09	3221	Teharje
00050000-562f-6923-8440-7fed2a9fa7b3	9251	Tišina
00050000-562f-6923-0e38-48c88eb38a07	5220	Tolmin
00050000-562f-6923-4997-1536728ab16a	3326	Topolšica
00050000-562f-6923-b3ce-f2cbd343f1b3	2371	Trbonje
00050000-562f-6923-0776-947294803097	1420	Trbovlje
00050000-562f-6923-bdcd-dae9224a26e4	8231	Trebelno 
00050000-562f-6923-d7e7-041079656e53	8210	Trebnje
00050000-562f-6923-2ecb-ab07c41a6ed7	5252	Trnovo pri Gorici
00050000-562f-6923-eaa3-23023768a253	2254	Trnovska vas
00050000-562f-6923-0a77-edd5801f6d55	1222	Trojane
00050000-562f-6923-5c66-26e8c55d52a0	1236	Trzin
00050000-562f-6923-e559-b3311c9e9f57	4290	Tržič
00050000-562f-6923-e99f-4734a0208d68	8295	Tržišče
00050000-562f-6923-a86c-e743b7c97d1b	1311	Turjak
00050000-562f-6923-9aae-34f71d911c60	9224	Turnišče
00050000-562f-6923-7244-71d41a5b09ac	8323	Uršna sela
00050000-562f-6923-2a7d-0be6c86387d2	1252	Vače
00050000-562f-6923-3cb7-a365990216a5	3320	Velenje 
00050000-562f-6923-bb73-dc1164e7d545	3322	Velenje - poštni predali
00050000-562f-6923-1109-8f2adc977daa	8212	Velika Loka
00050000-562f-6923-5942-d25107c1f41a	2274	Velika Nedelja
00050000-562f-6923-8d08-4096efe39fd8	9225	Velika Polana
00050000-562f-6923-f356-47fe358747ec	1315	Velike Lašče
00050000-562f-6923-ed70-d0f19f272627	8213	Veliki Gaber
00050000-562f-6923-c3b6-f09b4562fb61	9241	Veržej
00050000-562f-6923-d29e-817e685f561e	1312	Videm - Dobrepolje
00050000-562f-6923-29ae-99cbd3fd75eb	2284	Videm pri Ptuju
00050000-562f-6923-9e27-b8a449796be0	8344	Vinica
00050000-562f-6923-35ee-f19441886591	5271	Vipava
00050000-562f-6923-7d92-e1bcdfcc63a3	4212	Visoko
00050000-562f-6923-b263-77e40a0da1f1	1294	Višnja Gora
00050000-562f-6923-74b1-9ef07f79f5ac	3205	Vitanje
00050000-562f-6923-c8d4-199580ebf06d	2255	Vitomarci
00050000-562f-6923-8149-d4373a340b4a	1217	Vodice
00050000-562f-6923-5ac9-9e59a35ec98a	3212	Vojnik\t
00050000-562f-6923-981e-89358553b0c1	5293	Volčja Draga
00050000-562f-6923-20d6-4782c2040d7d	2232	Voličina
00050000-562f-6923-b924-a2dcdde006ec	3305	Vransko
00050000-562f-6923-263b-f86d686aabc0	6217	Vremski Britof
00050000-562f-6923-6680-c5ea51c8182c	1360	Vrhnika
00050000-562f-6923-9171-640a3d4ce29a	2365	Vuhred
00050000-562f-6923-5a65-d764bc8c679b	2367	Vuzenica
00050000-562f-6923-8554-dde1a0108245	8292	Zabukovje 
00050000-562f-6923-8050-ab61c0089e10	1410	Zagorje ob Savi
00050000-562f-6923-8283-927c0959c2b3	1303	Zagradec
00050000-562f-6923-12c7-821dec7df5d2	2283	Zavrč
00050000-562f-6923-6bb7-7a99d8266eda	8272	Zdole 
00050000-562f-6923-4042-18042b291bfd	4201	Zgornja Besnica
00050000-562f-6923-f4c3-5b6b36e9e254	2242	Zgornja Korena
00050000-562f-6923-c677-63144aaec07e	2201	Zgornja Kungota
00050000-562f-6923-0894-cb47e29f2ee5	2316	Zgornja Ložnica
00050000-562f-6923-248b-ce7db9af2643	2314	Zgornja Polskava
00050000-562f-6923-4c84-de90ad8a0b69	2213	Zgornja Velka
00050000-562f-6923-f331-13c563361fff	4247	Zgornje Gorje
00050000-562f-6923-f29e-37d6bda666b7	4206	Zgornje Jezersko
00050000-562f-6923-2eff-510c952c2e3f	2285	Zgornji Leskovec
00050000-562f-6923-cbfe-6e086442d8e0	1432	Zidani Most
00050000-562f-6923-9e84-c6084898e357	3214	Zreče
00050000-562f-6923-9b21-ec44508a204f	4209	Žabnica
00050000-562f-6923-9ef0-b8680491b56c	3310	Žalec
00050000-562f-6923-4134-e3ecb5ebcd2b	4228	Železniki
00050000-562f-6923-b4cf-56091a91ff33	2287	Žetale
00050000-562f-6923-e256-dd56568e0ff0	4226	Žiri
00050000-562f-6923-4934-d4d98e809024	4274	Žirovnica
00050000-562f-6923-4fad-02c541dfbcde	8360	Žužemberk
\.


--
-- TOC entry 3114 (class 0 OID 23529931)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23529523)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 23529277)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-562f-6926-117b-60f67ab4bb5b	00080000-562f-6926-8b38-c152454d27f1	\N	00040000-562f-6924-fa40-5ab6de8773f5	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-562f-6926-4bce-21847626f1e3	00080000-562f-6926-8b38-c152454d27f1	\N	00040000-562f-6924-fa40-5ab6de8773f5	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-562f-6926-d51d-17bd5085f564	00080000-562f-6926-1eed-7433e9dac32b	\N	00040000-562f-6924-fa40-5ab6de8773f5	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3077 (class 0 OID 23529421)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-562f-6924-702b-41c75e6fb3da	novo leto	1	1	\N	t
00430000-562f-6924-92d8-71b6e3a4e3e4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-562f-6924-ca53-c1c3dd31c8d4	dan upora proti okupatorju	27	4	\N	t
00430000-562f-6924-198a-7e05689c9bd2	praznik dela	1	5	\N	t
00430000-562f-6924-fbec-e3a5ac27fb84	praznik dela	2	5	\N	t
00430000-562f-6924-8254-9f92ea732835	dan Primoža Trubarja	8	6	\N	f
00430000-562f-6924-2f20-eb4fe1152b55	dan državnosti	25	6	\N	t
00430000-562f-6924-c845-833eb6fd7032	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-562f-6924-b505-6087b9d97f5d	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-562f-6924-b5b9-463b048c1da5	dan suverenosti	25	10	\N	f
00430000-562f-6924-7edd-b8a4f4880300	dan spomina na mrtve	1	11	\N	t
00430000-562f-6924-6c4e-a13ee3a8fc99	dan Rudolfa Maistra	23	11	\N	f
00430000-562f-6924-33cf-206878188385	božič	25	12	\N	t
00430000-562f-6924-404e-eb7ae3ea2ef3	dan samostojnosti in enotnosti	26	12	\N	t
00430000-562f-6924-1b7a-29da3f4d834c	Marijino vnebovzetje	15	8	\N	t
00430000-562f-6924-50f8-40653a0d425f	dan reformacije	31	10	\N	t
00430000-562f-6924-8888-ff4924f81de4	velikonočna nedelja	27	3	2016	t
00430000-562f-6924-f6a1-aba1a1e79be1	velikonočna nedelja	16	4	2017	t
00430000-562f-6924-81e3-09b3df64cca4	velikonočna nedelja	1	4	2018	t
00430000-562f-6924-cc08-dc99b2d7a1ae	velikonočna nedelja	21	4	2019	t
00430000-562f-6924-2797-65997d0ec486	velikonočna nedelja	12	4	2020	t
00430000-562f-6924-1b45-8ce209e1f411	velikonočna nedelja	4	4	2021	t
00430000-562f-6924-66e2-fce7c22d6c8d	velikonočna nedelja	17	4	2022	t
00430000-562f-6924-1497-caf162fabebf	velikonočna nedelja	9	4	2023	t
00430000-562f-6924-9d7d-287542aefc3e	velikonočna nedelja	31	3	2024	t
00430000-562f-6924-dd44-41c59ccde4e5	velikonočna nedelja	20	4	2025	t
00430000-562f-6924-0bb8-a138f8ac9205	velikonočna nedelja	5	4	2026	t
00430000-562f-6924-3a3d-7dafef242c16	velikonočna nedelja	28	3	2027	t
00430000-562f-6924-e38f-d93cda534893	velikonočna nedelja	16	4	2028	t
00430000-562f-6924-9527-93bde3dbd4bd	velikonočna nedelja	1	4	2029	t
00430000-562f-6924-d497-553ada0d93b9	velikonočna nedelja	21	4	2030	t
00430000-562f-6924-3eff-c57577367cc6	velikonočni ponedeljek	28	3	2016	t
00430000-562f-6924-55ba-3723c62802f4	velikonočni ponedeljek	17	4	2017	t
00430000-562f-6924-80c5-8efb736680cd	velikonočni ponedeljek	2	4	2018	t
00430000-562f-6924-703c-d45bbe5c0420	velikonočni ponedeljek	22	4	2019	t
00430000-562f-6924-25bd-ef14c06a5715	velikonočni ponedeljek	13	4	2020	t
00430000-562f-6924-d236-e1ae25a65350	velikonočni ponedeljek	5	4	2021	t
00430000-562f-6924-f7b6-462cdac4c982	velikonočni ponedeljek	18	4	2022	t
00430000-562f-6924-2719-a65114b2f722	velikonočni ponedeljek	10	4	2023	t
00430000-562f-6924-c9a6-02568f19a4e1	velikonočni ponedeljek	1	4	2024	t
00430000-562f-6924-7e6b-05d49af30f54	velikonočni ponedeljek	21	4	2025	t
00430000-562f-6924-9c72-1552d4fb2f4f	velikonočni ponedeljek	6	4	2026	t
00430000-562f-6924-b189-dc7167a4c787	velikonočni ponedeljek	29	3	2027	t
00430000-562f-6924-b116-288aef2df263	velikonočni ponedeljek	17	4	2028	t
00430000-562f-6924-598b-f59657c1909b	velikonočni ponedeljek	2	4	2029	t
00430000-562f-6924-cfc8-9ae56894d2ea	velikonočni ponedeljek	22	4	2030	t
00430000-562f-6924-c0ed-21f45a710d9a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-562f-6924-3979-5ed60acd00dc	binkoštna nedelja - binkošti	4	6	2017	t
00430000-562f-6924-1c6c-0a3b0a860b6d	binkoštna nedelja - binkošti	20	5	2018	t
00430000-562f-6924-a1ad-51942cb4af57	binkoštna nedelja - binkošti	9	6	2019	t
00430000-562f-6924-da5d-f355a53c382b	binkoštna nedelja - binkošti	31	5	2020	t
00430000-562f-6924-62fd-fac01446b728	binkoštna nedelja - binkošti	23	5	2021	t
00430000-562f-6924-65af-c2b4b8c20926	binkoštna nedelja - binkošti	5	6	2022	t
00430000-562f-6924-cf6a-d06e2a666335	binkoštna nedelja - binkošti	28	5	2023	t
00430000-562f-6924-4ec9-745d0dfe3390	binkoštna nedelja - binkošti	19	5	2024	t
00430000-562f-6924-cbf4-7efbaa77c372	binkoštna nedelja - binkošti	8	6	2025	t
00430000-562f-6924-bc4e-378735bab1e1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-562f-6924-054d-92638f36246f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-562f-6924-0d39-422755423ae2	binkoštna nedelja - binkošti	4	6	2028	t
00430000-562f-6924-e8bd-7b5561deecf0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-562f-6924-2dad-ceccb2db730b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3073 (class 0 OID 23529381)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23529393)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23529535)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23529945)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23529955)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-562f-6926-7520-a8b04c6f468b	00080000-562f-6926-e7ab-99cc9e101104	0987	AK
00190000-562f-6926-a1d6-1f0ac819f578	00080000-562f-6926-1eed-7433e9dac32b	0989	AK
00190000-562f-6926-db8d-02fa8bc38743	00080000-562f-6926-9c9d-1223dcb2a6a7	0986	AK
00190000-562f-6926-5286-320c8dd399e4	00080000-562f-6926-9954-d52962b38eeb	0984	AK
00190000-562f-6926-b449-c4773c6c82d1	00080000-562f-6926-12b3-c13fd5dbec06	0983	AK
00190000-562f-6926-80f3-b54e428a5709	00080000-562f-6926-8a49-05cbdb5d6519	0982	AK
00190000-562f-6928-4ed7-a9c1aca248f8	00080000-562f-6928-6e22-66526a272df1	1001	AK
\.


--
-- TOC entry 3113 (class 0 OID 23529870)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-562f-6926-9eba-db22bb31bfe2	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3117 (class 0 OID 23529963)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 23529564)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-562f-6926-b440-18fd570d8dae	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-562f-6926-7451-025acea855e9	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-562f-6926-3d74-626dfed71453	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-562f-6926-1fcb-3142c081bad4	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-562f-6926-8058-c6fc61ac9785	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-562f-6926-e949-f3ae57af4cfc	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-562f-6926-26b7-fc6e36eed382	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3085 (class 0 OID 23529508)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23529498)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23529709)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23529639)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23529355)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 23529126)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-562f-6928-6e22-66526a272df1	00010000-562f-6924-9151-6991d333fa6b	2015-10-27 13:08:08	INS	a:0:{}
2	App\\Entity\\Option	00000000-562f-6928-568d-e68aaf644eb9	00010000-562f-6924-9151-6991d333fa6b	2015-10-27 13:08:08	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-562f-6928-4ed7-a9c1aca248f8	00010000-562f-6924-9151-6991d333fa6b	2015-10-27 13:08:08	INS	a:0:{}
\.


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3094 (class 0 OID 23529577)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 23529164)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-562f-6924-fb40-91f52f441e22	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-562f-6924-0fce-367c674644f3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-562f-6924-65db-59fcec1b746c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-562f-6924-2dd4-21e66174b6d6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-562f-6924-684b-5cb2c2620e88	planer	Planer dogodkov v koledarju	t
00020000-562f-6924-82e8-5908c3fc8924	kadrovska	Kadrovska služba	t
00020000-562f-6924-a8a0-da44d3be211f	arhivar	Ažuriranje arhivalij	t
00020000-562f-6924-9701-56111c858610	igralec	Igralec	t
00020000-562f-6924-fa72-276b98784c20	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-562f-6926-e84d-0b45e2513c2e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3054 (class 0 OID 23529148)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-562f-6924-dc61-9bf33b3f806c	00020000-562f-6924-65db-59fcec1b746c
00010000-562f-6924-9151-6991d333fa6b	00020000-562f-6924-65db-59fcec1b746c
00010000-562f-6926-4d22-6f9a1ef0ca62	00020000-562f-6926-e84d-0b45e2513c2e
\.


--
-- TOC entry 3096 (class 0 OID 23529591)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23529529)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 23529475)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-562f-6926-d8ee-eb7d8c1da2b5	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-562f-6926-ec29-9c5c84ff43a6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-562f-6926-1be5-3ddd2ef8f71e	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3050 (class 0 OID 23529113)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-562f-6924-fe76-0b85f65738b9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-562f-6924-1cc4-b34cfcc7c124	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-562f-6924-b154-18fef7ae947f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-562f-6924-3f53-3bcecc57a5b6	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-562f-6924-d826-0bafe3f709f1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3049 (class 0 OID 23529105)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-562f-6924-b4eb-55eabc9ca510	00230000-562f-6924-3f53-3bcecc57a5b6	popa
00240000-562f-6924-d07b-8f62ac382ca3	00230000-562f-6924-3f53-3bcecc57a5b6	oseba
00240000-562f-6924-2022-41673ec2d9e8	00230000-562f-6924-3f53-3bcecc57a5b6	tippopa
00240000-562f-6924-533d-b6980b881850	00230000-562f-6924-3f53-3bcecc57a5b6	organizacijskaenota
00240000-562f-6924-accb-7da12bc32ec0	00230000-562f-6924-3f53-3bcecc57a5b6	sezona
00240000-562f-6924-cb84-91f4becb76ad	00230000-562f-6924-3f53-3bcecc57a5b6	tipvaje
00240000-562f-6924-d791-b28fe9f7ab96	00230000-562f-6924-1cc4-b34cfcc7c124	prostor
00240000-562f-6924-02c1-1db364c1bbf8	00230000-562f-6924-3f53-3bcecc57a5b6	besedilo
00240000-562f-6924-ba5f-15f5f490bc85	00230000-562f-6924-3f53-3bcecc57a5b6	uprizoritev
00240000-562f-6924-37c6-3fb2cec4fd75	00230000-562f-6924-3f53-3bcecc57a5b6	funkcija
00240000-562f-6924-582a-dc14a0bdee58	00230000-562f-6924-3f53-3bcecc57a5b6	tipfunkcije
00240000-562f-6924-d5ec-598167c62df5	00230000-562f-6924-3f53-3bcecc57a5b6	alternacija
00240000-562f-6924-39e2-398c9ce8fcc5	00230000-562f-6924-fe76-0b85f65738b9	pogodba
00240000-562f-6924-9514-ac95e74d9026	00230000-562f-6924-3f53-3bcecc57a5b6	zaposlitev
00240000-562f-6924-6eef-15cb3c88b8aa	00230000-562f-6924-3f53-3bcecc57a5b6	zvrstuprizoritve
00240000-562f-6924-4cd7-7f57f80e40cd	00230000-562f-6924-fe76-0b85f65738b9	programdela
00240000-562f-6924-8564-6a21ca835d94	00230000-562f-6924-3f53-3bcecc57a5b6	zapis
\.


--
-- TOC entry 3048 (class 0 OID 23529100)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6fc44b97-02ee-4e48-bc41-04e9e11958f5	00240000-562f-6924-b4eb-55eabc9ca510	0	1001
\.


--
-- TOC entry 3102 (class 0 OID 23529656)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-562f-6926-e8dc-78487256e200	000e0000-562f-6926-0949-bd255f035143	00080000-562f-6926-8b38-c152454d27f1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-562f-6924-eb38-0a2433aefeec
00270000-562f-6926-3d20-5869d03ca8a4	000e0000-562f-6926-0949-bd255f035143	00080000-562f-6926-8b38-c152454d27f1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-562f-6924-eb38-0a2433aefeec
\.


--
-- TOC entry 3062 (class 0 OID 23529239)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 23529485)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-562f-6926-136c-cf680d31bec6	00180000-562f-6926-fcc3-cce1f0950b53	000c0000-562f-6926-669a-833e835f3847	00090000-562f-6926-d819-ac8267624107	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-6926-9dd3-f1bfd5636228	00180000-562f-6926-fcc3-cce1f0950b53	000c0000-562f-6926-77f0-bef324c29d2c	00090000-562f-6926-5c27-86316fb0fcac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-6926-3d28-2000ec33a060	00180000-562f-6926-fcc3-cce1f0950b53	000c0000-562f-6926-83e4-3e777d5bb204	00090000-562f-6926-13c1-d4daa44412f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-6926-6927-85db4f89b4cc	00180000-562f-6926-fcc3-cce1f0950b53	000c0000-562f-6926-00e1-a3269112c1ca	00090000-562f-6926-6d0a-bb2523c6f239	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-6926-08cb-77cda23b23e4	00180000-562f-6926-fcc3-cce1f0950b53	000c0000-562f-6926-1852-d9dbcd716dbe	00090000-562f-6926-eaac-0a881b895e02	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-6926-5d2d-b182cec115ec	00180000-562f-6926-05b2-cd6bd31c831e	\N	00090000-562f-6926-eaac-0a881b895e02	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-562f-6926-6e1e-1a4406fab740	00180000-562f-6926-05b2-cd6bd31c831e	\N	00090000-562f-6926-5c27-86316fb0fcac	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3105 (class 0 OID 23529697)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-562f-6924-fdd6-9e8faf5bb7c8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-562f-6924-9cb0-1bf0389e0848	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-562f-6924-3ec4-09bb723e5c00	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-562f-6924-49cb-56ed35e792e8	04	Režija	Režija	Režija	umetnik	30
000f0000-562f-6924-4f26-2bcceb27806f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-562f-6924-127a-c885c4bda493	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-562f-6924-38de-755fd9d6cb8d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-562f-6924-fea2-3ff5db3b395d	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-562f-6924-6774-c490d624d86a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-562f-6924-5c7b-71196919f06c	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-562f-6924-eda1-5d5cf1c1e233	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-562f-6924-a488-494b84900545	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-562f-6924-fb72-7fafe3546543	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-562f-6924-b196-db0901cd8cdf	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-562f-6924-2120-4ee3e9df02ca	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-562f-6924-b44b-06c7a37ef928	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-562f-6924-3d07-123d60129378	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-562f-6924-d80d-ba24ce0c4fe6	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3059 (class 0 OID 23529190)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-562f-6926-90fa-caab57ddcb08	0001	šola	osnovna ali srednja šola
00400000-562f-6926-29b6-025ee7c07f6a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-562f-6926-9d9b-1e5befab3d28	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3118 (class 0 OID 23529974)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-562f-6923-c13e-055811909f04	01	Velika predstava	f	1.00	1.00
002b0000-562f-6923-4252-7f92b48d3117	02	Mala predstava	f	0.50	0.50
002b0000-562f-6923-732d-14728d5dea84	03	Mala koprodukcija	t	0.40	1.00
002b0000-562f-6923-b507-f2a81771f7a6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-562f-6923-c710-375519792f7d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3081 (class 0 OID 23529465)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-562f-6923-3d25-7e1341afee96	0001	prva vaja	prva vaja
00420000-562f-6923-27c8-71021af303a7	0002	tehnična vaja	tehnična vaja
00420000-562f-6923-e574-164eceb68aaa	0003	lučna vaja	lučna vaja
00420000-562f-6923-6501-dc516694b842	0004	kostumska vaja	kostumska vaja
00420000-562f-6923-c9a0-92e94bf5129a	0005	foto vaja	foto vaja
00420000-562f-6923-8873-131d9054f118	0006	1. glavna vaja	1. glavna vaja
00420000-562f-6923-4c5e-2f9fc7c64bfc	0007	2. glavna vaja	2. glavna vaja
00420000-562f-6923-48f4-86645ee49e32	0008	1. generalka	1. generalka
00420000-562f-6923-9641-d0cdfc8c845c	0009	2. generalka	2. generalka
00420000-562f-6923-98f4-fc53f2cf65f3	0010	odprta generalka	odprta generalka
00420000-562f-6923-0a8b-5010e6b230a4	0011	obnovitvena vaja	obnovitvena vaja
00420000-562f-6923-8b8c-4829c9bb03f1	0012	pevska vaja	pevska vaja
00420000-562f-6923-e65e-0ad6c2a8fd51	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-562f-6923-9f34-e1000ebc7f93	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3068 (class 0 OID 23529312)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23529135)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-562f-6924-9151-6991d333fa6b	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROlSvvhtVx/xX8Dr5zWuGfOhcte24e5Ze	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-562f-6926-c2aa-a14c5b10d2c4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-562f-6926-038d-cf5427c4117d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-562f-6926-82ac-83c1b23150f5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-562f-6926-7a83-4b3d7f7ddc86	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-562f-6926-c9b7-32de2dfe2e44	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-562f-6926-b1c8-d144693bf53a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-562f-6926-5c2f-bbd171dd7dea	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-562f-6926-b2b1-bd8bc70abe69	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-562f-6926-19e9-aa7ea6d69042	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-562f-6926-4d22-6f9a1ef0ca62	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-562f-6924-dc61-9bf33b3f806c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3109 (class 0 OID 23529747)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-562f-6926-0900-03add9556ed7	00160000-562f-6926-f150-b51fc981075b	\N	00140000-562f-6924-10d1-7d6f2e67af93	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-562f-6926-8058-c6fc61ac9785
000e0000-562f-6926-0949-bd255f035143	00160000-562f-6926-0da1-3311a5098b16	\N	00140000-562f-6924-7030-8136a8f0dbbc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-562f-6926-e949-f3ae57af4cfc
000e0000-562f-6926-89bb-0bb73ee00d25	\N	\N	00140000-562f-6924-7030-8136a8f0dbbc	00190000-562f-6926-7520-a8b04c6f468b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562f-6926-8058-c6fc61ac9785
000e0000-562f-6926-2e02-5c88e7bfa57b	\N	\N	00140000-562f-6924-7030-8136a8f0dbbc	00190000-562f-6926-7520-a8b04c6f468b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562f-6926-8058-c6fc61ac9785
000e0000-562f-6926-3908-7864821356f1	\N	\N	00140000-562f-6924-7030-8136a8f0dbbc	00190000-562f-6926-7520-a8b04c6f468b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-562f-6926-b440-18fd570d8dae
000e0000-562f-6926-4750-f88e5b64cfa9	\N	\N	00140000-562f-6924-7030-8136a8f0dbbc	00190000-562f-6926-7520-a8b04c6f468b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-562f-6926-b440-18fd570d8dae
\.


--
-- TOC entry 3076 (class 0 OID 23529411)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-562f-6926-3454-0b64ea5267da	\N	000e0000-562f-6926-0949-bd255f035143	1	
00200000-562f-6926-3772-0c84cfd51ab1	\N	000e0000-562f-6926-0949-bd255f035143	2	
00200000-562f-6926-5033-57f2b283e869	\N	000e0000-562f-6926-0949-bd255f035143	3	
00200000-562f-6926-caaa-eb6eb967b172	\N	000e0000-562f-6926-0949-bd255f035143	4	
00200000-562f-6926-1558-ca75e15acb0c	\N	000e0000-562f-6926-0949-bd255f035143	5	
\.


--
-- TOC entry 3092 (class 0 OID 23529556)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23529670)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-562f-6924-ab43-a1bebff1c0d1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-562f-6924-d7d5-b988273377db	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-562f-6924-0960-50e0c0cbb7be	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-562f-6924-8389-b47fa0815c3e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-562f-6924-129d-9f233d5ddb69	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-562f-6924-08c6-8eff179dae18	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-562f-6924-006f-2fd890d477c7	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-562f-6924-b153-34d13206302e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-562f-6924-eb38-0a2433aefeec	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-562f-6924-5dff-a46dd6b8ac9d	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-562f-6924-a6d7-b7c41376c8a1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-562f-6924-5429-ef5b72b70904	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-562f-6924-2ed9-a393fa93a58e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-562f-6924-3625-541ae396e4cd	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-562f-6924-9b8c-e4e5b59e6cbc	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-562f-6924-0d48-d5214e602896	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-562f-6924-1142-46723345e1da	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-562f-6924-f13c-098a15b87eaa	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-562f-6924-bdfc-458f9e573db5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-562f-6924-dc79-76bff774d446	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-562f-6924-8c5c-6cb03446561b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-562f-6924-edfe-d681ad92557d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-562f-6924-92af-bd5016bafeb0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-562f-6924-ab30-d8fa7ea234d6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-562f-6924-c33a-1dab4c7f7f9e	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-562f-6924-13df-f1ffbd5a0757	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-562f-6924-de5a-5f792971d518	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-562f-6924-c9d0-0cbbcfbb1f51	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3121 (class 0 OID 23530021)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23529993)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23530033)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 23529628)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-562f-6926-a402-0726f0407f0e	00090000-562f-6926-5c27-86316fb0fcac	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-6926-6a03-5f00c2939a0f	00090000-562f-6926-13c1-d4daa44412f5	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-6926-11a9-afaf78b46154	00090000-562f-6926-fb3d-7f12137d36af	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-6926-9a44-91cee0125e7b	00090000-562f-6926-7add-40e491f080a0	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-6926-8d39-516f23509db7	00090000-562f-6926-22d7-01778667912f	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-6926-18d1-483066e083e3	00090000-562f-6926-e633-8c851d74384f	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3079 (class 0 OID 23529454)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23529737)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-562f-6924-10d1-7d6f2e67af93	01	Drama	drama (SURS 01)
00140000-562f-6924-07d8-391d06675db9	02	Opera	opera (SURS 02)
00140000-562f-6924-1409-cf9f96785a46	03	Balet	balet (SURS 03)
00140000-562f-6924-939f-1fc6cc8b863e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-562f-6924-a8f4-8c45266dad65	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-562f-6924-7030-8136a8f0dbbc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-562f-6924-bb9c-46d40d6f265e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3098 (class 0 OID 23529618)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2548 (class 2606 OID 23529189)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23529796)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 23529786)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23529653)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23529695)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23530073)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 23529443)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 23529464)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 23529991)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 23529338)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 23529864)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23529614)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 23529409)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23529376)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23529352)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 23529521)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 23530050)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 23530057)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2826 (class 2606 OID 23530081)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23529548)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23529310)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23529208)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23529272)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23529235)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 23529178)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 23529163)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23529554)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 23529590)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 23529732)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 23529263)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23529298)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 23529943)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23529527)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23529288)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 23529428)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 23529397)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2615 (class 2606 OID 23529389)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23529539)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 23529952)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23529960)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23529930)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 23529972)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 23529572)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23529512)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23529503)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 23529719)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 23529646)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23529364)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23529134)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 23529581)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23529152)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2541 (class 2606 OID 23529172)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 23529599)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23529534)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23529483)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23529122)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23529110)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23529104)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 23529666)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23529244)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23529494)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 23529706)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 23529197)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23529984)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 23529472)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 23529323)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 23529147)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 23529765)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 23529418)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23529562)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 23529678)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23530031)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23530015)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23530039)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 23529636)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 23529458)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 23529745)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23529626)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 1259 OID 23529452)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2632 (class 1259 OID 23529453)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2633 (class 1259 OID 23529451)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2634 (class 1259 OID 23529450)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2635 (class 1259 OID 23529449)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2726 (class 1259 OID 23529667)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2727 (class 1259 OID 23529668)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 23529669)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2812 (class 1259 OID 23530052)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2813 (class 1259 OID 23530051)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2566 (class 1259 OID 23529265)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2567 (class 1259 OID 23529266)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2684 (class 1259 OID 23529555)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2799 (class 1259 OID 23530019)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2800 (class 1259 OID 23530018)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2801 (class 1259 OID 23530020)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2802 (class 1259 OID 23530017)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2803 (class 1259 OID 23530016)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2678 (class 1259 OID 23529541)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 23529540)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2623 (class 1259 OID 23529419)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2624 (class 1259 OID 23529420)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 23529615)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2709 (class 1259 OID 23529617)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2710 (class 1259 OID 23529616)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2598 (class 1259 OID 23529354)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 23529353)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 23529973)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2742 (class 1259 OID 23529734)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2743 (class 1259 OID 23529735)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23529736)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2809 (class 1259 OID 23530040)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2751 (class 1259 OID 23529770)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2752 (class 1259 OID 23529767)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2753 (class 1259 OID 23529771)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2754 (class 1259 OID 23529769)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2755 (class 1259 OID 23529768)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2588 (class 1259 OID 23529325)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 23529324)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 23529238)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2696 (class 1259 OID 23529582)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2543 (class 1259 OID 23529179)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 23529180)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 23529602)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 23529601)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 23529600)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2571 (class 1259 OID 23529275)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2572 (class 1259 OID 23529274)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2573 (class 1259 OID 23529276)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2611 (class 1259 OID 23529392)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2612 (class 1259 OID 23529390)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 23529391)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2523 (class 1259 OID 23529112)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2658 (class 1259 OID 23529507)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2659 (class 1259 OID 23529505)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2660 (class 1259 OID 23529504)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2661 (class 1259 OID 23529506)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 23529153)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 23529154)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2687 (class 1259 OID 23529563)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2822 (class 1259 OID 23530074)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2724 (class 1259 OID 23529655)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 23529654)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2823 (class 1259 OID 23530082)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2824 (class 1259 OID 23530083)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2673 (class 1259 OID 23529528)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2718 (class 1259 OID 23529647)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2719 (class 1259 OID 23529648)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23529869)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2773 (class 1259 OID 23529868)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2774 (class 1259 OID 23529865)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 23529866)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2776 (class 1259 OID 23529867)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2577 (class 1259 OID 23529290)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 23529289)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2579 (class 1259 OID 23529291)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23529576)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2691 (class 1259 OID 23529575)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2782 (class 1259 OID 23529953)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2783 (class 1259 OID 23529954)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2765 (class 1259 OID 23529800)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2766 (class 1259 OID 23529801)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2767 (class 1259 OID 23529798)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2768 (class 1259 OID 23529799)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2714 (class 1259 OID 23529637)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 23529638)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2664 (class 1259 OID 23529516)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2665 (class 1259 OID 23529515)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 23529513)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2667 (class 1259 OID 23529514)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2761 (class 1259 OID 23529788)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 23529787)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 23529365)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2605 (class 1259 OID 23529379)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2606 (class 1259 OID 23529378)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2607 (class 1259 OID 23529377)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2608 (class 1259 OID 23529380)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2622 (class 1259 OID 23529410)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 23529398)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2617 (class 1259 OID 23529399)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2779 (class 1259 OID 23529944)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2798 (class 1259 OID 23529992)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2816 (class 1259 OID 23530058)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2817 (class 1259 OID 23530059)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2553 (class 1259 OID 23529210)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2554 (class 1259 OID 23529209)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2562 (class 1259 OID 23529245)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2563 (class 1259 OID 23529246)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 23529459)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2653 (class 1259 OID 23529497)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 23529496)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2655 (class 1259 OID 23529495)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 23529445)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2637 (class 1259 OID 23529446)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2638 (class 1259 OID 23529444)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2639 (class 1259 OID 23529448)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2640 (class 1259 OID 23529447)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2570 (class 1259 OID 23529264)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 23529198)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 23529199)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2594 (class 1259 OID 23529339)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 23529341)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2596 (class 1259 OID 23529340)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2597 (class 1259 OID 23529342)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2672 (class 1259 OID 23529522)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 23529733)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2756 (class 1259 OID 23529766)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2738 (class 1259 OID 23529707)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 23529708)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2560 (class 1259 OID 23529236)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2561 (class 1259 OID 23529237)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2711 (class 1259 OID 23529627)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23529123)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23529311)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 23529273)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23529111)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2795 (class 1259 OID 23529985)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 23529574)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2695 (class 1259 OID 23529573)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 23529473)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 23529474)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2769 (class 1259 OID 23529797)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23529299)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 23529746)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2806 (class 1259 OID 23530032)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2788 (class 1259 OID 23529961)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2789 (class 1259 OID 23529962)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 23529696)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2652 (class 1259 OID 23529484)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 23529173)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2861 (class 2606 OID 23530254)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2862 (class 2606 OID 23530259)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2866 (class 2606 OID 23530279)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2860 (class 2606 OID 23530249)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2864 (class 2606 OID 23530269)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2865 (class 2606 OID 23530274)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2863 (class 2606 OID 23530264)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2900 (class 2606 OID 23530449)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2901 (class 2606 OID 23530454)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2902 (class 2606 OID 23530459)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2935 (class 2606 OID 23530624)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2934 (class 2606 OID 23530619)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 23530139)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2839 (class 2606 OID 23530144)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23530364)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2931 (class 2606 OID 23530604)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 23530599)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2932 (class 2606 OID 23530609)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2929 (class 2606 OID 23530594)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2928 (class 2606 OID 23530589)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2882 (class 2606 OID 23530359)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2881 (class 2606 OID 23530354)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2858 (class 2606 OID 23530239)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2859 (class 2606 OID 23530244)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2891 (class 2606 OID 23530404)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2893 (class 2606 OID 23530414)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2892 (class 2606 OID 23530409)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2849 (class 2606 OID 23530194)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 23530189)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 23530344)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 23530579)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2903 (class 2606 OID 23530464)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 23530469)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2905 (class 2606 OID 23530474)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2933 (class 2606 OID 23530614)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2909 (class 2606 OID 23530494)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2906 (class 2606 OID 23530479)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2910 (class 2606 OID 23530499)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2908 (class 2606 OID 23530489)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2907 (class 2606 OID 23530484)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2847 (class 2606 OID 23530184)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 23530179)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2835 (class 2606 OID 23530124)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2834 (class 2606 OID 23530119)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 23530384)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2830 (class 2606 OID 23530099)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2831 (class 2606 OID 23530104)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2890 (class 2606 OID 23530399)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2889 (class 2606 OID 23530394)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2888 (class 2606 OID 23530389)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2841 (class 2606 OID 23530154)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2840 (class 2606 OID 23530149)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2842 (class 2606 OID 23530159)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2854 (class 2606 OID 23530219)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 23530209)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 23530214)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2827 (class 2606 OID 23530084)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2874 (class 2606 OID 23530319)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2872 (class 2606 OID 23530309)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2871 (class 2606 OID 23530304)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2873 (class 2606 OID 23530314)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2828 (class 2606 OID 23530089)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 23530094)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 23530369)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2938 (class 2606 OID 23530639)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 23530444)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2898 (class 2606 OID 23530439)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2939 (class 2606 OID 23530644)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2940 (class 2606 OID 23530649)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2880 (class 2606 OID 23530349)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2896 (class 2606 OID 23530429)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2897 (class 2606 OID 23530434)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2921 (class 2606 OID 23530554)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2920 (class 2606 OID 23530549)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2917 (class 2606 OID 23530534)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 23530539)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2919 (class 2606 OID 23530544)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2844 (class 2606 OID 23530169)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 23530164)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 23530174)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2886 (class 2606 OID 23530379)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2885 (class 2606 OID 23530374)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 23530564)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2924 (class 2606 OID 23530569)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2915 (class 2606 OID 23530524)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 23530529)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2913 (class 2606 OID 23530514)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2914 (class 2606 OID 23530519)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2894 (class 2606 OID 23530419)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 23530424)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2878 (class 2606 OID 23530339)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2877 (class 2606 OID 23530334)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2875 (class 2606 OID 23530324)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2876 (class 2606 OID 23530329)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 23530509)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2911 (class 2606 OID 23530504)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2850 (class 2606 OID 23530199)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2851 (class 2606 OID 23530204)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2857 (class 2606 OID 23530234)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2855 (class 2606 OID 23530224)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2856 (class 2606 OID 23530229)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2922 (class 2606 OID 23530559)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2925 (class 2606 OID 23530574)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23530584)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2936 (class 2606 OID 23530629)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 23530634)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2833 (class 2606 OID 23530114)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2832 (class 2606 OID 23530109)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2836 (class 2606 OID 23530129)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 23530134)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2867 (class 2606 OID 23530284)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2870 (class 2606 OID 23530299)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 23530294)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2868 (class 2606 OID 23530289)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-27 13:08:09 CET

--
-- PostgreSQL database dump complete
--

