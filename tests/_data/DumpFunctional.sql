--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-23 14:37:23 CEST

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
-- TOC entry 180 (class 1259 OID 23262561)
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
-- TOC entry 233 (class 1259 OID 23263169)
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
-- TOC entry 232 (class 1259 OID 23263152)
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
-- TOC entry 223 (class 1259 OID 23263029)
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
-- TOC entry 226 (class 1259 OID 23263059)
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
-- TOC entry 247 (class 1259 OID 23263440)
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
-- TOC entry 200 (class 1259 OID 23262809)
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
-- TOC entry 202 (class 1259 OID 23262840)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23263366)
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
-- TOC entry 191 (class 1259 OID 23262706)
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
-- TOC entry 234 (class 1259 OID 23263182)
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
-- TOC entry 219 (class 1259 OID 23262983)
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
-- TOC entry 197 (class 1259 OID 23262780)
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
-- TOC entry 194 (class 1259 OID 23262746)
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
-- TOC entry 192 (class 1259 OID 23262723)
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
-- TOC entry 208 (class 1259 OID 23262897)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23263421)
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
-- TOC entry 246 (class 1259 OID 23263433)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23263455)
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
-- TOC entry 212 (class 1259 OID 23262922)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23262680)
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
-- TOC entry 182 (class 1259 OID 23262580)
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
-- TOC entry 186 (class 1259 OID 23262647)
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
-- TOC entry 183 (class 1259 OID 23262591)
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
-- TOC entry 177 (class 1259 OID 23262535)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23262554)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23262929)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23262963)
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
-- TOC entry 229 (class 1259 OID 23263100)
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
-- TOC entry 185 (class 1259 OID 23262627)
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
-- TOC entry 188 (class 1259 OID 23262672)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23263311)
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
-- TOC entry 209 (class 1259 OID 23262903)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23262657)
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
-- TOC entry 199 (class 1259 OID 23262801)
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
-- TOC entry 195 (class 1259 OID 23262761)
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
-- TOC entry 196 (class 1259 OID 23262773)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23262915)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23263325)
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
-- TOC entry 238 (class 1259 OID 23263335)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23263250)
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
-- TOC entry 239 (class 1259 OID 23263343)
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
-- TOC entry 215 (class 1259 OID 23262944)
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
-- TOC entry 207 (class 1259 OID 23262888)
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
-- TOC entry 206 (class 1259 OID 23262878)
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
-- TOC entry 228 (class 1259 OID 23263089)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23263019)
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
-- TOC entry 193 (class 1259 OID 23262735)
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
-- TOC entry 174 (class 1259 OID 23262506)
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
-- TOC entry 173 (class 1259 OID 23262504)
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
-- TOC entry 216 (class 1259 OID 23262957)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23262544)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23262528)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23262971)
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
-- TOC entry 210 (class 1259 OID 23262909)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23262855)
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
-- TOC entry 172 (class 1259 OID 23262493)
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
-- TOC entry 171 (class 1259 OID 23262485)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23262480)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23263036)
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
-- TOC entry 184 (class 1259 OID 23262619)
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
-- TOC entry 205 (class 1259 OID 23262865)
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
-- TOC entry 227 (class 1259 OID 23263077)
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
-- TOC entry 181 (class 1259 OID 23262570)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23263354)
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
-- TOC entry 203 (class 1259 OID 23262845)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23262692)
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
-- TOC entry 175 (class 1259 OID 23262515)
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
-- TOC entry 231 (class 1259 OID 23263127)
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
-- TOC entry 198 (class 1259 OID 23262791)
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
-- TOC entry 214 (class 1259 OID 23262936)
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
-- TOC entry 225 (class 1259 OID 23263050)
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
-- TOC entry 243 (class 1259 OID 23263401)
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
-- TOC entry 242 (class 1259 OID 23263373)
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
-- TOC entry 244 (class 1259 OID 23263413)
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
-- TOC entry 221 (class 1259 OID 23263008)
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
-- TOC entry 201 (class 1259 OID 23262834)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23263117)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23262998)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23262509)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3058 (class 0 OID 23262561)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-562a-2a00-07f6-50c3288ec15f	10	30	Otroci	Abonma za otroke	200
000a0000-562a-2a00-c6f4-304aee3cb47e	20	60	Mladina	Abonma za mladino	400
000a0000-562a-2a00-42df-a5e51d9846c8	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3111 (class 0 OID 23263169)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-562a-2a00-59a3-6d37a831ffeb	000d0000-562a-2a00-2c08-18c9d7f6ec86	\N	00090000-562a-2a00-2e9b-f17d3e5f1e60	000b0000-562a-2a00-01bd-8855e5aafa68	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-562a-2a00-02aa-5c0c31927ae5	000d0000-562a-2a00-f040-ebb3fb025055	00100000-562a-2a00-ac7d-70d47ce7d34b	00090000-562a-2a00-272b-dd8cd8af6a32	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-562a-2a00-f6a3-cd6c077cbd07	000d0000-562a-2a00-41f2-9ea49d7b795e	00100000-562a-2a00-80a4-e9256d30b600	00090000-562a-2a00-1ac5-d2eee130b8f0	\N	0003	t	\N	2015-10-23	\N	2	t	\N	f	f
000c0000-562a-2a00-63f8-565e741cd5a9	000d0000-562a-2a00-38a2-80640ca24e3d	\N	00090000-562a-2a00-08a6-7316cbe35086	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-562a-2a00-63c3-daa2db9927cc	000d0000-562a-2a00-5fe0-8b716025e202	\N	00090000-562a-2a00-6c3d-3ee9f248d5ca	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-562a-2a00-dd91-eb834cb7bfe6	000d0000-562a-2a00-b6a3-9cf09670ecaa	\N	00090000-562a-2a00-eef3-1f1f67374bb9	000b0000-562a-2a00-73a6-8d0ce5603ae8	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-562a-2a00-0be4-908d1910f04b	000d0000-562a-2a00-33a7-d5b2c6231359	00100000-562a-2a00-1f1e-c0b2ce82ba91	00090000-562a-2a00-f222-ca86de3e3588	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-562a-2a00-0a01-a764ac30fc7a	000d0000-562a-2a00-962b-357757c5841a	\N	00090000-562a-2a00-bd34-c262c2fa51fa	000b0000-562a-2a00-821c-1a6649e016dc	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-562a-2a00-3f32-20bbddb9f6a4	000d0000-562a-2a00-33a7-d5b2c6231359	00100000-562a-2a00-315a-c2fe8157076e	00090000-562a-2a00-674f-4da7e06d0df9	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-562a-2a00-b3e5-3d8d787a1ff8	000d0000-562a-2a00-33a7-d5b2c6231359	00100000-562a-2a00-4ced-41251aa671e1	00090000-562a-2a00-b4d1-3be58ab8cede	\N	0010	t	\N	2015-10-23	\N	16	f	\N	f	t
000c0000-562a-2a00-4f8d-c606013a7216	000d0000-562a-2a00-33a7-d5b2c6231359	00100000-562a-2a00-aa08-9601bc1ddd33	00090000-562a-2a00-7198-4eb82d8f94f1	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-562a-2a00-4d71-3aaeae2bcaf2	000d0000-562a-2a00-3b53-fc48e646af29	\N	00090000-562a-2a00-272b-dd8cd8af6a32	000b0000-562a-2a00-c8c8-5be59b5dacc3	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3110 (class 0 OID 23263152)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 23263029)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-562a-2a00-b3c0-16a45c1499de	00160000-562a-2a00-ce3b-0c4da3383484	00090000-562a-2a00-bfdc-e6f3af1cf245	aizv	10	t
003d0000-562a-2a00-2cdd-08d15eccd1b8	00160000-562a-2a00-ce3b-0c4da3383484	00090000-562a-2a00-1250-dee471cfead6	apri	14	t
003d0000-562a-2a00-ab5c-d838ba0068b6	00160000-562a-2a00-74ca-ae7fbed4d76a	00090000-562a-2a00-f705-c9af393482f6	aizv	11	t
003d0000-562a-2a00-6b06-596c32f689b8	00160000-562a-2a00-764e-b1e29363bc0b	00090000-562a-2a00-2e59-0149ad37d171	aizv	12	t
003d0000-562a-2a00-1b14-7ef039965535	00160000-562a-2a00-ce3b-0c4da3383484	00090000-562a-2a00-e660-768615b5d011	apri	18	f
\.


--
-- TOC entry 3104 (class 0 OID 23263059)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-562a-2a00-ce3b-0c4da3383484	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-562a-2a00-74ca-ae7fbed4d76a	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-562a-2a00-764e-b1e29363bc0b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3125 (class 0 OID 23263440)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23262809)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-562a-2a00-c8b5-fe619b514343	\N	\N	00200000-562a-2a00-f01d-1b9f8825e736	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-562a-2a00-0a15-949f431c0337	\N	\N	00200000-562a-2a00-31cc-42d6ea21b7f0	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-562a-2a00-f7a9-c1f165b21435	\N	\N	00200000-562a-2a00-8131-1692a2e4fe40	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-562a-2a00-885e-2b7750db438f	\N	\N	00200000-562a-2a00-3f69-6012bacced4e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-562a-2a00-cfd6-5f69a0d17912	\N	\N	00200000-562a-2a00-a66d-ab38f37e4c1b	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3080 (class 0 OID 23262840)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23263366)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23262706)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-562a-29fe-806d-810a95f00ff0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-562a-29fe-8119-d60bc4408088	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-562a-29fe-9f31-f3974764052d	AL	ALB	008	Albania 	Albanija	\N
00040000-562a-29fe-8d89-9c3dbd391e2b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-562a-29fe-fb50-b07cdb8b1d39	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-562a-29fe-9155-a9029605c791	AD	AND	020	Andorra 	Andora	\N
00040000-562a-29fe-6239-7e73574ca25a	AO	AGO	024	Angola 	Angola	\N
00040000-562a-29fe-6fbf-1ace97bc0d87	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-562a-29fe-e050-fe4af006ae69	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-562a-29fe-08e4-89e0d00b6e75	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-562a-29fe-1771-d79f254f54b8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-562a-29fe-2f05-e825d23e190c	AM	ARM	051	Armenia 	Armenija	\N
00040000-562a-29fe-cf0c-d309283fe1b5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-562a-29fe-bbc3-8f924232561e	AU	AUS	036	Australia 	Avstralija	\N
00040000-562a-29fe-b35c-fa7bee2aa1ba	AT	AUT	040	Austria 	Avstrija	\N
00040000-562a-29fe-d50a-63d731ec433a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-562a-29fe-434d-ad2b22a68b4d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-562a-29fe-b9ff-88ffcc0456ff	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-562a-29fe-b937-30f7f5f50c2d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-562a-29fe-3070-f0f2f37ae476	BB	BRB	052	Barbados 	Barbados	\N
00040000-562a-29fe-e98b-699e22bcf1f9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-562a-29fe-ed25-441a0f226772	BE	BEL	056	Belgium 	Belgija	\N
00040000-562a-29fe-4b98-d03733c6d2ed	BZ	BLZ	084	Belize 	Belize	\N
00040000-562a-29fe-07af-fd2760698a87	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-562a-29fe-c907-6a0b8b85d0d3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-562a-29fe-93d7-a1e6999d2430	BT	BTN	064	Bhutan 	Butan	\N
00040000-562a-29fe-50c9-d15abe09833e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-562a-29fe-8fe9-aa37f1758839	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-562a-29fe-0eae-df302412a667	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-562a-29fe-d41a-e49fbc3109ca	BW	BWA	072	Botswana 	Bocvana	\N
00040000-562a-29fe-ffd5-e9a7290031be	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-562a-29fe-4b04-52da903f32ca	BR	BRA	076	Brazil 	Brazilija	\N
00040000-562a-29fe-2071-bdad70136a8b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-562a-29fe-aeba-55e3006d03d3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-562a-29fe-03e4-fe38210efdc4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-562a-29fe-90ea-551b1f98f884	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-562a-29fe-161a-16bf036151fd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-562a-29fe-a35a-bc6a4b783066	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-562a-29fe-4e4b-4690ddab5a9b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-562a-29fe-de1c-7ac91938805a	CA	CAN	124	Canada 	Kanada	\N
00040000-562a-29fe-83be-32542f2c4356	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-562a-29fe-5a3b-3f7ae741c78f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-562a-29fe-ed99-9e8439e93fb3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-562a-29fe-56f1-003ea27db79f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-562a-29fe-ddf5-451dcf407986	CL	CHL	152	Chile 	Čile	\N
00040000-562a-29fe-8418-0cb0f72f565a	CN	CHN	156	China 	Kitajska	\N
00040000-562a-29fe-d7d8-96607d6cf7c1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-562a-29fe-7bca-ba9a184d447f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-562a-29fe-99ee-cdd11c6f5a7b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-562a-29fe-f5ec-6176c02b051a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-562a-29fe-d467-ed75d7c1d6e7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-562a-29fe-5ff4-5399359283bb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-562a-29fe-cddf-b9332f58fc70	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-562a-29fe-badc-ffe59391b246	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-562a-29fe-5f80-fd14d3dafeae	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-562a-29fe-1926-7c84232d71f1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-562a-29fe-9135-229ed40cff4c	CU	CUB	192	Cuba 	Kuba	\N
00040000-562a-29fe-159d-58d34322d2a2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-562a-29fe-bae7-c85f1cae93be	CY	CYP	196	Cyprus 	Ciper	\N
00040000-562a-29fe-fada-30f4f32b36c1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-562a-29fe-a5ba-ba1472273a4e	DK	DNK	208	Denmark 	Danska	\N
00040000-562a-29fe-078e-a741a375304d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-562a-29fe-ac7c-f3c46ee9fa89	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-562a-29fe-2746-68ba26cd8c8e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-562a-29fe-84e1-793f091b45ad	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-562a-29fe-393e-cbd1513d7b0f	EG	EGY	818	Egypt 	Egipt	\N
00040000-562a-29fe-8c3a-a2d1048668e3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-562a-29fe-0771-308d787dfb0d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-562a-29fe-e27d-219d9fc93930	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-562a-29fe-2f2c-0717cd3bbcef	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-562a-29fe-9d4b-c284a6d67b33	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-562a-29fe-7e09-b2747c7e0260	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-562a-29fe-4b60-4a6bf7ade5c2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-562a-29fe-cec7-0cd2493e4b58	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-562a-29fe-8e58-314817ede7b5	FI	FIN	246	Finland 	Finska	\N
00040000-562a-29fe-455d-8bfe0334caff	FR	FRA	250	France 	Francija	\N
00040000-562a-29fe-586d-7cb40c707af9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-562a-29fe-de06-0bc3d06e7692	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-562a-29fe-ebb6-0081594e283c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-562a-29fe-bc60-467a7f9deb6b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-562a-29fe-4fe5-eeb7b9229f1c	GA	GAB	266	Gabon 	Gabon	\N
00040000-562a-29fe-0a17-f76478d54360	GM	GMB	270	Gambia 	Gambija	\N
00040000-562a-29fe-08d5-882402b4bcd1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-562a-29fe-114c-58f1cabd8060	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-562a-29fe-b14a-33e933d091e4	GH	GHA	288	Ghana 	Gana	\N
00040000-562a-29fe-39af-e6a6f3cd163d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-562a-29fe-d901-39869d79602f	GR	GRC	300	Greece 	Grčija	\N
00040000-562a-29fe-ac24-81d68fb85ef3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-562a-29fe-4ea4-ed9a7151a49b	GD	GRD	308	Grenada 	Grenada	\N
00040000-562a-29fe-d852-ac1943dd1fc1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-562a-29fe-1239-0c337313892e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-562a-29fe-c438-0cc9381b9f21	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-562a-29fe-cc62-af0cbb0e4e58	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-562a-29fe-afe5-9b9f64d2565c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-562a-29fe-3a16-628a7e7a12be	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-562a-29fe-6031-32cea4285d86	GY	GUY	328	Guyana 	Gvajana	\N
00040000-562a-29fe-9733-9c0b9b298ca1	HT	HTI	332	Haiti 	Haiti	\N
00040000-562a-29fe-8af2-8d9cef78fdc4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-562a-29fe-94f2-89a2f12fd8fd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-562a-29fe-1d00-3df218c7f5d6	HN	HND	340	Honduras 	Honduras	\N
00040000-562a-29fe-4d36-7d52774dfd89	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-562a-29fe-140e-870776ee36a4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-562a-29fe-cce2-6a262aa804bf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-562a-29fe-d144-f664a53243f5	IN	IND	356	India 	Indija	\N
00040000-562a-29fe-bbb6-27935eb9154e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-562a-29fe-f201-46dc6ccb0231	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-562a-29fe-69d7-f06f473c56cb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-562a-29fe-bc01-649fc09a13f7	IE	IRL	372	Ireland 	Irska	\N
00040000-562a-29fe-f5ed-aa0d245a0e82	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-562a-29fe-b011-1de2213142fc	IL	ISR	376	Israel 	Izrael	\N
00040000-562a-29fe-7314-40f8639581e7	IT	ITA	380	Italy 	Italija	\N
00040000-562a-29fe-727d-3b4c16accf95	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-562a-29fe-8cb6-fb662c5beaae	JP	JPN	392	Japan 	Japonska	\N
00040000-562a-29fe-8926-0fd5cd9350ab	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-562a-29fe-6c47-b5563b571501	JO	JOR	400	Jordan 	Jordanija	\N
00040000-562a-29fe-c752-9bd02d005526	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-562a-29fe-a3a1-7d36146cbbc2	KE	KEN	404	Kenya 	Kenija	\N
00040000-562a-29fe-ffce-f42f26bd64d0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-562a-29fe-c9c6-51c32c63e35d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-562a-29fe-b4e3-b1751d0f927d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-562a-29fe-ac71-72f8bef3a34a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-562a-29fe-e59c-818f08a95685	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-562a-29fe-1425-88781cfd37ec	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-562a-29fe-45de-27da407eaf85	LV	LVA	428	Latvia 	Latvija	\N
00040000-562a-29fe-1458-ed46e2484f88	LB	LBN	422	Lebanon 	Libanon	\N
00040000-562a-29fe-1dc0-d768a47e02f1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-562a-29fe-17c1-f0444870145b	LR	LBR	430	Liberia 	Liberija	\N
00040000-562a-29fe-3755-773d50c02c8f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-562a-29fe-b195-ebbba64a56a4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-562a-29fe-852a-58a775dbc520	LT	LTU	440	Lithuania 	Litva	\N
00040000-562a-29fe-b0ee-bdcd3499c2a9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-562a-29fe-556b-dd3f1ce7d3ac	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-562a-29fe-e7c2-bf7404976066	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-562a-29fe-d3b3-34dc07a1d6b5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-562a-29fe-1eee-802ab5afa6ae	MW	MWI	454	Malawi 	Malavi	\N
00040000-562a-29fe-38ea-b3becc7eaace	MY	MYS	458	Malaysia 	Malezija	\N
00040000-562a-29fe-1486-2a96ab0c1e35	MV	MDV	462	Maldives 	Maldivi	\N
00040000-562a-29fe-9477-c5ded6b0ae4d	ML	MLI	466	Mali 	Mali	\N
00040000-562a-29fe-ce31-691372d32e15	MT	MLT	470	Malta 	Malta	\N
00040000-562a-29fe-948b-58afc130a77b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-562a-29fe-285f-547f34e68741	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-562a-29fe-a41f-115e5ca92d2f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-562a-29fe-b4c5-704a7ba67406	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-562a-29fe-b1da-418c150c89b5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-562a-29fe-40f5-4c47b9706897	MX	MEX	484	Mexico 	Mehika	\N
00040000-562a-29fe-ad89-4d63d67332ff	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-562a-29fe-ebc9-70945b8980a5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-562a-29fe-7e46-a6dafe3650fa	MC	MCO	492	Monaco 	Monako	\N
00040000-562a-29fe-672b-f5ffc764345c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-562a-29fe-ad16-03f6e80dc51e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-562a-29fe-efc4-44241ff14b9f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-562a-29fe-cbaa-0121c4ab2486	MA	MAR	504	Morocco 	Maroko	\N
00040000-562a-29fe-3c3b-cb2e57ba6571	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-562a-29fe-9eb0-981d49e806df	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-562a-29fe-8d41-81341f8c2477	NA	NAM	516	Namibia 	Namibija	\N
00040000-562a-29fe-5178-ca2eda757139	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-562a-29fe-452a-bb04e31e76c2	NP	NPL	524	Nepal 	Nepal	\N
00040000-562a-29fe-bd4b-dc9a714ede15	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-562a-29fe-36ea-1d8ab433845e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-562a-29fe-53fa-0e33f3bed0cf	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-562a-29fe-6d49-e7c7b11a88f9	NE	NER	562	Niger 	Niger 	\N
00040000-562a-29fe-9f5c-433054577e3f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-562a-29fe-7bc0-fe8ffd0c3933	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-562a-29fe-5ef9-151ba5517da9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-562a-29fe-9c0a-ead0673879d0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-562a-29fe-98aa-715b168b3e10	NO	NOR	578	Norway 	Norveška	\N
00040000-562a-29fe-8863-e2fe1a2a5525	OM	OMN	512	Oman 	Oman	\N
00040000-562a-29fe-f13e-a5e2e152d81f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-562a-29fe-8b6c-ebf9cb29678d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-562a-29fe-de25-4cadd5152d5b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-562a-29fe-20fe-82c9f896228c	PA	PAN	591	Panama 	Panama	\N
00040000-562a-29fe-a19c-a4baa80475da	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-562a-29fe-8211-32f60f2b13c5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-562a-29fe-477a-ced3040c13d2	PE	PER	604	Peru 	Peru	\N
00040000-562a-29fe-8cb6-555c1db48417	PH	PHL	608	Philippines 	Filipini	\N
00040000-562a-29fe-b78d-c58f38671a36	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-562a-29fe-0b29-149ba7c1e8c4	PL	POL	616	Poland 	Poljska	\N
00040000-562a-29fe-79c8-b91d3356b87e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-562a-29fe-12f0-68b6da7da504	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-562a-29fe-9ccf-52d1c15d87d1	QA	QAT	634	Qatar 	Katar	\N
00040000-562a-29fe-6d0d-e3d3c67150d2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-562a-29fe-4686-07be1863a625	RO	ROU	642	Romania 	Romunija	\N
00040000-562a-29fe-289e-093107fd1638	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-562a-29fe-8c46-9c2129b9fa18	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-562a-29fe-d6c3-bfaef887f53b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-562a-29fe-8e79-e545477661e1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-562a-29fe-e0f0-c0b2bb126c02	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-562a-29fe-2f2d-6379c2387bb7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-562a-29fe-e39d-de7cb6c1c67f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-562a-29fe-c19f-4d05bcb3c0ca	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-562a-29fe-2a3a-1c6908bd6a87	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-562a-29fe-3989-cfab21d30eee	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-562a-29fe-1b83-4e45e217297d	SM	SMR	674	San Marino 	San Marino	\N
00040000-562a-29fe-60b7-7cb2253f344f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-562a-29fe-349c-0eddabc0fad0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-562a-29fe-87d3-acc6dfcde33b	SN	SEN	686	Senegal 	Senegal	\N
00040000-562a-29fe-9af4-b485f7bd0ae7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-562a-29fe-559a-c633e48bee84	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-562a-29fe-bb91-88d0a7dd4fd9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-562a-29fe-65ad-e341fdf0532b	SG	SGP	702	Singapore 	Singapur	\N
00040000-562a-29fe-18f3-1b43b75e7099	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-562a-29fe-1bb0-cb5b5a91f2e1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-562a-29fe-0a4a-44d74fa7d754	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-562a-29fe-8e77-9454e79ccf4d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-562a-29fe-e02a-3b1d750b84f8	SO	SOM	706	Somalia 	Somalija	\N
00040000-562a-29fe-2caa-e2b44ac3d845	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-562a-29fe-80a8-ea09c3dc5c0c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-562a-29fe-41d3-16187cf3c267	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-562a-29fe-21fb-6f671c9525ea	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-562a-29fe-4d13-ef67cf20c1fe	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-562a-29fe-c6e7-947eb4211da9	SD	SDN	729	Sudan 	Sudan	\N
00040000-562a-29fe-f934-f1ccae18a8e1	SR	SUR	740	Suriname 	Surinam	\N
00040000-562a-29fe-b857-f5ec13b75946	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-562a-29fe-61cd-91bd27b29d7e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-562a-29fe-2a06-2d0fce24aa13	SE	SWE	752	Sweden 	Švedska	\N
00040000-562a-29fe-119b-f8f9e8d7317f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-562a-29fe-9424-8d8e942c94f2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-562a-29fe-1771-f8b388326dd0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-562a-29fe-675a-945b9aa33232	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-562a-29fe-ee63-b77bb7b86fe3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-562a-29fe-2c18-ec73c2c36420	TH	THA	764	Thailand 	Tajska	\N
00040000-562a-29fe-5604-a6122ea2984d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-562a-29fe-5057-67cea98986fc	TG	TGO	768	Togo 	Togo	\N
00040000-562a-29fe-93b3-87aa56883efb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-562a-29fe-e412-544eb37192f4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-562a-29fe-f201-0d15c42187aa	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-562a-29fe-389e-86024e18a845	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-562a-29fe-437e-376d5d7162c1	TR	TUR	792	Turkey 	Turčija	\N
00040000-562a-29fe-0752-d11fdf4a9bc2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-562a-29fe-cd61-45241d21667c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562a-29fe-24d9-96f51fdba120	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-562a-29fe-9837-4e6aa213aa3d	UG	UGA	800	Uganda 	Uganda	\N
00040000-562a-29fe-2493-2785a1df0bb1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-562a-29fe-744b-88e785abb28c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-562a-29fe-d6c0-7f54198cc18a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-562a-29fe-299c-5132e8e8cb12	US	USA	840	United States 	Združene države Amerike	\N
00040000-562a-29fe-619b-4d0b41f82a78	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-562a-29fe-0157-ec229f5cc8b9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-562a-29fe-5982-b15876c4d973	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-562a-29fe-9f98-f102a1205c68	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-562a-29fe-eae3-cfc29fd350ab	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-562a-29fe-0e8e-8f4badb47a17	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-562a-29fe-93f8-7aef99b99414	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562a-29fe-91a7-f6c8a4d5b3b5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-562a-29fe-f5e1-299ef9616c7a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-562a-29fe-5b96-59cd86b52814	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-562a-29fe-8d41-e335708193c2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-562a-29fe-29b1-c6d963489e3b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-562a-29fe-4a7d-6a33ef81911b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3112 (class 0 OID 23263182)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-562a-2a00-2053-4064e1f6e14d	000e0000-562a-2a00-c9fe-76185fb9f606	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562a-29fe-70c0-e5a15a2d836a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562a-2a00-d6ae-a25ab33d29c3	000e0000-562a-2a00-90df-31f8f9a37fce	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562a-29fe-9b57-3e254e8813d1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562a-2a00-9078-3c8687bb216e	000e0000-562a-2a00-457a-51e6e551120a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562a-29fe-70c0-e5a15a2d836a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562a-2a00-b1d5-df2d8ddeb02e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562a-2a00-b839-aa1ca94e1ee8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3097 (class 0 OID 23262983)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-562a-2a00-2c08-18c9d7f6ec86	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-59a3-6d37a831ffeb	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-562a-29fe-3cb4-d7f378a10fc7
000d0000-562a-2a00-f040-ebb3fb025055	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-02aa-5c0c31927ae5	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-562a-29fe-d691-b7a61fed29a2
000d0000-562a-2a00-41f2-9ea49d7b795e	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-f6a3-cd6c077cbd07	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-562a-29fe-ee0e-f322e8a48df7
000d0000-562a-2a00-38a2-80640ca24e3d	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-63f8-565e741cd5a9	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-562a-29fe-cff9-9905f7dd4f43
000d0000-562a-2a00-5fe0-8b716025e202	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-63c3-daa2db9927cc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-562a-29fe-cff9-9905f7dd4f43
000d0000-562a-2a00-b6a3-9cf09670ecaa	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-dd91-eb834cb7bfe6	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-562a-29fe-3cb4-d7f378a10fc7
000d0000-562a-2a00-33a7-d5b2c6231359	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-3f32-20bbddb9f6a4	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-562a-29fe-3cb4-d7f378a10fc7
000d0000-562a-2a00-962b-357757c5841a	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-0a01-a764ac30fc7a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-562a-29fe-db4e-1a560af55083
000d0000-562a-2a00-3b53-fc48e646af29	000e0000-562a-2a00-90df-31f8f9a37fce	000c0000-562a-2a00-4d71-3aaeae2bcaf2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-562a-29fe-c71a-7ff1def16223
\.


--
-- TOC entry 3075 (class 0 OID 23262780)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23262746)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 23262723)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-562a-2a00-919e-9ce79358a766	00080000-562a-2a00-f68a-c3c5b61d995f	00090000-562a-2a00-b4d1-3be58ab8cede	AK		igralka
\.


--
-- TOC entry 3086 (class 0 OID 23262897)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23263421)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23263433)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23263455)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23262922)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23262680)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-562a-29ff-f3e1-0d3a7e09f992	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-562a-29ff-2752-faa06c4a5171	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-562a-29ff-94f8-63aabfac267e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-562a-29ff-ce39-6e6895bb4bea	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-562a-29ff-2b48-065050108f0e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-562a-29ff-4db9-f4f2176b1f19	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-562a-29ff-b116-c5013e0c7c9f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-562a-29ff-577f-387b77cef175	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562a-29ff-2d0b-f2e1a4b3fe60	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562a-29ff-e802-0cc933712264	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-562a-29ff-9f92-00d970d9602b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-562a-29ff-532c-8c6f5d7d3d20	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-562a-29ff-2444-6617daa19b78	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-562a-29ff-ad70-e6b4a012db75	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-562a-29ff-c5d8-8a94e157d356	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-562a-2a00-90f3-306073827c9f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-562a-2a00-3fb3-d565bccc5038	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-562a-2a00-d82a-c594000d3b17	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-562a-2a00-a066-796cf470709e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-562a-2a00-8d23-dddad34599d0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-562a-2a02-fb2d-dd61f2d0e512	application.tenant.maticnopodjetje	string	s:36:"00080000-562a-2a02-9fec-3ad1cd1903f6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3060 (class 0 OID 23262580)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-562a-2a00-27d7-10a13823411c	00000000-562a-2a00-90f3-306073827c9f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-562a-2a00-0c35-27e01f63f6f8	00000000-562a-2a00-90f3-306073827c9f	00010000-562a-29ff-1fd1-144983947da5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-562a-2a00-a2cb-c60ae505b149	00000000-562a-2a00-3fb3-d565bccc5038	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3064 (class 0 OID 23262647)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-562a-2a00-6314-f9a0455e23c0	\N	00100000-562a-2a00-ac7d-70d47ce7d34b	00100000-562a-2a00-80a4-e9256d30b600	01	Gledališče Nimbis
00410000-562a-2a00-031a-e4376a861815	00410000-562a-2a00-6314-f9a0455e23c0	00100000-562a-2a00-ac7d-70d47ce7d34b	00100000-562a-2a00-80a4-e9256d30b600	02	Tehnika
\.


--
-- TOC entry 3061 (class 0 OID 23262591)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-562a-2a00-2e9b-f17d3e5f1e60	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-562a-2a00-08a6-7316cbe35086	00010000-562a-2a00-59f1-a481147edbad	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-562a-2a00-1ac5-d2eee130b8f0	00010000-562a-2a00-b3b5-936b159475b8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-562a-2a00-674f-4da7e06d0df9	00010000-562a-2a00-4569-13db7b5376b8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-562a-2a00-adeb-139ba9fba2e7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-562a-2a00-eef3-1f1f67374bb9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-562a-2a00-7198-4eb82d8f94f1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-562a-2a00-f222-ca86de3e3588	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-562a-2a00-b4d1-3be58ab8cede	00010000-562a-2a00-b939-813c1ec35855	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-562a-2a00-272b-dd8cd8af6a32	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-562a-2a00-af48-4416519d332e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562a-2a00-6c3d-3ee9f248d5ca	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-562a-2a00-bd34-c262c2fa51fa	00010000-562a-2a00-aab9-75531815f6e0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562a-2a00-bfdc-e6f3af1cf245	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-2a00-1250-dee471cfead6	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-2a00-f705-c9af393482f6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-2a00-2e59-0149ad37d171	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562a-2a00-e660-768615b5d011	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562a-2a00-33d3-f0c958ca5c7b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-2a00-436f-87d91bcf49b0	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-2a00-f245-41435e7504f0	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3055 (class 0 OID 23262535)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-562a-29fe-3d9b-10bfd5a2ad46	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-562a-29fe-80b6-ab93a9f1495a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-562a-29fe-2c83-170a23b61652	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-562a-29fe-9f49-102b11e6842d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-562a-29fe-39fb-4a51a57fd40d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-562a-29fe-a9a5-804f3936dcfb	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-562a-29fe-790d-ad44671ec9e6	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-562a-29fe-8638-f1c6f37eff84	Abonma-read	Abonma - branje	f
00030000-562a-29fe-31ab-529fc42c45fc	Abonma-write	Abonma - spreminjanje	f
00030000-562a-29fe-6c1f-ed4bb2431220	Alternacija-read	Alternacija - branje	f
00030000-562a-29fe-c79e-024f6ae0ed5f	Alternacija-write	Alternacija - spreminjanje	f
00030000-562a-29fe-6fad-5d83b6335354	Arhivalija-read	Arhivalija - branje	f
00030000-562a-29fe-64bd-42883711bc17	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-562a-29fe-a725-b08e437c350d	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-562a-29fe-82d5-322f42ab4c48	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-562a-29fe-967a-0b08385954bb	Besedilo-read	Besedilo - branje	f
00030000-562a-29fe-8b26-7daa4bc8c436	Besedilo-write	Besedilo - spreminjanje	f
00030000-562a-29fe-f570-2d242395173a	DogodekIzven-read	DogodekIzven - branje	f
00030000-562a-29fe-88ba-3e9a31ab71a6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-562a-29fe-1a94-a033fdb9712a	Dogodek-read	Dogodek - branje	f
00030000-562a-29fe-6086-ff80ee6d9d9c	Dogodek-write	Dogodek - spreminjanje	f
00030000-562a-29fe-8133-e1abdb814901	DrugiVir-read	DrugiVir - branje	f
00030000-562a-29fe-1ada-e50012511f91	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-562a-29fe-d081-cdbfff9c627d	Drzava-read	Drzava - branje	f
00030000-562a-29fe-00d4-4ce51c214364	Drzava-write	Drzava - spreminjanje	f
00030000-562a-29fe-5c9c-16af50d3189e	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-562a-29fe-f3a6-55defe1ce3cb	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-562a-29fe-0567-ec40dc644b34	Funkcija-read	Funkcija - branje	f
00030000-562a-29fe-9469-00e6a1f59cc5	Funkcija-write	Funkcija - spreminjanje	f
00030000-562a-29fe-b5db-d649b9c3092a	Gostovanje-read	Gostovanje - branje	f
00030000-562a-29fe-da2a-af50428f80e9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-562a-29fe-bfeb-8a886fcd481b	Gostujoca-read	Gostujoca - branje	f
00030000-562a-29fe-313b-01df8f37e9d0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-562a-29fe-21a9-92b60f5c1667	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-562a-29fe-da95-a61e17ff21d8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-562a-29fe-f462-abc588847bce	Kupec-read	Kupec - branje	f
00030000-562a-29fe-af8b-8cc483c5cb3b	Kupec-write	Kupec - spreminjanje	f
00030000-562a-29fe-291b-941b11399735	NacinPlacina-read	NacinPlacina - branje	f
00030000-562a-29fe-3239-9fae42ba3b39	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-562a-29fe-a04b-0d78fc89766c	Option-read	Option - branje	f
00030000-562a-29fe-66c1-6fe6ec82eec5	Option-write	Option - spreminjanje	f
00030000-562a-29fe-039a-bb94f38ecd22	OptionValue-read	OptionValue - branje	f
00030000-562a-29fe-b6b0-4102744e6d86	OptionValue-write	OptionValue - spreminjanje	f
00030000-562a-29fe-4fa5-04d07b30858f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-562a-29fe-952e-5ba7f0401003	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-562a-29fe-4944-0e0b7fb6dce2	Oseba-read	Oseba - branje	f
00030000-562a-29fe-0809-0591652b682b	Oseba-write	Oseba - spreminjanje	f
00030000-562a-29fe-9a3b-3ca31c966e06	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-562a-29fe-7184-db5e122a6a1c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-562a-29fe-54df-4a2031885aa5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-562a-29fe-314b-9f316c5a4024	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-562a-29fe-43be-90140dd688dd	Pogodba-read	Pogodba - branje	f
00030000-562a-29fe-f4ad-5b3dd68528e7	Pogodba-write	Pogodba - spreminjanje	f
00030000-562a-29fe-badd-2b0a6fe5f0da	Popa-read	Popa - branje	f
00030000-562a-29fe-915e-fce2e9c48eb7	Popa-write	Popa - spreminjanje	f
00030000-562a-29fe-d27f-5e39d770d223	Posta-read	Posta - branje	f
00030000-562a-29fe-5bae-5efc94f15aee	Posta-write	Posta - spreminjanje	f
00030000-562a-29fe-f53d-27f274d46019	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-562a-29fe-276e-be3314b26279	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-562a-29fe-22a2-21589748aa1c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-562a-29fe-9efe-9c6c8cbcd339	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-562a-29fe-7fc5-51dd7f9219aa	PostniNaslov-read	PostniNaslov - branje	f
00030000-562a-29fe-4fa3-be8f79e96394	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-562a-29fe-70be-68050aeb1939	Predstava-read	Predstava - branje	f
00030000-562a-29fe-13e4-92d2e8116fa3	Predstava-write	Predstava - spreminjanje	f
00030000-562a-29fe-881f-344dd904d307	Praznik-read	Praznik - branje	f
00030000-562a-29fe-04d2-a0a1897751fa	Praznik-write	Praznik - spreminjanje	f
00030000-562a-29fe-e8ca-4516c5e3f55b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-562a-29fe-078c-1d9b9c34022c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-562a-29fe-b4ee-082fe410799c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-562a-29fe-f771-fffc5891bdf3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-562a-29fe-be43-3f321bddcf63	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-562a-29fe-f7cd-3f37f4d356b2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-562a-29fe-660c-d0cebe0b1a67	ProgramDela-read	ProgramDela - branje	f
00030000-562a-29fe-d00e-30fd7e5444e4	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-562a-29fe-2ab0-472f45311bfe	ProgramFestival-read	ProgramFestival - branje	f
00030000-562a-29fe-1557-2c7656efa05e	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-562a-29fe-cb88-6716fee8d216	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-562a-29fe-4df2-55f313370721	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-562a-29fe-6484-026f58162366	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-562a-29fe-eee3-5336eb92a335	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-562a-29fe-6f90-db16c52697d0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-562a-29fe-9e80-47466fcec505	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-562a-29fe-c862-c2a8d36142c3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-562a-29fe-f05f-1d7eeef34334	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-562a-29fe-09f0-8442a252b45b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-562a-29fe-bb78-1078f0042bd4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-562a-29fe-9e27-a0673c85ed90	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-562a-29fe-96be-a819f0d0f5fb	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-562a-29fe-683d-b94c01e21d1d	ProgramRazno-read	ProgramRazno - branje	f
00030000-562a-29fe-8f01-0b45d59a0229	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-562a-29fe-5471-ae2f6ad53891	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-562a-29fe-02ae-6f5280075ff8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-562a-29fe-4ef3-1a52cfe4a4a6	Prostor-read	Prostor - branje	f
00030000-562a-29fe-7002-ca088d63d21f	Prostor-write	Prostor - spreminjanje	f
00030000-562a-29fe-e05e-a9a3b345a654	Racun-read	Racun - branje	f
00030000-562a-29fe-7fa1-53a814c53910	Racun-write	Racun - spreminjanje	f
00030000-562a-29fe-e68e-39c524995560	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-562a-29fe-1ab2-126f0e2520c0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-562a-29fe-1c12-1c494c16b7b6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-562a-29fe-190e-5fe26ac90507	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-562a-29fe-f244-288bda385c94	Rekvizit-read	Rekvizit - branje	f
00030000-562a-29fe-2e65-ef3f8c6bb49f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-562a-29fe-d262-f346f569728f	Revizija-read	Revizija - branje	f
00030000-562a-29fe-e8fd-91a138482767	Revizija-write	Revizija - spreminjanje	f
00030000-562a-29fe-d884-19ea111dfd99	Rezervacija-read	Rezervacija - branje	f
00030000-562a-29fe-d74a-06fa12934dec	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-562a-29fe-703f-2dce03b3d597	SedezniRed-read	SedezniRed - branje	f
00030000-562a-29fe-252a-c85f72be6809	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-562a-29fe-9b43-e64565bddc57	Sedez-read	Sedez - branje	f
00030000-562a-29fe-5e15-101d79d87461	Sedez-write	Sedez - spreminjanje	f
00030000-562a-29fe-42e7-9c3e298d690f	Sezona-read	Sezona - branje	f
00030000-562a-29fe-7e87-2382ff06ac46	Sezona-write	Sezona - spreminjanje	f
00030000-562a-29fe-f9b8-e16232517034	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-562a-29fe-e728-960ba8dd87de	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-562a-29fe-0bae-20f14d182f97	Stevilcenje-read	Stevilcenje - branje	f
00030000-562a-29fe-cce2-9c05d21fc76c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-562a-29fe-6e45-a5f34a4ba520	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-562a-29fe-bfab-e67df18cdee2	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-562a-29fe-bb1f-1f3853297207	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-562a-29fe-178d-1a64f83d3e4e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-562a-29fe-04da-48b3d77e3492	Telefonska-read	Telefonska - branje	f
00030000-562a-29fe-ace7-9b4f7b878534	Telefonska-write	Telefonska - spreminjanje	f
00030000-562a-29fe-7724-ba5738a44ddd	TerminStoritve-read	TerminStoritve - branje	f
00030000-562a-29fe-03f2-9119528329e8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-562a-29fe-45d7-6ab2dbc02856	TipFunkcije-read	TipFunkcije - branje	f
00030000-562a-29fe-331b-a680ba7c1935	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-562a-29fe-a39a-70370f21c8f3	TipPopa-read	TipPopa - branje	f
00030000-562a-29fe-7898-54477cec45e3	TipPopa-write	TipPopa - spreminjanje	f
00030000-562a-29fe-9f65-ba7794fbbccf	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-562a-29fe-3a4e-1897a896bceb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-562a-29fe-6b34-4499b1fa2ed4	TipVaje-read	TipVaje - branje	f
00030000-562a-29fe-c803-6857b6af0fa1	TipVaje-write	TipVaje - spreminjanje	f
00030000-562a-29fe-85bb-652ce63bb2ce	Trr-read	Trr - branje	f
00030000-562a-29fe-3587-bf718b05a528	Trr-write	Trr - spreminjanje	f
00030000-562a-29fe-2613-e74d7275a907	Uprizoritev-read	Uprizoritev - branje	f
00030000-562a-29fe-6d38-f9a0020dd818	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-562a-29fe-08a8-da1dedab7dd5	Vaja-read	Vaja - branje	f
00030000-562a-29fe-7069-41bc87e5315a	Vaja-write	Vaja - spreminjanje	f
00030000-562a-29fe-cc08-8b4c71ade105	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-562a-29fe-e9db-3995ac6e5fdc	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-562a-29fe-4461-f464760a9aa1	VrstaStroska-read	VrstaStroska - branje	f
00030000-562a-29fe-aa0a-39b1d53b2c97	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-562a-29fe-0695-dd19ded046ec	Zaposlitev-read	Zaposlitev - branje	f
00030000-562a-29fe-739f-1b28d72d178b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-562a-29fe-35c7-e1ba0496bcdc	Zasedenost-read	Zasedenost - branje	f
00030000-562a-29fe-6eb5-258a4f59ac64	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-562a-29fe-bdd0-a423616e7174	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-562a-29fe-44fd-0c2dd1b600bd	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-562a-29fe-e7ec-65b5fa43ed88	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-562a-29fe-8e80-f2fb42189ab8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-562a-29fe-2a7e-2eb88f417eb9	Job-read	Branje opravil - samo zase - branje	f
00030000-562a-29fe-c5d0-6e0d65ccd9d8	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-562a-29fe-ed60-42cf60da352a	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-562a-29fe-3333-b5118511104f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-562a-29fe-cd31-eb5c14c34506	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-562a-29fe-d3a1-b989b5996ca7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-562a-29fe-f944-6c4e71a131e7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-562a-29fe-c47d-14bfeb66f7c6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-562a-29fe-10c4-620598711017	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-562a-29fe-3bcc-4bbbb35fb784	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-562a-29fe-c52c-58750f237a98	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-562a-29fe-173b-c1a3adaedfcb	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-562a-29fe-3922-19814aaf8dba	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-562a-29fe-e6cf-c451554dd1f8	Datoteka-write	Datoteka - spreminjanje	f
00030000-562a-29fe-cf8c-5cd4a3886380	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3057 (class 0 OID 23262554)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-562a-29fe-0c40-be5a0e686c36	00030000-562a-29fe-80b6-ab93a9f1495a
00020000-562a-29fe-ef5d-2add926e4b06	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-8638-f1c6f37eff84
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-31ab-529fc42c45fc
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-6c1f-ed4bb2431220
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-c79e-024f6ae0ed5f
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-6fad-5d83b6335354
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-1a94-a033fdb9712a
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-9f49-102b11e6842d
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-6086-ff80ee6d9d9c
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-00d4-4ce51c214364
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-0567-ec40dc644b34
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-9469-00e6a1f59cc5
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-b5db-d649b9c3092a
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-da2a-af50428f80e9
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-bfeb-8a886fcd481b
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-313b-01df8f37e9d0
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-21a9-92b60f5c1667
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-da95-a61e17ff21d8
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-a04b-0d78fc89766c
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-039a-bb94f38ecd22
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-4944-0e0b7fb6dce2
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-0809-0591652b682b
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-badd-2b0a6fe5f0da
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-915e-fce2e9c48eb7
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-d27f-5e39d770d223
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-5bae-5efc94f15aee
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-7fc5-51dd7f9219aa
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-4fa3-be8f79e96394
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-70be-68050aeb1939
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-13e4-92d2e8116fa3
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-be43-3f321bddcf63
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-f7cd-3f37f4d356b2
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-4ef3-1a52cfe4a4a6
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-7002-ca088d63d21f
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-1c12-1c494c16b7b6
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-190e-5fe26ac90507
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-f244-288bda385c94
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-2e65-ef3f8c6bb49f
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-42e7-9c3e298d690f
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-7e87-2382ff06ac46
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-45d7-6ab2dbc02856
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-2613-e74d7275a907
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-6d38-f9a0020dd818
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-08a8-da1dedab7dd5
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-7069-41bc87e5315a
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-35c7-e1ba0496bcdc
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-6eb5-258a4f59ac64
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-bdd0-a423616e7174
00020000-562a-29fe-6604-e3ddd216bc6f	00030000-562a-29fe-e7ec-65b5fa43ed88
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-8638-f1c6f37eff84
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-6fad-5d83b6335354
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-1a94-a033fdb9712a
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-b5db-d649b9c3092a
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-bfeb-8a886fcd481b
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-21a9-92b60f5c1667
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-da95-a61e17ff21d8
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-a04b-0d78fc89766c
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-039a-bb94f38ecd22
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-4944-0e0b7fb6dce2
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-0809-0591652b682b
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-badd-2b0a6fe5f0da
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-d27f-5e39d770d223
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-7fc5-51dd7f9219aa
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-4fa3-be8f79e96394
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-70be-68050aeb1939
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-4ef3-1a52cfe4a4a6
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-1c12-1c494c16b7b6
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-f244-288bda385c94
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-42e7-9c3e298d690f
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-04da-48b3d77e3492
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-ace7-9b4f7b878534
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-85bb-652ce63bb2ce
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-3587-bf718b05a528
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-0695-dd19ded046ec
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-739f-1b28d72d178b
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-bdd0-a423616e7174
00020000-562a-29fe-5bdc-687b2e8911c3	00030000-562a-29fe-e7ec-65b5fa43ed88
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-8638-f1c6f37eff84
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-6c1f-ed4bb2431220
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-6fad-5d83b6335354
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-64bd-42883711bc17
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-967a-0b08385954bb
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-f570-2d242395173a
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-1a94-a033fdb9712a
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-0567-ec40dc644b34
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-b5db-d649b9c3092a
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-bfeb-8a886fcd481b
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-21a9-92b60f5c1667
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-a04b-0d78fc89766c
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-039a-bb94f38ecd22
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-4944-0e0b7fb6dce2
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-badd-2b0a6fe5f0da
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-d27f-5e39d770d223
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-70be-68050aeb1939
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-be43-3f321bddcf63
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-4ef3-1a52cfe4a4a6
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-1c12-1c494c16b7b6
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-f244-288bda385c94
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-42e7-9c3e298d690f
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-45d7-6ab2dbc02856
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-08a8-da1dedab7dd5
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-35c7-e1ba0496bcdc
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-bdd0-a423616e7174
00020000-562a-29ff-2402-21f1a6decf1e	00030000-562a-29fe-e7ec-65b5fa43ed88
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-8638-f1c6f37eff84
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-31ab-529fc42c45fc
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-c79e-024f6ae0ed5f
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-6fad-5d83b6335354
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-1a94-a033fdb9712a
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-b5db-d649b9c3092a
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-bfeb-8a886fcd481b
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-a04b-0d78fc89766c
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-039a-bb94f38ecd22
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-badd-2b0a6fe5f0da
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-d27f-5e39d770d223
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-70be-68050aeb1939
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-4ef3-1a52cfe4a4a6
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-1c12-1c494c16b7b6
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-f244-288bda385c94
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-42e7-9c3e298d690f
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-45d7-6ab2dbc02856
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-bdd0-a423616e7174
00020000-562a-29ff-0452-4fd87dd4bb29	00030000-562a-29fe-e7ec-65b5fa43ed88
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-8638-f1c6f37eff84
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-6fad-5d83b6335354
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-1a94-a033fdb9712a
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-b5db-d649b9c3092a
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-bfeb-8a886fcd481b
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-a04b-0d78fc89766c
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-039a-bb94f38ecd22
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-badd-2b0a6fe5f0da
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-d27f-5e39d770d223
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-70be-68050aeb1939
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-4ef3-1a52cfe4a4a6
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-1c12-1c494c16b7b6
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-f244-288bda385c94
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-42e7-9c3e298d690f
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-7724-ba5738a44ddd
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-2c83-170a23b61652
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-45d7-6ab2dbc02856
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-bdd0-a423616e7174
00020000-562a-29ff-72bb-fe5d469dabaf	00030000-562a-29fe-e7ec-65b5fa43ed88
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-3d9b-10bfd5a2ad46
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-80b6-ab93a9f1495a
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-8638-f1c6f37eff84
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-31ab-529fc42c45fc
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6c1f-ed4bb2431220
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-c79e-024f6ae0ed5f
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6fad-5d83b6335354
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-64bd-42883711bc17
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-a725-b08e437c350d
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-82d5-322f42ab4c48
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-967a-0b08385954bb
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-8b26-7daa4bc8c436
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f570-2d242395173a
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-88ba-3e9a31ab71a6
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-1a94-a033fdb9712a
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9f49-102b11e6842d
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6086-ff80ee6d9d9c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-8133-e1abdb814901
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-1ada-e50012511f91
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-d081-cdbfff9c627d
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-00d4-4ce51c214364
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-5c9c-16af50d3189e
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f3a6-55defe1ce3cb
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-0567-ec40dc644b34
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9469-00e6a1f59cc5
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-b5db-d649b9c3092a
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-da2a-af50428f80e9
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-bfeb-8a886fcd481b
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-313b-01df8f37e9d0
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-21a9-92b60f5c1667
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-da95-a61e17ff21d8
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f462-abc588847bce
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-af8b-8cc483c5cb3b
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-291b-941b11399735
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-3239-9fae42ba3b39
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-a04b-0d78fc89766c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-039a-bb94f38ecd22
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-b6b0-4102744e6d86
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-66c1-6fe6ec82eec5
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-4fa5-04d07b30858f
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-952e-5ba7f0401003
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-4944-0e0b7fb6dce2
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-39fb-4a51a57fd40d
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-0809-0591652b682b
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9a3b-3ca31c966e06
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7184-db5e122a6a1c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-54df-4a2031885aa5
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-314b-9f316c5a4024
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-43be-90140dd688dd
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f4ad-5b3dd68528e7
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-badd-2b0a6fe5f0da
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-915e-fce2e9c48eb7
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-d27f-5e39d770d223
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f53d-27f274d46019
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-276e-be3314b26279
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-22a2-21589748aa1c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9efe-9c6c8cbcd339
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-5bae-5efc94f15aee
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7fc5-51dd7f9219aa
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-4fa3-be8f79e96394
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-881f-344dd904d307
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-04d2-a0a1897751fa
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-70be-68050aeb1939
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-13e4-92d2e8116fa3
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e8ca-4516c5e3f55b
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-078c-1d9b9c34022c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-b4ee-082fe410799c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f771-fffc5891bdf3
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-be43-3f321bddcf63
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f7cd-3f37f4d356b2
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-a9a5-804f3936dcfb
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-660c-d0cebe0b1a67
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-790d-ad44671ec9e6
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-d00e-30fd7e5444e4
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-2ab0-472f45311bfe
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-1557-2c7656efa05e
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-cb88-6716fee8d216
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-4df2-55f313370721
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6484-026f58162366
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-eee3-5336eb92a335
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6f90-db16c52697d0
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9e80-47466fcec505
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-c862-c2a8d36142c3
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f05f-1d7eeef34334
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-09f0-8442a252b45b
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-bb78-1078f0042bd4
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9e27-a0673c85ed90
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-96be-a819f0d0f5fb
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-683d-b94c01e21d1d
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-8f01-0b45d59a0229
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-5471-ae2f6ad53891
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-02ae-6f5280075ff8
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-4ef3-1a52cfe4a4a6
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7002-ca088d63d21f
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e05e-a9a3b345a654
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7fa1-53a814c53910
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e68e-39c524995560
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-1ab2-126f0e2520c0
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-1c12-1c494c16b7b6
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-190e-5fe26ac90507
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f244-288bda385c94
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-2e65-ef3f8c6bb49f
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-d262-f346f569728f
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e8fd-91a138482767
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-d884-19ea111dfd99
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-d74a-06fa12934dec
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-703f-2dce03b3d597
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-252a-c85f72be6809
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9b43-e64565bddc57
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-5e15-101d79d87461
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-42e7-9c3e298d690f
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7e87-2382ff06ac46
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-f9b8-e16232517034
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e728-960ba8dd87de
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-0bae-20f14d182f97
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6e45-a5f34a4ba520
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-bfab-e67df18cdee2
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-cce2-9c05d21fc76c
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-bb1f-1f3853297207
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-178d-1a64f83d3e4e
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-04da-48b3d77e3492
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-ace7-9b4f7b878534
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7724-ba5738a44ddd
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-2c83-170a23b61652
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-03f2-9119528329e8
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-45d7-6ab2dbc02856
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-331b-a680ba7c1935
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-a39a-70370f21c8f3
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7898-54477cec45e3
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-9f65-ba7794fbbccf
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-3a4e-1897a896bceb
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6b34-4499b1fa2ed4
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-c803-6857b6af0fa1
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-85bb-652ce63bb2ce
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-3587-bf718b05a528
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-2613-e74d7275a907
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6d38-f9a0020dd818
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-08a8-da1dedab7dd5
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-7069-41bc87e5315a
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-cc08-8b4c71ade105
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e9db-3995ac6e5fdc
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-4461-f464760a9aa1
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-aa0a-39b1d53b2c97
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-0695-dd19ded046ec
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-739f-1b28d72d178b
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-35c7-e1ba0496bcdc
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-6eb5-258a4f59ac64
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-bdd0-a423616e7174
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-44fd-0c2dd1b600bd
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-e7ec-65b5fa43ed88
00020000-562a-2a00-ce94-7c155c235cdc	00030000-562a-29fe-8e80-f2fb42189ab8
\.


--
-- TOC entry 3091 (class 0 OID 23262929)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23262963)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23263100)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-562a-2a00-01bd-8855e5aafa68	00090000-562a-2a00-2e9b-f17d3e5f1e60	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-562a-2a00-73a6-8d0ce5603ae8	00090000-562a-2a00-eef3-1f1f67374bb9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-562a-2a00-821c-1a6649e016dc	00090000-562a-2a00-bd34-c262c2fa51fa	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-562a-2a00-c8c8-5be59b5dacc3	00090000-562a-2a00-272b-dd8cd8af6a32	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3063 (class 0 OID 23262627)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-562a-2a00-f68a-c3c5b61d995f	\N	00040000-562a-29fe-0a4a-44d74fa7d754	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-f493-f56e8178a5b7	\N	00040000-562a-29fe-0a4a-44d74fa7d754	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-562a-2a00-2793-6ce1fd6496aa	\N	00040000-562a-29fe-0a4a-44d74fa7d754	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-ab71-8d79a24522de	\N	00040000-562a-29fe-0a4a-44d74fa7d754	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-1d30-1737513dba1e	\N	00040000-562a-29fe-0a4a-44d74fa7d754	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-ac83-586ca16dedf3	\N	00040000-562a-29fe-1771-d79f254f54b8	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-1c51-d2523b0023f4	\N	00040000-562a-29fe-1926-7c84232d71f1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-7f16-7a680179bd54	\N	00040000-562a-29fe-b35c-fa7bee2aa1ba	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a00-5912-c65c439099f6	\N	00040000-562a-29fe-114c-58f1cabd8060	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-2a02-9fec-3ad1cd1903f6	\N	00040000-562a-29fe-0a4a-44d74fa7d754	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3066 (class 0 OID 23262672)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-562a-29fe-e034-6ce30f44d8b6	8341	Adlešiči
00050000-562a-29fe-15f0-b1d8549704d4	5270	Ajdovščina
00050000-562a-29fe-f332-b8534d530c11	6280	Ankaran/Ancarano
00050000-562a-29fe-8328-71f9b73a216a	9253	Apače
00050000-562a-29fe-f23c-10369704e6dc	8253	Artiče
00050000-562a-29fe-1ccc-5e4806b57d51	4275	Begunje na Gorenjskem
00050000-562a-29fe-18bd-f688b0d96330	1382	Begunje pri Cerknici
00050000-562a-29fe-e2bd-b6938c7da4e6	9231	Beltinci
00050000-562a-29fe-a45c-668c9c7e4926	2234	Benedikt
00050000-562a-29fe-0b51-b04a36198379	2345	Bistrica ob Dravi
00050000-562a-29fe-25f0-dc9807fa4e5b	3256	Bistrica ob Sotli
00050000-562a-29fe-103a-d5008cb89761	8259	Bizeljsko
00050000-562a-29fe-ba60-0837222bf67e	1223	Blagovica
00050000-562a-29fe-2ee3-36ba04e1d75a	8283	Blanca
00050000-562a-29fe-3a96-c529dcfceff2	4260	Bled
00050000-562a-29fe-9419-220e06f9dadc	4273	Blejska Dobrava
00050000-562a-29fe-6302-aadac99952bc	9265	Bodonci
00050000-562a-29fe-467c-e4ebfac3d8fc	9222	Bogojina
00050000-562a-29fe-cea4-cfe3ed782798	4263	Bohinjska Bela
00050000-562a-29fe-89f1-502404d03fff	4264	Bohinjska Bistrica
00050000-562a-29fe-766f-f4a4d0adc3dd	4265	Bohinjsko jezero
00050000-562a-29fe-1e65-63fb1bbe31fd	1353	Borovnica
00050000-562a-29fe-d049-d6009b6f515a	8294	Boštanj
00050000-562a-29fe-99ae-b4b879ab33a6	5230	Bovec
00050000-562a-29fe-ba23-9ff598e916ea	5295	Branik
00050000-562a-29fe-6acb-7db8dd61cff8	3314	Braslovče
00050000-562a-29fe-100d-4a39ccb96180	5223	Breginj
00050000-562a-29fe-832e-d9b677c42119	8280	Brestanica
00050000-562a-29fe-e5b7-3b151c04ab51	2354	Bresternica
00050000-562a-29fe-ac23-adb2840adcae	4243	Brezje
00050000-562a-29fe-f669-9044c2b93e49	1351	Brezovica pri Ljubljani
00050000-562a-29fe-806b-7e4124c13692	8250	Brežice
00050000-562a-29fe-0458-f4175bcd774f	4210	Brnik - Aerodrom
00050000-562a-29fe-8b56-468577756633	8321	Brusnice
00050000-562a-29fe-d8b5-8fe8f83eecb6	3255	Buče
00050000-562a-29fe-4baf-a284c7de778b	8276	Bučka 
00050000-562a-29fe-3f6d-3e1157092292	9261	Cankova
00050000-562a-29fe-f0ac-433a946085e3	3000	Celje 
00050000-562a-29fe-8db4-59471a2fc846	3001	Celje - poštni predali
00050000-562a-29fe-c1c4-059f862ad1dd	4207	Cerklje na Gorenjskem
00050000-562a-29fe-333f-0f6852230730	8263	Cerklje ob Krki
00050000-562a-29fe-1e32-c7e5ce8312be	1380	Cerknica
00050000-562a-29fe-4769-fddfc3d5743f	5282	Cerkno
00050000-562a-29fe-3695-f3d2e93a0f38	2236	Cerkvenjak
00050000-562a-29fe-3e6b-e5f5e0514750	2215	Ceršak
00050000-562a-29fe-1cee-90ab3a18126c	2326	Cirkovce
00050000-562a-29fe-6e2d-1401d207cf15	2282	Cirkulane
00050000-562a-29fe-f272-03e0eefe5c60	5273	Col
00050000-562a-29fe-80fb-c24c2d46a899	8251	Čatež ob Savi
00050000-562a-29fe-73fe-ed6b614a0672	1413	Čemšenik
00050000-562a-29fe-ecfa-9634eb9055d2	5253	Čepovan
00050000-562a-29fe-a310-28049551cebc	9232	Črenšovci
00050000-562a-29fe-a199-776690484066	2393	Črna na Koroškem
00050000-562a-29fe-194d-1cf8495f83d8	6275	Črni Kal
00050000-562a-29fe-512a-5ea1cb6b0e31	5274	Črni Vrh nad Idrijo
00050000-562a-29fe-f253-eaf44aa7e75e	5262	Črniče
00050000-562a-29fe-ad8e-ce8631342531	8340	Črnomelj
00050000-562a-29fe-e729-c6db79330059	6271	Dekani
00050000-562a-29fe-1baa-e1624667089a	5210	Deskle
00050000-562a-29fe-26a4-7e20cdadcd89	2253	Destrnik
00050000-562a-29fe-e972-f20c38de62b5	6215	Divača
00050000-562a-29fe-43e6-d4a43c974219	1233	Dob
00050000-562a-29fe-c4c4-2432d6e7c2e9	3224	Dobje pri Planini
00050000-562a-29fe-72ac-c25fd5210499	8257	Dobova
00050000-562a-29fe-ecb4-d667a70643db	1423	Dobovec
00050000-562a-29fe-bec8-49dc336f2866	5263	Dobravlje
00050000-562a-29fe-2265-334d373d096d	3204	Dobrna
00050000-562a-29fe-8486-660d0f11cb9b	8211	Dobrnič
00050000-562a-29fe-e27a-6a8a54fdbc42	1356	Dobrova
00050000-562a-29fe-c998-16af30567c5f	9223	Dobrovnik/Dobronak 
00050000-562a-29fe-4511-f45ad44e88b4	5212	Dobrovo v Brdih
00050000-562a-29fe-c81c-7272bdad8632	1431	Dol pri Hrastniku
00050000-562a-29fe-56fd-e866aaf1c4d7	1262	Dol pri Ljubljani
00050000-562a-29fe-eca9-df5db7077e73	1273	Dole pri Litiji
00050000-562a-29fe-18e5-816defe92931	1331	Dolenja vas
00050000-562a-29fe-62f2-94a7bda5a849	8350	Dolenjske Toplice
00050000-562a-29fe-b668-a160260e41a9	1230	Domžale
00050000-562a-29fe-198f-93c458279b4b	2252	Dornava
00050000-562a-29fe-80f8-96ff0c01d8a0	5294	Dornberk
00050000-562a-29fe-f8d0-f3f698ef51e9	1319	Draga
00050000-562a-29fe-08af-c24ea79c337e	8343	Dragatuš
00050000-562a-29fe-0545-1684c79f9363	3222	Dramlje
00050000-562a-29fe-d819-e5c58385b0c5	2370	Dravograd
00050000-562a-29fe-3abc-dba5b8510c3c	4203	Duplje
00050000-562a-29fe-568a-93b0335285eb	6221	Dutovlje
00050000-562a-29fe-f6c8-961d8b4f90c9	8361	Dvor
00050000-562a-29fe-072f-b5746223830b	2343	Fala
00050000-562a-29fe-c213-840f071abed6	9208	Fokovci
00050000-562a-29fe-e153-22e06790d8f5	2313	Fram
00050000-562a-29fe-171d-d57271bf7045	3213	Frankolovo
00050000-562a-29fe-6225-8ec65f79aa6a	1274	Gabrovka
00050000-562a-29fe-dfa0-9bded18d8942	8254	Globoko
00050000-562a-29fe-18b9-66d5d113c488	5275	Godovič
00050000-562a-29fe-23bd-2c13a3733ea0	4204	Golnik
00050000-562a-29fe-f481-e7bb36590d99	3303	Gomilsko
00050000-562a-29fe-d868-6b95fa2a92c8	4224	Gorenja vas
00050000-562a-29fe-1f06-15277e9f2b7b	3263	Gorica pri Slivnici
00050000-562a-29fe-d10d-bc30eaf4a3c8	2272	Gorišnica
00050000-562a-29fe-0fc8-bce5570960c8	9250	Gornja Radgona
00050000-562a-29fe-3af5-36134d0da7a1	3342	Gornji Grad
00050000-562a-29fe-637a-91e573c3e765	4282	Gozd Martuljek
00050000-562a-29fe-f925-b9444f421381	6272	Gračišče
00050000-562a-29fe-3456-4872638a6452	9264	Grad
00050000-562a-29fe-03e5-7b002bee16b5	8332	Gradac
00050000-562a-29fe-f440-3d304f26cef5	1384	Grahovo
00050000-562a-29fe-2e29-2e96c7ab0a51	5242	Grahovo ob Bači
00050000-562a-29fe-a6f8-f333e3fe442f	5251	Grgar
00050000-562a-29fe-281f-161f4dedb17c	3302	Griže
00050000-562a-29fe-8354-87fa657d2a3f	3231	Grobelno
00050000-562a-29fe-1f1d-12d06561a0b6	1290	Grosuplje
00050000-562a-29fe-d167-e153e0a5cfe2	2288	Hajdina
00050000-562a-29fe-0cf8-254913c11f17	8362	Hinje
00050000-562a-29fe-183d-a755c292cc26	2311	Hoče
00050000-562a-29fe-6749-4acf1b5e0209	9205	Hodoš/Hodos
00050000-562a-29fe-6f53-f5036eb4610a	1354	Horjul
00050000-562a-29fe-31a6-1573ad37aaf0	1372	Hotedršica
00050000-562a-29fe-6692-76a2b80b9df2	1430	Hrastnik
00050000-562a-29fe-0db3-763307638650	6225	Hruševje
00050000-562a-29fe-2998-0e5c42b2eac8	4276	Hrušica
00050000-562a-29fe-c398-940455262779	5280	Idrija
00050000-562a-29fe-7343-97e2c32ecf06	1292	Ig
00050000-562a-29fe-8ab0-aa500b063c78	6250	Ilirska Bistrica
00050000-562a-29fe-356c-75de25747eef	6251	Ilirska Bistrica-Trnovo
00050000-562a-29fe-0328-84aff79af3a2	1295	Ivančna Gorica
00050000-562a-29fe-3128-b99edbfff57d	2259	Ivanjkovci
00050000-562a-29fe-7d3e-3f0cd22d34bd	1411	Izlake
00050000-562a-29fe-b23d-49934cd933ab	6310	Izola/Isola
00050000-562a-29fe-aeaa-80816ea58c99	2222	Jakobski Dol
00050000-562a-29fe-fdb0-eb15ed0b02c8	2221	Jarenina
00050000-562a-29fe-8ee0-e7349aa4f984	6254	Jelšane
00050000-562a-29fe-2efb-9e816498d2d4	4270	Jesenice
00050000-562a-29fe-42e9-a8176c12ef32	8261	Jesenice na Dolenjskem
00050000-562a-29fe-19a9-b789333a00ab	3273	Jurklošter
00050000-562a-29fe-ac18-7c3f15428ebc	2223	Jurovski Dol
00050000-562a-29fe-2bc3-0144990bf4f8	2256	Juršinci
00050000-562a-29fe-db59-5dcb8826303a	5214	Kal nad Kanalom
00050000-562a-29fe-65c0-779cf47f1cc8	3233	Kalobje
00050000-562a-29fe-7baa-a29ec1b3e066	4246	Kamna Gorica
00050000-562a-29fe-8a83-247409adb365	2351	Kamnica
00050000-562a-29fe-39c3-384ff87f7450	1241	Kamnik
00050000-562a-29fe-498c-ab82b0c7af41	5213	Kanal
00050000-562a-29fe-45c1-b7b40df956e8	8258	Kapele
00050000-562a-29fe-7088-bcbe85e5c35e	2362	Kapla
00050000-562a-29fe-e21f-2b0988c4e6d5	2325	Kidričevo
00050000-562a-29fe-ab11-c431d1cf20c6	1412	Kisovec
00050000-562a-29fe-a6b9-c3d7fa7378fb	6253	Knežak
00050000-562a-29fe-2813-575c858db973	5222	Kobarid
00050000-562a-29fe-cc78-36ba307e6615	9227	Kobilje
00050000-562a-29fe-5b69-bb5e68c1fccc	1330	Kočevje
00050000-562a-29fe-d476-4251ce252f49	1338	Kočevska Reka
00050000-562a-29fe-df39-8b17efd61c0a	2276	Kog
00050000-562a-29fe-e59a-2d55383e1afc	5211	Kojsko
00050000-562a-29fe-fe4d-d38a608ae324	6223	Komen
00050000-562a-29fe-8a86-4025ea7de91e	1218	Komenda
00050000-562a-29fe-87d0-1cd97f9bbfd8	6000	Koper/Capodistria 
00050000-562a-29fe-17d3-0910a48f0b40	6001	Koper/Capodistria - poštni predali
00050000-562a-29fe-23fe-37b85493d3cb	8282	Koprivnica
00050000-562a-29fe-7068-f221e2c35388	5296	Kostanjevica na Krasu
00050000-562a-29fe-b1a9-aad17417a664	8311	Kostanjevica na Krki
00050000-562a-29fe-1550-c7c326a8fc51	1336	Kostel
00050000-562a-29fe-2211-ec41ae5d7a0a	6256	Košana
00050000-562a-29fe-f410-a7a659bfddb6	2394	Kotlje
00050000-562a-29fe-ad18-0fa8bb3fdea0	6240	Kozina
00050000-562a-29fe-a8c4-bb380af3f2d8	3260	Kozje
00050000-562a-29fe-9cdd-1766f4ee82cb	4000	Kranj 
00050000-562a-29fe-12eb-402dba8b1830	4001	Kranj - poštni predali
00050000-562a-29fe-c253-cd1f39c0a3d0	4280	Kranjska Gora
00050000-562a-29fe-b05a-1abbe85ee746	1281	Kresnice
00050000-562a-29fe-6067-24a904f34973	4294	Križe
00050000-562a-29fe-e5dc-6cc7eda3f1bb	9206	Križevci
00050000-562a-29fe-df32-d7e7600b0ddb	9242	Križevci pri Ljutomeru
00050000-562a-29fe-bc02-147b788f336c	1301	Krka
00050000-562a-29fe-1021-b9a2937caf0f	8296	Krmelj
00050000-562a-29fe-1a26-d93fe780b4af	4245	Kropa
00050000-562a-29fe-518b-2f3852a41f97	8262	Krška vas
00050000-562a-29fe-55d4-902fca1ca759	8270	Krško
00050000-562a-29fe-5d78-09d2fef18c7e	9263	Kuzma
00050000-562a-29fe-e4a1-a680a4db8c1a	2318	Laporje
00050000-562a-29fe-a974-17a5cf987b2b	3270	Laško
00050000-562a-29fe-9a4d-89f5737718f3	1219	Laze v Tuhinju
00050000-562a-29fe-3092-b1d625a9682d	2230	Lenart v Slovenskih goricah
00050000-562a-29fe-94de-0f061af5268f	9220	Lendava/Lendva
00050000-562a-29fe-67f0-1baf111456e5	4248	Lesce
00050000-562a-29fe-b32e-ac343c2caeda	3261	Lesično
00050000-562a-29fe-3ece-1effc2ff4977	8273	Leskovec pri Krškem
00050000-562a-29fe-42a9-b5a19d6e17e6	2372	Libeliče
00050000-562a-29fe-39b8-b562181a66a3	2341	Limbuš
00050000-562a-29fe-47ac-b0f7293ae4f8	1270	Litija
00050000-562a-29fe-2c42-16b2f016a08a	3202	Ljubečna
00050000-562a-29fe-9f5e-898fc792e53b	1000	Ljubljana 
00050000-562a-29fe-f4f0-73a1e876c07f	1001	Ljubljana - poštni predali
00050000-562a-29fe-2ff1-dc86dae69bf1	1231	Ljubljana - Črnuče
00050000-562a-29fe-0511-aba467825f09	1261	Ljubljana - Dobrunje
00050000-562a-29fe-666b-6b8bf6736fd0	1260	Ljubljana - Polje
00050000-562a-29fe-ba20-c2b77baea068	1210	Ljubljana - Šentvid
00050000-562a-29fe-771e-25eaaa769fbf	1211	Ljubljana - Šmartno
00050000-562a-29fe-2467-6dcd2bfee935	3333	Ljubno ob Savinji
00050000-562a-29fe-78cb-649e39246faf	9240	Ljutomer
00050000-562a-29fe-41be-fe6b2ffdb99d	3215	Loče
00050000-562a-29fe-4ff8-31bb32804e89	5231	Log pod Mangartom
00050000-562a-29fe-d15e-47c418c7f4ab	1358	Log pri Brezovici
00050000-562a-29fe-0d97-4a8fdc438055	1370	Logatec
00050000-562a-29fe-4533-7ad280d46b1f	1371	Logatec
00050000-562a-29fe-f846-a3a6305aea25	1434	Loka pri Zidanem Mostu
00050000-562a-29fe-04a6-d9120623a672	3223	Loka pri Žusmu
00050000-562a-29fe-05c1-fa3e3731208c	6219	Lokev
00050000-562a-29fe-bd12-b762a2ea0634	1318	Loški Potok
00050000-562a-29fe-32e0-9fb4c4592941	2324	Lovrenc na Dravskem polju
00050000-562a-29fe-0bed-ce0d3b1ff314	2344	Lovrenc na Pohorju
00050000-562a-29fe-453e-9bc32ea1c1a7	3334	Luče
00050000-562a-29fe-9acf-bb0ccdc61bbc	1225	Lukovica
00050000-562a-29fe-1b41-b077916642fa	9202	Mačkovci
00050000-562a-29fe-a2a9-84fe7013c441	2322	Majšperk
00050000-562a-29fe-59cd-bf5a7b88fb76	2321	Makole
00050000-562a-29fe-6931-e5e3f2b5bbaf	9243	Mala Nedelja
00050000-562a-29fe-ff6d-f16e8c6ddc18	2229	Malečnik
00050000-562a-29fe-3dc4-82098c9d9e29	6273	Marezige
00050000-562a-29fe-f7a7-e4803c94c9fe	2000	Maribor 
00050000-562a-29fe-060f-41e16f6f34fa	2001	Maribor - poštni predali
00050000-562a-29fe-c324-beecec1263c7	2206	Marjeta na Dravskem polju
00050000-562a-29fe-ec69-540654764bd7	2281	Markovci
00050000-562a-29fe-8655-08991e40e9a7	9221	Martjanci
00050000-562a-29fe-a4bd-b3a08087020e	6242	Materija
00050000-562a-29fe-2a24-aa0622cd1196	4211	Mavčiče
00050000-562a-29fe-f44f-86f84268f818	1215	Medvode
00050000-562a-29fe-856a-0d6655bc6951	1234	Mengeš
00050000-562a-29fe-9791-4bee29f69cd9	8330	Metlika
00050000-562a-29fe-545e-926ce68947ac	2392	Mežica
00050000-562a-29fe-ec24-27da66b944c6	2204	Miklavž na Dravskem polju
00050000-562a-29fe-bdc8-8c88c023fc25	2275	Miklavž pri Ormožu
00050000-562a-29fe-a2f0-48c3875a31ce	5291	Miren
00050000-562a-29fe-7fcc-5b4c848ac0e4	8233	Mirna
00050000-562a-29fe-15bc-8b54ea599e17	8216	Mirna Peč
00050000-562a-29fe-f08e-dc2a3750c484	2382	Mislinja
00050000-562a-29fe-3699-34d73bf93bbf	4281	Mojstrana
00050000-562a-29fe-2399-4087d695c9d3	8230	Mokronog
00050000-562a-29fe-2b6d-313357ca5b6d	1251	Moravče
00050000-562a-29fe-97c9-dd4d94332c3a	9226	Moravske Toplice
00050000-562a-29fe-384a-6030f468b27b	5216	Most na Soči
00050000-562a-29fe-468c-bf4423e7832a	1221	Motnik
00050000-562a-29fe-a554-5cfbccd08163	3330	Mozirje
00050000-562a-29fe-58b9-9ec6aeb9e975	9000	Murska Sobota 
00050000-562a-29fe-9e9f-3359deb000e2	9001	Murska Sobota - poštni predali
00050000-562a-29fe-7159-7938f6d0cbba	2366	Muta
00050000-562a-29fe-a9f2-5030ac37228f	4202	Naklo
00050000-562a-29fe-0d8c-92fa907c32b3	3331	Nazarje
00050000-562a-29fe-d4e4-e0321df6dc92	1357	Notranje Gorice
00050000-562a-29fe-da47-cbd088488ffe	3203	Nova Cerkev
00050000-562a-29fe-dce3-446dd1a69ec3	5000	Nova Gorica 
00050000-562a-29fe-3758-5ca60a683e87	5001	Nova Gorica - poštni predali
00050000-562a-29fe-f2fc-5f01bc6347c2	1385	Nova vas
00050000-562a-29fe-ee5d-5748f2b305c9	8000	Novo mesto
00050000-562a-29fe-beba-906717a6d835	8001	Novo mesto - poštni predali
00050000-562a-29fe-9d71-ffc3ece03ddb	6243	Obrov
00050000-562a-29fe-191f-26fb05cc38e8	9233	Odranci
00050000-562a-29fe-8646-49cf6fcd2e05	2317	Oplotnica
00050000-562a-29fe-8111-9321c424dee4	2312	Orehova vas
00050000-562a-29fe-2646-b7e174896d3d	2270	Ormož
00050000-562a-29fe-ef91-9ff14ee6e7ff	1316	Ortnek
00050000-562a-29fe-3e2e-4a5ef6fd60c4	1337	Osilnica
00050000-562a-29fe-1246-8337061c1550	8222	Otočec
00050000-562a-29fe-2123-36c98e103acf	2361	Ožbalt
00050000-562a-29fe-a75a-518675338c61	2231	Pernica
00050000-562a-29fe-6ecf-576f7fbbcc1f	2211	Pesnica pri Mariboru
00050000-562a-29fe-d5c8-055fbcaccaaa	9203	Petrovci
00050000-562a-29fe-e46c-c4c6baf738d0	3301	Petrovče
00050000-562a-29fe-ff0d-e0e2376b09d8	6330	Piran/Pirano
00050000-562a-29fe-35f7-2f1e8360cd75	8255	Pišece
00050000-562a-29fe-e73e-6d32f9aeff21	6257	Pivka
00050000-562a-29fe-07fb-457105a02fb3	6232	Planina
00050000-562a-29fe-a2f5-0b02a427cbe0	3225	Planina pri Sevnici
00050000-562a-29fe-2649-1c51c64d4c49	6276	Pobegi
00050000-562a-29fe-953e-5111a181eb50	8312	Podbočje
00050000-562a-29fe-f516-e794f20f68b6	5243	Podbrdo
00050000-562a-29fe-2adb-4806ae6fb79c	3254	Podčetrtek
00050000-562a-29fe-eb35-afcfb02e4cc6	2273	Podgorci
00050000-562a-29fe-c0d7-04c0260796aa	6216	Podgorje
00050000-562a-29fe-ec4a-c537ce8778e6	2381	Podgorje pri Slovenj Gradcu
00050000-562a-29fe-eb9a-e64040fa69a6	6244	Podgrad
00050000-562a-29fe-0fb8-9fff01689fab	1414	Podkum
00050000-562a-29fe-9fb1-1b843597042a	2286	Podlehnik
00050000-562a-29fe-4fc1-2f02ed449692	5272	Podnanos
00050000-562a-29fe-7479-bf641445cd52	4244	Podnart
00050000-562a-29fe-4504-95ef34b5e40e	3241	Podplat
00050000-562a-29fe-fc62-534767a67aeb	3257	Podsreda
00050000-562a-29fe-5259-1455dd78bf5e	2363	Podvelka
00050000-562a-29fe-01b9-c5a8a42c5381	2208	Pohorje
00050000-562a-29fe-bccc-247aae684ebe	2257	Polenšak
00050000-562a-29fe-ac38-eee6a2f3ad02	1355	Polhov Gradec
00050000-562a-29fe-0089-195299bcb45e	4223	Poljane nad Škofjo Loko
00050000-562a-29fe-c1df-513e8d8458ff	2319	Poljčane
00050000-562a-29fe-0b80-f51d32b41db8	1272	Polšnik
00050000-562a-29fe-9508-7ce717fdfe3a	3313	Polzela
00050000-562a-29fe-dc84-ecb12a3457dc	3232	Ponikva
00050000-562a-29fe-8e44-500654cbc5f1	6320	Portorož/Portorose
00050000-562a-29fe-2b4f-7d472ed62867	6230	Postojna
00050000-562a-29fe-b962-761b0cdc11c8	2331	Pragersko
00050000-562a-29fe-5c23-4d8e5f0976ae	3312	Prebold
00050000-562a-29fe-c889-7ccb72238e0d	4205	Preddvor
00050000-562a-29fe-a253-6e47a7be4621	6255	Prem
00050000-562a-29fe-6353-0df20210d10f	1352	Preserje
00050000-562a-29fe-7f72-077078ef467a	6258	Prestranek
00050000-562a-29fe-3d30-e2980e3e347d	2391	Prevalje
00050000-562a-29fe-5115-26748b063d75	3262	Prevorje
00050000-562a-29fe-2ee7-70c1c315cbde	1276	Primskovo 
00050000-562a-29fe-be0e-c3882421ed4c	3253	Pristava pri Mestinju
00050000-562a-29fe-fc63-1514d165d2c3	9207	Prosenjakovci/Partosfalva
00050000-562a-29fe-62cd-cb8508114919	5297	Prvačina
00050000-562a-29fe-94a4-f5d1569e0bac	2250	Ptuj
00050000-562a-29fe-b34d-0008816794d1	2323	Ptujska Gora
00050000-562a-29fe-40ee-5f92c120f4e4	9201	Puconci
00050000-562a-29fe-caf4-bd7004ed2a1b	2327	Rače
00050000-562a-29fe-71cc-b9b7a269ff3e	1433	Radeče
00050000-562a-29fe-89b3-be2c724cc6bc	9252	Radenci
00050000-562a-29fe-45f1-4a3048516f7c	2360	Radlje ob Dravi
00050000-562a-29fe-00e7-eb1923a07002	1235	Radomlje
00050000-562a-29fe-8ccc-03be92fecb97	4240	Radovljica
00050000-562a-29fe-0370-37690cd07698	8274	Raka
00050000-562a-29fe-1def-a12ff2d4f2fd	1381	Rakek
00050000-562a-29fe-029a-223f7ec37bee	4283	Rateče - Planica
00050000-562a-29fe-862e-a84ce95f24f3	2390	Ravne na Koroškem
00050000-562a-29fe-1ad7-59af33c20c41	9246	Razkrižje
00050000-562a-29fe-74c8-6a035fc890f2	3332	Rečica ob Savinji
00050000-562a-29fe-4b21-e56b1df41caf	5292	Renče
00050000-562a-29fe-4ad6-9e8fcbd9f485	1310	Ribnica
00050000-562a-29fe-d10a-fbeef2167571	2364	Ribnica na Pohorju
00050000-562a-29fe-384c-35b45bc85804	3272	Rimske Toplice
00050000-562a-29fe-ec68-b938b1db4a49	1314	Rob
00050000-562a-29fe-041a-11128e0966fb	5215	Ročinj
00050000-562a-29fe-03ec-732d037e19d4	3250	Rogaška Slatina
00050000-562a-29fe-801a-5142d89bd6a5	9262	Rogašovci
00050000-562a-29fe-22ed-6a0b9a6cf17e	3252	Rogatec
00050000-562a-29fe-e752-8591e76f71e6	1373	Rovte
00050000-562a-29fe-e85b-c96055fe3cbe	2342	Ruše
00050000-562a-29fe-2bca-a00d10f38c46	1282	Sava
00050000-562a-29fe-5fd6-3d528edb778a	6333	Sečovlje/Sicciole
00050000-562a-29fe-9006-b8711cddeaf4	4227	Selca
00050000-562a-29fe-11cf-f7fda9b9a47b	2352	Selnica ob Dravi
00050000-562a-29fe-60c9-40b138169055	8333	Semič
00050000-562a-29fe-f183-79e104ef64ef	8281	Senovo
00050000-562a-29fe-664c-6fa8ac1bbaa2	6224	Senožeče
00050000-562a-29fe-6c94-9a36652a705a	8290	Sevnica
00050000-562a-29fe-30be-755eb67af4c5	6210	Sežana
00050000-562a-29fe-5672-80a21213ec17	2214	Sladki Vrh
00050000-562a-29fe-c801-f69903f8d119	5283	Slap ob Idrijci
00050000-562a-29fe-4c2c-f1ba575e1e7c	2380	Slovenj Gradec
00050000-562a-29fe-5d04-0fab10c6cd74	2310	Slovenska Bistrica
00050000-562a-29fe-525c-cbce4e71cff6	3210	Slovenske Konjice
00050000-562a-29fe-d381-911d2465c2a2	1216	Smlednik
00050000-562a-29fe-c882-e872bc0deeee	5232	Soča
00050000-562a-29fe-3d79-81d6a5e87b0c	1317	Sodražica
00050000-562a-29fe-0f4a-0f12148e467a	3335	Solčava
00050000-562a-29fe-fafb-c2b06164faed	5250	Solkan
00050000-562a-29fe-a08d-f7cbaa232c27	4229	Sorica
00050000-562a-29fe-6e96-301e7a6711a0	4225	Sovodenj
00050000-562a-29fe-d4f6-581fa114b747	5281	Spodnja Idrija
00050000-562a-29fe-ac2f-9b36b3787d31	2241	Spodnji Duplek
00050000-562a-29fe-19d1-8fd26ac22c0d	9245	Spodnji Ivanjci
00050000-562a-29fe-bc7e-b0aa6a3b1c2a	2277	Središče ob Dravi
00050000-562a-29fe-3898-bd40068b3439	4267	Srednja vas v Bohinju
00050000-562a-29fe-af01-5c22316b807d	8256	Sromlje 
00050000-562a-29fe-7e74-a12ac44d8b15	5224	Srpenica
00050000-562a-29fe-b093-adcd8cd5a549	1242	Stahovica
00050000-562a-29fe-2330-ccc373ef38da	1332	Stara Cerkev
00050000-562a-29fe-3989-bf9bdf7e40ee	8342	Stari trg ob Kolpi
00050000-562a-29fe-259b-4b7d958627cf	1386	Stari trg pri Ložu
00050000-562a-29fe-b832-593f14fe49d3	2205	Starše
00050000-562a-29fe-3352-061f7133b398	2289	Stoperce
00050000-562a-29fe-ffe1-b7e8b372f018	8322	Stopiče
00050000-562a-29fe-7f7b-19c98b6bbbca	3206	Stranice
00050000-562a-29fe-d9b9-a0bbe2f7c3dd	8351	Straža
00050000-562a-29fe-00ac-bdb31b60c736	1313	Struge
00050000-562a-29fe-13a2-be744a4bc246	8293	Studenec
00050000-562a-29fe-9426-f242b0ebca57	8331	Suhor
00050000-562a-29fe-06b6-8016dc2254c4	2233	Sv. Ana v Slovenskih goricah
00050000-562a-29fe-ef1b-66f97898c6cc	2235	Sv. Trojica v Slovenskih goricah
00050000-562a-29fe-593b-76bb88f3066b	2353	Sveti Duh na Ostrem Vrhu
00050000-562a-29fe-11b9-5c445056a00a	9244	Sveti Jurij ob Ščavnici
00050000-562a-29fe-9004-3e8d4688163d	3264	Sveti Štefan
00050000-562a-29fe-1e93-7464d995c2d1	2258	Sveti Tomaž
00050000-562a-29fe-4a75-31755fed4dff	9204	Šalovci
00050000-562a-29fe-b232-4634392824b5	5261	Šempas
00050000-562a-29fe-e4f3-ee45fe8d3d14	5290	Šempeter pri Gorici
00050000-562a-29fe-f61d-ae155de07e50	3311	Šempeter v Savinjski dolini
00050000-562a-29fe-85f5-df84f9a2448b	4208	Šenčur
00050000-562a-29fe-f437-10ece94b051e	2212	Šentilj v Slovenskih goricah
00050000-562a-29fe-4798-80548a7a8392	8297	Šentjanž
00050000-562a-29fe-1f43-22518e45fe9c	2373	Šentjanž pri Dravogradu
00050000-562a-29fe-b6e8-f6780bb97c8d	8310	Šentjernej
00050000-562a-29fe-f85b-52905018e68e	3230	Šentjur
00050000-562a-29fe-1aba-68d4f891d8d1	3271	Šentrupert
00050000-562a-29fe-565e-28a33b16f347	8232	Šentrupert
00050000-562a-29fe-0d1d-ce30152a85ad	1296	Šentvid pri Stični
00050000-562a-29fe-1a3a-94fdb7805b58	8275	Škocjan
00050000-562a-29fe-0ca8-45f904232537	6281	Škofije
00050000-562a-29fe-f7c9-643ed94fd595	4220	Škofja Loka
00050000-562a-29fe-7d6e-f72576720cd5	3211	Škofja vas
00050000-562a-29fe-ff84-702c81b753b4	1291	Škofljica
00050000-562a-29fe-4254-8693ec6c6a2d	6274	Šmarje
00050000-562a-29fe-6185-7eac4e710450	1293	Šmarje - Sap
00050000-562a-29fe-ddcc-14e3dd663613	3240	Šmarje pri Jelšah
00050000-562a-29fe-9c37-6984adcdc199	8220	Šmarješke Toplice
00050000-562a-29fe-c613-6b7bf9f47d1b	2315	Šmartno na Pohorju
00050000-562a-29fe-3760-dfcafba0bb59	3341	Šmartno ob Dreti
00050000-562a-29fe-c717-6d37ca5d552b	3327	Šmartno ob Paki
00050000-562a-29fe-e3e9-acc5353bcfd5	1275	Šmartno pri Litiji
00050000-562a-29fe-39fb-64a8579cd2ff	2383	Šmartno pri Slovenj Gradcu
00050000-562a-29fe-da2a-363e30f85364	3201	Šmartno v Rožni dolini
00050000-562a-29fe-ee08-d0c08aaa47e3	3325	Šoštanj
00050000-562a-29fe-5900-70c33f81b36a	6222	Štanjel
00050000-562a-29fe-31c4-0aa9f10bcd5b	3220	Štore
00050000-562a-29fe-cf63-1fea148b0c2b	3304	Tabor
00050000-562a-29fe-fc25-9608a00cd426	3221	Teharje
00050000-562a-29fe-c379-a87610ed88fe	9251	Tišina
00050000-562a-29fe-05cc-eae3bc9a0001	5220	Tolmin
00050000-562a-29fe-1186-cbeaf88b176f	3326	Topolšica
00050000-562a-29fe-2e31-5d223cb9f1a9	2371	Trbonje
00050000-562a-29fe-4fc0-59fc1dffcb0d	1420	Trbovlje
00050000-562a-29fe-4b38-7a9d3dd97066	8231	Trebelno 
00050000-562a-29fe-63ae-336127d03679	8210	Trebnje
00050000-562a-29fe-6e2b-88a02ffa3b49	5252	Trnovo pri Gorici
00050000-562a-29fe-b73b-61f7434fbe38	2254	Trnovska vas
00050000-562a-29fe-f268-43531e3c263b	1222	Trojane
00050000-562a-29fe-4787-fe20d64f2033	1236	Trzin
00050000-562a-29fe-489b-8e70223ec783	4290	Tržič
00050000-562a-29fe-0306-d7eac3b649a1	8295	Tržišče
00050000-562a-29fe-a55c-8c062b2b9bcb	1311	Turjak
00050000-562a-29fe-b61d-ec3a0b587191	9224	Turnišče
00050000-562a-29fe-baed-fafa58b29bef	8323	Uršna sela
00050000-562a-29fe-68b7-30229ffd79e4	1252	Vače
00050000-562a-29fe-76d0-b070dacbb748	3320	Velenje 
00050000-562a-29fe-0f34-a1ebcb3fce3d	3322	Velenje - poštni predali
00050000-562a-29fe-2d8f-e3954ccfb991	8212	Velika Loka
00050000-562a-29fe-42d0-a9f6f292a0ee	2274	Velika Nedelja
00050000-562a-29fe-5e20-8324cd551198	9225	Velika Polana
00050000-562a-29fe-411a-b91b30f58207	1315	Velike Lašče
00050000-562a-29fe-425c-185a04a4717b	8213	Veliki Gaber
00050000-562a-29fe-3a57-d9b71bea3f82	9241	Veržej
00050000-562a-29fe-195f-66f2b7f315fa	1312	Videm - Dobrepolje
00050000-562a-29fe-e141-a2d42127c44a	2284	Videm pri Ptuju
00050000-562a-29fe-30a2-5b0a6c07863a	8344	Vinica
00050000-562a-29fe-6c42-3914a1878847	5271	Vipava
00050000-562a-29fe-a2c8-68a210a7447b	4212	Visoko
00050000-562a-29fe-62e6-d5b5477e98ab	1294	Višnja Gora
00050000-562a-29fe-747b-be5a39c53d5d	3205	Vitanje
00050000-562a-29fe-b5de-67900d1ace8b	2255	Vitomarci
00050000-562a-29fe-f9bd-4b6d60adb4fe	1217	Vodice
00050000-562a-29fe-dee4-257186e3a713	3212	Vojnik\t
00050000-562a-29fe-c8dd-2d6d67599d81	5293	Volčja Draga
00050000-562a-29fe-40c0-1f4669d9c923	2232	Voličina
00050000-562a-29fe-cad4-207643ff1b10	3305	Vransko
00050000-562a-29fe-e37e-2e1489f46b52	6217	Vremski Britof
00050000-562a-29fe-8d83-0a3569d57e9e	1360	Vrhnika
00050000-562a-29fe-19b5-fafd2aaa9e55	2365	Vuhred
00050000-562a-29fe-45ca-9a4b471167d0	2367	Vuzenica
00050000-562a-29fe-c2e3-5c518c798019	8292	Zabukovje 
00050000-562a-29fe-273d-be67a50846e8	1410	Zagorje ob Savi
00050000-562a-29fe-ff7c-53b757a9265e	1303	Zagradec
00050000-562a-29fe-f41f-c287d47f9c7e	2283	Zavrč
00050000-562a-29fe-6afe-80fdb673dd14	8272	Zdole 
00050000-562a-29fe-7297-57bb8a2b7531	4201	Zgornja Besnica
00050000-562a-29fe-f8f8-fd23fedd3015	2242	Zgornja Korena
00050000-562a-29fe-0a2a-26000f3050b5	2201	Zgornja Kungota
00050000-562a-29fe-b022-8b8562d51511	2316	Zgornja Ložnica
00050000-562a-29fe-fce6-bcb8c0576b31	2314	Zgornja Polskava
00050000-562a-29fe-7e06-ed94c10d69c2	2213	Zgornja Velka
00050000-562a-29fe-f920-d8fda52908f1	4247	Zgornje Gorje
00050000-562a-29fe-6b1d-8d8044933407	4206	Zgornje Jezersko
00050000-562a-29fe-09ca-edd946afd885	2285	Zgornji Leskovec
00050000-562a-29fe-dd1a-3cb9b5c39315	1432	Zidani Most
00050000-562a-29fe-f81c-519bd3c3d931	3214	Zreče
00050000-562a-29fe-9b99-04c30359b73b	4209	Žabnica
00050000-562a-29fe-2ce6-d93b79e15b70	3310	Žalec
00050000-562a-29fe-b081-15f3ab1c677b	4228	Železniki
00050000-562a-29fe-817d-29251d00a37e	2287	Žetale
00050000-562a-29fe-9dda-d8aff2df96d0	4226	Žiri
00050000-562a-29fe-e59c-f66b3a455fc6	4274	Žirovnica
00050000-562a-29fe-7092-1efc6ae92cf6	8360	Žužemberk
\.


--
-- TOC entry 3114 (class 0 OID 23263311)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23262903)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 23262657)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-562a-2a00-da78-a75572163779	00080000-562a-2a00-f68a-c3c5b61d995f	\N	00040000-562a-29fe-0a4a-44d74fa7d754	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-562a-2a00-9a9b-1f49747fe533	00080000-562a-2a00-f68a-c3c5b61d995f	\N	00040000-562a-29fe-0a4a-44d74fa7d754	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-562a-2a00-4f10-98922027b70a	00080000-562a-2a00-f493-f56e8178a5b7	\N	00040000-562a-29fe-0a4a-44d74fa7d754	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3077 (class 0 OID 23262801)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-562a-29fe-db77-49d4a9ca7c4f	novo leto	1	1	\N	t
00430000-562a-29fe-5490-9f1496657e4b	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-562a-29fe-e80f-cb1b123f94be	dan upora proti okupatorju	27	4	\N	t
00430000-562a-29fe-b17c-b701686526a1	praznik dela	1	5	\N	t
00430000-562a-29fe-f2ca-097a74299338	praznik dela	2	5	\N	t
00430000-562a-29fe-0600-9723086f0060	dan Primoža Trubarja	8	6	\N	f
00430000-562a-29fe-347e-de33d1e88f17	dan državnosti	25	6	\N	t
00430000-562a-29fe-1de2-510bc0eb0d66	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-562a-29fe-6e9e-a835af13960f	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-562a-29fe-8521-df1c81fdac4e	dan suverenosti	25	10	\N	f
00430000-562a-29fe-0796-cc206f5cc7d8	dan spomina na mrtve	1	11	\N	t
00430000-562a-29fe-4a2e-a8b04550d15c	dan Rudolfa Maistra	23	11	\N	f
00430000-562a-29fe-d505-5541d0db03ad	božič	25	12	\N	t
00430000-562a-29fe-3a70-29d16f5bdbf3	dan samostojnosti in enotnosti	26	12	\N	t
00430000-562a-29fe-e7f7-7ab81af4359f	Marijino vnebovzetje	15	8	\N	t
00430000-562a-29fe-f7b7-5a1d00b80cf1	dan reformacije	31	10	\N	t
00430000-562a-29fe-1140-d48074ec9175	velikonočna nedelja	27	3	2016	t
00430000-562a-29fe-0030-962220e7d1f7	velikonočna nedelja	16	4	2017	t
00430000-562a-29fe-0566-2644752f6e95	velikonočna nedelja	1	4	2018	t
00430000-562a-29fe-3d57-114262c49616	velikonočna nedelja	21	4	2019	t
00430000-562a-29fe-b63d-94610cc96f45	velikonočna nedelja	12	4	2020	t
00430000-562a-29fe-dea6-a5f2e777a285	velikonočna nedelja	4	4	2021	t
00430000-562a-29fe-eabe-2886bea36a9a	velikonočna nedelja	17	4	2022	t
00430000-562a-29fe-5470-e2fa4bd8338e	velikonočna nedelja	9	4	2023	t
00430000-562a-29fe-490c-f02e680f1c08	velikonočna nedelja	31	3	2024	t
00430000-562a-29fe-7c9a-a3b16b649078	velikonočna nedelja	20	4	2025	t
00430000-562a-29fe-9890-e4383af4e185	velikonočna nedelja	5	4	2026	t
00430000-562a-29fe-b772-f355d290159c	velikonočna nedelja	28	3	2027	t
00430000-562a-29fe-e2fe-1f199f4ff04f	velikonočna nedelja	16	4	2028	t
00430000-562a-29fe-d4b8-639dcc53516f	velikonočna nedelja	1	4	2029	t
00430000-562a-29fe-d91f-300b5286150e	velikonočna nedelja	21	4	2030	t
00430000-562a-29fe-b278-e9eec6939201	velikonočni ponedeljek	28	3	2016	t
00430000-562a-29fe-4857-31c6d7bd745a	velikonočni ponedeljek	17	4	2017	t
00430000-562a-29fe-3570-a92d49ba2177	velikonočni ponedeljek	2	4	2018	t
00430000-562a-29fe-5155-921eb180c02f	velikonočni ponedeljek	22	4	2019	t
00430000-562a-29fe-8513-dd54f7eb1cf6	velikonočni ponedeljek	13	4	2020	t
00430000-562a-29fe-81e8-42091446ac37	velikonočni ponedeljek	5	4	2021	t
00430000-562a-29fe-bc88-81df5f71d4ce	velikonočni ponedeljek	18	4	2022	t
00430000-562a-29fe-2886-b2a074420340	velikonočni ponedeljek	10	4	2023	t
00430000-562a-29fe-9deb-ee0bd429d003	velikonočni ponedeljek	1	4	2024	t
00430000-562a-29fe-6ec5-b9a1753e59ce	velikonočni ponedeljek	21	4	2025	t
00430000-562a-29fe-8919-1819a0c0dc26	velikonočni ponedeljek	6	4	2026	t
00430000-562a-29fe-7861-24375794c34a	velikonočni ponedeljek	29	3	2027	t
00430000-562a-29fe-f1e1-5e177b272a6f	velikonočni ponedeljek	17	4	2028	t
00430000-562a-29fe-fbf9-fea093104dcd	velikonočni ponedeljek	2	4	2029	t
00430000-562a-29fe-1caa-4626d84d35e5	velikonočni ponedeljek	22	4	2030	t
00430000-562a-29fe-8ba8-a9c708d0298a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-562a-29fe-6906-b427d115a423	binkoštna nedelja - binkošti	4	6	2017	t
00430000-562a-29fe-ed3d-dbcbe415f6fb	binkoštna nedelja - binkošti	20	5	2018	t
00430000-562a-29fe-722a-274e38970461	binkoštna nedelja - binkošti	9	6	2019	t
00430000-562a-29fe-d44c-9a32eb847c99	binkoštna nedelja - binkošti	31	5	2020	t
00430000-562a-29fe-debb-5102fc37f680	binkoštna nedelja - binkošti	23	5	2021	t
00430000-562a-29fe-2e59-e8e7e7d97646	binkoštna nedelja - binkošti	5	6	2022	t
00430000-562a-29fe-863e-1ea3ec50d436	binkoštna nedelja - binkošti	28	5	2023	t
00430000-562a-29fe-69cd-44d66dd4af7c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-562a-29fe-0727-af190f3ece27	binkoštna nedelja - binkošti	8	6	2025	t
00430000-562a-29fe-a3d8-266381a048f2	binkoštna nedelja - binkošti	24	5	2026	t
00430000-562a-29fe-0a42-11e91ef64624	binkoštna nedelja - binkošti	16	5	2027	t
00430000-562a-29fe-9cfe-bce55846e016	binkoštna nedelja - binkošti	4	6	2028	t
00430000-562a-29fe-a391-641d9de3a2d2	binkoštna nedelja - binkošti	20	5	2029	t
00430000-562a-29fe-1367-e3f5249e3fb7	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3073 (class 0 OID 23262761)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23262773)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23262915)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23263325)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23263335)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-562a-2a00-cea6-05d4910fd97b	00080000-562a-2a00-2793-6ce1fd6496aa	0987	AK
00190000-562a-2a00-1472-d5fd2a18e4cf	00080000-562a-2a00-f493-f56e8178a5b7	0989	AK
00190000-562a-2a00-7835-33252dc3e0c8	00080000-562a-2a00-ab71-8d79a24522de	0986	AK
00190000-562a-2a00-ffc1-4ef005b2e3ea	00080000-562a-2a00-ac83-586ca16dedf3	0984	AK
00190000-562a-2a00-5f78-f5574f6ef459	00080000-562a-2a00-1c51-d2523b0023f4	0983	AK
00190000-562a-2a00-0ffe-a4ca27686dd3	00080000-562a-2a00-7f16-7a680179bd54	0982	AK
00190000-562a-2a02-446f-67bcafb4ffc4	00080000-562a-2a02-9fec-3ad1cd1903f6	1001	AK
\.


--
-- TOC entry 3113 (class 0 OID 23263250)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-562a-2a00-1167-5f1c780e4413	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3117 (class 0 OID 23263343)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 23262944)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-562a-2a00-1ecc-12915453c542	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-562a-2a00-a4fd-ca5cd70da2a1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-562a-2a00-bbca-9997040327ec	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-562a-2a00-0f54-14654a3f3fad	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-562a-2a00-6a79-b6c5d501c95f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-562a-2a00-8d07-266c4138113a	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-562a-2a00-6656-2d368c77858c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3085 (class 0 OID 23262888)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23262878)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23263089)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23263019)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23262735)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 23262506)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-562a-2a02-9fec-3ad1cd1903f6	00010000-562a-29ff-3fc0-498cb0bd553b	2015-10-23 14:37:22	INS	a:0:{}
2	App\\Entity\\Option	00000000-562a-2a02-fb2d-dd61f2d0e512	00010000-562a-29ff-3fc0-498cb0bd553b	2015-10-23 14:37:22	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-562a-2a02-446f-67bcafb4ffc4	00010000-562a-29ff-3fc0-498cb0bd553b	2015-10-23 14:37:22	INS	a:0:{}
\.


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3094 (class 0 OID 23262957)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 23262544)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-562a-29fe-0c40-be5a0e686c36	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-562a-29fe-ef5d-2add926e4b06	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-562a-29fe-b811-5798da4fc6f8	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-562a-29fe-a7d9-0b26eb6f9f8b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-562a-29fe-6604-e3ddd216bc6f	planer	Planer dogodkov v koledarju	t
00020000-562a-29fe-5bdc-687b2e8911c3	kadrovska	Kadrovska služba	t
00020000-562a-29ff-2402-21f1a6decf1e	arhivar	Ažuriranje arhivalij	t
00020000-562a-29ff-0452-4fd87dd4bb29	igralec	Igralec	t
00020000-562a-29ff-72bb-fe5d469dabaf	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-562a-2a00-ce94-7c155c235cdc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3054 (class 0 OID 23262528)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-562a-29ff-1fd1-144983947da5	00020000-562a-29fe-b811-5798da4fc6f8
00010000-562a-29ff-3fc0-498cb0bd553b	00020000-562a-29fe-b811-5798da4fc6f8
00010000-562a-2a00-dbdc-5f319a699389	00020000-562a-2a00-ce94-7c155c235cdc
\.


--
-- TOC entry 3096 (class 0 OID 23262971)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23262909)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 23262855)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-562a-2a00-1087-66f809325406	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-562a-2a00-9ecc-a4dac3153d2c	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-562a-2a00-15de-85b548a0d140	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3050 (class 0 OID 23262493)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-562a-29fe-d16c-3e3bc0128445	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-562a-29fe-27ca-5d0a6a9cc522	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-562a-29fe-7bbf-0a2724ab301f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-562a-29fe-3866-b2c42fcd909d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-562a-29fe-4e21-6e8a236d8f91	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3049 (class 0 OID 23262485)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-562a-29fe-804c-454538ccfa68	00230000-562a-29fe-3866-b2c42fcd909d	popa
00240000-562a-29fe-2934-b386e199cb24	00230000-562a-29fe-3866-b2c42fcd909d	oseba
00240000-562a-29fe-9f67-71cc182a7454	00230000-562a-29fe-3866-b2c42fcd909d	tippopa
00240000-562a-29fe-f29e-4526cfeb1e42	00230000-562a-29fe-3866-b2c42fcd909d	organizacijskaenota
00240000-562a-29fe-26f9-7c942315c42d	00230000-562a-29fe-3866-b2c42fcd909d	sezona
00240000-562a-29fe-4b61-37a1200e2a88	00230000-562a-29fe-3866-b2c42fcd909d	tipvaje
00240000-562a-29fe-f96d-c7974831e801	00230000-562a-29fe-27ca-5d0a6a9cc522	prostor
00240000-562a-29fe-987c-0767e27ddda0	00230000-562a-29fe-3866-b2c42fcd909d	besedilo
00240000-562a-29fe-0787-50c7386a60e5	00230000-562a-29fe-3866-b2c42fcd909d	uprizoritev
00240000-562a-29fe-6a17-1d1ba9d1d823	00230000-562a-29fe-3866-b2c42fcd909d	funkcija
00240000-562a-29fe-a777-0b2dd17a4c4a	00230000-562a-29fe-3866-b2c42fcd909d	tipfunkcije
00240000-562a-29fe-331b-04a5e0b27a1d	00230000-562a-29fe-3866-b2c42fcd909d	alternacija
00240000-562a-29fe-1c79-2f7fb9d91106	00230000-562a-29fe-d16c-3e3bc0128445	pogodba
00240000-562a-29fe-723d-79708bd9de17	00230000-562a-29fe-3866-b2c42fcd909d	zaposlitev
00240000-562a-29fe-56aa-3e02d04503ca	00230000-562a-29fe-3866-b2c42fcd909d	zvrstuprizoritve
00240000-562a-29fe-957f-47864aefa2d8	00230000-562a-29fe-d16c-3e3bc0128445	programdela
00240000-562a-29fe-4764-6f10718d941f	00230000-562a-29fe-3866-b2c42fcd909d	zapis
\.


--
-- TOC entry 3048 (class 0 OID 23262480)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
c38f5645-7eca-40e8-a456-e88d35a26c45	00240000-562a-29fe-804c-454538ccfa68	0	1001
\.


--
-- TOC entry 3102 (class 0 OID 23263036)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-562a-2a00-7fbb-4b99c6c25583	000e0000-562a-2a00-90df-31f8f9a37fce	00080000-562a-2a00-f68a-c3c5b61d995f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-562a-29fe-c272-17b880752bdc
00270000-562a-2a00-6e92-9b254ea82ecc	000e0000-562a-2a00-90df-31f8f9a37fce	00080000-562a-2a00-f68a-c3c5b61d995f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-562a-29fe-c272-17b880752bdc
\.


--
-- TOC entry 3062 (class 0 OID 23262619)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 23262865)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-562a-2a00-d734-0c1b1c908220	00180000-562a-2a00-c8b5-fe619b514343	000c0000-562a-2a00-59a3-6d37a831ffeb	00090000-562a-2a00-2e9b-f17d3e5f1e60	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-2a00-7af7-9a55a2260f8a	00180000-562a-2a00-c8b5-fe619b514343	000c0000-562a-2a00-02aa-5c0c31927ae5	00090000-562a-2a00-272b-dd8cd8af6a32	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-2a00-9ede-65393fdc4a5b	00180000-562a-2a00-c8b5-fe619b514343	000c0000-562a-2a00-f6a3-cd6c077cbd07	00090000-562a-2a00-1ac5-d2eee130b8f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-2a00-71d9-dad27e839efe	00180000-562a-2a00-c8b5-fe619b514343	000c0000-562a-2a00-63f8-565e741cd5a9	00090000-562a-2a00-08a6-7316cbe35086	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-2a00-e1d2-65113c39b1e4	00180000-562a-2a00-c8b5-fe619b514343	000c0000-562a-2a00-63c3-daa2db9927cc	00090000-562a-2a00-6c3d-3ee9f248d5ca	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-2a00-1699-8a65f586676f	00180000-562a-2a00-f7a9-c1f165b21435	\N	00090000-562a-2a00-6c3d-3ee9f248d5ca	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-562a-2a00-55d4-331dd055f11c	00180000-562a-2a00-f7a9-c1f165b21435	\N	00090000-562a-2a00-272b-dd8cd8af6a32	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3105 (class 0 OID 23263077)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-562a-29fe-c71a-7ff1def16223	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-562a-29fe-cf88-b82cd753b47c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-562a-29fe-5db6-cb1cc856c39e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-562a-29fe-d691-b7a61fed29a2	04	Režija	Režija	Režija	umetnik	30
000f0000-562a-29fe-fb4a-79e4d4b1e10f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-562a-29fe-ecc9-d53a89c49f03	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-562a-29fe-2a8e-51ce004de110	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-562a-29fe-cba7-cb7f28d52831	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-562a-29fe-e57e-6940e3be860f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-562a-29fe-0251-719fe27f8914	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-562a-29fe-db4e-1a560af55083	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-562a-29fe-98ea-3bbc8b210129	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-562a-29fe-3665-0503659d271b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-562a-29fe-d747-29cdd598561c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-562a-29fe-3cb4-d7f378a10fc7	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-562a-29fe-0a40-d4648449d7db	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-562a-29fe-cff9-9905f7dd4f43	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-562a-29fe-ee0e-f322e8a48df7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3059 (class 0 OID 23262570)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-562a-2a00-59e3-20d275ac4a22	0001	šola	osnovna ali srednja šola
00400000-562a-2a00-7bf2-a77c5e6f0fe8	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-562a-2a00-b74b-d61a2d4ffdc0	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3118 (class 0 OID 23263354)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-562a-29fe-4c0e-fe2daff09607	01	Velika predstava	f	1.00	1.00
002b0000-562a-29fe-ee22-c7b45619e71e	02	Mala predstava	f	0.50	0.50
002b0000-562a-29fe-703e-ae1f5bd8738f	03	Mala koprodukcija	t	0.40	1.00
002b0000-562a-29fe-70c0-e5a15a2d836a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-562a-29fe-9b57-3e254e8813d1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3081 (class 0 OID 23262845)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-562a-29fe-3d13-066891adbc94	0001	prva vaja	prva vaja
00420000-562a-29fe-d27f-772309d5c1ac	0002	tehnična vaja	tehnična vaja
00420000-562a-29fe-cb3d-ce9dbcfc0193	0003	lučna vaja	lučna vaja
00420000-562a-29fe-afa1-d4e6cc563507	0004	kostumska vaja	kostumska vaja
00420000-562a-29fe-624d-ba062888053b	0005	foto vaja	foto vaja
00420000-562a-29fe-12e6-6c31d453d9bc	0006	1. glavna vaja	1. glavna vaja
00420000-562a-29fe-cfe4-4dd7247b3a86	0007	2. glavna vaja	2. glavna vaja
00420000-562a-29fe-4a95-fc42cdad0531	0008	1. generalka	1. generalka
00420000-562a-29fe-d6ab-3dfc5a8d5eb0	0009	2. generalka	2. generalka
00420000-562a-29fe-423e-6c3e4d5177ed	0010	odprta generalka	odprta generalka
00420000-562a-29fe-078d-2ab77119567a	0011	obnovitvena vaja	obnovitvena vaja
00420000-562a-29fe-e050-836404c02af9	0012	pevska vaja	pevska vaja
00420000-562a-29fe-468a-ebdc1eb144ba	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-562a-29fe-66f5-fe937737fda3	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3068 (class 0 OID 23262692)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23262515)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-562a-29ff-3fc0-498cb0bd553b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROGP6wsZaC7WEaQCyLd7tnf1ccSWLHMsu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-562a-2a00-b3b5-936b159475b8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-562a-2a00-59f1-a481147edbad	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-562a-2a00-b939-813c1ec35855	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-562a-2a00-aab9-75531815f6e0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-562a-2a00-4569-13db7b5376b8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-562a-2a00-3517-3618d7c8d4b9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-562a-2a00-4c97-a7d8e1c5559b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-562a-2a00-f1af-00c93e5b4f6b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-562a-2a00-e4fa-2e4789e9db54	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-562a-2a00-dbdc-5f319a699389	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-562a-29ff-1fd1-144983947da5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3109 (class 0 OID 23263127)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-562a-2a00-c9fe-76185fb9f606	00160000-562a-2a00-ce3b-0c4da3383484	\N	00140000-562a-29fe-0b5b-59b606a93e79	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-562a-2a00-6a79-b6c5d501c95f
000e0000-562a-2a00-90df-31f8f9a37fce	00160000-562a-2a00-764e-b1e29363bc0b	\N	00140000-562a-29fe-2875-a789967f8587	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-562a-2a00-8d07-266c4138113a
000e0000-562a-2a00-457a-51e6e551120a	\N	\N	00140000-562a-29fe-2875-a789967f8587	00190000-562a-2a00-cea6-05d4910fd97b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562a-2a00-6a79-b6c5d501c95f
000e0000-562a-2a00-9c26-54ebb30ffe90	\N	\N	00140000-562a-29fe-2875-a789967f8587	00190000-562a-2a00-cea6-05d4910fd97b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562a-2a00-6a79-b6c5d501c95f
000e0000-562a-2a00-07fe-f2749c2003ca	\N	\N	00140000-562a-29fe-2875-a789967f8587	00190000-562a-2a00-cea6-05d4910fd97b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-562a-2a00-1ecc-12915453c542
000e0000-562a-2a00-0f30-89a153446ee6	\N	\N	00140000-562a-29fe-2875-a789967f8587	00190000-562a-2a00-cea6-05d4910fd97b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-562a-2a00-1ecc-12915453c542
\.


--
-- TOC entry 3076 (class 0 OID 23262791)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-562a-2a00-f01d-1b9f8825e736	\N	000e0000-562a-2a00-90df-31f8f9a37fce	1	
00200000-562a-2a00-31cc-42d6ea21b7f0	\N	000e0000-562a-2a00-90df-31f8f9a37fce	2	
00200000-562a-2a00-8131-1692a2e4fe40	\N	000e0000-562a-2a00-90df-31f8f9a37fce	3	
00200000-562a-2a00-3f69-6012bacced4e	\N	000e0000-562a-2a00-90df-31f8f9a37fce	4	
00200000-562a-2a00-a66d-ab38f37e4c1b	\N	000e0000-562a-2a00-90df-31f8f9a37fce	5	
\.


--
-- TOC entry 3092 (class 0 OID 23262936)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23263050)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-562a-29fe-9ee6-f8951f29acbe	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-562a-29fe-4d83-5591569d7544	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-562a-29fe-5595-8f27e04bd383	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-562a-29fe-3ee3-e4923f3e11f7	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-562a-29fe-33f0-116f404590f7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-562a-29fe-0fc6-664d9e8734df	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-562a-29fe-e6c4-abf533deda0d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-562a-29fe-1a3a-04255754a6fe	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-562a-29fe-c272-17b880752bdc	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-562a-29fe-ac49-9fac66bf5f54	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-562a-29fe-357b-f503c8497224	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-562a-29fe-2722-8b36ae3bec57	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-562a-29fe-301d-bf2b865de6fb	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-562a-29fe-2c06-f20ca75c07f6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-562a-29fe-6ddd-c0efa307b0b5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-562a-29fe-f3d4-1f4baa134d11	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-562a-29fe-aa2f-58b740854399	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-562a-29fe-4fc6-26eb43d4c6f3	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-562a-29fe-1e8c-10f29ee58769	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-562a-29fe-0816-0d76c35bb916	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-562a-29fe-2296-835233a25be4	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-562a-29fe-6815-a750d002066b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-562a-29fe-6a55-f2fd6685ee47	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-562a-29fe-b1a0-1d7671854ae3	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-562a-29fe-e145-8b30ad0238a9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-562a-29fe-d608-748190434c65	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-562a-29fe-001e-ce9a3de15879	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-562a-29fe-45dc-7b15e05f1848	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3121 (class 0 OID 23263401)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23263373)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23263413)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 23263008)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-562a-2a00-ac7d-70d47ce7d34b	00090000-562a-2a00-272b-dd8cd8af6a32	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-2a00-80a4-e9256d30b600	00090000-562a-2a00-1ac5-d2eee130b8f0	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-2a00-1f1e-c0b2ce82ba91	00090000-562a-2a00-f222-ca86de3e3588	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-2a00-315a-c2fe8157076e	00090000-562a-2a00-674f-4da7e06d0df9	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-2a00-4ced-41251aa671e1	00090000-562a-2a00-b4d1-3be58ab8cede	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-2a00-aa08-9601bc1ddd33	00090000-562a-2a00-7198-4eb82d8f94f1	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3079 (class 0 OID 23262834)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23263117)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-562a-29fe-0b5b-59b606a93e79	01	Drama	drama (SURS 01)
00140000-562a-29fe-8001-2894cdbcb0aa	02	Opera	opera (SURS 02)
00140000-562a-29fe-20ea-52f0be708d93	03	Balet	balet (SURS 03)
00140000-562a-29fe-a4ea-caaa8ebce16e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-562a-29fe-9895-fa19bed871a6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-562a-29fe-2875-a789967f8587	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-562a-29fe-6365-c9e97ce704fd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3098 (class 0 OID 23262998)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2548 (class 2606 OID 23262569)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23263176)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 23263166)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23263033)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23263075)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23263453)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 23262823)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 23262844)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 23263371)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 23262718)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 23263244)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23262994)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 23262789)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23262756)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23262732)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 23262901)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 23263430)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 23263437)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2826 (class 2606 OID 23263461)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23262928)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23262690)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23262588)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23262652)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23262615)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 23262558)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 23262543)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23262934)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 23262970)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 23263112)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 23262643)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23262678)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 23263323)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23262907)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23262668)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 23262808)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 23262777)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2615 (class 2606 OID 23262769)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23262919)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 23263332)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23263340)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23263310)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 23263352)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 23262952)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23262892)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23262883)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 23263099)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 23263026)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23262744)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23262514)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 23262961)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23262532)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2541 (class 2606 OID 23262552)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 23262979)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23262914)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23262863)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23262502)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23262490)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23262484)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 23263046)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23262624)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23262874)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 23263086)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 23262577)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23263364)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 23262852)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 23262703)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 23262527)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 23263145)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 23262798)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23262942)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 23263058)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23263411)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23263395)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23263419)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 23263016)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 23262838)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 23263125)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23263006)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 1259 OID 23262832)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2632 (class 1259 OID 23262833)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2633 (class 1259 OID 23262831)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2634 (class 1259 OID 23262830)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2635 (class 1259 OID 23262829)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2726 (class 1259 OID 23263047)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2727 (class 1259 OID 23263048)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 23263049)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2812 (class 1259 OID 23263432)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2813 (class 1259 OID 23263431)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2566 (class 1259 OID 23262645)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2567 (class 1259 OID 23262646)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2684 (class 1259 OID 23262935)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2799 (class 1259 OID 23263399)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2800 (class 1259 OID 23263398)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2801 (class 1259 OID 23263400)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2802 (class 1259 OID 23263397)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2803 (class 1259 OID 23263396)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2678 (class 1259 OID 23262921)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 23262920)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2623 (class 1259 OID 23262799)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2624 (class 1259 OID 23262800)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 23262995)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2709 (class 1259 OID 23262997)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2710 (class 1259 OID 23262996)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2598 (class 1259 OID 23262734)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 23262733)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 23263353)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2742 (class 1259 OID 23263114)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2743 (class 1259 OID 23263115)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23263116)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2809 (class 1259 OID 23263420)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2751 (class 1259 OID 23263150)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2752 (class 1259 OID 23263147)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2753 (class 1259 OID 23263151)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2754 (class 1259 OID 23263149)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2755 (class 1259 OID 23263148)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2588 (class 1259 OID 23262705)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 23262704)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 23262618)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2696 (class 1259 OID 23262962)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2543 (class 1259 OID 23262559)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 23262560)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 23262982)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 23262981)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 23262980)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2571 (class 1259 OID 23262655)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2572 (class 1259 OID 23262654)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2573 (class 1259 OID 23262656)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2611 (class 1259 OID 23262772)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2612 (class 1259 OID 23262770)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 23262771)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2523 (class 1259 OID 23262492)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2658 (class 1259 OID 23262887)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2659 (class 1259 OID 23262885)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2660 (class 1259 OID 23262884)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2661 (class 1259 OID 23262886)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 23262533)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 23262534)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2687 (class 1259 OID 23262943)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2822 (class 1259 OID 23263454)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2724 (class 1259 OID 23263035)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 23263034)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2823 (class 1259 OID 23263462)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2824 (class 1259 OID 23263463)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2673 (class 1259 OID 23262908)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2718 (class 1259 OID 23263027)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2719 (class 1259 OID 23263028)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23263249)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2773 (class 1259 OID 23263248)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2774 (class 1259 OID 23263245)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 23263246)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2776 (class 1259 OID 23263247)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2577 (class 1259 OID 23262670)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 23262669)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2579 (class 1259 OID 23262671)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23262956)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2691 (class 1259 OID 23262955)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2782 (class 1259 OID 23263333)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2783 (class 1259 OID 23263334)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2765 (class 1259 OID 23263180)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2766 (class 1259 OID 23263181)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2767 (class 1259 OID 23263178)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2768 (class 1259 OID 23263179)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2714 (class 1259 OID 23263017)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 23263018)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2664 (class 1259 OID 23262896)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2665 (class 1259 OID 23262895)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 23262893)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2667 (class 1259 OID 23262894)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2761 (class 1259 OID 23263168)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 23263167)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 23262745)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2605 (class 1259 OID 23262759)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2606 (class 1259 OID 23262758)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2607 (class 1259 OID 23262757)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2608 (class 1259 OID 23262760)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2622 (class 1259 OID 23262790)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 23262778)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2617 (class 1259 OID 23262779)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2779 (class 1259 OID 23263324)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2798 (class 1259 OID 23263372)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2816 (class 1259 OID 23263438)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2817 (class 1259 OID 23263439)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2553 (class 1259 OID 23262590)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2554 (class 1259 OID 23262589)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2562 (class 1259 OID 23262625)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2563 (class 1259 OID 23262626)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 23262839)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2653 (class 1259 OID 23262877)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 23262876)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2655 (class 1259 OID 23262875)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 23262825)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2637 (class 1259 OID 23262826)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2638 (class 1259 OID 23262824)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2639 (class 1259 OID 23262828)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2640 (class 1259 OID 23262827)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2570 (class 1259 OID 23262644)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 23262578)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 23262579)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2594 (class 1259 OID 23262719)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 23262721)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2596 (class 1259 OID 23262720)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2597 (class 1259 OID 23262722)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2672 (class 1259 OID 23262902)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 23263113)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2756 (class 1259 OID 23263146)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2738 (class 1259 OID 23263087)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 23263088)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2560 (class 1259 OID 23262616)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2561 (class 1259 OID 23262617)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2711 (class 1259 OID 23263007)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23262503)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23262691)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 23262653)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23262491)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2795 (class 1259 OID 23263365)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 23262954)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2695 (class 1259 OID 23262953)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 23262853)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 23262854)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2769 (class 1259 OID 23263177)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23262679)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 23263126)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2806 (class 1259 OID 23263412)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2788 (class 1259 OID 23263341)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2789 (class 1259 OID 23263342)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 23263076)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2652 (class 1259 OID 23262864)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 23262553)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2865 (class 2606 OID 23263634)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2864 (class 2606 OID 23263639)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2860 (class 2606 OID 23263659)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2866 (class 2606 OID 23263629)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2862 (class 2606 OID 23263649)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2861 (class 2606 OID 23263654)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2863 (class 2606 OID 23263644)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2902 (class 2606 OID 23263829)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2901 (class 2606 OID 23263834)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2900 (class 2606 OID 23263839)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 23264004)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2935 (class 2606 OID 23263999)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 23263519)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2838 (class 2606 OID 23263524)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23263744)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2929 (class 2606 OID 23263984)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 23263979)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2928 (class 2606 OID 23263989)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 23263974)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2932 (class 2606 OID 23263969)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2881 (class 2606 OID 23263739)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 23263734)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2859 (class 2606 OID 23263619)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2858 (class 2606 OID 23263624)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2893 (class 2606 OID 23263784)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2891 (class 2606 OID 23263794)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2892 (class 2606 OID 23263789)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2848 (class 2606 OID 23263574)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23263569)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 23263724)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 23263959)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2905 (class 2606 OID 23263844)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 23263849)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 23263854)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2933 (class 2606 OID 23263994)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2907 (class 2606 OID 23263874)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2910 (class 2606 OID 23263859)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 23263879)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2908 (class 2606 OID 23263869)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2909 (class 2606 OID 23263864)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2846 (class 2606 OID 23263564)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2847 (class 2606 OID 23263559)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 23263504)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2835 (class 2606 OID 23263499)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 23263764)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2831 (class 2606 OID 23263479)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2830 (class 2606 OID 23263484)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2888 (class 2606 OID 23263779)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2889 (class 2606 OID 23263774)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2890 (class 2606 OID 23263769)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2841 (class 2606 OID 23263534)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 23263529)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2840 (class 2606 OID 23263539)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2852 (class 2606 OID 23263599)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 23263589)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 23263594)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2827 (class 2606 OID 23263464)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 23263699)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2873 (class 2606 OID 23263689)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2874 (class 2606 OID 23263684)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2872 (class 2606 OID 23263694)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 23263469)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2828 (class 2606 OID 23263474)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 23263749)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2938 (class 2606 OID 23264019)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2898 (class 2606 OID 23263824)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 23263819)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2940 (class 2606 OID 23264024)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2939 (class 2606 OID 23264029)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2880 (class 2606 OID 23263729)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2897 (class 2606 OID 23263809)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2896 (class 2606 OID 23263814)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 23263934)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 23263929)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2921 (class 2606 OID 23263914)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2920 (class 2606 OID 23263919)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2919 (class 2606 OID 23263924)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2844 (class 2606 OID 23263549)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 23263544)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 23263554)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2885 (class 2606 OID 23263759)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2886 (class 2606 OID 23263754)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23263944)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2923 (class 2606 OID 23263949)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23263904)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 23263909)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2916 (class 2606 OID 23263894)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2915 (class 2606 OID 23263899)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 23263799)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 23263804)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 23263719)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2876 (class 2606 OID 23263714)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2878 (class 2606 OID 23263704)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2877 (class 2606 OID 23263709)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 23263889)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2912 (class 2606 OID 23263884)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2850 (class 2606 OID 23263579)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2851 (class 2606 OID 23263584)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2857 (class 2606 OID 23263614)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 23263604)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2855 (class 2606 OID 23263609)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2922 (class 2606 OID 23263939)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2925 (class 2606 OID 23263954)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23263964)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 23264009)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 23264014)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2832 (class 2606 OID 23263494)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 23263489)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2837 (class 2606 OID 23263509)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2836 (class 2606 OID 23263514)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2867 (class 2606 OID 23263664)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 23263679)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 23263674)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2870 (class 2606 OID 23263669)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-23 14:37:23 CEST

--
-- PostgreSQL database dump complete
--

